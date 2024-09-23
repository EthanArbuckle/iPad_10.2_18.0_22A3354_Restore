@implementation CRLiOSVisualEffectHelper

+ (id)blurEffectProvidedByHierarchyOfView:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  id v37;

  v3 = a3;
  v10 = v3;
  v11 = 0;
  if (v3)
  {
    v12 = v3;
    do
    {
      v13 = sub_100221DDC(v12, 1, v4, v5, v6, v7, v8, v9, (uint64_t)&OBJC_PROTOCOL___CRLiOSVisualEffectProviding);
      v14 = objc_claimAutoreleasedReturnValue(v13);

      v11 = (void *)v14;
      if (!v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "nextResponder"));
        v22 = sub_100221DDC(v15, 1, v16, v17, v18, v19, v20, v21, (uint64_t)&OBJC_PROTOCOL___CRLiOSVisualEffectProviding);
        v11 = (void *)objc_claimAutoreleasedReturnValue(v22);
        if (!v11)
        {
          objc_opt_class(UIViewController, v23);
          v25 = sub_100221D0C(v24, v15);
          v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "presentationController"));
          v34 = sub_100221DDC(v27, 1, v28, v29, v30, v31, v32, v33, (uint64_t)&OBJC_PROTOCOL___CRLiOSVisualEffectProviding);
          v11 = (void *)objc_claimAutoreleasedReturnValue(v34);

        }
      }
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "blurEffect"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "superview"));

      if (v35)
        break;
      v12 = v36;
    }
    while (v36);
  }
  else
  {
    v36 = 0;
    v35 = 0;
  }
  v37 = v35;

  return v37;
}

+ (CRLiOSVisualEffectHelper)sharedHelper
{
  if (qword_101415A20 != -1)
    dispatch_once(&qword_101415A20, &stru_10125D1B0);
  return (CRLiOSVisualEffectHelper *)(id)qword_101415A18;
}

- (CRLiOSVisualEffectHelper)init
{
  CRLiOSVisualEffectHelper *v2;
  NSMapTable *v3;
  NSMapTable *controlsToMonitorForAnimations;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLiOSVisualEffectHelper;
  v2 = -[CRLiOSVisualEffectHelper init](&v6, "init");
  if (v2)
  {
    v3 = (NSMapTable *)objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 0);
    controlsToMonitorForAnimations = v2->_controlsToMonitorForAnimations;
    v2->_controlsToMonitorForAnimations = v3;

  }
  return v2;
}

- (void)configureBackdropLayer:(id)a3 radius:(double)a4 corners:(int64_t)a5 colorPreset:(int64_t)a6
{
  -[CRLiOSVisualEffectHelper configureBackdropLayer:radius:corners:colorPreset:forTraitCollection:](self, "configureBackdropLayer:radius:corners:colorPreset:forTraitCollection:", a3, a5, a6, 0, a4);
}

- (void)configureBackdropLayer:(id)a3 radius:(double)a4 corners:(int64_t)a5 colorPreset:(int64_t)a6 forTraitCollection:(id)a7
{
  id v12;
  id v13;
  id v14;

  v12 = a7;
  v13 = a3;
  v14 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSVisualEffectHelper colorForPreset:](self, "colorForPreset:", a6));
  -[CRLiOSVisualEffectHelper configureBackdropLayer:radius:corners:color:forTraitCollection:](self, "configureBackdropLayer:radius:corners:color:forTraitCollection:", v13, a5, v14, v12, a4);

}

- (void)configureBackdropLayer:(id)a3 radius:(double)a4 corners:(int64_t)a5 color:(id)a6
{
  -[CRLiOSVisualEffectHelper configureBackdropLayer:radius:corners:color:forTraitCollection:](self, "configureBackdropLayer:radius:corners:color:forTraitCollection:", a3, a5, a6, 0, a4);
}

