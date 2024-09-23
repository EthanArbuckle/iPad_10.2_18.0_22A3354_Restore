@implementation ICNoteBrowseCollectionViewAnimator

+ (id)animator
{
  id v2;
  void *v3;

  v2 = objc_alloc((Class)a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "commonInit"));

  return v3;
}

- (id)commonInit
{
  ICNoteBrowseCollectionViewAnimator *v2;
  id v3;
  void *v4;
  ICNoteBrowseCollectionViewAnimator *v5;

  v2 = self;
  v3 = objc_msgSend((id)objc_opt_class(v2), "springAnimation");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_msgSend(v4, "settlingDuration");
  v5 = -[ICNoteBrowseCollectionViewAnimator initWithDuration:timingParameters:](v2, "initWithDuration:timingParameters:", v2);

  return v5;
}

- (ICNoteBrowseCollectionViewAnimator)initWithCoder:(id)a3
{
  ICNoteBrowseCollectionViewAnimator *v4;

  v4 = (ICNoteBrowseCollectionViewAnimator *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseCollectionViewAnimator commonInit](self, "commonInit", a3));

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
  id v2;
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  v2 = objc_msgSend((id)objc_opt_class(self), "springAnimation");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = objc_alloc((Class)UISpringTimingParameters);
  objc_msgSend(v3, "mass");
  v6 = v5;
  objc_msgSend(v3, "stiffness");
  v8 = v7;
  objc_msgSend(v3, "damping");
  v10 = v9;
  objc_msgSend(v3, "initialVelocity");
  v12 = v11;
  objc_msgSend(v3, "initialVelocity");
  v14 = objc_msgSend(v4, "initWithMass:stiffness:damping:initialVelocity:", v6, v8, v10, v12, v13);

  return (UISpringTimingParameters *)v14;
}

+ (id)springAnimation
{
  id v2;

  v2 = objc_alloc_init((Class)CASpringAnimation);
  objc_msgSend(v2, "setStiffness:", 350.0);
  objc_msgSend(v2, "setDamping:", 31.0);
  return v2;
}

@end
