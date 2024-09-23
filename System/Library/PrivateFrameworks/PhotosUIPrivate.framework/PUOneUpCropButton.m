@implementation PUOneUpCropButton

- (PUOneUpCropButton)init
{
  PUOneUpCropButton *v2;
  PUOneUpCropButton *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  UIVisualEffectView *visualEffectView;
  void *v12;
  void *v13;
  uint64_t v14;
  _PUOneUpCropUIButton *button;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PUOneUpCropButton;
  v2 = -[PUOneUpCropButton init](&v17, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PUOneUpCropButton setOverrideUserInterfaceStyle:](v2, "setOverrideUserInterfaceStyle:", 2);
    -[PUOneUpCropButton layer](v3, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMasksToBounds:", 1);

    v5 = *MEMORY[0x1E0CD2A68];
    -[PUOneUpCropButton layer](v3, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCornerCurve:", v5);

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", v3);
    -[PUOneUpCropButton addInteraction:](v3, "addInteraction:", v7);
    -[PUOneUpCropButton setShowsLargeContentViewer:](v3, "setShowsLargeContentViewer:", 1);
    v8 = objc_alloc_init(MEMORY[0x1E0DC3998]);
    -[PUOneUpCropButton addInteraction:](v3, "addInteraction:", v8);

    v9 = objc_alloc(MEMORY[0x1E0DC3F58]);
    v10 = objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    visualEffectView = v3->_visualEffectView;
    v3->_visualEffectView = (UIVisualEffectView *)v10;

    +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "quickCropBackgroundBrightness");
    -[PUOneUpCropButton _backgroundEffectsWithBrightness:](v3, "_backgroundEffectsWithBrightness:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView setBackgroundEffects:](v3->_visualEffectView, "setBackgroundEffects:", v13);

    -[PUOneUpCropButton addSubview:](v3, "addSubview:", v3->_visualEffectView);
    -[PUOneUpCropButton _createButton](v3, "_createButton");
    v14 = objc_claimAutoreleasedReturnValue();
    button = v3->_button;
    v3->_button = (_PUOneUpCropUIButton *)v14;

    -[PUOneUpCropButton addSubview:](v3, "addSubview:", v3->_button);
  }
  return v3;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  BOOL v7;
  uint64_t v8;
  objc_super v13;
  CGPoint v14;
  CGRect v15;

  y = a3.y;
  x = a3.x;
  v13.receiver = self;
  v13.super_class = (Class)PUOneUpCropButton;
  v7 = -[PUOneUpCropButton pointInside:withEvent:](&v13, sel_pointInside_withEvent_, a4);
  -[PUOneUpCropButton bounds](self, "bounds");
  if (!CGRectIsEmpty(v15))
  {
    PXEdgeInsetsInvert();
    PXEdgeInsetsInsetRect();
    if (v7)
    {
      return 1;
    }
    else
    {
      v14.x = x;
      v14.y = y;
      return CGRectContainsPoint(*(CGRect *)&v8, v14);
    }
  }
  return v7;
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
  CGFloat v13;
  void *v14;
  objc_super v15;
  CGRect v16;

  v15.receiver = self;
  v15.super_class = (Class)PUOneUpCropButton;
  -[PUOneUpCropButton layoutSubviews](&v15, sel_layoutSubviews);
  -[PUOneUpCropButton bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PUOneUpCropButton visualEffectView](self, "visualEffectView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[PUOneUpCropButton button](self, "button");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);

  v16.origin.x = v4;
  v16.origin.y = v6;
  v16.size.width = v8;
  v16.size.height = v10;
  v13 = CGRectGetHeight(v16) * 0.5;
  -[PUOneUpCropButton layer](self, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCornerRadius:", v13);

}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PUOneUpCropButton button](self, "button");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInteractionEnabled:", v3);

}

- (BOOL)isEnabled
{
  void *v2;
  char v3;

  -[PUOneUpCropButton button](self, "button");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUserInteractionEnabled");

  return v3;
}

- (BOOL)isBeingTouched
{
  void *v2;
  char v3;

  -[PUOneUpCropButton button](self, "button");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isBeingTouched");

  return v3;
}

- (void)presentMenu
{
  void *v2;
  id v3;

  -[PUOneUpCropButton button](self, "button");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contextMenuInteraction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_presentMenuAtLocation:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

}

- (void)setPresentingMenu:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  if (self->_presentingMenu != a3)
  {
    v3 = a3;
    self->_presentingMenu = a3;
    -[PUOneUpCropButton delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "oneUpCropButton:menuPresentedDidChange:", self, v3);

  }
}