- (void)configureBackdropLayer:(id)a3 radius:(double)a4 corners:(int64_t)a5 color:(id)a6 forTraitCollection:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;

  v18 = a3;
  v12 = a6;
  v13 = a7;
  objc_msgSend(v18, "setCornerRadius:", a4);
  objc_msgSend(v18, "setCornerCurve:", kCACornerCurveContinuous);
  objc_msgSend(v18, "setMaskedCorners:", -[CRLiOSVisualEffectHelper p_layerCornerMaskForCorners:](self, "p_layerCornerMaskForCorners:", a5));
  v14 = v12;
  v15 = v14;
  v16 = v14;
  if (v13)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "resolvedColorWithTraitCollection:", v13));

  }
  v17 = objc_retainAutorelease(v16);
  objc_msgSend(v18, "setBackgroundColor:", objc_msgSend(v17, "CGColor"));

}

- (id)resizableCornerImageWithRadius:(double)a3 corners:(int64_t)a4 colorPreset:(int64_t)a5
{
  return -[CRLiOSVisualEffectHelper resizableCornerImageWithRadius:corners:colorPreset:forTraitCollection:](self, "resizableCornerImageWithRadius:corners:colorPreset:forTraitCollection:", a4, a5, 0, a3);
}

- (id)resizableCornerImageWithRadius:(double)a3 corners:(int64_t)a4 colorPreset:(int64_t)a5 forTraitCollection:(id)a6
{
  __int128 v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  __int128 v26;
  __int128 v27;

  v10 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
  v26 = *(_OWORD *)&UIEdgeInsetsZero.top;
  v27 = v10;
  v11 = a6;
  -[CRLiOSVisualEffectHelper p_imageSizeForRadius:corners:capInsets:](self, "p_imageSizeForRadius:corners:capInsets:", a4, &v26, a3);
  v13 = v12;
  v15 = v14;
  v16 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:", v12, v14);
  v17 = objc_alloc_init((Class)CALayer);
  objc_msgSend(v17, "setFrame:", 0.0, 0.0, v13, v15);
  -[CRLiOSVisualEffectHelper configureBackdropLayer:radius:corners:colorPreset:forTraitCollection:](self, "configureBackdropLayer:radius:corners:colorPreset:forTraitCollection:", v17, a4, a5, v11, a3);

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1004276C0;
  v24[3] = &unk_10125D1D8;
  v25 = v17;
  v18 = v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "imageWithActions:", v24));
  v20 = v19;
  if ((unint64_t)(a5 - 1) <= 1)
  {
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "imageWithRenderingMode:", 2));

    v20 = (void *)v21;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "resizableImageWithCapInsets:resizingMode:", 1, v26, v27));

  return v22;
}

- (int64_t)backdropCornersForIndex:(unint64_t)a3 ofCount:(unint64_t)a4 axis:(int64_t)a5
{
  int v8;
  int64_t v9;
  uint64_t v10;

  v8 = sub_1003A91F4();
  v9 = 3;
  if (v8)
    v10 = 4;
  else
    v10 = 3;
  if (!v8)
    v9 = 4;
  if (a5 == 1)
    v9 = 2;
  if (a4 - 1 != a3)
    v9 = 0;
  if (a5 == 1)
    v10 = 1;
  if (!a3)
    v9 = v10;
  if (a4 >= 2)
    return v9;
  else
    return 5;
}

- (id)colorForPreset:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  void *v9;
  void *v11;
  void *v12;
  double v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  switch(a3)
  {
    case 1:
      v6 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      goto LABEL_16;
    case 2:
      v6 = objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
      goto LABEL_16;
    case 3:
      v6 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
      goto LABEL_16;
    case 4:
      v6 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.97, 0.97, 0.99, 1.0));
      goto LABEL_16;
    case 5:
      v7 = 0.04;
      goto LABEL_9;
    case 6:
      v7 = 0.06;
      goto LABEL_9;
    case 7:
      v7 = 0.15;
LABEL_9:
      v8 = 0.0;
      goto LABEL_15;
    case 8:
      v8 = 0.0;
      v7 = 0.5;
      goto LABEL_15;
    case 9:
      v7 = 0.05;
      goto LABEL_13;
    case 10:
      v7 = 0.2;
LABEL_13:
      v8 = 1.0;
      goto LABEL_15;
    case 11:
      v8 = 1.0;
      v7 = 0.25;
