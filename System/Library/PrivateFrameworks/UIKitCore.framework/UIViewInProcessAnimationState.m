@implementation UIViewInProcessAnimationState

void __98__UIViewInProcessAnimationState__runActionForLayer_key_view_currentValueVector_targetValue_force___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(a2, "getValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 40);
  v15 = v7;
  v9 = v8;
  if (qword_1ECD7B040 != -1)
    dispatch_once(&qword_1ECD7B040, &__block_literal_global_162_2);
  objc_msgSend((id)qword_1ECD7B038, "objectForKeyedSubscript:", v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
  {
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v15);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = v15;
  }
  v13 = v12;

  objc_msgSend(v6, "getValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIView setPresentationValue:velocity:preferredFrameRateRangeMaximum:immediate:forKey:](v5, v13, v14, (int)*(float *)(a1 + 52), *(unsigned __int8 *)(a1 + 60), *(void **)(a1 + 40));
}

BOOL __98__UIViewInProcessAnimationState__runActionForLayer_key_view_currentValueVector_targetValue_force___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;
  void *v3;
  _BOOL8 v4;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (!*(_BYTE *)(v1 + 24))
    return 0;
  *(_BYTE *)(v1 + 24) = 0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_animationAndComposerGetter, 0);
}

- (BOOL)shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if (qword_1ECD7B030 != -1)
    dispatch_once(&qword_1ECD7B030, &__block_literal_global_646);
  if ((objc_msgSend((id)_MergedGlobals_11_16, "containsObject:", v4) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIViewInProcessAnimationState;
    v5 = -[UIViewAnimationState shouldAnimatePropertyWithKey:](&v7, sel_shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

- (id)actionForLayer:(id)a3 forKey:(id)a4 forView:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  UIViewBlockBasedCAAction *v14;
  void *v16;
  uint64_t v17;
  void *v18;
  UIViewBlockBasedCAAction *v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (qword_1ECD7B030 != -1)
    dispatch_once(&qword_1ECD7B030, &__block_literal_global_646);
  if (objc_msgSend((id)_MergedGlobals_11_16, "containsObject:", v9))
  {
    -[UIView animationInfoCreateIfNecessary:](v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "isPartOfHigherOrderProperty");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      objc_msgSend(v8, "valueForKeyPath:", v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIInterpolatedValue interpolatedWrapperForValue:key:](UIInterpolatedValue, "interpolatedWrapperForValue:key:", v16, v9);
      v17 = objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v18 = (void *)v17;
        v19 = [UIViewBlockBasedCAAction alloc];
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __63__UIViewInProcessAnimationState_actionForLayer_forKey_forView___block_invoke;
        v22[3] = &unk_1E16EA2B8;
        v22[4] = self;
        v23 = v10;
        v24 = v16;
        v25 = v18;
        v20 = v18;
        v21 = v16;
        v14 = -[UIViewBlockBasedCAAction initWithActionBlock:](v19, "initWithActionBlock:", v22);

        goto LABEL_6;
      }

    }
  }
  v14 = 0;
LABEL_6:

  return v14;
}

