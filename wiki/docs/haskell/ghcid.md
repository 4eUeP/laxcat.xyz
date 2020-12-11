ghcid
=====

<https://github.com/ndmitchell/ghcid>

```
ghcid --command "cabal v2-repl"

ghcid --command "stack ghci" --allow-eval

ghcid -c "stack ghci --main-is yourpkg:bench:yourpkg-benchmark"
```


#### `--allow-eval` allow compile comments in ghcid

```
-- $> :t your-function
```

#### Restart everything if .hsc file changes

```sh
ghcid --restart src/FFI.hsc -c "cabal repl"

# `cabal repl` reload doesn't take effort while hsc files change
ghcid --reload src/FFI.hsc -c "cabal repl"
```
