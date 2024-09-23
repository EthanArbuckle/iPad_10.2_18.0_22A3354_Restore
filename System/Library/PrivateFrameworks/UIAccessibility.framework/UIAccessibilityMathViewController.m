@implementation UIAccessibilityMathViewController

- (UIAccessibilityMathViewController)initWithMathDictionary:(id)a3
{
  id v5;
  UIAccessibilityMathViewController *v6;
  UIAccessibilityMathViewController *v7;
  void *v8;
  id v9;
  uint64_t v10;
  SCRCMathExpression *mathExpression;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)UIAccessibilityMathViewController;
  v6 = -[UIAccessibilityMathViewController init](&v23, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mathDictionary, a3);
    v25 = 0;
    v26 = &v25;
    v27 = 0x2050000000;
    v8 = (void *)getSCRCMathExpressionClass_softClass;
    v28 = getSCRCMathExpressionClass_softClass;
    if (!getSCRCMathExpressionClass_softClass)
    {
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __getSCRCMathExpressionClass_block_invoke;
      v24[3] = &unk_1E3DFDD78;
      v24[4] = &v25;
      __getSCRCMathExpressionClass_block_invoke((uint64_t)v24);
      v8 = (void *)v26[3];
    }
    v9 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v25, 8);
    objc_msgSend(v9, "mathExpressionWithDictionary:", v5);
    v10 = objc_claimAutoreleasedReturnValue();
    mathExpression = v7->_mathExpression;
    v7->_mathExpression = (SCRCMathExpression *)v10;

    v12 = objc_alloc(MEMORY[0x1E0CEA380]);
    UIAccessibilityBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("DONE"), &stru_1E3E01CE0, CFSTR("Localized"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v12, "initWithTitle:style:target:action:", v14, 0, v7, sel__doneButtonTapped);

    -[UIAccessibilityMathViewController _styleBarButtonItem:](v7, "_styleBarButtonItem:", v15);
    -[UIAccessibilityMathViewController navigationItem](v7, "navigationItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setRightBarButtonItem:", v15);

    v17 = objc_alloc(MEMORY[0x1E0CEA380]);
    UIAccessibilityBundle();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("BACK"), &stru_1E3E01CE0, CFSTR("Localized"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v17, "initWithTitle:style:target:action:", v19, 0, 0, 0);

    -[UIAccessibilityMathViewController _styleBarButtonItem:](v7, "_styleBarButtonItem:", v20);
    -[UIAccessibilityMathViewController navigationItem](v7, "navigationItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setBackBarButtonItem:", v20);

  }
  return v7;
}

- (void)loadView
{
  UIAccessibilityMathWebView *v3;
  UIAccessibilityMathWebView *webView;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIAccessibilityMathViewController;
  -[UIAccessibilityMathViewController loadView](&v6, sel_loadView);
  v3 = objc_alloc_init(UIAccessibilityMathWebView);
  webView = self->_webView;
  self->_webView = v3;

  -[UIAccessibilityMathWebView setNavigationDelegate:](self->_webView, "setNavigationDelegate:", self);
  -[UIAccessibilityMathWebView scrollView](self->_webView, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setScrollEnabled:", 0);

  -[UIAccessibilityMathViewController setView:](self, "setView:", self->_webView);
}

- (void)viewDidLoad
{
  UIAccessibilityMathWebView *webView;
  void *v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIAccessibilityMathViewController;
  -[UIAccessibilityMathViewController viewDidLoad](&v6, sel_viewDidLoad);
  webView = self->_webView;
  -[UIAccessibilityMathViewController _htmlString](self, "_htmlString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)-[UIAccessibilityMathWebView loadHTMLString:baseURL:](webView, "loadHTMLString:baseURL:", v4, 0);

}

- (id)_htmlString
{
  uint64_t v3;
  void *v4;
  void *v5;
  __CFString *v6;

  if (_htmlString_onceToken != -1)
    dispatch_once(&_htmlString_onceToken, &__block_literal_global_15);
  v3 = _htmlString_HTMLFormat;
  if (_htmlString_HTMLFormat)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[SCRCMathExpression mathMLString](self->_mathExpression, "mathMLString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", v3, v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = &stru_1E3E01CE0;
  }
  return v6;
}

void __48__UIAccessibilityMathViewController__htmlString__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  UIAccessibilityBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLForResource:withExtension:", CFSTR("UIAccessibilityMathExpressionFormat"), CFSTR("html"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    v5 = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfURL:encoding:error:", v1, 4, &v5);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = v5;
    v4 = (void *)_htmlString_HTMLFormat;
    _htmlString_HTMLFormat = v2;

    if (v3)
      _AXLogWithFacility();

  }
  else
  {
    _AXLogWithFacility();
  }

}

- (void)_doneButtonTapped
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityPresentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_styleBarButtonItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShadowColor:", v5);

  v9[0] = *MEMORY[0x1E0CEA098];
  objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithName:size:", CFSTR("Helvetica-Bold"), 12.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v9[1] = *MEMORY[0x1E0CEA0A0];
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = *MEMORY[0x1E0CEA0F0];
  v10[1] = v7;
  v10[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitleTextAttributes:forState:", v8, 0);

}

- (NSDictionary)mathDictionary
{
  return self->_mathDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mathDictionary, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_mathExpression, 0);
}

@end
