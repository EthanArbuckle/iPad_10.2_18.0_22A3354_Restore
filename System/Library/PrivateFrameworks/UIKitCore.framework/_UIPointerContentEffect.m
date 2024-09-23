@implementation _UIPointerContentEffect

- (_UIPointerContentEffect)initWithStyle:(id)a3 region:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id location;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (self)
  {
    if (objc_msgSend(v7, "type") != 1
      || (objc_msgSend(v7, "targetedPreview"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, !v9))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v7, "type");
      objc_msgSend(v7, "targetedPreview");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPointerContentEffect.m"), 110, CFSTR("Attempting to create a _UIPointerContentEffect with an incompatible style! type: %lu, preview: %@"), v11, v12);

    }
    -[_UIPointerContentEffect _setStyle:andRegion:](self, "_setStyle:andRegion:", v7, v8);
    v13 = (void *)objc_opt_new();
    -[_UIPointerContentEffect setLiftProgressProperty:](self, "setLiftProgressProperty:", v13);

    -[_UIPointerContentEffect liftProgressProperty](self, "liftProgressProperty");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setValue:", 1.0);

    objc_initWeak(&location, self);
    -[_UIPointerContentEffect liftProgressProperty](self, "liftProgressProperty");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __48___UIPointerContentEffect_initWithStyle_region___block_invoke;
    v18[3] = &unk_1E16B3F40;
    objc_copyWeak(&v19, &location);
    +[UIView _createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:](UIView, "_createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:", v16, v18);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return self;
}

- (void)dealloc
{
  objc_super v3;

  -[_UIPointerContentEffect _cleanUpObservation](self, "_cleanUpObservation");
  v3.receiver = self;
  v3.super_class = (Class)_UIPointerContentEffect;
  -[_UIPointerContentEffect dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "region");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPointerContentEffect region](self, "region");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[_UIPointerContentEffect region](self, "region");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (void)_setStyle:(id)a3 andRegion:(id)a4
{
  id v6;

  v6 = a4;
  -[_UIPointerContentEffect setStyle:](self, "setStyle:", a3);
  -[_UIPointerContentEffect setRegion:](self, "setRegion:", v6);

  if (-[_UIPointerContentEffect state](self, "state") == 1)
    -[_UIPointerContentEffect _commitPointerStyleToArbiterWithCompletion:](self, "_commitPointerStyleToArbiterWithCompletion:", 0);
}

- (void)setStyle:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqual:", self->_style) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_style, a3);
    -[_UIPointerContentEffect platterView](self, "platterView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPointerContentEffect _updatePlatterView:forStyle:](self, "_updatePlatterView:forStyle:", v5, self->_style);

  }
}

- (void)_updatePlatterView:(id)a3 forStyle:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double x;
  double y;
  double width;
  double height;
  double v19;
  void *v20;
  void *v21;
  uint64_t v22;
  int v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  CGAffineTransform v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "targetedPreview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTargetedPreview:", v7);
  if ((objc_msgSend(v6, "options") & 0x400) != 0)
  {
    objc_msgSend(v7, "_frame");
    v8 = -CGRectGetMinX(v29);
    objc_msgSend(v7, "_frame");
    v9 = -CGRectGetMinY(v30);
    objc_msgSend(v6, "pointerShape");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v10, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v12, "copy");

      CGAffineTransformMakeTranslation(&v28, v8, v9);
      objc_msgSend(v13, "applyTransform:", &v28);
      +[UIPointerShape shapeWithPath:](UIPointerShape, "shapeWithPath:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v10, "rect");
      v32 = CGRectOffset(v31, v8, v9);
      x = v32.origin.x;
      y = v32.origin.y;
      width = v32.size.width;
      height = v32.size.height;
      objc_msgSend(v10, "cornerRadius");
      +[UIPointerShape shapeWithRoundedRect:cornerRadius:](UIPointerShape, "shapeWithRoundedRect:cornerRadius:", x, y, width, height, v19);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "setTintViewShape:", v14);

  }
  objc_msgSend(v6, "pointerEffect");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "tintColorMatrixProvider");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColorMatrixProvider:", v21);

  if ((objc_msgSend(v6, "options") & 4) != 0)
  {
    v22 = 1;
  }
  else
  {
    if ((objc_msgSend(v6, "options") & 8) == 0)
      goto LABEL_11;
    v22 = 2;
  }
  objc_msgSend(v5, "setTintMode:", v22);
LABEL_11:
  v23 = objc_msgSend(v6, "_suppressesMirroring");
  objc_msgSend(v5, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v23)
    v26 = 18;
  else
    v26 = 0;
  objc_msgSend(v24, "setDisableUpdateMask:", v26);

  objc_msgSend(v6, "pointerEffect");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUseSoftShadow:", objc_msgSend(v27, "useSoftShadow"));

}

