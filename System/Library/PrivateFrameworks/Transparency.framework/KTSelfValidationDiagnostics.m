@implementation KTSelfValidationDiagnostics

+ (id)jsonClasses
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, objc_opt_class(), 0);
}

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
  id v10;

  v10 = a3;
  -[KTSelfValidationDiagnostics rawAccountKey](self, "rawAccountKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[KTSelfValidationDiagnostics rawAccountKey](self, "rawAccountKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "encodeObject:forKey:", v5, CFSTR("rawAccountKey"));

  }
  -[KTSelfValidationDiagnostics accountKey](self, "accountKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[KTSelfValidationDiagnostics accountKey](self, "accountKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("accountKey"));

  }
  -[KTSelfValidationDiagnostics ktSelfVerificationInfoDiagnosticsJson](self, "ktSelfVerificationInfoDiagnosticsJson");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v8, CFSTR("KTSelfVerificationInfo"));

  -[KTSelfValidationDiagnostics uriToDiagnostics](self, "uriToDiagnostics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("uriData"));

}

- (KTSelfValidationDiagnostics)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  KTSelfValidationDiagnostics *v13;
  KTSelfValidationDiagnostics *v14;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rawAccountKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[KTSelfValidationDiagnostics jsonClasses](KTSelfValidationDiagnostics, "jsonClasses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("KTSelfVerificationInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDBCEF0];
  +[KTSelfValidationDiagnostics jsonClasses](KTSelfValidationDiagnostics, "jsonClasses");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithSet:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addObject:", objc_opt_class());
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("uriData"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  if (v12 && v8)
  {
    v14 = objc_alloc_init(KTSelfValidationDiagnostics);
    v13 = v14;
    if (v5)
      -[KTSelfValidationDiagnostics setRawAccountKey:](v14, "setRawAccountKey:", v5);
    if (v6)
      -[KTSelfValidationDiagnostics setAccountKey:](v13, "setAccountKey:", v6);
    -[KTSelfValidationDiagnostics setUriToDiagnostics:](v13, "setUriToDiagnostics:", v12);
    -[KTSelfValidationDiagnostics setKtSelfVerificationInfoDiagnosticsJson:](v13, "setKtSelfVerificationInfoDiagnosticsJson:", v8);
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  KTSelfValidationDiagnostics *v6;
  KTSelfValidationDiagnostics *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;

  v6 = (KTSelfValidationDiagnostics *)a3;
  if (self == v6)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      -[KTSelfValidationDiagnostics rawAccountKey](self, "rawAccountKey");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[KTSelfValidationDiagnostics rawAccountKey](self, "rawAccountKey");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[KTSelfValidationDiagnostics rawAccountKey](v7, "rawAccountKey");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v3, "isEqual:", v4) & 1) == 0)
          goto LABEL_13;
      }
      -[KTSelfValidationDiagnostics rawAccountKey](self, "rawAccountKey");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {

        if (v8)
        {

        }
      }
      else
      {
        -[KTSelfValidationDiagnostics rawAccountKey](v7, "rawAccountKey");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {

          if (v11)
            goto LABEL_27;
        }
        else if (v11)
        {
          goto LABEL_27;
        }
      }
      -[KTSelfValidationDiagnostics accountKey](self, "accountKey");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[KTSelfValidationDiagnostics accountKey](self, "accountKey");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[KTSelfValidationDiagnostics accountKey](v7, "accountKey");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v3, "isEqual:", v4) & 1) == 0)
        {
LABEL_13:

          v9 = 0;
LABEL_25:

LABEL_28:
          goto LABEL_29;
        }
      }
      -[KTSelfValidationDiagnostics accountKey](self, "accountKey");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {

        if (v8)
        {

        }
      }
      else
      {
        -[KTSelfValidationDiagnostics accountKey](v7, "accountKey");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {

        }
        if (v13)
          goto LABEL_27;
      }
      -[KTSelfValidationDiagnostics ktSelfVerificationInfoDiagnosticsJson](self, "ktSelfVerificationInfoDiagnosticsJson");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[KTSelfValidationDiagnostics ktSelfVerificationInfoDiagnosticsJson](v7, "ktSelfVerificationInfoDiagnosticsJson");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "isEqual:", v15);

      if (v16)
      {
        -[KTSelfValidationDiagnostics uriToDiagnostics](self, "uriToDiagnostics");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[KTSelfValidationDiagnostics uriToDiagnostics](v7, "uriToDiagnostics");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqual:", v3);
        goto LABEL_25;
      }
LABEL_27:
      v9 = 0;
      goto LABEL_28;
    }
    v9 = 0;
  }
LABEL_29:

  return v9;
}

- (NSDictionary)diagnosticsJsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCED8];
  -[KTSelfValidationDiagnostics uriToDiagnostics](self, "uriToDiagnostics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[KTSelfValidationDiagnostics uriToDiagnostics](self, "uriToDiagnostics", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v10);
        -[KTSelfValidationDiagnostics uriToDiagnostics](self, "uriToDiagnostics");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "diagnosticsJsonDictionary");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[KTSelfValidationDiagnostics accountKey](self, "accountKey");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[KTSelfValidationDiagnostics accountKey](self, "accountKey");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, CFSTR("accountKey"));

  }
  -[KTSelfValidationDiagnostics rawAccountKey](self, "rawAccountKey");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[KTSelfValidationDiagnostics rawAccountKey](self, "rawAccountKey");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v19, CFSTR("rawAccountKey"));

  }
  -[KTSelfValidationDiagnostics ktSelfVerificationInfoDiagnosticsJson](self, "ktSelfVerificationInfoDiagnosticsJson");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[KTSelfValidationDiagnostics ktSelfVerificationInfoDiagnosticsJson](self, "ktSelfVerificationInfoDiagnosticsJson");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v21, CFSTR("KTSelfVerificationInfo"));

  }
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v5, CFSTR("uriData"));
  if (objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v15))
    v22 = v15;
  else
    v22 = 0;

  return (NSDictionary *)v22;
}

- (id)description
{
  void *v2;
  void *v3;

  -[KTSelfValidationDiagnostics diagnosticsJsonDictionary](self, "diagnosticsJsonDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)rawAccountKey
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRawAccountKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)accountKey
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAccountKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSDictionary)uriToDiagnostics
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUriToDiagnostics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSDictionary)ktSelfVerificationInfoDiagnosticsJson
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setKtSelfVerificationInfoDiagnosticsJson:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ktSelfVerificationInfoDiagnosticsJson, 0);
  objc_storeStrong((id *)&self->_uriToDiagnostics, 0);
  objc_storeStrong((id *)&self->_accountKey, 0);
  objc_storeStrong((id *)&self->_rawAccountKey, 0);
}

@end
