@implementation _UIHyperInProcessPointAnimator

- (_UIHyperInProcessPointAnimator)initWithDimensions:(unint64_t)a3
{
  _UIHyperInProcessPointAnimator *v4;
  _UIHyperInProcessPointAnimator *v5;
  UIViewVectorAnimatableProperty *v6;
  UIViewVectorAnimatableProperty *animatableProperty;
  void *v8;
  _QWORD v10[4];
  id v11;
  id location;
  objc_super v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)_UIHyperInProcessPointAnimator;
  v4 = -[_UIHyperInProcessPointAnimator init](&v13, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->__dimensions = a3;
    v6 = -[UIViewVectorAnimatableProperty initWithLength:]([UIViewVectorAnimatableProperty alloc], "initWithLength:", a3);
    animatableProperty = v5->__animatableProperty;
    v5->__animatableProperty = v6;

    objc_initWeak(&location, v5);
    v14[0] = v5->__animatableProperty;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __53___UIHyperInProcessPointAnimator_initWithDimensions___block_invoke;
    v10[3] = &unk_1E16B3F40;
    objc_copyWeak(&v11, &location);
    +[UIView _createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:](UIView, "_createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:", v8, v10);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(sel__dimensions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  NSStringFromSelector(sel__trackingSpringParameters);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  NSStringFromSelector(sel__nonTrackingSpringParameters);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  NSStringFromSelector(sel__generatesFeedbackWhenBoundaryIsCrossed);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDescriptionBuilder descriptionForObject:keys:](UIDescriptionBuilder, "descriptionForObject:keys:", self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (_UISpringParameters)_trackingSpringParameters
{
  _UISpringParameters *trackingSpringParameters;
  _UISpringParameters *v4;
  _UISpringParameters *v5;

  trackingSpringParameters = self->__trackingSpringParameters;
  if (!trackingSpringParameters)
  {
    +[_UISpringParameters parametersWithDampingRatio:response:](_UISpringParameters, "parametersWithDampingRatio:response:", 1.0, 0.1);
    v4 = (_UISpringParameters *)objc_claimAutoreleasedReturnValue();
    v5 = self->__trackingSpringParameters;
    self->__trackingSpringParameters = v4;

    trackingSpringParameters = self->__trackingSpringParameters;
  }
  return trackingSpringParameters;
}

- (void)_setTrackingSpringParameters:(id)a3
{
  id v4;
  _UISpringParameters *v5;
  _UISpringParameters *v6;
  BOOL v7;
  _UISpringParameters *v8;
  void *v9;
  _UISpringParameters *v10;
  _UISpringParameters *trackingSpringParameters;
  double v12;
  double v13;
  double v14;
  _UISpringParameters *v15;

  v4 = a3;
  v5 = self->__trackingSpringParameters;
  v6 = (_UISpringParameters *)v4;
  v15 = v6;
  if (v5 == v6)
  {

    v9 = v15;
  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[_UISpringParameters isEqual:](v5, "isEqual:", v6);

      v8 = v15;
      if (v7)
        goto LABEL_10;
    }
    else
    {

    }
    -[_UIHyperInProcessPointAnimator willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("_trackingSpringParameters"));
    v10 = (_UISpringParameters *)-[_UISpringParameters copy](v15, "copy");
    trackingSpringParameters = self->__trackingSpringParameters;
    self->__trackingSpringParameters = v10;

    -[_UIHyperInProcessPointAnimator didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("_trackingSpringParameters"));
    -[_UIHyperInProcessPointAnimator _springAnimationBehavior](self, "_springAnimationBehavior");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UISpringParameters _dampingRatio](v15, "_dampingRatio");
    v13 = v12;
    -[_UISpringParameters _response](v15, "_response");
    objc_msgSend(v9, "setTrackingDampingRatio:response:dampingRatioSmoothing:responseSmoothing:", v13, v14, 0.0, 0.0);
  }

  v8 = v15;
LABEL_10:

}

- (_UISpringParameters)_nonTrackingSpringParameters
{
  _UISpringParameters *nonTrackingSpringParameters;
  _UISpringParameters *v4;
  _UISpringParameters *v5;

  nonTrackingSpringParameters = self->__nonTrackingSpringParameters;
  if (!nonTrackingSpringParameters)
  {
    +[_UISpringParameters parametersWithDampingRatio:response:](_UISpringParameters, "parametersWithDampingRatio:response:", 1.0, 0.3);
    v4 = (_UISpringParameters *)objc_claimAutoreleasedReturnValue();
    v5 = self->__nonTrackingSpringParameters;
    self->__nonTrackingSpringParameters = v4;

    nonTrackingSpringParameters = self->__nonTrackingSpringParameters;
  }
  return nonTrackingSpringParameters;
}

