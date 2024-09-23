@implementation SMIDSMessengerNearbyEffectivePairedDeviceChangedNotification

- (SMIDSMessengerNearbyEffectivePairedDeviceChangedNotification)initWithIDSDevice:(id)a3
{
  id v5;
  SMIDSMessengerNearbyEffectivePairedDeviceChangedNotification *v6;
  SMIDSMessengerNearbyEffectivePairedDeviceChangedNotification *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SMIDSMessengerNearbyEffectivePairedDeviceChangedNotification;
  v6 = -[RTNotification init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_device, a3);

  return v7;
}

- (IDSDevice)device
{
  return self->_device;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
}

@end