- (void)_runActionForLayer:(id)a3 key:(id)a4 view:(id)a5 currentValueVector:(id)a6 targetValue:(id)a7 force:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  BOOL v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  CAFrameRateRange v34;
  BOOL v35;
  _QWORD aBlock[5];
  id v37;
  id location;
  _QWORD v39[3];
  char v40;
  CAFrameRateRange preferredFrameRateRange;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  preferredFrameRateRange = self->super._preferredFrameRateRange;
  +[UIInterpolatedValue interpolatedWrapperForValue:key:](UIInterpolatedValue, "interpolatedWrapperForValue:key:", a7, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (a8
    || (objc_msgSend((id)objc_opt_class(), "epsilonCompatibleWithVector:", v17),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v20 = objc_msgSend(v17, "isApproximatelyEqualTo:withinEpsilon:", v18, v19),
        v19,
        (v20 & 1) == 0))
  {
    -[UIView animationInfoCreateIfNecessary:](v16, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "animatablePropertyForKey:createIfNecessary:", v15, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "context");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = MEMORY[0x1E0C809B0];
    v27 = v14;
    if (v23)
    {
      v25 = 0;
    }
    else
    {
      v39[0] = 0;
      v39[1] = v39;
      v39[2] = 0x2020000000;
      v40 = 1;
      objc_initWeak(&location, v14);
      aBlock[0] = v24;
      aBlock[1] = 3221225472;
      aBlock[2] = __98__UIViewInProcessAnimationState__runActionForLayer_key_view_currentValueVector_targetValue_force___block_invoke;
      aBlock[3] = &unk_1E16EA2E0;
      aBlock[4] = v39;
      objc_copyWeak(&v37, &location);
      v25 = _Block_copy(aBlock);
      objc_destroyWeak(&v37);
      objc_destroyWeak(&location);
      _Block_object_dispose(v39, 8);
    }
    v26 = self->_type == 2;
    v31[0] = v24;
    v31[1] = 3221225472;
    v31[2] = __98__UIViewInProcessAnimationState__runActionForLayer_key_view_currentValueVector_targetValue_force___block_invoke_2;
    v31[3] = &unk_1E16EA308;
    v32 = v16;
    v33 = v15;
    v34 = preferredFrameRateRange;
    v35 = v26;
    v28[0] = v24;
    v28[1] = 3221225472;
    v28[2] = __98__UIViewInProcessAnimationState__runActionForLayer_key_view_currentValueVector_targetValue_force___block_invoke_3;
    v28[3] = &unk_1E16B1B50;
    v29 = v32;
    v30 = v33;
    objc_msgSend(v22, "animatePropertyWithCurrentValue:targetValue:preTickShouldRemoveCallback:newValueCallback:removedCallback:", v17, v18, v25, v31, v28);

    v14 = v27;
  }

}

void __63__UIViewInProcessAnimationState_actionForLayer_forKey_forView___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(v5, "valueForKeyPath:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "_decomposeActionIfPossibleForLayer:key:view:currentValueVector:targetValue:", v5, v7, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v6) & 1) == 0)objc_msgSend(*(id *)(a1 + 32), "_runActionForLayer:key:view:currentValueVector:targetValue:force:", v5, v7, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), v6, 1);

}

