@implementation CRLiOSVibrantBackdropView

- (CRLiOSVibrantBackdropView)initWithCorners:(int64_t)a3 radius:(double)a4 style:(int64_t)a5
{
  CRLiOSVibrantBackdropView *v8;
  CRLiOSVibrantBackdropView *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CRLiOSVibrantBackdropView;
  v8 = -[CRLiOSVibrantBackdropView initWithFrame:](&v11, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v9 = v8;
  if (v8)
  {
    v8->_roundedCorners = a3;
    v8->_cornerRadius = a4;
    v8->_style = a5;
    v8->_selected = 0;
    -[CRLiOSVibrantBackdropView p_commonInit](v8, "p_commonInit");
  }
  return v9;
}

- (CRLiOSVibrantBackdropView)initWithFrame:(CGRect)a3
{
  CRLiOSVibrantBackdropView *v3;
  CRLiOSVibrantBackdropView *v4;

  v3 = -[CRLiOSVibrantBackdropView initWithFrame:](self, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[CRLiOSVibrantBackdropView p_commonInit](v3, "p_commonInit");
  return v4;
}

- (CRLiOSVibrantBackdropView)initWithCoder:(id)a3
{
  CRLiOSVibrantBackdropView *v3;
  CRLiOSVibrantBackdropView *v4;

  v3 = -[CRLiOSVibrantBackdropView initWithCoder:](self, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[CRLiOSVibrantBackdropView p_commonInit](v3, "p_commonInit");
  return v4;
}

- (void)p_commonInit
{
  id v3;
  id v4;
  void *v5;
  id v6;

  self->_normalStylePresetPair = 21;
  self->_highContrastStylePresetPair = 22;
  self->_activeStylePresetPair = 917525;
  self->_boldActiveStylePresetPair = 12;
  v6 = objc_alloc_init((Class)UIView);
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v6, "setUserInteractionEnabled:", 0);
  v3 = objc_alloc_init((Class)UIView);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "setUserInteractionEnabled:", 0);
  v4 = objc_alloc_init((Class)UIView);
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v4, "setUserInteractionEnabled:", 0);
  objc_msgSend(v4, "setAlpha:", 0.0);
  -[CRLiOSVibrantBackdropView setBaseBackdrop:](self, "setBaseBackdrop:", v6);
  -[CRLiOSVibrantBackdropView setOverlayBackdrop:](self, "setOverlayBackdrop:", v3);
  -[CRLiOSVibrantBackdropView setScrimBackdrop:](self, "setScrimBackdrop:", v4);
  -[CRLiOSVibrantBackdropView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "p_configureBackdropsForCurrentEffectiveStyle", UIAccessibilityDarkerSystemColorsStatusDidChangeNotification, 0);

}

+ (id)backdropViewForSoloButton:(id)a3 active:(BOOL)a4
{
  uint64_t v5;
  id v6;
  id v7;

  if (a4)
    v5 = 4;
  else
    v5 = 0;
  v6 = a3;
  v7 = objc_msgSend(objc_alloc((Class)a1), "initWithCorners:radius:style:", 5, v5, 7.5);
  objc_msgSend(v7, "linkStyleWithHighlightedStateOfButton:", v6);

  return v7;
}

+ (id)backdropViewForTieredButton:(id)a3 withPosition:(int64_t)a4
{
  uint64_t v5;
  id v6;
  id v7;

  if ((unint64_t)a4 > 4)
    v5 = 0;
  else
    v5 = qword_100EEFF98[a4];
  v6 = a3;
  v7 = objc_msgSend(objc_alloc((Class)a1), "initWithCorners:radius:style:", v5, 0, 7.5);
  objc_msgSend(v7, "linkStyleWithHighlightedStateOfButton:", v6);

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CRLiOSVibrantBackdropView;
  -[CRLiOSVibrantBackdropView dealloc](&v4, "dealloc");
}

- (void)willMoveToWindow:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (!v4)
    -[CRLiOSVibrantBackdropView p_resetSubviewHierarchy](self, "p_resetSubviewHierarchy");
  -[CRLiOSVibrantBackdropView setIsMovingToWindow:](self, "setIsMovingToWindow:", 1);
  v5.receiver = self;
  v5.super_class = (Class)CRLiOSVibrantBackdropView;
  -[CRLiOSVibrantBackdropView willMoveToWindow:](&v5, "willMoveToWindow:", v4);

}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLiOSVibrantBackdropView;
  -[CRLiOSVibrantBackdropView didMoveToWindow](&v4, "didMoveToWindow");
  -[CRLiOSVibrantBackdropView setIsMovingToWindow:](self, "setIsMovingToWindow:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSVibrantBackdropView window](self, "window"));

  if (v3)
    -[CRLiOSVibrantBackdropView p_setupSubviewHierarchy](self, "p_setupSubviewHierarchy");
}