- (void)begin
{
  int64_t v3;

  v3 = -[_UIPointerContentEffect state](self, "state");
  -[_UIPointerContentEffect setState:](self, "setState:", 1);
  -[_UIPointerContentEffect _updateFromState:toState:](self, "_updateFromState:toState:", v3, -[_UIPointerContentEffect state](self, "state"));
}

- (void)end:(BOOL)a3
{
  _BOOL4 v3;
  int64_t v5;
  uint64_t v6;

  v3 = a3;
  v5 = -[_UIPointerContentEffect state](self, "state");
  if (v3)
    v6 = 2;
  else
    v6 = 0;
  -[_UIPointerContentEffect setState:](self, "setState:", v6);
  -[_UIPointerContentEffect _updateFromState:toState:](self, "_updateFromState:toState:", v5, -[_UIPointerContentEffect state](self, "state"));
}

- (void)setPressed:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  BOOL v11;

  if (self->_pressed != a3)
  {
    v4 = a4;
    self->_pressed = a3;
    -[_UIPointerContentEffect platterView](self, "platterView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __47___UIPointerContentEffect_setPressed_animated___block_invoke;
      v10[3] = &unk_1E16B1B78;
      v10[4] = self;
      v11 = a3;
      v8 = _Block_copy(v10);
      v9 = v8;
      if (v4)
        +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v8, 0.2);
      else
        (*((void (**)(void *))v8 + 2))(v8);

    }
  }
}

- (void)setLiftProgress:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[6];

  if (vabdd_f64(a3, self->_liftProgress) > 2.22044605e-16)
  {
    self->_liftProgress = a3;
    -[_UIPointerContentEffect style](self, "style");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pointerEffect");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "liftProgressSpring");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __43___UIPointerContentEffect_setLiftProgress___block_invoke;
    v8[3] = &unk_1E16B1888;
    v8[4] = self;
    *(double *)&v8[5] = a3;
    +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v7, 0, v8, 0);

  }
}

- (void)_updateFromState:(int64_t)a3 toState:(int64_t)a4
{
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  int64_t v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  int64_t v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  void (**v34)(_QWORD);
  void *v35;
  void *v36;
  void *v37;
  int64_t v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  int64_t v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[5];
  id v47;
  id v48;
  int64_t v49;
  _QWORD v50[6];
  _QWORD aBlock[5];
  id v52;
  id v53;
  int64_t v54;
  int64_t v55;

  -[_UIPointerContentEffect platterView](self, "platterView");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (a4 != 1 || v8)
  {
    if (a4 != 1)
      goto LABEL_6;
  }
  else
  {
    -[_UIPointerContentEffect _createAndInstallPlatterView](self, "_createAndInstallPlatterView");
    -[_UIPointerContentEffect platterView](self, "platterView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  self->_flags.stopViewOrderPreservation = 0;
LABEL_6:
  -[_UIPointerContentEffect style](self, "style");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPointerContentEffect setAnimationCount:](self, "setAnimationCount:", -[_UIPointerContentEffect animationCount](self, "animationCount") + 1);
  aBlock[0] = MEMORY[0x1E0C809B0];
  v11 = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52___UIPointerContentEffect__updateFromState_toState___block_invoke;
  aBlock[3] = &unk_1E16C1C58;
  aBlock[4] = self;
  v12 = v10;
  v52 = v12;
  v54 = a4;
  v55 = a3;
  v42 = v9;
  v53 = v42;
  v43 = a3;
  v13 = _Block_copy(aBlock);
  v50[0] = v11;
  v50[1] = 3221225472;
  v50[2] = __52___UIPointerContentEffect__updateFromState_toState___block_invoke_2;
  v50[3] = &unk_1E16BE798;
  v50[4] = self;
  v50[5] = a2;
  v14 = _Block_copy(v50);
  v15 = a4;
  v16 = (void *)objc_opt_new();
  objc_msgSend(v12, "pointerEffect");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "scaleUpAnimationDampingRatio");
  v19 = v18;
  objc_msgSend(v12, "pointerEffect");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "scaleUpAnimationResponse");
  objc_msgSend(v16, "setDampingRatio:response:", v19, v21);

  v41 = v16;
  v22 = v16;
  v23 = v15;
  +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v22, 0, v13, v14);
  v24 = (void *)objc_opt_new();
  objc_msgSend(v12, "pointerEffect");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "dampedAnimationDampingRatio");
  v27 = v26;
  objc_msgSend(v12, "pointerEffect");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "dampedAnimationResponse");
  objc_msgSend(v24, "setDampingRatio:response:", v27, v29);

  v30 = MEMORY[0x1E0C809B0];
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __52___UIPointerContentEffect__updateFromState_toState___block_invoke_4;
  v46[3] = &unk_1E16C5CA0;
  v46[4] = self;
  v49 = v15;
  v31 = v12;
  v47 = v31;
  v32 = v42;
  v48 = v32;
  +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v24, 0, v46, v14);
  v44[0] = v30;
  v44[1] = 3221225472;
  v44[2] = __52___UIPointerContentEffect__updateFromState_toState___block_invoke_5;
  v44[3] = &unk_1E16B1BF8;
  v33 = v14;
  v45 = v33;
  v34 = (void (**)(_QWORD))_Block_copy(v44);
  -[_UIPointerContentEffect region](self, "region");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "referenceView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "_window");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
  {

    v38 = v43;
    if (v43 != 1 && v23 == 1)
    {
      -[_UIPointerContentEffect _commitPointerStyleToArbiterWithCompletion:](self, "_commitPointerStyleToArbiterWithCompletion:", v34);
      goto LABEL_15;
    }
  }
  else
  {

    v38 = v43;
  }
  if (v38 != 1 || v23 == 1)
  {
    v34[2](v34);
  }
  else
  {
    +[_UIPointerArbiter sharedArbiter](_UIPointerArbiter, "sharedArbiter");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPointerContentEffect region](self, "region");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "exitRegion:removeStyle:completion:", v40, v23 == 0, v34);

  }