LABEL_15:
      v6 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v8, v7));
      goto LABEL_16;
    case 12:
      v6 = objc_claimAutoreleasedReturnValue(-[CRLiOSVisualEffectHelper applicationKeyColorDarkenedIfNecessary](self, "applicationKeyColorDarkenedIfNecessary"));
      goto LABEL_16;
    case 13:
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSVisualEffectHelper applicationKeyColorDarkenedIfNecessary](self, "applicationKeyColorDarkenedIfNecessary"));
      v12 = v11;
      v13 = 0.0625;
      goto LABEL_24;
    case 14:
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSVisualEffectHelper applicationKeyColorDarkenedIfNecessary](self, "applicationKeyColorDarkenedIfNecessary"));
      v12 = v11;
      v13 = 0.2;
      goto LABEL_24;
    case 15:
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSVisualEffectHelper applicationKeyColorDarkenedIfNecessary](self, "applicationKeyColorDarkenedIfNecessary"));
      v12 = v11;
      v13 = 0.25;
      goto LABEL_24;
    case 16:
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSVisualEffectHelper applicationKeyColorDarkenedIfNecessary](self, "applicationKeyColorDarkenedIfNecessary"));
      v12 = v11;
      v13 = 0.9;
LABEL_24:
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "colorWithAlphaComponent:", v13));
      goto LABEL_39;
    case 17:
      v6 = objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
      goto LABEL_16;
    case 18:
      v6 = objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor"));
      goto LABEL_16;
    case 19:
      v6 = objc_claimAutoreleasedReturnValue(+[UIColor tertiarySystemBackgroundColor](UIColor, "tertiarySystemBackgroundColor"));
      goto LABEL_16;
    case 20:
      v6 = objc_claimAutoreleasedReturnValue(+[UIColor systemGroupedBackgroundColor](UIColor, "systemGroupedBackgroundColor"));
      goto LABEL_16;
    case 21:
      v6 = objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemGroupedBackgroundColor](UIColor, "secondarySystemGroupedBackgroundColor"));
      goto LABEL_16;
    case 22:
      v6 = objc_claimAutoreleasedReturnValue(+[UIColor tertiarySystemGroupedBackgroundColor](UIColor, "tertiarySystemGroupedBackgroundColor"));
      goto LABEL_16;
    case 23:
      v6 = objc_claimAutoreleasedReturnValue(+[UIColor systemGray2Color](UIColor, "systemGray2Color"));
      goto LABEL_16;
    case 24:
      v6 = objc_claimAutoreleasedReturnValue(+[UIColor systemGray3Color](UIColor, "systemGray3Color"));
      goto LABEL_16;
    case 25:
      v6 = objc_claimAutoreleasedReturnValue(+[UIColor systemGray4Color](UIColor, "systemGray4Color"));
      goto LABEL_16;
    case 26:
      v6 = objc_claimAutoreleasedReturnValue(+[UIColor systemGray5Color](UIColor, "systemGray5Color"));
      goto LABEL_16;
    case 27:
      v6 = objc_claimAutoreleasedReturnValue(+[UIColor systemGray6Color](UIColor, "systemGray6Color"));
      goto LABEL_16;
    case 28:
      v6 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
      goto LABEL_16;
    case 29:
      v6 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
      goto LABEL_16;
    case 30:
      v6 = objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:](UIColor, "colorNamed:", CFSTR("tsk_higherContrastGroupBackgroundColor")));
      goto LABEL_16;
    case 31:
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSVisualEffectHelper applicationKeyColorDarkenedIfNecessary](self, "applicationKeyColorDarkenedIfNecessary"));
      v17 = 0.0;
      v18 = 0.0;
      v16 = 0.0;
      objc_msgSend(v12, "getRed:green:blue:alpha:", &v18, &v17, &v16, 0);
      v14 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v18 * 0.2 + 0.138039196, v17 * 0.2 + 0.138039196, v16 * 0.2 + 0.144313598, 1.0));