- (void)setTargeted:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  if (self->_targeted != a3)
  {
    v3 = a3;
    self->_targeted = a3;
    -[PUOneUpCropButton delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "oneUpCropButton:pointerTargetDidChange:", self, v3);

  }
}

- (void)_didTapButton:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  -[PUOneUpCropButton _aspectRatioSizeForAspectRatio:](self, "_aspectRatioSizeForAspectRatio:", -[PUOneUpCropButton _defaultAspectRatio](self, "_defaultAspectRatio", a3));
  v5 = v4;
  v7 = v6;
  -[PUOneUpCropButton delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "oneUpCropButton:didSelectAspectRatio:", self, v5, v7);

}

- (id)_createButton
{
  _PUOneUpCropUIButton *v3;
  _PUOneUpCropUIButton *v4;
  void *v5;
  void *v6;
  int v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double Width;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  _QWORD v20[2];
  CGRect v21;

  v20[1] = *MEMORY[0x1E0C80C00];
  v3 = [_PUOneUpCropUIButton alloc];
  v4 = -[_PUOneUpCropUIButton initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[_PUOneUpCropUIButton setDelegate:](v4, "setDelegate:", self);
  if (_createButton_onceToken != -1)
    dispatch_once(&_createButton_onceToken, &__block_literal_global_1985);
  PULocalizedString(CFSTR("PHOTOEDIT_QUICK_CROP_BUTTON"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "quickCropUseSymbol"))
    {

    }
    else
    {
      v7 = _createButton_simulateLongLocalizedStrings;

      if (!v7)
      {
        v8 = *MEMORY[0x1E0DC1420];
        objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 10.5, *MEMORY[0x1E0DC1420]);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[PUOneUpCropButton _size](PUOneUpCropButton, "_size");
        v11 = v10 + -18.0;
        v19 = *MEMORY[0x1E0DC1138];
        v20[0] = v9;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "boundingRectWithSize:options:attributes:context:", 0, v12, 0, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
        Width = CGRectGetWidth(v21);

        if (Width <= v11)
        {
          objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 15.0, v8);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[_PUOneUpCropUIButton setTitle:forState:](v4, "setTitle:forState:", v5, 0);
          -[_PUOneUpCropUIButton titleLabel](v4, "titleLabel");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setFont:", v14);
          objc_msgSend(v15, "setAdjustsFontSizeToFitWidth:", 1);
          objc_msgSend(v15, "setMinimumScaleFactor:", 0.7);
          -[_PUOneUpCropUIButton setContentEdgeInsets:](v4, "setContentEdgeInsets:", 0.0, 9.0, 0.0, 9.0);
          goto LABEL_9;
        }
      }
    }
  }
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:", 7, 14.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("crop"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PUOneUpCropUIButton setImage:forState:](v4, "setImage:forState:", v15, 0);
LABEL_9:

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PUOneUpCropUIButton setTintColor:](v4, "setTintColor:", v16);

  -[PUOneUpCropButton _aspectRatioMenu](self, "_aspectRatioMenu");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PUOneUpCropUIButton setMenu:](v4, "setMenu:", v17);

  -[_PUOneUpCropUIButton addTarget:action:forControlEvents:](v4, "addTarget:action:forControlEvents:", self, sel__didTapButton_, 64);
  return v4;
}