LABEL_15:

}

- (void)_commitPointerStyleToArbiterWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = (void (**)(_QWORD))a3;
  -[_UIPointerContentEffect style](self, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "options") & 0x8000) != 0)
  {
    if (v4)
      v4[2](v4);
  }
  else
  {
    objc_initWeak(&location, self);
    +[_UIPointerArbiter sharedArbiter](_UIPointerArbiter, "sharedArbiter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPointerContentEffect region](self, "region");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __70___UIPointerContentEffect__commitPointerStyleToArbiterWithCompletion___block_invoke;
    v8[3] = &unk_1E16E4120;
    objc_copyWeak(&v10, &location);
    v9 = v5;
    objc_msgSend(v6, "applyStyle:forRegion:effectSourceHandler:completion:", v9, v7, v8, v4);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

- (void)_createAndInstallPlatterView
{
  void *v3;
  void *v4;
  _UIPointerEffectPlatterView *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _UIPointerEffectPlatterView *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id *v21;
  id *v22;
  id v23;
  _UIPointerEffectPlatterView *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  _UIPointerEffectPlatterView *v40;
  _QWORD v41[4];
  id v42;
  _UIPointerEffectPlatterView *v43;
  _QWORD v44[4];
  id v45;
  _UIPointerEffectPlatterView *v46;
  id v47;

  -[_UIPointerContentEffect style](self, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "targetedPreview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_UIPointerEffectPlatterView initWithTargetedPreview:]([_UIPointerEffectPlatterView alloc], "initWithTargetedPreview:", v4);
  objc_msgSend(v4, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_window");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {

    goto LABEL_6;
  }
  v8 = (void *)v7;
  v9 = objc_msgSend(v4, "_isVisible");

  if (!v9)
  {
LABEL_6:
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __55___UIPointerContentEffect__createAndInstallPlatterView__block_invoke_3;
    v38[3] = &unk_1E16B1B50;
    v23 = v4;
    v39 = v23;
    v24 = v5;
    v40 = v24;
    -[_UIPointerContentEffect _modifyEffectContainerViewHierarchy:waitForCACommit:](self, "_modifyEffectContainerViewHierarchy:waitForCACommit:", v38, 0);
    objc_msgSend(v23, "target");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "center");
    -[_UIPointerEffectPlatterView setCenter:](v24, "setCenter:");

    -[UIView center](v24, "center");
    -[_UIPointerContentEffect setInitialEffectPlatterPosition:](self, "setInitialEffectPlatterPosition:");

    v10 = v39;
    goto LABEL_11;
  }
  objc_msgSend(v4, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPointerContentEffect _positionReferenceViewForPreview:](self, "_positionReferenceViewForPreview:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "target");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "container");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __55___UIPointerContentEffect__createAndInstallPlatterView__block_invoke;
    v44[3] = &unk_1E16B47A8;
    v45 = v13;
    v14 = v5;
    v46 = v14;
    v15 = v11;
    v47 = v15;
    -[_UIPointerContentEffect _modifyEffectContainerViewHierarchy:waitForCACommit:](self, "_modifyEffectContainerViewHierarchy:waitForCACommit:", v44, 0);
    v16 = v11;
    v17 = v13;
    v18 = (void *)objc_opt_new();
    objc_msgSend(v15, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setSourceLayer:", v19);

    objc_msgSend(v18, "setKeyPath:", CFSTR("zPosition"));
    objc_msgSend(v18, "setDuration:", INFINITY);
    -[UIView layer](v14, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addAnimation:forKey:", v18, CFSTR("_UIPointerContentEffect.sourceViewZPositionMatchProperty"));

    v21 = &v45;
    v13 = v17;
    v11 = v16;
    v22 = (id *)&v46;

  }
  else
  {
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __55___UIPointerContentEffect__createAndInstallPlatterView__block_invoke_2;
    v41[3] = &unk_1E16B1B50;
    v21 = &v42;
    v42 = v13;
    v22 = (id *)&v43;
    v43 = v5;
    -[_UIPointerContentEffect _modifyEffectContainerViewHierarchy:waitForCACommit:](self, "_modifyEffectContainerViewHierarchy:waitForCACommit:", v41, 0);
  }

  -[_UIPointerContentEffect setPositionReferenceView:](self, "setPositionReferenceView:", v11);
  -[_UIPointerContentEffect setSublayerObservationView:](self, "setSublayerObservationView:", v13);
  -[_UIPointerContentEffect sublayerObservationView](self, "sublayerObservationView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "layer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObserver:forKeyPath:options:context:", self, CFSTR("sublayers"), 0, 0);

  objc_msgSend(v10, "_window");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPointerContentEffect setSubtreeMonitoredWindow:](self, "setSubtreeMonitoredWindow:", v28);

  -[_UIPointerContentEffect subtreeMonitoredWindow](self, "subtreeMonitoredWindow");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "_registerSubtreeMonitor:", self);

  -[_UIPointerContentEffect setInitialEffectPlatterPosition:](self, "setInitialEffectPlatterPosition:", 1.79769313e308, 1.79769313e308);
  -[_UIPointerContentEffect _anchorPlatterView:toPreview:updateBounds:](self, "_anchorPlatterView:toPreview:updateBounds:", v5, v4, 0);
  objc_msgSend(v4, "parameters");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "visiblePath");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v31)
  {
    -[_UIPointerContentEffect setBoundsObservationView:](self, "setBoundsObservationView:", v10);
    -[_UIPointerContentEffect boundsObservationView](self, "boundsObservationView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "layer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObserver:forKeyPath:options:context:", self, CFSTR("bounds"), 1, 0);

  }
LABEL_11:

  -[_UIPointerContentEffect _updatePlatterView:forStyle:](self, "_updatePlatterView:forStyle:", v5, v3);
  -[_UIPointerEffectPlatterView setGeometryFrozen:](v5, "setGeometryFrozen:", 1);
  -[_UIPointerEffectPlatterView setPressed:](v5, "setPressed:", self->_pressed);
  objc_msgSend(v4, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "layer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "flipsHorizontalAxis");
  -[UIView layer](v5, "layer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setFlipsHorizontalAxis:", v36);

  -[_UIPointerContentEffect setPlatterView:](self, "setPlatterView:", v5);
}

- (void)_tearDownPlatterView
{
  void *v3;

  -[_UIPointerContentEffect _cleanUpObservation](self, "_cleanUpObservation");
  -[_UIPointerContentEffect platterView](self, "platterView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[_UIPointerContentEffect setPlatterView:](self, "setPlatterView:", 0);
}

- (id)_positionReferenceViewForPreview:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "_sourceViewIsInViewHierarchy"))
  {
    objc_msgSend(v3, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      while (1)
      {
        objc_msgSend(v4, "superview");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "target");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "container");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v5 == v7)
          break;

        v4 = v5;
        if (!v5)
          goto LABEL_18;
      }

      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      objc_msgSend(v3, "_accessoryViews", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v17 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
            if (v13
              && -[UIView _viewOrderRelativeToView:requireIntersection:](*(void **)(*((_QWORD *)&v16 + 1) + 8 * i), v4, 1) == -2)
            {
              v14 = v13;

              v4 = v14;
            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v10);
      }

    }
  }
  else
  {
    v4 = 0;
  }
