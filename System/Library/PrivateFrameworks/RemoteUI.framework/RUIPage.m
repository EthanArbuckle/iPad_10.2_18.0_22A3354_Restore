@implementation RUIPage

- (RUIPage)initWithAttributes:(id)a3
{
  id v4;
  RUIPage *v5;
  RUIPage *v6;

  v4 = a3;
  v5 = -[RUIPage init](self, "init");
  v6 = v5;
  if (v5)
    -[RUIPage setAttributes:](v5, "setAttributes:", v4);

  return v6;
}

- (RUIPage)init
{
  RUIPage *v2;
  uint64_t v3;
  RUIStyle *style;
  uint64_t v5;
  NSMutableArray *elementProviders;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RUIPage;
  v2 = -[RUIPage initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, 0, 0);
  if (v2)
  {
    +[RUIStyle defaultStyle](RUIStyle, "defaultStyle");
    v3 = objc_claimAutoreleasedReturnValue();
    style = v2->_style;
    v2->_style = (RUIStyle *)v3;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    elementProviders = v2->_elementProviders;
    v2->_elementProviders = (NSMutableArray *)v5;

  }
  return v2;
}

- (NSString)activityIndicatorStyle
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  NSString *v5;

  -[RUIPage attributes](self, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("activityIndicatorStyle"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = CFSTR("activeElement");
  v5 = v3;

  return v5;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p id='%@', title='%@'>"), objc_opt_class(), self, self->_pageID, self->_navTitle);
}

- (void)setLoading:(BOOL)a3
{
  if (self->_loading != a3)
  {
    self->_loading = a3;
    -[RUIPage _updateLoadingUI](self, "_updateLoadingUI");
  }
}

- (void)setLoadingTitle:(id)a3
{
  NSString *v4;
  NSString *loadingTitle;

  if (self->_loadingTitle != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    loadingTitle = self->_loadingTitle;
    self->_loadingTitle = v4;

    -[RUIPage _updateLoadingUI](self, "_updateLoadingUI");
  }
}

- (BOOL)navBarIndicatorHidesLeftButton
{
  void *v2;
  char v3;

  -[RUIBarButtonItem itemType](self->_leftNavigationBarButtonItem, "itemType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("titleBarItem")) ^ 1;

  return v3;
}

- (void)updatePreferredContentSize
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  NSObject *v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  int v56;
  double v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  if (-[RUIPage isPrimaryElementNilOrKindOf:](self, "isPrimaryElementNilOrKindOf:", objc_opt_class()))
  {
    -[RUIPage navigationController](self, "navigationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[RUIPage navigationController](self, "navigationController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "ruiModalPresentationStyle") == 2 && -[RUIPage hasTableView](self, "hasTableView"))
      {
        -[RUIPage tableViewOM](self, "tableViewOM");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "tableView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "frame");
        v9 = v8;
        v11 = v10;
        v13 = v12;
        v15 = v14;

        -[RUIPage tableViewOM](self, "tableViewOM");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "tableView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "beginUpdates");

        -[RUIPage tableViewOM](self, "tableViewOM");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "tableView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "endUpdates");

        -[RUIPage tableViewOM](self, "tableViewOM");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "tableView");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "layoutIfNeeded");

        -[UIView convertRect:fromView:](self->_containerView, "convertRect:fromView:", self->_containerView, v9, v11, v13, v15);
        v23 = v22;
        -[RUIPage elementProvider](self, "elementProvider");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "tableViewOM");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "tableView");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "contentSize");
        v28 = v27;
        -[RUIPage elementProvider](self, "elementProvider");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "tableViewOM");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "tableView");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "contentInset");
        v33 = v32;
        v34 = v23 + v28;

        if (_isInternalInstall())
        {
          _RUILoggingFacility();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            -[RUIPage elementProvider](self, "elementProvider");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "tableViewOM");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "tableView");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "window");
            v39 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
            v56 = 138412290;
            v57 = v39;
            _os_log_impl(&dword_209E87000, v35, OS_LOG_TYPE_DEFAULT, ">> window: %@", (uint8_t *)&v56, 0xCu);

          }
        }
        v40 = v34 + v33;
        if (_isInternalInstall())
        {
          _RUILoggingFacility();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            -[RUIPage elementProvider](self, "elementProvider");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "tableViewOM");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "tableView");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "adjustedContentInset");
            v56 = 134217984;
            v57 = v45;
            _os_log_impl(&dword_209E87000, v41, OS_LOG_TYPE_DEFAULT, ">> adjustedContentInset: %f", (uint8_t *)&v56, 0xCu);

          }
        }
        v46 = v40 + 0.0;
        if (_isInternalInstall())
        {
          _RUILoggingFacility();
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            v56 = 134217984;
            v57 = v46;
            _os_log_impl(&dword_209E87000, v47, OS_LOG_TYPE_DEFAULT, ">> preferredContentSize: %f", (uint8_t *)&v56, 0xCu);
          }

        }
        -[RUIPage preferredContentSize](self, "preferredContentSize");
        if (v49 != v13 || v48 != v46)
          -[RUIPage setPreferredContentSize:](self, "setPreferredContentSize:", v13, v46);
        -[RUIPage navigationController](self, "navigationController");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "preferredContentSize");
        v52 = v51;
        v54 = v53;

        if (v52 != v13 || v54 != v46)
        {
          -[RUIPage navigationController](self, "navigationController");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "setPreferredContentSize:", v13, v46);

        }
      }

    }
  }
}

- (void)_updateLoadingUI
{
  NSString *v3;
  void *v4;
  char v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  UIView *containerView;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSString *v39;

  v39 = self->_navTitle;
  v3 = self->_navSubTitle;
  -[RUIPage activityIndicatorStyle](self, "activityIndicatorStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("navbar"));

  if ((v5 & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    -[RUIPage activityIndicatorStyle](self, "activityIndicatorStyle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("default"));

    if (v8)
    {
      -[RUIPage objectModel](self, "objectModel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "activeElement");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v10, "wantsInlineActivityIndicator") ^ 1;

    }
    else
    {
      v6 = 0;
    }
  }
  if (-[NSString length](self->_loadingTitle, "length"))
  {
    v11 = self->_loading ? v6 : 0;
    if (v11 == 1)
    {
      v12 = self->_loadingTitle;

      v39 = v12;
    }
  }
  if (self->_showsTitlesAsHeaderViews
    && (-[RUIPage hasTableView](self, "hasTableView")
     || -[RUIPage hasPasscodeView](self, "hasPasscodeView")
     || (-[RUIPage primaryElement](self, "primaryElement"),
         v13 = (void *)objc_claimAutoreleasedReturnValue(),
         v13,
         v13)))
  {
    -[RUIPage navigationItem](self, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTitle:", 0);

    -[RUIPage elementProvider](self, "elementProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "tableViewOM");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setHeaderTitle:", v39);

    -[RUIPage elementProvider](self, "elementProvider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "tableViewOM");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setSubHeaderTitle:", v3);

    -[RUIPage elementProvider](self, "elementProvider");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "passcodeViewOM");
    v20 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v20, "setHeaderTitle:", v39);

    -[RUIPage primaryElement](self, "primaryElement");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v20) = objc_opt_respondsToSelector();

    if ((v20 & 1) == 0)
      goto LABEL_21;
    -[RUIPage primaryElement](self, "primaryElement");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    v24 = v39;
  }
  else
  {
    -[RUIPage navigationItem](self, "navigationItem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setTitle:", v39);

    -[RUIPage elementProvider](self, "elementProvider");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "tableViewOM");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setHeaderTitle:", 0);

    -[RUIPage elementProvider](self, "elementProvider");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "tableViewOM");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setSubHeaderTitle:", 0);

    -[RUIPage elementProvider](self, "elementProvider");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "passcodeViewOM");
    v31 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v31, "setHeaderTitle:", 0);

    -[RUIPage primaryElement](self, "primaryElement");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v31) = objc_opt_respondsToSelector();

    if ((v31 & 1) == 0)
      goto LABEL_21;
    -[RUIPage primaryElement](self, "primaryElement");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    v24 = 0;
  }
  objc_msgSend(v22, "setTitle:", v24);

LABEL_21:
  -[RUIPage _reloadTitleLabel](self, "_reloadTitleLabel");
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("RUIPage:%p"), self);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    containerView = self->_containerView;
    if (self->_loading)
    {
      -[UIView setUserInteractionEnabled:](containerView, "setUserInteractionEnabled:", 0);
      +[RUINavBarSpinnerManager sharedSpinnerManager](RUINavBarSpinnerManager, "sharedSpinnerManager");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[RUIPage style](self, "style");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setActivityIndicatorViewStyle:", objc_msgSend(v36, "navBarActivityIndicatorStyle"));

      +[RUINavBarSpinnerManager sharedSpinnerManager](RUINavBarSpinnerManager, "sharedSpinnerManager");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[RUIPage navigationItem](self, "navigationItem");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "startAnimatingInNavItem:title:forIdentifier:hideBackButton:hideLeftItems:", v38, 0, v33, 1, -[RUIPage navBarIndicatorHidesLeftButton](self, "navBarIndicatorHidesLeftButton"));

    }
    else
    {
      -[UIView setUserInteractionEnabled:](containerView, "setUserInteractionEnabled:", 1);
      +[RUINavBarSpinnerManager sharedSpinnerManager](RUINavBarSpinnerManager, "sharedSpinnerManager");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "stopAnimatingForIdentifier:", v33);
    }

  }
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)RUIPage;
  v4 = a3;
  -[RUIPage preferredContentSizeDidChangeForChildContentContainer:](&v9, sel_preferredContentSizeDidChangeForChildContentContainer_, v4);
  objc_msgSend(v4, "preferredContentSize", v9.receiver, v9.super_class);
  v6 = v5;
  v8 = v7;

  -[RUIPage setPreferredContentSize:](self, "setPreferredContentSize:", v6, v8);
}

- (void)setNavTitle:(id)a3
{
  NSString *v4;
  NSString *navTitle;

  if (self->_navTitle != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    navTitle = self->_navTitle;
    self->_navTitle = v4;

    -[RUIPage _updateLoadingUI](self, "_updateLoadingUI");
  }
}

- (void)setNavSubTitle:(id)a3
{
  NSString *v4;
  NSString *navSubTitle;

  if (self->_navSubTitle != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    navSubTitle = self->_navSubTitle;
    self->_navSubTitle = v4;

    -[RUIPage _updateLoadingUI](self, "_updateLoadingUI");
  }
}

- (void)setBackButtonTitle:(id)a3
{
  void *v5;
  void *v6;
  NSString *v7;

  v7 = (NSString *)a3;
  if (self->_backButtonTitle != v7)
  {
    objc_storeStrong((id *)&self->_backButtonTitle, a3);
    -[RUIPage navigationItem](self, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "backBarButtonItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:", v7);

  }
}

