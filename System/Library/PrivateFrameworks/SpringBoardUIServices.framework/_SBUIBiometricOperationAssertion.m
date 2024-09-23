@implementation _SBUIBiometricOperationAssertion

- (_SBUIBiometricOperationAssertion)initWithIdentifier:(id)a3 forReason:(id)a4 queue:(id)a5 invalidationBlock:(id)a6
{
  id v10;
  _SBUIBiometricOperationAssertion *v11;
  objc_super v13;
  _QWORD v14[4];
  id v15;

  v14[1] = 3221225472;
  v14[2] = __89___SBUIBiometricOperationAssertion_initWithIdentifier_forReason_queue_invalidationBlock___block_invoke;
  v14[3] = &unk_1E4C400B0;
  v15 = a6;
  v13.receiver = self;
  v13.super_class = (Class)_SBUIBiometricOperationAssertion;
  v14[0] = MEMORY[0x1E0C809B0];
  v10 = v15;
  v11 = -[BSSimpleAssertion initWithIdentifier:forReason:queue:invalidationBlock:](&v13, sel_initWithIdentifier_forReason_queue_invalidationBlock_, a3, a4, a5, v14);

  return v11;
}

- (NSString)description
{
  return (NSString *)-[_SBUIBiometricOperationAssertion descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_SBUIBiometricOperationAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_SBUIBiometricOperationAssertion descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  _SBUIBiometricOperationAssertion *v11;

  -[_SBUIBiometricOperationAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74___SBUIBiometricOperationAssertion_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E4C3E6A0;
  v5 = v4;
  v10 = v5;
  v11 = self;
  v6 = (id)objc_msgSend(v5, "modifyProem:", v9);
  v7 = v5;

  return v7;
}

- (NSSet)operations
{
  return self->_operations;
}

- (void)setOperations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operations, 0);
}

@end
