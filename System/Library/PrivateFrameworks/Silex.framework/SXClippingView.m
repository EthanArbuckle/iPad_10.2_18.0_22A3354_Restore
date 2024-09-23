@implementation SXClippingView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (SXClippingView)initWithContentView:(id)a3
{
  id v5;
  SXClippingView *v6;
  SXClippingView *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SXClippingView;
  v6 = -[SXClippingView initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contentView, a3);
    -[SXClippingView layer](v7, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setContentLayer:", v9);

    -[SXClippingView layer](v7, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    objc_msgSend(v10, "setClippingMode:", objc_opt_isKindOfClass() & 1);

    -[SXClippingView addSubview:](v7, "addSubview:", v5);
  }

  return v7;
}

- (void)setContentFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  self->_contentFrame = a3;
  -[SXClippingView layer](self, "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentFrame:", x, y, width, height);

}

- (void)setClippingMode:(id)a3
{
  id v4;

  self->_clippingMode = (unint64_t)a3;
  -[SXClippingView layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClippingMode:", a3);

}

- (CGSize)contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (CGRect)contentFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentFrame.origin.x;
  y = self->_contentFrame.origin.y;
  width = self->_contentFrame.size.width;
  height = self->_contentFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (unint64_t)clippingMode
{
  return self->_clippingMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
