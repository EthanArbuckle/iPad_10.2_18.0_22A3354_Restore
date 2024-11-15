@implementation SSChromePlaceholderView

- (SSChromePlaceholderView)initWithFrame:(CGRect)a3
{
  SSChromePlaceholderView *v3;
  SSChromePlaceholderView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SSChromePlaceholderView;
  v3 = -[SSChromePlaceholderView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SSChromePlaceholderView _initializeBarButtonItems](v3, "_initializeBarButtonItems");
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSChromePlaceholderView setTintColor:](v4, "setTintColor:", v5);

  }
  return v4;
}

- (double)topBarHeight
{
  double v2;

  -[UINavigationBar bounds](self->_topBar, "bounds");
  return v2;
}

- (void)safeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSChromePlaceholderView;
  -[SSChromePlaceholderView safeAreaInsetsDidChange](&v3, sel_safeAreaInsetsDidChange);
  -[SSChromePlaceholderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSChromePlaceholderView;
  -[SSChromePlaceholderView layoutSubviews](&v3, sel_layoutSubviews);
  -[SSChromePlaceholderView _layoutTopBar](self, "_layoutTopBar");
  -[SSChromePlaceholderView _updateBarButtonItemPositionsAnimated:](self, "_updateBarButtonItemPositionsAnimated:", 0);
}

- (void)_initializeBarButtonItems
{
  UINavigationItem *v3;
  UINavigationItem *managedNavigationItem;
  UIBarButtonItem *v5;
  UIBarButtonItem *shareItem;
  UIBarButtonItem *v7;
  UIBarButtonItem *doneItem;
  UIBarButtonItem *v9;
  UIBarButtonItem *undoItem;
  UIBarButtonItem *v11;
  UIBarButtonItem *redoItem;
  UIBarButtonItem *v13;
  UIBarButtonItem *deleteItem;
  SSVellumOpacityControl *v15;
  SSVellumOpacityControl *opacityControl;
  SSVellumOpacityControl *v17;
  double v18;
  double v19;
  double v20;
  UIBarButtonItem *v21;
  UIBarButtonItem *opacityItem;
  void *v23;
  objc_class *v24;
  VKSelectableBarButtonItem *v25;
  VKSelectableBarButtonItem *annotationEnabledButton;
  void *v27;
  void *v28;
  id v29;
  VKImageAnalysisBarButtonItem *v30;
  VKImageAnalysisBarButtonItem *aaBarButtonItem;
  UIBarButtonItem *v32;
  UIBarButtonItem *v33;
  UIBarButtonItem *v34;
  NSArray *v35;
  NSArray *barItems;
  NSArray *v37;
  NSArray *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[7];

  v48[6] = *MEMORY[0x24BDAC8D0];
  v3 = (UINavigationItem *)objc_alloc_init(MEMORY[0x24BDF6C00]);
  managedNavigationItem = self->_managedNavigationItem;
  self->_managedNavigationItem = v3;

  -[UINavigationBar pushNavigationItem:animated:](self->_topBar, "pushNavigationItem:animated:", self->_managedNavigationItem, 0);
  objc_msgSend(MEMORY[0x24BDF6860], "_sss_shareItemWithTarget:action:", self, 0);
  v5 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();
  shareItem = self->_shareItem;
  self->_shareItem = v5;

  v7 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 0, self, 0);
  doneItem = self->_doneItem;
  self->_doneItem = v7;

  objc_msgSend(MEMORY[0x24BDF6860], "_sss_undoItemWithTarget:action:", self, 0);
  v9 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();
  undoItem = self->_undoItem;
  self->_undoItem = v9;

  objc_msgSend(MEMORY[0x24BDF6860], "_sss_redoItemWithTarget:action:", self, 0);
  v11 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();
  redoItem = self->_redoItem;
  self->_redoItem = v11;

  objc_msgSend(MEMORY[0x24BDF6860], "_sss_trashItemWithTarget:action:", self, 0);
  v13 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();
  deleteItem = self->_deleteItem;
  self->_deleteItem = v13;

  v15 = objc_alloc_init(SSVellumOpacityControl);
  opacityControl = self->_opacityControl;
  self->_opacityControl = v15;

  v17 = self->_opacityControl;
  +[SSVellumOpacityControl preferredWidth](SSVellumOpacityControl, "preferredWidth");
  v19 = v18;
  -[SSVellumOpacityControl intrinsicContentSize](self->_opacityControl, "intrinsicContentSize");
  -[SSVellumOpacityControl setFrame:](v17, "setFrame:", 0.0, 0.0, v19, v20);
  v21 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithCustomView:", self->_opacityControl);
  opacityItem = self->_opacityItem;
  self->_opacityItem = v21;

  v44 = 0;
  v45 = &v44;
  v46 = 0x2050000000;
  v23 = (void *)getVKSelectableBarButtonItemClass_softClass;
  v47 = getVKSelectableBarButtonItemClass_softClass;
  if (!getVKSelectableBarButtonItemClass_softClass)
  {
    v39 = MEMORY[0x24BDAC760];
    v40 = 3221225472;
    v41 = __getVKSelectableBarButtonItemClass_block_invoke;
    v42 = &unk_24D06B990;
    v43 = &v44;
    __getVKSelectableBarButtonItemClass_block_invoke((uint64_t)&v39);
    v23 = (void *)v45[3];
  }
  v24 = objc_retainAutorelease(v23);
  _Block_object_dispose(&v44, 8);
  v25 = (VKSelectableBarButtonItem *)objc_alloc_init(v24);
  annotationEnabledButton = self->_annotationEnabledButton;
  self->_annotationEnabledButton = v25;

  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("pencil.tip.crop.circle"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKSelectableBarButtonItem setImage:](self->_annotationEnabledButton, "setImage:", v27);

  v44 = 0;
  v45 = &v44;
  v46 = 0x2050000000;
  v28 = (void *)getVKImageAnalysisBarButtonItemClass_softClass;
  v47 = getVKImageAnalysisBarButtonItemClass_softClass;
  if (!getVKImageAnalysisBarButtonItemClass_softClass)
  {
    v39 = MEMORY[0x24BDAC760];
    v40 = 3221225472;
    v41 = __getVKImageAnalysisBarButtonItemClass_block_invoke;
    v42 = &unk_24D06B990;
    v43 = &v44;
    __getVKImageAnalysisBarButtonItemClass_block_invoke((uint64_t)&v39);
    v28 = (void *)v45[3];
  }
  v29 = objc_retainAutorelease(v28);
  _Block_object_dispose(&v44, 8);
  objc_msgSend(v29, "analysisButtonWithTarget:action:mode:", self, 0, 0);
  v30 = (VKImageAnalysisBarButtonItem *)objc_claimAutoreleasedReturnValue();
  aaBarButtonItem = self->_aaBarButtonItem;
  self->_aaBarButtonItem = v30;

  -[VKImageAnalysisBarButtonItem setEnabled:](self->_aaBarButtonItem, "setEnabled:", 0);
  v32 = self->_doneItem;
  v48[0] = self->_shareItem;
  v48[1] = v32;
  v33 = self->_redoItem;
  v48[2] = self->_undoItem;
  v48[3] = v33;
  v34 = self->_opacityItem;
  v48[4] = self->_deleteItem;
  v48[5] = v34;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v48, 6);
  v35 = (NSArray *)objc_claimAutoreleasedReturnValue();
  barItems = self->_barItems;
  self->_barItems = v35;

  if ((objc_msgSend(getVKCImageAnalyzerClass(), "supportedAnalysisTypes") & 1) != 0)
  {
    -[NSArray arrayByAddingObject:](self->_barItems, "arrayByAddingObject:", self->_aaBarButtonItem);
    v37 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v38 = self->_barItems;
    self->_barItems = v37;

  }
}

- (void)_updateBarButtonItemPositionsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  SSVellumOpacityControl *opacityControl;
  double v15;
  void *v16;
  UIBarButtonItem *v17;
  void *v18;
  UIBarButtonItem **p_shareItem;
  uint64_t v20;
  UIBarButtonItem *deleteItem;
  VKSelectableBarButtonItem *annotationEnabledButton;
  VKImageAnalysisBarButtonItem *aaBarButtonItem;
  void *v24;
  UINavigationBar *v25;
  UINavigationItem *v26;
  UINavigationItem *managedNavigationItem;
  id v28;
  UIBarButtonItem *v29;
  UIBarButtonItem *v30;
  VKSelectableBarButtonItem *v31;
  void *v32;
  UIBarButtonItem *shareItem;
  UIBarButtonItem *v34;
  VKSelectableBarButtonItem *v35;
  VKImageAnalysisBarButtonItem *v36;
  void *v37;
  uint64_t v38;

  v3 = a3;
  v38 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSChromeHelper defaultBarButtonSpacing](SSChromeHelper, "defaultBarButtonSpacing");
  +[SSChromeHelper createFixedSpaceBarButtonItemWithWidth:](SSChromeHelper, "createFixedSpaceBarButtonItemWithWidth:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSChromeHelper defaultBarButtonSpacing](SSChromeHelper, "defaultBarButtonSpacing");
  v9 = v8;
  -[SSChromePlaceholderView traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "userInterfaceIdiom");

  if (v11 == 1)
  {
    -[UIBarButtonItem _setFlexible:](self->_opacityItem, "_setFlexible:", 0);
    +[SSChromeHelper widthForOpacityControlInView:withContentSwitcher:](SSChromeHelper, "widthForOpacityControlInView:withContentSwitcher:", self, 0);
    v13 = v12;
    opacityControl = self->_opacityControl;
    -[SSVellumOpacityControl intrinsicContentSize](opacityControl, "intrinsicContentSize");
    -[SSVellumOpacityControl setFrame:](opacityControl, "setFrame:", 0.0, 0.0, v13, v15);
    objc_msgSend(v5, "addObject:", self->_doneItem);
    objc_msgSend(MEMORY[0x24BDF6860], "fixedSpaceItemOfWidth:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v16);

    objc_msgSend(v5, "addObject:", self->_opacityItem);
    if ((objc_msgSend(getVKCImageAnalyzerClass(), "supportedAnalysisTypes") & 1) != 0)
    {
      deleteItem = self->_deleteItem;
      annotationEnabledButton = self->_annotationEnabledButton;
      aaBarButtonItem = self->_aaBarButtonItem;
      shareItem = self->_shareItem;
      v34 = deleteItem;
      v35 = annotationEnabledButton;
      v36 = aaBarButtonItem;
      v37 = v7;
      v18 = (void *)MEMORY[0x24BDBCE30];
      p_shareItem = &shareItem;
      v20 = 5;
    }
    else
    {
      v17 = self->_deleteItem;
      v29 = self->_shareItem;
      v30 = v17;
      v31 = self->_annotationEnabledButton;
      v32 = v7;
      v18 = (void *)MEMORY[0x24BDBCE30];
      p_shareItem = &v29;
      v20 = 4;
    }
    objc_msgSend(v18, "arrayWithObjects:count:", p_shareItem, v20, v29, v30, v31, v32, shareItem, v34, v35, v36, v37);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v24);

  }
  v25 = self->_topBar;
  -[UINavigationItem setLeftBarButtonItems:animated:](self->_managedNavigationItem, "setLeftBarButtonItems:animated:", v5, v3);
  -[UINavigationItem setRightBarButtonItems:animated:](self->_managedNavigationItem, "setRightBarButtonItems:animated:", v6, v3);
  -[UINavigationItem setTitleView:](self->_managedNavigationItem, "setTitleView:", 0);
  -[UINavigationBar topItem](v25, "topItem");
  v26 = (UINavigationItem *)objc_claimAutoreleasedReturnValue();
  managedNavigationItem = self->_managedNavigationItem;

  if (v26 != managedNavigationItem)
  {
    v28 = -[UINavigationBar popNavigationItemAnimated:](v25, "popNavigationItemAnimated:", 0);
    -[UINavigationBar pushNavigationItem:animated:](v25, "pushNavigationItem:animated:", self->_managedNavigationItem, 0);
  }

}

