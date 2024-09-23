@implementation _UIUCBPopoverBarButtonVisualProviderIOS

- (_UIUCBPopoverBarButtonVisualProviderIOS)init
{
  _UIUCBPopoverBarButtonVisualProviderIOS *v2;
  uint64_t v3;
  UIColor *selectionTintColor;
  uint64_t v5;
  UIColor *selectionBackgroundTintColor;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIUCBPopoverBarButtonVisualProviderIOS;
  v2 = -[_UIUCBPopoverBarButtonVisualProviderIOS init](&v8, sel_init);
  if (v2)
  {
    +[UIColor whiteColor](UIColor, "whiteColor");
    v3 = objc_claimAutoreleasedReturnValue();
    selectionTintColor = v2->_selectionTintColor;
    v2->_selectionTintColor = (UIColor *)v3;

    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0901960784, 0.494117647, 0.984313725, 1.0);
    v5 = objc_claimAutoreleasedReturnValue();
    selectionBackgroundTintColor = v2->_selectionBackgroundTintColor;
    v2->_selectionBackgroundTintColor = (UIColor *)v5;

  }
  return v2;
}

- (int64_t)_securePasteButtonSite
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIUCBPopoverBarButtonVisualProviderIOS;
  v4 = -[_UIButtonBarButtonVisualProvider copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setSelectionBackgroundTintColor:", self->_selectionBackgroundTintColor);
  objc_msgSend(v4, "setSelectionTintColor:", self->_selectionTintColor);
  return v4;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIUCBPopoverBarButtonVisualProviderIOS;
  v3 = -[_UIButtonBarButtonVisualProvider hash](&v6, sel_hash);
  v4 = -[UIColor hash](self->_selectionBackgroundTintColor, "hash") ^ v3;
  return v4 ^ -[UIColor hash](self->_selectionTintColor, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  UIColor *selectionTintColor;
  char v7;
  char v8;
  UIColor *selectionBackgroundTintColor;
  char v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIUCBPopoverBarButtonVisualProviderIOS;
  if (-[_UIButtonBarButtonVisualProvider isEqual:](&v12, sel_isEqual_, v4))
  {
    v5 = v4;
    selectionTintColor = self->_selectionTintColor;
    if (selectionTintColor == (UIColor *)v5[10])
      v7 = 1;
    else
      v7 = -[UIColor isEqual:](selectionTintColor, "isEqual:");
    selectionBackgroundTintColor = self->_selectionBackgroundTintColor;
    if (selectionBackgroundTintColor == (UIColor *)v5[9])
      v10 = 1;
    else
      v10 = -[UIColor isEqual:](selectionBackgroundTintColor, "isEqual:");
    v8 = v7 & v10;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)configureButton:(id)a3 withAppearanceDelegate:(id)a4 fromBarItem:(id)a5
{
  id v8;
  UIView *v9;
  UIView *selectionBackgroundView;
  int v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;

  v8 = a3;
  v25.receiver = self;
  v25.super_class = (Class)_UIUCBPopoverBarButtonVisualProviderIOS;
  -[_UIUCBBarButtonVisualProviderIOS configureButton:withAppearanceDelegate:fromBarItem:](&v25, sel_configureButton_withAppearanceDelegate_fromBarItem_, v8, a4, a5);
  if (!self->_selectionBackgroundView)
  {
    v9 = objc_alloc_init(UIView);
    selectionBackgroundView = self->_selectionBackgroundView;
    self->_selectionBackgroundView = v9;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_selectionBackgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setUserInteractionEnabled:](self->_selectionBackgroundView, "setUserInteractionEnabled:", 0);
    -[UIView setBackgroundColor:](self->_selectionBackgroundView, "setBackgroundColor:", self->_selectionBackgroundTintColor);
    -[UIView _setContinuousCornerRadius:](self->_selectionBackgroundView, "_setContinuousCornerRadius:", 2.0);
    v11 = objc_msgSend(v8, "isSelected");
    v12 = 0.0;
    if (v11)
      v12 = 1.0;
    -[UIView setAlpha:](self->_selectionBackgroundView, "setAlpha:", v12);
    objc_msgSend(v8, "insertSubview:below:", self->_selectionBackgroundView, self->super._contentButton);
    -[UIView leadingAnchor](self->_selectionBackgroundView, "leadingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "leadingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setActive:", 1);

    -[UIView trailingAnchor](self->_selectionBackgroundView, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setActive:", 1);

    -[UIView topAnchor](self->_selectionBackgroundView, "topAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setActive:", 1);

    -[UIView bottomAnchor](self->_selectionBackgroundView, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bottomAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setActive:", 1);

  }
}

- (void)updateButton:(id)a3 forSelectedState:(BOOL)a4
{
  UIColor *selectionTintColor;
  UIButton *contentButton;
  id v7;
  int v8;
  double v9;

  if (a4)
    selectionTintColor = self->_selectionTintColor;
  else
    selectionTintColor = 0;
  contentButton = self->super._contentButton;
  v7 = a3;
  -[UIButton setTintColor:](contentButton, "setTintColor:", selectionTintColor);
  v8 = objc_msgSend(v7, "isSelected");

  v9 = 0.0;
  if (v8)
    v9 = 1.0;
  -[UIView setAlpha:](self->_selectionBackgroundView, "setAlpha:", v9);
}

- (UIColor)selectionBackgroundTintColor
{
  return self->_selectionBackgroundTintColor;
}

- (void)setSelectionBackgroundTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_selectionBackgroundTintColor, a3);
}

- (UIColor)selectionTintColor
{
  return self->_selectionTintColor;
}

- (void)setSelectionTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_selectionTintColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionTintColor, 0);
  objc_storeStrong((id *)&self->_selectionBackgroundTintColor, 0);
  objc_storeStrong((id *)&self->_selectionBackgroundView, 0);
}

@end
