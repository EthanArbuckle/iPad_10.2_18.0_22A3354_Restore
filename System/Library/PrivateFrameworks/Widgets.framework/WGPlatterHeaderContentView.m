@implementation WGPlatterHeaderContentView

- (WGPlatterHeaderContentView)init
{
  WGPlatterHeaderContentView *result;
  uint64_t v3;
  __int128 v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WGPlatterHeaderContentView;
  result = -[PLPlatterHeaderContentView init](&v5, sel_init);
  if (result)
  {
    v3 = MEMORY[0x24BDBD8B8];
    v4 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)&result->_utilityButtonTransform.a = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)&result->_utilityButtonTransform.c = v4;
    *(_OWORD *)&result->_utilityButtonTransform.tx = *(_OWORD *)(v3 + 32);
  }
  return result;
}

- (void)setUtilityButtonTransform:(CGAffineTransform *)a3
{
  CGAffineTransform *p_utilityButtonTransform;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  CGAffineTransform v10;
  CGAffineTransform t1;

  p_utilityButtonTransform = &self->_utilityButtonTransform;
  v6 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
  v7 = *(_OWORD *)&self->_utilityButtonTransform.c;
  *(_OWORD *)&v10.a = *(_OWORD *)&self->_utilityButtonTransform.a;
  *(_OWORD *)&v10.c = v7;
  *(_OWORD *)&v10.tx = *(_OWORD *)&self->_utilityButtonTransform.tx;
  if (!CGAffineTransformEqualToTransform(&t1, &v10))
  {
    v8 = *(_OWORD *)&a3->a;
    v9 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&p_utilityButtonTransform->c = *(_OWORD *)&a3->c;
    *(_OWORD *)&p_utilityButtonTransform->tx = v9;
    *(_OWORD *)&p_utilityButtonTransform->a = v8;
    -[WGPlatterHeaderContentView setNeedsLayout](self, "setNeedsLayout");
    -[WGPlatterHeaderContentView layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)_layoutUtilityButtonWithScale:(double)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  double MidX;
  CGAffineTransform *p_utilityButtonTransform;
  __int128 v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  __int128 v21;
  CGAffineTransform v22;
  CGAffineTransform v23;
  objc_super v24;
  CGRect v25;
  CGRect v26;

  v24.receiver = self;
  v24.super_class = (Class)WGPlatterHeaderContentView;
  -[PLPlatterHeaderContentView _layoutUtilityButtonWithScale:](&v24, sel__layoutUtilityButtonWithScale_, a3);
  -[PLPlatterHeaderContentView utilityView](self, "utilityView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[PLPlatterHeaderContentView utilityButton](self, "utilityButton");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  objc_msgSend(v7, "frame");
  x = v25.origin.x;
  y = v25.origin.y;
  width = v25.size.width;
  height = v25.size.height;
  MidX = CGRectGetMidX(v25);
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  objc_msgSend(v7, "setCenter:", MidX, CGRectGetMidY(v26));
  objc_msgSend(v7, "setBounds:", 0.0, 0.0, width, height);
  p_utilityButtonTransform = &self->_utilityButtonTransform;
  v14 = *(_OWORD *)&p_utilityButtonTransform->c;
  *(_OWORD *)&v23.a = *(_OWORD *)&p_utilityButtonTransform->a;
  *(_OWORD *)&v23.c = v14;
  *(_OWORD *)&v23.tx = *(_OWORD *)&p_utilityButtonTransform->tx;
  objc_msgSend(v7, "setTransform:", &v23);
  objc_msgSend(v7, "frame");
  v16 = v15;
  v18 = v17;
  UIRectIntegralWithScale();
  v21 = *(_OWORD *)&p_utilityButtonTransform->c;
  *(_OWORD *)&v22.a = *(_OWORD *)&p_utilityButtonTransform->a;
  *(_OWORD *)&v22.c = v21;
  *(_OWORD *)&v22.tx = *(_OWORD *)&p_utilityButtonTransform->tx;
  memset(&v23, 0, sizeof(v23));
  CGAffineTransformTranslate(&v23, &v22, v19 - v16, v20 - v18);
  v22 = v23;
  objc_msgSend(v7, "setTransform:", &v22);

}

- (CGAffineTransform)utilityButtonTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[11].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[11].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[11].ty;
  return self;
}

@end
