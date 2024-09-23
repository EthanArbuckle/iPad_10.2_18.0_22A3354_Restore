@implementation UITabBarCustomizeView

- (UITabBarCustomizeView)initWithFrame:(CGRect)a3
{
  UITabBarCustomizeView *v3;
  UILabel *v4;
  UILabel *titleLabel;
  UILabel *v6;
  void *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)UITabBarCustomizeView;
  v3 = -[UIView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[UIView setAutoresizingMask:](v3, "setAutoresizingMask:", 18);
  -[UIView setAutoresizesSubviews:](v3, "setAutoresizesSubviews:", 1);
  if (v3)
  {
    v3->_itemsInRowCount = 3;
    v4 = objc_alloc_init(UILabel);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v4;

    v6 = v3->_titleLabel;
    _UINSLocalizedStringWithDefaultValue(CFSTR("Drag the icons to organize tabs."), CFSTR("Drag the icons to organize tabs."));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v6, "setText:", v7);

    v8 = v3->_titleLabel;
    -[UITabBarCustomizeView titleLabelFont](v3, "titleLabelFont");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v8, "setFont:", v9);

    v10 = v3->_titleLabel;
    +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v10, "setTextColor:", v11);

    -[UILabel setTextAlignment:](v3->_titleLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v3->_titleLabel, "setLineBreakMode:", 4);
    -[UIView addSubview:](v3, "addSubview:", v3->_titleLabel);
    -[UIView setExclusiveTouch:](v3, "setExclusiveTouch:", 1);
    -[UIView setMultipleTouchEnabled:](v3, "setMultipleTouchEnabled:", 0);
  }
  return v3;
}

- (id)titleLabelFont
{
  void *v3;
  void *v4;
  NSString *v5;
  NSComparisonResult v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  v6 = UIContentSizeCategoryCompareToCategory(v5, CFSTR("UICTContentSizeCategoryAccessibilityL"));

  if (v6 == NSOrderedDescending)
  {
    +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:](UITraitCollection, "traitCollectionWithPreferredContentSizeCategory:", CFSTR("UICTContentSizeCategoryAccessibilityL"));
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }
  +[UIFontMetrics metricsForTextStyle:](UIFontMetrics, "metricsForTextStyle:", CFSTR("UICTFontTextStyleTitle2"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E167A828, "systemFontOfSize:", 21.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scaledFontForFont:compatibleWithTraitCollection:", v9, v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  UILabel *titleLabel;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UITabBarCustomizeView;
  v4 = a3;
  -[UIView traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  objc_msgSend(v4, "preferredContentSizeCategory", v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if ((v7 & 1) == 0)
  {
    titleLabel = self->_titleLabel;
    -[UITabBarCustomizeView titleLabelFont](self, "titleLabelFont");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](titleLabel, "setFont:", v9);

    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)tintTabBarItemsForEdit:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v19 = 0uLL;
    v20 = 0uLL;
    v17 = 0uLL;
    v18 = 0uLL;
    -[UITabBar items](self->_tabBar, "items");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "_setSelected:", -[NSArray containsObject:](self->_availableItems, "containsObject:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i)));
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v6);
    }
  }
  else
  {
    v15 = 0uLL;
    v16 = 0uLL;
    v13 = 0uLL;
    v14 = 0uLL;
    -[UITabBar items](self->_tabBar, "items", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        for (j = 0; j != v10; ++j)
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * j), "_setSelected:", *(UITabBarItem **)(*((_QWORD *)&v13 + 1) + 8 * j) == self->_selectedBeforeItem);
        }
        v10 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
      }
      while (v10);
    }
  }

}

- (void)updateProxiesSelection
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_proxies;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        -[UITabBar items](self->_tabBar, "items", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "item");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setSelected:", objc_msgSend(v9, "containsObject:", v10) ^ 1);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (void)setIsBeingDismissed
{
  self->_isBeingDismissed = 1;
}

- (int64_t)_barMetrics
{
  return -[UITabBar _barMetrics](self->_tabBar, "_barMetrics");
}

