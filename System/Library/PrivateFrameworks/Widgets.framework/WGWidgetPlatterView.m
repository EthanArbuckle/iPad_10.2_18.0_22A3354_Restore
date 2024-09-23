@implementation WGWidgetPlatterView

- (WGWidgetPlatterView)initWithFrame:(CGRect)a3
{
  WGWidgetPlatterView *v3;
  WGWidgetPlatterView *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WGWidgetPlatterView;
  v3 = -[WGWidgetPlatterView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[WGWidgetPlatterView setClipsToBounds:](v3, "setClipsToBounds:", 1);
    -[WGWidgetPlatterView setAutoresizesSubviews:](v4, "setAutoresizesSubviews:", 1);
    -[WGWidgetPlatterView _setContinuousCornerRadius:](v4, "_setContinuousCornerRadius:", 13.0);
    -[WGWidgetPlatterView layer](v4, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsGroupBlending:", 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v4, sel_iconDidInvalidate_, CFSTR("WGWidgetInfoIconDidInvalidateNotification"), 0);

  }
  return v4;
}

- (void)setWidgetHost:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  id v9;
  WGPlatterHeaderContentView *headerContentView;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_widgetHost);
  v6 = WeakRetained;
  if (WeakRetained != v4)
  {
    objc_msgSend(WeakRetained, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeFromSuperview");

    v8 = objc_storeWeak((id *)&self->_widgetHost, v4);
    objc_initWeak(&location, self);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __37__WGWidgetPlatterView_setWidgetHost___block_invoke;
    v14[3] = &unk_24D731C38;
    objc_copyWeak(&v16, &location);
    v9 = v4;
    v15 = v9;
    objc_msgSend(v9, "requestIconWithHandler:", v14);
    headerContentView = self->_headerContentView;
    objc_msgSend(v9, "displayName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedUppercaseString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPlatterHeaderContentView setTitle:](headerContentView, "setTitle:", v12);

    -[WGWidgetPlatterView _updateUtilityButtonForMode:](self, "_updateUtilityButtonForMode:", self->_buttonMode);
    objc_msgSend(v9, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetPlatterView _setContentView:](self, "_setContentView:", v13);

    -[WGWidgetPlatterView setNeedsLayout](self, "setNeedsLayout");
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);

  }
}

void __37__WGWidgetPlatterView_setWidgetHost___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__WGWidgetPlatterView_setWidgetHost___block_invoke_2;
  block[3] = &unk_24D731C10;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v8);
}

void __37__WGWidgetPlatterView_setWidgetHost___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      v9[0] = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained[53], "setIcons:", v3);

    }
    objc_msgSend(*(id *)(a1 + 40), "widgetIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    WGApplicationIdentifierForWidgetWithBundleIdentifier(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    if (v6)
    {
      objc_msgSend(WeakRetained[53], "iconButtons");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addTarget:action:forControlEvents:", WeakRetained, sel__handleIconButton_, 64);

    }
  }

}

- (CGSize)minimumSizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[WGWidgetPlatterView sizeThatFitsContentWithSize:](self, "sizeThatFitsContentWithSize:", a3.width, 0.0);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setContentViewHitTestingDisabled:(BOOL)a3
{
  if (self->_contentViewHitTestingDisabled != a3)
  {
    self->_contentViewHitTestingDisabled = a3;
    -[UIView bs_setHitTestingDisabled:](self->_contentView, "bs_setHitTestingDisabled:");
  }
}

