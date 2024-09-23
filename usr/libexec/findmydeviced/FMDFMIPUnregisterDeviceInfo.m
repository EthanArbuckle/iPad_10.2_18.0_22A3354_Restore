@implementation FMDFMIPUnregisterDeviceInfo

- (NSString)udid
{
  return self->_udid;
}

- (void)setUdid:(id)a3
{
  objc_storeStrong((id *)&self->_udid, a3);
}

- (NSString)pairingId
{
  return self->_pairingId;
}

- (void)setPairingId:(id)a3
{
  objc_storeStrong((id *)&self->_pairingId, a3);
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_serialNumber, a3);
}

- (NSString)imei
{
  return self->_imei;
}

- (void)setImei:(id)a3
{
  objc_storeStrong((id *)&self->_imei, a3);
}

- (NSString)imei2
{
  return self->_imei2;
}

- (void)setImei2:(id)a3
{
  objc_storeStrong((id *)&self->_imei2, a3);
}

- (NSString)meid
{
  return self->_meid;
}

- (void)setMeid:(id)a3
{
  objc_storeStrong((id *)&self->_meid, a3);
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
  objc_storeStrong((id *)&self->_productType, a3);
}

- (NSString)productVersion
{
  return self->_productVersion;
}

- (void)setProductVersion:(id)a3
{
  objc_storeStrong((id *)&self->_productVersion, a3);
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_buildVersion, a3);
}

- (unint64_t)disableContext
{
  return self->_disableContext;
}

- (void)setDisableContext:(unint64_t)a3
{
  self->_disableContext = a3;
}

- (BOOL)paired
{
  return self->_paired;
}

- (void)setPaired:(BOOL)a3
{
  self->_paired = a3;
}

- (BOOL)migrationConfirmed
{
  return self->_migrationConfirmed;
}

- (void)setMigrationConfirmed:(BOOL)a3
{
  self->_migrationConfirmed = a3;
}

- (NSString)unregisterToken
{
  return self->_unregisterToken;
}

- (void)setUnregisterToken:(id)a3
{
  objc_storeStrong((id *)&self->_unregisterToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unregisterToken, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_meid, 0);
  objc_storeStrong((id *)&self->_imei2, 0);
  objc_storeStrong((id *)&self->_imei, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_pairingId, 0);
  objc_storeStrong((id *)&self->_udid, 0);
}

@end
