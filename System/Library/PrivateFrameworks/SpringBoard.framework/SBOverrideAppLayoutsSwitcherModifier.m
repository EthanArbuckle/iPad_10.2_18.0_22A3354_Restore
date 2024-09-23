@implementation SBOverrideAppLayoutsSwitcherModifier

- (SBOverrideAppLayoutsSwitcherModifier)initWithAppLayouts:(id)a3
{
  id v4;
  SBOverrideAppLayoutsSwitcherModifier *v5;
  uint64_t v6;
  NSArray *appLayouts;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBOverrideAppLayoutsSwitcherModifier;
  v5 = -[SBSwitcherModifier init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    appLayouts = v5->_appLayouts;
    v5->_appLayouts = (NSArray *)v6;

    v5->_appLayoutsGenerationCount = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (void)didMoveToParentModifier:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBOverrideAppLayoutsSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v5, sel_didMoveToParentModifier_);
  if (a3)
    self->_appLayoutsGenerationCount = -[SBOverrideAppLayoutsSwitcherModifier newAppLayoutsGenCount](self, "newAppLayoutsGenCount");
}

- (void)setState:(int64_t)a3
{
  int64_t v5;
  objc_super v6;

  v5 = -[SBChainableModifier state](self, "state");
  if (a3 == 1 && v5 != 1)
    -[SBOverrideAppLayoutsSwitcherModifier newAppLayoutsGenCount](self, "newAppLayoutsGenCount");
  v6.receiver = self;
  v6.super_class = (Class)SBOverrideAppLayoutsSwitcherModifier;
  -[SBChainableModifier setState:](&v6, sel_setState_, a3);
}

- (id)appLayouts
{
  return self->_appLayouts;
}

- (unint64_t)appLayoutsGenerationCount
{
  return self->_appLayoutsGenerationCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continuousExposeIdentifiers, 0);
  objc_storeStrong((id *)&self->_appLayouts, 0);
}

@end
