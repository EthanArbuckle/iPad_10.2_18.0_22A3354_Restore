@implementation OTInheritanceKey

- (BOOL)generateWrappingWithError:(id *)a3
{
  void *v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t))ccrng();
  v7 = ccrng();
  v8 = objc_msgSend(v5, "length");
  v9 = objc_retainAutorelease(v5);
  v6(v7, v8, objc_msgSend(v9, "mutableBytes"));
  LOBYTE(a3) = -[OTInheritanceKey wrapWithWrappingKey:error:](self, "wrapWithWrappingKey:error:", v9, a3);

  return (char)a3;
}

- (BOOL)wrapWithWrappingKey:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  NSString *v22;
  NSString *wrappingKeyString;
  NSString *v24;
  NSString *wrappedKeyString;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[NSData length](self->_recoveryKeyData, "length");
  v7 = ccwrap_wrapped_size();
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v7, v7, v27);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)ccaes_ecb_encrypt_mode() + 15;
  v10 = v9 & 0xFFFFFFFFFFFFFFF0;
  if (v9 >= 0x10)
  {
    v11 = (uint64_t *)((char *)&v26 - (v9 & 0xFFFFFFFFFFFFFFF0));
    do
    {
      *v11 = 0xAAAAAAAAAAAAAAAALL;
      v11[1] = 0xAAAAAAAAAAAAAAAALL;
      v11 += 2;
      v10 -= 16;
    }
    while (v10);
  }
  objc_msgSend(v6, "length");
  v12 = objc_retainAutorelease(v6);
  objc_msgSend(v12, "bytes");
  v13 = ccecb_init();
  if ((_DWORD)v13)
  {
    if (a4)
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ccecb_init failed: %d"), v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v14;
      v17 = 9;
LABEL_10:
      objc_msgSend(v16, "errorWithDomain:code:description:", CFSTR("com.apple.security.OctagonTrust.OTInheritanceKey"), v17, v15);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_11:
      LOBYTE(a4) = 0;
    }
  }
  else
  {
    -[NSData length](self->_recoveryKeyData, "length");
    -[NSData bytes](self->_recoveryKeyData, "bytes");
    v18 = objc_retainAutorelease(v8);
    objc_msgSend(v18, "mutableBytes");
    v19 = ccwrap_auth_encrypt();
    cc_clear();
    if (!(_DWORD)v19)
    {
      objc_storeStrong((id *)&self->_wrappingKeyData, v12);
      +[OTInheritanceKey printableWithData:checksumSize:error:](OTInheritanceKey, "printableWithData:checksumSize:error:", self->_wrappingKeyData, 3, a4);
      v22 = (NSString *)objc_claimAutoreleasedReturnValue();
      wrappingKeyString = self->_wrappingKeyString;
      self->_wrappingKeyString = v22;

      if (self->_wrappingKeyString)
      {
        objc_storeStrong((id *)&self->_wrappedKeyData, v18);
        +[OTInheritanceKey printableWithData:checksumSize:error:](OTInheritanceKey, "printableWithData:checksumSize:error:", self->_wrappedKeyData, 3, a4);
        v24 = (NSString *)objc_claimAutoreleasedReturnValue();
        wrappedKeyString = self->_wrappedKeyString;
        self->_wrappedKeyString = v24;

        LOBYTE(a4) = self->_wrappedKeyString != 0;
        goto LABEL_12;
      }
      goto LABEL_11;
    }
    if (a4)
    {
      v20 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ccwrap_auth_encrypt: %d"), v19);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v20;
      v17 = 4;
      goto LABEL_10;
    }
  }
LABEL_12:

  return (char)a4;
}

