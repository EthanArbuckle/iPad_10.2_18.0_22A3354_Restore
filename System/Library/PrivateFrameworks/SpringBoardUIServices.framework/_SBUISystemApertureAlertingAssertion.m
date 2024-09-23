@implementation _SBUISystemApertureAlertingAssertion

- (_SBUISystemApertureAlertingAssertion)initWithElementSource:(id)a3
{
  id v4;
  _SBUISystemApertureAlertingAssertion *v5;
  _SBUISystemApertureAlertingAssertion *v6;
  NSObject *v7;
  _QWORD v9[4];
  id v10;
  id location;
  objc_super v12;
  uint8_t buf[4];
  _SBUISystemApertureAlertingAssertion *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SBUISystemApertureAlertingAssertion;
  v5 = -[SBUISystemApertureAssertion init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_elementSource, v4);
    v6->_automaticallyInvalidatable = 1;
    objc_initWeak(&location, v6);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __62___SBUISystemApertureAlertingAssertion_initWithElementSource___block_invoke;
    v9[3] = &unk_1E4C403B0;
    objc_copyWeak(&v10, &location);
    -[_SBUISystemApertureAlertingAssertion addInvalidationBlock:](v6, "addInvalidationBlock:", v9);
    SBLogSystemApertureHosting();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v6;
      _os_log_impl(&dword_1A471F000, v7, OS_LOG_TYPE_DEFAULT, "Created alerting assertion: %{public}@", buf, 0xCu);
    }

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)setAlertingAction:(id)a3
{
  id v6;
  SBUISystemApertureAlertingAction **p_alertingAction;
  SBUISystemApertureAlertingAction *v8;
  SBUISystemApertureAlertingAction *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id location;

  v6 = a3;
  p_alertingAction = &self->_alertingAction;
  if (self->_alertingAction)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUISystemApertureElementSource.m"), 1496, CFSTR("Attempting to set a second alerting action"));

  }
  if (-[SBUISystemApertureAssertion isValid](self, "isValid"))
  {
    objc_storeStrong((id *)&self->_alertingAction, a3);
    objc_initWeak(&location, self);
    v8 = *p_alertingAction;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __58___SBUISystemApertureAlertingAssertion_setAlertingAction___block_invoke;
    v12[3] = &unk_1E4C3E538;
    objc_copyWeak(&v13, &location);
    -[SBUISystemApertureAlertingAction setNullificationHandler:](v8, "setNullificationHandler:", v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    v9 = *p_alertingAction;
    -[SBUISystemApertureAssertion _invalidationReason](self, "_invalidationReason");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUISystemApertureAlertingAction invalidateWithReason:](v9, "invalidateWithReason:", v10);

  }
}

- (id)_descriptionConstituents
{
  id v3;
  void *v4;
  SBUISystemApertureAlertingAction *alertingAction;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  NSStringFromBOOL();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("automatically invalidatable"));

  alertingAction = self->_alertingAction;
  if (alertingAction)
    objc_msgSend(v3, "setObject:forKey:", alertingAction, CFSTR("alerting action"));
  v9.receiver = self;
  v9.super_class = (Class)_SBUISystemApertureAlertingAssertion;
  -[SBUISystemApertureAssertion _descriptionConstituents](&v9, sel__descriptionConstituents);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObject:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setAutomaticallyInvalidatable:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const __CFString *v6;
  uint64_t v7;
  id WeakRetained;
  int v9;
  const __CFString *v10;
  __int16 v11;
  _SBUISystemApertureAlertingAssertion *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  if (-[SBUISystemApertureAssertion isValid](self, "isValid") && self->_automaticallyInvalidatable != v3)
  {
    self->_automaticallyInvalidatable = v3;
    SBLogSystemApertureHosting();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_automaticallyInvalidatable)
        v6 = CFSTR("enabled");
      else
        v6 = CFSTR("disabled");
      v9 = 138412546;
      v10 = v6;
      v11 = 2114;
      v12 = self;
      _os_log_impl(&dword_1A471F000, v5, OS_LOG_TYPE_DEFAULT, "Automatic invalidation %@: %{public}@", (uint8_t *)&v9, 0x16u);
    }

    if (self->_automaticallyInvalidatable)
      v7 = 9;
    else
      v7 = 8;
    WeakRetained = objc_loadWeakRetained((id *)&self->_elementSource);
    objc_msgSend(WeakRetained, "_sendActionForCommand:", v7);

  }
}

- (void)addInvalidationBlock:(id)a3
{
  id v4;
  objc_super v5;
  _QWORD v6[4];
  id v7;

  v6[1] = 3221225472;
  v6[2] = __61___SBUISystemApertureAlertingAssertion_addInvalidationBlock___block_invoke;
  v6[3] = &unk_1E4C40638;
  v7 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_SBUISystemApertureAlertingAssertion;
  v6[0] = MEMORY[0x1E0C809B0];
  v4 = v7;
  -[SBUISystemApertureAssertion addInvalidationBlock:](&v5, sel_addInvalidationBlock_, v6);

}

- (void)resetAutomaticInvalidationTimer
{
  NSObject *v3;
  id WeakRetained;
  int v5;
  _SBUISystemApertureAlertingAssertion *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (-[SBUISystemApertureAssertion isValid](self, "isValid"))
  {
    SBLogSystemApertureHosting();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138543362;
      v6 = self;
      _os_log_impl(&dword_1A471F000, v3, OS_LOG_TYPE_DEFAULT, "Automatic invalidation timer reset: %{public}@", (uint8_t *)&v5, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_elementSource);
    objc_msgSend(WeakRetained, "_sendActionForCommand:", 10);

  }
}

- (BOOL)isAutomaticallyInvalidatable
{
  return self->_automaticallyInvalidatable;
}

- (SBUISystemApertureElementSource)elementSource
{
  return (SBUISystemApertureElementSource *)objc_loadWeakRetained((id *)&self->_elementSource);
}

- (void)setElementSource:(id)a3
{
  objc_storeWeak((id *)&self->_elementSource, a3);
}

- (SBUISystemApertureAlertingAction)alertingAction
{
  return self->_alertingAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertingAction, 0);
  objc_destroyWeak((id *)&self->_elementSource);
}

@end