- (void)setTabBar:(id)a3 currentItems:(id)a4 availableItems:(id)a5
{
  id v8;
  NSMutableArray *v9;
  NSMutableArray *proxies;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  UITabBarItemProxy *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSMutableArray *v20;
  NSMutableArray *fixedItems;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  id obj;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v29 = a3;
  v8 = a5;
  objc_storeStrong((id *)&self->_tabBar, a3);
  v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  proxies = self->_proxies;
  self->_proxies = v9;

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v8;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v35 != v13)
          objc_enumerationMutation(obj);
        v15 = -[UITabBarItemProxy initWithItem:inTabBar:]([UITabBarItemProxy alloc], "initWithItem:inTabBar:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i), v29);
        -[UITabBarItemProxy view](v15, "view");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "_setUnselectedTintColor:", v17);

        -[NSMutableArray addObject:](self->_proxies, "addObject:", v15);
        -[UITabBarItemProxy view](v15, "view");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView addSubview:](self, "addSubview:", v18);

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v12);
  }

  -[UITabBarCustomizeView updateProxiesSelection](self, "updateProxiesSelection");
  objc_msgSend(v29, "items");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (NSMutableArray *)objc_msgSend(v19, "mutableCopy");
  fixedItems = self->_fixedItems;
  self->_fixedItems = v20;

  -[NSMutableArray removeObjectsInArray:](self->_fixedItems, "removeObjectsInArray:", obj);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[UITabBar items](self->_tabBar, "items");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v31 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
        if (objc_msgSend(v27, "_isSelected"))
          objc_storeStrong((id *)&self->_selectedBeforeItem, v27);
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v24);
  }

  -[UITabBarCustomizeView setAvailableItems:](self, "setAvailableItems:", obj);
  -[UIView setNeedsLayout](self, "setNeedsLayout");

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double MaxY;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  int v31;
  void *v32;
  uint64_t v33;
  _BOOL4 v34;
  double v36;
  double height;
  int v38;
  void *v39;
  int *v40;
  uint64_t v41;
  _BOOL4 v42;
  void *v43;
  void *v44;
  unint64_t v45;
  int64_t v46;
  char v47;
  BOOL v48;
  _BOOL4 v49;
  int v50;
  uint64_t v51;
  UITabBarCustomizeView *v52;
  UITabBarCustomizeView *v53;
  UITabBarCustomizeView *v54;
  double MinX;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  CGRect *p_firstItemRect;
  double width;
  double v69;
  CGFloat v70;
  double gridOffset;
  NSMutableArray *v72;
  uint64_t v73;
  uint64_t v74;
  int v75;
  uint64_t v76;
  double v77;
  uint64_t i;
  void *v79;
  double v80;
  double v81;
  double v82;
  CGFloat v83;
  double v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _QWORD v89[5];
  _BYTE v90[128];
  uint64_t v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;

  v91 = *MEMORY[0x1E0C80C00];
  -[UIView bounds](self->_tabBar, "bounds");
  -[UIView safeAreaInsets](self, "safeAreaInsets");
  v4 = v3;
  -[UITabBarCustomizeView navigationBar](self, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = v6;
  v9 = v8;

  -[UITabBarCustomizeView navigationBar](self, "navigationBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFrame:", 0.0, v4, v7, v9);

  v92.origin.x = 0.0;
  v92.origin.y = v4;
  v92.size.width = v7;
  v92.size.height = v9;
  MaxY = CGRectGetMaxY(v92);
  -[UIView safeAreaInsets](self, "safeAreaInsets");
  v15 = v14;
  v17 = v16;
  if (v12 >= MaxY)
    v18 = v12;
  else
    v18 = MaxY;
  -[UIView bounds](self, "bounds", v13);
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v27 = v15 + v17;
  v28 = -[NSMutableArray count](self->_proxies, "count");
  -[UIView traitCollection](self, "traitCollection");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "horizontalSizeClass");
  v31 = dyld_program_sdk_at_least();
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "userInterfaceIdiom");

  v34 = (v33 & 0xFFFFFFFFFFFFFFFBLL) == 1;
  if (v31)
    v34 = (v30 & 0xFFFFFFFFFFFFFFFDLL) == 0 && (v33 & 0xFFFFFFFFFFFFFFFBLL) == 1;
  v36 = v24 - v27;
  if (v34)
    height = 160.0;
  else
    height = 80.0;

  v38 = *((_DWORD *)&self->super._viewFlags + 4);
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = &OBJC_IVAR___UIBarButtonItem__minimumWidth;
  v41 = v28 << 32;
  if (objc_msgSend(v39, "userInterfaceIdiom"))
  {

    if (v41 >= 0xC00000001)
    {
      v42 = 0;
LABEL_19:
      v46 = vcvtmd_s64_f64(v36 / height);
      v47 = 1;
      goto LABEL_20;
    }
  }
  else
  {
    -[UIView window](self, "window");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "windowScene");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "interfaceOrientation") - 3;
    v42 = v45 < 2;

    if (v41 > 0xC00000000)
    {
      v40 = &OBJC_IVAR___UIBarButtonItem__minimumWidth;
      goto LABEL_19;
    }
    if (v45 <= 1)
    {
      v47 = 0;
      v42 = 1;
      v46 = 5;
      v40 = &OBJC_IVAR___UIBarButtonItem__minimumWidth;
LABEL_20:
      self->_itemsInRowCount = v46;
      v48 = v41 <= 0x900000000;
      v49 = v41 > 0x900000000;
      if (!v48)
        v42 = 1;
      goto LABEL_27;
    }
    v40 = &OBJC_IVAR___UIBarButtonItem__minimumWidth;
  }
  self->_itemsInRowCount = 3;
  if (v41 <= 0x900000000)
  {
    v49 = 0;
    v47 = 0;
    v50 = v40[472];
    v51 = v50;
    goto LABEL_32;
  }
  v47 = 0;
  v42 = 1;
  v49 = 1;
