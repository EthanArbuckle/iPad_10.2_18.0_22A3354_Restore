@implementation PLPlatterHeaderContentView

+ (double)contentBaselineToBoundsBottomWithWidth:(double)a3 scale:(double)a4
{
  void *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferredContentSizeCategory");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();

  UIContentSizeCategoryIsAccessibilityCategory(v8);
  v9 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0D01928], "preferredFontProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_titleLabelFontFromFontProvider:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentBaselineToBoundsBottomWithFont:boundsWidth:scale:", v11, a3, a4);
  v13 = v12;

  return v13;
}

- (PLPlatterHeaderContentView)init
{
  PLPlatterHeaderContentView *v2;
  PLPlatterHeaderContentView *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PLPlatterHeaderContentView;
  v2 = -[PLPlatterHeaderContentView init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_dateFormatStyle = 1;
    -[PLPlatterHeaderContentView setPreservesSuperviewLayoutMargins:](v2, "setPreservesSuperviewLayoutMargins:", 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__darkerSystemColorsStatusDidChange_, *MEMORY[0x1E0CEAFF0], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v3, sel__reduceTransparencyStatusDidChange_, *MEMORY[0x1E0CEB098], 0);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CEAFF0], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB098], 0);

  -[PLPlatterHeaderContentView _recycleDateLabel](self, "_recycleDateLabel");
  v5.receiver = self;
  v5.super_class = (Class)PLPlatterHeaderContentView;
  -[PLPlatterHeaderContentView dealloc](&v5, sel_dealloc);
}

- (UILabel)_dateLabel
{
  return (UILabel *)self->_dateLabel;
}

- (BSUIFontProvider)_fontProvider
{
  BSUIFontProvider *v3;
  BSUIFontProvider *fontProvider;

  if (!self->_fontProvider)
  {
    if (-[PLPlatterHeaderContentView adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory"))
      objc_msgSend(MEMORY[0x1E0D01928], "preferredFontProvider");
    else
      objc_msgSend(MEMORY[0x1E0D01928], "defaultFontProvider");
    v3 = (BSUIFontProvider *)objc_claimAutoreleasedReturnValue();
    fontProvider = self->_fontProvider;
    self->_fontProvider = v3;

  }
  return self->_fontProvider;
}

- (id)_layoutManager
{
  PLPlatterHeaderContentViewLayoutManager *layoutManager;
  PLPlatterHeaderContentViewLayoutManager *v4;
  PLPlatterHeaderContentViewLayoutManager *v5;

  layoutManager = self->_layoutManager;
  if (!layoutManager)
  {
    -[PLPlatterHeaderContentView _usesLargeTextLayout](self, "_usesLargeTextLayout");
    v4 = (PLPlatterHeaderContentViewLayoutManager *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPlatterHeaderContentView:", self);
    v5 = self->_layoutManager;
    self->_layoutManager = v4;

    layoutManager = self->_layoutManager;
  }
  return layoutManager;
}

- (void)_setUsesLargeTextLayout:(BOOL)a3
{
  PLPlatterHeaderContentViewLayoutManager *layoutManager;

  if (self->_usesLargeTextLayout != a3)
  {
    self->_usesLargeTextLayout = a3;
    layoutManager = self->_layoutManager;
    self->_layoutManager = 0;

  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  double v6;
  CGSize result;

  width = a3.width;
  -[PLPlatterHeaderContentView _headerHeightForWidth:](self, "_headerHeightForWidth:", a3.width, a3.height);
  v5 = v4;
  v6 = width;
  result.height = v5;
  result.width = v6;
  return result;
}

- (NSArray)icons
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](self->_iconButtons, "count"))
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v3)
    {
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      v4 = self->_iconButtons;
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v12;
        do
        {
          v8 = 0;
          do
          {
            if (*(_QWORD *)v12 != v7)
              objc_enumerationMutation(v4);
            objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "imageForState:", 0, (_QWORD)v11);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v9);

            ++v8;
          }
          while (v6 != v8);
          v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        }
        while (v6);
      }

    }
  }
  else
  {
    v3 = 0;
  }
  return (NSArray *)v3;
}

