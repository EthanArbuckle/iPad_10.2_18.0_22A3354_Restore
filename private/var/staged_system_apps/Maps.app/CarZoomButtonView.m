@implementation CarZoomButtonView

- (CarZoomButtonView)initWithVisiblePanButton:(BOOL)a3
{
  _BOOL4 v3;
  CarZoomButtonView *v4;
  CarZoomButtonView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CarFocusableImageButton *v11;
  CarFocusableImageButton *panButton;
  void *v13;
  void *v14;
  void *v15;
  CarFocusableImageButton *v16;
  void *v17;
  CarFocusableImageButton *v18;
  CarFocusableImageButton *zoomInButton;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  CarFocusableImageButton *v25;
  void *v26;
  CarFocusableImageButton *v27;
  CarFocusableImageButton *zoomOutButton;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v36;
  _QWORD v37[2];
  _QWORD v38[2];
  void *v39;

  v3 = a3;
  v36.receiver = self;
  v36.super_class = (Class)CarZoomButtonView;
  v4 = -[CarMultiButtonView initWithFrame:](&v36, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v5 = v4;
  if (v4)
  {
    v4->_panButtonVisible = v3;
    if (v3)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "chromeViewController"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "traitCollection"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:compatibleWithTraitCollection:](UIImage, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("CarPan"), 0, v8));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "imageWithRenderingMode:", 2));

      v11 = -[CarFocusableImageButton initWithImage:]([CarFocusableImageButton alloc], "initWithImage:", v10);
      panButton = v5->_panButton;
      v5->_panButton = v11;

      -[CarFocusableImageButton setAccessibilityIdentifier:](v5->_panButton, "setAccessibilityIdentifier:", CFSTR("PanButton"));
      -[CarFocusableImageButton addTarget:action:forControlEvents:](v5->_panButton, "addTarget:action:forControlEvents:", v5, "_panPressed:", 64);
      -[CarFocusableBlurControl setCastsShadow:](v5->_panButton, "setCastsShadow:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("CarPlay_Pan"), CFSTR("localized string not found"), 0));
      v39 = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v39, 1));
      -[CarFocusableImageButton setAccessibilityUserInputLabels:](v5->_panButton, "setAccessibilityUserInputLabels:", v15);

    }
    v16 = [CarFocusableImageButton alloc];
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _mapsCar_systemImageNamed:textStyle:](UIImage, "_mapsCar_systemImageNamed:textStyle:", CFSTR("plus"), UIFontTextStyleSubheadline));
    v18 = -[CarFocusableImageButton initWithImage:](v16, "initWithImage:", v17);
    zoomInButton = v5->_zoomInButton;
    v5->_zoomInButton = v18;

    -[CarFocusableImageButton setAccessibilityIdentifier:](v5->_zoomInButton, "setAccessibilityIdentifier:", CFSTR("ZoomInButton"));
    -[CarFocusableImageButton addTarget:action:forControlEvents:](v5->_zoomInButton, "addTarget:action:forControlEvents:", v5, "_zoomInPressed:", 64);
    -[CarFocusableBlurControl setCastsShadow:](v5->_zoomInButton, "setCastsShadow:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("CarPlay_ZoomIn"), CFSTR("localized string not found"), 0));
    v38[0] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("CarPlay_Plus"), CFSTR("localized string not found"), 0));
    v38[1] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v38, 2));
    -[CarFocusableImageButton setAccessibilityUserInputLabels:](v5->_zoomInButton, "setAccessibilityUserInputLabels:", v24);

    v25 = [CarFocusableImageButton alloc];
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _mapsCar_systemImageNamed:textStyle:](UIImage, "_mapsCar_systemImageNamed:textStyle:", CFSTR("minus"), UIFontTextStyleSubheadline));
    v27 = -[CarFocusableImageButton initWithImage:](v25, "initWithImage:", v26);
    zoomOutButton = v5->_zoomOutButton;
    v5->_zoomOutButton = v27;

    -[CarFocusableImageButton setAccessibilityIdentifier:](v5->_zoomOutButton, "setAccessibilityIdentifier:", CFSTR("ZoomOutButton"));
    -[CarFocusableImageButton addTarget:action:forControlEvents:](v5->_zoomOutButton, "addTarget:action:forControlEvents:", v5, "_zoomOutPressed:", 64);
    -[CarFocusableBlurControl setCastsShadow:](v5->_zoomOutButton, "setCastsShadow:", 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("CarPlay_ZoomOut"), CFSTR("localized string not found"), 0));
    v37[0] = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("CarPlay_Minus"), CFSTR("localized string not found"), 0));
    v37[1] = v32;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v37, 2));
    -[CarFocusableImageButton setAccessibilityUserInputLabels:](v5->_zoomOutButton, "setAccessibilityUserInputLabels:", v33);

    -[CarZoomButtonView setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", CFSTR("CarZoomButtonView"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[CarZoomButtonView _availableButtons](v5, "_availableButtons"));
    -[CarMultiButtonView setButtons:](v5, "setButtons:", v34);

  }
  return v5;
}

