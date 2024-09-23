@implementation KTSelfStatusResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (KTSelfStatusResult)init
{
  KTSelfStatusResult *v2;
  KTSelfStatusResult *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)KTSelfStatusResult;
  v2 = -[KTSelfStatusResult init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[KTSelfStatusResult setOptIn:](v2, "setOptIn:", 2);
    -[KTSelfStatusResult setEverOptIn:](v3, "setEverOptIn:", 0);
    -[KTSelfStatusResult setServerOptIn:](v3, "setServerOptIn:", 2);
    -[KTSelfStatusResult setAccountStatus:](v3, "setAccountStatus:", 0);
    -[KTSelfStatusResult setSystemStatus:](v3, "setSystemStatus:", 2);
    -[KTSelfStatusResult setSelfStatus:](v3, "setSelfStatus:", 2);
    -[KTSelfStatusResult setPendingStatusChanges:](v3, "setPendingStatusChanges:", 1);
  }
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[KTSelfStatusResult optIn](self, "optIn"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v4, CFSTR("optInState"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[KTSelfStatusResult everOptIn](self, "everOptIn"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v5, CFSTR("everOptInState"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[KTSelfStatusResult serverOptIn](self, "serverOptIn"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v6, CFSTR("serverOptInState"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[KTSelfStatusResult accountStatus](self, "accountStatus"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v7, CFSTR("accountStatus"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[KTSelfStatusResult systemStatus](self, "systemStatus"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v8, CFSTR("systemStatus"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[KTSelfStatusResult selfStatus](self, "selfStatus"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v9, CFSTR("selfStatus"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[KTSelfStatusResult idsAccountStatus](self, "idsAccountStatus"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v10, CFSTR("idsAccountStatus"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[KTSelfStatusResult pendingStatusChanges](self, "pendingStatusChanges"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v11, CFSTR("pendingChanges"));

  -[KTSelfStatusResult selfDevices](self, "selfDevices");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[KTSelfStatusResult selfDevices](self, "selfDevices");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "encodeObject:forKey:", v13, CFSTR("selfDevices"));

  }
  -[KTSelfStatusResult accountKey](self, "accountKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[KTSelfStatusResult accountKey](self, "accountKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "encodeObject:forKey:", v15, CFSTR("accountKey"));

  }
}

- (KTSelfStatusResult)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  KTSelfStatusResult *v14;
  void *v16;
  void *v17;
  void *v18;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("optInState"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("everOptInState"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serverOptInState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountStatus"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("systemStatus"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selfStatus"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("idsAccountStatus"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pendingChanges"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDBCF20];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v11, CFSTR("selfDevices"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc_init(KTSelfStatusResult);
  -[KTSelfStatusResult setOptIn:](v14, "setOptIn:", objc_msgSend(v16, "kt_enumValueWithMax:defaultValue:", 2, 2));
  -[KTSelfStatusResult setEverOptIn:](v14, "setEverOptIn:", objc_msgSend(v4, "BOOLValue"));
  -[KTSelfStatusResult setServerOptIn:](v14, "setServerOptIn:", objc_msgSend(v5, "kt_enumValueWithMax:defaultValue:", 2, 2));
  -[KTSelfStatusResult setAccountStatus:](v14, "setAccountStatus:", objc_msgSend(v6, "kt_enumValueWithMax:defaultValue:", 5, 0));
  -[KTSelfStatusResult setSystemStatus:](v14, "setSystemStatus:", objc_msgSend(v7, "kt_enumValueWithMax:defaultValue:", 5, 2));
  -[KTSelfStatusResult setSelfStatus:](v14, "setSelfStatus:", objc_msgSend(v8, "kt_enumValueWithMax:defaultValue:", 4, 2));
  -[KTSelfStatusResult setIdsAccountStatus:](v14, "setIdsAccountStatus:", objc_msgSend(v17, "kt_enumValueWithMax:defaultValue:", 3, 0));
  -[KTSelfStatusResult setSelfDevices:](v14, "setSelfDevices:", v12);
  -[KTSelfStatusResult setAccountKey:](v14, "setAccountKey:", v13);
  -[KTSelfStatusResult setPendingStatusChanges:](v14, "setPendingStatusChanges:", objc_msgSend(v18, "BOOLValue"));

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  KTSelfStatusResult *v4;
  KTSelfStatusResult *v5;
  unint64_t v6;
  _BOOL4 v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  int v14;
  _BOOL4 v15;
  _BOOL4 v16;

  v4 = (KTSelfStatusResult *)a3;
  if (self == v4)
  {
    LOBYTE(v16) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[KTSelfStatusResult optIn](self, "optIn");
      if (v6 != -[KTSelfStatusResult optIn](v5, "optIn"))
        goto LABEL_13;
      v7 = -[KTSelfStatusResult everOptIn](self, "everOptIn");
      if (v7 != -[KTSelfStatusResult everOptIn](v5, "everOptIn"))
        goto LABEL_13;
      v8 = -[KTSelfStatusResult accountStatus](self, "accountStatus");
      if (v8 != -[KTSelfStatusResult accountStatus](v5, "accountStatus"))
        goto LABEL_13;
      v9 = -[KTSelfStatusResult systemStatus](self, "systemStatus");
      if (v9 != -[KTSelfStatusResult systemStatus](v5, "systemStatus"))
        goto LABEL_13;
      v10 = -[KTSelfStatusResult selfStatus](self, "selfStatus");
      if (v10 != -[KTSelfStatusResult selfStatus](v5, "selfStatus"))
        goto LABEL_13;
      v11 = -[KTSelfStatusResult idsAccountStatus](self, "idsAccountStatus");
      if (v11 != -[KTSelfStatusResult idsAccountStatus](v5, "idsAccountStatus"))
        goto LABEL_13;
      -[KTSelfStatusResult selfDevices](self, "selfDevices");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[KTSelfStatusResult selfDevices](v5, "selfDevices");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqual:", v13);

      if (v14)
      {
        v15 = -[KTSelfStatusResult pendingStatusChanges](self, "pendingStatusChanges");
        v16 = v15 ^ -[KTSelfStatusResult pendingStatusChanges](v5, "pendingStatusChanges") ^ 1;
      }
      else
      {
LABEL_13:
        LOBYTE(v16) = 0;
      }

    }
    else
    {
      LOBYTE(v16) = 0;
    }
  }

  return v16;
}

- (id)description
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  unint64_t v7;
  const __CFString *v8;
  unint64_t v9;
  const __CFString *v10;
  unint64_t v11;
  const __CFString *v12;
  unint64_t v13;
  const __CFString *v14;
  _BOOL4 v15;
  const __CFString *v16;
  void *v17;
  void *v18;

  v3 = (void *)MEMORY[0x24BDD16A8];
  KTOptInGetString(-[KTSelfStatusResult optIn](self, "optIn"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[KTSelfStatusResult everOptIn](self, "everOptIn");
  KTOptInGetString(-[KTSelfStatusResult serverOptIn](self, "serverOptIn"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[KTSelfStatusResult accountStatus](self, "accountStatus") - 1;
  if (v7 > 5)
    v8 = CFSTR("Unknown");
  else
    v8 = off_24DC8F218[v7];
  v9 = -[KTSelfStatusResult systemStatus](self, "systemStatus") - 1;
  if (v9 > 4)
    v10 = CFSTR("OK");
  else
    v10 = off_24DC8F248[v9];
  v11 = -[KTSelfStatusResult selfStatus](self, "selfStatus") - 1;
  if (v11 > 3)
    v12 = CFSTR("OK");
  else
    v12 = off_24DC8F270[v11];
  v13 = -[KTSelfStatusResult idsAccountStatus](self, "idsAccountStatus") - 1;
  if (v13 > 2)
    v14 = CFSTR("IDSAccountStatusInvalid");
  else
    v14 = off_24DC8F290[v13];
  v15 = -[KTSelfStatusResult pendingStatusChanges](self, "pendingStatusChanges");
  v16 = CFSTR("NO");
  if (v15)
    v16 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("KTStatus: optIn = %@, everOptIn = %d, serverOptIn = %@, accountStatus = %@, systemStatus = %@, selfStatus = %@, idsAccountStatus = %@, pendingChanges: %@\n"), v4, v5, v6, v8, v10, v12, v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[KTSelfStatusResult selfDevices](self, "selfDevices");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "appendFormat:", CFSTR("\tdevices:%@\n"), v18);

  return v17;
}

- (NSDictionary)diagnosticsJsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  const __CFString *v8;
  unint64_t v9;
  const __CFString *v10;
  unint64_t v11;
  const __CFString *v12;
  unint64_t v13;
  const __CFString *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("2"), CFSTR("copy_status_version"));
  KTOptInGetString(-[KTSelfStatusResult optIn](self, "optIn"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("optedIn"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[KTSelfStatusResult everOptIn](self, "everOptIn"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("everOptIn"));

  KTOptInGetString(-[KTSelfStatusResult serverOptIn](self, "serverOptIn"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("serverOptedIn"));

  v7 = -[KTSelfStatusResult accountStatus](self, "accountStatus") - 1;
  if (v7 > 5)
    v8 = CFSTR("Unknown");
  else
    v8 = off_24DC8F218[v7];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("accountStatus"));
  v9 = -[KTSelfStatusResult systemStatus](self, "systemStatus") - 1;
  if (v9 > 4)
    v10 = CFSTR("OK");
  else
    v10 = off_24DC8F248[v9];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("systemStatus"));
  v11 = -[KTSelfStatusResult selfStatus](self, "selfStatus") - 1;
  if (v11 > 3)
    v12 = CFSTR("OK");
  else
    v12 = off_24DC8F270[v11];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("selfStatus"));
  v13 = -[KTSelfStatusResult idsAccountStatus](self, "idsAccountStatus") - 1;
  if (v13 > 2)
    v14 = CFSTR("IDSAccountStatusInvalid");
  else
    v14 = off_24DC8F290[v13];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("idsAccountStatus"));
  -[KTSelfStatusResult selfDevices](self, "selfDevices");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v16)
  {
    v17 = (void *)MEMORY[0x24BDBCEB8];
    -[KTSelfStatusResult selfDevices](self, "selfDevices");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "arrayWithCapacity:", objc_msgSend(v18, "count"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    -[KTSelfStatusResult selfDevices](self, "selfDevices", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v30;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v30 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v24), "diagnosticsJsonDictionary");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v25);

          ++v24;
        }
        while (v22 != v24);
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v22);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("loggableDevices"));
  }
  -[KTSelfStatusResult accountKey](self, "accountKey");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("accountKey"));

  if (-[KTSelfStatusResult pendingStatusChanges](self, "pendingStatusChanges"))
    v27 = CFSTR("YES");
  else
    v27 = CFSTR("NO");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("pendingChanges"));
  return (NSDictionary *)v3;
}

- (id)simpleStatus
{
  KTStatusResult *v3;

  v3 = objc_alloc_init(KTStatusResult);
  -[KTStatusResult setOptIn:](v3, "setOptIn:", -[KTSelfStatusResult optIn](self, "optIn"));
  -[KTStatusResult setServerOptIn:](v3, "setServerOptIn:", -[KTSelfStatusResult serverOptIn](self, "serverOptIn"));
  -[KTStatusResult setAccountStatus:](v3, "setAccountStatus:", -[KTSelfStatusResult accountStatus](self, "accountStatus"));
  -[KTStatusResult setSystemStatus:](v3, "setSystemStatus:", -[KTSelfStatusResult systemStatus](self, "systemStatus"));
  -[KTStatusResult setSelfStatus:](v3, "setSelfStatus:", -[KTSelfStatusResult selfStatus](self, "selfStatus"));
  -[KTStatusResult setIdsAccountStatus:](v3, "setIdsAccountStatus:", -[KTSelfStatusResult idsAccountStatus](self, "idsAccountStatus"));
  -[KTStatusResult setOptInState:](v3, "setOptInState:", -[KTStatusResult optIn](v3, "optIn") == 1);
  -[KTStatusResult setPendingStatusChanges:](v3, "setPendingStatusChanges:", -[KTSelfStatusResult pendingStatusChanges](self, "pendingStatusChanges"));
  return v3;
}

- (unint64_t)optIn
{
  return self->_optIn;
}

- (void)setOptIn:(unint64_t)a3
{
  self->_optIn = a3;
}

- (BOOL)everOptIn
{
  return self->_everOptIn;
}

- (void)setEverOptIn:(BOOL)a3
{
  self->_everOptIn = a3;
}

- (unint64_t)accountStatus
{
  return self->_accountStatus;
}

- (void)setAccountStatus:(unint64_t)a3
{
  self->_accountStatus = a3;
}

- (unint64_t)systemStatus
{
  return self->_systemStatus;
}

- (void)setSystemStatus:(unint64_t)a3
{
  self->_systemStatus = a3;
}

- (unint64_t)selfStatus
{
  return self->_selfStatus;
}

- (void)setSelfStatus:(unint64_t)a3
{
  self->_selfStatus = a3;
}

- (unint64_t)idsAccountStatus
{
  return self->_idsAccountStatus;
}

- (void)setIdsAccountStatus:(unint64_t)a3
{
  self->_idsAccountStatus = a3;
}

- (NSString)accountKey
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAccountKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSArray)selfDevices
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSelfDevices:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (BOOL)pendingStatusChanges
{
  return self->_pendingStatusChanges;
}

- (void)setPendingStatusChanges:(BOOL)a3
{
  self->_pendingStatusChanges = a3;
}

- (unint64_t)serverOptIn
{
  return self->_serverOptIn;
}

- (void)setServerOptIn:(unint64_t)a3
{
  self->_serverOptIn = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selfDevices, 0);
  objc_storeStrong((id *)&self->_accountKey, 0);
}

@end
