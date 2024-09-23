@implementation THGlossaryTermsViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THGlossaryTermsViewController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (id)sectionIndexTitlesForTableView:(id)a3
{
  objc_super v6;

  if (UIAccessibilityIsVoiceOverRunning())
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)THGlossaryTermsViewControllerAccessibility;
  return -[THGlossaryTermsViewControllerAccessibility sectionIndexTitlesForTableView:](&v6, "sectionIndexTitlesForTableView:", a3);
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5;
  objc_class *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  char v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)THGlossaryTermsViewControllerAccessibility;
  v5 = -[THGlossaryTermsViewControllerAccessibility tableView:willSelectRowAtIndexPath:](&v12, "tableView:willSelectRowAtIndexPath:", a3, a4);
  v11 = 0;
  v6 = (objc_class *)objc_opt_class(UIViewController);
  v7 = (void *)__TSAccessibilityCastAsClass(v6, (uint64_t)self, 1, &v11);
  if (v11)
    abort();
  v8 = v7;
  if (objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(v7, "view"), "window"), "traitCollection"), "horizontalSizeClass") == (char *)&dword_0 + 1)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_258B34;
    v10[3] = &unk_426DD0;
    v10[4] = v8;
    TSAccessibilityPerformBlockOnMainThreadAfterDelay(v10, 1.0);
  }
  return v5;
}

@end
