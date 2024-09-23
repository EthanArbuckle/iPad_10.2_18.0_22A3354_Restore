@implementation SBKeyboardFocusPolicy

+ (id)build:(id)a3
{
  void (**v3)(id, _QWORD *);
  _QWORD *v4;
  void *v5;

  v3 = (void (**)(id, _QWORD *))a3;
  v4 = -[SBKeyboardFocusPolicy _init]([SBMutableKeyboardFocusPolicy alloc]);
  v3[2](v3, v4);

  v5 = (void *)objc_msgSend(v4, "copy");
  return v5;
}

- (_QWORD)_init
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v7;
  objc_super v8;

  v1 = a1;
  if (a1)
  {
    v2 = objc_opt_class();
    if (v2 != objc_opt_class())
    {
      v3 = objc_opt_class();
      if (v3 != objc_opt_class())
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", sel__init, v1, CFSTR("SBKeyboardFocusPolicy.m"), 59, CFSTR("_SBKeyboardFocusPolicy cannot be subclassed"));

      }
    }
    v8.receiver = v1;
    v8.super_class = (Class)SBKeyboardFocusPolicy;
    v1 = objc_msgSendSuper2(&v8, sel_init);
    if (v1)
    {
      v4 = objc_alloc_init(MEMORY[0x1E0D016C8]);
      v5 = (void *)v1[4];
      v1[4] = v4;

    }
  }
  return v1;
}

- (SBKeyboardFocusPolicy)init
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBKeyboardFocusPolicy init]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("SBKeyboardFocusPolicy.m"), 48, CFSTR("cannot directly allocate _SBKeyboardFocusPolicy"));

  return 0;
}

+ (SBKeyboardFocusPolicy)new
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[SBKeyboardFocusPolicy new]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SBKeyboardFocusPolicy.m"), 53, CFSTR("cannot directly allocate _SBKeyboardFocusPolicy"));

  return 0;
}

- (id)_initWithCopyOf:(id *)a1
{
  id *v3;
  id *v4;
  id WeakRetained;

  v3 = a2;
  if (a1)
  {
    v4 = (id *)-[SBKeyboardFocusPolicy _init](a1);
    a1 = v4;
    if (v4)
    {
      objc_storeStrong(v4 + 1, v3[1]);
      a1[2] = v3[2];
      *((_BYTE *)a1 + 24) = *((_BYTE *)v3 + 24);
      *((_BYTE *)a1 + 25) = *((_BYTE *)v3 + 25);
      objc_storeStrong(a1 + 4, v3[4]);
      WeakRetained = objc_loadWeakRetained(v3 + 5);
      objc_storeWeak(a1 + 5, WeakRetained);

    }
  }

  return a1;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id WeakRetained;
  unint64_t v11;
  unint64_t v12;

  v3 = -[SBKeyboardFocusTarget hash](self->_keyboardFocusTarget, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_selectionPolicy);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldSuppressRemoteDeferring);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_cameraIsHosted);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 ^ v7 ^ objc_msgSend(v8, "hash");

  WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowSceneAncestor);
  v11 = v9 ^ objc_msgSend(WeakRetained, "hash");

  v12 = 0x94D049BB133111EBLL
      * ((0xBF58476D1CE4E5B9 * (v11 ^ (v11 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v11 ^ (v11 >> 30))) >> 27));
  return v12 ^ (v12 >> 31);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id *v5;
  id WeakRetained;
  id v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (id *)v4;
    if (BSEqualObjects()
      && v5[2] == (id)self->_selectionPolicy
      && *((unsigned __int8 *)v5 + 24) == self->_shouldSuppressRemoteDeferring
      && *((unsigned __int8 *)v5 + 25) == self->_cameraIsHosted)
    {
      WeakRetained = objc_loadWeakRetained(v5 + 5);
      v7 = objc_loadWeakRetained((id *)&self->_sbWindowSceneAncestor);
      v8 = BSEqualObjects();

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[SBKeyboardFocusPolicy _initWithCopyOf:]((id *)[SBMutableKeyboardFocusPolicy alloc], self);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D01750];
  objc_msgSend(MEMORY[0x1E0D01758], "debugStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptionForRootObject:withStyle:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  SBKeyboardFocusPolicy *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__SBKeyboardFocusPolicy_appendDescriptionToStream___block_invoke;
  v6[3] = &unk_1E8E9E820;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "appendBodySectionWithName:block:", 0, v6);

}

void __51__SBKeyboardFocusPolicy_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("keyboardFocusTarget"));
  v3 = *(void **)(a1 + 32);
  NSStringFromSBKeyboardFocusAdviceAcceptancePolicy(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("selectionPolicy"));

  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("shouldSuppressRemoteDeferring"));
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 25), CFSTR("cameraIsHosted"), 1);
  if (objc_msgSend(*(id *)(a1 + 32), "hasDebugStyle"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "items");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
      v7 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", v8, CFSTR("auditHistory"));

  }
}

- (SBKeyboardFocusTarget)keyboardFocusTarget
{
  return self->_keyboardFocusTarget;
}

- (int64_t)advicePolicy
{
  return self->_selectionPolicy;
}

- (BOOL)shouldSuppressRemoteDeferring
{
  return self->_shouldSuppressRemoteDeferring;
}

- (BOOL)cameraIsHosted
{
  return self->_cameraIsHosted;
}

- (BSAuditHistory)auditHistory
{
  return self->_auditHistory;
}

- (SBWindowScene)sbWindowSceneAncestor
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_sbWindowSceneAncestor);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sbWindowSceneAncestor);
  objc_storeStrong((id *)&self->_auditHistory, 0);
  objc_storeStrong((id *)&self->_keyboardFocusTarget, 0);
}

@end
