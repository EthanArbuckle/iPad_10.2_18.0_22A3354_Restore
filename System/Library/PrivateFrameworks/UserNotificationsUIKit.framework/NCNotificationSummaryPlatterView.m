@implementation NCNotificationSummaryPlatterView

- (NCNotificationSummaryPlatterView)initWithRecipe:(int64_t)a3
{
  NCNotificationSummaryPlatterView *v3;
  NCNotificationSummaryPlatterView *v4;
  objc_super v6;

  if ((unint64_t)a3 <= 1)
    a3 = 1;
  v6.receiver = self;
  v6.super_class = (Class)NCNotificationSummaryPlatterView;
  v3 = -[PLPlatterView initWithRecipe:](&v6, sel_initWithRecipe_, a3);
  v4 = v3;
  if (v3)
  {
    -[PLPlatterView _setContinuousCornerRadius:](v3, "_setContinuousCornerRadius:", 23.5);
    -[NCNotificationSummaryPlatterView _configureSummaryContentViewIfNecessary](v4, "_configureSummaryContentViewIfNecessary");
  }
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  -[NCNotificationSummaryContentView sizeThatFits:](self->_summaryContentView, "sizeThatFits:", a3.width + -31.0, a3.height);
  -[NCNotificationSummaryPlatterView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayScale");
  UICeilToScale();
  v7 = v6;

  v8 = width;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)didMoveToSuperview
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NCNotificationSummaryContentView *summaryContentView;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)NCNotificationSummaryPlatterView;
  -[NCNotificationSummaryPlatterView didMoveToSuperview](&v15, sel_didMoveToSuperview);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NCNotificationSummaryContentView requiredVisualStyleCategories](self->_summaryContentView, "requiredVisualStyleCategories", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
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
        summaryContentView = self->_summaryContentView;
        -[PLPlatterView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NCNotificationSummaryContentView setVisualStylingProvider:forCategory:](summaryContentView, "setVisualStylingProvider:forCategory:", v10, v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v5);
  }

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
  CGFloat v11;
  objc_super v12;
  CGRect v13;
  CGRect v14;

  v12.receiver = self;
  v12.super_class = (Class)NCNotificationSummaryPlatterView;
  -[PLPlatterView layoutSubviews](&v12, sel_layoutSubviews);
  if (self->_summaryContentView)
  {
    -[NCNotificationSummaryPlatterView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[NCNotificationSummaryContentView frame](self->_summaryContentView, "frame");
    -[NCNotificationSummaryPlatterView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    v13.origin.x = v4;
    v13.origin.y = v6;
    v13.size.width = v8;
    v13.size.height = v10;
    v11 = CGRectGetWidth(v13) + -31.0;
    v14.origin.x = v4;
    v14.origin.y = v6;
    v14.size.width = v8;
    v14.size.height = v10;
    -[NCNotificationSummaryContentView sizeThatFits:](self->_summaryContentView, "sizeThatFits:", v11, CGRectGetHeight(v14));
    UIRectIntegralWithScale();
    -[NCNotificationSummaryContentView setFrame:](self->_summaryContentView, "setFrame:");
  }
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NCNotificationSummaryPlatterView;
  -[NCNotificationSummaryPlatterView _dynamicUserInterfaceTraitDidChange](&v3, sel__dynamicUserInterfaceTraitDidChange);
  -[NCNotificationSummaryPlatterView _updateStackDimmingVisualStyling](self, "_updateStackDimmingVisualStyling");
}

- (void)configureStackDimmingForTransform:(CGAffineTransform *)a3
{
  double v4;
  UIView *v5;
  UIView *stackDimmingView;
  UIView *v7;
  UIView *v8;
  _QWORD v9[5];

  if (a3->a <= 0.94)
    v4 = dbl_1CFD91A50[a3->a < 0.94];
  else
    v4 = 0.0;
  if (v4 > 0.0 && !self->_stackDimmingView)
  {
    v5 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    stackDimmingView = self->_stackDimmingView;
    self->_stackDimmingView = v5;

    -[UIView setUserInteractionEnabled:](self->_stackDimmingView, "setUserInteractionEnabled:", 0);
    v7 = self->_stackDimmingView;
    -[NCNotificationSummaryPlatterView bounds](self, "bounds");
    -[UIView setFrame:](v7, "setFrame:");
    -[UIView setAutoresizingMask:](self->_stackDimmingView, "setAutoresizingMask:", 18);
    v8 = self->_stackDimmingView;
    -[PLPlatterView _continuousCornerRadius](self, "_continuousCornerRadius");
    -[UIView _setContinuousCornerRadius:](v8, "_setContinuousCornerRadius:");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __70__NCNotificationSummaryPlatterView_configureStackDimmingForTransform___block_invoke;
    v9[3] = &unk_1E8D1B568;
    v9[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v9);
  }
  -[UIView setAlpha:](self->_stackDimmingView, "setAlpha:", v4);
}

uint64_t __70__NCNotificationSummaryPlatterView_configureStackDimmingForTransform___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 560), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 560));
  return objc_msgSend(*(id *)(a1 + 32), "_updateStackDimmingVisualStyling");
}

- (NSString)summaryTitle
{
  return -[NCNotificationSummaryContentView summaryTitle](self->_summaryContentView, "summaryTitle");
}

- (void)setSummaryTitle:(id)a3
{
  -[NCNotificationSummaryContentView setSummaryTitle:](self->_summaryContentView, "setSummaryTitle:", a3);
}