- (void)setClippingEdge:(unint64_t)a3
{
  void *v6;

  if (a3 != 1 && a3 != 4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WGWidgetPlatterView.m"), 103, CFSTR("Only 'UIRectEdgeTop' or 'UIRectEdgeBottom' (but not both) are supported."));

  }
  if (self->_clippingEdge != a3)
  {
    self->_clippingEdge = a3;
    -[WGWidgetPlatterView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setBackgroundHidden:(BOOL)a3
{
  if (self->_backgroundHidden != a3)
  {
    self->_backgroundHidden = a3;
    -[WGWidgetPlatterView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setButtonMode:(int64_t)a3
{
  self->_buttonMode = a3;
  -[WGWidgetPlatterView _updateUtilityButtonForMode:](self, "_updateUtilityButtonForMode:");
}

- (UIButton)showMoreButton
{
  -[WGWidgetPlatterView _configureHeaderViewsIfNecessary](self, "_configureHeaderViewsIfNecessary");
  return -[PLPlatterHeaderContentView utilityButton](self->_headerContentView, "utilityButton");
}

- (void)setShowingMoreContent:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL8 v5;
  id WeakRetained;

  v3 = a3;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_widgetHost);
  objc_msgSend(WeakRetained, "setUserSpecifiedDisplayMode:", v5);

  if (self->_showingMoreContent != v3)
  {
    self->_showingMoreContent = v3;
    -[WGWidgetPlatterView _updateUtilityButtonForMoreContentState:](self, "_updateUtilityButtonForMoreContentState:", v3);
  }
}

- (UIButton)addWidgetButton
{
  -[WGWidgetPlatterView _configureHeaderViewsIfNecessary](self, "_configureHeaderViewsIfNecessary");
  return -[PLPlatterHeaderContentView utilityButton](self->_headerContentView, "utilityButton");
}

- (void)setTopMarginForLayout:(double)a3
{
  if (self->_topMarginForLayout != a3)
  {
    self->_topMarginForLayout = a3;
    -[WGWidgetPlatterView setNeedsLayout](self, "setNeedsLayout");
  }
}

+ (double)contentBaselineToBoundsBottomWithWidth:(double)a3
{
  double result;

  +[PLPlatterHeaderContentView contentBaselineToBoundsBottomWithWidth:scale:](WGPlatterHeaderContentView, "contentBaselineToBoundsBottomWithWidth:scale:", a3, _WGMainScreenScale());
  return result;
}

- (NSString)widgetIdentifier
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_widgetHost);
  objc_msgSend(WeakRetained, "widgetIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)cancelTouches
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_widgetHost);
  objc_msgSend(WeakRetained, "_cancelTouches");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  id WeakRetained;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  width = a3.width;
  WeakRetained = objc_loadWeakRetained((id *)&self->_widgetHost);
  objc_msgSend(WeakRetained, "parentViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "sizeForChildContentContainer:withParentContainerSize:", WeakRetained, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  else
    -[WGWidgetPlatterView _contentSize](self, "_contentSize");
  -[WGWidgetPlatterView sizeThatFitsContentWithSize:](self, "sizeThatFitsContentWithSize:", width);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  CGSize result;

  v3 = *MEMORY[0x24BDF7FB8];
  -[WGWidgetPlatterView _contentSize](self, "_contentSize");
  -[WGWidgetPlatterView sizeThatFitsContentWithSize:](self, "sizeThatFitsContentWithSize:");
  v5 = v3;
  result.height = v4;
  result.width = v5;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  unint64_t clippingEdge;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  void *v32;
  double cornerRadius;
  double Height;
  double v35;
  double MaxY;
  objc_super v37;
  objc_super v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  v38.receiver = self;
  v38.super_class = (Class)WGWidgetPlatterView;
  -[WGWidgetPlatterView layoutSubviews](&v38, sel_layoutSubviews);
  -[WGWidgetPlatterView _configureBackgroundMaterialViewIfNecessary](self, "_configureBackgroundMaterialViewIfNecessary");
  -[WGWidgetPlatterView _configureHeaderViewsIfNecessary](self, "_configureHeaderViewsIfNecessary");
  -[WGWidgetPlatterView _layoutHeaderViews](self, "_layoutHeaderViews");
  -[WGWidgetPlatterView _layoutContentView](self, "_layoutContentView");
  -[WGWidgetPlatterView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView frame](self->_contentView, "frame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v39.origin.x = v4;
  v39.origin.y = v6;
  v39.size.width = v8;
  v39.size.height = v10;
  MaxY = CGRectGetMaxY(v39);
  v40.origin.x = v12;
  v40.origin.y = v14;
  v40.size.width = v16;
  v40.size.height = v18;
  v19 = CGRectGetMaxY(v40);
  v20 = v19;
  clippingEdge = self->_clippingEdge;
  if (clippingEdge == 4)
  {
    v19 = MaxY;
    if (MaxY < v20)
    {
      v22 = 12;
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (clippingEdge != 1)
  {
LABEL_11:
    v22 = 0;
    goto LABEL_12;
  }
  v41.origin.x = v4;
  v35 = v20;
  v41.origin.y = v6;
  v41.size.width = v8;
  v41.size.height = v10;
  Height = CGRectGetHeight(v41);
  v42.origin.x = v12;
  v42.origin.y = v14;
  v42.size.width = v16;
  v42.size.height = v18;
  if (Height >= CGRectGetHeight(v42) + self->_cornerRadius)
    v22 = 0;
  else
    v22 = 3;
  -[WGPlatterHeaderContentView frame](self->_headerContentView, "frame");
  v26 = v25;
  v28 = v27;
  v19 = MaxY;
  if (MaxY < v35)
    goto LABEL_8;
  v29 = v23;
  v30 = v24;
  v43.origin.x = v4;
  v43.origin.y = v6;
  v43.size.width = v8;
  v43.size.height = v10;
  v31 = CGRectGetHeight(v43);
  v44.origin.x = v26;
  v44.origin.y = v28;
  v44.size.width = v29;
  v44.size.height = v30;
  v19 = CGRectGetHeight(v44) + self->_cornerRadius;
  if (v31 < v19)
LABEL_8:
    v22 |= 0xCuLL;
LABEL_12:
  -[WGWidgetPlatterView layer](self, "layer", v19);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setMaskedCorners:", v22);

  if (v22)
    cornerRadius = self->_cornerRadius;
  else
    cornerRadius = 0.0;
  v37.receiver = self;
  v37.super_class = (Class)WGWidgetPlatterView;
  -[WGWidgetPlatterView _setContinuousCornerRadius:](&v37, sel__setContinuousCornerRadius_, cornerRadius);
}

- (void)willRemoveSubview:(id)a3
{
  UIView *v4;
  WGWidgetHostingViewController **p_widgetHost;
  id WeakRetained;
  UIView *v7;
  objc_super v8;

  v4 = (UIView *)a3;
  v8.receiver = self;
  v8.super_class = (Class)WGWidgetPlatterView;
  -[WGWidgetPlatterView willRemoveSubview:](&v8, sel_willRemoveSubview_, v4);
  if (self->_contentView == v4)
  {
    self->_contentView = 0;

  }
  p_widgetHost = &self->_widgetHost;
  WeakRetained = objc_loadWeakRetained((id *)&self->_widgetHost);
  if (objc_msgSend(WeakRetained, "isViewLoaded"))
  {
    objc_msgSend(WeakRetained, "view");
    v7 = (UIView *)objc_claimAutoreleasedReturnValue();

    if (v7 == v4)
      objc_storeWeak((id *)p_widgetHost, 0);
  }

}

- (double)_continuousCornerRadius
{
  return self->_cornerRadius;
}

- (void)_setContinuousCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    -[MTMaterialView _setContinuousCornerRadius:](self->_backgroundView, "_setContinuousCornerRadius:");
    -[UIView _setContinuousCornerRadius:](self->_contentView, "_setContinuousCornerRadius:", self->_cornerRadius);
    -[WGWidgetPlatterView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)_updateShowMoreButtonImage
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[WGWidgetPlatterView showMoreButton](self, "showMoreButton");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A78], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BDF77C0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A78], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BDF77C8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pointSize");
  v5 = v4;
  objc_msgSend(v3, "pointSize");
  objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithPointSize:weight:", 6, (v5 + v6) * 0.5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("chevron.forward"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageWithSymbolConfiguration:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setImage:forState:", v9, 0);
  objc_msgSend(v10, "setImageEdgeInsets:", -0.5, 0.0, 0.5, 0.0);
  objc_msgSend(v10, "_setTouchInsets:", -20.0, -20.0, -20.0, -20.0);

}

- (CGSize)sizeThatFitsContentWithSize:(CGSize)a3
{
  double height;
  double width;
  WGPlatterHeaderContentView *headerContentView;
  double v7;
  double v8;
  double v9;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[WGWidgetPlatterView _configureHeaderViewsIfNecessary](self, "_configureHeaderViewsIfNecessary");
  headerContentView = self->_headerContentView;
  if (headerContentView)
  {
    -[PLPlatterHeaderContentView sizeThatFits:](headerContentView, "sizeThatFits:", width, 0.0);
    height = height + v7;
  }
  v8 = width;
  v9 = height;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)contentSizeForSize:(CGSize)a3
{
  double height;
  CGFloat width;
  double v5;
  double v6;
  double v7;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[WGWidgetPlatterView sizeThatFitsContentWithSize:](self, "sizeThatFitsContentWithSize:", a3.width, 0.0);
  v6 = (double)((int)(height - v5) & ~((int)(height - v5) >> 31));
  v7 = width;
  result.height = v6;
  result.width = v7;
  return result;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategory = a3;
    -[WGWidgetPlatterView _configureHeaderViewsIfNecessary](self, "_configureHeaderViewsIfNecessary");
    -[PLPlatterHeaderContentView setAdjustsFontForContentSizeCategory:](self->_headerContentView, "setAdjustsFontForContentSizeCategory:", self->_adjustsFontForContentSizeCategory);
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  -[WGWidgetPlatterView _updateShowMoreButtonImage](self, "_updateShowMoreButtonImage");
  -[WGWidgetPlatterView _configureHeaderViewsIfNecessary](self, "_configureHeaderViewsIfNecessary");
  -[PLPlatterHeaderContentView adjustForContentSizeCategoryChange](self->_headerContentView, "adjustForContentSizeCategoryChange");
  -[WGWidgetPlatterView setNeedsLayout](self, "setNeedsLayout");
  return 1;
}

- (void)setMaterialGroupNameBase:(id)a3
{
  NSString **p_materialGroupNameBase;
  id v6;

  p_materialGroupNameBase = &self->_materialGroupNameBase;
  v6 = a3;
  if (!-[NSString isEqualToString:](*p_materialGroupNameBase, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_materialGroupNameBase, a3);
    -[MTMaterialView setGroupNameBase:](self->_backgroundView, "setGroupNameBase:", *p_materialGroupNameBase);
  }

}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  void *v3;
  objc_super v5;

  if (self->_backgroundView)
  {
    -[MTMaterialView visualStylingProviderForCategory:](self->_backgroundView, "visualStylingProviderForCategory:", a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)WGWidgetPlatterView;
    -[WGWidgetPlatterView visualStylingProviderForCategory:](&v5, sel_visualStylingProviderForCategory_, a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (NSArray)requiredVisualStyleCategories
{
  -[WGWidgetPlatterView _configureHeaderViewsIfNecessary](self, "_configureHeaderViewsIfNecessary");
  return -[PLPlatterHeaderContentView requiredVisualStyleCategories](self->_headerContentView, "requiredVisualStyleCategories");
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  id v6;

  v6 = a3;
  -[WGWidgetPlatterView _configureHeaderViewsIfNecessary](self, "_configureHeaderViewsIfNecessary");
  -[PLPlatterHeaderContentView setVisualStylingProvider:forCategory:](self->_headerContentView, "setVisualStylingProvider:forCategory:", v6, a4);

}

- (void)_setContentView:(id)a3
{
  UIView *v5;
  UIView **p_contentView;
  UIView *contentView;
  WGWidgetPlatterView *v8;
  void *v9;
  UIView *v10;
  UIView *v11;

  v5 = (UIView *)a3;
  p_contentView = &self->_contentView;
  contentView = self->_contentView;
  if (contentView != v5)
  {
    v11 = v5;
    -[UIView superview](contentView, "superview");
    v8 = (WGWidgetPlatterView *)objc_claimAutoreleasedReturnValue();

    if (v8 == self)
      -[UIView removeFromSuperview](*p_contentView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_contentView, a3);
    -[UIView bs_setHitTestingDisabled:](*p_contentView, "bs_setHitTestingDisabled:", self->_contentViewHitTestingDisabled);
    if (*p_contentView)
    {
      -[UIView setAutoresizingMask:](*p_contentView, "setAutoresizingMask:", 0);
      -[UIView layer](*p_contentView, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setMaskedCorners:", 12);

      -[UIView _setContinuousCornerRadius:](*p_contentView, "_setContinuousCornerRadius:", self->_cornerRadius);
      -[UIView setClipsToBounds:](*p_contentView, "setClipsToBounds:", 1);
      -[WGWidgetPlatterView _configureBackgroundMaterialViewIfNecessary](self, "_configureBackgroundMaterialViewIfNecessary");
      v10 = *p_contentView;
      if (self->_backgroundView)
        -[WGWidgetPlatterView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v10);
      else
        -[WGWidgetPlatterView insertSubview:atIndex:](self, "insertSubview:atIndex:", v10);
    }
    -[WGWidgetPlatterView setNeedsLayout](self, "setNeedsLayout");
    v5 = v11;
  }

}

- (void)_configureBackgroundMaterialViewIfNecessary
{
  MTMaterialView *backgroundView;
  MTMaterialView *v4;
  MTMaterialView *v5;
  MTMaterialView *v6;
  MTMaterialView *v7;
  MTMaterialView *v8;
  void *v9;
  uint64_t v10;

  backgroundView = self->_backgroundView;
  if (backgroundView)
  {
    if (self->_backgroundHidden)
    {
      -[MTMaterialView removeFromSuperview](backgroundView, "removeFromSuperview");
      v4 = self->_backgroundView;
      self->_backgroundView = 0;

    }
  }
  else if (!self->_backgroundHidden)
  {
    objc_msgSend(MEMORY[0x24BE64060], "materialViewWithRecipe:configuration:", 2, 1);
    v5 = (MTMaterialView *)objc_claimAutoreleasedReturnValue();
    v6 = self->_backgroundView;
    self->_backgroundView = v5;

    -[MTMaterialView setGroupNameBase:](self->_backgroundView, "setGroupNameBase:", self->_materialGroupNameBase);
    -[MTMaterialView _setContinuousCornerRadius:](self->_backgroundView, "_setContinuousCornerRadius:", self->_cornerRadius);
    v7 = self->_backgroundView;
    -[WGWidgetPlatterView bounds](self, "bounds");
    -[MTMaterialView setFrame:](v7, "setFrame:");
    -[MTMaterialView setAutoresizingMask:](self->_backgroundView, "setAutoresizingMask:", 18);
    v8 = self->_backgroundView;
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "userInterfaceIdiom");

    -[MTMaterialView setBlurEnabled:](v8, "setBlurEnabled:", (v10 & 0xFFFFFFFFFFFFFFFBLL) == 1);
    -[WGWidgetPlatterView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_backgroundView, 0);
  }
}

- (void)_updateHeaderContentViewVisualStyling
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  WGPlatterHeaderContentView *headerContentView;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (self->_headerContentView)
  {
    -[WGWidgetPlatterView _configureBackgroundMaterialViewIfNecessary](self, "_configureBackgroundMaterialViewIfNecessary");
    if (self->_backgroundView)
    {
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      -[PLPlatterHeaderContentView requiredVisualStyleCategories](self->_headerContentView, "requiredVisualStyleCategories", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
            v8 = objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "integerValue");
            headerContentView = self->_headerContentView;
            -[MTMaterialView visualStylingProviderForCategory:](self->_backgroundView, "visualStylingProviderForCategory:", v8);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLPlatterHeaderContentView setVisualStylingProvider:forCategory:](headerContentView, "setVisualStylingProvider:forCategory:", v10, v8);

            ++v7;
          }
          while (v5 != v7);
          v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        }
        while (v5);
      }

    }
  }
}

