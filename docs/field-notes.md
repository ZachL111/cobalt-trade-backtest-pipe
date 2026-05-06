# Field Notes

`cobalt-trade-backtest-pipe` is easiest to review by starting with the fixture, not the prose.

The domain cases cover `spread pressure`, `fill risk`, `portfolio drift`, and `quote width`. They sit beside the smaller starter fixture so the project has both a compact scoring check and a domain-flavored review check.

The widest spread is between `quote width` and `spread pressure`, so those are the first two cases I would preserve during a refactor.

The local verifier covers this data so the notes stay tied to code.
