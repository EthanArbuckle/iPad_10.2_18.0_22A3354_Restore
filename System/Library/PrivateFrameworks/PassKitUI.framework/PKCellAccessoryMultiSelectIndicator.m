@implementation PKCellAccessoryMultiSelectIndicator

+ (id)accessoryWithSelected:(BOOL)a3
{
  PKCellAccessoryMultiSelectIndicator *v3;
  void *v4;

  v3 = -[PKCellAccessoryMultiSelectIndicator initWithSelected:]([PKCellAccessoryMultiSelectIndicator alloc], "initWithSelected:", a3);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3550]), "initWithCustomView:placement:", v3, 0);

  return v4;
}

- (PKCellAccessoryMultiSelectIndicator)initWithSelected:(BOOL)a3
{
  _BOOL4 v3;
  PKCellAccessoryMultiSelectIndicator *v4;
  const __CFString *v5;
  void *v6;
  uint64_t v7;
  UIImageView *imageView;
  objc_super v10;

  v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKCellAccessoryMultiSelectIndicator;
  v4 = -[PKCellAccessoryMultiSelectIndicator initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v4)
  {
    if (v3)
      v5 = CFSTR("checkmark.circle.fill");
    else
      v5 = CFSTR("circle");
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v6);
    imageView = v4->_imageView;
    v4->_imageView = (UIImageView *)v7;

    -[UIImageView setContentMode:](v4->_imageView, "setContentMode:", 1);
    -[PKCellAccessoryMultiSelectIndicator addSubview:](v4, "addSubview:", v4->_imageView);

  }
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 36.0;
  v4 = 20.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  UIImageView *imageView;

  -[PKCellAccessoryMultiSelectIndicator bounds](self, "bounds");
  -[PKCellAccessoryMultiSelectIndicator _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  PKContentAlignmentMake();
  imageView = self->_imageView;
  PKSizeAlignedInRect();
  -[UIImageView setFrame:](imageView, "setFrame:");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
