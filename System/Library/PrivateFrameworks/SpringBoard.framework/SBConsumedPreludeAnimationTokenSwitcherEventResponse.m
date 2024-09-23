@implementation SBConsumedPreludeAnimationTokenSwitcherEventResponse

- (int64_t)type
{
  return 43;
}

- (SBConsumedPreludeAnimationTokenSwitcherEventResponse)initWithPreludeToken:(id)a3
{
  id v6;
  SBConsumedPreludeAnimationTokenSwitcherEventResponse *v7;
  void *v9;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBConsumedPreludeAnimationTokenSwitcherEventResponse;
  v7 = -[SBChainableModifierEventResponse init](&v10, sel_init);
  if (v7)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("SBConsumedPreludeAnimationTokenSwitcherEventResponse.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("preludeToken != nil"));

    }
    objc_storeStrong((id *)&v7->_preludeToken, a3);
  }

  return v7;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBConsumedPreludeAnimationTokenSwitcherEventResponse;
  -[SBChainableModifierEventResponse descriptionBuilderWithMultilinePrefix:](&v7, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", self->_preludeToken, CFSTR("preludeToken"));
  return v4;
}

- (SBHardwareButtonLaunchPreludeAnimationToken)preludeToken
{
  return self->_preludeToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preludeToken, 0);
}

@end