- (BOOL)_decomposeActionIfPossibleForLayer:(id)a3 key:(id)a4 view:(id)a5 currentValueVector:(id)a6 targetValue:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  BOOL v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  UIViewInProcessAnimationState *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  UIViewInProcessAnimationState *v54;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if ((*((_BYTE *)&self->super + 173) & 2) != 0)
  {
    -[UIView animationInfoCreateIfNecessary:](v13, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "animatablePropertyForKey:createIfNecessary:", v12, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = 0;
    if (!v17)
    {
      if (objc_msgSend(v12, "isEqualToString:", CFSTR("position")))
      {
        objc_msgSend(v14, "CGPointValue");
        v19 = v18;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
        v20 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19);
        v21 = objc_claimAutoreleasedReturnValue();
        v65 = (void *)v20;
        +[UIInterpolatedValue interpolatedWrapperForValue:key:](UIInterpolatedValue, "interpolatedWrapperForValue:key:", v20, CFSTR("position.x"));
        v22 = objc_claimAutoreleasedReturnValue();
        v64 = (void *)v21;
        v23 = v21;
        v24 = (void *)v22;
        +[UIInterpolatedValue interpolatedWrapperForValue:key:](UIInterpolatedValue, "interpolatedWrapperForValue:key:", v23, CFSTR("position.y"));
        v25 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "valueForKeyPath:", v12);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "CGPointValue");
        v28 = v27;
        v30 = v29;

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v28);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v30);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIViewInProcessAnimationState _runActionForLayer:key:view:currentValueVector:targetValue:force:](self, "_runActionForLayer:key:view:currentValueVector:targetValue:force:", v11, CFSTR("position.x"), v13, v24, v31, 0);
        v33 = self;
        v34 = (void *)v25;
        -[UIViewInProcessAnimationState _runActionForLayer:key:view:currentValueVector:targetValue:force:](v33, "_runActionForLayer:key:view:currentValueVector:targetValue:force:", v11, CFSTR("position.y"), v13, v25, v32, 0);
      }
      else
      {
        if (!objc_msgSend(v12, "isEqualToString:", CFSTR("bounds")))
        {
          v15 = 0;
          goto LABEL_10;
        }
        objc_msgSend(v14, "rectValue");
        v36 = v35;
        v38 = v37;
        v40 = v39;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
        v41 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v36);
        v42 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v38);
        v61 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v40);
        v60 = objc_claimAutoreleasedReturnValue();
        v65 = (void *)v41;
        +[UIInterpolatedValue interpolatedWrapperForValue:key:](UIInterpolatedValue, "interpolatedWrapperForValue:key:", v41);
        v62 = objc_claimAutoreleasedReturnValue();
        v64 = (void *)v42;
        +[UIInterpolatedValue interpolatedWrapperForValue:key:](UIInterpolatedValue, "interpolatedWrapperForValue:key:", v42, CFSTR("bounds.origin.x"));
        v57 = objc_claimAutoreleasedReturnValue();
        +[UIInterpolatedValue interpolatedWrapperForValue:key:](UIInterpolatedValue, "interpolatedWrapperForValue:key:", v61, CFSTR("bounds.size.width"));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIInterpolatedValue interpolatedWrapperForValue:key:](UIInterpolatedValue, "interpolatedWrapperForValue:key:", v60, CFSTR("bounds.size.height"));
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "valueForKeyPath:", v12);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "CGRectValue");
        v45 = v44;
        v47 = v46;
        v49 = v48;
        v51 = v50;

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v45);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v47);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v49);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v51);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIViewInProcessAnimationState _runActionForLayer:key:view:currentValueVector:targetValue:force:](self, "_runActionForLayer:key:view:currentValueVector:targetValue:force:", v11, CFSTR("bounds.origin.x"), v13, v62, v58, 0);
        -[UIViewInProcessAnimationState _runActionForLayer:key:view:currentValueVector:targetValue:force:](self, "_runActionForLayer:key:view:currentValueVector:targetValue:force:", v11, CFSTR("bounds.origin.y"), v13, v57, v56, 0);
        -[UIViewInProcessAnimationState _runActionForLayer:key:view:currentValueVector:targetValue:force:](self, "_runActionForLayer:key:view:currentValueVector:targetValue:force:", v11, CFSTR("bounds.size.width"), v13, v63, v52, 0);
        v54 = self;
        v34 = (void *)v60;
        -[UIViewInProcessAnimationState _runActionForLayer:key:view:currentValueVector:targetValue:force:](v54, "_runActionForLayer:key:view:currentValueVector:targetValue:force:", v11, CFSTR("bounds.size.height"), v13, v59, v53, 0);

        v32 = (void *)v57;
        v24 = (void *)v61;

        v31 = (void *)v62;
      }

      v15 = 1;
    }
LABEL_10:

    goto LABEL_11;
  }
  v15 = 0;
LABEL_11:

  return v15;
}

uint64_t __157__UIViewInProcessAnimationState_animatePropertyWithCurrentValue_targetValue_preTickShouldRemoveCallback_newValueCallback_removedCallback_animatableProperty___block_invoke_6(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setOwnershipCount:", objc_msgSend(*(id *)(a1 + 32), "ownershipCount") - 1);
  return objc_msgSend(*(id *)(a1 + 32), "invalidateIfPossible");
}