- (void)_configureIconButtonsForIcons:(id)a3
{
  NSArray *v4;
  uint64_t v5;
  NSArray **p_iconButtons;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  id v10;
  void *v11;
  unint64_t v12;
  NSUInteger v13;
  NSUInteger v14;
  NSArray *v15;
  id v16;

  v16 = a3;
  if (objc_msgSend(v16, "count"))
    v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  else
    v4 = 0;
  v5 = objc_msgSend(v16, "count");
  p_iconButtons = &self->_iconButtons;
  if (v5 | -[NSArray count](self->_iconButtons, "count"))
  {
    v7 = 0;
    do
    {
      v8 = objc_msgSend(v16, "count");
      v9 = -[NSArray count](*p_iconButtons, "count");
      if (v7 >= v8)
      {
        if (v7 >= v9)
        {
          v10 = 0;
        }
        else
        {
          -[NSArray objectAtIndex:](*p_iconButtons, "objectAtIndex:", v7);
          v10 = (id)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v10, "removeFromSuperview");
      }
      else
      {
        if (v7 >= v9
          || (-[NSArray objectAtIndex:](*p_iconButtons, "objectAtIndex:", v7),
              (v10 = (id)objc_claimAutoreleasedReturnValue()) == 0))
        {
          v10 = -[PLPlatterHeaderContentView _newIconButton](self, "_newIconButton");
          -[PLPlatterHeaderContentView addSubview:](self, "addSubview:", v10);
        }
        objc_msgSend(v16, "objectAtIndex:", v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLPlatterHeaderContentView _configureIconButton:withIcon:](self, "_configureIconButton:withIcon:", v10, v11);
        -[NSArray addObject:](v4, "addObject:", v10);

      }
      ++v7;
      v12 = objc_msgSend(v16, "count");
      p_iconButtons = &self->_iconButtons;
      v13 = -[NSArray count](self->_iconButtons, "count");
      if (v12 <= v13)
        v14 = v13;
      else
        v14 = v12;
    }
    while (v7 < v14);
  }
  v15 = *p_iconButtons;
  *p_iconButtons = v4;

}

- (void)setIcons:(id)a3
{
  NSArray *iconButtons;
  id v5;
  uint64_t v6;

  iconButtons = self->_iconButtons;
  v5 = a3;
  v6 = -[NSArray count](iconButtons, "count");
  -[PLPlatterHeaderContentView _configureIconButtonsForIcons:](self, "_configureIconButtonsForIcons:", v5);

  if (v6 != -[NSArray count](self->_iconButtons, "count"))
    -[PLPlatterHeaderContentView _updateTextAttributesForTitleLabel:](self, "_updateTextAttributesForTitleLabel:", self->_titleLabel);
}

- (NSString)title
{
  void *v2;
  void *v3;

  -[PLPlatterHeaderContentView _titleLabel](self, "_titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (id)_titleLabelFontFromFontProvider:(id)a3
{
  return (id)objc_msgSend(a3, "preferredFontForTextStyle:hiFontStyle:", *MEMORY[0x1E0CEB558], 8);
}

- (id)_titleLabelPreferredFont
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[PLPlatterHeaderContentView _fontProvider](self, "_fontProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_titleLabelFontFromFontProvider:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (UIFont)_titleLabelFont
{
  void *v3;
  void *v4;

  -[UILabel attributedText](self->_titleLabel, "attributedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
    -[UILabel font](self->_titleLabel, "font");
  else
    -[PLPlatterHeaderContentView _titleLabelPreferredFont](self, "_titleLabelPreferredFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v4;
}

- (void)_updateTextAttributesForTitleLabel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "attributedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  -[PLPlatterHeaderContentView _updateTitleAttributesForAttributedString:](self, "_updateTitleAttributesForAttributedString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAttributedText:", v6);

  objc_msgSend(v7, "setNumberOfLines:", -[PLPlatterHeaderContentView _usesLargeTextLayout](self, "_usesLargeTextLayout") ^ 1);
}

- (id)_newTitleLabel
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CEA700]);
  objc_msgSend(v2, "_setOverallWritingDirectionFollowsLayoutDirection:", 1);
  return v2;
}

- (id)_lazyTitleLabel
{
  UILabel *titleLabel;
  UILabel *v4;
  UILabel *v5;

  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    v4 = -[PLPlatterHeaderContentView _newTitleLabel](self, "_newTitleLabel");
    v5 = self->_titleLabel;
    self->_titleLabel = v4;

    -[PLPlatterHeaderContentView addSubview:](self, "addSubview:", self->_titleLabel);
    -[PLPlatterHeaderContentView _configureTitleLabel:](self, "_configureTitleLabel:", self->_titleLabel);
    titleLabel = self->_titleLabel;
  }
  return titleLabel;
}

