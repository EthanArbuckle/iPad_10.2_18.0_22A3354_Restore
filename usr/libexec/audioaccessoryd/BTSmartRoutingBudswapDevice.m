@implementation BTSmartRoutingBudswapDevice

- (void)_cacheInfo:(id)a3 andAddress:(id)a4 andName:(id)a5 andVersion:(id)a6
{
  id v10;
  NSString *v11;
  NSString *v12;
  NSNumber *v13;
  NSString *v14;
  NSString *cachedBudswapAddress;
  NSString *v16;
  NSString *otherTipiDeviceBTAddress;
  NSString *v18;
  NSString *otherTipiDeviceBTName;
  NSString *v20;
  NSNumber *otherTipiDeviceVersion;
  NSString *v22;

  v10 = a3;
  v11 = (NSString *)a4;
  v12 = (NSString *)a5;
  v13 = (NSNumber *)a6;
  v14 = (NSString *)v10;
  cachedBudswapAddress = self->cachedBudswapAddress;
  if ((unint64_t)v14 | (unint64_t)cachedBudswapAddress
    && !-[NSString isEqualToString:](cachedBudswapAddress, "isEqualToString:", v14)
    && dword_10020FA58 <= 30
    && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
  {
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingBudswapDevice _cacheInfo:andAddress:andName:andVersion:]", 30, "Cache budswap Wx %@ -> %@ otherTipi %@ -> %@ name %@ version %@", self->cachedBudswapAddress, v14, self->otherTipiDeviceBTAddress, v11, v12, v13);
  }
  v16 = self->cachedBudswapAddress;
  self->cachedBudswapAddress = v14;
  v22 = v14;

  otherTipiDeviceBTAddress = self->otherTipiDeviceBTAddress;
  self->otherTipiDeviceBTAddress = v11;
  v18 = v11;

  otherTipiDeviceBTName = self->otherTipiDeviceBTName;
  self->otherTipiDeviceBTName = v12;
  v20 = v12;

  otherTipiDeviceVersion = self->otherTipiDeviceVersion;
  self->otherTipiDeviceVersion = v13;

}

- (NSString)cachedBudswapAddress
{
  return self->cachedBudswapAddress;
}

- (NSString)otherTipiDeviceBTAddress
{
  return self->otherTipiDeviceBTAddress;
}

- (NSString)otherTipiDeviceBTName
{
  return self->otherTipiDeviceBTName;
}

- (NSNumber)otherTipiDeviceVersion
{
  return self->otherTipiDeviceVersion;
}

- (int)reconnectionState
{
  return self->_reconnectionState;
}

- (void)setReconnectionState:(int)a3
{
  self->_reconnectionState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->otherTipiDeviceVersion, 0);
  objc_storeStrong((id *)&self->otherTipiDeviceBTName, 0);
  objc_storeStrong((id *)&self->otherTipiDeviceBTAddress, 0);
  objc_storeStrong((id *)&self->cachedBudswapAddress, 0);
}

@end
