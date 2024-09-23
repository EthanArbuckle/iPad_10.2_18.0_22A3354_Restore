@implementation SBSystemApertureProminentCompactTestRecipe

- (id)title
{
  return CFSTR("Jindo Compact Prominent");
}

- (void)handleVolumeIncrease
{
  SBPrototypeProminentPresentingActivityElementViewProvider *v3;
  void *v4;
  SAInvalidatable *v5;
  SAInvalidatable *elementAssertion;
  dispatch_time_t v7;
  uint64_t v8;
  NSObject *v9;
  dispatch_time_t v10;
  _QWORD v11[4];
  id v12;
  id from;
  _QWORD block[4];
  id v15;
  id location;

  if (!self->_elementAssertion)
  {
    v3 = objc_alloc_init(SBPrototypeProminentPresentingActivityElementViewProvider);
    objc_msgSend((id)SBApp, "systemApertureControllerForMainDisplay");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "registerElement:", v3);
    v5 = (SAInvalidatable *)objc_claimAutoreleasedReturnValue();
    elementAssertion = self->_elementAssertion;
    self->_elementAssertion = v5;

    objc_initWeak(&location, v3);
    v7 = dispatch_time(0, 1000000000);
    v8 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__SBSystemApertureProminentCompactTestRecipe_handleVolumeIncrease__block_invoke;
    block[3] = &unk_1E8E9DF28;
    objc_copyWeak(&v15, &location);
    v9 = MEMORY[0x1E0C80D38];
    dispatch_after(v7, MEMORY[0x1E0C80D38], block);
    objc_initWeak(&from, self);
    v10 = dispatch_time(0, 3000000000);
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __66__SBSystemApertureProminentCompactTestRecipe_handleVolumeIncrease__block_invoke_2;
    v11[3] = &unk_1E8E9DF28;
    objc_copyWeak(&v12, &from);
    dispatch_after(v10, v9, v11);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&from);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);

  }
}

void __66__SBSystemApertureProminentCompactTestRecipe_handleVolumeIncrease__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setProminent:", 0);
  objc_msgSend(WeakRetained, "setShowsTrailing:", 1);

}

void __66__SBSystemApertureProminentCompactTestRecipe_handleVolumeIncrease__block_invoke_2(uint64_t a1)
{
  id v1;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained[1], "invalidateWithReason:", CFSTR("timeout"));
  v1 = WeakRetained[1];
  WeakRetained[1] = 0;

}

- (void)handleVolumeDecrease
{
  SAInvalidatable *elementAssertion;
  SAInvalidatable *v4;

  elementAssertion = self->_elementAssertion;
  if (elementAssertion)
  {
    -[SAInvalidatable invalidateWithReason:](elementAssertion, "invalidateWithReason:", CFSTR("volume decrease"));
    v4 = self->_elementAssertion;
    self->_elementAssertion = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementAssertion, 0);
}

@end
