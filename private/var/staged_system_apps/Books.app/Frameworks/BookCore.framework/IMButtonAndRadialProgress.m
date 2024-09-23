@implementation IMButtonAndRadialProgress

- (IMButtonAndRadialProgress)initWithCoder:(id)a3
{
  IMButtonAndRadialProgress *v3;
  IMButtonAndRadialProgress *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMButtonAndRadialProgress;
  v3 = -[IMButtonAndRadialProgress initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
  {
    -[IMButtonAndRadialProgress frame](v3, "frame");
    -[IMButtonAndRadialProgress _commonInitWithFrame:](v4, "_commonInitWithFrame:");
  }
  return v4;
}

- (IMButtonAndRadialProgress)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  IMButtonAndRadialProgress *v7;
  IMButtonAndRadialProgress *v8;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)IMButtonAndRadialProgress;
  v7 = -[IMButtonAndRadialProgress initWithFrame:](&v10, "initWithFrame:");
  v8 = v7;
  if (v7)
    -[IMButtonAndRadialProgress _commonInitWithFrame:](v7, "_commonInitWithFrame:", x, y, width, height);
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[UIButton removeFromSuperview](self->_button, "removeFromSuperview");
  -[IMRadialProgressButton removeFromSuperview](self->_radialProgress, "removeFromSuperview");
  v3.receiver = self;
  v3.super_class = (Class)IMButtonAndRadialProgress;
  -[IMButtonAndRadialProgress dealloc](&v3, "dealloc");
}

- (void)layoutSubviews
{
  -[IMButtonAndRadialProgress bounds](self, "bounds");
  -[UIButton setFrame:](self->_button, "setFrame:");
  -[IMButtonAndRadialProgress bounds](self, "bounds");
  -[IMButtonAndRadialProgress _centeredProgressFrameWithBounds:](self, "_centeredProgressFrameWithBounds:");
  -[IMRadialProgressButton setFrame:](self->_radialProgress, "setFrame:");
}

- (UIEdgeInsets)contentEdgeInsets
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
  UIEdgeInsets result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IMButtonAndRadialProgress button](self, "button"));
  objc_msgSend(v2, "contentEdgeInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)setContentEdgeInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  id v7;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[IMButtonAndRadialProgress button](self, "button"));
  objc_msgSend(v7, "setContentEdgeInsets:", top, left, bottom, right);

}

- (void)setTitle:(id)a3 forState:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[IMButtonAndRadialProgress button](self, "button"));
  objc_msgSend(v7, "setTitle:forState:", v6, a4);

}

- (void)setTitleColor:(id)a3 forState:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[IMButtonAndRadialProgress button](self, "button"));
  objc_msgSend(v7, "setTitleColor:forState:", v6, a4);

}

- (void)setBackgroundImage:(id)a3 forState:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[IMButtonAndRadialProgress button](self, "button"));
  objc_msgSend(v7, "setBackgroundImage:forState:", v6, a4);

}

- (UILabel)titleLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IMButtonAndRadialProgress button](self, "button"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "titleLabel"));

  return (UILabel *)v3;
}

- (void)sizeToFit
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMButtonAndRadialProgress button](self, "button"));
  objc_msgSend(v3, "sizeToFit");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMButtonAndRadialProgress button](self, "button"));
  objc_msgSend(v4, "bounds");
  -[IMButtonAndRadialProgress setBounds:](self, "setBounds:");

  -[IMButtonAndRadialProgress bounds](self, "bounds");
  -[IMButtonAndRadialProgress _centeredProgressFrameWithBounds:](self, "_centeredProgressFrameWithBounds:");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = (id)objc_claimAutoreleasedReturnValue(-[IMButtonAndRadialProgress radialProgress](self, "radialProgress"));
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

}

- (void)addTarget:(id)a3 action:(SEL)a4 forControlEvents:(unint64_t)a5
{
  id v8;
  id v9;

  v8 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[IMButtonAndRadialProgress button](self, "button"));
  objc_msgSend(v9, "addTarget:action:forControlEvents:", v8, a4, a5);

}

- (void)removeTarget:(id)a3 action:(SEL)a4 forControlEvents:(unint64_t)a5
{
  id v8;
  id v9;

  v8 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[IMButtonAndRadialProgress button](self, "button"));
  objc_msgSend(v9, "removeTarget:action:forControlEvents:", v8, a4, a5);

}

- (float)progress
{
  void *v2;
  float v3;
  float v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IMButtonAndRadialProgress radialProgress](self, "radialProgress"));
  objc_msgSend(v2, "progress");
  v4 = v3;

  return v4;
}

- (void)setProgress:(float)a3
{
  double v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[IMButtonAndRadialProgress radialProgress](self, "radialProgress"));
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setProgress:", v4);

}

- (void)setDisableInteraction:(BOOL)a3
{
  _BOOL8 v4;
  void *v5;

  if (self->_disableInteraction != a3)
  {
    self->_disableInteraction = a3;
    v4 = !a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMButtonAndRadialProgress radialProgress](self, "radialProgress"));
    objc_msgSend(v5, "setShowImages:", v4);

    -[IMButtonAndRadialProgress setUserInteractionEnabled:](self, "setUserInteractionEnabled:", !self->_disableInteraction);
  }
}

