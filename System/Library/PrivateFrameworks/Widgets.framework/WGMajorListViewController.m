@implementation WGMajorListViewController

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)WGMajorListViewController;
  -[WGWidgetListViewController viewWillAppear:](&v5, sel_viewWillAppear_);
  -[WGMajorListViewController _updateHeaderVisibility](self, "_updateHeaderVisibility");
  -[WGMajorListViewController _updateFooterVisibility](self, "_updateFooterVisibility");
  -[WGMajorListViewController _updateEditButtonVisibilityAnimated:](self, "_updateEditButtonVisibilityAnimated:", 0);
  -[UIViewController wg_beginAppearanceTransitionIfNecessary:animated:](self->_headerContentViewController, "wg_beginAppearanceTransitionIfNecessary:animated:", 1, v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WGMajorListViewController;
  -[WGWidgetListViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[UIViewController wg_endAppearanceTransitionIfNecessary](self->_headerContentViewController, "wg_endAppearanceTransitionIfNecessary");
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)WGMajorListViewController;
  -[WGWidgetListViewController viewWillDisappear:](&v5, sel_viewWillDisappear_);
  -[UIViewController wg_beginAppearanceTransitionIfNecessary:animated:](self->_headerContentViewController, "wg_beginAppearanceTransitionIfNecessary:animated:", 0, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WGMajorListViewController;
  -[WGWidgetListViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[UIViewController wg_endAppearanceTransitionIfNecessary](self->_headerContentViewController, "wg_endAppearanceTransitionIfNecessary");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setHeaderContentViewController:(id)a3
{
  UIViewController *v5;
  UIViewController **p_headerContentViewController;
  UIViewController *headerContentViewController;
  UIViewController *v8;
  _QWORD v9[5];

  v5 = (UIViewController *)a3;
  p_headerContentViewController = &self->_headerContentViewController;
  headerContentViewController = self->_headerContentViewController;
  if (headerContentViewController != v5)
  {
    if (headerContentViewController && self->_headerView)
    {
      -[WGMajorListViewController bs_removeChildViewController:](self, "bs_removeChildViewController:");
      -[WGWidgetListHeaderView removeFromSuperview](self->_headerView, "removeFromSuperview");
    }
    objc_storeStrong((id *)&self->_headerContentViewController, a3);
    v8 = *p_headerContentViewController;
    if (*p_headerContentViewController)
    {
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __60__WGMajorListViewController_setHeaderContentViewController___block_invoke;
      v9[3] = &unk_24D7324A0;
      v9[4] = self;
      -[WGMajorListViewController bs_addChildViewController:withSuperview:animated:transitionBlock:](self, "bs_addChildViewController:withSuperview:animated:transitionBlock:", v8, 0, 0, v9);
    }
  }

}

void __60__WGMajorListViewController_setHeaderContentViewController___block_invoke(uint64_t a1)
{
  WGWidgetListHeaderView *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = -[WGWidgetListHeaderView initWithContentView:]([WGWidgetListHeaderView alloc], "initWithContentView:", v5);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 1120);
  *(_QWORD *)(v3 + 1120) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_insertHeaderView");
  objc_msgSend(*(id *)(a1 + 32), "_didUpdateStackViewArrangedSubviews");

}

- (void)_insertHeaderView
{
  void *v3;
  double v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  double v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  void *v26;
  int v27;
  int v28;
  int v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  uint64_t v46;
  void *v47;
  int v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  int v55;
  int v56;
  void *v57;
  void *v58;
  int v59;
  int v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  int v65;
  void *v66;
  int v67;
  void *v68;
  void *v69;
  void *v70;
  int v71;
  int v72;
  void *v73;
  void *v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;

  -[WGWidgetListHeaderView contentView](self->_headerView, "contentView");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView insertArrangedSubview:atIndex:](self->super._stackView, "insertArrangedSubview:atIndex:", self->_headerView, 0);
  -[WGWidgetListViewController _didUpdateStackViewArrangedSubviews](self, "_didUpdateStackViewArrangedSubviews");
  objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend(v73, "deviceClass");
  if (v72 == 2)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "_referenceBounds");
    if (CGRectGetHeight(v75) <= 1194.0)
    {
      v5 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v3, "homeButtonType") == 2)
      {

        v4 = 32.0;
LABEL_39:

        goto LABEL_40;
      }
      v63 = v3;
      v5 = 1;
    }
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v6, "deviceClass");
  if (v71 == 2)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_referenceBounds");
    if (CGRectGetHeight(v76) <= 1024.0)
    {
      v69 = v7;
      v9 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "homeButtonType") == 2)
      {

        v4 = 44.0;
        if ((v5 & 1) == 0)
          goto LABEL_38;
LABEL_37:

        goto LABEL_38;
      }
      v62 = v8;
      v69 = v7;
      v9 = 1;
    }
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "deviceClass");
  if (v11 == 2)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_referenceBounds");
    if (CGRectGetHeight(v77) > 1194.0)
    {

      v13 = 0x4040000000000000;
LABEL_23:
      v4 = *(double *)&v13;
      goto LABEL_32;
    }
    v64 = v12;
    v11 = 2;
  }
  objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend(v70, "deviceClass");
  if (v67 == 2)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_referenceBounds");
    if (CGRectGetHeight(v78) > 1080.0)
    {

      if (v11 == 2)
      v13 = 0x4046000000000000;
      goto LABEL_23;
    }
    v58 = v14;
  }
  objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v66, "deviceClass");
  if (v65 == 2)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_referenceBounds");
    if (CGRectGetHeight(v79) > 1024.0)
    {

      if (v67 == 2)
      if (v11 == 2)

      v4 = 37.0;
      goto LABEL_32;
    }
    v52 = v15;
  }
  objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 29.0;
  if (objc_msgSend(v19, "deviceClass") != 2)
  {
    v61 = v19;
    v59 = v9;
    v60 = v5;
    objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v57, "deviceClass");
    if (!v56
      || (objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance"),
          v51 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v51, "deviceClass") == 1))
    {
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "_referenceBounds");
      if (CGRectGetHeight(v80) <= 812.0)
      {
        v53 = 0x100000000;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v39, "homeButtonType") == 2 && _BSUI_Private_IsN84())
        {

          if (v56)
          if (v65 == 2)

          if (v67 == 2)
          if (v11 == 2)

          v4 = 0.0;
LABEL_32:
          v16 = v69;
          v17 = v71;
          if ((v9 & 1) == 0)
            goto LABEL_34;
          goto LABEL_33;
        }
        v53 = 0x100000001;
      }
    }
    else
    {
      v53 = 0;
    }
    objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v54, "deviceClass");
    if (!v55
      || (objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance"),
          v47 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v47, "deviceClass") == 1))
    {
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "_referenceBounds");
      if (CGRectGetHeight(v81) <= 812.0)
      {
        v20 = 0;
        v50 = 1;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "homeButtonType") == 2)
        {

          if (v55)
          v22 = v57;
          v23 = v56;
          if ((v53 & 1) != 0)
          {
LABEL_98:

            if ((v53 & 0x100000000) == 0)
              goto LABEL_72;
            goto LABEL_71;
          }
LABEL_70:
          if (!HIDWORD(v53))
          {
LABEL_72:
            if (v23)

            v4 = 0.0;
            v19 = v61;
            goto LABEL_75;
          }
LABEL_71:

          goto LABEL_72;
        }
        v34 = v21;
        v50 = 1;
        v20 = 1;
      }
    }
    else
    {
      v50 = 0;
      v20 = 0;
    }
    objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v24, "deviceClass");
    v49 = v24;
    if (!v48
      || (objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance"),
          v42 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v42, "deviceClass") == 1))
    {
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "_referenceBounds");
      if (CGRectGetHeight(v82) <= 736.0)
      {
        v46 = 0x100000000;
      }
      else
      {
        v25 = v20;
        objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v26, "homeButtonType") == 2)
        {

          if (v48)
          v22 = v57;
          v23 = v56;
          if ((v25 & 1) != 0)
          {
LABEL_125:

            if ((v50 & 1) == 0)
            {
LABEL_95:
              if (v55)

              if ((_DWORD)v53)
                goto LABEL_98;
              goto LABEL_70;
            }
LABEL_94:

            goto LABEL_95;
          }
LABEL_93:
          if (!v50)
            goto LABEL_95;
          goto LABEL_94;
        }
        v33 = v26;
        v46 = 0x100000001;
        v20 = v25;
      }
    }
    else
    {
      v46 = 0;
    }
    objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v45, "deviceClass");
    if (!v44
      || (objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance"),
          v36 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v36, "deviceClass") == 1))
    {
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "_referenceBounds");
      if (CGRectGetHeight(v83) > 667.0)
      {
        v29 = v20;
LABEL_113:
        v22 = v57;
        v23 = v56;

        goto LABEL_116;
      }
      v27 = v20;
      v37 = v11;
      v28 = 1;
    }
    else
    {
      v27 = v20;
      v37 = v11;
      v28 = 0;
    }
    objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "deviceClass");
    if (v31
      && (objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance"),
          v35 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v35, "deviceClass") != 1)
      || (objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"),
          v32 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v32, "_referenceBounds"),
          CGRectGetHeight(v84),
          v32,
          v31))
    {
      v29 = v27;

      if ((v28 & 1) != 0)
      {
LABEL_112:
        v9 = v59;
        v5 = v60;
        v11 = v37;
        goto LABEL_113;
      }
    }
    else
    {
      v29 = v27;

      if (v28)
        goto LABEL_112;
    }
    v9 = v59;
    v5 = v60;
    v11 = v37;
    v22 = v57;
    v23 = v56;
