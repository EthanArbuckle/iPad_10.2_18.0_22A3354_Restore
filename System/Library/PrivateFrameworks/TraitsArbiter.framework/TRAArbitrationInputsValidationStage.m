@implementation TRAArbitrationInputsValidationStage

- (id)validateInputs:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = self->_inputsValidators;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      v13 = v6;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "validateInputs:withContext:", v13, v7, (_QWORD)v15);
        v6 = (id)objc_claimAutoreleasedReturnValue();

        ++v12;
        v13 = v6;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v6;
}

- (TRAArbitrationInputsValidationStage)initWithValidators:(id)a3 arbiter:(id)a4
{
  id v6;
  id v7;
  TRAArbitrationInputsValidationStage *v8;
  TRAArbitrationInputsValidationStage *v9;
  uint64_t v10;
  NSMutableArray *inputsValidators;
  uint64_t v12;
  BSInvalidatable *stateDumpHandle;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)TRAArbitrationInputsValidationStage;
  v8 = -[TRAArbitrationInputsValidationStage init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_arbiter, v7);
    if (v6)
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v6);
    else
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1);
    v10 = objc_claimAutoreleasedReturnValue();
    inputsValidators = v9->_inputsValidators;
    v9->_inputsValidators = (NSMutableArray *)v10;

    -[TRAArbitrationInputsValidationStage _setupStateDump](v9, "_setupStateDump");
    v12 = objc_claimAutoreleasedReturnValue();
    stateDumpHandle = v9->_stateDumpHandle;
    v9->_stateDumpHandle = (BSInvalidatable *)v12;

  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[BSInvalidatable invalidate](self->_stateDumpHandle, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)TRAArbitrationInputsValidationStage;
  -[TRAArbitrationInputsValidationStage dealloc](&v3, sel_dealloc);
}

- (void)addInputsValidator:(id)a3
{
  -[TRAArbitrationInputsValidationStage addInputsValidator:update:](self, "addInputsValidator:update:", a3, 1);
}

- (void)addInputsValidator:(id)a3 update:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *WeakRetained;
  void *v9;
  NSMutableArray *v10;
  NSMutableArray *inputsValidators;
  void *v12;
  id v13;

  v4 = a4;
  v7 = a3;
  v13 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRAArbitration.m"), 89, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("inputsValidator"));

    v7 = 0;
  }
  if ((-[NSMutableArray containsObject:](self->_inputsValidators, "containsObject:", v7) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRAArbitration.m"), 99, CFSTR("inputsValidator[%@] already added to the stage[%@]"), v13, self);
LABEL_7:

    goto LABEL_8;
  }
  -[NSMutableArray addObject:](self->_inputsValidators, "addObject:", v13);
  -[NSMutableArray sortedArrayUsingComparator:](self->_inputsValidators, "sortedArrayUsingComparator:", &__block_literal_global);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (NSMutableArray *)objc_msgSend(v9, "mutableCopy");
  inputsValidators = self->_inputsValidators;
  self->_inputsValidators = v10;

  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_arbiter);
    objc_msgSend(WeakRetained, "_inputsValidationStageDidUpdateValidators:", self);
    goto LABEL_7;
  }
LABEL_8:

}

uint64_t __65__TRAArbitrationInputsValidationStage_addInputsValidator_update___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "validatorOrder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "validatorOrder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)removeInputsValidator:(id)a3
{
  -[TRAArbitrationInputsValidationStage removeInputsValidator:update:](self, "removeInputsValidator:update:", a3, 1);
}

- (void)removeInputsValidator:(id)a3 update:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *WeakRetained;
  void *v9;
  id v10;

  v4 = a4;
  v7 = a3;
  v10 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRAArbitration.m"), 108, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("inputsValidator"));

    v7 = 0;
  }
  if (!-[NSMutableArray containsObject:](self->_inputsValidators, "containsObject:", v7))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRAArbitration.m"), 115, CFSTR("inputsValidator[%@] can't be removed since not found in stage[%@]"), v10, self);
    goto LABEL_7;
  }
  -[NSMutableArray removeObject:](self->_inputsValidators, "removeObject:", v10);
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_arbiter);
    objc_msgSend(WeakRetained, "_inputsValidationStageDidUpdateValidators:", self);
LABEL_7:

  }
}

- (NSString)debugDescription
{
  return (NSString *)-[TRAArbitrationInputsValidationStage descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[TRAArbitrationInputsValidationStage succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), -[NSMutableArray count](self->_inputsValidators, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("inputsValidators count"));

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[TRAArbitrationInputsValidationStage descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;

  -[TRAArbitrationInputsValidationStage succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendArraySection:withName:skipIfEmpty:", self->_inputsValidators, CFSTR("inputs validators"), 0);
  return v4;
}

- (id)_setupStateDump
{
  id v3;
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v9;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x24BDAC9B8];
  v4 = (void *)MEMORY[0x24BDD17C8];
  WeakRetained = objc_loadWeakRetained((id *)&self->_arbiter);
  objc_msgSend(v4, "stringWithFormat:", CFSTR("TraitsArbiter - %p - Arbitration Pipeline - Inputs Validation Stage"), WeakRetained);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_copyWeak(&v9, &location);
  BSLogAddStateCaptureBlockWithTitle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v7;
}

__CFString *__54__TRAArbitrationInputsValidationStage__setupStateDump__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  __CFString *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "debugDescription");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_251A072F0;
  }

  return v3;
}

- (NSNumber)validatorOrder
{
  return self->validatorOrder;
}

- (TRAArbiter)arbiter
{
  return (TRAArbiter *)objc_loadWeakRetained((id *)&self->_arbiter);
}

- (void)setArbiter:(id)a3
{
  objc_storeWeak((id *)&self->_arbiter, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_arbiter);
  objc_storeStrong((id *)&self->validatorOrder, 0);
  objc_storeStrong((id *)&self->_stateDumpHandle, 0);
  objc_storeStrong((id *)&self->_inputsValidators, 0);
}

@end
