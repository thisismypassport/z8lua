# z8lua

This is a fork of Lua that implements the PICO-8 dialect and adds useful features for
emulator implementations.

### Branches

The main `zepto8` branch is a composite branch built from several feature branches. Please
try to submit patches and PRs against the corresponding feature branch instead of `zepto8`.

There are three main feature branches:

 - `pico8`: the PICO-8 syntax branch.
 - `eris`: a branch imported from the [eris persistence patch](https://github.com/fnuecke/eris)
   with bug fixes and improvements ([my pull requests have received little attention so
   far](https://github.com/fnuecke/eris/pulls)); this library provides serialisable snapshots
   of the Lua state (quite useful for emulators).
 - `oua`: allow to switch on-the-fly to zero-based indices in Lua, using the `base(0)` function
   and back with `base(1)`. I call this the **Oua** language.

## PICO-8 features

 - short `if` syntax (on one line)
 - short `print` syntax (`?` at the beginning of a line)
 - compound assignment operators: `+=` `/=` etc.
 - C style not equal operator: `!=`
 - C++ style comments with `//`
 - fixed-point arithmetic with overflows, infinity etc.
 - the PICO-8 math library (`shr`, `atan2`, `flr` etc.)
 - binary literals: `0b1001001.10010`
 - works in Windows, Linux, OS X, and many embedded systems

## API extensions

```c
LUA_API void lua_setpico8memory (lua_State *L, unsigned char const *p);
```

Provide the Lua VM with a 64-KiB address space for use with the `@`, `%` and `$` operators
(shorthands for `peek`, `peek2`, and `peek4`). Otherwise these operators will always return 0.
