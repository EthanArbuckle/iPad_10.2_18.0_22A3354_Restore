@implementation SBPreferenceChangeDodgingModifier

- (SBPreferenceChangeDodgingModifier)initWithIdentifier:(id)a3 animated:(BOOL)a4
{
  id v7;
  SBPreferenceChangeDodgingModifier *v8;
  SBPreferenceChangeDodgingModifier *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBPreferenceChangeDodgingModifier;
  v8 = -[SBChainableModifier init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a3);
    v9->_animated = a4;
  }

  return v9;
}

- (id)handlePreferenceChangeEvent:(id)a3
{
  id v4;
  void *v5;
  NSString *identifier;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBPreferenceChangeDodgingModifier;
  -[SBDodgingModifier handlePreferenceChangeEvent:](&v13, sel_handlePreferenceChangeEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(identifier) = -[NSString isEqual:](identifier, "isEqual:", v7);

  if ((_DWORD)identifier)
  {
    v8 = objc_msgSend(v4, "phase");
    self->_phase = v8;
    if (v8 == 1)
    {
      +[SBInvalidationDodgingModifierEventResponse responseWithOptions:](SBInvalidationDodgingModifierEventResponse, "responseWithOptions:", 3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (self->_animated)
      {
        objc_msgSend(v9, "setCompletionIdentifier:", self->_identifier);
      }
      else if (!-[SBPreferenceChangeDodgingModifier isResigningLifecycleManagement](self, "isResigningLifecycleManagement"))
      {
        -[SBChainableModifier setState:](self, "setState:", 1);
      }
      +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBDodgingModifierEventResponse, "responseByAppendingResponse:toResponse:", v10, v5);
      v11 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v11;
    }
  }

  return v5;
}

- (id)handleAnimationCompletionEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBPreferenceChangeDodgingModifier;
  v4 = a3;
  -[SBDodgingModifier handleAnimationCompletionEvent:](&v9, sel_handleAnimationCompletionEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isEqualToString:", self->_identifier))
  {
    v7 = -[SBPreferenceChangeDodgingModifier isResigningLifecycleManagement](self, "isResigningLifecycleManagement");

    if (!v7)
      -[SBChainableModifier setState:](self, "setState:", 1);
  }
  else
  {

  }
  return v5;
}

- (id)modelForInvalidatedModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;
  _QWORD v16[6];

  v4 = a3;
  objc_msgSend(v4, "identifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBPreferenceChangeDodgingModifier preferenceForIdentifier:](self, "preferenceForIdentifier:", self->_identifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "excludedDodgingIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  if (objc_msgSend(v5, "count"))
  {
    while (1)
    {
      objc_msgSend(v5, "objectAtIndex:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBPreferenceChangeDodgingModifier preferenceForIdentifier:](self, "preferenceForIdentifier:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "excludedDodgingIdentifiers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v11, "containsObject:", self->_identifier) & 1) == 0
        && (self->_boostUpdatedIdentifier
         || (objc_msgSend(v9, "isEqual:", self->_identifier) & 1) != 0
         || objc_msgSend(v7, "containsObject:", v9)))
      {
        break;
      }

      if (++v8 >= (unint64_t)objc_msgSend(v5, "count"))
        goto LABEL_9;
    }

  }
LABEL_9:
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __62__SBPreferenceChangeDodgingModifier_modelForInvalidatedModel___block_invoke;
  v16[3] = &unk_1E8EAC1D0;
  v16[4] = self;
  v16[5] = v8;
  objc_msgSend(v4, "modelByModifyingModelWithBlock:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)SBPreferenceChangeDodgingModifier;
  -[SBPreferenceChangeDodgingModifier modelForInvalidatedModel:](&v15, sel_modelForInvalidatedModel_, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __62__SBPreferenceChangeDodgingModifier_modelForInvalidatedModel___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIndex:forIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
}

- (id)zOrderedIdentifiers
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;
  objc_super v9;

  if (self->_animated)
  {
    v9.receiver = self;
    v9.super_class = (Class)SBPreferenceChangeDodgingModifier;
    -[SBPreferenceChangeDodgingModifier zOrderedIdentifiers](&v9, sel_zOrderedIdentifiers);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "mutableCopy");

    v5 = objc_msgSend(v4, "indexOfObject:", self->_identifier);
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "moveObjectsAtIndexes:toIndex:", v6, 0);

    return v4;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBPreferenceChangeDodgingModifier;
    -[SBPreferenceChangeDodgingModifier zOrderedIdentifiers](&v8, sel_zOrderedIdentifiers);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (int64_t)animationBehaviorModeForIdentifier:(id)a3
{
  objc_super v4;

  if (self->_animated)
    return 3;
  v4.receiver = self;
  v4.super_class = (Class)SBPreferenceChangeDodgingModifier;
  return -[SBPreferenceChangeDodgingModifier animationBehaviorModeForIdentifier:](&v4, sel_animationBehaviorModeForIdentifier_, a3);
}

- (BOOL)isResigningLifecycleManagement
{
  return self->_boostUpdatedIdentifier;
}

- (void)setResignLifecycleManagement:(BOOL)a3
{
  self->_resignLifecycleManagement = a3;
}

- (void)setBoostUpdatedIdentifier:(BOOL)a3
{
  self->_boostUpdatedIdentifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
