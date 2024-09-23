@implementation PSEditingPane

+ (id)defaultBackgroundColor
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  +[PSListController appearance](PSListController, "appearance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[PSListController appearance](PSListController, "appearance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "backgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGroupedBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

+ (float)preferredHeight
{
  return -1.0;
}

- (PSEditingPane)initWithFrame:(CGRect)a3
{
  PSEditingPane *v3;
  PSEditingPane *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PSEditingPane;
  v3 = -[PSEditingPane initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PSEditingPane setAutoresizingMask:](v3, "setAutoresizingMask:", 18);
  return v4;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (void)setPreferenceSpecifier:(id)a3
{
  PSSpecifier *v5;
  PSSpecifier *v6;

  v5 = (PSSpecifier *)a3;
  if (self->_specifier != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_specifier, a3);
    v5 = v6;
  }

}

- (id)preferenceSpecifier
{
  return self->_specifier;
}

- (id)preferenceValue
{
  return 0;
}

- (BOOL)requiresKeyboard
{
  return *((_BYTE *)self + 432) & 1;
}

- (id)specifierLabel
{
  return -[PSSpecifier name](self->_specifier, "name");
}

- (BOOL)wantsNewButton
{
  return 0;
}

- (BOOL)handlesDoneButton
{
  return 0;
}

- (BOOL)changed
{
  return 0;
}

- (BOOL)shouldInsetContent
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "sf_isiPad"))
    v3 = PSIsRunningInAssistant() ^ 1;
  else
    LOBYTE(v3) = 0;

  return v3;
}

- (void)insetContent
{
  void *v3;
  id v4;

  -[PSEditingPane scrollViewToBeInsetted](self, "scrollViewToBeInsetted");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v4, "setScrollIndicatorInsets:", 0.0, 0.0, 0.0, -PSTableViewSideInset());
    objc_msgSend(v4, "setClipsToBounds:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "groupTableViewBackgroundColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSEditingPane setBackgroundColor:](self, "setBackgroundColor:", v3);

  }
}

- (void)layoutInsetContent:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v7;
  id v8;
  CGRect v9;
  CGRect v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PSEditingPane scrollViewToBeInsetted](self, "scrollViewToBeInsetted");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v7 = PSTableViewSideInset();
    v9.origin.x = x;
    v9.origin.y = y;
    v9.size.width = width;
    v9.size.height = height;
    v10 = CGRectInset(v9, v7, 0.0);
    objc_msgSend(v8, "setFrame:", v10.origin.x, v10.origin.y, v10.size.width, v10.size.height);
  }

}

- (id)childViewControllerForHostingViewController
{
  return 0;
}

- (id)scrollViewToBeInsetted
{
  uint64_t v3;

  v3 = objc_opt_class();
  return PSFindViewOfClass(self, v3);
}

- (UIViewController)viewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (void)setViewController:(id)a3
{
  objc_storeWeak((id *)&self->_viewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewController);
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_specifier, 0);
}

@end