- (void)setTitle:(id)a3
{
  const __CFString *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;

  v4 = (const __CFString *)a3;
  if (!v4)
    v4 = CFSTR(" ");
  v10 = (__CFString *)v4;
  -[PLPlatterHeaderContentView title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[__CFString isEqualToString:](v10, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    -[PLPlatterHeaderContentView _layoutManager](self, "_layoutManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidateCachedSizeInfo");

    -[PLPlatterHeaderContentView _lazyTitleLabel](self, "_lazyTitleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPlatterHeaderContentView _attributedStringForTitle:](self, "_attributedStringForTitle:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAttributedText:", v9);

    -[PLPlatterHeaderContentView setNeedsLayout](self, "setNeedsLayout");
    self->_hasUpdatedContent = 1;
    if (objc_msgSend(MEMORY[0x1E0CEABB0], "_isInAnimationBlock"))
    {
      self->_hasUpdatedContent = 0;
      objc_msgSend(v8, "pl_performCrossFadeIfNecessary");
    }

  }
}

- (id)_attributedStringForTitle:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v4);
    -[PLPlatterHeaderContentView _updateTitleAttributesForAttributedString:](self, "_updateTitleAttributesForAttributedString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_updateTitleAttributesForAttributedString:(id)a3
{
  id v4;
  _BOOL4 v5;
  float v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  double v11;
  double v12;
  double v13;
  unint64_t v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;

  v4 = a3;
  if (v4)
  {
    v5 = -[PLPlatterHeaderContentView _usesLargeTextLayout](self, "_usesLargeTextLayout");
    if (v5)
      v6 = 0.45;
    else
      v6 = 0.0;
    if (v5)
      v7 = 0;
    else
      v7 = 4;
    objc_msgSend(MEMORY[0x1E0CEA238], "defaultParagraphStyle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    v10 = -[NSArray count](self->_iconButtons, "count");
    -[PLPlatterHeaderContentView _iconDimension](self, "_iconDimension");
    v12 = v11;
    -[PLPlatterHeaderContentView _iconLeadingPadding](self, "_iconLeadingPadding");
    v14 = v10 - 1;
    if (!v10)
      v14 = 0;
    v15 = v13 * (double)v14 + v12 * (double)v10;
    if (v10)
      -[PLPlatterHeaderContentView _iconTrailingPadding](self, "_iconTrailingPadding");
    else
      v16 = 0.0;
    objc_msgSend(v9, "setFirstLineHeadIndent:", v15 + v16);
    objc_msgSend(v9, "setLineBreakMode:", v7);
    *(float *)&v17 = v6;
    objc_msgSend(v9, "setHyphenationFactor:", v17);
    objc_msgSend(v4, "addAttribute:value:range:", *MEMORY[0x1E0CEA0D0], v9, 0, objc_msgSend(v4, "length"));
    v18 = *MEMORY[0x1E0CEA098];
    -[PLPlatterHeaderContentView _titleLabelPreferredFont](self, "_titleLabelPreferredFont");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addAttribute:value:range:", v18, v19, 0, objc_msgSend(v4, "length"));

  }
  return v4;
}

- (void)_updateTextAttributesForDateLabel
{
  BSUIDateLabel *dateLabel;
  BSUIDateLabel *v4;
  void *v5;

  dateLabel = self->_dateLabel;
  if (dateLabel)
  {
    -[BSUIDateLabel setAdjustsFontSizeToFitWidth:](dateLabel, "setAdjustsFontSizeToFitWidth:", -[PLPlatterHeaderContentView _usesLargeTextLayout](self, "_usesLargeTextLayout"));
    v4 = self->_dateLabel;
    -[PLPlatterHeaderContentView _dateLabelPreferredFont](self, "_dateLabelPreferredFont");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSUIDateLabel setFont:](v4, "setFont:", v5);

    -[BSUIDateLabel setNumberOfLines:](self->_dateLabel, "setNumberOfLines:", 1);
    -[BSUIDateLabel setLineBreakMode:](self->_dateLabel, "setLineBreakMode:", 3);
  }
}

- (UIFont)_dateLabelFont
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[BSUIDateLabel font](self->_dateLabel, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[PLPlatterHeaderContentView _dateLabelPreferredFont](self, "_dateLabelPreferredFont");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (UIFont *)v6;
}

- (id)_dateLabelPreferredFont
{
  void *v2;
  void *v3;

  -[PLPlatterHeaderContentView _fontProvider](self, "_fontProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredFontForTextStyle:hiFontStyle:", *MEMORY[0x1E0CEB558], 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_configureDateLabelIfNecessary
{
  if (!self->_dateLabel)
  {
    if (self->_date)
      -[PLPlatterHeaderContentView _configureDateLabel](self, "_configureDateLabel");
  }
}

- (void)_recycleDateLabel
{
  id v3;

  -[BSUIDateLabel setDelegate:](self->_dateLabel, "setDelegate:", 0);
  -[MTVisualStylingProvider stopAutomaticallyUpdatingView:](self->_visualStylingProvider, "stopAutomaticallyUpdatingView:", self->_dateLabel);
  -[BSUIDateLabel mt_removeAllVisualStyling](self->_dateLabel, "mt_removeAllVisualStyling");
  +[PLPlatterHeaderViewDateLabelFactory sharedInstance](PLPlatterHeaderViewDateLabelFactory, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recycleLabel:", self->_dateLabel);

}

- (void)_tearDownDateLabel
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __48__PLPlatterHeaderContentView__tearDownDateLabel__block_invoke;
  v2[3] = &unk_1E91D3160;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v2);
}

void __48__PLPlatterHeaderContentView__tearDownDateLabel__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 416);
  if (v2)
  {
    objc_msgSend(v2, "removeFromSuperview");
    objc_msgSend(*(id *)(a1 + 32), "_recycleDateLabel");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 416);
    *(_QWORD *)(v3 + 416) = 0;

  }
}

