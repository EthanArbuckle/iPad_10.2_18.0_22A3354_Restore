@implementation OSBatteryPredictorServiceXPCProxy

- (OSBatteryPredictorServiceXPCProxy)initWithObserver:(id)a3
{
  id v3;
  OSBatteryPredictorServiceXPCProxy *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OSBatteryPredictorServiceXPCProxy;
  v3 = a3;
  v4 = -[OSBatteryPredictorServiceXPCProxy init](&v6, "init");
  objc_storeWeak((id *)&v4->_target, v3);

  return v4;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return objc_loadWeakRetained((id *)&self->_target);
}

- (NSObject)target
{
  return objc_loadWeakRetained((id *)&self->_target);
}

- (void)setTarget:(id)a3
{
  objc_storeWeak((id *)&self->_target, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_target);
}

@end
