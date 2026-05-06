const std = @import("std");

const Signal = struct {
    demand: i32,
    capacity: i32,
    latency: i32,
    risk: i32,
    weight: i32,
};

const threshold: i32 = 184;
const risk_penalty: i32 = 6;
const latency_penalty: i32 = 4;
const weight_bonus: i32 = 5;

fn score(signal: Signal) i32 {
    return signal.demand * 2 + signal.capacity + signal.weight * weight_bonus
        - signal.latency * latency_penalty - signal.risk * risk_penalty;
}

fn classify(signal: Signal) []const u8 {
    return if (score(signal) >= threshold) "accept" else "review";
}

test "fixture decisions" {
    const signal_case_1 = Signal{ .demand = 88, .capacity = 73, .latency = 19, .risk = 18, .weight = 5 };
    try std.testing.expectEqual(@as(i32, 90), score(signal_case_1));
    try std.testing.expect(std.mem.eql(u8, classify(signal_case_1), "review"));
    const signal_case_2 = Signal{ .demand = 91, .capacity = 77, .latency = 17, .risk = 16, .weight = 8 };
    try std.testing.expectEqual(@as(i32, 135), score(signal_case_2));
    try std.testing.expect(std.mem.eql(u8, classify(signal_case_2), "review"));
    const signal_case_3 = Signal{ .demand = 96, .capacity = 79, .latency = 10, .risk = 15, .weight = 11 };
    try std.testing.expectEqual(@as(i32, 196), score(signal_case_3));
    try std.testing.expect(std.mem.eql(u8, classify(signal_case_3), "accept"));
}

const DomainReview = struct {
    signal: i32,
    slack: i32,
    drag: i32,
    confidence: i32,
};

fn domainReviewScore(item: DomainReview) i32 {
    return item.signal * 2 + item.slack + item.confidence - item.drag * 3;
}

fn domainReviewLane(item: DomainReview) []const u8 {
    const value = domainReviewScore(item);
    if (value >= 140) return "ship";
    if (value >= 105) return "watch";
    return "hold";
}

test "domain review lane" {
    const item = DomainReview{ .signal = 40, .slack = 34, .drag = 19, .confidence = 48 };
    try std.testing.expectEqual(@as(i32, 105), domainReviewScore(item));
    try std.testing.expect(std.mem.eql(u8, domainReviewLane(item), "watch"));
}