- (void)p_resetSubviewHierarchy
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[CRLiOSVibrantBackdropView setUnableToFindBlurEffect:](self, "setUnableToFindBlurEffect:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSVibrantBackdropView baseBackdrop](self, "baseBackdrop"));
  objc_msgSend(v3, "removeFromSuperview");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSVibrantBackdropView overlayBackdrop](self, "overlayBackdrop"));
  objc_msgSend(v4, "removeFromSuperview");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSVibrantBackdropView visualEffectView](self, "visualEffectView"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSVibrantBackdropView visualEffectView](self, "visualEffectView"));
    objc_msgSend(v6, "removeFromSuperview");

    -[CRLiOSVibrantBackdropView setVisualEffectView:](self, "setVisualEffectView:", 0);
  }
}

- (void)p_setupSubviewHierarchy
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v3 = (unsigned __int16)-[CRLiOSVibrantBackdropView p_presetColorPairForStyle:](self, "p_presetColorPairForStyle:", -[CRLiOSVibrantBackdropView p_effectiveStyleForStyle:](self, "p_effectiveStyleForStyle:", self->_style));
  if (v3 == 2
    && (v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSVibrantBackdropView superview](self, "superview")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[CRLiOSVisualEffectHelper blurEffectProvidedByHierarchyOfView:](CRLiOSVisualEffectHelper, "blurEffectProvidedByHierarchyOfView:", v4)), v4, v5))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIVibrancyEffect effectForBlurEffect:style:](UIVibrancyEffect, "effectForBlurEffect:style:", v5, 6));
    v7 = objc_msgSend(objc_alloc((Class)UIVisualEffectView), "initWithEffect:", v6);
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CRLiOSVibrantBackdropView addSubview:](self, "addSubview:", v7);
    -[CRLiOSVibrantBackdropView p_constrainToSuperview:](self, "p_constrainToSuperview:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contentView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSVibrantBackdropView baseBackdrop](self, "baseBackdrop"));
    objc_msgSend(v8, "addSubview:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSVibrantBackdropView baseBackdrop](self, "baseBackdrop"));
    -[CRLiOSVibrantBackdropView p_constrainToSuperview:](self, "p_constrainToSuperview:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSVibrantBackdropView overlayBackdrop](self, "overlayBackdrop"));
    -[CRLiOSVibrantBackdropView addSubview:](self, "addSubview:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSVibrantBackdropView overlayBackdrop](self, "overlayBackdrop"));
    -[CRLiOSVibrantBackdropView p_constrainToSuperview:](self, "p_constrainToSuperview:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSVibrantBackdropView scrimBackdrop](self, "scrimBackdrop"));
    -[CRLiOSVibrantBackdropView addSubview:](self, "addSubview:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSVibrantBackdropView scrimBackdrop](self, "scrimBackdrop"));
    -[CRLiOSVibrantBackdropView p_constrainToSuperview:](self, "p_constrainToSuperview:", v14);

    -[CRLiOSVibrantBackdropView setVisualEffectView:](self, "setVisualEffectView:", v7);
  }
  else
  {
    -[CRLiOSVibrantBackdropView setUnableToFindBlurEffect:](self, "setUnableToFindBlurEffect:", v3 == 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSVibrantBackdropView baseBackdrop](self, "baseBackdrop"));
    -[CRLiOSVibrantBackdropView addSubview:](self, "addSubview:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSVibrantBackdropView baseBackdrop](self, "baseBackdrop"));
    -[CRLiOSVibrantBackdropView p_constrainToSuperview:](self, "p_constrainToSuperview:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSVibrantBackdropView overlayBackdrop](self, "overlayBackdrop"));
    -[CRLiOSVibrantBackdropView addSubview:](self, "addSubview:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSVibrantBackdropView overlayBackdrop](self, "overlayBackdrop"));
    -[CRLiOSVibrantBackdropView p_constrainToSuperview:](self, "p_constrainToSuperview:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSVibrantBackdropView scrimBackdrop](self, "scrimBackdrop"));
    -[CRLiOSVibrantBackdropView addSubview:](self, "addSubview:", v19);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSVibrantBackdropView scrimBackdrop](self, "scrimBackdrop"));
    -[CRLiOSVibrantBackdropView p_constrainToSuperview:](self, "p_constrainToSuperview:", v5);
  }

  -[CRLiOSVibrantBackdropView p_configureBackdropsForCurrentEffectiveStyle](self, "p_configureBackdropsForCurrentEffectiveStyle");
}

- (int64_t)p_alternateStyleForStyle:(int64_t)a3
{
  int64_t result;

  result = a3;
  if ((unint64_t)a3 <= 9)
    return qword_100EEFFC0[a3];
  return result;
}

- (int64_t)p_selectedStyleForStyle:(int64_t)a3
{
  int64_t result;

  result = a3;
  if ((unint64_t)a3 <= 9)
    return qword_100EF0010[a3];
  return result;
}

- (int64_t)p_effectiveStyleForStyle:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  unsigned int v7;
  int64_t v8;

  v5 = objc_claimAutoreleasedReturnValue(-[CRLiOSVibrantBackdropView touchedButton](self, "touchedButton"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = -[CRLiOSVibrantBackdropView isInsideTouchedButton](self, "isInsideTouchedButton");

    if (v7)
      a3 = -[CRLiOSVibrantBackdropView p_alternateStyleForStyle:](self, "p_alternateStyleForStyle:", a3);
  }
  if (self->_selected)
    a3 = -[CRLiOSVibrantBackdropView p_selectedStyleForStyle:](self, "p_selectedStyleForStyle:", a3);
  if (self->_alwaysUsesBoldActiveStyle || UIAccessibilityDarkerSystemColorsEnabled())
  {
    v8 = 6;
    if (a3 != 4)
      v8 = a3;
    if (a3 == 5)
      return 7;
    else
      return v8;
  }
  return a3;
}

- (int64_t)p_presetColorPairForStyle:(int64_t)a3
{
  int64_t v4;
  int64_t v5;

  switch(a3)
  {
    case 0:
    case 1:
      v4 = -[CRLiOSVibrantBackdropView normalStylePresetPair](self, "normalStylePresetPair");
      goto LABEL_7;
    case 2:
    case 3:
      v4 = -[CRLiOSVibrantBackdropView highContrastStylePresetPair](self, "highContrastStylePresetPair");
      goto LABEL_7;
    case 4:
    case 5:
      v4 = -[CRLiOSVibrantBackdropView activeStylePresetPair](self, "activeStylePresetPair");
      goto LABEL_7;
    case 6:
    case 7:
      v4 = -[CRLiOSVibrantBackdropView boldActiveStylePresetPair](self, "boldActiveStylePresetPair");
      goto LABEL_7;
    case 8:
    case 9:
      v4 = -[CRLiOSVibrantBackdropView noneStylePresetPair](self, "noneStylePresetPair");
LABEL_7:
      v5 = v4;
      break;
    default:
      v5 = 0;
      break;
  }
  if (-[CRLiOSVibrantBackdropView unableToFindBlurEffect](self, "unableToFindBlurEffect")
    && (unsigned __int16)v5 == 2)
  {
    return v5 & 0xFFFFFFFFFFFF0000 | 5;
  }
  else
  {
    return v5;
  }
}

- (void)p_configureBackdropsWithCorners:(int64_t)a3 radius:(double)a4 presetPair:(int64_t)a5
{
  uint64_t v9;
  _BOOL4 v10;
  void *v11;
  _BOOL4 v12;
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
  void *v25;
  id v26;

  v9 = (unsigned __int16)a5;
  v10 = (unsigned __int16)a5 != 2;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSVibrantBackdropView visualEffectView](self, "visualEffectView"));
  v12 = v11 != 0;

  if (((v10 ^ v12) & 1) == 0)
  {
    -[CRLiOSVibrantBackdropView p_resetSubviewHierarchy](self, "p_resetSubviewHierarchy");
    -[CRLiOSVibrantBackdropView p_setupSubviewHierarchy](self, "p_setupSubviewHierarchy");
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSVibrantBackdropView baseBackdrop](self, "baseBackdrop"));
  v14 = v13;
  if (v9)
  {
    objc_msgSend(v13, "setHidden:", 0);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[CRLiOSVisualEffectHelper sharedHelper](CRLiOSVisualEffectHelper, "sharedHelper"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSVibrantBackdropView baseBackdrop](self, "baseBackdrop"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "layer"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSVibrantBackdropView traitCollection](self, "traitCollection"));
    objc_msgSend(v14, "configureBackdropLayer:radius:corners:colorPreset:forTraitCollection:", v16, a3, v9, v17, a4);

  }
  else
  {
    objc_msgSend(v13, "setHidden:", 1);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSVibrantBackdropView overlayBackdrop](self, "overlayBackdrop"));
  v19 = v18;
  if ((unint64_t)a5 >= 0x10000)
  {
    objc_msgSend(v18, "setHidden:", 0);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[CRLiOSVisualEffectHelper sharedHelper](CRLiOSVisualEffectHelper, "sharedHelper"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSVibrantBackdropView overlayBackdrop](self, "overlayBackdrop"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "layer"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSVibrantBackdropView traitCollection](self, "traitCollection"));
    objc_msgSend(v19, "configureBackdropLayer:radius:corners:colorPreset:forTraitCollection:", v21, a3, a5 >> 16, v22, a4);

  }
  else
  {
    objc_msgSend(v18, "setHidden:", 1);
  }

  v26 = (id)objc_claimAutoreleasedReturnValue(+[CRLiOSVisualEffectHelper sharedHelper](CRLiOSVisualEffectHelper, "sharedHelper"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSVibrantBackdropView scrimBackdrop](self, "scrimBackdrop"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "layer"));
  if (self->_touchOverlayRoundsAllCorners)
    a3 = 5;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSVibrantBackdropView traitCollection](self, "traitCollection"));
  objc_msgSend(v26, "configureBackdropLayer:radius:corners:colorPreset:forTraitCollection:", v24, a3, 7, v25, a4);

}

