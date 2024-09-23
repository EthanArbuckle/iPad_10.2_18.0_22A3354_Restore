@implementation SBOverrideContinuousExposeIdentifiersSwitcherModifier

- (SBOverrideContinuousExposeIdentifiersSwitcherModifier)initWithContinuousExposeIdentifiersInSwitcher:(id)a3 continuousExposeIdentifiersInStrip:(id)a4
{
  id v6;
  id v7;
  SBOverrideContinuousExposeIdentifiersSwitcherModifier *v8;
  uint64_t v9;
  NSArray *overrideContinuousExposeIdentifiersInSwitcher;
  uint64_t v11;
  NSArray *overrideContinuousExposeIdentifiersInStrip;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBOverrideContinuousExposeIdentifiersSwitcherModifier;
  v8 = -[SBSwitcherModifier init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    overrideContinuousExposeIdentifiersInSwitcher = v8->_overrideContinuousExposeIdentifiersInSwitcher;
    v8->_overrideContinuousExposeIdentifiersInSwitcher = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    overrideContinuousExposeIdentifiersInStrip = v8->_overrideContinuousExposeIdentifiersInStrip;
    v8->_overrideContinuousExposeIdentifiersInStrip = (NSArray *)v11;

  }
  return v8;
}

- (void)didMoveToParentModifier:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBOverrideContinuousExposeIdentifiersSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v5, sel_didMoveToParentModifier_);
  if (a3)
    -[SBOverrideContinuousExposeIdentifiersSwitcherModifier newContinuousExposeIdentifiersGenerationCount](self, "newContinuousExposeIdentifiersGenerationCount");
}

- (void)setState:(int64_t)a3
{
  int64_t v5;
  void *v6;
  void *v7;
  objc_super v8;

  v5 = -[SBChainableModifier state](self, "state");
  if (a3 == 1 && v5 != 1)
  {
    -[SBChainableModifier parentModifier](self, "parentModifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {

LABEL_6:
      -[SBOverrideContinuousExposeIdentifiersSwitcherModifier newContinuousExposeIdentifiersGenerationCount](self, "newContinuousExposeIdentifiersGenerationCount");
      goto LABEL_7;
    }
    -[SBChainableModifier delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      goto LABEL_6;
  }
LABEL_7:
  v8.receiver = self;
  v8.super_class = (Class)SBOverrideContinuousExposeIdentifiersSwitcherModifier;
  -[SBChainableModifier setState:](&v8, sel_setState_, a3);
}

- (id)continuousExposeIdentifiersInSwitcher
{
  NSArray *overrideContinuousExposeIdentifiersInSwitcher;
  objc_super v4;

  overrideContinuousExposeIdentifiersInSwitcher = self->_overrideContinuousExposeIdentifiersInSwitcher;
  if (overrideContinuousExposeIdentifiersInSwitcher)
    return overrideContinuousExposeIdentifiersInSwitcher;
  v4.receiver = self;
  v4.super_class = (Class)SBOverrideContinuousExposeIdentifiersSwitcherModifier;
  -[SBOverrideContinuousExposeIdentifiersSwitcherModifier continuousExposeIdentifiersInSwitcher](&v4, sel_continuousExposeIdentifiersInSwitcher);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)continuousExposeIdentifiersInStrip
{
  NSArray *overrideContinuousExposeIdentifiersInStrip;
  objc_super v4;

  overrideContinuousExposeIdentifiersInStrip = self->_overrideContinuousExposeIdentifiersInStrip;
  if (overrideContinuousExposeIdentifiersInStrip)
    return overrideContinuousExposeIdentifiersInStrip;
  v4.receiver = self;
  v4.super_class = (Class)SBOverrideContinuousExposeIdentifiersSwitcherModifier;
  -[SBOverrideContinuousExposeIdentifiersSwitcherModifier continuousExposeIdentifiersInStrip](&v4, sel_continuousExposeIdentifiersInStrip);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)overrideContinuousExposeIdentifiersInSwitcher
{
  return self->_overrideContinuousExposeIdentifiersInSwitcher;
}

- (NSArray)overrideContinuousExposeIdentifiersInStrip
{
  return self->_overrideContinuousExposeIdentifiersInStrip;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideContinuousExposeIdentifiersInStrip, 0);
  objc_storeStrong((id *)&self->_overrideContinuousExposeIdentifiersInSwitcher, 0);
}

@end
