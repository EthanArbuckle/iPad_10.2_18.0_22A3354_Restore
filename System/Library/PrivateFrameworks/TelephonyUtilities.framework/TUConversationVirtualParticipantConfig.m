@implementation TUConversationVirtualParticipantConfig

+ (NSString)serverCertValidationEnabledUserDefaultsKey
{
  return (NSString *)CFSTR("qrPluginCertValidationEnabled");
}

+ (NSString)serverCertHostnameUserDefaultsKey
{
  return (NSString *)CFSTR("qrPluginCertHostname");
}

+ (NSString)serverCertLeafMarkerOIDUserDefaultsKey
{
  return (NSString *)CFSTR("qrPluginCertLeafMarkerOID");
}

- (TUConversationVirtualParticipantConfig)initWithConnectionRetryIntervalMillis:(unint64_t)a3 connectionMaxAttempts:(unint64_t)a4 rpcStreamRetryIntervalMillis:(unint64_t)a5 rpcStreamMaxAttempts:(unint64_t)a6 serverCertValidationEnabled:(BOOL)a7 serverCertHostnameOverride:(id)a8 serverCertLeafMarkerOIDOverride:(id)a9
{
  id v16;
  id v17;
  TUConversationVirtualParticipantConfig *v18;
  TUConversationVirtualParticipantConfig *v19;
  objc_super v21;

  v16 = a8;
  v17 = a9;
  v21.receiver = self;
  v21.super_class = (Class)TUConversationVirtualParticipantConfig;
  v18 = -[TUConversationVirtualParticipantConfig init](&v21, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_connectionRetryIntervalMillis = a3;
    v18->_connectionMaxAttempts = a4;
    v18->_rpcStreamRetryIntervalMillis = a5;
    v18->_rpcStreamMaxAttempts = a6;
    v18->_serverCertValidationEnabled = a7;
    objc_storeStrong((id *)&v18->_serverCertHostnameOverride, a8);
    objc_storeStrong((id *)&v19->_serverCertLeafMarkerOIDOverride, a9);
  }

  return v19;
}

- (id)description
{
  void *v3;
  _BOOL4 v4;
  const char *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" connectionRetryIntervalMillis=%lu"), -[TUConversationVirtualParticipantConfig connectionRetryIntervalMillis](self, "connectionRetryIntervalMillis"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" connectionMaxAttempts=%lu"), -[TUConversationVirtualParticipantConfig connectionMaxAttempts](self, "connectionMaxAttempts"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" rpcStreamRetryIntervalMillis=%lu"), -[TUConversationVirtualParticipantConfig rpcStreamRetryIntervalMillis](self, "rpcStreamRetryIntervalMillis"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" rpcStreamRetryIntervalMaxAttempts=%lu"), -[TUConversationVirtualParticipantConfig rpcStreamMaxAttempts](self, "rpcStreamMaxAttempts"));
  v4 = -[TUConversationVirtualParticipantConfig serverCertValidationEnabled](self, "serverCertValidationEnabled");
  v5 = "NO";
  if (v4)
    v5 = "YES";
  objc_msgSend(v3, "appendFormat:", CFSTR(" serverCertValidationEnabled=%s"), v5);
  -[TUConversationVirtualParticipantConfig serverCertHostnameOverride](self, "serverCertHostnameOverride");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[TUConversationVirtualParticipantConfig serverCertHostnameOverride](self, "serverCertHostnameOverride");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" serverCertHostnameOverride=%@"), v7);

  }
  -[TUConversationVirtualParticipantConfig serverCertLeafMarkerOIDOverride](self, "serverCertLeafMarkerOIDOverride");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[TUConversationVirtualParticipantConfig serverCertLeafMarkerOIDOverride](self, "serverCertLeafMarkerOIDOverride");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" serverCertLeafMarkerOIDOverride=%@"), v9);

  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v10 = (void *)objc_msgSend(v3, "copy");

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[TUConversationVirtualParticipantConfig isEqualToConversationVirtualParticipantConfig:](self, "isEqualToConversationVirtualParticipantConfig:", v4);

  return v5;
}

