@implementation PKCloudStoreError

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5
{
  id v7;
  id v8;
  PKCloudStoreError *v9;

  v7 = a5;
  v8 = a3;
  v9 = -[PKCloudStoreError initWithDomain:code:userInfo:]([PKCloudStoreError alloc], "initWithDomain:code:userInfo:", v8, a4, v7);

  return v9;
}

- (PKCloudStoreError)initWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  PKCloudStoreError *v16;
  objc_super v18;

  v8 = a3;
  v9 = a5;
  if (objc_msgSend((id)objc_opt_class(), "_isCloudKitErrorDomain:", v8))
  {
    objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0CB3388]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "domain");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0C94878]);

      if (v13)
      {
        objc_msgSend(v11, "domain");
        v14 = objc_claimAutoreleasedReturnValue();

        a4 = objc_msgSend(v11, "code");
        objc_msgSend(v11, "userInfo");
        v15 = objc_claimAutoreleasedReturnValue();

        v8 = (id)v14;
        v9 = (id)v15;
      }
    }
    v18.receiver = self;
    v18.super_class = (Class)PKCloudStoreError;
    self = -[PKCloudStoreError initWithDomain:code:userInfo:](&v18, sel_initWithDomain_code_userInfo_, v8, a4, v9);

    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (PKCloudStoreError)initWithError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  PKCloudStoreError *v8;

  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "code");
  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[PKCloudStoreError initWithDomain:code:userInfo:](self, "initWithDomain:code:userInfo:", v5, v6, v7);
  return v8;
}

- (id)errorForPartialErrorWithObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PKCloudStoreError *v7;

  v4 = a3;
  -[PKCloudStoreError _partialErrorsDictionary](self, "_partialErrorsDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = -[PKCloudStoreError initWithError:]([PKCloudStoreError alloc], "initWithError:", v6);
  else
    v7 = 0;

  return v7;
}

- (BOOL)isChangeTokenExpired
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  PKCloudStoreError *v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = -[PKCloudStoreError _code](self, "_code");
  if (-[PKCloudStoreError isPartialError](self, "isPartialError"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[PKCloudStoreError _allPartialErrors](self, "_allPartialErrors", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      while (2)
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = -[PKCloudStoreError initWithError:]([PKCloudStoreError alloc], "initWithError:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8));
          v10 = -[PKCloudStoreError isChangeTokenExpired](v9, "isChangeTokenExpired");

          if (v10)
          {

            return 1;
          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v6)
          continue;
        break;
      }
    }

    return 0;
  }
  return v3 == 21;
}

- (BOOL)isZoneNotFoundError
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  PKCloudStoreError *v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = -[PKCloudStoreError _code](self, "_code");
  if (-[PKCloudStoreError isPartialError](self, "isPartialError"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[PKCloudStoreError _allPartialErrors](self, "_allPartialErrors", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      while (2)
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = -[PKCloudStoreError initWithError:]([PKCloudStoreError alloc], "initWithError:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8));
          v10 = -[PKCloudStoreError isZoneNotFoundError](v9, "isZoneNotFoundError");

          if (v10)
          {

            return 1;
          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v6)
          continue;
        break;
      }
    }

    return 0;
  }
  return v3 == 26;
}

- (BOOL)isPartialError
{
  return -[PKCloudStoreError _code](self, "_code") == 2;
}

- (BOOL)isPartialErrorWithUnkownItems
{
  BOOL v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  PKCloudStoreError *v9;
  _BOOL4 v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (-[PKCloudStoreError isUnknownItemError](self, "isUnknownItemError"))
    return 1;
  if (!-[PKCloudStoreError isPartialError](self, "isPartialError"))
    return 0;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PKCloudStoreError _allPartialErrors](self, "_allPartialErrors", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = -[PKCloudStoreError initWithError:]([PKCloudStoreError alloc], "initWithError:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
        v10 = -[PKCloudStoreError isUnknownItemError](v9, "isUnknownItemError");

        if (!v10)
        {
          v3 = 0;
          goto LABEL_15;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v3 = 1;
LABEL_15:

  return v3;
}

- (BOOL)isUnrecoverableDecryptionError
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  PKCloudStoreError *v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = -[PKCloudStoreError _code](self, "_code");
  if (-[PKCloudStoreError isPartialError](self, "isPartialError"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[PKCloudStoreError _allPartialErrors](self, "_allPartialErrors", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      while (2)
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = -[PKCloudStoreError initWithError:]([PKCloudStoreError alloc], "initWithError:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8));
          v10 = -[PKCloudStoreError isUnrecoverableDecryptionError](v9, "isUnrecoverableDecryptionError");

          if (v10)
          {

            return 1;
          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v6)
          continue;
        break;
      }
    }

    return 0;
  }
  return v3 == 112;
}

- (BOOL)isManateeNotAvailableError
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  PKCloudStoreError *v8;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[PKCloudStoreError isPartialError](self, "isPartialError"))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[PKCloudStoreError _allPartialErrors](self, "_allPartialErrors", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v12;
      while (2)
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v3);
          v8 = -[PKCloudStoreError initWithError:]([PKCloudStoreError alloc], "initWithError:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7));
          v9 = -[PKCloudStoreError isManateeNotAvailableError](v8, "isManateeNotAvailableError");

          if (v9)
          {

            return 1;
          }
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v5)
          continue;
        break;
      }
    }

  }
  return -[PKCloudStoreError _code](self, "_code") == 110;
}