LABEL_27:
  v50 = v40[472];
  v51 = v50;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v50), "superview");
  v52 = (UITabBarCustomizeView *)objc_claimAutoreleasedReturnValue();
  v53 = v52;
  if (v42)

  if (v53 == self)
  {
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v50), "removeFromSuperview");
    goto LABEL_34;
  }
LABEL_32:
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v51), "superview");
  v54 = (UITabBarCustomizeView *)objc_claimAutoreleasedReturnValue();

  if (v54 != self)
    -[UIView addSubview:](self, "addSubview:", *(Class *)((char *)&self->super.super.super.isa + v51));
LABEL_34:
  -[UITabBarCustomizeView updateProxiesSelection](self, "updateProxiesSelection");
  v89[0] = MEMORY[0x1E0C809B0];
  v89[1] = 3221225472;
  v89[2] = __39__UITabBarCustomizeView_layoutSubviews__block_invoke;
  v89[3] = &unk_1E16B1B28;
  v89[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v89);
  if ((v47 & 1) != 0)
  {
    v93.origin.x = v15 + v20;
    v93.origin.y = v22 + v18;
    v93.size.width = v36;
    v93.size.height = v26 - (v84 + v18);
    self->_gridOffset = CGRectGetMinY(v93);
    v94.origin.x = v15 + v20;
    v94.origin.y = v22 + v18;
    v94.size.width = v36;
    v94.size.height = v26 - (v84 + v18);
    MinX = CGRectGetMinX(v94);
    UIRoundToViewScale(self);
    height = v56;
  }
  else
  {
    -[UIView bounds](self, "bounds");
    UIRoundToViewScale(self);
    MinX = v57;
    -[NSArray count](self->_availableItems, "count");
    -[UIView bounds](self, "bounds");
    v59 = 0.0;
    if (!v49)
    {
      objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v50), "sizeThatFits:", v58 - (MinX + MinX), 3.40282347e38);
      v59 = v60;
    }
    -[UIView bounds](self, "bounds");
    if (-[NSMutableArray count](self->_proxies, "count"))
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_proxies, "objectAtIndexedSubscript:", 0);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "view");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "frame");

    }
    UIRoundToViewScale(self);
    if (!v49)
    {
      UIRoundToViewScale(self);
      v65 = v64;
      v66 = *(Class *)((char *)&self->super.super.super.isa + v50);
      -[UIView bounds](self, "bounds");
      UIRoundToViewScale(self);
      objc_msgSend(v66, "setFrame:");
      v63 = v59 + v65 + 20.0;
    }
    self->_gridOffset = v63;
  }
  p_firstItemRect = &self->_firstItemRect;
  self->_firstItemRect.size.width = height;
  self->_firstItemRect.size.height = height;
  width = height;
  v69 = MinX;
  if ((v38 & 0x80000) != 0)
  {
    -[UIView bounds](self, "bounds");
    v70 = CGRectGetWidth(v95) - MinX;
    v96.origin.x = p_firstItemRect->origin.x;
    v96.origin.y = self->_firstItemRect.origin.y;
    v96.size.width = self->_firstItemRect.size.width;
    v96.size.height = self->_firstItemRect.size.height;
    v69 = v70 - CGRectGetWidth(v96);
    width = self->_firstItemRect.size.width;
    height = self->_firstItemRect.size.height;
  }
  p_firstItemRect->origin.x = v69;
  gridOffset = self->_gridOffset;
  self->_firstItemRect.origin.y = gridOffset;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v72 = self->_proxies;
  v73 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v72, "countByEnumeratingWithState:objects:count:", &v85, v90, 16);
  if (v73)
  {
    v74 = v73;
    v75 = 0;
    v76 = *(_QWORD *)v86;
    v77 = 0.5;
    do
    {
      for (i = 0; i != v74; ++i)
      {
        if (*(_QWORD *)v86 != v76)
          objc_enumerationMutation(v72);
        objc_msgSend(*(id *)(*((_QWORD *)&v85 + 1) + 8 * i), "view");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "frame");
        objc_msgSend(v79, "setFrame:", round(width * 0.5 + v69 - v80 * v77), round(height * 0.5 + gridOffset - v81 * v77));
        if ((v75 + 1 + i) % self->_itemsInRowCount)
        {
          if ((v38 & 0x80000) != 0)
            v69 = v69 - width;
          else
            v69 = width + v69;
        }
        else
        {
          v82 = MinX;
          if ((v38 & 0x80000) != 0)
          {
            -[UIView bounds](self, "bounds", MinX);
            v83 = CGRectGetWidth(v97) - MinX;
            v98.origin.x = v69;
            v98.origin.y = gridOffset;
            v98.size.width = width;
            v98.size.height = height;
            v82 = v83 - CGRectGetWidth(v98);
            v77 = 0.5;
          }
          gridOffset = height + gridOffset;
          v69 = v82;
        }

      }
      v75 += v74;
      v74 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v72, "countByEnumeratingWithState:objects:count:", &v85, v90, 16);
    }
    while (v74);
  }

}