- (OTInheritanceKey)initWithUUID:(id)a3 error:(id *)a4
{
  id v7;
  OTInheritanceKey *v8;
  OTInheritanceKey *v9;
  const __SecRandom *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSData *claimTokenData;
  uint64_t v17;
  NSString *claimTokenString;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSData *recoveryKeyData;
  OTInheritanceKey *v26;
  objc_super v28;
  _OWORD __s[4];
  _QWORD bytes[3];

  bytes[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v28.receiver = self;
  v28.super_class = (Class)OTInheritanceKey;
  v8 = -[OTInheritanceKey init](&v28, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_uuid, a3);
    bytes[0] = 0xAAAAAAAAAAAAAAAALL;
    bytes[1] = 0xAAAAAAAAAAAAAAAALL;
    v10 = (const __SecRandom *)*MEMORY[0x1E0CD7000];
    v11 = SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E0CD7000], 0x10uLL, bytes);
    if ((_DWORD)v11)
    {
      v12 = v11;
      memset_s(bytes, 0x10uLL, 0, 0x10uLL);
      if (a4)
      {
        v13 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SecRandomCopyBytes: %d"), v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "errorWithDomain:code:description:", CFSTR("com.apple.security.OctagonTrust.OTInheritanceKey"), 7, v14);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", bytes, 16);
    v15 = objc_claimAutoreleasedReturnValue();
    claimTokenData = v9->_claimTokenData;
    v9->_claimTokenData = (NSData *)v15;

    memset_s(bytes, 0x10uLL, 0, 0x10uLL);
    +[OTInheritanceKey printableWithData:checksumSize:error:](OTInheritanceKey, "printableWithData:checksumSize:error:", v9->_claimTokenData, 4, a4);
    v17 = objc_claimAutoreleasedReturnValue();
    claimTokenString = v9->_claimTokenString;
    v9->_claimTokenString = (NSString *)v17;

    if (!v9->_claimTokenString)
      goto LABEL_11;
    *(_QWORD *)&v19 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
    __s[2] = v19;
    __s[3] = v19;
    __s[0] = v19;
    __s[1] = v19;
    v20 = SecRandomCopyBytes(v10, 0x40uLL, __s);
    if ((_DWORD)v20)
    {
      v21 = v20;
      memset_s(__s, 0x40uLL, 0, 0x40uLL);
      if (a4)
      {
        v22 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SecRandomCopyBytes: %d"), v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "errorWithDomain:code:description:", CFSTR("com.apple.security.OctagonTrust.OTInheritanceKey"), 7, v23);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", __s, 64);
    v24 = objc_claimAutoreleasedReturnValue();
    recoveryKeyData = v9->_recoveryKeyData;
    v9->_recoveryKeyData = (NSData *)v24;

    memset_s(__s, 0x40uLL, 0, 0x40uLL);
    if (!-[OTInheritanceKey generateWrappingWithError:](v9, "generateWrappingWithError:", a4))
    {
LABEL_11:
      v26 = 0;
      goto LABEL_12;
    }
  }
  v26 = v9;
LABEL_12:

  return v26;
}

- (BOOL)unwrapWithError:(id *)a3
{
  uint64_t v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  void *recoveryKeyData;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  BOOL v20;
  id v21;
  uint64_t v22;
  void *v23;
  NSData *v24;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  if (-[NSData length](self->_wrappingKeyData, "length") == 32)
  {
    if (-[NSData length](self->_wrappedKeyData, "length") == 72)
    {
      -[NSData length](self->_wrappedKeyData, "length");
      v5 = ccwrap_unwrapped_size();
      objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v5, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)ccaes_ecb_decrypt_mode() + 15;
      v8 = v7 & 0xFFFFFFFFFFFFFFF0;
      if (v7 >= 0x10)
      {
        v9 = (_QWORD *)((char *)v26 - (v7 & 0xFFFFFFFFFFFFFFF0));
        do
        {
          *v9 = 0xAAAAAAAAAAAAAAAALL;
          v9[1] = 0xAAAAAAAAAAAAAAAALL;
          v9 += 2;
          v8 -= 16;
        }
        while (v8);
      }
      -[NSData length](self->_wrappingKeyData, "length");
      -[NSData bytes](self->_wrappingKeyData, "bytes");
      v10 = ccecb_init();
      if ((_DWORD)v10)
      {
        if (a3)
        {
          v11 = (void *)MEMORY[0x1E0CB35C8];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ccecb_init failed: %d"), v10);
          recoveryKeyData = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v11;
          v14 = 9;
LABEL_18:
          objc_msgSend(v13, "errorWithDomain:code:description:", CFSTR("com.apple.security.OctagonTrust.OTInheritanceKey"), v14, recoveryKeyData);
          v20 = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:

          goto LABEL_22;
        }
      }
      else
      {
        -[NSData length](self->_wrappedKeyData, "length");
        -[NSData bytes](self->_wrappedKeyData, "bytes");
        v21 = objc_retainAutorelease(v6);
        objc_msgSend(v21, "mutableBytes");
        v22 = ccwrap_auth_decrypt();
        cc_clear();
        if (!(_DWORD)v22)
        {
          v24 = (NSData *)v21;
          recoveryKeyData = self->_recoveryKeyData;
          self->_recoveryKeyData = v24;
          v20 = 1;
          goto LABEL_21;
        }
        if (a3)
        {
          v23 = (void *)MEMORY[0x1E0CB35C8];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ccwrap_auth_decrypt: %d"), v22);
          recoveryKeyData = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v23;
          v14 = 5;
          goto LABEL_18;
        }
      }
      v20 = 0;
LABEL_22:

      return v20;
    }
    if (a3)
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("wrong wrapped key length: %u"), -[NSData length](self->_wrappedKeyData, "length"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v19;
      v18 = 10;
      goto LABEL_13;
    }
  }
  else if (a3)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("wrong wrapping key length: %u"), -[NSData length](self->_wrappingKeyData, "length"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v15;
    v18 = 8;
LABEL_13:
    objc_msgSend(v17, "errorWithDomain:code:description:", CFSTR("com.apple.security.OctagonTrust.OTInheritanceKey"), v18, v16);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

- (OTInheritanceKey)initWithWrappedKeyData:(id)a3 wrappingKeyData:(id)a4 claimTokenData:(id)a5 uuid:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  OTInheritanceKey *v17;
  OTInheritanceKey *v18;
  uint64_t v19;
  NSString *wrappingKeyString;
  uint64_t v21;
  NSString *wrappedKeyString;
  uint64_t v23;
  NSString *v24;
  OTInheritanceKey *v25;
  NSString *claimTokenString;
  objc_super v28;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v28.receiver = self;
  v28.super_class = (Class)OTInheritanceKey;
  v17 = -[OTInheritanceKey init](&v28, sel_init);
  v18 = v17;
  if (!v17)
    goto LABEL_9;
  objc_storeStrong((id *)&v17->_uuid, a6);
  objc_storeStrong((id *)&v18->_wrappedKeyData, a3);
  objc_storeStrong((id *)&v18->_wrappingKeyData, a4);
  if (!-[OTInheritanceKey unwrapWithError:](v18, "unwrapWithError:", a7))
    goto LABEL_7;
  +[OTInheritanceKey printableWithData:checksumSize:error:](OTInheritanceKey, "printableWithData:checksumSize:error:", v18->_wrappingKeyData, 3, a7);
  v19 = objc_claimAutoreleasedReturnValue();
  wrappingKeyString = v18->_wrappingKeyString;
  v18->_wrappingKeyString = (NSString *)v19;

  if (!v18->_wrappingKeyString)
    goto LABEL_7;
  +[OTInheritanceKey printableWithData:checksumSize:error:](OTInheritanceKey, "printableWithData:checksumSize:error:", v18->_wrappedKeyData, 3, a7);
  v21 = objc_claimAutoreleasedReturnValue();
  wrappedKeyString = v18->_wrappedKeyString;
  v18->_wrappedKeyString = (NSString *)v21;

  if (!v18->_wrappedKeyString)
    goto LABEL_7;
  objc_storeStrong((id *)&v18->_claimTokenData, a5);
  if (!v15)
  {
    claimTokenString = v18->_claimTokenString;
    v18->_claimTokenString = 0;

    goto LABEL_9;
  }
  +[OTInheritanceKey printableWithData:checksumSize:error:](OTInheritanceKey, "printableWithData:checksumSize:error:", v18->_claimTokenData, 4, a7);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = v18->_claimTokenString;
  v18->_claimTokenString = (NSString *)v23;

  if (v18->_claimTokenString)
  {
LABEL_9:
    v25 = v18;
    goto LABEL_10;
  }
LABEL_7:
  v25 = 0;
LABEL_10:

  return v25;
}

