@implementation RTPlaceTypeClassifierModelMultiClassOutput

- (RTPlaceTypeClassifierModelMultiClassOutput)initWithTarget:(int64_t)a3 classProbability:(id)a4
{
  id v7;
  RTPlaceTypeClassifierModelMultiClassOutput *v8;
  RTPlaceTypeClassifierModelMultiClassOutput *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)RTPlaceTypeClassifierModelMultiClassOutput;
  v8 = -[RTPlaceTypeClassifierModelMultiClassOutput init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_target = a3;
    objc_storeStrong((id *)&v8->_classProbability, a4);
  }

  return v9;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E932C280);
}

- (id)featureValueForName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("target")))
  {
    objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithInt64:", -[RTPlaceTypeClassifierModelMultiClassOutput target](self, "target"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("classProbability")))
  {
    v6 = (void *)MEMORY[0x1E0C9E918];
    -[RTPlaceTypeClassifierModelMultiClassOutput classProbability](self, "classProbability");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "featureValueWithDictionary:error:", v7, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)target
{
  return self->_target;
}

- (void)setTarget:(int64_t)a3
{
  self->_target = a3;
}

- (NSDictionary)classProbability
{
  return self->_classProbability;
}

- (void)setClassProbability:(id)a3
{
  objc_storeStrong((id *)&self->_classProbability, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classProbability, 0);
}

@end
