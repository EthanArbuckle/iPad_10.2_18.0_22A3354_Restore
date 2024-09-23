@implementation SPAKE2Common

- (SPAKE2Common)initWithSalt:(id)a3 code:(id)a4
{
  id v6;
  id v7;
  SPAKE2Common *v8;
  size_t v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SPAKE2Common;
  v8 = -[SPAKE2Common init](&v11, sel_init);
  if (v8)
  {
    -[SPAKE2Common setRng:](v8, "setRng:", ccrng());
    -[SPAKE2Common setCp:](v8, "setCp:", ccspake_cp_256());
    -[SPAKE2Common setMac:](v8, "setMac:", ccspake_mac_hkdf_hmac_sha256());
    -[SPAKE2Common cp](v8, "cp");
    v9 = ccspake_sizeof_ctx();
    -[SPAKE2Common setSpake_ctx:](v8, "setSpake_ctx:", malloc_type_malloc(v9, 0x131C905FuLL));
    -[SPAKE2Common setSalt:](v8, "setSalt:", v6);
    -[SPAKE2Common setCode:](v8, "setCode:", v7);
    -[SPAKE2Common cp](v8, "cp");
    -[SPAKE2Common setW_size:](v8, "setW_size:", ccspake_sizeof_w());
    -[SPAKE2Common cp](v8, "cp");
    -[SPAKE2Common setPoint_size:](v8, "setPoint_size:", ccspake_sizeof_point());
  }

  return v8;
}

- (BOOL)generateStateWithError:(id *)a3
{
  id v5;
  const char *v6;
  char *v7;
  size_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  -[SPAKE2Common code](self, "code");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (const char *)objc_msgSend(v5, "UTF8String");

  v7 = (char *)&v21 - ((2 * -[SPAKE2Common w_size](self, "w_size") + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = ccscrypt_storage_size();
  if ((v8 & 0x8000000000000000) != 0)
  {
    if (a3)
    {
      v18 = (void *)MEMORY[0x1E0CB35C8];
      v24 = *MEMORY[0x1E0CB2D50];
      v25[0] = CFSTR("sscrypt_storage_size params failed");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("SFCoreCryptoErrorDomain"), -1, v15);
      v17 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
  else
  {
    v9 = malloc_type_malloc(v8, 0xC03096DAuLL);
    strlen(v6);
    -[SPAKE2Common salt](self, "salt");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "length");
    -[SPAKE2Common salt](self, "salt");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v11, "bytes");
    v12 = ccscrypt();

    free(v9);
    if (!(_DWORD)v12)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v7, -[SPAKE2Common w_size](self, "w_size"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPAKE2Common setW0:](self, "setW0:", v19);

      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v7[-[SPAKE2Common w_size](self, "w_size")], -[SPAKE2Common w_size](self, "w_size"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPAKE2Common setW1:](self, "setW1:", v15);
      v17 = 1;
      goto LABEL_9;
    }
    if (a3)
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v14 = (int)v12;
      v22 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ccscrypt failed: %d"), v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("SFCoreCryptoErrorDomain"), v14, v16);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      v17 = 0;
LABEL_9:

      return v17;
    }
  }
  return 0;
}

- (BOOL)setupProver:(id *)a3
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  -[SPAKE2Common spake_ctx](self, "spake_ctx");
  -[SPAKE2Common cp](self, "cp");
  -[SPAKE2Common mac](self, "mac");
  -[SPAKE2Common rng](self, "rng");
  -[SPAKE2Common w_size](self, "w_size");
  -[SPAKE2Common w0](self, "w0");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v5, "bytes");
  -[SPAKE2Common w1](self, "w1");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "bytes");
  v7 = ccspake_prover_init();

  if (a3 && (_DWORD)v7)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ccspake_prover_init failed: %d"), v7, *MEMORY[0x1E0CB2D50]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("SFCoreCryptoErrorDomain"), (int)v7, v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (_DWORD)v7 == 0;
}