LABEL_39:
      v15 = (void *)v14;

      return v15;
    case 32:
      v6 = objc_claimAutoreleasedReturnValue(+[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor"));
      goto LABEL_16;
    case 33:
      v6 = objc_claimAutoreleasedReturnValue(+[UIColor quaternarySystemFillColor](UIColor, "quaternarySystemFillColor"));
LABEL_16:
      v9 = (void *)v6;

      v5 = v9;
      break;
    default:
      return v5;
  }
  return v5;
}

- (BOOL)p_needsTraitVariantsForColorPreset:(int64_t)a3
{
  return ((unint64_t)a3 < 0x1F) & (0x777E1000u >> a3);
}

- (unint64_t)p_layerCornerMaskForCorners:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4)
    return 0;
  else
    return qword_100EF01E8[a3 - 1];
}

- (CGSize)p_imageSizeForRadius:(double)a3 corners:(int64_t)a4 capInsets:(UIEdgeInsets *)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v5 = 0.0;
  v6 = 1.0;
  switch(a4)
  {
    case 1:
      v7 = a3;
      v8 = a3;
      v5 = a3;
      v9 = 0.0;
      break;
    case 2:
      v7 = a3;
      v8 = 0.0;
      goto LABEL_9;
    case 3:
      v7 = 1.0;
      v6 = a3;
      v8 = 0.0;
      v5 = a3;
      v9 = a3;
      goto LABEL_6;
    case 4:
      v7 = 1.0;
      v6 = a3;
      v8 = a3;
      goto LABEL_10;
    case 5:
      v7 = a3 + a3;
      v6 = a3 + a3;
      v8 = a3;
LABEL_9:
      v5 = a3;
LABEL_10:
      v9 = a3;
      break;
    default:
      v7 = 1.0;
      v8 = 0.0;
      v9 = 0.0;
LABEL_6:
      a3 = 0.0;
      break;
  }
  a5->top = v8;
  a5->left = v5;
  a5->bottom = v9;
  a5->right = a3;
  v10 = v6;
  result.height = v7;
  result.width = v10;
  return result;
}

- (id)p_applicationKeyColor
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "delegate"));
  v4 = objc_opt_respondsToSelector(v3, "defaultApplicationKeyColor");

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "delegate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "defaultApplicationKeyColor"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)applicationKeyColorDarkenedIfNecessary
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSVisualEffectHelper p_applicationKeyColor](self, "p_applicationKeyColor"));
  if (UIAccessibilityDarkerSystemColorsEnabled())
  {
    v12 = 0.0;
    v10 = 0.0;
    v11 = 0.0;
    v9 = 0.0;
    if (objc_msgSend(v2, "getRed:green:blue:alpha:", &v12, &v11, &v10, &v9))
    {
      v3 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v12, v11, v10, v9));

      v2 = (void *)v3;
    }
    v7 = 0.0;
    v8 = 0.0;
    v6 = 0.0;
    if (objc_msgSend(v2, "getHue:saturation:brightness:alpha:", &v8, &v7, &v6, &v9))
    {
      v4 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:", v8, v7, v6 * 0.8, v9));

      v2 = (void *)v4;
    }
  }
  return v2;
}

- (void)applyTouchDownAnimationToViews:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[CRLiOSVisualEffectHelper p_activeTouchDownAnimatorForView:](self, "p_activeTouchDownAnimatorForView:", v5));
    v7 = objc_claimAutoreleasedReturnValue(-[CRLiOSVisualEffectHelper p_activeTouchUpAnimatorForView:](self, "p_activeTouchUpAnimatorForView:", v5));
    if (v6 | v7)
    {
      if (v6 && objc_msgSend((id)v6, "state") == (id)1)
      {
        v8 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSVisualEffectHelper p_touchDownTimingParameters](self, "p_touchDownTimingParameters"));
        objc_msgSend((id)v6, "continueAnimationWithTimingParameters:durationFactor:", v8, 0.5);
      }
      else
      {
        if (!v7 || objc_msgSend((id)v7, "state") != (id)1)
          goto LABEL_8;
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472;
        v9[2] = sub_100427E84;
        v9[3] = &unk_10125D200;
        v10 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSVisualEffectHelper p_makeTouchDownAnimatorForViews:](self, "p_makeTouchDownAnimatorForViews:", v4));
        v8 = v10;
        objc_msgSend((id)v7, "addCompletion:", v9);
        objc_msgSend((id)v7, "stopAnimation:", 0);
        objc_msgSend((id)v7, "finishAnimationAtPosition:", 2);

      }
    }
    else
    {
      v8 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSVisualEffectHelper p_makeTouchDownAnimatorForViews:](self, "p_makeTouchDownAnimatorForViews:", v4));
      objc_msgSend(v8, "startAnimation");
    }

