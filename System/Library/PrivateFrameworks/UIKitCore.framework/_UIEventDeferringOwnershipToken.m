@implementation _UIEventDeferringOwnershipToken

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_environments, 0);
  objc_storeStrong((id *)&self->_ownerClass, 0);
  objc_storeStrong((id *)&self->_environmentsPendingInvalidation, 0);
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (!self->_hasInvalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIEventDeferringOwnershipToken.m"), 103, CFSTR("Owner must request to end event deferring before dealloc: %@"), self);

  }
  v5.receiver = self;
  v5.super_class = (Class)_UIEventDeferringOwnershipToken;
  -[_UIEventDeferringOwnershipToken dealloc](&v5, sel_dealloc);
}

- (_BYTE)_initWithOwner:(uint64_t)a3 scope:(void *)a4 environments:(void *)a5 target:(void *)a6 reason:
{
  _BYTE *v11;
  _BYTE *v12;
  objc_class *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  objc_super v19;

  if (!a1)
    return 0;
  v19.receiver = a1;
  v19.super_class = (Class)_UIEventDeferringOwnershipToken;
  v11 = objc_msgSendSuper2(&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    v11[16] = 0;
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)*((_QWORD *)v12 + 3);
    *((_QWORD *)v12 + 3) = v14;

    *((_QWORD *)v12 + 4) = _UIEventDeferringInterfaceCategoryForOwningElement();
    *((_QWORD *)v12 + 5) = a2;
    *((_QWORD *)v12 + 6) = a3;
    objc_storeStrong((id *)v12 + 7, a4);
    v16 = objc_msgSend(a4, "mutableCopy");
    v17 = (void *)*((_QWORD *)v12 + 1);
    *((_QWORD *)v12 + 1) = v16;

    objc_storeStrong((id *)v12 + 8, a5);
    objc_storeStrong((id *)v12 + 9, a6);
  }
  return v12;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UIEventDeferringOwnershipToken descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  _UIEventDeferringOwnershipToken *v15;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActiveMultilinePrefix:", a3);
  v6 = (id)objc_msgSend(v5, "appendBool:withName:", self->_hasInvalidated, CFSTR("invalidated"));
  _NSStringFromUIEventDeferringScope(self->_scope);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v5, "appendObject:withName:", v7, CFSTR("scope"));

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73___UIEventDeferringOwnershipToken_descriptionBuilderWithMultilinePrefix___block_invoke;
  v13[3] = &unk_1E16B1B50;
  v9 = v5;
  v14 = v9;
  v15 = self;
  v10 = (id)objc_msgSend(v9, "modifyBody:", v13);
  v11 = v9;

  return v11;
}

- (_UIEventDeferringOwnershipToken)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIEventDeferringOwnershipToken.m"), 77, CFSTR("init is not allowed on _UIEventDeferringOwnershipToken"));

  return 0;
}

- (NSString)debugDescription
{
  return (NSString *)-[_UIEventDeferringOwnershipToken debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_UIEventDeferringOwnershipToken succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  unint64_t owningInterfaceElementCategory;
  const __CFString *v9;
  id v10;
  id v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", self->_hasInvalidated, CFSTR("invalidated"));
  _NSStringFromUIEventDeferringScope(self->_scope);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("scope"));

  v7 = (id)objc_msgSend(v3, "appendObject:withName:", self->_ownerClass, CFSTR("ownerClass"));
  owningInterfaceElementCategory = self->_owningInterfaceElementCategory;
  if (owningInterfaceElementCategory > 3)
    v9 = &stru_1E16EDF20;
  else
    v9 = off_1E16B4D60[owningInterfaceElementCategory];
  v10 = (id)objc_msgSend(v3, "appendObject:withName:", v9, CFSTR("owningInterfaceElementCategory"));
  v11 = (id)objc_msgSend(v3, "appendPointer:withName:", self->_ownerPointer, CFSTR("ownerPointer"));
  v12 = (id)objc_msgSend(v3, "appendObject:withName:", self->_reason, CFSTR("reason"));
  return v3;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UIEventDeferringOwnershipToken descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
