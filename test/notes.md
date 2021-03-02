
# Install stuff

## `npm`
`brew install npm`

## `webpack`
(https://webpack.js.org/guides/installation/)
`npm install webpack`

## julia-vscode repo
`git clone git@github.com:julia-vscode/julia-vscode.git`
cd there
`git submodule init`


# Run the extension
1. Open VS Code in the extension folder
2. Side Bar, select Run (Ctrl-Shift-D or something)
3. Select `Run Extension` (based on launch.json)
4. Click green "Play" button
5. new window with "Extension Development Host" appears


https://stackoverflow.com/questions/50714638/install-extension-from-a-specific-repo-branch-on-github

https://code.visualstudio.com/api/get-started/your-first-extension#developing-the-extension

https://github.com/julia-vscode/julia-vscode/blob/25e0ea50f322f5fa472c0d2a38edec1acc3972c0/scripts/packages/VSCodeServer/src/progress.jl#L3-L23

https://github.com/julia-vscode/julia-vscode/blob/f23baa551c44609e6faf1d5130a871532d1664b2/src/interactive/repl.ts#L232-L269

withProgress
https://code.visualstudio.com/api/references/vscode-api
https://code.visualstudio.com/api/references/vscode-api#Progress%3CT%3E
