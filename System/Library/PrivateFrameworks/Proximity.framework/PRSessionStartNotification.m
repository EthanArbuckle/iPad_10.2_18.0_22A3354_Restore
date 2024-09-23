@implementation PRSessionStartNotification

- (PRSessionStartNotification)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRSessionStartNotification;
  return -[PRSessionStartNotification init](&v3, sel_init);
}

- (void)_setType:(int64_t)a3
{
  self->_notificationType = a3;
}

- (void)_setBluetoothConnectionEventCounterValue:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothConnectionEventCounterValue, a3);
}

+ (id)createWithBluetoothConnectionEventCounterValue:(id)a3
{
  id v3;
  PRSessionStartNotification *v4;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init(PRSessionStartNotification);
    -[PRSessionStartNotification _setType:](v4, "_setType:", 0);
    -[PRSessionStartNotification _setBluetoothConnectionEventCounterValue:](v4, "_setBluetoothConnectionEventCounterValue:", v3);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (int64_t)notificationType
{
  return self->_notificationType;
}

- (NSNumber)bluetoothConnectionEventCounterValue
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bluetoothConnectionEventCounterValue, 0);
}

@end
