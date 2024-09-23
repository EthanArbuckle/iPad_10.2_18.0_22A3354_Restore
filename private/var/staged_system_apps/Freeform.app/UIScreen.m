@implementation UIScreen

+ (int64_t)crl_screenClass
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10038EA14;
  block[3] = &unk_10122DC38;
  block[4] = a1;
  if (qword_101415600 != -1)
    dispatch_once(&qword_101415600, block);
  return qword_1014155F8;
}

+ (int64_t)p_crl_uncachedScreenClass
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;

  if (!+[UIDevice crl_phoneUI](UIDevice, "crl_phoneUI"))
    return 0;
  if (v4 < v6)
    v4 = v6;
  if (v4 <= 667.0)
  {
    if (v4 != 557.0)
    {
      v7 = 1;
      if (v4 == 568.0)
        return v7;
      if (fabs(v4 + -557.0) < 0.000556999999)
        return v7;
      v7 = 1;
      if (v4 == 667.0 || fabs(v4 + -568.0) < 0.000567999999)
        return v7;
      if (fabs(v4 + -667.0) >= 0.000666999998)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101256D90);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E29A9C();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101256DB0);
        v8 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[UIScreen(CRLAdditions) p_crl_uncachedScreenClass]"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/UIScreen_CRLAdditions.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 34, 0, "New device size not handled (%f). Defaulting to CRLUIScreenClassPhoneUISmall.", *(_QWORD *)&v4);
        v7 = 1;
        goto LABEL_77;
      }
    }
    return 1;
  }
  if (v4 <= 693.0)
  {
    if (v4 == 693.0 || fabs(v4 + -693.0) < 0.000692999998)
      return 2;
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101256DD0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E29A18();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101256DF0);
    v11 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[UIScreen(CRLAdditions) p_crl_uncachedScreenClass]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/UIScreen_CRLAdditions.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 37, 0, "New device size not handled (%f). Defaulting to CRLUIScreenClassPhoneUIRegularZoom.", *(_QWORD *)&v4);
    v7 = 2;
    goto LABEL_77;
  }
  if (v4 <= 736.0)
  {
    if (v4 == 736.0 || fabs(v4 + -736.0) < 0.000735999998)
      return 4;
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101256E10);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E29994();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101256E30);
    v13 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[UIScreen(CRLAdditions) p_crl_uncachedScreenClass]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/UIScreen_CRLAdditions.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 40, 0, "New device size not handled (%f). Defaulting to CRLUIScreenClassPhoneUIRegularPlus.", *(_QWORD *)&v4);
    v7 = 4;
    goto LABEL_77;
  }
  if (v4 <= 844.0)
  {
    if (v4 != 812.0)
    {
      v7 = 3;
      if (v4 == 844.0 || fabs(v4 + -812.0) < 0.000811999998)
        return v7;
      if (fabs(v4 + -844.0) >= 0.000843999998)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101256E50);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E29910();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101256E70);
        v14 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[UIScreen(CRLAdditions) p_crl_uncachedScreenClass]"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/UIScreen_CRLAdditions.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 43, 0, "New device size not handled (%f). Defaulting to CRLUIScreenClassPhoneUIRegular.", *(_QWORD *)&v4);
        v7 = 3;
        goto LABEL_77;
      }
    }
    return 3;
  }
  if (v4 == 896.0)
    return 5;
  v7 = 5;
  if (v4 != 926.0 && fabs(v4 + -896.0) >= 0.000895999998)
  {
    if (fabs(v4 + -926.0) < 0.000925999998)
      return 5;
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101256E90);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2988C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101256EB0);
    v12 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[UIScreen(CRLAdditions) p_crl_uncachedScreenClass]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/UIScreen_CRLAdditions.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 46, 0, "New device size not handled (%f). Defaulting to CRLUIScreenClassPhoneUILarge.", *(_QWORD *)&v4);
    v7 = 5;
LABEL_77:

  }
  return v7;
}

+ (BOOL)crl_screenClassPhoneUIRegularOrLarge
{
  if (qword_101415610 != -1)
    dispatch_once(&qword_101415610, &stru_101256ED0);
  return byte_101415608;
}

+ (BOOL)crl_screenClassPhoneUISmallOrRegularZoom
{
  if (qword_101415620 != -1)
    dispatch_once(&qword_101415620, &stru_101256EF0);
  return byte_101415618;
}

+ (double)crl_screenZoomScale
{
  if (qword_101415628 != -1)
    dispatch_once(&qword_101415628, &stru_101256F10);
  return *(double *)&qword_1013DBEC8;
}

+ (BOOL)crl_pad1080H
{
  if (qword_101415638 != -1)
    dispatch_once(&qword_101415638, &stru_101256F30);
  return byte_101415630;
}

+ (BOOL)crl_pad1112H
{
  if (qword_101415648 != -1)
    dispatch_once(&qword_101415648, &stru_101256F50);
  return byte_101415640;
}

+ (BOOL)crl_pad1180H
{
  if (qword_101415658 != -1)
    dispatch_once(&qword_101415658, &stru_101256F70);
  return byte_101415650;
}

+ (BOOL)crl_pad1194H
{
  if (qword_101415668 != -1)
    dispatch_once(&qword_101415668, &stru_101256F90);
  return byte_101415660;
}