- (BOOL)setupVerifier:(id *)a3
{
  id v5;
  uint64_t L;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  -[SPAKE2Common point_size](self, "point_size");
  -[SPAKE2Common cp](self, "cp");
  -[SPAKE2Common w_size](self, "w_size");
  -[SPAKE2Common w1](self, "w1");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v5, "bytes");
  -[SPAKE2Common point_size](self, "point_size");
  -[SPAKE2Common rng](self, "rng");
  L = ccspake_generate_L();

  if ((_DWORD)L)
  {
    if (a3)
    {
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v19 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ccspake_generate_L failed: %d"), L);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v7;
      v11 = (int)L;
LABEL_7:
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("SFCoreCryptoErrorDomain"), v11, v9);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    -[SPAKE2Common spake_ctx](self, "spake_ctx");
    -[SPAKE2Common cp](self, "cp");
    -[SPAKE2Common mac](self, "mac");
    -[SPAKE2Common rng](self, "rng");
    -[SPAKE2Common w_size](self, "w_size");
    -[SPAKE2Common w0](self, "w0");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v12, "bytes");
    -[SPAKE2Common point_size](self, "point_size");
    v13 = ccspake_verifier_init();

    if (!(_DWORD)v13)
      return 1;
    if (a3)
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v15 = (int)v13;
      v17 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ccspake_verifier_init failed: %d"), v13);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v14;
      v11 = v15;
      goto LABEL_7;
    }
  }
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  free(-[SPAKE2Common spake_ctx](self, "spake_ctx"));
  v3.receiver = self;
  v3.super_class = (Class)SPAKE2Common;
  -[SPAKE2Common dealloc](&v3, sel_dealloc);
}

