@implementation _HKRPOxygenSaturationOnboardingManagerStaticDeviceDataSource

- (_HKRPOxygenSaturationOnboardingManagerStaticDeviceDataSource)initWithDevice:(id)a3
{
  id v5;
  _HKRPOxygenSaturationOnboardingManagerStaticDeviceDataSource *v6;
  _HKRPOxygenSaturationOnboardingManagerStaticDeviceDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HKRPOxygenSaturationOnboardingManagerStaticDeviceDataSource;
  v6 = -[_HKRPOxygenSaturationOnboardingManagerDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_device, a3);

  return v7;
}

- (id)device
{
  return self->_device;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
}

@end