- (void)_configureHeaderViewsIfNecessary
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  WGPlatterHeaderContentView *v6;
  WGPlatterHeaderContentView *headerContentView;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerForKey:", CFSTR("WGAzulWidgetsType"));

  if (self->_headerContentView)
    v5 = 0;
  else
    v5 = v4 == 0;
  if (v5)
  {
    -[WGWidgetPlatterView _configureBackgroundMaterialViewIfNecessary](self, "_configureBackgroundMaterialViewIfNecessary");
    v6 = objc_alloc_init(WGPlatterHeaderContentView);
    headerContentView = self->_headerContentView;
    self->_headerContentView = v6;

    -[PLPlatterHeaderContentView setAdjustsFontForContentSizeCategory:](self->_headerContentView, "setAdjustsFontForContentSizeCategory:", self->_adjustsFontForContentSizeCategory);
    -[PLPlatterHeaderContentView setHeedsHorizontalLayoutMargins:](self->_headerContentView, "setHeedsHorizontalLayoutMargins:", 1);
    -[WGPlatterHeaderContentView layer](self->_headerContentView, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMaskedCorners:", 3);

    -[WGPlatterHeaderContentView _setContinuousCornerRadius:](self->_headerContentView, "_setContinuousCornerRadius:", self->_cornerRadius);
    -[WGPlatterHeaderContentView setLayoutMargins:](self->_headerContentView, "setLayoutMargins:", 0.0, 11.5, 0.0, 11.5);
    -[WGWidgetPlatterView addSubview:](self, "addSubview:", self->_headerContentView);
    -[WGWidgetPlatterView _updateHeaderContentViewVisualStyling](self, "_updateHeaderContentViewVisualStyling");
  }
}