LABEL_8:
  }

}

- (void)applyTouchUpAnimationToViews:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSVisualEffectHelper p_activeTouchUpAnimatorForView:](self, "p_activeTouchUpAnimatorForView:", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSVisualEffectHelper p_activeTouchDownAnimatorForView:](self, "p_activeTouchDownAnimatorForView:", v5));
    if (!v6)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSVisualEffectHelper p_makeTouchUpAnimatorForViews:](self, "p_makeTouchUpAnimatorForViews:", v4));
      v9 = v8;
      if (v7)
      {
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472;
        v10[2] = sub_100427F84;
        v10[3] = &unk_10125D200;
        v11 = v8;
        objc_msgSend(v7, "addCompletion:", v10);

      }
      else
      {
        objc_msgSend(v8, "startAnimation");
      }

    }
  }

}

- (void)startHandlingTouchUpDownAnimationsForControl:(id)a3 withViews:(id)a4
{
  id v6;
  NSMapTable *controlsToMonitorForAnimations;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  controlsToMonitorForAnimations = self->_controlsToMonitorForAnimations;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKeyedSubscript:](controlsToMonitorForAnimations, "objectForKeyedSubscript:", v8));

  if (v9)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125D220);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E33150();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125D240);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSVisualEffectHelper startHandlingTouchUpDownAnimationsForControl:withViews:]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSVisualEffectProviding.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 539, 0, "Should not start monitoring a control for animations that is already being monitored.");

  }
  -[NSMapTable setObject:forKeyedSubscript:](self->_controlsToMonitorForAnimations, "setObject:forKeyedSubscript:", v6, v8);
  objc_msgSend(v8, "addTarget:action:forControlEvents:", self, "p_controlTouchDown:event:", 1);
  objc_msgSend(v8, "addTarget:action:forControlEvents:", self, "p_controlDragEnter:event:", 16);
  objc_msgSend(v8, "addTarget:action:forControlEvents:", self, "p_controlDragExit:event:", 32);
  objc_msgSend(v8, "addTarget:action:forControlEvents:", self, "p_controlTouchCancel:event:", 256);
  objc_msgSend(v8, "addTarget:action:forControlEvents:", self, "p_controlTouchCancel:event:", 128);
  objc_msgSend(v8, "addTarget:action:forControlEvents:", self, "p_controlTouchUpInside:event:", 64);

}

- (void)stopHandlingTouchUpDownAnimationsForControl:(id)a3
{
  NSMapTable *controlsToMonitorForAnimations;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  controlsToMonitorForAnimations = self->_controlsToMonitorForAnimations;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKeyedSubscript:](controlsToMonitorForAnimations, "objectForKeyedSubscript:", v5));

  if (!v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125D260);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E331D0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125D280);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSVisualEffectHelper stopHandlingTouchUpDownAnimationsForControl:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSVisualEffectProviding.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 552, 0, "Should not stop monitoring a control for animations that is not already being monitored.");

  }
  -[NSMapTable removeObjectForKey:](self->_controlsToMonitorForAnimations, "removeObjectForKey:", v5);
  objc_msgSend(v5, "removeTarget:action:forControlEvents:", self, "p_controlTouchDown:event:", 1);
  objc_msgSend(v5, "removeTarget:action:forControlEvents:", self, "p_controlDragEnter:event:", 16);
  objc_msgSend(v5, "removeTarget:action:forControlEvents:", self, "p_controlDragExit:event:", 32);
  objc_msgSend(v5, "removeTarget:action:forControlEvents:", self, "p_controlTouchCancel:event:", 256);
  objc_msgSend(v5, "removeTarget:action:forControlEvents:", self, "p_controlTouchCancel:event:", 128);
  objc_msgSend(v5, "removeTarget:action:forControlEvents:", self, "p_controlTouchUpInside:event:", 64);

}

