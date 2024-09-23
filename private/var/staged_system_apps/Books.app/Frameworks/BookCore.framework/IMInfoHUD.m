@implementation IMInfoHUD

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;

  if (self->_textLabel == a6)
  {
    -[IMInfoHUD setNeedsLayout](self, "setNeedsLayout", a3, a4, a5);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)IMInfoHUD;
    -[IMInfoHUD observeValueForKeyPath:ofObject:change:context:](&v6, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (void)dealloc
{
  objc_super v3;

  -[UILabel removeObserver:forKeyPath:](self->_textLabel, "removeObserver:forKeyPath:", self, CFSTR("text"));
  v3.receiver = self;
  v3.super_class = (Class)IMInfoHUD;
  -[IMInfoHUD dealloc](&v3, "dealloc");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGSize result;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMInfoHUD superview](self, "superview", a3.width, a3.height));
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v31.origin.x = v6;
  v31.origin.y = v8;
  v31.size.width = v10;
  v31.size.height = v12;
  v32 = CGRectInset(v31, 20.0, 20.0);
  x = v32.origin.x;
  y = v32.origin.y;
  width = v32.size.width;
  height = v32.size.height;
  v33 = CGRectInset(v32, 10.0, 5.0);
  v17 = v33.size.width;
  v18 = v33.size.height;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[IMInfoHUD textLabel](self, "textLabel", v33.origin.x, v33.origin.y));
  objc_msgSend(v19, "sizeThatFits:", v17, v18);
  v21 = v20;
  v23 = v22;

  v24 = v21 + 20.0;
  v34.origin.x = x;
  v34.origin.y = y;
  v34.size.width = width;
  v34.size.height = height;
  v25 = CGRectGetWidth(v34);
  if (v24 >= v25)
    v24 = v25;
  v26 = v23 + 10.0;
  v35.origin.x = x;
  v35.origin.y = y;
  v35.size.width = width;
  v35.size.height = height;
  v27 = CGRectGetHeight(v35);
  if (v26 >= v27)
    v28 = v27;
  else
    v28 = v26;
  v29 = v24;
  result.height = v28;
  result.width = v29;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  id v21;
  CGRect v22;
  CGRect v23;

  -[IMInfoHUD bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[IMInfoHUD sizeThatFits:](self, "sizeThatFits:", v7, v9);
  v12 = v11;
  v14 = v13;
  v21 = (id)objc_claimAutoreleasedReturnValue(-[IMInfoHUD _backgroundView](self, "_backgroundView"));
  v22.origin.x = v4;
  v22.origin.y = v6;
  v22.size.width = v8;
  v22.size.height = v10;
  v15 = round((CGRectGetWidth(v22) - v12) * 0.5);
  v23.origin.x = v4;
  v23.origin.y = v6;
  v23.size.width = v8;
  v23.size.height = v10;
  v16 = round((CGRectGetHeight(v23) - v14) * 0.5);
  objc_msgSend(v21, "setFrame:", v15, v16, v12, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[IMInfoHUD textLabel](self, "textLabel"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[IMInfoHUD textLabel](self, "textLabel"));
  objc_msgSend(v18, "setFrame:", v15 + 10.0, v16 + 5.0, v12 + -20.0, v14 + -10.0);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "text"));
  v20 = objc_msgSend(v19, "length") == 0;

  objc_msgSend(v21, "setHidden:", v20);
  objc_msgSend(v17, "setHidden:", v20);

}

- (UILabel)textLabel
{
  UILabel *textLabel;
  UILabel *v4;
  UILabel *v5;
  void *v6;
  void *v7;
  void *v8;

  textLabel = self->_textLabel;
  if (!textLabel)
  {
    v4 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_textLabel;
    self->_textLabel = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 17.0));
    -[UILabel setFont:](self->_textLabel, "setFont:", v6);

    -[UILabel setTextAlignment:](self->_textLabel, "setTextAlignment:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    -[UILabel setTextColor:](self->_textLabel, "setTextColor:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](self->_textLabel, "setBackgroundColor:", v8);

    -[UILabel setNumberOfLines:](self->_textLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](self->_textLabel, "setLineBreakMode:", 0);
    -[UILabel addObserver:forKeyPath:options:context:](self->_textLabel, "addObserver:forKeyPath:options:context:", self, CFSTR("text"), 0, self->_textLabel);
    -[IMInfoHUD addSubview:](self, "addSubview:", self->_textLabel);
    textLabel = self->_textLabel;
  }
  return textLabel;
}

- (id)_backgroundView
{
  UIView *backgroundView;
  UIView *v4;
  UIView *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  backgroundView = self->_backgroundView;
  if (!backgroundView)
  {
    v4 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_backgroundView;
    self->_backgroundView = v4;

    -[UIView setContentMode:](self->_backgroundView, "setContentMode:", 0);
    -[UIView setAutoresizingMask:](self->_backgroundView, "setAutoresizingMask:", 18);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.9)));
    v7 = objc_msgSend(v6, "CGColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_backgroundView, "layer"));
    objc_msgSend(v8, "setBackgroundColor:", v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_backgroundView, "layer"));
    objc_msgSend(v9, "setCornerRadius:", 5.0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_backgroundView, "layer"));
    objc_msgSend(v10, "setMasksToBounds:", 1);

    -[IMInfoHUD insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_backgroundView, 0);
    backgroundView = self->_backgroundView;
  }
  return backgroundView;
}

- (void)setTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_textLabel, a3);
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (CGRect)anchorRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_anchorRect.origin.x;
  y = self->_anchorRect.origin.y;
  width = self->_anchorRect.size.width;
  height = self->_anchorRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setAnchorRect:(CGRect)a3
{
  self->_anchorRect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end