- (void)_layoutTopBar
{
  UINavigationBar *v3;
  UINavigationBar *topBarBackground;
  UINavigationBar *v5;
  UINavigationBar *topBar;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UIView *v11;
  UIView *topBarSeparatorLine;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  CGFloat v25;
  _QWORD v26[13];
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  if (!self->_topBarBackground)
  {
    v3 = (UINavigationBar *)objc_alloc_init(MEMORY[0x24BDF6BE0]);
    topBarBackground = self->_topBarBackground;
    self->_topBarBackground = v3;

    -[UINavigationBar setDelegate:](self->_topBarBackground, "setDelegate:", self);
    +[SSChromeHelper configureNavigationBarAppearance:](SSChromeHelper, "configureNavigationBarAppearance:", self->_topBarBackground);
    -[SSChromePlaceholderView addSubview:](self, "addSubview:", self->_topBarBackground);
  }
  if (!self->_topBar)
  {
    v5 = (UINavigationBar *)objc_alloc_init(MEMORY[0x24BDF6BE0]);
    topBar = self->_topBar;
    self->_topBar = v5;

    -[UINavigationBar layer](self->_topBar, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAllowsGroupOpacity:", 1);

    -[UINavigationBar setAlpha:](self->_topBar, "setAlpha:", self->_contentAlpha);
    -[UINavigationBar setDelegate:](self->_topBar, "setDelegate:", self);
    objc_msgSend(MEMORY[0x24BDF6AA0], "defaultFormat");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setOpaque:", 0);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6A98]), "initWithSize:format:", v8, 1.0, 1.0);
    objc_msgSend(v9, "imageWithActions:", &__block_literal_global);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationBar setBackgroundImage:forBarMetrics:](self->_topBar, "setBackgroundImage:forBarMetrics:", v10, 1);
    -[UINavigationBar setBackgroundImage:forBarMetrics:](self->_topBar, "setBackgroundImage:forBarMetrics:", v10, 0);
    -[UINavigationBar setShadowImage:](self->_topBar, "setShadowImage:", v10);
    -[SSChromePlaceholderView addSubview:](self, "addSubview:", self->_topBar);
    +[SSChromeHelper separatorView](SSChromeHelper, "separatorView");
    v11 = (UIView *)objc_claimAutoreleasedReturnValue();
    topBarSeparatorLine = self->_topBarSeparatorLine;
    self->_topBarSeparatorLine = v11;

    -[UINavigationBar addSubview:](self->_topBar, "addSubview:", self->_topBarSeparatorLine);
  }
  -[SSChromePlaceholderView bounds](self, "bounds");
  -[UINavigationBar sizeThatFits:](self->_topBar, "sizeThatFits:", v13, v14);
  v16 = v15;
  v18 = v17;
  -[SSChromePlaceholderView safeAreaInsets](self, "safeAreaInsets");
  v20 = v19;
  +[SSChromeHelper barSeparatorSize](SSChromeHelper, "barSeparatorSize");
  v22 = v21;
  v23 = v18 - v21;
  -[SSChromePlaceholderView bounds](self, "bounds");
  v25 = v24;
  -[UINavigationBar bringSubviewToFront:](self->_topBar, "bringSubviewToFront:", self->_topBarSeparatorLine);
  -[UINavigationBar frame](self->_topBar, "frame");
  v30.origin.x = 0.0;
  v30.origin.y = v20;
  v30.size.width = v16;
  v30.size.height = v18;
  if (!CGRectEqualToRect(v27, v30))
    goto LABEL_8;
  -[UINavigationBar frame](self->_topBarBackground, "frame");
  v31.origin.x = 0.0;
  v31.origin.y = v20;
  v31.size.width = v16;
  v31.size.height = v18;
  if (!CGRectEqualToRect(v28, v31)
    || (-[UIView frame](self->_topBarSeparatorLine, "frame"),
        v32.origin.x = 0.0,
        v32.origin.y = v23,
        v32.size.width = v25,
        v32.size.height = v22,
        !CGRectEqualToRect(v29, v32)))
  {
LABEL_8:
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __40__SSChromePlaceholderView__layoutTopBar__block_invoke_2;
    v26[3] = &unk_24D06B968;
    v26[4] = self;
    v26[5] = 0;
    *(CGFloat *)&v26[6] = v20;
    *(CGFloat *)&v26[7] = v16;
    *(double *)&v26[8] = v18;
    v26[9] = 0;
    *(double *)&v26[10] = v23;
    *(CGFloat *)&v26[11] = v25;
    *(CGFloat *)&v26[12] = v22;
    objc_msgSend(MEMORY[0x24BDF6F90], "performWithoutAnimation:", v26);
  }
}

