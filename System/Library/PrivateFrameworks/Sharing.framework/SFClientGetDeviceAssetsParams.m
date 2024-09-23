@implementation SFClientGetDeviceAssetsParams

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFClientGetDeviceAssetsParams)initWithCoder:(id)a3
{
  id v4;
  SFClientGetDeviceAssetsParams *v5;
  id v6;
  SFClientGetDeviceAssetsParams *v7;
  objc_super v9;
  uint64_t v10;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFClientGetDeviceAssetsParams;
  v5 = -[SFClientGetDeviceAssetsParams init](&v9, sel_init);
  if (v5)
  {
    v10 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_bluetoothProductID = v10;
    v10 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_colorCode = v10;
    v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v7 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  uint64_t colorCode;
  NSString *model;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_bluetoothProductID)
  {
    objc_msgSend(v4, "encodeInteger:forKey:");
    v4 = v7;
  }
  colorCode = self->_colorCode;
  if ((_DWORD)colorCode)
  {
    objc_msgSend(v7, "encodeInt64:forKey:", colorCode, CFSTR("cc"));
    v4 = v7;
  }
  model = self->_model;
  if (model)
  {
    objc_msgSend(v7, "encodeObject:forKey:", model, CFSTR("model"));
    v4 = v7;
  }

}

- (unsigned)bluetoothProductID
{
  return self->_bluetoothProductID;
}

- (void)setBluetoothProductID:(unsigned __int16)a3
{
  self->_bluetoothProductID = a3;
}

- (unsigned)colorCode
{
  return self->_colorCode;
}

- (void)setColorCode:(unsigned int)a3
{
  self->_colorCode = a3;
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (double)timeoutSeconds
{
  return self->_timeoutSeconds;
}

- (void)setTimeoutSeconds:(double)a3
{
  self->_timeoutSeconds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
}

@end
