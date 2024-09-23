@implementation BMSyncCKZone

- (BMSyncCKZone)initWithFMResultSet:(id)a3
{
  id v4;
  BMSyncCKZone *v5;
  uint64_t v6;
  NSString *zoneName;
  uint64_t v8;
  NSString *zoneUUID;
  uint64_t v10;
  NSDate *attemptedRecoveryDate;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BMSyncCKZone;
  v5 = -[BMSyncCKZone init](&v13, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringForColumn:", CFSTR("zone_name")));
    zoneName = v5->_zoneName;
    v5->_zoneName = (NSString *)v6;

    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringForColumn:", CFSTR("zone_uuid")));
    zoneUUID = v5->_zoneUUID;
    v5->_zoneUUID = (NSString *)v8;

    v5->_recoveryState = objc_msgSend(v4, "intForColumn:", CFSTR("recovery_state"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateForColumn:", CFSTR("attempted_recovery_date")));
    attemptedRecoveryDate = v5->_attemptedRecoveryDate;
    v5->_attemptedRecoveryDate = (NSDate *)v10;

  }
  return v5;
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (NSString)zoneUUID
{
  return self->_zoneUUID;
}

- (int)recoveryState
{
  return self->_recoveryState;
}

- (NSDate)attemptedRecoveryDate
{
  return self->_attemptedRecoveryDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attemptedRecoveryDate, 0);
  objc_storeStrong((id *)&self->_zoneUUID, 0);
  objc_storeStrong((id *)&self->_zoneName, 0);
}

@end
