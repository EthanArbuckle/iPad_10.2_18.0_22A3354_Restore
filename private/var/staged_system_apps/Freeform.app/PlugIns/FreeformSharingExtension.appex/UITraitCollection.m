@implementation UITraitCollection

- (BOOL)crl_isCompactWidth
{
  UIUserInterfaceSizeClass v3;
  void *v4;
  void *v5;
  void *v6;
  UIUserInterfaceSizeClass v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v12;

  v3 = -[UITraitCollection horizontalSizeClass](self, "horizontalSizeClass");
  if (v3 == UIUserInterfaceSizeClassUnspecified)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (CRLAssertCat_init_token != -1)
      dispatch_once(&CRLAssertCat_init_token, &stru_100061AE8);
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR))
      sub_10004C6C0();
    if (CRLAssertCat_init_token != -1)
      dispatch_once(&CRLAssertCat_init_token, &stru_100061B08);
    v4 = CRLAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR))
      sub_10004C594(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[UITraitCollection(CRLAdditions) crl_isCompactWidth]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/UITraitCollection_CRLAdditions.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 22, 0, "expected inequality between %{public}s and %{public}s", "horizontalSizeClass", "UIUserInterfaceSizeClassUnspecified");

  }
  v7 = -[UITraitCollection verticalSizeClass](self, "verticalSizeClass");
  if (v7 == UIUserInterfaceSizeClassUnspecified)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (CRLAssertCat_init_token != -1)
      dispatch_once(&CRLAssertCat_init_token, &stru_100061B28);
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR))
      sub_10004C628();
    if (CRLAssertCat_init_token != -1)
      dispatch_once(&CRLAssertCat_init_token, &stru_100061B48);
    v8 = CRLAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR))
      sub_10004C594(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[UITraitCollection(CRLAdditions) crl_isCompactWidth]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/UITraitCollection_CRLAdditions.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 27, 0, "expected inequality between %{public}s and %{public}s", "verticalSizeClass", "UIUserInterfaceSizeClassUnspecified");

  }
  v12 = v3 == UIUserInterfaceSizeClassRegular && v7 == UIUserInterfaceSizeClassCompact;
  return v3 == UIUserInterfaceSizeClassCompact || v12;
}

- (BOOL)crl_isCompactHeight
{
  UIUserInterfaceSizeClass v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = -[UITraitCollection verticalSizeClass](self, "verticalSizeClass");
  if (v2 == UIUserInterfaceSizeClassUnspecified)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (CRLAssertCat_init_token != -1)
      dispatch_once(&CRLAssertCat_init_token, &stru_100061B68);
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR))
      sub_10004C758();
    if (CRLAssertCat_init_token != -1)
      dispatch_once(&CRLAssertCat_init_token, &stru_100061B88);
    v3 = CRLAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR))
      sub_10004C594(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[UITraitCollection(CRLAdditions) crl_isCompactHeight]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/UITraitCollection_CRLAdditions.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 48, 0, "expected inequality between %{public}s and %{public}s", "verticalSizeClass", "UIUserInterfaceSizeClassUnspecified");

  }
  return v2 == UIUserInterfaceSizeClassCompact;
}

- (BOOL)crl_isUnspecified
{
  return -[UITraitCollection horizontalSizeClass](self, "horizontalSizeClass") == UIUserInterfaceSizeClassUnspecified
      || -[UITraitCollection verticalSizeClass](self, "verticalSizeClass") == UIUserInterfaceSizeClassUnspecified;
}

- (BOOL)crl_isUserInterfaceStyleLight
{
  return (id)-[UITraitCollection userInterfaceStyle](self, "userInterfaceStyle") == (id)1;
}

- (BOOL)crl_isUserInterfaceStyleDark
{
  return (id)-[UITraitCollection userInterfaceStyle](self, "userInterfaceStyle") == (id)2;
}

- (BOOL)crl_isUserInterfaceStyleUnspecified
{
  return -[UITraitCollection userInterfaceStyle](self, "userInterfaceStyle") == UIUserInterfaceStyleUnspecified;
}

- (BOOL)crl_hasSameUserInterfaceStyleWith:(id)a3
{
  id v4;
  UIUserInterfaceStyle v5;
  id v6;

  v4 = a3;
  v5 = -[UITraitCollection userInterfaceStyle](self, "userInterfaceStyle");
  v6 = objc_msgSend(v4, "userInterfaceStyle");

  return v5 == (_QWORD)v6;
}

+ (void)crl_withTraitCollectionAsCurrent:(id)a3 performBlock:(id)a4
{
  void (**v5)(_QWORD);
  id v6;
  id v7;

  v5 = (void (**)(_QWORD))a4;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[UITraitCollection currentTraitCollection](UITraitCollection, "currentTraitCollection"));
  +[UITraitCollection setCurrentTraitCollection:](UITraitCollection, "setCurrentTraitCollection:", v6);

  v5[2](v5);
  +[UITraitCollection setCurrentTraitCollection:](UITraitCollection, "setCurrentTraitCollection:", v7);

}

+ (id)crl_baseTraitCollection
{
  if (qword_10006DAE8 != -1)
    dispatch_once(&qword_10006DAE8, &stru_100061BA8);
  return (id)qword_10006DAD8;
}

+ (id)crl_elevatedTraitCollection
{
  if (qword_10006DAF0 != -1)
    dispatch_once(&qword_10006DAF0, &stru_100061BC8);
  return (id)qword_10006DAE0;
}

@end