- (void)setPanButtonVisible:(BOOL)a3
{
  id v4;

  if (self->_panButtonVisible != a3)
  {
    self->_panButtonVisible = a3;
    v4 = (id)objc_claimAutoreleasedReturnValue(-[CarZoomButtonView _availableButtons](self, "_availableButtons"));
    -[CarMultiButtonView setButtons:](self, "setButtons:", v4);

  }
}

- (id)_availableButtons
{
  CarFocusableImageButton *zoomInButton;
  CarFocusableImageButton **p_panButton;
  uint64_t v4;
  CarFocusableImageButton *v5;
  CarFocusableImageButton *v7;
  CarFocusableImageButton *v8;
  CarFocusableImageButton *panButton;
  CarFocusableImageButton *v10;
  CarFocusableImageButton *zoomOutButton;

  if (self->_panButtonVisible)
  {
    zoomInButton = self->_zoomInButton;
    panButton = self->_panButton;
    v10 = zoomInButton;
    zoomOutButton = self->_zoomOutButton;
    p_panButton = &panButton;
    v4 = 3;
  }
  else
  {
    v5 = self->_zoomOutButton;
    v7 = self->_zoomInButton;
    v8 = v5;
    p_panButton = &v7;
    v4 = 2;
  }
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", p_panButton, v4, v7, v8, panButton, v10, zoomOutButton));
}

- (void)_panPressed:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarZoomButtonView delegate](self, "delegate", a3));
  v5 = objc_opt_respondsToSelector(v4, "panButtonPressed");

  if ((v5 & 1) != 0)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[CarZoomButtonView delegate](self, "delegate"));
    objc_msgSend(v6, "panButtonPressed");

  }
}

- (void)_zoomInPressed:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarZoomButtonView delegate](self, "delegate", a3));
  v5 = objc_opt_respondsToSelector(v4, "zoomInButtonPressed");

  if ((v5 & 1) != 0)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[CarZoomButtonView delegate](self, "delegate"));
    objc_msgSend(v6, "zoomInButtonPressed");

  }
}

- (void)_zoomOutPressed:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarZoomButtonView delegate](self, "delegate", a3));
  v5 = objc_opt_respondsToSelector(v4, "zoomOutButtonPressed");

  if ((v5 & 1) != 0)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[CarZoomButtonView delegate](self, "delegate"));
    objc_msgSend(v6, "zoomOutButtonPressed");

  }
}

- (void)setZoomInEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;

  v3 = a3;
  if (-[CarFocusableImageButton isEnabled](self->_zoomInButton, "isEnabled") != a3)
  {
    v5 = sub_10043364C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = CFSTR("disabled");
      if (v3)
        v7 = CFSTR("enabled");
      v8 = 138412290;
      v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Setting zoom-in button %@", (uint8_t *)&v8, 0xCu);
    }

    -[CarFocusableControl setEnabled:](self->_zoomInButton, "setEnabled:", v3);
    if (-[CarFocusableImageButton isFocused](self->_zoomInButton, "isFocused"))
    {
      if (!v3)
      {
        -[CarZoomButtonView setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
        -[CarZoomButtonView updateFocusIfNeeded](self, "updateFocusIfNeeded");
      }
    }
  }
}

- (void)setZoomOutEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;

  v3 = a3;
  if (-[CarFocusableImageButton isEnabled](self->_zoomOutButton, "isEnabled") != a3)
  {
    v5 = sub_10043364C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = CFSTR("disabled");
      if (v3)
        v7 = CFSTR("enabled");
      v8 = 138412290;
      v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Setting zoom-out button %@", (uint8_t *)&v8, 0xCu);
    }

    -[CarFocusableControl setEnabled:](self->_zoomOutButton, "setEnabled:", v3);
    if (-[CarFocusableImageButton isFocused](self->_zoomOutButton, "isFocused"))
    {
      if (!v3)
      {
        -[CarZoomButtonView setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
        -[CarZoomButtonView updateFocusIfNeeded](self, "updateFocusIfNeeded");
      }
    }
  }
}

- (NSArray)focusOrderSubItems
{
  NSMutableArray *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = objc_opt_new(NSMutableArray);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarZoomButtonView _availableButtons](self, "_availableButtons", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "canBecomeFocused"))
          -[NSMutableArray addObject:](v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (BOOL)panButtonVisible
{
  return self->_panButtonVisible;
}

- (CarZoomButtonViewDelegate)delegate
{
  return (CarZoomButtonViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_zoomOutButton, 0);
  objc_storeStrong((id *)&self->_zoomInButton, 0);
  objc_storeStrong((id *)&self->_panButton, 0);
}

@end
