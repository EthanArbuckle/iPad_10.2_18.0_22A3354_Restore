@implementation VKSelectableBarButtonItem

- (VKSelectableBarButtonItem)init
{
  VKSelectableBarButtonItem *v2;
  VKSelectableBarButtonContainerView *v3;
  VKSelectableBarButtonContainerView *toggleView;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VKSelectableBarButtonItem;
  v2 = -[UIBarItem init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(VKSelectableBarButtonContainerView);
    toggleView = v2->_toggleView;
    v2->_toggleView = v3;

    -[VKSelectableBarButtonItem setCustomView:](v2, "setCustomView:", v2->_toggleView);
  }
  return v2;
}

- (void)setTarget:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VKSelectableBarButtonItem;
  -[VKSelectableBarButtonItem setTarget:](&v7, sel_setTarget_, a3);
  -[VKSelectableBarButtonItem toggleView](self, "toggleView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "button");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "removeTarget:action:forControlEvents:", 0, 0, 0xFFFFFFFFLL);
  -[VKSelectableBarButtonItem target](self, "target");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addTarget:action:forControlEvents:", v6, -[VKSelectableBarButtonItem action](self, "action"), 64);

}

- (id)menu
{
  void *v2;
  void *v3;
  void *v4;

  -[VKSelectableBarButtonItem toggleView](self, "toggleView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "button");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "menu");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setMenu:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[VKSelectableBarButtonItem toggleView](self, "toggleView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "button");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMenu:", v4);

}

- (BOOL)showsMenuAsPrimaryAction
{
  void *v2;
  void *v3;
  char v4;

  -[VKSelectableBarButtonItem toggleView](self, "toggleView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "button");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "showsMenuAsPrimaryAction");

  return v4;
}

- (void)setShowsMenuAsPrimaryAction:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[VKSelectableBarButtonItem toggleView](self, "toggleView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "button");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowsMenuAsPrimaryAction:", v3);

}

- (void)setImage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VKSelectableBarButtonItem toggleView](self, "toggleView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v4);

}

- (id)image
{
  void *v2;
  void *v3;

  -[VKSelectableBarButtonItem toggleView](self, "toggleView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setAction:(SEL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VKSelectableBarButtonItem;
  -[VKSelectableBarButtonItem setAction:](&v7, sel_setAction_, a3);
  -[VKSelectableBarButtonItem toggleView](self, "toggleView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "button");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "removeTarget:action:forControlEvents:", 0, 0, 0xFFFFFFFFLL);
  -[VKSelectableBarButtonItem target](self, "target");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addTarget:action:forControlEvents:", v6, -[VKSelectableBarButtonItem action](self, "action"), 64);

}

- (void)setSelected:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VKSelectableBarButtonItem;
  -[VKSelectableBarButtonItem setSelected:](&v5, sel_setSelected_, a3);
  -[VKSelectableBarButtonItem toggleView](self, "toggleView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelected:", -[VKSelectableBarButtonItem isSelected](self, "isSelected"));

}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)VKSelectableBarButtonItem;
  -[VKSelectableBarButtonItem setEnabled:](&v7, sel_setEnabled_);
  -[VKSelectableBarButtonItem toggleView](self, "toggleView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "button");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", v3);

}

- (double)padding
{
  void *v2;
  double v3;
  double v4;

  -[VKSelectableBarButtonItem toggleView](self, "toggleView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "padding");
  v4 = v3;

  return v4;
}

- (void)setPadding:(double)a3
{
  id v4;

  -[VKSelectableBarButtonItem toggleView](self, "toggleView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPadding:", a3);

}

- (double)compactPadding
{
  void *v2;
  double v3;
  double v4;

  -[VKSelectableBarButtonItem toggleView](self, "toggleView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "compactPadding");
  v4 = v3;

  return v4;
}

- (void)setCompactPadding:(double)a3
{
  id v4;

  -[VKSelectableBarButtonItem toggleView](self, "toggleView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCompactPadding:", a3);

}

- (void)setCornerRadiusRatio:(double)a3
{
  id v4;

  -[VKSelectableBarButtonItem toggleView](self, "toggleView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadiusRatio:", a3);

}

- (void)setWidth:(double)a3
{
  id v4;

  -[VKSelectableBarButtonItem toggleView](self, "toggleView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWidth:", a3);

}

- (double)width
{
  void *v2;
  double v3;
  double v4;

  -[VKSelectableBarButtonItem toggleView](self, "toggleView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "width");
  v4 = v3;

  return v4;
}

+ (id)keyPathsForValuesAffectingAlpha
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("toggleView.alpha"));
}

- (void)setAlpha:(double)a3
{
  id v4;

  -[VKSelectableBarButtonItem toggleView](self, "toggleView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", a3);

}

- (double)alpha
{
  void *v2;
  double v3;
  double v4;

  -[VKSelectableBarButtonItem toggleView](self, "toggleView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alpha");
  v4 = v3;

  return v4;
}

- (VKSelectableBarButtonContainerView)toggleView
{
  return self->_toggleView;
}

- (void)setToggleView:(id)a3
{
  objc_storeStrong((id *)&self->_toggleView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toggleView, 0);
}

@end
