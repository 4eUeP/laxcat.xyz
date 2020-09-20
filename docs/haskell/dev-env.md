Haskell Development Environment
===============================

Setting up a Haskell development environment with tools: `stack`, `nvim`, ...


## Editor setup (NeoVim)

- <https://github.com/neovim/neovim>
- <https://github.com/haskell/haskell-language-server>


## Cabal

```
cabal build
```


## Stack

```
stack build --file-watch
```

or with optimizations turned off and trun on `-Wall`, `-Werror`:

```
stack build --fast --pedantic --file-watch
```

```
stack build --exec <xxx> --fast --file-watch
```

generating haddocks:

```
stack haddock
```


## Ghcid

TODO

also see this issue: [Possible to generate haddocks via ghcid?](https://github.com/ndmitchell/ghcid/issues/189)
