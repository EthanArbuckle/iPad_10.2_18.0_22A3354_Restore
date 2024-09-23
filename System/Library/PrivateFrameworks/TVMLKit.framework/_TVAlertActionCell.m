@implementation _TVAlertActionCell

- (void)setButtonView:(id)a3
{
  UIView *v5;
  UIView **p_buttonView;
  UIView *buttonView;
  void *v8;
  UIView *v9;
  UIView *v10;

  v5 = (UIView *)a3;
  p_buttonView = &self->_buttonView;
  buttonView = self->_buttonView;
  v10 = v5;
  if (buttonView != v5)
  {
    -[UIView removeFromSuperview](buttonView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_buttonView, a3);
    if (*p_buttonView)
    {
      -[_TVAlertActionCell contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", *p_buttonView);

      v9 = *p_buttonView;
      -[_TVAlertActionCell bounds](self, "bounds");
      -[UIView setFrame:](v9, "setFrame:");
    }
  }

}

- (id)preferredFocusEnvironments
{
  void *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  if (self->_buttonView)
  {
    v4[0] = self->_buttonView;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  UIView *buttonView;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_TVAlertActionCell;
  -[_TVAlertActionCell prepareForReuse](&v6, sel_prepareForReuse);
  -[_TVAlertActionCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "makeObjectsPerformSelector:", sel_removeFromSuperview);

  buttonView = self->_buttonView;
  self->_buttonView = 0;

}

- (UIView)buttonView
{
  return self->_buttonView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonView, 0);
}

@end
