@implementation CRLPopoverBasedViewControllerAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLPopoverBasedViewController");
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(CRLAccessibilitySafeCategory, a2);
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  objc_opt_class(CRLPopoverBasedViewControllerAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLPopoverBasedViewControllerAccessibility;
  -[CRLPopoverBasedViewControllerAccessibility viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[CRLPopoverBasedViewControllerAccessibility _crlaxApplyAccessibilityInfo](self, "_crlaxApplyAccessibilityInfo");
}

- (BOOL)accessibilityPerformEscape
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1002D3068;
  v3[3] = &unk_10122D110;
  v3[4] = self;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v3))
    abort();
  return 1;
}

- (void)crlaxLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLPopoverBasedViewControllerAccessibility;
  -[CRLPopoverBasedViewControllerAccessibility crlaxLoadAccessibilityInformation](&v3, "crlaxLoadAccessibilityInformation");
  -[CRLPopoverBasedViewControllerAccessibility _crlaxApplyAccessibilityInfo](self, "_crlaxApplyAccessibilityInfo");
}

- (UIBarButtonItem)_crlaxDoneButton
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPopoverBasedViewControllerAccessibility navigationItem](self, "navigationItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rightBarButtonItem"));

  return (UIBarButtonItem *)v3;
}

- (void)_crlaxApplyAccessibilityInfo
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPopoverBasedViewControllerAccessibility _crlaxDoneButton](self, "_crlaxDoneButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));
  v5 = objc_msgSend(v4, "length");

  if (!v5)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Done"), 0, 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPopoverBasedViewControllerAccessibility _crlaxDoneButton](self, "_crlaxDoneButton"));
    objc_msgSend(v7, "setAccessibilityLabel:", v6);

  }
}

@end
