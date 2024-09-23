@implementation SBContinuousExposeIdentifierSlideModifier

- (SBContinuousExposeIdentifierSlideModifier)initWithContinuousExposeIdentifier:(id)a3 previousContinuousExposeIdentifiersInSwitcher:(id)a4 previousContinuousExposeIdentifiersInStrip:(id)a5 direction:(unint64_t)a6
{
  id v11;
  id v12;
  id v13;
  SBContinuousExposeIdentifierSlideModifier *v14;
  uint64_t v15;
  NSString *continuousExposeIdentifier;
  uint64_t v17;
  NSArray *previousContinuousExposeIdentifiersInSwitcher;
  uint64_t v19;
  NSArray *previousContinuousExposeIdentifiersInStrip;
  void *v21;
  uint64_t v22;
  NSString *uniqueAnimationIdentifier;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v28.receiver = self;
  v28.super_class = (Class)SBContinuousExposeIdentifierSlideModifier;
  v14 = -[SBSwitcherModifier init](&v28, sel_init);
  if (v14)
  {
    if (v11)
    {
      if (v12)
        goto LABEL_4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, v14, CFSTR("SBContinuousExposeIdentifierSlideModifier.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("continuousExposeIdentifier"));

      if (v12)
      {
LABEL_4:
        if (v13)
        {
LABEL_5:
          v15 = objc_msgSend(v11, "copy");
          continuousExposeIdentifier = v14->_continuousExposeIdentifier;
          v14->_continuousExposeIdentifier = (NSString *)v15;

          v17 = objc_msgSend(v12, "copy");
          previousContinuousExposeIdentifiersInSwitcher = v14->_previousContinuousExposeIdentifiersInSwitcher;
          v14->_previousContinuousExposeIdentifiersInSwitcher = (NSArray *)v17;

          v19 = objc_msgSend(v13, "copy");
          previousContinuousExposeIdentifiersInStrip = v14->_previousContinuousExposeIdentifiersInStrip;
          v14->_previousContinuousExposeIdentifiersInStrip = (NSArray *)v19;

          v14->_direction = a6;
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "UUIDString");
          v22 = objc_claimAutoreleasedReturnValue();
          uniqueAnimationIdentifier = v14->_uniqueAnimationIdentifier;
          v14->_uniqueAnimationIdentifier = (NSString *)v22;

          goto LABEL_6;
        }
LABEL_9:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, v14, CFSTR("SBContinuousExposeIdentifierSlideModifier.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("previousContinuousExposeIdentifiersInStrip"));

        goto LABEL_5;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, v14, CFSTR("SBContinuousExposeIdentifierSlideModifier.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("previousContinuousExposeIdentifiersInSwitcher"));

    if (v13)
      goto LABEL_5;
    goto LABEL_9;
  }
LABEL_6:

  return v14;
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
  void *v15;
  void *v16;
  char v17;
  NSArray *previousContinuousExposeIdentifiersInSwitcher;
  NSArray *previousContinuousExposeIdentifiersInStrip;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  _QWORD v31[7];
  uint64_t v32;
  double *v33;
  uint64_t v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  CGRect result;

  v38.receiver = self;
  v38.super_class = (Class)SBContinuousExposeIdentifierSlideModifier;
  -[SBContinuousExposeIdentifierSlideModifier frameForIndex:](&v38, sel_frameForIndex_);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[SBContinuousExposeIdentifierSlideModifier appLayouts](self, "appLayouts");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndex:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "continuousExposeIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "isEqualToString:", self->_continuousExposeIdentifier))
  {
LABEL_12:

    goto LABEL_13;
  }
  -[SBContinuousExposeIdentifierSlideModifier appLayoutOnStage](self, "appLayoutOnStage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isOrContainsAppLayout:", v14);

  if ((v17 & 1) == 0)
  {
    if (self->_isWaitingToPrepareLayout && !self->_direction)
    {
LABEL_8:
      -[SBContinuousExposeIdentifierSlideModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stripWidth");
      v21 = v20;
      objc_msgSend(v15, "screenEdgePadding");
      v23 = v22;
      if ((-[SBContinuousExposeIdentifierSlideModifier isRTLEnabled](self, "isRTLEnabled") & 1) != 0)
      {
        -[SBContinuousExposeIdentifierSlideModifier containerViewBounds](self, "containerViewBounds");
        v26 = v21 + v23 + v24 + v25;
      }
      else
      {
        v26 = -(v21 + v23);
      }
      v6 = v26 + v10 * -0.5;
      goto LABEL_12;
    }
    if (self->_isWaitingToBeginAnimation && self->_direction == 1)
    {
      v32 = 0;
      v33 = (double *)&v32;
      v34 = 0x4010000000;
      v35 = &unk_1D0FA064E;
      v36 = 0u;
      v37 = 0u;
      previousContinuousExposeIdentifiersInSwitcher = self->_previousContinuousExposeIdentifiersInSwitcher;
      previousContinuousExposeIdentifiersInStrip = self->_previousContinuousExposeIdentifiersInStrip;
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __59__SBContinuousExposeIdentifierSlideModifier_frameForIndex___block_invoke;
      v31[3] = &unk_1E8E9FD08;
      v31[5] = &v32;
      v31[6] = a3;
      v31[4] = self;
      -[SBContinuousExposeIdentifierSlideModifier _performBlockWithIdentifiersInSwitcher:identifiersInStrip:block:](self, "_performBlockWithIdentifiersInSwitcher:identifiersInStrip:block:", previousContinuousExposeIdentifiersInSwitcher, previousContinuousExposeIdentifiersInStrip, v31);
      v8 = v33[5];
      v10 = v33[6];
      v12 = v33[7];
      _Block_object_dispose(&v32, 8);
      goto LABEL_8;
    }
  }
LABEL_13:

  v27 = v6;
  v28 = v8;
  v29 = v10;
  v30 = v12;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

id __59__SBContinuousExposeIdentifierSlideModifier_frameForIndex___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id result;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  v2 = *(_QWORD *)(a1 + 48);
  v9.receiver = *(id *)(a1 + 32);
  v9.super_class = (Class)SBContinuousExposeIdentifierSlideModifier;
  result = objc_msgSendSuper2(&v9, sel_frameForIndex_, v2);
  v4 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v4[4] = v5;
  v4[5] = v6;
  v4[6] = v7;
  v4[7] = v8;
  return result;
}

- (CGPoint)anchorPointForIndex:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  NSArray *previousContinuousExposeIdentifiersInSwitcher;
  NSArray *previousContinuousExposeIdentifiersInStrip;
  double v16;
  double v17;
  _QWORD v18[7];
  uint64_t v19;
  double *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  objc_super v25;
  CGPoint result;

  v25.receiver = self;
  v25.super_class = (Class)SBContinuousExposeIdentifierSlideModifier;
  -[SBContinuousExposeIdentifierSlideModifier anchorPointForIndex:](&v25, sel_anchorPointForIndex_);
  v6 = v5;
  v8 = v7;
  -[SBContinuousExposeIdentifierSlideModifier appLayouts](self, "appLayouts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "continuousExposeIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isEqualToString:", self->_continuousExposeIdentifier) & 1) != 0)
  {
    -[SBContinuousExposeIdentifierSlideModifier appLayoutOnStage](self, "appLayoutOnStage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isOrContainsAppLayout:", v10);

    if ((v13 & 1) == 0
      && (!self->_isWaitingToPrepareLayout || self->_direction)
      && self->_isWaitingToBeginAnimation
      && self->_direction == 1)
    {
      v19 = 0;
      v20 = (double *)&v19;
      v21 = 0x3010000000;
      v23 = 0;
      v24 = 0;
      v22 = &unk_1D0FA064E;
      previousContinuousExposeIdentifiersInSwitcher = self->_previousContinuousExposeIdentifiersInSwitcher;
      previousContinuousExposeIdentifiersInStrip = self->_previousContinuousExposeIdentifiersInStrip;
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __65__SBContinuousExposeIdentifierSlideModifier_anchorPointForIndex___block_invoke;
      v18[3] = &unk_1E8E9FD08;
      v18[5] = &v19;
      v18[6] = a3;
      v18[4] = self;
      -[SBContinuousExposeIdentifierSlideModifier _performBlockWithIdentifiersInSwitcher:identifiersInStrip:block:](self, "_performBlockWithIdentifiersInSwitcher:identifiersInStrip:block:", previousContinuousExposeIdentifiersInSwitcher, previousContinuousExposeIdentifiersInStrip, v18);
      v6 = v20[4];
      v8 = v20[5];
      _Block_object_dispose(&v19, 8);
    }
  }
  else
  {

  }
  v16 = v6;
  v17 = v8;
  result.y = v17;
  result.x = v16;
  return result;
}

id __65__SBContinuousExposeIdentifierSlideModifier_anchorPointForIndex___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v2 = *(_QWORD *)(a1 + 48);
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)SBContinuousExposeIdentifierSlideModifier;
  result = objc_msgSendSuper2(&v7, sel_anchorPointForIndex_, v2);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v4 + 32) = v5;
  *(_QWORD *)(v4 + 40) = v6;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  NSArray *previousContinuousExposeIdentifiersInSwitcher;
  NSArray *previousContinuousExposeIdentifiersInStrip;
  _QWORD v15[7];
  uint64_t v16;
  double *v17;
  uint64_t v18;
  uint64_t v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)SBContinuousExposeIdentifierSlideModifier;
  -[SBContinuousExposeIdentifierSlideModifier scaleForIndex:](&v20, sel_scaleForIndex_);
  v6 = v5;
  -[SBContinuousExposeIdentifierSlideModifier appLayouts](self, "appLayouts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "continuousExposeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqualToString:", self->_continuousExposeIdentifier) & 1) != 0)
  {
    -[SBContinuousExposeIdentifierSlideModifier appLayoutOnStage](self, "appLayoutOnStage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isOrContainsAppLayout:", v8);

    if ((v11 & 1) == 0
      && (!self->_isWaitingToPrepareLayout || self->_direction)
      && self->_isWaitingToBeginAnimation
      && self->_direction == 1)
    {
      v16 = 0;
      v17 = (double *)&v16;
      v18 = 0x2020000000;
      v19 = 0;
      previousContinuousExposeIdentifiersInSwitcher = self->_previousContinuousExposeIdentifiersInSwitcher;
      previousContinuousExposeIdentifiersInStrip = self->_previousContinuousExposeIdentifiersInStrip;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __59__SBContinuousExposeIdentifierSlideModifier_scaleForIndex___block_invoke;
      v15[3] = &unk_1E8E9FD08;
      v15[5] = &v16;
      v15[6] = a3;
      v15[4] = self;
      -[SBContinuousExposeIdentifierSlideModifier _performBlockWithIdentifiersInSwitcher:identifiersInStrip:block:](self, "_performBlockWithIdentifiersInSwitcher:identifiersInStrip:block:", previousContinuousExposeIdentifiersInSwitcher, previousContinuousExposeIdentifiersInStrip, v15);
      v6 = v17[3];
      _Block_object_dispose(&v16, 8);
    }
  }
  else
  {

  }
  return v6;
}

id __59__SBContinuousExposeIdentifierSlideModifier_scaleForIndex___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id result;
  uint64_t v4;
  objc_super v5;

  v2 = *(_QWORD *)(a1 + 48);
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)SBContinuousExposeIdentifierSlideModifier;
  result = objc_msgSendSuper2(&v5, sel_scaleForIndex_, v2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;
  return result;
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
  void *v18;
  void *v19;
  char v20;
  NSArray *previousContinuousExposeIdentifiersInSwitcher;
  NSArray *previousContinuousExposeIdentifiersInStrip;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  _QWORD v34[4];
  id v35;
  SBContinuousExposeIdentifierSlideModifier *v36;
  uint64_t *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  uint64_t v42;
  double *v43;
  uint64_t v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  objc_super v48;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v48.receiver = self;
  v48.super_class = (Class)SBContinuousExposeIdentifierSlideModifier;
  -[SBContinuousExposeIdentifierSlideModifier adjustedSpaceAccessoryViewFrame:forAppLayout:](&v48, sel_adjustedSpaceAccessoryViewFrame_forAppLayout_, v9, x, y, width, height);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(v9, "continuousExposeIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v18, "isEqualToString:", self->_continuousExposeIdentifier))
  {
LABEL_12:

    goto LABEL_13;
  }
  -[SBContinuousExposeIdentifierSlideModifier appLayoutOnStage](self, "appLayoutOnStage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isOrContainsAppLayout:", v9);

  if ((v20 & 1) == 0)
  {
    if (self->_isWaitingToPrepareLayout && !self->_direction)
    {
LABEL_8:
      -[SBContinuousExposeIdentifierSlideModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stripWidth");
      v24 = v23;
      objc_msgSend(v18, "screenEdgePadding");
      v26 = v25;
      if ((-[SBContinuousExposeIdentifierSlideModifier isRTLEnabled](self, "isRTLEnabled") & 1) != 0)
      {
        -[SBContinuousExposeIdentifierSlideModifier containerViewBounds](self, "containerViewBounds");
        v29 = v24 + v26 + v27 + v28;
      }
      else
      {
        v29 = -(v24 + v26);
      }
      v11 = v29 + v15 * -0.5;
      goto LABEL_12;
    }
    if (self->_isWaitingToBeginAnimation && self->_direction == 1)
    {
      v42 = 0;
      v43 = (double *)&v42;
      v44 = 0x4010000000;
      v45 = &unk_1D0FA064E;
      previousContinuousExposeIdentifiersInSwitcher = self->_previousContinuousExposeIdentifiersInSwitcher;
      previousContinuousExposeIdentifiersInStrip = self->_previousContinuousExposeIdentifiersInStrip;
      v46 = 0u;
      v47 = 0u;
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __90__SBContinuousExposeIdentifierSlideModifier_adjustedSpaceAccessoryViewFrame_forAppLayout___block_invoke;
      v34[3] = &unk_1E8E9FDF8;
      v37 = &v42;
      v38 = x;
      v39 = y;
      v40 = width;
      v41 = height;
      v35 = v9;
      v36 = self;
      -[SBContinuousExposeIdentifierSlideModifier _performBlockWithIdentifiersInSwitcher:identifiersInStrip:block:](self, "_performBlockWithIdentifiersInSwitcher:identifiersInStrip:block:", previousContinuousExposeIdentifiersInSwitcher, previousContinuousExposeIdentifiersInStrip, v34);
      v13 = v43[5];
      v15 = v43[6];
      v17 = v43[7];

      _Block_object_dispose(&v42, 8);
      goto LABEL_8;
    }
  }
LABEL_13:

  v30 = v11;
  v31 = v13;
  v32 = v15;
  v33 = v17;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

id __90__SBContinuousExposeIdentifierSlideModifier_adjustedSpaceAccessoryViewFrame_forAppLayout___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id result;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  v2 = *(_QWORD *)(a1 + 32);
  v9.receiver = *(id *)(a1 + 40);
  v9.super_class = (Class)SBContinuousExposeIdentifierSlideModifier;
  result = objc_msgSendSuper2(&v9, sel_adjustedSpaceAccessoryViewFrame_forAppLayout_, v2, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  v4 = *(_QWORD **)(*(_QWORD *)(a1 + 48) + 8);
  v4[4] = v5;
  v4[5] = v6;
  v4[6] = v7;
  v4[7] = v8;
  return result;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;
  objc_super v15;

  v4 = a3;
  v5 = v4;
  if (!self->_isWaitingToBeginAnimation
    || objc_msgSend(v4, "switcherLayoutElementType")
    || (-[SBContinuousExposeIdentifierSlideModifier appLayoutOnStage](self, "appLayoutOnStage"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isEqual:", v5),
        v6,
        (v7 & 1) != 0))
  {
    v14.receiver = self;
    v14.super_class = (Class)SBContinuousExposeIdentifierSlideModifier;
    -[SBContinuousExposeIdentifierSlideModifier animationAttributesForLayoutElement:](&v14, sel_animationAttributesForLayoutElement_, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)SBContinuousExposeIdentifierSlideModifier;
    -[SBContinuousExposeIdentifierSlideModifier animationAttributesForLayoutElement:](&v15, sel_animationAttributesForLayoutElement_, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v10, "mutableCopy");

    objc_msgSend(v8, "setLayoutUpdateMode:", 3);
    -[SBContinuousExposeIdentifierSlideModifier switcherSettings](self, "switcherSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "chamoisSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appToAppLayoutSettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLayoutSettings:", v13);

  }
  return v8;
}

- (id)handleContinuousExposeIdentifiersChangedEvent:(id)a3
{
  id v4;
  SBTimerEventSwitcherEventResponse *v5;
  int v6;
  unint64_t direction;
  SBUpdateLayoutSwitcherEventResponse *v8;
  void *v9;
  SBTimerEventSwitcherEventResponse *v10;
  void *v11;
  uint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SBContinuousExposeIdentifierSlideModifier;
  v4 = a3;
  -[SBSwitcherModifier handleContinuousExposeIdentifiersChangedEvent:](&v14, sel_handleContinuousExposeIdentifiersChangedEvent_, v4);
  v5 = (SBTimerEventSwitcherEventResponse *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isAnimated", v14.receiver, v14.super_class);

  if (v6)
  {
    direction = self->_direction;
    if (direction == 1)
    {
      if (!self->_isWaitingToBeginAnimation)
      {
        -[SBContinuousExposeIdentifierSlideModifier _beginAnimation](self, "_beginAnimation");
        v8 = (SBUpdateLayoutSwitcherEventResponse *)objc_claimAutoreleasedReturnValue();
        SBAppendSwitcherModifierResponse(v8, v5);
        v12 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
    }
    else if (!direction && !self->_isWaitingToPrepareLayout && !self->_isWaitingToBeginAnimation)
    {
      v8 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 2, 2);
      SBAppendSwitcherModifierResponse(v8, v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = [SBTimerEventSwitcherEventResponse alloc];
      -[SBContinuousExposeIdentifierSlideModifier _waitingToPrepareLayoutReason](self, "_waitingToPrepareLayoutReason");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[SBTimerEventSwitcherEventResponse initWithDelay:validator:reason:](v10, "initWithDelay:validator:reason:", 0, v11, 0.0);

      SBAppendSwitcherModifierResponse(v5, v9);
      v12 = objc_claimAutoreleasedReturnValue();

      self->_isWaitingToPrepareLayout = 1;
LABEL_9:

      v5 = (SBTimerEventSwitcherEventResponse *)v12;
    }
  }
  return v5;
}

- (id)handleTimerEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBContinuousExposeIdentifierSlideModifier;
  -[SBSwitcherModifier handleTimerEvent:](&v15, sel_handleTimerEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_direction
    && self->_isWaitingToPrepareLayout
    && (objc_msgSend(v4, "reason"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        -[SBContinuousExposeIdentifierSlideModifier _waitingToPrepareLayoutReason](self, "_waitingToPrepareLayoutReason"), v10 = (void *)objc_claimAutoreleasedReturnValue(), v11 = objc_msgSend(v9, "isEqualToString:", v10), v10, v9, v11))
  {
    self->_isWaitingToPrepareLayout = 0;
    -[SBContinuousExposeIdentifierSlideModifier _beginAnimation](self, "_beginAnimation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    SBAppendSwitcherModifierResponse(v12, v5);
    v13 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v13;
  }
  else if (self->_isWaitingToBeginAnimation)
  {
    objc_msgSend(v4, "reason");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBContinuousExposeIdentifierSlideModifier _waitingToAnimateReason](self, "_waitingToAnimateReason");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if (v8)
    {
      self->_isWaitingToBeginAnimation = 0;
      -[SBChainableModifier setState:](self, "setState:", 1);
    }
  }

  return v5;
}

- (id)_beginAnimation
{
  SBUpdateLayoutSwitcherEventResponse *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  SBTimerEventSwitcherEventResponse *v9;
  void *v10;
  SBTimerEventSwitcherEventResponse *v11;
  void *v12;

  v3 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 12, 3);
  -[SBContinuousExposeIdentifierSlideModifier switcherSettings](self, "switcherSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chamoisSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appToAppLayoutSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "response");
  v8 = v7 * 0.5;

  v9 = [SBTimerEventSwitcherEventResponse alloc];
  -[SBContinuousExposeIdentifierSlideModifier _waitingToAnimateReason](self, "_waitingToAnimateReason");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SBTimerEventSwitcherEventResponse initWithDelay:validator:reason:](v9, "initWithDelay:validator:reason:", 0, v10, v8);

  SBAppendSwitcherModifierResponse(v11, v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  self->_isWaitingToBeginAnimation = 1;
  return v12;
}

- (id)_waitingToPrepareLayoutReason
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-WaitingToPrepareLayout"), self->_uniqueAnimationIdentifier);
}

- (id)_waitingToAnimateReason
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-WaitingToAnimate"), self->_uniqueAnimationIdentifier);
}

- (void)_performBlockWithIdentifiersInSwitcher:(id)a3 identifiersInStrip:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  id v10;
  SBOverrideContinuousExposeIdentifiersSwitcherModifier *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[SBOverrideContinuousExposeIdentifiersSwitcherModifier initWithContinuousExposeIdentifiersInSwitcher:continuousExposeIdentifiersInStrip:]([SBOverrideContinuousExposeIdentifiersSwitcherModifier alloc], "initWithContinuousExposeIdentifiersInSwitcher:continuousExposeIdentifiersInStrip:", v10, v9);

  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", v11, v8);
}

- (NSString)continuousExposeIdentifier
{
  return self->_continuousExposeIdentifier;
}

- (NSArray)previousContinuousExposeIdentifiersInSwitcher
{
  return self->_previousContinuousExposeIdentifiersInSwitcher;
}

- (NSArray)previousContinuousExposeIdentifiersInStrip
{
  return self->_previousContinuousExposeIdentifiersInStrip;
}

- (unint64_t)direction
{
  return self->_direction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousContinuousExposeIdentifiersInStrip, 0);
  objc_storeStrong((id *)&self->_previousContinuousExposeIdentifiersInSwitcher, 0);
  objc_storeStrong((id *)&self->_continuousExposeIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueAnimationIdentifier, 0);
}

@end
