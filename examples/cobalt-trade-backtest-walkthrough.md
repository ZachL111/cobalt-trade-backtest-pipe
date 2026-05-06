# Cobalt Trade Backtest Pipe Walkthrough

This walk-through keeps the domain vocabulary close to the data instead of burying it in prose.

| Case | Focus | Score | Lane |
| --- | --- | ---: | --- |
| baseline | spread pressure | 105 | watch |
| stress | fill risk | 150 | ship |
| edge | portfolio drift | 147 | ship |
| recovery | quote width | 187 | ship |
| stale | spread pressure | 186 | ship |

Start with `recovery` and `baseline`. They create the widest contrast in this repository's fixture set, which makes them better review anchors than the middle cases.

The useful comparison is `quote width` against `spread pressure`, not the raw score alone.