- (void)p_configureBackdropsForCurrentEffectiveStyle
{
  int64_t v3;
  int64_t v4;

  v3 = -[CRLiOSVibrantBackdropView p_presetColorPairForStyle:](self, "p_presetColorPairForStyle:", -[CRLiOSVibrantBackdropView p_effectiveStyleForStyle:](self, "p_effectiveStyleForStyle:", -[CRLiOSVibrantBackdropView style](self, "style")));
  v4 = -[CRLiOSVibrantBackdropView roundedCorners](self, "roundedCorners");
  -[CRLiOSVibrantBackdropView cornerRadius](self, "cornerRadius");
  -[CRLiOSVibrantBackdropView p_configureBackdropsWithCorners:radius:presetPair:](self, "p_configureBackdropsWithCorners:radius:presetPair:", v4, v3);
}

- (void)p_didChangeColorPresets
{
  if (!-[CRLiOSVibrantBackdropView isMovingToWindow](self, "isMovingToWindow"))
    -[CRLiOSVibrantBackdropView p_configureBackdropsForCurrentEffectiveStyle](self, "p_configureBackdropsForCurrentEffectiveStyle");
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  -[CRLiOSVibrantBackdropView p_configureBackdropsForCurrentEffectiveStyle](self, "p_configureBackdropsForCurrentEffectiveStyle");
}

