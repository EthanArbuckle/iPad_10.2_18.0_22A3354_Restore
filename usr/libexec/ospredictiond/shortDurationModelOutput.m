@implementation shortDurationModelOutput

- (shortDurationModelOutput)initWithDuration_pred:(double)a3
{
  shortDurationModelOutput *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)shortDurationModelOutput;
  result = -[shortDurationModelOutput init](&v5, "init");
  if (result)
    result->_duration_pred = a3;
  return result;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:](NSSet, "setWithArray:", &off_100065B30);
}

- (id)featureValueForName:(id)a3
{
  void *v4;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("duration_pred")))
  {
    -[shortDurationModelOutput duration_pred](self, "duration_pred");
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
