@implementation ICMutableMusicSubscriptionStatus

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;

  v5 = -[ICMusicSubscriptionStatus _init]([ICMusicSubscriptionStatus alloc], "_init");
  -[ICMusicSubscriptionStatus _copySubscriptionStatusPropertiesToStatus:withZone:](self, "_copySubscriptionStatusPropertiesToStatus:withZone:", v5, a3);
  return v5;
}

- (void)setMinorAccountHolder:(BOOL)a3
{
  self->super._isMinorAccountHolder = a3;
}

- (void)setStudentExpirationDate:(id)a3
{
  NSDate *v4;
  NSDate *studentExpirationDate;
  NSDate *v6;
  char v7;
  NSDate *v8;
  NSDate *v9;

  v9 = (NSDate *)a3;
  v4 = self->super._studentExpirationDate;
  studentExpirationDate = v9;
  if (v4 == v9)
    goto LABEL_4;
  v6 = v4;
  v7 = -[NSDate isEqual:](v4, "isEqual:", v9);

  if ((v7 & 1) == 0)
  {
    v8 = v9;
    studentExpirationDate = self->super._studentExpirationDate;
    self->super._studentExpirationDate = v8;
LABEL_4:

  }
}

- (void)setStudentVerificationId:(id)a3
{
  NSString *v4;
  NSString *studentVerificationId;
  NSString *v6;
  char v7;
  NSString *v8;
  NSString *v9;

  v9 = (NSString *)a3;
  v4 = self->super._studentVerificationId;
  studentVerificationId = v9;
  if (v4 == v9)
    goto LABEL_4;
  v6 = v4;
  v7 = -[NSString isEqual:](v4, "isEqual:", v9);

  if ((v7 & 1) == 0)
  {
    v8 = (NSString *)-[NSString copy](v9, "copy");
    studentVerificationId = self->super._studentVerificationId;
    self->super._studentVerificationId = v8;
LABEL_4:

  }
}

- (void)setStudentVerifier:(id)a3
{
  NSString *v4;
  NSString *studentVerifier;
  NSString *v6;
  char v7;
  NSString *v8;
  NSString *v9;

  v9 = (NSString *)a3;
  v4 = self->super._studentVerifier;
  studentVerifier = v9;
  if (v4 == v9)
    goto LABEL_4;
  v6 = v4;
  v7 = -[NSString isEqual:](v4, "isEqual:", v9);

  if ((v7 & 1) == 0)
  {
    v8 = (NSString *)-[NSString copy](v9, "copy");
    studentVerifier = self->super._studentVerifier;
    self->super._studentVerifier = v8;
LABEL_4:

  }
}

- (void)setHasFamily:(BOOL)a3
{
  self->super._hasFamily = a3;
}

- (void)setHasFamilyGreaterThanOneMember:(BOOL)a3
{
  self->super._hasFamilyGreaterThanOneMember = a3;
}

- (void)setHeadOfHousehold:(BOOL)a3
{
  self->super._isHeadOfHousehold = a3;
}

- (void)setMatchEnabled:(BOOL)a3
{
  self->super._isMatchEnabled = a3;
}

- (void)setExpirationDate:(id)a3
{
  NSDate *v4;
  NSDate *expirationDate;
  NSDate *v6;
  char v7;
  NSDate *v8;
  NSDate *v9;

  v9 = (NSDate *)a3;
  v4 = self->super._expirationDate;
  expirationDate = v9;
  if (v4 == v9)
    goto LABEL_4;
  v6 = v4;
  v7 = -[NSDate isEqual:](v4, "isEqual:", v9);

  if ((v7 & 1) == 0)
  {
    v8 = v9;
    expirationDate = self->super._expirationDate;
    self->super._expirationDate = v8;
LABEL_4:

  }
}

- (void)setInitialPurchaseTimestamp:(id)a3
{
  NSDate *v4;
  NSDate *initialPurchaseTimestamp;
  NSDate *v6;
  char v7;
  NSDate *v8;
  NSDate *v9;

  v9 = (NSDate *)a3;
  v4 = self->super._initialPurchaseTimestamp;
  initialPurchaseTimestamp = v9;
  if (v4 == v9)
    goto LABEL_4;
  v6 = v4;
  v7 = -[NSDate isEqual:](v4, "isEqual:", v9);

  if ((v7 & 1) == 0)
  {
    v8 = v9;
    initialPurchaseTimestamp = self->super._initialPurchaseTimestamp;
    self->super._initialPurchaseTimestamp = v8;
LABEL_4:

  }
}

- (void)setServiceBeginsTimestamp:(id)a3
{
  NSDate *v4;
  NSDate *serviceBeginsTimestamp;
  NSDate *v6;
  char v7;
  NSDate *v8;
  NSDate *v9;

  v9 = (NSDate *)a3;
  v4 = self->super._serviceBeginsTimestamp;
  serviceBeginsTimestamp = v9;
  if (v4 == v9)
    goto LABEL_4;
  v6 = v4;
  v7 = -[NSDate isEqual:](v4, "isEqual:", v9);

  if ((v7 & 1) == 0)
  {
    v8 = v9;
    serviceBeginsTimestamp = self->super._serviceBeginsTimestamp;
    self->super._serviceBeginsTimestamp = v8;
LABEL_4:

  }
}

