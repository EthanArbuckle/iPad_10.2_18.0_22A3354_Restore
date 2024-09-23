@implementation CellularThroughputPredictionOutput

- (CellularThroughputPredictionOutput)initWithActualLowBandwidth_d:(double)a3
{
  CellularThroughputPredictionOutput *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CellularThroughputPredictionOutput;
  result = -[CellularThroughputPredictionOutput init](&v5, "init");
  if (result)
    result->_actualLowBandwidth_d = a3;
  return result;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:](NSSet, "setWithArray:", &off_100241E68);
}

- (id)featureValueForName:(id)a3
{
  id v4;
  void *v5;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("actualLowBandwidth_d")))
  {
    v4 = objc_msgSend(sub_100097210(), "featureValueWithDouble:", self->_actualLowBandwidth_d);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (double)actualLowBandwidth_d
{
  return self->_actualLowBandwidth_d;
}

- (void)setActualLowBandwidth_d:(double)a3
{
  self->_actualLowBandwidth_d = a3;
}

@end