- (void)setShowsTitlesAsHeaderViews:(BOOL)a3
{
  if (self->_showsTitlesAsHeaderViews != a3)
  {
    self->_showsTitlesAsHeaderViews = a3;
    -[RUIPage _updateLoadingUI](self, "_updateLoadingUI");
  }
}

- (UILabel)titleLabel
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[RUIPage primaryElement](self, "primaryElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[RUIPage primaryElement](self, "primaryElement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (UILabel *)v6;
}

- (void)setTitleLabelPadding:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  void *v8;
  void *v9;
  id v10;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  if (-[RUIPage hasTableView](self, "hasTableView"))
  {
    -[RUIPage elementProvider](self, "elementProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tableViewOM");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "headerView");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v10, "setMargins:", top, left, bottom, right);

  }
}

- (UIEdgeInsets)titleLabelPadding
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  UIEdgeInsets result;

  if (!-[RUIPage hasTableView](self, "hasTableView"))
    goto LABEL_5;
  -[RUIPage elementProvider](self, "elementProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tableViewOM");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "headerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_5:
    v7 = *MEMORY[0x24BEBE158];
    v9 = *(double *)(MEMORY[0x24BEBE158] + 8);
    v11 = *(double *)(MEMORY[0x24BEBE158] + 16);
    v13 = *(double *)(MEMORY[0x24BEBE158] + 24);
    goto LABEL_6;
  }
  objc_msgSend(v5, "margins");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

LABEL_6:
  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (void)_reloadTitleLabel
{
  void *v3;
  void *v4;
  id v5;

  if (-[RUIPage hasTableView](self, "hasTableView"))
  {
    -[RUIPage elementProvider](self, "elementProvider");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tableViewOM");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reloadData");

  }
}

- (void)setHidesBackButton:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_hidesBackButton = a3;
  -[RUIPage navigationItem](self, "navigationItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidesBackButton:", v3);

}

- (void)setHasToolbar
{
  id v3;
  UIToolbar *v4;
  UIToolbar *toolbar;

  if (!self->_toolbar)
  {
    v3 = objc_alloc(MEMORY[0x24BEBDA90]);
    v4 = (UIToolbar *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    toolbar = self->_toolbar;
    self->_toolbar = v4;

    -[UIView addSubview:](self->_containerView, "addSubview:", self->_toolbar);
  }
}

- (BOOL)needsToShowToolbarInPrefsAppRoot
{
  return self->_toolbar == 0;
}

- (void)setValue:(id)a3 forField:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *elementProviders;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  elementProviders = self->_elementProviders;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __29__RUIPage_setValue_forField___block_invoke;
  v11[3] = &unk_24C2978A8;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  -[NSMutableArray enumerateObjectsUsingBlock:](elementProviders, "enumerateObjectsUsingBlock:", v11);

}

void __29__RUIPage_setValue_forField___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "tableViewOM");
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v3, "rowWithIdentifier:", *(_QWORD *)(a1 + 32));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_opt_isKindOfClass();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(v6, "setValueFromString:", *(_QWORD *)(a1 + 40));
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "stringValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValueFromString:", v5);

  }
}

- (void)setCustomMargin:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  UIView *v8;
  UIView *containerView;
  UIView *v10;

  self->_customMargin = a3;
  -[RUIPage elementProvider](self, "elementProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tableViewOM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tableView");
  v10 = (UIView *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (a3 >= 0.0)
    {
      -[UIView setClipsToBounds:](v10, "setClipsToBounds:", 0);
      -[UIView setScrollIndicatorInsets:](v10, "setScrollIndicatorInsets:", 0.0, 0.0, 0.0, -a3);
      containerView = self->_containerView;
      -[UIView panGestureRecognizer](v10, "panGestureRecognizer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = containerView;
    }
    else
    {
      -[UIView setClipsToBounds:](v10, "setClipsToBounds:", 1);
      -[UIView setScrollIndicatorInsets:](v10, "setScrollIndicatorInsets:", *MEMORY[0x24BEBE158], *(double *)(MEMORY[0x24BEBE158] + 8), *(double *)(MEMORY[0x24BEBE158] + 16), *(double *)(MEMORY[0x24BEBE158] + 24));
      -[UIView panGestureRecognizer](v10, "panGestureRecognizer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v10;
    }
    -[UIView addGestureRecognizer:](v8, "addGestureRecognizer:", v7);

  }
}

- (NSArray)buttonItems
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_leftNavigationBarButtonItem)
    objc_msgSend(v3, "addObject:");
  if (self->_rightNavigationBarButtonItem)
    objc_msgSend(v4, "addObject:");
  if (self->_leftToolbarButtonItem)
    objc_msgSend(v4, "addObject:");
  if (self->_rightToolbarButtonItem)
    objc_msgSend(v4, "addObject:");
  if (self->_middleToolbarButtonItem)
    objc_msgSend(v4, "addObject:");
  return (NSArray *)v4;
}

- (void)setButton:(id)a3 enabled:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "objectForKey:", CFSTR("position"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("parentBar"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isEqualToString:", CFSTR("navigationBar")))
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("right")))
    {
      -[RUIPage navigationItem](self, "navigationItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "rightBarButtonItem");
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v12 = (id)v10;

      v11 = v12;
      goto LABEL_15;
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("left")))
    {
      -[RUIPage navigationItem](self, "navigationItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "leftBarButtonItem");
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_14:
    v11 = 0;
    goto LABEL_15;
  }
  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("toolbar")))
    goto LABEL_14;
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("right")))
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("left")))
    {
      -[RUIPage leftToolbarItem](self, "leftToolbarItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("center")))
    {
      -[RUIPage middleToolbarItem](self, "middleToolbarItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  -[RUIPage rightToolbarItem](self, "rightToolbarItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
  v13 = v11;
  objc_msgSend(v11, "setEnabled:", v4);

}

- (void)setRightNavigationBarButtonItem:(id)a3 barButtonItem:(id)a4
{
  RUIBarButtonItem *v7;
  id v8;
  void *v9;
  RUIBarButtonItem *v10;

  v7 = (RUIBarButtonItem *)a3;
  if (self->_rightNavigationBarButtonItem != v7)
  {
    v10 = v7;
    objc_storeStrong((id *)&self->_rightNavigationBarButtonItem, a3);
    v8 = a4;
    -[RUIPage navigationItem](self, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRightBarButtonItem:", v8);

    v7 = v10;
  }

}

- (void)setRightNavigationBarButtonItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __43__RUIPage_setRightNavigationBarButtonItem___block_invoke;
  v9 = &unk_24C297688;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v4, "setAction:", &v6);
  objc_msgSend(v4, "barButtonItem", v6, v7, v8, v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RUIPage setRightNavigationBarButtonItem:barButtonItem:](self, "setRightNavigationBarButtonItem:barButtonItem:", v4, v5);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __43__RUIPage_setRightNavigationBarButtonItem___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_rightNavigationBarButtonPressed:", 0);

}

- (void)setLeftNavigationBarButtonItem:(id)a3 barButtonItem:(id)a4
{
  RUIBarButtonItem *v7;
  id v8;
  void *v9;
  RUIBarButtonItem *v10;

  v7 = (RUIBarButtonItem *)a3;
  if (self->_leftNavigationBarButtonItem != v7)
  {
    v10 = v7;
    objc_storeStrong((id *)&self->_leftNavigationBarButtonItem, a3);
    v8 = a4;
    -[RUIPage navigationItem](self, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLeftBarButtonItem:", v8);

    v7 = v10;
  }

}

- (void)setLeftNavigationBarButtonItem:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_msgSend(v4, "itemType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("tapToRadarBarItem"));

  if ((v6 & 1) == 0)
  {
    v8 = MEMORY[0x24BDAC760];
    v9 = 3221225472;
    v10 = __42__RUIPage_setLeftNavigationBarButtonItem___block_invoke;
    v11 = &unk_24C297688;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v4, "setAction:", &v8);
    objc_destroyWeak(&v12);
  }
  objc_msgSend(v4, "barButtonItem", v8, v9, v10, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RUIPage setLeftNavigationBarButtonItem:barButtonItem:](self, "setLeftNavigationBarButtonItem:barButtonItem:", v4, v7);

  objc_destroyWeak(&location);
}

void __42__RUIPage_setLeftNavigationBarButtonItem___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_leftNavigationBarButtonPressed:", 0);

}

- (id)flexibleSpace
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
}

- (void)_updateToolbar
{
  UIBarButtonItem *v3;
  UIBarButtonItem *middleFlexSpace;
  UIBarButtonItem *v5;
  UIBarButtonItem *leftFlexSpace;
  UIBarButtonItem *leftToolbarItem;
  UIBarButtonItem *v8;
  UIBarButtonItem *rightToolbarItem;
  UIBarButtonItem *v10;
  UIBarButtonItem *v11;
  UIBarButtonItem *v12;
  UIBarButtonItem *v13;
  UIBarButtonItem *v14;
  UIBarButtonItem *v15;
  UIBarButtonItem *v16;
  UIBarButtonItem *v17;
  void *v18;
  UIBarButtonItem *middleToolbarItem;
  void *v20;
  void *v21;
  _QWORD *v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[3];
  _QWORD v26[5];
  _QWORD v27[4];

  v27[3] = *MEMORY[0x24BDAC8D0];
  if (!self->_middleFlexSpace)
  {
    -[RUIPage flexibleSpace](self, "flexibleSpace");
    v3 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();
    middleFlexSpace = self->_middleFlexSpace;
    self->_middleFlexSpace = v3;

  }
  if (!self->_leftFlexSpace)
  {
    -[RUIPage flexibleSpace](self, "flexibleSpace");
    v5 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();
    leftFlexSpace = self->_leftFlexSpace;
    self->_leftFlexSpace = v5;

  }
  leftToolbarItem = self->_leftToolbarItem;
  if (!leftToolbarItem)
    leftToolbarItem = self->_leftFlexSpace;
  v8 = leftToolbarItem;
  rightToolbarItem = self->_rightToolbarItem;
  if (rightToolbarItem)
  {
    v10 = rightToolbarItem;
  }
  else
  {
    -[RUIPage flexibleSpace](self, "flexibleSpace");
    v10 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
  if (self->_middleToolbarItem)
  {
    v12 = self->_leftToolbarItem;
    if (!v12)
      v12 = self->_leftFlexSpace;
    v13 = v12;
    v14 = self->_rightToolbarItem;
    if (v14)
    {
      v15 = v14;
    }
    else
    {
      -[RUIPage flexibleSpace](self, "flexibleSpace");
      v15 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();
    }
    v17 = v15;
    if (self->_leftToolbarItem || self->_rightToolbarItem)
    {
      v26[0] = v13;
      -[RUIPage flexibleSpace](self, "flexibleSpace");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      middleToolbarItem = self->_middleToolbarItem;
      v26[1] = v18;
      v26[2] = middleToolbarItem;
      -[RUIPage flexibleSpace](self, "flexibleSpace");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v26[3] = v20;
      v26[4] = v17;
      v21 = (void *)MEMORY[0x24BDBCE30];
      v22 = v26;
      v23 = 5;
    }
    else
    {
      -[RUIPage flexibleSpace](self, "flexibleSpace");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[RUIPage flexibleSpace](self, "flexibleSpace", v18, self->_middleToolbarItem);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v25[2] = v20;
      v21 = (void *)MEMORY[0x24BDBCE30];
      v22 = v25;
      v23 = 3;
    }
    objc_msgSend(v21, "arrayWithObjects:count:", v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIToolbar setItems:](self->_toolbar, "setItems:", v24);

  }
  else
  {
    v16 = self->_middleFlexSpace;
    v27[0] = v8;
    v27[1] = v16;
    v27[2] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 3);
    v13 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();
    -[UIToolbar setItems:](self->_toolbar, "setItems:", v13);
  }

}

