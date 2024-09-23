@implementation BCLayoutConfigurationEnvironment

- (BOOL)isScrubberDisabled
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCLayoutConfigurationEnvironment overrideProvider](self, "overrideProvider"));
  v3 = objc_msgSend(v2, "isScrubberDisabled");

  return v3;
}

- (CGRect)scrubberInscribedRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCLayoutConfigurationEnvironment view](self, "view"));
  objc_msgSend(v7, "_inscribedRectInBoundingPathByInsettingRect:onEdges:withOptions:", 10, 1, x, y, width, height);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (int64_t)scrubberLayoutDirection
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCLayoutConfigurationEnvironment view](self, "view"));
  v3 = objc_msgSend(v2, "effectiveUserInterfaceLayoutDirection");

  return (int64_t)v3;
}

- (CGRect)scrubberContainerBounds
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCLayoutConfigurationEnvironment view](self, "view"));
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BCLayoutConfigurationEnvironment)initWithViewController:(id)a3
{
  id v4;
  BCLayoutConfigurationEnvironment *v5;
  BCLayoutConfigurationEnvironment *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BCLayoutConfigurationEnvironment;
  v5 = -[BCLayoutConfigurationEnvironment init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_viewController, v4);

  return v6;
}

- (double)statusBarHeight
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCLayoutConfigurationEnvironment targetView](self, "targetView"));
  v4 = objc_opt_class(UIWindow);
  v5 = BUDynamicCast(v4, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "windowScene"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "statusBarManager"));

  v12 = 0.0;
  if (!-[BCLayoutConfigurationEnvironment isCompactHeight](self, "isCompactHeight"))
  {
    objc_msgSend(v11, "statusBarHeight");
    v12 = v13;
  }

  return v12;
}

- (double)defaultStatusBarHeight
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCLayoutConfigurationEnvironment targetView](self, "targetView"));
  v4 = objc_opt_class(UIWindow);
  v5 = BUDynamicCast(v4, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "windowScene"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "statusBarManager"));

  v12 = 0.0;
  if (!-[BCLayoutConfigurationEnvironment isCompactHeight](self, "isCompactHeight"))
  {
    objc_msgSend(v11, "defaultStatusBarHeight");
    v12 = v13;
  }

  return v12;
}

- (double)backgroundExtension
{
  unsigned __int8 v3;
  double result;

  v3 = -[BCLayoutConfigurationEnvironment isCompactHeight](self, "isCompactHeight");
  result = 0.0;
  if ((v3 & 1) == 0)
  {
    -[BCLayoutConfigurationEnvironment safeAreaInsets](self, "safeAreaInsets", 0.0);
    if (fabs(result) < 2.22044605e-16)
      -[BCLayoutConfigurationEnvironment statusBarHeight](self, "statusBarHeight");
  }
  return result;
}

- (UIEdgeInsets)safeAreaInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  id v14;
  NSObject *v15;
  NSString *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  int v22;
  BCLayoutConfigurationEnvironment *v23;
  __int16 v24;
  void *v25;
  UIEdgeInsets v26;
  UIEdgeInsets result;

  -[BCLayoutConfigurationEnvironment safeAreaInsetsAdjustingForNotch:](self, "safeAreaInsetsAdjustingForNotch:", 1);
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = v6;
  if (*(double *)&qword_311588 != v4
    || *(double *)&qword_311580 != v3
    || *(double *)&qword_311598 != v6
    || *(double *)&qword_311590 != v5)
  {
    qword_311580 = *(_QWORD *)&v3;
    qword_311588 = *(_QWORD *)&v4;
    qword_311590 = *(_QWORD *)&v5;
    qword_311598 = *(_QWORD *)&v6;
    v14 = BKSemanticLayoutInternalLog();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v26.top = v7;
      v26.left = v8;
      v26.bottom = v9;
      v26.right = v10;
      v16 = NSStringFromUIEdgeInsets(v26);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v22 = 134218242;
      v23 = self;
      v24 = 2112;
      v25 = v17;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "Environment %p safe insets %@", (uint8_t *)&v22, 0x16u);

    }
  }
  v18 = v7;
  v19 = v8;
  v20 = v9;
  v21 = v10;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