- (void)setProgressColor:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_progressColor, a3);
  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[IMButtonAndRadialProgress radialProgress](self, "radialProgress"));
  objc_msgSend(v6, "setProgressColor:", v5);

}

- (void)tintColorDidChange
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IMButtonAndRadialProgress;
  -[IMButtonAndRadialProgress tintColorDidChange](&v5, "tintColorDidChange");
  if (!self->_progressColor)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMButtonAndRadialProgress tintColor](self, "tintColor"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMButtonAndRadialProgress radialProgress](self, "radialProgress"));
    objc_msgSend(v4, "setProgressColor:", v3);

  }
}

- (void)setModeState:(int)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;

  if (a3 == 1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMButtonAndRadialProgress button](self, "button"));
    objc_msgSend(v7, "setHidden:", 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMButtonAndRadialProgress button](self, "button"));
    v9 = v8;
    v10 = 1;
LABEL_9:
    objc_msgSend(v8, "setEnabled:", v10);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[IMButtonAndRadialProgress radialProgress](self, "radialProgress"));
    v14 = v13;
    v15 = 1;
    goto LABEL_10;
  }
  if (a3 != 2)
  {
    if (a3 == 3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMButtonAndRadialProgress button](self, "button"));
      v5 = v4;
      v6 = 0;
    }
    else
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMButtonAndRadialProgress button](self, "button"));
      v5 = v4;
      v6 = 1;
    }
    objc_msgSend(v4, "setHidden:", v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMButtonAndRadialProgress button](self, "button"));
    v9 = v8;
    v10 = 0;
    goto LABEL_9;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IMButtonAndRadialProgress button](self, "button"));
  objc_msgSend(v11, "setHidden:", 1);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[IMButtonAndRadialProgress button](self, "button"));
  objc_msgSend(v12, "setEnabled:", 0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[IMButtonAndRadialProgress radialProgress](self, "radialProgress"));
  v14 = v13;
  v15 = 0;
LABEL_10:
  objc_msgSend(v13, "setHidden:", v15);

  v16 = (id)objc_claimAutoreleasedReturnValue(-[IMButtonAndRadialProgress radialProgress](self, "radialProgress"));
  objc_msgSend(v16, "setEnabled:", 0);

}

- (int)modeState
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  unsigned int v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMButtonAndRadialProgress button](self, "button"));
  if ((objc_msgSend(v3, "isHidden") & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMButtonAndRadialProgress radialProgress](self, "radialProgress"));
    v5 = objc_msgSend(v4, "isHidden");

    if ((v5 & 1) != 0)
      return 0;
  }
  else
  {

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMButtonAndRadialProgress button](self, "button"));
  v8 = objc_msgSend(v7, "isHidden");

  if ((v8 & 1) != 0)
    return 2;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMButtonAndRadialProgress button](self, "button"));
  v10 = objc_msgSend(v9, "isEnabled");

  if (v10)
    return 1;
  else
    return 3;
}

- (void)_commonInitWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  UIButton *v9;
  UIButton *button;
  IMRadialProgressButton *v11;
  IMRadialProgressButton *v12;
  IMRadialProgressButton *radialProgress;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = objc_alloc((Class)UIButton);
  -[IMButtonAndRadialProgress frame](self, "frame");
  v9 = (UIButton *)objc_msgSend(v8, "initWithFrame:");
  button = self->_button;
  self->_button = v9;

  self->_disableInteraction = 0;
  v11 = [IMRadialProgressButton alloc];
  -[IMButtonAndRadialProgress _centeredProgressFrameWithBounds:](self, "_centeredProgressFrameWithBounds:", x, y, width, height);
  v12 = -[IMRadialProgressButton initWithFrame:](v11, "initWithFrame:");
  radialProgress = self->_radialProgress;
  self->_radialProgress = v12;

  -[IMRadialProgressButton setHidden:](self->_radialProgress, "setHidden:", 1);
  -[IMButtonAndRadialProgress addSubview:](self, "addSubview:", self->_button);
  -[IMButtonAndRadialProgress addSubview:](self, "addSubview:", self->_radialProgress);
}

- (CGRect)_centeredProgressFrameWithBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
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
  CGRect v17;
  CGRect v18;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  +[IMRadialProgressButton minimumBoundingBox](IMRadialProgressButton, "minimumBoundingBox");
  v8 = v7;
  v10 = v9;
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  v11 = CGRectGetWidth(v17) * 0.5;
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  v12 = CGRectGetHeight(v18) * 0.5;
  CGRectMakeWithCenterAndSize(v11, v12, v8, v10);
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (UIColor)progressColor
{
  return self->_progressColor;
}

- (BOOL)disableInteraction
{
  return self->_disableInteraction;
}

- (UIButton)button
{
  return self->_button;
}

- (IMRadialProgressButton)radialProgress
{
  return self->_radialProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radialProgress, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_progressColor, 0);
}

@end
