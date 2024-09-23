@implementation SUSegmentedControlBar

- (SUSegmentedControlBar)initWithSegmentedControl:(id)a3
{
  SUSegmentedControlBar *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  UIView *v8;
  UIControl *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SUSegmentedControlBar;
  v4 = -[SUSegmentedControlBar initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (v4)
  {
    if ((_UIApplicationUsesLegacyUI() & 1) == 0)
    {
      v5 = objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.70588237, 1.0);
      if (objc_msgSend(a3, "tintStyle") == 1)
      {
        v5 = objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.254901975, 1.0);
        v6 = 11050;
      }
      else
      {
        v6 = 2010;
      }
      v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDF7018]), "initWithPrivateStyle:", v6);
      v4->_backdropView = (_UIBackdropView *)v7;
      -[SUSegmentedControlBar addSubview:](v4, "addSubview:", v7);
      v8 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
      v4->_separatorView = v8;
      -[UIView setBackgroundColor:](v8, "setBackgroundColor:", v5);
      -[SUSegmentedControlBar addSubview:](v4, "addSubview:", v4->_separatorView);
    }
    v9 = (UIControl *)a3;
    v4->_control = v9;
    -[SUSegmentedControlBar addSubview:](v4, "addSubview:", v9);
    -[SUSegmentedControlBar setBackgroundColor:](v4, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "clearColor"));
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUSegmentedControlBar;
  -[SUSegmentedControlBar dealloc](&v3, sel_dealloc);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIControl *control;
  int v12;
  double v13;
  double v14;
  double v15;
  double v16;
  int v17;
  double v18;
  _UIBackdropView *backdropView;
  double v20;
  double v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)SUSegmentedControlBar;
  -[SUSegmentedControlBar layoutSubviews](&v22, sel_layoutSubviews);
  -[SUSegmentedControlBar bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  control = self->_control;
  if (control)
  {
    -[UIControl frame](control, "frame");
    v12 = _UIApplicationUsesLegacyUI();
    v13 = 10.0;
    if (v12)
      v13 = 0.0;
    v21 = v13;
    if (_UIApplicationUsesLegacyUI())
      v14 = 0.0;
    else
      v14 = 15.0;
    if (_UIApplicationUsesLegacyUI())
      v15 = 0.0;
    else
      v15 = 15.0;
    v16 = v8 + v15 * -2.0;
    v17 = _UIApplicationUsesLegacyUI();
    v18 = 10.0;
    if (v17)
      v18 = 0.0;
    -[UIControl setFrame:](self->_control, "setFrame:", v14, v21, v16, v10 + v18 * -2.0);
  }
  backdropView = self->_backdropView;
  if (backdropView)
    -[_UIBackdropView setFrame:](backdropView, "setFrame:", v4, v6, v8, v10);
  if (self->_separatorView)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "scale");
    -[UIView setFrame:](self->_separatorView, "setFrame:", v4, v6 + v10 - 1.0 / v20, v8);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
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
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (_UIApplicationUsesLegacyUI())
    v6 = 0.0;
  else
    v6 = 10.0;
  v7 = height - v6 * 2.0;
  if (_UIApplicationUsesLegacyUI())
    v8 = 0.0;
  else
    v8 = 15.0;
  -[UIControl sizeThatFits:](self->_control, "sizeThatFits:", width - v8 * 2.0, v7);
  v10 = v9;
  v12 = v11;
  if (_UIApplicationUsesLegacyUI())
    v13 = 0.0;
  else
    v13 = 10.0;
  v14 = v12 + v13 * 2.0;
  if (_UIApplicationUsesLegacyUI())
    v15 = 0.0;
  else
    v15 = 15.0;
  v16 = v10 + v15 * 2.0;
  v17 = v14;
  result.height = v17;
  result.width = v16;
  return result;
}

@end
