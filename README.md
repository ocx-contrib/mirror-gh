# mirror-gh

OCX mirror for [GitHub CLI (`gh`)](https://github.com/cli/cli).
Publishes the official GitHub release tarballs to `ocx.sh/gh` with cascade tags
after a smoke test per `(version, platform)`.

## Platforms

Currently `linux/amd64` and `linux/arm64`. darwin and windows are staged for
follow-up passes (macOS/Windows CI minutes are kept off until Linux is green).

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
