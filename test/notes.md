
# Install stuff

## `npm`
`brew install npm`

## `webpack`
(https://webpack.js.org/guides/installation/)
`npm install -g webpack`
`npm install -g webpack-cli`
## julia-vscode repo
`git clone git@github.com:julia-vscode/julia-vscode.git`
cd there
`git submodule init`
`git submodule update`


# setup build npm environment
(from `package.json`)

`npm install`

# Run the extension
## With VS Code and `launch.json`
1. Open VS Code with the workspace set to the extension folder
2. Side Bar, select Run (Ctrl-Shift-D or something)
3. Select `Run Extension`
4. Click green "Play" button
5. new window with "Extension Development Host" appears

## With the shell
ensure you're CD'd to the right directory
note that the VS Code application is usually on the `PATH` as `code`
(corresponding to e.g. `/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code`)
But I have symlink called `vscode` in my PATH and will use that in the examples for clarity.

`npm run webpack` (build the extension)
`vscode --extensionDevelopmentPath=.` (launch VS Code with this build)


https://stackoverflow.com/questions/50714638/install-extension-from-a-specific-repo-branch-on-github

https://code.visualstudio.com/api/get-started/your-first-extension#developing-the-extension

https://code.visualstudio.com/api/working-with-extensions/testing-extension

https://github.com/julia-vscode/julia-vscode/blob/25e0ea50f322f5fa472c0d2a38edec1acc3972c0/scripts/packages/VSCodeServer/src/progress.jl#L3-L23

https://github.com/julia-vscode/julia-vscode/blob/f23baa551c44609e6faf1d5130a871532d1664b2/src/interactive/repl.ts#L232-L269

withProgress
https://code.visualstudio.com/api/references/vscode-api
https://code.visualstudio.com/api/references/vscode-api#Progress%3CT%3E


```julia
using Pkg
run(Cmd(["cd", expanduser("~/projects/LoggingPlayground")]))
Pkg.activate(".")

using LoggingPlayground
LoggingPlayground.do_1(20)
```

# testing
## setup
https://github.com/redhat-developer/vscode-extension-tester

maybe should be `--save-dev` instead of `--global`, and activate something to allow `extest` to be on the path.
`npm install --global vscode-extension-tester mocha @types/mocha`

default location for `test-resources` is in the VS Code extension's root. [As mentioned](https://github.com/redhat-developer/vscode-extension-tester/wiki/Test-Setup):

> To avoid build problems, make sure to exclude it from your `tsconfig` and `vsce`.

So I put it elsewhere.

```sh
mkdir /tmp/test-resources
```

Note that `extest` expects to find VS Code in the test-resources directory.

```sh
extest get-vscode --storage /tmp/test-resources
extest get-chromedriver --storage /tmp/test-resources
```

## run
```sh
extest run-tests --storage /tmp/test-resources ../vscode-test.ts
```
