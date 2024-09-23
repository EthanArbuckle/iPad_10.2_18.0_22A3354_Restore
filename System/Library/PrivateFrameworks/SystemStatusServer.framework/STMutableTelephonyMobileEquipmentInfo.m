@implementation STMutableTelephonyMobileEquipmentInfo

- (void)setMEID:(id)a3
{
  NSString *v4;
  NSString *MEID;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToString:", self->super._MEID) & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    MEID = self->super._MEID;
    self->super._MEID = v4;

  }
}

- (void)setIMEI:(id)a3
{
  NSString *v4;
  NSString *IMEI;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToString:", self->super._IMEI) & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    IMEI = self->super._IMEI;
    self->super._IMEI = v4;

  }
}

- (void)setICCID:(id)a3
{
  NSString *v4;
  NSString *ICCID;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToString:", self->super._ICCID) & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    ICCID = self->super._ICCID;
    self->super._ICCID = v4;

  }
}

- (void)setCSN:(id)a3
{
  NSString *v4;
  NSString *CSN;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToString:", self->super._CSN) & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    CSN = self->super._CSN;
    self->super._CSN = v4;

  }
}

- (void)setBootstrapICCID:(id)a3
{
  NSString *v4;
  NSString *bootstrapICCID;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToString:", self->super._bootstrapICCID) & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    bootstrapICCID = self->super._bootstrapICCID;
    self->super._bootstrapICCID = v4;

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[STTelephonyMobileEquipmentInfo initWithMobileEquipmentInfo:]((_QWORD *)+[STTelephonyMobileEquipmentInfo allocWithZone:](STTelephonyMobileEquipmentInfo, "allocWithZone:", a3), self);
}

@end
