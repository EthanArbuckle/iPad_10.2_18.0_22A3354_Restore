@implementation PXCMMFeedItemBadgeView

- (PXCMMFeedItemBadgeView)init
{
  PXCMMFeedItemBadgeView *v2;
  uint64_t v3;
  PXCMMFeedItemBadgeViewConfiguration *configuration;
  id v5;
  uint64_t v6;
  UIVisualEffectView *backgroundEffectView;
  void *v8;
  UILabel *v9;
  UILabel *titleLabel;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  UIVisualEffectView *labelVibrancyEffectView;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)PXCMMFeedItemBadgeView;
  v2 = -[PXCMMFeedItemBadgeView init](&v20, sel_init);
  if (v2)
  {
    +[PXCMMFeedItemBadgeViewConfiguration _emptyConfiguration](PXCMMFeedItemBadgeViewConfiguration, "_emptyConfiguration");
    v3 = objc_claimAutoreleasedReturnValue();
    configuration = v2->_configuration;
    v2->_configuration = (PXCMMFeedItemBadgeViewConfiguration *)v3;

    v5 = objc_alloc(MEMORY[0x1E0DC3F58]);
    -[PXCMMFeedItemBadgeView bounds](v2, "bounds");
    v6 = objc_msgSend(v5, "initWithFrame:");
    backgroundEffectView = v2->_backgroundEffectView;
    v2->_backgroundEffectView = (UIVisualEffectView *)v6;

    -[UIVisualEffectView setAutoresizingMask:](v2->_backgroundEffectView, "setAutoresizingMask:", 18);
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView setEffect:](v2->_backgroundEffectView, "setEffect:", v8);
    -[UIVisualEffectView _setCornerRadius:continuous:maskedCorners:](v2->_backgroundEffectView, "_setCornerRadius:continuous:maskedCorners:", 1, 15, 4.0);
    -[PXCMMFeedItemBadgeView addSubview:](v2, "addSubview:", v2->_backgroundEffectView);
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v2->_titleLabel;
    v2->_titleLabel = v9;

    objc_msgSend((id)objc_opt_class(), "_titleFont");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v2->_titleLabel, "setFont:", v11);

    v12 = objc_alloc(MEMORY[0x1E0DC3F58]);
    objc_msgSend(MEMORY[0x1E0DC3F08], "effectForBlurEffect:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "initWithEffect:", v13);
    labelVibrancyEffectView = v2->_labelVibrancyEffectView;
    v2->_labelVibrancyEffectView = (UIVisualEffectView *)v14;

    -[UIVisualEffectView setAutoresizingMask:](v2->_labelVibrancyEffectView, "setAutoresizingMask:", 18);
    -[UIVisualEffectView contentView](v2->_labelVibrancyEffectView, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v2->_titleLabel);

    -[UIVisualEffectView contentView](v2->_backgroundEffectView, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", v2->_labelVibrancyEffectView);

    -[UIVisualEffectView superview](v2->_labelVibrancyEffectView, "superview");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bounds");
    -[UIVisualEffectView setFrame:](v2->_labelVibrancyEffectView, "setFrame:");

  }
  return v2;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PXCMMFeedItemBadgeView _performLayoutInWidth:updateSubviewFrames:](self, "_performLayoutInWidth:updateSubviewFrames:", 0, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXCMMFeedItemBadgeView;
  -[PXCMMFeedItemBadgeView layoutSubviews](&v4, sel_layoutSubviews);
  -[PXCMMFeedItemBadgeView bounds](self, "bounds");
  -[PXCMMFeedItemBadgeView _performLayoutInWidth:updateSubviewFrames:](self, "_performLayoutInWidth:updateSubviewFrames:", 1, v3);
}

- (CGSize)_performLayoutInWidth:(double)a3 updateSubviewFrames:(BOOL)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", a3, 1.79769313e308);
  v8 = v6;
  v9 = v7;
  if (a4)
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", 4.0, 2.0, v6, v7);
  v10 = v8 + 4.0 + 4.0;
  v11 = v9 + 2.0 + 2.0;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)setUserData:(id)a3
{
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "px_descriptionForAssertionMessage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMFeedItemBadgeView.m"), 202, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("userData"), v8, v9);

    }
    -[PXCMMFeedItemBadgeView setConfiguration:](self, "setConfiguration:", v10);
  }
  else
  {
    +[PXCMMFeedItemBadgeViewConfiguration _emptyConfiguration](PXCMMFeedItemBadgeViewConfiguration, "_emptyConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCMMFeedItemBadgeView setConfiguration:](self, "setConfiguration:", v5);

  }
}

- (void)setConfiguration:(id)a3
{
  PXCMMFeedItemBadgeViewConfiguration *v4;
  void *v5;
  PXCMMFeedItemBadgeViewConfiguration *v6;
  BOOL v7;
  PXCMMFeedItemBadgeViewConfiguration *v8;
  PXCMMFeedItemBadgeViewConfiguration *configuration;
  PXCMMFeedItemBadgeViewConfiguration *v10;

  v10 = (PXCMMFeedItemBadgeViewConfiguration *)a3;
  v4 = self->_configuration;
  v5 = v10;
  if (v4 == v10)
    goto LABEL_4;
  v6 = v4;
  v7 = -[PXCMMFeedItemBadgeViewConfiguration isEqual:](v4, "isEqual:", v10);

  if (!v7)
  {
    v8 = (PXCMMFeedItemBadgeViewConfiguration *)-[PXCMMFeedItemBadgeViewConfiguration copy](v10, "copy");
    configuration = self->_configuration;
    self->_configuration = v8;

    -[PXCMMFeedItemBadgeViewConfiguration title](self->_configuration, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_titleLabel, "setText:", v5);
LABEL_4:

  }
}

- (NSCopying)userData
{
  return self->_userData;
}

- (CGRect)clippingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_clippingRect.origin.x;
  y = self->_clippingRect.origin.y;
  width = self->_clippingRect.size.width;
  height = self->_clippingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setClippingRect:(CGRect)a3
{
  self->_clippingRect = a3;
}

- (PXCMMFeedItemBadgeViewConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_userData, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_labelVibrancyEffectView, 0);
  objc_storeStrong((id *)&self->_backgroundEffectView, 0);
}

+ (CGSize)sizeThatFits:(CGSize)a3 configuration:(id)a4
{
  double width;
  uint64_t v5;
  id v6;
  double v7;
  double v8;
  CGSize result;

  width = a3.width;
  v5 = sizeThatFits_configuration__predicate;
  v6 = a4;
  if (v5 != -1)
    dispatch_once(&sizeThatFits_configuration__predicate, &__block_literal_global_199);
  objc_msgSend((id)sizeThatFits_configuration___measureBadgeView, "setConfiguration:", v6);

  objc_msgSend((id)sizeThatFits_configuration___measureBadgeView, "_performLayoutInWidth:updateSubviewFrames:", 0, width);
  result.height = v8;
  result.width = v7;
  return result;
}

+ (id)_titleFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "px_defaultFontForTextStyle:withSymbolicTraits:", *MEMORY[0x1E0DC4A98], 32770);
}

void __53__PXCMMFeedItemBadgeView_sizeThatFits_configuration___block_invoke()
{
  PXCMMFeedItemBadgeView *v0;
  void *v1;

  v0 = objc_alloc_init(PXCMMFeedItemBadgeView);
  v1 = (void *)sizeThatFits_configuration___measureBadgeView;
  sizeThatFits_configuration___measureBadgeView = (uint64_t)v0;

}

@end