LABEL_18:

  return v4;
}

- (void)_anchorPlatterView:(id)a3 toPreview:(id)a4 updateBounds:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v58;
  CGFloat v59;
  double v60;
  double v61;
  CGFloat v62;
  double v63;
  CGFloat v64;
  double MinX;
  double MinY;
  double v67;
  double v68;
  double v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  double v79;
  double v80;
  void *v81;
  void *v82;
  void *v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  CGFloat v89;
  CGFloat v90;
  double v91;
  double v92;
  double v93;
  CGFloat rect;
  _QWORD v95[6];
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;

  v5 = a5;
  v95[4] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "setGeometryFrozen:", 0);
  objc_msgSend(v9, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "size");
  v13 = v11;
  v14 = v12;
  if (!v5)
  {
    if (objc_msgSend(v9, "hasCustomTarget"))
    {
      objc_msgSend(v9, "target");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "center");
      v30 = v29;
      v32 = v31;
      objc_msgSend(v9, "target");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "container");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "convertPoint:fromView:", v34, v30, v32);
      v23 = v35;
      v25 = v36;

    }
    else
    {
      objc_msgSend(v9, "parameters");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "visiblePath");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v38)
      {
        objc_msgSend(v10, "bounds");
        v23 = v85 + v84 * 0.5;
        v25 = v87 + v86 * 0.5;
        goto LABEL_8;
      }
      objc_msgSend(v9, "parameters");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "visiblePath");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "bounds");
      v23 = v40 + v39 * 0.5;
      v25 = v42 + v41 * 0.5;
    }