uint64_t __39__UITabBarCustomizeView_layoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "tintTabBarItemsForEdit:", *(_BYTE *)(*(_QWORD *)(a1 + 32) + 560) == 0);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  int v8;
  double height;
  double width;
  double y;
  double x;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  int v20;
  int64_t v21;
  int64_t itemsInRowCount;
  uint64_t v23;
  UITabBarItemProxy *v24;
  UITabBarItemProxy *draggingProxy;
  UITabBarItemProxy *v26;
  void *v27;
  UISnapshotView *v28;
  UISnapshotView *dragImage;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  UIImageView *v44;
  void *v45;
  UIImageView *v46;
  UIImageView *replacementGlow;
  _QWORD v48[5];
  id v49;
  id v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;

  v6 = a3;
  v7 = a4;
  if (!self->_draggingProxy)
  {
    v8 = *((_DWORD *)&self->super._viewFlags + 4);
    width = self->_firstItemRect.size.width;
    height = self->_firstItemRect.size.height;
    x = self->_firstItemRect.origin.x;
    y = self->_firstItemRect.origin.y;
    if ((v8 & 0x80000) != 0)
    {
      -[UIView bounds](self, "bounds");
      v13 = CGRectGetWidth(v51);
      v52.origin.x = x;
      v52.origin.y = y;
      v52.size.width = width;
      v52.size.height = height;
      v14 = v13 - CGRectGetWidth(v52);
      v53.origin.x = x;
      v53.origin.y = y;
      v53.size.width = width;
      v53.size.height = height;
      x = v14 - CGRectGetMinX(v53);
    }
    objc_msgSend(v6, "anyObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "locationInView:", self);
    v17 = v16;
    v19 = v18;

    v20 = vcvtmd_s64_f64((v17 - x) / width);
    v21 = v20 & ~(v20 >> 31);
    itemsInRowCount = self->_itemsInRowCount;
    if (itemsInRowCount <= v21)
      LODWORD(v21) = itemsInRowCount - 1;
    if ((*(_QWORD *)&v8 & 0x80000) != 0)
      LODWORD(v21) = ~(_DWORD)v21 + itemsInRowCount;
    v23 = (int)(floor((v19 - y) / height) * (double)itemsInRowCount + (double)(int)v21);
    if ((v23 & 0x80000000) != 0
      || -[NSMutableArray count](self->_proxies, "count") <= (unint64_t)v23)
    {
      v24 = 0;
    }
    else
    {
      -[NSMutableArray objectAtIndex:](self->_proxies, "objectAtIndex:", v23);
      v24 = (UITabBarItemProxy *)objc_claimAutoreleasedReturnValue();
    }
    draggingProxy = self->_draggingProxy;
    self->_draggingProxy = v24;

    v26 = self->_draggingProxy;
    if (v26)
    {
      -[UITabBarItemProxy view](v26, "view");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_alloc_init(UISnapshotView);
      dragImage = self->_dragImage;
      self->_dragImage = v28;

      -[UISnapshotView captureSnapshotOfView:withSnapshotType:](self->_dragImage, "captureSnapshotOfView:withSnapshotType:", v27, 1);
      -[UIView setOpaque:](self->_dragImage, "setOpaque:", 0);
      -[UIView setUserInteractionEnabled:](self->_dragImage, "setUserInteractionEnabled:", 0);
      -[UIView superview](self, "superview");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "bounds");
      objc_msgSend(v30, "convertRect:fromView:", v27);
      v32 = v31;
      v34 = v33;
      v36 = v35;
      v38 = v37;
      objc_msgSend(v6, "anyObject");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "locationInView:", self);
      v41 = v40;
      v43 = v42;

      self->_startPoint.x = round(v41 - (v32 + v36 * 0.5));
      self->_startPoint.y = round(v43 - (v34 + v38 * 0.5));
      -[UISnapshotView setFrame:](self->_dragImage, "setFrame:", v32, v34, v36, v38);
      objc_msgSend(v30, "addSubview:", self->_dragImage);
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __48__UITabBarCustomizeView_touchesBegan_withEvent___block_invoke;
      v48[3] = &unk_1E16B47A8;
      v48[4] = self;
      v49 = v6;
      v50 = v7;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 32, v48, 0, 0.2, 0.0);
      if (!self->_replacementGlow)
      {
        v44 = [UIImageView alloc];
        _UIImageWithName(CFSTR("UIButtonBarPressedIndicator.png"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = -[UIImageView initWithImage:](v44, "initWithImage:", v45);
        replacementGlow = self->_replacementGlow;
        self->_replacementGlow = v46;

        -[UIView setUserInteractionEnabled:](self->_replacementGlow, "setUserInteractionEnabled:", 0);
        -[UIView setOpaque:](self->_replacementGlow, "setOpaque:", 0);
        -[UIView setAlpha:](self->_replacementGlow, "setAlpha:", 0.0);
        -[UIView addSubview:](self->_tabBar, "addSubview:", self->_replacementGlow);
      }

    }
  }

}

