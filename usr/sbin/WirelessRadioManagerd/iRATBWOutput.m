@implementation iRATBWOutput

- (iRATBWOutput)initWithActualLowBandwidth_d:(double)a3
{
  iRATBWOutput *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)iRATBWOutput;
  result = -[iRATBWOutput init](&v5, "init");
  if (result)
    result->_actualLowBandwidth_d = a3;
  return result;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:](NSSet, "setWithArray:", &off_100241EC8);
}

- (id)featureValueForName:(id)a3
{
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("actualLowBandwidth_d")))
    return objc_msgSend((id)sub_1000BC658(), "featureValueWithDouble:", self->_actualLowBandwidth_d);
  else
    return 0;
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
