@implementation _UISTouchAuthenticationVerifierResult

- (_UISTouchAuthenticationVerifierResult)initWithPassesSecurityAnalysis:(BOOL)a3 failureReasons:(id)a4
{
  _BOOL4 v5;
  id v8;
  _UISTouchAuthenticationVerifierResult *v9;
  void *v11;
  objc_super v12;

  v5 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_UISTouchAuthenticationVerifierResult;
  v9 = -[_UISTouchAuthenticationVerifierResult init](&v12, sel_init);
  if (v9)
  {
    if (v8 && v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("_UISTouchAuthenticationVerifierResult.m"), 16, CFSTR("An event that passes security analysis can not have failure reasons"));

    }
    v9->_passesSecurityAnalysis = v5;
    objc_storeStrong((id *)&v9->_failureReasons, a4);
  }

  return v9;
}

- (BOOL)passesSecurityAnalysis
{
  return self->_passesSecurityAnalysis;
}

- (NSString)failureReasons
{
  return self->_failureReasons;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failureReasons, 0);
}

@end
