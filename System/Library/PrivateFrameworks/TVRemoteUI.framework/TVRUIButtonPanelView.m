@implementation TVRUIButtonPanelView

- (TVRUIButtonPanelView)initWithPrimaryButtonType:(int64_t)a3 secondaryLeftButtons:(id)a4 secondaryRightButtons:(id)a5 styleProvider:(id)a6
{
  id v10;
  id v11;
  id v12;
  TVRUIButtonPanelView *v13;
  TVRUIButtonPanelView *v14;
  TVRUIButton *v15;
  TVRUIButton *primaryButton;
  uint64_t v17;
  NSMutableArray *leftButtons;
  uint64_t v19;
  NSMutableArray *rightButtons;
  objc_super v22;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)TVRUIButtonPanelView;
  v13 = -[TVRUIButtonPanelView initWithFrame:](&v22, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_styleProvider, a6);
    v15 = -[TVRUIButton initWithType:hasTapAction:buttonLocation:]([TVRUIButton alloc], "initWithType:hasTapAction:buttonLocation:", a3, 0, 0);
    primaryButton = v14->_primaryButton;
    v14->_primaryButton = v15;

    -[TVRUIButtonPanelView addSubview:](v14, "addSubview:", v14->_primaryButton);
    -[TVRUIButtonPanelView _configureButton:](v14, "_configureButton:", v14->_primaryButton);
    -[TVRUIButtonPanelView _processButtons:](v14, "_processButtons:", v10);
    v17 = objc_claimAutoreleasedReturnValue();
    leftButtons = v14->_leftButtons;
    v14->_leftButtons = (NSMutableArray *)v17;

    -[TVRUIButtonPanelView _processButtons:](v14, "_processButtons:", v11);
    v19 = objc_claimAutoreleasedReturnValue();
    rightButtons = v14->_rightButtons;
    v14->_rightButtons = (NSMutableArray *)v19;

  }
  return v14;
}

- (id)initPagedPanelWithPrimaryButtonType:(int64_t)a3 secondaryLeftButtons:(id)a4 styleProvider:(id)a5
{
  id v8;
  id v9;
  TVRUIButtonPanelView *v10;
  TVRUIButtonPanelView *v11;
  TVRUIButton *v12;
  TVRUIButton *primaryButton;
  void *v14;
  void *v15;
  unint64_t v16;
  NSObject *v17;
  uint64_t v18;
  TVRUIPagingButton *v19;
  void *v20;
  uint64_t v21;
  TVRUIPagingButton *pagingButton;
  uint64_t v23;
  NSMutableArray *leftButtons;
  objc_super v26;

  v8 = a4;
  v9 = a5;
  v26.receiver = self;
  v26.super_class = (Class)TVRUIButtonPanelView;
  v10 = -[TVRUIButtonPanelView initWithFrame:](&v26, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_styleProvider, a5);
    v12 = -[TVRUIButton initWithType:hasTapAction:]([TVRUIButton alloc], "initWithType:hasTapAction:", a3, 0);
    primaryButton = v11->_primaryButton;
    v11->_primaryButton = v12;

    -[TVRUIButtonPanelView addSubview:](v11, "addSubview:", v11->_primaryButton);
    -[TVRUIButtonPanelView _configureButton:](v11, "_configureButton:", v11->_primaryButton);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("TVRemoteUIPageButtonText"), &stru_24DE30718, CFSTR("Localizable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = -[TVRUIStyleProvider maxPagingTitleLength](v11->_styleProvider, "maxPagingTitleLength");
    if (objc_msgSend(v15, "length") > v16)
    {
      _TVRUIViewControllerLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        -[TVRUIButtonPanelView initPagedPanelWithPrimaryButtonType:secondaryLeftButtons:styleProvider:].cold.1((uint64_t)v15, v16, v17);

      objc_msgSend(v15, "substringWithRange:", 0, 4);
      v18 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v18;
    }
    v19 = [TVRUIPagingButton alloc];
    -[TVRUIButtonPanelView styleProvider](v11, "styleProvider");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[TVRUIPagingButton initWithTitle:styleProvider:](v19, "initWithTitle:styleProvider:", v15, v20);
    pagingButton = v11->_pagingButton;
    v11->_pagingButton = (TVRUIPagingButton *)v21;

    -[TVRUIButtonPanelView addSubview:](v11, "addSubview:", v11->_pagingButton);
    -[TVRUIButtonPanelView _processButtons:](v11, "_processButtons:", v8);
    v23 = objc_claimAutoreleasedReturnValue();
    leftButtons = v11->_leftButtons;
    v11->_leftButtons = (NSMutableArray *)v23;

  }
  return v11;
}

