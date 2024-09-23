@implementation RCDebugOverrides

- (BOOL)ignoreCache
{
  return self->_ignoreCache;
}

- (unint64_t)configurationSource
{
  return self->_configurationSource;
}

- (BOOL)enableExtraLogs
{
  return self->_enableExtraLogs;
}

- (unint64_t)debugEnvironment
{
  return self->_debugEnvironment;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[RCDebugOverrides disableAbTesting](self, "disableAbTesting"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rc_safelySetObjectAllowingNil:forKey:", v4, CFSTR("disableAbTesting"));

  -[RCDebugOverrides overrideSegmentSetIDs](self, "overrideSegmentSetIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rc_safelySetObjectAllowingNil:forKey:", v5, CFSTR("overrideSegmentSetIds"));

  -[RCDebugOverrides additionalSegmentSetIDs](self, "additionalSegmentSetIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rc_safelySetObjectAllowingNil:forKey:", v6, CFSTR("additionalSegmentSetIds"));

  v7 = (void *)objc_msgSend(v3, "copy");
  return v7;
}

- (NSArray)overrideSegmentSetIDs
{
  return self->_overrideSegmentSetIDs;
}

- (BOOL)disableAbTesting
{
  return self->_disableAbTesting;
}

- (NSArray)additionalSegmentSetIDs
{
  return self->_additionalSegmentSetIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalSegmentSetIDs, 0);
  objc_storeStrong((id *)&self->_overrideSegmentSetIDs, 0);
}

- (RCDebugOverrides)initWithDisableAbTesting:(BOOL)a3 overrideSegmentSetIDs:(id)a4 additionalSegmentSetIDs:(id)a5 configurationSource:(unint64_t)a6 debugEnvironment:(unint64_t)a7 ignoreCache:(BOOL)a8 enableExtraLogs:(BOOL)a9
{
  id v16;
  id v17;
  RCDebugOverrides *v18;
  RCDebugOverrides *v19;
  objc_super v21;

  v16 = a4;
  v17 = a5;
  v21.receiver = self;
  v21.super_class = (Class)RCDebugOverrides;
  v18 = -[RCDebugOverrides init](&v21, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_disableAbTesting = a3;
    objc_storeStrong((id *)&v18->_overrideSegmentSetIDs, a4);
    objc_storeStrong((id *)&v19->_additionalSegmentSetIDs, a5);
    v19->_configurationSource = a6;
    v19->_debugEnvironment = a7;
    v19->_ignoreCache = a8;
    v19->_enableExtraLogs = a9;
  }

  return v19;
}

+ (id)defaultDebugOverrides
{
  uint64_t v3;

  LOBYTE(v3) = 0;
  return -[RCDebugOverrides initWithDisableAbTesting:overrideSegmentSetIDs:additionalSegmentSetIDs:configurationSource:debugEnvironment:ignoreCache:enableExtraLogs:]([RCDebugOverrides alloc], "initWithDisableAbTesting:overrideSegmentSetIDs:additionalSegmentSetIDs:configurationSource:debugEnvironment:ignoreCache:enableExtraLogs:", 0, 0, 0, 0, 0, 0, v3);
}

- (RCDebugOverrides)initWithDisableAbTesting:(BOOL)a3 overrideSegmentSetIDs:(id)a4 additionalSegmentSetIDs:(id)a5 onlyUseFallbackURL:(BOOL)a6 debugEnvironment:(unint64_t)a7
{
  _BOOL8 v9;
  uint64_t v11;
  id v12;
  id v13;
  RCDebugOverrides *v14;
  uint64_t v16;

  v9 = a3;
  if (a6)
    v11 = 2;
  else
    v11 = 0;
  v12 = a5;
  v13 = a4;
  LOBYTE(v16) = 0;
  v14 = -[RCDebugOverrides initWithDisableAbTesting:overrideSegmentSetIDs:additionalSegmentSetIDs:configurationSource:debugEnvironment:ignoreCache:enableExtraLogs:]([RCDebugOverrides alloc], "initWithDisableAbTesting:overrideSegmentSetIDs:additionalSegmentSetIDs:configurationSource:debugEnvironment:ignoreCache:enableExtraLogs:", v9, v13, v12, v11, a7, 0, v16);

  return v14;
}