- (NSString)summary
{
  return -[NCNotificationSummaryContentView summary](self->_summaryContentView, "summary");
}

- (void)setSummary:(id)a3
{
  -[NCNotificationSummaryContentView setSummary:](self->_summaryContentView, "setSummary:", a3);
}

- (NSArray)summaryIconViews
{
  return -[NCNotificationSummaryContentView summaryIconViews](self->_summaryContentView, "summaryIconViews");
}

- (void)setSummaryIconViews:(id)a3
{
  -[NCNotificationSummaryContentView setSummaryIconViews:](self->_summaryContentView, "setSummaryIconViews:", a3);
}

- (BOOL)isIconViewLeading
{
  return -[NCNotificationSummaryContentView isIconViewLeading](self->_summaryContentView, "isIconViewLeading");
}

- (void)setIconViewLeading:(BOOL)a3
{
  -[NCNotificationSummaryContentView setIconViewLeading:](self->_summaryContentView, "setIconViewLeading:", a3);
}

- (NSString)summaryTitleFontName
{
  return -[NCNotificationSummaryContentView summaryTitleFontName](self->_summaryContentView, "summaryTitleFontName");
}

- (void)setSummaryTitleFontName:(id)a3
{
  -[NCNotificationSummaryContentView setSummaryTitleFontName:](self->_summaryContentView, "setSummaryTitleFontName:", a3);
}

- (NSDate)summaryDate
{
  return -[NCNotificationSummaryContentView summaryDate](self->_summaryContentView, "summaryDate");
}

- (void)setSummaryDate:(id)a3
{
  -[NCNotificationSummaryContentView setSummaryDate:](self->_summaryContentView, "setSummaryDate:", a3);
}

- (NSString)summaryIconSymbolName
{
  return -[NCNotificationSummaryContentView summaryIconSymbolName](self->_summaryContentView, "summaryIconSymbolName");
}

- (void)setSummaryIconSymbolName:(id)a3
{
  -[NCNotificationSummaryContentView setSummaryIconSymbolName:](self->_summaryContentView, "setSummaryIconSymbolName:", a3);
}

- (NSArray)requiredVisualStyleCategories
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0C99E20];
  v9.receiver = self;
  v9.super_class = (Class)NCNotificationSummaryPlatterView;
  -[PLPlatterView requiredVisualStyleCategories](&v9, sel_requiredVisualStyleCategories);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NCNotificationSummaryContentView requiredVisualStyleCategories](self->_summaryContentView, "requiredVisualStyleCategories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v6);

  objc_msgSend(v5, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v7;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NCNotificationSummaryPlatterView;
  v6 = a3;
  -[PLPlatterView setVisualStylingProvider:forCategory:](&v7, sel_setVisualStylingProvider_forCategory_, v6, a4);
  -[NCNotificationSummaryContentView setVisualStylingProvider:forCategory:](self->_summaryContentView, "setVisualStylingProvider:forCategory:", v6, a4, v7.receiver, v7.super_class);

}

- (BOOL)adjustsFontForContentSizeCategory
{
  return -[NCNotificationSummaryContentView adjustsFontForContentSizeCategory](self->_summaryContentView, "adjustsFontForContentSizeCategory");
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  -[NCNotificationSummaryContentView setAdjustsFontForContentSizeCategory:](self->_summaryContentView, "setAdjustsFontForContentSizeCategory:", a3);
}

- (BOOL)adjustForContentSizeCategoryChange
{
  return -[NCNotificationSummaryContentView adjustForContentSizeCategoryChange](self->_summaryContentView, "adjustForContentSizeCategoryChange");
}

- (void)_configureSummaryContentViewIfNecessary
{
  NCNotificationSummaryContentView *v3;
  NCNotificationSummaryContentView *v4;
  NCNotificationSummaryContentView *summaryContentView;
  id v6;

  if (!self->_summaryContentView)
  {
    -[PLPlatterView customContentView](self, "customContentView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v3 = [NCNotificationSummaryContentView alloc];
    objc_msgSend(v6, "bounds");
    v4 = -[NCNotificationSummaryContentView initWithFrame:](v3, "initWithFrame:");
    summaryContentView = self->_summaryContentView;
    self->_summaryContentView = v4;

    objc_msgSend(v6, "addSubview:", self->_summaryContentView);
  }
}

- (void)_updateStackDimmingVisualStyling
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  UIView *stackDimmingView;
  void *v12;
  id v13;

  if (self->_stackDimmingView)
  {
    -[NCNotificationSummaryPlatterView traitCollection](self, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "userInterfaceStyle");
    v5 = CFSTR("stackDimmingLight");
    if (v4 == 2)
      v5 = CFSTR("stackDimmingDark");
    v6 = v5;

    v7 = (void *)MEMORY[0x1E0D474B8];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_visualStylingProviderForStyleSetNamed:inBundle:", v6, v8);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    -[UIView alpha](self->_stackDimmingView, "alpha");
    v10 = v9;
    stackDimmingView = self->_stackDimmingView;
    objc_msgSend(v13, "_visualStylingForStyle:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView mt_replaceVisualStyling:](stackDimmingView, "mt_replaceVisualStyling:", v12);

    -[UIView setAlpha:](self->_stackDimmingView, "setAlpha:", v10);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackDimmingView, 0);
  objc_storeStrong((id *)&self->_summaryContentView, 0);
}

@end
