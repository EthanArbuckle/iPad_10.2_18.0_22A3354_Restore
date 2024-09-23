@implementation SXGradientFillView

- (SXGradientFillView)initWithGradientFill:(id)a3 gradientFactory:(id)a4
{
  id v7;
  id v8;
  SXGradientFillView *v9;
  SXGradientFillView *v10;
  void *v11;
  void *v12;
  void *v13;
  SXGradientView *v14;
  SXGradientView *gradientView;
  SXClippingView *v16;
  SXClippingView *clippingView;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)SXGradientFillView;
  v9 = -[SXFillView initWithFill:](&v19, sel_initWithFill_, v7);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_gradientFill, a3);
    objc_msgSend(v7, "colorStops");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "NSArray");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "angle");
    objc_msgSend(v8, "gradientForColorStops:angle:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = -[SXGradientView initWithGradient:]([SXGradientView alloc], "initWithGradient:", v13);
    gradientView = v10->_gradientView;
    v10->_gradientView = v14;

    v16 = -[SXClippingView initWithContentView:]([SXClippingView alloc], "initWithContentView:", v10->_gradientView);
    clippingView = v10->_clippingView;
    v10->_clippingView = v16;

    -[SXGradientFillView addSubview:](v10, "addSubview:", v10->_clippingView);
  }

  return v10;
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SXGradientFillView;
  -[SXGradientFillView layoutSubviews](&v4, sel_layoutSubviews);
  -[SXGradientFillView clippingView](self, "clippingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXGradientFillView bounds](self, "bounds");
  objc_msgSend(v3, "setFrame:");

}

- (CGRect)fillFrameWithBoundingSize:(CGSize)a3
{
  double height;
  double width;
  double v5;
  double v6;
  CGRect result;

  height = a3.height;
  width = a3.width;
  v5 = 0.0;
  v6 = 0.0;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)contentFrame
{
  void *v2;
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
  double v13;
  double v14;
  CGRect result;

  -[SXGradientFillView clippingView](self, "clippingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
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
  -[SXGradientFillView clippingView](self, "clippingView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentFrame:", x, y, width, height);

}

- (SXLinearGradientFill)gradientFill
{
  return self->_gradientFill;
}

- (SXClippingView)clippingView
{
  return self->_clippingView;
}

- (SXGradientView)gradientView
{
  return self->_gradientView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientView, 0);
  objc_storeStrong((id *)&self->_clippingView, 0);
  objc_storeStrong((id *)&self->_gradientFill, 0);
}

@end
