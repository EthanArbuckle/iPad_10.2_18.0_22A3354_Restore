@implementation CLAvengerScannerClientObjectDiscoveryData

- (unsigned)status
{
  return self->_status;
}

- (NSDate)scanDate
{
  return self->_scanDate;
}

- (int64_t)rssi
{
  return self->_rssi;
}

- (NSData)reserved
{
  return self->_reserved;
}

- (NSNumber)protocolID
{
  return self->_protocolID;
}

- (CLAvengerScannerClientObjectDiscoveryData)initWithAddress:(id)a3 advertisementData:(id)a4 status:(unsigned __int8)a5 reserved:(id)a6 rssi:(int64_t)a7 scanDate:(id)a8 channel:(id)a9 didCauseWake:(BOOL)a10 detailsBitmask:(unsigned int)a11 protocolID:(id)a12
{
  CLAvengerScannerClientObjectDiscoveryData *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CLAvengerScannerClientObjectDiscoveryData;
  v18 = -[CLAvengerScannerClientObjectDiscoveryData init](&v20, "init");
  if (v18)
  {
    v18->_address = (NSData *)a3;
    v18->_advertisementData = (NSData *)a4;
    v18->_status = a5;
    v18->_reserved = (NSData *)a6;
    v18->_rssi = a7;
    v18->_scanDate = (NSDate *)a8;
    v18->_channel = (NSNumber *)a9;
    v18->_didCauseWake = a10;
    v18->_detailsBitmask = a11;
    v18->_protocolID = (NSNumber *)objc_msgSend(a12, "copy");
  }
  return v18;
}

- (unsigned)detailsBitmask
{
  return self->_detailsBitmask;
}

- (void)dealloc
{
  objc_super v3;

  self->_address = 0;
  self->_advertisementData = 0;

  self->_reserved = 0;
  self->_scanDate = 0;

  self->_channel = 0;
  self->_protocolID = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLAvengerScannerClientObjectDiscoveryData;
  -[CLAvengerScannerClientObjectDiscoveryData dealloc](&v3, "dealloc");
}

- (BOOL)beepOnMoveHigh
{
  NSUInteger v3;
  unsigned __int8 v5;

  v3 = -[NSData length](self->_reserved, "length");
  if (v3)
  {
    v5 = 0;
    -[NSData getBytes:length:](self->_reserved, "getBytes:length:", &v5, 1);
    LODWORD(v3) = (v5 >> 2) & 1;
  }
  return v3;
}

- (NSData)advertisementData
{
  return self->_advertisementData;
}

- (NSData)address
{
  return self->_address;
}

- (BOOL)isPosh
{
  return self->_detailsBitmask & 1;
}

- (BOOL)isApple
{
  return (LOBYTE(self->_detailsBitmask) >> 1) & 1;
}

- (BOOL)isNearOwner
{
  return (LOBYTE(self->_detailsBitmask) >> 2) & 1;
}

- (NSNumber)channel
{
  return self->_channel;
}

- (BOOL)didCauseWake
{
  return self->_didCauseWake;
}

@end
