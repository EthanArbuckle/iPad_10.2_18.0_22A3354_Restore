@implementation BFFSplashController

- (BFFSplashController)init
{
  char *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  __int128 v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BFFSplashController;
  v2 = -[BFFSplashController init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setTint:", v3);

    v4 = objc_opt_new();
    v5 = (void *)*((_QWORD *)v2 + 123);
    *((_QWORD *)v2 + 123) = v4;

    *((_QWORD *)v2 + 129) = 1;
    v6 = *(_OWORD *)(MEMORY[0x24BEBE158] + 16);
    *(_OWORD *)(v2 + 1064) = *MEMORY[0x24BEBE158];
    *(_OWORD *)(v2 + 1080) = v6;
  }
  return (BFFSplashController *)v2;
}

- (void)setIcon:(id)a3
{
  uint64_t v4;
  void *v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  -[BFFSplashController tint](self, "tint");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = -[BFFSplashController disableIconTint](self, "disableIconTint");

    if (!v6)
    {
      -[BFFSplashController tint](self, "tint");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_flatImageWithColor:", v7);
      v8 = objc_claimAutoreleasedReturnValue();

      v10 = (id)v8;
    }
  }
  -[BFFSplashController headerView](self, "headerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIcon:", v10);

}

- (UIImage)icon
{
  return -[BFFPaneHeaderView icon](self->_headerView, "icon");
}

- (void)setTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BFFSplashController headerView](self, "headerView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitleText:", v4);

}

- (void)setDetailText:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[BFFSplashController headerView](self, "headerView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "detailTextLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (void)setContentView:(id)a3
{
  UIView *v5;
  UIView *contentView;
  void *v7;
  UIView *v8;

  v5 = (UIView *)a3;
  contentView = self->_contentView;
  if (contentView != v5)
  {
    v8 = v5;
    -[UIView removeFromSuperview](contentView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_contentView, a3);
    -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_contentView);
    -[BFFSplashController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNeedsLayout");

    v5 = v8;
  }

}

- (void)setContentViewPosition:(int64_t)a3
{
  id v3;

  if (self->_contentViewPosition != a3)
  {
    self->_contentViewPosition = a3;
    -[BFFSplashController view](self, "view");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setNeedsLayout");

  }
}

- (void)setAdditionalInsets:(UIEdgeInsets)a3
{
  id v6;

  if (a3.left != self->_additionalInsets.left
    || a3.top != self->_additionalInsets.top
    || a3.right != self->_additionalInsets.right
    || a3.bottom != self->_additionalInsets.bottom)
  {
    self->_additionalInsets = a3;
    -[BFFSplashController view](self, "view");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNeedsLayout");

  }
}

- (void)addButtonWithTitle:(id)a3 style:(int64_t)a4 action:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  -[BFFSplashController _createButtonWithTitle:style:](self, "_createButtonWithTitle:style:", a3, a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAction:", v8);

  -[NSMutableArray addObject:](self->_buttons, "addObject:", v9);
}

- (void)removeAllButtons
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_buttons;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "button", (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeFromSuperview");

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_buttons, "removeAllObjects");
}

- (void)setTitle:(id)a3 forButtonAtIndex:(unint64_t)a4 action:(id)a5
{
  uint64_t v5;

  if (a4)
    v5 = 2;
  else
    v5 = 1;
  -[BFFSplashController addButtonWithTitle:style:action:](self, "addButtonWithTitle:style:action:", a3, v5, a5);
}

- (id)buttonAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;

  if (-[NSMutableArray count](self->_buttons, "count") <= a3)
  {
    v6 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_buttons, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "button");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (void)setLinkText:(id)a3 action:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[BFFSplashController headerView](self, "headerView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLinkText:handler:", v7, v6);

}

- (void)setTint:(id)a3
{
  UIColor *v5;
  void *v6;
  void *v7;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = (UIColor *)a3;
  if (self->_tint != v5)
  {
    objc_storeStrong((id *)&self->_tint, a3);
    if (!-[BFFSplashController disableIconTint](self, "disableIconTint"))
    {
      -[BFFSplashController icon](self, "icon");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[BFFSplashController tint](self, "tint");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_flatImageWithColor:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[BFFSplashController setIcon:](self, "setIcon:", v8);
    }
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = self->_buttons;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "button", (_QWORD)v15);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setTintColor:", v5);

        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }

  }
}