- (void)p_constrainToSuperview:(id)a3
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
  id v16;

  v16 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "superview"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "leadingAnchor"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v5));
    objc_msgSend(v6, "setActive:", 1);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "topAnchor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v8));
    objc_msgSend(v9, "setActive:", 1);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trailingAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
    objc_msgSend(v12, "setActive:", 1);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bottomAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bottomAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
    objc_msgSend(v15, "setActive:", 1);

  }
}

- (void)p_buttonTouchDown:(id)a3
{
  -[CRLiOSVibrantBackdropView setTouchedButton:](self, "setTouchedButton:", a3);
  -[CRLiOSVibrantBackdropView setIsInsideTouchedButton:](self, "setIsInsideTouchedButton:", 1);
  -[CRLiOSVibrantBackdropView p_configureBackdropsForCurrentEffectiveStyle](self, "p_configureBackdropsForCurrentEffectiveStyle");
}

- (void)p_buttonDragEnter:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSVibrantBackdropView touchedButton](self, "touchedButton"));

  if (v5 == v4)
  {
    -[CRLiOSVibrantBackdropView setIsInsideTouchedButton:](self, "setIsInsideTouchedButton:", 1);
    -[CRLiOSVibrantBackdropView p_configureBackdropsForCurrentEffectiveStyle](self, "p_configureBackdropsForCurrentEffectiveStyle");
  }
}

