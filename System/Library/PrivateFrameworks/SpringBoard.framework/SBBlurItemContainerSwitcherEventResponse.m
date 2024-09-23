@implementation SBBlurItemContainerSwitcherEventResponse

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  -[SBChainableModifierEventResponse succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendSuper");
  -[SBBlurItemContainerSwitcherEventResponse shouldBlur](self, "shouldBlur");
  NSStringFromBOOL();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("blur"));

  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)shouldBlur
{
  return self->_shouldBlur;
}

- (SBBlurItemContainerParameters)blurParameters
{
  return self->_blurParameters;
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (int64_t)animationUpdateMode
{
  return self->_animationUpdateMode;
}

- (SBBlurItemContainerSwitcherEventResponse)initWithAppLayout:(id)a3 shouldBlur:(BOOL)a4 blurParameters:(id)a5 animationUpdateMode:(int64_t)a6
{
  id v11;
  id v12;
  SBBlurItemContainerSwitcherEventResponse *v13;
  SBBlurItemContainerSwitcherEventResponse *v14;
  objc_super v16;

  v11 = a3;
  v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SBBlurItemContainerSwitcherEventResponse;
  v13 = -[SBChainableModifierEventResponse init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_shouldBlur = a4;
    objc_storeStrong((id *)&v13->_appLayout, a3);
    objc_storeStrong((id *)&v14->_blurParameters, a5);
    v14->_animationUpdateMode = a6;
  }

  return v14;
}

- (int64_t)type
{
  return 20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurParameters, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
}

- (SBBlurItemContainerSwitcherEventResponse)initWithAppLayout:(id)a3 shouldBlur:(BOOL)a4 animationUpdateMode:(int64_t)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  SBBlurItemContainerSwitcherEventResponse *v10;

  v6 = a4;
  v8 = a3;
  +[SBBlurItemContainerParameters defaultCrossblurBlurParameters](SBBlurItemContainerParameters, "defaultCrossblurBlurParameters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SBBlurItemContainerSwitcherEventResponse initWithAppLayout:shouldBlur:blurParameters:animationUpdateMode:](self, "initWithAppLayout:shouldBlur:blurParameters:animationUpdateMode:", v8, v6, v9, a5);

  return v10;
}

@end