- (void)setScrollingDisabled:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  if (self->_scrollingDisabled != a3)
  {
    v3 = a3;
    self->_scrollingDisabled = a3;
    -[UIScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", !a3);
    -[BFFSplashController effectView](self, "effectView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", v3);

  }
}

- (void)setBleedColor:(id)a3
{
  UIColor *v5;
  UIView *v6;
  UIView *bleedView;
  void *v8;
  UIColor *v9;

  v5 = (UIColor *)a3;
  v9 = v5;
  if (!self->_bleedView)
  {
    v6 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    bleedView = self->_bleedView;
    self->_bleedView = v6;

    -[BFFSplashController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", self->_bleedView);

    v5 = v9;
  }
  if (self->_bleedColor != v5)
  {
    objc_storeStrong((id *)&self->_bleedColor, a3);
    -[UIView setBackgroundColor:](self->_bleedView, "setBackgroundColor:", v9);
    v5 = v9;
  }

}

- (BFFPaneHeaderView)headerView
{
  BFFPaneHeaderView *headerView;
  BFFPaneHeaderView *v4;
  BFFPaneHeaderView *v5;
  BFFPaneHeaderView *v6;

  headerView = self->_headerView;
  if (!headerView)
  {
    v4 = [BFFPaneHeaderView alloc];
    v5 = -[BFFPaneHeaderView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v6 = self->_headerView;
    self->_headerView = v5;

    -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_headerView);
    headerView = self->_headerView;
  }
  return headerView;
}

- (void)_updateButtonFonts
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = self->_buttons;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    v6 = *MEMORY[0x24BEBE1D0];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v8, "style", (_QWORD)v12) == 2)
        {
          objc_msgSend(MEMORY[0x24BEBD5E0], "preferredFontForTextStyle:", v6);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "button");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "titleLabel");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setFont:", v9);

        }
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

}

- (id)_createButtonWithTitle:(id)a3 style:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UIView *buttonTray;
  void *v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setStyle:", a4);
  if (a4 == 1)
  {
    -[BFFSplashController loadViewIfNeeded](self, "loadViewIfNeeded");
    +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "continueButtonWithTitle:inView:", v6, self->_buttonTray);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setButton:", v9);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setButton:", v10);

    objc_msgSend(v7, "button");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "titleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAdjustsFontSizeToFitWidth:", 1);

    -[BFFSplashController _updateButtonFonts](self, "_updateButtonFonts");
    buttonTray = self->_buttonTray;
    objc_msgSend(v7, "button");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](buttonTray, "addSubview:", v8);
  }

  objc_msgSend(v7, "button");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTintColor:", self->_tint);

  objc_msgSend(v7, "button");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addTarget:action:forControlEvents:", self, sel__buttonPressed_, 0x2000);

  objc_msgSend(v7, "button");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTitle:forState:", v6, 0);

  return v7;
}