- (OTInheritanceKey)initWithWrappedKeyData:(id)a3 wrappingKeyData:(id)a4 uuid:(id)a5 error:(id *)a6
{
  return -[OTInheritanceKey initWithWrappedKeyData:wrappingKeyData:claimTokenData:uuid:error:](self, "initWithWrappedKeyData:wrappingKeyData:claimTokenData:uuid:error:", a3, a4, 0, a5, a6);
}

- (OTInheritanceKey)initWithWrappedKeyData:(id)a3 wrappingKeyString:(id)a4 uuid:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  OTInheritanceKey *v13;

  v10 = a3;
  v11 = a5;
  +[OTInheritanceKey parseBase32:checksumSize:error:](OTInheritanceKey, "parseBase32:checksumSize:error:", a4, 3, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    self = -[OTInheritanceKey initWithWrappedKeyData:wrappingKeyData:uuid:error:](self, "initWithWrappedKeyData:wrappingKeyData:uuid:error:", v10, v12, v11, a6);
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (OTInheritanceKey)initWithWrappedKeyString:(id)a3 wrappingKeyData:(id)a4 uuid:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  OTInheritanceKey *v13;

  v10 = a4;
  v11 = a5;
  +[OTInheritanceKey parseBase32:checksumSize:error:](OTInheritanceKey, "parseBase32:checksumSize:error:", a3, 3, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    self = -[OTInheritanceKey initWithWrappedKeyData:wrappingKeyData:uuid:error:](self, "initWithWrappedKeyData:wrappingKeyData:uuid:error:", v12, v10, v11, a6);
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (OTInheritanceKey)initWithUUID:(id)a3 oldIK:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  OTInheritanceKey *v11;
  void *v12;
  int v13;
  OTInheritanceKey *v14;
  uint64_t v15;
  NSData *wrappingKeyData;
  uint64_t v17;
  NSString *wrappingKeyString;
  uint64_t v19;
  NSData *wrappedKeyData;
  uint64_t v21;
  NSString *wrappedKeyString;
  uint64_t v23;
  NSData *claimTokenData;
  uint64_t v25;
  NSString *claimTokenString;
  uint64_t v27;
  NSData *recoveryKeyData;
  objc_super v30;

  v9 = a3;
  v10 = a4;
  v30.receiver = self;
  v30.super_class = (Class)OTInheritanceKey;
  v11 = -[OTInheritanceKey init](&v30, sel_init);
  if (!v11)
    goto LABEL_6;
  objc_msgSend(v10, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v9, "isEqual:", v12);

  if (!v13)
  {
    objc_storeStrong((id *)&v11->_uuid, a3);
    objc_msgSend(v10, "wrappingKeyData");
    v15 = objc_claimAutoreleasedReturnValue();
    wrappingKeyData = v11->_wrappingKeyData;
    v11->_wrappingKeyData = (NSData *)v15;

    objc_msgSend(v10, "wrappingKeyString");
    v17 = objc_claimAutoreleasedReturnValue();
    wrappingKeyString = v11->_wrappingKeyString;
    v11->_wrappingKeyString = (NSString *)v17;

    objc_msgSend(v10, "wrappedKeyData");
    v19 = objc_claimAutoreleasedReturnValue();
    wrappedKeyData = v11->_wrappedKeyData;
    v11->_wrappedKeyData = (NSData *)v19;

    objc_msgSend(v10, "wrappedKeyString");
    v21 = objc_claimAutoreleasedReturnValue();
    wrappedKeyString = v11->_wrappedKeyString;
    v11->_wrappedKeyString = (NSString *)v21;

    objc_msgSend(v10, "claimTokenData");
    v23 = objc_claimAutoreleasedReturnValue();
    claimTokenData = v11->_claimTokenData;
    v11->_claimTokenData = (NSData *)v23;

    objc_msgSend(v10, "claimTokenString");
    v25 = objc_claimAutoreleasedReturnValue();
    claimTokenString = v11->_claimTokenString;
    v11->_claimTokenString = (NSString *)v25;

    objc_msgSend(v10, "recoveryKeyData");
    v27 = objc_claimAutoreleasedReturnValue();
    recoveryKeyData = v11->_recoveryKeyData;
    v11->_recoveryKeyData = (NSData *)v27;

LABEL_6:
    v14 = v11;
    goto LABEL_7;
  }
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:description:", CFSTR("com.apple.security.OctagonTrust.OTInheritanceKey"), 11, CFSTR("recreate needs a different UUID"));
    v14 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
LABEL_7:

  return v14;
}

- (OTInheritanceKey)initWithUUID:(id)a3 claimTokenData:(id)a4 wrappingKeyData:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  OTInheritanceKey *v14;
  OTInheritanceKey *v15;
  uint64_t v16;
  NSString *claimTokenString;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSData *recoveryKeyData;
  OTInheritanceKey *v25;
  objc_super v27;
  _OWORD bytes[4];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v27.receiver = self;
  v27.super_class = (Class)OTInheritanceKey;
  v14 = -[OTInheritanceKey init](&v27, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_uuid, a3);
    objc_storeStrong((id *)&v15->_claimTokenData, a4);
    +[OTInheritanceKey printableWithData:checksumSize:error:](OTInheritanceKey, "printableWithData:checksumSize:error:", v15->_claimTokenData, 4, a6);
    v16 = objc_claimAutoreleasedReturnValue();
    claimTokenString = v15->_claimTokenString;
    v15->_claimTokenString = (NSString *)v16;

    if (!v15->_claimTokenString)
      goto LABEL_8;
    *(_QWORD *)&v18 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
    bytes[2] = v18;
    bytes[3] = v18;
    bytes[0] = v18;
    bytes[1] = v18;
    v19 = SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E0CD7000], 0x40uLL, bytes);
    if ((_DWORD)v19)
    {
      v20 = v19;
      memset_s(bytes, 0x40uLL, 0, 0x40uLL);
      if (a6)
      {
        v21 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SecRandomCopyBytes: %d"), v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "errorWithDomain:code:description:", CFSTR("com.apple.security.OctagonTrust.OTInheritanceKey"), 7, v22);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", bytes, 64);
    v23 = objc_claimAutoreleasedReturnValue();
    recoveryKeyData = v15->_recoveryKeyData;
    v15->_recoveryKeyData = (NSData *)v23;

    memset_s(bytes, 0x40uLL, 0, 0x40uLL);
    if (!-[OTInheritanceKey wrapWithWrappingKey:error:](v15, "wrapWithWrappingKey:error:", v13, a6))
    {
LABEL_8:
      v25 = 0;
      goto LABEL_9;
    }
  }
  v25 = v15;