- (void)setHasOfflineSlots:(BOOL)a3
{
  self->super._hasOfflineSlots = a3;
}

- (void)setAutoRenewEnabled:(BOOL)a3
{
  self->super._isAutoRenewEnabled = a3;
}

- (void)setInFreeTrial:(BOOL)a3
{
  self->super._isInFreeTrial = a3;
}

- (void)setEligibleForFreeTrial:(BOOL)a3
{
  self->super._isEligibleForFreeTrial = a3;
}

- (void)setPurchaser:(BOOL)a3
{
  self->super._isPurchaser = a3;
}

- (void)setCarrierBundlingStatusType:(int64_t)a3
{
  self->super._carrierBundlingStatusType = a3;
}

- (void)setReasonType:(int64_t)a3
{
  self->super._reasonType = a3;
}

- (void)setSourceType:(int64_t)a3
{
  self->super._sourceType = a3;
}

- (void)setStatusType:(int64_t)a3
{
  self->super._statusType = a3;
}

- (void)setAdministrator:(BOOL)a3
{
  self->super._isAdministrator = a3;
}

- (void)setDiscoveryModeEligible:(BOOL)a3
{
  self->super._isDiscoveryModeEligible = a3;
}

- (void)setTermsStatusList:(id)a3
{
  NSArray *v4;
  NSArray *termsStatusList;
  NSArray *v6;
  char v7;
  NSArray *v8;
  NSArray *v9;

  v9 = (NSArray *)a3;
  v4 = self->super._termsStatusList;
  termsStatusList = v9;
  if (v4 == v9)
    goto LABEL_4;
  v6 = v4;
  v7 = -[NSArray isEqual:](v4, "isEqual:", v9);

  if ((v7 & 1) == 0)
  {
    v8 = (NSArray *)-[NSArray copy](v9, "copy");
    termsStatusList = self->super._termsStatusList;
    self->super._termsStatusList = v8;
LABEL_4:

  }
}

- (void)setPhoneNumber:(id)a3
{
  NSString *v4;
  NSString *phoneNumber;
  NSString *v6;
  char v7;
  NSString *v8;
  NSString *v9;

  v9 = (NSString *)a3;
  v4 = self->super._phoneNumber;
  phoneNumber = v9;
  if (v4 == v9)
    goto LABEL_4;
  v6 = v4;
  v7 = -[NSString isEqual:](v4, "isEqual:", v9);

  if ((v7 & 1) == 0)
  {
    v8 = (NSString *)-[NSString copy](v9, "copy");
    phoneNumber = self->super._phoneNumber;
    self->super._phoneNumber = v8;
LABEL_4:

  }
}

- (void)setCellularOperatorName:(id)a3
{
  NSString *v4;
  NSString *cellularOperatorName;
  NSString *v6;
  char v7;
  NSString *v8;
  NSString *v9;

  v9 = (NSString *)a3;
  v4 = self->super._cellularOperatorName;
  cellularOperatorName = v9;
  if (v4 == v9)
    goto LABEL_4;
  v6 = v4;
  v7 = -[NSString isEqual:](v4, "isEqual:", v9);

  if ((v7 & 1) == 0)
  {
    v8 = (NSString *)-[NSString copy](v9, "copy");
    cellularOperatorName = self->super._cellularOperatorName;
    self->super._cellularOperatorName = v8;
LABEL_4:

  }
}

- (void)setSessionIdentifier:(id)a3
{
  NSString *v4;
  NSString *sessionIdentifier;
  NSString *v6;
  char v7;
  NSString *v8;
  NSString *v9;

  v9 = (NSString *)a3;
  v4 = self->super._sessionIdentifier;
  sessionIdentifier = v9;
  if (v4 == v9)
    goto LABEL_4;
  v6 = v4;
  v7 = -[NSString isEqual:](v4, "isEqual:", v9);

  if ((v7 & 1) == 0)
  {
    v8 = (NSString *)-[NSString copy](v9, "copy");
    sessionIdentifier = self->super._sessionIdentifier;
    self->super._sessionIdentifier = v8;
LABEL_4:

  }
}

- (void)setCarrierBundlingErrorCode:(int64_t)a3
{
  self->super._carrierBundlingErrorCode = a3;
}

- (void)setPartOfBundle:(BOOL)a3
{
  self->super._isPartOfBundle = a3;
}

- (void)setBundleOwner:(BOOL)a3
{
  self->super._isBundleOwner = a3;
}

- (void)setEligibleOffers:(id)a3
{
  objc_storeStrong((id *)&self->super._eligibleOffers, a3);
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(int64_t)a3
{
  self->_statusCode = a3;
}

@end