LABEL_8:
    v27 = 0.0;
    v26 = 0.0;
    goto LABEL_9;
  }
  objc_msgSend(v8, "setBounds:", 0.0, 0.0, v11, v12);
  objc_msgSend(v8, "layoutIfNeeded");
  objc_msgSend(v9, "target");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "container");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPointerContentEffect initialEffectPlatterPosition](self, "initialEffectPlatterPosition");
  v18 = v17;
  v20 = v19;
  objc_msgSend(v9, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "convertPoint:toView:", v21, v18, v20);
  v23 = v22;
  v25 = v24;

  v26 = v13 * 0.5 + 0.0 - v23;
  v27 = v14 * 0.5 + 0.0 - v25;
LABEL_9:
  objc_msgSend(v9, "target");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "container");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "_currentScreenScale");
  v88 = v23;
  UIRectCenteredAboutPointScale(0.0, 0.0, v13, v14, v23, v25, v45);
  v47 = v46;
  v49 = v48;
  v51 = v50;
  v53 = v52;

  v96.origin.x = v47;
  v96.origin.y = v49;
  v96.size.width = v51;
  v96.size.height = v53;
  v97 = CGRectOffset(v96, v26, v27);
  x = v97.origin.x;
  v89 = v97.origin.x;
  y = v97.origin.y;
  width = v97.size.width;
  height = v97.size.height;
  objc_msgSend(v10, "bounds");
  v59 = v58;
  rect = v60;
  v62 = v61;
  v64 = v63;
  v90 = v63;
  v98.origin.x = x;
  v98.origin.y = y;
  v98.size.width = width;
  v98.size.height = height;
  MinX = CGRectGetMinX(v98);
  v99.origin.x = v59;
  v99.origin.y = rect;
  v99.size.width = v62;
  v99.size.height = v64;
  v93 = MinX / CGRectGetWidth(v99);
  v100.origin.x = v89;
  v100.origin.y = y;
  v100.size.width = width;
  v100.size.height = height;
  MinY = CGRectGetMinY(v100);
  v101.origin.x = v59;
  v101.origin.y = rect;
  v101.size.width = v62;
  v101.size.height = v90;
  v92 = MinY / CGRectGetHeight(v101);
  v102.origin.x = v89;
  v102.origin.y = y;
  v102.size.width = width;
  v102.size.height = height;
  v67 = CGRectGetWidth(v102);
  v103.origin.x = v59;
  v103.origin.y = rect;
  v103.size.width = v62;
  v103.size.height = v90;
  v91 = v67 / CGRectGetWidth(v103);
  v104.origin.x = v89;
  v104.origin.y = y;
  v104.size.width = width;
  v104.size.height = height;
  v68 = CGRectGetHeight(v104);
  v105.origin.x = v59;
  v105.origin.y = rect;
  v105.size.width = v62;
  v105.size.height = v90;
  v69 = v92 + v68 / CGRectGetHeight(v105);
  v70 = (void *)objc_opt_new();
  objc_msgSend(v10, "layer");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setSourceLayer:", v71);

  objc_msgSend(v70, "setDuration:", INFINITY);
  objc_msgSend(v70, "setAdditive:", 1);
  objc_msgSend(v70, "setUsesNormalizedCoordinates:", 1);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v93, v92);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v95[0] = v72;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v93 + v91, v92);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v95[1] = v73;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v93 + v91, v69);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v95[2] = v74;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v93, v69);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v95[3] = v75;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v95, 4);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setSourcePoints:", v76);

  objc_msgSend(v8, "layer");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "removeAnimationForKey:", CFSTR("_UIPointerContentEffect.sourceViewMatchMove"));

  objc_msgSend(v8, "layer");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "addAnimation:forKey:", v70, CFSTR("_UIPointerContentEffect.sourceViewMatchMove"));

  objc_msgSend(v8, "setCenter:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  -[_UIPointerContentEffect initialEffectPlatterPosition](self, "initialEffectPlatterPosition");
  if (v80 == 1.79769313e308 && v79 == 1.79769313e308)
  {
    objc_msgSend(v9, "view");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "target");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "container");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "convertPoint:toView:", v83, v88, v25);
    -[_UIPointerContentEffect setInitialEffectPlatterPosition:](self, "setInitialEffectPlatterPosition:");

  }
  objc_msgSend(v8, "setGeometryFrozen:", 1, *(_QWORD *)&v25, *(_QWORD *)&v88);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  void *v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  BOOL v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[5];
  CGRect v37;
  CGRect v38;

  v8 = a4;
  v9 = a5;
  -[_UIPointerContentEffect style](self, "style");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "targetedPreview");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "target");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "container");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPointerContentEffect sublayerObservationView](self, "sublayerObservationView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPointerContentEffect boundsObservationView](self, "boundsObservationView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15 && (objc_msgSend(v15, "layer"), v17 = (id)objc_claimAutoreleasedReturnValue(), v17, v17 == v8))
  {
    if (!self->_flags.isRearrangingEffectViews && !self->_flags.stopViewOrderPreservation)
    {
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __74___UIPointerContentEffect_observeValueForKeyPath_ofObject_change_context___block_invoke;
      v36[3] = &unk_1E16B1B28;
      v36[4] = self;
      -[_UIPointerContentEffect _modifyEffectContainerViewHierarchy:waitForCACommit:](self, "_modifyEffectContainerViewHierarchy:waitForCACommit:", v36, 1);
    }
  }
  else if (v16)
  {
    objc_msgSend(v16, "layer");
    v18 = (id)objc_claimAutoreleasedReturnValue();

    if (v18 == v8)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "CGRectValue");
      v21 = v20;
      v23 = v22;
      v25 = v24;
      v27 = v26;

      -[_UIPointerContentEffect platterView](self, "platterView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "bounds");
      v38.origin.x = v29;
      v38.origin.y = v30;
      v38.size.width = v31;
      v38.size.height = v32;
      v37.origin.x = v21;
      v37.origin.y = v23;
      v37.size.width = v25;
      v37.size.height = v27;
      v33 = CGRectEqualToRect(v37, v38);

      if (!v33)
      {
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __74___UIPointerContentEffect_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
        v34[3] = &unk_1E16B1B50;
        v34[4] = self;
        v35 = v11;
        -[_UIPointerContentEffect _modifyEffectContainerViewHierarchy:waitForCACommit:](self, "_modifyEffectContainerViewHierarchy:waitForCACommit:", v34, 1);

      }
    }
  }

}

