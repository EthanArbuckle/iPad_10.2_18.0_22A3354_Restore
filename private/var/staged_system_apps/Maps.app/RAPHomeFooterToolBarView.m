@implementation RAPHomeFooterToolBarView

- (RAPHomeFooterToolBarView)initWithFrame:(CGRect)a3
{
  RAPHomeFooterToolBarView *v3;
  RAPHomeFooterToolBarView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RAPHomeFooterToolBarView;
  v3 = -[RAPHomeFooterToolBarView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[RAPHomeFooterToolBarView _setupSubviews](v3, "_setupSubviews");
    -[RAPHomeFooterToolBarView _setupConstraints](v4, "_setupConstraints");
    -[RAPHomeFooterToolBarView _refreshToolbarItems](v4, "_refreshToolbarItems");
  }
  return v4;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RAPHomeFooterToolBarView;
  -[RAPHomeFooterToolBarView layoutSubviews](&v3, "layoutSubviews");
  -[RAPHomeFooterToolBarView _refreshToolbarItems](self, "_refreshToolbarItems");
}

- (void)_setupSubviews
{
  UIToolbar *v3;
  UIToolbar *toolBar;
  UIToolbar *v5;
  UIImage *v6;
  UIToolbar *v7;
  void *v8;

  v3 = (UIToolbar *)objc_msgSend(objc_alloc((Class)UIToolbar), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  toolBar = self->_toolBar;
  self->_toolBar = v3;

  v5 = self->_toolBar;
  v6 = objc_opt_new(UIImage);
  -[UIToolbar setBackgroundImage:forToolbarPosition:barMetrics:](v5, "setBackgroundImage:forToolbarPosition:barMetrics:", v6, 0, 0);

  v7 = self->_toolBar;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UIToolbar setBackgroundColor:](v7, "setBackgroundColor:", v8);

  -[UIToolbar setTranslucent:](self->_toolBar, "setTranslucent:", 1);
  -[UIToolbar setTranslatesAutoresizingMaskIntoConstraints:](self->_toolBar, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIToolbar setAccessibilityIdentifier:](self->_toolBar, "setAccessibilityIdentifier:", CFSTR("RAPHomeFooterToolBar"));
  -[RAPHomeFooterToolBarView addSubview:](self, "addSubview:", self->_toolBar);
}

- (void)_setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIToolbar topAnchor](self->_toolBar, "topAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RAPHomeFooterToolBarView topAnchor](self, "topAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v14));
  v16[0] = v13;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIToolbar bottomAnchor](self->_toolBar, "bottomAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPHomeFooterToolBarView bottomAnchor](self, "bottomAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:", v4));
  v16[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIToolbar leadingAnchor](self->_toolBar, "leadingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPHomeFooterToolBarView leadingAnchor](self, "leadingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v7));
  v16[2] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIToolbar trailingAnchor](self->_toolBar, "trailingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPHomeFooterToolBarView trailingAnchor](self, "trailingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
  v16[3] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (void)_refreshToolbarItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UIButton *v7;
  UIButton *createButton;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[3];

  if (!self->_createButton)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration"));
    objc_msgSend(v3, "setImagePadding:", 4.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("[Reports] Report a New Issue"), CFSTR("localized string not found"), 0));
    objc_msgSend(v3, "setTitle:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("square.and.pencil")));
    objc_msgSend(v3, "setImage:", v6);

    v7 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v3, 0));
    -[UIButton setPreferredMenuElementOrder:](v7, "setPreferredMenuElementOrder:", 2);
    -[UIButton setShowsMenuAsPrimaryAction:](v7, "setShowsMenuAsPrimaryAction:", 1);
    createButton = self->_createButton;
    self->_createButton = v7;

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPHomeFooterToolBarView delegate](self, "delegate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "menuForRAPHomeFooterToolBarView:", self));
  -[UIButton setMenu:](self->_createButton, "setMenu:", v10);

  -[UIButton addTarget:action:forControlEvents:](self->_createButton, "addTarget:action:forControlEvents:", self, "tapCreateButton", 0x4000);
  v11 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithCustomView:", self->_createButton);
  v12 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  v14[0] = v12;
  v14[1] = v11;
  v14[2] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 3));
  -[UIToolbar setItems:](self->_toolBar, "setItems:", v13);

}

- (void)tapCreateButton
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[RAPHomeFooterToolBarView delegate](self, "delegate"));
  objc_msgSend(v3, "tappedMenuForRAPHomeFooterToolBarView:", self);

}

- (RAPHomeFooterToolBarViewDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_createButton, 0);
  objc_storeStrong((id *)&self->_toolBar, 0);
}

@end
