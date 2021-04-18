# treadfix

This fixes tcx files downloaded from Strava that were uploaded with the Peloton Tread+

## Building

`stack build`

## Running

`./treadfix stravaFile.tcx`

## Development

- For rapid development, run `ghcid -r` (`stack install ghcid` if ghcid is not installed)
- `stack build` to install new dependencies if any are added
- `stack exec treadfix` to execute the project
- `stack ghci` to run the project in ghci (for example to debug specific functions)
