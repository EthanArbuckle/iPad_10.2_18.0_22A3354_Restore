@implementation UIViewControllerWrapperView

+ (UIViewControllerWrapperView)wrapperViewForView:(double)a3 wrapperFrame:(double)a4 viewFrame:(double)a5
{
  id v18;
  uint64_t v19;
  UIViewControllerWrapperView *v20;
  UIViewControllerWrapperView *v21;

  v18 = a10;
  v19 = objc_opt_self();
  if (v18)
  {
    +[UIViewControllerWrapperView existingWrapperViewForView:](v19, v18);
    v20 = (UIViewControllerWrapperView *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = v20;
      -[UIViewControllerWrapperView setFrame:](v20, "setFrame:", a1, a2, a3, a4);
      objc_msgSend(v18, "setFrame:", a5, a6, a7, a8);
LABEL_6:
      v21->_tightWrappingDisabled = 1;
      goto LABEL_7;
    }
    v21 = -[UIView initWithFrame:]([UIViewControllerWrapperView alloc], "initWithFrame:", a1, a2, a3, a4);
    -[UIView setAutoresizingMask:](v21, "setAutoresizingMask:", objc_msgSend(v18, "autoresizingMask"));
    objc_msgSend(v18, "setFrame:", a5, a6, a7, a8);
    -[UIView addSubview:](v21, "addSubview:", v18);
    if (v21)
      goto LABEL_6;
  }
  else
  {
    v21 = 0;
  }
LABEL_7:

  return v21;
}

- (void)unwrapView:(void *)a1
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  if (a1)
  {
    v5 = v3;
    +[UIViewControllerWrapperView existingWrapperViewForView:]((uint64_t)UIViewControllerWrapperView, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = v5;
    if (v4 == a1)
    {
      objc_msgSend(v5, "removeFromSuperview");
      v3 = v5;
    }
  }

}

- (void)setFrame:(CGRect)a3
{
  _BOOL4 tightWrappingDisabled;
  void *v5;
  void *v6;
  objc_super v7;

  if (self)
  {
    tightWrappingDisabled = self->_tightWrappingDisabled;
    v7.receiver = self;
    v7.super_class = (Class)UIViewControllerWrapperView;
    -[UIView setFrame:](&v7, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    if (tightWrappingDisabled)
      return;
  }
  else
  {
    v7.receiver = 0;
    v7.super_class = (Class)UIViewControllerWrapperView;
    -[UIView setFrame:](&v7, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  }
  -[UIView subviews](self, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bounds](self, "bounds");
  objc_msgSend(v6, "setFrame:");

}

+ (id)existingWrapperViewForView:(uint64_t)a1
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_opt_self();
  objc_msgSend(v2, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (void)unwrapView
{
  id v1;

  if (a1)
  {
    objc_msgSend(a1, "subviews");
    v1 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "makeObjectsPerformSelector:", sel_removeFromSuperview);

  }
}

+ (UIViewControllerWrapperView)wrapperViewForView:(double)a3 frame:(double)a4
{
  id v10;
  uint64_t v11;
  UIViewControllerWrapperView *v12;
  UIViewControllerWrapperView *v13;

  v10 = a6;
  v11 = objc_opt_self();
  if (v10)
  {
    +[UIViewControllerWrapperView existingWrapperViewForView:](v11, v10);
    v12 = (UIViewControllerWrapperView *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = v12;
      -[UIViewControllerWrapperView setFrame:](v12, "setFrame:", a1, a2, a3, a4);
      -[UIView bounds](v13, "bounds");
      objc_msgSend(v10, "setFrame:");
LABEL_6:
      v13->_tightWrappingDisabled = 0;
      goto LABEL_7;
    }
    v13 = -[UIView initWithFrame:]([UIViewControllerWrapperView alloc], "initWithFrame:", a1, a2, a3, a4);
    -[UIView setAutoresizingMask:](v13, "setAutoresizingMask:", objc_msgSend(v10, "autoresizingMask"));
    -[UIView bounds](v13, "bounds");
    objc_msgSend(v10, "setFrame:");
    -[UIView addSubview:](v13, "addSubview:", v10);
    if (v13)
      goto LABEL_6;
  }
  else
  {
    v13 = 0;
  }
LABEL_7:

  return v13;
}

- (void)setBounds:(CGRect)a3
{
  _BOOL4 tightWrappingDisabled;
  void *v5;
  void *v6;
  objc_super v7;

  if (self)
  {
    tightWrappingDisabled = self->_tightWrappingDisabled;
    v7.receiver = self;
    v7.super_class = (Class)UIViewControllerWrapperView;
    -[UIView setBounds:](&v7, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    if (tightWrappingDisabled)
      return;
  }
  else
  {
    v7.receiver = 0;
    v7.super_class = (Class)UIViewControllerWrapperView;
    -[UIView setBounds:](&v7, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  }
  -[UIView subviews](self, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bounds](self, "bounds");
  objc_msgSend(v6, "setFrame:");

}

@end
