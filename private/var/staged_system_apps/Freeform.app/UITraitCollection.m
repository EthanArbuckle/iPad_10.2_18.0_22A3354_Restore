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
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125DBA0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E34094();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125DBC0);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[UITraitCollection(CRLAdditions) crl_isCompactWidth]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/UITraitCollection_CRLAdditions.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 22, 0, "expected inequality between %{public}s and %{public}s", "horizontalSizeClass", "UIUserInterfaceSizeClassUnspecified");

  }
  v7 = -[UITraitCollection verticalSizeClass](self, "verticalSizeClass");
  if (v7 == UIUserInterfaceSizeClassUnspecified)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125DBE0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E33FFC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125DC00);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v8);
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
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125DC20);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E3412C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125DC40);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v3);
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
  if (qword_101415A68 != -1)
    dispatch_once(&qword_101415A68, &stru_10125DC60);
  return (id)qword_101415A58;
}

+ (id)crl_elevatedTraitCollection
{
  if (qword_101415A70 != -1)
    dispatch_once(&qword_101415A70, &stru_10125DC80);
  return (id)qword_101415A60;
}

@end