- (void)setRightToolbarButtonItem:(id)a3
{
  RUIBarButtonItem *v5;
  id *p_rightToolbarButtonItem;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  v5 = (RUIBarButtonItem *)a3;
  p_rightToolbarButtonItem = (id *)&self->_rightToolbarButtonItem;
  if (self->_rightToolbarButtonItem != v5)
  {
    objc_storeStrong((id *)&self->_rightToolbarButtonItem, a3);
    objc_initWeak(&location, self);
    v7 = *p_rightToolbarButtonItem;
    v9 = MEMORY[0x24BDAC760];
    v10 = 3221225472;
    v11 = __37__RUIPage_setRightToolbarButtonItem___block_invoke;
    v12 = &unk_24C297688;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v7, "setAction:", &v9);
    objc_msgSend(*p_rightToolbarButtonItem, "barButtonItem", v9, v10, v11, v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIPage setRightToolbarItem:](self, "setRightToolbarItem:", v8);

    -[RUIPage _updateToolbar](self, "_updateToolbar");
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

void __37__RUIPage_setRightToolbarButtonItem___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_rightToolbarButtonPressed:", 0);

}

- (void)setMiddleToolbarButtonItem:(id)a3
{
  RUIBarButtonItem *v5;
  id *p_middleToolbarButtonItem;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  v5 = (RUIBarButtonItem *)a3;
  p_middleToolbarButtonItem = (id *)&self->_middleToolbarButtonItem;
  if (self->_middleToolbarButtonItem != v5)
  {
    objc_storeStrong((id *)&self->_middleToolbarButtonItem, a3);
    objc_initWeak(&location, self);
    v7 = *p_middleToolbarButtonItem;
    v9 = MEMORY[0x24BDAC760];
    v10 = 3221225472;
    v11 = __38__RUIPage_setMiddleToolbarButtonItem___block_invoke;
    v12 = &unk_24C297688;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v7, "setAction:", &v9);
    objc_msgSend(*p_middleToolbarButtonItem, "barButtonItem", v9, v10, v11, v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIPage setMiddleToolbarItem:](self, "setMiddleToolbarItem:", v8);

    -[RUIPage _updateToolbar](self, "_updateToolbar");
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

void __38__RUIPage_setMiddleToolbarButtonItem___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_middleToolbarButtonPressed:", 0);

}

- (void)setLeftToolbarButtonItem:(id)a3
{
  RUIBarButtonItem *v5;
  id *p_leftToolbarButtonItem;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  v5 = (RUIBarButtonItem *)a3;
  p_leftToolbarButtonItem = (id *)&self->_leftToolbarButtonItem;
  if (self->_leftToolbarButtonItem != v5)
  {
    objc_storeStrong((id *)&self->_leftToolbarButtonItem, a3);
    objc_initWeak(&location, self);
    v7 = *p_leftToolbarButtonItem;
    v9 = MEMORY[0x24BDAC760];
    v10 = 3221225472;
    v11 = __36__RUIPage_setLeftToolbarButtonItem___block_invoke;
    v12 = &unk_24C297688;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v7, "setAction:", &v9);
    objc_msgSend(*p_leftToolbarButtonItem, "barButtonItem", v9, v10, v11, v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIPage setLeftToolbarItem:](self, "setLeftToolbarItem:", v8);

    -[RUIPage _updateToolbar](self, "_updateToolbar");
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

void __36__RUIPage_setLeftToolbarButtonItem___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_leftToolbarButtonPressed:", 0);

}

- (void)setRightToolbarButton:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_opt_new();
  objc_msgSend(v5, "setAttributes:", v4);

  -[RUIPage setRightToolbarButtonItem:](self, "setRightToolbarButtonItem:", v5);
}

- (NSDictionary)rightToolbarButton
{
  return -[RUIElement attributes](self->_rightToolbarButtonItem, "attributes");
}

- (void)setMiddleToolbarButton:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_opt_new();
  objc_msgSend(v5, "setAttributes:", v4);

  -[RUIPage setMiddleToolbarButtonItem:](self, "setMiddleToolbarButtonItem:", v5);
}

- (NSDictionary)middleToolbarButton
{
  return -[RUIElement attributes](self->_middleToolbarButtonItem, "attributes");
}

- (void)setLeftToolbarButton:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_opt_new();
  objc_msgSend(v5, "setAttributes:", v4);

  -[RUIPage setLeftToolbarButtonItem:](self, "setLeftToolbarButtonItem:", v5);
}

- (NSDictionary)leftToolbarButton
{
  return -[RUIElement attributes](self->_leftToolbarButtonItem, "attributes");
}

- (void)setRightNavigationBarButton:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_opt_new();
  objc_msgSend(v5, "setAttributes:", v4);

  -[RUIPage setRightNavigationBarButtonItem:](self, "setRightNavigationBarButtonItem:", v5);
}

- (NSDictionary)rightNavigationBarButton
{
  return -[RUIElement attributes](self->_rightNavigationBarButtonItem, "attributes");
}

- (void)setLeftNavigationBarButton:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_opt_new();
  objc_msgSend(v5, "setAttributes:", v4);

  -[RUIPage setLeftNavigationBarButtonItem:](self, "setLeftNavigationBarButtonItem:", v5);
}

- (NSDictionary)leftNavigationBarButton
{
  return -[RUIElement attributes](self->_leftNavigationBarButtonItem, "attributes");
}

- (NSArray)buttons
{
  void *v3;
  RUIBarButtonItem *leftNavigationBarButtonItem;
  void *v5;
  RUIBarButtonItem *rightNavigationBarButtonItem;
  void *v7;
  RUIBarButtonItem *leftToolbarButtonItem;
  void *v9;
  RUIBarButtonItem *rightToolbarButtonItem;
  void *v11;
  RUIBarButtonItem *middleToolbarButtonItem;
  void *v13;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  leftNavigationBarButtonItem = self->_leftNavigationBarButtonItem;
  if (leftNavigationBarButtonItem)
  {
    -[RUIElement attributes](leftNavigationBarButtonItem, "attributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  rightNavigationBarButtonItem = self->_rightNavigationBarButtonItem;
  if (rightNavigationBarButtonItem)
  {
    -[RUIElement attributes](rightNavigationBarButtonItem, "attributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  leftToolbarButtonItem = self->_leftToolbarButtonItem;
  if (leftToolbarButtonItem)
  {
    -[RUIElement attributes](leftToolbarButtonItem, "attributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v9);

  }
  rightToolbarButtonItem = self->_rightToolbarButtonItem;
  if (rightToolbarButtonItem)
  {
    -[RUIElement attributes](rightToolbarButtonItem, "attributes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);

  }
  middleToolbarButtonItem = self->_middleToolbarButtonItem;
  if (middleToolbarButtonItem)
  {
    -[RUIElement attributes](middleToolbarButtonItem, "attributes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v13);

  }
  return (NSArray *)v3;
}

- (void)_barButtonPressed:(id)a3 isRight:(BOOL)a4 isNavbar:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  char **v19;
  char **v20;
  char *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  id v31;
  id WeakRetained;
  id v33;

  v5 = a5;
  v6 = a4;
  v33 = a3;
  objc_msgSend(v33, "attributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("editBarItem"));

  if (v10)
  {
    -[RUIPage elementProvider](self, "elementProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "tableViewOM");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "tableView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "isEditing");
    -[RUIPage elementProvider](self, "elementProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "tableViewOM");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "tableView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v14 ^ 1u;
    objc_msgSend(v17, "setEditing:animated:", v18, 1);

    v19 = &selRef__rightNavigationBarButtonPressed_;
    if (!v5)
      v19 = &selRef__rightToolbarButtonPressed_;
    v20 = &selRef__leftNavigationBarButtonPressed_;
    if (!v5)
      v20 = &selRef__leftToolbarButtonPressed_;
    if (!v6)
      v19 = v20;
    v21 = *v19;
    v22 = objc_alloc(MEMORY[0x24BEBD410]);
    if (v14)
      v23 = 2;
    else
      v23 = 0;
    v24 = (void *)objc_msgSend(v22, "initWithBarButtonSystemItem:target:action:", v23, self, v21);
    if (v5)
    {
      -[RUIPage navigationItem](self, "navigationItem");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (v6)
        objc_msgSend(v25, "setRightBarButtonItem:", v24);
      else
        objc_msgSend(v25, "setLeftBarButtonItem:", v24);

    }
    else
    {
      if (v6)
        -[RUIPage setRightToolbarItem:](self, "setRightToolbarItem:", v24);
      else
        -[RUIPage setLeftToolbarItem:](self, "setLeftToolbarItem:", v24);
      -[RUIPage _updateToolbar](self, "_updateToolbar");
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
    objc_msgSend(WeakRetained, "RUIPage:toggledEditing:", self, v18);

  }
  else
  {
    objc_msgSend(v33, "itemType");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("closeButtonBarItem"));

    if (!v28)
    {
      objc_msgSend(v33, "itemType");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v29, "isEqualToString:", CFSTR("backButtonBarItem")) & 1) != 0)
      {
        objc_msgSend(v8, "objectForKey:", CFSTR("url"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v30)
        {
          -[RUIPage navigationController](self, "navigationController");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = (id)objc_msgSend(v13, "popViewControllerAnimated:", 1);
          goto LABEL_28;
        }
      }
      else
      {

      }
      v13 = objc_loadWeakRetained((id *)&self->_objectModel);
      objc_msgSend(v13, "RUIPage:pressedNavBarButton:", self, v33);
      goto LABEL_28;
    }
    -[RUIPage navigationController](self, "navigationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dismissViewControllerAnimated:completion:", 1, 0);
  }
LABEL_28:

}

- (void)_rightNavigationBarButtonPressed:(id)a3
{
  -[RUIPage _barButtonPressed:isRight:isNavbar:](self, "_barButtonPressed:isRight:isNavbar:", self->_rightNavigationBarButtonItem, 1, 1);
}

- (void)_leftNavigationBarButtonPressed:(id)a3
{
  -[RUIPage _barButtonPressed:isRight:isNavbar:](self, "_barButtonPressed:isRight:isNavbar:", self->_leftNavigationBarButtonItem, 0, 1);
}

- (void)_rightToolbarButtonPressed:(id)a3
{
  -[RUIPage _barButtonPressed:isRight:isNavbar:](self, "_barButtonPressed:isRight:isNavbar:", self->_rightToolbarButtonItem, 1, 0);
}

- (void)_leftToolbarButtonPressed:(id)a3
{
  -[RUIPage _barButtonPressed:isRight:isNavbar:](self, "_barButtonPressed:isRight:isNavbar:", self->_leftToolbarButtonItem, 0, 0);
}

- (void)_middleToolbarButtonPressed:(id)a3
{
  -[RUIPage _barButtonPressed:isRight:isNavbar:](self, "_barButtonPressed:isRight:isNavbar:", self->_middleToolbarButtonItem, 0, 0);
}

- (void)_setContentInset:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  -[RUIPage elementProvider](self, "elementProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tableViewOM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[RUIPage elementProvider](self, "elementProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tableViewOM");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contentInset");
    v11 = v10;
    v13 = v12;
    v15 = v14;

    -[RUIPage elementProvider](self, "elementProvider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "tableViewOM");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "tableView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setContentInset:", v11, v13, a3, v15);

    -[RUIPage elementProvider](self, "elementProvider");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "tableViewOM");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "tableView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setScrollIndicatorInsets:", v11, v13, a3, v15);

  }
}

- (NSArray)accessoryViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  -[RUIPage elementProvider](self, "elementProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tableViewOM");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "tableHeaderView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tableFooterView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = &unk_2545FEEE0;
  if (objc_msgSend(v6, "conformsToProtocol:", v9))
    objc_msgSend(v8, "addObject:", v6);
  v26 = v6;
  if (objc_msgSend(v7, "conformsToProtocol:", v9))
    objc_msgSend(v8, "addObject:", v7);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[RUIPage elementProvider](self, "elementProvider", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tableViewOM");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sections");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v17, "headerView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "conformsToProtocol:", v9);

        if (v19)
        {
          objc_msgSend(v17, "headerView");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v20);

        }
        objc_msgSend(v17, "footerView");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "conformsToProtocol:", v9);

        if (v22)
        {
          objc_msgSend(v17, "footerView");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v23);

        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v14);
  }

  return (NSArray *)v8;
}