- (void)_setNonTrackingSpringParameters:(id)a3
{
  id v4;
  _UISpringParameters *v5;
  _UISpringParameters *v6;
  BOOL v7;
  _UISpringParameters *v8;
  void *v9;
  _UISpringParameters *v10;
  _UISpringParameters *nonTrackingSpringParameters;
  double v12;
  double v13;
  double v14;
  _UISpringParameters *v15;

  v4 = a3;
  v5 = self->__nonTrackingSpringParameters;
  v6 = (_UISpringParameters *)v4;
  v15 = v6;
  if (v5 == v6)
  {

    v9 = v15;
  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[_UISpringParameters isEqual:](v5, "isEqual:", v6);

      v8 = v15;
      if (v7)
        goto LABEL_10;
    }
    else
    {

    }
    -[_UIHyperInProcessPointAnimator willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("_nonTrackingSpringParameters"));
    v10 = (_UISpringParameters *)-[_UISpringParameters copy](v15, "copy");
    nonTrackingSpringParameters = self->__nonTrackingSpringParameters;
    self->__nonTrackingSpringParameters = v10;

    -[_UIHyperInProcessPointAnimator didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("_nonTrackingSpringParameters"));
    -[_UIHyperInProcessPointAnimator _springAnimationBehavior](self, "_springAnimationBehavior");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UISpringParameters _dampingRatio](v15, "_dampingRatio");
    v13 = v12;
    -[_UISpringParameters _response](v15, "_response");
    objc_msgSend(v9, "setDampingRatio:response:", v13, v14);
  }

  v8 = v15;
LABEL_10:

}

- (UIViewSpringAnimationBehavior)_springAnimationBehavior
{
  UIViewSpringAnimationBehavior *springAnimationBehavior;
  UIViewSpringAnimationBehavior *v4;
  UIViewSpringAnimationBehavior *v5;
  void *v6;
  void *v7;
  UIViewSpringAnimationBehavior *v8;
  double v9;
  double v10;
  double v11;
  UIViewSpringAnimationBehavior *v12;
  double v13;
  double v14;
  double v15;

  springAnimationBehavior = self->__springAnimationBehavior;
  if (!springAnimationBehavior)
  {
    v4 = objc_alloc_init(UIViewSpringAnimationBehavior);
    v5 = self->__springAnimationBehavior;
    self->__springAnimationBehavior = v4;

    -[UIViewSpringAnimationBehavior setInertialTargetSmoothing:](self->__springAnimationBehavior, "setInertialTargetSmoothing:", 0.08);
    -[UIViewSpringAnimationBehavior setInertialProjectionDeceleration:](self->__springAnimationBehavior, "setInertialProjectionDeceleration:", 0.995);
    -[_UIHyperInProcessPointAnimator _trackingSpringParameters](self, "_trackingSpringParameters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIHyperInProcessPointAnimator _nonTrackingSpringParameters](self, "_nonTrackingSpringParameters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = self->__springAnimationBehavior;
    objc_msgSend(v6, "_dampingRatio");
    v10 = v9;
    objc_msgSend(v6, "_response");
    -[UIViewSpringAnimationBehavior setTrackingDampingRatio:response:dampingRatioSmoothing:responseSmoothing:](v8, "setTrackingDampingRatio:response:dampingRatioSmoothing:responseSmoothing:", v10, v11, 0.0, 0.0);
    v12 = self->__springAnimationBehavior;
    objc_msgSend(v7, "_dampingRatio");
    v14 = v13;
    objc_msgSend(v7, "_response");
    -[UIViewSpringAnimationBehavior setDampingRatio:response:](v12, "setDampingRatio:response:", v14, v15);

    springAnimationBehavior = self->__springAnimationBehavior;
  }
  return springAnimationBehavior;
}

- (UISelectionFeedbackGenerator)_feedbackGenerator
{
  UISelectionFeedbackGenerator *feedbackGenerator;
  UISelectionFeedbackGenerator *v4;
  UISelectionFeedbackGenerator *v5;

  feedbackGenerator = self->__feedbackGenerator;
  if (!feedbackGenerator)
  {
    v4 = objc_alloc_init(UISelectionFeedbackGenerator);
    v5 = self->__feedbackGenerator;
    self->__feedbackGenerator = v4;

    feedbackGenerator = self->__feedbackGenerator;
  }
  return feedbackGenerator;
}

- (void)_updateAnimatablePropertyValuesToConstrainedPoint
{
  void *v3;
  id v4;

  -[_UIHyperInProcessPointAnimator _animatableProperty](self, "_animatableProperty");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIHyperInProcessPointAnimator _interactor](self, "_interactor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_copyValue:", objc_msgSend(v3, "_constrainedPoint"));

}

