@implementation UIScreen

+ (int64_t)crl_screenClass
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D968;
  block[3] = &unk_100061BE8;
  block[4] = a1;
  if (qword_10006DB00 != -1)
    dispatch_once(&qword_10006DB00, block);
  return qword_10006DAF8;
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
        if (CRLAssertCat_init_token != -1)
          dispatch_once(&CRLAssertCat_init_token, &stru_100061C08);
        if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR))
          sub_10004CA00();
        if (CRLAssertCat_init_token != -1)
          dispatch_once(&CRLAssertCat_init_token, &stru_100061C28);
        v8 = CRLAssertCat_log_t;
        if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR))
          sub_10004BDEC(v8);
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
    if (CRLAssertCat_init_token != -1)
      dispatch_once(&CRLAssertCat_init_token, &stru_100061C48);
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR))
      sub_10004C97C();
    if (CRLAssertCat_init_token != -1)
      dispatch_once(&CRLAssertCat_init_token, &stru_100061C68);
    v11 = CRLAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR))
      sub_10004BDEC(v11);
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
    if (CRLAssertCat_init_token != -1)
      dispatch_once(&CRLAssertCat_init_token, &stru_100061C88);
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR))
      sub_10004C8F8();
    if (CRLAssertCat_init_token != -1)
      dispatch_once(&CRLAssertCat_init_token, &stru_100061CA8);
    v13 = CRLAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR))
      sub_10004BDEC(v13);
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
        if (CRLAssertCat_init_token != -1)
          dispatch_once(&CRLAssertCat_init_token, &stru_100061CC8);
        if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR))
          sub_10004C874();
        if (CRLAssertCat_init_token != -1)
          dispatch_once(&CRLAssertCat_init_token, &stru_100061CE8);
        v14 = CRLAssertCat_log_t;
        if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR))
          sub_10004BDEC(v14);
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
    if (CRLAssertCat_init_token != -1)
      dispatch_once(&CRLAssertCat_init_token, &stru_100061D08);
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR))
      sub_10004C7F0();
    if (CRLAssertCat_init_token != -1)
      dispatch_once(&CRLAssertCat_init_token, &stru_100061D28);
    v12 = CRLAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR))
      sub_10004BDEC(v12);
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
  if (qword_10006DB10 != -1)
    dispatch_once(&qword_10006DB10, &stru_100061D48);
  return byte_10006DB08;
}

+ (BOOL)crl_screenClassPhoneUISmallOrRegularZoom
{
  if (qword_10006DB20 != -1)
    dispatch_once(&qword_10006DB20, &stru_100061D68);
  return byte_10006DB18;
}

+ (double)crl_screenZoomScale
{
  if (qword_10006DB28 != -1)
    dispatch_once(&qword_10006DB28, &stru_100061D88);
  return *(double *)&qword_10006C538;
}

+ (BOOL)crl_pad1080H
{
  if (qword_10006DB38 != -1)
    dispatch_once(&qword_10006DB38, &stru_100061DA8);
  return byte_10006DB30;
}

+ (BOOL)crl_pad1112H
{
  if (qword_10006DB48 != -1)
    dispatch_once(&qword_10006DB48, &stru_100061DC8);
  return byte_10006DB40;
}

+ (BOOL)crl_pad1180H
{
  if (qword_10006DB58 != -1)
    dispatch_once(&qword_10006DB58, &stru_100061DE8);
  return byte_10006DB50;
}

+ (BOOL)crl_pad1194H
{
  if (qword_10006DB68 != -1)
    dispatch_once(&qword_10006DB68, &stru_100061E08);
  return byte_10006DB60;
}

+ (BOOL)crl_pad1366H
{
  if (qword_10006DB78 != -1)
    dispatch_once(&qword_10006DB78, &stru_100061E28);
  return byte_10006DB70;
}

+ (BOOL)crl_pad1366HOrLarger
{
  if (qword_10006DB88 != -1)
    dispatch_once(&qword_10006DB88, &stru_100061E48);
  return byte_10006DB80;
}

