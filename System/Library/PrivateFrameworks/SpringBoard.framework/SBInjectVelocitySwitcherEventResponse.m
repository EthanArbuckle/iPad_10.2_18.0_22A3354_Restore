@implementation SBInjectVelocitySwitcherEventResponse

- (int64_t)type
{
  return 7;
}

- (SBInjectVelocitySwitcherEventResponse)initWithVelocity:(id)a3 forKey:(id)a4 appLayout:(id)a5
{
  id v9;
  id v10;
  id v11;
  SBInjectVelocitySwitcherEventResponse *v12;
  SBInjectVelocitySwitcherEventResponse *v13;
  uint64_t v14;
  NSString *key;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SBInjectVelocitySwitcherEventResponse;
  v12 = -[SBChainableModifierEventResponse init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong(&v12->_velocity, a3);
    objc_storeStrong((id *)&v13->_appLayout, a5);
    v14 = objc_msgSend(v10, "copy");
    key = v13->_key;
    v13->_key = (NSString *)v14;

  }
  return v13;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBInjectVelocitySwitcherEventResponse;
  -[SBChainableModifierEventResponse descriptionBuilderWithMultilinePrefix:](&v8, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", self->_key, CFSTR("key"));
  -[SBAppLayout succinctDescription](self->_appLayout, "succinctDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("appLayout"));

  return v4;
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (NSString)key
{
  return self->_key;
}

- (id)velocity
{
  return self->_velocity;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_velocity, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end