LABEL_9:

  return v25;
}

- (BOOL)isEqualToOTInheritanceKey:(id)a3
{
  OTInheritanceKey *v4;
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
  int v16;
  char v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v4 = (OTInheritanceKey *)a3;
  if (self == v4)
  {
    v17 = 1;
  }
  else
  {
    -[OTInheritanceKey uuid](self, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTInheritanceKey uuid](v4, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqual:", v6))
    {
      -[OTInheritanceKey wrappingKeyData](self, "wrappingKeyData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[OTInheritanceKey wrappingKeyData](v4, "wrappingKeyData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqualToData:", v8))
      {
        -[OTInheritanceKey wrappingKeyString](self, "wrappingKeyString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[OTInheritanceKey wrappingKeyString](v4, "wrappingKeyString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isEqualToString:", v10))
        {
          -[OTInheritanceKey wrappedKeyData](self, "wrappedKeyData");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[OTInheritanceKey wrappedKeyData](v4, "wrappedKeyData");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "isEqualToData:", v12))
          {
            v25 = v11;
            -[OTInheritanceKey wrappedKeyString](self, "wrappedKeyString");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[OTInheritanceKey wrappedKeyString](v4, "wrappedKeyString");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = v13;
            if (objc_msgSend(v13, "isEqualToString:"))
            {
              -[OTInheritanceKey claimTokenData](self, "claimTokenData");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              -[OTInheritanceKey claimTokenData](v4, "claimTokenData");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = v14;
              if (objc_msgSend(v14, "isEqualToData:"))
              {
                -[OTInheritanceKey claimTokenString](self, "claimTokenString");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                -[OTInheritanceKey claimTokenString](v4, "claimTokenString");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = v15;
                v16 = objc_msgSend(v15, "isEqualToString:");
                v11 = v25;
                if (v16)
                {
                  -[OTInheritanceKey recoveryKeyData](self, "recoveryKeyData");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  -[OTInheritanceKey recoveryKeyData](v4, "recoveryKeyData");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  v17 = objc_msgSend(v20, "isEqualToData:", v19);

                }
                else
                {
                  v17 = 0;
                }

              }
              else
              {
                v17 = 0;
                v11 = v25;
              }

            }
            else
            {
              v17 = 0;
              v11 = v25;
            }

          }
          else
          {
            v17 = 0;
          }

        }
        else
        {
          v17 = 0;
        }

      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }

  }
  return v17;
}

- (BOOL)isEqual:(id)a3
{
  OTInheritanceKey *v4;
  BOOL v5;

  v4 = (OTInheritanceKey *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[OTInheritanceKey isEqualToOTInheritanceKey:](self, "isEqualToOTInheritanceKey:", v4);
  }

  return v5;
}

- (BOOL)isRecoveryKeyEqual:(id)a3
{
  OTInheritanceKey *v4;
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
  void *v15;
  void *v16;
  char v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v4 = (OTInheritanceKey *)a3;
  if (self == v4)
  {
    v17 = 1;
  }
  else
  {
    -[OTInheritanceKey uuid](self, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTInheritanceKey uuid](v4, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqual:", v6))
    {
      -[OTInheritanceKey wrappingKeyData](self, "wrappingKeyData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[OTInheritanceKey wrappingKeyData](v4, "wrappingKeyData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqualToData:", v8))
      {
        -[OTInheritanceKey wrappingKeyString](self, "wrappingKeyString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[OTInheritanceKey wrappingKeyString](v4, "wrappingKeyString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isEqualToString:", v10))
        {
          -[OTInheritanceKey wrappedKeyData](self, "wrappedKeyData");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[OTInheritanceKey wrappedKeyData](v4, "wrappedKeyData");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "isEqualToData:", v12))
          {
            v21 = v11;
            -[OTInheritanceKey wrappedKeyString](self, "wrappedKeyString");
            v13 = objc_claimAutoreleasedReturnValue();
            -[OTInheritanceKey wrappedKeyString](v4, "wrappedKeyString");
            v14 = objc_claimAutoreleasedReturnValue();
            v22 = (void *)v13;
            v15 = (void *)v13;
            v16 = (void *)v14;
            if (objc_msgSend(v15, "isEqualToString:", v14))
            {
              -[OTInheritanceKey recoveryKeyData](self, "recoveryKeyData");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              -[OTInheritanceKey recoveryKeyData](v4, "recoveryKeyData");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v20, "isEqualToData:", v19);

            }
            else
            {
              v17 = 0;
            }

            v11 = v21;
          }
          else
          {
            v17 = 0;
          }

        }
        else
        {
          v17 = 0;
        }

      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }

  }
  return v17;
}

- (BOOL)isKeyEquals:(id)a3
{
  OTInheritanceKey *v4;
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
  int v15;
  char v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v4 = (OTInheritanceKey *)a3;
  if (self == v4)
  {
    v16 = 1;
  }
  else
  {
    -[OTInheritanceKey wrappingKeyData](self, "wrappingKeyData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTInheritanceKey wrappingKeyData](v4, "wrappingKeyData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToData:", v6))
    {
      -[OTInheritanceKey wrappingKeyString](self, "wrappingKeyString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[OTInheritanceKey wrappingKeyString](v4, "wrappingKeyString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqualToString:", v8))
      {
        -[OTInheritanceKey wrappedKeyData](self, "wrappedKeyData");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[OTInheritanceKey wrappedKeyData](v4, "wrappedKeyData");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isEqualToData:", v10))
        {
          -[OTInheritanceKey wrappedKeyString](self, "wrappedKeyString");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[OTInheritanceKey wrappedKeyString](v4, "wrappedKeyString");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "isEqualToString:", v12))
          {
            v23 = v11;
            -[OTInheritanceKey claimTokenData](self, "claimTokenData");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[OTInheritanceKey claimTokenData](v4, "claimTokenData");
            v24 = v13;
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v13, "isEqualToData:"))
            {
              -[OTInheritanceKey claimTokenString](self, "claimTokenString");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              -[OTInheritanceKey claimTokenString](v4, "claimTokenString");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = v14;
              v15 = objc_msgSend(v14, "isEqualToString:");
              v11 = v23;
              if (v15)
              {
                -[OTInheritanceKey recoveryKeyData](self, "recoveryKeyData");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                -[OTInheritanceKey recoveryKeyData](v4, "recoveryKeyData");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v16 = objc_msgSend(v19, "isEqualToData:", v18);

              }
              else
              {
                v16 = 0;
              }

            }
            else
            {
              v16 = 0;
              v11 = v23;
            }

          }
          else
          {
            v16 = 0;
          }

        }
        else
        {
          v16 = 0;
        }

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  return v16;
}

- (id)dictionary
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
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[6];
  _QWORD v20[7];

  v20[6] = *MEMORY[0x1E0C80C00];
  v19[0] = CFSTR("uuid");
  -[OTInheritanceKey uuid](self, "uuid");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "description");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v17;
  v19[1] = CFSTR("wrappingKeyData");
  -[OTInheritanceKey wrappingKeyData](self, "wrappingKeyData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "base64EncodedStringWithOptions:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v3;
  v19[2] = CFSTR("wrappingKeyString");
  -[OTInheritanceKey wrappingKeyString](self, "wrappingKeyString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v4;
  v19[3] = CFSTR("wrappedKeyData");
  -[OTInheritanceKey wrappedKeyData](self, "wrappedKeyData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v6;
  v19[4] = CFSTR("wrappedKeyString");
  -[OTInheritanceKey wrappedKeyString](self, "wrappedKeyString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v7;
  v19[5] = CFSTR("recoveryKeyData");
  -[OTInheritanceKey recoveryKeyData](self, "recoveryKeyData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "base64EncodedStringWithOptions:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[5] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  -[OTInheritanceKey claimTokenData](self, "claimTokenData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "base64EncodedStringWithOptions:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("claimTokenData"));

  -[OTInheritanceKey claimTokenString](self, "claimTokenString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("claimTokenString"));

  return v11;
}

- (OTInheritanceKey)initWithCoder:(id)a3
{
  id v4;
  OTInheritanceKey *v5;
  uint64_t v6;
  NSUUID *uuid;
  uint64_t v8;
  NSData *wrappingKeyData;
  uint64_t v10;
  NSData *wrappedKeyData;
  uint64_t v12;
  NSString *wrappingKeyString;
  uint64_t v14;
  NSString *wrappedKeyString;
  uint64_t v16;
  NSData *claimTokenData;
  uint64_t v18;
  NSString *claimTokenString;
  uint64_t v20;
  NSData *recoveryKeyData;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)OTInheritanceKey;
  v5 = -[OTInheritanceKey init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
    v6 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("wrappingKeyData"));
    v8 = objc_claimAutoreleasedReturnValue();
    wrappingKeyData = v5->_wrappingKeyData;
    v5->_wrappingKeyData = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("wrappedKeyData"));
    v10 = objc_claimAutoreleasedReturnValue();
    wrappedKeyData = v5->_wrappedKeyData;
    v5->_wrappedKeyData = (NSData *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("wrappingKeyString"));
    v12 = objc_claimAutoreleasedReturnValue();
    wrappingKeyString = v5->_wrappingKeyString;
    v5->_wrappingKeyString = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("wrappedKeyString"));
    v14 = objc_claimAutoreleasedReturnValue();
    wrappedKeyString = v5->_wrappedKeyString;
    v5->_wrappedKeyString = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("claimTokenData"));
    v16 = objc_claimAutoreleasedReturnValue();
    claimTokenData = v5->_claimTokenData;
    v5->_claimTokenData = (NSData *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("claimTokenString"));
    v18 = objc_claimAutoreleasedReturnValue();
    claimTokenString = v5->_claimTokenString;
    v5->_claimTokenString = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recoveryKeyData"));
    v20 = objc_claimAutoreleasedReturnValue();
    recoveryKeyData = v5->_recoveryKeyData;
    v5->_recoveryKeyData = (NSData *)v20;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *uuid;
  id v5;

  uuid = self->_uuid;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", uuid, CFSTR("uuid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_wrappingKeyData, CFSTR("wrappingKeyData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_wrappedKeyData, CFSTR("wrappedKeyData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_wrappingKeyString, CFSTR("wrappingKeyString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_wrappedKeyString, CFSTR("wrappedKeyString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_claimTokenData, CFSTR("claimTokenData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_claimTokenString, CFSTR("claimTokenString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recoveryKeyData, CFSTR("recoveryKeyData"));

}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSData)wrappingKeyData
{
  return self->_wrappingKeyData;
}

- (NSString)wrappingKeyString
{
  return self->_wrappingKeyString;
}

- (NSData)wrappedKeyData
{
  return self->_wrappedKeyData;
}

- (NSString)wrappedKeyString
{
  return self->_wrappedKeyString;
}

- (NSData)claimTokenData
{
  return self->_claimTokenData;
}

- (NSString)claimTokenString
{
  return self->_claimTokenString;
}

- (NSData)recoveryKeyData
{
  return self->_recoveryKeyData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recoveryKeyData, 0);
  objc_storeStrong((id *)&self->_claimTokenString, 0);
  objc_storeStrong((id *)&self->_claimTokenData, 0);
  objc_storeStrong((id *)&self->_wrappedKeyString, 0);
  objc_storeStrong((id *)&self->_wrappedKeyData, 0);
  objc_storeStrong((id *)&self->_wrappingKeyString, 0);
  objc_storeStrong((id *)&self->_wrappingKeyData, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

+ (id)base32:(const char *)a3 len:(unint64_t)a4
{
  unint64_t v4;
  unint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unsigned int v12;
  char v13;
  _BYTE v14[7];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  memset(v14, 170, sizeof(v14));
  if (!a4)
    return 0;
  v4 = *(unsigned __int8 *)a3;
  v13 = printableChars[v4 >> 3];
  v5 = 4 * (v4 & 7);
  if (a4 != 1)
  {
    v8 = *((unsigned __int8 *)a3 + 1);
    v14[0] = printableChars[v5 | (v8 >> 6)];
    v14[1] = printableChars[(v8 >> 1) & 0x1F];
    v5 = 16 * (v8 & 1);
    if (a4 == 2)
    {
      v6 = &v14[2];
      v7 = 4;
      goto LABEL_13;
    }
    v9 = *((unsigned __int8 *)a3 + 2);
    v14[2] = printableChars[v5 | (v9 >> 4)];
    v10 = 2 * (v9 & 0xF);
    if (a4 == 3)
    {
      v6 = &v14[3];
      v7 = 5;
      LODWORD(v5) = v10;
      goto LABEL_13;
    }
    v5 = *((unsigned __int8 *)a3 + 3);
    v14[3] = printableChars[v10 | (v5 >> 7)];
    v14[4] = printableChars[(v5 >> 2) & 0x1F];
    if (a4 == 5)
    {
      v6 = &v14[6];
      v12 = *((unsigned __int8 *)a3 + 4);
      v14[5] = printableChars[(v12 >> 5) & 0xFFFFFFE7 | (8 * (v5 & 3))];
      LODWORD(v5) = v12 & 0x1F;
      v7 = 8;
      goto LABEL_13;
    }
    if (a4 == 4)
    {
      v6 = &v14[5];
      LODWORD(v5) = 8 * (v5 & 3);
      v7 = 7;
      goto LABEL_13;
    }
    return 0;
  }
  v6 = v14;
  v7 = 2;
LABEL_13:
  *v6 = printableChars[v5];
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", &v13, v7, 4);
}

+ (id)unbase32:(const char *)a3 len:(unint64_t)a4
{
  unint64_t v4;
  void *v5;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  _BYTE *v12;
  uint64_t v13;
  char v14;
  int v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = -1431655766;
  v4 = a4 - 2;
  if (a4 - 2 <= 6 && ((0x6Du >> v4) & 1) != 0)
  {
    v9 = 0;
    v10 = qword_19A819908[v4];
    *(_QWORD *)&v11 = -1;
    *((_QWORD *)&v11 + 1) = -1;
    v18 = v11;
    v19 = v11;
    v16 = v11;
    v17 = v11;
    while (1)
    {
      v12 = memchr("ABCDEFGHJKLMNPQRSTUVWXYZ23456789", a3[v9], 0x21uLL);
      v13 = v12 - "ABCDEFGHJKLMNPQRSTUVWXYZ23456789";
      if (!v12)
        v13 = -1;
      *((_QWORD *)&v16 + v9) = v13;
      if (v13 < 0)
        break;
      if (a4 == ++v9)
      {
        v14 = (DWORD2(v16) >> 2) | (8 * v16);
        if (a4 >= 4)
        {
          LOBYTE(v15) = (2 * v17) | (BYTE8(v16) << 6) | (DWORD2(v17) >> 4);
          if (a4 != 4)
          {
            BYTE1(v15) = (v18 >> 1) | (16 * BYTE8(v17));
            if (a4 >= 7)
            {
              BYTE2(v15) = (4 * BYTE8(v18)) | ((_BYTE)v18 << 7) | (v19 >> 3);
              if (a4 == 8)
                HIBYTE(v15) = BYTE8(v19) | (32 * v19);
            }
          }
        }
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v14, v10);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        return v5;
      }
    }
  }
  v5 = 0;
  return v5;
}

+ (id)printableWithData:(id)a3 checksumSize:(unint64_t)a4 error:(id *)a5
{
  id v7;
  void *v8;
  __int128 v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  _OWORD v29[2];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", objc_msgSend(v7, "length") + a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&v9 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v29[0] = v9;
  v29[1] = v9;
  ccsha256_di();
  objc_msgSend(v7, "length");
  v10 = objc_retainAutorelease(v7);
  objc_msgSend(v10, "bytes");
  ccdigest();
  objc_msgSend(v8, "appendData:", v10);
  if (a4 < 0x21)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v29, a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendData:", v14);

    v15 = objc_retainAutorelease(v8);
    v16 = objc_msgSend(v15, "bytes");
    v17 = objc_msgSend(v15, "length");
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = v17 - 5;
      if (v17 >= 5)
        v19 = 5;
      else
        v19 = v17;
      +[OTInheritanceKey base32:len:](OTInheritanceKey, "base32:len:", v16, v19);
      v20 = objc_claimAutoreleasedReturnValue();
      if (!v20)
      {
LABEL_19:
        if (a5)
        {
          v25 = (void *)MEMORY[0x1E0CB35C8];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bad chunkLen (%zu)"), v19);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "errorWithDomain:code:description:", CFSTR("com.apple.security.OctagonTrust.OTInheritanceKey"), 6, v26);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

        }
        v13 = 0;
        goto LABEL_25;
      }
      v21 = (void *)v20;
      v28 = v10;
      v22 = 5;
      while (1)
      {
        if ((unint64_t)objc_msgSend(v21, "length") < 5)
        {
          objc_msgSend(v12, "appendString:", v21);
        }
        else
        {
          objc_msgSend(v21, "substringToIndex:", 4);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "appendString:", v23);

          objc_msgSend(v12, "appendString:", CFSTR("-"));
          objc_msgSend(v21, "substringFromIndex:", 4);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "appendString:", v24);

        }
        if (v22 >= v17)
          break;
        objc_msgSend(v12, "appendString:", CFSTR("-"));

        if (v18 >= 5)
          v19 = 5;
        else
          v19 = v18;
        +[OTInheritanceKey base32:len:](OTInheritanceKey, "base32:len:", v16 + v22, v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 += 5;
        v18 -= 5;
        if (!v21)
        {
          v10 = v28;
          goto LABEL_19;
        }
      }

      v10 = v28;
    }
    v12 = v12;
    v13 = v12;
LABEL_25:

    goto LABEL_26;
  }
  if (a5)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("checksumSize (%zu) too large (%zu)"), a4, 32);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:description:", CFSTR("com.apple.security.OctagonTrust.OTInheritanceKey"), 3, v12);
    v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
  v13 = 0;
LABEL_26:

  return v13;
}

+ (id)parseBase32:(id)a3 checksumSize:(unint64_t)a4 error:(id *)a5
{
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id *v16;
  void *v17;
  __int128 v18;
  unint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  id v31;
  _OWORD __s2[2];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), &stru_1E3919890);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_retainAutorelease(v5);
  v8 = objc_msgSend(v31, "UTF8String");
  if (v6)
  {
    v9 = v8;
    v10 = 0;
    v11 = v6;
    while (1)
    {
      v12 = v11 - 8;
      v13 = v11 >= 8 ? 8 : v11;
      +[OTInheritanceKey unbase32:len:](OTInheritanceKey, "unbase32:len:", v9 + v10, v13);
      v14 = objc_claimAutoreleasedReturnValue();
      if (!v14)
        break;
      v15 = (void *)v14;
      objc_msgSend(v7, "appendData:", v14);

      v10 += 8;
      v11 = v12;
      if (v10 >= v6)
        goto LABEL_8;
    }
    v16 = a5;
    if (!a5)
      goto LABEL_21;
    v22 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot parse %.*s"), v13, v9 + v10);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v22;
    v25 = 1;
    goto LABEL_20;
  }
