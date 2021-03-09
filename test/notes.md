
# Install stuff

## Node.js
You can install `node` and `npm` directly, especially if you might use different versions of Node.js.
However, you might prefer to use [`nvm`, the Node Version Manager](https://github.com/nvm-sh/nvm#installing-and-updating).

### using nvm
nvm might be installed as a shell alias, so e.g. `which nvm` will return nothing.

After `nvm` is installed, install and "activate" a node "environment":

```sh
nvm install 14
nvm use 14
```
This modifies your `PATH` environment variable so that executables `node` and `npm` can be found.
On its own, it does not e.g. modify `.bashrc`, so you will need to run `nvm use $version` as often as you might need to run e.g. `conda activate $environment`.


## webpack
[reference](https://webpack.js.org/guides/installation/)

```sh
npm install -g webpack
npm install -g webpack-cli
```

`-g` installs the node package globally. None of this is not needed since it is a dev dependency of `julia-vscode`.

## julia-vscode repo
```sh
git clone git@github.com:julia-vscode/julia-vscode.git
cd julia-vscode
git submodule init
git submodule update
```
(this step really should be documented. see e.g. https://github.com/julia-vscode/julia-vscode/issues/1900#issuecomment-778776914)


# setup build npm environment
A node package contains a file `package.json` that specifies its name, version, dependencies, etc.
The file `package.json` also specifies "scripts", which can be run with `npm run $script_name`.

Run `npm install` to install dependencies. They will be placed in the directory `node_modules`.

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
need to use node@14 and npm@6
https://github.com/redhat-developer/vscode-extension-tester/issues/253

```sh
nvm install 14
nvm use 14
```

## setup
https://github.com/redhat-developer/vscode-extension-tester

`npm install --save-dev vscode-extension-tester mocha @types/mocha`

default location for `test-resources` is in the VS Code extension's root. [As mentioned](https://github.com/redhat-developer/vscode-extension-tester/wiki/Test-Setup):

> To avoid build problems, make sure to exclude it from your `tsconfig` and `vsce`.

So I put it elsewhere.

```sh
mkdir /tmp/test-resources
```

Use `npx extest` throughout since `vscode-extension-tester` was not installed globally.

Note that `extest` expects to find VS Code in the test-resources directory.

```sh
npx extest get-vscode --storage /tmp/test-resources
npx extest get-chromedriver --storage /tmp/test-resources
```

## run
Note this is a glob, so if you mis-spell it, no files will match, and the tests will "silently" pass.
```sh
npx extest run-tests --storage /tmp/test-resources ../vscode-test.js
```

## docker
### gui app
`brew install --cask xquartz`
xhost +localhost
