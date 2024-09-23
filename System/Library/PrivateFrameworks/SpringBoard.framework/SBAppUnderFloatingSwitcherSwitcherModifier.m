@implementation SBAppUnderFloatingSwitcherSwitcherModifier

- (SBAppUnderFloatingSwitcherSwitcherModifier)initWithActiveAppLayout:(id)a3
{
  id v5;
  SBAppUnderFloatingSwitcherSwitcherModifier *v6;
  SBAppUnderFloatingSwitcherSwitcherModifier *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBAppUnderFloatingSwitcherSwitcherModifier;
  v6 = -[SBSwitcherModifier init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_appLayout, a3);

  return v7;
}

- (id)appLayoutsToResignActive
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = (void *)MEMORY[0x1E0C99E60];
  -[SBAppUnderFloatingSwitcherSwitcherModifier appLayouts](self, "appLayouts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithObject:forKey:", v5, &unk_1E91D0FE0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)keyboardSuppressionMode
{
  return +[SBSwitcherKeyboardSuppressionMode suppressionModeForAllScenes](SBSwitcherKeyboardSuppressionMode, "suppressionModeForAllScenes");
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  return (SBSwitcherAsyncRenderingAttributes)SBSwitcherAsyncRenderingAttributesMake(1u, 0);
}

- (BOOL)wantsAsynchronousSurfaceRetentionAssertion
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end
