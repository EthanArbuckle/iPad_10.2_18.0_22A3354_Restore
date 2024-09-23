@implementation UIKeyWindowEvaluatorFindNewKeyWindowSceneOnScreen

BOOL ___UIKeyWindowEvaluatorFindNewKeyWindowSceneOnScreen_block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  char isKindOfClass;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int IsForegroundActive;
  _BOOL8 v11;
  void *v12;

  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    return 0;
  v6 = a2;
  objc_msgSend(v6, "screen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 32);

  objc_msgSend(v6, "_effectiveUISettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  IsForegroundActive = _UISceneLifecycleStateIsForegroundActive(v9);

  v11 = 0;
  if (v7 == v8 && IsForegroundActive)
  {
    -[UIWindowScene _keyWindow]((id *)v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v12 == 0;

  }
  return v11;
}

@end
