@implementation KTSelfVerificationHealableErrors

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[KTSelfVerificationHealableErrors accountHealableErrors](self, "accountHealableErrors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("accountHealableErrors"));

  -[KTSelfVerificationHealableErrors deviceIdToHealableErrors](self, "deviceIdToHealableErrors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("deviceIdToHealableErrors"));

  objc_msgSend(v6, "encodeInt64:forKey:", -[KTSelfVerificationHealableErrors healableState](self, "healableState"), CFSTR("healableState"));
}

- (KTSelfVerificationHealableErrors)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  KTSelfVerificationHealableErrors *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCF20];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("accountHealableErrors"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDBCF20];
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, v11, v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("deviceIdToHealableErrors"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("healableState"));
  v39.receiver = self;
  v39.super_class = (Class)KTSelfVerificationHealableErrors;
  v16 = -[KTSelfVerificationHealableErrors init](&v39, sel_init);
  if (v16)
  {
    if (objc_msgSend(v8, "count"))
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v8);
    else
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[KTSelfVerificationHealableErrors set_accountHealableErrors:](v16, "set_accountHealableErrors:", v17);

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[KTSelfVerificationHealableErrors set_deviceIdToHealableErrors:](v16, "set_deviceIdToHealableErrors:", v18);

    if (objc_msgSend(v14, "count"))
    {
      v30 = v15;
      v31 = v14;
      v32 = v13;
      v33 = v8;
      v34 = v7;
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v19 = v14;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v36 != v22)
              objc_enumerationMutation(v19);
            v24 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
            v25 = (void *)MEMORY[0x24BDBCEB8];
            objc_msgSend(v19, "objectForKey:", v24);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "arrayWithArray:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            -[KTSelfVerificationHealableErrors _deviceIdToHealableErrors](v16, "_deviceIdToHealableErrors");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setObject:forKey:", v27, v24);

          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        }
        while (v21);
      }

      v8 = v33;
      v7 = v34;
      v14 = v31;
      v13 = v32;
      v15 = v30;
    }
    -[KTSelfVerificationHealableErrors setHealableState:](v16, "setHealableState:", v15);
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  KTSelfVerificationHealableErrors *v4;
  KTSelfVerificationHealableErrors *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  BOOL v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;

  v4 = (KTSelfVerificationHealableErrors *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[KTSelfVerificationHealableErrors healableState](self, "healableState");
      if (v6 == -[KTSelfVerificationHealableErrors healableState](v5, "healableState"))
      {
        -[KTSelfVerificationHealableErrors accountHealableErrors](self, "accountHealableErrors");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[KTSelfVerificationHealableErrors accountHealableErrors](v5, "accountHealableErrors");
        v8 = objc_claimAutoreleasedReturnValue();
        if (v7 == (void *)v8)
        {

        }
        else
        {
          v9 = (void *)v8;
          -[KTSelfVerificationHealableErrors accountHealableErrors](self, "accountHealableErrors");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[KTSelfVerificationHealableErrors accountHealableErrors](v5, "accountHealableErrors");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v10, "isEqual:", v11);

          if (!v12)
            goto LABEL_12;
        }
        -[KTSelfVerificationHealableErrors deviceIdToHealableErrors](self, "deviceIdToHealableErrors");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[KTSelfVerificationHealableErrors deviceIdToHealableErrors](v5, "deviceIdToHealableErrors");
        v15 = objc_claimAutoreleasedReturnValue();
        if (v14 == (void *)v15)
        {

        }
        else
        {
          v16 = (void *)v15;
          -[KTSelfVerificationHealableErrors deviceIdToHealableErrors](self, "deviceIdToHealableErrors");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[KTSelfVerificationHealableErrors deviceIdToHealableErrors](v5, "deviceIdToHealableErrors");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v17, "isEqual:", v18);

          if ((v19 & 1) == 0)
            goto LABEL_12;
        }
        v13 = 1;
        goto LABEL_15;
      }
LABEL_12:
      v13 = 0;
LABEL_15:

      goto LABEL_16;
    }
    v13 = 0;
  }