LABEL_116:
    if (v44)

    if ((_DWORD)v46)
    {

    }
    else if (!HIDWORD(v46))
    {
      goto LABEL_122;
    }

LABEL_122:
    if (v48)

    if (v29)
      goto LABEL_125;
    goto LABEL_93;
  }
LABEL_75:

  if (v65 == 2)
  if (v67 == 2)

  if (v11 == 2)
  v16 = v69;
  v17 = v71;
  if (v9)
LABEL_33:

LABEL_34:
  if (v17 == 2)

  if (v5)
    goto LABEL_37;
LABEL_38:
  if (v72 == 2)
    goto LABEL_39;
LABEL_40:

  objc_msgSend(v74, "layoutMargins");
  -[UIStackView setCustomSpacing:afterView:](self->super._stackView, "setCustomSpacing:afterView:", self->_headerView, v4 - v18);

}

- (void)setHeaderVisible:(BOOL)a3
{
  id v4;

  if (self->_headerVisible != a3)
  {
    self->_headerVisible = a3;
    -[WGWidgetListViewController delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "majorListViewControllerDidChangeHeaderVisibility:", self);

  }
}

- (void)_setFooterVisible:(BOOL)a3
{
  if (self->_footerVisible != a3)
  {
    self->_footerVisible = a3;
    -[WGMajorListViewController _updateEditButtonVisibilityAnimated:](self, "_updateEditButtonVisibilityAnimated:", -[WGMajorListViewController _appearState](self, "_appearState") != 0);
  }
}