- (void)_keyboardWillShow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  void *v30;
  double MaxY;
  double v32;
  void *v33;
  double v34;
  id v35;
  _QWORD v36[5];
  id v37;
  id v38;
  double v39;
  CGRect v40;
  CGRect v41;

  v4 = a3;
  -[RUIPage elementProvider](self, "elementProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tableViewOM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v4, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BEBE468]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "CGRectValue");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;

    objc_msgSend(v4, "object");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "coordinateSpace");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[RUIPage view](self, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "convertRect:toCoordinateSpace:", v21, v12, v14, v16, v18);
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;
    objc_msgSend(v7, "visibleCells");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    MaxY = CGRectGetMaxY(v40);
    v41.origin.x = v23;
    v41.origin.y = v25;
    v41.size.width = v27;
    v41.size.height = v29;
    v32 = fmax(MaxY - CGRectGetMinY(v41), 0.0);
    -[UIView safeAreaInsets](self->_containerView, "safeAreaInsets");
    v33 = (void *)MEMORY[0x24BEBD700];
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __29__RUIPage__keyboardWillShow___block_invoke;
    v36[3] = &unk_24C2978D0;
    v36[4] = self;
    v39 = v32 + v34;
    v37 = v7;
    v38 = v30;
    v35 = v30;
    objc_msgSend(v33, "performOnControllers:", v36);

  }
}

void __29__RUIPage__keyboardWillShow___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*(id *)(a1 + 32), "hasMultiChoiceView") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_setContentInset:", *(double *)(a1 + 56));
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "accessoryViews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v26 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "tableViewDidUpdateContentInset:", *(_QWORD *)(a1 + 40));
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v4);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = *(id *)(a1 + 48);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    while (2)
    {
      for (j = 0; j != v10; ++j)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
        if (objc_msgSend(v13, "_isAncestorOfFirstResponder", (_QWORD)v21))
        {
          objc_msgSend(*(id *)(a1 + 32), "elementProvider");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "tableViewOM");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "tableView");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "elementProvider");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "tableViewOM");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "tableView");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "indexPathForCell:", v13);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "scrollToRowAtIndexPath:atScrollPosition:animated:", v20, 2, 1);

          goto LABEL_22;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_22:

}

- (void)_keyboardWillHide:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  _QWORD v11[5];
  id v12;

  -[RUIPage elementProvider](self, "elementProvider", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tableViewOM");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[RUIPage tableViewOM](self, "tableViewOM");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isShowingPicker");

    if ((v9 & 1) == 0)
    {
      v10 = (void *)MEMORY[0x24BEBD700];
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __29__RUIPage__keyboardWillHide___block_invoke;
      v11[3] = &unk_24C2978F8;
      v11[4] = self;
      v12 = v6;
      objc_msgSend(v10, "performOnControllers:", v11);

    }
  }

}

void __29__RUIPage__keyboardWillHide___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*(id *)(a1 + 32), "hasMultiChoiceView") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_setContentInset:", 0.0);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "accessoryViews", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "tableViewDidUpdateContentInset:", *(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 32), "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNeedsLayout");

}

- (void)setPageElement:(id)a3
{
  RUIPageElement *v5;
  RUIPageElement *pageElement;
  RUITopLevelElementProvider *v7;
  RUITopLevelElementProvider *elementProvider;
  RUIPageElement *v9;

  v5 = (RUIPageElement *)a3;
  pageElement = self->_pageElement;
  v9 = v5;
  if (pageElement != v5)
  {
    -[RUIPageElement setPage:](pageElement, "setPage:", 0);
    objc_storeStrong((id *)&self->_pageElement, a3);
    -[RUIPageElement setPage:](self->_pageElement, "setPage:", self);
    v7 = -[RUITopLevelElementProvider initWithParentElement:]([RUITopLevelElementProvider alloc], "initWithParentElement:", v9);
    elementProvider = self->_elementProvider;
    self->_elementProvider = v7;

    -[RUIPage addElementProvider:](self, "addElementProvider:", self->_elementProvider);
    -[RUITopLevelElementProvider setDelegate:](self->_elementProvider, "setDelegate:", self);
  }

}

- (void)_setParentPage:(id)a3
{
  objc_storeWeak((id *)&self->_parentPage, a3);
}

- (void)_addChildPage:(id)a3
{
  id v4;
  NSMutableArray *childPages;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  childPages = self->_childPages;
  v8 = v4;
  if (!childPages)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_childPages;
    self->_childPages = v6;

    v4 = v8;
    childPages = self->_childPages;
  }
  -[NSMutableArray addObject:](childPages, "addObject:", v4);
  objc_msgSend(v8, "_setParentPage:", self);

}

- (void)_updateWithCompletedChild:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  uint64_t v53;
  id obj;
  id obja;
  uint64_t v56;
  uint64_t v57;
  RUIPage *v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  id v62;
  void *v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "tableViewOM");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = self;
  -[RUIPage tableViewOM](self, "tableViewOM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  objc_msgSend(v5, "sections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v77, v84, 16);
  if (v59)
  {
    v50 = v4;
    v51 = v6;
    v49 = v5;
    v8 = 0;
    v63 = 0;
    v64 = 0;
    obj = v7;
    v56 = *(_QWORD *)v78;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v78 != v56)
          objc_enumerationMutation(obj);
        v61 = v9;
        v10 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * (_QWORD)v9);
        v73 = 0u;
        v74 = 0u;
        v75 = 0u;
        v76 = 0u;
        objc_msgSend(v10, "rows", v49, v50);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v74;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              v16 = v8;
              if (*(_QWORD *)v74 != v14)
                objc_enumerationMutation(v11);
              v17 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
              objc_msgSend(v17, "attributes");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("radioGroup"));
              v8 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v8, "length"))
              {
                objc_msgSend(v17, "tableCell");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = objc_msgSend(v19, "remoteUIAccessoryType");

                if (v20 == 3)
                {
                  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("value"));
                  v21 = objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("label"));
                  v22 = objc_claimAutoreleasedReturnValue();

                  v63 = (void *)v22;
                  v64 = (void *)v21;
                }
              }

            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
          }
          while (v13);
        }

        v9 = v61 + 1;
      }
      while (v61 + 1 != (char *)v59);
      v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v84, 16);
    }
    while (v59);

    if (!v64)
    {
      v5 = v49;
      v4 = v50;
      v6 = v51;
      goto LABEL_39;
    }
    v6 = v51;
    if (!v63)
    {
      v5 = v49;
      v4 = v50;
      goto LABEL_39;
    }
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    objc_msgSend(v51, "sections");
    v52 = (id)objc_claimAutoreleasedReturnValue();
    obja = (id)objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v69, v82, 16);
    if (obja)
    {
      v53 = *(_QWORD *)v70;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v70 != v53)
            objc_enumerationMutation(v52);
          v57 = v23;
          v24 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v23);
          v65 = 0u;
          v66 = 0u;
          v67 = 0u;
          v68 = 0u;
          objc_msgSend(v24, "rows");
          v62 = (id)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v65, v81, 16);
          if (v25)
          {
            v26 = v25;
            v27 = *(_QWORD *)v66;
            do
            {
              v28 = 0;
              v60 = v26;
              do
              {
                if (*(_QWORD *)v66 != v27)
                  objc_enumerationMutation(v62);
                v29 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v28);
                objc_msgSend(v29, "attributes");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v31 = (void *)objc_msgSend(v30, "mutableCopy");

                objc_msgSend(v29, "linkedPage");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "pageID");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                v34 = objc_msgSend(v33, "isEqualToString:", v8);

                if (v34)
                {
                  objc_msgSend(v29, "tableCell");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v35, "ruiDetailTextLabel");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "setText:", v63);

                  objc_msgSend(v29, "tableCell");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v37, "ruiDetailTextLabel");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  -[RUIPage style](v58, "style");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v39, "selectPageDetailTextColor");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v38, "setTextColor:", v40);

                  objc_msgSend(v31, "setObject:forKeyedSubscript:", v64, CFSTR("value"));
                  v26 = v60;
                  objc_msgSend(v31, "setObject:forKeyedSubscript:", v63, CFSTR("detailLabel"));
                }
                objc_msgSend(v29, "setAttributes:", v31);
                objc_msgSend(v29, "tableCell");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "setNeedsLayout");

                ++v28;
              }
              while (v26 != v28);
              v26 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v65, v81, 16);
            }
            while (v26);
          }

          v23 = v57 + 1;
        }
        while ((id)(v57 + 1) != obja);
        obja = (id)objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v69, v82, 16);
      }
      while (obja);
    }

    -[RUIPage elementProvider](v58, "elementProvider");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "tableViewOM");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "objectModel");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIPage elementProvider](v58, "elementProvider");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "tableViewOM");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "tableViewOMDidChange:", v46);

    -[RUIPage elementProvider](v58, "elementProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tableViewOM");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "tableView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "reloadData");

    v5 = v49;
    v4 = v50;
    v6 = v51;
  }
  else
  {
    v63 = 0;
    v64 = 0;
    v8 = 0;
  }

