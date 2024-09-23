@implementation SBContinuousExposeToHomeSwitcherModifier

- (SBContinuousExposeToHomeSwitcherModifier)initWithTransitionID:(id)a3 direction:(int64_t)a4 continuousExposeModifier:(id)a5
{
  id v9;
  id v10;
  SBContinuousExposeToHomeSwitcherModifier *v11;
  SBHomeToGridSwitcherModifier *v12;
  id v13;
  SBHomeToGridSwitcherModifier *v14;
  void *v16;
  objc_super v17;

  v9 = a3;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SBContinuousExposeToHomeSwitcherModifier;
  v11 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v17, sel_initWithTransitionID_, v9);
  if (v11)
  {
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("SBContinuousExposeToHomeSwitcherModifier.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("continuousExposeModifier"));

    }
    v11->_direction = a4;
    objc_storeStrong((id *)&v11->_continuousExposeModifier, a5);
    v12 = [SBHomeToGridSwitcherModifier alloc];
    v13 = -[SBContinuousExposeToHomeSwitcherModifier _newContinuousExposeModifier](v11, "_newContinuousExposeModifier");
    v14 = -[SBHomeToSwitcherSwitcherModifier initWithTransitionID:direction:multitaskingModifier:](v12, "initWithTransitionID:direction:multitaskingModifier:", v9, a4 != 0, v13);

    -[SBChainableModifier addChildModifier:](v11, "addChildModifier:", v14);
  }

  return v11;
}

- (int64_t)headerStyleForIndex:(unint64_t)a3
{
  SBAppSwitcherContinuousExposeSwitcherModifier *continuousExposeModifier;
  int64_t v4;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  continuousExposeModifier = self->_continuousExposeModifier;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__SBContinuousExposeToHomeSwitcherModifier_headerStyleForIndex___block_invoke;
  v6[3] = &unk_1E8E9FD08;
  v6[4] = self;
  v6[5] = &v7;
  v6[6] = a3;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", continuousExposeModifier, v6);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __64__SBContinuousExposeToHomeSwitcherModifier_headerStyleForIndex___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 144), "headerStyleForIndex:", a1[6]);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  return result;
}

- (int64_t)shadowStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  SBAppSwitcherContinuousExposeSwitcherModifier *continuousExposeModifier;
  id v8;
  int64_t v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  int64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v6 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  continuousExposeModifier = self->_continuousExposeModifier;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __81__SBContinuousExposeToHomeSwitcherModifier_shadowStyleForLayoutRole_inAppLayout___block_invoke;
  v11[3] = &unk_1E8E9FD80;
  v13 = &v15;
  v14 = a3;
  v11[4] = self;
  v8 = v6;
  v12 = v8;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", continuousExposeModifier, v11);
  v9 = v16[3];

  _Block_object_dispose(&v15, 8);
  return v9;
}

uint64_t __81__SBContinuousExposeToHomeSwitcherModifier_shadowStyleForLayoutRole_inAppLayout___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 144), "shadowStyleForLayoutRole:inAppLayout:", a1[7], a1[5]);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

