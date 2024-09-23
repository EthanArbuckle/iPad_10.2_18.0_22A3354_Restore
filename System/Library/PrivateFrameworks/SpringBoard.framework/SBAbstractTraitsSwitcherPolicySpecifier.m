@implementation SBAbstractTraitsSwitcherPolicySpecifier

void __74__SBAbstractTraitsSwitcherPolicySpecifier_initWithComponentOrder_arbiter___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_updateAcquiredParticipantsPolicies:context:", v6, v5);

}

- (id)_blockBasedPolicySpecifier
{
  return self->_blockBasedPolicySpecifier;
}

- (SBAbstractTraitsSwitcherPolicySpecifier)initWithComponentOrder:(id)a3 arbiter:(id)a4
{
  id v6;
  id v7;
  SBAbstractTraitsSwitcherPolicySpecifier *v8;
  SBTraitsPipelineBlockBasedPolicySpecifier *v9;
  uint64_t v10;
  SBTraitsPipelineBlockBasedPolicySpecifier *blockBasedPolicySpecifier;
  _QWORD v13[4];
  id v14;
  id location;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SBAbstractTraitsSwitcherPolicySpecifier;
  v8 = -[SBAbstractTraitsSwitcherPolicySpecifier init](&v16, sel_init);
  if (v8)
  {
    objc_initWeak(&location, v8);
    v9 = [SBTraitsPipelineBlockBasedPolicySpecifier alloc];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __74__SBAbstractTraitsSwitcherPolicySpecifier_initWithComponentOrder_arbiter___block_invoke;
    v13[3] = &unk_1E8EA7798;
    objc_copyWeak(&v14, &location);
    v10 = -[SBTraitsPipelineBlockBasedPolicySpecifier initWithPolicySpecifierBlock:specifierDescription:componentOrder:arbiter:](v9, "initWithPolicySpecifierBlock:specifierDescription:componentOrder:arbiter:", v13, CFSTR("None"), v6, v7);
    blockBasedPolicySpecifier = v8->_blockBasedPolicySpecifier;
    v8->_blockBasedPolicySpecifier = (SBTraitsPipelineBlockBasedPolicySpecifier *)v10;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[SBTraitsPipelineBlockBasedPolicySpecifier invalidate](self->_blockBasedPolicySpecifier, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBAbstractTraitsSwitcherPolicySpecifier;
  -[SBAbstractTraitsSwitcherPolicySpecifier dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  SBTraitsPipelineBlockBasedPolicySpecifier *blockBasedPolicySpecifier;

  -[SBTraitsPipelineBlockBasedPolicySpecifier invalidate](self->_blockBasedPolicySpecifier, "invalidate");
  blockBasedPolicySpecifier = self->_blockBasedPolicySpecifier;
  self->_blockBasedPolicySpecifier = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockBasedPolicySpecifier, 0);
}

- (void)_updateAcquiredParticipantsPolicies:(id)a3 context:(id)a4
{
  OUTLINED_FUNCTION_1_7();
  NSRequestConcreteImplementation();
}

- (id)_specifierDescription
{
  OUTLINED_FUNCTION_1_7();
  NSRequestConcreteImplementation();
  return 0;
}

@end
