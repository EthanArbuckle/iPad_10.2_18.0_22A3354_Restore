@implementation UIAnimatablePropertyWrapper

- (UIAnimatableProperty)animatableProperty
{
  return self->_animatableProperty;
}

- (void)invalidate
{
  id v3;

  objc_opt_self();
  if (_os_feature_enabled_impl())
  {
    -[UIAnimatablePropertyWrapper swiftAnimatableProperty](self, "swiftAnimatableProperty");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidateAndStopImmediately:", 1);
  }
  else
  {
    -[UIAnimatablePropertyWrapper animatableProperty](self, "animatableProperty");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidate");
  }

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_opt_self();
  if (_os_feature_enabled_impl())
    -[UIAnimatablePropertyWrapper swiftAnimatableProperty](self, "swiftAnimatableProperty");
  else
    -[UIAnimatablePropertyWrapper animatableProperty](self, "animatableProperty");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateAndStopImmediately:", 0);

  v4.receiver = self;
  v4.super_class = (Class)UIAnimatablePropertyWrapper;
  -[UIAnimatablePropertyWrapper dealloc](&v4, sel_dealloc);
}

- (void)setTransformer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIAnimatablePropertyWrapper animatableProperty](self, "animatableProperty");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTransformer:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swiftAnimatableProperty, 0);
  objc_storeStrong((id *)&self->_animatableProperty, 0);
}

+ (id)makeSwiftAnimatablePropertyForInitialVector:(id)a3
{
  id v3;

  swift_unknownObjectRetain();
  v3 = sub_18579E044();
  swift_unknownObjectRelease();
  return v3;
}

- (UIAnimatablePropertyWrapper)initWithValue:(id)a3
{
  id v4;
  UIAnimatablePropertyWrapper *v5;
  UIAnimatableProperty *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UIAnimatablePropertyWrapper;
  v5 = -[UIAnimatablePropertyWrapper init](&v10, sel_init);
  if (v5)
  {
    objc_opt_self();
    if (_os_feature_enabled_impl())
    {
      +[UIAnimatablePropertyWrapper makeSwiftAnimatablePropertyForInitialVector:](UIAnimatablePropertyWrapper, "makeSwiftAnimatablePropertyForInitialVector:", v4);
      v6 = (UIAnimatableProperty *)objc_claimAutoreleasedReturnValue();
      v7 = 32;
    }
    else
    {
      v6 = -[UIAnimatableProperty initWithInvalidationCallback:]([UIAnimatableProperty alloc], "initWithInvalidationCallback:", &__block_literal_global_470);
      v7 = 24;
    }
    v8 = *(Class *)((char *)&v5->super.super.isa + v7);
    *(Class *)((char *)&v5->super.super.isa + v7) = (Class)v6;

  }
  return v5;
}

- (BOOL)isInvalidated
{
  void *v3;
  char v4;

  objc_opt_self();
  if (_os_feature_enabled_impl())
    -[UIAnimatablePropertyWrapper swiftAnimatableProperty](self, "swiftAnimatableProperty");
  else
    -[UIAnimatablePropertyWrapper animatableProperty](self, "animatableProperty");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInvalidated");

  return v4;
}

- (void)set__swiftTransformer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIAnimatablePropertyWrapper swiftAnimatableProperty](self, "swiftAnimatableProperty");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTransformer:", v4);

}

- (id)__swiftTransformer
{
  void *v2;
  void *v3;

  -[UIAnimatablePropertyWrapper swiftAnimatableProperty](self, "swiftAnimatableProperty");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transformer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)transformer
{
  void *v2;
  void *v3;

  -[UIAnimatablePropertyWrapper animatableProperty](self, "animatableProperty");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transformer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isVelocityUsableForVFD
{
  void *v3;
  char v4;

  objc_opt_self();
  if (_os_feature_enabled_impl())
    -[UIAnimatablePropertyWrapper swiftAnimatableProperty](self, "swiftAnimatableProperty");
  else
    -[UIAnimatablePropertyWrapper animatableProperty](self, "animatableProperty");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isVelocityUsableForVFD");

  return v4;
}

- (void)setVelocityUsableForVFD:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  objc_opt_self();
  if (_os_feature_enabled_impl())
  {
    -[UIAnimatablePropertyWrapper swiftAnimatableProperty](self, "swiftAnimatableProperty");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIsVelocityUsableForVFD:", v3);
  }
  else
  {
    -[UIAnimatablePropertyWrapper animatableProperty](self, "animatableProperty");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setVelocityUsableForVFD:", v3);
  }

}

- (UIBridgedAnimatableProperty)swiftAnimatableProperty
{
  return self->_swiftAnimatableProperty;
}

@end
