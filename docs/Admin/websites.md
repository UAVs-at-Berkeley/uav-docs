# Websites

We maintain three websites:

| URL | Source |
|---|---|
| [https://uav.studentorg.berkeley.edu](https://uav.studentorg.berkeley.edu) | [GitHub](https://github.com/UAVs-at-Berkeley/uav-web) |
| [https://uav.studentorg.berkeley.edu/docs](https://uav.studentorg.berkeley.edu/docs) | [GitHub](https://github.com/UAVs-at-Berkeley/uav-docs) |
| [https://uav.studentorg.berkeley.edu/ground-school](https://uav.studentorg.berkeley.edu/ground-school) | [GitHub](https://github.com/UAVs-at-Berkeley/uav-gs) |

## Contributing

The main website is built using Astro and require Node.js/npm. The documentation and ground school pages are built using Zensical and require Python/uv. Specific requirements and setup instructions are available in the `README` of the respective repositories. A Nix flake is provided.

Generally, it is okay to commit directly to the repositories. If you feel that the change you are making is a major feature or overhaul, please open a pull request.

## Infrastructure

All sites are hosted by the [Open Computing Facility](https://ocf.berkeley.edu/) (OCF). We own the `uav` group account which serves our sites and can be accesed through the OCF's login server via SSH. More information on hosting can be found on the [OCF's documentation](https://bestdocs.ocf.io/user-docs/services/web/).

??? info "Getting Access"

    The login information for `uav` is stored on the shared Apple Passwords group. However, the process is fully automated from the GitHub repositories, so performing actions via `uav` should generally never be needed.

## Deployment

Each repository has a GitHub Actions workflow that automatically deploys the site when changes are pushed to the `main` branch. GitHub builds the site then `rsync`'s it to the server. The SSH key used for deployment is stored in the repository's secrets.

??? warning "Overwriting"

    All sites share the group account's `~/public_html` directory. The `rsync` commands have been set up in a way to avoid overwriting each other's files, but be careful when making any changes manually.
