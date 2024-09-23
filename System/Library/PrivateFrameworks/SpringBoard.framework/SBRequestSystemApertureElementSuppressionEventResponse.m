@implementation SBRequestSystemApertureElementSuppressionEventResponse

- (int64_t)type
{
  return 35;
}

- (SBRequestSystemApertureElementSuppressionEventResponse)initWithAppLayout:(id)a3 wantsGlobalSuppression:(BOOL)a4 wantsKeyLineEnabled:(BOOL)a5 invalidationIdentifier:(id)a6
{
  id v11;
  id v12;
  SBRequestSystemApertureElementSuppressionEventResponse *v13;
  SBRequestSystemApertureElementSuppressionEventResponse *v14;
  objc_super v16;

  v11 = a3;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)SBRequestSystemApertureElementSuppressionEventResponse;
  v13 = -[SBChainableModifierEventResponse init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_appLayout, a3);
    objc_storeStrong((id *)&v14->_invalidationIdentifier, a6);
    v14->_wantsGlobalSuppression = a4;
    v14->_wantsKeyLineEnabled = a5;
  }

  return v14;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBRequestSystemApertureElementSuppressionEventResponse;
  -[SBChainableModifierEventResponse descriptionBuilderWithMultilinePrefix:](&v12, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAppLayout succinctDescription](self->_appLayout, "succinctDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("appLayout"));

  v7 = (id)objc_msgSend(v4, "appendBool:withName:", self->_wantsGlobalSuppression, CFSTR("wantsGlobalSuppression"));
  v8 = (id)objc_msgSend(v4, "appendBool:withName:", self->_wantsKeyLineEnabled, CFSTR("wantsKeyLineEnabled"));
  -[NSUUID UUIDString](self->_invalidationIdentifier, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v4, "appendObject:withName:", v9, CFSTR("invalidationIdentifier"));

  return v4;
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (NSUUID)invalidationIdentifier
{
  return self->_invalidationIdentifier;
}

- (BOOL)wantsGlobalSuppression
{
  return self->_wantsGlobalSuppression;
}

- (BOOL)wantsKeyLineEnabled
{
  return self->_wantsKeyLineEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationIdentifier, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end
