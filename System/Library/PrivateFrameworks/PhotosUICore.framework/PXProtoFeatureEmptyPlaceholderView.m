@implementation PXProtoFeatureEmptyPlaceholderView

- (PXProtoFeatureEmptyPlaceholderView)initWithFrame:(CGRect)a3
{
  PXProtoFeatureEmptyPlaceholderView *v3;
  id v4;
  uint64_t v5;
  UILabel *label;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXProtoFeatureEmptyPlaceholderView;
  v3 = -[PXProtoFeaturePlaceholderView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3990]);
    -[PXProtoFeatureEmptyPlaceholderView bounds](v3, "bounds");
    v5 = objc_msgSend(v4, "initWithFrame:");
    label = v3->_label;
    v3->_label = (UILabel *)v5;

    -[UILabel setTextAlignment:](v3->_label, "setTextAlignment:", 1);
    -[UILabel setAutoresizingMask:](v3->_label, "setAutoresizingMask:", 18);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.200000003);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_label, "setTextColor:", v7);

    -[PXProtoFeatureEmptyPlaceholderView addSubview:](v3, "addSubview:", v3->_label);
    -[PXProtoFeatureEmptyPlaceholderView _updateLabelText](v3, "_updateLabelText");
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
  CGSize result;

  -[UILabel intrinsicContentSize](self->_label, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;
  -[PXProtoFeaturePlaceholderView preferredStatusWidth](self, "preferredStatusWidth");
  if (v4 >= v7)
    v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)statusDescriptionDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXProtoFeatureEmptyPlaceholderView;
  -[PXProtoFeaturePlaceholderView statusDescriptionDidChange](&v3, sel_statusDescriptionDidChange);
  -[PXProtoFeatureEmptyPlaceholderView _updateLabelText](self, "_updateLabelText");
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
    v4 = CFSTR("No More Relevant Suggestion");
  -[UILabel setText:](self->_label, "setText:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
