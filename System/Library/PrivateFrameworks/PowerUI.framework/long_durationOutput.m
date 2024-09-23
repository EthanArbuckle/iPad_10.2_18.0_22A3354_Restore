@implementation long_durationOutput

- (long_durationOutput)initWithDuration_pred:(double)a3
{
  long_durationOutput *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)long_durationOutput;
  result = -[long_durationOutput init](&v5, sel_init);
  if (result)
    result->_duration_pred = a3;
  return result;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24D44AE48);
}

- (id)featureValueForName:(id)a3
{
  void *v4;
  void *v5;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("duration_pred")))
  {
    v4 = (void *)MEMORY[0x24BDBFF98];
    -[long_durationOutput duration_pred](self, "duration_pred");
    objc_msgSend(v4, "featureValueWithDouble:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (double)duration_pred
{
  return self->_duration_pred;
}

- (void)setDuration_pred:(double)a3
{
  self->_duration_pred = a3;
}

@end
