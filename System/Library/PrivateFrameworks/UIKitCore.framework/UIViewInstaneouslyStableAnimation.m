@implementation UIViewInstaneouslyStableAnimation

- (UIVectorOperatable)targetValue
{
  return self->_targetValue;
}

- (id)stepWithDelta:(double)a3
{
  return self->_targetValue;
}

- (BOOL)isStable
{
  return 1;
}

- (UIViewInstaneouslyStableAnimation)initWithTargetValue:(id)a3 velocity:(id)a4
{
  id v7;
  id v8;
  UIViewInstaneouslyStableAnimation *v9;
  UIViewInstaneouslyStableAnimation *v10;
  uint64_t v11;
  UIVectorOperatable *velocity;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UIViewInstaneouslyStableAnimation;
  v9 = -[UIViewInstaneouslyStableAnimation init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_targetValue, a3);
    v11 = objc_msgSend(v8, "copy");
    velocity = v10->_velocity;
    v10->_velocity = (UIVectorOperatable *)v11;

  }
  return v10;
}

- (void)setTargetValue:(id)a3
{
  objc_storeStrong((id *)&self->_targetValue, a3);
}

- (id)velocity
{
  return self->_velocity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetValue, 0);
  objc_storeStrong((id *)&self->_velocity, 0);
}

- (void)setVelocity:(id)a3
{
  UIVectorOperatable *v4;
  UIVectorOperatable *velocity;

  v4 = (UIVectorOperatable *)objc_msgSend(a3, "copy");
  velocity = self->_velocity;
  self->_velocity = v4;

}

- (id)value
{
  return self->_targetValue;
}

@end