LABEL_39:
}

- (void)_updateParentPage
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_parentPage);
  objc_msgSend(WeakRetained, "_updateWithCompletedChild:", self);

}

- (id)subElementWithID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[RUIPage _childElements](self, "_childElements", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if (v12)
        {
          v13 = v10;
LABEL_13:
          v14 = v13;
          goto LABEL_14;
        }
        objc_msgSend(v10, "subElementWithID:", v4);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        if (v13)
          goto LABEL_13;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v14 = 0;
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v14 = 0;
  }
LABEL_14:

  return v14;
}

- (id)_childElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RUIPage primaryElement](self, "primaryElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_remoteUI_addObjectIfNotNil:", v4);

  -[RUIPage elementProvider](self, "elementProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tableViewOM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_remoteUI_addObjectIfNotNil:", v6);

  -[RUIPage elementProvider](self, "elementProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "webViewOM");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_remoteUI_addObjectIfNotNil:", v8);

  -[RUIPage elementProvider](self, "elementProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "passcodeViewOM");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_remoteUI_addObjectIfNotNil:", v10);

  -[RUIPage elementProvider](self, "elementProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "spinnerViewOM");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_remoteUI_addObjectIfNotNil:", v12);

  objc_msgSend(v3, "_remoteUI_addObjectIfNotNil:", self->_leftNavigationBarButtonItem);
  objc_msgSend(v3, "_remoteUI_addObjectIfNotNil:", self->_rightNavigationBarButtonItem);
  objc_msgSend(v3, "_remoteUI_addObjectIfNotNil:", self->_leftToolbarButtonItem);
  objc_msgSend(v3, "_remoteUI_addObjectIfNotNil:", self->_middleToolbarButtonItem);
  objc_msgSend(v3, "_remoteUI_addObjectIfNotNil:", self->_rightToolbarButtonItem);
  return v3;
}

- (id)viewForElementIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[RUIPage _childElements](self, "_childElements", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "viewForElementIdentifier:", v4);
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)v10;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (id)elementsWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  void *v51;
  int v52;
  void *v53;
  int v54;
  void *v55;
  int v56;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[RUIPage primaryElement](self, "primaryElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", v4);

  if (v8)
  {
    -[RUIPage primaryElement](self, "primaryElement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v9);

  }
  -[RUIPage elementProvider](self, "elementProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tableViewOM");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", v4);

  if (v13)
  {
    -[RUIPage elementProvider](self, "elementProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "tableViewOM");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v15);

  }
  -[RUIPage elementProvider](self, "elementProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "webViewOM");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "name");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEqualToString:", v4);

  if (v19)
  {
    -[RUIPage elementProvider](self, "elementProvider");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "webViewOM");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v21);

  }
  -[RUIPage elementProvider](self, "elementProvider");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "passcodeViewOM");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "name");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isEqualToString:", v4);

  if (v25)
  {
    -[RUIPage elementProvider](self, "elementProvider");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "passcodeViewOM");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v27);

  }
  -[RUIPage elementProvider](self, "elementProvider");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "spinnerViewOM");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "name");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "isEqualToString:", v4);

  if (v31)
  {
    -[RUIPage elementProvider](self, "elementProvider");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "spinnerViewOM");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v33);

  }
  -[RUIPage primaryElement](self, "primaryElement");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "subElementsWithName:", v4);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v35);

  -[RUIPage elementProvider](self, "elementProvider");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "tableViewOM");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "subElementsWithName:", v4);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v38);

  -[RUIPage elementProvider](self, "elementProvider");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "webViewOM");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "subElementsWithName:", v4);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v41);

  -[RUIPage elementProvider](self, "elementProvider");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "passcodeViewOM");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "subElementsWithName:", v4);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v44);

  -[RUIPage elementProvider](self, "elementProvider");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "spinnerViewOM");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "subElementsWithName:", v4);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v47);

  -[RUIElement name](self->_leftNavigationBarButtonItem, "name");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v46) = objc_msgSend(v48, "isEqualToString:", v4);

  if ((_DWORD)v46)
    objc_msgSend(v5, "addObject:", self->_leftNavigationBarButtonItem);
  -[RUIElement name](self->_rightNavigationBarButtonItem, "name");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "isEqualToString:", v4);

  if (v50)
    objc_msgSend(v5, "addObject:", self->_rightNavigationBarButtonItem);
  -[RUIElement name](self->_leftToolbarButtonItem, "name");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v51, "isEqualToString:", v4);

  if (v52)
    objc_msgSend(v5, "addObject:", self->_leftToolbarButtonItem);
  -[RUIElement name](self->_middleToolbarButtonItem, "name");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v53, "isEqualToString:", v4);

  if (v54)
    objc_msgSend(v5, "addObject:", self->_middleToolbarButtonItem);
  -[RUIElement name](self->_rightToolbarButtonItem, "name");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "isEqualToString:", v4);

  if (v56)
    objc_msgSend(v5, "addObject:", self->_rightToolbarButtonItem);

  return v5;
}

- (RUITableView)tableViewOM
{
  void *v2;
  void *v3;

  -[RUIPage elementProvider](self, "elementProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "makeTableViewOM");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (RUITableView *)v3;
}

- (void)topLevelElementProvider:(id)a3 didCreateTableView:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  id v14;

  if (self->_containerView)
  {
    v5 = a4;
    objc_msgSend(v5, "tableView");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    -[RUIPage traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "traitCollectionDidChangeFrom:toTraitCollection:", 0, v6);

    if (-[RUIPage hasWebView](self, "hasWebView"))
    {
      -[UIView insertSubview:atIndex:](self->_containerView, "insertSubview:atIndex:", v14, 0);
    }
    else
    {
      -[RUIPage elementProvider](self, "elementProvider");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "primaryElement");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = (void *)v8;
        -[RUIPage elementProvider](self, "elementProvider");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "primaryElement");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
          goto LABEL_10;
      }
      else
      {

      }
      -[UIView addSubview:](self->_containerView, "addSubview:", v14);
    }
LABEL_10:

  }
}

- (BOOL)hasTableView
{
  void *v2;
  char v3;

  -[RUIPage elementProvider](self, "elementProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasTableView");

  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RUIPage;
  -[RUIPage traitCollectionDidChange:](&v12, sel_traitCollectionDidChange_, v4);
  -[RUIPage elementProvider](self, "elementProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tableViewOM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[RUIPage elementProvider](self, "elementProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tableViewOM");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIPage traitCollection](self, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "traitCollectionDidChangeFrom:toTraitCollection:", v4, v9);

  }
  -[RUIBarButtonItem updateBackButtonColors](self->_leftNavigationBarButtonItem, "updateBackButtonColors");
  -[RUIPage style](self, "style");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
  objc_msgSend(v10, "applyToObjectModel:", WeakRetained);

}

