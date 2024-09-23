@implementation SBHNavigationController

- (void)setModalPresentedBackgroundColor:(id)a3
{
  id v4;
  UIColor **p_modalPresentedBackgroundColor;
  objc_super v6;

  v4 = a3;
  if (!v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)SBHNavigationController;
    -[SBHNavigationController _backgroundColorForModalFormSheet](&v6, sel__backgroundColorForModalFormSheet);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  p_modalPresentedBackgroundColor = &self->_modalPresentedBackgroundColor;
  if ((-[UIColor isEqual:](*p_modalPresentedBackgroundColor, "isEqual:", v4) & 1) == 0)
    objc_storeStrong((id *)p_modalPresentedBackgroundColor, v4);

}

- (id)_backgroundColorForModalFormSheet
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  -[SBHNavigationController modalPresentedBackgroundColor](self, "modalPresentedBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBHNavigationController;
    -[SBHNavigationController _backgroundColorForModalFormSheet](&v8, sel__backgroundColorForModalFormSheet);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (UIColor)modalPresentedBackgroundColor
{
  return self->_modalPresentedBackgroundColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modalPresentedBackgroundColor, 0);
}

@end
