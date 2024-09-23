@implementation _UIHyperInProcessViewAnimator

- (_UIHyperInProcessViewAnimator)initWithDimensions:(unint64_t)a3
{
  _UIHyperInProcessViewAnimator *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIHyperInProcessViewAnimator;
  result = -[_UIHyperInProcessViewAnimator init](&v5, sel_init);
  if (result)
    result->__dimensions = a3;
  return result;
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
  NSStringFromSelector(sel__trackingSpringParameters);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v4;
  NSStringFromSelector(sel__nonTrackingSpringParameters);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDescriptionBuilder descriptionForObject:keys:](UIDescriptionBuilder, "descriptionForObject:keys:", self, v6, v9, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
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
    -[_UIHyperInProcessViewAnimator willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("_trackingSpringParameters"));
    v10 = (_UISpringParameters *)-[_UISpringParameters copy](v15, "copy");
    trackingSpringParameters = self->__trackingSpringParameters;
    self->__trackingSpringParameters = v10;

    -[_UIHyperInProcessViewAnimator didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("_trackingSpringParameters"));
    -[_UIHyperInProcessViewAnimator _springAnimationBehavior](self, "_springAnimationBehavior");
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
    -[_UIHyperInProcessViewAnimator willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("_nonTrackingSpringParameters"));
    v10 = (_UISpringParameters *)-[_UISpringParameters copy](v15, "copy");
    nonTrackingSpringParameters = self->__nonTrackingSpringParameters;
    self->__nonTrackingSpringParameters = v10;

    -[_UIHyperInProcessViewAnimator didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("_nonTrackingSpringParameters"));
    -[_UIHyperInProcessViewAnimator _springAnimationBehavior](self, "_springAnimationBehavior");
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
    -[_UIHyperInProcessViewAnimator _trackingSpringParameters](self, "_trackingSpringParameters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIHyperInProcessViewAnimator _nonTrackingSpringParameters](self, "_nonTrackingSpringParameters");
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

- (void)_interactionChanged
{
  void *v3;
  uint64_t v4;
  _QWORD v5[5];

  -[_UIHyperInProcessViewAnimator _interactor](self, "_interactor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_isInteractive");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52___UIHyperInProcessViewAnimator__interactionChanged__block_invoke;
  v5[3] = &unk_1E16B1B28;
  v5[4] = self;
  -[_UIHyperInProcessViewAnimator _animateInteractive:animations:](self, "_animateInteractive:animations:", v4, v5);

}

- (void)_interactionEndedMutatingState:(id)a3
{
  void *v4;
  uint64_t v5;
  _QWORD v6[5];

  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  -[_UIHyperInProcessViewAnimator _interactor](self, "_interactor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_isInteractive");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64___UIHyperInProcessViewAnimator__interactionEndedMutatingState___block_invoke;
  v6[3] = &unk_1E16B1B28;
  v6[4] = self;
  -[_UIHyperInProcessViewAnimator _animateInteractive:animations:](self, "_animateInteractive:animations:", v5, v6);

}

- (void)_animateWithParameters:(id)a3 animations:(id)a4
{
  -[_UIHyperInProcessViewAnimator _animateInteractive:animations:](self, "_animateInteractive:animations:", 0, a4);
}

- (void)_animateInteractive:(BOOL)a3 animations:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v8 = a4;
  -[_UIHyperInProcessViewAnimator _overrideSpringAnimationBehavior](self, "_overrideSpringAnimationBehavior");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v6, v4, v8, 0);
  }
  else
  {
    -[_UIHyperInProcessViewAnimator _springAnimationBehavior](self, "_springAnimationBehavior");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v7, v4, v8, 0);

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIHyperInProcessViewAnimator)initWithCoder:(id)a3
{
  id v4;
  _UIHyperInProcessViewAnimator *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = -[_UIHyperInProcessViewAnimator initWithDimensions:](self, "initWithDimensions:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_dimensions")));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_trackingSpringParameters"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIHyperInProcessViewAnimator _setTrackingSpringParameters:](v5, "_setTrackingSpringParameters:", v6);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_nonTrackingSpringParameters"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIHyperInProcessViewAnimator _setNonTrackingSpringParameters:](v5, "_setNonTrackingSpringParameters:", v7);
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[_UIHyperInProcessViewAnimator _dimensions](self, "_dimensions"), CFSTR("_dimensions"));
  -[_UIHyperInProcessViewAnimator _trackingSpringParameters](self, "_trackingSpringParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_trackingSpringParameters"));

  -[_UIHyperInProcessViewAnimator _nonTrackingSpringParameters](self, "_nonTrackingSpringParameters");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("_nonTrackingSpringParameters"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _UIHyperInProcessViewAnimator *v4;
  void *v5;
  void *v6;

  v4 = -[_UIHyperInProcessViewAnimator initWithDimensions:]([_UIHyperInProcessViewAnimator alloc], "initWithDimensions:", -[_UIHyperInProcessViewAnimator _dimensions](self, "_dimensions"));
  -[_UIHyperInProcessViewAnimator _trackingSpringParameters](self, "_trackingSpringParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIHyperInProcessViewAnimator _setTrackingSpringParameters:](v4, "_setTrackingSpringParameters:", v5);

  -[_UIHyperInProcessViewAnimator _nonTrackingSpringParameters](self, "_nonTrackingSpringParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIHyperInProcessViewAnimator _setNonTrackingSpringParameters:](v4, "_setNonTrackingSpringParameters:", v6);

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
    v6 = -[_UIHyperInProcessViewAnimator _dimensions](self, "_dimensions");
    if (v6 != objc_msgSend(v5, "_dimensions"))
    {
      LOBYTE(v12) = 0;
LABEL_19:

      goto LABEL_20;
    }
    -[_UIHyperInProcessViewAnimator _trackingSpringParameters](self, "_trackingSpringParameters");
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
      {
LABEL_17:

LABEL_18:
        goto LABEL_19;
      }
      v12 = objc_msgSend(v9, "isEqual:", v10);

      if (!v12)
        goto LABEL_18;
    }
    -[_UIHyperInProcessViewAnimator _nonTrackingSpringParameters](self, "_nonTrackingSpringParameters");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_nonTrackingSpringParameters");
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

- (UIViewSpringAnimationBehaviorDescribing)_overrideSpringAnimationBehavior
{
  return self->__overrideSpringAnimationBehavior;
}

- (void)_setOverrideSpringAnimationBehavior:(id)a3
{
  objc_storeStrong((id *)&self->__overrideSpringAnimationBehavior, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__overrideSpringAnimationBehavior, 0);
  objc_storeStrong((id *)&self->__springAnimationBehavior, 0);
  objc_storeStrong((id *)&self->__nonTrackingSpringParameters, 0);
  objc_storeStrong((id *)&self->__trackingSpringParameters, 0);
  objc_destroyWeak((id *)&self->__interactor);
}

@end
