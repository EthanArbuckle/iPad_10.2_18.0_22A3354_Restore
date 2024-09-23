@implementation _UIHyperOutOfProcessViewAnimator

- (_UIHyperOutOfProcessViewAnimator)initWithDimensions:(unint64_t)a3
{
  _UIHyperOutOfProcessViewAnimator *v4;
  _UIHyperOutOfProcessViewAnimator *v5;
  NSMutableSet *v6;
  NSMutableSet *propertyAnimators;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIHyperOutOfProcessViewAnimator;
  v4 = -[_UIHyperOutOfProcessViewAnimator init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->__dimensions = a3;
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    propertyAnimators = v5->__propertyAnimators;
    v5->__propertyAnimators = v6;

  }
  return v5;
}

- (void)_setUpdateReason:(unsigned int)a3
{
  self->__updateReason = a3;
}

- (void)_setPreferredFrameRateRange:(CAFrameRateRange)a3
{
  self->__preferredFrameRateRange = a3;
}

- (void)_setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->__delegate, a3);
}

- (void)_setInteractor:(id)a3
{
  objc_storeWeak((id *)&self->__interactor, a3);
}

- (_UIHyperInteractor)_interactor
{
  return (_UIHyperInteractor *)objc_loadWeakRetained((id *)&self->__interactor);
}

- (unint64_t)_dimensions
{
  return self->__dimensions;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(sel__dimensions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v3;
  NSStringFromSelector(sel__boundaryCrossedSpringParameters);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v4;
  NSStringFromSelector(sel__interactionEndedSpringParameters);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDescriptionBuilder descriptionForObject:keys:](UIDescriptionBuilder, "descriptionForObject:keys:", self, v6, v9, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (_UISpringParameters)_boundaryCrossedSpringParameters
{
  _UISpringParameters *boundaryCrossedSpringParameters;
  _UISpringParameters *v4;
  _UISpringParameters *v5;

  boundaryCrossedSpringParameters = self->__boundaryCrossedSpringParameters;
  if (!boundaryCrossedSpringParameters)
  {
    +[_UISpringParameters parametersWithDampingRatio:response:](_UISpringParameters, "parametersWithDampingRatio:response:", 1.0, 0.1);
    v4 = (_UISpringParameters *)objc_claimAutoreleasedReturnValue();
    v5 = self->__boundaryCrossedSpringParameters;
    self->__boundaryCrossedSpringParameters = v4;

    boundaryCrossedSpringParameters = self->__boundaryCrossedSpringParameters;
  }
  return boundaryCrossedSpringParameters;
}

- (void)_setBoundaryCrossedSpringParameters:(id)a3
{
  id v4;
  _UISpringParameters *v5;
  _UISpringParameters *v6;
  BOOL v7;
  _UISpringParameters *v8;
  _UISpringParameters *boundaryCrossedSpringParameters;
  _UISpringParameters *v10;

  v4 = a3;
  v5 = self->__boundaryCrossedSpringParameters;
  v6 = (_UISpringParameters *)v4;
  v10 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[_UISpringParameters isEqual:](v5, "isEqual:", v6);

      if (v7)
        goto LABEL_9;
    }
    else
    {

    }
    -[_UIHyperOutOfProcessViewAnimator willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("_boundaryCrossedSpringParameters"));
    v8 = (_UISpringParameters *)-[_UISpringParameters copy](v10, "copy");
    boundaryCrossedSpringParameters = self->__boundaryCrossedSpringParameters;
    self->__boundaryCrossedSpringParameters = v8;

    -[_UIHyperOutOfProcessViewAnimator didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("_boundaryCrossedSpringParameters"));
  }
LABEL_9:

}

- (_UISpringParameters)_interactionEndedSpringParameters
{
  _UISpringParameters *interactionEndedSpringParameters;
  _UISpringParameters *v4;
  _UISpringParameters *v5;

  interactionEndedSpringParameters = self->__interactionEndedSpringParameters;
  if (!interactionEndedSpringParameters)
  {
    +[_UISpringParameters parametersWithDampingRatio:response:](_UISpringParameters, "parametersWithDampingRatio:response:", 1.0, 0.3);
    v4 = (_UISpringParameters *)objc_claimAutoreleasedReturnValue();
    v5 = self->__interactionEndedSpringParameters;
    self->__interactionEndedSpringParameters = v4;

    interactionEndedSpringParameters = self->__interactionEndedSpringParameters;
  }
  return interactionEndedSpringParameters;
}

