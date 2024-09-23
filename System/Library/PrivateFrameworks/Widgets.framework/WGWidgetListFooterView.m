@implementation WGWidgetListFooterView

- (WGWidgetListFooterView)initWithFrame:(CGRect)a3
{
  WGWidgetListFooterView *v3;
  id v4;
  uint64_t v5;
  UIView *contentView;
  WGShortLookStyleButton *v7;
  WGShortLookStyleButton *editButton;
  WGShortLookStyleButton *v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *widgetIDsToAttributionViews;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)WGWidgetListFooterView;
  v3 = -[WGWidgetListFooterView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDF6F90]);
    -[WGWidgetListFooterView bounds](v3, "bounds");
    v5 = objc_msgSend(v4, "initWithFrame:");
    contentView = v3->_contentView;
    v3->_contentView = (UIView *)v5;

    -[WGWidgetListFooterView addSubview:](v3, "addSubview:", v3->_contentView);
    -[WGWidgetListFooterView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v7 = objc_alloc_init(WGShortLookStyleButton);
    editButton = v3->_editButton;
    v3->_editButton = v7;

    v9 = v3->_editButton;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("WIDGETS_EDIT_BUTTON"), &stru_24D733868, CFSTR("Widgets"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGShortLookStyleButton setTitle:](v9, "setTitle:", v11);

    -[UIView addSubview:](v3->_contentView, "addSubview:", v3->_editButton);
    -[WGWidgetListFooterView _addCustomizeButton](v3, "_addCustomizeButton");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_os_feature_enabled_impl() & 1) == 0)
      objc_msgSend(v12, "addObserver:selector:name:object:", v3, sel__availableWidgetsUpdated_, CFSTR("WGAvailableWidgetsUpdatedNotification"), 0);
    objc_msgSend(v12, "addObserver:selector:name:object:", v3, sel__updateForContentCategorySizeDidChange, *MEMORY[0x24BDF7670], 0);
    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    widgetIDsToAttributionViews = v3->_widgetIDsToAttributionViews;
    v3->_widgetIDsToAttributionViews = v13;

    -[WGWidgetListFooterView setShouldSizeContent:](v3, "setShouldSizeContent:", 1);
  }
  return v3;
}