uint64_t __48__UITabBarCustomizeView_touchesBegan_withEvent___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  id *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  CGAffineTransform v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "items");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v25 != v5)
          objc_enumerationMutation(v2);
        v7 = *(id **)(*((_QWORD *)&v24 + 1) + 8 * i);
        -[UITabBarItem _tabBarButton](v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "_isSelected");

        if (v9)
        {
          -[UITabBarItem _tabBarButton](v7);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setAlpha:", 0.7);

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v4);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = *(id *)(*(_QWORD *)(a1 + 32) + 424);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * j), "view");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setAlpha:", 0.7);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v13);
  }

  v17 = *(void **)(*(_QWORD *)(a1 + 32) + 456);
  CGAffineTransformMakeScale(&v19, 2.0, 2.0);
  objc_msgSend(v17, "setTransform:", &v19);
  return objc_msgSend(*(id *)(a1 + 32), "adjustDragImageWithTouches:withEvent:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  UITabBarItem *v8;
  UITabBarItem *v9;
  UITabBarItem *replaceItem;
  UITabBarItem *v11;
  UITabBarItem *v12;
  UITabBarItem *v13;
  UITabBarItem *v14;
  UITabBarButton *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t *v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t);
  void *v32;
  UITabBarCustomizeView *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t);
  void *v37;
  UITabBarCustomizeView *v38;

  if (self->_draggingProxy)
  {
    v6 = a4;
    v7 = a3;
    -[UITabBarCustomizeView adjustDragImageWithTouches:withEvent:](self, "adjustDragImageWithTouches:withEvent:", v7, v6);
    v8 = self->_replaceItem;
    -[UITabBarCustomizeView itemInTabBarWithTouches:withEvent:](self, "itemInTabBarWithTouches:withEvent:", v7, v6);
    v9 = (UITabBarItem *)objc_claimAutoreleasedReturnValue();

    replaceItem = self->_replaceItem;
    self->_replaceItem = v9;

    v11 = self->_replaceItem;
    -[UITabBarItemProxy item](self->_draggingProxy, "item");
    v12 = (UITabBarItem *)objc_claimAutoreleasedReturnValue();

    if (v11 == v12)
    {
      v13 = self->_replaceItem;
      self->_replaceItem = 0;

    }
    v14 = self->_replaceItem;
    if (v14)
    {
      if (v14 != v8)
      {
        v15 = v14->_view;
        -[UIView frame](v15, "frame");
        v17 = v16;
        v19 = v18;
        v21 = v20;
        v23 = v22;

        -[UIView frame](self->_replacementGlow, "frame");
        -[UIImageView setFrame:](self->_replacementGlow, "setFrame:", v17 - round((v24 - v21) * 0.5), v19 - round((v25 - v23) * 0.5));
      }
      -[UIView alpha](self->_replacementGlow, "alpha");
      if (v28 >= 1.0)
        goto LABEL_12;
      -[UIView bringSubviewToFront:](self->_tabBar, "bringSubviewToFront:", self->_replacementGlow);
      v34 = MEMORY[0x1E0C809B0];
      v35 = 3221225472;
      v36 = __48__UITabBarCustomizeView_touchesMoved_withEvent___block_invoke;
      v37 = &unk_1E16B1B28;
      v38 = self;
      v27 = &v34;
    }
    else
    {
      -[UIView alpha](self->_replacementGlow, "alpha");
      if (v26 <= 0.0)
      {
LABEL_12:

        return;
      }
      v29 = MEMORY[0x1E0C809B0];
      v30 = 3221225472;
      v31 = __48__UITabBarCustomizeView_touchesMoved_withEvent___block_invoke_2;
      v32 = &unk_1E16B1B28;
      v33 = self;
      v27 = &v29;
    }
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v27, 0, 0.2, 0.0, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38);
    goto LABEL_12;
  }
}

