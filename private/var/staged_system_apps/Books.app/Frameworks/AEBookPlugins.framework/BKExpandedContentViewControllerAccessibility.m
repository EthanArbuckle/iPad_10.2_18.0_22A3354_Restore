@implementation BKExpandedContentViewControllerAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("BKExpandedContentViewController");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory);
}

- (void)setToolbarVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  objc_super v7;

  v4 = a4;
  v5 = a3;
  if (!UIAccessibilityIsVoiceOverRunning() || v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)BKExpandedContentViewControllerAccessibility;
    -[BKExpandedContentViewControllerAccessibility setToolbarVisible:animated:](&v7, "setToolbarVisible:animated:", v5, v4);
  }
}

- (void)close:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKExpandedContentViewControllerAccessibility;
  -[BKExpandedContentViewControllerAccessibility close:](&v3, "close:", a3);
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
}

- (void)stopActivityIndicator:(BOOL)a3
{
  UIAccessibilityNotifications v4;
  id v5;
  void *v6;
  dispatch_time_t v7;
  _QWORD block[5];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BKExpandedContentViewControllerAccessibility;
  -[BKExpandedContentViewControllerAccessibility stopActivityIndicator:](&v9, "stopActivityIndicator:", a3);
  v4 = UIAccessibilityAnnouncementNotification;
  v5 = AEAXLocString(CFSTR("preview.visible"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  UIAccessibilityPostNotification(v4, v6);

  v7 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_D3A40;
  block[3] = &unk_1BEA38;
  block[4] = self;
  dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, block);
}

@end
