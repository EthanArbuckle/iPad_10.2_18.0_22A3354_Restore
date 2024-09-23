@implementation SBScrollingSwitcherModifier

- (id)handleScrollEvent:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  if (objc_msgSend(v4, "phase") == 1)
    -[SBChainableModifier setState:](self, "setState:", 1);
  v7.receiver = self;
  v7.super_class = (Class)SBScrollingSwitcherModifier;
  -[SBSwitcherModifier handleScrollEvent:](&v7, sel_handleScrollEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBScrollingSwitcherModifier;
  -[SBScrollingSwitcherModifier animationAttributesForLayoutElement:](&v6, sel_animationAttributesForLayoutElement_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(objc_msgSend(v3, "updateMode") - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v4 = (void *)objc_msgSend(v3, "mutableCopy");
    objc_msgSend(v4, "setUpdateMode:", 2);

    v3 = v4;
  }
  return v3;
}

- (id)handleRemovalEvent:(id)a3
{
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBScrollingSwitcherModifier;
  -[SBSwitcherModifier handleRemovalEvent:](&v6, sel_handleRemovalEvent_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBChainableModifier setState:](self, "setState:", 1);
  return v4;
}

@end
