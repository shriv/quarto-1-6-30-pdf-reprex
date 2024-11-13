This repo provides a reprex for quarto issues seen with scaling of markdown images in pdf outputs when rendered with Quarto 1.6.30. Steps to reproduce:

- `cd` to repo directory and create the development environment with `nix develop`
- Render the pdf with `quarto render quarto.qmd`. 

At this point, I'm uncertain if the issue is with quarto CLI or with the version of quarto & / or tex from nix. 