- (id)_processButtons:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  TVRUIButton *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "integerValue", (_QWORD)v14);
        v12 = -[TVRUIButton initWithType:hasTapAction:buttonLocation:]([TVRUIButton alloc], "initWithType:hasTapAction:buttonLocation:", v11, +[TVRUIButton buttonTypeHasTapAction:](TVRUIButton, "buttonTypeHasTapAction:", v11), 0);
        -[TVRUIButtonPanelView addSubview:](self, "addSubview:", v12);
        -[TVRUIButtonPanelView _configureButton:](self, "_configureButton:", v12);
        objc_msgSend(v5, "addObject:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  CGFloat v6;
  CGFloat v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  CGFloat v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  CGFloat v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  double v50;
  void *v51;
  objc_super v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;

  v52.receiver = self;
  v52.super_class = (Class)TVRUIButtonPanelView;
  -[TVRUIButtonPanelView layoutSubviews](&v52, sel_layoutSubviews);
  -[TVRUIButtonPanelView styleProvider](self, "styleProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "primaryButtonSize");
  v5 = v4;

  -[TVRUIButtonPanelView bounds](self, "bounds");
  v6 = CGRectGetWidth(v53) * 0.5 - v5 * 0.5;
  -[TVRUIButtonPanelView bounds](self, "bounds");
  v7 = CGRectGetHeight(v54) * 0.5 - v5 * 0.5;
  -[TVRUIButtonPanelView primaryButton](self, "primaryButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFrame:", v6, v7, v5, v5);

  -[TVRUIButtonPanelView styleProvider](self, "styleProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "secondaryButtonSize");
  v11 = v10;

  -[TVRUIButtonPanelView styleProvider](self, "styleProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "controlPanelInsets");
  v14 = v13;

  -[TVRUIButtonPanelView bounds](self, "bounds");
  v16 = (v15 - v5) * 0.5;
  -[TVRUIButtonPanelView pagingButton](self, "pagingButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[TVRUIButtonPanelView bounds](self, "bounds");
    v18 = CGRectGetWidth(v55) - v14 - v11;
    -[TVRUIButtonPanelView pagingButton](self, "pagingButton");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFrame:", v18, v16, v11, v5);

  }
  -[TVRUIButtonPanelView rightButtons](self, "rightButtons");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  if (v21 == 1)
  {
    -[TVRUIButtonPanelView primaryButton](self, "primaryButton");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "frame");
    v24 = v14 + v5 + v23;
    -[TVRUIButtonPanelView bounds](self, "bounds");
    v26 = (v25 - v11) * 0.5;

    -[TVRUIButtonPanelView rightButtons](self, "rightButtons");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    v29 = 0;
  }
  else
  {
    -[TVRUIButtonPanelView rightButtons](self, "rightButtons");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "count");

    if (v31 != 2)
      goto LABEL_8;
    -[TVRUIButtonPanelView bounds](self, "bounds");
    v32 = CGRectGetWidth(v56) - v14 - v11;
    -[TVRUIButtonPanelView rightButtons](self, "rightButtons");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectAtIndexedSubscript:", 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setFrame:", v32, v16, v11, v11);

    -[TVRUIButtonPanelView bounds](self, "bounds");
    v24 = CGRectGetWidth(v57) - v14 - v11;
    -[TVRUIButtonPanelView bounds](self, "bounds");
    v26 = v35 - v16 - v11;
    -[TVRUIButtonPanelView rightButtons](self, "rightButtons");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    v29 = 1;
  }
  objc_msgSend(v27, "objectAtIndexedSubscript:", v29);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setFrame:", v24, v26, v11, v11);

LABEL_8:
  -[TVRUIButtonPanelView leftButtons](self, "leftButtons");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "count");

  if (v38 == 1)
  {
    -[TVRUIButtonPanelView primaryButton](self, "primaryButton");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "frame");
    v14 = v40 - v14 - v11;
    -[TVRUIButtonPanelView bounds](self, "bounds");
    v42 = (v41 - v11) * 0.5;

    -[TVRUIButtonPanelView leftButtons](self, "leftButtons");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v43;
    v45 = 0;
  }
  else
  {
    -[TVRUIButtonPanelView leftButtons](self, "leftButtons");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "count");

    if (v47 != 2)
      return;
    -[TVRUIButtonPanelView leftButtons](self, "leftButtons");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "objectAtIndexedSubscript:", 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setFrame:", v14, v16, v11, v11);

    -[TVRUIButtonPanelView bounds](self, "bounds");
    v42 = v50 - v16 - v11;
    -[TVRUIButtonPanelView leftButtons](self, "leftButtons");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v43;
    v45 = 1;
  }
  objc_msgSend(v43, "objectAtIndexedSubscript:", v45);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setFrame:", v14, v42, v11, v11);

}

