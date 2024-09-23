@implementation BRCSideCarSyncPersistedState

+ (id)loadFromClientStateInSession:(id)a3 options:(id)a4
{
  void *v4;
  void *v5;
  id v7;

  objc_msgSend(a3, "clientState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sideCarSync"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = objc_alloc_init((Class)objc_opt_class());

    objc_msgSend(v7, "setNeedsSync:", 0);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("sideCarSync"));
    v5 = v7;
  }

  return v5;
}

- (BRCSideCarSyncPersistedState)initWithZoneHealthState:(id)a3
{
  id v4;
  BRCSideCarSyncPersistedState *v5;
  id v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BRCSideCarSyncPersistedState;
  v5 = -[BRCSideCarSyncPersistedState init](&v8, sel_init);
  if (v5)
  {
    v6 = v4;
    objc_sync_enter(v6);
    objc_storeStrong((id *)&v5->_lastSyncDownDate, *((id *)v6 + 3));
    objc_storeStrong((id *)&v5->_serverChangeToken, *((id *)v6 + 4));
    v5->_needsSync = *((_BYTE *)v6 + 16);
    v5->_requestID = *((_QWORD *)v6 + 5);
    objc_storeStrong((id *)&v5->_ckGroup, *((id *)v6 + 6));
    objc_sync_exit(v6);

  }
  return v5;
}

- (BRCSideCarSyncPersistedState)initWithCoder:(id)a3
{
  id v4;
  BRCSideCarSyncPersistedState *v5;
  uint64_t v6;
  NSDate *lastSyncDownDate;
  uint64_t v8;
  CKServerChangeToken *serverChangeToken;
  uint64_t v10;
  CKOperationGroup *ckGroup;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BRCSideCarSyncPersistedState;
  v5 = -[BRCSideCarSyncPersistedState init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastSyncDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    lastSyncDownDate = v5->_lastSyncDownDate;
    v5->_lastSyncDownDate = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serverChangeToken"));
    v8 = objc_claimAutoreleasedReturnValue();
    serverChangeToken = v5->_serverChangeToken;
    v5->_serverChangeToken = (CKServerChangeToken *)v8;

    v5->_requestID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("requestID"));
    v5->_needsSync = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("sideCarSyncIdle")) ^ 1;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ckGroup"));
    v10 = objc_claimAutoreleasedReturnValue();
    ckGroup = v5->_ckGroup;
    v5->_ckGroup = (CKOperationGroup *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  BRCSideCarSyncPersistedState *v5;
  objc_super v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6.receiver = v5;
  v6.super_class = (Class)BRCSideCarSyncPersistedState;
  -[BRCPersistedState encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", v5->_lastSyncDownDate, CFSTR("lastSyncDate"));
  objc_msgSend(v4, "encodeObject:forKey:", v5->_serverChangeToken, CFSTR("serverChangeToken"));
  objc_msgSend(v4, "encodeBool:forKey:", !v5->_needsSync, CFSTR("sideCarSyncIdle"));
  objc_msgSend(v4, "encodeInt64:forKey:", v5->_requestID, CFSTR("requestID"));
  objc_msgSend(v4, "encodeObject:forKey:", v5->_ckGroup, CFSTR("ckGroup"));
  objc_sync_exit(v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithZoneHealthState:", self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)updateWithServerChangeToken:(id)a3 requestID:(unint64_t)a4
{
  id v7;
  BRCSideCarSyncPersistedState *v8;
  uint64_t v9;
  NSDate *lastSyncDownDate;
  unint64_t requestID;
  void *v12;
  NSObject *v13;
  int v14;
  BRCSideCarSyncPersistedState *v15;
  __int16 v16;
  unint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = self;
  objc_sync_enter(v8);
  objc_storeStrong((id *)&v8->_serverChangeToken, a3);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v9 = objc_claimAutoreleasedReturnValue();
  lastSyncDownDate = v8->_lastSyncDownDate;
  v8->_lastSyncDownDate = (NSDate *)v9;

  requestID = v8->_requestID;
  if (requestID < a4)
  {
    if (requestID)
    {
      brc_bread_crumbs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        v14 = 138412802;
        v15 = v8;
        v16 = 2048;
        v17 = a4;
        v18 = 2112;
        v19 = v12;
        _os_log_fault_impl(&dword_230455000, v13, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: _requestID == 0 %@: got request ID: %llu%@", (uint8_t *)&v14, 0x20u);
      }

    }
    v8->_requestID = a4;
  }
  objc_sync_exit(v8);

}

- (void)sideCarZoneWasReset
{
  CKServerChangeToken *serverChangeToken;
  NSDate *lastSyncDownDate;
  BRCSideCarSyncPersistedState *obj;

  obj = self;
  objc_sync_enter(obj);
  serverChangeToken = obj->_serverChangeToken;
  obj->_serverChangeToken = 0;

  lastSyncDownDate = obj->_lastSyncDownDate;
  obj->_lastSyncDownDate = 0;

  objc_sync_exit(obj);
}

- (unint64_t)allocateNextRequestID
{
  BRCSideCarSyncPersistedState *v2;
  unint64_t v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_requestID + 1;
  v2->_requestID = v3;
  objc_sync_exit(v2);

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  unint64_t requestID;
  void *v9;
  void *v10;

  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dumpDateFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v4, "stringFromDate:", self->_lastSyncDownDate);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_needsSync)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  requestID = self->_requestID;
  -[CKServerChangeToken descriptionWithContext:](self->_serverChangeToken, "descriptionWithContext:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("side-car-state{last-sync:%@, needs-sync:%@, requestID:%lld, changeToken:%@}"), v6, v7, requestID, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSDate)lastSyncDownDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (CKServerChangeToken)serverChangeToken
{
  return self->_serverChangeToken;
}

- (unint64_t)requestID
{
  return self->_requestID;
}

- (BOOL)needsSync
{
  return self->_needsSync;
}

- (void)setNeedsSync:(BOOL)a3
{
  self->_needsSync = a3;
}

- (CKOperationGroup)ckGroup
{
  return self->_ckGroup;
}

- (void)setCkGroup:(id)a3
{
  objc_storeStrong((id *)&self->_ckGroup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ckGroup, 0);
  objc_storeStrong((id *)&self->_serverChangeToken, 0);
  objc_storeStrong((id *)&self->_lastSyncDownDate, 0);
}

@end