- (id)getMsg1WithError:(id *)a3
{
  char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = (char *)&v12 - ((-[SPAKE2Common point_size](self, "point_size") + 15) & 0xFFFFFFFFFFFFFFF0);
  -[SPAKE2Common spake_ctx](self, "spake_ctx");
  -[SPAKE2Common point_size](self, "point_size");
  v6 = ccspake_kex_generate();
  if ((_DWORD)v6)
  {
    if (a3)
    {
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v8 = (int)v6;
      v13 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ccspake_kex_generate failed: %d"), v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("SFCoreCryptoErrorDomain"), v8, v10);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v5, -[SPAKE2Common point_size](self, "point_size"));
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (BOOL)processMsg1:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[SPAKE2Common spake_ctx](self, "spake_ctx");
  objc_msgSend(v6, "length");
  v7 = objc_retainAutorelease(v6);
  objc_msgSend(v7, "bytes");

  v8 = ccspake_kex_process();
  v9 = v8;
  if (a4 && (_DWORD)v8)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ccspake_kex_process failed: %d"), v8, *MEMORY[0x1E0CB2D50]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("SFCoreCryptoErrorDomain"), v9, v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v9 == 0;
}

- (id)getMsg2WithError:(id *)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v10;
  void *v11;
  _BYTE v12[32];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[SPAKE2Common spake_ctx](self, "spake_ctx");
  v4 = ccspake_mac_compute();
  if ((_DWORD)v4)
  {
    if (a3)
    {
      v5 = (void *)MEMORY[0x1E0CB35C8];
      v6 = (int)v4;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ccspake_mac_generate failed: %d"), v4, *MEMORY[0x1E0CB2D50]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("SFCoreCryptoErrorDomain"), v6, v8);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v12, 32);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (BOOL)processMsg2:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  uint64_t session_key;
  void *v9;
  uint64_t v10;
  _SFAESKeySpecifier *v11;
  void *v12;
  _SFAESKey *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  _SFAESKeySpecifier *v18;
  _BYTE v19[16];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[SPAKE2Common spake_ctx](self, "spake_ctx");
  objc_msgSend(v6, "length");
  v7 = objc_retainAutorelease(v6);
  objc_msgSend(v7, "bytes");

  session_key = ccspake_mac_verify_and_get_session_key();
  if (!(_DWORD)session_key)
  {
    v11 = -[_SFAESKeySpecifier initWithBitSize:]([_SFAESKeySpecifier alloc], "initWithBitSize:", 0);
    v13 = [_SFAESKey alloc];
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v19, 16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    a4 = -[_SFSymmetricKey initWithData:specifier:error:](v13, "initWithData:specifier:error:", v14, v11, a4);
    -[SPAKE2Common setSession_key:](self, "setSession_key:", a4);

    -[SPAKE2Common session_key](self, "session_key");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(a4) = v15 != 0;

    if (v15)
    {
      LOBYTE(a4) = 1;
      -[SPAKE2Common setVerified:](self, "setVerified:", 1);
    }
    goto LABEL_6;
  }
  if (a4)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = (int)session_key;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ccspake_mac_verify_and_get_session_key failed: %d"), session_key, *MEMORY[0x1E0CB2D50]);
    v11 = (_SFAESKeySpecifier *)objc_claimAutoreleasedReturnValue();
    v18 = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("SFCoreCryptoErrorDomain"), v10, v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a4) = 0;
LABEL_6:

  }
  return (char)a4;
}

- (id)encryptMessage:(id)a3 error:(id *)a4
{
  id v6;
  _SFAESKeySpecifier *v7;
  _SFAuthenticatedEncryptionOperation *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a3;
  v7 = -[_SFAESKeySpecifier initWithBitSize:]([_SFAESKeySpecifier alloc], "initWithBitSize:", 2);
  v8 = -[_SFAuthenticatedEncryptionOperation initWithKeySpecifier:]([_SFAuthenticatedEncryptionOperation alloc], "initWithKeySpecifier:", v7);
  -[SPAKE2Common getKey](self, "getKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPAKE2Common salt](self, "salt");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFAuthenticatedEncryptionOperation encrypt:withKey:additionalAuthenticatedData:error:](v8, "encrypt:withKey:additionalAuthenticatedData:error:", v6, v9, v10, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 1, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      if (a4)
        *a4 = 0;
      v14 = v12;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)decryptMessage:(id)a3 error:(id *)a4
{
  id v6;
  _SFAESKeySpecifier *v7;
  _SFAuthenticatedEncryptionOperation *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  v7 = -[_SFAESKeySpecifier initWithBitSize:]([_SFAESKeySpecifier alloc], "initWithBitSize:", 2);
  v8 = -[_SFAuthenticatedEncryptionOperation initWithKeySpecifier:]([_SFAuthenticatedEncryptionOperation alloc], "initWithKeySpecifier:", v7);
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[SPAKE2Common getKey](self, "getKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPAKE2Common salt](self, "salt");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFAuthenticatedEncryptionOperation decrypt:withKey:additionalAuthenticatedData:error:](v8, "decrypt:withKey:additionalAuthenticatedData:error:", v9, v10, v11, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      if (a4)
        *a4 = 0;
      v13 = v12;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (ccrng_state)rng
{
  return self->_rng;
}

- (void)setRng:(ccrng_state *)a3
{
  self->_rng = a3;
}

- (ccspake_ctx)spake_ctx
{
  return self->_spake_ctx;
}

- (void)setSpake_ctx:(ccspake_ctx *)a3
{
  self->_spake_ctx = a3;
}

- (NSString)code
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSData)salt
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSalt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (ccspake_cp)cp
{
  return self->_cp;
}

- (void)setCp:(ccspake_cp *)a3
{
  self->_cp = a3;
}

- (ccspake_mac)mac
{
  return self->_mac;
}

- (void)setMac:(ccspake_mac *)a3
{
  self->_mac = a3;
}

- (NSData)w0
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setW0:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSData)w1
{
  return (NSData *)objc_getProperty(self, a2, 72, 1);
}

- (void)setW1:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (unint64_t)w_size
{
  return self->_w_size;
}

- (void)setW_size:(unint64_t)a3
{
  self->_w_size = a3;
}

- (unint64_t)point_size
{
  return self->_point_size;
}

- (void)setPoint_size:(unint64_t)a3
{
  self->_point_size = a3;
}

- (_SFAESKey)session_key
{
  return (_SFAESKey *)objc_getProperty(self, a2, 96, 1);
}

- (void)setSession_key:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (BOOL)verified
{
  return self->_verified;
}

- (void)setVerified:(BOOL)a3
{
  self->_verified = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session_key, 0);
  objc_storeStrong((id *)&self->_w1, 0);
  objc_storeStrong((id *)&self->_w0, 0);
  objc_storeStrong((id *)&self->_salt, 0);
  objc_storeStrong((id *)&self->_code, 0);
}

@end
