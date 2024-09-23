@implementation _UIHyperInteractor(SBAdditions)

- (BOOL)sbpip_isRubberBanding
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v10;

  if (objc_msgSend(a1, "_dimensions") != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIHyperInteractor_SBAdditions.m"), 17, CFSTR("This _UIHyperInteractor category can only handle 2D interactors."));

  }
  v4 = *(double *)objc_msgSend(a1, "_translation");
  v5 = *(double *)(objc_msgSend(a1, "_translation") + 8);
  v6 = v4 + *(double *)objc_msgSend(a1, "_unconstrainedPoint");
  v7 = v5 + *(double *)(objc_msgSend(a1, "_unconstrainedPoint") + 8);
  v8 = *(double *)objc_msgSend(a1, "_closestPoint");
  return v7 != *(double *)(objc_msgSend(a1, "_closestPoint") + 8) || v6 != v8;
}

- (void)sbpip_setInteractive:()SBAdditions
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, &kSBPIPInteractionControllerHyperInteractorIsDirtyAssociationKey, v2, (void *)1);

}

- (uint64_t)sbpip_isInteractive
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, &kSBPIPInteractionControllerHyperInteractorIsDirtyAssociationKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

@end