- (RUIWebView)webViewOM
{
  void *v2;
  void *v3;

  -[RUIPage elementProvider](self, "elementProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "makeWebViewOM");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (RUIWebView *)v3;
}

- (void)topLevelElementProvider:(id)a3 didCreateWebView:(id)a4
{
  UIView *containerView;
  void *v6;
  id v7;

  v7 = a4;
  if (-[RUIPage isPrimaryElementNilOrKindOf:](self, "isPrimaryElementNilOrKindOf:", objc_opt_class()))
  {
    containerView = self->_containerView;
    objc_msgSend(v7, "webView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](containerView, "addSubview:", v6);

  }
}

- (BOOL)hasWebView
{
  void *v2;
  char v3;

  -[RUIPage elementProvider](self, "elementProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasWebView");

  return v3;
}

- (RUITopLevelPageElement)primaryElement
{
  void *v2;
  void *v3;

  -[RUIPage elementProvider](self, "elementProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "primaryElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (RUITopLevelPageElement *)v3;
}

- (void)topLevelElementProvider:(id)a3 didSetPrimaryElement:(id)a4 previousElement:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  UIView *containerView;
  void *v13;
  id v14;

  v14 = a4;
  v7 = a5;
  if (v14 != v7)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "viewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v14, "viewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    objc_msgSend(v8, "willMoveToParentViewController:", 0);
    objc_msgSend(v8, "removeFromParentViewController");
    objc_msgSend(v7, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeFromSuperview");

    if (v9)
      -[RUIPage addChildViewController:](self, "addChildViewController:", v9);
    WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
    objc_msgSend(v14, "setObjectModel:", WeakRetained);

    containerView = self->_containerView;
    if (containerView)
    {
      objc_msgSend(v14, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView addSubview:](containerView, "addSubview:", v13);

    }
    objc_msgSend(v9, "didMoveToParentViewController:", self);

  }
}

- (RUIPasscodeView)passcodeViewOM
{
  void *v2;
  void *v3;

  -[RUIPage elementProvider](self, "elementProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "makePasscodeViewOM");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (RUIPasscodeView *)v3;
}

- (void)topLevelElementProvider:(id)a3 didCreatePasscodeView:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  if (self->_containerView)
  {
    v7 = v5;
    objc_msgSend(v5, "passcodeView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[RUIPage isPrimaryElementNilOrKindOf:](self, "isPrimaryElementNilOrKindOf:", objc_opt_class()))
    {
      objc_msgSend(v7, "setShouldManageScrollViewInsets:", 1);
      -[UIView addSubview:](self->_containerView, "addSubview:", v6);
    }

    v5 = v7;
  }

}

- (BOOL)hasPasscodeView
{
  void *v2;
  char v3;

  -[RUIPage elementProvider](self, "elementProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPasscodeView");

  return v3;
}

- (RUISpinnerView)spinnerViewOM
{
  void *v2;
  void *v3;

  -[RUIPage elementProvider](self, "elementProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "makeSpinnerViewOM");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (RUISpinnerView *)v3;
}

- (void)topLevelElementProvider:(id)a3 didCreateSpinnerView:(id)a4
{
  id v5;

  if (self->_containerView)
  {
    objc_msgSend(a4, "spinnerView", a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](self->_containerView, "addSubview:", v5);

  }
}

- (BOOL)hasSpinnerView
{
  void *v2;
  char v3;

  -[RUIPage elementProvider](self, "elementProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasSpinnerView");

  return v3;
}

- (BOOL)multiChoiceViewFloatsAboveKeyboard
{
  return 0;
}

- (BOOL)hasMultiChoiceView
{
  return 0;
}

- (BOOL)hasChoiceView
{
  return 0;
}

- (BOOL)hasToolBar
{
  return 0;
}

- (void)setObjectModel:(id)a3
{
  RUIObjectModel **p_objectModel;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  p_objectModel = &self->_objectModel;
  v5 = a3;
  objc_storeWeak((id *)p_objectModel, v5);
  -[RUIPage elementProvider](self, "elementProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tableViewOM");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObjectModel:", v5);

  -[RUIPage elementProvider](self, "elementProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "webViewOM");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDelegate:", v5);

  -[RUIPage elementProvider](self, "elementProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "passcodeViewOM");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObjectModel:", v5);

  -[RUIPage elementProvider](self, "elementProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "spinnerViewOM");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObjectModel:", v5);

  -[RUIPage primaryElement](self, "primaryElement");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObjectModel:", v5);

}

- (void)populatePostbackDictionary:(id)a3 elementProvider:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a3;
  v5 = a4;
  objc_msgSend(v5, "tableViewOM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "populatePostbackDictionary:", v11);

  objc_msgSend(v5, "passcodeViewOM");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "populatePostbackDictionary:", v11);

  objc_msgSend(v5, "primaryElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    objc_msgSend(v5, "primaryElement");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "populatePostbackDictionary:", v11);

  }
}

- (void)populatePostbackDictionary:(id)a3
{
  id v4;
  NSMutableArray *elementProviders;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  elementProviders = self->_elementProviders;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __38__RUIPage_populatePostbackDictionary___block_invoke;
  v7[3] = &unk_24C2978A8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NSMutableArray enumerateObjectsUsingBlock:](elementProviders, "enumerateObjectsUsingBlock:", v7);

}

uint64_t __38__RUIPage_populatePostbackDictionary___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "populatePostbackDictionary:elementProvider:", *(_QWORD *)(a1 + 40), a2);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEBE560], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEBE558], 0);
  -[RUIPage setLoading:](self, "setLoading:", 0);
  -[RUIPage elementProvider](self, "elementProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tableViewOM");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObjectModel:", 0);

  -[RUIPage elementProvider](self, "elementProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "webViewOM");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", 0);

  -[RUIPage elementProvider](self, "elementProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "passcodeViewOM");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObjectModel:", 0);

  -[RUIPage elementProvider](self, "elementProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "spinnerViewOM");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObjectModel:", 0);

  -[RUIPage primaryElement](self, "primaryElement");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObjectModel:", 0);

  v13.receiver = self;
  v13.super_class = (Class)RUIPage;
  -[RUIPage dealloc](&v13, sel_dealloc);
}

- (void)loadView
{
  id v3;
  UIView *v4;
  UIView *containerView;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UIView *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  UIView *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  UIView *v28;
  uint64_t v29;
  void *v30;
  _BOOL4 v31;
  UIView *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;

  v3 = objc_alloc(MEMORY[0x24BEBDB00]);
  v4 = (UIView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  containerView = self->_containerView;
  self->_containerView = v4;

  -[RUIPage style](self, "style");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "backgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[RUIPage style](self, "style");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "backgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_containerView, "setBackgroundColor:", v9);

  }
  -[RUIPage style](self, "style");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tintColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setTintColor:](self->_containerView, "setTintColor:", v11);

  -[UIView setAutoresizingMask:](self->_containerView, "setAutoresizingMask:", 18);
  -[RUIPage setView:](self, "setView:", self->_containerView);
  -[RUIPage elementProvider](self, "elementProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "webViewOM");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 && -[RUIPage isPrimaryElementNilOrKindOf:](self, "isPrimaryElementNilOrKindOf:", objc_opt_class()))
  {
    v14 = self->_containerView;
    -[RUIPage elementProvider](self, "elementProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "webViewOM");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "webView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v14, "addSubview:", v17);

  }
  -[RUIPage primaryElement](self, "primaryElement");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = self->_containerView;
    -[RUIPage primaryElement](self, "primaryElement");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v19, "addSubview:", v21);
LABEL_20:

    goto LABEL_21;
  }
  -[RUIPage elementProvider](self, "elementProvider");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "tableViewOM");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[RUIPage elementProvider](self, "elementProvider");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v23)
  {
    objc_msgSend(v24, "tableViewOM");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "tableView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIView setPreservesSuperviewLayoutMargins:](self->_containerView, "setPreservesSuperviewLayoutMargins:", 1);
    v27 = -[RUIPage hasWebView](self, "hasWebView");
    v28 = self->_containerView;
    if (v27)
      -[UIView insertSubview:atIndex:](v28, "insertSubview:atIndex:", v20, 0);
    else
      -[UIView addSubview:](v28, "addSubview:", v20);
    -[RUIPage elementProvider](self, "elementProvider");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "tableViewOM");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addSearchBarToPage:", self);

    goto LABEL_20;
  }
  objc_msgSend(v24, "passcodeViewOM");
  v29 = objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v30 = (void *)v29;
    v31 = -[RUIPage isPrimaryElementNilOrKindOf:](self, "isPrimaryElementNilOrKindOf:", objc_opt_class());

    if (v31)
    {
      v32 = self->_containerView;
      -[RUIPage elementProvider](self, "elementProvider");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "passcodeViewOM");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "passcodeView");
      v33 = objc_claimAutoreleasedReturnValue();
LABEL_19:
      v37 = (void *)v33;
      -[UIView addSubview:](v32, "addSubview:", v33);

      goto LABEL_20;
    }
  }
  else
  {

  }
  -[RUIPage elementProvider](self, "elementProvider");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "spinnerViewOM");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    v32 = self->_containerView;
    -[RUIPage elementProvider](self, "elementProvider");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "spinnerViewOM");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "spinnerView");
    v33 = objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
LABEL_21:
  -[RUIPage _setupMultiChoiceView](self, "_setupMultiChoiceView");
  -[UIView addSubview:](self->_containerView, "addSubview:", self->_toolbar);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)RUIPage;
  -[RUIPage viewDidLoad](&v14, sel_viewDidLoad);
  -[RUIPage elementProvider](self, "elementProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tableViewOM");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadData");

  -[RUIPage primaryElement](self, "primaryElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[RUIPage primaryElement](self, "primaryElement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "viewDidLoad");

  }
  -[RUIPage attributes](self, "attributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("refreshOnNotification"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "BOOLValue") & 1) == 0)
  {

LABEL_11:
    goto LABEL_12;
  }
  -[RUIPage pageID](self, "pageID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (_isInternalInstall())
    {
      _RUILoggingFacility();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        -[RUIPage pageID](self, "pageID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v16 = v13;
        _os_log_impl(&dword_209E87000, v12, OS_LOG_TYPE_DEFAULT, "Refresh notification listener added for page: %@", buf, 0xCu);

      }
    }
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__handlePageUpdateRequestedNotification_, CFSTR("RUIPageRefreshRequestedNotification"), 0);
    goto LABEL_11;
  }
LABEL_12:
  -[RUIPage setPreferredContentSize:](self, "setPreferredContentSize:", RemoteUIPreferredContentSize());
}

- (void)_handlePageUpdateRequestedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  NSObject *v15;
  __CFString *v16;
  NSObject *v17;
  int v18;
  __CFString *v19;
  __int16 v20;
  NSObject *v21;
  __int16 v22;
  __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RUIPage pageID](self, "pageID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if ((v7 & 1) != 0)
  {
    -[RUIPage attributes](self, "attributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("refreshUrl"));
    v9 = objc_claimAutoreleasedReturnValue();

    -[RUIPage attributes](self, "attributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("refreshHttpMethod"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = CFSTR("GET");
    if (v11)
      v13 = (__CFString *)v11;
    v14 = v13;

    if (_isInternalInstall())
    {
      _RUILoggingFacility();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        -[RUIPage pageID](self, "pageID");
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v18 = 138412802;
        v19 = v16;
        v20 = 2112;
        v21 = v9;
        v22 = 2112;
        v23 = v14;
        _os_log_impl(&dword_209E87000, v15, OS_LOG_TYPE_DEFAULT, "Notification received for page %@. will refresh from url: %@ method: %@", (uint8_t *)&v18, 0x20u);

      }
    }
    -[RUIPage objectModel](self, "objectModel");
    v17 = objc_claimAutoreleasedReturnValue();
    -[NSObject openLink:HTTPMethod:completion:](v17, "openLink:HTTPMethod:completion:", v9, v14, 0);
    goto LABEL_12;
  }
  if (_isInternalInstall())
  {
    _RUILoggingFacility();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
LABEL_13:

      goto LABEL_14;
    }
    objc_msgSend(v4, "object");
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[RUIPage pageID](self, "pageID");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = 138412546;
    v19 = v14;
    v20 = 2112;
    v21 = v17;
    _os_log_impl(&dword_209E87000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring refresh notification requestedPage: %@. currentPage: %@", (uint8_t *)&v18, 0x16u);
LABEL_12:

    goto LABEL_13;
  }
LABEL_14:

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  objc_super v22;

  v3 = a3;
  v22.receiver = self;
  v22.super_class = (Class)RUIPage;
  -[RUIPage viewWillAppear:](&v22, sel_viewWillAppear_);
  -[RUIPage elementProvider](self, "elementProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tableViewOM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewWillAppear:", v3);

  -[RUIPage elementProvider](self, "elementProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "passcodeViewOM");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewWillAppear:", v3);

  -[RUIPage elementProvider](self, "elementProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "spinnerViewOM");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "viewWillAppear:", v3);

  -[RUIPage primaryElement](self, "primaryElement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[RUIPage primaryElement](self, "primaryElement");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "viewWillAppear:", v3);

  }
  -[RUIPage preferredContentSize](self, "preferredContentSize");
  v15 = v14;
  v17 = v16;
  -[RUIPage navigationController](self, "navigationController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setPreferredContentSize:", v15, v17);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *MEMORY[0x24BEBE560];
  objc_msgSend(v19, "removeObserver:name:object:", self, *MEMORY[0x24BEBE560], 0);
  v21 = *MEMORY[0x24BEBE558];
  objc_msgSend(v19, "removeObserver:name:object:", self, *MEMORY[0x24BEBE558], 0);
  objc_msgSend(v19, "addObserver:selector:name:object:", self, sel__keyboardWillShow_, v20, 0);
  objc_msgSend(v19, "addObserver:selector:name:object:", self, sel__keyboardWillHide_, v21, 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  char v15;
  void *v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v3 = a3;
  v28 = *MEMORY[0x24BDAC8D0];
  v26.receiver = self;
  v26.super_class = (Class)RUIPage;
  -[RUIPage viewDidAppear:](&v26, sel_viewDidAppear_);
  -[RUIPage elementProvider](self, "elementProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tableViewOM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewDidAppear:", v3);

  -[RUIPage elementProvider](self, "elementProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "passcodeViewOM");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewDidAppear:", v3);

  if (UIKeyboardAutomaticIsOnScreen() && !-[RUIPage hasMultiChoiceView](self, "hasMultiChoiceView"))
  {
    -[RUIPage view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "keyboardSceneDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[RUIPage view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "visibleFrameInView:", v11);
    v13 = v12;

    -[RUIPage _setContentInset:](self, "_setContentInset:", v13);
  }
  -[RUIPage primaryElement](self, "primaryElement");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0)
  {
    -[RUIPage primaryElement](self, "primaryElement");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "viewDidAppear:", v3);

  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v17 = self->_didAppearCallbacks;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v23;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v23 != v20)
          objc_enumerationMutation(v17);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v21) + 16))(*(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v21));
        ++v21;
      }
      while (v19 != v21);
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v19);
  }

  -[NSMutableArray removeAllObjects](self->_didAppearCallbacks, "removeAllObjects", (_QWORD)v22);
}

