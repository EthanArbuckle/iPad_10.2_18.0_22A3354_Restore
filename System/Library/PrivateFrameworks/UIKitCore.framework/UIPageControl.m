@implementation UIPageControl

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIPageControl;
  -[UIView layoutSubviews](&v3, sel_layoutSubviews);
  -[_UIPageControlVisualProvider layoutSubviews](self->_visualProvider, "layoutSubviews");
}

- (NSInteger)numberOfPages
{
  return self->_numberOfPages;
}

- (BOOL)_contentHuggingDefault_isUsuallyFixedWidth
{
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0 || (unint64_t)(self->_direction - 3) < 2;
}

- (BOOL)_contentHuggingDefault_isUsuallyFixedHeight
{
  return (unint64_t)(self->_direction - 5) < 0xFFFFFFFFFFFFFFFELL;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[_UIPageControlVisualProvider sizeThatFits:](self->_visualProvider, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (UIColor)pageIndicatorTintColor
{
  return self->_pageIndicatorTintColor;
}

- (UIColor)currentPageIndicatorTintColor
{
  return self->_currentPageIndicatorTintColor;
}

- (UIPageControlBackgroundStyle)backgroundStyle
{
  return self->_backgroundStyle;
}

- (UIPageControlProgress)progress
{
  return self->_progress;
}

- (double)_customHorizontalPadding
{
  return self->_horizontalPadding;
}

- (BOOL)allowsContinuousInteraction
{
  return (*(_BYTE *)&self->_pageControlFlags & 4) != 0
      && -[_UIPageControlVisualProvider supportsContinuousInteraction](self->_visualProvider, "supportsContinuousInteraction");
}

- (double)_customVerticalPadding
{
  return self->_verticalPadding;
}

- (CGRect)_indicatorFrameForPage:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[_UIPageControlVisualProvider indicatorFrameForPage:](self->_visualProvider, "indicatorFrameForPage:", a3);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)setCurrentPage:(NSInteger)currentPage
{
  -[UIPageControl _updateCurrentPage:updateDisplayImmediately:](self, "_updateCurrentPage:updateDisplayImmediately:", currentPage, 1);
}

- (BOOL)_allowsDiscreteInteraction
{
  return (*(_BYTE *)&self->_pageControlFlags >> 3) & 1;
}

- (void)setNumberOfPages:(NSInteger)numberOfPages
{
  NSInteger v3;
  NSInteger v5;

  v3 = numberOfPages & ~(numberOfPages >> 63);
  if (self->_numberOfPages == v3)
    return;
  self->_numberOfPages = v3;
  -[_UIPageControlVisualProvider didUpdateNumberOfPages](self->_visualProvider, "didUpdateNumberOfPages");
  if (-[UIPageControl currentPage](self, "currentPage") >= v3)
  {
    v5 = v3 - 1;
    goto LABEL_6;
  }
  if (-[UIPageControl currentPage](self, "currentPage") < 0)
  {
    v5 = 0;
LABEL_6:
    -[UIPageControl _updateCurrentPage:updateDisplayImmediately:](self, "_updateCurrentPage:updateDisplayImmediately:", v5, 0);
  }
  -[UIPageControl _updateCurrentPageDisplayWithForceUpdate:](self, "_updateCurrentPageDisplayWithForceUpdate:", 1);
  if (-[UIPageControl hidesForSinglePage](self, "hidesForSinglePage"))
    -[UIView setHidden:](self, "setHidden:", (unint64_t)v3 < 2);
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (NSInteger)currentPage
{
  return self->_currentPage;
}

- (void)_updateCurrentPageDisplayWithForceUpdate:(BOOL)a3
{
  if (a3 || -[UIPageControl defersCurrentPageDisplay](self, "defersCurrentPageDisplay"))
    -[_UIPageControlVisualProvider updateDisplayedPageToCurrentPage](self->_visualProvider, "updateDisplayedPageToCurrentPage");
}

- (void)_setAllowsDiscreteInteraction:(BOOL)a3
{
  char pageControlFlags;
  char v4;

  pageControlFlags = (char)self->_pageControlFlags;
  if (((((pageControlFlags & 8) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 8;
    else
      v4 = 0;
    *(_BYTE *)&self->_pageControlFlags = pageControlFlags & 0xF7 | v4;
    -[_UIPageControlVisualProvider didUpdateInteractionTypeAvailability](self->_visualProvider, "didUpdateInteractionTypeAvailability");
  }
}

- (void)setAllowsContinuousInteraction:(BOOL)allowsContinuousInteraction
{
  char pageControlFlags;
  char v4;

  pageControlFlags = (char)self->_pageControlFlags;
  if (((((pageControlFlags & 4) == 0) ^ allowsContinuousInteraction) & 1) == 0)
  {
    if (allowsContinuousInteraction)
      v4 = 4;
    else
      v4 = 0;
    *(_BYTE *)&self->_pageControlFlags = pageControlFlags & 0xFB | v4;
    -[_UIPageControlVisualProvider didUpdateInteractionTypeAvailability](self->_visualProvider, "didUpdateInteractionTypeAvailability");
  }
}

- (BOOL)hidesForSinglePage
{
  return *(_BYTE *)&self->_pageControlFlags & 1;
}

- (void)_setFlickToEndGestureEnabled:(BOOL)a3
{
  char pageControlFlags;
  char v4;

  pageControlFlags = (char)self->_pageControlFlags;
  if (((((pageControlFlags & 0x10) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 16;
    else
      v4 = 0;
    *(_BYTE *)&self->_pageControlFlags = pageControlFlags & 0xEF | v4;
  }
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[_UIPageControlVisualProvider intrinsicContentSize](self->_visualProvider, "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_setCustomVerticalPadding:(double)a3
{
  self->_verticalPadding = a3;
  *(_BYTE *)&self->_custom |= 1u;
  -[_UIPageControlVisualProvider didUpdateCustomLayoutValues](self->_visualProvider, "didUpdateCustomLayoutValues");
}

- (void)_setCustomHorizontalPadding:(double)a3
{
  self->_horizontalPadding = a3;
  *(_BYTE *)&self->_custom |= 2u;
  -[_UIPageControlVisualProvider didUpdateCustomLayoutValues](self->_visualProvider, "didUpdateCustomLayoutValues");
}

- (CGSize)sizeForNumberOfPages:(NSInteger)pageCount
{
  double v5;
  double v6;
  CGSize result;

  if (pageCount < 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("-[UIPageControl sizeForNumberOfPages:] must not be called with a negative number"));
  -[_UIPageControlVisualProvider sizeForNumberOfPages:](self->_visualProvider, "sizeForNumberOfPages:", pageCount);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)_setCustomIndicatorSpacing:(double)a3
{
  self->_indicatorSpacing = a3;
  *(_BYTE *)&self->_custom |= 4u;
  -[_UIPageControlVisualProvider didUpdateCustomLayoutValues](self->_visualProvider, "didUpdateCustomLayoutValues");
}

- (void)_updateCurrentPage:(int64_t)a3 updateDisplayImmediately:(BOOL)a4
{
  int64_t v5;
  int64_t currentPage;
  _BOOL4 v7;
  void *v8;

  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = (uint64_t)fmax(fmin((double)a3, (double)(self->_numberOfPages - 1)), 0.0);
    currentPage = self->_currentPage;
    if (currentPage != v5)
    {
      v7 = a4;
      self->_previousPage = currentPage;
      self->_currentPage = v5;
      -[UIPageControl progress](self, "progress");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_didChangeCurrentPage");

      if (v7)
        -[UIPageControl _updateCurrentPageDisplayWithForceUpdate:](self, "_updateCurrentPageDisplayWithForceUpdate:", 1);
    }
  }
}

- (UIPageControl)initWithFrame:(CGRect)a3
{
  UIPageControl *v3;
  UIPageControl *v4;
  uint64_t v5;
  _UIPageControlVisualProvider *visualProvider;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIPageControl;
  v3 = -[UIControl initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_currentPage = 0;
    -[UIView setAutoresizingMask:](v3, "setAutoresizingMask:", 2);
    objc_msgSend((id)objc_opt_class(), "_visualProviderForPageControl:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    visualProvider = v4->_visualProvider;
    v4->_visualProvider = (_UIPageControlVisualProvider *)v5;

    -[_UIPageControlVisualProvider prepare](v4->_visualProvider, "prepare");
  }
  return v4;
}

+ (id)_visualProviderForPageControl:(id)a3
{
  id v3;
  int v4;
  __objc2_class **v5;
  void *v6;

  v3 = a3;
  v4 = dyld_program_sdk_at_least();
  v5 = off_1E167C7B0;
  if (!v4)
    v5 = off_1E167C8B8;
  v6 = (void *)objc_msgSend(objc_alloc(*v5), "initWithPageControl:", v3);

  return v6;
}

- (void)setPageIndicatorTintColor:(UIColor *)pageIndicatorTintColor
{
  UIColor *v5;
  UIColor *v6;

  v6 = pageIndicatorTintColor;
  -[UIPageControl pageIndicatorTintColor](self, "pageIndicatorTintColor");
  v5 = (UIColor *)objc_claimAutoreleasedReturnValue();

  if (v5 != v6)
  {
    objc_storeStrong((id *)&self->_pageIndicatorTintColor, pageIndicatorTintColor);
    -[_UIPageControlVisualProvider didUpdatePageIndicatorTintColor](self->_visualProvider, "didUpdatePageIndicatorTintColor");
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setCurrentPageIndicatorTintColor:(UIColor *)currentPageIndicatorTintColor
{
  UIColor *v5;
  UIColor *v6;

  v5 = currentPageIndicatorTintColor;
  if (self->_currentPageIndicatorTintColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_currentPageIndicatorTintColor, currentPageIndicatorTintColor);
    -[_UIPageControlVisualProvider didUpdateCurrentPageIndicatorTintColor](self->_visualProvider, "didUpdateCurrentPageIndicatorTintColor");
    -[UIView setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIPageControl;
  -[UIView setSemanticContentAttribute:](&v4, sel_setSemanticContentAttribute_, a3);
  -[_UIPageControlVisualProvider didUpdateLayoutDirection](self->_visualProvider, "didUpdateLayoutDirection");
}

- (void)setIndicatorImage:(UIImage *)image forPage:(NSInteger)page
{
  void *v7;
  UIImage *v8;

  v8 = image;
  if (page < 0 || -[UIPageControl numberOfPages](self, "numberOfPages") <= page)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPageControl.m"), 344, CFSTR("Page (%ld) must be within 0 and %ld."), page, -[UIPageControl numberOfPages](self, "numberOfPages"));

  }
  -[_UIPageControlVisualProvider setCustomIndicatorImage:forPage:](self->_visualProvider, "setCustomIndicatorImage:forPage:", v8, page);

}

- (void)_traitCollectionDidChangeOnSubtreeInternal:(const _UITraitCollectionChangeDescription *)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIPageControl;
  -[UIView _traitCollectionDidChangeInternal:](&v5, sel__traitCollectionDidChangeInternal_);
  -[_UIPageControlVisualProvider traitCollectionDidChangeOnSubtree:](self->_visualProvider, "traitCollectionDidChangeOnSubtree:", a3->var0);
}

- (UIPageControlDirection)direction
{
  return self->_direction;
}

- (void)_setPreferredNumberOfVisibleIndicators:(unint64_t)a3
{
  self->_preferredNumberOfVisibleIndicators = a3;
  -[_UIPageControlVisualProvider didUpdateCustomLayoutValues](self->_visualProvider, "didUpdateCustomLayoutValues");
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIPageControl;
  -[UIView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[UIPageControlProgress _pageControlDidMoveToWindow](self->_progress, "_pageControlDidMoveToWindow");
}

- (UIVisualEffect)_platterEffect
{
  return self->__platterEffect;
}

- (void)setHidesForSinglePage:(BOOL)hidesForSinglePage
{
  char pageControlFlags;
  _BOOL8 v4;

  pageControlFlags = (char)self->_pageControlFlags;
  if (((((pageControlFlags & 1) == 0) ^ hidesForSinglePage) & 1) == 0)
  {
    v4 = hidesForSinglePage;
    *(_BYTE *)&self->_pageControlFlags = pageControlFlags & 0xFE | hidesForSinglePage;
    if (-[UIPageControl numberOfPages](self, "numberOfPages") <= 1)
      -[UIView setHidden:](self, "setHidden:", v4);
  }
}

- (void)_setIndicatorOpacity:(double)a3
{
  -[_UIPageControlVisualProvider setIndicatorOpacity:](self->_visualProvider, "setIndicatorOpacity:", a3);
}

- (void)setProgress:(UIPageControlProgress *)progress
{
  UIPageControlProgress *v5;
  UIPageControl *v6;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  uint8_t v10[16];

  v5 = progress;
  if ((dyld_program_sdk_at_least() & 1) != 0)
  {
    -[UIPageControlProgress pageControl](v5, "pageControl");
    v6 = (UIPageControl *)objc_claimAutoreleasedReturnValue();

    if (v6 != self)
    {
      -[UIPageControlProgress pageControl](v5, "pageControl");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setProgress:", 0);

    }
    -[UIPageControlProgress setPageControl:](self->_progress, "setPageControl:", 0);
    -[UIPageControlProgress setPageControl:](v5, "setPageControl:", self);
    objc_storeStrong((id *)&self->_progress, progress);
    -[_UIPageControlVisualProvider didUpdatePageProgress](self->_visualProvider, "didUpdatePageProgress");
  }
  else
  {
    v8 = setProgress____s_category;
    if (!setProgress____s_category)
    {
      v8 = __UILogCategoryGetNode("PageControl", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v8, (unint64_t *)&setProgress____s_category);
    }
    v9 = *(NSObject **)(v8 + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "-[UIPageControl setProgress:] called with an invalid object. THIS IS A CLIENT BUG.", v10, 2u);
    }
  }

}

- (void)dealloc
{
  objc_super v3;

  -[_UIPageControlVisualProvider teardownPageControl](self->_visualProvider, "teardownPageControl");
  v3.receiver = self;
  v3.super_class = (Class)UIPageControl;
  -[UIView dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__platterEffect, 0);
  objc_storeStrong((id *)&self->_currentPageIndicatorTintColor, 0);
  objc_storeStrong((id *)&self->_pageIndicatorTintColor, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_visualProvider, 0);
}

- (BOOL)isElementAccessibilityExposedToInterfaceBuilder
{
  return 0;
}

+ (BOOL)doesOverrideMethod:(SEL)a3 inBaseClass:(Class)a4
{
  IMP MethodImplementation;

  MethodImplementation = class_getMethodImplementation((Class)a1, a3);
  return MethodImplementation != class_getMethodImplementation(a4, a3);
}

- (BOOL)_implementsCustomPageImagesOverride
{
  void *v2;

  v2 = (void *)objc_opt_class();
  return objc_msgSend(v2, "doesOverrideMethod:inBaseClass:", sel__pageIndicatorImageForPage_, objc_opt_class());
}

- (BOOL)_implementsCustomCurrentPageImagesOverride
{
  void *v2;

  v2 = (void *)objc_opt_class();
  return objc_msgSend(v2, "doesOverrideMethod:inBaseClass:", sel__pageIndicatorCurrentImageForPage_, objc_opt_class());
}

- (UIPageControl)initWithCoder:(id)a3
{
  id v4;
  UIPageControl *v5;
  UIPageControl *v6;
  uint64_t v7;
  _UIPageControlVisualProvider *visualProvider;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UIPageControl;
  v5 = -[UIControl initWithCoder:](&v12, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    v5->_currentPage = 0;
    objc_msgSend((id)objc_opt_class(), "_visualProviderForPageControl:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
    visualProvider = v6->_visualProvider;
    v6->_visualProvider = (_UIPageControlVisualProvider *)v7;

    -[_UIPageControlVisualProvider prepare](v6->_visualProvider, "prepare");
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UINumberOfPages")))
      -[UIPageControl setNumberOfPages:](v6, "setNumberOfPages:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UINumberOfPages")));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UICurrentPage")))
      -[UIPageControl setCurrentPage:](v6, "setCurrentPage:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UICurrentPage")));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIHideForSinglePage")))
      -[UIPageControl setHidesForSinglePage:](v6, "setHidesForSinglePage:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIHideForSinglePage")));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIDefersCurrentPageDisplay")))
      -[UIPageControl setDefersCurrentPageDisplay:](v6, "setDefersCurrentPageDisplay:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIDefersCurrentPageDisplay")));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UICurrentPageIndicatorTintColor")))
    {
      objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UICurrentPageIndicatorTintColor"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPageControl setCurrentPageIndicatorTintColor:](v6, "setCurrentPageIndicatorTintColor:", v9);

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIPageIndicatorTintColor")))
    {
      objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIPageIndicatorTintColor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPageControl setPageIndicatorTintColor:](v6, "setPageIndicatorTintColor:", v10);

    }
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIPageControl;
  -[UIControl encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  if (-[UIPageControl numberOfPages](self, "numberOfPages"))
    objc_msgSend(v4, "encodeInteger:forKey:", -[UIPageControl numberOfPages](self, "numberOfPages"), CFSTR("UINumberOfPages"));
  if ((-[UIPageControl currentPage](self, "currentPage") & 0x8000000000000000) == 0)
    objc_msgSend(v4, "encodeInteger:forKey:", -[UIPageControl currentPage](self, "currentPage"), CFSTR("UICurrentPage"));
  if (-[UIPageControl hidesForSinglePage](self, "hidesForSinglePage"))
    objc_msgSend(v4, "encodeBool:forKey:", -[UIPageControl hidesForSinglePage](self, "hidesForSinglePage"), CFSTR("UIHideForSinglePage"));
  -[UIPageControl currentPageIndicatorTintColor](self, "currentPageIndicatorTintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UIPageControl currentPageIndicatorTintColor](self, "currentPageIndicatorTintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("UICurrentPageIndicatorTintColor"));

  }
  -[UIPageControl pageIndicatorTintColor](self, "pageIndicatorTintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[UIPageControl pageIndicatorTintColor](self, "pageIndicatorTintColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("UIPageIndicatorTintColor"));

  }
}

- (void)_populateArchivedSubviews:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIPageControl;
  v4 = a3;
  -[UIView _populateArchivedSubviews:](&v5, sel__populateArchivedSubviews_, v4);
  -[_UIPageControlVisualProvider pruneArchivedSubviews:](self->_visualProvider, "pruneArchivedSubviews:", v4, v5.receiver, v5.super_class);

}

- (BOOL)shouldTrack
{
  objc_super v4;

  if (-[_UIPageControlVisualProvider shouldDisableTouchTracking](self->_visualProvider, "shouldDisableTouchTracking"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)UIPageControl;
  return -[UIControl shouldTrack](&v4, sel_shouldTrack);
}

- (void)_setCurrentPage:(int64_t)a3
{
  -[UIPageControl _updateCurrentPage:updateDisplayImmediately:](self, "_updateCurrentPage:updateDisplayImmediately:", a3, 0);
}

- (void)_setPage:(int64_t)a3 interactionState:(int64_t)a4
{
  -[_UIPageControlVisualProvider setPage:interactionState:](self->_visualProvider, "setPage:interactionState:", a3, a4);
}

- (int64_t)_displayedPage
{
  return -[_UIPageControlVisualProvider displayedPage](self->_visualProvider, "displayedPage");
}

- (BOOL)defersCurrentPageDisplay
{
  return (*(_BYTE *)&self->_pageControlFlags >> 1) & 1;
}

- (void)setDefersCurrentPageDisplay:(BOOL)defersCurrentPageDisplay
{
  char v3;

  if (defersCurrentPageDisplay)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_pageControlFlags = *(_BYTE *)&self->_pageControlFlags & 0xFD | v3;
}

- (void)updateCurrentPageDisplay
{
  -[UIPageControl _updateCurrentPageDisplayWithForceUpdate:](self, "_updateCurrentPageDisplayWithForceUpdate:", 0);
}

- (void)setBackgroundStyle:(UIPageControlBackgroundStyle)backgroundStyle
{
  if (self->_backgroundStyle != backgroundStyle)
  {
    self->_backgroundStyle = backgroundStyle;
    -[_UIPageControlVisualProvider didUpdateBackgroundStyle](self->_visualProvider, "didUpdateBackgroundStyle");
  }
}

- (void)setDirection:(UIPageControlDirection)direction
{
  if (self->_direction != direction)
  {
    self->_direction = direction;
    -[_UIPageControlVisualProvider didUpdateLayoutDirection](self->_visualProvider, "didUpdateLayoutDirection");
  }
}

- (UIPageControlInteractionState)interactionState
{
  return -[_UIPageControlVisualProvider interactionState](self->_visualProvider, "interactionState");
}

- (UIImage)preferredIndicatorImage
{
  return -[_UIPageControlVisualProvider preferredIndicatorImage](self->_visualProvider, "preferredIndicatorImage");
}

- (void)setPreferredIndicatorImage:(UIImage *)preferredIndicatorImage
{
  -[_UIPageControlVisualProvider setPreferredIndicatorImage:](self->_visualProvider, "setPreferredIndicatorImage:", preferredIndicatorImage);
}

- (UIImage)indicatorImageForPage:(NSInteger)page
{
  void *v7;

  if (page < 0 || -[UIPageControl numberOfPages](self, "numberOfPages") <= page)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPageControl.m"), 338, CFSTR("Page (%ld) must be within 0 and %ld."), page, -[UIPageControl numberOfPages](self, "numberOfPages"));

  }
  return (UIImage *)-[_UIPageControlVisualProvider customIndicatorImageForPage:](self->_visualProvider, "customIndicatorImageForPage:", page);
}

- (UIImage)preferredCurrentPageIndicatorImage
{
  return -[_UIPageControlVisualProvider preferredActiveIndicatorImage](self->_visualProvider, "preferredActiveIndicatorImage");
}

- (void)setPreferredCurrentPageIndicatorImage:(UIImage *)preferredCurrentPageIndicatorImage
{
  -[_UIPageControlVisualProvider setPreferredActiveIndicatorImage:](self->_visualProvider, "setPreferredActiveIndicatorImage:", preferredCurrentPageIndicatorImage);
}

- (UIImage)currentPageIndicatorImageForPage:(NSInteger)page
{
  void *v7;

  if (page < 0 || -[UIPageControl numberOfPages](self, "numberOfPages") <= page)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPageControl.m"), 362, CFSTR("Page (%ld) must be within 0 and %ld."), page, -[UIPageControl numberOfPages](self, "numberOfPages"));

  }
  return (UIImage *)-[_UIPageControlVisualProvider customActiveIndicatorImageForPage:](self->_visualProvider, "customActiveIndicatorImageForPage:", page);
}

- (void)setCurrentPageIndicatorImage:(UIImage *)image forPage:(NSInteger)page
{
  void *v7;
  UIImage *v8;

  v8 = image;
  if (page < 0 || -[UIPageControl numberOfPages](self, "numberOfPages") <= page)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPageControl.m"), 368, CFSTR("Page (%ld) must be within 0 and %ld."), page, -[UIPageControl numberOfPages](self, "numberOfPages"));

  }
  -[_UIPageControlVisualProvider setCustomActiveIndicatorImage:forPage:](self->_visualProvider, "setCustomActiveIndicatorImage:forPage:", v8, page);

}

- (void)_updateCurrentPageProgress
{
  -[_UIPageControlVisualProvider didUpdateCurrentPageProgress](self->_visualProvider, "didUpdateCurrentPageProgress");
}

- (BOOL)_flickToEndGestureEnabled
{
  return (*(_BYTE *)&self->_pageControlFlags >> 4) & 1;
}

- (double)_customIndicatorSpacing
{
  return self->_indicatorSpacing;
}

- (void)_setVertical:(BOOL)a3
{
  -[UIPageControl setDirection:](self, "setDirection:", 3);
}

- (BOOL)_isVertical
{
  return self->_direction == 3;
}

- (double)_indicatorOpacity
{
  double result;

  -[_UIPageControlVisualProvider indicatorOpacity](self->_visualProvider, "indicatorOpacity");
  return result;
}

- (void)_setPlatterBackgroundView:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((_UIApplicationProcessIsSpringBoard() & 1) == 0
    && (_UIApplicationProcessIsControlCenterHostApp() & 1) == 0
    && (_UIApplicationProcessIsUIKitester() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPageControl.m"), 548, CFSTR("This may only be used by SpringBoard."));

  }
  *(_BYTE *)&self->_custom = *(_BYTE *)&self->_custom & 0xF7 | (8 * (v6 != 0));
  -[_UIPageControlVisualProvider setBackgroundView:](self->_visualProvider, "setBackgroundView:", v6);

}

- (UIView)_platterBackgroundView
{
  void *v4;
  void *v6;

  if ((_UIApplicationProcessIsSpringBoard() & 1) == 0
    && (_UIApplicationProcessIsControlCenterHostApp() & 1) == 0
    && (_UIApplicationProcessIsUIKitester() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPageControl.m"), 555, CFSTR("This may only be used by SpringBoard."));

  }
  if ((*(_BYTE *)&self->_custom & 8) != 0)
  {
    -[_UIPageControlVisualProvider backgroundView](self->_visualProvider, "backgroundView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return (UIView *)v4;
}

- (BOOL)_prefersTargetPageForDiscreteInteraction
{
  return (*(_BYTE *)&self->_pageControlFlags >> 5) & 1;
}

- (void)_setPrefersTargetPageForDiscreteInteraction:(BOOL)a3
{
  _BOOL4 v3;
  char v6;
  void *v7;

  v3 = a3;
  if ((_UIApplicationProcessIsSpringBoard() & 1) == 0
    && (_UIApplicationProcessIsControlCenterHostApp() & 1) == 0
    && (_UIApplicationProcessIsUIKitester() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPageControl.m"), 566, CFSTR("This may only be used by SpringBoard."));

  }
  if (v3)
    v6 = 32;
  else
    v6 = 0;
  *(_BYTE *)&self->_pageControlFlags = *(_BYTE *)&self->_pageControlFlags & 0xDF | v6;
}

- (CGAffineTransform)_activeTransformForTouchedPage
{
  CGAffineTransform *result;

  result = (CGAffineTransform *)self->_visualProvider;
  if (result)
    return (CGAffineTransform *)-[CGAffineTransform activeTransformForTouchedPage](result, "activeTransformForTouchedPage");
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return result;
}

- (void)_setActiveTransformForTouchedPage:(CGAffineTransform *)a3
{
  __int128 v6;
  void *v7;
  _OWORD v8[3];

  if ((_UIApplicationProcessIsSpringBoard() & 1) == 0
    && (_UIApplicationProcessIsControlCenterHostApp() & 1) == 0
    && (_UIApplicationProcessIsUIKitester() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPageControl.m"), 577, CFSTR("This may only be used by SpringBoard."));

  }
  v6 = *(_OWORD *)&a3->c;
  v8[0] = *(_OWORD *)&a3->a;
  v8[1] = v6;
  v8[2] = *(_OWORD *)&a3->tx;
  -[_UIPageControlVisualProvider setActiveTransformForTouchedPage:](self->_visualProvider, "setActiveTransformForTouchedPage:", v8);
}

- (CGAffineTransform)_targetTransformForTouchedPage
{
  CGAffineTransform *result;

  result = (CGAffineTransform *)self->_visualProvider;
  if (result)
    return (CGAffineTransform *)-[CGAffineTransform targetTransformForTouchedPage](result, "targetTransformForTouchedPage");
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return result;
}

- (void)_setTargetTransformForTouchedPage:(CGAffineTransform *)a3
{
  __int128 v6;
  void *v7;
  _OWORD v8[3];

  if ((_UIApplicationProcessIsSpringBoard() & 1) == 0
    && (_UIApplicationProcessIsControlCenterHostApp() & 1) == 0
    && (_UIApplicationProcessIsUIKitester() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPageControl.m"), 588, CFSTR("This may only be used by SpringBoard."));

  }
  v6 = *(_OWORD *)&a3->c;
  v8[0] = *(_OWORD *)&a3->a;
  v8[1] = v6;
  v8[2] = *(_OWORD *)&a3->tx;
  -[_UIPageControlVisualProvider setTargetTransformForTouchedPage:](self->_visualProvider, "setTargetTransformForTouchedPage:", v8);
}

- (CAColorMatrix)_pageIndicatorVibrantColorMatrix
{
  CAColorMatrix *result;

  result = (CAColorMatrix *)self->_visualProvider;
  if (result)
    return (CAColorMatrix *)-[CAColorMatrix pageIndicatorVibrantColorMatrix](result, "pageIndicatorVibrantColorMatrix");
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m42 = 0u;
  *(_OWORD *)&retstr->m15 = 0u;
  *(_OWORD *)&retstr->m24 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  return result;
}

- (void)_setPageIndicatorVibrantColorMatrix:(CAColorMatrix *)a3
{
  __int128 v6;
  __int128 v7;
  void *v8;
  _OWORD v9[5];

  if ((_UIApplicationProcessIsSpringBoard() & 1) == 0
    && (_UIApplicationProcessIsControlCenterHostApp() & 1) == 0
    && (_UIApplicationProcessIsUIKitester() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPageControl.m"), 599, CFSTR("This may only be used by SpringBoard."));

  }
  v6 = *(_OWORD *)&a3->m33;
  v9[2] = *(_OWORD *)&a3->m24;
  v9[3] = v6;
  v9[4] = *(_OWORD *)&a3->m42;
  v7 = *(_OWORD *)&a3->m15;
  v9[0] = *(_OWORD *)&a3->m11;
  v9[1] = v7;
  -[_UIPageControlVisualProvider setPageIndicatorVibrantColorMatrix:](self->_visualProvider, "setPageIndicatorVibrantColorMatrix:", v9);
}

- (CAColorMatrix)_activePageIndicatorVibrantColorMatrix
{
  CAColorMatrix *result;

  result = (CAColorMatrix *)self->_visualProvider;
  if (result)
    return (CAColorMatrix *)-[CAColorMatrix activePageIndicatorVibrantColorMatrix](result, "activePageIndicatorVibrantColorMatrix");
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m42 = 0u;
  *(_OWORD *)&retstr->m15 = 0u;
  *(_OWORD *)&retstr->m24 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  return result;
}

- (void)_setActivePageIndicatorVibrantColorMatrix:(CAColorMatrix *)a3
{
  __int128 v6;
  __int128 v7;
  void *v8;
  _OWORD v9[5];

  if ((_UIApplicationProcessIsSpringBoard() & 1) == 0
    && (_UIApplicationProcessIsControlCenterHostApp() & 1) == 0
    && (_UIApplicationProcessIsUIKitester() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPageControl.m"), 610, CFSTR("This may only be used by SpringBoard."));

  }
  v6 = *(_OWORD *)&a3->m33;
  v9[2] = *(_OWORD *)&a3->m24;
  v9[3] = v6;
  v9[4] = *(_OWORD *)&a3->m42;
  v7 = *(_OWORD *)&a3->m15;
  v9[0] = *(_OWORD *)&a3->m11;
  v9[1] = v7;
  -[_UIPageControlVisualProvider setActivePageIndicatorVibrantColorMatrix:](self->_visualProvider, "setActivePageIndicatorVibrantColorMatrix:", v9);
}

- (void)_setPlatterEffect:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->__platterEffect, a3);
  v5 = a3;
  -[_UIPageControlVisualProvider didUpdateBackgroundEffect](self->_visualProvider, "didUpdateBackgroundEffect");

}

- (unint64_t)_controlEventsForActionTriggered
{
  return 4096;
}

- (void)_emitValueChanged
{
  -[UIControl _sendActionsForEvents:withEvent:](self, "_sendActionsForEvents:withEvent:", 4096, 0);
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIPageControl;
  v6 = a3;
  -[UIControl endTrackingWithTouch:withEvent:](&v7, sel_endTrackingWithTouch_withEvent_, v6, a4);
  -[_UIPageControlVisualProvider didEndTrackingWithTouch:](self->_visualProvider, "didEndTrackingWithTouch:", v6, v7.receiver, v7.super_class);

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  UIPageControl *v5;
  BOOL v6;

  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (UIPageControl *)objc_claimAutoreleasedReturnValue();
  v6 = v5 == self
    || !objc_msgSend(v4, "_isGestureType:", 0)
    || objc_msgSend(v4, "numberOfTouchesRequired") != 1
    || objc_msgSend(v4, "numberOfTapsRequired") != 1;

  return v6;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (int64_t)previousPage
{
  return self->_previousPage;
}

- (void)setPreviousPage:(int64_t)a3
{
  self->_previousPage = a3;
}

- (void)_invalidateIndicators
{
  -[_UIPageControlVisualProvider invalidateIndicators](self->_visualProvider, "invalidateIndicators");
}

@end
