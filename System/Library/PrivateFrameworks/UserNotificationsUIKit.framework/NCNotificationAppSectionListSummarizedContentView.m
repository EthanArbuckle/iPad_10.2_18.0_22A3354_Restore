@implementation NCNotificationAppSectionListSummarizedContentView

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setTitle:(id)a3
{
  void *v4;
  char v5;
  UILabel *titleLabel;
  UILabel *v7;
  UILabel *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[UILabel text](self->_titleLabel, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", v10);

  if ((v5 & 1) == 0)
  {
    titleLabel = self->_titleLabel;
    if (!titleLabel)
    {
      v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
      v8 = self->_titleLabel;
      self->_titleLabel = v7;

      -[NCNotificationAppSectionListSummarizedContentView addSubview:](self, "addSubview:", self->_titleLabel);
      titleLabel = self->_titleLabel;
    }
    -[UILabel setText:](titleLabel, "setText:", v10);
    -[NCNotificationAppSectionListSummarizedContentView _updateTextAttributesForTitleLabel](self, "_updateTextAttributesForTitleLabel");
    -[NCNotificationListBaseContentView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationListBaseContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_titleLabel, 0, v9, 0);
    -[NCNotificationAppSectionListSummarizedContentView setNeedsLayout](self, "setNeedsLayout");

  }
}

- (void)setCount:(unint64_t)count
{
  UILabel *countLabel;
  UIView *v5;
  UIView *countBackgroundView;
  void *v7;
  UIView *v8;
  void *v9;
  UILabel *v10;
  UILabel *v11;
  UILabel *v12;
  void *v13;
  void *v14;
  void *v15;
  UILabel *v16;
  UIView *v17;
  id v18;

  if (self->_count != count)
  {
    self->_count = count;
    countLabel = self->_countLabel;
    if (count)
    {
      if (!countLabel)
      {
        v5 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
        countBackgroundView = self->_countBackgroundView;
        self->_countBackgroundView = v5;

        -[UIView layer](self->_countBackgroundView, "layer");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setCornerCurve:", *MEMORY[0x1E0CD2A60]);

        -[NCNotificationAppSectionListSummarizedContentView addSubview:](self, "addSubview:", self->_countBackgroundView);
        v8 = self->_countBackgroundView;
        objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setBackgroundColor:](v8, "setBackgroundColor:", v9);

        -[UIView setAlpha:](self->_countBackgroundView, "setAlpha:", 0.25);
        v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        v11 = self->_countLabel;
        self->_countLabel = v10;

        -[UILabel setTextAlignment:](self->_countLabel, "setTextAlignment:", 1);
        v12 = self->_countLabel;
        objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v12, "setTextColor:", v13);

        -[NCNotificationAppSectionListSummarizedContentView addSubview:](self, "addSubview:", self->_countLabel);
        -[NCNotificationAppSectionListSummarizedContentView _updateTextAttributesForCountLabel](self, "_updateTextAttributesForCountLabel");
        countLabel = self->_countLabel;
        count = self->_count;
      }
      v14 = (void *)MEMORY[0x1E0CB37F0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", count);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringFromNumber:numberStyle:", v18, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](countLabel, "setText:", v15);

    }
    else if (countLabel)
    {
      -[UILabel removeFromSuperview](self->_countLabel, "removeFromSuperview");
      v16 = self->_countLabel;
      self->_countLabel = 0;

      -[UIView removeFromSuperview](self->_countBackgroundView, "removeFromSuperview");
      v17 = self->_countBackgroundView;
      self->_countBackgroundView = 0;

      -[NCNotificationAppSectionListSummarizedContentView setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (void)setTitleAndContentStrings:(id)a3
{
  NSArray *titleAndContentStringLabels;
  id v5;
  NSArray *v6;
  NSArray *v7;
  NSArray *v8;
  id v9;
  _QWORD v10[5];
  NSArray *v11;

  v9 = a3;
  if ((objc_msgSend(v9, "isEqualToArray:", self->_titleAndContentStrings) & 1) == 0)
  {
    -[NSArray enumerateObjectsUsingBlock:](self->_titleAndContentStringLabels, "enumerateObjectsUsingBlock:", &__block_literal_global_12);
    titleAndContentStringLabels = self->_titleAndContentStringLabels;
    self->_titleAndContentStringLabels = 0;

    if (objc_msgSend(v9, "count"))
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __79__NCNotificationAppSectionListSummarizedContentView_setTitleAndContentStrings___block_invoke_3;
      v10[3] = &unk_1E8D1D688;
      v10[4] = self;
      v6 = (NSArray *)v5;
      v11 = v6;
      objc_msgSend(v9, "enumerateObjectsUsingBlock:", v10);
      v7 = self->_titleAndContentStringLabels;
      self->_titleAndContentStringLabels = v6;
      v8 = v6;

      -[NCNotificationAppSectionListSummarizedContentView _updateTextAttributesForTitleAndContentStringLabels](self, "_updateTextAttributesForTitleAndContentStringLabels");
    }
    -[NCNotificationAppSectionListSummarizedContentView setNeedsLayout](self, "setNeedsLayout");
  }

}

uint64_t __79__NCNotificationAppSectionListSummarizedContentView_setTitleAndContentStrings___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "enumerateObjectsUsingBlock:", &__block_literal_global_6);
}