- (void)_cleanUpObservation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[_UIPointerContentEffect subtreeMonitoredWindow](self, "subtreeMonitoredWindow");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[_UIPointerContentEffect setSubtreeMonitoredWindow:](self, "setSubtreeMonitoredWindow:", 0);
    objc_msgSend(v7, "_unregisterSubtreeMonitor:", self);
  }
  -[_UIPointerContentEffect sublayerObservationView](self, "sublayerObservationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[_UIPointerContentEffect setSublayerObservationView:](self, "setSublayerObservationView:", 0);
    objc_msgSend(v3, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("sublayers"));

  }
  -[_UIPointerContentEffect boundsObservationView](self, "boundsObservationView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[_UIPointerContentEffect setBoundsObservationView:](self, "setBoundsObservationView:", 0);
    objc_msgSend(v5, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:forKeyPath:", self, CFSTR("bounds"));

  }
}

- (void)_modifyEffectContainerViewHierarchy:(id)a3 waitForCACommit:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  _UIPointerContentEffect *v14;
  id v15;

  v4 = a4;
  v6 = a3;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __79___UIPointerContentEffect__modifyEffectContainerViewHierarchy_waitForCACommit___block_invoke;
  v13 = &unk_1E16B1D18;
  v14 = self;
  v7 = v6;
  v15 = v7;
  v8 = _Block_copy(&v10);
  v9 = v8;
  if (v4)
    objc_msgSend(MEMORY[0x1E0CD28B0], "addCommitHandler:forPhase:", v8, 1, v10, v11, v12, v13, v14);
  else
    (*((void (**)(void *))v8 + 2))(v8);

}

