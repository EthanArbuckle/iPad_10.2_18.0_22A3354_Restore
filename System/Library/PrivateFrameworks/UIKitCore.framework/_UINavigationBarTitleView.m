@implementation _UINavigationBarTitleView

- (double)_navigationBarContentHeight
{
  return self->_height;
}

- (void)_setDataSource:(id)a3 navigationItem:(id)a4 titleLocation:(int64_t)a5
{
  _UINavigationBarTitleViewDataSource **p_dataSource;
  id v9;

  p_dataSource = &self->_dataSource;
  v9 = a4;
  objc_storeWeak((id *)p_dataSource, a3);
  objc_storeWeak((id *)&self->_navigationItem, v9);

  self->_titleLocation = a5;
}

- (BOOL)_hideNavigationBarStandardTitle
{
  return self->_hideStandardTitle;
}

- (int64_t)_preferredAlignment
{
  return self->_preferredContentAlignment;
}

- (int64_t)preferredContentSizeForSize:(int64_t)a3
{
  return a3;
}

- (double)_navigationBarTrailingBarButtonsAlpha
{
  return self->_trailingBarAlpha;
}

- (double)_navigationBarLeadingBarButtonsAlpha
{
  return self->_leadingBarAlpha;
}

- (double)_navigationBarBackButtonAlpha
{
  return self->_backButtonAlpha;
}

- (BOOL)_hideNavigationBarTrailingBarButtons
{
  return self->_hideTrailingBarButtons;
}

- (BOOL)_hideNavigationBarLeadingBarButtons
{
  return self->_hideLeadingBarButtons;
}

- (double)_navigationBarBackButtonMaximumWidth
{
  return self->_backButtonMaximumWidth;
}

- (id)_traitCollectionOverridesForNavigationBarTraitCollection:(id)a3
{
  return 0;
}

- (BOOL)_hideNavigationBarBackButton
{
  return self->_hideBackButton;
}

- (NSArray)contentOverlayRects
{
  void *v2;
  void *v3;
  void *v4;
  NSArray *v5;

  -[_UINavigationBarTitleView overlays](self, "overlays");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "asArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

- (void)setHeight:(double)a3
{
  id WeakRetained;

  if (a3 < 0.0)
    a3 = 0.0;
  if (self->_height != a3)
  {
    self->_height = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "titleViewChangedHeight:", self);

  }
}

- (_UINavigationBarTitleView)initWithFrame:(CGRect)a3
{
  _UINavigationBarTitleView *v3;
  _UINavigationBarTitleView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UINavigationBarTitleView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[_UINavigationBarTitleView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v4->_trailingBarAlpha = 1.0;
    v4->_leadingBarAlpha = 1.0;
    v4->_backButtonAlpha = 1.0;
  }
  return v4;
}

- (void)setTranslatesAutoresizingMaskIntoConstraints:(BOOL)a3
{
  void *v5;
  objc_super v6;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UINavigationBarTitleView.m"), 175, CFSTR("_UINavigationBarTitleView does not support setting translatesAutoresizingMaskIntoConstraints=YES"));

  }
  v6.receiver = self;
  v6.super_class = (Class)_UINavigationBarTitleView;
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](&v6, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
}

- (double)trailingBarAlpha
{
  return self->_trailingBarAlpha;
}

- (void)setBackButtonMaximumWidth:(double)a3
{
  id WeakRetained;

  if (a3 < 0.0)
    a3 = 0.0;
  if (self->_backButtonMaximumWidth != a3)
  {
    self->_backButtonMaximumWidth = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "titleViewChangedMaximumBackButtonWidth:", self);

  }
}

- (void)setTrailingBarAlpha:(double)a3
{
  id WeakRetained;

  if (self->_trailingBarAlpha != a3)
  {
    self->_trailingBarAlpha = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "titleViewChangedDisplayItemAlpha:", self);

  }
}

- (void)setBackButtonAlpha:(double)a3
{
  id WeakRetained;

  if (self->_backButtonAlpha != a3)
  {
    self->_backButtonAlpha = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "titleViewChangedDisplayItemAlpha:", self);

  }
}

- (int64_t)leadingOverlayCount
{
  _BOOL8 v3;
  _BOOL8 v4;
  CGRect v6;
  CGRect v7;
  CGRect v8;

  -[_UINavigationBarTitleViewOverlayRects leadingStaticItemRect](self->_overlayRects, "leadingStaticItemRect");
  v3 = !CGRectIsNull(v6);
  -[_UINavigationBarTitleViewOverlayRects backButtonRect](self->_overlayRects, "backButtonRect");
  v4 = !CGRectIsNull(v7) + v3;
  -[_UINavigationBarTitleViewOverlayRects leadingItemsRect](self->_overlayRects, "leadingItemsRect");
  return v4 + !CGRectIsNull(v8);
}