- (void)animatePropertyWithCurrentValue:(id)a3 targetValue:(id)a4 preTickShouldRemoveCallback:(id)a5 newValueCallback:(id)a6 removedCallback:(id)a7 animatableProperty:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  int64_t type;
  uint64_t v19;
  UIViewInProcessAnimationState *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  BOOL v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  id v39;
  unsigned int updateReason;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  _QWORD v45[5];
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  uint64_t v53;
  float v54;
  unsigned int v55;
  BOOL v56;
  _QWORD aBlock[5];
  uint64_t v58;
  float preferred;

  v41 = a3;
  v39 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  type = self->_type;
  v58 = *(_QWORD *)&self->super._preferredFrameRateRange.minimum;
  updateReason = self->super._updateReason;
  preferred = self->super._preferredFrameRateRange.preferred;
  v19 = MEMORY[0x1E0C809B0];
  if (type == 3)
  {
    v23 = 0;
  }
  else
  {
    -[UIViewAnimationState _incrementDidEndCount](self, "_incrementDidEndCount");
    objc_msgSend(v17, "animationState");
    v20 = (UIViewInProcessAnimationState *)objc_claimAutoreleasedReturnValue();

    if (v20 != self)
    {
      objc_msgSend(v17, "animationState");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        objc_msgSend(v17, "animationState");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setRetargeted:", 1);

      }
      objc_msgSend(v17, "setAnimationState:", self);
    }
    aBlock[0] = v19;
    aBlock[1] = 3221225472;
    aBlock[2] = __157__UIViewInProcessAnimationState_animatePropertyWithCurrentValue_targetValue_preTickShouldRemoveCallback_newValueCallback_removedCallback_animatableProperty___block_invoke;
    aBlock[3] = &unk_1E16B3FD8;
    aBlock[4] = self;
    v23 = _Block_copy(aBlock);
  }
  v24 = v19;
  objc_msgSend(v17, "setOwnershipCount:", objc_msgSend(v17, "ownershipCount") + 1);
  if (!self->_animationAndComposerGetter)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIViewInProcessAnimationState.m"), 172, CFSTR("_animationAndComposerGetter must not be nil."));

  }
  v25 = type != 3;
  v45[0] = v24;
  v45[1] = 3221225472;
  v45[2] = __157__UIViewInProcessAnimationState_animatePropertyWithCurrentValue_targetValue_preTickShouldRemoveCallback_newValueCallback_removedCallback_animatableProperty___block_invoke_3;
  v45[3] = &unk_1E16EA268;
  v45[4] = self;
  v26 = v17;
  v46 = v26;
  v47 = v41;
  v48 = v39;
  v49 = v23;
  v56 = v25;
  v54 = preferred;
  v55 = updateReason;
  v50 = v14;
  v51 = v15;
  v52 = v16;
  v53 = v58;
  v27 = v16;
  v28 = v15;
  v29 = v14;
  v30 = v23;
  v31 = v39;
  v32 = v41;
  v33 = _Block_copy(v45);
  +[UIViewInProcessAnimationManager sharedManager](UIViewInProcessAnimationManager, "sharedManager");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v24;
  v42[1] = 3221225472;
  v42[2] = __157__UIViewInProcessAnimationState_animatePropertyWithCurrentValue_targetValue_preTickShouldRemoveCallback_newValueCallback_removedCallback_animatableProperty___block_invoke_7;
  v42[3] = &unk_1E16B1D18;
  v43 = v26;
  v44 = v33;
  v35 = v33;
  v36 = v26;
  objc_msgSend(v34, "_performWhenInProcessAnimationsTransactionCommits:", v42);

}

- (void)setRetargeted:(BOOL)a3
{
  self->_retargeted = a3;
}

void __157__UIViewInProcessAnimationState_animatePropertyWithCurrentValue_targetValue_preTickShouldRemoveCallback_newValueCallback_removedCallback_animatableProperty___block_invoke_4(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  char v7;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __157__UIViewInProcessAnimationState_animatePropertyWithCurrentValue_targetValue_preTickShouldRemoveCallback_newValueCallback_removedCallback_animatableProperty___block_invoke_5;
  v3[3] = &unk_1E16EA1C8;
  v4 = v2;
  v6 = *(id *)(a1 + 48);
  v5 = *(id *)(a1 + 40);
  v7 = *(_BYTE *)(a1 + 56);
  objc_msgSend(v4, "performWithLock:", v3);

}

void __157__UIViewInProcessAnimationState_animatePropertyWithCurrentValue_targetValue_preTickShouldRemoveCallback_newValueCallback_removedCallback_animatableProperty___block_invoke_7(uint64_t a1)
{
  id v2;
  _QWORD v3[4];
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "animationEntry");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __157__UIViewInProcessAnimationState_animatePropertyWithCurrentValue_targetValue_preTickShouldRemoveCallback_newValueCallback_removedCallback_animatableProperty___block_invoke_8;
    v3[3] = &unk_1E16EA290;
    v5 = *(id *)(a1 + 40);
    v4 = v2;
    objc_msgSend(v4, "performWithLock:", v3);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __157__UIViewInProcessAnimationState_animatePropertyWithCurrentValue_targetValue_preTickShouldRemoveCallback_newValueCallback_removedCallback_animatableProperty___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  if ((objc_msgSend(*(id *)(a1 + 32), "invalidated") & 1) == 0)
  {
    v2 = *(_QWORD *)(a1 + 48);
    if (v2)
      (*(void (**)(void))(v2 + 16))();
    objc_msgSend(*(id *)(a1 + 40), "setAnimationEntry:", 0);
    objc_msgSend(*(id *)(a1 + 32), "performCompletionCallbackFinished:", *(_BYTE *)(a1 + 56) == 0);
  }
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __157__UIViewInProcessAnimationState_animatePropertyWithCurrentValue_targetValue_preTickShouldRemoveCallback_newValueCallback_removedCallback_animatableProperty___block_invoke_6;
  v3[3] = &unk_1E16B1B28;
  v4 = *(id *)(a1 + 40);
  UIViewInProcessAnimationManagerDispatchAsyncOntoMainBeforeTickExit((uint64_t)v3);

}