- (RCDebugOverrides)initWithDisableAbTesting:(BOOL)a3 overrideSegmentSetIDs:(id)a4 additionalSegmentSetIDs:(id)a5 configurationSource:(unint64_t)a6 debugEnvironment:(unint64_t)a7 ignoreCache:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v12;
  id v14;
  id v15;
  RCDebugOverrides *v16;
  uint64_t v18;

  v8 = a8;
  v12 = a3;
  v14 = a5;
  v15 = a4;
  LOBYTE(v18) = 0;
  v16 = -[RCDebugOverrides initWithDisableAbTesting:overrideSegmentSetIDs:additionalSegmentSetIDs:configurationSource:debugEnvironment:ignoreCache:enableExtraLogs:]([RCDebugOverrides alloc], "initWithDisableAbTesting:overrideSegmentSetIDs:additionalSegmentSetIDs:configurationSource:debugEnvironment:ignoreCache:enableExtraLogs:", v12, v15, v14, a6, a7, v8, v18);

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  int v16;
  _BOOL4 v18;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[RCDebugOverrides disableAbTesting](self, "disableAbTesting");
    if (v6 == objc_msgSend(v5, "disableAbTesting"))
    {
      v8 = (void *)MEMORY[0x1E0DE7910];
      -[RCDebugOverrides overrideSegmentSetIDs](self, "overrideSegmentSetIDs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "overrideSegmentSetIDs");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "rc_object:isEqualToObject:", v9, v10))
      {
        v11 = (void *)MEMORY[0x1E0DE7910];
        -[RCDebugOverrides additionalSegmentSetIDs](self, "additionalSegmentSetIDs");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "additionalSegmentSetIDs");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "rc_object:isEqualToObject:", v12, v13)
          && (v14 = -[RCDebugOverrides configurationSource](self, "configurationSource"),
              v14 == objc_msgSend(v5, "configurationSource"))
          && (v15 = -[RCDebugOverrides debugEnvironment](self, "debugEnvironment"),
              v15 == objc_msgSend(v5, "debugEnvironment"))
          && (v16 = -[RCDebugOverrides ignoreCache](self, "ignoreCache"),
              v16 == objc_msgSend(v5, "ignoreCache")))
        {
          v18 = -[RCDebugOverrides enableExtraLogs](self, "enableExtraLogs");
          v7 = v18 ^ objc_msgSend(v5, "enableExtraLogs") ^ 1;
        }
        else
        {
          LOBYTE(v7) = 0;
        }

      }
      else
      {
        LOBYTE(v7) = 0;
      }

    }
    else
    {
      LOBYTE(v7) = 0;
    }

  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[RCDebugOverrides disableAbTesting](self, "disableAbTesting"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[RCDebugOverrides overrideSegmentSetIDs](self, "overrideSegmentSetIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  -[RCDebugOverrides additionalSegmentSetIDs](self, "additionalSegmentSetIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash") ^ v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[RCDebugOverrides configurationSource](self, "configurationSource"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[RCDebugOverrides debugEnvironment](self, "debugEnvironment"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v8 ^ v10 ^ objc_msgSend(v11, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[RCDebugOverrides ignoreCache](self, "ignoreCache"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[RCDebugOverrides enableExtraLogs](self, "enableExtraLogs"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v12 ^ v14 ^ objc_msgSend(v15, "hash");

  return v16;
}

- (NSString)description
{
  uint64_t v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;

  v11 = (void *)MEMORY[0x1E0CB3940];
  v3 = objc_opt_class();
  v4 = -[RCDebugOverrides disableAbTesting](self, "disableAbTesting");
  -[RCDebugOverrides overrideSegmentSetIDs](self, "overrideSegmentSetIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rc_description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCDebugOverrides additionalSegmentSetIDs](self, "additionalSegmentSetIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rc_description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@: %p; disableAbTesting: %d overrideSegmentSetIDs: %@ additionalSegmentSetIDs: %@ configurationSource: %lu debugEnvironment: %lu ignoreCache: %d enableExtraLogs: %d>"),
    v3,
    self,
    v4,
    v6,
    v8,
    -[RCDebugOverrides configurationSource](self, "configurationSource"),
    -[RCDebugOverrides debugEnvironment](self, "debugEnvironment"),
    -[RCDebugOverrides ignoreCache](self, "ignoreCache"),
    -[RCDebugOverrides enableExtraLogs](self, "enableExtraLogs"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (BOOL)onlyUseFallbackURL
{
  return -[RCDebugOverrides configurationSource](self, "configurationSource") == 2;
}

@end
