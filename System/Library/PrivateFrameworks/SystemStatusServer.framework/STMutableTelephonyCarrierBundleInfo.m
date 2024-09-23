@implementation STMutableTelephonyCarrierBundleInfo

- (id)copyWithZone:(_NSZone *)a3
{
  return -[STTelephonyCarrierBundleInfo initWithCarrierBundleInfo:](+[STTelephonyCarrierBundleInfo allocWithZone:](STTelephonyCarrierBundleInfo, "allocWithZone:", a3), self);
}

- (void)setLTEConnectionShows4G:(BOOL)a3
{
  if (self->super._LTEConnectionShows4G != a3)
    self->super._LTEConnectionShows4G = a3;
}

- (void)setSuppressSOSOnlyWithLimitedService:(BOOL)a3
{
  if (self->super._suppressSOSOnlyWithLimitedService != a3)
    self->super._suppressSOSOnlyWithLimitedService = a3;
}

- (void)setReinitiatingActivationDisabled:(BOOL)a3
{
  if (self->super._reinitiatingActivationDisabled != a3)
    self->super._reinitiatingActivationDisabled = a3;
}

- (void)setCustomerServicePhoneNumber:(id)a3
{
  NSString *v4;
  NSString *customerServicePhoneNumber;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToString:", self->super._customerServicePhoneNumber) & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    customerServicePhoneNumber = self->super._customerServicePhoneNumber;
    self->super._customerServicePhoneNumber = v4;

  }
}

- (void)setDisabledApplicationIDs:(id)a3
{
  NSArray *v4;
  NSArray *disabledApplicationIDs;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToArray:", self->super._disabledApplicationIDs) & 1) == 0)
  {
    v4 = (NSArray *)objc_msgSend(v6, "copy");
    disabledApplicationIDs = self->super._disabledApplicationIDs;
    self->super._disabledApplicationIDs = v4;

  }
}

- (void)setCarrierName:(id)a3
{
  NSString *v4;
  NSString *carrierName;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToString:", self->super._carrierName) & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    carrierName = self->super._carrierName;
    self->super._carrierName = v4;

  }
}

- (void)setHomeCountryCode:(id)a3
{
  NSString *v4;
  NSString *homeCountryCode;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToString:", self->super._homeCountryCode) & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    homeCountryCode = self->super._homeCountryCode;
    self->super._homeCountryCode = v4;

  }
}

@end
