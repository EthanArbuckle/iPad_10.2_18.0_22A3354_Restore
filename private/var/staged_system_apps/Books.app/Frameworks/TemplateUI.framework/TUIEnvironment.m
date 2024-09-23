@implementation TUIEnvironment

- (void)_updateValues
{
  int64_t v2;
  int64_t v3;
  unint64_t deviceClass;
  int v6;
  _value *object;
  unint64_t widthClass;
  _QWORD *v9;
  int v10;
  _value *v11;
  unint64_t heightClass;
  int v13;
  _value *v14;
  unint64_t displayClass;
  int v16;
  _value *v17;
  _value *v18;
  _value *v19;
  _value *v20;
  _value *v21;
  _value *v22;
  _value *v23;
  unint64_t split;
  int v25;
  _value *v26;
  unint64_t orientation;
  int v28;
  _value *v29;
  unint64_t style;
  int v31;
  _value *v32;
  int64_t demoMode;
  _value *v34;
  unint64_t contentSizeCategory;
  unint64_t *v36;
  int64_t v37;
  _value *v38;
  int64_t v39;
  _value *v40;
  UIColor *v41;
  _value *v42;
  UIColor *v43;
  unint64_t layoutDirection;
  int v45;
  _value *v46;
  unint64_t activeAppearance;
  int v48;
  _value *v49;

  deviceClass = self->_deviceClass;
  if (deviceClass > 6)
  {
    v6 = 0;
  }
  else
  {
    v2 = qword_22F9B0[deviceClass];
    v6 = 7;
  }
  self->_deviceClassValue._kind = v6;
  object = self->_deviceClassValue._object;
  self->_deviceClassValue._object = 0;

  self->_deviceClassValue.var0._integer = v2;
  widthClass = self->_widthClass;
  v9 = qword_22F9E8;
  if (widthClass > 3)
  {
    v10 = 0;
  }
  else
  {
    v3 = qword_22F9E8[widthClass];
    v10 = 7;
  }
  self->_widthClassValue._kind = v10;
  v11 = self->_widthClassValue._object;
  self->_widthClassValue._object = 0;

  self->_widthClassValue.var0._integer = v3;
  heightClass = self->_heightClass;
  if (heightClass > 3)
  {
    v13 = 0;
  }
  else
  {
    v9 = (_QWORD *)qword_22F9E8[heightClass];
    v13 = 7;
  }
  self->_heightClassValue._kind = v13;
  v14 = self->_heightClassValue._object;
  self->_heightClassValue._object = 0;

  self->_heightClassValue.var0._integer = (int64_t)v9;
  displayClass = self->_displayClass;
  if (displayClass > 2)
  {
    v16 = 0;
  }
  else
  {
    v9 = (_QWORD *)qword_22FA08[displayClass];
    v16 = 7;
  }
  self->_displayClassValue._kind = v16;
  v17 = self->_displayClassValue._object;
  self->_displayClassValue._object = 0;

  self->_displayClassValue.var0._integer = (int64_t)v9;
  v18 = (_value *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", self->_windowSize.width, self->_windowSize.height));
  self->_windowSizeValue._kind = 3;
  v19 = self->_windowSizeValue._object;
  self->_windowSizeValue._object = v18;
  v20 = v18;

  v21 = (_value *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", self->_viewSize.width, self->_viewSize.height));
  self->_viewSizeValue._kind = 3;
  v22 = self->_viewSizeValue._object;
  self->_viewSizeValue._object = v21;
  v23 = v21;

  split = self->_split;
  if (split > 4)
  {
    v25 = 0;
  }
  else
  {
    v23 = (_value *)qword_22FA20[split];
    v25 = 7;
  }
  self->_splitValue._kind = v25;
  v26 = self->_splitValue._object;
  self->_splitValue._object = 0;

  self->_splitValue.var0._integer = (int64_t)v23;
  orientation = self->_orientation;
  if (orientation > 2)
  {
    v28 = 0;
  }
  else
  {
    v23 = (_value *)qword_22FA48[orientation];
    v28 = 7;
  }
  self->_orientationValue._kind = v28;
  v29 = self->_orientationValue._object;
  self->_orientationValue._object = 0;

  self->_orientationValue.var0._integer = (int64_t)v23;
  style = self->_style;
  if (style > 2)
  {
    v31 = 0;
  }
  else
  {
    v23 = (_value *)qword_22FA60[style];
    v31 = 7;
  }
  self->_styleValue._kind = v31;
  v32 = self->_styleValue._object;
  self->_styleValue._object = 0;

  self->_styleValue.var0._integer = (int64_t)v23;
  demoMode = self->_demoMode;
  self->_demoModeValue._kind = 12;
  v34 = self->_demoModeValue._object;
  self->_demoModeValue._object = 0;

  self->_demoModeValue.var0._integer = demoMode;
  contentSizeCategory = self->_contentSizeCategory;
  v36 = (unint64_t *)((char *)&unk_22FA78 + 8 * contentSizeCategory);
  if (contentSizeCategory >= 0xD)
    v36 = (unint64_t *)&unk_22FAE0;
  v37 = *v36;
  self->_contentSizeCategorySymbol.value = *v36;
  self->_contentSizeCategoryValue._kind = 7;
  v38 = self->_contentSizeCategoryValue._object;
  self->_contentSizeCategoryValue._object = 0;

  self->_contentSizeCategoryValue.var0._integer = v37;
  v39 = *(_QWORD *)&self->_contentsScale;
  self->_contentsScaleValue._kind = 1;
  v40 = self->_contentsScaleValue._object;
  self->_contentsScaleValue._object = 0;

  self->_contentsScaleValue.var0._integer = v39;
  v41 = self->_tintColor;
  self->_tintColorValue._kind = 11;
  v42 = self->_tintColorValue._object;
  self->_tintColorValue._object = (_value *)v41;
  v43 = v41;

  layoutDirection = self->_layoutDirection;
  if (layoutDirection > 2)
  {
    v45 = 0;
  }
  else
  {
    v43 = (UIColor *)qword_22FAE8[layoutDirection];
    v45 = 7;
  }
  self->_layoutDirectionValue._kind = v45;
  v46 = self->_layoutDirectionValue._object;
  self->_layoutDirectionValue._object = 0;

  self->_layoutDirectionValue.var0._integer = (int64_t)v43;
  activeAppearance = self->_activeAppearance;
  if (activeAppearance > 2)
  {
    v48 = 0;
  }
  else
  {
    v43 = (UIColor *)qword_22FB00[activeAppearance];
    v48 = 7;
  }
  self->_activeAppearanceValue._kind = v48;
  v49 = self->_activeAppearanceValue._object;
  self->_activeAppearanceValue._object = 0;

  self->_activeAppearanceValue.var0._integer = (int64_t)v43;
}

- (TUIEnvironment)initWithViewSize:(CGSize)a3 traitCollection:(id)a4
{
  CGFloat height;
  CGFloat width;
  UITraitCollection *v8;
  TUIEnvironment *v9;
  uint64_t v10;
  UITraitCollection *sanitizedTraitCollection;
  uint64_t v12;
  UIColor *tintColor;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  height = a3.height;
  width = a3.width;
  v8 = (UITraitCollection *)a4;
  v18.receiver = self;
  v18.super_class = (Class)TUIEnvironment;
  v9 = -[TUIEnvironment init](&v18, "init");
  if (v9)
  {
    v10 = objc_claimAutoreleasedReturnValue(-[UITraitCollection traitCollectionByModifyingTraits:](v8, "traitCollectionByModifyingTraits:", &stru_241B68));
    sanitizedTraitCollection = v9->_sanitizedTraitCollection;
    v9->_sanitizedTraitCollection = (UITraitCollection *)v10;

    objc_storeStrong((id *)&v9->_traitCollection, a4);
    v9->_activeAppearance = _determineActiveAppearance(v8);
    v9->_viewSize.width = width;
    v9->_viewSize.height = height;
    v9->_contentSizeCategory = 4;
    v9->_contentsScale = 2.0;
    v9->_demoMode = +[UIApplication isRunningInStoreDemoMode](UIApplication, "isRunningInStoreDemoMode");
    v9->_layoutDirection = 1;
    v12 = objc_claimAutoreleasedReturnValue(+[UIColor blueColor](UIColor, "blueColor"));
    tintColor = v9->_tintColor;
    v9->_tintColor = (UIColor *)v12;

    objc_storeStrong((id *)&v9->_traitCollection, a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "preferredLocalizations"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "firstObject"));
    -[TUIEnvironment setLanguage:](v9, "setLanguage:", v16);

    -[TUIEnvironment _updateValues](v9, "_updateValues");
  }

  return v9;
}

- (TUIEnvironment)init
{
  return -[TUIEnvironment initWithViewSize:traitCollection:](self, "initWithViewSize:traitCollection:", 0, CGSizeZero.width, CGSizeZero.height);
}

- (TUIEnvironment)initWithViewController:(id)a3 viewSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  TUIEnvironment *v13;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "viewIfLoaded"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "window"));
  v10 = v9;
  if (v9)
    v11 = v9;
  else
    v11 = (id)objc_claimAutoreleasedReturnValue(+[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow"));
  v12 = v11;

  objc_msgSend(v12, "bounds");
  v13 = -[TUIEnvironment initWithViewController:viewSize:windowSize:](self, "initWithViewController:viewSize:windowSize:", v7, width, height);

  return v13;
}

- (TUIEnvironment)initWithViewController:(id)a3 viewSize:(CGSize)a4 windowSize:(CGSize)a5
{
  double height;
  double width;
  double v7;
  double v8;
  id v10;
  void *v11;
  TUIEnvironment *v12;

  height = a5.height;
  width = a5.width;
  v7 = a4.height;
  v8 = a4.width;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "traitCollection"));
  v12 = -[TUIEnvironment initWithTraitCollection:viewController:viewSize:windowSize:](self, "initWithTraitCollection:viewController:viewSize:windowSize:", v11, v10, v8, v7, width, height);

  return v12;
}

