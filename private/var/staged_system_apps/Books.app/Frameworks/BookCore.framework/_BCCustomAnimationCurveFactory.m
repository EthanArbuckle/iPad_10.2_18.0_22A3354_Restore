@implementation _BCCustomAnimationCurveFactory

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_BCCustomAnimationCurveFactory springAnimation](self, "springAnimation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CASpringAnimation animationWithKeyPath:](CASpringAnimation, "animationWithKeyPath:", v5));

  objc_msgSend(v6, "mass");
  objc_msgSend(v7, "setMass:");
  objc_msgSend(v6, "stiffness");
  objc_msgSend(v7, "setStiffness:");
  objc_msgSend(v6, "damping");
  objc_msgSend(v7, "setDamping:");
  objc_msgSend(v6, "initialVelocity");
  objc_msgSend(v7, "setInitialVelocity:");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "timingFunction"));
  objc_msgSend(v7, "setTimingFunction:", v8);

  objc_msgSend(v6, "duration");
  objc_msgSend(v7, "setDuration:");

  return v7;
}

- (id)_timingFunctionForAnimation
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_BCCustomAnimationCurveFactory springAnimation](self, "springAnimation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "timingFunction"));

  return v3;
}

- (CASpringAnimation)springAnimation
{
  return self->_springAnimation;
}

- (void)setSpringAnimation:(id)a3
{
  objc_storeStrong((id *)&self->_springAnimation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_springAnimation, 0);
}

@end