- (id)_backgroundEffectsWithBrightness:(double)a3
{
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
  _QWORD v15[6];

  v15[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithBlurRadius:", 30.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0DC3F50];
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "effectCompositingColor:withMode:alpha:", v6, 1010, 0.12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v7;
  v8 = (void *)MEMORY[0x1E0DC3660];
  objc_msgSend(MEMORY[0x1E0DC3870], "pu_PhotosUIImageNamed:", CFSTR("PUQuickCropButtonLuminanceMap"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "colorEffectLuminanceMap:blendingAmount:", v9, 0.7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v10;
  objc_msgSend(MEMORY[0x1E0DC3660], "colorEffectSaturate:", 2.8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v11;
  objc_msgSend(MEMORY[0x1E0DC3660], "colorEffectBrightness:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)_portrait
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[PUOneUpCropButton delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "oneUpCropButtonBoundingSize:", self);
  v5 = v4;
  v7 = v6;

  return v5 < v7;
}

- (id)_identifierForAspectRatio:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return CFSTR("PUOneUpCropButtonAspectRatioFullscreen");
  else
    return off_1E589AF30[a3 - 1];
}

- (unint64_t)_defaultAspectRatio
{
  void *v4;
  void *v5;
  id v6;
  unint64_t i;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (-[PUOneUpCropButton loadedDefaultAspectRatio](self, "loadedDefaultAspectRatio"))
    return -[PUOneUpCropButton cachedDefaultAspectRatio](self, "cachedDefaultAspectRatio");
  -[PUOneUpCropButton setLoadedDefaultAspectRatio:](self, "setLoadedDefaultAspectRatio:", 1);
  -[PUOneUpCropButton _userDefaults](self, "_userDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("PUOneUpCropButtonDefaultAspectRatioKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;

    if (v6)
      goto LABEL_9;
  }
  else
  {

  }
  -[PUOneUpCropButton _identifierForAspectRatio:](self, "_identifierForAspectRatio:", 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
  for (i = 0; i != 4; ++i)
  {
    -[PUOneUpCropButton _identifierForAspectRatio:](self, "_identifierForAspectRatio:", i);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToString:", v6) & 1) != 0)
    {
      -[PUOneUpCropButton setCachedDefaultAspectRatio:](self, "setCachedDefaultAspectRatio:", i);

      goto LABEL_16;
    }

  }
  PLPhotoEditGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_ERROR, "Quick crop failed to restore aspect ratio with identifier %@", (uint8_t *)&v10, 0xCu);
  }

  -[PUOneUpCropButton setCachedDefaultAspectRatio:](self, "setCachedDefaultAspectRatio:", 0);
  i = 0;
LABEL_16:

  return i;
}

- (void)_setDefaultAspectRatio:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[PUOneUpCropButton _identifierForAspectRatio:](self, "_identifierForAspectRatio:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpCropButton _userDefaults](self, "_userDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v5, CFSTR("PUOneUpCropButtonDefaultAspectRatioKey"));

  -[PUOneUpCropButton setCachedDefaultAspectRatio:](self, "setCachedDefaultAspectRatio:", a3);
  -[PUOneUpCropButton setLoadedDefaultAspectRatio:](self, "setLoadedDefaultAspectRatio:", 1);
  v7 = (void *)MEMORY[0x1E0D09910];
  v9 = CFSTR("aspectRatio");
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.quickCrop.aspectRatioChanged"), v8);

}

- (CGSize)_aspectRatioSizeForAspectRatio:(unint64_t)a3
{
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  _BOOL4 v9;
  double v10;
  double v11;
  void *v13;
  CGSize result;

  v4 = 1.0;
  v5 = 1.0;
  switch(a3)
  {
    case 0uLL:
      v4 = *MEMORY[0x1E0C9D820];
      v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      break;
    case 1uLL:
      -[PUOneUpCropButton delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "oneUpCropButtonOriginalAspectRatio:", self);
      v4 = v7;
      v5 = v8;

      break;
    case 2uLL:
      break;
    case 3uLL:
      v9 = -[PUOneUpCropButton _portrait](self, "_portrait");
      if (v9)
        v4 = 9.0;
      else
        v4 = 16.0;
      if (v9)
        v5 = 16.0;
      else
        v5 = 9.0;
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpCropButton.m"), 343, CFSTR("Code which should be unreachable has been reached"));

      abort();
  }
  v10 = v4;
  v11 = v5;
  result.height = v11;
  result.width = v10;
  return result;
}

- (id)_aspectRatioMenu
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void (**)(_QWORD, _QWORD));
  void *v11;
  id v12;
  id location;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0DC36F8];
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __37__PUOneUpCropButton__aspectRatioMenu__block_invoke;
  v11 = &unk_1E58A4AA0;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v2, "elementWithUncachedProvider:", &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0DC39D0];
  v14[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1, v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "menuWithTitle:image:identifier:options:children:", &stru_1E58AD278, 0, 0, 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v6;
}

