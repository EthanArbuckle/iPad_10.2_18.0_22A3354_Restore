@implementation SBSSecureAppAssertion

+ (id)acquireSecureAppAssertionWithType:(unint64_t)a3 errorHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  SBSIdentifierForSecureAppType(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "acquireContentProviderAssertionForType:slot:identifier:configurationObject:errorHandler:", 2, CFSTR("App"), v7, 0, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)acquireSecureAppAssertionWithType:(unint64_t)a3 supportedOrientations:(unint64_t)a4 errorHandler:(id)a5
{
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = a5;
  objc_msgSend(v9, "numberWithUnsignedInteger:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryWithObject:forKey:", v11, CFSTR("SBSLockScreenContentActionConfigurationKeySupportedOrientations"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  SBSIdentifierForSecureAppType(a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "acquireContentProviderAssertionForType:slot:identifier:configurationObject:errorHandler:", 2, CFSTR("App"), v13, v12, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)_supportsReacquisition
{
  return 1;
}

- (SBSLockScreenContentAssertion)actualAssertion
{
  return self->_actualAssertion;
}

- (void)setActualAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_actualAssertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actualAssertion, 0);
}

@end
