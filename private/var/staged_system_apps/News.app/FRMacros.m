@implementation FRMacros

+ (BOOL)iPhone
{
  if (qword_10010A5C0 != -1)
    dispatch_once(&qword_10010A5C0, &stru_1000DC998);
  return byte_10010A5C8;
}

+ (BOOL)iPad
{
  if (qword_10010A5B0 != -1)
    dispatch_once(&qword_10010A5B0, &stru_1000DC978);
  return byte_10010A5B8;
}

+ (void)useManagedContextWithSize:(CGSize)a3 opaque:(BOOL)a4 scale:(double)a5 contextBlock:(id)a6
{
  objc_msgSend(a1, "useManagedContextWithSize:opaque:forceSRGB:scale:contextBlock:", a4, 0, a6, a3.width, a3.height, a5);
}

+ (void)useManagedContextWithSize:(CGSize)a3 opaque:(BOOL)a4 forceSRGB:(BOOL)a5 scale:(double)a6 contextBlock:(id)a7
{
  _BOOL4 v8;
  _BOOL8 v9;
  double height;
  double width;
  id v12;
  void *v13;
  double v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v8 = a5;
  v9 = a4;
  height = a3.height;
  width = a3.width;
  v12 = a7;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIGraphicsImageRendererFormat preferredFormat](UIGraphicsImageRendererFormat, "preferredFormat"));
  if (vabdd_f64(0.0, a6) < 0.00999999978)
  {
    +[FRMacros deviceScreenScaleFromPotentialBackgroundThread](FRMacros, "deviceScreenScaleFromPotentialBackgroundThread");
    a6 = v14;
  }
  objc_msgSend(v13, "setScale:", a6);
  if (v8)
    objc_msgSend(v13, "setPreferredRange:", 2);
  objc_msgSend(v13, "setOpaque:", v9);
  v15 = objc_autoreleasePoolPush();
  v16 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:format:", v13, width, height);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10004F18C;
  v19[3] = &unk_1000DC8F8;
  v18 = v12;
  v20 = v18;
  v17 = objc_msgSend(v16, "imageWithActions:", v19);

  objc_autoreleasePoolPop(v15);
}

+ (id)imageFromNewGraphicsContextWithSize:(CGSize)a3 opaque:(BOOL)a4 scale:(double)a5 contextBlock:(id)a6
{
  return objc_msgSend(a1, "imageFromNewGraphicsContextWithSize:opaque:forceSRGB:scale:contextBlock:", a4, 0, a6, a3.width, a3.height, a5);
}

+ (id)imageFromNewGraphicsContextWithSize:(CGSize)a3 opaque:(BOOL)a4 forceSRGB:(BOOL)a5 scale:(double)a6 contextBlock:(id)a7
{
  _BOOL4 v8;
  _BOOL8 v9;
  double height;
  double width;
  id v12;
  void *v13;
  double v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  id v21;

  v8 = a5;
  v9 = a4;
  height = a3.height;
  width = a3.width;
  v12 = a7;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIGraphicsImageRendererFormat preferredFormat](UIGraphicsImageRendererFormat, "preferredFormat"));
  if (vabdd_f64(0.0, a6) < 0.00999999978)
  {
    +[FRMacros deviceScreenScaleFromPotentialBackgroundThread](FRMacros, "deviceScreenScaleFromPotentialBackgroundThread");
    a6 = v14;
  }
  objc_msgSend(v13, "setScale:", a6);
  objc_msgSend(v13, "setOpaque:", v9);
  if (v8)
    objc_msgSend(v13, "setPreferredRange:", 2);
  v15 = objc_autoreleasePoolPush();
  v16 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:format:", v13, width, height);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10004F31C;
  v20[3] = &unk_1000DC8F8;
  v17 = v12;
  v21 = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "imageWithActions:", v20));

  objc_autoreleasePoolPop(v15);
  return v18;
}

+ (BOOL)viewIsCompact:(id)a3
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "traitCollection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithHorizontalSizeClass:](UITraitCollection, "traitCollectionWithHorizontalSizeClass:", 1));
  v5 = objc_msgSend(v3, "containsTraitsInCollection:", v4);

  return v5;
}

+ (BOOL)windowIsLandscape
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "key_window"));

  objc_msgSend(v3, "frame");
  v5 = v4;
  objc_msgSend(v3, "frame");
  LOBYTE(v2) = v5 > v6;

  return (char)v2;
}

+ (BOOL)disableAllAds
{
  int v2;
  void *v3;
  unsigned __int8 v4;

  v2 = NFInternalBuild(a1);
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("disable-all-ads"));

    LOBYTE(v2) = v4;
  }
  return v2;
}

+ (double)maxScreenSide
{
  if (qword_10010A580 != -1)
    dispatch_once(&qword_10010A580, &stru_1000DC918);
  return *(double *)&qword_10010A588;
}

+ (double)minScreenSide
{
  if (qword_10010A590 != -1)
    dispatch_once(&qword_10010A590, &stru_1000DC938);
  return *(double *)&qword_10010A598;
}