- (BOOL)isEqualToConversationVirtualParticipantConfig:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int v11;
  char v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v6 = a3;
  v7 = -[TUConversationVirtualParticipantConfig connectionRetryIntervalMillis](self, "connectionRetryIntervalMillis");
  if (v7 == objc_msgSend(v6, "connectionRetryIntervalMillis"))
  {
    v8 = -[TUConversationVirtualParticipantConfig connectionMaxAttempts](self, "connectionMaxAttempts");
    if (v8 == objc_msgSend(v6, "connectionMaxAttempts"))
    {
      v9 = -[TUConversationVirtualParticipantConfig rpcStreamRetryIntervalMillis](self, "rpcStreamRetryIntervalMillis");
      if (v9 == objc_msgSend(v6, "rpcStreamRetryIntervalMillis"))
      {
        v10 = -[TUConversationVirtualParticipantConfig rpcStreamMaxAttempts](self, "rpcStreamMaxAttempts");
        if (v10 == objc_msgSend(v6, "rpcStreamMaxAttempts"))
        {
          v11 = -[TUConversationVirtualParticipantConfig serverCertValidationEnabled](self, "serverCertValidationEnabled");
          if (v11 == objc_msgSend(v6, "serverCertValidationEnabled"))
          {
            -[TUConversationVirtualParticipantConfig serverCertHostnameOverride](self, "serverCertHostnameOverride");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "serverCertHostnameOverride");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v14 != v15)
            {
              -[TUConversationVirtualParticipantConfig serverCertHostnameOverride](self, "serverCertHostnameOverride");
              v3 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "serverCertHostnameOverride");
              v4 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend(v3, "isEqualToString:", v4))
              {
                v12 = 0;
                goto LABEL_21;
              }
            }
            -[TUConversationVirtualParticipantConfig serverCertLeafMarkerOIDOverride](self, "serverCertLeafMarkerOIDOverride");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "serverCertLeafMarkerOIDOverride");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v16 != v17)
            {
              -[TUConversationVirtualParticipantConfig serverCertLeafMarkerOIDOverride](self, "serverCertLeafMarkerOIDOverride");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "serverCertLeafMarkerOIDOverride");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend(v18, "isEqualToString:", v19))
              {
                v12 = 0;
                goto LABEL_19;
              }
              v30 = v19;
              v31 = v18;
            }
            -[TUConversationVirtualParticipantConfig idsAliasingSalt](self, "idsAliasingSalt");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "idsAliasingSalt");
            v21 = objc_claimAutoreleasedReturnValue();
            if (v20 == (void *)v21)
            {

              v12 = 1;
            }
            else
            {
              v22 = (void *)v21;
              -[TUConversationVirtualParticipantConfig idsAliasingSalt](self, "idsAliasingSalt");
              v29 = v3;
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "idsAliasingSalt");
              v28 = v16;
              v24 = v15;
              v25 = v14;
              v26 = v4;
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = objc_msgSend(v23, "isEqualToData:", v27);

              v4 = v26;
              v14 = v25;
              v15 = v24;
              v16 = v28;

              v3 = v29;
            }
            v19 = v30;
            v18 = v31;
            if (v16 == v17)
            {
LABEL_20:

              if (v14 == v15)
              {
LABEL_22:

                goto LABEL_7;
              }
LABEL_21:

              goto LABEL_22;
            }
LABEL_19:

            goto LABEL_20;
          }
        }
      }
    }
  }
  v12 = 0;
