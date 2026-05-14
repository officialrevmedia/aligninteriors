# fetch-images.ps1
# Run once after cloning the repo to download all site images into /images.
#
# Usage (PowerShell):
#   .\fetch-images.ps1

$ErrorActionPreference = "Stop"
New-Item -ItemType Directory -Force -Path "images" | Out-Null

$downloads = @(
    @{ url = "https://static.wixstatic.com/media/72ce7d_885d995ff2fb4806bd81fe3f26082141~mv2.png"; out = "images/align-logo.png" },
    @{ url = "https://static.wixstatic.com/media/72ce7d_c5e361d58d9146429758b2642d115141~mv2.jpg/v1/fit/w_1600,h_2000,q_92,enc_jpg/img.jpg"; out = "images/img-residential-01.jpg" },
    @{ url = "https://static.wixstatic.com/media/72ce7d_a99a535f05ce4b5b83ae63d186428cfe~mv2.jpg/v1/fit/w_1600,h_1600,q_92,enc_jpg/img.jpg"; out = "images/img-residential-02.jpg" },
    @{ url = "https://static.wixstatic.com/media/72ce7d_c087d1d7f7fd4c1f8185feecad3cd896~mv2.jpg/v1/fit/w_1200,h_1500,q_92,enc_jpg/img.jpg"; out = "images/img-residential-03.jpg" },
    @{ url = "https://static.wixstatic.com/media/72ce7d_7ab5b54f0820400d83288f0564fc2dbc~mv2.jpg/v1/fit/w_1200,h_1500,q_92,enc_jpg/img.jpg"; out = "images/img-residential-04.jpg" },
    @{ url = "https://static.wixstatic.com/media/72ce7d_9ea8d7a2b2c84e7fa53dadef912f2835~mv2.jpg/v1/fit/w_1200,h_1500,q_92,enc_jpg/img.jpg"; out = "images/img-hospitality-01.jpg" },
    @{ url = "https://static.wixstatic.com/media/72ce7d_c0355df96cd6448e99dcc611edb4ddb7~mv2.jpg/v1/fit/w_1600,h_1600,q_92,enc_jpg/img.jpg"; out = "images/img-commercial-01.jpg" },
    @{ url = "https://static.wixstatic.com/media/72ce7d_4040969344c94d63bd608f24e0924011~mv2.jpg/v1/fit/w_1600,h_1000,q_92,enc_jpg/img.jpg"; out = "images/img-commercial-02.jpg" },
    @{ url = "https://static.wixstatic.com/media/72ce7d_117bf95ce5ae4fa587302c8c2eddaacd~mv2.jpg/v1/fit/w_1400,h_950,q_92,enc_jpg/img.jpg"; out = "images/img-commercial-03.jpg" },
    @{ url = "https://static.wixstatic.com/media/72ce7d_79caff08f63f43afa9cc6690a7612d3c~mv2.png"; out = "images/img-rendering-01.png" },
    @{ url = "https://static.wixstatic.com/media/72ce7d_28631c425ab544d5aff70ae1308e52e7~mv2.webp"; out = "images/logo-tic.webp" },
    @{ url = "https://static.wixstatic.com/media/72ce7d_18c15ee0402b4edaa9feaef46967f8b4~mv2.png"; out = "images/logo-mist.png" },
    @{ url = "https://static.wixstatic.com/media/72ce7d_3be5df6e0ef248689d49aa080ff5ec9d~mv2.png"; out = "images/logo-lazzurra.png" },
    @{ url = "https://static.wixstatic.com/media/72ce7d_f3ec00814e204452938e9082b62dda05~mv2.png"; out = "images/logo-aarti.png" },
    @{ url = "https://static.wixstatic.com/media/72ce7d_21e7b148f6f24a88a0d78e685d08e3ee~mv2.png"; out = "images/logo-elite.png" },
    @{ url = "https://static.wixstatic.com/media/72ce7d_9e5b7bf1bbd24e5faa07fa7d44b7927b~mv2.jpg"; out = "images/logo-armilas.jpg" }
)

Write-Host "Downloading images..."
foreach ($d in $downloads) {
    Write-Host "  $($d.out)"
    Invoke-WebRequest -Uri $d.url -OutFile $d.out -UseBasicParsing
}

# OG share image
Copy-Item "images/img-residential-01.jpg" "images/og-image.jpg" -Force

Write-Host ""
Write-Host "Done. Files in images/:"
Get-ChildItem images | Format-Table Name, Length

Write-Host ""
Write-Host "Next step: commit and push."
Write-Host "  git add ."
Write-Host "  git commit -m 'Add site images'"
Write-Host "  git push"