- (BOOL)isNetworkUnavailable
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v3 = (void *)objc_opt_class();
  -[PKCloudStoreError domain](self, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v3, "_isCloudKitErrorDomain:", v4);

  if ((_DWORD)v3)
  {
    if (-[PKCloudStoreError isPartialError](self, "isPartialError"))
    {
      -[PKCloudStoreError _allPartialErrors](self, "_allPartialErrors");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "pk_firstObjectPassingTest:", &__block_literal_global_41);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(self) = v6 != 0;

    }
    else
    {
      v7 = -[PKCloudStoreError _code](self, "_code");
      if (v7 <= 0x17)
        LODWORD(self) = (0x8000D8u >> v7) & 1;
      else
        LOBYTE(self) = 0;
    }
  }
  else
  {
    LOBYTE(self) = 0;
  }
  return (char)self;
}

uint64_t __41__PKCloudStoreError_isNetworkUnavailable__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PKCloudStoreError *v3;
  uint64_t v4;

  v2 = a2;
  v3 = -[PKCloudStoreError initWithError:]([PKCloudStoreError alloc], "initWithError:", v2);

  v4 = -[PKCloudStoreError isNetworkUnavailable](v3, "isNetworkUnavailable");
  return v4;
}

- (BOOL)isAccountUnavailable
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = (void *)objc_opt_class();
  -[PKCloudStoreError domain](self, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v3, "_isCloudKitErrorDomain:", v4);

  if (!(_DWORD)v3)
    return 0;
  if (!-[PKCloudStoreError isPartialError](self, "isPartialError"))
    return -[PKCloudStoreError _code](self, "_code") == 36;
  -[PKCloudStoreError _allPartialErrors](self, "_allPartialErrors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pk_firstObjectPassingTest:", &__block_literal_global_8_0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  return v7;
}

uint64_t __41__PKCloudStoreError_isAccountUnavailable__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PKCloudStoreError *v3;
  uint64_t v4;

  v2 = a2;
  v3 = -[PKCloudStoreError initWithError:]([PKCloudStoreError alloc], "initWithError:", v2);

  v4 = -[PKCloudStoreError isAccountUnavailable](v3, "isAccountUnavailable");
  return v4;
}

- (BOOL)isKeychainSyncingInProgress
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  PKCloudStoreError *v8;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!-[PKCloudStoreError isPartialError](self, "isPartialError"))
    return -[PKCloudStoreError _code](self, "_code") == 111;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[PKCloudStoreError _allPartialErrors](self, "_allPartialErrors", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = -[PKCloudStoreError initWithError:]([PKCloudStoreError alloc], "initWithError:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7));
        v9 = -[PKCloudStoreError isKeychainSyncingInProgress](v8, "isKeychainSyncingInProgress");

        if (v9)
        {

          return 1;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }

  return 0;
}

- (BOOL)isPCSError
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  PKCloudStoreError *v8;
  BOOL v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (-[PKCloudStoreError isPartialError](self, "isPartialError"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[PKCloudStoreError _allPartialErrors](self, "_allPartialErrors", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v15 != v6)
            objc_enumerationMutation(v3);
          v8 = -[PKCloudStoreError initWithError:]([PKCloudStoreError alloc], "initWithError:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
          v9 = -[PKCloudStoreError isPCSError](v8, "isPCSError");

          if (v9)
          {

            return 1;
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v5)
          continue;
        break;
      }
    }

    return 0;
  }
  -[PKCloudStoreError domain](self, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0C94878]);

  if (!v11)
    return 0;
  v12 = -[PKCloudStoreError code](self, "code");
  if ((unint64_t)(v12 - 5000) <= 0xA)
    return (0x4BFu >> (v12 + 120)) & 1;
  else
    return 0;
}