- (void)enumerateWidgetWrapperViewsUsingBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[UIStackView arrangedSubviews](self->super._stackView, "arrangedSubviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __67__WGMajorListViewController_enumerateWidgetWrapperViewsUsingBlock___block_invoke;
  v7[3] = &unk_24D7324C8;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

void __67__WGMajorListViewController_enumerateWidgetWrapperViewsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (BOOL)hasWidget
{
  void *v3;
  uint64_t v4;
  void *v5;

  -[WGWidgetDiscoveryController enabledWidgetIdentifiersForAllGroups](self->super._discoveryController, "enabledWidgetIdentifiersForAllGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  -[WGWidgetDiscoveryController disabledWidgetIdentifiers](self->super._discoveryController, "disabledWidgetIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = v4 + objc_msgSend(v5, "count") != 0;

  return v4;
}

- (NSArray)extraViewsContainers
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = self->super._stackView;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)extraViews
{
  void *v3;
  id v4;
  void *v5;
  NSArray *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void *v11;
  WGMajorListViewController *v12;
  id v13;

  v3 = (void *)objc_opt_new();
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __39__WGMajorListViewController_extraViews__block_invoke;
  v11 = &unk_24D7324F0;
  v12 = self;
  v4 = v3;
  v13 = v4;
  -[WGWidgetListViewController _invokeBlockWithPlatterViewsVisibleInBounds:](self, "_invokeBlockWithPlatterViewsVisibleInBounds:", &v8);
  if (-[WGMajorListViewController isHeaderVisible](self, "isHeaderVisible", v8, v9, v10, v11, v12))
    objc_msgSend(v4, "insertObject:atIndex:", self->_headerView, 0);
  if (-[WGMajorListViewController _isFooterVisible](self, "_isFooterVisible"))
    objc_msgSend(v4, "addObject:", self->_footerView);
  v5 = v13;
  v6 = (NSArray *)v4;

  return v6;
}

void __39__WGMajorListViewController_extraViews__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_wrapperViewForWidgetPlatterView:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

- (BOOL)shouldAnimateLastTwoViewsAsOne
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  BOOL v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  int v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;

  -[WGMajorListViewController extraViews](self, "extraViews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v2, "count") < 2)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v2, "lastObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_class();
    v5 = v3;
    if (v4)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = v5;
      else
        v6 = 0;
    }
    else
    {
      v6 = 0;
    }
    v8 = v6;

    if (!v8)
      goto LABEL_11;
    objc_msgSend(v8, "bounds");
    v10 = v9;
    v12 = v11;
    objc_msgSend(v8, "platterView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    v15 = v14;
    v17 = v16;

    v18 = 1;
    if (v10 == v15 && v12 == v17)
    {
LABEL_11:
      objc_msgSend(v2, "lastObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_opt_class();
      v21 = v19;
      if (v20)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v22 = v21;
        else
          v22 = 0;
      }
      else
      {
        v22 = 0;
      }
      v23 = v22;

      if (v23)
      {
        objc_msgSend(v23, "contentView");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v24;
        if (v24)
          objc_msgSend(v24, "transform");
        v18 = BSFloatLessThanFloat();

      }
      else
      {
        v18 = 0;
      }

    }
    v7 = v18 != 0;
  }

  return v7;
}