- (void)_interactionBegan
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[_UIHyperInProcessPointAnimator _generatesFeedbackWhenBoundaryIsCrossed](self, "_generatesFeedbackWhenBoundaryIsCrossed"))
  {
    -[_UIHyperInProcessPointAnimator _feedbackGenerator](self, "_feedbackGenerator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "prepare");

  }
  -[_UIHyperInProcessPointAnimator _interactor](self, "_interactor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIHyperInProcessPointAnimator _interactor](self, "_interactor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_hyperInteractorApplyPresentationPoint:", v6);

  -[_UIHyperInProcessPointAnimator _updateAnimatablePropertyValuesToConstrainedPoint](self, "_updateAnimatablePropertyValuesToConstrainedPoint");
}

- (void)_interactionChanged
{
  _QWORD v2[5];
  _QWORD v3[5];

  v2[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53___UIHyperInProcessPointAnimator__interactionChanged__block_invoke;
  v3[3] = &unk_1E16B1B28;
  v3[4] = self;
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __53___UIHyperInProcessPointAnimator__interactionChanged__block_invoke_2;
  v2[3] = &unk_1E16B1B28;
  -[_UIHyperInProcessPointAnimator _animateWithPrelude:animations:](self, "_animateWithPrelude:animations:", v3, v2);
}

- (void)_interactionEndedMutatingState:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v6[4] = self;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65___UIHyperInProcessPointAnimator__interactionEndedMutatingState___block_invoke;
  v7[3] = &unk_1E16B2F48;
  v7[4] = self;
  v8 = v4;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65___UIHyperInProcessPointAnimator__interactionEndedMutatingState___block_invoke_2;
  v6[3] = &unk_1E16B1B28;
  v5 = v4;
  -[_UIHyperInProcessPointAnimator _animateWithPrelude:animations:](self, "_animateWithPrelude:animations:", v7, v6);

}

- (void)_animateWithParameters:(id)a3 animations:(id)a4
{
  id v5;
  id v6;
  UIViewPropertyAnimator *v7;
  UISpringTimingParameters *v8;

  v5 = a4;
  v6 = a3;
  v8 = -[UISpringTimingParameters initWithParameters:]([UISpringTimingParameters alloc], "initWithParameters:", v6);

  v7 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]([UIViewPropertyAnimator alloc], "initWithDuration:timingParameters:", v8, 0.0);
  -[UIViewPropertyAnimator addAnimations:](v7, "addAnimations:", v5);

  -[UIViewPropertyAnimator startAnimation](v7, "startAnimation");
}

