@implementation PXSampleGadgetView

- (PXSampleGadgetView)initWithFrame:(CGRect)a3
{
  PXSampleGadgetView *v3;
  UIView *v4;
  UIView *colorView;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXSampleGadgetView;
  v3 = -[PXSampleGadgetView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    colorView = v3->_colorView;
    v3->_colorView = v4;

    -[PXSampleGadgetView addSubview:](v3, "addSubview:", v3->_colorView);
  }
  return v3;
}

- (void)setColor:(id)a3
{
  UIColor *v5;
  void *v6;
  char v7;
  UIColor *v8;

  v8 = (UIColor *)a3;
  v5 = self->_color;
  v6 = v8;
  if (v5 == v8)
    goto LABEL_4;
  v7 = -[UIColor isEqual:](v8, "isEqual:", v5);

  if ((v7 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_color, a3);
    -[PXSampleGadgetView colorView](self, "colorView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v8);
LABEL_4:

  }
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PXSampleGadgetView;
  -[PXSampleGadgetView layoutSubviews](&v13, sel_layoutSubviews);
  -[PXSampleGadgetView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSampleGadgetView bounds](self, "bounds");
  objc_msgSend(v3, "view:colorFrameForBounds:", self);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[PXSampleGadgetView colorView](self, "colorView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (UIColor)color
{
  return self->_color;
}

- (PXSampleGadgetViewDelegate)delegate
{
  return (PXSampleGadgetViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)colorView
{
  return self->_colorView;
}

- (void)setColorView:(id)a3
{
  objc_storeStrong((id *)&self->_colorView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_color, 0);
}

@end