- (void)_setInteractionEndedSpringParameters:(id)a3
{
  id v4;
  _UISpringParameters *v5;
  _UISpringParameters *v6;
  BOOL v7;
  _UISpringParameters *v8;
  _UISpringParameters *interactionEndedSpringParameters;
  _UISpringParameters *v10;

  v4 = a3;
  v5 = self->__interactionEndedSpringParameters;
  v6 = (_UISpringParameters *)v4;
  v10 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[_UISpringParameters isEqual:](v5, "isEqual:", v6);

      if (v7)
        goto LABEL_9;
    }
    else
    {

    }
    -[_UIHyperOutOfProcessViewAnimator willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("_interactionEndedSpringParameters"));
    v8 = (_UISpringParameters *)-[_UISpringParameters copy](v10, "copy");
    interactionEndedSpringParameters = self->__interactionEndedSpringParameters;
    self->__interactionEndedSpringParameters = v8;

    -[_UIHyperOutOfProcessViewAnimator didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("_interactionEndedSpringParameters"));
  }
LABEL_9:

}

- (void)_interactionBegan
{
  void *v3;
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
  uint64_t v14;
  double v15;
  uint64_t v16;
  char *v17;
  void *v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  double *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[_UIHyperOutOfProcessViewAnimator _delegate](self, "_delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_UIHyperOutOfProcessViewAnimator _isAnimating](self, "_isAnimating")
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[_UIHyperOutOfProcessViewAnimator _interactor](self, "_interactor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIHyperOutOfProcessViewAnimator _interactor](self, "_interactor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_hyperInteractorApplyPresentationPoint:", v6);

    v28 = 0u;
    v29 = 0u;
    v27 = 0u;
    v26 = 0u;
    -[_UIHyperOutOfProcessViewAnimator _propertyAnimators](self, "_propertyAnimators", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v27 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v13, "stopAnimation:", 0);
          objc_msgSend(v13, "finishAnimationAtPosition:", 2);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v10);
    }

    *(_QWORD *)&v15 = MEMORY[0x1E0C80A78](v14).n128_u64[0];
    v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
    -[_UIHyperOutOfProcessViewAnimator _delegate](self, "_delegate", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_hyperOutOfProcessViewAnimator:getPresentationPointForInterruptedAnimation:", self, v17);

    *(_QWORD *)&v20 = MEMORY[0x1E0C80A78](v19).n128_u64[0];
    v22 = (double *)((char *)&v26 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
    -[_UIHyperOutOfProcessViewAnimator _interactor](self, "_interactor", v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_getUnconstrainedPoint:forConstrainedPoint:", v22, v17);

    -[_UIHyperOutOfProcessViewAnimator _interactor](self, "_interactor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    vDSP_vsubD((const double *)objc_msgSend(v24, "_unconstrainedPoint"), 1, v22, 1, v22, 1, self->__dimensions);

    -[_UIHyperOutOfProcessViewAnimator _interactor](self, "_interactor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "_copyInitialTranslation:", v22);

  }
}

- (void)_interactionChanged
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  char *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[6];

  v25[5] = *MEMORY[0x1E0C80C00];
  -[_UIHyperOutOfProcessViewAnimator _interactor](self, "_interactor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_region");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIHyperOutOfProcessViewAnimator _interactor](self, "_interactor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_lastConstrainedPoint");
  -[_UIHyperOutOfProcessViewAnimator _interactor](self, "_interactor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = _UIHyperregionIsBoundaryCrossedFromPointToPoint(v4, v6, objc_msgSend(v7, "_constrainedPoint"));

  *(_QWORD *)&v9 = MEMORY[0x1E0C80A78](v8).n128_u64[0];
  v11 = (char *)v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  -[_UIHyperOutOfProcessViewAnimator _interactor](self, "_interactor", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_closestPoint");
  cblas_dcopy_NEWLAPACK();

  -[_UIHyperOutOfProcessViewAnimator _interactor](self, "_interactor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIHyperOutOfProcessViewAnimator _interactor](self, "_interactor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_copyOverridePresentationPoint:", objc_msgSend(v14, "_lastConstrainedPoint"));

  -[_UIHyperOutOfProcessViewAnimator _interactor](self, "_interactor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_setOverridingPresentationPoint:", 1);

  -[_UIHyperOutOfProcessViewAnimator _interactor](self, "_interactor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIHyperOutOfProcessViewAnimator _interactor](self, "_interactor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_hyperInteractorApplyPresentationPoint:", v18);

  -[_UIHyperOutOfProcessViewAnimator _interactor](self, "_interactor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_setOverridingPresentationPoint:", 0);

  -[_UIHyperOutOfProcessViewAnimator _interactor](self, "_interactor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = memcmp(v11, (const void *)objc_msgSend(v20, "_closestPoint"), 8 * self->__dimensions);

  if ((v6 & 1) != 0 || v21)
  {
    -[_UIHyperOutOfProcessViewAnimator _boundaryCrossedSpringParameters](self, "_boundaryCrossedSpringParameters");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __55___UIHyperOutOfProcessViewAnimator__interactionChanged__block_invoke;
    v25[3] = &unk_1E16B1B28;
    v25[4] = self;
    -[_UIHyperOutOfProcessViewAnimator _animateWithParameters:animations:](self, "_animateWithParameters:animations:", v22, v25);
  }
  else
  {
    -[_UIHyperOutOfProcessViewAnimator _interactor](self, "_interactor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIHyperOutOfProcessViewAnimator _interactor](self, "_interactor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_hyperInteractorApplyPresentationPoint:", v24);

  }
}

- (void)_interactionEndedMutatingState:(id)a3
{
  _QWORD *v4;
  double v5;
  uint64_t v6;
  char *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void (*v12)(_QWORD *);
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void *v19;
  void (*v20)(uint64_t);
  void *v21;
  void *v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void (*v32)(uint64_t);
  void *v33;
  void (*v34)(uint64_t, uint64_t);
  void *v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  char *v42;
  _QWORD v43[5];
  _QWORD v44[6];
  _QWORD v45[8];

  v45[6] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v40 = (uint64_t)&v40;
  *(_QWORD *)&v5 = MEMORY[0x1E0C80A78](v4).n128_u64[0];
  v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  -[_UIHyperOutOfProcessViewAnimator _interactor](self, "_interactor", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_constrainedVelocity");
  cblas_dcopy_NEWLAPACK();

  -[_UIHyperOutOfProcessViewAnimator _interactor](self, "_interactor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIHyperOutOfProcessViewAnimator _interactor](self, "_interactor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_copyOverridePresentationPoint:", objc_msgSend(v10, "_constrainedPoint"));

  -[_UIHyperOutOfProcessViewAnimator _interactor](self, "_interactor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setOverridingPresentationPoint:", 1);

  v12 = (void (*)(_QWORD *))v4[2];
  v41 = v4;
  v12(v4);
  -[_UIHyperOutOfProcessViewAnimator _interactor](self, "_interactor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIHyperOutOfProcessViewAnimator _interactor](self, "_interactor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_hyperInteractorApplyPresentationPoint:", v15);

  if (self->__dimensions)
  {
    v16 = 0;
    v17 = MEMORY[0x1E0C809B0];
    v18 = __67___UIHyperOutOfProcessViewAnimator__interactionEndedMutatingState___block_invoke_2;
    v19 = &unk_1E16B3EF0;
    v20 = __67___UIHyperOutOfProcessViewAnimator__interactionEndedMutatingState___block_invoke_3;
    v21 = &unk_1E16B1B28;
    v42 = v7;
    while (1)
    {
      -[_UIHyperOutOfProcessViewAnimator _interactor](self, "_interactor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *(double *)(objc_msgSend(v22, "_constrainedPoint") + 8 * v16);
      -[_UIHyperOutOfProcessViewAnimator _interactor](self, "_interactor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v23 - *(double *)(objc_msgSend(v24, "_presentationPoint") + 8 * v16);

      if (v25 != 0.0)
        goto LABEL_6;
      v26 = *(double *)&v7[8 * v16];
      if (v26 != 0.0)
        break;
LABEL_7:
      if (++v16 >= self->__dimensions)
        goto LABEL_8;
    }
    -[_UIHyperOutOfProcessViewAnimator _interactor](self, "_interactor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v17;
    v45[1] = 3221225472;
    v45[2] = __67___UIHyperOutOfProcessViewAnimator__interactionEndedMutatingState___block_invoke;
    v45[3] = &__block_descriptor_48_e9_v16__0_d8l;
    v45[4] = v16;
    *(double *)&v45[5] = v26 * 0.001;
    objc_msgSend(v27, "_mutateOverridePresentationPoint:", v45);

    v25 = -(v26 * 0.001);
    -[_UIHyperOutOfProcessViewAnimator _interactor](self, "_interactor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "_delegate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIHyperOutOfProcessViewAnimator _interactor](self, "_interactor");
    v30 = v17;
    v31 = v21;
    v32 = v20;
    v33 = v19;
    v34 = v18;
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "_hyperInteractorApplyPresentationPoint:", v35);

    v18 = v34;
    v19 = v33;
    v20 = v32;
    v21 = v31;
    v17 = v30;
    v7 = v42;

LABEL_6:
    -[_UIHyperOutOfProcessViewAnimator _interactor](self, "_interactor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v17;
    v44[1] = 3221225472;
    v44[2] = v18;
    v44[3] = v19;
    v44[4] = self;
    v44[5] = v16;
    objc_msgSend(v36, "_mutateOverridePresentationPoint:", v44);

    v37 = *(double *)&v7[8 * v16] / v25;
    -[_UIHyperOutOfProcessViewAnimator _interactionEndedSpringParameters](self, "_interactionEndedSpringParameters");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v17;
    v43[1] = 3221225472;
    v43[2] = v20;
    v43[3] = v21;
    v43[4] = self;
    -[_UIHyperOutOfProcessViewAnimator _animateWithParameters:velocity:animations:](self, "_animateWithParameters:velocity:animations:", v38, v43, v37);

    goto LABEL_7;
  }
LABEL_8:
  -[_UIHyperOutOfProcessViewAnimator _interactor](self, "_interactor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "_setOverridingPresentationPoint:", 0);

}

- (void)_animateWithParameters:(id)a3 animations:(id)a4
{
  -[_UIHyperOutOfProcessViewAnimator _animateWithParameters:velocity:animations:](self, "_animateWithParameters:velocity:animations:", a3, a4, 0.0);
}

- (void)_animateWithParameters:(id)a3 velocity:(double)a4 animations:(id)a5
{
  id v8;
  id v9;
  UISpringTimingParameters *v10;
  UIViewPropertyAnimator *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  id from;
  id location;
  _QWORD v23[5];
  id v24;

  v8 = a3;
  v9 = a5;
  v10 = -[UISpringTimingParameters initWithParameters:initialVelocity:]([UISpringTimingParameters alloc], "initWithParameters:initialVelocity:", v8, a4, a4);
  v11 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]([UIViewPropertyAnimator alloc], "initWithDuration:timingParameters:", v10, 0.0);
  v12 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __79___UIHyperOutOfProcessViewAnimator__animateWithParameters_velocity_animations___block_invoke;
  v23[3] = &unk_1E16B1D18;
  v23[4] = self;
  v13 = v9;
  v24 = v13;
  -[UIViewPropertyAnimator addAnimations:](v11, "addAnimations:", v23);
  objc_initWeak(&location, self);
  objc_initWeak(&from, v11);
  v15 = v12;
  v16 = 3221225472;
  v17 = __79___UIHyperOutOfProcessViewAnimator__animateWithParameters_velocity_animations___block_invoke_2;
  v18 = &unk_1E16B3F18;
  objc_copyWeak(&v19, &location);
  objc_copyWeak(&v20, &from);
  -[UIViewPropertyAnimator addCompletion:](v11, "addCompletion:", &v15);
  -[_UIHyperOutOfProcessViewAnimator _propertyAnimators](self, "_propertyAnimators", v15, v16, v17, v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v11);

  -[UIViewPropertyAnimator startAnimation](v11, "startAnimation");
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

- (BOOL)_isAnimating
{
  void *v2;
  BOOL v3;

  -[_UIHyperOutOfProcessViewAnimator _propertyAnimators](self, "_propertyAnimators");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIHyperOutOfProcessViewAnimator)initWithCoder:(id)a3
{
  id v4;
  _UIHyperOutOfProcessViewAnimator *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = -[_UIHyperOutOfProcessViewAnimator initWithDimensions:](self, "initWithDimensions:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_dimensions")));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_boundaryCrossedSpringParameters"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIHyperOutOfProcessViewAnimator _setBoundaryCrossedSpringParameters:](v5, "_setBoundaryCrossedSpringParameters:", v6);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_interactionEndedSpringParameters"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIHyperOutOfProcessViewAnimator _setInteractionEndedSpringParameters:](v5, "_setInteractionEndedSpringParameters:", v7);
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[_UIHyperOutOfProcessViewAnimator _dimensions](self, "_dimensions"), CFSTR("_dimensions"));
  -[_UIHyperOutOfProcessViewAnimator _boundaryCrossedSpringParameters](self, "_boundaryCrossedSpringParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_boundaryCrossedSpringParameters"));

  -[_UIHyperOutOfProcessViewAnimator _interactionEndedSpringParameters](self, "_interactionEndedSpringParameters");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("_interactionEndedSpringParameters"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _UIHyperOutOfProcessViewAnimator *v4;
  void *v5;
  void *v6;

  v4 = -[_UIHyperOutOfProcessViewAnimator initWithDimensions:]([_UIHyperOutOfProcessViewAnimator alloc], "initWithDimensions:", -[_UIHyperOutOfProcessViewAnimator _dimensions](self, "_dimensions"));
  -[_UIHyperOutOfProcessViewAnimator _boundaryCrossedSpringParameters](self, "_boundaryCrossedSpringParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIHyperOutOfProcessViewAnimator _setBoundaryCrossedSpringParameters:](v4, "_setBoundaryCrossedSpringParameters:", v5);

  -[_UIHyperOutOfProcessViewAnimator _interactionEndedSpringParameters](self, "_interactionEndedSpringParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIHyperOutOfProcessViewAnimator _setInteractionEndedSpringParameters:](v4, "_setInteractionEndedSpringParameters:", v6);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[_UIHyperOutOfProcessViewAnimator _dimensions](self, "_dimensions");
    if (v6 != objc_msgSend(v5, "_dimensions"))
    {
      LOBYTE(v12) = 0;
LABEL_19:

      goto LABEL_20;
    }
    -[_UIHyperOutOfProcessViewAnimator _boundaryCrossedSpringParameters](self, "_boundaryCrossedSpringParameters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_boundaryCrossedSpringParameters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      v14 = v9;
      if (!v9 || !v10)
      {
LABEL_17:

LABEL_18:
        goto LABEL_19;
      }
      v12 = objc_msgSend(v9, "isEqual:", v10);

      if (!v12)
        goto LABEL_18;
    }
    -[_UIHyperOutOfProcessViewAnimator _interactionEndedSpringParameters](self, "_interactionEndedSpringParameters");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_interactionEndedSpringParameters");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v15;
    v17 = v16;
    v13 = v17;
    if (v14 == v17)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v14 && v17)
        LOBYTE(v12) = objc_msgSend(v14, "isEqual:", v17);
    }

    goto LABEL_17;
  }
  LOBYTE(v12) = 0;
LABEL_20:

  return v12;
}

+ (id)keyPathsForValuesAffectingSelf
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_boundaryCrossedSpringParameters"), CFSTR("_interactionEndedSpringParameters"), 0);
}

- (NSMutableSet)_propertyAnimators
{
  return self->__propertyAnimators;
}

- (CAFrameRateRange)_preferredFrameRateRange
{
  float minimum;
  float maximum;
  float preferred;
  CAFrameRateRange result;

  minimum = self->__preferredFrameRateRange.minimum;
  maximum = self->__preferredFrameRateRange.maximum;
  preferred = self->__preferredFrameRateRange.preferred;
  result.preferred = preferred;
  result.maximum = maximum;
  result.minimum = minimum;
  return result;
}

- (unsigned)_updateReason
{
  return self->__updateReason;
}

- (_UIHyperOutOfProcessViewAnimatorDelegate)_delegate
{
  return (_UIHyperOutOfProcessViewAnimatorDelegate *)objc_loadWeakRetained((id *)&self->__delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__delegate);
  objc_storeStrong((id *)&self->__propertyAnimators, 0);
  objc_storeStrong((id *)&self->__interactionEndedSpringParameters, 0);
  objc_storeStrong((id *)&self->__boundaryCrossedSpringParameters, 0);
  objc_destroyWeak((id *)&self->__interactor);
}

@end