uint64_t __48__UITabBarCustomizeView_touchesMoved_withEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setAlpha:", 1.0);
}

uint64_t __48__UITabBarCustomizeView_touchesMoved_withEvent___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setAlpha:", 0.0);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  UITabBarItem *v8;
  UITabBarItem *replaceItem;
  UITabBarItem *v10;
  UITabBarItem *v11;
  UITabBarItem *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  UITabBar *tabBar;
  UITabBarItem *v17;
  void *v18;
  void *v19;
  UIImageView *replacementGlow;
  _QWORD v21[6];
  _QWORD v22[6];
  char v23;
  _QWORD v24[5];
  id v25;

  v6 = a3;
  v7 = a4;
  if (self->_draggingProxy)
  {
    -[UITabBarCustomizeView itemInTabBarWithTouches:withEvent:](self, "itemInTabBarWithTouches:withEvent:", v6, v7);
    v8 = (UITabBarItem *)objc_claimAutoreleasedReturnValue();
    replaceItem = self->_replaceItem;
    self->_replaceItem = v8;

    v10 = self->_replaceItem;
    -[UITabBarItemProxy item](self->_draggingProxy, "item");
    v11 = (UITabBarItem *)objc_claimAutoreleasedReturnValue();

    if (v10 == v11)
    {
      v12 = self->_replaceItem;
      self->_replaceItem = 0;

    }
    if (self->_replaceItem)
    {
      -[UITabBar items](self->_tabBar, "items");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITabBarItemProxy item](self->_draggingProxy, "item");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "containsObject:", v14);

      tabBar = self->_tabBar;
      v17 = self->_replaceItem;
      -[UITabBarItemProxy item](self->_draggingProxy, "item");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITabBar _configureTabBarReplacingItem:withNewItem:swapping:](tabBar, "_configureTabBarReplacingItem:withNewItem:swapping:", v17, v18, v15);

      -[UITabBarItemProxy item](self->_draggingProxy, "item");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_setSelected:", 1);

      -[UIView removeFromSuperview](self->_dragImage, "removeFromSuperview");
    }
    else
    {
      LOBYTE(v15) = 0;
    }
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x3032000000;
    v24[3] = __Block_byref_object_copy__21;
    v24[4] = __Block_byref_object_dispose__21;
    v25 = 0;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __48__UITabBarCustomizeView_touchesEnded_withEvent___block_invoke;
    v22[3] = &unk_1E16B72C0;
    v23 = v15;
    v22[4] = self;
    v22[5] = v24;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __48__UITabBarCustomizeView_touchesEnded_withEvent___block_invoke_2;
    v21[3] = &unk_1E16B72E8;
    v21[4] = self;
    v21[5] = v24;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v22, v21, 0.2, 0.0);
    objc_msgSend((id)UIApp, "setIgnoresInteractionEvents:", 1);
    -[UIView removeFromSuperview](self->_replacementGlow, "removeFromSuperview");
    replacementGlow = self->_replacementGlow;
    self->_replacementGlow = 0;

    _Block_object_dispose(v24, 8);
  }

}

void __48__UITabBarCustomizeView_touchesEnded_withEvent___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  __int128 v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t j;
  id *v49;
  void *v50;
  int v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t k;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _OWORD v67[3];
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 440);
  if (*(_QWORD *)(v2 + 472))
  {
    objc_msgSend(v3, "setSelected:", 0);
    if (*(_BYTE *)(a1 + 48))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(void **)(v4 + 472);
      *(_QWORD *)(v4 + 472) = 0;

    }
    else
    {
      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      v28 = *(id *)(*(_QWORD *)(a1 + 32) + 424);
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v69;
        while (2)
        {
          for (i = 0; i != v30; ++i)
          {
            if (*(_QWORD *)v69 != v31)
              objc_enumerationMutation(v28);
            v33 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
            v34 = *(void **)(*(_QWORD *)(a1 + 32) + 472);
            objc_msgSend(v33, "item");
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            if (v34 == v35)
            {
              objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v33);
              goto LABEL_15;
            }
          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
          if (v30)
            continue;
          break;
        }
      }
