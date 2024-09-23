@implementation CRLWPAttachmentAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLWPAttachment");
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
  v5 = (void *)objc_opt_class(CRLWPAttachmentAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (CRLTextInteractiveCanvasControllerAccessibility)_crlaxParentInteractiveCanvasController
{
  return (CRLTextInteractiveCanvasControllerAccessibility *)__CRLAccessibilityGetAssociatedWeakObject(self, &unk_101414CE8);
}

- (void)_crlaxSetParentInteractiveCanvasController:(id)a3
{
  __CRLAccessibilitySetAssociatedWeakObject(self, &unk_101414CE8, (uint64_t)a3);
}

- (NSNumber)_crlaxCachedCharIndexNumber
{
  return (NSNumber *)__CRLAccessibilityGetAssociatedObject(self, &unk_101414CE9);
}

- (void)_crlaxSetCachedCharIndexNumber:(id)a3
{
  __CRLAccessibilitySetAssociatedCopiedObject(self, &unk_101414CE9, a3);
}

- (void)dealloc
{
  objc_super v3;

  -[CRLWPAttachmentAccessibility crlaxSetParentInteractiveCanvasController:](self, "crlaxSetParentInteractiveCanvasController:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CRLWPAttachmentAccessibility;
  -[CRLWPAttachmentAccessibility dealloc](&v3, "dealloc");
}

- (void)crlaxParentStorageWasUpdated
{
  -[CRLWPAttachmentAccessibility _crlaxSetCachedCharIndexNumber:](self, "_crlaxSetCachedCharIndexNumber:", 0);
}

- (void)setParentStorage:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[CRLWPAttachmentAccessibility crlaxParentStorageWasUpdated](self, "crlaxParentStorageWasUpdated");
  v5.receiver = self;
  v5.super_class = (Class)CRLWPAttachmentAccessibility;
  -[CRLWPAttachmentAccessibility setParentStorage:](&v5, "setParentStorage:", v4);

}

- (void)crlaxSetParentInteractiveCanvasController:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  char v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPAttachmentAccessibility _crlaxParentInteractiveCanvasController](self, "_crlaxParentInteractiveCanvasController"));
  v12 = 0;
  v6 = v4;
  v8 = (void *)objc_opt_class(CRLTextInteractiveCanvasControllerAccessibility, v7);
  v9 = __CRLAccessibilityCastAsSafeCategory(v8, (uint64_t)v6, 1, &v12);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (v12)
    abort();
  v11 = (void *)v10;

  if (v5 != v11)
  {
    objc_msgSend(v5, "crlaxUnregisterLinkedTextElement:", self);
    -[CRLWPAttachmentAccessibility _crlaxSetParentInteractiveCanvasController:](self, "_crlaxSetParentInteractiveCanvasController:", v11);
    objc_msgSend(v11, "crlaxRegisterLinkedTextElement:", self);
  }

}

- (CRLTextRepAccessibility)crlaxParentTextRep
{
  return 0;
}

- (id)crlaxAlternateAttrStringRepresentation
{
  return self->_crlaxAlternateAttrStringRepresentation;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_crlaxAlternateAttrStringRepresentation, 0);
}

- (CRLWPAttachmentAccessibilityElement)crlaxAssociatedAXElement
{
  return (CRLWPAttachmentAccessibilityElement *)__CRLAccessibilityGetAssociatedObject(self, &unk_1014151C2);
}

- (void)crlaxSetAssociatedAXElement:(id)a3
{
  __CRLAccessibilitySetAssociatedObject(self, &unk_1014151C2, a3);
}

+ (id)crlaxAttachmentElementForAttachment:(id)a3 inTextRep:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "crlaxAssociatedAXElement"));
  if (!v7)
  {
    if (CRLAccessibilityShouldPerformValidationChecks())
    {
      ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("unhandled attachment type"), v9, v10, v11, v12, v13, v15))abort();
    }
    objc_msgSend(v5, "crlaxSetAssociatedAXElement:", 0);
  }

  return v7;
}

@end
