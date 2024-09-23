@implementation SBExitSlideOverPeekSwitcherModifier

- (SBExitSlideOverPeekSwitcherModifier)initWithTransitionID:(id)a3 floatingAppLayout:(id)a4 floatingConfiguration:(int64_t)a5
{
  id v9;
  id v10;
  SBExitSlideOverPeekSwitcherModifier *v11;
  SBExitSlideOverPeekSwitcherModifier *v12;
  void *v14;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBExitSlideOverPeekSwitcherModifier.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("floatingAppLayout"));

  }
  v15.receiver = self;
  v15.super_class = (Class)SBExitSlideOverPeekSwitcherModifier;
  v11 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v15, sel_initWithTransitionID_, v9);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_floatingAppLayout, a4);
    v12->_floatingConfiguration = a5;
  }

  return v12;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  objc_super v23;
  CGRect result;

  v23.receiver = self;
  v23.super_class = (Class)SBExitSlideOverPeekSwitcherModifier;
  -[SBExitSlideOverPeekSwitcherModifier frameForIndex:](&v23, sel_frameForIndex_);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[SBExitSlideOverPeekSwitcherModifier appLayouts](self, "appLayouts");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndex:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "isEqual:", self->_floatingAppLayout)
    && -[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase") >= 2)
  {
    -[SBExitSlideOverPeekSwitcherModifier floatingApplicationFrameInInterfaceOrientation:floatingConfiguration:](self, "floatingApplicationFrameInInterfaceOrientation:floatingConfiguration:", -[SBExitSlideOverPeekSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation"), self->_floatingConfiguration);
    v6 = v15;
    v8 = v16;
    v10 = v17;
    v12 = v18;
  }

  v19 = v6;
  v20 = v8;
  v21 = v10;
  v22 = v12;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingAppLayout, 0);
}

@end
