# Align Interiors — Homepage

The redesigned homepage for [Align Interiors](https://www.aligninteriors.ca), a Toronto-based luxury interior design studio. Static HTML, no build step, deployable to GitHub Pages in under five minutes.

---

## Quick Deploy to GitHub Pages

### Step 1: Create the repo

1. Sign in to GitHub.
2. Click **New repository** (top right, the `+` icon).
3. Name it `align-interiors` (or anything you prefer). Set it to **Public**.
4. Skip everything else and click **Create repository**.

### Step 2: Upload these files

You have two options:

**Option A — Drag and drop in the browser (easiest)**

1. On the new empty repo page, click **uploading an existing file**.
2. Drag every file from this folder into the upload area.
3. Scroll down and click **Commit changes**.

**Option B — Git command line**

```bash
cd path/to/this-folder
git init
git add .
git commit -m "Initial site"
git branch -M main
git remote add origin https://github.com/YOUR-USERNAME/align-interiors.git
git push -u origin main
```

### Step 3: Fetch the images

The HTML expects images in an `/images` folder. Run **one** of the two scripts below from your local copy of the repo to download them all:

**Mac / Linux:**
```bash
chmod +x fetch-images.sh
./fetch-images.sh
```

**Windows (PowerShell):**
```powershell
.\fetch-images.ps1
```

This pulls the project photography from the existing Wix-hosted CDN and saves clean local copies into `/images`. After it finishes, commit and push:

```bash
git add .
git commit -m "Add site images"
git push
```

### Step 4: Turn on GitHub Pages

1. In your repo, go to **Settings → Pages** (left sidebar).
2. Under **Source**, select **Deploy from a branch**.
3. Under **Branch**, select `main` and `/ (root)`. Click **Save**.
4. Wait 1–2 minutes. The page will show your live URL:

```
https://YOUR-USERNAME.github.io/align-interiors/
```

Done. That URL is the live site.

---

## After it's live: SEO check-up

Once the site is up, run a few small updates to point search engines at the correct URL.

### 1. Replace the canonical URL

The site currently references `https://www.aligninteriors.ca` as the canonical URL (the address search engines treat as the master version). Since you're using the GitHub Pages URL for now, update these mentions in `index.html`:

Find and replace:
```
https://www.aligninteriors.ca
```
With your live URL:
```
https://YOUR-USERNAME.github.io/align-interiors
```

Files to update:
- `index.html` (canonical link, og:url, schema "url")
- `sitemap.xml`
- `robots.txt`

### 2. Submit to Google

Visit [Google Search Console](https://search.google.com/search-console), add your GitHub Pages URL as a property, verify ownership (the HTML tag method is easiest — Google will give you a `<meta>` tag to paste into the `<head>` of `index.html`), then submit your `sitemap.xml`.

Usually Google indexes a GitHub Pages site within a week.

### 3. Submit to Bing

Same process at [Bing Webmaster Tools](https://www.bing.com/webmasters).

---

## File overview

```
.
├── index.html             ← the entire homepage (HTML, CSS, JS inline)
├── 404.html               ← branded 404 page
├── robots.txt             ← search engine instructions
├── sitemap.xml            ← page list for search engines
├── site.webmanifest       ← favicon + PWA config
├── .nojekyll              ← tells GitHub Pages: serve files as-is, no Jekyll
├── .gitignore             ← OS junk to ignore
├── LICENSE                ← all rights reserved
├── fetch-images.sh        ← Mac/Linux: download all images
├── fetch-images.ps1       ← Windows: download all images
├── README.md              ← this file
└── images/                ← populated after running fetch-images
    ├── align-logo.png
    ├── img-residential-01.jpg
    ├── img-residential-02.jpg
    ├── (etc.)
    └── og-image.jpg       ← social share card (1200×630)
```

---

## Editing the site

### Change copy or imagery

Open `index.html` in any text editor (VS Code, Sublime, even Notepad). The file is structured top-to-bottom in document order: nav, hero, ribbon, portfolio, manifesto, services, split, method, numbers, awards, clients, testimonial, FAQ, CTA, footer. Find the section you want, edit, save, commit, push. GitHub Pages auto-redeploys within a minute.

### Swap an image

Drop the new file into `/images` with the same filename as the one you want to replace, commit, push. No HTML edit needed.

### Adjust colors

The full color palette lives in CSS variables at the top of the `<style>` block in `index.html` (line ~38):

```css
:root{
  --blush:        #F8EAE3;   /* primary ground */
  --rose:         #E8B5A7;
  --rose-deep:    #C97A6E;   /* primary accent + italic emphasis */
  --plum:         #5C3540;   /* body text + dark anchor */
  --aubergine:    #3B1F2A;   /* deepest dark */
  --ivory:        #FBF6F2;   /* hero ground */
  /* ... */
}
```

Change one value and it propagates across every section that uses it.

### Update the ribbon stats

Find the `<!-- STAT RIBBON -->` block in `index.html`. The numbers are in two identical groups (the second is a duplicate for the seamless marquee loop). Update both groups when you change a stat.

---

## Favicons (optional but recommended)

The site references favicons that haven't been generated yet. To add them:

1. Take the Align logo (or a simplified mark) and run it through [realfavicongenerator.net](https://realfavicongenerator.net).
2. Download the generated package.
3. Drop these files into the root of your repo:
   - `favicon-16.png`
   - `favicon-32.png`
   - `favicon-192.png`
   - `favicon-512.png`
   - `apple-touch-icon.png`
4. Commit and push.

Without favicons the site still works perfectly — browsers just won't show a tab icon.

---

## Custom domain (when you're ready)

If you later move from `aligninteriors.ca` (the live Wix site) to point the domain at this repo, the process is:

1. In repo **Settings → Pages**, add `www.aligninteriors.ca` as your custom domain.
2. In your domain registrar, add a `CNAME` record pointing `www` to `YOUR-USERNAME.github.io`.
3. Wait 5–60 minutes for DNS to propagate.
4. Enable **Enforce HTTPS** in the Pages settings.

GitHub handles the SSL certificate automatically.

---

## Support

For changes to this site, contact [revmedia](mailto:info@revmedia.ca) at 365-357-3006.

For Align Interiors directly: [info@aligninteriors.ca](mailto:info@aligninteriors.ca), 647-278-5373.

---

© 2026 Align Interiors Inc. · An H&S Holdings Company
