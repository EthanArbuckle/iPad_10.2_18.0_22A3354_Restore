@implementation PXProtoFeatureLoadingPlaceholderView

- (PXProtoFeatureLoadingPlaceholderView)initWithFrame:(CGRect)a3
{
  PXProtoFeatureLoadingPlaceholderView *v3;
  uint64_t v4;
  UIActivityIndicatorView *spinner;
  UILabel *v6;
  UILabel *label;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PXProtoFeatureLoadingPlaceholderView;
  v3 = -[PXProtoFeaturePlaceholderView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    spinner = v3->_spinner;
    v3->_spinner = (UIActivityIndicatorView *)v4;

    -[UIActivityIndicatorView startAnimating](v3->_spinner, "startAnimating");
    -[PXProtoFeatureLoadingPlaceholderView addSubview:](v3, "addSubview:", v3->_spinner);
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    label = v3->_label;
    v3->_label = v6;

    -[UILabel setTextAlignment:](v3->_label, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.200000003);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_label, "setTextColor:", v8);

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_label, "setFont:", v9);

    -[PXProtoFeatureLoadingPlaceholderView addSubview:](v3, "addSubview:", v3->_label);
    -[PXProtoFeatureLoadingPlaceholderView _updateLabelText](v3, "_updateLabelText");
  }
  return v3;
}

- (BOOL)wantsContentView
{
  return 0;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[UIActivityIndicatorView intrinsicContentSize](self->_spinner, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;
  -[PXProtoFeaturePlaceholderView preferredStatusWidth](self, "preferredStatusWidth");
  if (v4 < v7)
    v4 = v7;
  -[UILabel intrinsicContentSize](self->_label, "intrinsicContentSize");
  v9 = v6 + (v8 + 5.0) * 2.0;
  v10 = v4;
  result.height = v9;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double Width;
  double MinX;
  objc_super v7;
  CGRect v8;
  CGRect v9;
  CGRect v10;

  v7.receiver = self;
  v7.super_class = (Class)PXProtoFeatureLoadingPlaceholderView;
  -[PXProtoFeatureView layoutSubviews](&v7, sel_layoutSubviews);
  -[PXProtoFeatureLoadingPlaceholderView bounds](self, "bounds");
  PXRectGetCenter();
  -[UIActivityIndicatorView setCenter:](self->_spinner, "setCenter:");
  -[UILabel frame](self->_label, "frame");
  -[UILabel intrinsicContentSize](self->_label, "intrinsicContentSize");
  v4 = v3;
  -[PXProtoFeatureLoadingPlaceholderView bounds](self, "bounds");
  Width = CGRectGetWidth(v8);
  -[PXProtoFeatureLoadingPlaceholderView bounds](self, "bounds");
  MinX = CGRectGetMinX(v9);
  -[PXProtoFeatureLoadingPlaceholderView bounds](self, "bounds");
  -[UILabel setFrame:](self->_label, "setFrame:", MinX, CGRectGetMaxY(v10) - v4, Width, v4);
}

- (void)statusDescriptionDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXProtoFeatureLoadingPlaceholderView;
  -[PXProtoFeaturePlaceholderView statusDescriptionDidChange](&v3, sel_statusDescriptionDidChange);
  -[PXProtoFeatureLoadingPlaceholderView _updateLabelText](self, "_updateLabelText");
}

- (void)_updateLabelText
{
  uint64_t v3;
  const __CFString *v4;
  id v5;

  -[PXProtoFeaturePlaceholderView statusDescription](self, "statusDescription");
  v3 = objc_claimAutoreleasedReturnValue();
  v5 = (id)v3;
  if (v3)
    v4 = (const __CFString *)v3;
  else
    v4 = &stru_1E5149688;
  -[UILabel setText:](self->_label, "setText:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
}

@end