- (UIEdgeInsets)safeAreaInsetsAdjustingForNotch:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  unsigned int v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double top;
  double v20;
  double left;
  double v22;
  CGFloat bottom;
  double v24;
  double right;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  unsigned int v33;
  unsigned int v34;
  double v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  UIEdgeInsets result;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication jsa_sharedApplicationIfNotExtension](UIApplication, "jsa_sharedApplicationIfNotExtension"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCLayoutConfigurationEnvironment view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window"));

  if (!v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "delegate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "window"));

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  if (WeakRetained
    || (WeakRetained = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rootViewController"))) != 0)
  {
    v10 = objc_msgSend(WeakRetained, "_appearState");
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "presentedViewController"));
    v12 = v11;
    if (v11 && (v10 == 3 || !v10))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "presentedViewController"));

      if (v13)
      {
        do
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "presentedViewController"));

          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "presentedViewController"));
          v12 = v14;
        }
        while (v15);
      }
      else
      {
        v14 = v12;
      }
      v12 = v14;

      WeakRetained = v12;
    }

  }
  if (-[BCLayoutConfigurationEnvironment opening](self, "opening"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rootViewController"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "view"));
    objc_msgSend(v17, "safeAreaInsets");
    top = v18;
    left = v20;
    bottom = v22;
    right = v24;

  }
  else
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "viewIfLoaded"));
    v16 = v26;
    if (v26)
    {
      objc_msgSend(v26, "safeAreaInsets");
      top = v27;
      left = v28;
      bottom = v29;
      right = v30;
    }
    else
    {
      top = UIEdgeInsetsZero.top;
      left = UIEdgeInsetsZero.left;
      bottom = UIEdgeInsetsZero.bottom;
      right = UIEdgeInsetsZero.right;
    }
  }

  v31 = fabs(top);
  if (objc_msgSend(v5, "isStatusBarHidden") && v31 < 2.22044605e-16)
  {
    -[BCLayoutConfigurationEnvironment statusBarHeight](self, "statusBarHeight");
    top = top + v32;
    v31 = fabs(top);
  }
  v33 = -[BCLayoutConfigurationEnvironment isCompactHeight](self, "isCompactHeight");
  v34 = v33;
  if (v31 >= 2.22044605e-16
    || (v33 & 1) != 0
    || (-[BCLayoutConfigurationEnvironment statusBarHeight](self, "statusBarHeight"), fabs(v35) >= 2.22044605e-16))
  {
    if ((v34 & (top != 0.0)) != 0)
      top = 0.0;
  }
  else
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "windowScene"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "statusBarManager"));
    objc_msgSend(v37, "bc_defaultPortraitStatusBarHeight");
    top = v38;

  }
  if ((v3 & v34) == 1 && -[BCLayoutConfigurationEnvironment isLandscape](self, "isLandscape") && left == 44.0)
  {
    right = right + -13.0;
    left = 31.0;
  }

  v39 = top;
  v40 = left;
  v41 = bottom;
  v42 = right;
  result.right = v42;
  result.bottom = v41;
  result.left = v40;
  result.top = v39;
  return result;
}

- (CGSize)size
{
  double width;
  double height;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  width = self->_viewSize.width;
  if (width == 0.0 || (height = self->_viewSize.height, height == 0.0))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCLayoutConfigurationEnvironment targetView](self, "targetView"));
    objc_msgSend(v4, "frame");
    width = v5;
    height = v6;

  }
  v7 = width;
  v8 = height;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)screenSize
{
  double width;
  double height;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  width = self->_screenSize.width;
  if (width == 0.0 || (height = self->_screenSize.height, height == 0.0))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v4, "bounds");
    width = v5;
    height = v6;

  }
  v7 = width;
  v8 = height;
  result.height = v8;
  result.width = v7;
  return result;
}

- (BOOL)isCompactWidth
{
  UITraitCollection *trait;
  char *v4;
  void *v5;
  void *v6;

  trait = self->_trait;
  if (trait)
  {
    v4 = -[UITraitCollection horizontalSizeClass](trait, "horizontalSizeClass");
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCLayoutConfigurationEnvironment _targetViewTraitEnvironment](self, "_targetViewTraitEnvironment"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "traitCollection"));
    v4 = (char *)objc_msgSend(v6, "horizontalSizeClass");

  }
  return v4 == (_BYTE *)&dword_0 + 1;
}

