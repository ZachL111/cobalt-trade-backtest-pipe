# cobalt-trade-backtest-pipe

`cobalt-trade-backtest-pipe` is a focused Zig codebase around design a Zig verification harness for backtest systems, covering storage recovery, log and snapshot fixtures, and failure-oriented tests. It is meant to be easy to inspect, run, and extend without a hosted service.

## Cobalt Trade Backtest Pipe Walkthrough

I would read the project from the outside in: command, fixture, model, then roadmap. That keeps the trading systems idea grounded in files that can be checked locally.

## Capabilities

- Includes extended examples for fills, including `surge` and `degraded`.
- Documents portfolio pressure tradeoffs in `docs/operations.md`.
- Runs locally with a single verification command and no external credentials.
- Stores project constants and verification metadata in `metadata/project.json`.
- Adds a repository audit script that checks structure before running the language verifier.

## Reason For The Project

This project keeps the domain idea close to the tests. That makes it useful as a reference implementation, a small experiment, or a starting point for a more specialized tool.

## Where Things Live

- `src`: primary implementation
- `fixtures`: compact golden scenarios
- `examples`: expanded scenario set
- `metadata`: project constants and verification metadata
- `docs`: operations and extension notes
- `scripts`: local verification and audit commands

## How It Is Put Together

The design is intentionally direct: parse or construct a signal, score it, classify it, and verify the expected branch. This makes the repository useful for studying trading systems behavior without needing a service or database unless the language project itself is SQL. The Zig version uses compile-time constants and native test blocks for fast local checks.

## Command Examples

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
```

This runs the language-level build or test path against the compact fixture set.

## Data Notes

`examples/extended_cases.csv` adds six named cases. I kept the names plain so failures are easy to read in a terminal: baseline, pressure, surge, degraded, recovery, and boundary.

## Check The Work

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/audit.ps1
```

The audit command checks repository structure and README constraints before it delegates to the verifier.

## Tradeoffs

The fixture set is deliberately small. That keeps the review surface clear, but it also means the model should not be treated as a complete domain simulator.

## Possible Extensions

- Add a comparison mode that shows how decisions change when one signal is adjusted.
- Add a loader for `examples/extended_cases.csv` and promote selected cases into the language test suite.
- Add a short report command that prints the score breakdown for a single scenario.
- Add one more trading systems fixture that focuses on a malformed or borderline input.

## Getting It Running

Install Zig and run the commands from the repository root. The project does not need credentials or a hosted service.