- (void)setButtonEventDelegate:(id)a3
{
  id WeakRetained;
  id v5;
  TVRUIPagingButton *pagingButton;
  id v7;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_buttonEventDelegate);

  if (WeakRetained != obj)
  {
    v5 = objc_storeWeak((id *)&self->_buttonEventDelegate, obj);
    pagingButton = self->_pagingButton;
    v7 = v5;
    -[TVRUIPagingButton setButtonEventDelegate:](pagingButton, "setButtonEventDelegate:", obj);

  }
}

- (void)_configureButton:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "addTarget:action:forControlEvents:", self, sel__buttonPressed_, 1);
  objc_msgSend(v5, "addTarget:action:forControlEvents:", self, sel__buttonReleased_, 448);
  if (objc_msgSend(v5, "hasTapAction"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel__buttonTapped_);
    objc_msgSend(v4, "setCancelsTouchesInView:", 0);
    objc_msgSend(v5, "addGestureRecognizer:", v4);

  }
}

- (void)setPagingEnabled:(BOOL)a3
{
  self->_pagingEnabled = a3;
  -[TVRUIPagingButton setEnabled:](self->_pagingButton, "setEnabled:");
}

- (void)enableButtonsForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  uint8_t v14[8];
  _QWORD v15[4];
  id v16;
  TVRUIButtonPanelView *v17;
  id v18;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCEB8];
  -[TVRUIButtonPanelView primaryButton](self, "primaryButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[TVRUIButtonPanelView leftButtons](self, "leftButtons");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v8);

  -[TVRUIButtonPanelView rightButtons](self, "rightButtons");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v9);

  v10 = (void *)MEMORY[0x24BEBDB00];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __47__TVRUIButtonPanelView_enableButtonsForDevice___block_invoke;
  v15[3] = &unk_24DE2C8C8;
  v16 = v7;
  v17 = self;
  v18 = v4;
  v11 = v4;
  v12 = v7;
  objc_msgSend(v10, "animateWithDuration:animations:", v15, 0.24);
  _TVRUIViewControllerLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_21B042000, v13, OS_LOG_TYPE_DEFAULT, "Enabled panel buttons", v14, 2u);
  }

}

void __47__TVRUIButtonPanelView_enableButtonsForDevice___block_invoke(id *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = a1[4];
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(a1[5], "_enableButton:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6++), (_QWORD)v8);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  objc_msgSend(a1[5], "pagingButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnabled:", objc_msgSend(a1[6], "supportsPaging"));

}

- (void)_enableButton:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setEnabled:", 1);
  objc_msgSend(v3, "setAlpha:", 1.0);

}

- (void)disableButtons:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  _BOOL4 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v3 = a3;
  v29 = *MEMORY[0x24BDAC8D0];
  -[TVRUIButtonPanelView primaryButton](self, "primaryButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIButtonPanelView _disableButton:changeAlpha:](self, "_disableButton:changeAlpha:", v5, v3);

  -[TVRUIPagingButton setEnabled:](self->_pagingButton, "setEnabled:", 0);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[TVRUIButtonPanelView leftButtons](self, "leftButtons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        -[TVRUIButtonPanelView _disableButton:changeAlpha:](self, "_disableButton:changeAlpha:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v10++), v3);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
    }
    while (v8);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[TVRUIButtonPanelView rightButtons](self, "rightButtons", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        -[TVRUIButtonPanelView _disableButton:changeAlpha:](self, "_disableButton:changeAlpha:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v15++), v3);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
    }
    while (v13);
  }

  _TVRUIViewControllerLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v26 = v3;
    _os_log_impl(&dword_21B042000, v16, OS_LOG_TYPE_DEFAULT, "Disabled panel buttons. shouldChangeAlpha=%d", buf, 8u);
  }

}

- (void)_disableButton:(id)a3 changeAlpha:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  double v7;
  double v8;
  id v9;

  v4 = a4;
  v9 = a3;
  -[TVRUIButtonPanelView styleProvider](self, "styleProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "disabledButtonAlpha");
  v8 = v7;

  objc_msgSend(v9, "setEnabled:", 0);
  if (v4)
    objc_msgSend(v9, "setAlpha:", v8);

}

- (void)disableSearchButton
{
  id v3;

  -[TVRUIButtonPanelView _searchButton](self, "_searchButton");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[TVRUIButtonPanelView _disableButton:changeAlpha:](self, "_disableButton:changeAlpha:", v3, 1);

}