- (BOOL)shouldAnimateFirstTwoViewsAsOne
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  BOOL v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;

  -[WGMajorListViewController extraViews](self, "extraViews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v2, "count") < 2)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v2, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_class();
    v5 = v3;
    if (v4)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = v5;
      else
        v6 = 0;
    }
    else
    {
      v6 = 0;
    }
    v8 = v6;

    if (v8)
    {
      objc_msgSend(v8, "bounds");
      v10 = v9;
      v12 = v11;
      objc_msgSend(v8, "platterView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bounds");
      v7 = v12 != v15 || v10 != v14;

    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (id)extraViewsContainer
{
  return self->super._stackView;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  id v8;
  uint64_t v9;
  void (**v10)(_QWORD);
  void *v11;
  _QWORD v12[4];
  void (**v13)(_QWORD);
  _QWORD v14[6];
  _QWORD v15[5];
  _QWORD v16[5];
  id v17;
  objc_super v18;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)WGMajorListViewController;
  -[WGWidgetListViewController viewWillTransitionToSize:withTransitionCoordinator:](&v18, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  if (-[UIViewController wg_isAppearingOrAppeared](self, "wg_isAppearingOrAppeared"))
  {
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x3032000000;
    v16[3] = __Block_byref_object_copy__4;
    v16[4] = __Block_byref_object_dispose__4;
    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v9 = MEMORY[0x24BDAC760];
    v17 = v8;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __80__WGMajorListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v15[3] = &unk_24D732098;
    v15[4] = v16;
    -[WGWidgetListViewController _invokeBlockWithPlatterViewsVisibleInBounds:](self, "_invokeBlockWithPlatterViewsVisibleInBounds:", v15);
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __80__WGMajorListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
    v14[3] = &unk_24D732518;
    v14[4] = self;
    v14[5] = v16;
    v10 = (void (**)(_QWORD))MEMORY[0x219A0A970](v14);
    v11 = v10;
    if (v7)
    {
      v12[0] = v9;
      v12[1] = 3221225472;
      v12[2] = __80__WGMajorListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_4;
      v12[3] = &unk_24D731890;
      v13 = v10;
      objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v12);

    }
    else
    {
      v10[2](v10);
    }

    _Block_object_dispose(v16, 8);
  }

}

