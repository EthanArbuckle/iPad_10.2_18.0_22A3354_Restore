@implementation UIViewUpdateVelocityAnimationDescription

- (UIViewUpdateVelocityAnimationDescription)initWithVelocity:(id)a3 targetVelocity:(id)a4
{
  id v7;
  id v8;
  UIViewUpdateVelocityAnimationDescription *v9;
  UIViewUpdateVelocityAnimationDescription *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UIViewUpdateVelocityAnimationDescription;
  v9 = -[UIViewUpdateVelocityAnimationDescription init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_velocity, a3);
    objc_storeStrong((id *)&v10->_targetVelocity, a4);
  }

  return v10;
}

+ (id)descriptionWithVelocity:(id)a3 targetVelocity:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithVelocity:targetVelocity:", v7, v6);

  return v8;
}

- (UIVectorOperatable)velocity
{
  return self->_velocity;
}

- (void)setVelocity:(id)a3
{
  objc_storeStrong((id *)&self->_velocity, a3);
}

- (UIVectorOperatable)targetVelocity
{
  return self->_targetVelocity;
}

- (void)setTargetVelocity:(id)a3
{
  objc_storeStrong((id *)&self->_targetVelocity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetVelocity, 0);
  objc_storeStrong((id *)&self->_velocity, 0);
}

@end
