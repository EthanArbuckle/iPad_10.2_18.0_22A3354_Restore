@implementation SCROIOHIDElement

- (SCROIOHIDElement)initWithIOObject:(unsigned int)a3
{
  SCROIOHIDElement *v4;
  SCROIOHIDElement *v5;
  IOHIDDeviceRef v6;
  SCROIOHIDElement *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SCROIOHIDElement;
  v4 = -[SCROIOElement initWithIOObject:](&v9, sel_initWithIOObject_);
  v5 = v4;
  if (a3
    && v4
    && (!IOObjectConformsTo(a3, "IOHIDDevice")
     || (v6 = IOHIDDeviceCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], a3), (v5->_hidDevice = v6) == 0)))
  {
    v7 = 0;
  }
  else
  {
    v7 = v5;
  }

  return v7;
}

- (void)dealloc
{
  __IOHIDDevice *hidDevice;
  objc_super v4;

  hidDevice = self->_hidDevice;
  if (hidDevice)
    CFRelease(hidDevice);
  v4.receiver = self;
  v4.super_class = (Class)SCROIOHIDElement;
  -[SCROIOElement dealloc](&v4, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  __IOHIDDevice *hidDevice;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCROIOHIDElement;
  v4 = -[SCROIOElement copyWithZone:](&v7, sel_copyWithZone_, a3);
  if (v4)
  {
    hidDevice = self->_hidDevice;
    if (hidDevice)
      v4[2] = CFRetain(hidDevice);
  }
  return v4;
}

- (void)hidDevice
{
  return self->_hidDevice;
}

- (unsigned)productId
{
  return objc_msgSend((id)IOHIDDeviceGetProperty(self->_hidDevice, CFSTR("ProductID")), "intValue");
}

- (unsigned)vendorId
{
  return objc_msgSend((id)IOHIDDeviceGetProperty(self->_hidDevice, CFSTR("VendorID")), "intValue");
}

- (NSString)manufacturerName
{
  return (NSString *)IOHIDDeviceGetProperty(self->_hidDevice, CFSTR("Manufacturer"));
}

- (NSString)productName
{
  return (NSString *)IOHIDDeviceGetProperty(self->_hidDevice, CFSTR("Product"));
}

- (int)transport
{
  void *v2;
  int v3;

  IOHIDDeviceGetProperty(self->_hidDevice, CFSTR("Transport"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(CFSTR("USB"), "isEqualToString:", v2) & 1) != 0)
  {
    v3 = 4;
  }
  else if ((objc_msgSend(CFSTR("Bluetooth"), "isEqualToString:", v2) & 1) != 0)
  {
    v3 = 8;
  }
  else
  {
    v3 = 8;
    if ((objc_msgSend(CFSTR("BluetoothLowEnergy"), "isEqualToString:", v2) & 1) == 0)
    {
      if (objc_msgSend(CFSTR("Bluetooth Low Energy"), "isEqualToString:", v2))
        v3 = 8;
      else
        v3 = 0;
    }
  }

  return v3;
}

- (BOOL)isBluetoothLowEnergy
{
  void *v2;
  char v3;

  IOHIDDeviceGetProperty(self->_hidDevice, CFSTR("Transport"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(CFSTR("BluetoothLowEnergy"), "isEqualToString:", v2) & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(CFSTR("Bluetooth Low Energy"), "isEqualToString:", v2);

  return v3;
}

- (id)bluetoothAddress
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  int v6;
  void *v7;
  id v8;

  IOHIDDeviceGetProperty(self->_hidDevice, CFSTR("SerialNumber"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  IOHIDDeviceGetProperty(self->_hidDevice, CFSTR("PhysicalDeviceUniqueID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SCROIOHIDElement isBluetoothLowEnergy](self, "isBluetoothLowEnergy");
  if (v3)
    v6 = v5;
  else
    v6 = 1;
  if (v6)
    v7 = v4;
  else
    v7 = v3;
  v8 = v7;

  return v8;
}

@end
