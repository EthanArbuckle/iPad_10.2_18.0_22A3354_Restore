@implementation SearchUIWebCardSectionView

- (SearchUIWebCardSectionView)initWithRowModel:(id)a3 feedbackDelegate:(id)a4
{
  SearchUIWebCardSectionView *v4;
  SearchUIWebCardSectionView *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)SearchUIWebCardSectionView;
  v4 = -[SearchUICardSectionView initWithRowModel:feedbackDelegate:](&v21, sel_initWithRowModel_feedbackDelegate_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[SearchUIWebCardSectionView setContentHeight:](v4, "setContentHeight:", 1.0);
    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "setSuppressesIncrementalRendering:", 1);
    objc_msgSend(v6, "_setDrawsBackground:", 0);
    v7 = (void *)objc_opt_new();
    objc_msgSend(v6, "_setCanShowWhileLocked:", 1);
    v8 = objc_alloc(MEMORY[0x1E0CEF610]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("window.onload=function() { %@ %@ %@ };"),
      CFSTR("var SearchUIEntries = document.body.getElementsByTagName('d:entry'); if (SearchUIEntries.length > 0) { var SearchUIFirst = SearchUIEntries[0].children; if (SearchUIFirst.length > 0) { SearchUIFirst[0].style.marginBlockStart = '0px'}; };"),
      CFSTR("var viewport = document.createElement(\"meta\"); viewport.name = \"viewport\"; viewport.content = \"width=device-width, initial-scale=1, user-scalable=no\"; document.head.appendChild(viewport);"),
      CFSTR("window.webkit.messageHandlers.sizeNotification.postMessage({ scrollHeight:document.body.scrollHeight });"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithSource:injectionTime:forMainFrameOnly:", v9, 1, 1);
    objc_msgSend(v7, "addUserScript:", v10);

    v11 = objc_alloc(MEMORY[0x1E0CEF610]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("window.onresize=function() { %@ };"),
      CFSTR("window.webkit.messageHandlers.sizeNotification.postMessage({ scrollHeight:document.body.scrollHeight });"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithSource:injectionTime:forMainFrameOnly:", v12, 1, 1);
    objc_msgSend(v7, "addUserScript:", v13);

    objc_msgSend(v7, "addScriptMessageHandler:name:", v5, CFSTR("sizeNotification"));
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEF700]), "initWithSource:forMainFrameOnly:", CFSTR("\nhtml { -webkit-text-size-adjust: none; text-size-adjust: none; }\n"),
                    1);
    objc_msgSend(v7, "_addUserStyleSheet:", v14);
    objc_msgSend(v6, "setUserContentController:", v7);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEF630]), "initWithFrame:configuration:", v6, 0.0, 0.0, 0.0, 0.0);
    objc_msgSend(v15, "setNavigationDelegate:", v5);
    objc_msgSend(v15, "setAllowsBackForwardNavigationGestures:", 0);
    objc_msgSend(v15, "setAllowsLinkPreview:", 0);
    objc_msgSend(v15, "setUserInteractionEnabled:", 0);
    objc_msgSend(v15, "scrollView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBounces:", 0);

    objc_msgSend(v15, "scrollView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setScrollEnabled:", 0);

    objc_msgSend(v15, "scrollView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setZoomEnabled:", 0);

    objc_msgSend(v6, "setIgnoresViewportScaleLimits:", 1);
    objc_msgSend(v15, "setOpaque:", 0);
    -[SearchUIWebCardSectionView setWebView:](v5, "setWebView:", v15);
    -[SearchUICardSectionView contentView](v5, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addArrangedSubview:", v15);

  }
  return v5;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchUIWebCardSectionView;
  -[SearchUIWebCardSectionView traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[SearchUIWebCardSectionView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4))
  {

LABEL_4:
    -[SearchUIWebCardSectionView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
    goto LABEL_5;
  }
  -[SearchUIWebCardSectionView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_vibrancy");
  v8 = objc_msgSend(v4, "_vibrancy");

  if (v7 != v8)
    goto LABEL_4;
LABEL_5:

}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SearchUIWebCardSectionView;
  -[SearchUIWebCardSectionView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[SearchUIWebCardSectionView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
}

- (void)tlk_updateForAppearance:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SearchUIWebCardSectionView;
  -[SearchUIWebCardSectionView tlk_updateForAppearance:](&v25, sel_tlk_updateForAppearance_, v4);
  -[SearchUICardSectionView rowModel](self, "rowModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "htmlString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringByAppendingString:", CFSTR("<style>body{margin: 0px !important}</style>"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "primaryColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIWebCardSectionView replaceSemanticColor:withColor:inString:](self, "replaceSemanticColor:withColor:inString:", CFSTR("-apple-system-label"), v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUIWebCardSectionView replaceSemanticColor:withColor:inString:](self, "replaceSemanticColor:withColor:inString:", CFSTR("text"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUIWebCardSectionView replaceSemanticColor:withColor:inString:](self, "replaceSemanticColor:withColor:inString:", CFSTR("CanvasText"), v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUIWebCardSectionView replaceSemanticColor:withColor:inString:](self, "replaceSemanticColor:withColor:inString:", CFSTR("linkColor"), v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "secondaryColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIWebCardSectionView replaceSemanticColor:withColor:inString:](self, "replaceSemanticColor:withColor:inString:", CFSTR("-apple-system-secondary-label"), v14, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "tertiaryColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIWebCardSectionView replaceSemanticColor:withColor:inString:](self, "replaceSemanticColor:withColor:inString:", CFSTR("-apple-system-tertiary-label"), v16, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "quaternaryColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIWebCardSectionView replaceSemanticColor:withColor:inString:](self, "replaceSemanticColor:withColor:inString:", CFSTR("window"), v18, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isDark") & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIWebCardSectionView replaceSemanticColor:withColor:inString:](self, "replaceSemanticColor:withColor:inString:", CFSTR("-apple-system-text-background"), v20, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUIWebCardSectionView webView](self, "webView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (id)objc_msgSend(v22, "loadHTMLString:baseURL:", v21, 0);

  -[SearchUIWebCardSectionView webView](self, "webView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enableAppearanceForView:", v24);

}

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4
{
  void *v5;
  void *v6;
  float v7;
  double v8;
  double v9;
  void *v10;

  objc_msgSend(a4, "body", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", CFSTR("scrollHeight"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  v8 = v7;

  -[SearchUIWebCardSectionView contentHeight](self, "contentHeight");
  if (v9 != v8)
  {
    -[SearchUIWebCardSectionView setContentHeight:](self, "setContentHeight:", v8);
    -[SearchUIWebCardSectionView webView](self, "webView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "invalidateIntrinsicContentSize");

    -[SearchUICardSectionView didInvalidateSizeAnimate:](self, "didInvalidateSizeAnimate:", 0);
  }
}

- (id)replaceSemanticColor:(id)a3 withColor:(id)a4 inString:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  double v18;
  double v19;
  double v20;

  v7 = a3;
  v8 = a5;
  v19 = 0.0;
  v20 = 0.0;
  v17 = 0;
  v18 = 0.0;
  objc_msgSend(a4, "getRed:green:blue:alpha:", &v20, &v19, &v18, &v17);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rgba(%d, %d, %d, %f)"), (int)(v20 * 255.0), (int)(v19 * 255.0), (int)(v18 * 255.0), v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "hasPrefix:", CFSTR("-apple-system-")))
  {
    objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("color: %@"), v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("color: %@"), v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", v12, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("color : %@"), v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", v14, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v15;
    v10 = v8;
  }

  return v10;
}

- (id)setupContentView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setMaximumLayoutSize:", 2147483650.0, 2147483650.0);
  objc_msgSend(v3, "setDelegate:", self);
  objc_msgSend(v3, "setLayoutMarginsRelativeArrangement:", 1);
  objc_msgSend(MEMORY[0x1E0DBDA50], "defaultLayoutMargins");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[SearchUIWebCardSectionView webView](self, "webView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layoutMargins");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  objc_msgSend(v3, "setLayoutMargins:", v5 - v14, v7 - v16, v9 - v18, v11 - v20);
  return v3;
}

- (CGSize)containerView:(id)a3 systemLayoutSizeFittingSize:(CGSize)a4 forArrangedSubview:(id)a5
{
  double width;
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  _QWORD block[5];
  CGSize result;

  width = a4.width;
  v7 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    objc_msgSend(v8, "frame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    -[SearchUIWebCardSectionView webView](self, "webView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "layoutMargins");
    v19 = v18;
    v21 = v20;

    -[SearchUIWebCardSectionView contentHeight](self, "contentHeight");
    v23 = v19 + v22;
    if (v14 != width)
    {
      objc_msgSend(v8, "setFrame:", v10, v12, width, v16);
      objc_msgSend(v8, "invalidateIntrinsicContentSize");
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __91__SearchUIWebCardSectionView_containerView_systemLayoutSizeFittingSize_forArrangedSubview___block_invoke;
      block[3] = &unk_1EA1F62F0;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
    v24 = v21 + v23;

  }
  else
  {
    width = *MEMORY[0x1E0CFAA88];
    v24 = *(double *)(MEMORY[0x1E0CFAA88] + 8);
  }

  v25 = width;
  v26 = v24;
  result.height = v26;
  result.width = v25;
  return result;
}

uint64_t __91__SearchUIWebCardSectionView_containerView_systemLayoutSizeFittingSize_forArrangedSubview___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didInvalidateSizeAnimate:", 0);
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  objc_msgSend(a3, "invalidateIntrinsicContentSize");
  -[SearchUICardSectionView didInvalidateSizeAnimate:](self, "didInvalidateSizeAnimate:", 0);
}

- (double)contentHeight
{
  return self->_contentHeight;
}

- (void)setContentHeight:(double)a3
{
  self->_contentHeight = a3;
}

- (WKWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
  objc_storeStrong((id *)&self->_webView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webView, 0);
}

@end