- (CGSize)_contentSize
{
  id WeakRetained;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_widgetHost);
  objc_msgSend(WeakRetained, "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "sizeForChildContentContainer:withParentContainerSize:", WeakRetained, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  else
    objc_msgSend(WeakRetained, "preferredContentSize");
  v7 = v5;
  v8 = v6;
  +[WGWidgetInfo maximumContentHeightForCompactDisplayMode](WGWidgetInfo, "maximumContentHeightForCompactDisplayMode");
  if (v8 < v9)
    v8 = v9;

  v10 = v7;
  v11 = v8;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGRect)_headerFrameForBounds:(CGRect)a3
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect v12;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[WGWidgetPlatterView _configureHeaderViewsIfNecessary](self, "_configureHeaderViewsIfNecessary");
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  if (CGRectIsEmpty(v12))
  {
    v8 = *MEMORY[0x24BDBF090];
    v9 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v10 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v11 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  else
  {
    -[PLPlatterHeaderContentView sizeThatFits:](self->_headerContentView, "sizeThatFits:", width, height);
    BSRectWithSize();
    _WGMainScreenScale();
    UIRectIntegralWithScale();
  }
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (void)setOverrideHeightForLayingOutContentView:(double)a3
{
  if (vabdd_f64(a3, self->_overrideHeightForLayingOutContentView) > 2.22044605e-16)
  {
    self->_overrideHeightForLayingOutContentView = a3;
    -[WGWidgetPlatterView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_layoutContentView
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double MaxY;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  if (self->_contentView)
  {
    -[WGWidgetPlatterView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[PLPlatterHeaderContentView sizeThatFits:](self->_headerContentView, "sizeThatFits:", v7, v9);
    if (self->_overrideHeightForLayingOutContentView <= 0.0)
      -[WGWidgetPlatterView _contentSize](self, "_contentSize");
    -[WGWidgetPlatterView bounds](self, "bounds");
    -[WGWidgetPlatterView _headerFrameForBounds:](self, "_headerFrameForBounds:");
    MaxY = CGRectGetMaxY(v19);
    v20.origin.x = v4;
    v20.origin.y = v6;
    v20.size.width = v8;
    v20.size.height = v10;
    if (CGRectIsEmpty(v20))
    {
      v12 = *MEMORY[0x24BDBF090];
      v13 = *(double *)(MEMORY[0x24BDBF090] + 16);
      v14 = *(double *)(MEMORY[0x24BDBF090] + 24);
    }
    else
    {
      v21.origin.x = v4;
      v21.origin.y = v6;
      v21.size.width = v8;
      v21.size.height = v10;
      CGRectGetWidth(v21);
      BSRectWithSize();
      v12 = v15;
      v13 = v16;
      v14 = v17;
    }
    if (self->_clippingEdge == 1)
    {
      -[WGWidgetPlatterView topMarginForLayout](self, "topMarginForLayout");
      MaxY = MaxY - v18;
    }
    -[UIView setFrame:](self->_contentView, "setFrame:", v12, MaxY, v13, v14);
  }
}

- (void)_layoutHeaderViews
{
  -[WGWidgetPlatterView bounds](self, "bounds");
  -[WGWidgetPlatterView _headerFrameForBounds:](self, "_headerFrameForBounds:");
  -[WGPlatterHeaderContentView setFrame:](self->_headerContentView, "setFrame:");
  -[WGPlatterHeaderContentView setNeedsLayout](self->_headerContentView, "setNeedsLayout");
}

- (void)_handleIconButton:(id)a3
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_widgetHost);
  objc_msgSend(WeakRetained, "widgetIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WGApplicationIdentifierForWidgetWithBundleIdentifier(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE38490], "serviceWithDefaultShellEndpoint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BE38478];
  v8 = *MEMORY[0x24BDE2778];
  v9 = *MEMORY[0x24BE38320];
  v15[0] = *MEMORY[0x24BE382E0];
  v15[1] = v9;
  v16[0] = v8;
  v16[1] = MEMORY[0x24BDBD1C8];
  v15[2] = *MEMORY[0x24BE38310];
  v16[2] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "optionsWithDictionary:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __41__WGWidgetPlatterView__handleIconButton___block_invoke;
  v13[3] = &unk_24D731C60;
  v14 = v5;
  v12 = v5;
  objc_msgSend(v6, "openApplication:withOptions:completion:", v12, v11, v13);

}

void __41__WGWidgetPlatterView__handleIconButton___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  v6 = a3;
  if (v6 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __41__WGWidgetPlatterView__handleIconButton___block_invoke_cold_1(a1, (uint64_t)v6);

}

- (void)_updateUtilityButtonForMode:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  id WeakRetained;

  if (a3 == 1)
  {
    -[WGWidgetPlatterView addWidgetButton](self, "addWidgetButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeTarget:action:forControlEvents:", self, sel__toggleShowMore_, 64);

    -[WGWidgetPlatterView addWidgetButton](self, "addWidgetButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel__handleAddWidget_, 64);

    -[WGWidgetPlatterView addWidgetButton](self, "addWidgetButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = _os_feature_enabled_impl();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
      v13 = CFSTR("ADD_WIDGET_TITLE_LEGACY");
    else
      v13 = CFSTR("ADD_WIDGET_TITLE");
    objc_msgSend(v11, "localizedStringForKey:value:table:", v13, &stru_24D733868, CFSTR("Widgets"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTitle:forState:", v14, 0);

    -[WGPlatterHeaderContentView setNeedsLayout](self->_headerContentView, "setNeedsLayout");
  }
  else if (!a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_widgetHost);
    if (objc_msgSend(WeakRetained, "isLinkedOnOrAfterSystemVersion:", CFSTR("10.0")))
    {
      -[WGWidgetPlatterView setShowingMoreContent:](self, "setShowingMoreContent:", objc_msgSend(WeakRetained, "userSpecifiedDisplayMode") == 1);
      -[WGWidgetPlatterView showMoreButton](self, "showMoreButton");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeTarget:action:forControlEvents:", self, sel__handleAddWidget_, 64);
      objc_msgSend(v4, "addTarget:action:forControlEvents:", self, sel__toggleShowMore_, 64);
      objc_msgSend(v4, "titleLabel");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[WGWidgetPlatterView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
        v6 = 0;
      else
        v6 = 2;
      objc_msgSend(v5, "setTextAlignment:", v6);

      -[WGWidgetPlatterView _updateShowMoreButtonImage](self, "_updateShowMoreButtonImage");
      -[WGWidgetPlatterView _updateUtilityButtonForMoreContentState:](self, "_updateUtilityButtonForMoreContentState:", self->_showingMoreContent);
      -[WGWidgetPlatterView setShowMoreButtonVisible:](self, "setShowMoreButtonVisible:", objc_msgSend(WeakRetained, "largestAvailableDisplayMode") == 1);

    }
    else
    {
      -[WGWidgetPlatterView setShowMoreButtonVisible:](self, "setShowMoreButtonVisible:", 0);
    }

  }
}

- (BOOL)_isUtilityButtonVisible
{
  void *v2;
  double v3;
  BOOL v4;

  -[PLPlatterHeaderContentView utilityButton](self->_headerContentView, "utilityButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alpha");
  v4 = v3 > 0.0;

  return v4;
}

- (void)_setUtilityButtonVisible:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  double v7;

  v3 = a3;
  if (-[WGWidgetPlatterView _isUtilityButtonVisible](self, "_isUtilityButtonVisible") != a3)
  {
    -[PLPlatterHeaderContentView utilityButton](self->_headerContentView, "utilityButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = 0.0;
    if (v3)
      v7 = 1.0;
    objc_msgSend(v5, "setAlpha:", v7);

    -[WGWidgetPlatterView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_toggleShowMore:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __39__WGWidgetPlatterView__toggleShowMore___block_invoke;
  v3[3] = &unk_24D7314D8;
  v3[4] = self;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 6, v3, 0, 0.3, 0.0);
}

uint64_t __39__WGWidgetPlatterView__toggleShowMore___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShowingMoreContent:", objc_msgSend(*(id *)(a1 + 32), "isShowingMoreContent") ^ 1);
}

- (void)_handleAddWidget:(id)a3
{
  uint64_t v4;
  WGCircleCheckView *v5;
  void *v6;
  WGCircleCheckView *v7;
  void *v8;
  WGCircleCheckView *v9;
  _QWORD v10[4];
  WGCircleCheckView *v11;
  _QWORD v12[5];
  WGCircleCheckView *v13;
  _QWORD v14[5];

  v4 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __40__WGWidgetPlatterView__handleAddWidget___block_invoke;
  v14[3] = &unk_24D7314D8;
  v14[4] = self;
  objc_msgSend(MEMORY[0x24BDF6F90], "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 0, v14, 0, 0.4, 0.0, 3.0, 1560.0, 600.0, 0.0);
  v5 = objc_alloc_init(WGCircleCheckView);
  v6 = (void *)MEMORY[0x24BDF6F90];
  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __40__WGWidgetPlatterView__handleAddWidget___block_invoke_2;
  v12[3] = &unk_24D731670;
  v12[4] = self;
  v7 = v5;
  v13 = v7;
  objc_msgSend(v6, "performWithoutAnimation:", v12);
  v8 = (void *)MEMORY[0x24BDF6F90];
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __40__WGWidgetPlatterView__handleAddWidget___block_invoke_3;
  v10[3] = &unk_24D7314D8;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "animateWithDuration:animations:", v10, 0.4);

}

uint64_t __40__WGWidgetPlatterView__handleAddWidget___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setUtilityButtonVisible:", 0);
}

uint64_t __40__WGWidgetPlatterView__handleAddWidget___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setUtilityView:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "layoutIfNeeded");
}

uint64_t __40__WGWidgetPlatterView__handleAddWidget___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setChecked:", 1);
}

- (void)_updateUtilityButtonForMoreContentState:(BOOL)a3
{
  _BOOL4 v3;
  int v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  double v9;
  double v10;
  double v11;
  WGPlatterHeaderContentView *headerContentView;
  CGAffineTransform v13;
  CGAffineTransform v14;
  CGAffineTransform v15;

  if (!self->_buttonMode)
  {
    v3 = a3;
    v5 = -[WGWidgetPlatterView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    v6 = *MEMORY[0x24BDBD8B8];
    v7 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)&v15.a = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)&v15.c = v7;
    v8 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    *(_OWORD *)&v15.tx = v8;
    if (v3)
    {
      v9 = -3.0;
      if (v5)
        v9 = 3.0;
      v10 = -0.5;
      if (v5)
        v10 = 0.5;
      *(_OWORD *)&v14.a = v6;
      *(_OWORD *)&v14.c = v7;
      *(_OWORD *)&v14.tx = v8;
      if (v5)
        v11 = -1.57079633;
      else
        v11 = 1.57079633;
      CGAffineTransformTranslate(&v15, &v14, v9, v10);
      v13 = v15;
      CGAffineTransformRotate(&v14, &v13, v11);
      v15 = v14;
    }
    headerContentView = self->_headerContentView;
    v14 = v15;
    -[WGPlatterHeaderContentView setUtilityButtonTransform:](headerContentView, "setUtilityButtonTransform:", &v14);
  }
}