LABEL_8:
  if (objc_msgSend(v7, "length") >= a4)
  {
    *(_QWORD *)&v18 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
    __s2[0] = v18;
    __s2[1] = v18;
    v19 = objc_msgSend(v7, "length") - a4;
    ccsha256_di();
    v20 = objc_retainAutorelease(v7);
    objc_msgSend(v20, "bytes");
    ccdigest();
    v16 = a5;
    if (a4 < 0x21)
    {
      v26 = objc_retainAutorelease(v20);
      if (!memcmp((const void *)(objc_msgSend(v26, "bytes") + v19), __s2, a4))
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", objc_msgSend(objc_retainAutorelease(v26), "bytes"), v19);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
      if (a5)
      {
        v27 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Checksum does not match"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v27;
        v25 = 2;
LABEL_20:
        objc_msgSend(v24, "errorWithDomain:code:description:", CFSTR("com.apple.security.OctagonTrust.OTInheritanceKey"), v25, v23);
        *v16 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else if (a5)
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("checksumsize (%zu) too long (expected %zu)"), a4, 32);
      goto LABEL_14;
    }
  }
  else
  {
    v16 = a5;
    if (a5)
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Length (%zu) shorter than checksumsize (%zu)"), objc_msgSend(v7, "length"), a4);
LABEL_14:
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:description:", CFSTR("com.apple.security.OctagonTrust.OTInheritanceKey"), 3, v21);
      *v16 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
LABEL_21:
  v28 = 0;
LABEL_22:

  return v28;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
