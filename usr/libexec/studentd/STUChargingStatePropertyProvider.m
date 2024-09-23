@implementation STUChargingStatePropertyProvider

- (STUChargingStatePropertyProvider)init
{
  STUChargingStatePropertyProvider *v2;
  STUChargingStatePropertyProvider *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STUChargingStatePropertyProvider;
  v2 = -[STUChargingStatePropertyProvider init](&v5, "init");
  v3 = v2;
  if (v2)
    -[STUDevicePropertyProvider setValue:](v2, "setValue:", &off_1000D4158);
  return v3;
}

- (id)key
{
  return CRKDeviceChargingStateKey;
}

- (unint64_t)chargingState
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUDevicePropertyProvider value](self, "value"));
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return (unint64_t)v3;
}

- (void)setChargingState:(unint64_t)a3
{
  id v5;

  if (-[STUChargingStatePropertyProvider chargingState](self, "chargingState") != a3)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    -[STUDevicePropertyProvider setValue:](self, "setValue:", v5);

  }
}

@end
