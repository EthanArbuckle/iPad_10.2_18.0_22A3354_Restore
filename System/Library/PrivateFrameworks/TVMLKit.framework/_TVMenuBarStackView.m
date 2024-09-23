@implementation _TVMenuBarStackView

- (_TVMenuBarStackView)initWithFrame:(CGRect)a3
{
  _TVMenuBarStackView *v3;
  _TVMenuBarStackView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_TVMenuBarStackView;
  v3 = -[_TVMenuBarStackView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[_TVMenuBarStackView _configureView](v3, "_configureView");
  return v4;
}

- (_TVMenuBarStackView)initWithCoder:(id)a3
{
  _TVMenuBarStackView *v3;
  _TVMenuBarStackView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_TVMenuBarStackView;
  v3 = -[_TVMenuBarStackView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[_TVMenuBarStackView _configureView](v3, "_configureView");
  return v4;
}

- (void)setSelectedIndex:(unint64_t)a3
{
  void *v4;
  _QWORD v5[5];

  if (self->_selectedIndex != a3)
  {
    self->_selectedIndex = a3;
    -[_TVMenuBarStackView arrangedSubviews](self, "arrangedSubviews");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __40___TVMenuBarStackView_setSelectedIndex___block_invoke;
    v5[3] = &unk_24EB85468;
    v5[4] = self;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

  }
}

- (void)setTabBarItems:(id)a3
{
  NSArray *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSArray *v12;
  NSArray *tabBarItems;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSArray *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = (NSArray *)a3;
  if (self->_tabBarItems != v4)
  {
    -[_TVMenuBarStackView subviews](self, "subviews");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v27;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v27 != v10)
            objc_enumerationMutation(v7);
          -[_TVMenuBarStackView removeArrangedSubview:](self, "removeArrangedSubview:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v11++));
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v9);
    }

    v21 = v4;
    v12 = (NSArray *)-[NSArray copy](v4, "copy");
    tabBarItems = self->_tabBarItems;
    self->_tabBarItems = v12;

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v14 = self->_tabBarItems;
    v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v23;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v23 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v18);
          +[_TVMenuBarStackButton buttonWithType:](_TVMenuBarStackButton, "buttonWithType:", 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setTabBarItem:", v19);
          objc_msgSend(v20, "addTarget:action:forControlEvents:", self, sel__buttonEventTouchUpInside_, 64);
          -[_TVMenuBarStackView addArrangedSubview:](self, "addArrangedSubview:", v20);

          ++v18;
        }
        while (v16 != v18);
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v16);
    }

    v4 = v21;
  }

}

- (void)_buttonEventTouchUpInside:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, uint64_t, _BYTE *);
  void *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  -[_TVMenuBarStackView arrangedSubviews](self, "arrangedSubviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __49___TVMenuBarStackView__buttonEventTouchUpInside___block_invoke;
  v14 = &unk_24EB85490;
  v6 = v4;
  v15 = v6;
  v16 = &v17;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v11);

  -[_TVMenuBarStackView delegate](self, "delegate", v11, v12, v13, v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = -[_TVMenuBarStackView selectedIndex](self, "selectedIndex");
    if (v8 == v18[3])
    {
      -[_TVMenuBarStackView delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stackView:poppedToRootForIndex:", self, v18[3]);

    }
    -[_TVMenuBarStackView delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stackView:selectedIndex:", self, v18[3]);

  }
  -[_TVMenuBarStackView setSelectedIndex:](self, "setSelectedIndex:", v18[3]);

  _Block_object_dispose(&v17, 8);
}

- (void)_configureView
{
  double v3;
  double v4;

  self->_selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
  -[_TVMenuBarStackView setAlignment:](self, "setAlignment:", 3);
  -[_TVMenuBarStackView setAxis:](self, "setAxis:", 0);
  LODWORD(v3) = 1132068864;
  -[_TVMenuBarStackView setContentHuggingPriority:forAxis:](self, "setContentHuggingPriority:forAxis:", 0, v3);
  LODWORD(v4) = 1132068864;
  -[_TVMenuBarStackView setContentHuggingPriority:forAxis:](self, "setContentHuggingPriority:forAxis:", 1, v4);
  -[_TVMenuBarStackView setDistribution:](self, "setDistribution:", 0);
  -[_TVMenuBarStackView setSpacing:](self, "setSpacing:", 36.0);
}

- (_TVMenuBarStackViewDelegate)delegate
{
  return (_TVMenuBarStackViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (NSArray)tabBarItems
{
  return self->_tabBarItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabBarItems, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
