@implementation SBPeekToOffscreenSwitcherModifier

- (SBPeekToOffscreenSwitcherModifier)initWithTransitionID:(id)a3 peekingAppLayout:(id)a4 peekConfiguration:(int64_t)a5 spaceConfiguration:(int64_t)a6
{
  id v11;
  id v12;
  SBPeekToOffscreenSwitcherModifier *v13;
  SBPeekToOffscreenSwitcherModifier *v14;
  void *v16;
  void *v17;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPeekToOffscreenSwitcherModifier.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("peekingAppLayout"));

  }
  if (!SBPeekConfigurationIsValid(a5))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPeekToOffscreenSwitcherModifier.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("SBPeekConfigurationIsValid(peekConfiguration)"));

  }
  v18.receiver = self;
  v18.super_class = (Class)SBPeekToOffscreenSwitcherModifier;
  v13 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v18, sel_initWithTransitionID_, v11);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_peekingAppLayout, a4);
    v14->_peekConfiguration = a5;
    v14->_spaceConfiguration = a6;
  }

  return v14;
}

- (void)setState:(int64_t)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBPeekToOffscreenSwitcherModifier;
  -[SBChainableModifier setState:](&v3, sel_setState_, a3);
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  void *v5;
  SBAppLayout *v6;
  uint64_t v7;
  SBAppLayout *v8;
  void *v9;
  SBAppLayout *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  SBDisplayItem *v23;
  int64_t peekConfiguration;
  uint64_t v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  char v30;
  int64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  SBAppLayout *v36;
  void *v37;
  void *v38;
  void *v39;
  objc_super v40;
  objc_super v41;
  objc_super v42;
  _QWORD v43[2];
  _QWORD v44[2];
  void *v45;
  _QWORD v46[3];
  CGRect result;

  v46[1] = *MEMORY[0x1E0C80C00];
  -[SBPeekToOffscreenSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();

  if (v6 == self->_peekingAppLayout && -[SBTransitionSwitcherModifier isUpdatingLayout](self, "isUpdatingLayout"))
  {
    v7 = 1;
    -[SBAppLayout itemForLayoutRole:](self->_peekingAppLayout, "itemForLayoutRole:", 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_spaceConfiguration == 1)
    {
      v8 = [SBAppLayout alloc];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v38;
      v46[0] = v39;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[SBAppLayout initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:](v8, "initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:", v9, 1, -[SBAppLayout environment](self->_peekingAppLayout, "environment"), -[SBPeekToOffscreenSwitcherModifier displayOrdinal](self, "displayOrdinal"));
    }
    else
    {
      v23 = -[SBDisplayItem initWithType:bundleIdentifier:uniqueIdentifier:]([SBDisplayItem alloc], "initWithType:bundleIdentifier:uniqueIdentifier:", 0, CFSTR("SBPeekToOffscreenSwitcherModifier-placeholder"), &stru_1E8EC7EC0);
      -[SBAppLayout itemForLayoutRole:](self->_peekingAppLayout, "itemForLayoutRole:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      peekConfiguration = self->_peekConfiguration;
      if (peekConfiguration == 2)
        v25 = 2;
      else
        v25 = 1;
      if (peekConfiguration != 2)
        v7 = 2;
      v36 = [SBAppLayout alloc];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = v37;
      v44[0] = v9;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v43[1] = v26;
      v38 = v23;
      v44[1] = v23;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[SBAppLayout initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:](v36, "initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:", v27, SBAppLayoutConfigurationFromMainDisplayLayoutStateSpaceConfiguration(self->_spaceConfiguration), -[SBAppLayout environment](self->_peekingAppLayout, "environment"), -[SBPeekToOffscreenSwitcherModifier displayOrdinal](self, "displayOrdinal"));

    }
    v42.receiver = self;
    v42.super_class = (Class)SBPeekToOffscreenSwitcherModifier;
    -[SBPeekToOffscreenSwitcherModifier frameForIndex:](&v42, sel_frameForIndex_, a3);
    SBRectWithSize();
    v41.receiver = self;
    v41.super_class = (Class)SBPeekToOffscreenSwitcherModifier;
    -[SBPeekToOffscreenSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v41, sel_frameForLayoutRole_inAppLayout_withBounds_, v7, v10);
    SBRectWithSize();
    v16 = v28;
    v18 = v29;
    v30 = -[SBPeekToOffscreenSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
    v31 = self->_peekConfiguration;
    if ((v30 & 1) != 0)
    {
      if (v31 != 3)
      {
LABEL_15:
        -[SBPeekToOffscreenSwitcherModifier containerViewBounds](self, "containerViewBounds");
        v12 = v32 + v33;
LABEL_18:
        -[SBPeekToOffscreenSwitcherModifier containerViewBounds](self, "containerViewBounds");
        v14 = v35;

        goto LABEL_6;
      }
    }
    else if (v31 != 2)
    {
      goto LABEL_15;
    }
    -[SBPeekToOffscreenSwitcherModifier containerViewBounds](self, "containerViewBounds");
    v12 = v34 - v16;
    goto LABEL_18;
  }
  v40.receiver = self;
  v40.super_class = (Class)SBPeekToOffscreenSwitcherModifier;
  -[SBPeekToOffscreenSwitcherModifier frameForIndex:](&v40, sel_frameForIndex_, a3);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
LABEL_6:

  v19 = v12;
  v20 = v14;
  v21 = v16;
  v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  double result;
  objc_super v6;

  if (self->_peekingAppLayout == a4)
    return 1.0;
  v6.receiver = self;
  v6.super_class = (Class)SBPeekToOffscreenSwitcherModifier;
  -[SBPeekToOffscreenSwitcherModifier opacityForLayoutRole:inAppLayout:atIndex:](&v6, sel_opacityForLayoutRole_inAppLayout_atIndex_, a3);
  return result;
}

- (BOOL)isSwitcherWindowVisible
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peekingAppLayout, 0);
}

@end