- (_UINavigationBarTitleView)initWithCoder:(id)a3
{
  _UINavigationBarTitleView *v3;
  _UINavigationBarTitleView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UINavigationBarTitleView;
  v3 = -[UIView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
  {
    -[_UINavigationBarTitleView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v4->_trailingBarAlpha = 1.0;
    v4->_leadingBarAlpha = 1.0;
    v4->_backButtonAlpha = 1.0;
  }
  return v4;
}

- (void)setPreferredContentAlignment:(int64_t)a3
{
  id WeakRetained;

  if (self->_preferredContentAlignment != a3)
  {
    self->_preferredContentAlignment = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "titleViewChangedLayout:", self);

  }
}

- (UIMenu)backButtonMenu
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "titleViewBackButtonMenu:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIMenu *)v4;
}

- (double)_navigationBarContentHeightExtension
{
  return self->_heightExtension;
}

- (void)setHeightExtension:(double)a3
{
  id WeakRetained;

  if (a3 < 0.0)
    a3 = 0.0;
  if (self->_heightExtension != a3)
  {
    self->_heightExtension = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "titleViewChangedHeight:", self);

  }
}

- (void)setHideBackButton:(BOOL)a3
{
  id WeakRetained;

  if (self->_hideBackButton != a3)
  {
    self->_hideBackButton = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "titleViewChangedStandardDisplayItems:", self);

  }
}

- (void)setHideLeadingBarButtons:(BOOL)a3
{
  id WeakRetained;

  if (self->_hideLeadingBarButtons != a3)
  {
    self->_hideLeadingBarButtons = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "titleViewChangedStandardDisplayItems:", self);

  }
}

- (void)setHideStandardTitle:(BOOL)a3
{
  id WeakRetained;

  if (self->_hideStandardTitle != a3)
  {
    self->_hideStandardTitle = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "titleViewChangedStandardDisplayItems:", self);

  }
}

- (BOOL)_hideNavigationBarCenterBarButtons
{
  return self->_hideCenterBarButtons;
}

- (void)setHideCenterBarButtons:(BOOL)a3
{
  id WeakRetained;

  if (self->_hideCenterBarButtons != a3)
  {
    self->_hideCenterBarButtons = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "titleViewChangedStandardDisplayItems:", self);

  }
}

- (void)setHideTrailingBarButtons:(BOOL)a3
{
  id WeakRetained;

  if (self->_hideTrailingBarButtons != a3)
  {
    self->_hideTrailingBarButtons = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "titleViewChangedStandardDisplayItems:", self);

  }
}

- (void)setLeadingBarAlpha:(double)a3
{
  id WeakRetained;

  if (self->_leadingBarAlpha != a3)
  {
    self->_leadingBarAlpha = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "titleViewChangedDisplayItemAlpha:", self);

  }
}

- (_UINavigationBarTitleViewOverlayRects)overlays
{
  id WeakRetained;
  _UINavigationBarTitleViewOverlayRects *overlayRects;
  _UINavigationBarTitleViewOverlayRects *v5;
  _UINavigationBarTitleViewOverlayRects *v6;
  _UINavigationBarTitleViewOverlayRects *v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if (WeakRetained)
  {
    overlayRects = self->_overlayRects;
    if (!overlayRects)
    {
      v5 = objc_alloc_init(_UINavigationBarTitleViewOverlayRects);
      v6 = self->_overlayRects;
      self->_overlayRects = v5;

      overlayRects = self->_overlayRects;
    }
    objc_msgSend(WeakRetained, "titleView:needsUpdatedContentOverlayRects:", self, overlayRects);
    v7 = self->_overlayRects;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)trailingOverlayCount
{
  _BOOL8 v3;
  CGRect v5;
  CGRect v6;

  -[_UINavigationBarTitleViewOverlayRects trailingItemsRect](self->_overlayRects, "trailingItemsRect");
  v3 = !CGRectIsNull(v5);
  -[_UINavigationBarTitleViewOverlayRects trailingStaticItemRect](self->_overlayRects, "trailingStaticItemRect");
  return !CGRectIsNull(v6) + v3;
}

- (double)largeTitleHeight
{
  id WeakRetained;
  double v4;
  double v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "titleViewLargeTitleHeight:", self);
  v5 = v4;

  return v5;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)largeTitleHeightRange
{
  id WeakRetained;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "titleViewLargeTitleHeightRange:", self);
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

- (double)floatingTabBarHeight
{
  id WeakRetained;
  double v4;
  double v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "titleViewFloatingTabBarHeight:", self);
  v5 = v4;

  return v5;
}

- (void)setHeightShouldBeIncreasedByTabBarHeight:(BOOL)a3
{
  id WeakRetained;

  if (self->_heightShouldBeIncreasedByTabBarHeight != a3)
  {
    self->_heightShouldBeIncreasedByTabBarHeight = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "titleViewChangedTabBarSizingDisposition:", self);

  }
}

- (BOOL)_navigationBarHeightShouldBeIncreasedByTabBarHeight
{
  return self->_heightShouldBeIncreasedByTabBarHeight;
}

