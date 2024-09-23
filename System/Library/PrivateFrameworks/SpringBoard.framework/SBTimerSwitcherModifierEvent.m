@implementation SBTimerSwitcherModifierEvent

- (int64_t)type
{
  return 15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBTimerSwitcherModifierEvent;
  -[SBSwitcherModifierEvent descriptionBuilderWithMultilinePrefix:](&v6, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", self->_reason, CFSTR("reason"));
  return v4;
}

- (SBTimerSwitcherModifierEvent)initWithReason:(id)a3
{
  id v5;
  SBTimerSwitcherModifierEvent *v6;
  SBTimerSwitcherModifierEvent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBTimerSwitcherModifierEvent;
  v6 = -[SBTimerSwitcherModifierEvent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_reason, a3);

  return v7;
}

- (NSString)reason
{
  return self->_reason;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBTimerSwitcherModifierEvent;
  v4 = -[SBChainableModifierEvent copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_reason, "copy");
  v6 = (void *)v4[3];
  v4[3] = v5;

  return v4;
}

@end
