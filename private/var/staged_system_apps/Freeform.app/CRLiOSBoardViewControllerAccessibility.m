@implementation CRLiOSBoardViewControllerAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("Freeform.CRLiOSBoardViewController");
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(CRLAccessibilitySafeCategory, a2);
}

- (CRLInteractiveCanvasControllerAccessibility)crlaxInteractiveCanvasController
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v10;

  v10 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSBoardViewControllerAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "interactiveCanvasController"));

  objc_opt_class(CRLInteractiveCanvasControllerAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 1, &v10);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v10)
    abort();
  v8 = (void *)v7;

  return (CRLInteractiveCanvasControllerAccessibility *)v8;
}

- (void)loadApplicationToolbar
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CRLiOSBoardViewControllerAccessibility;
  -[CRLiOSBoardViewControllerAccessibility loadApplicationToolbar](&v2, "loadApplicationToolbar");
}

- (void)updateToolbarButtons
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CRLiOSBoardViewControllerAccessibility;
  -[CRLiOSBoardViewControllerAccessibility updateToolbarButtons](&v2, "updateToolbarButtons");
}

- (void)documentOpenAnimationDidEnd
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CRLiOSBoardViewControllerAccessibility;
  -[CRLiOSBoardViewControllerAccessibility documentOpenAnimationDidEnd](&v2, "documentOpenAnimationDidEnd");
}

- (void)crlaxLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLiOSBoardViewControllerAccessibility;
  -[CRLiOSBoardViewControllerAccessibility crlaxLoadAccessibilityInformation](&v4, "crlaxLoadAccessibilityInformation");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSBoardViewControllerAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
  objc_msgSend(v3, "crlaxLoadAccessibilityInformation");

}

- (UIBarButtonItem)crlaxCollaborationBarButtonItem
{
  return self->_crlaxCollaborationBarButtonItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crlaxCollaborationBarButtonItem, 0);
}

@end
