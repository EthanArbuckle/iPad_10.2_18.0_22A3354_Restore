@implementation SVButton

- (SVButton)initWithFrame:(CGRect)a3
{
  SVButton *v3;
  SVButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SVButton;
  v3 = -[SVButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[SVButton addTarget:action:forControlEvents:](v3, "addTarget:action:forControlEvents:", v3, sel__privateButtonTapped, 64);
  return v4;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  unsigned __int8 v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v25;
  double v26;
  double v27;
  objc_super v28;
  CGPoint v29;
  CGRect v30;

  y = a3.y;
  x = a3.x;
  v28.receiver = self;
  v28.super_class = (Class)SVButton;
  v7 = -[SVButton pointInside:withEvent:](&v28, sel_pointInside_withEvent_, a4);
  -[SVButton bounds](self, "bounds");
  v26 = v9;
  v27 = v8;
  v25 = v10;
  v12 = v11;
  -[SVButton touchInsets](self, "touchInsets");
  v14 = v13;
  -[SVButton touchInsets](self, "touchInsets");
  v16 = v15;
  -[SVButton touchInsets](self, "touchInsets");
  v18 = v17;
  -[SVButton touchInsets](self, "touchInsets");
  v20 = v19;
  -[SVButton touchInsets](self, "touchInsets");
  v22 = v21;
  -[SVButton touchInsets](self, "touchInsets");
  if ((v7 & 1) != 0)
    return 1;
  v30.size.height = v12 - (v22 + v23);
  v30.size.width = v25 - (v18 + v20);
  v30.origin.y = v26 + v16;
  v30.origin.x = v27 + v14;
  v29.x = x;
  v29.y = y;
  return CGRectContainsPoint(v30, v29);
}

- (void)_privateButtonTapped
{
  void *v3;
  void (**v4)(void);

  -[SVButton touchUpInsideBlock](self, "touchUpInsideBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SVButton touchUpInsideBlock](self, "touchUpInsideBlock");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

- (UIEdgeInsets)touchInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_touchInsets.top;
  left = self->_touchInsets.left;
  bottom = self->_touchInsets.bottom;
  right = self->_touchInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setTouchInsets:(UIEdgeInsets)a3
{
  self->_touchInsets = a3;
}

- (id)touchUpInsideBlock
{
  return self->_touchUpInsideBlock;
}

- (void)onTouchUpInside:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 752);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_touchUpInsideBlock, 0);
}

@end