- (void)iconDidInvalidate:(id)a3
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __41__WGWidgetPlatterView_iconDidInvalidate___block_invoke;
  v3[3] = &unk_24D7316E8;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __41__WGWidgetPlatterView_iconDidInvalidate___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  _QWORD v4[4];
  id v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "widgetHost");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __41__WGWidgetPlatterView_iconDidInvalidate___block_invoke_2;
  v4[3] = &unk_24D731C88;
  objc_copyWeak(&v5, v1);
  objc_msgSend(v3, "requestIconWithHandler:", v4);

  objc_destroyWeak(&v5);
}

void __41__WGWidgetPlatterView_iconDidInvalidate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __41__WGWidgetPlatterView_iconDidInvalidate___block_invoke_3;
  v5[3] = &unk_24D731620;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

  objc_destroyWeak(&v7);
}

void __41__WGWidgetPlatterView_iconDidInvalidate___block_invoke_3(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  void *v4;
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = (void *)WeakRetained[53];
  if (v3)
  {
    v5 = WeakRetained;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", *(_QWORD *)(a1 + 32), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setIcons:", v4);

    WeakRetained = v5;
  }

}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (NSString)materialGroupNameBase
{
  return self->_materialGroupNameBase;
}

- (WGWidgetHostingViewController)widgetHost
{
  return (WGWidgetHostingViewController *)objc_loadWeakRetained((id *)&self->_widgetHost);
}

