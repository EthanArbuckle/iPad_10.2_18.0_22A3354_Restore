@implementation IMUIViewAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("UIView");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory, a2);
}

- (BOOL)accessibilityPerformEscape
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  objc_super v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMUIViewAccessibility imaxIdentification](self, "imaxIdentification"));
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("AENoteWindow")))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "postNotificationName:object:", AEAnnotationPopoverShouldHideNotification, 0);

LABEL_4:
    v5 = 1;
    goto LABEL_8;
  }
  v8.receiver = self;
  v8.super_class = (Class)IMUIViewAccessibility;
  if (-[IMUIViewAccessibility accessibilityPerformEscape](&v8, "accessibilityPerformEscape"))
    goto LABEL_4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMUIViewAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("imaxParentAnnotationPopoverViewController")));
  v5 = objc_opt_respondsToSelector(v6, "hide");
  if ((v5 & 1) != 0)
  {
    objc_msgSend(v6, "hide");
    UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);
  }

LABEL_8:
  return v5 & 1;
}

- (BOOL)_accessibilityEscape
{
  return -[IMUIViewAccessibility accessibilityPerformEscape](self, "accessibilityPerformEscape");
}

@end
