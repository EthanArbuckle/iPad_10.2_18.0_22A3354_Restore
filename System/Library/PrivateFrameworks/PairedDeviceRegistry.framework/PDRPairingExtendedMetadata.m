@implementation PDRPairingExtendedMetadata

- (int64_t)chipID
{
  return self->_chipID;
}

- (void)setChipID:(int64_t)a3
{
  self->_chipID = a3;
}

- (int64_t)pairingVersion
{
  return self->_pairingVersion;
}

- (void)setPairingVersion:(int64_t)a3
{
  self->_pairingVersion = a3;
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
  objc_storeStrong((id *)&self->_productType, a3);
}

- (BOOL)postFailsafeObliteration
{
  return self->_postFailsafeObliteration;
}

- (void)setPostFailsafeObliteration:(BOOL)a3
{
  self->_postFailsafeObliteration = a3;
}

- (BOOL)isCellularEnabled
{
  return self->_isCellularEnabled;
}

- (void)setIsCellularEnabled:(BOOL)a3
{
  self->_isCellularEnabled = a3;
}

- (unint64_t)encodedSystemVersion
{
  return self->_encodedSystemVersion;
}

- (void)setEncodedSystemVersion:(unint64_t)a3
{
  self->_encodedSystemVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productType, 0);
}

@end