- (void)setDate:(id)a3
{
  NSDate *v4;
  NSDate *date;
  id v6;

  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (NSDate *)objc_msgSend(v6, "copy");
    date = self->_date;
    self->_date = v4;

    -[PLPlatterHeaderContentView _tearDownDateLabel](self, "_tearDownDateLabel");
    -[PLPlatterHeaderContentView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setDateAllDay:(BOOL)a3
{
  if (self->_dateAllDay != a3)
  {
    self->_dateAllDay = a3;
    -[PLPlatterHeaderContentView _tearDownDateLabel](self, "_tearDownDateLabel");
    -[PLPlatterHeaderContentView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setDateFormatStyle:(int64_t)a3
{
  if (self->_dateFormatStyle != a3)
  {
    self->_dateFormatStyle = a3;
    -[PLPlatterHeaderContentView _tearDownDateLabel](self, "_tearDownDateLabel");
    -[PLPlatterHeaderContentView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTimeZone:(id)a3
{
  NSTimeZone *v4;
  NSTimeZone *timeZone;
  id v6;

  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (NSTimeZone *)objc_msgSend(v6, "copy");
    timeZone = self->_timeZone;
    self->_timeZone = v4;

    -[PLPlatterHeaderContentView _tearDownDateLabel](self, "_tearDownDateLabel");
    -[PLPlatterHeaderContentView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (UIButton)utilityButton
{
  -[PLPlatterHeaderContentView _configureUtilityButtonIfNecessary](self, "_configureUtilityButtonIfNecessary");
  return self->_utilityButton;
}

- (void)setUtilityView:(id)a3
{
  UIView *v5;
  UIView *utilityView;
  UIView *v7;

  v5 = (UIView *)a3;
  utilityView = self->_utilityView;
  if (utilityView != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](utilityView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_utilityView, a3);
    -[PLPlatterHeaderContentView addSubview:](self, "addSubview:", self->_utilityView);
    -[PLPlatterHeaderContentView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (double)contentBaseline
{
  void *v3;
  double v4;
  double v5;
  _QWORD v7[5];

  if (-[PLPlatterHeaderContentView _usesLargeTextLayout](self, "_usesLargeTextLayout"))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __45__PLPlatterHeaderContentView_contentBaseline__block_invoke;
    v7[3] = &unk_1E91D3160;
    v7[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v7);
  }
  -[PLPlatterHeaderContentView _layoutManager](self, "_layoutManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentBaseline");
  v5 = v4;

  return v5;
}

uint64_t __45__PLPlatterHeaderContentView_contentBaseline__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)_updateUtilityButtonFont
{
  UIButton *utilityButton;
  void *v4;
  void *v5;
  id v6;

  utilityButton = self->_utilityButton;
  if (utilityButton)
  {
    -[UIButton titleLabel](utilityButton, "titleLabel");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[PLPlatterHeaderContentView _fontProvider](self, "_fontProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredFontForTextStyle:hiFontStyle:", *MEMORY[0x1E0CEB558], 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFont:", v5);

  }
}

- (void)layoutMarginsDidChange
{
  if (self->_heedsHorizontalLayoutMargins)
    -[PLPlatterHeaderContentView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  _QWORD v7[6];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PLPlatterHeaderContentView;
  -[PLPlatterHeaderContentView layoutSubviews](&v8, sel_layoutSubviews);
  -[PLPlatterHeaderContentView _configureDateLabelIfNecessary](self, "_configureDateLabelIfNecessary");
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  v5 = v4;

  -[PLPlatterHeaderContentView _layoutIconButtonsWithScale:](self, "_layoutIconButtonsWithScale:", v5);
  -[PLPlatterHeaderContentView _utilityButton](self, "_utilityButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[PLPlatterHeaderContentView _layoutUtilityButtonWithScale:](self, "_layoutUtilityButtonWithScale:", v5);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__PLPlatterHeaderContentView_layoutSubviews__block_invoke;
  v7[3] = &unk_1E91D3428;
  v7[4] = self;
  *(double *)&v7[5] = v5;
  objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v7);
  if (self->_hasUpdatedContent)
  {
    self->_hasUpdatedContent = 0;
    -[UILabel pl_performCrossFadeIfNecessary](self->_titleLabel, "pl_performCrossFadeIfNecessary");
  }
}

uint64_t __44__PLPlatterHeaderContentView_layoutSubviews__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_layoutDateLabelWithScale:", *(double *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_layoutTitleLabelWithScale:", *(double *)(a1 + 40));
}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  if (a3 == 1)
    return self->_visualStylingProvider;
  else
    return 0;
}

- (id)visualStylingProvider
{
  return -[PLPlatterHeaderContentView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 1);
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_1E91E2EE0;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  MTVisualStylingProvider *v7;
  MTVisualStylingProvider *v8;

  v7 = (MTVisualStylingProvider *)a3;
  if (a4 == 1 && self->_visualStylingProvider != v7)
  {
    v8 = v7;
    -[MTVisualStylingProvider stopAutomaticallyUpdatingView:](v7, "stopAutomaticallyUpdatingView:", self->_titleLabel);
    -[MTVisualStylingProvider stopAutomaticallyUpdatingView:](v8, "stopAutomaticallyUpdatingView:", self->_dateLabel);
    -[MTVisualStylingProvider stopAutomaticallyUpdatingView:](v8, "stopAutomaticallyUpdatingView:", self->_utilityButton);
    objc_storeStrong((id *)&self->_visualStylingProvider, a3);
    -[PLPlatterHeaderContentView _updateStylingForTitleLabel:](self, "_updateStylingForTitleLabel:", self->_titleLabel);
    -[PLPlatterHeaderContentView _tearDownDateLabel](self, "_tearDownDateLabel");
    -[PLPlatterHeaderContentView _updateUtilityButtonVisualStyling](self, "_updateUtilityButtonVisualStyling");
    -[PLPlatterHeaderContentView setNeedsLayout](self, "setNeedsLayout");
    v7 = v8;
  }

}

- (void)setVisualStylingProvider:(id)a3
{
  -[PLPlatterHeaderContentView setVisualStylingProvider:forCategory:](self, "setVisualStylingProvider:forCategory:", a3, 1);
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategory = a3;
    -[PLPlatterHeaderContentView adjustForContentSizeCategoryChange](self, "adjustForContentSizeCategoryChange");
  }
}

- (NSString)preferredContentSizeCategory
{
  NSString **p_preferredContentSizeCategory;
  NSString *preferredContentSizeCategory;

  p_preferredContentSizeCategory = &self->_preferredContentSizeCategory;
  preferredContentSizeCategory = self->_preferredContentSizeCategory;
  if (!preferredContentSizeCategory)
  {
    objc_storeStrong((id *)p_preferredContentSizeCategory, (id)*MEMORY[0x1E0CEB440]);
    preferredContentSizeCategory = *p_preferredContentSizeCategory;
  }
  return preferredContentSizeCategory;
}

- (BOOL)adjustForContentSizeCategoryChange
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  BSUIFontProvider *fontProvider;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLPlatterHeaderContentView preferredContentSizeCategory](self, "preferredContentSizeCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    fontProvider = self->_fontProvider;
    self->_fontProvider = 0;

    -[PLPlatterHeaderContentView setPreferredContentSizeCategory:](self, "setPreferredContentSizeCategory:", v4);
    -[PLPlatterHeaderContentView _setUsesLargeTextLayout:](self, "_setUsesLargeTextLayout:", UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v4));
    -[PLPlatterHeaderContentView _layoutManager](self, "_layoutManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "invalidateCachedSizeInfo");

    -[PLPlatterHeaderContentView _titleLabel](self, "_titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPlatterHeaderContentView _updateTextAttributesForTitleLabel:](self, "_updateTextAttributesForTitleLabel:", v9);

    -[PLPlatterHeaderContentView _updateTextAttributesForDateLabel](self, "_updateTextAttributesForDateLabel");
    -[PLPlatterHeaderContentView _updateUtilityButtonFont](self, "_updateUtilityButtonFont");
    -[PLPlatterHeaderContentView setNeedsLayout](self, "setNeedsLayout");
  }

  return v6 ^ 1;
}

- (void)dateLabelDidChange:(id)a3
{
  if (!-[PLPlatterHeaderContentView _usesLargeTextLayout](self, "_usesLargeTextLayout", a3))
  {
    -[BSUIDateLabel sizeToFit](self->_dateLabel, "sizeToFit");
    -[PLPlatterHeaderContentView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (void)setPreferredContentSizeCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (NSDate)date
{
  return self->_date;
}

- (BOOL)isDateAllDay
{
  return self->_dateAllDay;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (int64_t)dateFormatStyle
{
  return self->_dateFormatStyle;
}

- (NSArray)iconButtons
{
  return self->_iconButtons;
}

- (UIView)utilityView
{
  return self->_utilityView;
}

- (BOOL)heedsHorizontalLayoutMargins
{
  return self->_heedsHorizontalLayoutMargins;
}

- (void)setHeedsHorizontalLayoutMargins:(BOOL)a3
{
  self->_heedsHorizontalLayoutMargins = a3;
}

- (void)_setFontProvider:(id)a3
{
  objc_storeStrong((id *)&self->_fontProvider, a3);
}

- (void)_setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (BOOL)_usesLargeTextLayout
{
  return self->_usesLargeTextLayout;
}

- (double)_utilityButtonHorizontalLayoutReference
{
  return self->_utilityButtonHorizontalLayoutReference;
}

- (void)_setUtilityButtonHorizontalLayoutReference:(double)a3
{
  self->_utilityButtonHorizontalLayoutReference = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_fontProvider, 0);
  objc_storeStrong((id *)&self->_utilityView, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_visualStylingProvider, 0);
  objc_storeStrong((id *)&self->_layoutManager, 0);
  objc_storeStrong((id *)&self->_utilityButton, 0);
  objc_storeStrong((id *)&self->_iconButtons, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);
}

- (void)_configureUtilityButtonIfNecessary
{
  if (!self->_utilityButton)
    -[PLPlatterHeaderContentView _configureUtilityButton](self, "_configureUtilityButton");
}

- (id)_utilityButton
{
  return self->_utilityButton;
}

- (double)_iconDimension
{
  return 20.0;
}

- (double)_iconLeadingPadding
{
  return 10.0;
}

- (double)_iconTrailingPadding
{
  return 7.0;
}

- (double)_headerHeightForWidth:(double)a3
{
  void *v4;
  double v5;
  double v6;

  -[PLPlatterHeaderContentView _layoutManager](self, "_layoutManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "headerHeightForWidth:", a3);
  v6 = v5;

  return v6;
}

- (id)_newIconButton
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CEA3A0]);
  objc_msgSend(v2, "setContentMode:", 4);
  objc_msgSend(v2, "setAdjustsImageWhenHighlighted:", 0);
  return v2;
}

- (void)_configureIconButton:(id)a3 withIcon:(id)a4
{
  id v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  objc_msgSend(v8, "setImage:forState:", v5, 0);
  v6 = objc_msgSend(v5, "isSymbolImage");

  if ((v6 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTintColor:", v7);

  }
  else
  {
    objc_msgSend(v8, "setTintColor:", 0);
  }

}

- (void)_updateStylingForTitleLabel:(id)a3
{
  MTVisualStylingProvider *visualStylingProvider;
  void *v4;
  id v5;
  id v6;

  visualStylingProvider = self->_visualStylingProvider;
  if (visualStylingProvider)
  {
    v6 = a3;
    -[MTVisualStylingProvider automaticallyUpdateView:withStyle:](visualStylingProvider, "automaticallyUpdateView:withStyle:");
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0CEA478];
    v5 = a3;
    objc_msgSend(v4, "blackColor");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextColor:");

  }
}

- (void)_configureTitleLabel:(id)a3
{
  id v4;

  v4 = a3;
  -[PLPlatterHeaderContentView _updateTextAttributesForTitleLabel:](self, "_updateTextAttributesForTitleLabel:", v4);
  -[PLPlatterHeaderContentView _updateStylingForTitleLabel:](self, "_updateStylingForTitleLabel:", v4);

}

- (void)_configureDateLabel
{
  void *v3;
  BSUIDateLabel *v4;
  BSUIDateLabel *dateLabel;
  MTVisualStylingProvider *visualStylingProvider;
  BSUIDateLabel *v7;
  id v8;

  +[PLPlatterHeaderViewDateLabelFactory sharedInstance](PLPlatterHeaderViewDateLabelFactory, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startLabelWithStartDate:endDate:timeZone:allDay:forStyle:", self->_date, 0, self->_timeZone, self->_dateAllDay, BSUIDateFormatStyleFromPLDateFormatStyle(self->_dateFormatStyle));
  v4 = (BSUIDateLabel *)objc_claimAutoreleasedReturnValue();
  dateLabel = self->_dateLabel;
  self->_dateLabel = v4;

  -[BSUIDateLabel setDelegate:](self->_dateLabel, "setDelegate:", self);
  -[PLPlatterHeaderContentView addSubview:](self, "addSubview:", self->_dateLabel);
  -[PLPlatterHeaderContentView _updateTextAttributesForDateLabel](self, "_updateTextAttributesForDateLabel");
  visualStylingProvider = self->_visualStylingProvider;
  v7 = self->_dateLabel;
  if (visualStylingProvider)
  {
    -[MTVisualStylingProvider automaticallyUpdateView:withStyle:](visualStylingProvider, "automaticallyUpdateView:withStyle:", v7, 1);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[BSUIDateLabel setTextColor:](v7, "setTextColor:", v8);

  }
}

- (void)_updateUtilityButtonVisualStyling
{
  MTVisualStylingProvider *visualStylingProvider;
  void *v4;
  MTVisualStylingProvider *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  if (self->_visualStylingProvider)
  {
    objc_initWeak(&location, self->_utilityButton);
    visualStylingProvider = self->_visualStylingProvider;
    -[UIButton titleLabel](self->_utilityButton, "titleLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __73__PLPlatterHeaderContentView_Subclass___updateUtilityButtonVisualStyling__block_invoke;
    v10 = &unk_1E91D3518;
    objc_copyWeak(&v11, &location);
    -[MTVisualStylingProvider automaticallyUpdateView:withStyle:andObserverBlock:](visualStylingProvider, "automaticallyUpdateView:withStyle:andObserverBlock:", v4, 1, &v7);

    v5 = self->_visualStylingProvider;
    -[UIButton imageView](self->_utilityButton, "imageView", v7, v8, v9, v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTVisualStylingProvider automaticallyUpdateView:withStyle:](v5, "automaticallyUpdateView:withStyle:", v6, 1);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

id __73__PLPlatterHeaderContentView_Subclass___updateUtilityButtonVisualStyling__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;
  void *v3;
  _QWORD v5[4];
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __73__PLPlatterHeaderContentView_Subclass___updateUtilityButtonVisualStyling__block_invoke_2;
  v5[3] = &unk_1E91D34F0;
  v6 = WeakRetained;
  v2 = WeakRetained;
  v3 = (void *)MEMORY[0x1D17E5ED8](v5);

  return v3;
}

void __73__PLPlatterHeaderContentView_Subclass___updateUtilityButtonVisualStyling__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "_visualStylingForContinuallyUpdatedView:");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "color");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setTitleColor:forState:", v3, 0);
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "colorWithAlphaComponent:", 0.7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitleColor:forState:", v5, 1);

  objc_msgSend(*(id *)(a1 + 32), "setTintColor:", v3);
}

- (void)_configureUtilityButton
{
  UIButton *v3;
  UIButton *utilityButton;

  objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
  v3 = (UIButton *)objc_claimAutoreleasedReturnValue();
  utilityButton = self->_utilityButton;
  self->_utilityButton = v3;

  -[PLPlatterHeaderContentView addSubview:](self, "addSubview:", self->_utilityButton);
  -[PLPlatterHeaderContentView _updateUtilityButtonFont](self, "_updateUtilityButtonFont");
  -[PLPlatterHeaderContentView _updateUtilityButtonVisualStyling](self, "_updateUtilityButtonVisualStyling");
}

- (void)_layoutIconButtonsWithScale:(double)a3
{
  id v4;

  -[PLPlatterHeaderContentView _layoutManager](self, "_layoutManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIconButtonsWithScale:", a3);

}

- (void)_layoutTitleLabelWithScale:(double)a3
{
  void *v5;
  void *dateLabel;
  id v7;
  double v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v15;
  double MaxX;
  double v20;
  void *v21;
  id v22;

  -[PLPlatterHeaderContentView _titleLabel](self, "_titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v22 = v5;
    dateLabel = self->_dateLabel;
    if (!dateLabel)
      dateLabel = self->_utilityButton;
    v7 = dateLabel;
    objc_msgSend(v7, "alpha");
    if (v8 <= 0.0)
      v9 = 0;
    else
      v9 = v7;
    v10 = v9;

    if (-[PLPlatterHeaderContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    {
      if (v10)
      {
        objc_msgSend(v10, "frame");
LABEL_15:
        MaxX = CGRectGetMaxX(*(CGRect *)&v11);
        goto LABEL_16;
      }
      -[PLPlatterHeaderContentView bounds](self, "bounds");
    }
    else
    {
      if (!v10)
      {
        -[PLPlatterHeaderContentView bounds](self, "bounds");
        goto LABEL_15;
      }
      objc_msgSend(v10, "frame");
    }
    MaxX = CGRectGetMinX(*(CGRect *)&v15);
LABEL_16:
    v20 = MaxX;
    -[PLPlatterHeaderContentView _layoutManager](self, "_layoutManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "layoutTitleLabelWithTrailingXLimit:scale:", v20, a3);

    v5 = v22;
  }

}

- (void)_layoutUtilityButtonWithScale:(double)a3
{
  id v4;

  -[PLPlatterHeaderContentView _layoutManager](self, "_layoutManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutUtilityButtonWithScale:", a3);

}

- (void)_layoutDateLabelWithScale:(double)a3
{
  id v4;

  if (self->_dateLabel)
  {
    -[PLPlatterHeaderContentView _layoutManager](self, "_layoutManager");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layoutDateLabelWithScale:", a3);

  }
}

- (void)_darkerSystemColorsStatusDidChange:(id)a3
{
  if (self->_titleLabel)
    -[PLPlatterHeaderContentView _updateStylingForTitleLabel:](self, "_updateStylingForTitleLabel:");
}

- (void)_reduceTransparencyStatusDidChange:(id)a3
{
  if (self->_titleLabel)
    -[PLPlatterHeaderContentView _updateStylingForTitleLabel:](self, "_updateStylingForTitleLabel:");
}

@end