- (void)p_buttonDragExit:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSVibrantBackdropView touchedButton](self, "touchedButton"));

  if (v5 == v4)
  {
    -[CRLiOSVibrantBackdropView setIsInsideTouchedButton:](self, "setIsInsideTouchedButton:", 0);
    -[CRLiOSVibrantBackdropView p_configureBackdropsForCurrentEffectiveStyle](self, "p_configureBackdropsForCurrentEffectiveStyle");
  }
}

- (void)p_buttonTouchCancel:(id)a3
{
  -[CRLiOSVibrantBackdropView setTouchedButton:](self, "setTouchedButton:", 0);
  -[CRLiOSVibrantBackdropView setIsInsideTouchedButton:](self, "setIsInsideTouchedButton:", 0);
  -[CRLiOSVibrantBackdropView p_configureBackdropsForCurrentEffectiveStyle](self, "p_configureBackdropsForCurrentEffectiveStyle");
}

- (void)p_buttonTouchUpInside:(id)a3
{
  -[CRLiOSVibrantBackdropView p_buttonTouchCancel:](self, "p_buttonTouchCancel:", a3);
}

- (void)setRoundedCorners:(int64_t)a3
{
  if (self->_roundedCorners != a3)
  {
    self->_roundedCorners = a3;
    -[CRLiOSVibrantBackdropView p_configureBackdropsForCurrentEffectiveStyle](self, "p_configureBackdropsForCurrentEffectiveStyle");
  }
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    -[CRLiOSVibrantBackdropView p_configureBackdropsForCurrentEffectiveStyle](self, "p_configureBackdropsForCurrentEffectiveStyle");
  }
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    -[CRLiOSVibrantBackdropView p_configureBackdropsForCurrentEffectiveStyle](self, "p_configureBackdropsForCurrentEffectiveStyle");
  }
}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
  {
    self->_selected = a3;
    -[CRLiOSVibrantBackdropView p_configureBackdropsForCurrentEffectiveStyle](self, "p_configureBackdropsForCurrentEffectiveStyle");
  }
}

- (void)setAlwaysUsesBoldActiveStyle:(BOOL)a3
{
  if (self->_alwaysUsesBoldActiveStyle != a3)
  {
    self->_alwaysUsesBoldActiveStyle = a3;
    -[CRLiOSVibrantBackdropView p_configureBackdropsForCurrentEffectiveStyle](self, "p_configureBackdropsForCurrentEffectiveStyle");
  }
}

- (BOOL)isTouched
{
  double v2;

  -[UIView alpha](self->_overlayBackdrop, "alpha");
  return v2 != 0.0;
}

- (void)setTouched:(BOOL)a3
{
  -[UIView setAlpha:](self->_overlayBackdrop, "setAlpha:", (double)a3);
}

- (void)setTouchOverlayRoundsAllCorners:(BOOL)a3
{
  if (self->_touchOverlayRoundsAllCorners != a3)
    self->_touchOverlayRoundsAllCorners = a3;
  -[CRLiOSVibrantBackdropView p_configureBackdropsForCurrentEffectiveStyle](self, "p_configureBackdropsForCurrentEffectiveStyle");
}

- (void)linkStyleWithHighlightedStateOfButton:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "addTarget:action:forControlEvents:", self, "p_buttonTouchDown:", 1);
  objc_msgSend(v4, "addTarget:action:forControlEvents:", self, "p_buttonDragEnter:", 16);
  objc_msgSend(v4, "addTarget:action:forControlEvents:", self, "p_buttonDragExit:", 32);
  objc_msgSend(v4, "addTarget:action:forControlEvents:", self, "p_buttonTouchCancel:", 256);
  objc_msgSend(v4, "addTarget:action:forControlEvents:", self, "p_buttonTouchCancel:", 64);
  objc_msgSend(v4, "addTarget:action:forControlEvents:", self, "p_buttonTouchCancel:", 128);

}

- (void)unlinkStyleWithHighlightedStateOfButton:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "removeTarget:action:forControlEvents:", self, "p_buttonTouchDown:", 1);
  objc_msgSend(v4, "removeTarget:action:forControlEvents:", self, "p_buttonDragEnter:", 16);
  objc_msgSend(v4, "removeTarget:action:forControlEvents:", self, "p_buttonDragExit:", 32);
  objc_msgSend(v4, "removeTarget:action:forControlEvents:", self, "p_buttonTouchCancel:", 256);
  objc_msgSend(v4, "removeTarget:action:forControlEvents:", self, "p_buttonTouchCancel:", 64);
  objc_msgSend(v4, "removeTarget:action:forControlEvents:", self, "p_buttonTouchCancel:", 128);

}

