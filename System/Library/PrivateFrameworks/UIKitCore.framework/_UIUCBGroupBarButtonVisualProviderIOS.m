@implementation _UIUCBGroupBarButtonVisualProviderIOS

- (void)setTintColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

+ (id)lightKeyboardProvider
{
  _BYTE *v2;

  v2 = objc_alloc_init((Class)a1);
  v2[80] = 1;
  return v2;
}

+ (id)darkKeyboardProvider
{
  _BYTE *v2;

  v2 = objc_alloc_init((Class)a1);
  v2[80] = 0;
  return v2;
}

- (int64_t)_securePasteButtonSite
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  UIColor **v5;
  UIColor **v6;
  UIColor *v7;
  UIColor *tintColor;
  char v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIUCBGroupBarButtonVisualProviderIOS;
  if (-[_UIButtonBarButtonVisualProvider isEqual:](&v12, sel_isEqual_, v4))
  {
    v5 = (UIColor **)v4;
    v6 = v5;
    if (*((unsigned __int8 *)v5 + 80) != self->_lightKeyboard)
      goto LABEL_9;
    v7 = v5[11];
    tintColor = self->_tintColor;
    if (v7 == tintColor)
    {
      v10 = 1;
      goto LABEL_12;
    }
    if (!v7 || tintColor == 0)
LABEL_9:
      v10 = 0;
    else
      v10 = -[UIColor isEqual:](v7, "isEqual:");
LABEL_12:

    goto LABEL_13;
  }
  v10 = 0;
LABEL_13:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIUCBGroupBarButtonVisualProviderIOS;
  v4 = -[_UIButtonBarButtonVisualProvider copyWithZone:](&v6, sel_copyWithZone_, a3);
  *((_BYTE *)v4 + 80) = self->_lightKeyboard;
  objc_storeStrong((id *)v4 + 11, self->_tintColor);
  return v4;
}