LABEL_15:

      v36 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "view");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "center");
      objc_msgSend(v36, "convertPoint:toView:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 416));
      v39 = v38;
      v41 = v40;

      -[UITabBarItem _tabBarButton](*(id **)(*(_QWORD *)(a1 + 32) + 472));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setCenter:", v39, v41);

      -[UITabBarItem _tabBarButton](*(id **)(*(_QWORD *)(a1 + 32) + 472));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setAlpha:", 0.5);

    }
  }
  else
  {
    objc_msgSend(v3, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "superview");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "superview");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "convertRect:fromView:", v17, v8, v10, v12, v14);
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;

    v26 = *(void **)(*(_QWORD *)(a1 + 32) + 456);
    v27 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v67[0] = *MEMORY[0x1E0C9BAA8];
    v67[1] = v27;
    v67[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    objc_msgSend(v26, "setTransform:", v67);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "setFrame:", v19, v21, v23, v25);
  }
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "items");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
  if (v45)
  {
    v46 = v45;
    v47 = *(_QWORD *)v64;
    do
    {
      for (j = 0; j != v46; ++j)
      {
        if (*(_QWORD *)v64 != v47)
          objc_enumerationMutation(v44);
        v49 = *(id **)(*((_QWORD *)&v63 + 1) + 8 * j);
        -[UITabBarItem _tabBarButton](v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v50, "_isSelected");

        if (v51)
        {
          -[UITabBarItem _tabBarButton](v49);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "setAlpha:", 1.0);

        }
      }
      v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
    }
    while (v46);
  }

  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v53 = *(id *)(*(_QWORD *)(a1 + 32) + 424);
  v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
  if (v54)
  {
    v55 = v54;
    v56 = *(_QWORD *)v60;
    do
    {
      for (k = 0; k != v55; ++k)
      {
        if (*(_QWORD *)v60 != v56)
          objc_enumerationMutation(v53);
        objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * k), "view", (_QWORD)v59);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "setAlpha:", 1.0);

      }
      v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
    }
    while (v55);
  }

}

void __48__UITabBarCustomizeView_touchesEnded_withEvent___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  objc_msgSend((id)UIApp, "setIgnoresInteractionEvents:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setSelected:", 1);
  -[UITabBarItem _tabBarButton](*(id **)(*(_QWORD *)(a1 + 32) + 472));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[UITabBarItem _tabBarButton](*(id **)(*(_QWORD *)(a1 + 32) + 472));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 1.0);

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 472);
  *(_QWORD *)(v5 + 472) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "removeFromSuperview");
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 456);
  *(_QWORD *)(v7 + 456) = 0;

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 440);
  *(_QWORD *)(v9 + 440) = 0;

}

- (void)adjustDragImageWithTouches:(id)a3 withEvent:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;

  v5 = a3;
  -[UIView superview](self, "superview");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v5, "anyObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "locationInView:", self);
  v16 = v15;
  v18 = v17;

  if (v16 >= v7)
    v19 = v16;
  else
    v19 = v7;
  if (v19 >= v7 + v11)
    v20 = v7 + v11;
  else
    v20 = v19;
  if (v18 >= v9)
    v21 = v18;
  else
    v21 = v9;
  if (v21 >= v9 + v13)
    v22 = v9 + v13;
  else
    v22 = v21;
  -[UIView center](self->_dragImage, "center");
  -[UIView setCenter:](self->_dragImage, "setCenter:", v20 - self->_startPoint.x, v22 - self->_startPoint.y + -32.0);

}