void __80__WGMajorListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "listItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v3);
    v3 = v4;
  }

}

void __80__WGMajorListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _QWORD v13[5];
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __80__WGMajorListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3;
  v13[3] = &unk_24D732098;
  v2 = *(void **)(a1 + 32);
  v13[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "_invokeBlockWithPlatterViewsVisibleInBounds:", v13);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(v8, "wg_beginAppearanceTransitionIfNecessary:animated:", 0, 0, (_QWORD)v9);
        objc_msgSend(v8, "wg_endAppearanceTransitionIfNecessary");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v5);
  }

}

void __80__WGMajorListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "listItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "containsObject:", v3))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "removeObject:", v4);
    }
    else
    {
      objc_msgSend(v4, "wg_beginAppearanceTransitionIfNecessary:animated:", 1, 0);
      objc_msgSend(v4, "wg_endAppearanceTransitionIfNecessary");
    }
    v3 = v4;
  }

}

uint64_t __80__WGMajorListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_group
{
  return CFSTR("TodayGroup");
}

- (void)_configureStackView
{
  WGWidgetListFooterView *v3;
  WGWidgetListFooterView *footerView;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WGMajorListViewController;
  -[WGWidgetListViewController _configureStackView](&v8, sel__configureStackView);
  v3 = objc_alloc_init(WGWidgetListFooterView);
  footerView = self->_footerView;
  self->_footerView = v3;

  -[WGWidgetListFooterView setDelegate:](self->_footerView, "setDelegate:", self);
  -[WGWidgetListFooterView editButton](self->_footerView, "editButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addTarget:action:forControlEvents:", self, sel_editButtonTapped_, 64);

  -[WGWidgetListFooterView widgetAvailableButton](self->_footerView, "widgetAvailableButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel_editButtonTapped_, 64);

  -[WGWidgetListFooterView customizeButton](self->_footerView, "customizeButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addTarget:action:forControlEvents:", self, sel_presentEditView_, 64);

  -[WGMajorListViewController _updateFooterViewShouldBlurContent](self, "_updateFooterViewShouldBlurContent");
  -[WGMajorListViewController invalidateVisibleWidgets](self, "invalidateVisibleWidgets");
}

- (void)_repopulateStackViewWithWidgetIdentifiers:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WGMajorListViewController;
  -[WGWidgetListViewController _repopulateStackViewWithWidgetIdentifiers:](&v4, sel__repopulateStackViewWithWidgetIdentifiers_, a3);
  if (self->_headerView)
    -[WGMajorListViewController _insertHeaderView](self, "_insertHeaderView");
  if (self->_footerView)
    -[UIStackView addArrangedSubview:](self->super._stackView, "addArrangedSubview:");
  -[WGWidgetListViewController _didUpdateStackViewArrangedSubviews](self, "_didUpdateStackViewArrangedSubviews");
}

- (unint64_t)_insertionIndexofListItem:(id)a3 intoWidgetViews:(id)a4 withOrderedIdentifiers:(id)a5
{
  id v6;
  void *v7;
  char v8;
  char v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WGMajorListViewController;
  v6 = -[WGWidgetListViewController _insertionIndexofListItem:intoWidgetViews:withOrderedIdentifiers:](&v11, sel__insertionIndexofListItem_intoWidgetViews_withOrderedIdentifiers_, a3, a4, a5);
  if (self->_headerContentViewController && self->_headerView)
  {
    -[UIStackView arrangedSubviews](self->super._stackView, "arrangedSubviews");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", self->_headerView);
    if (v6)
      v9 = 0;
    else
      v9 = v8;

    if ((v9 & 1) != 0)
      return 1;
  }
  return (unint64_t)v6;
}