- (TUIEnvironment)initWithTraitCollection:(id)a3 viewController:(id)a4 viewSize:(CGSize)a5
{
  double height;
  double width;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  TUIEnvironment *v16;

  height = a5.height;
  width = a5.width;
  v9 = a3;
  v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "viewIfLoaded"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "window"));
  v13 = v12;
  if (v12)
    v14 = v12;
  else
    v14 = (id)objc_claimAutoreleasedReturnValue(+[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow"));
  v15 = v14;

  objc_msgSend(v15, "bounds");
  v16 = -[TUIEnvironment initWithTraitCollection:viewController:viewSize:windowSize:](self, "initWithTraitCollection:viewController:viewSize:windowSize:", v9, v10, width, height);

  return v16;
}

- (TUIEnvironment)initWithTraitCollection:(id)a3 viewController:(id)a4 viewSize:(CGSize)a5 windowSize:(CGSize)a6
{
  double height;
  double width;
  double v8;
  double v9;
  id v12;
  id v13;
  TUIEnvironment *v14;
  TUIEnvironment *v15;
  id v16;
  uint64_t v17;
  id v19;
  uint64_t v20;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  double v31;
  double v32;
  uint64_t v33;
  UIViewController *v34;
  char *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  UITraitCollection *v41;
  UIContentSizeCategory v42;
  UIContentSizeCategory v43;
  UIContentSizeCategory v44;
  UIContentSizeCategory v45;
  UIContentSizeCategory v46;
  UIContentSizeCategory v47;
  UIContentSizeCategory v48;
  UIContentSizeCategory v49;
  UIContentSizeCategory v50;
  UIContentSizeCategory v51;
  UIContentSizeCategory v52;
  UIContentSizeCategory v53;
  uint64_t v54;
  void *v55;
  void *v56;
  id v57;

  height = a6.height;
  width = a6.width;
  v8 = a5.height;
  v9 = a5.width;
  v12 = a3;
  v13 = a4;
  v14 = -[TUIEnvironment initWithViewSize:traitCollection:](self, "initWithViewSize:traitCollection:", v12, v9, v8);
  v15 = v14;
  if (v14)
  {
    -[TUIEnvironment setWindowSize:](v14, "setWindowSize:", width, height);
    v16 = v12;
    if (qword_2CB768 != -1)
      dispatch_once(&qword_2CB768, &stru_241B88);
    if (objc_msgSend(v16, "userInterfaceIdiom") == (char *)&dword_0 + 1)
    {
      if (qword_2CB750 != -1)
        dispatch_once(&qword_2CB750, &stru_241B28);
      if (dword_2CB748)
        v17 = 2;
      else
        v17 = 1;
    }
    else if (objc_msgSend(v16, "userInterfaceIdiom"))
    {
      if (objc_msgSend(v16, "userInterfaceIdiom") == (char *)&dword_4 + 1)
        v17 = 6;
      else
        v17 = 0;
    }
    else
    {
      v17 = 5;
      if (*(double *)&qword_2CB758 <= 667.0 && *(double *)&qword_2CB760 <= 667.0)
      {
        if (*(double *)&qword_2CB760 <= 568.0 && *(double *)&qword_2CB758 <= 568.0)
          v17 = 3;
        else
          v17 = 4;
      }
    }

    -[TUIEnvironment setDeviceClass:](v15, "setDeviceClass:", v17);
    v19 = v16;
    if (objc_msgSend(v19, "horizontalSizeClass") == (char *)&dword_0 + 1)
    {
      v20 = 1;
    }
    else if (objc_msgSend(v19, "horizontalSizeClass") == (char *)&dword_0 + 2)
    {
      if (qword_2CB750 != -1)
        dispatch_once(&qword_2CB750, &stru_241B28);
      if (width <= 1024.0 || dword_2CB748 == 0)
        v20 = 2;
      else
        v20 = 3;
    }
    else
    {
      v20 = 0;
    }

    -[TUIEnvironment setWidthClass:](v15, "setWidthClass:", v20);
    v22 = v19;
    if (objc_msgSend(v22, "verticalSizeClass") == (char *)&dword_0 + 1)
      v23 = 1;
    else
      v23 = 2 * (objc_msgSend(v22, "verticalSizeClass") == (char *)&dword_0 + 2);

    -[TUIEnvironment setHeightClass:](v15, "setHeightClass:", v23);
    if (_TUIDeviceHasOLEDDisplay())
      v24 = 2;
    else
      v24 = 1;
    -[TUIEnvironment setDisplayClass:](v15, "setDisplayClass:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v25, "bounds");
    v27 = v26;
    v29 = v28;

    if (width == v27 && height == v29)
    {
      v30 = 1;
    }
    else
    {
      v31 = width + v27 * -0.5;
      v32 = fabs(v31);
      v33 = 2;
      if (v31 < 0.0)
        v33 = 4;
      if (v32 >= 10.0)
        v30 = v33;
      else
        v30 = 3;
    }
    -[TUIEnvironment setSplit:](v15, "setSplit:", v30);
    v34 = (UIViewController *)v13;
    v35 = (char *)-[UIViewController _rotatingToInterfaceOrientation](v34, "_rotatingToInterfaceOrientation");
    if (!v35)
    {
      v35 = -[UIViewController interfaceOrientation](v34, "interfaceOrientation");
      if (!v35)
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "windowScene"));
        v35 = (char *)objc_msgSend(v37, "interfaceOrientation");

      }
    }
    if ((unint64_t)(v35 - 1) < 2)
      v38 = 1;
    else
      v38 = 2;

    -[TUIEnvironment setOrientation:](v15, "setOrientation:", v38);
    v39 = v22;
    if (objc_msgSend(v39, "userInterfaceStyle") == (char *)&dword_0 + 1)
      v40 = 1;
    else
      v40 = 2 * (objc_msgSend(v39, "userInterfaceStyle") == (char *)&dword_0 + 2);

    -[TUIEnvironment setStyle:](v15, "setStyle:", v40);
    v41 = (UITraitCollection *)v39;
    v42 = (UIContentSizeCategory)objc_claimAutoreleasedReturnValue(-[UITraitCollection preferredContentSizeCategory](v41, "preferredContentSizeCategory"));

    if (v42 == UIContentSizeCategoryAccessibilityExtraExtraExtraLarge)
    {
      v54 = 12;
    }
    else
    {
      v43 = (UIContentSizeCategory)objc_claimAutoreleasedReturnValue(-[UITraitCollection preferredContentSizeCategory](v41, "preferredContentSizeCategory"));

      if (v43 == UIContentSizeCategoryAccessibilityExtraExtraLarge)
      {
        v54 = 11;
      }
      else
      {
        v44 = (UIContentSizeCategory)objc_claimAutoreleasedReturnValue(-[UITraitCollection preferredContentSizeCategory](v41, "preferredContentSizeCategory"));

        if (v44 == UIContentSizeCategoryAccessibilityExtraLarge)
        {
          v54 = 10;
        }
        else
        {
          v45 = (UIContentSizeCategory)objc_claimAutoreleasedReturnValue(-[UITraitCollection preferredContentSizeCategory](v41, "preferredContentSizeCategory"));

          if (v45 == UIContentSizeCategoryAccessibilityLarge)
          {
            v54 = 9;
          }
          else
          {
            v46 = (UIContentSizeCategory)objc_claimAutoreleasedReturnValue(-[UITraitCollection preferredContentSizeCategory](v41, "preferredContentSizeCategory"));

            if (v46 == UIContentSizeCategoryAccessibilityMedium)
            {
              v54 = 8;
            }
            else
            {
              v47 = (UIContentSizeCategory)objc_claimAutoreleasedReturnValue(-[UITraitCollection preferredContentSizeCategory](v41, "preferredContentSizeCategory"));

              if (v47 == UIContentSizeCategoryExtraExtraExtraLarge)
              {
                v54 = 7;
              }
              else
              {
                v48 = (UIContentSizeCategory)objc_claimAutoreleasedReturnValue(-[UITraitCollection preferredContentSizeCategory](v41, "preferredContentSizeCategory"));

                if (v48 == UIContentSizeCategoryExtraExtraLarge)
                {
                  v54 = 6;
                }
                else
                {
                  v49 = (UIContentSizeCategory)objc_claimAutoreleasedReturnValue(-[UITraitCollection preferredContentSizeCategory](v41, "preferredContentSizeCategory"));

                  if (v49 == UIContentSizeCategoryExtraLarge)
                  {
                    v54 = 5;
                  }
                  else
                  {
                    v50 = (UIContentSizeCategory)objc_claimAutoreleasedReturnValue(-[UITraitCollection preferredContentSizeCategory](v41, "preferredContentSizeCategory"));

                    if (v50 == UIContentSizeCategoryLarge)
                    {
                      v54 = 4;
                    }
                    else
                    {
                      v51 = (UIContentSizeCategory)objc_claimAutoreleasedReturnValue(-[UITraitCollection preferredContentSizeCategory](v41, "preferredContentSizeCategory"));

                      if (v51 == UIContentSizeCategoryMedium)
                      {
                        v54 = 3;
                      }
                      else
                      {
                        v52 = (UIContentSizeCategory)objc_claimAutoreleasedReturnValue(-[UITraitCollection preferredContentSizeCategory](v41, "preferredContentSizeCategory"));

                        if (v52 == UIContentSizeCategorySmall)
                        {
                          v54 = 2;
                        }
                        else
                        {
                          v53 = (UIContentSizeCategory)objc_claimAutoreleasedReturnValue(-[UITraitCollection preferredContentSizeCategory](v41, "preferredContentSizeCategory"));
                          v54 = v53 == UIContentSizeCategoryExtraSmall;

                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }

    -[TUIEnvironment setContentSizeCategory:](v15, "setContentSizeCategory:", v54);
    -[UITraitCollection displayScale](v41, "displayScale");
    -[TUIEnvironment setContentsScale:](v15, "setContentsScale:");
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController viewIfLoaded](v34, "viewIfLoaded"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "tintColor"));
    -[TUIEnvironment setTintColor:](v15, "setTintColor:", v56);

    v57 = -[TUIEnvironment setLayoutDirection:](v15, "setLayoutDirection:", _determineLayoutDirection(v41, v34));
    -[TUIEnvironment setAccessibilityElementsNeeded:](v15, "setAccessibilityElementsNeeded:", _AXSApplicationAccessibilityEnabled(v57) != 0);
  }

  return v15;
}

- (TUIEnvironment)initWithOther:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  TUIEnvironment *v10;
  CGFloat v11;
  CGFloat v12;
  uint64_t v13;
  NSString *language;

  v4 = a3;
  objc_msgSend(v4, "viewSize");
  v6 = v5;
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "traitCollection"));
  v10 = -[TUIEnvironment initWithViewSize:traitCollection:](self, "initWithViewSize:traitCollection:", v9, v6, v8);

  if (v10)
  {
    v10->_deviceClass = (unint64_t)objc_msgSend(v4, "deviceClass");
    v10->_widthClass = (unint64_t)objc_msgSend(v4, "widthClass");
    v10->_heightClass = (unint64_t)objc_msgSend(v4, "heightClass");
    v10->_displayClass = (unint64_t)objc_msgSend(v4, "displayClass");
    v10->_split = (unint64_t)objc_msgSend(v4, "split");
    objc_msgSend(v4, "windowSize");
    v10->_windowSize.width = v11;
    v10->_windowSize.height = v12;
    v10->_orientation = (unint64_t)objc_msgSend(v4, "orientation");
    v10->_style = (unint64_t)objc_msgSend(v4, "style");
    v10->_contentSizeCategory = (unint64_t)objc_msgSend(v4, "contentSizeCategory");
    v10->_layoutDirection = (unint64_t)objc_msgSend(v4, "layoutDirection");
    v10->_accessibilityElementsNeeded = objc_msgSend(v4, "accessibilityElementsNeeded");
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "language"));
    language = v10->_language;
    v10->_language = (NSString *)v13;

    v10->_useFontFallback = objc_msgSend(v4, "useFontFallback");
    -[TUIEnvironment _updateValues](v10, "_updateValues");
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_msgSend(objc_alloc((Class)objc_opt_class(self)), "initWithOther:", self);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;

  v4 = a3;
  v5 = objc_opt_class(v4);
  if (v5 == objc_opt_class(TUIEnvironment))
    v6 = -[TUIEnvironment isEqualToEnvironment:](self, "isEqualToEnvironment:", v4);
  else
    v6 = 0;

  return v6;
}

- (BOOL)isEqualToEnvironment:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  unsigned int v24;
  id v25;
  id v26;
  double v27;
  double v28;
  double v29;
  id v30;
  id v31;
  unsigned int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  unsigned int v37;
  unsigned int v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  unsigned __int8 v44;

  v4 = a3;
  v5 = -[TUIEnvironment deviceClass](self, "deviceClass");
  if (v5 != objc_msgSend(v4, "deviceClass"))
    goto LABEL_23;
  v6 = -[TUIEnvironment widthClass](self, "widthClass");
  if (v6 != objc_msgSend(v4, "widthClass"))
    goto LABEL_23;
  v7 = -[TUIEnvironment heightClass](self, "heightClass");
  if (v7 != objc_msgSend(v4, "heightClass"))
    goto LABEL_23;
  v8 = -[TUIEnvironment displayClass](self, "displayClass");
  if (v8 != objc_msgSend(v4, "displayClass"))
    goto LABEL_23;
  v9 = -[TUIEnvironment split](self, "split");
  if (v9 != objc_msgSend(v4, "split"))
    goto LABEL_23;
  -[TUIEnvironment windowSize](self, "windowSize");
  v11 = v10;
  v13 = v12;
  objc_msgSend(v4, "windowSize");
  v15 = 0;
  if (v11 == v16 && v13 == v14)
  {
    -[TUIEnvironment viewSize](self, "viewSize");
    v18 = v17;
    v20 = v19;
    objc_msgSend(v4, "viewSize");
    v15 = 0;
    if (v18 == v22 && v20 == v21)
    {
      v23 = -[TUIEnvironment style](self, "style");
      if (v23 != objc_msgSend(v4, "style"))
        goto LABEL_23;
      v24 = -[TUIEnvironment demoMode](self, "demoMode");
      if (v24 != objc_msgSend(v4, "demoMode"))
        goto LABEL_23;
      v25 = -[TUIEnvironment orientation](self, "orientation");
      if (v25 != objc_msgSend(v4, "orientation"))
        goto LABEL_23;
      v26 = -[TUIEnvironment contentSizeCategory](self, "contentSizeCategory");
      if (v26 != objc_msgSend(v4, "contentSizeCategory"))
        goto LABEL_23;
      -[TUIEnvironment contentsScale](self, "contentsScale");
      v28 = v27;
      objc_msgSend(v4, "contentsScale");
      if (v28 != v29)
        goto LABEL_23;
      v30 = -[TUIEnvironment layoutDirection](self, "layoutDirection");
      if (v30 != objc_msgSend(v4, "layoutDirection"))
        goto LABEL_23;
      v31 = -[TUIEnvironment activeAppearance](self, "activeAppearance");
      if (v31 != objc_msgSend(v4, "activeAppearance"))
        goto LABEL_23;
      v32 = -[TUIEnvironment accessibilityElementsNeeded](self, "accessibilityElementsNeeded");
      if (v32 != objc_msgSend(v4, "accessibilityElementsNeeded"))
        goto LABEL_23;
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[TUIEnvironment language](self, "language"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "language"));
      if (v33 == v34)
      {

      }
      else
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[TUIEnvironment language](self, "language"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "language"));
        v37 = objc_msgSend(v35, "isEqualToString:", v36);

        if (!v37)
          goto LABEL_23;
      }
      v38 = -[TUIEnvironment useFontFallback](self, "useFontFallback");
      if (v38 != objc_msgSend(v4, "useFontFallback"))
      {
LABEL_23:
        v15 = 0;
        goto LABEL_24;
      }
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[TUIEnvironment sanitizedTraitCollection](self, "sanitizedTraitCollection"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sanitizedTraitCollection"));
      if (v40 == v41)
      {
        v44 = 1;
      }
      else
      {
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[TUIEnvironment sanitizedTraitCollection](self, "sanitizedTraitCollection"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sanitizedTraitCollection"));
        v44 = objc_msgSend(v42, "isEqual:", v43);

      }
      v15 = v44;
    }
  }
LABEL_24:

  return v15;
}

- (unint64_t)differenceMaskWithEnvironment:(id)a3
{
  TUIEnvironment *v4;
  TUIEnvironment *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _BOOL4 v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  id v20;
  _BOOL4 v21;
  unint64_t v22;
  id v23;
  id v24;
  _BOOL4 v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unsigned int v31;
  _BOOL4 v32;
  id v33;
  id v34;
  id v35;
  unsigned int v36;
  id v37;
  double v38;
  double v39;
  double v40;
  id v41;
  unsigned int v42;
  void *v43;
  void *v44;
  void *v45;
  unsigned int v46;
  unsigned int v47;
  unsigned int v48;
  unint64_t v49;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;

  v4 = (TUIEnvironment *)a3;
  v5 = v4;
  if (!v4)
  {
    v22 = 61;
    goto LABEL_44;
  }
  if (self == v4)
  {
    v22 = 0;
    goto LABEL_44;
  }
  -[TUIEnvironment windowSize](self, "windowSize");
  v7 = v6;
  v9 = v8;
  -[TUIEnvironment windowSize](v5, "windowSize");
  v11 = 0;
  if (v7 == v12 && v9 == v10)
  {
    -[TUIEnvironment viewSize](self, "viewSize");
    v14 = v13;
    v16 = v15;
    -[TUIEnvironment viewSize](v5, "viewSize");
    v11 = v16 == v18 && v14 == v17;
  }
  v19 = -[TUIEnvironment widthClass](self, "widthClass");
  if (v19 == (id)-[TUIEnvironment widthClass](v5, "widthClass"))
  {
    v20 = -[TUIEnvironment heightClass](self, "heightClass");
    v21 = v20 == (id)-[TUIEnvironment heightClass](v5, "heightClass");
  }
  else
  {
    v21 = 0;
  }
  v23 = -[TUIEnvironment split](self, "split");
  if (v23 == (id)-[TUIEnvironment split](v5, "split"))
  {
    v24 = -[TUIEnvironment orientation](self, "orientation");
    v25 = v24 == (id)-[TUIEnvironment orientation](v5, "orientation");
  }
  else
  {
    v25 = 0;
  }
  v26 = -[TUIEnvironment style](self, "style");
  if (v26 != (id)-[TUIEnvironment style](v5, "style"))
    goto LABEL_19;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[TUIEnvironment tintColor](self, "tintColor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[TUIEnvironment tintColor](v5, "tintColor"));
  if (v27 == v28)
  {

    goto LABEL_21;
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[TUIEnvironment tintColor](self, "tintColor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[TUIEnvironment tintColor](v5, "tintColor"));
  v31 = objc_msgSend(v29, "isEqual:", v30);

  if (v31)
  {
LABEL_21:
    v33 = -[TUIEnvironment activeAppearance](self, "activeAppearance");
    v32 = v33 == (id)-[TUIEnvironment activeAppearance](v5, "activeAppearance");
    goto LABEL_22;
  }
LABEL_19:
  v32 = 0;
LABEL_22:
  v34 = -[TUIEnvironment deviceClass](self, "deviceClass");
  if (v34 != (id)-[TUIEnvironment deviceClass](v5, "deviceClass"))
    goto LABEL_34;
  v35 = -[TUIEnvironment displayClass](self, "displayClass");
  if (v35 != (id)-[TUIEnvironment displayClass](v5, "displayClass"))
    goto LABEL_34;
  v36 = -[TUIEnvironment demoMode](self, "demoMode");
  if (v36 != -[TUIEnvironment demoMode](v5, "demoMode"))
    goto LABEL_34;
  v37 = -[TUIEnvironment contentSizeCategory](self, "contentSizeCategory");
  if (v37 != (id)-[TUIEnvironment contentSizeCategory](v5, "contentSizeCategory"))
    goto LABEL_34;
  -[TUIEnvironment contentsScale](self, "contentsScale");
  v39 = v38;
  -[TUIEnvironment contentsScale](v5, "contentsScale");
  if (v39 != v40)
    goto LABEL_34;
  v41 = -[TUIEnvironment layoutDirection](self, "layoutDirection");
  if (v41 != (id)-[TUIEnvironment layoutDirection](v5, "layoutDirection"))
    goto LABEL_34;
  v42 = -[TUIEnvironment accessibilityElementsNeeded](self, "accessibilityElementsNeeded");
  if (v42 != -[TUIEnvironment accessibilityElementsNeeded](v5, "accessibilityElementsNeeded"))
    goto LABEL_34;
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[TUIEnvironment language](self, "language"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[TUIEnvironment language](v5, "language"));
  if (v55 == v43)
  {

  }
  else
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[TUIEnvironment language](self, "language"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[TUIEnvironment language](v5, "language"));
    v46 = objc_msgSend(v44, "isEqualToString:", v45);

    if (!v46)
      goto LABEL_34;
  }
  v47 = -[TUIEnvironment useFontFallback](self, "useFontFallback");
  if (v47 == -[TUIEnvironment useFontFallback](v5, "useFontFallback"))
  {
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[TUIEnvironment sanitizedTraitCollection](self, "sanitizedTraitCollection"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[TUIEnvironment sanitizedTraitCollection](v5, "sanitizedTraitCollection"));
    if (v51 == v52)
    {
      v48 = 1;
    }
    else
    {
      v53 = (void *)objc_claimAutoreleasedReturnValue(-[TUIEnvironment sanitizedTraitCollection](self, "sanitizedTraitCollection"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[TUIEnvironment sanitizedTraitCollection](v5, "sanitizedTraitCollection"));
      v48 = objc_msgSend(v53, "isEqual:", v54);

    }
    goto LABEL_35;
  }
LABEL_34:
  v48 = 0;
LABEL_35:
  v49 = !v11;
  if (!v21)
    v49 |= 4uLL;
  if (!v25)
    v49 |= 8uLL;
  if (!v32)
    v49 |= 0x10uLL;
  if (v48)
    v22 = v49;
  else
    v22 = v49 | 0x20;
LABEL_44:

  return v22;
}

- (void)setLanguage:(id)a3
{
  id v5;
  BOOL v6;

  objc_storeStrong((id *)&self->_language, a3);
  v5 = a3;
  v6 = +[TUIFontSpec determineUseFontFallbackFromLanguage:](TUIFontSpec, "determineUseFontFallbackFromLanguage:", v5);

  self->_useFontFallback = v6;
}

- (void)setDeviceClass:(unint64_t)a3
{
  int64_t v3;
  int v5;
  _value *object;

  self->_deviceClass = a3;
  if (a3 > 6)
  {
    v5 = 0;
  }
  else
  {
    v3 = qword_22F9B0[a3];
    v5 = 7;
  }
  self->_deviceClassValue._kind = v5;
  object = self->_deviceClassValue._object;
  self->_deviceClassValue._object = 0;

  self->_deviceClassValue.var0._integer = v3;
}

- (void)setWidthClass:(unint64_t)a3
{
  int64_t v3;
  int v5;
  _value *object;

  self->_widthClass = a3;
  if (a3 > 3)
  {
    v5 = 0;
  }
  else
  {
    v3 = qword_22F9E8[a3];
    v5 = 7;
  }
  self->_widthClassValue._kind = v5;
  object = self->_widthClassValue._object;
  self->_widthClassValue._object = 0;

  self->_widthClassValue.var0._integer = v3;
}

- (void)setHeightClass:(unint64_t)a3
{
  int64_t v3;
  int v5;
  _value *object;

  self->_heightClass = a3;
  if (a3 > 3)
  {
    v5 = 0;
  }
  else
  {
    v3 = qword_22F9E8[a3];
    v5 = 7;
  }
  self->_heightClassValue._kind = v5;
  object = self->_heightClassValue._object;
  self->_heightClassValue._object = 0;

  self->_heightClassValue.var0._integer = v3;
}

- (void)setDisplayClass:(unint64_t)a3
{
  int64_t v3;
  int v5;
  _value *object;

  self->_displayClass = a3;
  if (a3 > 2)
  {
    v5 = 0;
  }
  else
  {
    v3 = qword_22FA08[a3];
    v5 = 7;
  }
  self->_displayClassValue._kind = v5;
  object = self->_displayClassValue._object;
  self->_displayClassValue._object = 0;

  self->_displayClassValue.var0._integer = v3;
}

- (void)setSplit:(unint64_t)a3
{
  int64_t v3;
  int v5;
  _value *object;

  self->_split = a3;
  if (a3 > 4)
  {
    v5 = 0;
  }
  else
  {
    v3 = qword_22FA20[a3];
    v5 = 7;
  }
  self->_splitValue._kind = v5;
  object = self->_splitValue._object;
  self->_splitValue._object = 0;

  self->_splitValue.var0._integer = v3;
}

- (void)setOrientation:(unint64_t)a3
{
  int64_t v3;
  int v5;
  _value *object;

  self->_orientation = a3;
  if (a3 > 2)
  {
    v5 = 0;
  }
  else
  {
    v3 = qword_22FA48[a3];
    v5 = 7;
  }
  self->_orientationValue._kind = v5;
  object = self->_orientationValue._object;
  self->_orientationValue._object = 0;

  self->_orientationValue.var0._integer = v3;
}

- (void)setWindowSize:(CGSize)a3
{
  _value *v4;
  _value *object;
  _value *v6;

  self->_windowSize = a3;
  v4 = (_value *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:"));
  self->_windowSizeValue._kind = 3;
  object = self->_windowSizeValue._object;
  self->_windowSizeValue._object = v4;
  v6 = v4;

}

- (void)setViewSize:(CGSize)a3
{
  _value *v4;
  _value *object;
  _value *v6;

  self->_viewSize = a3;
  v4 = (_value *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:"));
  self->_viewSizeValue._kind = 3;
  object = self->_viewSizeValue._object;
  self->_viewSizeValue._object = v4;
  v6 = v4;

}

- (void)setStyle:(unint64_t)a3
{
  int64_t v3;
  int v5;
  _value *object;

  self->_style = a3;
  if (a3 > 2)
  {
    v5 = 0;
  }
  else
  {
    v3 = qword_22FA60[a3];
    v5 = 7;
  }
  self->_styleValue._kind = v5;
  object = self->_styleValue._object;
  self->_styleValue._object = 0;

  self->_styleValue.var0._integer = v3;
}

- (void)setActiveAppearance:(unint64_t)a3
{
  int64_t v3;
  int v5;
  _value *object;

  self->_activeAppearance = a3;
  if (a3 > 2)
  {
    v5 = 0;
  }
  else
  {
    v3 = qword_22FB00[a3];
    v5 = 7;
  }
  self->_activeAppearanceValue._kind = v5;
  object = self->_activeAppearanceValue._object;
  self->_activeAppearanceValue._object = 0;

  self->_activeAppearanceValue.var0._integer = v3;
}

- (void)setDemoMode:(BOOL)a3
{
  int64_t v4;
  _value *object;

  self->_demoMode = a3;
  v4 = a3;
  self->_demoModeValue._kind = 12;
  object = self->_demoModeValue._object;
  self->_demoModeValue._object = 0;

  self->_demoModeValue.var0._integer = v4;
}

- (void)setContentSizeCategory:(unint64_t)a3
{
  unint64_t *v4;
  int64_t v5;
  _value *object;

  self->_contentSizeCategory = a3;
  v4 = (unint64_t *)((char *)&unk_22FA78 + 8 * a3);
  if (a3 >= 0xD)
    v4 = (unint64_t *)&unk_22FAE0;
  v5 = *v4;
  self->_contentSizeCategorySymbol.value = *v4;
  self->_contentSizeCategoryValue._kind = 7;
  object = self->_contentSizeCategoryValue._object;
  self->_contentSizeCategoryValue._object = 0;

  self->_contentSizeCategoryValue.var0._integer = v5;
}

- (void)setContentsScale:(double)a3
{
  double v4;
  _value *object;

  if (a3 <= 0.0)
    v4 = 1.0;
  else
    v4 = a3;
  self->_contentsScale = v4;
  self->_contentsScaleValue._kind = 1;
  object = self->_contentsScaleValue._object;
  self->_contentsScaleValue._object = 0;

  self->_contentsScaleValue.var0._float = v4;
}

- (void)setTintColor:(id)a3
{
  _value *v5;
  _value *object;

  v5 = (_value *)a3;
  objc_storeStrong((id *)&self->_tintColor, a3);
  self->_tintColorValue._kind = 11;
  object = self->_tintColorValue._object;
  self->_tintColorValue._object = v5;

}

- (void)setLayoutDirection:(unint64_t)a3
{
  int64_t v3;
  int v5;
  _value *object;

  self->_layoutDirection = a3;
  if (a3 > 2)
  {
    v5 = 0;
  }
  else
  {
    v3 = qword_22FAE8[a3];
    v5 = 7;
  }
  self->_layoutDirectionValue._kind = v5;
  object = self->_layoutDirectionValue._object;
  self->_layoutDirectionValue._object = 0;

  self->_layoutDirectionValue.var0._integer = v3;
}

- (ResolvedValue)lookupName:(SEL)a3 symtab:(Entry)a4
{
  ResolvedValue *v5;
  unsigned __int16 *v7;
  unint64_t v8;
  int v9;
  ResolvedValue *v10;
  int64_t integer;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  Entry v26;

  v5 = self;
  v26 = a4;
  if (a4.var0 == 1)
  {
    v7 = (unsigned __int16 *)*((_QWORD *)a5 + 5);
    v8 = *((_QWORD *)a5 + 6) - (_QWORD)v7;
    if (v8 < 0x13)
      v9 = 0xFFFF;
    else
      v9 = v7[9];
    if (v9 == a4.var1)
    {
      retstr->_kind = (int)self->_object;
      self = (ResolvedValue *)(id)self->var0._integer;
      integer = *(_QWORD *)&v5[1]._kind;
      goto LABEL_79;
    }
    if (v8 < 0x15)
      v12 = 0xFFFF;
    else
      v12 = v7[10];
    if (v12 == a4.var1)
    {
      retstr->_kind = (int)self[1]._object;
      self = (ResolvedValue *)(id)self[1].var0._integer;
      integer = *(_QWORD *)&v5[2]._kind;
      goto LABEL_79;
    }
    if (v8 < 0x17)
      v13 = 0xFFFF;
    else
      v13 = v7[11];
    if (v13 == a4.var1)
    {
      retstr->_kind = (int)self[2]._object;
      self = (ResolvedValue *)(id)self[2].var0._integer;
      integer = *(_QWORD *)&v5[3]._kind;
      goto LABEL_79;
    }
    if (v8 < 0x1B)
      v14 = 0xFFFF;
    else
      v14 = v7[13];
    if (v14 == a4.var1)
    {
      retstr->_kind = (int)self[6]._object;
      self = (ResolvedValue *)(id)self[6].var0._integer;
      integer = *(_QWORD *)&v5[7]._kind;
      goto LABEL_79;
    }
    if (v8 < 0x19)
      v15 = 0xFFFF;
    else
      v15 = v7[12];
    if (v15 == a4.var1)
    {
      retstr->_kind = (int)self[4]._object;
      self = (ResolvedValue *)(id)self[4].var0._integer;
      integer = *(_QWORD *)&v5[5]._kind;
      goto LABEL_79;
    }
    if (v8 < 0xB3)
      v16 = 0xFFFF;
    else
      v16 = v7[89];
    if (v16 == a4.var1)
    {
      retstr->_kind = (int)self[5]._object;
      self = (ResolvedValue *)(id)self[5].var0._integer;
      integer = *(_QWORD *)&v5[6]._kind;
      goto LABEL_79;
    }
    if (v8 < 0x1D)
      v17 = 0xFFFF;
    else
      v17 = v7[14];
    if (v17 == a4.var1)
    {
      retstr->_kind = (int)self[7]._object;
      self = (ResolvedValue *)(id)self[7].var0._integer;
      integer = *(_QWORD *)&v5[8]._kind;
      goto LABEL_79;
    }
    if (v8 < 0x3B)
      v18 = 0xFFFF;
    else
      v18 = v7[29];
    if (v18 == a4.var1)
    {
      retstr->_kind = (int)self[8]._object;
      self = (ResolvedValue *)(id)self[8].var0._integer;
      integer = *(_QWORD *)&v5[9]._kind;
      goto LABEL_79;
    }
    if (v8 < 0xBF)
      v19 = 0xFFFF;
    else
      v19 = v7[95];
    if (v19 == a4.var1)
    {
      retstr->_kind = (int)self[9]._object;
      self = (ResolvedValue *)(id)self[9].var0._integer;
      integer = *(_QWORD *)&v5[10]._kind;
      goto LABEL_79;
    }
    if (v8 < 0x55)
      v20 = 0xFFFF;
    else
      v20 = v7[42];
    if (v20 == a4.var1)
    {
      retstr->_kind = (int)self[10]._object;
      self = (ResolvedValue *)(id)self[10].var0._integer;
      integer = *(_QWORD *)&v5[11]._kind;
      goto LABEL_79;
    }
    if (v8 < 0x63)
      v21 = 0xFFFF;
    else
      v21 = v7[49];
    if (v21 == a4.var1)
    {
      retstr->_kind = (int)self[11]._object;
      self = (ResolvedValue *)(id)self[11].var0._integer;
      integer = *(_QWORD *)&v5[12]._kind;
      goto LABEL_79;
    }
    if (v8 < 0x65)
      v22 = 0xFFFF;
    else
      v22 = v7[50];
    if (v22 == a4.var1)
    {
      retstr->_kind = (int)self[12]._object;
      self = (ResolvedValue *)(id)self[12].var0._integer;
      integer = *(_QWORD *)&v5[13]._kind;
      goto LABEL_79;
    }
    if (v8 < 0x75)
      v23 = 0xFFFF;
    else
      v23 = v7[58];
    if (v23 == a4.var1)
    {
      retstr->_kind = (int)self[13]._object;
      self = (ResolvedValue *)(id)self[13].var0._integer;
      integer = *(_QWORD *)&v5[14]._kind;
      goto LABEL_79;
    }
    if (v8 < 0xAD)
      v24 = 0xFFFF;
    else
      v24 = v7[86];
    if (v24 == a4.var1)
    {
      retstr->_kind = (int)self[3]._object;
      self = (ResolvedValue *)(id)self[3].var0._integer;
      integer = *(_QWORD *)&v5[4]._kind;
      goto LABEL_79;
    }
    if (v8 < 0xDD)
      v25 = 0xFFFF;
    else
      v25 = v7[110];
    if (v25 == a4.var1)
    {
      retstr->_kind = (int)self[14]._object;
      self = (ResolvedValue *)(id)self[14].var0._integer;
      integer = *(_QWORD *)&v5[15]._kind;
      goto LABEL_79;
    }
LABEL_81:
    retstr->_kind = 0;
    retstr->_object = 0;
    return self;
  }
  self = (ResolvedValue *)sub_28810(&self[17]._kind, &v26.var0);
  if (!self)
    goto LABEL_81;
  v10 = self;
  retstr->_kind = self[1]._kind;
  self = self[1]._object;
  integer = v10[1].var0._integer;
LABEL_79:
  retstr->_object = (_value *)self;
  retstr->var0._integer = integer;
  return self;
}

- (BOOL)hasExtendedNS:(unsigned __int16)a3
{
  unsigned __int16 v4;

  v4 = a3;
  return self->_hasExtendedValues
      && sub_1529C(&self->_extendedNameSpaces.__table_.__bucket_list_.__ptr_.__value_, &v4) != 0;
}

- (BOOL)setFloat:(double)a3 forName:(id)a4
{
  BOOL v4;
  int v6;
  id v7;
  double v8;

  v6 = 1;
  v7 = 0;
  v8 = a3;
  v4 = -[TUIEnvironment _setValue:forName:](self, "_setValue:forName:", &v6, *(unsigned int *)&a4);

  return v4;
}

- (BOOL)setSymbol:(id)a3 forName:(id)a4
{
  BOOL v4;
  int v6;
  id v7;
  unsigned __int16 var0;

  v6 = 6;
  v7 = 0;
  var0 = a3.var0;
  v4 = -[TUIEnvironment _setValue:forName:](self, "_setValue:forName:", &v6, *(unsigned int *)&a4);

  return v4;
}

- (BOOL)_setValue:(ResolvedValue *)a3 forName:(id)a4
{
  _BOOL4 IsValid;
  BOOL result;
  _QWORD *v9;
  $201E9A47BE70A2B12CCA2F48B75AA2F7 v10;
  $201E9A47BE70A2B12CCA2F48B75AA2F7 *v11;

  IsValid = TUINameIsValid(*(_DWORD *)&a4);
  result = 0;
  if (IsValid && (a4.var0 & 0xFFFE) != 0)
  {
    if (a3->_kind)
    {
      v10 = a4;
      LOWORD(v11) = a4.var0;
      if (!sub_1529C(&self->_extendedNameSpaces.__table_.__bucket_list_.__ptr_.__value_, (unsigned __int16 *)&v11))
      {
        LOWORD(v11) = a4.var0;
        sub_1179C0((uint64_t)&self->_extendedNameSpaces, (unsigned __int16 *)&v11, &v11);
      }
      v11 = &v10;
      v9 = sub_117BDC((uint64_t)&self->_extendedValues, &v10.var0, (uint64_t)&std::piecewise_construct, (_DWORD **)&v11);
      *((_DWORD *)v9 + 6) = a3->_kind;
      objc_storeStrong((id *)v9 + 4, a3->_object);
      v9[5] = a3->var0._integer;
      result = 1;
      self->_hasExtendedValues = 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (BuiltinSymbol)contentSizeCategorySymbol
{
  return self->_contentSizeCategorySymbol;
}

- (unint64_t)deviceClass
{
  return self->_deviceClass;
}

- (unint64_t)widthClass
{
  return self->_widthClass;
}

- (unint64_t)heightClass
{
  return self->_heightClass;
}

- (unint64_t)displayClass
{
  return self->_displayClass;
}

- (CGSize)viewSize
{
  double width;
  double height;
  CGSize result;

  width = self->_viewSize.width;
  height = self->_viewSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)windowSize
{
  double width;
  double height;
  CGSize result;

  width = self->_windowSize.width;
  height = self->_windowSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (unint64_t)split
{
  return self->_split;
}

- (unint64_t)orientation
{
  return self->_orientation;
}

- (unint64_t)style
{
  return self->_style;
}

- (BOOL)demoMode
{
  return self->_demoMode;
}

- (unint64_t)contentSizeCategory
{
  return self->_contentSizeCategory;
}

- (double)contentsScale
{
  return self->_contentsScale;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (unint64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (BOOL)accessibilityElementsNeeded
{
  return self->_accessibilityElementsNeeded;
}

- (void)setAccessibilityElementsNeeded:(BOOL)a3
{
  self->_accessibilityElementsNeeded = a3;
}

- (unint64_t)activeAppearance
{
  return self->_activeAppearance;
}

- (NSString)language
{
  return self->_language;
}

- (BOOL)useFontFallback
{
  return self->_useFontFallback;
}

- (void)setUseFontFallback:(BOOL)a3
{
  self->_useFontFallback = a3;
}

- (UITraitCollection)sanitizedTraitCollection
{
  return self->_sanitizedTraitCollection;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void)setTraitCollection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 576);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_sanitizedTraitCollection, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  sub_358DC((uint64_t)&self->_extendedValues);
  sub_14B0C((uint64_t)&self->_extendedNameSpaces);

}

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_DWORD *)self + 8) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_DWORD *)self + 14) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_DWORD *)self + 20) = 0;
  *((_QWORD *)self + 11) = 0;
  *((_DWORD *)self + 26) = 0;
  *((_QWORD *)self + 14) = 0;
  *((_DWORD *)self + 32) = 0;
  *((_QWORD *)self + 17) = 0;
  *((_DWORD *)self + 38) = 0;
  *((_QWORD *)self + 20) = 0;
  *((_DWORD *)self + 44) = 0;
  *((_QWORD *)self + 23) = 0;
  *((_DWORD *)self + 50) = 0;
  *((_QWORD *)self + 26) = 0;
  *((_DWORD *)self + 56) = 0;
  *((_QWORD *)self + 29) = 0;
  *((_DWORD *)self + 62) = 0;
  *((_QWORD *)self + 32) = 0;
  *((_DWORD *)self + 68) = 0;
  *((_QWORD *)self + 35) = 0;
  *((_DWORD *)self + 74) = 0;
  *((_QWORD *)self + 38) = 0;
  *((_DWORD *)self + 80) = 0;
  *((_QWORD *)self + 41) = 0;
  *((_DWORD *)self + 86) = 0;
  *((_QWORD *)self + 44) = 0;
  *((_OWORD *)self + 23) = 0u;
  *((_OWORD *)self + 24) = 0u;
  *((_DWORD *)self + 100) = 1065353216;
  *(_OWORD *)((char *)self + 408) = 0u;
  *(_OWORD *)((char *)self + 424) = 0u;
  *((_DWORD *)self + 110) = 1065353216;
  return self;
}

@end
