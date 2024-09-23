@implementation _TUIVisualEffectBoxStyler

- (_TUIVisualEffectBoxStyler)initWithBlurStyle:(unint64_t)a3
{
  _TUIVisualEffectBoxStyler *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_TUIVisualEffectBoxStyler;
  result = -[_TUIVisualEffectBoxStyler init](&v5, "init");
  if (result)
    result->_blurStyle = a3;
  return result;
}

- (void)applyStylingToView:(id)a3
{
  unint64_t v4;
  void *v5;
  UIVisualEffectView *v6;
  UIVisualEffectView *visualEffectView;
  double Width;
  id v9;
  CGRect v10;
  CGRect v11;

  v9 = a3;
  if (self->_blurStyle - 1 >= 3)
    v4 = 1;
  else
    v4 = self->_blurStyle - 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", v4));
  -[UIVisualEffectView removeFromSuperview](self->_visualEffectView, "removeFromSuperview");
  v6 = (UIVisualEffectView *)objc_msgSend(objc_alloc((Class)UIVisualEffectView), "initWithEffect:", v5);
  visualEffectView = self->_visualEffectView;
  self->_visualEffectView = v6;

  objc_msgSend(v9, "frame");
  Width = CGRectGetWidth(v10);
  objc_msgSend(v9, "frame");
  -[UIVisualEffectView setFrame:](self->_visualEffectView, "setFrame:", 0.0, 0.0, Width, CGRectGetHeight(v11));
  objc_msgSend(v9, "addSubview:", self->_visualEffectView);
  -[UIVisualEffectView setAutoresizingMask:](self->_visualEffectView, "setAutoresizingMask:", 18);

}

- (BOOL)isEqualToStyle:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _TUIVisualEffectBoxStyler *v7;
  id v8;
  char v9;

  v4 = a3;
  v5 = objc_opt_class(_TUIVisualEffectBoxStyler);
  v6 = TUIDynamicCast(v5, v4);
  v7 = (_TUIVisualEffectBoxStyler *)objc_claimAutoreleasedReturnValue(v6);

  if (v7 == self)
  {
    v9 = 1;
  }
  else
  {
    v8 = -[_TUIVisualEffectBoxStyler blurStyle](v7, "blurStyle");
    v9 = v8 == (id)-[_TUIVisualEffectBoxStyler blurStyle](self, "blurStyle");
  }

  return v9;
}

- (void)removeStylingFromView:(id)a3
{
  UIVisualEffectView *visualEffectView;

  -[UIVisualEffectView removeFromSuperview](self->_visualEffectView, "removeFromSuperview", a3);
  visualEffectView = self->_visualEffectView;
  self->_visualEffectView = 0;

}

- (unint64_t)blurStyle
{
  return self->_blurStyle;
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualEffectView, 0);
}

@end
