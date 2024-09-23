@implementation NonVisualEffectView

- (NonVisualEffectView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  NonVisualEffectView *v7;
  NonVisualEffectView *v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = -[NonVisualEffectView initWithEffect:](self, "initWithEffect:", 0);
  v8 = v7;
  if (v7)
    -[NonVisualEffectView setFrame:](v7, "setFrame:", x, y, width, height);
  return v8;
}

- (NonVisualEffectView)initWithEffect:(id)a3
{
  id v4;
  NonVisualEffectView *v5;
  NonVisualEffectView *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NonVisualEffectView;
  v5 = -[NonVisualEffectView initWithFrame:](&v8, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v6 = v5;
  if (v5)
  {
    -[NonVisualEffectView setAutoresizesSubviews:](v5, "setAutoresizesSubviews:", 1);
    -[NonVisualEffectView setEffect:](v6, "setEffect:", v4);
  }

  return v6;
}

- (NonVisualEffectView)initWithCoder:(id)a3
{
  objc_class *v5;
  NSString *v6;
  void *v7;
  NSString *v8;
  void *v9;

  v5 = (objc_class *)objc_opt_class(self);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, CFSTR("-[%@ %@] not implemeneted"), v7, v9);

  return -[NonVisualEffectView initWithEffect:](self, "initWithEffect:", 0);
}

- (UIView)contentView
{
  UIView *contentView;
  id v4;
  UIView *v5;
  UIView *v6;

  contentView = self->_contentView;
  if (!contentView)
  {
    v4 = objc_alloc((Class)UIView);
    -[NonVisualEffectView bounds](self, "bounds");
    v5 = (UIView *)objc_msgSend(v4, "initWithFrame:");
    v6 = self->_contentView;
    self->_contentView = v5;

    -[UIView setClipsToBounds:](self->_contentView, "setClipsToBounds:", 1);
    -[UIView setAutoresizingMask:](self->_contentView, "setAutoresizingMask:", 18);
    -[UIView _setCornerRadius:](self->_contentView, "_setCornerRadius:", self->_cornerRadius);
    -[NonVisualEffectView addSubview:](self, "addSubview:", self->_contentView);
    contentView = self->_contentView;
  }
  return contentView;
}

- (void)setEffect:(id)a3
{
  UIVisualEffect *v4;
  UIVisualEffect *effect;
  unsigned __int8 v6;
  UIVisualEffect *v7;
  UIVisualEffect *v8;
  UIView *backgroundView;
  uint64_t v10;
  id v11;
  UIView *v12;
  UIView *v13;
  void *v14;
  void *v15;
  UIVisualEffect *v16;

  v4 = (UIVisualEffect *)a3;
  effect = self->_effect;
  if (effect != v4)
  {
    v16 = v4;
    v6 = -[UIVisualEffect isEqual:](effect, "isEqual:", v4);
    v4 = v16;
    if ((v6 & 1) == 0)
    {
      v7 = (UIVisualEffect *)-[UIVisualEffect copy](v16, "copy");
      v8 = self->_effect;
      self->_effect = v7;

      backgroundView = self->_backgroundView;
      if (self->_effect)
      {
        if (!backgroundView)
        {
          v11 = objc_alloc((Class)UIView);
          -[NonVisualEffectView bounds](self, "bounds");
          v12 = (UIView *)objc_msgSend(v11, "initWithFrame:");
          v13 = self->_backgroundView;
          self->_backgroundView = v12;

          -[UIView setAutoresizingMask:](self->_backgroundView, "setAutoresizingMask:", 18);
          -[UIView _setCornerRadius:](self->_backgroundView, "_setCornerRadius:", self->_cornerRadius);
          -[UIView setClipsToBounds:](self->_backgroundView, "setClipsToBounds:", 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[NonVisualEffectView theme](self, "theme"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "controlBackgroundColor"));
          -[UIView setBackgroundColor:](self->_backgroundView, "setBackgroundColor:", v15);

          -[NonVisualEffectView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_backgroundView, 0);
          goto LABEL_9;
        }
        v10 = 0;
      }
      else
      {
        v10 = 1;
      }
      -[UIView setHidden:](backgroundView, "setHidden:", v10);
LABEL_9:
      v4 = v16;
    }
  }

}

- (id)backgroundColor
{
  return -[UIView backgroundColor](self->_backgroundView, "backgroundColor");
}

- (void)setBackgroundColor:(id)a3
{
  -[UIView setBackgroundColor:](self->_backgroundView, "setBackgroundColor:", a3);
}

- (void)_setCornerRadius:(double)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NonVisualEffectView subviews](self, "subviews", 0));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "_setCornerRadius:", a3);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (double)_cornerRadius
{
  return self->_cornerRadius;
}

- (void)_setCornerRadius:(double)a3 continuous:(BOOL)a4 maskedCorners:(unint64_t)a5
{
  _BOOL4 v6;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v6 = a4;
  self->_cornerRadius = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NonVisualEffectView subviews](self, "subviews", 0));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "layer"));
        objc_msgSend(v14, "setMaskedCorners:", a5);

        if (v6)
          objc_msgSend(v13, "_setContinuousCornerRadius:", a3);
        else
          objc_msgSend(v13, "_setCornerRadius:", a3);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

}

- (void)setCustomBackgroundColor:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  unsigned __int8 v7;
  UIColor *v8;
  UIColor *customBackgroundColor;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  v5 = self->_customBackgroundColor;
  v6 = (unint64_t)v4;
  if (v6 | v5)
  {
    v12 = (id)v6;
    v7 = objc_msgSend((id)v5, "isEqual:", v6);

    v6 = (unint64_t)v12;
    if ((v7 & 1) == 0)
    {
      v8 = (UIColor *)objc_msgSend(v12, "copy");
      customBackgroundColor = self->_customBackgroundColor;
      self->_customBackgroundColor = v8;

      if (self->_customBackgroundColor)
      {
        -[NonVisualEffectView setBackgroundColor:](self, "setBackgroundColor:");
      }
      else
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[NonVisualEffectView theme](self, "theme"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "controlBackgroundColor"));
        -[NonVisualEffectView setBackgroundColor:](self, "setBackgroundColor:", v11);

      }
      v6 = (unint64_t)v12;
    }
  }

}

- (void)updateTheme
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NonVisualEffectView;
  -[MapsThemeView updateTheme](&v6, "updateTheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NonVisualEffectView customBackgroundColor](self, "customBackgroundColor"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NonVisualEffectView theme](self, "theme"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "controlBackgroundColor"));
    -[UIView setBackgroundColor:](self->_backgroundView, "setBackgroundColor:", v5);

  }
}

- (UIVisualEffect)effect
{
  return self->_effect;
}

- (UIColor)customBackgroundColor
{
  return self->_customBackgroundColor;
}

- (NSString)_groupName
{
  return self->__groupName;
}

- (void)_setGroupName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__groupName, 0);
  objc_storeStrong((id *)&self->_customBackgroundColor, 0);
  objc_storeStrong((id *)&self->_effect, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