uint64_t __79__NCNotificationAppSectionListSummarizedContentView_setTitleAndContentStrings___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeFromSuperview");
}

void __79__NCNotificationAppSectionListSummarizedContentView_setTitleAndContentStrings___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "objectAtIndex:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "_newContentStringLabelForText:", v5);

  v7 = *(void **)(a1 + 32);
  objc_msgSend(v4, "objectAtIndex:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v7, "_newContentStringLabelForText:", v8);
  v10 = *(void **)(a1 + 40);
  v12[0] = v6;
  v12[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v11);

}

- (void)setAttachmentImageViews:(id)a3
{
  NSArray **p_attachmentImageViews;
  NSArray *v6;
  UIView *attachmentImageBoundingView;
  UIView *v8;
  UIView *v9;
  id v10;
  _QWORD v11[5];

  p_attachmentImageViews = &self->_attachmentImageViews;
  v10 = a3;
  if ((objc_msgSend(v10, "isEqualToArray:", *p_attachmentImageViews) & 1) == 0)
  {
    -[NSArray enumerateObjectsUsingBlock:](*p_attachmentImageViews, "enumerateObjectsUsingBlock:", &__block_literal_global_10_0);
    v6 = *p_attachmentImageViews;
    *p_attachmentImageViews = 0;

    -[UIView removeFromSuperview](self->_attachmentImageBoundingView, "removeFromSuperview");
    attachmentImageBoundingView = self->_attachmentImageBoundingView;
    self->_attachmentImageBoundingView = 0;

    if (objc_msgSend(v10, "count"))
    {
      v8 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
      v9 = self->_attachmentImageBoundingView;
      self->_attachmentImageBoundingView = v8;

      -[NCNotificationAppSectionListSummarizedContentView addSubview:](self, "addSubview:", self->_attachmentImageBoundingView);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __77__NCNotificationAppSectionListSummarizedContentView_setAttachmentImageViews___block_invoke_2;
      v11[3] = &unk_1E8D1CF08;
      v11[4] = self;
      objc_msgSend(v10, "enumerateObjectsUsingBlock:", v11);
      objc_storeStrong((id *)&self->_attachmentImageViews, a3);
    }
    -[NCNotificationAppSectionListSummarizedContentView setNeedsLayout](self, "setNeedsLayout");
  }

}

uint64_t __77__NCNotificationAppSectionListSummarizedContentView_setAttachmentImageViews___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeFromSuperview");
}

