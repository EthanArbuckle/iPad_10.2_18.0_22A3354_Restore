@implementation _UIEventDeferringDescriptor

- (id)_initWithScope:(char)a3 compatibility:(void *)a4 environment:(void *)a5 displayHardwareIdentifier:(void *)a6 predicateSceneIdentityString:(void *)a7 predicateWindowPointer:(int)a8 predicateContextID:(int)a9 targetPID:(void *)a10 targetSceneIdentityString:(void *)a11 targetWindowPointer:(int)a12 targetContextID:
{
  id *v19;
  id *v20;
  objc_super v22;

  if (!a1)
    return 0;
  v22.receiver = a1;
  v22.super_class = (Class)_UIEventDeferringDescriptor;
  v19 = (id *)objc_msgSendSuper2(&v22, sel_init);
  v20 = v19;
  if (v19)
  {
    v19[3] = a2;
    *((_BYTE *)v19 + 8) = a3;
    objc_storeStrong(v19 + 4, a4);
    objc_storeStrong(v20 + 5, a5);
    objc_storeStrong(v20 + 6, a6);
    v20[7] = a7;
    *((_DWORD *)v20 + 3) = a8;
    *((_DWORD *)v20 + 4) = a9;
    objc_storeStrong(v20 + 8, a10);
    v20[9] = a11;
    *((_DWORD *)v20 + 5) = a12;
  }
  return v20;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UIEventDeferringDescriptor descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  _UIEventDeferringDescriptor *v12;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActiveMultilinePrefix:", a3);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69___UIEventDeferringDescriptor_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E16B1B50;
  v6 = v5;
  v11 = v6;
  v12 = self;
  v7 = (id)objc_msgSend(v6, "modifyBody:", v10);
  v8 = v6;

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetSceneIdentityString, 0);
  objc_storeStrong((id *)&self->_predicateSceneIdentityString, 0);
  objc_storeStrong((id *)&self->_displayHardwareIdentifier, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

- (_UIEventDeferringDescriptor)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIEventDeferringDescriptor.m"), 41, CFSTR("init is not allowed on _UIEventDeferringDescriptor"));

  return 0;
}

- (BOOL)isEqual:(id)a3
{
  void **v4;
  void *v5;
  unint64_t v6;
  void *v7;
  BKSHIDEventDeferringEnvironment *v8;
  BKSHIDEventDeferringEnvironment *v9;
  BKSHIDEventDeferringEnvironment *v10;
  int v11;
  BOOL v12;
  void *v13;
  BKSHIDEventDeferringEnvironment *v14;
  int v15;

  if (a3 != self)
  {
    v4 = (void **)a3;
    v5 = (void *)objc_opt_class();
    if (!objc_msgSend(v5, "isEqual:", objc_opt_class()))
      goto LABEL_26;
    v6 = -[_UIEventDeferringDescriptor hash](self, "hash");
    if (v6 != objc_msgSend(v4, "hash")
      || (void *)self->_scope != v4[3]
      || self->_compatibility != *((unsigned __int8 *)v4 + 8))
    {
      goto LABEL_26;
    }
    v7 = v4[4];
    v8 = self->_environment;
    v9 = v7;
    if (v8 == v9)
    {

    }
    else
    {
      v10 = v9;
      if (!v8 || !v9)
        goto LABEL_18;
      v11 = -[BKSHIDEventDeferringEnvironment isEqual:](v8, "isEqual:", v9);

      if (!v11)
        goto LABEL_26;
    }
    v13 = v4[5];
    v8 = self->_displayHardwareIdentifier;
    v14 = v13;
    if (v8 == v14)
    {

LABEL_20:
      if (UIEqual(self->_predicateSceneIdentityString, v4[6])
        && self->_predicateContextID == *((_DWORD *)v4 + 3)
        && self->_predicateWindowPointer == v4[7]
        && self->_targetPID == *((_DWORD *)v4 + 4)
        && UIEqual(self->_targetSceneIdentityString, v4[8])
        && self->_targetWindowPointer == v4[9])
      {
        v12 = self->_targetContextID == *((_DWORD *)v4 + 5);
        goto LABEL_27;
      }
LABEL_26:
      v12 = 0;
LABEL_27:

      return v12;
    }
    v10 = v14;
    if (v8 && v14)
    {
      v15 = -[BKSHIDEventDeferringEnvironment isEqual:](v8, "isEqual:", v14);

      if (!v15)
        goto LABEL_26;
      goto LABEL_20;
    }
LABEL_18:

    goto LABEL_26;
  }
  return 1;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  unint64_t v15;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:", self->_scope);
  v5 = (id)objc_msgSend(v3, "appendBool:", self->_compatibility);
  v6 = (id)objc_msgSend(v3, "appendObject:", self->_environment);
  v7 = (id)objc_msgSend(v3, "appendString:", self->_displayHardwareIdentifier);
  v8 = (id)objc_msgSend(v3, "appendString:", self->_predicateSceneIdentityString);
  v9 = (id)objc_msgSend(v3, "appendPointer:", self->_predicateWindowPointer);
  v10 = (id)objc_msgSend(v3, "appendUnsignedInteger:", self->_predicateContextID);
  v11 = (id)objc_msgSend(v3, "appendUnsignedInteger:", self->_targetPID);
  v12 = (id)objc_msgSend(v3, "appendPointer:", self->_targetWindowPointer);
  v13 = (id)objc_msgSend(v3, "appendString:", self->_targetSceneIdentityString);
  v14 = (id)objc_msgSend(v3, "appendUnsignedInteger:", self->_targetContextID);
  v15 = objc_msgSend(v3, "hash");

  return v15;
}

- (NSString)debugDescription
{
  return (NSString *)-[_UIEventDeferringDescriptor debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_UIEventDeferringDescriptor succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", self->_compatibility, CFSTR("compatibility"));
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", self->_environment, CFSTR("environment"));
  objc_msgSend(v3, "appendString:withName:", self->_displayHardwareIdentifier, CFSTR("displayIdentifier"));
  v6 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:format:", self->_targetContextID, CFSTR("targetContextID"), 1);
  return v3;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UIEventDeferringDescriptor descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