- (void)setShouldBlurContent:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WGMajorListViewController;
  -[WGWidgetListViewController setShouldBlurContent:](&v4, sel_setShouldBlurContent_, a3);
  -[WGMajorListViewController _updateFooterViewShouldBlurContent](self, "_updateFooterViewShouldBlurContent");
}

- (void)setEditingIcons:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  objc_super v6;

  v3 = a3;
  v5 = -[WGWidgetListViewController isEditingIcons](self, "isEditingIcons");
  v6.receiver = self;
  v6.super_class = (Class)WGMajorListViewController;
  -[WGWidgetListViewController setEditingIcons:](&v6, sel_setEditingIcons_, v3);
  if (v5 != v3)
  {
    -[WGMajorListViewController _updateFooterVisibility](self, "_updateFooterVisibility");
    -[WGMajorListViewController _updateEditButtonVisibilityAnimated:](self, "_updateEditButtonVisibilityAnimated:", 1);
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WGMajorListViewController;
  -[WGWidgetListViewController scrollViewDidScroll:](&v4, sel_scrollViewDidScroll_, a3);
  -[WGMajorListViewController _updateHeaderVisibility](self, "_updateHeaderVisibility");
  -[WGMajorListViewController _updateFooterVisibility](self, "_updateFooterVisibility");
}