uint64_t __77__NCNotificationAppSectionListSummarizedContentView_setAttachmentImageViews___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 488), "addSubview:", a2);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  UILabel *titleLabel;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[NCNotificationAppSectionListSummarizedContentView _countBackgroundDimensionInRect:](self, "_countBackgroundDimensionInRect:", 0.0, 0.0, a3.width, a3.height);
  -[NCNotificationAppSectionListSummarizedContentView _allowedWidthForTextInRect:](self, "_allowedWidthForTextInRect:", 0.0, 0.0, width, height);
  v7 = v6;
  titleLabel = self->_titleLabel;
  if (titleLabel)
    -[NCNotificationListBaseContentView _sizeMeasuringHeightForLabel:withNumberOfLines:](self, "_sizeMeasuringHeightForLabel:withNumberOfLines:", titleLabel, -[NCNotificationAppSectionListSummarizedContentView _numberOfLinesForTitleTextInFrame:](self, "_numberOfLinesForTitleTextInFrame:", 0.0, 0.0, v6, height));
  if (-[NSArray count](self->_titleAndContentStringLabels, "count"))
  {
    -[NSArray firstObject](self->_titleAndContentStringLabels, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[NCNotificationListBaseContentView _sizeMeasuringHeightForLabel:withNumberOfLines:](self, "_sizeMeasuringHeightForLabel:withNumberOfLines:", v10, -[NCNotificationAppSectionListSummarizedContentView _numberOfLinesForContentTextInFrame:](self, "_numberOfLinesForContentTextInFrame:", 0.0, 0.0, v7, height));
  }
  if (self->_attachmentImageBoundingView)
    -[NSArray count](self->_attachmentImageViews, "count");
  -[NCNotificationAppSectionListSummarizedContentView traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayScale");
  UICeilToScale();
  v13 = v12;

  v14 = width;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)layoutSubviews
{
  _QWORD v3[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NCNotificationAppSectionListSummarizedContentView;
  -[NCNotificationAppSectionListSummarizedContentView layoutSubviews](&v4, sel_layoutSubviews);
  -[NCNotificationAppSectionListSummarizedContentView _configureBackgroundViewIfNecessary](self, "_configureBackgroundViewIfNecessary");
  -[NCNotificationAppSectionListSummarizedContentView _configureTapGestureRecognizerIfNecessary](self, "_configureTapGestureRecognizerIfNecessary");
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __67__NCNotificationAppSectionListSummarizedContentView_layoutSubviews__block_invoke;
  v3[3] = &unk_1E8D1B568;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v3);
}

uint64_t __67__NCNotificationAppSectionListSummarizedContentView_layoutSubviews__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_layoutBackgroundView");
  objc_msgSend(*(id *)(a1 + 32), "_layoutCountLabel");
  objc_msgSend(*(id *)(a1 + 32), "_layoutAttachmentImageViews");
  objc_msgSend(*(id *)(a1 + 32), "_layoutTitleLabel");
  return objc_msgSend(*(id *)(a1 + 32), "_layoutTitleAndContentStringLabels");
}

- (void)didMoveToWindow
{
  void *v3;

  -[NCNotificationAppSectionListSummarizedContentView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[NCNotificationListBaseContentView adjustForContentSizeCategoryChange](self, "adjustForContentSizeCategoryChange");
}

- (void)_configureBackgroundViewIfNecessary
{
  UIView *v3;
  void *v4;
  void *v5;
  UIView *backgroundView;

  if (!self->_backgroundView)
  {
    v3 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7D3F0]), "initWithRecipe:", 1);
    -[UIView _setContinuousCornerRadius:](v3, "_setContinuousCornerRadius:", 23.5);
    -[NCNotificationAppSectionListSummarizedContentView delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "backgroundGroupNameBaseForAppSectionListSummarizedContentView:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setMaterialGroupNameBase:](v3, "setMaterialGroupNameBase:", v5);

    -[NCNotificationAppSectionListSummarizedContentView addSubview:](self, "addSubview:", v3);
    backgroundView = self->_backgroundView;
    self->_backgroundView = v3;

  }
}

- (void)_configureTapGestureRecognizerIfNecessary
{
  UITapGestureRecognizer *v3;
  UITapGestureRecognizer *tapGestureRecognizer;

  if (!self->_tapGestureRecognizer)
  {
    v3 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_handleTap_);
    tapGestureRecognizer = self->_tapGestureRecognizer;
    self->_tapGestureRecognizer = v3;

    -[NCNotificationAppSectionListSummarizedContentView addGestureRecognizer:](self, "addGestureRecognizer:", self->_tapGestureRecognizer);
  }
}

- (void)_layoutBackgroundView
{
  UIView *backgroundView;

  backgroundView = self->_backgroundView;
  if (backgroundView)
  {
    -[NCNotificationAppSectionListSummarizedContentView bounds](self, "bounds");
    -[UIView setFrame:](backgroundView, "setFrame:");
    -[NCNotificationAppSectionListSummarizedContentView sendSubviewToBack:](self, "sendSubviewToBack:", self->_backgroundView);
  }
}

