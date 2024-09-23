@implementation PXMessagesStackAdditionalItemsView

- (PXMessagesStackAdditionalItemsView)initWithFrame:(CGRect)a3
{
  PXMessagesStackAdditionalItemsView *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  UIVisualEffectView *visualEffectView;
  id v8;
  uint64_t v9;
  UILabel *label;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PXMessagesStackAdditionalItemsView;
  v3 = -[PXMessagesStackAdditionalItemsView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXMessagesStackAdditionalItemsView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[PXMessagesStackAdditionalItemsView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v5);
    visualEffectView = v3->_visualEffectView;
    v3->_visualEffectView = (UIVisualEffectView *)v6;

    -[UIVisualEffectView setUserInteractionEnabled:](v3->_visualEffectView, "setUserInteractionEnabled:", 0);
    -[PXMessagesStackAdditionalItemsView addSubview:](v3, "addSubview:", v3->_visualEffectView);
    v8 = objc_alloc(MEMORY[0x1E0DC3990]);
    v9 = objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    label = v3->_label;
    v3->_label = (UILabel *)v9;

    -[UILabel setNumberOfLines:](v3->_label, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_label, "setTextColor:", v11);

    -[UILabel setText:](v3->_label, "setText:", &stru_1E5149688);
    PXCappedFontWithTextStyleAndWeight();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_label, "setFont:", v12);

    -[UILabel setAdjustsFontForContentSizeCategory:](v3->_label, "setAdjustsFontForContentSizeCategory:", 1);
    -[PXMessagesStackAdditionalItemsView addSubview:](v3, "addSubview:", v3->_label);

  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGRect v12;
  CGRect v13;

  v11.receiver = self;
  v11.super_class = (Class)PXMessagesStackAdditionalItemsView;
  -[PXMessagesStackAdditionalItemsView layoutSubviews](&v11, sel_layoutSubviews);
  -[PXMessagesStackAdditionalItemsView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIVisualEffectView setFrame:](self->_visualEffectView, "setFrame:");
  v12.origin.x = v4;
  v12.origin.y = v6;
  v12.size.width = v8;
  v12.size.height = v10;
  v13 = CGRectInset(v12, v8 * -0.05, v10 * -0.05);
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", v13.size.width, v13.size.height);
  PXRectGetCenter();
  PXRectWithCenterAndSize();
  -[UILabel setFrame:](self->_label, "setFrame:");
}

- (id)_localizedTitleForAdditionalItemsCount:(id)a3
{
  void *v3;
  void *v4;
  __CFString *v5;

  if (a3.var0)
  {
    PXLocalizationKeyForMediaType(a3.var1, CFSTR("PXMessagesStackAdditionalNumberOfPhotosTitle"), CFSTR("PXMessagesStackAdditionalNumberOfVideosTitle "), CFSTR("PXMessagesStackAdditionalNumberOfItemsTitle"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedStringFromTable(v3, CFSTR("PhotosUICore"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedStringWithValidatedFormat(v4, CFSTR("%lu"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = &stru_1E5149688;
  }
  return v5;
}

- (void)setUserData:(id)a3
{
  id v4;
  PXMessagesStackAdditionalItemsViewUserData *v5;
  PXMessagesStackAdditionalItemsViewUserData *userData;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  if (self->_userData != a3)
  {
    v4 = a3;
    v5 = (PXMessagesStackAdditionalItemsViewUserData *)objc_msgSend(v4, "copy");
    userData = self->_userData;
    self->_userData = v5;

    v7 = objc_msgSend(v4, "additionalItemsCount");
    v9 = v8;

    -[PXMessagesStackAdditionalItemsView _localizedTitleForAdditionalItemsCount:](self, "_localizedTitleForAdditionalItemsCount:", v7, v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_label, "setText:", v10);
    -[PXMessagesStackAdditionalItemsView setNeedsLayout](self, "setNeedsLayout");

  }
}

- (void)becomeReusable
{
  -[UILabel setText:](self->_label, "setText:", &stru_1E5149688);
}

- (CGRect)clippingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->clippingRect.origin.x;
  y = self->clippingRect.origin.y;
  width = self->clippingRect.size.width;
  height = self->clippingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setClippingRect:(CGRect)a3
{
  self->clippingRect = a3;
}

- (PXMessagesStackAdditionalItemsViewUserData)userData
{
  return self->_userData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userData, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
}

@end