- (void)_ensureRelativeEffectViewOrderInContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  unint64_t v23;
  NSObject *v24;
  _QWORD v25[6];

  v25[5] = *MEMORY[0x1E0C80C00];
  if (os_variant_has_internal_diagnostics())
  {
    if (!self->_flags.isRearrangingEffectViews)
    {
      __UIFaultDebugAssertLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v25[0]) = 0;
        _os_log_fault_impl(&dword_185066000, v22, OS_LOG_TYPE_FAULT, "Called _ensureRelativeEffectViewOrderInContainer without pausing sublayer observation!", (uint8_t *)v25, 2u);
      }

    }
  }
  else if (!self->_flags.isRearrangingEffectViews)
  {
    v23 = _ensureRelativeEffectViewOrderInContainer___s_category;
    if (!_ensureRelativeEffectViewOrderInContainer___s_category)
    {
      v23 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v23, (unint64_t *)&_ensureRelativeEffectViewOrderInContainer___s_category);
    }
    v24 = *(NSObject **)(v23 + 8);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v25[0]) = 0;
      _os_log_impl(&dword_185066000, v24, OS_LOG_TYPE_ERROR, "Called _ensureRelativeEffectViewOrderInContainer without pausing sublayer observation!", (uint8_t *)v25, 2u);
    }
  }
  -[_UIPointerContentEffect style](self, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPointerContentEffect platterView](self, "platterView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "targetedPreview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "target");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "container");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIPointerContentEffect positionReferenceView](self, "positionReferenceView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sublayers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_5;
  objc_msgSend(v7, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sublayers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "indexOfObject:", v13);

  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_5:

    objc_msgSend(v7, "subviews");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v15, "count");

    v8 = 0;
  }
  if (-[_UIPointerContentEffect state](self, "state") != 1)
  {
    v18 = 0;
LABEL_14:
    v21 = 0;
    goto LABEL_17;
  }
  -[_UIPointerContentEffect lumaSamplingBackdrop](self, "lumaSamplingBackdrop");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "superview");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17 == v7)
  {
    -[_UIPointerContentEffect lumaSamplingBackdrop](self, "lumaSamplingBackdrop");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }

  if (!objc_msgSend(v3, "pointerUnderlapsContent"))
    goto LABEL_14;
  -[_UIPointerContentEffect pointerPortal](self, "pointerPortal");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "superview");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20 == v7)
  {
    -[_UIPointerContentEffect pointerPortal](self, "pointerPortal");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21 = 0;
  }

LABEL_17:
  v25[0] = v18;
  v25[1] = v8;
  v25[2] = v21;
  v25[3] = v4;
  objc_msgSend(v7, "_ensureViewsAreInstalledInRelativeOrder:viewCount:insertionStartIndex:", v25, 4, v14);

}

- (BOOL)_monitorsView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  -[_UIPointerContentEffect style](self, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "targetedPreview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "containsView:", v7);

  return v8;
}

- (void)_monitoredView:(id)a3 willMoveFromSuperview:(id)a4 toSuperview:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  _QWORD v15[5];

  v7 = a3;
  v8 = a5;
  -[_UIPointerContentEffect style](self, "style");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "targetedPreview");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "isDescendantOfView:", v7);
  if (v12)
  {
    objc_msgSend(v8, "_window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_7;
  }
  -[_UIPointerContentEffect platterView](self, "platterView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v7, "containsView:", v13);

  if (v12)
  {

    if ((v14 & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  if (v14)
  {
LABEL_7:
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __76___UIPointerContentEffect__monitoredView_willMoveFromSuperview_toSuperview___block_invoke;
    v15[3] = &unk_1E16B1B28;
    v15[4] = self;
    -[_UIPointerContentEffect _modifyEffectContainerViewHierarchy:waitForCACommit:](self, "_modifyEffectContainerViewHierarchy:waitForCACommit:", v15, 1);
  }
LABEL_8:

}

- (void)setDescriptor:(id)a3 andKey:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPointerContentEffect.m"), 848, CFSTR("Attempting to configure pointer effect with incorrect descriptor type %@"), v10);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPointerContentEffect.m"), 849, CFSTR("Attempting to configure pointer effect with incorrect key type %@"), v7);

  }
  -[_UIPointerContentEffect _setStyle:andRegion:](self, "_setStyle:andRegion:", v10, v7);

}

