@implementation KTSelfVerificationInfo

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
  id v12;

  v12 = a3;
  -[KTSelfVerificationInfo uriToServerLoggableDatas](self, "uriToServerLoggableDatas");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v4, CFSTR("uriToServerLoggableDatas"));

  -[KTSelfVerificationInfo syncedLoggableDatas](self, "syncedLoggableDatas");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v5, CFSTR("syncedLoggableDatas"));

  -[KTSelfVerificationInfo selfDeviceID](self, "selfDeviceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[KTSelfVerificationInfo selfDeviceID](self, "selfDeviceID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "encodeObject:forKey:", v7, CFSTR("selfDeviceID"));

  }
  -[KTSelfVerificationInfo failure](self, "failure");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x24BDE84F8];
    -[KTSelfVerificationInfo failure](self, "failure");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cleanseErrorForXPC:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "encodeObject:forKey:", v11, CFSTR("failure"));

  }
}

- (KTSelfVerificationInfo)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  KTSelfVerificationInfo *v20;
  KTSelfVerificationInfo *v21;

  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v8, CFSTR("uriToServerLoggableDatas"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDBCF20];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v12, CFSTR("syncedLoggableDatas"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE84F8], "safeErrorClasses");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setByAddingObjectsFromSet:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v16, CFSTR("failure"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v18, CFSTR("selfDeviceID"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = -[KTSelfVerificationInfo initWithSyncedLoggableDatas:uriToServerLoggableDatas:]([KTSelfVerificationInfo alloc], "initWithSyncedLoggableDatas:uriToServerLoggableDatas:", v13, v9);
  v21 = v20;
  if (v20)
  {
    -[KTSelfVerificationInfo setFailure:](v20, "setFailure:", v17);
    -[KTSelfVerificationInfo setSelfDeviceID:](v21, "setSelfDeviceID:", v19);
  }

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    -[KTSelfVerificationInfo uriToServerLoggableDatas](self, "uriToServerLoggableDatas");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 || (objc_msgSend(v6, "uriToServerLoggableDatas"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[KTSelfVerificationInfo uriToServerLoggableDatas](self, "uriToServerLoggableDatas");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "uriToServerLoggableDatas");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

      if (v7)
      {

        if (!v10)
          goto LABEL_24;
      }
      else
      {

        if ((v10 & 1) == 0)
          goto LABEL_24;
      }
    }
    -[KTSelfVerificationInfo selfDeviceID](self, "selfDeviceID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 || (objc_msgSend(v6, "selfDeviceID"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[KTSelfVerificationInfo selfDeviceID](self, "selfDeviceID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "selfDeviceID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqual:", v14);

      if (v12)
      {

        if (!v15)
          goto LABEL_24;
      }
      else
      {

        if ((v15 & 1) == 0)
          goto LABEL_24;
      }
    }
    -[KTSelfVerificationInfo syncedLoggableDatas](self, "syncedLoggableDatas");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      objc_msgSend(v6, "syncedLoggableDatas");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3)
      {
LABEL_19:
        -[KTSelfVerificationInfo failure](self, "failure");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20 || (objc_msgSend(v6, "failure"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          v21 = (void *)MEMORY[0x24BDE84F8];
          -[KTSelfVerificationInfo failure](self, "failure");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "cleanseErrorForXPC:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)MEMORY[0x24BDE84F8];
          objc_msgSend(v6, "failure");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "cleanseErrorForXPC:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v23, "isEqual:", v26) ^ 1;

          if (v20)
          {
LABEL_29:

            v11 = v27 ^ 1;
            goto LABEL_25;
          }
        }
        else
        {
          LOBYTE(v27) = 0;
        }

        goto LABEL_29;
      }
    }
    -[KTSelfVerificationInfo syncedLoggableDatas](self, "syncedLoggableDatas");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "syncedLoggableDatas");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "isEqual:", v18);

    if (v16)
    {

      if (v19)
        goto LABEL_19;
    }
    else
    {

      if ((v19 & 1) != 0)
        goto LABEL_19;
    }
LABEL_24:
    v11 = 0;
LABEL_25:

    goto LABEL_26;
  }
  v11 = 0;
LABEL_26:

  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("KTSelfVerificationInfo: "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[KTSelfVerificationInfo uriToServerLoggableDatas](self, "uriToServerLoggableDatas");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v24;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "appendFormat:", CFSTR("%@, "), *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "appendFormat:", CFSTR("\n"));
  -[KTSelfVerificationInfo syncedLoggableDatas](self, "syncedLoggableDatas");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("syncedDatas: [\n"));
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[KTSelfVerificationInfo syncedLoggableDatas](self, "syncedLoggableDatas");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v14), "shortDescription");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("%@,\n"), v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v12);
    }

    objc_msgSend(v3, "appendFormat:", CFSTR("]\n"));
  }
  -[KTSelfVerificationInfo failure](self, "failure");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[KTSelfVerificationInfo failure](self, "failure");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("error=%@\n"), v17);

  }
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
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[KTSelfVerificationInfo uriToServerLoggableDatas](self, "uriToServerLoggableDatas");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("uris"));

  -[KTSelfVerificationInfo syncedLoggableDatas](self, "syncedLoggableDatas");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = (void *)MEMORY[0x24BDBCEB8];
    -[KTSelfVerificationInfo syncedLoggableDatas](self, "syncedLoggableDatas");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayWithCapacity:", objc_msgSend(v9, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[KTSelfVerificationInfo syncedLoggableDatas](self, "syncedLoggableDatas", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v15), "diagnosticsJsonDictionary");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v16);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v13);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("syncedLoggableDatas"));
  }
  -[KTSelfVerificationInfo failure](self, "failure");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[TransparencyError diagnosticError:](TransparencyError, "diagnosticError:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("error"));

  return (NSDictionary *)v3;
}

- (KTSelfVerificationInfo)initWithSyncedLoggableDatas:(id)a3 uriToServerLoggableDatas:(id)a4
{
  id v6;
  id v7;
  KTSelfVerificationInfo *v8;
  KTSelfVerificationInfo *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)KTSelfVerificationInfo;
  v8 = -[KTSelfVerificationInfo init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[KTSelfVerificationInfo setSyncedLoggableDatas:](v8, "setSyncedLoggableDatas:", v6);
    -[KTSelfVerificationInfo setUriToServerLoggableDatas:](v9, "setUriToServerLoggableDatas:", v7);
  }

  return v9;
}

- (void)updateUri:(id)a3 serverLoggableDatas:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[KTSelfVerificationInfo uriToServerLoggableDatas](self, "uriToServerLoggableDatas");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "updateServerLoggableDatas:", v6);
}

- (NSDictionary)uriToServerLoggableDatas
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUriToServerLoggableDatas:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSArray)syncedLoggableDatas
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSyncedLoggableDatas:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSData)selfDeviceID
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSelfDeviceID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSError)failure
{
  return (NSError *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFailure:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failure, 0);
  objc_storeStrong((id *)&self->_selfDeviceID, 0);
  objc_storeStrong((id *)&self->_syncedLoggableDatas, 0);
  objc_storeStrong((id *)&self->_uriToServerLoggableDatas, 0);
}

@end
