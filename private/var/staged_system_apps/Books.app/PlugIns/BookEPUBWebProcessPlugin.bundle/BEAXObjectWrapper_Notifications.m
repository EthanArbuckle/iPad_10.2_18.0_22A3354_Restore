@implementation BEAXObjectWrapper_Notifications

+ (id)baxTargetClassName
{
  return CFSTR("WebAccessibilityObjectWrapper");
}

+ (Class)baxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(BAXSafeCategory, a2);
}

- (id)_accessibilityMakeScrollStatus
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BEAXObjectWrapper_Notifications _beaxParentWebPageObject](self, "_beaxParentWebPageObject"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_accessibilityScrollStatus"));

  return v3;
}

- (id)_beaxParentWebPageObject
{
  id v2;
  Class v3;
  uint64_t v4;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BEAXObjectWrapper_Notifications accessibilityContainer](self, "accessibilityContainer"));
  if (v2)
  {
    while (1)
    {
      v3 = NSClassFromString(CFSTR("WKAccessibilityWebPageObject"));
      if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
        break;
      v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accessibilityContainer"));

      v2 = (id)v4;
      if (!v4)
        goto LABEL_6;
    }
    v2 = v2;
  }
LABEL_6:

  return v2;
}

@end