+ (BOOL)splitScreen
{
  void *v2;
  void *v3;
  void *v4;
  double Width;
  BOOL v6;
  CGRect v8;
  CGRect v9;

  +[NSThread isMainThread](NSThread, "isMainThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "key_window"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v3, "frame");
  Width = CGRectGetWidth(v8);
  objc_msgSend(v4, "bounds");
  v6 = Width != CGRectGetWidth(v9);

  return v6;
}

+ (BOOL)splitScreenEqual
{
  void *v3;
  void *v4;
  void *v5;
  double Width;
  BOOL v7;
  CGRect v9;
  CGRect v10;

  +[NSThread isMainThread](NSThread, "isMainThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "key_window"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  if (objc_msgSend(a1, "splitScreen"))
  {
    objc_msgSend(v4, "frame");
    Width = CGRectGetWidth(v9);
    objc_msgSend(v5, "bounds");
    v7 = Width == CGRectGetWidth(v10) * 0.5 + -5.0;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)splitScreenOneThird
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  double Width;
  CGRect v9;
  CGRect v10;

  +[NSThread isMainThread](NSThread, "isMainThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "key_window"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  if (objc_msgSend(a1, "splitScreen") && (objc_msgSend(a1, "splitScreenEqual") & 1) == 0)
  {
    objc_msgSend(v4, "frame");
    Width = CGRectGetWidth(v9);
    objc_msgSend(v5, "bounds");
    v6 = Width < CGRectGetWidth(v10) * 0.5;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)splitScreenThreeQuarters
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  double Width;
  CGRect v9;
  CGRect v10;

  +[NSThread isMainThread](NSThread, "isMainThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "key_window"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  if (objc_msgSend(a1, "splitScreen") && (objc_msgSend(a1, "portrait") & 1) == 0)
  {
    objc_msgSend(v4, "frame");
    Width = CGRectGetWidth(v9);
    objc_msgSend(v5, "bounds");
    v6 = Width > CGRectGetWidth(v10) * 0.5;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)splitScreenTwoThirds
{
  void *v3;
  void *v4;
  void *v5;
  double Width;
  BOOL v7;
  CGRect v9;
  CGRect v10;

  +[NSThread isMainThread](NSThread, "isMainThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "key_window"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  if (objc_msgSend(a1, "splitScreen") && objc_msgSend(a1, "portrait"))
  {
    objc_msgSend(v4, "frame");
    Width = CGRectGetWidth(v9);
    objc_msgSend(v5, "bounds");
    v7 = Width > CGRectGetWidth(v10) * 0.5;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)portrait
{
  void *v2;
  void *v3;
  void *v4;
  char *v5;

  +[NSThread isMainThread](NSThread, "isMainThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "key_window"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "windowScene"));
  v5 = (char *)objc_msgSend(v4, "interfaceOrientation");

  return (unint64_t)(v5 - 1) < 2;
}

+ (BOOL)iPadPro
{
  if (qword_10010A5A0 != -1)
    dispatch_once(&qword_10010A5A0, &stru_1000DC958);
  return byte_10010A5A8;
}

+ (BOOL)retina
{
  if (qword_10010A5D0 != -1)
    dispatch_once(&qword_10010A5D0, &stru_1000DC9B8);
  return byte_10010A5D8;
}

+ (BOOL)iPhone4OrLess
{
  if (qword_10010A5E0 != -1)
    dispatch_once(&qword_10010A5E0, &stru_1000DC9D8);
  return byte_10010A5E8;
}

+ (BOOL)iPhone5OrLess
{
  if (qword_10010A5F0 != -1)
    dispatch_once(&qword_10010A5F0, &stru_1000DC9F8);
  return byte_10010A5F8;
}

+ (BOOL)iPhone5
{
  if (qword_10010A600 != -1)
    dispatch_once(&qword_10010A600, &stru_1000DCA18);
  return byte_10010A608;
}

+ (BOOL)iPhone5Landscape
{
  void *v2;
  double v3;
  BOOL v4;

  if (!+[FRMacros iPhone](FRMacros, "iPhone"))
    return 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v2, "bounds");
  v4 = v3 == 568.0;

  return v4;
}

+ (BOOL)iPhone6
{
  if (qword_10010A610 != -1)
    dispatch_once(&qword_10010A610, &stru_1000DCA38);
  return byte_10010A618;
}

+ (BOOL)iPhone6OrLess
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004FF5C;
  block[3] = &unk_1000DBA48;
  block[4] = a1;
  if (qword_10010A620 != -1)
    dispatch_once(&qword_10010A620, block);
  return byte_10010A628;
}

+ (BOOL)iPhone6P
{
  if (qword_10010A630 != -1)
    dispatch_once(&qword_10010A630, &stru_1000DCA58);
  return byte_10010A638;
}

+ (BOOL)iPhone6POrLess
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000500F8;
  block[3] = &unk_1000DBA48;
  block[4] = a1;
  if (qword_10010A640 != -1)
    dispatch_once(&qword_10010A640, block);
  return byte_10010A648;
}

+ (BOOL)iPhoneFancyAF
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000501C0;
  block[3] = &unk_1000DBA48;
  block[4] = a1;
  if (qword_10010A650 != -1)
    dispatch_once(&qword_10010A650, block);
  return byte_10010A658;
}

+ (BOOL)isOrbDevice
{
  if (qword_10010A660 != -1)
    dispatch_once(&qword_10010A660, &stru_1000DCA78);
  return byte_10010A659;
}

+ (BOOL)isUIAutomationRunning
{
  if (qword_10010A670 != -1)
    dispatch_once(&qword_10010A670, &stru_1000DCA98);
  return byte_10010A668;
}

+ (double)deviceScreenScaleFromPotentialBackgroundThread
{
  void *v2;
  double v3;
  double v4;

  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v2, "scale");
    v4 = v3;

    return v4;
  }
  else
  {
    if (qword_10010A680 != -1)
      dispatch_once(&qword_10010A680, &stru_1000DCAB8);
    return *(double *)&qword_10010A678;
  }
}

+ (BOOL)isHardwareKeyboardAttached
{
  return GSEventIsHardwareKeyboardAttached(a1, a2) != 0;
}

@end