- (id)p_scrimOwnerForView:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  return sub_100221DDC(a3, 1, (uint64_t)a3, v3, v4, v5, v6, v7, (uint64_t)&OBJC_PROTOCOL___CRLiOSVisualEffectScrimLayerOwning);
}

- (id)p_activeTouchDownAnimatorForView:(id)a3
{
  return objc_getAssociatedObject(a3, off_1013DC518);
}

- (void)p_setActiveTouchDownAnimator:(id)a3 forView:(id)a4
{
  objc_setAssociatedObject(a4, off_1013DC518, a3, (void *)0x301);
}

- (id)p_activeTouchUpAnimatorForView:(id)a3
{
  return objc_getAssociatedObject(a3, off_1013DC520);
}

- (void)p_setActiveTouchUpAnimator:(id)a3 forView:(id)a4
{
  objc_setAssociatedObject(a4, off_1013DC520, a3, (void *)0x301);
}

- (double)p_lastTouchEventTimestampForView:(id)a3
{
  id AssociatedObject;
  void *v4;
  double v5;
  double v6;

  AssociatedObject = objc_getAssociatedObject(a3, off_1013DC528);
  v4 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (void)p_setLastTouchEventTimestamp:(double)a3 forView:(id)a4
{
  const void *v5;
  id v6;
  id v7;

  v5 = off_1013DC528;
  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
  objc_setAssociatedObject(v6, v5, v7, (void *)0x301);

}

- (id)p_makeTouchDownAnimatorForViews:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  CRLiOSVisualEffectHelper *v22;

  v4 = a3;
  v5 = objc_alloc((Class)UIViewPropertyAnimator);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSVisualEffectHelper p_touchDownTimingParameters](self, "p_touchDownTimingParameters"));
  v7 = objc_msgSend(v5, "initWithDuration:timingParameters:", v6, 0.1);

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10042871C;
  v20[3] = &unk_10122D3D8;
  v8 = v4;
  v21 = v8;
  v22 = self;
  objc_msgSend(v7, "addAnimations:", v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
  -[CRLiOSVisualEffectHelper p_setActiveTouchDownAnimator:forView:](self, "p_setActiveTouchDownAnimator:forView:", v7, v9);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100428890;
  v16[3] = &unk_10125D2A8;
  v16[4] = self;
  v17 = v9;
  v10 = v7;
  v18 = v10;
  v19 = v8;
  v11 = v8;
  v12 = v9;
  objc_msgSend(v10, "addCompletion:", v16);
  v13 = v19;
  v14 = v10;

  return v14;
}

- (CGAffineTransform)p_touchDownAffineTransformForView:(SEL)a3
{
  __int128 v4;

  v4 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v4;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  return self;
}

- (CATransform3D)p_touchDownTransformForView:(SEL)a3
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v4 = *(_OWORD *)&CATransform3DIdentity.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&CATransform3DIdentity.m31;
  *(_OWORD *)&retstr->m33 = v4;
  v5 = *(_OWORD *)&CATransform3DIdentity.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&CATransform3DIdentity.m41;
  *(_OWORD *)&retstr->m43 = v5;
  v6 = *(_OWORD *)&CATransform3DIdentity.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&CATransform3DIdentity.m11;
  *(_OWORD *)&retstr->m13 = v6;
  v7 = *(_OWORD *)&CATransform3DIdentity.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&CATransform3DIdentity.m21;
  *(_OWORD *)&retstr->m23 = v7;
  return self;
}

