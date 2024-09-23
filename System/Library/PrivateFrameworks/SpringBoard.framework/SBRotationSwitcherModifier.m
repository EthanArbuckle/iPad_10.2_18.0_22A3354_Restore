@implementation SBRotationSwitcherModifier

- (SBRotationSwitcherModifier)initWithTransitionID:(id)a3 appLayout:(id)a4 fromInterfaceOrientation:(int64_t)a5 toInterfaceOrientation:(int64_t)a6
{
  id v12;
  SBRotationSwitcherModifier *v13;
  void *v15;
  objc_super v16;

  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SBRotationSwitcherModifier;
  v13 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v16, sel_initWithTransitionID_, a3);
  if (v13)
  {
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("SBRotationSwitcherModifier.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appLayout"));

    }
    objc_storeStrong((id *)&v13->_appLayout, a4);
    v13->_fromInterfaceOrientation = a5;
    v13->_toInterfaceOrientation = a6;
  }

  return v13;
}

- (id)transitionWillBegin
{
  void *v3;
  SBUpdateLayoutSwitcherEventResponse *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBRotationSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillBegin](&v7, sel_transitionWillBegin);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBRotationSwitcherModifier appLayoutRequiresLegacyRotationSupport:](self, "appLayoutRequiresLegacyRotationSupport:", self->_appLayout))
  {
    v4 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 4, 1);
    SBAppendSwitcherModifierResponse(v4, v3);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  return v3;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBRotationSwitcherModifier;
  -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v6, sel_animationAttributesForLayoutElement_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setUpdateMode:", 1);
  return v4;
}

- (double)rotationAngleForIndex:(unint64_t)a3
{
  double result;
  objc_super v6;

  if (-[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase") == 1)
  {
    SBFAngleForRotationFromInterfaceOrientationToInterfaceOrientation();
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SBRotationSwitcherModifier;
    -[SBRotationSwitcherModifier rotationAngleForIndex:](&v6, sel_rotationAngleForIndex_, a3);
  }
  return result;
}

- (BOOL)shouldPerformRotationAnimationForOrientationChange
{
  return 1;
}

- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3
{
  objc_super v4;

  if (self->_shouldNotUseAnchorPointToPinLayoutRolesToSpace)
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)SBRotationSwitcherModifier;
  return -[SBRotationSwitcherModifier shouldUseAnchorPointToPinLayoutRolesToSpace:](&v4, sel_shouldUseAnchorPointToPinLayoutRolesToSpace_, a3);
}

- (BOOL)requireStripContentsInViewHierarchy
{
  return 0;
}

- (id)appLayoutsToResignActive
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (id)keyboardSuppressionMode
{
  return +[SBSwitcherKeyboardSuppressionMode suppressionModeNone](SBSwitcherKeyboardSuppressionMode, "suppressionModeNone");
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  return (SBSwitcherAsyncRenderingAttributes)SBSwitcherAsyncRenderingAttributesMake(0, 0);
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (int64_t)fromInterfaceOrientation
{
  return self->_fromInterfaceOrientation;
}

- (int64_t)toInterfaceOrientation
{
  return self->_toInterfaceOrientation;
}

- (BOOL)shouldNotUseAnchorPointToPinLayoutRolesToSpace
{
  return self->_shouldNotUseAnchorPointToPinLayoutRolesToSpace;
}

- (void)setShouldNotUseAnchorPointToPinLayoutRolesToSpace:(BOOL)a3
{
  self->_shouldNotUseAnchorPointToPinLayoutRolesToSpace = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end