- (void)setButtonsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_buttons;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "button", (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setEnabled:", v3);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  UIScrollView *v6;
  UIScrollView *scrollView;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UIView *v14;
  UIView *buttonTray;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)BFFSplashController;
  -[BFFSplashController loadView](&v19, sel_loadView);
  -[BFFSplashController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v5);

  v6 = (UIScrollView *)objc_alloc_init(MEMORY[0x24BEBD918]);
  scrollView = self->_scrollView;
  self->_scrollView = v6;

  -[UIScrollView setDelegate:](self->_scrollView, "setDelegate:", self);
  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_headerView);
  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_contentView);
  -[BFFSplashController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", self->_scrollView);

  v9 = objc_alloc(MEMORY[0x24BEBDB38]);
  objc_msgSend(MEMORY[0x24BEBD428], "effectWithStyle:", 1100);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithEffect:", v10);
  -[BFFSplashController setEffectView:](self, "setEffectView:", v11);

  -[BFFSplashController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BFFSplashController effectView](self, "effectView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", v13);

  v14 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
  buttonTray = self->_buttonTray;
  self->_buttonTray = v14;

  -[BFFSplashController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", self->_buttonTray);

  +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[BFFSplashController navigationItem](self, "navigationItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "applyAutomaticScrollToEdgeBehaviorOnNavigationItem:", v18);

}

- (id)contentScrollView
{
  return self->_scrollView;
}

- (void)viewDidLayoutSubviews
{
  double v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
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
  UIView *contentView;
  double v28;
  double v29;
  double v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  CGFloat y;
  CGFloat x;
  uint64_t i;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  _BOOL4 v42;
  CGFloat v43;
  CGFloat v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  NSMutableArray *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  double v62;
  double v63;
  uint64_t j;
  void *v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  void *v77;
  void *v78;
  void *v79;
  double v80;
  CGFloat v81;
  double v82;
  double v83;
  unint64_t v84;
  double v85;
  double v86;
  void *v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  double v91;
  double v94;
  void *v95;
  void *v96;
  double v97;
  double v98;
  void *v99;
  double v100;
  double v101;
  void *v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  uint64_t v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double MinY;
  double v116;
  void *v117;
  double v118;
  double v119;
  float v120;
  void *v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  uint64_t v132;
  CGFloat v133;
  uint64_t v134;
  CGFloat v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double MaxY;
  double v144;
  double v145;
  double v146;
  double v147;
  double rect;
  double width;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  objc_super v158;
  _BYTE v159[128];
  _BYTE v160[128];
  uint64_t v161;
  CGRect v162;
  CGRect v163;
  CGRect v164;
  CGRect v165;
  CGRect v166;
  CGRect v167;
  CGRect v168;
  CGRect v169;
  CGRect v170;
  CGRect v171;
  CGRect v172;
  CGRect v173;
  CGRect v174;

  v161 = *MEMORY[0x24BDAC8D0];
  if (BFFIsiPad())
    v3 = 25.0;
  else
    v3 = -8.5;
  v158.receiver = self;
  v158.super_class = (Class)BFFSplashController;
  -[BFFSplashController viewDidLayoutSubviews](&v158, sel_viewDidLayoutSubviews);
  -[BFFSplashController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v132 = v6;
  v134 = v5;
  v8 = v7;
  v10 = v9;

  +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BFFSplashController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "superview");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BFFSplashController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "superview");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  objc_msgSend(v11, "horizontalInsetsForContainingInView:width:", v13, v16);

  UIEdgeInsetsAdd();
  v18 = v17;
  v147 = v19;
  v20 = v8 - v19;
  -[UIScrollView frame](self->_scrollView, "frame");
  v22 = v21;
  v24 = v23;
  -[UIScrollView frame](self->_scrollView, "frame");
  v173.origin.x = v22;
  v173.origin.y = v24;
  v173.size.width = v8;
  v140 = v10;
  v173.size.height = v10;
  if (!CGRectEqualToRect(v162, v173))
    -[UIScrollView setFrame:](self->_scrollView, "setFrame:", v22, v24, v8, v10);
  v25 = v20 - v18;
  v26 = *MEMORY[0x24BDBF090];
  rect = *(double *)(MEMORY[0x24BDBF090] + 24);
  width = *(double *)(MEMORY[0x24BDBF090] + 16);
  contentView = self->_contentView;
  v142 = *(double *)(MEMORY[0x24BDBF090] + 8);
  MaxY = 0.0;
  if (contentView)
  {
    -[UIView sizeThatFits:](contentView, "sizeThatFits:", v25, 1.79769313e308);
    if (v29 * v28 == 0.0)
    {
      v30 = v26;
      v156 = 0u;
      v157 = 0u;
      v154 = 0u;
      v155 = 0u;
      -[UIView subviews](self->_contentView, "subviews");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v154, v160, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v155;
        y = v142;
        x = v30;
        do
        {
          for (i = 0; i != v33; ++i)
          {
            if (*(_QWORD *)v155 != v34)
              objc_enumerationMutation(v31);
            objc_msgSend(*(id *)(*((_QWORD *)&v154 + 1) + 8 * i), "frame", v132, v134);
            v174.origin.x = v38;
            v174.origin.y = v39;
            v174.size.width = v40;
            v174.size.height = v41;
            v163.origin.x = x;
            v163.origin.y = y;
            v163.size.height = rect;
            v163.size.width = width;
            v164 = CGRectUnion(v163, v174);
            x = v164.origin.x;
            y = v164.origin.y;
            rect = v164.size.height;
            width = v164.size.width;
          }
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v154, v160, 16);
        }
        while (v33);
      }

      v26 = v30;
    }
    else
    {
      rect = v28;
    }
    v42 = -[BFFSplashController fullWidthContent](self, "fullWidthContent", v132, v134);
    if (v42)
      v43 = v8;
    else
      v43 = v25;
    if (v42)
      v44 = v26;
    else
      v44 = v147;
    width = v43;
    v141 = v44;
    if (self->_contentViewPosition == 2)
    {
      -[BFFSplashController headerView](self, "headerView");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "icon");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[BFFSplashController headerView](self, "headerView");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setUseMinimumTopPadding:", v46 != 0);

      v142 = 0.0;
      v165.origin.y = 0.0;
      v165.origin.x = v44;
      v165.size.width = v43;
      v165.size.height = rect;
      MaxY = CGRectGetMaxY(v165);
      if (BFFIsiPad())
      {
        -[BFFSplashController headerView](self, "headerView");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "setCustomTopPadding:", 60.0);

      }
    }
  }
  else
  {
    v141 = *MEMORY[0x24BDBF090];
  }
  -[BFFSplashController headerView](self, "headerView", v132, v134);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "heightForWidth:inView:", self->_scrollView, v8);
  v51 = v50;

  -[BFFSplashController headerView](self, "headerView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v138 = v51;
  v139 = v26;
  objc_msgSend(v52, "setFrame:", v26, MaxY, v8, v51);

  if (-[NSMutableArray count](self->_buttons, "count"))
  {
    v146 = v25;
    v136 = v8;
    v137 = v3;
    objc_msgSend(MEMORY[0x24BEBD5F0], "metricsForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "scaledValueForValue:", 24.0);
    v55 = v54;
    objc_msgSend(v53, "scaledValueForValue:", 44.0);
    v144 = v56;
    objc_msgSend(v53, "scaledValueForValue:", 36.0);
    v145 = v57;
    v150 = 0u;
    v151 = 0u;
    v152 = 0u;
    v153 = 0u;
    v58 = self->_buttons;
    v59 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v150, v159, 16);
    if (v59)
    {
      v60 = v59;
      v61 = *(_QWORD *)v151;
      v62 = v145;
      v63 = v55;
      do
      {
        for (j = 0; j != v60; ++j)
        {
          if (*(_QWORD *)v151 != v61)
            objc_enumerationMutation(v58);
          v65 = *(void **)(*((_QWORD *)&v150 + 1) + 8 * j);
          objc_msgSend(v65, "button");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "frame");
          v68 = v67;
          v70 = v69;
          if (objc_msgSend(v65, "style") == 2)
          {
            objc_msgSend(v66, "titleLabel");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "sizeThatFits:", v146, 1.79769313e308);
            v73 = v72;
            v75 = v74;

            if (v146 >= v73)
              v76 = v73;
            else
              v76 = v146;
            objc_msgSend(v66, "setFrame:", v68, v70, v76, v75);
            objc_msgSend(v66, "layoutSubviews");
            objc_msgSend(v66, "titleLabel");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "_firstLineBaselineOffsetFromBoundsTop");

            v63 = v55 + v62;
            v62 = v144 + v62;
          }
          else
          {
            +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            -[BFFSplashController view](self, "view");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "sizeForContinueButtonInAncestor:", v79);
            v81 = v80;
            v83 = v82;

            v166.origin.x = v68;
            v166.origin.y = v63;
            v166.size.width = v81;
            v166.size.height = v83;
            v62 = v145 + CGRectGetMaxY(v166);
            v63 = v63 + v55 + v83;
          }
          UIRoundToViewScale();
          objc_msgSend(v66, "setFrame:");

        }
        v60 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v150, v159, 16);
      }
      while (v60);
    }

    v84 = 0x254D91000uLL;
    -[UIView frame](self->_buttonTray, "frame");
    v86 = v85;
    -[NSMutableArray lastObject](self->_buttons, "lastObject");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = objc_msgSend(v87, "style");
    objc_msgSend(v87, "button");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "frame");
    v94 = v91;
    if (v88 == 2)
    {
      objc_msgSend(v87, "button");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "titleLabel");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "_firstLineBaselineOffsetFromBoundsTop");
      v98 = v94 + v97 + 24.0;

    }
    else
    {
      v98 = CGRectGetMaxY(*(CGRect *)&v90) + 44.0;
    }
    v3 = v137;
    v8 = v136;
    v25 = v146;

    -[BFFSplashController view](self, "view");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "safeAreaInsets");
    v101 = v98 + v100;

    -[UIView setFrame:](self->_buttonTray, "setFrame:", v86, v140 - v101, v136, v101);
    -[BFFSplashController effectView](self, "effectView");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "setFrame:", v86, v140 - v101, v136, v101);

  }
  else
  {
    -[BFFSplashController effectView](self, "effectView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setFrame:", *MEMORY[0x24BDBF070], *(double *)(MEMORY[0x24BDBF070] + 8), *(double *)(MEMORY[0x24BDBF070] + 16), *(double *)(MEMORY[0x24BDBF070] + 24));
    v84 = 0x254D91000;
  }

  -[UIScrollView contentInset](self->_scrollView, "contentInset");
  v104 = v103;
  v106 = v105;
  v108 = v107;
  v109 = *(int *)(v84 + 436);
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v109), "frame");
  -[UIScrollView setContentInset:](self->_scrollView, "setContentInset:", v104, v106, v110, v108);
  if (self->_contentView)
  {
    v112 = rect;
    v111 = width;
    v113 = v141;
    v114 = v142;
    if (self->_contentViewPosition != 1)
      goto LABEL_56;
    if (-[NSMutableArray count](self->_buttons, "count", v141, v142, width, rect))
    {
      objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v109), "frame");
      MinY = CGRectGetMinY(v167);
    }
    else
    {
      v168.origin.y = v133;
      v168.origin.x = v135;
      v168.size.width = v8;
      v168.size.height = v140;
      MinY = CGRectGetMaxY(v168);
    }
    v116 = MinY;
    -[BFFSplashController view](self, "view");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "convertRect:fromView:", self->_scrollView, v139, MaxY, v8, v138);
    v118 = v3 + CGRectGetMaxY(v169);

    v119 = v116 - v118;
    v170.origin.x = v139;
    v170.origin.y = MaxY;
    v170.size.width = v8;
    v170.size.height = v138;
    v114 = v3 + CGRectGetMaxY(v170);
    v112 = rect;
    if (rect < v119)
    {
      v120 = (v119 - rect) * 0.5;
      v114 = v114 + floorf(v120);
    }
    v111 = width;
  }
  else
  {
    v112 = rect;
    v111 = width;
    v114 = v142;
  }
  v113 = v141;