- (WGWidgetListItemViewController)listItem
{
  return (WGWidgetListItemViewController *)objc_loadWeakRetained((id *)&self->_listItem);
}

- (void)setListItem:(id)a3
{
  objc_storeWeak((id *)&self->_listItem, a3);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (BOOL)isContentViewHitTestingDisabled
{
  return self->_contentViewHitTestingDisabled;
}

- (unint64_t)clippingEdge
{
  return self->_clippingEdge;
}

- (BOOL)isBackgroundHidden
{
  return self->_backgroundHidden;
}

- (double)overrideHeightForLayingOutContentView
{
  return self->_overrideHeightForLayingOutContentView;
}

- (double)topMarginForLayout
{
  return self->_topMarginForLayout;
}

- (int64_t)buttonMode
{
  return self->_buttonMode;
}

- (BOOL)isShowingMoreContent
{
  return self->_showingMoreContent;
}

- (BOOL)isEditingIcons
{
  return self->_editingIcons;
}

- (void)setEditingIcons:(BOOL)a3
{
  self->_editingIcons = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_destroyWeak((id *)&self->_listItem);
  objc_destroyWeak((id *)&self->_widgetHost);
  objc_storeStrong((id *)&self->_materialGroupNameBase, 0);
  objc_storeStrong((id *)&self->_headerContentView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

void __41__WGWidgetPlatterView__handleIconButton___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138412546;
  v4 = v2;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_2172E1000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to open application with bundle identifier '%@': %@", (uint8_t *)&v3, 0x16u);
}

@end
