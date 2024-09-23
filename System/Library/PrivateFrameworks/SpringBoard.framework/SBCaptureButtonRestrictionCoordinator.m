@implementation SBCaptureButtonRestrictionCoordinator

- (SBCaptureButtonRestrictionCoordinator)init
{
  SBCaptureButtonRestrictionCoordinator *v2;
  SBCaptureButtonRestrictionServer *v3;
  SBCaptureButtonRestrictionServer *xpcServer;
  SBCaptureButtonSOSRestriction *v5;
  SBCaptureButtonSOSRestriction *restrictionForSOS;
  SBCaptureButtonMCProfileRestriction *v7;
  SBCaptureButtonMCProfileRestriction *restrictionForMCProfile;
  SBCaptureButtonDisabledUserDefaultRestriction *v9;
  SBCaptureButtonDisabledUserDefaultRestriction *restrictionForUserDefault;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBCaptureButtonRestrictionCoordinator;
  v2 = -[SBCaptureButtonRestrictionCoordinator init](&v12, sel_init);
  if (v2)
  {
    v3 = -[SBCaptureButtonRestrictionServer initWithDelegate:]([SBCaptureButtonRestrictionServer alloc], "initWithDelegate:", v2);
    xpcServer = v2->_xpcServer;
    v2->_xpcServer = v3;

    v5 = -[SBCaptureButtonSOSRestriction initWithCoordinator:]([SBCaptureButtonSOSRestriction alloc], "initWithCoordinator:", v2);
    restrictionForSOS = v2->_restrictionForSOS;
    v2->_restrictionForSOS = v5;

    v7 = -[SBCaptureButtonMCProfileRestriction initWithCoordinator:]([SBCaptureButtonMCProfileRestriction alloc], "initWithCoordinator:", v2);
    restrictionForMCProfile = v2->_restrictionForMCProfile;
    v2->_restrictionForMCProfile = v7;

    v9 = -[SBCaptureButtonDisabledUserDefaultRestriction initWithCoordinator:]([SBCaptureButtonDisabledUserDefaultRestriction alloc], "initWithCoordinator:", v2);
    restrictionForUserDefault = v2->_restrictionForUserDefault;
    v2->_restrictionForUserDefault = v9;

  }
  return v2;
}

- (id)inhibitCaptureButtonActionAssertionWithReason:(id)a3
{
  id v4;
  BSCompoundAssertion *inhibitedAssertion;
  void *v6;
  BSCompoundAssertion *v7;
  BSCompoundAssertion *v8;
  BSCompoundAssertion *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;

  v4 = a3;
  inhibitedAssertion = self->_inhibitedAssertion;
  if (!inhibitedAssertion)
  {
    objc_initWeak(&location, self);
    v6 = (void *)MEMORY[0x1E0D01718];
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __87__SBCaptureButtonRestrictionCoordinator_inhibitCaptureButtonActionAssertionWithReason___block_invoke;
    v16 = &unk_1E8EA3688;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v6, "assertionWithIdentifier:stateDidChangeHandler:", CFSTR("CaptureButtonRestrictions"), &v13);
    v7 = (BSCompoundAssertion *)objc_claimAutoreleasedReturnValue();
    v8 = self->_inhibitedAssertion;
    self->_inhibitedAssertion = v7;

    v9 = self->_inhibitedAssertion;
    SBLogCameraCaptureRestriction();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSCompoundAssertion setLog:](v9, "setLog:", v10, v13, v14, v15, v16);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
    inhibitedAssertion = self->_inhibitedAssertion;
  }
  -[BSCompoundAssertion acquireForReason:](inhibitedAssertion, "acquireForReason:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __87__SBCaptureButtonRestrictionCoordinator_inhibitCaptureButtonActionAssertionWithReason___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_notifyObserversCaptureButtonInhibitionDidChange");

}

- (BOOL)isCaptureButtonActionInhibited:(id *)a3
{
  int v5;
  BOOL v6;
  void *v7;
  void *v8;

  v5 = -[BSCompoundAssertion isActive](self->_inhibitedAssertion, "isActive");
  v6 = v5;
  if (a3 && v5)
  {
    -[BSCompoundAssertion orderedReasons](self->_inhibitedAssertion, "orderedReasons");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(","));
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)addObserver:(id)a3
{
  id v4;
  BSCompoundAssertion *observers;
  BSCompoundAssertion *v6;
  BSCompoundAssertion *v7;
  void *v8;
  void *v9;

  v4 = a3;
  observers = self->_observers;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0D01718], "assertionWithIdentifier:", CFSTR("CaptureButtonInhibitionObservers"));
    v6 = (BSCompoundAssertion *)objc_claimAutoreleasedReturnValue();
    v7 = self->_observers;
    self->_observers = v6;

    observers = self->_observers;
  }
  objc_msgSend((id)objc_opt_class(), "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSCompoundAssertion acquireForReason:withContext:](observers, "acquireForReason:withContext:", v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_notifyObserversCaptureButtonInhibitionDidChange
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = -[SBCaptureButtonRestrictionCoordinator isCaptureButtonActionInhibited:](self, "isCaptureButtonActionInhibited:", 0);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[BSCompoundAssertion orderedContext](self->_observers, "orderedContext", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "captureButtonRestrictionChangedTo:", v3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restrictionForUserDefault, 0);
  objc_storeStrong((id *)&self->_restrictionForMCProfile, 0);
  objc_storeStrong((id *)&self->_restrictionForSOS, 0);
  objc_storeStrong((id *)&self->_inhibitedAssertion, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_xpcServer, 0);
}

@end
