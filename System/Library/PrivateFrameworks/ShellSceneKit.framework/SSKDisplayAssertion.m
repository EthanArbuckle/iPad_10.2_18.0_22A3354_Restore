@implementation SSKDisplayAssertion

- (id)_initWithPhysicalDisplay:(id)a3 level:(unint64_t)a4 assertionStack:(id)a5 delegate:(id)a6
{
  id v12;
  id v13;
  id v14;
  SSKDisplayAssertion *v15;
  SSKDisplayAssertion *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  if ((objc_msgSend(v12, "isRootIdentity") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKDisplayAssertion.m"), 103, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[rootDisplayIdentity isRootIdentity]"));

  }
  if (a4)
  {
    if (v13)
      goto LABEL_5;
LABEL_10:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKDisplayAssertion.m"), 105, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assertionStack"));

    if (v14)
      goto LABEL_6;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKDisplayAssertion.m"), 104, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("SSKDisplayPriorityIsValid(level)"));

  if (!v13)
    goto LABEL_10;
LABEL_5:
  if (v14)
    goto LABEL_6;
LABEL_11:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKDisplayAssertion.m"), 106, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

LABEL_6:
  v22.receiver = self;
  v22.super_class = (Class)SSKDisplayAssertion;
  v15 = -[SSKDisplayAssertion init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_rootDisplayIdentity, a3);
    v16->_level = a4;
    objc_storeWeak((id *)&v16->_assertionStack, v13);
    objc_storeWeak((id *)&v16->_delegate, v14);
    *(_WORD *)&v16->_invalidated = 0;
    v16->_hasControlOfDisplay = 0;
  }

  return v16;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (!self->_invalidated)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v5.receiver = self;
  v5.super_class = (Class)SSKDisplayAssertion;
  -[SSKDisplayAssertion dealloc](&v5, sel_dealloc);
}

- (id)description
{
  void *v3;
  id v4;
  id WeakRetained;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", self->_level, CFSTR("level"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_assertionStack);
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", WeakRetained, CFSTR("stack"));

  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  SSKDisplayAssertion *v4;
  SSKDisplayAssertion *v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  char v10;

  v4 = (SSKDisplayAssertion *)a3;
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
  _SSKDisplayAssertionStack **p_assertionStack;
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
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
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
  unint64_t level;
  int v6;
  unint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (!self->_invalidated)
  {
    self->_hasControlOfDisplay = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "displayAssertionDidGainControlOfDisplay:", self);

    SSKLogDisplayControlling();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v4))
    {
      level = self->_level;
      v6 = 134217984;
      v7 = level;
      _os_signpost_emit_with_name_impl(&dword_245FEA000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SSK_DISPLAY_ASSERTION_GAIN_CONTROL", "%lu", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (void)_didLoseControlOfDisplay
{
  id WeakRetained;
  NSObject *v4;
  unint64_t level;
  int v6;
  unint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (!self->_invalidated && self->_hasControlOfDisplay)
  {
    self->_hasControlOfDisplay = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "displayAssertionDidLoseControlOfDisplay:", self);

    SSKLogDisplayControlling();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v4))
    {
      level = self->_level;
      v6 = 134217984;
      v7 = level;
      _os_signpost_emit_with_name_impl(&dword_245FEA000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SSK_DISPLAY_ASSERTION_LOST_CONTROL", "%lu", (uint8_t *)&v6, 0xCu);
    }

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
