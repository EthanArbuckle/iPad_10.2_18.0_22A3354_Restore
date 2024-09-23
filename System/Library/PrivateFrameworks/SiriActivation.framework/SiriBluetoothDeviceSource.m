@implementation SiriBluetoothDeviceSource

+ (id)bluetoothDeviceForIdentifier:(int64_t)a3 bluetoothDevice:(id)a4
{
  id v5;
  id v6;
  SiriBluetoothContext *v7;

  v5 = a4;
  v6 = -[SiriLongPressButtonSource _initWithButtonIdentifier:]([SiriBluetoothDeviceSource alloc], "_initWithButtonIdentifier:", a3);
  v7 = -[SiriBluetoothContext initWithBluetoothDevice:]([SiriBluetoothContext alloc], "initWithBluetoothDevice:", v5);

  objc_msgSend(v6, "setContext:", v7);
  objc_msgSend(v6, "setLongPressInterval:", 0.4);
  return v6;
}

- (void)activate
{
  os_unfair_lock_s *p_lock;
  void *v4;
  SASButtonIdentifierTransport *v5;
  void *v6;

  p_lock = &self->super.super._lock;
  os_unfair_lock_lock(&self->super.super._lock);
  -[BSServiceConnection remoteTarget](self->super.super._connection, "remoteTarget");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SASButtonIdentifierTransport initWithSiriButtonIdentifier:]([SASButtonIdentifierTransport alloc], "initWithSiriButtonIdentifier:", -[SiriBluetoothDeviceSource buttonIdentifier](self, "buttonIdentifier"));
  -[SiriBluetoothDeviceSource context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activationRequestFromButtonIdentifier:context:", v5, v6);

  os_unfair_lock_unlock(p_lock);
}

- (void)deactivate
{
  os_unfair_lock_s *p_lock;
  void *v4;
  SASButtonIdentifierTransport *v5;
  void *v6;
  SiriDismissalOptions *v7;

  p_lock = &self->super.super._lock;
  os_unfair_lock_lock(&self->super.super._lock);
  v7 = -[SiriDismissalOptions initWithDeactivationOptions:animated:dismissalReason:]([SiriDismissalOptions alloc], "initWithDeactivationOptions:animated:dismissalReason:", 0, 1, 18);
  -[BSServiceConnection remoteTarget](self->super.super._connection, "remoteTarget");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SASButtonIdentifierTransport initWithSiriButtonIdentifier:]([SASButtonIdentifierTransport alloc], "initWithSiriButtonIdentifier:", -[SiriBluetoothDeviceSource buttonIdentifier](self, "buttonIdentifier"));
  -[SiriBluetoothDeviceSource context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deactivationRequestFromButtonIdentifier:context:options:", v5, v6, v7);

  os_unfair_lock_unlock(p_lock);
}

- (int64_t)buttonIdentifier
{
  return self->_buttonIdentifier;
}

- (void)setButtonIdentifier:(int64_t)a3
{
  self->_buttonIdentifier = a3;
}

- (double)longPressInterval
{
  return self->_longPressInterval;
}

- (void)setLongPressInterval:(double)a3
{
  self->_longPressInterval = a3;
}

- (SiriBluetoothContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

@end
