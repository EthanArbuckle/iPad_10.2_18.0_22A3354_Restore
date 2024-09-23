@implementation TSWPAttachmentAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSWPAttachment");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (TSWPInteractiveCanvasControllerAccessibility)_tsaxParentInteractiveCanvasController
{
  return (TSWPInteractiveCanvasControllerAccessibility *)__TSAccessibilityGetAssociatedObject(self, &unk_543998);
}

- (void)_tsaxSetParentInteractiveCanvasController:(id)a3
{
  __TSAccessibilitySetAssociatedNonRetainedObject(self, &unk_543998, a3);
}

- (NSNumber)_tsaxCachedCharIndexNumber
{
  return (NSNumber *)__TSAccessibilityGetAssociatedObject(self, &unk_543999);
}

- (void)_tsaxSetCachedCharIndexNumber:(id)a3
{
  __TSAccessibilitySetAssociatedCopiedObject(self, &unk_543999, a3);
}

- (void)dealloc
{
  objc_super v3;

  -[TSWPAttachmentAccessibility tsaxSetParentInteractiveCanvasController:](self, "tsaxSetParentInteractiveCanvasController:", 0);
  v3.receiver = self;
  v3.super_class = (Class)TSWPAttachmentAccessibility;
  -[TSWPAttachmentAccessibility dealloc](&v3, "dealloc");
}

- (void)tsaxParentStorageWasUpdated
{
  -[TSWPAttachmentAccessibility _tsaxSetCachedCharIndexNumber:](self, "_tsaxSetCachedCharIndexNumber:", 0);
}

- (void)tsaxSetParentInteractiveCanvasController:(id)a3
{
  TSWPInteractiveCanvasControllerAccessibility *v5;
  void *v6;
  Class v7;
  Class v8;
  char v9;

  v5 = -[TSWPAttachmentAccessibility _tsaxParentInteractiveCanvasController](self, "_tsaxParentInteractiveCanvasController");
  v9 = 0;
  v6 = (void *)objc_opt_class(TSWPInteractiveCanvasControllerAccessibility);
  v7 = __TSAccessibilityCastAsSafeCategory(v6, (uint64_t)a3, 1, &v9);
  if (v9)
    abort();
  v8 = v7;
  if (v5 != (TSWPInteractiveCanvasControllerAccessibility *)v7)
  {
    -[TSWPInteractiveCanvasControllerAccessibility tsaxUnregisterLinkedTextElement:](v5, "tsaxUnregisterLinkedTextElement:", self);
    -[TSWPAttachmentAccessibility _tsaxSetParentInteractiveCanvasController:](self, "_tsaxSetParentInteractiveCanvasController:", v8);
    -[objc_class tsaxRegisterLinkedTextElement:](v8, "tsaxRegisterLinkedTextElement:", self);
  }
}

- (TSWPRepAccessibility)tsaxParentTextRep
{
  TSWPInteractiveCanvasControllerAccessibility *v3;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  Class v11;
  Class v12;
  NSNumber *v13;
  uint64_t v14;
  _BYTE *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  Class v22;
  TSWPRepAccessibility *v23;
  _BYTE *v24;
  unint64_t v25;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[6];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  _BYTE v37[128];

  v3 = -[TSWPAttachmentAccessibility tsaxParentInteractiveCanvasController](self, "tsaxParentInteractiveCanvasController");
  if (TSAccessibilityShouldPerformValidationChecks() && !v3)
  {
    ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Can't find interactive canvas controller even though we're asked for the parent text rep of an attachment."), v5, v6, v7, v8, v9, v28))abort();
    return 0;
  }
  if (!v3)
    return 0;
  LOBYTE(v33) = 0;
  v10 = (void *)objc_opt_class(TSWPStorageAccessibility);
  v11 = __TSAccessibilityCastAsSafeCategory(v10, (uint64_t)-[TSWPAttachmentAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("parentStorage")), 1, &v33);
  if ((_BYTE)v33)
    abort();
  v12 = v11;
  if (!v11)
    return 0;
  v13 = -[TSWPAttachmentAccessibility _tsaxCachedCharIndexNumber](self, "_tsaxCachedCharIndexNumber");
  if (!v13)
  {
    v33 = 0;
    v34 = &v33;
    v35 = 0x2020000000;
    v36 = 0;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_240A8C;
    v32[3] = &unk_42BF18;
    v32[4] = self;
    v32[5] = &v33;
    if (__TSAccessibilityPerformSafeBlock((uint64_t)v32))
      abort();
    v14 = v34[3];
    _Block_object_dispose(&v33, 8);
    v13 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v14);
    -[TSWPAttachmentAccessibility _tsaxSetCachedCharIndexNumber:](self, "_tsaxSetCachedCharIndexNumber:", v13);
  }
  v15 = -[NSNumber unsignedIntegerValue](v13, "unsignedIntegerValue");
  v16 = -[TSWPInteractiveCanvasControllerAccessibility tsaxTextRepsForStorage:](v3, "tsaxTextRepsForStorage:", v12);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
  if (!v17)
    return 0;
  v18 = *(_QWORD *)v29;
LABEL_13:
  v19 = 0;
  while (1)
  {
    if (*(_QWORD *)v29 != v18)
      objc_enumerationMutation(v16);
    v20 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v19);
    LOBYTE(v33) = 0;
    v21 = (void *)objc_opt_class(TSWPRepAccessibility);
    v22 = __TSAccessibilityCastAsSafeCategory(v21, v20, 1, &v33);
    if ((_BYTE)v33)
      abort();
    v23 = (TSWPRepAccessibility *)v22;
    if (v22)
    {
      v24 = -[objc_class tsaxStorageRangeOfRep](v22, "tsaxStorageRangeOfRep");
      if (v15 >= v24 && v15 - v24 < v25)
        return v23;
    }
    if (v17 == (id)++v19)
    {
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
      if (v17)
        goto LABEL_13;
      return v23;
    }
  }
}

@end
