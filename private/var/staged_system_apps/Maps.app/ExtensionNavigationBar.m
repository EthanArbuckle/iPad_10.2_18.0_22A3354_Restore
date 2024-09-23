@implementation ExtensionNavigationBar

- (ExtensionNavigationBar)initWithFrame:(CGRect)a3
{
  ExtensionNavigationBar *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ExtensionNavigationBar;
  v3 = -[ExtensionNavigationBar initWithFrame:](&v11, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init((Class)MKViewWithHairline);
    -[ExtensionNavigationBar setHairlineView:](v3, "setHairlineView:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionNavigationBar hairlineView](v3, "hairlineView"));
    objc_msgSend(v5, "setUserInteractionEnabled:", 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionNavigationBar theme](v3, "theme"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hairlineColor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionNavigationBar hairlineView](v3, "hairlineView"));
    objc_msgSend(v8, "setHairlineColor:", v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionNavigationBar hairlineView](v3, "hairlineView"));
    -[ExtensionNavigationBar addSubview:](v3, "addSubview:", v9);

  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ExtensionNavigationBar;
  -[ExtensionNavigationBar layoutSubviews](&v13, "layoutSubviews");
  -[ExtensionNavigationBar bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionNavigationBar hairlineView](self, "hairlineView"));
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionNavigationBar hairlineView](self, "hairlineView"));
  -[ExtensionNavigationBar bringSubviewToFront:](self, "bringSubviewToFront:", v12);

}

- (MKViewWithHairline)hairlineView
{
  return self->_hairlineView;
}

- (void)setHairlineView:(id)a3
{
  objc_storeStrong((id *)&self->_hairlineView, a3);
}

- (BOOL)supressTransition
{
  return self->_supressTransition;
}

- (void)setSupressTransition:(BOOL)a3
{
  self->_supressTransition = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hairlineView, 0);
}

@end