- (void)addElementProvider:(id)a3
{
  -[NSMutableArray addObject:](self->_elementProviders, "addObject:", a3);
}

- (void)viewIsAppearing:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RUIPage;
  -[RUIPage viewIsAppearing:](&v4, sel_viewIsAppearing_, a3);
  -[UIView layoutIfNeeded](self->_containerView, "layoutIfNeeded");
  -[RUIPage updatePreferredContentSize](self, "updatePreferredContentSize");
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  objc_super v16;

  v3 = a3;
  v16.receiver = self;
  v16.super_class = (Class)RUIPage;
  -[RUIPage viewWillDisappear:](&v16, sel_viewWillDisappear_);
  -[RUIPage elementProvider](self, "elementProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tableViewOM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewWillDisappear:", v3);

  -[RUIPage elementProvider](self, "elementProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "passcodeViewOM");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewWillDisappear:", v3);

  -[RUIPage elementProvider](self, "elementProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "spinnerViewOM");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "viewWillDisappear:", v3);

  WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
  objc_msgSend(WeakRetained, "cleanupRefreshTimer");

  -[RUIPage primaryElement](self, "primaryElement");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    -[RUIPage primaryElement](self, "primaryElement");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "viewWillDisappear:", v3);

  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeObserver:name:object:", self, *MEMORY[0x24BEBE560], 0);
  objc_msgSend(v15, "removeObserver:name:object:", self, *MEMORY[0x24BEBE558], 0);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id WeakRetained;
  objc_super v11;

  v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RUIPage;
  -[RUIPage viewDidDisappear:](&v11, sel_viewDidDisappear_);
  -[RUIPage elementProvider](self, "elementProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tableViewOM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewDidDisappear:", v3);

  -[RUIPage primaryElement](self, "primaryElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[RUIPage primaryElement](self, "primaryElement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "viewDidDisappear:", v3);

  }
  if (-[RUIPage isMovingFromParentViewController](self, "isMovingFromParentViewController"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
    objc_msgSend(WeakRetained, "pageDidDisappear:", self);

  }
}

- (unint64_t)supportedInterfaceOrientations
{
  RUIObjectModel **p_objectModel;
  id WeakRetained;
  id v5;
  unint64_t v6;

  p_objectModel = &self->_objectModel;
  WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);

  if (!WeakRetained)
    return 2;
  v5 = objc_loadWeakRetained((id *)p_objectModel);
  v6 = objc_msgSend(v5, "supportedInterfaceOrientationsForRUIPage:", self);

  return v6;
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  id WeakRetained;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RUIPage;
  -[RUIPage viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  -[RUIPage style](self, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
  objc_msgSend(v3, "applyToObjectModel:", WeakRetained);

}

- (BOOL)isPrimaryElementNilOrKindOf:(Class)a3
{
  void *v4;
  void *v5;
  char isKindOfClass;

  -[RUIPage primaryElement](self, "primaryElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[RUIPage primaryElement](self, "primaryElement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 1;
  }

  return isKindOfClass & 1;
}

- (double)_buttonTrayLayoutInset
{
  return 0.0;
}

- (double)_buttonTrayScrollInset
{
  return 0.0;
}

- (void)viewDidLayoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  UIToolbar *toolbar;
  double v16;
  CGFloat v17;
  CGFloat v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  _BOOL4 v33;
  _BOOL4 v34;
  _BOOL4 v35;
  double v36;
  double v37;
  void *v38;
  char v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  void *v65;
  _BOOL4 v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  double v87;
  double v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  int v93;
  double v94;
  double v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  int v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  uint64_t v129;
  void *v130;
  void *v131;
  double v132;
  double v133;
  double v134;
  double MaxY;
  double v136;
  objc_super v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;

  v137.receiver = self;
  v137.super_class = (Class)RUIPage;
  -[RUIPage viewDidLayoutSubviews](&v137, sel_viewDidLayoutSubviews);
  -[UIView bounds](self->_containerView, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[RUIPage view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "safeAreaInsets");
  v133 = v12;
  v14 = v13;

  toolbar = self->_toolbar;
  v16 = v10;
  if (toolbar)
  {
    -[UIToolbar sizeThatFits:](toolbar, "sizeThatFits:", v8, v10);
    v138.size.width = v17;
    v138.size.height = v18;
    v138.origin.x = v4;
    v138.origin.y = v6;
    v139 = CGRectInset(v138, 0.0, 0.0);
    v16 = v10 - (v14 + v139.size.height);
    -[UIToolbar setFrame:](self->_toolbar, "setFrame:", v139.origin.x, v10 - v139.size.height - v14, v139.size.width);
    -[UIToolbar layoutSubviews](self->_toolbar, "layoutSubviews");
  }
  v136 = v8;
  v134 = v4;
  -[RUIPage elementProvider](self, "elementProvider");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "tableViewOM");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "searchBarRectInPage:", self);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;

  v140.origin.x = v22;
  v140.origin.y = v24;
  v140.size.width = v26;
  v140.size.height = v28;
  if (!CGRectIsEmpty(v140))
  {
    -[RUIPage elementProvider](self, "elementProvider");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "tableViewOM");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "searchBar");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setFrame:", v22, v24, v26, v28);

  }
  v141.origin.x = v22;
  v141.origin.y = v24;
  v141.size.width = v26;
  v141.size.height = v28;
  MaxY = CGRectGetMaxY(v141);
  v142.origin.x = v22;
  v142.origin.y = v24;
  v142.size.width = v26;
  v142.size.height = v28;
  v32 = CGRectGetMaxY(v142);
  v33 = -[RUIPage isPrimaryElementNilOrKindOf:](self, "isPrimaryElementNilOrKindOf:", objc_opt_class());
  v34 = -[RUIPage isPrimaryElementNilOrKindOf:](self, "isPrimaryElementNilOrKindOf:", objc_opt_class());
  v35 = -[RUIPage isPrimaryElementNilOrKindOf:](self, "isPrimaryElementNilOrKindOf:", objc_opt_class());
  -[RUIPage _buttonTrayLayoutInset](self, "_buttonTrayLayoutInset");
  v37 = v36;
  objc_msgSend(MEMORY[0x24BEBD700], "activeKeyboardSceneDelegate");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "isOnScreen");

  -[RUIPage elementProvider](self, "elementProvider");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "tableViewOM");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v41;
  if (v41 && v34)
  {

    v43 = v136;
    if ((v39 & 1) != 0)
      goto LABEL_11;
    -[RUIPage elementProvider](self, "elementProvider");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "tableViewOM");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "tableView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "contentInset");
    v48 = v47;
    v50 = v49;
    v52 = v51;

    -[RUIPage _buttonTrayScrollInset](self, "_buttonTrayScrollInset");
    v132 = v37;
    v53 = v10;
    v54 = v6;
    v56 = v55;
    -[RUIPage elementProvider](self, "elementProvider");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "tableViewOM");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "tableView");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setContentInset:", v48, v50, v56, v52);

    -[RUIPage elementProvider](self, "elementProvider");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "tableViewOM");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "tableView");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v50;
    v43 = v136;
    v62 = v56;
    v6 = v54;
    v10 = v53;
    v37 = v132;
    objc_msgSend(v60, "setVerticalScrollIndicatorInsets:", v48, v61, v62, v52);

  }
  else
  {
    v43 = v136;
  }

