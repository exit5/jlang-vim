# jlang-vim

## What?
Vim "support" and pseudo-REPL for the J Language. Works on Linux and
macOS. Ought to be easily expanded to any other Unix-workalike, but
until then it's just those.

## Why?
I've never written a Vim plugin before. It's a learning exercise, and I
also find J to be a fascinating language. Vim already includes syntax
highlighting for J, but since my muscle memory is so used to Vim
keybindings, I thought it would be a good opportunity to write something
portable and semi-polished while making learning J even more enjoyable.

## What can it do?
Not a whole lot. It has a couple remappings for piping to
`jconsole`. This is useful for sending visually highlighted lines
directly to `jconsole` or sending the whole buffer entirely.

I also borrowed a whitespace stripper function from
[dhall-vim](https://github.com/vmchale/dhall-vim). I don't understand licenses
very well, I hope the author is okay with that.

I'd like to embed the REPL directly into a buffer at some point.
Sort of like how SLIMV works.

## How do I install this?
I would just put it in `$HOME/.vim/pack/whatever/start/jlang-vim`. You
can name the `whatever` part in that path _whatever_ you want, by the way. If you want to add it manually, put it at `$HOME/.vim/pack/whatever/opt/jlang-vim` and `packadd` it from your `.vimrc`. Consult the documentation if you're not sure what the aforementioned sentences mean.

Assuming this plugin is organized correctly, I'm sure your favorite
package manager will be able to handle it as well.

## How do I send stuff to `jconsole`?

Well first, [install
J](https://code.jsoftware.com/wiki/System/Installation).

The default mappings are as follows:

- In Normal mode, press `,,,` to send the entire buffer to `jconsole`'s `stdin`
- In Visual mode, press `,,.` to send the selection to `jconsole`'s
  `stdin`

The following settings are available. You can customize a `mapleader`
and the key of your choosing to send Normal and Visual mode code to
`jconsole`.

- `g:JconsoleLeader`: default `,,`
- `g:JconsoleAll`: default `.`
- `g:JconsoleSelection`: default `,`
- `g:JconsoleRepl`: default `r`
- `g:JconsoleBin`: default `ijconsole`

Please note in particular that this plugin looks for
`ijconsole` as the correct binary. In environments where a JDK is
installed, there is usually a `jconsole` symlinked to to the `JConsole`
management and monitoring application for Java. Even the [J
Wiki](https://code.jsoftware.com/wiki/System/Installation/Linux#The_Name_of_the_J_console_binary)
suggests this renaming/symlinking step.

Or you could point `g:JconsoleBin` to wherever you installed it. Up to
you.

## Seems like a lot of work for a couple remappings...
You got me there.

## TODO
- Add an embedded `jconsole` REPL
- Install J at the behest of the user
- Read up on the LSP spec... :^)
