@implementation UIViewFloatAnimatableProperty

- (double)value
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  objc_opt_self();
  if (_os_feature_enabled_impl())
  {
    -[UIAnimatablePropertyWrapper swiftAnimatableProperty](self, "swiftAnimatableProperty");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "doubleValue");
  }
  else
  {
    -[UIViewFloatAnimatableProperty _floatAnimatableProperty](self, "_floatAnimatableProperty");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
  }
  v6 = v5;

  return v6;
}

- (double)presentationValue
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  objc_opt_self();
  if (_os_feature_enabled_impl())
  {
    -[UIAnimatablePropertyWrapper swiftAnimatableProperty](self, "swiftAnimatableProperty");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "presentationValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "doubleValue");
  }
  else
  {
    -[UIViewFloatAnimatableProperty _floatAnimatableProperty](self, "_floatAnimatableProperty");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "presentationValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
  }
  v6 = v5;

  return v6;
}

- (void)setValue:(double)a3
{
  void *v5;
  id v6;

  objc_opt_self();
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[UIAnimatablePropertyWrapper swiftAnimatableProperty](self, "swiftAnimatableProperty");
  }
  else
  {
    +[UIInterpolatedFloat valueWithFloat:](UIInterpolatedFloat, "valueWithFloat:", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[UIViewFloatAnimatableProperty _floatAnimatableProperty](self, "_floatAnimatableProperty");
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:", v6);

}

- (UIViewFloatAnimatableProperty)init
{
  void *v3;
  UIViewFloatAnimatableProperty *v4;
  objc_super v6;

  +[UIInterpolatedFloat valueWithFloat:](UIInterpolatedFloat, "valueWithFloat:", 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)UIViewFloatAnimatableProperty;
  v4 = -[UIAnimatablePropertyWrapper initWithValue:](&v6, sel_initWithValue_, v3);

  return v4;
}

- (double)velocity
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  objc_opt_self();
  if (_os_feature_enabled_impl())
  {
    -[UIAnimatablePropertyWrapper swiftAnimatableProperty](self, "swiftAnimatableProperty");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "velocity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "doubleValue");
  }
  else
  {
    -[UIViewFloatAnimatableProperty _floatAnimatableProperty](self, "_floatAnimatableProperty");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "velocity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
  }
  v6 = v5;

  return v6;
}

- (void)setVelocity:(double)a3
{
  void *v5;
  id v6;

  objc_opt_self();
  if (_os_feature_enabled_impl())
  {
    -[UIAnimatablePropertyWrapper swiftAnimatableProperty](self, "swiftAnimatableProperty");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  }
  else
  {
    -[UIViewFloatAnimatableProperty _floatAnimatableProperty](self, "_floatAnimatableProperty");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    +[UIInterpolatedFloat valueWithFloat:](UIInterpolatedFloat, "valueWithFloat:", a3);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setVelocity:", v5);

}

@end
