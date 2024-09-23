@implementation BMSyncSessionMetricsCollector

- (BMSyncSessionMetricsCollector)initWithDatabase:(id)a3
{
  id v5;
  BMSyncSessionMetricsCollector *v6;
  BMSyncSessionMetricsCollector *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BMSyncSessionMetricsCollector;
  v6 = -[BMSyncSessionMetricsCollector init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_database, a3);

  return v7;
}

- (id)sessionContext
{
  BMSyncSessionContext *v2;
  void *v3;
  void *v4;

  v2 = objc_opt_new(BMSyncSessionContext);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUIDString"));
  -[BMSyncSessionContext setSessionID:](v2, "setSessionID:", v4);

  -[BMSyncSessionContext setMessageID:](v2, "setMessageID:", 0);
  return v2;
}

- (void)recordSessionStart:(id)a3 transport:(unint64_t)a4 reason:(unint64_t)a5 isReciprocal:(BOOL)a6
{
  -[BMSyncDatabase recordSessionStart:transport:reason:isReciprocal:](self->_database, "recordSessionStart:transport:reason:isReciprocal:", a3, a4, a5, a6);
}

- (void)recordSessionEnd:(id)a3 lastSyncDate:(id)a4
{
  id v6;
  NSDate *v7;
  double v8;
  double v9;
  id v10;

  v10 = a3;
  if (a4)
  {
    v6 = a4;
    v7 = objc_opt_new(NSDate);
    -[NSDate timeIntervalSinceDate:](v7, "timeIntervalSinceDate:", v6);
    v9 = v8;

  }
  else
  {
    v9 = -1.0;
  }
  -[BMSyncDatabase recordSessionEnd:timeSincePreviousSync:](self->_database, "recordSessionEnd:timeSincePreviousSync:", v10, v9);

}

- (void)recordMessageToDeviceIdentifier:(id)a3 reachable:(BOOL)a4 bytes:(unint64_t)a5 isReciprocal:(BOOL)a6 sessionContext:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v10;
  id v12;
  id v13;
  void *v14;
  id v15;
  BMSyncDatabase *database;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v8 = a6;
  v10 = a4;
  v12 = a3;
  v13 = a7;
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "setMessageID:", (char *)objc_msgSend(v13, "messageID") + 1);
    v15 = objc_msgSend(v14, "messageID");
    database = self->_database;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "sessionID"));
    -[BMSyncDatabase recordMessageToDeviceIdentifier:sessionID:messageID:reachable:bytes:isReciprocal:](database, "recordMessageToDeviceIdentifier:sessionID:messageID:reachable:bytes:isReciprocal:", v12, v17, v15, v10, a5, v8);

  }
  else
  {
    v18 = __biome_log_for_category(11);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_1000415BC(v19, v20, v21, v22, v23, v24, v25, v26);

  }
}

- (void)recordAtomMergeResult:(unint64_t)a3 inStream:(id)a4 ownerSite:(id)a5 originatingSite:(id)a6 eventCreatedAt:(double)a7 sessionContext:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  BMSyncDatabase *database;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  v18 = v17;
  if (v17)
  {
    database = self->_database;
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "sessionID"));
    v21 = (void *)v20;
    if (v20)
      v22 = (const __CFString *)v20;
    else
      v22 = CFSTR("no session ID");
    -[BMSyncDatabase recordAtomMergeResult:inStream:sessionID:messageID:ownerSite:originatingSite:eventCreatedAt:](database, "recordAtomMergeResult:inStream:sessionID:messageID:ownerSite:originatingSite:eventCreatedAt:", a3, v14, v22, objc_msgSend(v18, "messageID"), v15, v16, a7);

  }
  else
  {
    v23 = __biome_log_for_category(11);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_1000415BC(v24, v25, v26, v27, v28, v29, v30, v31);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
}

@end
