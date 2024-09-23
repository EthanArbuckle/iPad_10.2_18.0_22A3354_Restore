@implementation _WTView

- (_WTView)init
{
  _WTView *v2;
  _WTView *v3;
  _WTView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_WTView;
  v2 = -[_WTView init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[_WTView _commonPlatformViewInit](v2, "_commonPlatformViewInit");
    v4 = (_WTView *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (_WTView)initWithCoder:(id)a3
{
  _WTView *v3;
  _WTView *v4;
  _WTView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_WTView;
  v3 = -[_WTView initWithCoder:](&v7, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
  {
    -[_WTView _commonPlatformViewInit](v3, "_commonPlatformViewInit");
    v5 = (_WTView *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (_WTView)initWithFrame:(CGRect)a3
{
  _WTView *v3;
  _WTView *v4;
  _WTView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_WTView;
  v3 = -[_WTView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[_WTView _commonPlatformViewInit](v3, "_commonPlatformViewInit");
    v5 = (_WTView *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_WTView;
  -[_WTView layoutSubviews](&v3, sel_layoutSubviews);
  -[_WTView _commonLayoutSubviews](self, "_commonLayoutSubviews");
}

- (void)_commonLayoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  -[_WTView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_WTView layer](self, "layer");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (id)platformInstalledDisplayLinkWithTarget:(id)a3 selector:(SEL)a4
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDE5670], "displayLinkWithTarget:selector:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addToRunLoop:forMode:", v5, *MEMORY[0x24BDBCB80]);

  return v4;
}

- (CGRect)platformGetVisibleRect
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect v24;
  CGRect v25;
  CGRect result;
  CGRect v27;

  -[_WTView frame](self, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_WTView superview](self, "superview");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v27.origin.x = v12;
  v27.origin.y = v13;
  v27.size.width = v14;
  v27.size.height = v15;
  v24.origin.x = v4;
  v24.origin.y = v6;
  v24.size.width = v8;
  v24.size.height = v10;
  v25 = CGRectIntersection(v24, v27);
  x = v25.origin.x;
  y = v25.origin.y;
  width = v25.size.width;
  height = v25.size.height;

  v20 = x;
  v21 = y;
  v22 = width;
  v23 = height;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (void)platformPerformWithoutAnimation:(id)a3
{
  objc_msgSend(MEMORY[0x24BEBDB00], "performWithoutAnimation:", a3);
}

@end
