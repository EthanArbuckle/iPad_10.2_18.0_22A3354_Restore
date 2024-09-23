@implementation _SBUIBiometricMatchingAssertion

- (_SBUIBiometricMatchingAssertion)initWithIdentifier:(id)a3 forReason:(id)a4 queue:(id)a5 invalidationBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Use initWithMatchMode:reason:invalidationBlock:"), 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v13);
}

- (_SBUIBiometricMatchingAssertion)initWithMatchMode:(unint64_t)a3 reason:(id)a4 invalidationBlock:(id)a5
{
  _SBUIBiometricMatchingAssertion *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_SBUIBiometricMatchingAssertion;
  result = -[_SBUIBiometricOperationAssertion initWithIdentifier:forReason:queue:invalidationBlock:](&v7, sel_initWithIdentifier_forReason_queue_invalidationBlock_, CFSTR("MatchingAssertion"), a4, MEMORY[0x1E0C80D38], a5);
  if (result)
    result->_matchMode = a3;
  return result;
}

- (NSString)description
{
  return (NSString *)-[_SBUIBiometricMatchingAssertion descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_SBUIBiometricMatchingAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[_SBUIBiometricMatchingAssertion descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  _SBUIBiometricMatchingAssertion *v11;

  -[_SBUIBiometricMatchingAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73___SBUIBiometricMatchingAssertion_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E4C3E6A0;
  v5 = v4;
  v10 = v5;
  v11 = self;
  v6 = (id)objc_msgSend(v5, "modifyProem:", v9);
  v7 = v5;

  return v7;
}

- (unint64_t)matchMode
{
  return self->_matchMode;
}

- (int64_t)restartCount
{
  return self->_restartCount;
}

- (void)setRestartCount:(int64_t)a3
{
  self->_restartCount = a3;
}

@end