- (int64_t)normalStylePresetPair
{
  return self->_normalStylePresetPair;
}

- (void)setNormalStylePresetPair:(int64_t)a3
{
  if (self->_normalStylePresetPair != a3)
  {
    self->_normalStylePresetPair = a3;
    -[CRLiOSVibrantBackdropView p_didChangeColorPresets](self, "p_didChangeColorPresets");
  }
}

- (int64_t)highContrastStylePresetPair
{
  return self->_highContrastStylePresetPair;
}

- (void)setHighContrastStylePresetPair:(int64_t)a3
{
  if (self->_highContrastStylePresetPair != a3)
  {
    self->_highContrastStylePresetPair = a3;
    -[CRLiOSVibrantBackdropView p_didChangeColorPresets](self, "p_didChangeColorPresets");
  }
}

- (int64_t)activeStylePresetPair
{
  return self->_activeStylePresetPair;
}

- (void)setActiveStylePresetPair:(int64_t)a3
{
  if (self->_activeStylePresetPair != a3)
  {
    self->_activeStylePresetPair = a3;
    -[CRLiOSVibrantBackdropView p_didChangeColorPresets](self, "p_didChangeColorPresets");
  }
}

- (int64_t)boldActiveStylePresetPair
{
  return self->_boldActiveStylePresetPair;
}

- (void)setBoldActiveStylePresetPair:(int64_t)a3
{
  if (self->_boldActiveStylePresetPair != a3)
  {
    self->_boldActiveStylePresetPair = a3;
    -[CRLiOSVibrantBackdropView p_didChangeColorPresets](self, "p_didChangeColorPresets");
  }
}

- (int64_t)noneStylePresetPair
{
  return self->_noneStylePresetPair;
}

- (void)setNoneStylePresetPair:(int64_t)a3
{
  if (self->_noneStylePresetPair != a3)
  {
    self->_noneStylePresetPair = a3;
    -[CRLiOSVibrantBackdropView p_didChangeColorPresets](self, "p_didChangeColorPresets");
  }
}

- (void)didEndScrimOpacityAnimation
{
  -[CRLiOSVibrantBackdropView p_configureBackdropsForCurrentEffectiveStyle](self, "p_configureBackdropsForCurrentEffectiveStyle");
}

- (BOOL)wantsScrimOpacityUpAnimation
{
  return 1;
}

- (int64_t)roundedCorners
{
  return self->_roundedCorners;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (int64_t)style
{
  return self->_style;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (BOOL)alwaysUsesBoldActiveStyle
{
  return self->_alwaysUsesBoldActiveStyle;
}

- (BOOL)touchOverlayRoundsAllCorners
{
  return self->_touchOverlayRoundsAllCorners;
}

- (UIView)baseBackdrop
{
  return self->_baseBackdrop;
}

- (void)setBaseBackdrop:(id)a3
{
  objc_storeStrong((id *)&self->_baseBackdrop, a3);
}

- (UIView)overlayBackdrop
{
  return self->_overlayBackdrop;
}

- (void)setOverlayBackdrop:(id)a3
{
  objc_storeStrong((id *)&self->_overlayBackdrop, a3);
}

- (UIView)scrimBackdrop
{
  return self->_scrimBackdrop;
}

- (void)setScrimBackdrop:(id)a3
{
  objc_storeStrong((id *)&self->_scrimBackdrop, a3);
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (void)setVisualEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_visualEffectView, a3);
}

- (BOOL)unableToFindBlurEffect
{
  return self->_unableToFindBlurEffect;
}

- (void)setUnableToFindBlurEffect:(BOOL)a3
{
  self->_unableToFindBlurEffect = a3;
}

- (UIButton)touchedButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_touchedButton);
}

- (void)setTouchedButton:(id)a3
{
  objc_storeWeak((id *)&self->_touchedButton, a3);
}

- (BOOL)isInsideTouchedButton
{
  return self->_isInsideTouchedButton;
}

- (void)setIsInsideTouchedButton:(BOOL)a3
{
  self->_isInsideTouchedButton = a3;
}

- (BOOL)isMovingToWindow
{
  return self->_isMovingToWindow;
}

- (void)setIsMovingToWindow:(BOOL)a3
{
  self->_isMovingToWindow = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_touchedButton);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_scrimBackdrop, 0);
  objc_storeStrong((id *)&self->_overlayBackdrop, 0);
  objc_storeStrong((id *)&self->_baseBackdrop, 0);
}

@end