- (void)_animateWithPrelude:(id)a3 animations:(id)a4
{
  void (**v6)(_QWORD);
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[5];

  v6 = (void (**)(_QWORD))a3;
  v7 = a4;
  -[_UIHyperInProcessPointAnimator _interactor](self, "_interactor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_isOverridingPresentationPoint");

  if ((v9 & 1) == 0)
  {
    -[_UIHyperInProcessPointAnimator _interactor](self, "_interactor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIHyperInProcessPointAnimator _animatableProperty](self, "_animatableProperty");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_copyOverridePresentationPoint:", objc_msgSend(v11, "_presentationValue"));

    -[_UIHyperInProcessPointAnimator _interactor](self, "_interactor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_setOverridingPresentationPoint:", 1);

  }
  v6[2](v6);
  -[_UIHyperInProcessPointAnimator _springAnimationBehavior](self, "_springAnimationBehavior");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIHyperInProcessPointAnimator _interactor](self, "_interactor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "_isInteractive");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __65___UIHyperInProcessPointAnimator__animateWithPrelude_animations___block_invoke;
  v16[3] = &unk_1E16B2588;
  v16[4] = self;
  +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v13, v15, v7, v16);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIHyperInProcessPointAnimator)initWithCoder:(id)a3
{
  id v4;
  _UIHyperInProcessPointAnimator *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  v5 = -[_UIHyperInProcessPointAnimator initWithDimensions:](self, "initWithDimensions:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_dimensions")));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_trackingSpringParameters"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIHyperInProcessPointAnimator _setTrackingSpringParameters:](v5, "_setTrackingSpringParameters:", v6);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_nonTrackingSpringParameters"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIHyperInProcessPointAnimator _setNonTrackingSpringParameters:](v5, "_setNonTrackingSpringParameters:", v7);

  v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_generatesFeedbackWhenBoundaryIsCrossed"));
  -[_UIHyperInProcessPointAnimator _setGeneratesFeedbackWhenBoundaryIsCrossed:](v5, "_setGeneratesFeedbackWhenBoundaryIsCrossed:", v8);
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeInteger:forKey:", -[_UIHyperInProcessPointAnimator _dimensions](self, "_dimensions"), CFSTR("_dimensions"));
  -[_UIHyperInProcessPointAnimator _trackingSpringParameters](self, "_trackingSpringParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("_trackingSpringParameters"));

  -[_UIHyperInProcessPointAnimator _nonTrackingSpringParameters](self, "_nonTrackingSpringParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("_nonTrackingSpringParameters"));

  objc_msgSend(v6, "encodeBool:forKey:", -[_UIHyperInProcessPointAnimator _generatesFeedbackWhenBoundaryIsCrossed](self, "_generatesFeedbackWhenBoundaryIsCrossed"), CFSTR("_generatesFeedbackWhenBoundaryIsCrossed"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  _UIHyperInProcessPointAnimator *v4;
  void *v5;
  void *v6;

  v4 = -[_UIHyperInProcessPointAnimator initWithDimensions:]([_UIHyperInProcessPointAnimator alloc], "initWithDimensions:", -[_UIHyperInProcessPointAnimator _dimensions](self, "_dimensions"));
  -[_UIHyperInProcessPointAnimator _trackingSpringParameters](self, "_trackingSpringParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIHyperInProcessPointAnimator _setTrackingSpringParameters:](v4, "_setTrackingSpringParameters:", v5);

  -[_UIHyperInProcessPointAnimator _nonTrackingSpringParameters](self, "_nonTrackingSpringParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIHyperInProcessPointAnimator _setNonTrackingSpringParameters:](v4, "_setNonTrackingSpringParameters:", v6);

  -[_UIHyperInProcessPointAnimator _setGeneratesFeedbackWhenBoundaryIsCrossed:](v4, "_setGeneratesFeedbackWhenBoundaryIsCrossed:", -[_UIHyperInProcessPointAnimator _generatesFeedbackWhenBoundaryIsCrossed](self, "_generatesFeedbackWhenBoundaryIsCrossed"));
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
  int v15;
  void *v16;
  void *v17;
  id v18;
  _BOOL4 v19;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[_UIHyperInProcessPointAnimator _dimensions](self, "_dimensions");
    if (v6 != objc_msgSend(v5, "_dimensions"))
    {
      LOBYTE(v12) = 0;
LABEL_21:

      goto LABEL_22;
    }
    -[_UIHyperInProcessPointAnimator _trackingSpringParameters](self, "_trackingSpringParameters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_trackingSpringParameters");
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
        goto LABEL_19;
      v15 = objc_msgSend(v9, "isEqual:", v10);

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_20:

        goto LABEL_21;
      }
    }
    -[_UIHyperInProcessPointAnimator _nonTrackingSpringParameters](self, "_nonTrackingSpringParameters");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_nonTrackingSpringParameters");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v16;
    v18 = v17;
    v13 = v18;
    if (v14 == v18)
    {

    }
    else
    {
      if (!v14 || !v18)
      {

        LOBYTE(v12) = 0;
        goto LABEL_19;
      }
      v12 = objc_msgSend(v14, "isEqual:", v18);

      if (!v12)
        goto LABEL_19;
    }
    v19 = -[_UIHyperInProcessPointAnimator _generatesFeedbackWhenBoundaryIsCrossed](self, "_generatesFeedbackWhenBoundaryIsCrossed");
    v12 = v19 ^ objc_msgSend(v5, "_generatesFeedbackWhenBoundaryIsCrossed") ^ 1;
LABEL_19:

    goto LABEL_20;
  }
  LOBYTE(v12) = 0;
LABEL_22:

  return v12;
}

- (unint64_t)_dimensions
{
  return self->__dimensions;
}

- (_UIHyperInteractor)_interactor
{
  return (_UIHyperInteractor *)objc_loadWeakRetained((id *)&self->__interactor);
}

- (void)_setInteractor:(id)a3
{
  objc_storeWeak((id *)&self->__interactor, a3);
}

- (BOOL)_generatesFeedbackWhenBoundaryIsCrossed
{
  return self->__generatesFeedbackWhenBoundaryIsCrossed;
}

- (void)_setGeneratesFeedbackWhenBoundaryIsCrossed:(BOOL)a3
{
  self->__generatesFeedbackWhenBoundaryIsCrossed = a3;
}

- (UIViewVectorAnimatableProperty)_animatableProperty
{
  return self->__animatableProperty;
}

- (BOOL)_regionChangedDiscontinuouslyOnChange
{
  return self->__regionChangedDiscontinuouslyOnChange;
}

- (void)_setRegionChangedDiscontinuouslyOnChange:(BOOL)a3
{
  self->__regionChangedDiscontinuouslyOnChange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__animatableProperty, 0);
  objc_storeStrong((id *)&self->__feedbackGenerator, 0);
  objc_storeStrong((id *)&self->__springAnimationBehavior, 0);
  objc_storeStrong((id *)&self->__nonTrackingSpringParameters, 0);
  objc_storeStrong((id *)&self->__trackingSpringParameters, 0);
  objc_destroyWeak((id *)&self->__interactor);
}

@end
