def _xz_decompress_impl(ctx):
    input_file = ctx.file.src
    output_file = ctx.actions.declare_file(ctx.attr.out)

    # We need --force as bazel files are symlinks.
    ctx.actions.run_shell(
        inputs = [input_file],
        outputs = [output_file],
        command = "xz -d --force {}".format(input_file.path),
        use_default_shell_env = True,
    )

    return [DefaultInfo(files = depset([output_file]))]

xz_decompress = rule(
    implementation = _xz_decompress_impl,
    attrs = {
        "src": attr.label(allow_single_file = True, mandatory = True),
        "out": attr.string(mandatory = True),
    },
)