LABEL_56:
  -[UIView setFrame:](self->_contentView, "setFrame:", v113, v114, v111, v112);
  -[BFFSplashController headerView](self, "headerView");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "frame");
  v122 = CGRectGetMaxY(v171);

  -[UIView frame](self->_contentView, "frame");
  v123 = CGRectGetMaxY(v172);
  if (v122 >= v123)
    v124 = v122;
  else
    v124 = v123;
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v25, v124);
  -[UIScrollView scrollIndicatorInsets](self->_scrollView, "scrollIndicatorInsets");
  v126 = v125;
  v128 = v127;
  v130 = v129;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v109), "frame");
  -[UIScrollView setScrollIndicatorInsets:](self->_scrollView, "setScrollIndicatorInsets:", v126, v128, v131, v130);
  -[BFFSplashController _updateTrayVisibility](self, "_updateTrayVisibility");
  -[BFFSplashController updateBleedViewLayout](self, "updateBleedViewLayout");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BFFSplashController;
  -[BFFSplashController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[BFFSplashController updateBleedColor](self, "updateBleedColor");
}

- (void)viewDidAppear:(BOOL)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BFFSplashController;
  -[BFFSplashController viewDidAppear:](&v11, sel_viewDidAppear_, a3);
  -[UIScrollView contentInset](self->_scrollView, "contentInset");
  v5 = v4;
  v7 = v6;
  -[UIScrollView contentSize](self->_scrollView, "contentSize");
  v9 = v8;
  -[UIScrollView frame](self->_scrollView, "frame");
  if (v9 > v10 - v7 - v5)
    -[UIScrollView flashScrollIndicators](self->_scrollView, "flashScrollIndicators");
  -[BFFSplashController updateBleedColor](self, "updateBleedColor");
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BFFSplashController;
  -[BFFSplashController viewWillDisappear:](&v7, sel_viewWillDisappear_, a3);
  -[BFFSplashController bleedColor](self, "bleedColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BFFSplashController navigationController](self, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "applyThemeToNavigationController:", v6);

  }
}

