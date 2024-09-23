@implementation TRAUserInterfaceStyleResolutionPolicyInfo

- (TRAUserInterfaceStyleResolutionPolicyInfo)initWithActuationContext:(id)a3
{
  id v4;
  TRAUserInterfaceStyleResolutionPolicyInfo *v5;
  uint64_t v6;
  TRASettingsActuationContext *actuationContext;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRAUserInterfaceStyleResolutionPolicyInfo;
  v5 = -[TRAUserInterfaceStyleResolutionPolicyInfo init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    actuationContext = v5->_actuationContext;
    v5->_actuationContext = (TRASettingsActuationContext *)v6;

  }
  return v5;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[TRAUserInterfaceStyleResolutionPolicyInfo succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  TRASettingsActuationContext *actuationContext;
  id v6;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  actuationContext = self->_actuationContext;
  if (actuationContext)
    v6 = (id)objc_msgSend(v3, "appendObject:withName:", actuationContext, CFSTR("Actuation Context"));
  return v4;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[TRAUserInterfaceStyleResolutionPolicyInfo descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (TRASettingsActuationContext)actuationContext
{
  return self->_actuationContext;
}

- (void)setActuationContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actuationContext, 0);
}

@end
