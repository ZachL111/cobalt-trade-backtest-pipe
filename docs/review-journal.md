# Review Journal

This journal records the domain cases that matter before widening the public API.

The local checks classify each case as `ship`, `watch`, or `hold`. That gives the project a small review vocabulary that matches its trading systems focus without claiming live deployment or external usage.

## Cases

- `baseline`: `spread pressure`, score 105, lane `watch`
- `stress`: `fill risk`, score 150, lane `ship`
- `edge`: `portfolio drift`, score 147, lane `ship`
- `recovery`: `quote width`, score 187, lane `ship`
- `stale`: `spread pressure`, score 186, lane `ship`

## Note

The useful failure mode here is a wrong decision on a named case, not a vague style disagreement.