LABEL_11:
  v63 = v16 - v32;
  -[RUIPage elementProvider](self, "elementProvider");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "webViewOM");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  if (v65)
    v66 = v35;
  else
    v66 = 0;

  if (v66)
  {
    -[RUIPage elementProvider](self, "elementProvider");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "webViewOM");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "webView");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "scrollView");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "contentInset");
    v72 = v71;
    v74 = v73;
    v76 = v75;

    -[RUIPage _buttonTrayScrollInset](self, "_buttonTrayScrollInset");
    v78 = v77;
    -[RUIPage elementProvider](self, "elementProvider");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "webViewOM");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "webView");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "scrollView");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "setContentInset:", v72, v74, v78, v76);

    -[RUIPage elementProvider](self, "elementProvider");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "webViewOM");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "webView");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "scrollView");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = v78;
    v43 = v136;
    objc_msgSend(v86, "setVerticalScrollIndicatorInsets:", v72, v74, v87, v76);

  }
  v88 = v63 - v37;
  if (+[RUIPlatform isAppleTV](RUIPlatform, "isAppleTV"))
  {
    -[RUIPage elementProvider](self, "elementProvider");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "tableViewOM");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "attributes");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "objectForKeyedSubscript:", CFSTR("splitPosition"));
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = objc_msgSend(v92, "isEqualToString:", CFSTR("leftHalf"));

    if (v93)
    {
      v94 = v134 + 120.0;
      v95 = v43 * 0.5;
      goto LABEL_21;
    }
    -[RUIPage elementProvider](self, "elementProvider");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "tableViewOM");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "attributes");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "objectForKeyedSubscript:", CFSTR("splitPosition"));
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = objc_msgSend(v99, "isEqualToString:", CFSTR("rightHalf"));

    if (v100)
    {
      v143.origin.x = v134;
      v143.origin.y = v6;
      v143.size.width = v43;
      v143.size.height = v10;
      v94 = (CGRectGetMaxX(v143) - v134) * 0.5 + 120.0;
      v95 = v43 * 0.5;
LABEL_21:
      v101 = v95 + -240.0;
      if (!v34)
        goto LABEL_28;
      goto LABEL_27;
    }
  }
  -[RUIPage customMargin](self, "customMargin");
  if (v102 >= 0.0)
  {
    -[RUIPage customMargin](self, "customMargin");
    v101 = v43 + v107 * -2.0;
    -[RUIPage customMargin](self, "customMargin");
    v94 = v134 + v108;
    if (!v34)
      goto LABEL_28;
    goto LABEL_27;
  }
  -[RUIPage customEdgeInsets](self, "customEdgeInsets");
  v94 = v134 + v103;
  MaxY = MaxY + v104;
  v101 = v43 - (v103 + v105);
  v88 = v88 - (v104 + v106);
  if (v34)
  {
LABEL_27:
    -[RUIPage elementProvider](self, "elementProvider");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "tableViewOM");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "tableView");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "setFrame:", v94, MaxY, v101, v88);

  }
LABEL_28:
  -[RUIPage elementProvider](self, "elementProvider");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "tableViewOM");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "viewDidLayout");

  if (v35)
  {
    -[RUIPage elementProvider](self, "elementProvider");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "webViewOM");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "webView");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "setFrame:", v94, MaxY, v101, v88);

  }
  -[RUIPage elementProvider](self, "elementProvider");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "spinnerViewOM");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "viewDidLayout");

  if (v33)
  {
    -[RUIPage elementProvider](self, "elementProvider");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "passcodeViewOM");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "passcodeView");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "setFrame:", v134, v133, v43, v10 - v133);

  }
  -[RUIPage elementProvider](self, "elementProvider");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "passcodeViewOM");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "viewDidLayout");

  -[RUIPage primaryElement](self, "primaryElement");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "view");
  v125 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v125, "contentInset");
    objc_msgSend(v125, "setContentInset:", v133);
  }
  -[RUIPage primaryElement](self, "primaryElement");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "view");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "setFrame:", v134, v6, v43, v10);

  -[RUIPage primaryElement](self, "primaryElement");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "view");
  v129 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v129, "layoutIfNeeded");

  -[RUIPage primaryElement](self, "primaryElement");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v129) = objc_opt_respondsToSelector();

  if ((v129 & 1) != 0)
  {
    -[RUIPage primaryElement](self, "primaryElement");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "viewDidLayout");

  }
}

- (id)preferredFocusEnvironments
{
  void *v3;
  void *v4;
  void *v5;
  void **v6;
  void *v7;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  -[RUIPage primaryElement](self, "primaryElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[RUIPage primaryElement](self, "primaryElement");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v5;
    v6 = (void **)v11;
  }
  else if (-[RUIPage hasTableView](self, "hasTableView"))
  {
    -[RUIPage tableViewOM](self, "tableViewOM");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v5;
    v6 = &v10;
  }
  else
  {
    if (!-[RUIPage hasPasscodeView](self, "hasPasscodeView"))
      return 0;
    -[RUIPage passcodeViewOM](self, "passcodeViewOM");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "passcodeView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v5;
    v6 = &v9;
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1, v9, v10, v11[0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)addDidAppearBlock:(id)a3
{
  id v4;
  NSMutableArray *didAppearCallbacks;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  void *aBlock;

  v4 = a3;
  didAppearCallbacks = self->_didAppearCallbacks;
  aBlock = v4;
  if (!didAppearCallbacks)
  {
    v6 = (NSMutableArray *)objc_opt_new();
    v7 = self->_didAppearCallbacks;
    self->_didAppearCallbacks = v6;

    v4 = aBlock;
    didAppearCallbacks = self->_didAppearCallbacks;
  }
  v8 = _Block_copy(v4);
  -[NSMutableArray addObject:](didAppearCallbacks, "addObject:", v8);

}

- (BOOL)_shouldShowMultiChoiceElement
{
  BOOL v2;
  void *v3;
  void *v4;

  if (self->_toolbar)
    return 0;
  -[RUIPage elementProvider](self, "elementProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "spinnerViewOM");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v4 == 0;

  return v2;
}

- (void)dismissIfPresentedWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint8_t v11[16];

  v4 = (void (**)(_QWORD))a3;
  -[RUIPage navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[RUIPage navigationController](self, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, v4);

  }
  else
  {
    -[RUIPage presentingViewController](self, "presentingViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      if (_isInternalInstall())
      {
        _RUILoggingFacility();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v11 = 0;
          _os_log_impl(&dword_209E87000, v9, OS_LOG_TYPE_DEFAULT, "Dismissing modally presented view controller.", v11, 2u);
        }

      }
      -[RUIPage dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v4);
    }
    else
    {
      _RUILoggingFacility();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[RUIPage dismissIfPresentedWithCompletion:].cold.1(v10);

      v4[2](v4);
    }
  }

}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1096);
}

- (NSString)pageID
{
  return self->_pageID;
}

- (void)setPageID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 968);
}

- (UIView)containerView
{
  return self->_containerView;
}

- (RUIPageElement)pageElement
{
  return self->_pageElement;
}

- (RUIStyle)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
  objc_storeStrong((id *)&self->_style, a3);
}

- (NSString)validationFunction
{
  return self->_validationFunction;
}

- (void)setValidationFunction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 984);
}

- (NSString)navTitle
{
  return self->_navTitle;
}

- (NSString)navSubTitle
{
  return self->_navSubTitle;
}

- (NSString)backButtonTitle
{
  return self->_backButtonTitle;
}

- (BOOL)showsTitlesAsHeaderViews
{
  return self->_showsTitlesAsHeaderViews;
}

- (BOOL)hidesBackButton
{
  return self->_hidesBackButton;
}

- (RUIBarButtonItem)rightNavigationBarButtonItem
{
  return self->_rightNavigationBarButtonItem;
}

- (RUIBarButtonItem)leftNavigationBarButtonItem
{
  return self->_leftNavigationBarButtonItem;
}

- (RUIBarButtonItem)rightToolbarButtonItem
{
  return self->_rightToolbarButtonItem;
}

- (RUIBarButtonItem)leftToolbarButtonItem
{
  return self->_leftToolbarButtonItem;
}

- (RUIBarButtonItem)middleToolbarButtonItem
{
  return self->_middleToolbarButtonItem;
}

- (UIBarButtonItem)rightToolbarItem
{
  return self->_rightToolbarItem;
}

- (void)setRightToolbarItem:(id)a3
{
  objc_storeStrong((id *)&self->_rightToolbarItem, a3);
}

- (UIBarButtonItem)leftToolbarItem
{
  return self->_leftToolbarItem;
}

- (void)setLeftToolbarItem:(id)a3
{
  objc_storeStrong((id *)&self->_leftToolbarItem, a3);
}

- (UIBarButtonItem)middleToolbarItem
{
  return self->_middleToolbarItem;
}

- (void)setMiddleToolbarItem:(id)a3
{
  objc_storeStrong((id *)&self->_middleToolbarItem, a3);
}

- (UIToolbar)toolbar
{
  return self->_toolbar;
}

- (RUIObjectModel)objectModel
{
  return (RUIObjectModel *)objc_loadWeakRetained((id *)&self->_objectModel);
}

- (NSArray)childPages
{
  return &self->_childPages->super;
}

- (RUIPage)parentPage
{
  return (RUIPage *)objc_loadWeakRetained((id *)&self->_parentPage);
}

- (double)customMargin
{
  return self->_customMargin;
}

- (UIEdgeInsets)customEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_customEdgeInsets.top;
  left = self->_customEdgeInsets.left;
  bottom = self->_customEdgeInsets.bottom;
  right = self->_customEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setCustomEdgeInsets:(UIEdgeInsets)a3
{
  self->_customEdgeInsets = a3;
}

- (NSString)loadingTitle
{
  return self->_loadingTitle;
}

- (BOOL)isLoading
{
  return self->_loading;
}

- (RUITopLevelElementProvider)elementProvider
{
  return self->_elementProvider;
}

- (void)setElementProvider:(id)a3
{
  objc_storeStrong((id *)&self->_elementProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementProvider, 0);
  objc_storeStrong((id *)&self->_loadingTitle, 0);
  objc_destroyWeak((id *)&self->_objectModel);
  objc_storeStrong((id *)&self->_middleToolbarItem, 0);
  objc_storeStrong((id *)&self->_middleToolbarButtonItem, 0);
  objc_storeStrong((id *)&self->_leftToolbarButtonItem, 0);
  objc_storeStrong((id *)&self->_rightToolbarButtonItem, 0);
  objc_storeStrong((id *)&self->_leftNavigationBarButtonItem, 0);
  objc_storeStrong((id *)&self->_rightNavigationBarButtonItem, 0);
  objc_storeStrong((id *)&self->_backButtonTitle, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_pageElement, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_elementProviders, 0);
  objc_storeStrong((id *)&self->_didAppearCallbacks, 0);
  objc_storeStrong((id *)&self->_childPages, 0);
  objc_destroyWeak((id *)&self->_parentPage);
  objc_storeStrong((id *)&self->_leftFlexSpace, 0);
  objc_storeStrong((id *)&self->_middleFlexSpace, 0);
  objc_storeStrong((id *)&self->_rightToolbarItem, 0);
  objc_storeStrong((id *)&self->_leftToolbarItem, 0);
  objc_storeStrong((id *)&self->_toolbar, 0);
  objc_storeStrong((id *)&self->_navSubTitle, 0);
  objc_storeStrong((id *)&self->_navTitle, 0);
  objc_storeStrong((id *)&self->_validationFunction, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_pageID, 0);
}

- (void)notifyPageDidChangePublisher
{
  RUIPage *v2;

  v2 = self;
  sub_209EE5488();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2545BB590);
  sub_209EE5820(&qword_2545BB088, MEMORY[0x24BDB9CA8]);
  sub_209F66CA0();

  swift_release();
}

- (void)dismissIfPresentedWithCompletion:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
}

@end
