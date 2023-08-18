# vim-upgit

Vim plugin for [upgit](https://github.com/pluveto/upgit)

## Features

- Upload File by `Upgit` command
- Edit Configuration File by `UpgitConfig` command

## Installation

If you don't have a preferred installation method, I recommend
install [vim-plug](https://github.com/junegunn/vim-plug), and
then add following codes.

```vim
Plug 'jiz4oh/vim-upgit', { 'do': './install' }
```

## Usage

[configure upgit](https://github.com/pluveto/upgit#config) properly first, call `UpgitConfig` to open the Configuration file

1. upload a file `~/images/test.png`

    ```vim
    :Upgit ~/images/test.png
    ```

2. upload image from clipboard, e.g. snipping image by [snipaste](https://github.com/Snipaste/feedback)

    ```vim
    :UpgitClipboard
    " equivalent to
    :Upgit :clipboard
    ```

3. upload current file

    ```vim
    :Upgit
    ```

4. upload current file with other provider

    ```vim
    :Upgit % --provider OTHERS
    ```

the result is stored in `+` register after each upload, and you can also call `upgit#results()` to get them, the `upgit#last()` is the helper to access last uploaded result

## Configuration

The available options with their default values are:

```vim
let g:upgit_bin_path   = 'CURRENT_PLUGIN_DIRECTORY/upgit'  " upgit binary file
let g:upgit_opts       = ''                                " extra options for upgit, you can set b:upgit_opts for each buffer
let g:upgit_no_default = 0                                 " if you want more control, set it to 1
```

## Advanced Usage

you can set the command to upload current buffer and save the result to `u` register

```vim
command! UpgitCurrent :let @u=upgit#upload('%')
```
