@implementation SBUISystemApertureAlertingAssertion

void __62___SBUISystemApertureAlertingAssertion_initWithElementSource___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  void *v5;
  int v6;
  void *v7;
  id v8;

  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "alertingAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isValid");

  if (v6)
  {
    objc_msgSend(WeakRetained, "alertingAction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidateWithReason:", v8);

  }
}

void __58___SBUISystemApertureAlertingAssertion_setAlertingAction___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "isValid"))
    objc_msgSend(WeakRetained, "invalidateWithReason:", CFSTR("alerting action annulled"));

}

void __61___SBUISystemApertureAlertingAssertion_addInvalidationBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = a3;
  v8 = objc_opt_class();
  v11 = v5;
  if (v8)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v11;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v10, v7);
}

@end