- (int64_t)homeScreenBackdropBlurType
{
  SBAppSwitcherContinuousExposeSwitcherModifier *continuousExposeModifier;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  continuousExposeModifier = self->_continuousExposeModifier;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__SBContinuousExposeToHomeSwitcherModifier_homeScreenBackdropBlurType__block_invoke;
  v5[3] = &unk_1E8E9DFA0;
  v5[4] = self;
  v5[5] = &v6;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", continuousExposeModifier, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __70__SBContinuousExposeToHomeSwitcherModifier_homeScreenBackdropBlurType__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "homeScreenBackdropBlurType");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (CGPoint)anchorPointForIndex:(unint64_t)a3
{
  BOOL v5;
  double v6;
  double v7;
  objc_super v8;
  CGPoint result;

  v5 = -[SBContinuousExposeToHomeSwitcherModifier _isEffectivelyHome](self, "_isEffectivelyHome");
  v6 = 0.5;
  v7 = 0.5;
  if (!v5)
  {
    v8.receiver = self;
    v8.super_class = (Class)SBContinuousExposeToHomeSwitcherModifier;
    -[SBContinuousExposeToHomeSwitcherModifier anchorPointForIndex:](&v8, sel_anchorPointForIndex_, a3, 0.5, 0.5);
  }
  result.y = v7;
  result.x = v6;
  return result;
}

- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3
{
  objc_super v6;

  if (-[SBContinuousExposeToHomeSwitcherModifier _isEffectivelyHome](self, "_isEffectivelyHome"))
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)SBContinuousExposeToHomeSwitcherModifier;
  return -[SBContinuousExposeToHomeSwitcherModifier shouldUseAnchorPointToPinLayoutRolesToSpace:](&v6, sel_shouldUseAnchorPointToPinLayoutRolesToSpace_, a3);
}

- (double)perspectiveAngleForAppLayout:(id)a3
{
  id v4;
  double v5;
  double v6;
  objc_super v8;

  v4 = a3;
  v5 = 0.0;
  if (!-[SBContinuousExposeToHomeSwitcherModifier _isEffectivelyHome](self, "_isEffectivelyHome"))
  {
    v8.receiver = self;
    v8.super_class = (Class)SBContinuousExposeToHomeSwitcherModifier;
    -[SBContinuousExposeToHomeSwitcherModifier perspectiveAngleForAppLayout:](&v8, sel_perspectiveAngleForAppLayout_, v4);
    v5 = v6;
  }

  return v5;
}

- (CGRect)adjustedSpaceAccessoryViewFrame:(CGRect)a3 forAppLayout:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v18;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  if (!-[SBContinuousExposeToHomeSwitcherModifier _isEffectivelyHome](self, "_isEffectivelyHome"))
  {
    v18.receiver = self;
    v18.super_class = (Class)SBContinuousExposeToHomeSwitcherModifier;
    -[SBContinuousExposeToHomeSwitcherModifier adjustedSpaceAccessoryViewFrame:forAppLayout:](&v18, sel_adjustedSpaceAccessoryViewFrame_forAppLayout_, v9, x, y, width, height);
    x = v10;
    y = v11;
    width = v12;
    height = v13;
  }

  v14 = x;
  v15 = y;
  v16 = width;
  v17 = height;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGPoint)adjustedSpaceAccessoryViewAnchorPoint:(CGPoint)a3 forAppLayout:(id)a4
{
  double y;
  double x;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = 0.5;
  v9 = 0.5;
  if (!-[SBContinuousExposeToHomeSwitcherModifier _isEffectivelyHome](self, "_isEffectivelyHome"))
  {
    v14.receiver = self;
    v14.super_class = (Class)SBContinuousExposeToHomeSwitcherModifier;
    -[SBContinuousExposeToHomeSwitcherModifier adjustedSpaceAccessoryViewAnchorPoint:forAppLayout:](&v14, sel_adjustedSpaceAccessoryViewAnchorPoint_forAppLayout_, v7, x, y);
    v8 = v10;
    v9 = v11;
  }

  v12 = v8;
  v13 = v9;
  result.y = v13;
  result.x = v12;
  return result;
}

- (id)_newContinuousExposeModifier
{
  return (id)-[SBAppSwitcherContinuousExposeSwitcherModifier copy](self->_continuousExposeModifier, "copy");
}

- (BOOL)_isEffectivelyHome
{
  BOOL v3;
  BOOL v4;

  if (-[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout"))
    v3 = self->_direction == 1;
  else
    v3 = 0;
  if (-[SBTransitionSwitcherModifier isUpdatingLayout](self, "isUpdatingLayout"))
    v4 = self->_direction == 0;
  else
    v4 = 0;
  return v3 || v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continuousExposeModifier, 0);
}

@end
