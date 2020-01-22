" LanguageClient Settings
let g:LanguageClient_serverCommands = {}

function! Keybinding_lsp(filetype)
    call vmenu#commands([
                \['e', 'Explain', 'call LanguageClient#explainErrorAtPoint()'],
                \['l', 'List', 'call LanguageClient#setDiagnosticsList()']
        \], {
            \'parent': g:keybindings_error,
            \'filetype': a:filetype
        \})

    call vmenu#commands([
                \['d', 'Show Documentation', 'call LanguageClient#textDocument_hover()']
        \], {
            \'parent': g:keybindings_documentation,
            \'filetype': a:filetype
        \})

    call vmenu#commands([
                \['l', 'LSP Options', 'call LanguageClient_contextMenu()'],
                \['a', 'Code Action', 'call LanguageClient#textDocument_codeAction()'],
                \['c', 'Completion', 'call LanguageClient#textDocument_completion()'],
                \['r', 'Highlight References', 'call LanguageClient#textDocument_documentHighlight()']
        \], {
            \'parent': g:keybindings_help,
            \'filetype': a:filetype
        \})

    call vmenu#commands([
                \['d', 'Definition', 'call LanguageClient#textDocument_definition()'],
                \['i', 'Implementation', 'call LanguageClient#textDocument_implementation()'],
                \['r', 'References', 'call LanguageClient#textDocument_references()'],
                \['s', 'Symbol', 'call LanguageClient#textDocument_documentSymbol()']
        \], {
            \'parent': g:keybindings_goto,
            \'filetype': a:filetype
        \})

    call vmenu#commands([
                \['r', 'Rename', 'call LanguageClient#textDocument_rename()'],
                \['f', 'Format', 'call LanguageClient#textDocument_formatting()'],
                \['F', 'Range Format', 'call LanguageClient#textDocument_rangeFormatting()']
        \], {
            \'parent': g:keybindings_refactor_run,
            \'filetype': a:filetype
        \})
endfunction

" Deoplete Settings
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
let g:deoplete#enable_at_startup = 1

" Test Settings
let test#strategy = 'neovim'
let g:test#preserve_screen = 1

call vmenu#commands([
            \['n', 'Test Nearest',  'TestNearest'],
            \['f','Test File', 'TestFile'],
            \['s', 'Test Suite', 'TestSuite'],
            \['p', 'Test Previous', 'TestLast'],
            \['v', 'Test Visit', 'TestVisit']
        \], {
            \'parent': keybindings_test_tab
        \})
