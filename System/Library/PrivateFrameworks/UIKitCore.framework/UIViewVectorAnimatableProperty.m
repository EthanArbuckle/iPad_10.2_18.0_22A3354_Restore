@implementation UIViewVectorAnimatableProperty

- (UIViewVectorAnimatableProperty)initWithLength:(unint64_t)a3
{
  UIInterpolatedVector *v5;
  UIViewVectorAnimatableProperty *v6;
  objc_super v8;

  v5 = -[UIInterpolatedVector initWithLength:]([UIInterpolatedVector alloc], "initWithLength:", a3);
  v8.receiver = self;
  v8.super_class = (Class)UIViewVectorAnimatableProperty;
  v6 = -[UIAnimatablePropertyWrapper initWithValue:](&v8, sel_initWithValue_, v5);

  if (v6)
  {
    v6->__length = a3;
    objc_opt_self();
    if (_os_feature_enabled_impl())
      v6->_vector = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  objc_opt_self();
  if (_os_feature_enabled_impl())
    free(self->_vector);
  v3.receiver = self;
  v3.super_class = (Class)UIViewVectorAnimatableProperty;
  -[UIAnimatablePropertyWrapper dealloc](&v3, sel_dealloc);
}

- (const)_value
{
  void *v3;
  void *v4;
  void *v6;
  void *v7;
  const double *v8;

  objc_opt_self();
  if (_os_feature_enabled_impl())
  {
    -[UIAnimatablePropertyWrapper swiftAnimatableProperty](self, "swiftAnimatableProperty");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewVectorAnimatableProperty _updateVectorFromArray:](self, "_updateVectorFromArray:", v4);

    return self->_vector;
  }
  else
  {
    -[UIViewVectorAnimatableProperty _vectorAnimatableProperty](self, "_vectorAnimatableProperty");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (const double *)objc_msgSend(v7, "vector");

    return v8;
  }
}

- (void)_mutateValue:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(id, double *);

  v6 = (void (**)(id, double *))a3;
  objc_opt_self();
  if (_os_feature_enabled_impl())
  {
    -[UIViewVectorAnimatableProperty _updateVectorFromArray:](self, "_updateVectorFromArray:", MEMORY[0x1E0C9AA60]);
    v6[2](v6, self->_vector);
    -[UIViewVectorAnimatableProperty _makeArrayFromVector:](self, "_makeArrayFromVector:", self->_vector);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAnimatablePropertyWrapper swiftAnimatableProperty](self, "swiftAnimatableProperty");
  }
  else
  {
    +[UIInterpolatedVector valueWithVectorMutator:length:](UIInterpolatedVector, "valueWithVectorMutator:length:", v6, self->__length);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewVectorAnimatableProperty _vectorAnimatableProperty](self, "_vectorAnimatableProperty");
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:", v4);

}

- (void)_copyValue:(const double *)a3
{
  void *v5;
  id v6;

  objc_opt_self();
  if (_os_feature_enabled_impl())
  {
    -[UIViewVectorAnimatableProperty _makeArrayFromVector:](self, "_makeArrayFromVector:", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[UIAnimatablePropertyWrapper swiftAnimatableProperty](self, "swiftAnimatableProperty");
  }
  else
  {
    +[UIInterpolatedVector valueWithVector:length:](UIInterpolatedVector, "valueWithVector:length:", a3, self->__length);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[UIViewVectorAnimatableProperty _vectorAnimatableProperty](self, "_vectorAnimatableProperty");
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:", v6);

}

- (const)_presentationValue
{
  void *v3;
  void *v4;
  void *v6;
  void *v7;
  const double *v8;

  objc_opt_self();
  if (_os_feature_enabled_impl())
  {
    -[UIAnimatablePropertyWrapper swiftAnimatableProperty](self, "swiftAnimatableProperty");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "presentationValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewVectorAnimatableProperty _updateVectorFromArray:](self, "_updateVectorFromArray:", v4);

    return self->_vector;
  }
  else
  {
    -[UIViewVectorAnimatableProperty _vectorAnimatableProperty](self, "_vectorAnimatableProperty");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentationValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (const double *)objc_msgSend(v7, "vector");

    return v8;
  }
}

- (const)_velocity
{
  void *v3;
  void *v4;
  void *v6;
  void *v7;
  const double *v8;

  objc_opt_self();
  if (_os_feature_enabled_impl())
  {
    -[UIAnimatablePropertyWrapper swiftAnimatableProperty](self, "swiftAnimatableProperty");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "velocity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewVectorAnimatableProperty _updateVectorFromArray:](self, "_updateVectorFromArray:", v4);

    return self->_vector;
  }
  else
  {
    -[UIViewVectorAnimatableProperty _vectorAnimatableProperty](self, "_vectorAnimatableProperty");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "velocity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (const double *)objc_msgSend(v7, "vector");

    return v8;
  }
}

- (void)_mutateVelocity:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(id, double *);

  v6 = (void (**)(id, double *))a3;
  objc_opt_self();
  if (_os_feature_enabled_impl())
  {
    -[UIViewVectorAnimatableProperty _updateVectorFromArray:](self, "_updateVectorFromArray:", MEMORY[0x1E0C9AA60]);
    v6[2](v6, self->_vector);
    -[UIViewVectorAnimatableProperty _makeArrayFromVector:](self, "_makeArrayFromVector:", self->_vector);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAnimatablePropertyWrapper swiftAnimatableProperty](self, "swiftAnimatableProperty");
  }
  else
  {
    +[UIInterpolatedVector valueWithVectorMutator:length:](UIInterpolatedVector, "valueWithVectorMutator:length:", v6, self->__length);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewVectorAnimatableProperty _vectorAnimatableProperty](self, "_vectorAnimatableProperty");
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setVelocity:", v4);

}

- (void)_copyVelocity:(const double *)a3
{
  void *v5;
  id v6;

  objc_opt_self();
  if (_os_feature_enabled_impl())
  {
    -[UIViewVectorAnimatableProperty _makeArrayFromVector:](self, "_makeArrayFromVector:", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[UIAnimatablePropertyWrapper swiftAnimatableProperty](self, "swiftAnimatableProperty");
  }
  else
  {
    +[UIInterpolatedVector valueWithVector:length:](UIInterpolatedVector, "valueWithVector:length:", a3, self->__length);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[UIViewVectorAnimatableProperty _vectorAnimatableProperty](self, "_vectorAnimatableProperty");
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setVelocity:", v6);

}

- (void)_updateVectorFromArray:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  double v7;
  id v8;

  v4 = a3;
  if (self->__length)
  {
    v5 = 0;
    v8 = v4;
    do
    {
      if (objc_msgSend(v4, "count") <= v5)
      {
        self->_vector[v5] = 0.0;
      }
      else
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "doubleValue");
        self->_vector[v5] = v7;

      }
      v4 = v8;
      ++v5;
    }
    while (self->__length > v5);
  }

}

- (id)_makeArrayFromVector:(const double *)a3
{
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (self->__length)
  {
    v6 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3[v6]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v7);

      ++v6;
    }
    while (self->__length > v6);
  }
  v8 = (void *)objc_msgSend(v5, "copy");

  return v8;
}

- (unint64_t)_length
{
  return self->__length;
}

@end
