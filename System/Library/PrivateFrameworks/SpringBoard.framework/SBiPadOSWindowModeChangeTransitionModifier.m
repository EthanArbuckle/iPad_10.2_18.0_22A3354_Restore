@implementation SBiPadOSWindowModeChangeTransitionModifier

- (SBiPadOSWindowModeChangeTransitionModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5
{
  id v10;
  id v11;
  SBiPadOSWindowModeChangeTransitionModifier *v12;
  void *v14;
  void *v15;
  objc_super v16;

  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SBiPadOSWindowModeChangeTransitionModifier;
  v12 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v16, sel_initWithTransitionID_, a3);
  if (v12)
  {
    if (v10)
    {
      if (v11)
      {
LABEL_4:
        objc_storeStrong((id *)&v12->_fromAppLayout, a4);
        objc_storeStrong((id *)&v12->_toAppLayout, a5);
        goto LABEL_5;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, CFSTR("SBiPadOSWindowModeChangeTransitionModifier.m"), 16, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fromAppLayout"));

      if (v11)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, CFSTR("SBiPadOSWindowModeChangeTransitionModifier.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("toAppLayout"));

    goto LABEL_4;
  }
LABEL_5:

  return v12;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  BOOL v7;
  objc_super v9;

  v6 = a4;
  if (-[SBAppLayout containsAnyItemFromAppLayout:](self->_fromAppLayout, "containsAnyItemFromAppLayout:", v6)
    || -[SBAppLayout containsAnyItemFromAppLayout:](self->_toAppLayout, "containsAnyItemFromAppLayout:", v6))
  {
    v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBiPadOSWindowModeChangeTransitionModifier;
    v7 = -[SBiPadOSWindowModeChangeTransitionModifier isLayoutRoleMatchMovedToScene:inAppLayout:](&v9, sel_isLayoutRoleMatchMovedToScene_inAppLayout_, a3, v6);
  }

  return v7;
}

- (unint64_t)maskedCornersForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  objc_super v9;

  -[SBiPadOSWindowModeChangeTransitionModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9.receiver = self;
  v9.super_class = (Class)SBiPadOSWindowModeChangeTransitionModifier;
  v7 = -[SBTransitionSwitcherModifier maskedCornersForIndex:](&v9, sel_maskedCornersForIndex_, a3);
  if (-[SBAppLayout isOrContainsAppLayout:](self->_toAppLayout, "isOrContainsAppLayout:", v6)
    && (!-[SBiPadOSWindowModeChangeTransitionModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled")|| -[SBiPadOSWindowModeChangeTransitionModifier appLayoutContainsAnUnoccludedMaximizedDisplayItem:](self, "appLayoutContainsAnUnoccludedMaximizedDisplayItem:", v6)))
  {
    v7 = 0;
  }

  return (unint64_t)v7;
}

- (SBAppLayout)fromAppLayout
{
  return self->_fromAppLayout;
}

- (SBAppLayout)toAppLayout
{
  return self->_toAppLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toAppLayout, 0);
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
}

@end