- (void)setLayoutMode:(int64_t)a3
{
  if (self->_layoutMode != a3)
  {
    self->_layoutMode = a3;
    -[WGWidgetListFooterView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)shouldBlurContent
{
  return -[WGShortLookStyleButton isBackgroundBlurred](self->_editButton, "isBackgroundBlurred");
}

- (void)setShouldBlurContent:(BOOL)a3
{
  -[WGShortLookStyleButton setBackgroundBlurred:](self->_editButton, "setBackgroundBlurred:", a3);
}

- (void)setVisibleWidgetsIDs:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  void *v19;
  _QWORD v20[6];
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
  v4 = a3;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[NSMutableDictionary allKeys](self->_widgetIDsToAttributionViews, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        if ((objc_msgSend(v4, "containsObject:", v11) & 1) == 0)
        {
          -[NSMutableDictionary objectForKey:](self->_widgetIDsToAttributionViews, "objectForKey:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "removeFromSuperview");
          -[NSMutableDictionary removeObjectForKey:](self->_widgetIDsToAttributionViews, "removeObjectForKey:", v11);

          v8 = 1;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v7);

    if ((v8 & 1) != 0)
    {
      -[WGWidgetListFooterView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
      -[WGWidgetListFooterView setNeedsLayout](self, "setNeedsLayout");
    }
  }
  else
  {

  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v13 = v4;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j);
        -[NSMutableDictionary objectForKey:](self->_widgetIDsToAttributionViews, "objectForKey:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v19)
        {
          v20[0] = MEMORY[0x24BDAC760];
          v20[1] = 3221225472;
          v20[2] = __47__WGWidgetListFooterView_setVisibleWidgetsIDs___block_invoke;
          v20[3] = &unk_24D7321B0;
          v20[4] = self;
          v20[5] = v18;
          +[WGWidgetAttributionView requestAttributedStringForIdentifier:withHandler:](WGWidgetAttributionView, "requestAttributedStringForIdentifier:withHandler:", v18, v20);
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v15);
  }

}

void __47__WGWidgetListFooterView_setVisibleWidgetsIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9;
  id location;

  v3 = a2;
  if (v3)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __47__WGWidgetListFooterView_setVisibleWidgetsIDs___block_invoke_2;
    v6[3] = &unk_24D731C10;
    objc_copyWeak(&v9, &location);
    v4 = v3;
    v5 = *(_QWORD *)(a1 + 40);
    v7 = v4;
    v8 = v5;
    dispatch_async(MEMORY[0x24BDAC9B8], v6);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

void __47__WGWidgetListFooterView_setVisibleWidgetsIDs___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_setAttributedString:forWidgetIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_setAttributedString:(id)a3 forWidgetIdentifier:(id)a4
{
  NSMutableDictionary *widgetIDsToAttributionViews;
  id v7;
  id v8;
  WGWidgetAttributionView *v9;
  void *v10;
  void *v11;
  id v12;

  widgetIDsToAttributionViews = self->_widgetIDsToAttributionViews;
  v7 = a4;
  v8 = a3;
  -[NSMutableDictionary objectForKey:](widgetIDsToAttributionViews, "objectForKey:", v7);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeFromSuperview");
  v9 = -[WGWidgetAttributionView initWithWidgetAttributedString:]([WGWidgetAttributionView alloc], "initWithWidgetAttributedString:", v8);

  -[WGWidgetAttributionView setDelegate:](v9, "setDelegate:", self);
  -[WGWidgetListFooterView legibilitySettings](self, "legibilitySettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "primaryColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WGWidgetAttributionView setLegibilityTextColor:](v9, "setLegibilityTextColor:", v11);

  -[WGWidgetAttributionView _setInteractiveTextSelectionDisabled:](v9, "_setInteractiveTextSelectionDisabled:", 1);
  -[NSMutableDictionary setObject:forKey:](self->_widgetIDsToAttributionViews, "setObject:forKey:", v9, v7);

  -[UIView addSubview:](self->_contentView, "addSubview:", v9);
  -[WGWidgetListFooterView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[WGWidgetListFooterView setNeedsLayout](self, "setNeedsLayout");

}

- (void)_addCustomizeButton
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  UIButton *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  UIButton *customizeButton;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v42;
  _QWORD v43[5];
  uint64_t v44;
  void *v45;
  uint64_t v46;
  _QWORD v47[3];

  v47[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF6A78], "defaultFontDescriptorWithTextStyle:", *MEMORY[0x24BDF77B8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = *MEMORY[0x24BDF7770];
  v44 = *MEMORY[0x24BDF78A0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BDF7890]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontDescriptorByAddingAttributes:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BDF6A70];
  objc_msgSend(v6, "pointSize");
  v40 = v6;
  objc_msgSend(v7, "fontWithDescriptor:size:", v6);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  objc_msgSend(v8, "setFont:", v42);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("WIDGETS_CUSTOMIZE_BUTTON"), &stru_24D733868, CFSTR("Widgets"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v10);

  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v11);

  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v12 = (void *)MEMORY[0x24BDF6AE0];
  objc_msgSend(v6, "pointSize");
  objc_msgSend(v12, "configurationWithPointSize:weight:", 6);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:withConfiguration:", CFSTR("chevron.forward"), v39);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v38);
  LODWORD(v14) = 1144750080;
  objc_msgSend(v13, "setContentHuggingPriority:forAxis:", 0, v14);
  objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v8, "intrinsicContentSize");
  v16 = v15 + 10.0;
  objc_msgSend(v13, "intrinsicContentSize");
  v18 = v16 + v17 + 10.0;
  objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 0);
  v19 = (UIButton *)objc_claimAutoreleasedReturnValue();
  -[UIButton setFrame:](v19, "setFrame:", 0.0, 0.0, v18, 20.0);
  -[UIButton setAlpha:](v19, "setAlpha:", 0.0);
  -[UIButton addSubview:](v19, "addSubview:", v8);
  -[UIButton addSubview:](v19, "addSubview:", v13);
  v31 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v8, "leadingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton leadingAnchor](v19, "leadingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:constant:", v36, 10.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v35;
  objc_msgSend(v13, "leadingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trailingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v32;
  -[UIButton trailingAnchor](v19, "trailingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:constant:", v29, 10.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v43[2] = v28;
  objc_msgSend(v8, "centerYAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton centerYAnchor](v19, "centerYAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v43[3] = v22;
  objc_msgSend(v13, "centerYAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton centerYAnchor](v19, "centerYAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v43[4] = v25;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "activateConstraints:", v26);

  -[UIView addSubview:](self->_contentView, "addSubview:", v19);
  customizeButton = self->_customizeButton;
  self->_customizeButton = v19;

}

- (void)setDelegate:(id)a3
{
  void *v4;
  MTMaterialView *v5;
  MTMaterialView *customizeButtonBackground;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_storeWeak((id *)&self->_delegate, a3);
  -[WGWidgetListFooterView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "editingMaterialViewForWidgetListFooterView:", self);
  v5 = (MTMaterialView *)objc_claimAutoreleasedReturnValue();
  customizeButtonBackground = self->_customizeButtonBackground;
  self->_customizeButtonBackground = v5;

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[UIButton subviews](self->_customizeButton, "subviews", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11);
        -[MTMaterialView visualStylingProviderForCategory:](self->_customizeButtonBackground, "visualStylingProviderForCategory:", 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "automaticallyUpdateView:withStyle:", v12, 1);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

}

- (void)setShouldSizeContent:(BOOL)a3
{
  if (self->_shouldSizeContent != a3)
  {
    self->_shouldSizeContent = a3;
    -[WGWidgetListFooterView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v44 = *MEMORY[0x24BDAC8D0];
  -[WGWidgetListFooterView _referenceFont](self, "_referenceFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_scaledValueForValue:", 12.0);
  v8 = v7;
  -[WGShortLookStyleButton alpha](self->_editButton, "alpha");
  if (v9 > 0.0)
  {
    -[WGShortLookStyleButton sizeThatFits:](self->_editButton, "sizeThatFits:", width, height);
    v8 = v8 + v10;
  }
  -[UIButton alpha](self->_customizeButton, "alpha");
  if (v11 > 0.0)
  {
    -[UIButton frame](self->_customizeButton, "frame");
    v8 = v8 + v12;
  }
  v13 = -[WGNewWidgetsButton badgeNumber](self->_widgetAvailableButton, "badgeNumber");
  v14 = 0.0;
  v15 = 0.0;
  if (v13)
  {
    -[WGNewWidgetsButton sizeThatFits:](self->_widgetAvailableButton, "sizeThatFits:", width, 0.0);
    v15 = v16 + 22.0;
  }
  v17 = v8 + v15;
  v18 = -[NSMutableDictionary count](self->_widgetIDsToAttributionViews, "count");
  if (v18 >= 1)
  {
    objc_msgSend(v6, "_scaledValueForValue:", (double)v18 * 15.0 + 7.0);
    v14 = v19;
  }
  v20 = v17 + v14;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[NSMutableDictionary allValues](self->_widgetIDsToAttributionViews, "allValues", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v40 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v26, "layoutIfNeeded");
        WGMainScreenReferenceBounds();
        objc_msgSend(v26, "sizeThatFits:", v27 + -40.0, 0.0);
        v29 = v28;
        objc_msgSend(v26, "textContainerInset");
        v31 = v29 - v30;
        objc_msgSend(v6, "lineHeight");
        v33 = v31 - v32;
        objc_msgSend(v26, "textContainerInset");
        v20 = v20 + v33 - v34;
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v23);
  }

  objc_msgSend(v6, "_scaledValueForValue:", 5.5);
  v36 = v35;

  v37 = v20 + v36;
  v38 = width;
  result.height = v37;
  result.width = v38;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  CGSize result;

  v2 = *MEMORY[0x24BDF7FB8];
  -[WGWidgetListFooterView sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  v4 = v2;
  result.height = v3;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
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
  double v15;
  void *v16;
  double v17;
  double v18;
  WGNewWidgetsButton *widgetAvailableButton;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  objc_super v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v73.receiver = self;
  v73.super_class = (Class)WGWidgetListFooterView;
  -[WGWidgetListFooterView layoutSubviews](&v73, sel_layoutSubviews);
  -[WGWidgetListFooterView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[WGWidgetListFooterView _referenceFont](self, "_referenceFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_scaledValueForValue:", 12.0);
  v68 = v12;

  if (self->_shouldSizeContent)
    -[UIView setFrame:](self->_contentView, "setFrame:", v4, v6, v8, v10);
  -[WGShortLookStyleButton sizeToFit](self->_editButton, "sizeToFit");
  -[WGShortLookStyleButton bounds](self->_editButton, "bounds");
  v65 = _WGMainScreenScale();
  UIRectCenteredIntegralRectScale();
  v14 = v13;
  -[WGShortLookStyleButton setFrame:](self->_editButton, "setFrame:", *(_QWORD *)&v65);
  v15 = v8;
  -[UIButton setFrame:](self->_customizeButton, "setFrame:", 0.0, v68, v8, 20.0);
  -[WGWidgetListFooterView _referenceFont](self, "_referenceFont");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_scaledValueForValue:", v14);
  v18 = v68 + v17;

  widgetAvailableButton = self->_widgetAvailableButton;
  if (widgetAvailableButton && -[WGNewWidgetsButton badgeNumber](widgetAvailableButton, "badgeNumber"))
  {
    -[WGNewWidgetsButton sizeToFit](self->_widgetAvailableButton, "sizeToFit");
    -[WGNewWidgetsButton size](self->_widgetAvailableButton, "size");
    WGMainScreenReferenceBounds();
    -[WGNewWidgetsButton size](self->_widgetAvailableButton, "size");
    BSRectWithSize();
    -[WGNewWidgetsButton frame](self->_widgetAvailableButton, "frame");
    v21 = v18 + v20;
    v66 = _WGMainScreenScale();
    UIRectCenteredIntegralRectScale();
    v23 = v22;
    v25 = v24;
    v27 = v26;
    -[WGWidgetListFooterView _referenceFont](self, "_referenceFont", *(_QWORD *)&v66);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "_scaledValueForValue:", v21);
    v30 = v29;
    -[WGWidgetListFooterView _referenceFont](self, "_referenceFont");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "ascender");
    v33 = v30 - v32;

    -[WGNewWidgetsButton setFrame:](self->_widgetAvailableButton, "setFrame:", v23, v33, v25, v27);
    v18 = v21 + 22.0;
  }
  if (-[NSMutableDictionary count](self->_widgetIDsToAttributionViews, "count"))
  {
    -[WGWidgetListFooterView _referenceFont](self, "_referenceFont");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "_scaledValueForValue:", 7.0);
    v18 = v18 + v35;

  }
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  +[WGWidgetAttributionView widgetAttributionIDsInOrder](WGWidgetAttributionView, "widgetAttributionIDsInOrder");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v70;
    do
    {
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v70 != v39)
          objc_enumerationMutation(v36);
        -[NSMutableDictionary objectForKey:](self->_widgetIDsToAttributionViews, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * i));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (v41)
        {
          -[WGWidgetListFooterView _referenceFont](self, "_referenceFont");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "_scaledValueForValue:", 15.0);
          v44 = v18 + v43;

          objc_msgSend(v41, "sizeThatFits:", v15 + -40.0, 0.0);
          BSRectWithSize();
          v67 = _WGMainScreenScale();
          UIRectCenteredIntegralRectScale();
          v46 = v45;
          v48 = v47;
          v50 = v49;
          -[WGWidgetListFooterView _referenceFont](self, "_referenceFont", *(_QWORD *)&v67);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "_scaledValueForValue:", v44);
          v53 = v52;
          -[WGWidgetListFooterView _referenceFont](self, "_referenceFont");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "ascender");
          v56 = v53 - v55;

          objc_msgSend(v41, "setFrame:", v46, v56, v48, v50);
          objc_msgSend(v41, "bounds");
          v58 = v57;
          objc_msgSend(v41, "textContainerInset");
          v60 = v58 - v59;
          -[WGWidgetListFooterView _referenceFont](self, "_referenceFont");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "lineHeight");
          v63 = v60 - v62;
          objc_msgSend(v41, "textContainerInset");
          v18 = v44 + v63 - v64;

        }
      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
    }
    while (v38);
  }

}