- (void)widgetListFooterViewAvailableNewWidgetsUpdated:(id)a3
{
  void *v4;
  id v5;

  -[WGWidgetListFooterView editButton](self->_footerView, "editButton", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addTarget:action:forControlEvents:", self, sel_editButtonTapped_, 64);

  -[WGWidgetListFooterView widgetAvailableButton](self->_footerView, "widgetAvailableButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addTarget:action:forControlEvents:", self, sel_editButtonTapped_, 64);

}

- (id)editingMaterialViewForWidgetListFooterView:(id)a3
{
  void *v4;
  void *v5;

  -[WGWidgetListViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "editingMaterialViewForWidgetListViewController:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)presentEditView:(id)a3
{
  -[WGWidgetDiscoveryController presentWidgetListEditViewControllerFromViewController:animated:completion:](self->super._discoveryController, "presentWidgetListEditViewControllerFromViewController:animated:completion:", self, 1, 0);
}

- (void)editButtonTapped:(id)a3
{
  id v4;

  -[WGWidgetListViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "editButtonTappedFromWidgetListViewController:", self);

}

- (void)_updateFooterViewShouldBlurContent
{
  -[WGWidgetListFooterView setShouldBlurContent:](self->_footerView, "setShouldBlurContent:", -[WGWidgetListViewController shouldBlurContent](self, "shouldBlurContent"));
  -[WGWidgetListFooterView setMaterialGroupNameBase:](self->_footerView, "setMaterialGroupNameBase:", CFSTR("WGWidgetListViewControllerGroupName"));
}

- (void)invalidateVisibleWidgets
{
  void *v3;
  void *v4;
  id v5;

  -[WGWidgetDiscoveryController visibleWidgetIdentifiersForGroup:](self->super._discoveryController, "visibleWidgetIdentifiersForGroup:", CFSTR("TodayGroup"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WGWidgetDiscoveryController visibleWidgetIdentifiersForGroup:](self->super._discoveryController, "visibleWidgetIdentifiersForGroup:", CFSTR("WidgetGroup"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[WGWidgetListFooterView setVisibleWidgetsIDs:](self->_footerView, "setVisibleWidgetsIDs:", v5);
}

- (void)widgetDiscoveryController:(id)a3 widgetWithIdentifier:(id)a4 shouldBecomeVisibleInGroup:(id)a5
{
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  int v16;
  void *v17;
  void *v18;
  void (**v19)(_QWORD);
  id v20;

  v20 = a4;
  v7 = a5;
  -[WGMajorListViewController _group](self, "_group");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  v10 = v20;
  if (v9)
  {
    -[WGWidgetListViewController _platterViewForWidgetWithIdentifier:creatingIfNecessary:](self, "_platterViewForWidgetWithIdentifier:creatingIfNecessary:", v20, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
      goto LABEL_5;
    -[WGWidgetListViewController _wrapperViewForWidgetPlatterView:](self, "_wrapperViewForWidgetPlatterView:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12
      || (v13 = (void *)v12,
          -[UIStackView arrangedSubviews](self->super._stackView, "arrangedSubviews"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = objc_msgSend(v14, "containsObject:", v13),
          v14,
          v13,
          (v15 & 1) == 0))
    {
LABEL_5:
      v16 = -[WGMajorListViewController _appearState](self, "_appearState");
      -[WGWidgetListViewController _listItemViewControllerForWidgetWithIdentifier:creatingIfNecessary:](self, "_listItemViewControllerForWidgetWithIdentifier:creatingIfNecessary:", v20, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[WGWidgetListViewController visibleWidgetIdentifiers](self, "visibleWidgetIdentifiers");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[WGWidgetListViewController _insert:listItem:withOrderedIdentifiers:animated:](self, "_insert:listItem:withOrderedIdentifiers:animated:", 1, v17, v18, v16 == 2);
      v19 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();

      if (v16 == 2)
        objc_msgSend(v17, "wg_beginAppearanceTransitionIfNecessary:animated:", 1, 1);
      if (v19)
        v19[2](v19);
      if (v16 == 2)
        objc_msgSend(v17, "wg_endAppearanceTransitionIfNecessary");
      -[WGMajorListViewController invalidateVisibleWidgets](self, "invalidateVisibleWidgets");

    }
    v10 = v20;
  }

}

- (void)widgetDiscoveryController:(id)a3 widgetWithIdentifier:(id)a4 shouldBecomeHiddenInGroup:(id)a5
{
  id v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  void (**v13)(_QWORD);
  id v14;

  v14 = a4;
  v7 = a5;
  -[WGMajorListViewController _group](self, "_group");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if (v9)
  {
    v10 = -[WGMajorListViewController _appearState](self, "_appearState");
    -[WGWidgetListViewController _listItemViewControllerForWidgetWithIdentifier:creatingIfNecessary:](self, "_listItemViewControllerForWidgetWithIdentifier:creatingIfNecessary:", v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetListViewController visibleWidgetIdentifiers](self, "visibleWidgetIdentifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetListViewController _insert:listItem:withOrderedIdentifiers:animated:](self, "_insert:listItem:withOrderedIdentifiers:animated:", 0, v11, v12, v10 == 2);
    v13 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();

    if (v10 == 2)
      objc_msgSend(v11, "wg_beginAppearanceTransitionIfNecessary:animated:", 0, 1);
    if (v13)
      v13[2](v13);
    if (v10 == 2)
      objc_msgSend(v11, "wg_endAppearanceTransitionIfNecessary");
    -[WGWidgetListViewController _pruneAlternateCaptureOnlyMaterialViews](self, "_pruneAlternateCaptureOnlyMaterialViews");
    -[WGMajorListViewController invalidateVisibleWidgets](self, "invalidateVisibleWidgets");

  }
}

- (void)_updateHeaderVisibility
{
  void *v3;
  double MaxY;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  CGRect v11;

  if (self->_headerContentViewController)
  {
    -[WGMajorListViewController headerContentViewController](self, "headerContentViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "view");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    -[WGWidgetListHeaderView frame](self->_headerView, "frame");
    MaxY = CGRectGetMaxY(v11);
    objc_msgSend(v10, "origin");
    v6 = MaxY + v5;
    -[UIScrollView contentOffset](self->super._scrollView, "contentOffset");
    v8 = v7;
    -[UIScrollView contentInset](self->super._scrollView, "contentInset");
    -[WGMajorListViewController setHeaderVisible:](self, "setHeaderVisible:", v6 > v8 + v9);

  }
  else
  {
    -[WGMajorListViewController setHeaderVisible:](self, "setHeaderVisible:", 0);
  }
}

- (void)_updateFooterVisibility
{
  WGWidgetListFooterView *footerView;
  double MinY;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _BOOL4 v13;
  void *v14;
  double v15;
  double v16;
  _BOOL8 v17;
  CGRect v18;

  footerView = self->_footerView;
  if (footerView)
  {
    -[WGWidgetListFooterView frame](footerView, "frame");
    MinY = CGRectGetMinY(v18);
    -[WGWidgetListFooterView contentView](self->_footerView, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "origin");
    v7 = MinY + v6;

    -[UIScrollView contentOffset](self->super._scrollView, "contentOffset");
    if (v8 >= 0.0)
      v9 = v8;
    else
      v9 = 0.0;
    -[UIScrollView contentInset](self->super._scrollView, "contentInset");
    v11 = v9 + v10;
    -[UIScrollView bounds](self->super._scrollView, "bounds");
    v13 = v7 <= v11 + v12;
    -[WGWidgetListFooterView contentView](self->_footerView, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "alpha");
    v16 = v15;

    v17 = v16 > 0.1 && v13;
  }
  else
  {
    v17 = 0;
  }
  -[WGMajorListViewController _setFooterVisible:](self, "_setFooterVisible:", v17);
}

- (void)_updateEditButtonVisibilityAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  _BOOL4 v6;
  double v7;
  double v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[7];
  BOOL v17;

  v3 = a3;
  -[WGWidgetListViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && !objc_msgSend(v5, "isWidgetListViewControllerEditable:", self))
  {
    -[WGWidgetListViewController editButton](self, "editButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAlpha:", 0.0);

    -[WGMajorListViewController footerView](self, "footerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "editButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAlpha:", 0.0);

    -[WGMajorListViewController footerView](self, "footerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "customizeButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAlpha:", 0.0);

  }
  else
  {
    if (-[WGWidgetListViewController isEditingIcons](self, "isEditingIcons"))
    {
      v6 = -[WGMajorListViewController _isFooterVisible](self, "_isFooterVisible");
      if (v6)
        v7 = 0.0;
      else
        v7 = 1.0;
      if (v6)
        v8 = 0.01;
      else
        v8 = 1.0;
    }
    else
    {
      v7 = 0.0;
      v8 = 0.01;
    }
    v9 = -[WGWidgetListViewController isEditingIcons](self, "isEditingIcons");
    if (v9)
      LOBYTE(v9) = -[WGMajorListViewController hasWidget](self, "hasWidget");
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __65__WGMajorListViewController__updateEditButtonVisibilityAnimated___block_invoke;
    v16[3] = &unk_24D732540;
    v16[4] = self;
    *(double *)&v16[5] = v7;
    *(double *)&v16[6] = v8;
    v17 = v9;
    v10 = MEMORY[0x219A0A970](v16);
    v11 = (void *)v10;
    if (v3)
      objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v10, 0.2);
    else
      (*(void (**)(uint64_t))(v10 + 16))(v10);
  }

}

void __65__WGMajorListViewController__updateEditButtonVisibilityAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  CGAffineTransform v11;

  objc_msgSend(*(id *)(a1 + 32), "editButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", *(double *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "editButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CGAffineTransformMakeScale(&v11, *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 48));
  objc_msgSend(v3, "setTransform:", &v11);

  objc_msgSend(*(id *)(a1 + 32), "footerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "editButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "isEditingIcons"))
    v6 = 0.0;
  else
    v6 = 1.0;
  objc_msgSend(v5, "setAlpha:", v6);

  objc_msgSend(*(id *)(a1 + 32), "footerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "customizeButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (*(_BYTE *)(a1 + 56))
    v10 = 1.0;
  else
    v10 = 0.0;
  objc_msgSend(v8, "setAlpha:", v10);

}

- (BOOL)_isFooterVisible
{
  return self->_footerVisible;
}

- (UIView)containerView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_containerView);
}

- (void)setContainerView:(id)a3
{
  objc_storeWeak((id *)&self->_containerView, a3);
}

- (WGWidgetListFooterView)footerView
{
  return self->_footerView;
}

- (UIViewController)headerContentViewController
{
  return self->_headerContentViewController;
}

- (WGWidgetListHeaderView)headerView
{
  return self->_headerView;
}

- (BOOL)isHeaderVisible
{
  return self->_headerVisible;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_headerContentViewController, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_destroyWeak((id *)&self->_containerView);
}

@end
