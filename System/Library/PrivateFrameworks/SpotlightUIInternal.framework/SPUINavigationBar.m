@implementation SPUINavigationBar

- (void)performShowSeparator:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double v7;
  void *v8;
  double v9;
  double v10;
  _QWORD v11[5];
  BOOL v12;

  v4 = a4;
  v7 = (double)a3;
  -[SPUINavigationBar topDividerView](self, "topDividerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "alpha");
  v10 = v9;

  if (v10 != v7)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __51__SPUINavigationBar_performShowSeparator_animated___block_invoke;
    v11[3] = &unk_24F9D5E38;
    v11[4] = self;
    v12 = a3;
    objc_msgSend(MEMORY[0x24BE85288], "performAnimatableChanges:animated:", v11, v4);
  }
}

- (SPUINavigationBar)initWithFrame:(CGRect)a3
{
  SPUINavigationBar *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SPUINavigationBar;
  v3 = -[SPUINavigationBar initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_opt_new();
    -[SPUINavigationBar setBackgroundImage:forBarMetrics:](v3, "setBackgroundImage:forBarMetrics:", v4, 0);

    v5 = (void *)objc_opt_new();
    -[SPUINavigationBar setTopDividerView:](v3, "setTopDividerView:", v5);

    -[SPUINavigationBar topDividerView](v3, "topDividerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUINavigationBar addSubview:](v3, "addSubview:", v6);

    -[SPUINavigationBar topDividerView](v3, "topDividerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlpha:", 0.0);

    v8 = (void *)MEMORY[0x24BE85220];
    -[SPUINavigationBar topDividerView](v3, "topDividerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v8, "baselineAlignBottomView:toTopView:", v3, v9);

    v11 = (void *)MEMORY[0x24BE85220];
    -[SPUINavigationBar topDividerView](v3, "topDividerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constrainViewWidthToContainer:", v12);

    v13 = (void *)objc_opt_new();
    -[SPUINavigationBar _setBackgroundView:](v3, "_setBackgroundView:", v13);

    -[SPUINavigationBar _backgroundView](v3, "_backgroundView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAlpha:", 0.0);

    -[SPUINavigationBar _setHidesShadow:](v3, "_setHidesShadow:", 1);
  }
  return v3;
}

- (SearchUISeparatorView)topDividerView
{
  return (SearchUISeparatorView *)objc_getProperty(self, a2, 648, 1);
}

- (void)setTopDividerView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 648);
}

- (void)didAddSubview:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)SPUINavigationBar;
  -[SPUINavigationBar didAddSubview:](&v34, sel_didAddSubview_, v4);
  -[SPUINavigationBar topItem](self, "topItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "titleView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_16;
  -[SPUINavigationBar _backgroundView](self, "_backgroundView");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v4;
  if ((id)v7 == v4)
  {
LABEL_15:

LABEL_16:
    goto LABEL_17;
  }
  v9 = (void *)v7;
  -[SPUINavigationBar _backgroundView](self, "_backgroundView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "superview");
  v11 = objc_claimAutoreleasedReturnValue();
  if ((id)v11 == v4)
  {

    v8 = v9;
    goto LABEL_15;
  }
  v12 = (void *)v11;
  v13 = objc_msgSend(MEMORY[0x24BEB0808], "enableFloatingWindow");

  if ((v13 & 1) == 0)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    -[SPUINavigationBar subviews](self, "subviews");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v31;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v31 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          NSClassFromString(CFSTR("_UINavigationBarContentView"));
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v5 = v19;
            goto LABEL_19;
          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
        if (v16)
          continue;
        break;
      }
    }
    v5 = 0;
LABEL_19:

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v5, "subviews", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v27 != v22)
            objc_enumerationMutation(v6);
          v24 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j);
          objc_msgSend(MEMORY[0x24BEB4B88], "bestAppearanceForView:", self);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "enableAppearanceForView:", v24);

        }
        v21 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
      }
      while (v21);
    }
    goto LABEL_16;
  }
LABEL_17:

}

- (void)updateBackgroundViewVisibility
{
  void *v3;
  char isKindOfClass;
  void *v5;
  id v6;

  -[SPUINavigationBar topItem](self, "topItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "titleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  -[SPUINavigationBar _backgroundView](self, "_backgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", (isKindOfClass & 1) == 0);

}

- (BOOL)isLocked
{
  return 0;
}

- (void)setHeader:(id)a3
{
  SPUISearchHeader *v5;
  SPUISearchHeader **p_header;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = (SPUISearchHeader *)a3;
  p_header = &self->_header;
  if (self->_header != v5)
  {
    if (objc_msgSend(MEMORY[0x24BEB0808], "enableFloatingWindow"))
    {
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      -[SPUINavigationBar items](self, "items", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v13;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v13 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "setTitleView:", v5);
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v9);
      }

    }
    objc_storeStrong((id *)p_header, a3);
  }

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
  v9.super_class = (Class)SPUINavigationBar;
  -[SPUINavigationBar traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[SPUINavigationBar traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4))
  {

LABEL_4:
    -[SPUINavigationBar tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
    goto LABEL_5;
  }
  -[SPUINavigationBar traitCollection](self, "traitCollection");
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
  v3.super_class = (Class)SPUINavigationBar;
  -[SPUINavigationBar didMoveToWindow](&v3, sel_didMoveToWindow);
  -[SPUINavigationBar tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
}

- (void)tlk_updateForAppearance:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SPUINavigationBar;
  -[SPUINavigationBar tlk_updateForAppearance:](&v7, sel_tlk_updateForAppearance_, v4);
  if ((objc_msgSend(MEMORY[0x24BEB0808], "enableFloatingWindow") & 1) == 0)
  {
    objc_msgSend(v4, "secondaryColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUINavigationBar setTintColor:](self, "setTintColor:", v5);
    v8 = *MEMORY[0x24BEBB368];
    v9[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUINavigationBar setTitleTextAttributes:](self, "setTitleTextAttributes:", v6);

  }
}

void __51__SPUINavigationBar_performShowSeparator_animated___block_invoke(uint64_t a1, double a2)
{
  double v2;
  id v3;

  LOBYTE(a2) = *(_BYTE *)(a1 + 40);
  v2 = (double)*(unint64_t *)&a2;
  objc_msgSend(*(id *)(a1 + 32), "topDividerView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", v2);

}

- (void)reconfigureNavigationBarForItem:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(MEMORY[0x24BEB0808], "enableFloatingWindow"))
  {
    -[SPUINavigationBar showSeparator:animated:](self, "showSeparator:animated:", 1, 0);
    -[SPUINavigationBar header](self, "header");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitleView:", v4);

    objc_msgSend(v6, "setTitle:", 0);
    objc_msgSend(v6, "setHidesBackButton:", 1);
    objc_msgSend(v6, "setBackBarButtonItem:", 0);
    v5 = MEMORY[0x24BDBD1A8];
    objc_msgSend(v6, "setRightBarButtonItems:", MEMORY[0x24BDBD1A8]);
    objc_msgSend(v6, "setLeftBarButtonItems:", v5);
  }
  else
  {
    -[SPUINavigationBar showSeparator:animated:](self, "showSeparator:animated:", 0, 0);
  }
  -[SPUINavigationBar updateBackgroundViewVisibility](self, "updateBackgroundViewVisibility");

}

- (SPUISearchHeader)header
{
  return self->_header;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topDividerView, 0);
  objc_storeStrong((id *)&self->_header, 0);
}

@end
