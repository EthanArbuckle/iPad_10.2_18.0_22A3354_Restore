@implementation GKContactsIntegrationControllerSettings

- (GKContactsIntegrationControllerSettings)init
{
  return -[GKContactsIntegrationControllerSettings initWithBagValues:](self, "initWithBagValues:", 0);
}

- (GKContactsIntegrationControllerSettings)initWithBagValues:(id)a3
{
  id v4;
  GKContactsIntegrationControllerSettings *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GKContactsIntegrationControllerSettings;
  v5 = -[GKContactsIntegrationControllerSettings init](&v14, "init");
  if (v5)
  {
    v5->_localSyncLimit = (unint64_t)objc_msgSend(v4, "unsignedIntegerValueFromKey:defaultValue:", CFSTR("gk-contactid-local-sync-limit"), 1000);
    v5->_localBatchFetchSize = (unint64_t)objc_msgSend(v4, "unsignedIntegerValueFromKey:defaultValue:", CFSTR("gk-contactid-local-batch-fetch-size"), 100);
    v5->_idsV2BatchFetchSize = (unint64_t)objc_msgSend(v4, "unsignedIntegerValueFromKey:defaultValue:", CFSTR("gk-contactid-ids-v2-batch-fetch-size"), 20);
    v5->_idsV2FetchSize = (unint64_t)objc_msgSend(v4, "unsignedIntegerValueFromKey:defaultValue:", CFSTR("gk-contactid-ids-v2-fetch-size"), 20);
    objc_msgSend(v4, "doubleValueFromKey:defaultValue:", CFSTR("gk-contactid-ids-update-interval-sec"), 18030.0);
    v5->_idsUpdateInterval = v6;
    objc_msgSend(v4, "doubleValueFromKey:defaultValue:", CFSTR("gk-contactid-ids-expiration-opted-in-sec"), 604800.0);
    v5->_idsExpirationTimeOptedIn = v7;
    objc_msgSend(v4, "doubleValueFromKey:defaultValue:", CFSTR("gk-contactid-ids-expiration-opted-out-sec"), 604800.0);
    v5->_idsExpirationTimeOptedOut = v8;
    objc_msgSend(v4, "doubleValueFromKey:defaultValue:", CFSTR("gk-contactid-ids-expiration-not-set-sec"), 86400.0);
    v5->_idsExpirationTimeNotSet = v9;
    objc_msgSend(v4, "doubleValueFromKey:defaultValue:", CFSTR("gk-contactid-ids-expiration-unknown-sec"), 86400.0);
    v5->_idsExpirationTimeUnknown = v10;
    v5->_allowUpdates = objc_msgSend(v4, "unsignedIntegerValueFromKey:defaultValue:", CFSTR("gk-contactid-allow-updates"), 1) == (id)1;
    v5->_allowUpdatesWithoutFriends = objc_msgSend(v4, "unsignedIntegerValueFromKey:defaultValue:", CFSTR("gk-contactid-allow-updates-without-friends"), 1) == (id)1;
    v5->_notificationCoalescingWaitTime = 7.0;
    objc_msgSend(v4, "doubleValueFromKey:defaultValue:", CFSTR("gk-contactid-ids-v2-batch-fetch-delay-sec"), 3.0);
    v5->_idsBatchFetchDelayInterval = v11;
    objc_msgSend(v4, "doubleValueFromKey:defaultValue:", CFSTR("gk-contactid-ids-v2-batch-fetch-jitter-sec"), 0.0);
    v5->_idsBatchFetchJitterInterval = v12;
  }

  return v5;
}

+ (id)allBagKeys
{
  if (qword_100318120 != -1)
    dispatch_once(&qword_100318120, &stru_1002C49F8);
  return (id)qword_100318118;
}

- (double)expirationTimeForCohort:(int)a3
{
  double result;

  switch(a3)
  {
    case -1:
      result = 0.0;
      break;
    case 1:
      -[GKContactsIntegrationControllerSettings idsExpirationTimeNotSet](self, "idsExpirationTimeNotSet");
      break;
    case 2:
      -[GKContactsIntegrationControllerSettings idsExpirationTimeOptedIn](self, "idsExpirationTimeOptedIn");
      break;
    case 3:
      -[GKContactsIntegrationControllerSettings idsExpirationTimeOptedOut](self, "idsExpirationTimeOptedOut");
      break;
    default:
      -[GKContactsIntegrationControllerSettings idsExpirationTimeUnknown](self, "idsExpirationTimeUnknown");
      break;
  }
  return result;
}

- (unint64_t)idsV2FetchSize
{
  return self->_idsV2FetchSize;
}

- (unint64_t)idsV2BatchFetchSize
{
  return self->_idsV2BatchFetchSize;
}

- (unint64_t)localSyncLimit
{
  return self->_localSyncLimit;
}

- (unint64_t)localBatchFetchSize
{
  return self->_localBatchFetchSize;
}

- (double)idsUpdateInterval
{
  return self->_idsUpdateInterval;
}

- (double)idsBatchFetchJitterInterval
{
  return self->_idsBatchFetchJitterInterval;
}

- (double)idsBatchFetchDelayInterval
{
  return self->_idsBatchFetchDelayInterval;
}

- (double)notificationCoalescingWaitTime
{
  return self->_notificationCoalescingWaitTime;
}

- (BOOL)allowUpdates
{
  return self->_allowUpdates;
}

- (BOOL)allowUpdatesWithoutFriends
{
  return self->_allowUpdatesWithoutFriends;
}

- (double)idsExpirationTimeOptedIn
{
  return self->_idsExpirationTimeOptedIn;
}

- (void)setIdsExpirationTimeOptedIn:(double)a3
{
  self->_idsExpirationTimeOptedIn = a3;
}

- (double)idsExpirationTimeNotUpgraded
{
  return self->_idsExpirationTimeNotUpgraded;
}

- (void)setIdsExpirationTimeNotUpgraded:(double)a3
{
  self->_idsExpirationTimeNotUpgraded = a3;
}

- (double)idsExpirationTimeNonAppleUser
{
  return self->_idsExpirationTimeNonAppleUser;
}

- (void)setIdsExpirationTimeNonAppleUser:(double)a3
{
  self->_idsExpirationTimeNonAppleUser = a3;
}

- (double)idsExpirationTimeOptedOut
{
  return self->_idsExpirationTimeOptedOut;
}

- (void)setIdsExpirationTimeOptedOut:(double)a3
{
  self->_idsExpirationTimeOptedOut = a3;
}

- (double)idsExpirationTimeNotSet
{
  return self->_idsExpirationTimeNotSet;
}

- (void)setIdsExpirationTimeNotSet:(double)a3
{
  self->_idsExpirationTimeNotSet = a3;
}

- (double)idsExpirationTimeUnknown
{
  return self->_idsExpirationTimeUnknown;
}

- (void)setIdsExpirationTimeUnknown:(double)a3
{
  self->_idsExpirationTimeUnknown = a3;
}

@end