- (id)previewForContinuingToEffectWithPreview:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UITargetedPreview *v11;

  v4 = a3;
  -[_UIPointerContentEffect platterView](self, "platterView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_UIPointerContentEffect state](self, "state") != 1)
    goto LABEL_4;
  objc_msgSend(v5, "window");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_4;
  v7 = (void *)v6;
  objc_msgSend(v5, "targetedPreview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 == v10)
  {
    self->_flags.stopViewOrderPreservation = 1;
    v11 = -[UITargetedPreview initWithView:]([UITargetedPreview alloc], "initWithView:", v5);
    -[UITargetedPreview set_matchableProperties:](v11, "set_matchableProperties:", &unk_1E1A94D18);
  }
  else
  {
LABEL_4:
    v11 = 0;
  }

  return v11;
}

- (void)addCompletion:(id)a3
{
  id v4;
  NSMutableArray *completions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  void *aBlock;

  v4 = a3;
  completions = self->_completions;
  aBlock = v4;
  if (!completions)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_completions;
    self->_completions = v6;

    v4 = aBlock;
    completions = self->_completions;
  }
  v8 = _Block_copy(v4);
  -[NSMutableArray addObject:](completions, "addObject:", v8);

}

- (UIPointerRegion)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (UIPointerStyle)style
{
  return self->_style;
}

- (UIPointerInteractionAnimator)entranceAnimator
{
  return self->_entranceAnimator;
}

- (void)setEntranceAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_entranceAnimator, a3);
}

- (UIPointerInteractionAnimator)exitAnimator
{
  return self->_exitAnimator;
}

- (void)setExitAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_exitAnimator, a3);
}

- (double)liftProgress
{
  return self->_liftProgress;
}

- (_UIPointerEffectPlatterView)platterView
{
  return self->_platterView;
}

- (void)setPlatterView:(id)a3
{
  objc_storeStrong((id *)&self->_platterView, a3);
}

- (UIView)lumaSamplingBackdrop
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_lumaSamplingBackdrop);
}

- (void)setLumaSamplingBackdrop:(id)a3
{
  objc_storeWeak((id *)&self->_lumaSamplingBackdrop, a3);
}

- (UIView)pointerPortal
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_pointerPortal);
}

- (void)setPointerPortal:(id)a3
{
  objc_storeWeak((id *)&self->_pointerPortal, a3);
}

- (NSMutableArray)completions
{
  return self->_completions;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (unint64_t)animationCount
{
  return self->_animationCount;
}

- (void)setAnimationCount:(unint64_t)a3
{
  self->_animationCount = a3;
}

- (UIView)positionReferenceView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_positionReferenceView);
}

- (void)setPositionReferenceView:(id)a3
{
  objc_storeWeak((id *)&self->_positionReferenceView, a3);
}

- (UIWindow)subtreeMonitoredWindow
{
  return (UIWindow *)objc_loadWeakRetained((id *)&self->_subtreeMonitoredWindow);
}

- (void)setSubtreeMonitoredWindow:(id)a3
{
  objc_storeWeak((id *)&self->_subtreeMonitoredWindow, a3);
}

- (UIView)sublayerObservationView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_sublayerObservationView);
}

- (void)setSublayerObservationView:(id)a3
{
  objc_storeWeak((id *)&self->_sublayerObservationView, a3);
}

- (UIView)boundsObservationView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_boundsObservationView);
}

- (void)setBoundsObservationView:(id)a3
{
  objc_storeWeak((id *)&self->_boundsObservationView, a3);
}

- (CGPoint)initialEffectPlatterPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_initialEffectPlatterPosition.x;
  y = self->_initialEffectPlatterPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setInitialEffectPlatterPosition:(CGPoint)a3
{
  self->_initialEffectPlatterPosition = a3;
}

- (BOOL)sourceViewDidAllowEdgeAntialiasing
{
  return self->_sourceViewDidAllowEdgeAntialiasing;
}

- (void)setSourceViewDidAllowEdgeAntialiasing:(BOOL)a3
{
  self->_sourceViewDidAllowEdgeAntialiasing = a3;
}

- (UIViewFloatAnimatableProperty)liftProgressProperty
{
  return self->_liftProgressProperty;
}

- (void)setLiftProgressProperty:(id)a3
{
  objc_storeStrong((id *)&self->_liftProgressProperty, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_liftProgressProperty, 0);
  objc_destroyWeak((id *)&self->_boundsObservationView);
  objc_destroyWeak((id *)&self->_sublayerObservationView);
  objc_destroyWeak((id *)&self->_subtreeMonitoredWindow);
  objc_destroyWeak((id *)&self->_positionReferenceView);
  objc_storeStrong((id *)&self->_completions, 0);
  objc_destroyWeak((id *)&self->_pointerPortal);
  objc_destroyWeak((id *)&self->_lumaSamplingBackdrop);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_exitAnimator, 0);
  objc_storeStrong((id *)&self->_entranceAnimator, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_region, 0);
}

@end
