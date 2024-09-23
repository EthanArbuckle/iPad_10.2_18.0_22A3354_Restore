@implementation CRLInteractiveCanvasControllerAccessibility

- (id)crlaxSearchReferenceForSelectionPath:(id)a3
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLInteractiveCanvasControllerAccessibility;
  v3 = -[CRLTextInteractiveCanvasControllerAccessibility crlaxSearchReferenceForSelectionPath:](&v5, "crlaxSearchReferenceForSelectionPath:", a3);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (id)crlaxFocusElementFromSearchReference:(id)a3
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLInteractiveCanvasControllerAccessibility;
  v3 = -[CRLCanvasInteractiveCanvasControllerAccessibility crlaxFocusElementFromSearchReference:](&v5, "crlaxFocusElementFromSearchReference:", a3);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (id)crlaxFocusTextRangeFromSearchReference:(id)a3
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLInteractiveCanvasControllerAccessibility;
  v3 = -[CRLTextInteractiveCanvasControllerAccessibility crlaxFocusTextRangeFromSearchReference:](&v5, "crlaxFocusTextRangeFromSearchReference:", a3);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (void)crlaxAnnounceSearchReference:(id)a3 forRotor:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLInteractiveCanvasControllerAccessibility;
  -[CRLTextInteractiveCanvasControllerAccessibility crlaxAnnounceSearchReference:forRotor:](&v4, "crlaxAnnounceSearchReference:forRotor:", a3, a4);
}

- (void)crlaxGoToFormatInspector
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  objc_class *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  char v12;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasControllerAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "canvasView"));

  v12 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "nextResponder"));
  objc_opt_class(CRLiOSCanvasViewController, v5);
  v7 = __CRLAccessibilityCastAsClass(v6, (uint64_t)v4, 1, &v12);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (v12)
    abort();
  v9 = (void *)v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "miniFormatterPresenter"));
  v11 = objc_msgSend(v10, "isPresentingMiniFormatter");

  if ((v11 & 1) == 0)
    objc_msgSend(v9, "showDefaultEditUIForCurrentSelection");

}

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLInteractiveCanvasController");
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(CRLTextInteractiveCanvasControllerAccessibility, a2);
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  objc_opt_class(CRLInteractiveCanvasControllerAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

@end
