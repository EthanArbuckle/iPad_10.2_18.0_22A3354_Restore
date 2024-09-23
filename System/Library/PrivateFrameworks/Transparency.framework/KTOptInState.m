@implementation KTOptInState

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
  id v13;

  v13 = a3;
  -[KTOptInState application](self, "application");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v4, CFSTR("application"));

  objc_msgSend(v13, "encodeInteger:forKey:", -[KTOptInState state](self, "state"), CFSTR("state"));
  objc_msgSend(v13, "encodeInteger:forKey:", -[KTOptInState everOptIn](self, "everOptIn"), CFSTR("everOptIn"));
  -[KTOptInState uri](self, "uri");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[KTOptInState uri](self, "uri");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "encodeObject:forKey:", v6, CFSTR("uri"));

  }
  -[KTOptInState smtTimestamp](self, "smtTimestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[KTOptInState smtTimestamp](self, "smtTimestamp");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "encodeObject:forKey:", v8, CFSTR("smtTimestamp"));

  }
  -[KTOptInState osVersion](self, "osVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[KTOptInState osVersion](self, "osVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "encodeObject:forKey:", v10, CFSTR("osVersion"));

  }
  -[KTOptInState serialNumber](self, "serialNumber");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[KTOptInState serialNumber](self, "serialNumber");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "encodeObject:forKey:", v12, CFSTR("serialNumber"));

  }
}

- (KTOptInState)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  KTOptInState *v8;
  unint64_t v9;
  KTOptInState *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uri"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("application"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("state"));
  v8 = 0;
  if (v6)
  {
    v9 = v7;
    if ((v7 & 0x8000000000000000) == 0 && v7 <= 2)
    {
      v15.receiver = self;
      v15.super_class = (Class)KTOptInState;
      v10 = -[KTOptInState init](&v15, sel_init);
      self = v10;
      if (v10)
      {
        -[KTOptInState setUri:](v10, "setUri:", v5);
        -[KTOptInState setApplication:](self, "setApplication:", v6);
        -[KTOptInState setState:](self, "setState:", v9);
        -[KTOptInState setEverOptIn:](self, "setEverOptIn:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("everOptIn")) != 0);
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("smtTimestamp"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[KTOptInState setSmtTimestamp:](self, "setSmtTimestamp:", v11);

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("osVersion"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[KTOptInState setOsVersion:](self, "setOsVersion:", v12);

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serialNumber"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[KTOptInState setSerialNumber:](self, "setSerialNumber:", v13);

        self = self;
        v8 = self;
      }
      else
      {
        v8 = 0;
      }
    }
  }

  return v8;
}

- (KTOptInState)initWithURI:(id)a3 application:(id)a4
{
  id v6;
  id v7;
  KTOptInState *v8;
  KTOptInState *v9;
  KTOptInState *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)KTOptInState;
  v8 = -[KTOptInState init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    -[KTOptInState setUri:](v8, "setUri:", v6);
    -[KTOptInState setApplication:](v9, "setApplication:", v7);
    -[KTOptInState setState:](v9, "setState:", 2);
    v10 = v9;
  }

  return v9;
}

- (KTOptInState)initWithApplication:(id)a3
{
  return -[KTOptInState initWithURI:application:](self, "initWithURI:application:", 0, a3);
}

- (id)description
{
  void *v3;
  unint64_t v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[KTOptInState state](self, "state");
  v5 = CFSTR("Off");
  if (v4 == 1)
    v5 = CFSTR("On");
  if (v4 == 2)
    v5 = CFSTR("Pending");
  v6 = v5;
  -[KTOptInState uri](self, "uri");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[KTOptInState application](self, "application");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<KTOptInState: s: %@ u: %@[%@]>"), v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)debugDescription
{
  void *v3;
  unint64_t v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[KTOptInState state](self, "state");
  v5 = CFSTR("Off");
  if (v4 == 1)
    v5 = CFSTR("On");
  if (v4 == 2)
    v5 = CFSTR("Pending");
  v6 = v5;
  -[KTOptInState uri](self, "uri");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[KTOptInState application](self, "application");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<KTOptInState: %p s: %@ u: %@[%@]>"), self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)jsonDescription
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[KTOptInState state](self, "state");
  v5 = CFSTR("Off");
  if (v4 == 1)
    v5 = CFSTR("On");
  if (v4 == 2)
    v6 = CFSTR("Pending");
  else
    v6 = v5;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("state"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[KTOptInState everOptIn](self, "everOptIn"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("everOptIn"));

  -[KTOptInState application](self, "application");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("application"));

  -[KTOptInState uri](self, "uri");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("uri"));

  -[KTOptInState smtTimestamp](self, "smtTimestamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "kt_toISO_8601_UTCString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("smtTimestampReadable"));

  v12 = (void *)MEMORY[0x24BDD16E0];
  -[KTOptInState smtTimestamp](self, "smtTimestamp");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSince1970");
  objc_msgSend(v12, "numberWithDouble:", v14 * 1000.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("smtTimetampMs"));

  -[KTOptInState osVersion](self, "osVersion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("osVersion"));

  -[KTOptInState serialNumber](self, "serialNumber");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("serialNumber"));

  return v3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (BOOL)everOptIn
{
  return self->_everOptIn;
}

- (void)setEverOptIn:(BOOL)a3
{
  self->_everOptIn = a3;
}

- (NSString)uri
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUri:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)application
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setApplication:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSDate)smtTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSmtTimestamp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)osVersion
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setOsVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)serialNumber
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSerialNumber:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_smtTimestamp, 0);
  objc_storeStrong((id *)&self->_application, 0);
  objc_storeStrong((id *)&self->_uri, 0);
}

@end
