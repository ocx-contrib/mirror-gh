# Single binary `gh`. Branch on the typed OS constant — ocx.platform() was removed.
GH = "gh.exe" if ocx.target_platform.os == ocx.os.Windows else "gh"

r_version = ocx.run(GH, "--version")
expect.ok(r_version)
expect.eq(r_version.exit_code, 0)
expect.contains(r_version.stdout, "gh version")

r_help = ocx.run(GH, "--help")
expect.eq(r_help.exit_code, 0)
expect.contains(r_help.stdout, "Work seamlessly with GitHub")
expect.contains(r_help.stdout, "USAGE")
