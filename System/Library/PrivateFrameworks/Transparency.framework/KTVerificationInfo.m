@implementation KTVerificationInfo

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
  -[KTVerificationInfo accountKey](self, "accountKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v4, CFSTR("accountKey"));

  -[KTVerificationInfo serverLoggableDatas](self, "serverLoggableDatas");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v5, CFSTR("serverLoggableDatas"));

  -[KTVerificationInfo failure](self, "failure");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x24BDE84F8];
    -[KTVerificationInfo failure](self, "failure");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cleanseErrorForXPC:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "encodeObject:forKey:", v9, CFSTR("failure"));

  }
  -[KTVerificationInfo idsResponseTime](self, "idsResponseTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[KTVerificationInfo idsResponseTime](self, "idsResponseTime");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "encodeObject:forKey:", v11, CFSTR("idsResponseTime"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[KTVerificationInfo optedIn](self, "optedIn"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v12, CFSTR("optedIn"));

}

- (KTVerificationInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  KTVerificationInfo *v16;
  KTVerificationInfo *v17;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("serverLoggableDatas"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE84F8], "safeErrorClasses");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setByAddingObjectsFromSet:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("failure"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("idsResponseTime"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("optedIn"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[KTVerificationInfo initWithAccountKey:serverLoggableDatas:]([KTVerificationInfo alloc], "initWithAccountKey:serverLoggableDatas:", v5, v9);
  v17 = v16;
  if (v16)
  {
    -[KTVerificationInfo setFailure:](v16, "setFailure:", v13);
    -[KTVerificationInfo setIdsResponseTime:](v17, "setIdsResponseTime:", v14);
    -[KTVerificationInfo setOptedIn:](v17, "setOptedIn:", objc_msgSend(v15, "unsignedIntegerValue"));
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  KTVerificationInfo *v4;
  KTVerificationInfo *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  unint64_t v35;

  v4 = (KTVerificationInfo *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[KTVerificationInfo accountKey](self, "accountKey");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[KTVerificationInfo accountKey](v5, "accountKey");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v7)
      {

      }
      else
      {
        v8 = (void *)v7;
        -[KTVerificationInfo accountKey](self, "accountKey");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[KTVerificationInfo accountKey](v5, "accountKey");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

        if (!v11)
          goto LABEL_23;
      }
      -[KTVerificationInfo serverLoggableDatas](self, "serverLoggableDatas");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[KTVerificationInfo serverLoggableDatas](v5, "serverLoggableDatas");
      v14 = objc_claimAutoreleasedReturnValue();
      if (v13 == (void *)v14)
      {

      }
      else
      {
        v15 = (void *)v14;
        -[KTVerificationInfo serverLoggableDatas](self, "serverLoggableDatas");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[KTVerificationInfo serverLoggableDatas](v5, "serverLoggableDatas");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "isEqual:", v17);

        if (!v18)
          goto LABEL_23;
      }
      -[KTVerificationInfo failure](self, "failure");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[KTVerificationInfo failure](v5, "failure");
      v20 = objc_claimAutoreleasedReturnValue();
      if (v19 == (void *)v20)
      {

      }
      else
      {
        v21 = (void *)v20;
        v22 = (void *)MEMORY[0x24BDE84F8];
        -[KTVerificationInfo failure](self, "failure");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "cleanseErrorForXPC:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)MEMORY[0x24BDE84F8];
        -[KTVerificationInfo failure](v5, "failure");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "cleanseErrorForXPC:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v24, "isEqual:", v27);

        if (!v28)
          goto LABEL_23;
      }
      -[KTVerificationInfo idsResponseTime](self, "idsResponseTime");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[KTVerificationInfo idsResponseTime](v5, "idsResponseTime");
      v30 = objc_claimAutoreleasedReturnValue();
      if (v29 == (void *)v30)
      {

      }
      else
      {
        v31 = (void *)v30;
        -[KTVerificationInfo idsResponseTime](self, "idsResponseTime");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[KTVerificationInfo idsResponseTime](v5, "idsResponseTime");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v32, "isEqual:", v33);

        if (!v34)
          goto LABEL_23;
      }
      v35 = -[KTVerificationInfo optedIn](self, "optedIn");
      if (v35 == -[KTVerificationInfo optedIn](v5, "optedIn"))
      {
        v12 = 1;
LABEL_24:

        goto LABEL_25;
      }
LABEL_23:
      v12 = 0;
      goto LABEL_24;
    }
    v12 = 0;
  }