- (void)invalidateSubviewGeometery
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  -[NSMutableDictionary allValues](self->_widgetIDsToAttributionViews, "allValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setNeedsLayout");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[WGNewWidgetsButton updateForContentCategorySizeChange](self->_widgetAvailableButton, "updateForContentCategorySizeChange");
  -[WGWidgetListFooterView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)setLegibilitySettings:(id)a3
{
  _UILegibilitySettings *v5;
  _UILegibilitySettings **p_legibilitySettings;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = (_UILegibilitySettings *)a3;
  p_legibilitySettings = &self->_legibilitySettings;
  if (self->_legibilitySettings != v5)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[NSMutableDictionary allValues](self->_widgetIDsToAttributionViews, "allValues", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v11);
          -[_UILegibilitySettings primaryColor](*p_legibilitySettings, "primaryColor");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setLegibilityTextColor:", v13);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

    -[WGNewWidgetsButton setLegibilitySettings:](self->_widgetAvailableButton, "setLegibilitySettings:", *p_legibilitySettings);
    -[WGWidgetListFooterView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)_availableWidgetsUpdated:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  WGNewWidgetsButton *widgetAvailableButton;
  WGNewWidgetsButton *v8;
  WGNewWidgetsButton *v9;
  WGNewWidgetsButton *v10;
  void *v11;
  WGNewWidgetsButton *v12;
  id v13;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("WGNewWidgetsCountKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  widgetAvailableButton = self->_widgetAvailableButton;
  if (v6)
  {
    if (!widgetAvailableButton)
    {
      v8 = objc_alloc_init(WGNewWidgetsButton);
      v9 = self->_widgetAvailableButton;
      self->_widgetAvailableButton = v8;

      v10 = self->_widgetAvailableButton;
      -[WGWidgetListFooterView legibilitySettings](self, "legibilitySettings");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[WGNewWidgetsButton setLegibilitySettings:](v10, "setLegibilitySettings:", v11);

      -[UIView addSubview:](self->_contentView, "addSubview:", self->_widgetAvailableButton);
      widgetAvailableButton = self->_widgetAvailableButton;
    }
    -[WGNewWidgetsButton setBadgeNumber:](widgetAvailableButton, "setBadgeNumber:", v6);
    -[WGWidgetListFooterView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[WGWidgetListFooterView setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    -[WGNewWidgetsButton removeFromSuperview](widgetAvailableButton, "removeFromSuperview");
    v12 = self->_widgetAvailableButton;
    self->_widgetAvailableButton = 0;

  }
  -[WGWidgetListFooterView delegate](self, "delegate");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "widgetListFooterViewAvailableNewWidgetsUpdated:", self);

}

- (id)_referenceFont
{
  UIFont *referenceFont;
  void *v4;
  UIFont *v5;
  UIFont *v6;

  referenceFont = self->_referenceFont;
  if (!referenceFont)
  {
    objc_msgSend(MEMORY[0x24BE0BF20], "defaultFontProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredFontForTextStyle:hiFontStyle:", *MEMORY[0x24BDF77C8], 1);
    v5 = (UIFont *)objc_claimAutoreleasedReturnValue();
    v6 = self->_referenceFont;
    self->_referenceFont = v5;

    referenceFont = self->_referenceFont;
  }
  return referenceFont;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v7;
  NSObject *v8;
  _QWORD block[4];
  id v11;

  v7 = a4;
  if ((unint64_t)(a6 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    dispatch_get_global_queue(2, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __77__WGWidgetListFooterView_textView_shouldInteractWithURL_inRange_interaction___block_invoke;
    block[3] = &unk_24D7314D8;
    v11 = v7;
    dispatch_async(v8, block);

  }
  return 0;
}

void __77__WGWidgetListFooterView_textView_shouldInteractWithURL_inRange_interaction___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  char v6;
  id v7;
  id v8;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE38320];
  v9[0] = *MEMORY[0x24BE38310];
  v9[1] = v2;
  v10[0] = MEMORY[0x24BDBD1C8];
  v10[1] = MEMORY[0x24BDBD1C8];
  v9[2] = *MEMORY[0x24BE382E0];
  v10[2] = *MEMORY[0x24BDE2778];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v8 = 0;
  v6 = objc_msgSend(v4, "openSensitiveURL:withOptions:error:", v5, v3, &v8);
  v7 = v8;

  if ((v6 & 1) == 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __77__WGWidgetListFooterView_textView_shouldInteractWithURL_inRange_interaction___block_invoke_cold_1((uint64_t)v7);

}

- (BOOL)textView:(id)a3 shouldInteractWithTextAttachment:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  return 0;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  UIFont *referenceFont;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WGWidgetListFooterView;
  v4 = a3;
  -[WGWidgetListFooterView traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  -[WGWidgetListFooterView traitCollection](self, "traitCollection", v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", v6);

    if ((v8 & 1) == 0)
    {
      referenceFont = self->_referenceFont;
      self->_referenceFont = 0;

      -[WGWidgetListFooterView invalidateSubviewGeometery](self, "invalidateSubviewGeometery");
      -[WGWidgetListFooterView setNeedsLayout](self, "setNeedsLayout");
    }
  }

}

- (NSString)materialGroupNameBase
{
  return -[WGShortLookStyleButton materialGroupNameBase](self->_editButton, "materialGroupNameBase");
}

- (void)setMaterialGroupNameBase:(id)a3
{
  -[WGShortLookStyleButton setMaterialGroupNameBase:](self->_editButton, "setMaterialGroupNameBase:", a3);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (int64_t)layoutMode
{
  return self->_layoutMode;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (BOOL)shouldSizeContent
{
  return self->_shouldSizeContent;
}

- (WGShortLookStyleButton)editButton
{
  return self->_editButton;
}

- (void)setEditButton:(id)a3
{
  objc_storeStrong((id *)&self->_editButton, a3);
}

- (UIButton)customizeButton
{
  return self->_customizeButton;
}

- (void)setCustomizeButton:(id)a3
{
  objc_storeStrong((id *)&self->_customizeButton, a3);
}

- (WGWidgetListFooterViewDelegate)delegate
{
  return (WGWidgetListFooterViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (WGNewWidgetsButton)widgetAvailableButton
{
  return self->_widgetAvailableButton;
}

- (void)setWidgetAvailableButton:(id)a3
{
  objc_storeStrong((id *)&self->_widgetAvailableButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetAvailableButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_customizeButton, 0);
  objc_storeStrong((id *)&self->_editButton, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_customizeButtonBackground, 0);
  objc_storeStrong((id *)&self->_referenceFont, 0);
  objc_storeStrong((id *)&self->_widgetIDsToAttributionViews, 0);
}

void __77__WGWidgetListFooterView_textView_shouldInteractWithURL_inRange_interaction___block_invoke_cold_1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 138412290;
  v2 = a1;
  _os_log_error_impl(&dword_2172E1000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to open Widget Footer View URL: %@", (uint8_t *)&v1, 0xCu);
}

@end