LABEL_16:

  return v13;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("KTHealableErrors: <%p>\n"), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[KTSelfVerificationHealableErrors accountHealableErrors](self, "accountHealableErrors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "appendString:", CFSTR("account="));
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v34 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(v3, "appendFormat:", CFSTR("%@,"), *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i));
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "appendString:", CFSTR("\n"));
  }
  -[KTSelfVerificationHealableErrors deviceIdToHealableErrors](self, "deviceIdToHealableErrors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v3, "appendString:", CFSTR("devices = {\n"));
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v24 = v10;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v30 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
          objc_msgSend(v16, "kt_hexString");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("%@ : "), v17);

          v27 = 0u;
          v28 = 0u;
          v25 = 0u;
          v26 = 0u;
          objc_msgSend(v11, "objectForKey:", v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v26;
            do
            {
              for (k = 0; k != v20; ++k)
              {
                if (*(_QWORD *)v26 != v21)
                  objc_enumerationMutation(v18);
                objc_msgSend(v3, "appendFormat:", CFSTR("%@,"), *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * k));
              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
            }
            while (v20);
          }

          objc_msgSend(v3, "appendString:", CFSTR("\n"));
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
      }
      while (v13);
    }

    objc_msgSend(v3, "appendString:", CFSTR("}\n"));
    v10 = v24;
  }

  return v3;
}

- (KTSelfVerificationHealableErrors)init
{
  KTSelfVerificationHealableErrors *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)KTSelfVerificationHealableErrors;
  v2 = -[KTSelfVerificationHealableErrors init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[KTSelfVerificationHealableErrors set_accountHealableErrors:](v2, "set_accountHealableErrors:", v3);

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[KTSelfVerificationHealableErrors set_deviceIdToHealableErrors:](v2, "set_deviceIdToHealableErrors:", v4);

  }
  return v2;
}

- (NSArray)accountHealableErrors
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  -[KTSelfVerificationHealableErrors _accountHealableErrors](self, "_accountHealableErrors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  -[KTSelfVerificationHealableErrors _accountHealableErrors](self, "_accountHealableErrors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCE30];
    -[KTSelfVerificationHealableErrors _accountHealableErrors](self, "_accountHealableErrors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  objc_sync_exit(v3);

  return (NSArray *)v8;
}

- (NSDictionary)deviceIdToHealableErrors
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[KTSelfVerificationHealableErrors _deviceIdToHealableErrors](self, "_deviceIdToHealableErrors");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  -[KTSelfVerificationHealableErrors _deviceIdToHealableErrors](self, "_deviceIdToHealableErrors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[KTSelfVerificationHealableErrors _deviceIdToHealableErrors](self, "_deviceIdToHealableErrors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v19;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(v6);
          v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v9);
          v11 = (void *)MEMORY[0x24BDBCE30];
          -[KTSelfVerificationHealableErrors _deviceIdToHealableErrors](self, "_deviceIdToHealableErrors");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKey:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "arrayWithArray:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "setObject:forKey:", v14, v10);
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v7);
    }

    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }
  objc_sync_exit(obj);

  return (NSDictionary *)v15;
}

- (void)addAccountHealableError:(unint64_t)a3
{
  void *v5;
  void *v6;
  id obj;

  -[KTSelfVerificationHealableErrors _accountHealableErrors](self, "_accountHealableErrors");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  -[KTSelfVerificationHealableErrors _accountHealableErrors](self, "_accountHealableErrors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  objc_sync_exit(obj);
}

- (void)addDeviceHealableError:(unint64_t)a3 deviceId:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  -[KTSelfVerificationHealableErrors _deviceIdToHealableErrors](self, "_deviceIdToHealableErrors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v6);
  -[KTSelfVerificationHealableErrors _deviceIdToHealableErrors](self, "_deviceIdToHealableErrors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[KTSelfVerificationHealableErrors _deviceIdToHealableErrors](self, "_deviceIdToHealableErrors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v8, v11);

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v10);

  objc_sync_exit(v6);
}

- (void)addHealableState:(unint64_t)a3
{
  -[KTSelfVerificationHealableErrors setHealableState:](self, "setHealableState:", -[KTSelfVerificationHealableErrors healableState](self, "healableState") | a3);
}

- (void)removeHealableState:(unint64_t)a3
{
  -[KTSelfVerificationHealableErrors setHealableState:](self, "setHealableState:", -[KTSelfVerificationHealableErrors healableState](self, "healableState") & ~a3);
}

- (unint64_t)healableState
{
  return self->_healableState;
}

- (void)setHealableState:(unint64_t)a3
{
  self->_healableState = a3;
}

- (NSMutableArray)_accountHealableErrors
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)set_accountHealableErrors:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableDictionary)_deviceIdToHealableErrors
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)set_deviceIdToHealableErrors:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__deviceIdToHealableErrors, 0);
  objc_storeStrong((id *)&self->__accountHealableErrors, 0);
}

@end
