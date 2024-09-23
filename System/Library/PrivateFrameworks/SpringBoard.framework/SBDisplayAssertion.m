@implementation SBDisplayAssertion

- (id)_initWithPhysicalDisplay:(id)a3 level:(unint64_t)a4 deactivationReasons:(unint64_t)a5 assertionStack:(id)a6 delegate:(id)a7
{
  id v14;
  id v15;
  id v16;
  SBDisplayAssertion *v17;
  SBDisplayAssertion *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  v14 = a3;
  v15 = a6;
  v16 = a7;
  if ((objc_msgSend(v14, "isRootIdentity") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayAssertion.m"), 114, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[rootDisplayIdentity isRootIdentity]"));

  }
  if (SBDisplayAssertionLevelIsValid(a4))
  {
    if (v15)
      goto LABEL_5;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayAssertion.m"), 116, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assertionStack"));

    if (v16)
      goto LABEL_6;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayAssertion.m"), 115, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("SBDisplayAssertionLevelIsValid(level)"));

  if (!v15)
    goto LABEL_10;
LABEL_5:
  if (v16)
    goto LABEL_6;
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayAssertion.m"), 117, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

LABEL_6:
  v24.receiver = self;
  v24.super_class = (Class)SBDisplayAssertion;
  v17 = -[SBDisplayAssertion init](&v24, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_rootDisplayIdentity, a3);
    v18->_level = a4;
    v18->_deactivationReasonsWhenActive = a5;
    objc_storeWeak((id *)&v18->_assertionStack, v15);
    objc_storeWeak((id *)&v18->_delegate, v16);
    *(_WORD *)&v18->_invalidated = 0;
    v18->_hasControlOfDisplay = 0;
  }

  return v18;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (!self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v5.receiver = self;
  v5.super_class = (Class)SBDisplayAssertion;
  -[SBDisplayAssertion dealloc](&v5, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id WeakRetained;
  id v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SBDisplayAssertionLevelDescription(self->_level);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("level"));

  UIApplicationSceneDeactivationReasonMaskDescriptionComponents();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("deactivationReasonsWhenActive"));

  WeakRetained = objc_loadWeakRetained((id *)&self->_assertionStack);
  v8 = (id)objc_msgSend(v3, "appendObject:withName:", WeakRetained, CFSTR("stack"));

  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  SBDisplayAssertion *v4;
  SBDisplayAssertion *v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  char v10;

  v4 = (SBDisplayAssertion *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (-[FBSDisplayIdentity isEqual:](self->_rootDisplayIdentity, "isEqual:", v5->_rootDisplayIdentity)&& self->_level == v5->_level)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_assertionStack);
        objc_msgSend(WeakRetained, "displayIdentity");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_loadWeakRetained((id *)&v5->_assertionStack);
        objc_msgSend(v8, "displayIdentity");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v7, "isEqual:", v9);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (BOOL)hasControlOfDisplay
{
  return self->_hasControlOfDisplay;
}

- (void)updateWithPreferences:(id)a3
{
  _SBDisplayAssertionStack **p_assertionStack;
  id v5;
  id WeakRetained;

  if (!self->_invalidated)
  {
    p_assertionStack = &self->_assertionStack;
    v5 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_assertionStack);
    objc_msgSend(WeakRetained, "_assertion:updatedPreferences:", self, v5);

  }
}

- (void)invalidate
{
  void *v4;
  id WeakRetained;

  if (self->_invalidatedByClient)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  self->_hasControlOfDisplay = 0;
  *(_WORD *)&self->_invalidated = 257;
  WeakRetained = objc_loadWeakRetained((id *)&self->_assertionStack);
  objc_msgSend(WeakRetained, "_assertionDidInvalidate:", self);

}

- (void)_didInvalidateForDisplayDisconnect
{
  id WeakRetained;

  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    self->_hasControlOfDisplay = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "displayAssertionDidInvalidate:", self);

  }
}

- (void)_didGainControlOfDisplay
{
  id WeakRetained;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (!self->_invalidated)
  {
    self->_hasControlOfDisplay = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "displayAssertionDidGainControlOfDisplay:", self);

    SBLogDisplayControlling();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v4))
    {
      SBDisplayAssertionLevelDescription(self->_level);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_signpost_emit_with_name_impl(&dword_1D0540000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SB_DISPLAY_ASSERTION_GAIN_CONTROL", "%{public}@", (uint8_t *)&v6, 0xCu);

    }
  }
}

- (void)_didLoseControlOfDisplayForDeactivationReasons:(unint64_t)a3
{
  id WeakRetained;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!self->_invalidated && self->_hasControlOfDisplay)
  {
    self->_hasControlOfDisplay = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "displayAssertion:didLoseControlOfDisplayForDeactivationReasons:", self, a3);

    SBLogDisplayControlling();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v6))
    {
      SBDisplayAssertionLevelDescription(self->_level);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v7;
      _os_signpost_emit_with_name_impl(&dword_1D0540000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SB_DISPLAY_ASSERTION_LOST_CONTROL", "%{public}@", (uint8_t *)&v8, 0xCu);

    }
  }
}

- (void)_didReceiveNewDeactivationReasons:(unint64_t)a3
{
  id WeakRetained;

  if (!self->_invalidated)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "displayAssertion:didReceiveNewDeactivationReasons:", self, a3);

  }
}

- (FBSDisplayIdentity)rootDisplayIdentity
{
  return self->_rootDisplayIdentity;
}

- (unint64_t)level
{
  return self->_level;
}

- (unint64_t)deactivationReasonsWhenActive
{
  return self->_deactivationReasonsWhenActive;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_assertionStack);
  objc_storeStrong((id *)&self->_rootDisplayIdentity, 0);
}

@end
