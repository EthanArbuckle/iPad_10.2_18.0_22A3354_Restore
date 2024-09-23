@implementation KTStatusResult

+ (BOOL)supportsSecureCoding
{
  return 1;
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
  id v15;

  v15 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[KTStatusResult optIn](self, "optIn"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v4, CFSTR("optInState"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[KTStatusResult serverOptIn](self, "serverOptIn"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v5, CFSTR("serverOptInState"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[KTStatusResult accountStatus](self, "accountStatus"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v6, CFSTR("accountStatus"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[KTStatusResult systemStatus](self, "systemStatus"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v7, CFSTR("systemStatus"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[KTStatusResult selfStatus](self, "selfStatus"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v8, CFSTR("selfStatus"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[KTStatusResult idsAccountStatus](self, "idsAccountStatus"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v9, CFSTR("idsAccountStatus"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[KTStatusResult pendingStatusChanges](self, "pendingStatusChanges"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v10, CFSTR("pendingChanges"));

  -[KTStatusResult recentFailedEventIds](self, "recentFailedEventIds");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[KTStatusResult recentFailedEventIds](self, "recentFailedEventIds");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "encodeObject:forKey:", v12, CFSTR("failureEventIds"));

  }
  -[KTStatusResult expectedSelfResolutionDate](self, "expectedSelfResolutionDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[KTStatusResult expectedSelfResolutionDate](self, "expectedSelfResolutionDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "encodeObject:forKey:", v14, CFSTR("selfResolutionDate"));

  }
}

- (KTStatusResult)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  KTStatusResult *v15;
  uint64_t v16;
  void *v18;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("optInState"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serverOptInState"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountStatus"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("systemStatus"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selfStatus"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("idsAccountStatus"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pendingChanges"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDBCF20];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v12, CFSTR("failureEventIds"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selfResolutionDate"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_alloc_init(KTStatusResult);
  -[KTStatusResult setRecentFailedEventIds:](v15, "setRecentFailedEventIds:", v13);
  -[KTStatusResult setExpectedSelfResolutionDate:](v15, "setExpectedSelfResolutionDate:", v14);
  v16 = objc_msgSend(v4, "kt_enumValueWithMax:defaultValue:", 2, 2);
  -[KTStatusResult setOptIn:](v15, "setOptIn:", v16);
  -[KTStatusResult setOptInState:](v15, "setOptInState:", v16 == 1);
  -[KTStatusResult setServerOptIn:](v15, "setServerOptIn:", objc_msgSend(v18, "kt_enumValueWithMax:defaultValue:", 2, 2));
  -[KTStatusResult setAccountStatus:](v15, "setAccountStatus:", objc_msgSend(v5, "kt_enumValueWithMax:defaultValue:", 5, 0));
  -[KTStatusResult setSystemStatus:](v15, "setSystemStatus:", objc_msgSend(v6, "kt_enumValueWithMax:defaultValue:", 5, 2));
  -[KTStatusResult setSelfStatus:](v15, "setSelfStatus:", objc_msgSend(v7, "kt_enumValueWithMax:defaultValue:", 4, 2));
  -[KTStatusResult setIdsAccountStatus:](v15, "setIdsAccountStatus:", objc_msgSend(v8, "kt_enumValueWithMax:defaultValue:", 3, 0));
  -[KTStatusResult setPendingStatusChanges:](v15, "setPendingStatusChanges:", objc_msgSend(v9, "BOOLValue"));

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  KTStatusResult *v4;
  KTStatusResult *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _BOOL4 v11;
  _BOOL4 v12;

  v4 = (KTStatusResult *)a3;
  if (self == v4)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[KTStatusResult optIn](self, "optIn");
      if (v6 == -[KTStatusResult optIn](v5, "optIn")
        && (v7 = -[KTStatusResult accountStatus](self, "accountStatus"),
            v7 == -[KTStatusResult accountStatus](v5, "accountStatus"))
        && (v8 = -[KTStatusResult systemStatus](self, "systemStatus"),
            v8 == -[KTStatusResult systemStatus](v5, "systemStatus"))
        && (v9 = -[KTStatusResult selfStatus](self, "selfStatus"), v9 == -[KTStatusResult selfStatus](v5, "selfStatus"))
        && (v10 = -[KTStatusResult idsAccountStatus](self, "idsAccountStatus"),
            v10 == -[KTStatusResult idsAccountStatus](v5, "idsAccountStatus")))
      {
        v11 = -[KTStatusResult pendingStatusChanges](self, "pendingStatusChanges");
        v12 = v11 ^ -[KTStatusResult pendingStatusChanges](v5, "pendingStatusChanges") ^ 1;
      }
      else
      {
        LOBYTE(v12) = 0;
      }

    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  const __CFString *v7;
  unint64_t v8;
  const __CFString *v9;
  unint64_t v10;
  const __CFString *v11;
  unint64_t v12;
  const __CFString *v13;
  _BOOL4 v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v3 = (void *)MEMORY[0x24BDD16A8];
  KTOptInGetString(-[KTStatusResult optIn](self, "optIn"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  KTOptInGetString(-[KTStatusResult serverOptIn](self, "serverOptIn"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[KTStatusResult accountStatus](self, "accountStatus") - 1;
  if (v6 > 5)
    v7 = CFSTR("Unknown");
  else
    v7 = off_24DC8F218[v6];
  v8 = -[KTStatusResult systemStatus](self, "systemStatus") - 1;
  if (v8 > 4)
    v9 = CFSTR("OK");
  else
    v9 = off_24DC8F248[v8];
  v10 = -[KTStatusResult selfStatus](self, "selfStatus") - 1;
  if (v10 > 3)
    v11 = CFSTR("OK");
  else
    v11 = off_24DC8F270[v10];
  v12 = -[KTStatusResult idsAccountStatus](self, "idsAccountStatus") - 1;
  if (v12 > 2)
    v13 = CFSTR("IDSAccountStatusInvalid");
  else
    v13 = off_24DC8F290[v12];
  v14 = -[KTStatusResult pendingStatusChanges](self, "pendingStatusChanges");
  v15 = CFSTR("NO");
  if (v14)
    v15 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("KTStatus: optIn = %@, serverOptIn = %@, accountStatus = %@, systemStatus = %@, selfStatus = %@, idsAccountStatus = %@, pendingChanges: %@\n"), v4, v5, v7, v9, v11, v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[KTStatusResult expectedSelfResolutionDate](self, "expectedSelfResolutionDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[KTStatusResult expectedSelfResolutionDate](self, "expectedSelfResolutionDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "appendFormat:", CFSTR(" expectedSelfResolutionDate: %@\n"), v18);

  }
  -[KTStatusResult recentFailedEventIds](self, "recentFailedEventIds");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[KTStatusResult recentFailedEventIds](self, "recentFailedEventIds");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "appendFormat:", CFSTR(" failureEventIds: %@"), v20);

  }
  return v16;
}

- (NSDictionary)diagnosticsJsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  const __CFString *v7;
  unint64_t v8;
  const __CFString *v9;
  unint64_t v10;
  const __CFString *v11;
  unint64_t v12;
  const __CFString *v13;
  const __CFString *v14;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("2"), CFSTR("copy_status_version"));
  KTOptInGetString(-[KTStatusResult optIn](self, "optIn"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("optedIn"));

  KTOptInGetString(-[KTStatusResult serverOptIn](self, "serverOptIn"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("serverOptedIn"));

  v6 = -[KTStatusResult accountStatus](self, "accountStatus") - 1;
  if (v6 > 5)
    v7 = CFSTR("Unknown");
  else
    v7 = off_24DC8F218[v6];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("accountStatus"));
  v8 = -[KTStatusResult systemStatus](self, "systemStatus") - 1;
  if (v8 > 4)
    v9 = CFSTR("OK");
  else
    v9 = off_24DC8F248[v8];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("systemStatus"));
  v10 = -[KTStatusResult selfStatus](self, "selfStatus") - 1;
  if (v10 > 3)
    v11 = CFSTR("OK");
  else
    v11 = off_24DC8F270[v10];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("selfStatus"));
  v12 = -[KTStatusResult idsAccountStatus](self, "idsAccountStatus") - 1;
  if (v12 > 2)
    v13 = CFSTR("IDSAccountStatusInvalid");
  else
    v13 = off_24DC8F290[v12];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("idsAccountStatus"));
  if (-[KTStatusResult pendingStatusChanges](self, "pendingStatusChanges"))
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("pendingChanges"));
  return (NSDictionary *)v3;
}

- (BOOL)optInState
{
  return self->_optInState;
}

- (void)setOptInState:(BOOL)a3
{
  self->_optInState = a3;
}

- (unint64_t)optIn
{
  return self->_optIn;
}

- (void)setOptIn:(unint64_t)a3
{
  self->_optIn = a3;
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

- (NSArray)recentFailedEventIds
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setRecentFailedEventIds:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSDate)expectedSelfResolutionDate
{
  return (NSDate *)objc_getProperty(self, a2, 72, 1);
}

- (void)setExpectedSelfResolutionDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expectedSelfResolutionDate, 0);
  objc_storeStrong((id *)&self->_recentFailedEventIds, 0);
}

@end
