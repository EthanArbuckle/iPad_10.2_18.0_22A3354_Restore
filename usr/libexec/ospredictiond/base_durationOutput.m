@implementation base_durationOutput

- (base_durationOutput)initWithDuration_pred:(double)a3
{
  base_durationOutput *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)base_durationOutput;
  result = -[base_durationOutput init](&v5, "init");
  if (result)
    result->_duration_pred = a3;
  return result;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:](NSSet, "setWithArray:", &off_1000659E0);
}

- (id)featureValueForName:(id)a3
{
  void *v4;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("duration_pred")))
  {
    -[base_durationOutput duration_pred](self, "duration_pred");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MLFeatureValue featureValueWithDouble:](MLFeatureValue, "featureValueWithDouble:"));
  }
  else
  {
    v4 = 0;
  }
  return v4;
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