- (BOOL)isCompactHeight
{
  UITraitCollection *trait;
  char *v4;
  void *v5;
  void *v6;

  trait = self->_trait;
  if (trait)
  {
    v4 = -[UITraitCollection verticalSizeClass](trait, "verticalSizeClass");
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCLayoutConfigurationEnvironment _targetViewTraitEnvironment](self, "_targetViewTraitEnvironment"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "traitCollection"));
    v4 = (char *)objc_msgSend(v6, "verticalSizeClass");

  }
  return v4 == (_BYTE *)&dword_0 + 1;
}

- (BOOL)isLandscape
{
  double v2;
  double v3;

  -[BCLayoutConfigurationEnvironment size](self, "size");
  return v2 > v3;
}

- (BOOL)isPortrait
{
  double v2;
  double v3;

  -[BCLayoutConfigurationEnvironment size](self, "size");
  return v2 < v3;
}

- (void)freeze
{
  void *v3;
  CGFloat v4;
  CGFloat v5;
  void *v6;
  void *v7;
  void *v8;
  UITraitCollection *v9;
  UITraitCollection *trait;
  CGFloat v11;
  CGFloat v12;
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCLayoutConfigurationEnvironment targetView](self, "targetView"));
  objc_msgSend(v3, "frame");
  self->_viewSize.width = v4;
  self->_viewSize.height = v5;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "windowScene"));
  self->_interfaceOrientation = (int64_t)objc_msgSend(v7, "interfaceOrientation");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCLayoutConfigurationEnvironment _targetViewTraitEnvironment](self, "_targetViewTraitEnvironment"));
  v9 = (UITraitCollection *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "traitCollection"));
  trait = self->_trait;
  self->_trait = v9;

  v13 = (id)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v13, "bounds");
  self->_screenSize.width = v11;
  self->_screenSize.height = v12;

}

- (void)unfreeze
{
  UITraitCollection *trait;
  CGSize v4;

  v4 = CGSizeZero;
  self->_viewSize = CGSizeZero;
  trait = self->_trait;
  self->_interfaceOrientation = 0;
  self->_trait = 0;

  self->_screenSize = v4;
}

- (UITraitCollection)traitCollection
{
  UITraitCollection *trait;
  UITraitCollection *v3;
  id WeakRetained;

  trait = self->_trait;
  if (trait)
  {
    v3 = trait;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
    v3 = (UITraitCollection *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "traitCollection"));

  }
  return v3;
}

- (id)targetView
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCLayoutConfigurationEnvironment view](self, "view"));
  if (!v2)
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow"));
  return v2;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  double width;
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[4];
  _QWORD v25[2];
  _QWORD v26[2];

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  width = self->_viewSize.width;
  if (self->_viewSize.height == CGSizeZero.height && width == CGSizeZero.width)
    v8 = CFSTR("NO");
  else
    v8 = CFSTR("YES");
  -[BCLayoutConfigurationEnvironment size](self, "size", width);
  v26[0] = v9;
  v26[1] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", v26, "{CGSize=dd}"));
  -[BCLayoutConfigurationEnvironment screenSize](self, "screenSize");
  v25[0] = v12;
  v25[1] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", v25, "{CGSize=dd}"));
  -[BCLayoutConfigurationEnvironment safeAreaInsets](self, "safeAreaInsets");
  v24[0] = v15;
  v24[1] = v16;
  v24[2] = v17;
  v24[3] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", v24, "{UIEdgeInsets=dddd}"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_interfaceOrientation));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[BCLayoutConfigurationEnvironment traitCollection](self, "traitCollection"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@:%p, frozen:%@, size:%@, screenSize:%@, safeAreaInsets:%@, interfaceOrientation:%@, traitCollection:%@>"), v5, self, v8, v11, v14, v19, v20, v21));

  return v22;
}