- (id)p_makeTouchUpAnimatorForViews:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  CRLiOSVisualEffectHelper *v24;

  v4 = a3;
  v5 = objc_alloc((Class)UIViewPropertyAnimator);
  -[CRLiOSVisualEffectHelper p_touchUpSpringSettlingTime](self, "p_touchUpSpringSettlingTime");
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSVisualEffectHelper p_touchUpTimingParameters](self, "p_touchUpTimingParameters"));
  v9 = objc_msgSend(v5, "initWithDuration:timingParameters:", v8, v7);

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100428B80;
  v22[3] = &unk_10122D3D8;
  v10 = v4;
  v23 = v10;
  v24 = self;
  objc_msgSend(v9, "addAnimations:", v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
  -[CRLiOSVisualEffectHelper p_setActiveTouchUpAnimator:forView:](self, "p_setActiveTouchUpAnimator:forView:", v9, v11);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100428CF0;
  v18[3] = &unk_10125D2A8;
  v18[4] = self;
  v19 = v11;
  v12 = v9;
  v20 = v12;
  v21 = v10;
  v13 = v10;
  v14 = v11;
  objc_msgSend(v12, "addCompletion:", v18);
  v15 = v21;
  v16 = v12;

  return v16;
}

- (id)p_touchDownTimingParameters
{
  if (qword_101415A30 != -1)
    dispatch_once(&qword_101415A30, &stru_10125D2C8);
  return (id)qword_101415A28;
}

- (id)p_touchUpTimingParameters
{
  if (qword_101415A40 != -1)
    dispatch_once(&qword_101415A40, &stru_10125D2E8);
  return (id)qword_101415A38;
}

- (double)p_touchUpSpringSettlingTime
{
  if (qword_101415A50 != -1)
    dispatch_once(&qword_101415A50, &stru_10125D308);
  return *(double *)&qword_101415A48;
}

- (void)p_applyDragEnterEffectToScrimLayersInViews:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSVisualEffectHelper p_scrimOwnerForView:](self, "p_scrimOwnerForView:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8)));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "viewForScrimOpacityAnimation"));
        objc_msgSend(v10, "setHidden:", 0);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void)p_applyDragExitEffectToScrimLayersInViews:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSVisualEffectHelper p_scrimOwnerForView:](self, "p_scrimOwnerForView:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8)));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "viewForScrimOpacityAnimation"));
        objc_msgSend(v10, "setHidden:", 1);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void)p_controlTouchDown:(id)a3 event:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKeyedSubscript:](self->_controlsToMonitorForAnimations, "objectForKeyedSubscript:", a3));
  if (!v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125D328);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E332D0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125D348);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSVisualEffectHelper p_controlTouchDown:event:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSVisualEffectProviding.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 722, 0, "Trying to apply animations to a control that's not being monitored.");

  }
  objc_msgSend(v6, "timestamp");
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
  -[CRLiOSVisualEffectHelper p_lastTouchEventTimestampForView:](self, "p_lastTouchEventTimestampForView:", v13);
  v15 = v14;

  if (v12 <= v15)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125D368);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E33250();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125D388);
    v19 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSVisualEffectHelper p_controlTouchDown:event:]"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSVisualEffectProviding.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v20, 729, 0, "Button animation received out-of-order touch events. This may be due to calling [self refresh] or [tableView reloadData] directly instead of calling [self.refreshingDelegate refreshableInspectorPaneWantsToRefresh:self].");

  }
  else
  {
    -[CRLiOSVisualEffectHelper applyTouchDownAnimationToViews:](self, "applyTouchDownAnimationToViews:", v7);
    objc_msgSend(v6, "timestamp");
    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
    -[CRLiOSVisualEffectHelper p_setLastTouchEventTimestamp:forView:](self, "p_setLastTouchEventTimestamp:forView:", v18, v17);
  }

}

- (void)p_controlDragEnter:(id)a3 event:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKeyedSubscript:](self->_controlsToMonitorForAnimations, "objectForKeyedSubscript:", a3));
  if (!v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125D3A8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E33350();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125D3C8);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSVisualEffectHelper p_controlDragEnter:event:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSVisualEffectProviding.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 735, 0, "Trying to apply animations to a control that's not being monitored.");

  }
  objc_msgSend(v6, "timestamp");
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
  -[CRLiOSVisualEffectHelper p_lastTouchEventTimestampForView:](self, "p_lastTouchEventTimestampForView:", v13);
  v15 = v14;

  if (v12 > v15)
  {
    -[CRLiOSVisualEffectHelper p_applyDragEnterEffectToScrimLayersInViews:](self, "p_applyDragEnterEffectToScrimLayersInViews:", v7);
    objc_msgSend(v6, "timestamp");
    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
    -[CRLiOSVisualEffectHelper p_setLastTouchEventTimestamp:forView:](self, "p_setLastTouchEventTimestamp:forView:", v18, v17);

  }
}