- (void)updateBleedColor
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[BFFSplashController bleedColor](self, "bleedColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[BFFSplashController navigationController](self, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "navigationBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(MEMORY[0x24BEBD640]);
    objc_msgSend(v5, "setBackgroundImage:forBarMetrics:", v6, 0);

    -[BFFSplashController navigationController](self, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "navigationBar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTranslucent:", 1);

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BFFSplashController navigationController](self, "navigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "navigationBar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBarTintColor:", v9);

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    -[BFFSplashController navigationController](self, "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "navigationBar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBackgroundColor:", v14);

  }
}

- (void)scrollViewDidScroll:(id)a3
{
  -[BFFSplashController _updateTrayVisibility](self, "_updateTrayVisibility", a3);
  -[BFFSplashController updateBleedViewLayout](self, "updateBleedViewLayout");
}

- (void)updateBleedViewLayout
{
  double v3;
  double v4;
  double v5;
  id v6;

  -[UIScrollView adjustedContentInset](self->_scrollView, "adjustedContentInset");
  v4 = v3;
  -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
  if (v5 < -v4)
    -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
  -[BFFSplashController view](self, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  -[UIView setFrame:](self->_bleedView, "setFrame:", 0.0, 0.0);

}

- (void)_updateTrayVisibility
{
  UIScrollView *scrollView;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  int64_t v12;
  int *v13;
  double MaxY;
  _BOOL8 v15;
  id v16;
  CGRect v17;
  CGRect v18;

  scrollView = self->_scrollView;
  -[UIView bounds](self->_buttonTray, "bounds");
  -[UIScrollView convertRect:fromView:](scrollView, "convertRect:fromView:", self->_buttonTray);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = -[BFFSplashController contentViewPosition](self, "contentViewPosition");
  v13 = &OBJC_IVAR___BFFSplashController__contentView;
  if (v12 == 2)
    v13 = &OBJC_IVAR___BFFSplashController__headerView;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v13), "frame");
  MaxY = CGRectGetMaxY(v17);
  v18.origin.x = v5;
  v18.origin.y = v7;
  v18.size.width = v9;
  v18.size.height = v11;
  v15 = MaxY <= CGRectGetMinY(v18);
  -[BFFSplashController effectView](self, "effectView");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setHidden:", v15);

}

