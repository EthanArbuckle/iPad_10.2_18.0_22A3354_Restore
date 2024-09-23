@implementation RWIDriverConfiguration

- (RWIDriverConfiguration)init
{
  RWIDriverConfiguration *v2;
  RWIDriverConfiguration *v3;
  RWIDriverConfiguration *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RWIDriverConfiguration;
  v2 = -[RWIDriverConfiguration init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_driverPort = 0;
    v4 = v2;
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[RWIDriverConfiguration driverIdentifier](self, "driverIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDriverIdentifier:", v5);

  -[RWIDriverConfiguration driverName](self, "driverName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDriverName:", v6);

  -[RWIDriverConfiguration driverVersion](self, "driverVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDriverVersion:", v7);

  -[RWIDriverConfiguration driverHost](self, "driverHost");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDriverHost:", v8);

  objc_msgSend(v4, "setDriverPort:", -[RWIDriverConfiguration driverPort](self, "driverPort"));
  return v4;
}

+ (BOOL)isValidPayload:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WIRDriverIdentifierKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_10;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WIRDriverNameKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_10;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WIRDriverVersionKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_10;
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WIRDriverHostKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_10;
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WIRDriverPortKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4 || (objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
LABEL_10:
    v7 = (void *)objc_opt_class();
    logUnexpectedType(v7, v5);
    v6 = 0;
  }

  return v6;
}

+ (id)decodeFromPayload:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WIRDriverIdentifierKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WIRDriverNameKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WIRDriverVersionKey"));
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6 || (objc_opt_isKindOfClass() & 1) != 0)
      {

        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WIRDriverHostKey"));
        v8 = (id)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8 && (objc_opt_isKindOfClass() & 1) == 0)
        {
          v17 = (void *)objc_opt_class();
          logUnexpectedType(v17, v9);

          v12 = 0;
          v10 = v8;
        }
        else
        {

          objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WIRDriverPortKey"));
          v10 = (id)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10 && (objc_opt_isKindOfClass() & 1) == 0)
          {
            v18 = (void *)objc_opt_class();
            logUnexpectedType(v18, v11);

            v12 = 0;
          }
          else
          {

            v12 = (void *)objc_opt_new();
            objc_msgSend(v12, "setDriverIdentifier:", v4);
            objc_msgSend(v12, "setDriverName:", v5);
            objc_msgSend(v12, "setDriverVersion:", v6);
            objc_msgSend(v12, "setDriverHost:", v8);
            if (v10)
              v13 = objc_msgSend(v10, "integerValue");
            else
              v13 = 0;
            objc_msgSend(v12, "setDriverPort:", v13);
          }
        }

        goto LABEL_20;
      }
      v16 = (void *)objc_opt_class();
      logUnexpectedType(v16, v7);

    }
    else
    {
      v15 = (void *)objc_opt_class();
      logUnexpectedType(v15, v6);
    }
    v12 = 0;
LABEL_20:

    goto LABEL_21;
  }
  v14 = (void *)objc_opt_class();
  logUnexpectedType(v14, v5);
  v12 = 0;
LABEL_21:

  return v12;
}

- (void)encodeToPayload:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[RWIDriverConfiguration driverIdentifier](self, "driverIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v4, CFSTR("WIRDriverIdentifierKey"));

  -[RWIDriverConfiguration driverName](self, "driverName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v5, CFSTR("WIRDriverNameKey"));

  -[RWIDriverConfiguration driverVersion](self, "driverVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[RWIDriverConfiguration driverVersion](self, "driverVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v7, CFSTR("WIRDriverVersionKey"));

  }
  -[RWIDriverConfiguration driverHost](self, "driverHost");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[RWIDriverConfiguration driverHost](self, "driverHost");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, CFSTR("WIRDriverHostKey"));

  }
  if (-[RWIDriverConfiguration driverPort](self, "driverPort"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[RWIDriverConfiguration driverPort](self, "driverPort"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, CFSTR("WIRDriverPortKey"));

  }
}

- (NSString)driverIdentifier
{
  return self->_driverIdentifier;
}

- (void)setDriverIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)driverName
{
  return self->_driverName;
}

- (void)setDriverName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)driverVersion
{
  return self->_driverVersion;
}

- (void)setDriverVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)driverHost
{
  return self->_driverHost;
}

- (void)setDriverHost:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)driverPort
{
  return self->_driverPort;
}

- (void)setDriverPort:(int64_t)a3
{
  self->_driverPort = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_driverHost, 0);
  objc_storeStrong((id *)&self->_driverVersion, 0);
  objc_storeStrong((id *)&self->_driverName, 0);
  objc_storeStrong((id *)&self->_driverIdentifier, 0);
}

@end