- (void)p_controlDragExit:(id)a3 event:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKeyedSubscript:](self->_controlsToMonitorForAnimations, "objectForKeyedSubscript:", a3));
  if (!v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125D3E8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E333D0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125D408);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSVisualEffectHelper p_controlDragExit:event:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSVisualEffectProviding.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 746, 0, "Trying to apply animations to a control that's not being monitored.");

  }
  objc_msgSend(v6, "timestamp");
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
  -[CRLiOSVisualEffectHelper p_lastTouchEventTimestampForView:](self, "p_lastTouchEventTimestampForView:", v13);
  v15 = v14;

  if (v12 > v15)
  {
    -[CRLiOSVisualEffectHelper p_applyDragExitEffectToScrimLayersInViews:](self, "p_applyDragExitEffectToScrimLayersInViews:", v7);
    objc_msgSend(v6, "timestamp");
    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
    -[CRLiOSVisualEffectHelper p_setLastTouchEventTimestamp:forView:](self, "p_setLastTouchEventTimestamp:forView:", v18, v17);

  }
}

- (void)p_controlTouchCancel:(id)a3 event:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKeyedSubscript:](self->_controlsToMonitorForAnimations, "objectForKeyedSubscript:", a3));
  if (v7)
  {
    if (v6)
    {
LABEL_3:
      objc_msgSend(v6, "timestamp");
      v9 = v8;
      goto LABEL_14;
    }
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125D428);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E33450();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125D448);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSVisualEffectHelper p_controlTouchCancel:event:]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSVisualEffectProviding.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 757, 0, "Trying to apply animations to a control that's not being monitored.");

    if (v6)
      goto LABEL_3;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  objc_msgSend(v13, "systemUptime");
  v9 = v14;

LABEL_14:
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
  -[CRLiOSVisualEffectHelper p_lastTouchEventTimestampForView:](self, "p_lastTouchEventTimestampForView:", v15);
  v17 = v16;

  if (v9 > v17)
  {
    -[CRLiOSVisualEffectHelper applyTouchUpAnimationToViews:](self, "applyTouchUpAnimationToViews:", v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
    -[CRLiOSVisualEffectHelper p_setLastTouchEventTimestamp:forView:](self, "p_setLastTouchEventTimestamp:forView:", v18, v9);

  }
}

- (void)p_controlTouchUpInside:(id)a3 event:(id)a4
{
  NSMapTable *controlsToMonitorForAnimations;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;

  controlsToMonitorForAnimations = self->_controlsToMonitorForAnimations;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKeyedSubscript:](controlsToMonitorForAnimations, "objectForKeyedSubscript:", a3));
  if (!v8)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125D468);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E334D0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125D488);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSVisualEffectHelper p_controlTouchUpInside:event:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSVisualEffectProviding.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 770, 0, "Trying to apply animations to a control that's not being monitored.");

  }
  -[CRLiOSVisualEffectHelper applyTouchUpAnimationToViews:](self, "applyTouchUpAnimationToViews:", v8);
  objc_msgSend(v7, "timestamp");
  v13 = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
  -[CRLiOSVisualEffectHelper p_setLastTouchEventTimestamp:forView:](self, "p_setLastTouchEventTimestamp:forView:", v14, v13);

}

- (NSMapTable)controlsToMonitorForAnimations
{
  return self->_controlsToMonitorForAnimations;
}

- (void)setControlsToMonitorForAnimations:(id)a3
{
  objc_storeStrong((id *)&self->_controlsToMonitorForAnimations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlsToMonitorForAnimations, 0);
}

@end
