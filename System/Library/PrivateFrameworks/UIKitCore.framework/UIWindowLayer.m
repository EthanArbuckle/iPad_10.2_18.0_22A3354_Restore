@implementation UIWindowLayer

- (void)setFrame:(CGRect)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIWindowLayer;
  -[UIWindowLayer setFrame:](&v3, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)actionForKey:(id)a3
{
  id v4;
  UIWindow *window;
  void *v6;

  v4 = a3;
  window = self->_window;
  if (!window)
  {
    if (!_CASupportsAnimationForKey(v4))
    {
LABEL_6:
      v6 = 0;
      goto LABEL_7;
    }
    window = self->_window;
  }
  if (!-[UIView _shouldAnimatePropertyWithKey:](window, "_shouldAnimatePropertyWithKey:", v4))
    goto LABEL_6;
  +[UIView _defaultUIViewActionForLayer:forKey:](UIView, "_defaultUIViewActionForLayer:forKey:", self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v6;
}

- (void)setBounds:(CGRect)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIWindowLayer;
  -[UIWindowLayer setBounds:](&v3, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setTransform:(CATransform3D *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _OWORD v7[8];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIWindowLayer;
  v3 = *(_OWORD *)&a3->m33;
  v7[4] = *(_OWORD *)&a3->m31;
  v7[5] = v3;
  v4 = *(_OWORD *)&a3->m43;
  v7[6] = *(_OWORD *)&a3->m41;
  v7[7] = v4;
  v5 = *(_OWORD *)&a3->m13;
  v7[0] = *(_OWORD *)&a3->m11;
  v7[1] = v5;
  v6 = *(_OWORD *)&a3->m23;
  v7[2] = *(_OWORD *)&a3->m21;
  v7[3] = v6;
  -[UIWindowLayer setTransform:](&v8, sel_setTransform_, v7);
}

@end
