@implementation UIViewFrictionBounceAnimation

- (id)stepWithDelta:(double)a3
{
  id *p_current;
  long double v5;
  id intermediate;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id current;

  if (a3 == 0.0)
  {
    p_current = &self->_current;
  }
  else
  {
    v5 = 1.0 - pow(self->_deceleration, a3 * 1000.0);
    intermediate = self->_intermediate;
    -[UIViewFrictionBounceAnimation updatedTarget](self, "updatedTarget");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(intermediate, "interpolateTo:progress:", v7, (double)v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = self->_intermediate;
    self->_intermediate = v8;

    p_current = &self->_current;
    objc_msgSend(self->_current, "interpolateTo:progress:", self->_intermediate, (double)v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    current = self->_current;
    self->_current = v10;

  }
  return *p_current;
}

- (id)updatedTarget
{
  return self->_targetValue;
}

- (UIViewFrictionBounceAnimation)initWithCurrent:(id)a3 target:(id)a4
{
  id v6;
  id v7;
  UIViewFrictionBounceAnimation *v8;
  uint64_t v9;
  id stableTarget;
  uint64_t v11;
  UIVectorOperatable *targetValue;
  uint64_t v13;
  id current;
  uint64_t v15;
  id intermediate;
  void *v17;
  uint64_t v18;
  id epsilon;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)UIViewFrictionBounceAnimation;
  v8 = -[UIViewFrictionBounceAnimation init](&v21, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    stableTarget = v8->_stableTarget;
    v8->_stableTarget = (id)v9;

    v11 = objc_msgSend(v7, "copy");
    targetValue = v8->_targetValue;
    v8->_targetValue = (UIVectorOperatable *)v11;

    v13 = objc_msgSend(v6, "copy");
    current = v8->_current;
    v8->_current = (id)v13;

    v15 = objc_msgSend(v6, "copy");
    intermediate = v8->_intermediate;
    v8->_intermediate = (id)v15;

    objc_msgSend((id)objc_opt_class(), "epsilonCompatibleWithVector:", v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "copy");
    epsilon = v8->_epsilon;
    v8->_epsilon = (id)v18;

    v8->_deceleration = 0.998;
  }

  return v8;
}

- (BOOL)isStable
{
  UIViewFrictionBounceAnimation *v2;
  void *v3;

  v2 = self;
  -[UIViewFrictionBounceAnimation updatedTarget](self, "updatedTarget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "isApproximatelyEqualTo:withinEpsilon:", v2->_current, v2->_epsilon);

  return (char)v2;
}

- (id)velocity
{
  return 0;
}

- (UIVectorOperatable)targetValue
{
  return self->_targetValue;
}

- (void)setTargetValue:(id)a3
{
  objc_storeStrong((id *)&self->_targetValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetValue, 0);
  objc_storeStrong(&self->_epsilon, 0);
  objc_storeStrong(&self->_current, 0);
  objc_storeStrong(&self->_intermediate, 0);
  objc_storeStrong(&self->_stableTarget, 0);
}

@end
