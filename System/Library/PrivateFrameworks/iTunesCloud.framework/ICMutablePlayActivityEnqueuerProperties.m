@implementation ICMutablePlayActivityEnqueuerProperties

- (id)copyWithZone:(_NSZone *)a3
{
  return -[ICPlayActivityEnqueuerProperties _copyWithClass:zone:](self, "_copyWithClass:zone:", objc_opt_class(), a3);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[ICPlayActivityEnqueuerProperties _copyWithClass:zone:](self, "_copyWithClass:zone:", objc_opt_class(), a3);
}

- (void)setBuildVersion:(id)a3
{
  NSString *v4;
  NSString *buildVersion;

  if (self->super._buildVersion != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    buildVersion = self->super._buildVersion;
    self->super._buildVersion = v4;

  }
}

- (void)setDeviceGUID:(id)a3
{
  NSString *v4;
  NSString *deviceGUID;

  if (self->super._deviceGUID != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    deviceGUID = self->super._deviceGUID;
    self->super._deviceGUID = v4;

  }
}

- (void)setDeviceName:(id)a3
{
  NSString *v4;
  NSString *deviceName;

  if (self->super._deviceName != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    deviceName = self->super._deviceName;
    self->super._deviceName = v4;

  }
}

- (void)setPrivateListeningEnabled:(id)a3
{
  NSNumber *v4;
  NSNumber *privateListeningEnabled;

  if (self->super._privateListeningEnabled != a3)
  {
    v4 = (NSNumber *)objc_msgSend(a3, "copy");
    privateListeningEnabled = self->super._privateListeningEnabled;
    self->super._privateListeningEnabled = v4;

  }
}

- (void)setSBEnabled:(BOOL)a3
{
  self->super._SBEnabled = a3;
}

- (void)setStoreAccountID:(unint64_t)a3
{
  self->super._storeAccountID = a3;
}

- (void)setStoreFrontID:(id)a3
{
  NSString *v4;
  NSString *storeFrontID;

  if (self->super._storeFrontID != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    storeFrontID = self->super._storeFrontID;
    self->super._storeFrontID = v4;

  }
}

- (void)setSystemReleaseType:(int64_t)a3
{
  self->super._systemReleaseType = a3;
}

- (void)setTimeZone:(id)a3
{
  NSTimeZone *v4;
  NSTimeZone *timeZone;

  if (self->super._timeZone != a3)
  {
    v4 = (NSTimeZone *)objc_msgSend(a3, "copy");
    timeZone = self->super._timeZone;
    self->super._timeZone = v4;

  }
}

@end