uint64_t __157__UIViewInProcessAnimationState_animatePropertyWithCurrentValue_targetValue_preTickShouldRemoveCallback_newValueCallback_removedCallback_animatableProperty___block_invoke(uint64_t a1, char a2)
{
  _QWORD v3[5];
  char v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __157__UIViewInProcessAnimationState_animatePropertyWithCurrentValue_targetValue_preTickShouldRemoveCallback_newValueCallback_removedCallback_animatableProperty___block_invoke_2;
  v3[3] = &unk_1E16B1B78;
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = a2;
  return UIViewInProcessAnimationManagerDispatchAsyncOntoMainBeforeTickExit((uint64_t)v3);
}

uint64_t __98__UIViewInProcessAnimationState__runActionForLayer_key_view_currentValueVector_targetValue_force___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopSettingPresentationValueForKey:", *(_QWORD *)(a1 + 40));
}

void __157__UIViewInProcessAnimationState_animatePropertyWithCurrentValue_targetValue_preTickShouldRemoveCallback_newValueCallback_removedCallback_animatableProperty___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  UIViewRunningAnimationEntry *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  UIViewRunningAnimationEntry *v17;
  void *v18;
  void *v19;
  UIViewInProcessAnimationTickEntry *v20;
  uint64_t v21;
  uint64_t v22;
  UIViewRunningAnimationEntry *v23;
  double v24;
  double v25;
  double v26;
  UIViewInProcessAnimationTickEntry *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, char, double);
  void *v31;
  UIViewRunningAnimationEntry *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  _QWORD *v37;
  _QWORD v38[5];
  id v39;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 288);
  objc_msgSend(*(id *)(a1 + 40), "composer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIViewAnimationWithComposerWrapper instanceWithAnimation:composer:](_UIViewAnimationWithComposerWrapper, "instanceWithAnimation:composer:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD, _QWORD))(v7 + 16))(v7, v9, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "animation");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11 != v6)
  {

    if (!v5)
      goto LABEL_12;
    goto LABEL_11;
  }
  if (v5)
  {
    if (objc_msgSend(v5, "invalidated"))
    {

LABEL_11:
      objc_msgSend(v5, "performCompletionCallbackFinished:", 0);
      objc_msgSend(v5, "setInvalidated:", 1);
LABEL_12:
      v13 = [UIViewRunningAnimationEntry alloc];
      objc_msgSend(v10, "animation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(a1 + 64);
      objc_msgSend(v10, "composer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[UIViewRunningAnimationEntry initWithAnimation:completion:composer:](v13, "initWithAnimation:completion:composer:", v14, v15, v16);

      objc_msgSend(v10, "composer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setComposer:", v18);

      if (*(_BYTE *)(a1 + 112))
        -[UIViewRunningAnimationEntry setAnimationState:](v17, "setAnimationState:", *(_QWORD *)(a1 + 32));
      v38[0] = 0;
      v38[1] = v38;
      v38[2] = 0x3032000000;
      v38[3] = __Block_byref_object_copy__233;
      v38[4] = __Block_byref_object_dispose__233;
      v39 = 0;
      +[UIViewInProcessAnimationManager sharedManager](UIViewInProcessAnimationManager, "sharedManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = [UIViewInProcessAnimationTickEntry alloc];
      v21 = *(unsigned int *)(a1 + 108);
      v22 = objc_msgSend(*(id *)(a1 + 40), "isVelocityUsableForVFD");
      v28 = MEMORY[0x1E0C809B0];
      v29 = 3221225472;
      v30 = __157__UIViewInProcessAnimationState_animatePropertyWithCurrentValue_targetValue_preTickShouldRemoveCallback_newValueCallback_removedCallback_animatableProperty___block_invoke_14;
      v31 = &unk_1E16EA240;
      v23 = v17;
      v32 = v23;
      v34 = *(id *)(a1 + 72);
      v37 = v38;
      v35 = *(id *)(a1 + 80);
      v36 = *(id *)(a1 + 88);
      v33 = *(id *)(a1 + 40);
      LODWORD(v24) = *(_DWORD *)(a1 + 96);
      LODWORD(v25) = *(_DWORD *)(a1 + 100);
      LODWORD(v26) = *(_DWORD *)(a1 + 104);
      v27 = -[UIViewInProcessAnimationTickEntry initWithPreferredFrameRateRange:updateReason:velocityUsableForVFD:callback:](v20, "initWithPreferredFrameRateRange:updateReason:velocityUsableForVFD:callback:", v21, v22, &v28, v24, v25, v26);
      objc_msgSend(v19, "addEntry:", v27, v28, v29, v30, v31);

      objc_msgSend(*(id *)(a1 + 40), "setAnimationEntry:", v23);
      _Block_object_dispose(v38, 8);

      goto LABEL_15;
    }
    objc_msgSend(v5, "animationState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      goto LABEL_11;
  }
  else
  {

  }
  objc_msgSend(*(id *)(a1 + 40), "setOwnershipCount:", objc_msgSend(*(id *)(a1 + 40), "ownershipCount") - 1);
  if (*(_BYTE *)(a1 + 112))
  {
    objc_msgSend(v5, "performCompletionCallbackFinished:", 0);
    objc_msgSend(v5, "setCompletionCallback:", *(_QWORD *)(a1 + 64));
    objc_msgSend(v5, "setAnimationState:", *(_QWORD *)(a1 + 32));
  }
LABEL_15:

}

- (void)setAnimationAndComposerGetter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (UIViewInProcessAnimationState)init
{
  UIViewInProcessAnimationState *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIViewInProcessAnimationState;
  result = -[UIViewAnimationState init](&v3, sel_init);
  if (result)
    result->super._disallowInheritance = 1;
  return result;
}

- (void)setupWithDuration:(double)a3 delay:(double)a4 view:(id)a5 options:(unint64_t)a6 factory:(id)a7 parentState:(id)a8 start:(id)a9 completion:(id)a10
{
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UIViewInProcessAnimationState;
  -[UIViewAnimationState setupWithDuration:delay:view:options:factory:parentState:start:completion:](&v11, sel_setupWithDuration_delay_view_options_factory_parentState_start_completion_, a5, a6, a7, a8, a9, a10, a3, a4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(self->super._delegate, "_setForcingImmediateCompletion:", 1);
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (BOOL)retargeted
{
  return self->_retargeted;
}

uint64_t __157__UIViewInProcessAnimationState_animatePropertyWithCurrentValue_targetValue_preTickShouldRemoveCallback_newValueCallback_removedCallback_animatableProperty___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_animationDidStopWithNilAnimationFinished:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __157__UIViewInProcessAnimationState_animatePropertyWithCurrentValue_targetValue_preTickShouldRemoveCallback_newValueCallback_removedCallback_animatableProperty___block_invoke_8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2);
}

+ (BOOL)isKeySupported:(id)a3
{
  uint64_t v3;
  id v4;
  char v5;

  v3 = qword_1ECD7B030;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_1ECD7B030, &__block_literal_global_646);
  v5 = objc_msgSend((id)_MergedGlobals_11_16, "containsObject:", v4);

  return v5;
}

uint64_t __157__UIViewInProcessAnimationState_animatePropertyWithCurrentValue_targetValue_preTickShouldRemoveCallback_newValueCallback_removedCallback_animatableProperty___block_invoke_14(uint64_t a1, char a2, double a3)
{
  float v6;
  void *v7;
  double v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  double v21;
  char v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v6 = UIAnimationDragCoefficient();
  v25 = 0x2020000000;
  v13[1] = 3221225472;
  v23 = 0;
  v24 = &v23;
  v26 = 0;
  v7 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[2] = __157__UIViewInProcessAnimationState_animatePropertyWithCurrentValue_targetValue_preTickShouldRemoveCallback_newValueCallback_removedCallback_animatableProperty___block_invoke_2_15;
  v13[3] = &unk_1E16EA218;
  v8 = a3 / v6;
  v22 = a2;
  v14 = v7;
  v19 = &v23;
  v9 = *(id *)(a1 + 48);
  v21 = v8;
  v10 = *(_QWORD *)(a1 + 72);
  v16 = v9;
  v20 = v10;
  v17 = *(id *)(a1 + 56);
  v18 = *(id *)(a1 + 64);
  v15 = *(id *)(a1 + 40);
  objc_msgSend(v14, "performWithLock:", v13);
  v11 = *((unsigned __int8 *)v24 + 24);

  _Block_object_dispose(&v23, 8);
  return v11;
}

void __157__UIViewInProcessAnimationState_animatePropertyWithCurrentValue_targetValue_preTickShouldRemoveCallback_newValueCallback_removedCallback_animatableProperty___block_invoke_2_15(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  char v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "invalidated") & 1) != 0
    || *(_BYTE *)(a1 + 96)
    || (v6 = *(_QWORD *)(a1 + 48)) != 0 && (*(unsigned int (**)(void))(v6 + 16))())
  {
    v4 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
  }
  else
  {
    objc_msgSend(v3, "stepWithDelta:", *(double *)(a1 + 88));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v3, "isStable");
    if ((v8 & 1) != 0)
    {
      objc_msgSend(v3, "targetValue");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "zeroCompatibleWithVector:", v9);
    }
    else
    {
      v9 = v7;
      objc_msgSend(v3, "velocity");
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v8;
    if (v9)
    {
      v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
      if (!v11 || (objc_msgSend(v11, "isEqual:", v9) & 1) == 0)
      {
        +[UIViewInProcessAnimationManager sharedManager](UIViewInProcessAnimationManager, "sharedManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __157__UIViewInProcessAnimationState_animatePropertyWithCurrentValue_targetValue_preTickShouldRemoveCallback_newValueCallback_removedCallback_animatableProperty___block_invoke_3_16;
        v22[3] = &unk_1E16BB458;
        v25 = *(id *)(a1 + 56);
        v23 = v9;
        v24 = v10;
        objc_msgSend(v12, "performAfterTick:", v22);

      }
      v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
      if (v13)
      {
        objc_msgSend(v13, "reinitWithVector:", v9);
      }
      else
      {
        v14 = objc_msgSend(v9, "copy");
        v15 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
        v16 = *(void **)(v15 + 40);
        *(_QWORD *)(v15 + 40) = v14;

      }
    }

    v4 = 0;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    +[UIViewInProcessAnimationManager sharedManager](UIViewInProcessAnimationManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __157__UIViewInProcessAnimationState_animatePropertyWithCurrentValue_targetValue_preTickShouldRemoveCallback_newValueCallback_removedCallback_animatableProperty___block_invoke_4;
    v17[3] = &unk_1E16EA1F0;
    v18 = *(id *)(a1 + 32);
    v20 = *(id *)(a1 + 64);
    v19 = *(id *)(a1 + 40);
    v21 = v4;
    objc_msgSend(v5, "performAfterTick:", v17);

  }
}

uint64_t __157__UIViewInProcessAnimationState_animatePropertyWithCurrentValue_targetValue_preTickShouldRemoveCallback_newValueCallback_removedCallback_animatableProperty___block_invoke_3_16(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)animatePropertyWithKey:(id)a3 view:(id)a4 forceNew:(BOOL)a5 currentValue:(id)a6 targetValue:(id)a7 preTickShouldRemoveCallback:(id)a8 newValueCallback:(id)a9 removedCallback:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;

  v16 = a10;
  v17 = a9;
  v18 = a8;
  v19 = a7;
  v20 = a6;
  v21 = a3;
  -[UIView animationInfoCreateIfNecessary:](a4, 1);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "animatablePropertyForKey:createIfNecessary:", v21, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIViewInProcessAnimationState animatePropertyWithCurrentValue:targetValue:preTickShouldRemoveCallback:newValueCallback:removedCallback:animatableProperty:](self, "animatePropertyWithCurrentValue:targetValue:preTickShouldRemoveCallback:newValueCallback:removedCallback:animatableProperty:", v20, v19, v18, v17, v16, v22);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(sel_retargeted);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  NSStringFromSelector(sel_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDescriptionBuilder descriptionForObject:keys:](UIDescriptionBuilder, "descriptionForObject:keys:", self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isInProcess
{
  return 1;
}

- (id)animationAndComposerGetter
{
  return self->_animationAndComposerGetter;
}

- (int64_t)type
{
  return self->_type;
}

@end
