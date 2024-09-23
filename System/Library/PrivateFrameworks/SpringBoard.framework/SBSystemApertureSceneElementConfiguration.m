@implementation SBSystemApertureSceneElementConfiguration

- (SBSystemApertureSceneElementConfiguration)init
{
  SBSystemApertureSceneElementConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBSystemApertureSceneElementConfiguration;
  result = -[SBSystemApertureSceneElementConfiguration init](&v3, sel_init);
  if (result)
  {
    result->_maximumHeight = *(double *)MEMORY[0x1E0CEBDE0];
    result->_minimalPresentationPossible = 1;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[SBSystemApertureSceneElementConfiguration maximumHeight](self, "maximumHeight");
  objc_msgSend(v4, "setMaximumHeight:");
  objc_msgSend(v4, "setAllowsSceneReactivation:", -[SBSystemApertureSceneElementConfiguration allowsSceneReactivation](self, "allowsSceneReactivation"));
  objc_msgSend(v4, "setEntersBackgroundWhenBacklightIsOff:", -[SBSystemApertureSceneElementConfiguration entersBackgroundWhenBacklightIsOff](self, "entersBackgroundWhenBacklightIsOff"));
  objc_msgSend(v4, "setMinimalPresentationPossible:", -[SBSystemApertureSceneElementConfiguration isMinimalPresentationPossible](self, "isMinimalPresentationPossible"));
  return v4;
}

- (NSString)description
{
  return (NSString *)-[SBSystemApertureSceneElementConfiguration descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBSystemApertureSceneElementConfiguration succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBSystemApertureSceneElementConfiguration descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SBSystemApertureSceneElementConfiguration *v11;

  v4 = a3;
  -[SBSystemApertureSceneElementConfiguration succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __83__SBSystemApertureSceneElementConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8E9E820;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

id __83__SBSystemApertureSceneElementConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id result;
  double v6;
  void *v7;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 40), "allowsSceneReactivation"), CFSTR("allowsSceneReactivation"), 1);
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 40), "entersBackgroundWhenBacklightIsOff"), CFSTR("entersBackgroundWhenBacklightIsOff"), 1);
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 40), "isMinimalPresentationPossible"), CFSTR("isMinimalPresentationPossible"), 1);
  result = (id)objc_msgSend(*(id *)(a1 + 40), "maximumHeight");
  if (v6 != *MEMORY[0x1E0CEBDE0])
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "maximumHeight");
    return (id)objc_msgSend(v7, "appendFloat:withName:", CFSTR("maximumHeight"));
  }
  return result;
}

- (BOOL)allowsSceneReactivation
{
  return self->_allowsSceneReactivation;
}

- (void)setAllowsSceneReactivation:(BOOL)a3
{
  self->_allowsSceneReactivation = a3;
}

- (BOOL)entersBackgroundWhenBacklightIsOff
{
  return self->_entersBackgroundWhenBacklightIsOff;
}

- (void)setEntersBackgroundWhenBacklightIsOff:(BOOL)a3
{
  self->_entersBackgroundWhenBacklightIsOff = a3;
}

- (BOOL)isMinimalPresentationPossible
{
  return self->_minimalPresentationPossible;
}

- (void)setMinimalPresentationPossible:(BOOL)a3
{
  self->_minimalPresentationPossible = a3;
}

- (double)maximumHeight
{
  return self->_maximumHeight;
}

- (void)setMaximumHeight:(double)a3
{
  self->_maximumHeight = a3;
}

@end