- (id)itemInTabBarWithTouches:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  int v13;
  _BOOL4 v14;
  BOOL v15;
  void *v16;
  double v17;
  signed int v18;

  v6 = a4;
  objc_msgSend(a3, "anyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "locationInView:", self->_tabBar);
  v9 = v8;
  v11 = v10;
  -[UITabBar items](self->_tabBar, "items");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");
  v14 = -[UIView pointInside:withEvent:](self->_tabBar, "pointInside:withEvent:", v6, v9, v11);

  v15 = !v14 || v13 < 1;
  if (v15 || objc_msgSend(v7, "phase") == 4)
    goto LABEL_13;
  -[UIView bounds](self->_tabBar, "bounds");
  v16 = 0;
  v18 = vcvtmd_s64_f64(v9 / floor(v17 / (double)v13));
  if ((v18 & 0x80000000) == 0 && v18 < v13)
  {
    if ((*((_DWORD *)&self->super._viewFlags + 4) & 0x80000) != 0)
      v18 = ~v18 + v13;
    objc_msgSend(v12, "objectAtIndex:", v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (-[NSMutableArray containsObject:](self->_fixedItems, "containsObject:", v16))
  {

LABEL_13:
    v16 = 0;
  }

  return v16;
}

- (void)tabBarTouchesBegan:(id)a3 withEvent:(id)a4
{
  UITabBarItem *v5;
  UITabBarItem *draggingItem;
  UITabBarItem *v7;
  UITabBarButton *v8;
  double v9;
  double v10;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  id v14;

  v14 = a3;
  -[UITabBarCustomizeView itemInTabBarWithTouches:withEvent:](self, "itemInTabBarWithTouches:withEvent:");
  v5 = (UITabBarItem *)objc_claimAutoreleasedReturnValue();
  draggingItem = self->_draggingItem;
  self->_draggingItem = v5;

  v7 = self->_draggingItem;
  if (v7)
  {
    v8 = v7->_view;
    -[UIView frame](v8, "frame");
    v10 = v9;

    objc_msgSend(v14, "anyObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "locationInView:", self);
    self->_startPoint.x = v12;
    self->_startPoint.y = v13;

    self->_startPoint.x = self->_startPoint.x - v10;
  }

}

- (void)tabBarTouchesMoved:(id)a3 withEvent:(id)a4
{
  UITabBarItem *draggingItem;
  id v7;
  id v8;
  UITabBarButton *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  UITabBarItem *v21;
  UITabBarItem *v22;

  draggingItem = self->_draggingItem;
  if (draggingItem)
  {
    v7 = a4;
    v8 = a3;
    v9 = draggingItem->_view;
    -[UIView frame](v9, "frame");
    v11 = v10;
    v13 = v12;
    v15 = v14;

    objc_msgSend(v8, "anyObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "locationInView:", self);
    v18 = v17;

    v19 = v18 - self->_startPoint.x;
    -[UITabBarItem _tabBarButton]((id *)&self->_draggingItem->super.super.isa);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFrame:", v19, v11, v13, v15);

    -[UITabBarCustomizeView itemInTabBarWithTouches:withEvent:](self, "itemInTabBarWithTouches:withEvent:", v8, v7);
    v22 = (UITabBarItem *)objc_claimAutoreleasedReturnValue();

    v21 = v22;
    if (v22)
    {
      if (v22 != self->_draggingItem)
      {
        -[UITabBar _configureTabBarReplacingItem:withNewItem:swapping:](self->_tabBar, "_configureTabBarReplacingItem:withNewItem:swapping:", v22);
        v21 = v22;
      }
    }

  }
}

- (void)tabBarTouchesEnded:(id)a3 withEvent:(id)a4
{
  UITabBarItem *draggingItem;
  _QWORD v6[5];

  if (self->_draggingItem)
  {
    objc_msgSend((id)UIApp, "setIgnoresInteractionEvents:", 1, a4);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __54__UITabBarCustomizeView_tabBarTouchesEnded_withEvent___block_invoke;
    v6[3] = &unk_1E16B1B28;
    v6[4] = self;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v6, &__block_literal_global_73, 0.2, 0.0);
    draggingItem = self->_draggingItem;
    self->_draggingItem = 0;

  }
}

uint64_t __54__UITabBarCustomizeView_tabBarTouchesEnded_withEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "_positionAllItems");
}

uint64_t __54__UITabBarCustomizeView_tabBarTouchesEnded_withEvent___block_invoke_2()
{
  return objc_msgSend((id)UIApp, "setIgnoresInteractionEvents:", 0);
}

- (NSArray)availableItems
{
  return self->_availableItems;
}

- (void)setAvailableItems:(id)a3
{
  objc_storeStrong((id *)&self->_availableItems, a3);
}

- (UINavigationBar)navigationBar
{
  return self->_navigationBar;
}

- (void)setNavigationBar:(id)a3
{
  objc_storeStrong((id *)&self->_navigationBar, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationBar, 0);
  objc_storeStrong((id *)&self->_availableItems, 0);
  objc_storeStrong((id *)&self->_selectedBeforeItem, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_replaceItem, 0);
  objc_storeStrong((id *)&self->_replacementGlow, 0);
  objc_storeStrong((id *)&self->_dragImage, 0);
  objc_storeStrong((id *)&self->_draggingItem, 0);
  objc_storeStrong((id *)&self->_draggingProxy, 0);
  objc_storeStrong((id *)&self->_fixedItems, 0);
  objc_storeStrong((id *)&self->_proxies, 0);
  objc_storeStrong((id *)&self->_tabBar, 0);
}

@end
