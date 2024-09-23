@implementation UserRegistryStats

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[UserRegistryStats fetchRecordZoneChanges](self, "fetchRecordZoneChanges"), CFSTR("fetchRecordZoneChanges"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[UserRegistryStats lastfetchRecordZoneChangesAtStart](self, "lastfetchRecordZoneChangesAtStart"), CFSTR("lastfetchRecordZoneChangesAtStart"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[UserRegistryStats pushNotifications](self, "pushNotifications"), CFSTR("pushNotifications"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[UserRegistryStats zoneReset](self, "zoneReset"), CFSTR("zoneReset"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[UserRegistryStats recordFetch](self, "recordFetch"), CFSTR("recordFetch"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[UserRegistryStats recordModify](self, "recordModify"), CFSTR("recordModify"));

}

- (UserRegistryStats)initWithCoder:(id)a3
{
  id v4;
  UserRegistryStats *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UserRegistryStats;
  v5 = -[UserRegistryStats init](&v7, sel_init);
  if (v5)
  {
    -[UserRegistryStats setFetchRecordZoneChanges:](v5, "setFetchRecordZoneChanges:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("fetchRecordZoneChanges")));
    -[UserRegistryStats setLastfetchRecordZoneChangesAtStart:](v5, "setLastfetchRecordZoneChangesAtStart:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("lastfetchRecordZoneChangesAtStart")));
    -[UserRegistryStats setPushNotifications:](v5, "setPushNotifications:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("pushNotifications")));
    -[UserRegistryStats setZoneReset:](v5, "setZoneReset:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("zoneReset")));
    -[UserRegistryStats setRecordFetch:](v5, "setRecordFetch:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("recordFetch")));
    -[UserRegistryStats setRecordModify:](v5, "setRecordModify:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("recordModify")));
  }

  return v5;
}

- (void)printUserRegistryStats:(__sFILE *)a3
{
  tm v5;
  time_t v6;
  char v7[128];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v6 = -[UserRegistryStats lastfetchRecordZoneChangesAtStart](self, "lastfetchRecordZoneChangesAtStart");
  if (v6)
  {
    memset(&v5, 0, sizeof(v5));
    localtime_r(&v6, &v5);
    strftime(v7, 0x80uLL, "%Y-%m-%d-%H:%M:%S", &v5);
  }
  else
  {
    __strlcpy_chk();
  }
  fwrite("UserRegistryStats:\n\n", 0x14uLL, 1uLL, a3);
  fprintf(a3, "\tfetchRecordZoneChanges: %lld\n", -[UserRegistryStats fetchRecordZoneChanges](self, "fetchRecordZoneChanges"));
  fprintf(a3, "\tlastfetchRecordZoneChangesAtStart: %s\n", v7);
  fprintf(a3, "\tpushNotifications: %lld\n", -[UserRegistryStats pushNotifications](self, "pushNotifications"));
  fprintf(a3, "\tzoneReset: %lld\n", -[UserRegistryStats zoneReset](self, "zoneReset"));
  fprintf(a3, "\trecordFetch: %lld\n", -[UserRegistryStats recordFetch](self, "recordFetch"));
  fprintf(a3, "\trecordModify: %lld\n", -[UserRegistryStats recordModify](self, "recordModify"));
  fputc(10, a3);
}

- (id)getUserRegistryStats
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  tm v11;
  time_t v12;
  char v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v12 = -[UserRegistryStats lastfetchRecordZoneChangesAtStart](self, "lastfetchRecordZoneChangesAtStart");
  if (v12)
  {
    memset(&v11, 0, sizeof(v11));
    localtime_r(&v12, &v11);
    strftime(v13, 0x80uLL, "%Y-%m-%d-%H:%M:%S", &v11);
  }
  else
  {
    __strlcpy_chk();
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[UserRegistryStats fetchRecordZoneChanges](self, "fetchRecordZoneChanges"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("fetch_record_zone_changes"));

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v13);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("last_fetch_record_zone_changes_at_start"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[UserRegistryStats pushNotifications](self, "pushNotifications"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("push_notifications"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[UserRegistryStats zoneReset](self, "zoneReset"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("zone_reset"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[UserRegistryStats recordFetch](self, "recordFetch"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("record_fetch"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[UserRegistryStats recordModify](self, "recordModify"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("record_modify"));

  return v3;
}

- (int64_t)fetchRecordZoneChanges
{
  return self->_fetchRecordZoneChanges;
}

- (void)setFetchRecordZoneChanges:(int64_t)a3
{
  self->_fetchRecordZoneChanges = a3;
}

- (int64_t)lastfetchRecordZoneChangesAtStart
{
  return self->_lastfetchRecordZoneChangesAtStart;
}

- (void)setLastfetchRecordZoneChangesAtStart:(int64_t)a3
{
  self->_lastfetchRecordZoneChangesAtStart = a3;
}

- (int64_t)pushNotifications
{
  return self->_pushNotifications;
}

- (void)setPushNotifications:(int64_t)a3
{
  self->_pushNotifications = a3;
}

- (int64_t)zoneReset
{
  return self->_zoneReset;
}

- (void)setZoneReset:(int64_t)a3
{
  self->_zoneReset = a3;
}

- (int64_t)recordFetch
{
  return self->_recordFetch;
}

- (void)setRecordFetch:(int64_t)a3
{
  self->_recordFetch = a3;
}

- (int64_t)recordModify
{
  return self->_recordModify;
}

- (void)setRecordModify:(int64_t)a3
{
  self->_recordModify = a3;
}

@end
