using namespace System.Management.Automation
using namespace System.Management.Automation.Language

Register-ArgumentCompleter -Native -CommandName 'rustup' -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)

    $commandElements = $commandAst.CommandElements
    $command = @(
        'rustup'
        for ($i = 1; $i -lt $commandElements.Count; $i++) {
            $element = $commandElements[$i]
            if ($element -isnot [StringConstantExpressionAst] -or
                $element.StringConstantType -ne [StringConstantType]::BareWord -or
                $element.Value.StartsWith('-')) {
                break
            }
            $element.Value
        }) -join ';'

    $completions = @(switch ($command) {
            'rustup' {
                [CompletionResult]::new('-v', 'v', [CompletionResultType]::ParameterName, 'Enable verbose output')
                [CompletionResult]::new('--verbose', 'verbose', [CompletionResultType]::ParameterName, 'Enable verbose output')
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('show', 'show', [CompletionResultType]::ParameterValue, 'Show the active and installed toolchains')
                [CompletionResult]::new('install', 'install', [CompletionResultType]::ParameterValue, 'Update Rust toolchains')
                [CompletionResult]::new('uninstall', 'uninstall', [CompletionResultType]::ParameterValue, 'Uninstall Rust toolchains')
                [CompletionResult]::new('update', 'update', [CompletionResultType]::ParameterValue, 'Update Rust toolchains and rustup')
                [CompletionResult]::new('default', 'default', [CompletionResultType]::ParameterValue, 'Set the default toolchain')
                [CompletionResult]::new('toolchain', 'toolchain', [CompletionResultType]::ParameterValue, 'Modify or query the installed toolchains')
                [CompletionResult]::new('target', 'target', [CompletionResultType]::ParameterValue, 'Modify a toolchain''s supported targets')
                [CompletionResult]::new('component', 'component', [CompletionResultType]::ParameterValue, 'Modify a toolchain''s installed components')
                [CompletionResult]::new('override', 'override', [CompletionResultType]::ParameterValue, 'Modify directory toolchain overrides')
                [CompletionResult]::new('run', 'run', [CompletionResultType]::ParameterValue, 'Run a command with an environment configured for a given toolchain')
                [CompletionResult]::new('which', 'which', [CompletionResultType]::ParameterValue, 'Display which binary will be run for a given command')
                [CompletionResult]::new('doc', 'doc', [CompletionResultType]::ParameterValue, 'Open the documentation for the current toolchain')
                [CompletionResult]::new('self', 'self', [CompletionResultType]::ParameterValue, 'Modify the rustup installation')
                [CompletionResult]::new('telemetry', 'telemetry', [CompletionResultType]::ParameterValue, 'rustup telemetry commands')
                [CompletionResult]::new('set', 'set', [CompletionResultType]::ParameterValue, 'Alter rustup settings')
                [CompletionResult]::new('completions', 'completions', [CompletionResultType]::ParameterValue, 'Generate completion scripts for your shell')
                [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Prints this message or the help of the given subcommand(s)')
                break
            }
            'rustup;show' {
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('active-toolchain', 'active-toolchain', [CompletionResultType]::ParameterValue, 'Show the active toolchain')
                [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Prints this message or the help of the given subcommand(s)')
                break
            }
            'rustup;show;active-toolchain' {
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
                break
            }
            'rustup;show;help' {
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
                break
            }
            'rustup;install' {
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
                break
            }
            'rustup;uninstall' {
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
                break
            }
            'rustup;update' {
                [CompletionResult]::new('--no-self-update', 'no-self-update', [CompletionResultType]::ParameterName, 'Don''t perform self update when running the `rustup` command')
                [CompletionResult]::new('--force', 'force', [CompletionResultType]::ParameterName, 'Force an update, even if some components are missing')
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
                break
            }
            'rustup;default' {
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
                break
            }
            'rustup;toolchain' {
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List installed toolchains')
                [CompletionResult]::new('install', 'install', [CompletionResultType]::ParameterValue, 'Install or update a given toolchain')
                [CompletionResult]::new('uninstall', 'uninstall', [CompletionResultType]::ParameterValue, 'Uninstall a toolchain')
                [CompletionResult]::new('link', 'link', [CompletionResultType]::ParameterValue, 'Create a custom toolchain by symlinking to a directory')
                [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Prints this message or the help of the given subcommand(s)')
                break
            }
            'rustup;toolchain;list' {
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
                break
            }
            'rustup;toolchain;install' {
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
                break
            }
            'rustup;toolchain;uninstall' {
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
                break
            }
            'rustup;toolchain;link' {
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
                break
            }
            'rustup;toolchain;help' {
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
                break
            }
            'rustup;target' {
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List installed and available targets')
                [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a target to a Rust toolchain')
                [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove a target from a Rust toolchain')
                [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Prints this message or the help of the given subcommand(s)')
                break
            }
            'rustup;target;list' {
                [CompletionResult]::new('--toolchain', 'toolchain', [CompletionResultType]::ParameterName, 'Toolchain name, such as ''stable'', ''nightly'', or ''1.8.0''. For more information see `rustup help toolchain`')
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
                break
            }
            'rustup;target;add' {
                [CompletionResult]::new('--toolchain', 'toolchain', [CompletionResultType]::ParameterName, 'Toolchain name, such as ''stable'', ''nightly'', or ''1.8.0''. For more information see `rustup help toolchain`')
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
                break
            }
            'rustup;target;remove' {
                [CompletionResult]::new('--toolchain', 'toolchain', [CompletionResultType]::ParameterName, 'Toolchain name, such as ''stable'', ''nightly'', or ''1.8.0''. For more information see `rustup help toolchain`')
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
                break
            }
            'rustup;target;help' {
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
                break
            }
            'rustup;component' {
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List installed and available components')
                [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a component to a Rust toolchain')
                [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove a component from a Rust toolchain')
                [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Prints this message or the help of the given subcommand(s)')
                break
            }
            'rustup;component;list' {
                [CompletionResult]::new('--toolchain', 'toolchain', [CompletionResultType]::ParameterName, 'Toolchain name, such as ''stable'', ''nightly'', or ''1.8.0''. For more information see `rustup help toolchain`')
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
                break
            }
            'rustup;component;add' {
                [CompletionResult]::new('--toolchain', 'toolchain', [CompletionResultType]::ParameterName, 'Toolchain name, such as ''stable'', ''nightly'', or ''1.8.0''. For more information see `rustup help toolchain`')
                [CompletionResult]::new('--target', 'target', [CompletionResultType]::ParameterName, 'target')
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
                break
            }
            'rustup;component;remove' {
                [CompletionResult]::new('--toolchain', 'toolchain', [CompletionResultType]::ParameterName, 'Toolchain name, such as ''stable'', ''nightly'', or ''1.8.0''. For more information see `rustup help toolchain`')
                [CompletionResult]::new('--target', 'target', [CompletionResultType]::ParameterName, 'target')
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
                break
            }
            'rustup;component;help' {
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
                break
            }
            'rustup;override' {
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List directory toolchain overrides')
                [CompletionResult]::new('set', 'set', [CompletionResultType]::ParameterValue, 'Set the override toolchain for a directory')
                [CompletionResult]::new('unset', 'unset', [CompletionResultType]::ParameterValue, 'Remove the override toolchain for a directory')
                [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Prints this message or the help of the given subcommand(s)')
                break
            }
            'rustup;override;list' {
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
                break
            }
            'rustup;override;set' {
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
                break
            }
            'rustup;override;unset' {
                [CompletionResult]::new('--path', 'path', [CompletionResultType]::ParameterName, 'Path to the directory')
                [CompletionResult]::new('--nonexistent', 'nonexistent', [CompletionResultType]::ParameterName, 'Remove override toolchain for all nonexistent directories')
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
                break
            }
            'rustup;override;help' {
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
                break
            }
            'rustup;run' {
                [CompletionResult]::new('--install', 'install', [CompletionResultType]::ParameterName, 'Install the requested toolchain if needed')
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
                break
            }
            'rustup;which' {
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
                break
            }
            'rustup;doc' {
                [CompletionResult]::new('--toolchain', 'toolchain', [CompletionResultType]::ParameterName, 'Toolchain name, such as ''stable'', ''nightly'', or ''1.8.0''. For more information see `rustup help toolchain`')
                [CompletionResult]::new('--path', 'path', [CompletionResultType]::ParameterName, 'Only print the path to the documentation')
                [CompletionResult]::new('--book', 'book', [CompletionResultType]::ParameterName, 'The Rust Programming Language book')
                [CompletionResult]::new('--std', 'std', [CompletionResultType]::ParameterName, 'Standard library API documentation')
                [CompletionResult]::new('--reference', 'reference', [CompletionResultType]::ParameterName, 'The Rust Reference')
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
                break
            }
            'rustup;self' {
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('update', 'update', [CompletionResultType]::ParameterValue, 'Download and install updates to rustup')
                [CompletionResult]::new('uninstall', 'uninstall', [CompletionResultType]::ParameterValue, 'Uninstall rustup.')
                [CompletionResult]::new('upgrade-data', 'upgrade-data', [CompletionResultType]::ParameterValue, 'Upgrade the internal data format.')
                [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Prints this message or the help of the given subcommand(s)')
                break
            }
            'rustup;self;update' {
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
                break
            }
            'rustup;self;uninstall' {
                [CompletionResult]::new('-y', 'y', [CompletionResultType]::ParameterName, 'y')
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
                break
            }
            'rustup;self;upgrade-data' {
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
                break
            }
            'rustup;self;help' {
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
                break
            }
            'rustup;telemetry' {
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('enable', 'enable', [CompletionResultType]::ParameterValue, 'Enable rustup telemetry')
                [CompletionResult]::new('disable', 'disable', [CompletionResultType]::ParameterValue, 'Disable rustup telemetry')
                [CompletionResult]::new('analyze', 'analyze', [CompletionResultType]::ParameterValue, 'Analyze stored telemetry')
                [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Prints this message or the help of the given subcommand(s)')
                break
            }
            'rustup;telemetry;enable' {
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
                break
            }
            'rustup;telemetry;disable' {
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
                break
            }
            'rustup;telemetry;analyze' {
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
                break
            }
            'rustup;telemetry;help' {
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
                break
            }
            'rustup;set' {
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('default-host', 'default-host', [CompletionResultType]::ParameterValue, 'The triple used to identify toolchains when not specified')
                [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Prints this message or the help of the given subcommand(s)')
                break
            }
            'rustup;set;default-host' {
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
                break
            }
            'rustup;set;help' {
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
                break
            }
            'rustup;completions' {
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
                break
            }
            'rustup;help' {
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
                [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
                [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
                break
            }
        })

    $completions.Where{ $_.CompletionText -like "$wordToComplete*" } |
    Sort-Object -Property ListItemText
}
