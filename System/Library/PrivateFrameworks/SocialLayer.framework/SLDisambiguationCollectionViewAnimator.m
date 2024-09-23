@implementation SLDisambiguationCollectionViewAnimator

+ (id)init
{
  id v2;
  void *v3;

  v2 = objc_alloc((Class)a1);
  objc_msgSend(v2, "commonInit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)commonInit
{
  SLDisambiguationCollectionViewAnimator *v2;

  v2 = self;
  return -[UIViewPropertyAnimator initWithDuration:timingParameters:](v2, "initWithDuration:timingParameters:", v2, 0.3);
}

- (SLDisambiguationCollectionViewAnimator)initWithCoder:(id)a3
{
  SLDisambiguationCollectionViewAnimator *v4;

  -[SLDisambiguationCollectionViewAnimator commonInit](self, "commonInit", a3);
  v4 = (SLDisambiguationCollectionViewAnimator *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)timingCurveType
{
  return 2;
}

- (UICubicTimingParameters)cubicTimingParameters
{
  return 0;
}

- (UISpringTimingParameters)springTimingParameters
{
  void *v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;

  objc_msgSend((id)objc_opt_class(), "springAnimation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0DC3CA0]);
  objc_msgSend(v2, "mass");
  v5 = v4;
  objc_msgSend(v2, "stiffness");
  v7 = v6;
  objc_msgSend(v2, "damping");
  v9 = (void *)objc_msgSend(v3, "initWithMass:stiffness:damping:initialVelocity:", v5, v7, v8, 10.0, 10.0);

  return (UISpringTimingParameters *)v9;
}

+ (id)springAnimation
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CD2848]);
  objc_msgSend(v2, "setStiffness:", 982.0);
  objc_msgSend(v2, "setDamping:", 46.0);
  return v2;
}

@end
