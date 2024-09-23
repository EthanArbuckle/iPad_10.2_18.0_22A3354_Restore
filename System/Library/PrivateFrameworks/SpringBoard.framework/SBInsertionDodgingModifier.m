@implementation SBInsertionDodgingModifier

- (SBInsertionDodgingModifier)initWithIdentifier:(id)a3 initialCenter:(CGPoint)a4 initialSize:(CGSize)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v12;
  SBInsertionDodgingModifier *v13;
  void *v15;
  objc_super v16;

  height = a5.height;
  width = a5.width;
  y = a4.y;
  x = a4.x;
  v12 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBInsertionDodgingModifier;
  v13 = -[SBChainableModifier init](&v16, sel_init);
  if (v13)
  {
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("SBInsertionDodgingModifier.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

    }
    objc_storeStrong((id *)&v13->_identifier, a3);
    v13->_initialCenter.x = x;
    v13->_initialCenter.y = y;
    v13->_initialSize.width = width;
    v13->_initialSize.height = height;
    v13->_phase = 0;
  }

  return v13;
}

- (id)handleInsertionEvent:(id)a3
{
  id v5;
  void *v6;
  NSString *identifier;
  void *v8;
  SBInvalidationDodgingModifierEventResponse *v9;
  void *v10;
  SBScheduleEventDodgingModifierEventResponse *v11;
  void *v12;
  SBScheduleEventDodgingModifierEventResponse *v13;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SBInsertionDodgingModifier;
  v5 = a3;
  -[SBDodgingModifier handleInsertionEvent:](&v16, sel_handleInsertionEvent_, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  objc_msgSend(v5, "identifier", v16.receiver, v16.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = -[NSString isEqual:](identifier, "isEqual:", v8);
  if ((_DWORD)v5)
  {
    if (self->_phase)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBInsertionDodgingModifier.m"), 45, CFSTR("Phase should be possible. Is the same identifier being inserted twice?"));

    }
    self->_phase = 1;
    v9 = -[SBInvalidationDodgingModifierEventResponse initWithOptions:]([SBInvalidationDodgingModifierEventResponse alloc], "initWithOptions:", 3);
    -[SBInvalidationDodgingModifierEventResponse setIdentifier:](v9, "setIdentifier:", self->_identifier);
    -[SBInvalidationDodgingModifierEventResponse setDisableCoalescing:](v9, "setDisableCoalescing:", 1);
    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBDodgingModifierEventResponse, "responseByAppendingResponse:toResponse:", v9, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = [SBScheduleEventDodgingModifierEventResponse alloc];
    -[SBInsertionDodgingModifier _modelDidUpdateEventName](self, "_modelDidUpdateEventName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[SBScheduleEventDodgingModifierEventResponse initWithName:](v11, "initWithName:", v12);

    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBDodgingModifierEventResponse, "responseByAppendingResponse:toResponse:", v13, v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)handleCustomEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  SBInvalidationDodgingModifierEventResponse *v9;
  void *v10;
  uint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SBInsertionDodgingModifier;
  v4 = a3;
  -[SBDodgingModifier handleCustomEvent:](&v13, sel_handleCustomEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name", v13.receiver, v13.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBInsertionDodgingModifier _modelDidUpdateEventName](self, "_modelDidUpdateEventName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    self->_phase = 2;
    v9 = -[SBInvalidationDodgingModifierEventResponse initWithOptions:]([SBInvalidationDodgingModifierEventResponse alloc], "initWithOptions:", 2);
    -[SBInsertionDodgingModifier _animationDidCompleteEventName](self, "_animationDidCompleteEventName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBInvalidationDodgingModifierEventResponse setCompletionIdentifier:](v9, "setCompletionIdentifier:", v10);

    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBDodgingModifierEventResponse, "responseByAppendingResponse:toResponse:", v9, v5);
    v11 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v11;
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

  v10.receiver = self;
  v10.super_class = (Class)SBInsertionDodgingModifier;
  v4 = a3;
  -[SBDodgingModifier handleAnimationCompletionEvent:](&v10, sel_handleAnimationCompletionEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier", v10.receiver, v10.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBInsertionDodgingModifier _animationDidCompleteEventName](self, "_animationDidCompleteEventName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
    -[SBChainableModifier setState:](self, "setState:", 1);
  return v5;
}

- (id)modelForInvalidatedModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v31;
  objc_super v32;
  objc_super v33;
  _QWORD v34[10];
  _QWORD v35[4];
  id v36;

  v4 = a3;
  v5 = v4;
  if (self->_phase == 1
    && (objc_msgSend(v4, "identifiers"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "containsObject:", self->_identifier),
        v6,
        (v7 & 1) == 0))
  {
    -[SBInsertionDodgingModifier preferenceForIdentifier:](self, "preferenceForIdentifier:", self->_identifier);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "excludedDodgingIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "identifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __55__SBInsertionDodgingModifier_modelForInvalidatedModel___block_invoke;
    v35[3] = &unk_1E8E9DE38;
    v12 = v10;
    v36 = v12;
    v31 = v11;
    objc_msgSend(v11, "bs_filter:", v35);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "count"))
    {
      v15 = 0;
      v16 = 0;
      do
      {
        objc_msgSend(v14, "objectAtIndex:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v15 + 1;
        if (objc_msgSend(v13, "containsObject:", v17))
          v16 = v15 + 1;

        ++v15;
      }
      while (v18 < objc_msgSend(v14, "count"));
    }
    else
    {
      v16 = 0;
    }
    -[SBInsertionDodgingModifier preferenceForIdentifier:](self, "preferenceForIdentifier:", self->_identifier);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "preferredCenter");
    v21 = v20;
    v23 = v22;

    -[SBInsertionDodgingModifier preferenceForIdentifier:](self, "preferenceForIdentifier:", self->_identifier);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "preferredSize");
    v26 = v25;
    v28 = v27;

    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __55__SBInsertionDodgingModifier_modelForInvalidatedModel___block_invoke_2;
    v34[3] = &unk_1E8E9DE60;
    v34[4] = self;
    v34[5] = v16;
    v34[6] = v21;
    v34[7] = v23;
    v34[8] = v26;
    v34[9] = v28;
    objc_msgSend(v5, "modelByModifyingModelWithBlock:", v34);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v33.receiver = self;
    v33.super_class = (Class)SBInsertionDodgingModifier;
    -[SBInsertionDodgingModifier modelForInvalidatedModel:](&v33, sel_modelForInvalidatedModel_, v29);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v32.receiver = self;
    v32.super_class = (Class)SBInsertionDodgingModifier;
    -[SBInsertionDodgingModifier modelForInvalidatedModel:](&v32, sel_modelForInvalidatedModel_, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

uint64_t __55__SBInsertionDodgingModifier_modelForInvalidatedModel___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

uint64_t __55__SBInsertionDodgingModifier_modelForInvalidatedModel___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addIdentifier:atIndex:center:size:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88), *(_QWORD *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

- (id)framesForIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;
  NSString *identifier;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)SBInsertionDodgingModifier;
  -[SBInsertionDodgingModifier framesForIdentifiers](&v8, sel_framesForIdentifiers);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_phase == 1)
  {
    SBRectWithSize();
    UIRectCenteredAboutPoint();
    identifier = self->_identifier;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &identifier, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bs_dictionaryByAddingEntriesFromDictionary:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  return v3;
}

- (int64_t)animationBehaviorModeForIdentifier:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  v5 = v4;
  if (self->_phase == 1 && (objc_msgSend(v4, "isEqual:", self->_identifier) & 1) != 0)
    v6 = 2;
  else
    v6 = 3;

  return v6;
}

- (id)_modelDidUpdateEventName
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("InsertionDidUpdateModel-%p-%@"), self->_identifier, self->_identifier);
}

- (id)_animationDidCompleteEventName
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("InsertionAnimationDidComplete-%p-%@"), self->_identifier, self->_identifier);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (CGPoint)initialCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_initialCenter.x;
  y = self->_initialCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setInitialCenter:(CGPoint)a3
{
  self->_initialCenter = a3;
}

- (CGSize)initialSize
{
  double width;
  double height;
  CGSize result;

  width = self->_initialSize.width;
  height = self->_initialSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setInitialSize:(CGSize)a3
{
  self->_initialSize = a3;
}

- (unint64_t)phase
{
  return self->_phase;
}

- (void)setPhase:(unint64_t)a3
{
  self->_phase = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
