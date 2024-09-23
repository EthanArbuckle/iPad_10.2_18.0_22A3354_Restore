@implementation RTPlaceTypeClassifierModelRankerOutput

- (RTPlaceTypeClassifierModelRankerOutput)initWithTarget:(double)a3
{
  RTPlaceTypeClassifierModelRankerOutput *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RTPlaceTypeClassifierModelRankerOutput;
  result = -[RTPlaceTypeClassifierModelRankerOutput init](&v5, sel_init);
  if (result)
    result->_target = a3;
  return result;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E932C460);
}

- (id)featureValueForName:(id)a3
{
  void *v4;
  void *v5;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("target")))
  {
    v4 = (void *)MEMORY[0x1E0C9E918];
    -[RTPlaceTypeClassifierModelRankerOutput target](self, "target");
    objc_msgSend(v4, "featureValueWithDouble:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (double)target
{
  return self->_target;
}

- (void)setTarget:(double)a3
{
  self->_target = a3;
}

@end