- (void)_buttonPressed:(id)a3
{
  id v4;
  NSMutableArray *buttons;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  buttons = self->_buttons;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __38__BFFSplashController__buttonPressed___block_invoke;
  v10[3] = &unk_24D234430;
  v6 = v4;
  v11 = v6;
  v7 = -[NSMutableArray indexOfObjectPassingTest:](buttons, "indexOfObjectPassingTest:", v10);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    _BYLoggingFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v6;
      _os_log_impl(&dword_214875000, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "Unknown button %@!", buf, 0xCu);
    }
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_buttons, "objectAtIndexedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "action");
    v8 = objc_claimAutoreleasedReturnValue();

    if (v8)
      (*(void (**)(uint64_t))(v8 + 16))(v8);
  }

}

BOOL __38__BFFSplashController__buttonPressed___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "button");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (NSString)detailText
{
  return self->_detailText;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (int64_t)contentViewPosition
{
  return self->_contentViewPosition;
}

- (UIView)buttonTray
{
  return self->_buttonTray;
}

- (UIEdgeInsets)additionalInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_additionalInsets.top;
  left = self->_additionalInsets.left;
  bottom = self->_additionalInsets.bottom;
  right = self->_additionalInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIColor)tint
{
  return self->_tint;
}

- (BOOL)disableIconTint
{
  return self->_disableIconTint;
}

- (void)setDisableIconTint:(BOOL)a3
{
  self->_disableIconTint = a3;
}

- (BOOL)isScrollingDisabled
{
  return self->_scrollingDisabled;
}

- (BOOL)fullWidthContent
{
  return self->_fullWidthContent;
}

- (void)setFullWidthContent:(BOOL)a3
{
  self->_fullWidthContent = a3;
}

- (UIColor)bleedColor
{
  return self->_bleedColor;
}

- (BOOL)usesTwoButtonLayout
{
  return self->_usesTwoButtonLayout;
}

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

- (void)setEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_effectView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_bleedColor, 0);
  objc_storeStrong((id *)&self->_buttonTray, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_bleedView, 0);
  objc_storeStrong((id *)&self->_tint, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end
