@implementation WFCompactActionGroupView

- (WFCompactActionGroupView)initWithActions:(id)a3 appearanceProvider:(id)a4
{
  id v6;
  id v7;
  WFCompactActionGroupView *v8;
  WFCompactActionGroupView *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NSArray *actions;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  WFCompactActionGroupView *v36;
  void *v38;
  id v39;
  id v40;
  id obj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  objc_super v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v50.receiver = self;
  v50.super_class = (Class)WFCompactActionGroupView;
  v8 = -[WFCompactActionGroupView init](&v50, sel_init);
  v9 = v8;
  if (v8)
  {
    v39 = v7;
    -[WFCompactActionGroupView setAppearanceProvider:](v8, "setAppearanceProvider:", v7);
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v40 = v6;
    v11 = v6;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v47 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          objc_msgSend(v16, "dialogButton");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "style");

          if (v18 == 1)
            objc_msgSend(v10, "insertObject:atIndex:", v16, 0);
          else
            objc_msgSend(v10, "addObject:", v16);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
      }
      while (v13);
    }

    v38 = v10;
    v19 = objc_msgSend(v10, "copy");
    actions = v9->_actions;
    v9->_actions = (NSArray *)v19;

    -[WFCompactActionGroupView setAutoresizingMask:](v9, "setAutoresizingMask:", 18);
    -[WFCompactActionGroupView setSpacing:](v9, "setSpacing:", 10.0);
    -[WFCompactActionGroupView setLayoutMargins:](v9, "setLayoutMargins:", 10.0, 14.0, 14.0, 14.0);
    -[WFCompactActionGroupView setDistribution:](v9, "setDistribution:", 1);
    -[WFCompactActionGroupView setLayoutMarginsRelativeArrangement:](v9, "setLayoutMarginsRelativeArrangement:", 1);
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    -[WFCompactActionGroupView actions](v9, "actions");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v43;
      v24 = *MEMORY[0x24BEBE090];
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v43 != v23)
            objc_enumerationMutation(obj);
          v26 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
          -[WFCompactActionGroupView appearanceProvider](v9, "appearanceProvider");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setAppearanceProvider:", v27);

          objc_msgSend(v26, "uiButton");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFCompactActionGroupView addArrangedSubview:](v9, "addArrangedSubview:", v28);
          -[WFCompactActionGroupView traitCollection](v9, "traitCollection");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "preferredContentSizeCategory");
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v28, "heightAnchor");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v31;
          if ((unint64_t)v30 >= v24)
          {
            objc_msgSend(v28, "titleLabel");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "heightAnchor");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "constraintEqualToAnchor:constant:", v34, 25.0);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "setActive:", 1);

          }
          else
          {
            objc_msgSend(v31, "constraintEqualToConstant:", 50.0);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "setActive:", 1);
          }

        }
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
      }
      while (v22);
    }

    v36 = v9;
    v7 = v39;
    v6 = v40;
  }

  return v9;
}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t i;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v22.receiver = self;
  v22.super_class = (Class)WFCompactActionGroupView;
  -[WFCompactActionGroupView layoutSubviews](&v22, sel_layoutSubviews);
  -[WFCompactActionGroupView actions](self, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 == 2)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[WFCompactActionGroupView actions](self, "actions", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v19;
      v9 = 1;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "uiButton");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "titleLabel");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "intrinsicContentSize");
          v14 = v13 + 4.0;
          -[WFCompactActionGroupView frame](self, "frame");
          v16 = v15 * 0.5 + -21.0;

          if (v14 >= v16)
            v9 = 0;
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v7);

      if ((v9 & 1) == 0)
        goto LABEL_12;
    }
    else
    {

    }
    v17 = 0;
    goto LABEL_15;
  }
LABEL_12:
  v17 = 1;
LABEL_15:
  -[WFCompactActionGroupView setAxis:](self, "setAxis:", v17);
}

- (void)tintColorDidChange
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[WFCompactActionGroupView actions](self, "actions", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v8, "dialogButton");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "style");

        if (!v10)
        {
          -[WFCompactActionGroupView tintColor](self, "tintColor");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "uiButton");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setBackgroundColor:", v11);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

}

- (void)setAppearanceProvider:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_appearanceProvider, a3);
  v5 = a3;
  objc_msgSend(v5, "configureActionGroupView:", self);

}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (WFCompactAppearanceProvider)appearanceProvider
{
  return self->_appearanceProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appearanceProvider, 0);
  objc_storeStrong((id *)&self->_actions, 0);
}

@end