uint64_t __40__SSChromePlaceholderView__layoutTopBar__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "setFrame:", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)setContentAlpha:(double)a3
{
  self->_contentAlpha = a3;
  -[UINavigationBar setAlpha:](self->_topBar, "setAlpha:");
}

- (int64_t)positionForBar:(id)a3
{
  if (self->_topBar == a3)
    return 3;
  if (self->_topBarBackground == a3)
    return 3;
  return 0;
}

- (double)contentAlpha
{
  return self->_contentAlpha;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aaBarButtonItem, 0);
  objc_storeStrong((id *)&self->_annotationEnabledButton, 0);
  objc_storeStrong((id *)&self->_barItems, 0);
  objc_storeStrong((id *)&self->_topBarSeparatorLine, 0);
  objc_storeStrong((id *)&self->_topBarBackground, 0);
  objc_storeStrong((id *)&self->_topBar, 0);
  objc_storeStrong((id *)&self->_opacityView, 0);
  objc_storeStrong((id *)&self->_opacityControl, 0);
  objc_storeStrong((id *)&self->_opacityItem, 0);
  objc_storeStrong((id *)&self->_undoRedoSpacerItem, 0);
  objc_storeStrong((id *)&self->_redoItem, 0);
  objc_storeStrong((id *)&self->_undoItem, 0);
  objc_storeStrong((id *)&self->_deleteItem, 0);
  objc_storeStrong((id *)&self->_doneItem, 0);
  objc_storeStrong((id *)&self->_shareItem, 0);
  objc_storeStrong((id *)&self->_managedNavigationItem, 0);
}

@end
