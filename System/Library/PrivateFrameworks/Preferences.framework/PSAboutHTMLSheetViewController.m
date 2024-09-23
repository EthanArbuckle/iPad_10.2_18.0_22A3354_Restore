@implementation PSAboutHTMLSheetViewController

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = objc_alloc_init(MEMORY[0x1E0CEAC10]);
  objc_msgSend(v8, "setAutoresizingMask:", 18);
  objc_msgSend(v8, "setDelegate:", self);
  objc_msgSend(v8, "setDataDetectorTypes:", 0);
  objc_msgSend(v8, "_setDrawsCheckeredPattern:", 0);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v3);

  objc_msgSend(v8, "_browserView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTilesOpaque:", 0);
  objc_msgSend(v4, "setLoadsSynchronously:", 1);
  objc_msgSend(v4, "setDetectsPhoneNumbers:", 0);
  objc_msgSend(v8, "_scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

  objc_msgSend(v5, "_setShowsBackgroundShadow:", 0);
  objc_msgSend(v5, "setDecelerationRate:", 0.998);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v7);

  -[PSAboutHTMLSheetViewController setView:](self, "setView:", v8);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[PSAboutHTMLSheetViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  v4.receiver = self;
  v4.super_class = (Class)PSAboutHTMLSheetViewController;
  -[PSAboutHTMLSheetViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidBecomeVisible
{
  void *v2;
  id v3;

  -[PSAboutHTMLSheetViewController view](self, "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_scrollView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flashScrollIndicators");

}

- (BOOL)webView:(id)a3 shouldStartLoadWithRequest:(id)a4 navigationType:(int64_t)a5
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  if (!a5)
  {
    v6 = (void *)MEMORY[0x1E0CEA2F8];
    v7 = a4;
    objc_msgSend(v6, "sharedApplication");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "openURL:options:completionHandler:", v9, MEMORY[0x1E0C9AA70], 0);
  }
  return a5 != 0;
}

- (void)donePressed
{
  id v2;

  -[PSAboutHTMLSheetViewController parentViewController](self, "parentViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)setHTMLContent:(id)a3 isFragment:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  v4 = a4;
  v16 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<style type=\"text/css\"> :root { supported-color-schemes: light dark; } body {font: -apple-system-body; word-wrap: break-word;-khtml-nbsp-mode: space;-khtml-line-break: after-white-space; color: -apple-system-label; background-color: -apple-system-background; } </style>"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0C99DC8];
    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "characterDirectionForLanguage:", v10);

    v12 = &stru_1E4A69238;
    if (v11 == 2)
      v12 = CFSTR("; direction: rtl");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v7, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<html><head><meta name=\"viewport\" content=\"width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no\"/>%@</head><body>%@</body></html>"), v13, v16);
    v14 = objc_claimAutoreleasedReturnValue();

    v16 = (id)v14;
  }
  -[PSAboutHTMLSheetViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "loadHTMLString:baseURL:", v16, 0);

}

+ (void)presentAboutSheetTitled:(id)a3 HTMLContent:(id)a4 fromViewController:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v14 = objc_alloc_init((Class)a1);
  objc_msgSend(v14, "setTitle:", v10);

  objc_msgSend(v14, "setHTMLContent:isFragment:", v9, 1);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v14);
  objc_msgSend(v11, "setModalPresentationStyle:", 2);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 0, v14, sel_donePressed);
  objc_msgSend(v14, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRightBarButtonItem:", v12);

  objc_msgSend(v8, "presentViewController:animated:completion:", v11, 1, 0);
}

@end