- (BOOL)isInitializationTimeOutError
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  if (-[PKCloudStoreError _code](self, "_code") != 20)
    return 0;
  -[PKCloudStoreError userInfo](self, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CB3388]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("PKPassKitErrorDomain")))
    v6 = objc_msgSend(v4, "code") == -4007;
  else
    v6 = 0;

  return v6;
}

- (BOOL)isUnknownItemError
{
  return -[PKCloudStoreError _code](self, "_code") == 11;
}

- (BOOL)isParticipantMayNeedVerificationError
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  PKCloudStoreError *v8;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!-[PKCloudStoreError isPartialError](self, "isPartialError"))
    return -[PKCloudStoreError _code](self, "_code") == 33;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[PKCloudStoreError _allPartialErrors](self, "_allPartialErrors", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = -[PKCloudStoreError initWithError:]([PKCloudStoreError alloc], "initWithError:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7));
        v9 = -[PKCloudStoreError isParticipantMayNeedVerificationError](v8, "isParticipantMayNeedVerificationError");

        if (v9)
        {

          return 1;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }

  return 0;
}

- (BOOL)isConflictDetected
{
  int64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  int v9;

  v3 = -[PKCloudStoreError _code](self, "_code");
  -[PKCloudStoreError domain](self, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x1E0C94878];
  v6 = v4;
  v7 = v5;
  v8 = v7;
  if (v6 == v7)
  {
    v9 = 1;
  }
  else
  {
    v9 = 0;
    if (v6 && v7)
      v9 = objc_msgSend(v6, "isEqualToString:", v7);
  }

  if (v9 && v3 == 2004)
    return 1;
  return v3 == 14 || v3 == 11;
}

- (BOOL)isAuthenticationOrQuotaError
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = (void *)objc_opt_class();
  -[PKCloudStoreError domain](self, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v3, "_isCloudKitErrorDomain:", v4);

  if (!(_DWORD)v3)
    return 0;
  if (!-[PKCloudStoreError isPartialError](self, "isPartialError"))
    return (-[PKCloudStoreError _code](self, "_code") & 0xFFFFFFFFFFFFFFEFLL) == 9;
  -[PKCloudStoreError _allPartialErrors](self, "_allPartialErrors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pk_firstObjectPassingTest:", &__block_literal_global_9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  return v7;
}

uint64_t __49__PKCloudStoreError_isAuthenticationOrQuotaError__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PKCloudStoreError *v3;
  uint64_t v4;

  v2 = a2;
  v3 = -[PKCloudStoreError initWithError:]([PKCloudStoreError alloc], "initWithError:", v2);

  v4 = -[PKCloudStoreError isAuthenticationOrQuotaError](v3, "isAuthenticationOrQuotaError");
  return v4;
}

- (id)allZoneIDs
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[PKCloudStoreError _objectsOfClassTypeFromPartialErrors:](self, "_objectsOfClassTypeFromPartialErrors:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v4);

  -[PKCloudStoreError _objectsOfClassTypeFromPartialErrors:](self, "_objectsOfClassTypeFromPartialErrors:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", CFSTR("zoneID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v7);

  v8 = (void *)objc_msgSend(v3, "copy");
  return v8;
}

- (id)_objectsOfClassTypeFromPartialErrors:(Class)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  Class v15;

  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[PKCloudStoreError _partialErrorsDictionary](self, "_partialErrorsDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __58__PKCloudStoreError__objectsOfClassTypeFromPartialErrors___block_invoke;
  v13 = &unk_1E2AC6428;
  v14 = v5;
  v15 = a3;
  v7 = v5;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", &v10);
  v8 = (void *)objc_msgSend(v7, "copy", v10, v11, v12, v13);

  return v8;
}

void __58__PKCloudStoreError__objectsOfClassTypeFromPartialErrors___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (int64_t)_code
{
  int64_t v3;
  void *v4;
  int v5;
  int64_t result;

  v3 = -[PKCloudStoreError code](self, "code");
  -[PKCloudStoreError domain](self, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C94878]);

  result = v3;
  if (v5)
    JUMPOUT(0x19400C070);
  return result;
}

- (id)_partialErrorsDictionary
{
  void *v2;
  void *v3;

  -[PKCloudStoreError userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0C94940]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_allPartialErrors
{
  void *v2;
  void *v3;

  -[PKCloudStoreError _partialErrorsDictionary](self, "_partialErrorsDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)_isCloudKitErrorDomain:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C947D8]) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C94878]);

  return v4;
}

@end
