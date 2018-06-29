(require 'org)

;; IIRC ox-rss is not part of stock emacs.  Try installing the
;; org-plus-contrib package to get it.
(require 'ox-rss)

;; Change the following to suit your site.
(setq my-website-description          "Chanting and Choir Resources"
      my-website-keywords             "music chant choir church orthodox")

(setq my-website-project-root (file-name-directory (or load-file-name (buffer-file-name))))
(setq my-website-src my-website-project-root)
(setq my-website-htdocs (file-name-directory (concat my-website-project-root "docs/")))

(setq my-website-html-head
  "<meta charset=\"UTF-8\">
<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">
<link rel=\"stylesheet\" href=\"/parish-music/css/w3.css\">
<link rel=\"stylesheet\" href=\"/parish-music/css/w3-theme-blue.css\">
<link rel=\"stylesheet\" href=\"/parish-music/css/font-awesome.min.css\">
<link rel=\"stylesheet\" href=\"/parish-music/css/site.css\">")

(setq my-website-html-preamble
  "<div class=\"w3-bar w3-theme-dark\">
  <a href=\"/parish-music/\" class=\"w3-bar-item w3-button w3-padding-16\">About</a>
  <a href=\"/parish-music/book/\" class=\"w3-bar-item w3-button w3-padding-16\">Book</a>
  <a href=\"/parish-music/misc/\" class=\"w3-bar-item w3-button w3-padding-16\">Misc</a>
</div>")     :html-link-home "/parish-music"
     :html-link-use-abs-url t


(setq my-website-html-postamble
  "<div style=\"padding-top: 2em\"></div>
<footer class=\"w3-container w3-theme-dark w3-padding-16\">
  <h3 style=\"margin-top: 0px; padding-top: 0px; margin-bottom: 0px; padding-bottom: 0px\">Holy Trinity Greek Orthodox Music Ministries</h3>
  <p style=\"margin-top: 0px; padding-top: 0px\">Fort Wayne, Indiana</p>
  <p>Powered by <a href=\"https://www.w3schools.com/w3css/default.asp\" target=\"_blank\">w3.css</a></p>
  <p><a rel=\"license\" href=\"http://creativecommons.org/publicdomain/mark/1.0/\"><img alt=\"Creative Commons License\" style=\"border-width:0\" src=\"https://i.creativecommons.org/p/mark/1.0/88x31.png\" /></a><br />This work is licensed under a <a rel=\"license\" href=\"http://creativecommons.org/publicdomain/mark/1.0/\">Creative Commons Public Domain Mark 1.0 License</a>.</p>
</footer>")

(setq org-publish-project-alist
  `(("org"
     :base-directory ,my-website-src
     :base-extension "org"
     :publishing-directory ,my-website-htdocs
     :publishing-function org-html-publish-to-html
     :section-numbers nil
     :with-toc nil
     :html-head ,my-website-html-head
     :html-preamble ,my-website-html-preamble
     :html-postamble ,my-website-html-postamble
     :description ,my-website-description
     :keywords ,my-website-keywords
     :html-head-include-default-style nil
     :html-head-include-scripts nil
     :time-stamp-file nil
     :with-author nil)

    ("misc"
     :base-directory ,(concat my-website-src "misc/")
     :base-extension "org"
     :publishing-directory ,(concat my-website-htdocs "misc/")
     :publishing-function org-html-publish-to-html
     :section-numbers nil
     :with-toc nil
     :html-head ,my-website-html-head
     :html-preamble ,my-website-html-preamble
     :html-postamble ,my-website-html-postamble
     :description ,my-website-description
     :keywords ,my-website-keywords
     :html-head-include-default-style nil
     :html-head-include-scripts nil
     :time-stamp-file nil
     :with-author nil)

    ("book"
     :base-directory ,(concat my-website-src "book/")
     :base-extension "org"
     :publishing-directory ,(concat my-website-htdocs "book/")
     :publishing-function org-html-publish-to-html
     :section-numbers nil
     :with-toc nil
     :html-head ,my-website-html-head
     :html-preamble ,my-website-html-preamble
     :html-postamble ,my-website-html-postamble
     :description ,my-website-description
     :keywords ,my-website-keywords
     :html-head-include-default-style nil
     :html-head-include-scripts nil
     :time-stamp-file nil
     :with-author nil)

    ("website" :components ("org" "misc" "book"))))
