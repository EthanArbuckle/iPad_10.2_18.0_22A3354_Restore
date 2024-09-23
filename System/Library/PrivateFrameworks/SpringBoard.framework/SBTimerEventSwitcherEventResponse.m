@implementation SBTimerEventSwitcherEventResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBTimerEventSwitcherEventResponse;
  -[SBChainableModifierEventResponse descriptionBuilderWithMultilinePrefix:](&v6, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", self->_reason, CFSTR("reason"));
  return v4;
}

- (SBTimerEventSwitcherEventResponse)initWithDelay:(double)a3 validator:(id)a4 reason:(id)a5
{
  id v8;
  id v9;
  SBTimerEventSwitcherEventResponse *v10;
  SBTimerEventSwitcherEventResponse *v11;
  objc_super v13;

  v8 = a4;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SBTimerEventSwitcherEventResponse;
  v10 = -[SBChainableModifierEventResponse init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_reason, a5);
    -[SBChainableModifierEventResponse setDelay:withValidator:](v11, "setDelay:withValidator:", v8, a3);
  }

  return v11;
}

- (int64_t)type
{
  return 17;
}

- (NSString)reason
{
  return self->_reason;
}

@end
