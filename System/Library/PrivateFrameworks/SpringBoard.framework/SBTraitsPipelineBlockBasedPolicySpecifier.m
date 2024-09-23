@implementation SBTraitsPipelineBlockBasedPolicySpecifier

- (NSNumber)componentOrder
{
  return self->_componentOrder;
}

- (void)updateStageParticipantsResolutionPolicies:(id)a3 context:(id)a4
{
  (*((void (**)(void))self->_specifierBlock + 2))();
}

- (int64_t)preferencesType
{
  return 1;
}

- (void)setSpecifierDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)invalidate
{
  void *v3;
  id WeakRetained;

  if (self->_isValid)
  {
    self->_isValid = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_arbiter);
    objc_msgSend(WeakRetained, "orientationResolutionStage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeResolutionPolicySpecifier:", self);

  }
}

- (SBTraitsPipelineBlockBasedPolicySpecifier)initWithPolicySpecifierBlock:(id)a3 specifierDescription:(id)a4 componentOrder:(id)a5 arbiter:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SBTraitsPipelineBlockBasedPolicySpecifier *v15;
  SBTraitsPipelineBlockBasedPolicySpecifier *v16;
  uint64_t v17;
  id specifierBlock;
  uint64_t v19;
  NSNumber *componentOrder;
  uint64_t v21;
  NSString *specifierDescription;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v14)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTraitsPipelineBlockBasedPolicySpecifier.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("arbiter"));

    if (v11)
    {
LABEL_3:
      if (v13)
        goto LABEL_4;
LABEL_10:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTraitsPipelineBlockBasedPolicySpecifier.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("componentOrder"));

      if (v12)
        goto LABEL_5;
      goto LABEL_11;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTraitsPipelineBlockBasedPolicySpecifier.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("specifierBlock"));

  if (!v13)
    goto LABEL_10;
LABEL_4:
  if (v12)
    goto LABEL_5;
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTraitsPipelineBlockBasedPolicySpecifier.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("specifierDescription"));

LABEL_5:
  v29.receiver = self;
  v29.super_class = (Class)SBTraitsPipelineBlockBasedPolicySpecifier;
  v15 = -[SBTraitsPipelineBlockBasedPolicySpecifier init](&v29, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_isValid = 1;
    objc_storeWeak((id *)&v15->_arbiter, v14);
    v17 = objc_msgSend(v11, "copy");
    specifierBlock = v16->_specifierBlock;
    v16->_specifierBlock = (id)v17;

    v19 = objc_msgSend(v13, "copy");
    componentOrder = v16->_componentOrder;
    v16->_componentOrder = (NSNumber *)v19;

    v21 = objc_msgSend(v12, "copy");
    specifierDescription = v16->_specifierDescription;
    v16->_specifierDescription = (NSString *)v21;

    objc_msgSend(v14, "orientationResolutionStage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addResolutionPolicySpecifier:update:", v16, 0);

  }
  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifierDescription, 0);
  objc_destroyWeak((id *)&self->_arbiter);
  objc_storeStrong(&self->_specifierBlock, 0);
  objc_storeStrong((id *)&self->_componentOrder, 0);
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (self->_isValid)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTraitsPipelineBlockBasedPolicySpecifier.m"), 38, CFSTR("SBTraitsPipelineBlockBasedPolicySpecifier was deallocated without being invalidated first."));

  }
  v5.receiver = self;
  v5.super_class = (Class)SBTraitsPipelineBlockBasedPolicySpecifier;
  -[SBTraitsPipelineBlockBasedPolicySpecifier dealloc](&v5, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  NSString *specifierDescription;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v9.receiver = self;
  v9.super_class = (Class)SBTraitsPipelineBlockBasedPolicySpecifier;
  -[SBTraitsPipelineBlockBasedPolicySpecifier description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  specifierDescription = self->_specifierDescription;
  -[NSNumber stringValue](self->_componentOrder, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR(" %@ order: %@"), specifierDescription, v7);

  return (NSString *)v5;
}

- (id)specifierBlock
{
  return self->_specifierBlock;
}

- (TRAArbiter)arbiter
{
  return (TRAArbiter *)objc_loadWeakRetained((id *)&self->_arbiter);
}

- (NSString)specifierDescription
{
  return self->_specifierDescription;
}

@end