- (void)enableSearchButton
{
  id v3;

  -[TVRUIButtonPanelView _searchButton](self, "_searchButton");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[TVRUIButtonPanelView _enableButton:](self, "_enableButton:", v3);

}

- (id)_searchButton
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[TVRUIButtonPanelView rightButtons](self, "rightButtons", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v6, "buttonType") == 9998)
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)_buttonPressed:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_msgSend(v4, "hasTapAction") & 1) == 0)
    -[TVRUIButtonPanelView _sendButtonPressed:](self, "_sendButtonPressed:", objc_msgSend(v4, "buttonType"));

}

- (void)_buttonReleased:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_msgSend(v4, "hasTapAction") & 1) == 0)
    -[TVRUIButtonPanelView _sendButtonReleased:](self, "_sendButtonReleased:", objc_msgSend(v4, "buttonType"));

}

- (void)_buttonTapped:(id)a3
{
  id v4;

  objc_msgSend(a3, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[TVRUIButtonPanelView _sendButtonTapped:](self, "_sendButtonTapped:", objc_msgSend(v4, "buttonType"));

}

- (void)_sendButtonPressed:(int64_t)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  +[TVRUIButtonEvent createButtonEvent:buttonType:](TVRUIButtonEvent, "createButtonEvent:buttonType:", 1, a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[TVRUIButtonPanelView buttonEventDelegate](self, "buttonEventDelegate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[TVRUIButtonPanelView buttonEventDelegate](self, "buttonEventDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[TVRUIButtonPanelView buttonEventDelegate](self, "buttonEventDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "generatedButtonEvent:", v9);

    }
  }

}

- (void)_sendButtonReleased:(int64_t)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  +[TVRUIButtonEvent createButtonEvent:buttonType:](TVRUIButtonEvent, "createButtonEvent:buttonType:", 2, a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[TVRUIButtonPanelView buttonEventDelegate](self, "buttonEventDelegate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[TVRUIButtonPanelView buttonEventDelegate](self, "buttonEventDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[TVRUIButtonPanelView buttonEventDelegate](self, "buttonEventDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "generatedButtonEvent:", v9);

    }
  }

}

- (void)_sendButtonTapped:(int64_t)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  +[TVRUIButtonEvent createButtonEvent:buttonType:](TVRUIButtonEvent, "createButtonEvent:buttonType:", 0, a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[TVRUIButtonPanelView buttonEventDelegate](self, "buttonEventDelegate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[TVRUIButtonPanelView buttonEventDelegate](self, "buttonEventDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[TVRUIButtonPanelView buttonEventDelegate](self, "buttonEventDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "generatedButtonEvent:", v9);

    }
  }

}

- (_TVRUIEventDelegate)buttonEventDelegate
{
  return (_TVRUIEventDelegate *)objc_loadWeakRetained((id *)&self->_buttonEventDelegate);
}

- (TVRUIStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (void)setStyleProvider:(id)a3
{
  objc_storeStrong((id *)&self->_styleProvider, a3);
}

- (BOOL)isPagingEnabled
{
  return self->_pagingEnabled;
}

- (TVRUIButton)primaryButton
{
  return self->_primaryButton;
}

- (void)setPrimaryButton:(id)a3
{
  objc_storeStrong((id *)&self->_primaryButton, a3);
}

- (TVRUIPagingButton)pagingButton
{
  return self->_pagingButton;
}

- (void)setPagingButton:(id)a3
{
  objc_storeStrong((id *)&self->_pagingButton, a3);
}

- (NSMutableArray)leftButtons
{
  return self->_leftButtons;
}

- (void)setLeftButtons:(id)a3
{
  objc_storeStrong((id *)&self->_leftButtons, a3);
}

- (NSMutableArray)rightButtons
{
  return self->_rightButtons;
}

- (void)setRightButtons:(id)a3
{
  objc_storeStrong((id *)&self->_rightButtons, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightButtons, 0);
  objc_storeStrong((id *)&self->_leftButtons, 0);
  objc_storeStrong((id *)&self->_pagingButton, 0);
  objc_storeStrong((id *)&self->_primaryButton, 0);
  objc_storeStrong((id *)&self->_styleProvider, 0);
  objc_destroyWeak((id *)&self->_buttonEventDelegate);
}

- (void)initPagedPanelWithPrimaryButtonType:(uint64_t)a1 secondaryLeftButtons:(uint64_t)a2 styleProvider:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218242;
  v4 = a2;
  v5 = 2114;
  v6 = a1;
  _os_log_fault_impl(&dword_21B042000, log, OS_LOG_TYPE_FAULT, "Paging button title was longer than max allowable length of (%ld), title is %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
