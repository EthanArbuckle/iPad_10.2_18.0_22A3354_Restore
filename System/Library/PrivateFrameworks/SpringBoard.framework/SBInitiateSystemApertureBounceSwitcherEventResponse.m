@implementation SBInitiateSystemApertureBounceSwitcherEventResponse

- (int64_t)type
{
  return 37;
}

- (SBInitiateSystemApertureBounceSwitcherEventResponse)initWithAppLayout:(id)a3 suppressionIdentifierToInvalidate:(id)a4
{
  id v7;
  id v8;
  SBInitiateSystemApertureBounceSwitcherEventResponse *v9;
  SBInitiateSystemApertureBounceSwitcherEventResponse *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBInitiateSystemApertureBounceSwitcherEventResponse;
  v9 = -[SBChainableModifierEventResponse init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_appLayout, a3);
    objc_storeStrong((id *)&v10->_suppressionIdentifierToInvalidate, a4);
  }

  return v10;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBInitiateSystemApertureBounceSwitcherEventResponse;
  -[SBChainableModifierEventResponse descriptionBuilderWithMultilinePrefix:](&v10, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAppLayout succinctDescription](self->_appLayout, "succinctDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("appLayout"));

  -[NSUUID UUIDString](self->_suppressionIdentifierToInvalidate, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v4, "appendObject:withName:", v7, CFSTR("suppression id to invalidate"));

  return v4;
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (NSUUID)suppressionIdentifierToInvalidate
{
  return self->_suppressionIdentifierToInvalidate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suppressionIdentifierToInvalidate, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end