- (id)_aspectRatioMenuActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  -[PUOneUpCropButton _actionForAspectRatio:](self, "_actionForAspectRatio:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpCropButton _actionForAspectRatio:](self, "_actionForAspectRatio:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpCropButton _actionForAspectRatio:](self, "_actionForAspectRatio:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpCropButton _actionForAspectRatio:](self, "_actionForAspectRatio:", 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v9[1] = v4;
  v9[2] = v6;
  v9[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_actionForAspectRatio:(unint64_t)a3
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  const __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21[2];
  id location;

  v5 = -[PUOneUpCropButton _portrait](self, "_portrait");
  switch(a3)
  {
    case 0uLL:
      PULocalizedString(CFSTR("PHOTOEDIT_QUICK_CROP_FULLSCREEN_TITLE"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "userInterfaceIdiom");

      if (v8)
      {
        v9 = CFSTR("ipad.landscape");
        v10 = CFSTR("ipad");
      }
      else
      {
        v9 = CFSTR("iphone.landscape");
        v10 = CFSTR("iphone");
      }
      goto LABEL_9;
    case 1uLL:
      PULocalizedString(CFSTR("PHOTOEDIT_CROP_ASPECT_RATIO_ORIGINAL"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("photo");
      break;
    case 2uLL:
      PULocalizedString(CFSTR("PHOTOEDIT_CROP_ASPECT_RATIO_SQUARE"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("square");
      break;
    case 3uLL:
      -[PUOneUpCropButton _aspectRatioSizeForAspectRatio:](self, "_aspectRatioSizeForAspectRatio:", 3);
      PULocalizedString(CFSTR("PHOTOEDIT_QUICK_CROP_WIDESCREEN_TITLE"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      PXLocalizedStringFromInteger();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      PXLocalizedStringFromInteger();
      v18 = v13;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      PUStringWithValidatedFormat();
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = CFSTR("rectangle.ratio.16.to.9");
      v10 = CFSTR("rectangle.ratio.9.to.16");
LABEL_9:
      if (v5)
        v9 = (__CFString *)v10;
      v11 = v9;
      break;
    default:
      v11 = 0;
      v6 = 0;
      break;
  }
  objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", v11, v18, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("rectangle.portrait"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_initWeak(&location, self);
  v15 = (void *)MEMORY[0x1E0DC3428];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __43__PUOneUpCropButton__actionForAspectRatio___block_invoke;
  v20[3] = &unk_1E58AB620;
  objc_copyWeak(v21, &location);
  v21[1] = (id)a3;
  objc_msgSend(v15, "actionWithTitle:image:identifier:handler:", v6, v14, 0, v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PUOneUpCropButton _defaultAspectRatio](self, "_defaultAspectRatio") == a3)
    objc_msgSend(v16, "setState:", 1);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);

  return v16;
}

- (id)largeContentTitle
{
  return PULocalizedString(CFSTR("PHOTOEDIT_QUICK_CROP_BUTTON"));
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;

  v6 = (void *)MEMORY[0x1E0DC3B28];
  v7 = a5;
  -[PUOneUpCropButton bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v7, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "regionWithRect:identifier:", v16, v9, v11, v13, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  CGRect v19;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:", self);
  objc_msgSend(MEMORY[0x1E0DC3B20], "effectWithPreview:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0DC3B30];
  -[PUOneUpCropButton frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[PUOneUpCropButton frame](self, "frame");
  objc_msgSend(v7, "shapeWithRoundedRect:cornerRadius:", v9, v11, v13, v15, CGRectGetHeight(v19) * 0.5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v6, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  -[PUOneUpCropButton setTargeted:](self, "setTargeted:", 1, a4, a5);
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  -[PUOneUpCropButton setTargeted:](self, "setTargeted:", 0, a4, a5);
}

- (void)oneUpCropUIButton:(id)a3 menuPresentedDidChange:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;

  v4 = a4;
  if (a4)
  {
    v6 = (void *)MEMORY[0x1E0D7B650];
    objc_msgSend(MEMORY[0x1E0D7B650], "quickCropTipID", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTipActionPerformed:", v7);

  }
  -[PUOneUpCropButton setPresentingMenu:](self, "setPresentingMenu:", v4);
}

- (PUOneUpCropButtonDelegate)delegate
{
  return (PUOneUpCropButtonDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)presentingMenu
{
  return self->_presentingMenu;
}

- (BOOL)targeted
{
  return self->_targeted;
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (void)setVisualEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_visualEffectView, a3);
}

- (_PUOneUpCropUIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (unint64_t)cachedDefaultAspectRatio
{
  return self->_cachedDefaultAspectRatio;
}

- (void)setCachedDefaultAspectRatio:(unint64_t)a3
{
  self->_cachedDefaultAspectRatio = a3;
}

- (BOOL)loadedDefaultAspectRatio
{
  return self->_loadedDefaultAspectRatio;
}

- (void)setLoadedDefaultAspectRatio:(BOOL)a3
{
  self->_loadedDefaultAspectRatio = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __43__PUOneUpCropButton__actionForAspectRatio___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setDefaultAspectRatio:", *(_QWORD *)(a1 + 40));

}

void __37__PUOneUpCropButton__aspectRatioMenu__block_invoke(uint64_t a1, void (**a2)(_QWORD, _QWORD))
{
  id *v3;
  void (**v4)(_QWORD, _QWORD);
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_aspectRatioMenuActions");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = v5;
  else
    v7 = MEMORY[0x1E0C9AA60];
  a2[2](v4, v7);

}

void __34__PUOneUpCropButton__createButton__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  _createButton_simulateLongLocalizedStrings = objc_msgSend(v0, "BOOLForKey:", CFSTR("NSDoubleLocalizedStrings"));

}

+ (CGRect)frameForWindow:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  __int128 v7;
  __int128 v8;
  CGRect result;

  v7 = 0u;
  v8 = 0u;
  objc_msgSend(a3, "bounds");
  +[PUPhotoEditLayoutSupport getTopLeadingButtonFrame:topTrailingButtonFrame:inBounds:inRTL:](PUPhotoEditLayoutSupport, "getTopLeadingButtonFrame:topTrailingButtonFrame:inBounds:inRTL:", 0, &v7, 0);
  v4 = *((double *)&v7 + 1);
  v3 = *(double *)&v7;
  v6 = *((double *)&v8 + 1);
  v5 = *(double *)&v8;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

+ (CGSize)_size
{
  double v2;
  double v3;
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  CGSize result;

  v8 = *MEMORY[0x1E0C9D820];
  v7 = *MEMORY[0x1E0DC51A8];
  v6 = 0;
  v4 = v8;
  v5 = v7;
  +[PUPhotoEditLayoutSupport currentDeviceButtonSize:offset:zoomedSize:zoomedOffset:normalScreenWidth:](PUPhotoEditLayoutSupport, "currentDeviceButtonSize:offset:zoomedSize:zoomedOffset:normalScreenWidth:", &v8, &v7, &v4, &v5, &v6);
  v3 = *((double *)&v8 + 1);
  v2 = *(double *)&v8;
  result.height = v3;
  result.width = v2;
  return result;
}

@end