+ (BOOL)crl_pad1366H
{
  if (qword_101415678 != -1)
    dispatch_once(&qword_101415678, &stru_101256FB0);
  return byte_101415670;
}

+ (BOOL)crl_pad1366HOrLarger
{
  if (qword_101415688 != -1)
    dispatch_once(&qword_101415688, &stru_101256FD0);
  return byte_101415680;
}

+ (BOOL)crl_phoneUI568H
{
  if (qword_101415698 != -1)
    dispatch_once(&qword_101415698, &stru_101256FF0);
  return byte_101415690;
}

+ (BOOL)crl_phoneUI568HOrSmaller
{
  if (qword_1014156A8 != -1)
    dispatch_once(&qword_1014156A8, &stru_101257010);
  return byte_1014156A0;
}

+ (BOOL)crl_phoneUI667H
{
  if (qword_1014156B8 != -1)
    dispatch_once(&qword_1014156B8, &stru_101257030);
  return byte_1014156B0;
}

+ (BOOL)crl_phoneUI667HOrSmaller
{
  if (qword_1014156C8 != -1)
    dispatch_once(&qword_1014156C8, &stru_101257050);
  return byte_1014156C0;
}

+ (BOOL)crl_phoneUI693H
{
  if (qword_1014156D8 != -1)
    dispatch_once(&qword_1014156D8, &stru_101257070);
  return byte_1014156D0;
}

+ (BOOL)crl_phoneUI736H
{
  if (qword_1014156E8 != -1)
    dispatch_once(&qword_1014156E8, &stru_101257090);
  return byte_1014156E0;
}

+ (BOOL)crl_phoneUI812H
{
  if (qword_1014156F8 != -1)
    dispatch_once(&qword_1014156F8, &stru_1012570B0);
  return byte_1014156F0;
}

+ (BOOL)crl_phoneUI812HOrLarger
{
  if (qword_101415708 != -1)
    dispatch_once(&qword_101415708, &stru_1012570D0);
  return byte_101415700;
}

+ (BOOL)crl_phoneUI844H
{
  if (qword_101415718 != -1)
    dispatch_once(&qword_101415718, &stru_1012570F0);
  return byte_101415710;
}

+ (BOOL)crl_phoneUI896H
{
  if (qword_101415728 != -1)
    dispatch_once(&qword_101415728, &stru_101257110);
  return byte_101415720;
}

+ (BOOL)crl_phoneUI926H
{
  if (qword_101415738 != -1)
    dispatch_once(&qword_101415738, &stru_101257130);
  return byte_101415730;
}

+ (BOOL)crl_isHorizontallyCompactOnLandscape
{
  if ((objc_msgSend(a1, "crl_phoneUI667HOrSmaller") & 1) != 0)
    return 1;
  else
    return _objc_msgSend(a1, "crl_phoneUI812H");
}

+ (BOOL)crl_deviceCanUseSidebar
{
  return +[UIScreen crl_pad1366H](UIScreen, "crl_pad1366H");
}

+ (BOOL)crl_deviceIsLandscape
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;

  return v4 > v6;
}

+ (double)crl_expectedScreenScale
{
  double v2;
  double v3;

  +[UIScreen crl_screenScale](UIScreen, "crl_screenScale");
  v3 = v2;
  if (v2 > 2.0 && +[UIScreen crl_phoneUI667H](UIScreen, "crl_phoneUI667H"))
    return 2.0;
  return v3;
}

+ (void)crl_resetScreenScaleCache
{
  void *v2;
  void *v3;
  void *v4;

  if (*(double *)&qword_1013DBED0 >= 0.0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", *(double *)&qword_1013DBED0);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101257150);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E29B20();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101257170);
    v2 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[UIScreen(CRLAdditions) crl_resetScreenScaleCache]"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/UIScreen_CRLAdditions.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 327, 0, "No one should look at the screen scale before the application has finished launching, because the value isn't ready yet and may change! To debug, break in UIScreen.crl_screenScale and re-launch the app.");

  }
  qword_1013DBED0 = 0xBFF0000000000000;
}

+ (double)crl_screenScale
{
  double result;
  void *v3;
  uint64_t v4;

  result = *(double *)&qword_1013DBED0;
  if (*(double *)&qword_1013DBED0 < 0.0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen", *(double *)&qword_1013DBED0));
    objc_msgSend(v3, "scale");
    qword_1013DBED0 = v4;

    return *(double *)&qword_1013DBED0;
  }
  return result;
}

+ (BOOL)crl_is3xScreenScale
{
  double v2;
  double v3;
  void *v5;
  void *v6;
  void *v7;

  +[UIScreen crl_screenScale](UIScreen, "crl_screenScale");
  v3 = vabdd_f64(3.0, v2);
  if (vabdd_f64(2.0, v2) >= 0.00000011920929 && v3 >= 0.00000011920929)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101257190);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E29BA8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012571B0);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[UIScreen(CRLAdditions) crl_is3xScreenScale]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/UIScreen_CRLAdditions.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 347, 0, "Unsupported screen scale.");

  }
  return v3 < 0.00000011920929;
}

@end
