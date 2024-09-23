@implementation _OSHighBatteryDrainLowChargeDurationModelOutput

- (_OSHighBatteryDrainLowChargeDurationModelOutput)initWithLabel:(int64_t)a3 classProbability:(id)a4
{
  id v7;
  _OSHighBatteryDrainLowChargeDurationModelOutput *v8;
  _OSHighBatteryDrainLowChargeDurationModelOutput *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_OSHighBatteryDrainLowChargeDurationModelOutput;
  v8 = -[_OSHighBatteryDrainLowChargeDurationModelOutput init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->_label = a3;
    objc_storeStrong((id *)&v8->_classProbability, a4);
  }

  return v9;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:](NSSet, "setWithArray:", &off_1000659B0);
}

- (id)featureValueForName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("label")))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MLFeatureValue featureValueWithInt64:](MLFeatureValue, "featureValueWithInt64:", -[_OSHighBatteryDrainLowChargeDurationModelOutput label](self, "label")));
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("classProbability")))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[_OSHighBatteryDrainLowChargeDurationModelOutput classProbability](self, "classProbability"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MLFeatureValue featureValueWithDictionary:error:](MLFeatureValue, "featureValueWithDictionary:error:", v6, 0));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)label
{
  return self->_label;
}

- (void)setLabel:(int64_t)a3
{
  self->_label = a3;
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
