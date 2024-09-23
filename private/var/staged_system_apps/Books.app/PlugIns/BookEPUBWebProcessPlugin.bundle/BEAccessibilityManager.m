@implementation BEAccessibilityManager

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_E0D0;
  block[3] = &unk_20888;
  block[4] = a1;
  if (qword_27180 != -1)
    dispatch_once(&qword_27180, block);
  return (id)qword_27188;
}

+ (void)accessibilityInitialize
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedInstance"));
  objc_msgSend(v2, "loadAccessibilitySupport");

}

+ (BOOL)isAccessibilityLoaded
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedInstance"));
  v3 = objc_msgSend(v2, "isAccessibilityLoaded");

  return v3;
}

+ (void)accessibilityNeedsReload
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedInstance"));
  objc_msgSend(v2, "setIsAccessibilitySupportLoaded:", 0);
  objc_msgSend(v2, "loadAccessibilitySupportWithDelay");
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);

}

- (void)loadAccessibilitySupportWithDelay
{
  dispatch_time_t v3;
  _QWORD block[5];

  v3 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_E270;
  block[3] = &unk_20768;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)loadAccessibilitySupport
{
  uint64_t v3;
  id v4;

  if (!-[BEAccessibilityManager isAccessibilitySupportLoaded](self, "isAccessibilitySupportLoaded"))
  {
    if (BAXShouldPerformValidationChecks())
      -[BEAccessibilityManager performValidation](self, "performValidation");
    v4 = (id)objc_opt_new(NSMutableSet, v3);
    -[BEAccessibilityManager addSafeCategoryNamesToCollection:](self, "addSafeCategoryNamesToCollection:", v4);
    BAXInstallSafeCategories(v4);
    -[BEAccessibilityManager setIsAccessibilitySupportLoaded:](self, "setIsAccessibilitySupportLoaded:", 1);

  }
}

- (void)addSafeCategoryNamesToCollection:(id)a3
{
  id v3;

  v3 = a3;
  if ((_os_feature_enabled_impl("Accessibility", "VoiceOverBooksExperienceV2") & 1) == 0)
    objc_msgSend(v3, "addObject:", CFSTR("BAXObjectWrapper"));
  objc_msgSend(v3, "addObject:", CFSTR("BEAXObjectWrapper_Notifications"));
  objc_msgSend(v3, "addObject:", CFSTR("BAXWebPageAccessibilityObjectWrapper"));

}

- (BOOL)isAccessibilitySupportLoaded
{
  return self->_isAccessibilitySupportLoaded;
}

- (void)setIsAccessibilitySupportLoaded:(BOOL)a3
{
  self->_isAccessibilitySupportLoaded = a3;
}

@end