- (void)updateButton:(id)a3 forSelectedState:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  id WeakRetained;
  char v8;
  id v9;
  id v10;
  id v11;

  v4 = a4;
  v11 = a3;
  if (v4)
  {
    +[UIColor systemBlueColor](UIColor, "systemBlueColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->super.super._barButtonItem);
    v8 = objc_msgSend(WeakRetained, "isKeyboardItem");

    if ((v8 & 1) != 0 || (v9 = objc_loadWeakRetained((id *)&self->_appearanceDelegate), v9, !v9))
    {
      v6 = 0;
    }
    else
    {
      v10 = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
      objc_msgSend(v10, "tintColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  -[UIButton setTintColor:](self->super._contentButton, "setTintColor:", v6);

}

- (id)imageSymbolConfiguration
{
  _UIButtonBarAppearanceDelegate **p_appearanceDelegate;
  id WeakRetained;
  void *v4;
  id v5;
  char v6;
  id v7;
  void *v8;

  p_appearanceDelegate = &self->_appearanceDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
  if (WeakRetained
    && (v4 = WeakRetained,
        v5 = objc_loadWeakRetained((id *)p_appearanceDelegate),
        v6 = objc_opt_respondsToSelector(),
        v5,
        v4,
        (v6 & 1) != 0))
  {
    v7 = objc_loadWeakRetained((id *)p_appearanceDelegate);
    objc_msgSend(v7, "imageSymbolConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)updateButton:(id)a3 toUseButtonShapes:(BOOL)a4
{
  -[_UIUCBKBSelectionBackground setShowButtonShape:](self->_selectionBackgroundView, "setShowButtonShape:", a4);
}

- (void)configureButton:(id)a3 withAppearanceDelegate:(id)a4 fromBarItem:(id)a5
{
  id v8;
  id v9;
  id v10;
  _UIUCBKBSelectionBackground *v11;
  _UIUCBKBSelectionBackground *selectionBackgroundView;
  _UIUCBKBSelectionBackground *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  objc_super v28;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  objc_storeWeak((id *)&self->_appearanceDelegate, v10);
  v28.receiver = self;
  v28.super_class = (Class)_UIUCBGroupBarButtonVisualProviderIOS;
  -[_UIUCBBarButtonVisualProviderIOS configureButton:withAppearanceDelegate:fromBarItem:](&v28, sel_configureButton_withAppearanceDelegate_fromBarItem_, v8, v10, v9);

  if (!self->_selectionBackgroundView)
  {
    v11 = objc_alloc_init(_UIUCBKBSelectionBackground);
    selectionBackgroundView = self->_selectionBackgroundView;
    self->_selectionBackgroundView = v11;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_selectionBackgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setUserInteractionEnabled:](self->_selectionBackgroundView, "setUserInteractionEnabled:", 0);
    -[_UIUCBKBSelectionBackground setShowButtonShape:](self->_selectionBackgroundView, "setShowButtonShape:", 0);
    v13 = self->_selectionBackgroundView;
    if (self->super._contentButton)
      objc_msgSend(v8, "insertSubview:below:", v13);
    else
      objc_msgSend(v8, "addSubview:", v13);
    -[UIView leadingAnchor](self->_selectionBackgroundView, "leadingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "leadingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setActive:", 1);

    -[UIView trailingAnchor](self->_selectionBackgroundView, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setActive:", 1);

    -[UIView topAnchor](self->_selectionBackgroundView, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, 6.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v23) = 1144750080;
    objc_msgSend(v22, "setPriority:", v23);
    objc_msgSend(v22, "setActive:", 1);
    -[UIView bottomAnchor](self->_selectionBackgroundView, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:constant:", v25, -6.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v27) = 1144750080;
    objc_msgSend(v26, "setPriority:", v27);
    objc_msgSend(v26, "setActive:", 1);

  }
}

- (BOOL)shouldLift
{
  _UIUCBKBSelectionBackground *selectionBackgroundView;

  selectionBackgroundView = self->_selectionBackgroundView;
  if (selectionBackgroundView)
    LOBYTE(selectionBackgroundView) = -[_UIUCBKBSelectionBackground showButtonShape](selectionBackgroundView, "showButtonShape");
  return (char)selectionBackgroundView;
}

- (CGPoint)menuAnchorPoint
{
  double v3;
  double v4;
  double v5;
  double v6;
  id WeakRetained;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double MidX;
  double v19;
  double v20;
  double v21;
  objc_super v22;
  CGPoint result;
  CGRect v24;

  v22.receiver = self;
  v22.super_class = (Class)_UIUCBGroupBarButtonVisualProviderIOS;
  -[_UIUCBBarButtonVisualProviderIOS menuAnchorPoint](&v22, sel_menuAnchorPoint);
  v4 = v3;
  v6 = v5;
  WeakRetained = objc_loadWeakRetained((id *)&self->super.super._barButtonItem);
  v8 = objc_msgSend(WeakRetained, "tag");

  if (v8 == 1735287116)
  {
    -[UIView superview](self->super.super._button, "superview");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView center](self->super.super._button, "center");
    v11 = v10;
    v13 = v12;
    -[UIView window](self->super.super._button, "window");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "convertPoint:toView:", v14, v11, v13);
    v16 = v15;

    -[UIView window](self->super.super._button, "window");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bounds");
    MidX = CGRectGetMidX(v24);

    v4 = 0.0;
    if (v16 <= MidX)
    {
      -[UIView bounds](self->super.super._button, "bounds");
      v4 = v19;
    }
  }
  v20 = v4;
  v21 = v6;
  result.y = v21;
  result.x = v20;
  return result;
}

- (id)tintColor
{
  return self->_tintColor;
}

- (BOOL)lightKeyboard
{
  return self->_lightKeyboard;
}

- (void)setLightKeyboard:(BOOL)a3
{
  self->_lightKeyboard = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_destroyWeak((id *)&self->_appearanceDelegate);
  objc_storeStrong((id *)&self->_selectionBackgroundView, 0);
}

@end
