@implementation SBCancelSystemGesturesSwitcherEventResponse

- (SBCancelSystemGesturesSwitcherEventResponse)init
{
  return -[SBCancelSystemGesturesSwitcherEventResponse initWithSystemGestureType:](self, "initWithSystemGestureType:", 0);
}

- (SBCancelSystemGesturesSwitcherEventResponse)initWithSystemGestureType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  SBCancelSystemGesturesSwitcherEventResponse *v7;

  v4 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBCancelSystemGesturesSwitcherEventResponse initWithSystemGestureTypes:](self, "initWithSystemGestureTypes:", v6);

  return v7;
}

- (SBCancelSystemGesturesSwitcherEventResponse)initWithSystemGestureTypes:(id)a3
{
  id v4;
  SBCancelSystemGesturesSwitcherEventResponse *v5;
  uint64_t v6;
  NSSet *systemGestureTypes;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBCancelSystemGesturesSwitcherEventResponse;
  v5 = -[SBChainableModifierEventResponse init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    systemGestureTypes = v5->_systemGestureTypes;
    v5->_systemGestureTypes = (NSSet *)v6;

  }
  return v5;
}

- (int64_t)type
{
  return 45;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBCancelSystemGesturesSwitcherEventResponse;
  -[SBChainableModifierEventResponse descriptionBuilderWithMultilinePrefix:](&v7, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", self->_systemGestureTypes, CFSTR("systemGestureTypes"));
  return v4;
}

- (NSSet)systemGestureTypes
{
  return self->_systemGestureTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemGestureTypes, 0);
}

@end
