@implementation THBookmarkMenuPopoverViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THBookmarkMenuPopoverViewController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  UIAccessibilityNotifications v7;
  NSString *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)THBookmarkMenuPopoverViewControllerAccessibility;
  -[THBookmarkMenuPopoverViewControllerAccessibility tableView:didSelectRowAtIndexPath:](&v9, "tableView:didSelectRowAtIndexPath:");
  v6 = objc_msgSend(objc_msgSend(a3, "cellForRowAtIndexPath:", a4), "accessibilityLabel");
  if (objc_msgSend(v6, "length"))
  {
    v7 = UIAccessibilityAnnouncementNotification;
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", THAccessibilityLocalizedString((uint64_t)CFSTR("moved.to.format %@")), v6);
    UIAccessibilityPostNotification(v7, v8);
  }
}

@end