LABEL_7:

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _BOOL4 v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;

  v3 = -[TUConversationVirtualParticipantConfig connectionRetryIntervalMillis](self, "connectionRetryIntervalMillis");
  v4 = -[TUConversationVirtualParticipantConfig connectionMaxAttempts](self, "connectionMaxAttempts") ^ v3;
  v5 = -[TUConversationVirtualParticipantConfig rpcStreamRetryIntervalMillis](self, "rpcStreamRetryIntervalMillis");
  v6 = v4 ^ v5 ^ -[TUConversationVirtualParticipantConfig rpcStreamMaxAttempts](self, "rpcStreamMaxAttempts");
  v7 = -[TUConversationVirtualParticipantConfig serverCertValidationEnabled](self, "serverCertValidationEnabled");
  v8 = 1237;
  if (v7)
    v8 = 1231;
  v9 = v6 ^ v8;
  -[TUConversationVirtualParticipantConfig serverCertHostnameOverride](self, "serverCertHostnameOverride");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  -[TUConversationVirtualParticipantConfig serverCertLeafMarkerOIDOverride](self, "serverCertLeafMarkerOIDOverride");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11 ^ objc_msgSend(v12, "hash");
  -[TUConversationVirtualParticipantConfig idsAliasingSalt](self, "idsAliasingSalt");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v9 ^ v13 ^ objc_msgSend(v14, "hash");

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = -[TUConversationVirtualParticipantConfig connectionRetryIntervalMillis](self, "connectionRetryIntervalMillis");
  v6 = -[TUConversationVirtualParticipantConfig connectionMaxAttempts](self, "connectionMaxAttempts");
  v7 = -[TUConversationVirtualParticipantConfig rpcStreamRetryIntervalMillis](self, "rpcStreamRetryIntervalMillis");
  v8 = -[TUConversationVirtualParticipantConfig rpcStreamMaxAttempts](self, "rpcStreamMaxAttempts");
  v9 = -[TUConversationVirtualParticipantConfig serverCertValidationEnabled](self, "serverCertValidationEnabled");
  -[TUConversationVirtualParticipantConfig serverCertHostnameOverride](self, "serverCertHostnameOverride");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationVirtualParticipantConfig serverCertLeafMarkerOIDOverride](self, "serverCertLeafMarkerOIDOverride");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v4, "initWithConnectionRetryIntervalMillis:connectionMaxAttempts:rpcStreamRetryIntervalMillis:rpcStreamMaxAttempts:serverCertValidationEnabled:serverCertHostnameOverride:serverCertLeafMarkerOIDOverride:", v5, v6, v7, v8, v9, v10, v11);

  -[TUConversationVirtualParticipantConfig idsAliasingSalt](self, "idsAliasingSalt");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setIdsAliasingSalt:", v13);

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUConversationVirtualParticipantConfig)initWithCoder:(id)a3
{
  id v4;
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
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  TUConversationVirtualParticipantConfig *v21;
  uint64_t v22;
  void *v23;
  void *v24;

  v4 = a3;
  NSStringFromSelector(sel_connectionRetryIntervalMillis);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", v5);

  NSStringFromSelector(sel_connectionMaxAttempts);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", v7);

  NSStringFromSelector(sel_rpcStreamRetryIntervalMillis);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "decodeIntegerForKey:", v9);

  NSStringFromSelector(sel_rpcStreamMaxAttempts);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v4, "decodeIntegerForKey:", v11);

  NSStringFromSelector(sel_serverCertValidationEnabled);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v4, "decodeBoolForKey:", v13);

  v15 = objc_opt_class();
  NSStringFromSelector(sel_serverCertHostnameOverride);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_opt_class();
  NSStringFromSelector(sel_serverCertLeafMarkerOIDOverride);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = -[TUConversationVirtualParticipantConfig initWithConnectionRetryIntervalMillis:connectionMaxAttempts:rpcStreamRetryIntervalMillis:rpcStreamMaxAttempts:serverCertValidationEnabled:serverCertHostnameOverride:serverCertLeafMarkerOIDOverride:](self, "initWithConnectionRetryIntervalMillis:connectionMaxAttempts:rpcStreamRetryIntervalMillis:rpcStreamMaxAttempts:serverCertValidationEnabled:serverCertHostnameOverride:serverCertLeafMarkerOIDOverride:", v6, v8, v10, v12, v14, v17, v20);
  if (v21)
  {
    v22 = objc_opt_class();
    NSStringFromSelector(sel_idsAliasingSalt);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUConversationVirtualParticipantConfig setIdsAliasingSalt:](v21, "setIdsAliasingSalt:", v24);

  }
  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v4 = a3;
  v5 = -[TUConversationVirtualParticipantConfig connectionRetryIntervalMillis](self, "connectionRetryIntervalMillis");
  NSStringFromSelector(sel_connectionRetryIntervalMillis);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v5, v6);

  v7 = -[TUConversationVirtualParticipantConfig connectionMaxAttempts](self, "connectionMaxAttempts");
  NSStringFromSelector(sel_connectionMaxAttempts);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v7, v8);

  v9 = -[TUConversationVirtualParticipantConfig rpcStreamRetryIntervalMillis](self, "rpcStreamRetryIntervalMillis");
  NSStringFromSelector(sel_rpcStreamRetryIntervalMillis);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v9, v10);

  v11 = -[TUConversationVirtualParticipantConfig rpcStreamMaxAttempts](self, "rpcStreamMaxAttempts");
  NSStringFromSelector(sel_rpcStreamMaxAttempts);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v11, v12);

  v13 = -[TUConversationVirtualParticipantConfig serverCertValidationEnabled](self, "serverCertValidationEnabled");
  NSStringFromSelector(sel_serverCertValidationEnabled);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v13, v14);

  -[TUConversationVirtualParticipantConfig serverCertHostnameOverride](self, "serverCertHostnameOverride");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_serverCertHostnameOverride);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, v16);

  -[TUConversationVirtualParticipantConfig serverCertLeafMarkerOIDOverride](self, "serverCertLeafMarkerOIDOverride");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_serverCertLeafMarkerOIDOverride);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, v18);

  -[TUConversationVirtualParticipantConfig idsAliasingSalt](self, "idsAliasingSalt");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_idsAliasingSalt);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v20, v19);

}

- (unint64_t)connectionRetryIntervalMillis
{
  return self->_connectionRetryIntervalMillis;
}

- (unint64_t)connectionMaxAttempts
{
  return self->_connectionMaxAttempts;
}

- (unint64_t)rpcStreamRetryIntervalMillis
{
  return self->_rpcStreamRetryIntervalMillis;
}

- (unint64_t)rpcStreamMaxAttempts
{
  return self->_rpcStreamMaxAttempts;
}

- (BOOL)serverCertValidationEnabled
{
  return self->_serverCertValidationEnabled;
}

- (NSString)serverCertHostnameOverride
{
  return self->_serverCertHostnameOverride;
}

- (NSString)serverCertLeafMarkerOIDOverride
{
  return self->_serverCertLeafMarkerOIDOverride;
}

- (NSData)idsAliasingSalt
{
  return self->_idsAliasingSalt;
}

- (void)setIdsAliasingSalt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsAliasingSalt, 0);
  objc_storeStrong((id *)&self->_serverCertLeafMarkerOIDOverride, 0);
  objc_storeStrong((id *)&self->_serverCertHostnameOverride, 0);
}

@end
