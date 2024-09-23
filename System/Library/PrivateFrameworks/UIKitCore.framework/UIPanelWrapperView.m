@implementation UIPanelWrapperView

+ (id)wrapperViewForView:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(a1, "existingWrapperViewForView:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v6 = objc_alloc((Class)a1);
      objc_msgSend(v4, "frame");
      v5 = (void *)objc_msgSend(v6, "initWithFrame:");
      objc_msgSend(v5, "setAutoresizingMask:", 0);
      objc_msgSend(v5, "setAutoresizesSubviews:", 0);
      objc_msgSend(v5, "bounds");
      objc_msgSend(v4, "setFrame:");
      objc_msgSend(v5, "addSubview:", v4);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)existingWrapperViewForView:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(a3, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  id *v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIPanelWrapperView;
  -[UIView layoutSubviews](&v6, sel_layoutSubviews);
  -[UIView subviews](self, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (id *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4[12];
    -[UIView bounds](self, "bounds");
    if (v5)
      objc_msgSend(v5, "_updateControlledViewsToFrame:");
    else
      objc_msgSend(v4, "setFrame:");

  }
}

@end
