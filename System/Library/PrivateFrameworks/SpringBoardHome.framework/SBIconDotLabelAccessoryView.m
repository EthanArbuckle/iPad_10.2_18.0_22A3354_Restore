@implementation SBIconDotLabelAccessoryView

+ (id)labelAccessorySystemImageName
{
  return CFSTR("circle.fill");
}

+ (id)_dotColor
{
  return 0;
}

+ (CAColorMatrix)_vibrantColorMatrixInput
{
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var16 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  return result;
}

+ (id)_cachedDotImage
{
  return 0;
}

- (void)updateWithLegibilitySettings:(id)a3 labelFont:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  objc_msgSend((id)objc_opt_class(), "_cachedDotImage");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend((id)objc_opt_class(), "labelAccessorySystemImageName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "systemImageNamed:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBIconDotLabelAccessoryView intrinsicContentSize](self, "intrinsicContentSize");
    objc_msgSend(v8, "sbf_resizeImageToSize:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_dotColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_flatImageWithColor:", v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "_setCachedDotImage:", v11);
    v5 = (uint64_t)v11;
  }
  v12 = (id)v5;
  -[UIImageView setImage:](self->_imageView, "setImage:", v5);
  -[UIImageView sizeToFit](self->_imageView, "sizeToFit");

}

- (SBIconDotLabelAccessoryView)initWithFrame:(CGRect)a3
{
  SBIconDotLabelAccessoryView *v3;
  SBIconDotLabelAccessoryView *v4;
  void *v5;
  UIImageView *v6;
  UIImageView *imageView;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15[5];
  objc_super v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)SBIconDotLabelAccessoryView;
  v3 = -[SBIconDotLabelAccessoryView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SBIconDotLabelAccessoryView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsGroupBlending:", 0);

    v6 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    imageView = v4->_imageView;
    v4->_imageView = v6;

    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2F08]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB3B18];
    v10 = (void *)objc_opt_class();
    if (v10)
      objc_msgSend(v10, "_vibrantColorMatrixInput");
    else
      memset(v15, 0, sizeof(v15));
    objc_msgSend(v9, "valueWithCAColorMatrix:", v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:forKey:", v11, CFSTR("inputColorMatrix"));

    -[UIImageView layer](v4->_imageView, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFilters:", v13);

    -[SBIconDotLabelAccessoryView addSubview:](v4, "addSubview:", v4->_imageView);
  }
  return v4;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 8.0;
  v3 = 8.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)firstBaselineAnchor
{
  return (id)-[UIImageView firstBaselineAnchor](self->_imageView, "firstBaselineAnchor");
}

- (id)lastBaselineAnchor
{
  return (id)-[UIImageView lastBaselineAnchor](self->_imageView, "lastBaselineAnchor");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