+ (BOOL)crl_phoneUI568H
{
  if (qword_10006DB98 != -1)
    dispatch_once(&qword_10006DB98, &stru_100061E68);
  return byte_10006DB90;
}

+ (BOOL)crl_phoneUI568HOrSmaller
{
  if (qword_10006DBA8 != -1)
    dispatch_once(&qword_10006DBA8, &stru_100061E88);
  return byte_10006DBA0;
}

+ (BOOL)crl_phoneUI667H
{
  if (qword_10006DBB8 != -1)
    dispatch_once(&qword_10006DBB8, &stru_100061EA8);
  return byte_10006DBB0;
}

+ (BOOL)crl_phoneUI667HOrSmaller
{
  if (qword_10006DBC8 != -1)
    dispatch_once(&qword_10006DBC8, &stru_100061EC8);
  return byte_10006DBC0;
}

+ (BOOL)crl_phoneUI693H
{
  if (qword_10006DBD8 != -1)
    dispatch_once(&qword_10006DBD8, &stru_100061EE8);
  return byte_10006DBD0;
}

+ (BOOL)crl_phoneUI736H
{
  if (qword_10006DBE8 != -1)
    dispatch_once(&qword_10006DBE8, &stru_100061F08);
  return byte_10006DBE0;
}

+ (BOOL)crl_phoneUI812H
{
  if (qword_10006DBF8 != -1)
    dispatch_once(&qword_10006DBF8, &stru_100061F28);
  return byte_10006DBF0;
}

+ (BOOL)crl_phoneUI812HOrLarger
{
  if (qword_10006DC08 != -1)
    dispatch_once(&qword_10006DC08, &stru_100061F48);
  return byte_10006DC00;
}

+ (BOOL)crl_phoneUI844H
{
  if (qword_10006DC18 != -1)
    dispatch_once(&qword_10006DC18, &stru_100061F68);
  return byte_10006DC10;
}

+ (BOOL)crl_phoneUI896H
{
  if (qword_10006DC28 != -1)
    dispatch_once(&qword_10006DC28, &stru_100061F88);
  return byte_10006DC20;
}

+ (BOOL)crl_phoneUI926H
{
  if (qword_10006DC38 != -1)
    dispatch_once(&qword_10006DC38, &stru_100061FA8);
  return byte_10006DC30;
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

  if (*(double *)&qword_10006C540 >= 0.0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", *(double *)&qword_10006C540);
    if (CRLAssertCat_init_token != -1)
      dispatch_once(&CRLAssertCat_init_token, &stru_100061FC8);
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR))
      sub_10004CA84();
    if (CRLAssertCat_init_token != -1)
      dispatch_once(&CRLAssertCat_init_token, &stru_100061FE8);
    v2 = CRLAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR))
      sub_10004BDEC(v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[UIScreen(CRLAdditions) crl_resetScreenScaleCache]"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/UIScreen_CRLAdditions.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 327, 0, "No one should look at the screen scale before the application has finished launching, because the value isn't ready yet and may change! To debug, break in UIScreen.crl_screenScale and re-launch the app.");

  }
  qword_10006C540 = 0xBFF0000000000000;
}

+ (double)crl_screenScale
{
  double result;
  void *v3;
  uint64_t v4;

  result = *(double *)&qword_10006C540;
  if (*(double *)&qword_10006C540 < 0.0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen", *(double *)&qword_10006C540));
    objc_msgSend(v3, "scale");
    qword_10006C540 = v4;

    return *(double *)&qword_10006C540;
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
    if (CRLAssertCat_init_token != -1)
      dispatch_once(&CRLAssertCat_init_token, &stru_100062008);
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR))
      sub_10004CB0C();
    if (CRLAssertCat_init_token != -1)
      dispatch_once(&CRLAssertCat_init_token, &stru_100062028);
    v5 = CRLAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR))
      sub_10004BDEC(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[UIScreen(CRLAdditions) crl_is3xScreenScale]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/UIScreen_CRLAdditions.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 347, 0, "Unsupported screen scale.");

  }
  return v3 < 0.00000011920929;
}

@end
