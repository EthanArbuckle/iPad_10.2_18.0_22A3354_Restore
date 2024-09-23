@implementation PKConnectedCircleCheckmarkView

- (PKConnectedCircleCheckmarkView)init
{

  return 0;
}

- (PKConnectedCircleCheckmarkView)initWithCheckmarkTintColor:(id)a3 checkmarkBackgroundColor:(id)a4
{
  id v7;
  id v8;
  PKConnectedCircleCheckmarkView *v9;
  PKConnectedCircleCheckmarkView *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  UIImageView *imageView;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = -[PKConnectedCircleCheckmarkView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_checkmarkTintColor, a3);
    objc_storeStrong((id *)&v10->_checkmarkBackgroundColor, a4);
    v11 = (void *)MEMORY[0x1E0DC3888];
    v23[0] = v10->_checkmarkTintColor;
    v23[1] = v10->_checkmarkBackgroundColor;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "configurationWithPaletteColors:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0DC3888];
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4B58], (NSString *)*MEMORY[0x1E0DC4918]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "configurationWithFont:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "configurationByApplyingConfiguration:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checkmark.circle.fill"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "imageWithConfiguration:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v19);
    imageView = v10->_imageView;
    v10->_imageView = (UIImageView *)v20;

    -[PKConnectedCircleCheckmarkView addSubview:](v10, "addSubview:", v10->_imageView);
  }

  return v10;
}

- (void)setBackgroundColor:(id)a3
{
  -[UIImageView setBackgroundColor:](self->_imageView, "setBackgroundColor:", a3);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKConnectedCircleCheckmarkView;
  -[PKConnectedCircleCheckmarkView layoutSubviews](&v3, sel_layoutSubviews);
  -[PKConnectedCircleCheckmarkView bounds](self, "bounds");
  -[PKConnectedCircleCheckmarkView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKConnectedCircleCheckmarkView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  PKRectCenteredIntegralRect();
  v7 = v6;
  v9 = v8;
  if (!a4)
    -[UIImageView setFrame:](self->_imageView, "setFrame:");
  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (UIColor)checkmarkTintColor
{
  return self->_checkmarkTintColor;
}

- (UIColor)checkmarkBackgroundColor
{
  return self->_checkmarkBackgroundColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkmarkBackgroundColor, 0);
  objc_storeStrong((id *)&self->_checkmarkTintColor, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