LABEL_25:

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("KTVerificationInfo: "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[KTVerificationInfo accountKey](self, "accountKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[KTVerificationInfo accountKey](self, "accountKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "kt_hexString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("account key=%@\n"), v6);

  }
  -[KTVerificationInfo idsResponseTime](self, "idsResponseTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[KTVerificationInfo idsResponseTime](self, "idsResponseTime");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[KTVerificationInfo idsResponseTime](self, "idsResponseTime");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "kt_toISO_8601_UTCString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("ids response time=%@ (%@)\n"), v8, v10);

  }
  -[KTVerificationInfo serverLoggableDatas](self, "serverLoggableDatas");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("[\n"));
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[KTVerificationInfo serverLoggableDatas](self, "serverLoggableDatas");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v22;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v16), "shortDescription");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("%@,\n"), v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v14);
    }

    objc_msgSend(v3, "appendFormat:", CFSTR("]\n"));
  }
  -[KTVerificationInfo failure](self, "failure");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[KTVerificationInfo failure](self, "failure");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("error=%@\n"), v19);

  }
  objc_msgSend(v3, "appendFormat:", CFSTR("opted in=%lu\n"), -[KTVerificationInfo optedIn](self, "optedIn"));
  return v3;
}

- (NSDictionary)diagnosticsJsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[KTVerificationInfo accountKey](self, "accountKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "kt_hexString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("accountKey"));

  -[KTVerificationInfo serverLoggableDatas](self, "serverLoggableDatas");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = (void *)MEMORY[0x24BDBCEB8];
    -[KTVerificationInfo serverLoggableDatas](self, "serverLoggableDatas");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayWithCapacity:", objc_msgSend(v9, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[KTVerificationInfo serverLoggableDatas](self, "serverLoggableDatas", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v27;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v27 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v15), "diagnosticsJsonDictionary");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v16);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v13);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("serverLoggableDatas"));
  }
  -[KTVerificationInfo failure](self, "failure");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[TransparencyError diagnosticError:](TransparencyError, "diagnosticError:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("error"));

  -[KTVerificationInfo idsResponseTime](self, "idsResponseTime");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[KTVerificationInfo idsResponseTime](self, "idsResponseTime");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "kt_dateToString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("idsResponseTime"));

    -[KTVerificationInfo idsResponseTime](self, "idsResponseTime");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "kt_toISO_8601_UTCString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("idsResponseTimeReadable"));

  }
  KTOptInGetString(-[KTVerificationInfo optedIn](self, "optedIn"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("optedIn"));

  return (NSDictionary *)v3;
}

- (KTVerificationInfo)initWithAccountKey:(id)a3
{
  return -[KTVerificationInfo initWithAccountKey:serverLoggableDatas:](self, "initWithAccountKey:serverLoggableDatas:", a3, 0);
}

- (KTVerificationInfo)initWithAccountKey:(id)a3 serverLoggableDatas:(id)a4
{
  id v6;
  id v7;
  KTVerificationInfo *v8;
  KTVerificationInfo *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)KTVerificationInfo;
  v8 = -[KTVerificationInfo init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[KTVerificationInfo setAccountKey:](v8, "setAccountKey:", v6);
    -[KTVerificationInfo setServerLoggableDatas:](v9, "setServerLoggableDatas:", v7);
    -[KTVerificationInfo setOptedIn:](v9, "setOptedIn:", 2);
  }

  return v9;
}

- (NSData)accountKey
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAccountKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSArray)serverLoggableDatas
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setServerLoggableDatas:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSError)failure
{
  return (NSError *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFailure:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSDate)idsResponseTime
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setIdsResponseTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (unint64_t)optedIn
{
  return self->_optedIn;
}

- (void)setOptedIn:(unint64_t)a3
{
  self->_optedIn = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsResponseTime, 0);
  objc_storeStrong((id *)&self->_failure, 0);
  objc_storeStrong((id *)&self->_serverLoggableDatas, 0);
  objc_storeStrong((id *)&self->_accountKey, 0);
}

@end
