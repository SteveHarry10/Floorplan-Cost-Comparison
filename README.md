# Floor Plan Cost Comparison

This repository package is set up so the dashboard reads cost data from a generated JSON file, not from hard-coded data inside `index.html`.

## How The Data Works

- `index.html` loads `data/floorplans-data.json`.
- `data/floorplans-data.json` is created by the GitHub Action after it downloads the SharePoint Excel workbook.
- The package intentionally does not include `data/floorplans-data.json` at first, so the site will show a data-loading message until the workflow runs successfully.
- After the workflow runs, the generated JSON file will contain floorplan cost data. Keep the GitHub repository private if those costs are private.

## Setup

1. Upload the contents of this folder to a GitHub repository.
2. In GitHub, go to `Settings` > `Secrets and variables` > `Actions`.
3. Add a repository secret named `FLOORPLAN_XLSX_URL`.
4. For the secret value, paste the SharePoint Excel sharing link.
5. Go to `Actions` > `Refresh dashboard from SharePoint Excel` > `Run workflow`.
6. Wait for the workflow to finish, then refresh the GitHub Pages website after Pages redeploys.

## Refresh Button

The dashboard top bar includes a `Refresh From SharePoint` button. On GitHub Pages, it opens this repository's refresh workflow page so a signed-in GitHub user can run the SharePoint refresh.

The button does not store or expose a GitHub token in the website. GitHub will still require the user to click `Run workflow`.

## Workbook Layout

The workflow uses:

- Sheet name: `Floorplans`
- Plan names row: `5`
- Main/second/third/basement sq ft rows: `6`, `7`, `8`, `9`
- Cost lines start row: `12`

Basement sq ft is excluded from total sq ft in the dashboard.
