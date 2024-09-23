@implementation SBRemovalDodgingModifier

- (SBRemovalDodgingModifier)initWithIdentifier:(id)a3
{
  id v5;
  SBRemovalDodgingModifier *v6;
  SBRemovalDodgingModifier *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBRemovalDodgingModifier;
  v6 = -[SBChainableModifier init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_identifier, a3);

  return v7;
}

- (id)modelForInvalidatedModel:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v10;
  objc_super v11;
  objc_super v12;
  _QWORD v13[5];

  v4 = a3;
  objc_msgSend(v4, "identifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", self->_identifier);

  if (v6)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __53__SBRemovalDodgingModifier_modelForInvalidatedModel___block_invoke;
    v13[3] = &unk_1E8EA36D0;
    v13[4] = self;
    objc_msgSend(v4, "modelByModifyingModelWithBlock:", v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v12.receiver = self;
    v12.super_class = (Class)SBRemovalDodgingModifier;
    -[SBRemovalDodgingModifier modelForInvalidatedModel:](&v12, sel_modelForInvalidatedModel_, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBRemovalDodgingModifier;
    -[SBRemovalDodgingModifier modelForInvalidatedModel:](&v11, sel_modelForInvalidatedModel_, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    return v10;
  }
}

uint64_t __53__SBRemovalDodgingModifier_modelForInvalidatedModel___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
}

- (int64_t)animationBehaviorModeForIdentifier:(id)a3
{
  return 3;
}

- (id)handleRemovalEvent:(id)a3
{
  id v4;
  void *v5;
  SBInvalidationDodgingModifierEventResponse *v6;
  NSUUID *completionIdentifier;
  NSUUID *v8;
  NSUUID *v9;
  void *v10;
  uint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SBRemovalDodgingModifier;
  v4 = a3;
  -[SBDodgingModifier handleRemovalEvent:](&v13, sel_handleRemovalEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier", v13.receiver, v13.super_class);
  v6 = (SBInvalidationDodgingModifierEventResponse *)objc_claimAutoreleasedReturnValue();

  if (!-[SBInvalidationDodgingModifierEventResponse isEqual:](v6, "isEqual:", self->_identifier))
    goto LABEL_4;
  completionIdentifier = self->_completionIdentifier;

  if (!completionIdentifier)
  {
    v6 = -[SBInvalidationDodgingModifierEventResponse initWithOptions:]([SBInvalidationDodgingModifierEventResponse alloc], "initWithOptions:", 3);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    v9 = self->_completionIdentifier;
    self->_completionIdentifier = v8;

    -[NSUUID UUIDString](self->_completionIdentifier, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBInvalidationDodgingModifierEventResponse setCompletionIdentifier:](v6, "setCompletionIdentifier:", v10);

    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBDodgingModifierEventResponse, "responseByAppendingResponse:toResponse:", v6, v5);
    v11 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v11;
LABEL_4:

  }
  return v5;
}

- (id)handleAnimationCompletionEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBRemovalDodgingModifier;
  -[SBDodgingModifier handleAnimationCompletionEvent:](&v10, sel_handleAnimationCompletionEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_completionIdentifier)
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSUUID UUIDString](self->_completionIdentifier, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if (v8)
      -[SBChainableModifier setState:](self, "setState:", 1);
  }

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSUUID)completionIdentifier
{
  return self->_completionIdentifier;
}

- (void)setCompletionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_completionIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