- (void)_layoutCountLabel
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  CGRect v14;

  if (self->_countLabel)
  {
    -[NCNotificationAppSectionListSummarizedContentView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[UIView frame](self->_countBackgroundView, "frame");
    -[UILabel sizeThatFits:](self->_countLabel, "sizeThatFits:", v8, v10);
    -[NCNotificationAppSectionListSummarizedContentView _countBackgroundDimensionInRect:](self, "_countBackgroundDimensionInRect:", v4, v6, v8, v10);
    v12 = v11;
    if (-[NCNotificationAppSectionListSummarizedContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    {
      v14.origin.x = v4;
      v14.origin.y = v6;
      v14.size.width = v8;
      v14.size.height = v10;
      CGRectGetWidth(v14);
    }
    UIRectCenteredYInRect();
    UIRectIntegralWithScale();
    -[UIView setFrame:](self->_countBackgroundView, "setFrame:");
    -[UIView layer](self->_countBackgroundView, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCornerRadius:", v12 * 0.5);

    -[UILabel frame](self->_countLabel, "frame");
    UIRectCenteredRect();
    UIRectIntegralWithScale();
    -[UILabel setFrame:](self->_countLabel, "setFrame:");
  }
}

- (void)_layoutAttachmentImageViews
{
  UIView *attachmentImageBoundingView;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  NSUInteger v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  NSArray *attachmentImageViews;
  double v23;
  void *v24;
  id v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  attachmentImageBoundingView = self->_attachmentImageBoundingView;
  if (attachmentImageBoundingView)
  {
    -[UIView frame](attachmentImageBoundingView, "frame");
    -[NCNotificationAppSectionListSummarizedContentView bounds](self, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v12 = -[NSArray count](self->_attachmentImageViews, "count");
    if ((-[NCNotificationAppSectionListSummarizedContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection") & 1) == 0)
    {
      v26.origin.x = v5;
      v26.origin.y = v7;
      v26.size.width = v9;
      v26.size.height = v11;
      CGRectGetWidth(v26);
    }
    v13 = 0.0;
    UIRectIntegralWithScale();
    -[UIView setFrame:](self->_attachmentImageBoundingView, "setFrame:");
    -[UIView bounds](self->_attachmentImageBoundingView, "bounds");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    attachmentImageViews = self->_attachmentImageViews;
    if (v12 == 1)
    {
      -[NSArray firstObject](attachmentImageViews, "firstObject");
      v25 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setFrame:", v15, v17, v19, v21);
    }
    else
    {
      -[NSArray objectAtIndex:](attachmentImageViews, "objectAtIndex:", 0);
      v25 = (id)objc_claimAutoreleasedReturnValue();
      if (-[NCNotificationAppSectionListSummarizedContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
      {
        v27.origin.x = v15;
        v27.origin.y = v17;
        v27.size.width = v19;
        v27.size.height = v21;
        v13 = CGRectGetMaxX(v27) + -44.0;
      }
      v23 = 0.0;
      objc_msgSend(v25, "setFrame:", v13, 0.0, 44.0, 44.0);
      -[NCNotificationAppSectionListSummarizedContentView _configureShadowForAttachmentView:](self, "_configureShadowForAttachmentView:", v25);
      -[NSArray objectAtIndex:](self->_attachmentImageViews, "objectAtIndex:", 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if ((-[NCNotificationAppSectionListSummarizedContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection") & 1) == 0)
      {
        v28.origin.x = v15;
        v28.origin.y = v17;
        v28.size.width = v19;
        v28.size.height = v21;
        v23 = CGRectGetMaxX(v28) + -44.0;
      }
      v29.origin.x = v15;
      v29.origin.y = v17;
      v29.size.width = v19;
      v29.size.height = v21;
      objc_msgSend(v24, "setFrame:", v23, CGRectGetMaxY(v29) + -44.0, 44.0, 44.0);
      -[UIView sendSubviewToBack:](self->_attachmentImageBoundingView, "sendSubviewToBack:", v24);
      -[NCNotificationAppSectionListSummarizedContentView _configureShadowForAttachmentView:](self, "_configureShadowForAttachmentView:", v24);

    }
  }
}

- (void)_layoutTitleLabel
{
  UILabel *titleLabel;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  int v14;
  int *v15;
  CGFloat v16;
  CGRect v17;
  CGRect v18;

  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    -[UILabel frame](titleLabel, "frame");
    -[NCNotificationAppSectionListSummarizedContentView bounds](self, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    -[NCNotificationAppSectionListSummarizedContentView _allowedWidthForTextInRect:](self, "_allowedWidthForTextInRect:");
    v11 = v10;
    -[UILabel unui_measuringHeightWithNumberOfLines:](self->_titleLabel, "unui_measuringHeightWithNumberOfLines:", -[NCNotificationAppSectionListSummarizedContentView _numberOfLinesForTitleTextInFrame:](self, "_numberOfLinesForTitleTextInFrame:", v5, v7, v10, v9));
    v13 = v12;
    v14 = -[NCNotificationAppSectionListSummarizedContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    v15 = &OBJC_IVAR___NCNotificationAppSectionListSummarizedContentView__countBackgroundView;
    if (v14)
      v15 = &OBJC_IVAR___NCNotificationAppSectionListSummarizedContentView__attachmentImageBoundingView;
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *v15), "frame");
    v16 = CGRectGetMaxX(v17) + 12.0;
    -[UILabel unui_drawingHeightWithNumberOfLines:](self->_titleLabel, "unui_drawingHeightWithNumberOfLines:", -[NCNotificationAppSectionListSummarizedContentView _numberOfLinesForTitleTextInFrame:](self, "_numberOfLinesForTitleTextInFrame:", v5, v7, v11, v9));
    v18.origin.y = 10.0;
    v18.origin.x = v16;
    v18.size.width = v11;
    v18.size.height = v13;
    CGRectGetWidth(v18);
    BSRectWithSize();
    UIRectCenteredIntegralRectScale();
    -[UILabel setFrame:](self->_titleLabel, "setFrame:");
  }
}

- (void)_layoutTitleAndContentStringLabels
{
  UILabel *titleLabel;
  double v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int *v14;
  CGFloat MaxX;
  NSArray *titleAndContentStringLabels;
  _QWORD v17[12];
  _QWORD v18[3];
  double v19;
  CGRect v20;
  CGRect v21;

  if (-[NSArray count](self->_titleAndContentStringLabels, "count"))
  {
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x2020000000;
    v19 = 0.0;
    titleLabel = self->_titleLabel;
    if (titleLabel)
    {
      -[UILabel frame](titleLabel, "frame");
      v4 = CGRectGetMaxY(v20) + 1.0;
    }
    else
    {
      v4 = 10.0;
    }
    v19 = v4;
    -[NCNotificationAppSectionListSummarizedContentView bounds](self, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[NCNotificationAppSectionListSummarizedContentView _allowedWidthForTextInRect:](self, "_allowedWidthForTextInRect:");
    v12 = v11;
    v13 = -[NCNotificationAppSectionListSummarizedContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    v14 = &OBJC_IVAR___NCNotificationAppSectionListSummarizedContentView__countBackgroundView;
    if (v13)
      v14 = &OBJC_IVAR___NCNotificationAppSectionListSummarizedContentView__attachmentImageBoundingView;
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *v14), "frame");
    MaxX = CGRectGetMaxX(v21);
    titleAndContentStringLabels = self->_titleAndContentStringLabels;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __87__NCNotificationAppSectionListSummarizedContentView__layoutTitleAndContentStringLabels__block_invoke;
    v17[3] = &unk_1E8D1D6F0;
    v17[6] = v6;
    v17[7] = v8;
    v17[8] = v12;
    v17[9] = v10;
    v17[4] = self;
    v17[5] = v18;
    v17[10] = v12;
    *(double *)&v17[11] = MaxX + 12.0;
    -[NSArray enumerateObjectsUsingBlock:](titleAndContentStringLabels, "enumerateObjectsUsingBlock:", v17);
    _Block_object_dispose(v18, 8);
  }
}

void __87__NCNotificationAppSectionListSummarizedContentView__layoutTitleAndContentStringLabels__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  CGFloat v5;
  double v6;
  double v7;
  CGFloat v8;
  int v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  void *v19;
  void *v20;
  double Width;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGFloat v31;
  double v32;
  uint64_t v33;
  CGFloat rect;
  CGFloat v35;
  CGFloat v36;
  id v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  v3 = a2;
  objc_msgSend(v3, "objectAtIndex:", 0);
  v37 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "frame");
  objc_msgSend(v37, "unui_measuringHeightWithNumberOfLines:", objc_msgSend(*(id *)(a1 + 32), "_numberOfLinesForContentTextInFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72)));
  v5 = v4;
  objc_msgSend(v37, "sizeThatFits:", *(double *)(a1 + 64), *(double *)(a1 + 72));
  if (v6 >= *(double *)(a1 + 80))
    v7 = *(double *)(a1 + 80);
  else
    v7 = v6;
  v8 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v9 = objc_msgSend(*(id *)(a1 + 32), "_shouldReverseLayoutDirection");
  v10 = *(double *)(a1 + 88);
  if (v9)
    v10 = v10 + *(double *)(a1 + 80) - v7;
  objc_msgSend(v37, "unui_drawingHeightWithNumberOfLines:", objc_msgSend(*(id *)(a1 + 32), "_numberOfLinesForContentTextInFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72)));
  v38.origin.x = v10;
  v38.origin.y = v8;
  v38.size.width = v7;
  v38.size.height = v5;
  CGRectGetWidth(v38);
  BSRectWithSize();
  UIRectCenteredIntegralRectScale();
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(v37, "setFrame:", 0);
  objc_msgSend(v3, "objectAtIndex:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "frame");
  objc_msgSend(*(id *)(a1 + 32), "preferredContentSizeCategory");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v20))
  {
    v39.origin.x = v12;
    v39.origin.y = v14;
    v39.size.width = v16;
    v39.size.height = v18;
    Width = CGRectGetWidth(v39);

    if (Width > 0.0)
    {
      v22 = *MEMORY[0x1E0C9D648];
      v23 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v24 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v25 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      goto LABEL_14;
    }
  }
  else
  {

  }
  rect = v16;
  v35 = v14;
  v36 = v12;
  v26 = *(double *)(a1 + 72);
  v27 = fmax(*(double *)(a1 + 80) - v7 + -2.0, 0.0);
  v29 = *(double *)(a1 + 48);
  v28 = *(double *)(a1 + 56);
  objc_msgSend(v19, "unui_measuringHeightWithNumberOfLines:", objc_msgSend(*(id *)(a1 + 32), "_numberOfLinesForContentTextInFrame:", v29, v28, v27, v26));
  v31 = v30;
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldReverseLayoutDirection"))
  {
    v32 = *(double *)(a1 + 88);
  }
  else
  {
    v40.origin.y = v35;
    v40.origin.x = v36;
    v40.size.width = rect;
    v40.size.height = v18;
    v32 = CGRectGetMaxX(v40) + 2.0;
  }
  objc_msgSend(v19, "unui_drawingHeightWithNumberOfLines:", objc_msgSend(*(id *)(a1 + 32), "_numberOfLinesForContentTextInFrame:", v29, v28, v27, v26));
  v41.origin.x = v32;
  v41.origin.y = v8;
  v41.size.width = v27;
  v41.size.height = v31;
  CGRectGetWidth(v41);
  BSRectWithSize();
  v33 = 0;
  UIRectCenteredIntegralRectScale();
  v14 = v35;
  v12 = v36;
  v16 = rect;
LABEL_14:
  objc_msgSend(v19, "setFrame:", v22, v23, v24, v25, v33);
  v42.origin.x = v12;
  v42.origin.y = v14;
  v42.size.width = v16;
  v42.size.height = v18;
  *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CGRectGetMaxY(v42) + 0.0;

}

- (void)_visualStylingProviderDidChange:(id)a3 forCategory:(int64_t)a4 outgoingProvider:(id)a5
{
  id v7;
  id v8;
  NSArray *titleAndContentStringLabels;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v7 = a3;
  v8 = a5;
  -[NCNotificationListBaseContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_titleLabel, 0, v7, v8);
  titleAndContentStringLabels = self->_titleAndContentStringLabels;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __114__NCNotificationAppSectionListSummarizedContentView__visualStylingProviderDidChange_forCategory_outgoingProvider___block_invoke;
  v12[3] = &unk_1E8D1D740;
  v12[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  -[NSArray enumerateObjectsUsingBlock:](titleAndContentStringLabels, "enumerateObjectsUsingBlock:", v12);

}

void __114__NCNotificationAppSectionListSummarizedContentView__visualStylingProviderDidChange_forCategory_outgoingProvider___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __114__NCNotificationAppSectionListSummarizedContentView__visualStylingProviderDidChange_forCategory_outgoingProvider___block_invoke_2;
  v5[3] = &unk_1E8D1D718;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(a2, "enumerateObjectsUsingBlock:", v5);

}

uint64_t __114__NCNotificationAppSectionListSummarizedContentView__visualStylingProviderDidChange_forCategory_outgoingProvider___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", a2, 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_updateTextAttributes
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NCNotificationAppSectionListSummarizedContentView;
  -[NCNotificationListBaseContentView _updateTextAttributes](&v3, sel__updateTextAttributes);
  -[NCNotificationAppSectionListSummarizedContentView _updateTextAttributesForCountLabel](self, "_updateTextAttributesForCountLabel");
  -[NCNotificationAppSectionListSummarizedContentView _updateTextAttributesForTitleLabel](self, "_updateTextAttributesForTitleLabel");
  -[NCNotificationAppSectionListSummarizedContentView _updateTextAttributesForTitleAndContentStringLabels](self, "_updateTextAttributesForTitleAndContentStringLabels");
}

- (void)_updateTextAttributesForCountLabel
{
  NSString *v3;
  _BOOL4 IsAccessibilityCategory;
  id *v5;
  id v6;

  if (self->_countLabel)
  {
    -[NCNotificationListBaseContentView preferredContentSizeCategory](self, "preferredContentSizeCategory");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);
    v5 = (id *)MEMORY[0x1E0DC4A88];
    if (!IsAccessibilityCategory)
      v5 = (id *)MEMORY[0x1E0DC4B10];
    v6 = *v5;

    -[NCNotificationListBaseContentView _updateTextAttributesForLabel:withTextStyle:fontWeight:additionalTraits:maximumNumberOfLines:](self, "_updateTextAttributesForLabel:withTextStyle:fontWeight:additionalTraits:maximumNumberOfLines:", self->_countLabel, v6, 0, 1, *MEMORY[0x1E0DC1448]);
    -[NCNotificationAppSectionListSummarizedContentView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateTextAttributesForTitleLabel
{
  NSString *v3;
  _BOOL4 IsAccessibilityCategory;
  id *v5;
  id v6;

  if (self->_titleLabel)
  {
    -[NCNotificationListBaseContentView preferredContentSizeCategory](self, "preferredContentSizeCategory");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);
    v5 = (id *)MEMORY[0x1E0DC4A88];
    if (!IsAccessibilityCategory)
      v5 = (id *)MEMORY[0x1E0DC4B10];
    v6 = *v5;

    -[NCNotificationListBaseContentView _updateTextAttributesForLabel:withTextStyle:fontWeight:additionalTraits:maximumNumberOfLines:](self, "_updateTextAttributesForLabel:withTextStyle:fontWeight:additionalTraits:maximumNumberOfLines:", self->_titleLabel, v6, 0, -[NCNotificationAppSectionListSummarizedContentView _maximumNumberOfLinesForTitleText](self, "_maximumNumberOfLinesForTitleText"), *MEMORY[0x1E0DC1448]);
    -[NCNotificationAppSectionListSummarizedContentView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateTextAttributesForTitleAndContentStringLabels
{
  NSString *v3;
  _BOOL4 IsAccessibilityCategory;
  id *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSArray *titleAndContentStringLabels;
  id v10;
  _QWORD v11[5];
  id v12;
  uint64_t v13;
  uint64_t v14;

  if (-[NSArray count](self->_titleAndContentStringLabels, "count"))
  {
    -[NCNotificationListBaseContentView preferredContentSizeCategory](self, "preferredContentSizeCategory");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);
    v5 = (id *)MEMORY[0x1E0DC4A88];
    if (!IsAccessibilityCategory)
      v5 = (id *)MEMORY[0x1E0DC4AB8];
    v6 = *v5;

    v7 = *MEMORY[0x1E0DC1448];
    v8 = *MEMORY[0x1E0DC1440];
    titleAndContentStringLabels = self->_titleAndContentStringLabels;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __104__NCNotificationAppSectionListSummarizedContentView__updateTextAttributesForTitleAndContentStringLabels__block_invoke;
    v11[3] = &unk_1E8D1D768;
    v11[4] = self;
    v12 = v6;
    v13 = v7;
    v14 = v8;
    v10 = v6;
    -[NSArray enumerateObjectsUsingBlock:](titleAndContentStringLabels, "enumerateObjectsUsingBlock:", v11);
    -[NCNotificationAppSectionListSummarizedContentView setNeedsLayout](self, "setNeedsLayout");

  }
}

void __104__NCNotificationAppSectionListSummarizedContentView__updateTextAttributesForTitleAndContentStringLabels__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "objectAtIndex:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_updateTextAttributesForLabel:withTextStyle:fontWeight:additionalTraits:maximumNumberOfLines:", v5, *(_QWORD *)(a1 + 40), 0, objc_msgSend(*(id *)(a1 + 32), "_maximumNumberOfLinesForContentText"), *(double *)(a1 + 48));
  objc_msgSend(v3, "objectAtIndex:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_updateTextAttributesForLabel:withTextStyle:fontWeight:additionalTraits:maximumNumberOfLines:", v4, *(_QWORD *)(a1 + 40), 0, objc_msgSend(*(id *)(a1 + 32), "_maximumNumberOfLinesForContentText"), *(double *)(a1 + 56));
}

- (unint64_t)_maximumNumberOfLinesForTitleText
{
  NSString *v2;
  unint64_t v3;

  -[NCNotificationListBaseContentView preferredContentSizeCategory](self, "preferredContentSizeCategory");
  v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  v3 = !UIContentSizeCategoryIsAccessibilityCategory(v2);

  return v3;
}

- (unint64_t)_maximumNumberOfLinesForContentText
{
  NSString *v2;
  unint64_t v3;

  -[NCNotificationListBaseContentView preferredContentSizeCategory](self, "preferredContentSizeCategory");
  v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (UIContentSizeCategoryIsAccessibilityCategory(v2))
    v3 = 2;
  else
    v3 = 1;

  return v3;
}

- (unint64_t)_numberOfLinesForTitleTextInFrame:(CGRect)a3
{
  return -[NCNotificationListBaseContentView _numberOfLinesForLabel:maximumNumberOfLines:inFrame:](self, "_numberOfLinesForLabel:maximumNumberOfLines:inFrame:", self->_titleLabel, -[NCNotificationAppSectionListSummarizedContentView _maximumNumberOfLinesForTitleText](self, "_maximumNumberOfLinesForTitleText"), a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (unint64_t)_numberOfLinesForContentTextInFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  unint64_t v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[NSArray firstObject](self->_titleAndContentStringLabels, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[NCNotificationListBaseContentView _numberOfLinesForLabel:maximumNumberOfLines:inFrame:](self, "_numberOfLinesForLabel:maximumNumberOfLines:inFrame:", v9, -[NCNotificationAppSectionListSummarizedContentView _maximumNumberOfLinesForContentText](self, "_maximumNumberOfLinesForContentText"), x, y, width, height);
  return v10;
}

- (void)handleTap:(id)a3
{
  id v4;

  -[NCNotificationAppSectionListSummarizedContentView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appSectionListSummarizedContentViewDidRecognizeTapGesture:", self);

}

- (id)_newContentStringLabelForText:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(v5, "_setTextAlignmentFollowsWritingDirection:", 1);
  objc_msgSend(v5, "setLineBreakMode:", 4);
  -[NCNotificationAppSectionListSummarizedContentView addSubview:](self, "addSubview:", v5);
  -[NCNotificationListBaseContentView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationListBaseContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", v5, 0, v6, 0);
  if (v6)
    objc_msgSend(v6, "automaticallyUpdateView:withStyle:", v5, 0);
  objc_msgSend(v5, "setText:", v4);

  return v5;
}

- (void)_configureShadowForAttachmentView:(id)a3
{
  double v3;
  id v4;

  objc_msgSend(a3, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShadowColor:", CGColorGetConstantColor((CFStringRef)*MEMORY[0x1E0C9D8E0]));
  objc_msgSend(v4, "setShadowRadius:", 5.0);
  LODWORD(v3) = 1050253722;
  objc_msgSend(v4, "setShadowOpacity:", v3);
  objc_msgSend(v4, "setShadowOffset:", 2.0, 3.0);

}

- (double)_countBackgroundDimensionInRect:(CGRect)a3
{
  double v3;
  double v4;
  double result;

  -[UILabel sizeThatFits:](self->_countLabel, "sizeThatFits:", a3.size.width, a3.size.height);
  if (v3 < v4)
    v3 = v4;
  result = v3 + 10.0;
  if (result < 40.0)
    return 40.0;
  return result;
}

- (double)_allowedWidthForTextInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  UIView *attachmentImageBoundingView;
  double v11;
  CGRect v13;
  CGRect v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (self->_countBackgroundView)
  {
    -[NCNotificationAppSectionListSummarizedContentView _countBackgroundDimensionInRect:](self, "_countBackgroundDimensionInRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    v9 = v8 + 12.0 + 12.0;
  }
  else
  {
    v9 = 12.0;
  }
  attachmentImageBoundingView = self->_attachmentImageBoundingView;
  if (attachmentImageBoundingView)
  {
    -[UIView frame](attachmentImageBoundingView, "frame");
    v11 = CGRectGetWidth(v13) + 12.0 + 15.0;
  }
  else
  {
    v11 = 15.0;
  }
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  return CGRectGetWidth(v14) - v9 - v11;
}

- (unint64_t)count
{
  return self->_count;
}

- (NSArray)titleAndContentStrings
{
  return self->_titleAndContentStrings;
}

- (NSArray)attachmentImageViews
{
  return self->_attachmentImageViews;
}

- (NCNotificationAppSectionListSummarizedContentViewDelegate)delegate
{
  return (NCNotificationAppSectionListSummarizedContentViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_titleAndContentStrings, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_attachmentImageViews, 0);
  objc_storeStrong((id *)&self->_attachmentImageBoundingView, 0);
  objc_storeStrong((id *)&self->_titleAndContentStringLabels, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_countBackgroundView, 0);
  objc_storeStrong((id *)&self->_countLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
