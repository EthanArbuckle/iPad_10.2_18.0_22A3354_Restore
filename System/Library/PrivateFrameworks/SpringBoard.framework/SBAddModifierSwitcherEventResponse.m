@implementation SBAddModifierSwitcherEventResponse

- (SBAddModifierSwitcherEventResponse)initWithModifier:(id)a3 level:(int64_t)a4 key:(id)a5
{
  id v10;
  id v11;
  SBAddModifierSwitcherEventResponse *v12;
  SBAddModifierSwitcherEventResponse *v13;
  uint64_t v14;
  NSString *key;
  void *v17;
  objc_super v18;

  v10 = a3;
  v11 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAddModifierSwitcherEventResponse.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("modifier"));

  }
  v18.receiver = self;
  v18.super_class = (Class)SBAddModifierSwitcherEventResponse;
  v12 = -[SBChainableModifierEventResponse init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_modifier, a3);
    v13->_level = a4;
    v14 = objc_msgSend(v11, "copy");
    key = v13->_key;
    v13->_key = (NSString *)v14;

  }
  return v13;
}

- (SBAddModifierSwitcherEventResponse)initWithModifier:(id)a3 level:(int64_t)a4
{
  return -[SBAddModifierSwitcherEventResponse initWithModifier:level:key:](self, "initWithModifier:level:key:", a3, a4, 0);
}

- (int64_t)type
{
  return 31;
}

- (SBSwitcherModifier)modifier
{
  return self->_modifier;
}

- (int64_t)level
{
  return self->_level;
}

- (NSString)key
{
  return self->_key;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_modifier, 0);
}

@end