- (id)_targetViewTraitEnvironment
{
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BCLayoutConfigurationEnvironment targetView](self, "targetView"));
  v3 = v2;
  if ((objc_opt_respondsToSelector(v2, "_viewDelegate") & 1) != 0)
  {
    v4 = objc_opt_class(UIViewController);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_viewDelegate"));
    v6 = BUDynamicCast(v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

    v3 = v2;
    if (v7)
    {
      v3 = v7;

    }
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  id WeakRetained;
  char *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v5 = objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  v7 = (char *)objc_msgSend(v5, "initWithViewController:", WeakRetained);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCLayoutConfigurationEnvironment view](self, "view"));
  objc_msgSend(v7, "setView:", v8);

  *(CGSize *)(v7 + 8) = self->_viewSize;
  *((_QWORD *)v7 + 5) = self->_interfaceOrientation;
  v9 = -[UITraitCollection copyWithZone:](self->_trait, "copyWithZone:", a3);
  v10 = (void *)*((_QWORD *)v7 + 6);
  *((_QWORD *)v7 + 6) = v9;

  *(CGSize *)(v7 + 24) = self->_screenSize;
  v11 = objc_loadWeakRetained((id *)&self->_overrideProvider);
  objc_storeWeak((id *)v7 + 10, v11);

  return v7;
}

- (BOOL)isEqualToLayoutConfigurationEnvironment:(id)a3
{
  void *v3;
  id *v5;
  id WeakRetained;
  id v7;
  BOOL v8;
  id v9;
  id v10;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  UITraitCollection *trait;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;

  v5 = (id *)a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  v7 = objc_loadWeakRetained(v5 + 7);
  if (WeakRetained == v7)
  {
    v9 = objc_loadWeakRetained((id *)&self->_view);
    v10 = objc_loadWeakRetained(v5 + 9);
    if (v9 != v10)
      goto LABEL_8;
    if (self->_viewSize.width != *((double *)v5 + 1) || self->_viewSize.height != *((double *)v5 + 2))
      goto LABEL_8;
    -[BCLayoutConfigurationEnvironment size](self, "size");
    v14 = v13;
    v16 = v15;
    objc_msgSend(v5, "size");
    v8 = 0;
    if (v14 != v18)
      goto LABEL_9;
    if (v16 != v17)
      goto LABEL_9;
    v8 = 0;
    if (self->_screenSize.width != *((double *)v5 + 3))
      goto LABEL_9;
    if (self->_screenSize.height != *((double *)v5 + 4))
      goto LABEL_9;
    -[BCLayoutConfigurationEnvironment screenSize](self, "screenSize");
    v20 = v19;
    v22 = v21;
    objc_msgSend(v5, "screenSize");
    v8 = 0;
    if (v20 != v24 || v22 != v23)
      goto LABEL_9;
    if ((id)self->_interfaceOrientation != v5[5]
      || (trait = self->_trait, trait != v5[6]) && !-[UITraitCollection isEqual:](trait, "isEqual:"))
    {
LABEL_8:
      v8 = 0;
LABEL_9:

      goto LABEL_10;
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[BCLayoutConfigurationEnvironment traitCollection](self, "traitCollection"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "traitCollection"));
    if (v26 == v27
      || (v28 = (void *)objc_claimAutoreleasedReturnValue(-[BCLayoutConfigurationEnvironment traitCollection](self, "traitCollection")),
          v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "traitCollection")),
          v31 = v28,
          objc_msgSend(v28, "isEqual:", v3)))
    {
      v29 = objc_loadWeakRetained((id *)&self->_overrideProvider);
      v30 = objc_loadWeakRetained(v5 + 10);
      v8 = v29 == v30;

      if (v26 == v27)
      {
LABEL_25:

        goto LABEL_9;
      }
    }
    else
    {
      v8 = 0;
    }

    goto LABEL_25;
  }
  v8 = 0;
LABEL_10:

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  BCLayoutConfigurationEnvironment *v4;
  uint64_t v5;
  BOOL v6;

  v4 = (BCLayoutConfigurationEnvironment *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class(BCLayoutConfigurationEnvironment);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
      v6 = -[BCLayoutConfigurationEnvironment isEqualToLayoutConfigurationEnvironment:](self, "isEqualToLayoutConfigurationEnvironment:", v4);
    else
      v6 = 0;
  }

  return v6;
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (void)setView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
}

- (IMEnvironmentOverrideProvider)overrideProvider
{
  return (IMEnvironmentOverrideProvider *)objc_loadWeakRetained((id *)&self->_overrideProvider);
}

- (void)setOverrideProvider:(id)a3
{
  objc_storeWeak((id *)&self->_overrideProvider, a3);
}

- (BOOL)opening
{
  return self->_opening;
}

- (void)setOpening:(BOOL)a3
{
  self->_opening = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_overrideProvider);
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_viewController);
  objc_storeStrong((id *)&self->_trait, 0);
}

@end
