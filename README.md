# mirror-gh

OCX mirror for [GitHub CLI (`gh`)](https://github.com/cli/cli).
Publishes the official GitHub release tarballs to `ocx.sh/gh` with cascade tags
after a smoke test per `(version, platform)`.

## Platforms

`linux/amd64`, `linux/arm64`, `darwin/amd64`, `darwin/arm64`,
`windows/amd64`, `windows/arm64`. Linux and macOS ship a versioned wrapper
dir (`strip_components: 1`); the Windows zip is flat with `bin/gh.exe` at
the root (`strip_components: 0`).

## Editing

| File | Edit | Regenerate after |
|------|------|------------------|
| `mirror.yml` | hand | `ocx-mirror pipeline generate ci` |
| `tests/smoke.star` | hand | — |
| `metadata.json`, `CATALOG.md`, `logo.*` | hand | — |
| `.github/workflows/*.yml` | generated | re-run when `mirror.yml` changes |

CI fails on drift via `ocx-mirror pipeline generate ci --check`.

## Required secrets

| Secret | Use |
|--------|-----|
| `OCX_MIRROR_REGISTRY_TOKEN` + `OCX_MIRROR_REGISTRY_USER` | `ocx package push` to `ocx.sh` |
| `OCX_MIRROR_DISCORD_HOOK` | notify-stage Discord webhook URL |

(Inherited from the `ocx-contrib` org with visibility ALL.)

## License

Apache-2.0 — see [`LICENSE`](LICENSE). Upstream assets (GitHub logo, mirrored
binaries) are out of scope; see [`NOTICE.md`](NOTICE.md).