- (double)contentBaselineOffsetFromTop
{
  id WeakRetained;
  double v4;
  double v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "titleViewContentBaselineOffsetFromTop:", self);
  v5 = v4;

  return v5;
}

- (double)contentBaseHeight
{
  id WeakRetained;
  double v4;
  double v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "titleViewContentBaseHeight:", self);
  v5 = v4;

  return v5;
}

- (void)preferredContentSizeDidChange
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "titleViewChangedPreferredDisplaySize:", self);

}

- (BOOL)_wantsTwoPartTransition
{
  return 0;
}

- (void)transitionWillBegin:(int64_t)a3 willBeDisplayed:(BOOL)a4
{
  double v4;

  v4 = 1.0;
  if (a4)
    v4 = 0.0;
  -[UIView setAlpha:](self, "setAlpha:", a3, v4);
}

- (void)performTransition:(int64_t)a3 willBeDisplayed:(BOOL)a4
{
  double v4;

  v4 = 0.0;
  if (a4)
    v4 = 1.0;
  -[UIView setAlpha:](self, "setAlpha:", a3, v4);
}

- (void)transitionCompleted:(int64_t)a3 willBeDisplayed:(BOOL)a4
{
  -[UIView setAlpha:](self, "setAlpha:", a3, a4, 1.0);
}

- (NSString)description
{
  void *v3;
  void *v4;
  id WeakRetained;
  id v6;
  int64_t titleLocation;
  const __CFString *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UINavigationBarTitleView;
  -[UIView description](&v10, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationItem);
  v6 = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(v4, "appendFormat:", CFSTR(" navigationItem=%p dataSource=%p"), WeakRetained, v6);

  objc_msgSend(v4, "appendString:", CFSTR(" titleLocation="));
  titleLocation = self->_titleLocation;
  switch(titleLocation)
  {
    case 0:
      v8 = CFSTR("offscreen");
      goto LABEL_7;
    case 2:
      v8 = CFSTR("large");
      goto LABEL_7;
    case 1:
      v8 = CFSTR("inline");
LABEL_7:
      objc_msgSend(v4, "appendString:", v8);
      goto LABEL_9;
  }
  objc_msgSend(v4, "appendFormat:", CFSTR("unknown(%li)"), self->_titleLocation);
LABEL_9:
  if (self->_height > 0.0)
    objc_msgSend(v4, "appendFormat:", CFSTR(" height=%f"), *(_QWORD *)&self->_height);
  if (self->_heightExtension > 0.0)
    objc_msgSend(v4, "appendFormat:", CFSTR(" heightExtension=%f"), *(_QWORD *)&self->_heightExtension);
  if (self->_backButtonMaximumWidth > 0.0)
    objc_msgSend(v4, "appendFormat:", CFSTR(" backButtonMaximumWidth=%f"), *(_QWORD *)&self->_backButtonMaximumWidth);
  if (self->_hideBackButton)
    objc_msgSend(v4, "appendString:", CFSTR(" hidesBackButton"));
  if (self->_hideLeadingBarButtons)
    objc_msgSend(v4, "appendString:", CFSTR(" hideLeadingBarButtons"));
  if (self->_hideStandardTitle)
    objc_msgSend(v4, "appendString:", CFSTR(" hideStandardTitle"));
  if (self->_hideCenterBarButtons)
    objc_msgSend(v4, "appendString:", CFSTR(" hideCenterBarButtons"));
  if (self->_hideTrailingBarButtons)
    objc_msgSend(v4, "appendString:", CFSTR(" hideTrailingBarButtons"));
  return (NSString *)v4;
}

- (UINavigationItem)navigationItem
{
  return (UINavigationItem *)objc_loadWeakRetained((id *)&self->_navigationItem);
}

- (int64_t)titleLocation
{
  return self->_titleLocation;
}

- (BOOL)underlayBarContent
{
  return self->_underlayBarContent;
}

- (double)height
{
  return self->_height;
}

- (double)heightExtension
{
  return self->_heightExtension;
}

- (double)backButtonMaximumWidth
{
  return self->_backButtonMaximumWidth;
}

- (BOOL)hideBackButton
{
  return self->_hideBackButton;
}

- (BOOL)hideLeadingBarButtons
{
  return self->_hideLeadingBarButtons;
}

- (BOOL)hideStandardTitle
{
  return self->_hideStandardTitle;
}

- (BOOL)hideCenterBarButtons
{
  return self->_hideCenterBarButtons;
}

- (BOOL)hideTrailingBarButtons
{
  return self->_hideTrailingBarButtons;
}

- (double)backButtonAlpha
{
  return self->_backButtonAlpha;
}

- (double)leadingBarAlpha
{
  return self->_leadingBarAlpha;
}

- (BOOL)heightShouldBeIncreasedByTabBarHeight
{
  return self->_heightShouldBeIncreasedByTabBarHeight;
}

- (int64_t)preferredContentAlignment
{
  return self->_preferredContentAlignment;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_navigationItem);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_overlayRects, 0);
}

@end
