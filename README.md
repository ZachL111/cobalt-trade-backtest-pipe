# cobalt-trade-backtest-pipe

`cobalt-trade-backtest-pipe` is a Zig project in trading systems. Its focus is to design a Zig verification harness for backtest systems, covering storage recovery, log and snapshot fixtures, and failure-oriented tests.

## Use Case

The point is to make a small domain rule concrete enough that a reader can change it and immediately see what broke.

## Cobalt Trade Backtest Pipe Review Notes

`recovery` and `baseline` are the cases worth reading first. They show the optimistic and cautious ends of the fixture.

## Highlights

- `fixtures/domain_review.csv` adds cases for spread pressure and fill risk.
- `metadata/domain-review.json` records the same cases in structured form.
- `config/review-profile.json` captures the read order and the two review questions.
- `examples/cobalt-trade-backtest-walkthrough.md` walks through the case spread.
- The Zig code includes a review path for `quote width` and `spread pressure`.
- `docs/field-notes.md` explains the strongest and weakest cases.

## Code Layout

The fixture data drives the tests. The code stays thin, while `metadata/domain-review.json` and `config/review-profile.json` explain what each case is meant to protect.

The Zig code keeps the review rule close to the tests.

## Run The Check

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
```

## Regression Path

The same command runs the local verification path. The highest-scoring domain case is `recovery` at 187, which lands in `ship`. The most cautious case is `baseline` at 105, which lands in `watch`.

## Future Work

The fixture set is small enough to audit by hand. The next useful expansion is malformed input coverage, not extra surface area.
