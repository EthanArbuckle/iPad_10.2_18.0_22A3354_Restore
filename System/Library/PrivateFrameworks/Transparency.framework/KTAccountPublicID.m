@implementation KTAccountPublicID

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  KTAccountPublicID *v5;
  _PCSPublicIdentityData *publicIdentity;
  _PCSPublicIdentityData *v7;
  NSString *publicID;
  uint64_t v9;

  v5 = -[KTAccountPublicID init](+[KTAccountPublicID allocWithZone:](KTAccountPublicID, "allocWithZone:"), "init");
  publicIdentity = self->_publicIdentity;
  if (publicIdentity)
  {
    v7 = (_PCSPublicIdentityData *)CFRetain(publicIdentity);
    publicID = v5->_publicID;
    v5->_publicIdentity = v7;
    v5->_publicID = 0;
  }
  else
  {
    v5->_publicIdentity = 0;
    v9 = -[NSString copyWithZone:](self->_publicID, "copyWithZone:", a3);
    publicID = v5->_publicID;
    v5->_publicID = (NSString *)v9;
  }

  return v5;
}

- (NSData)publicKeyInfo
{
  void *publicIdentity;

  publicIdentity = self->_publicIdentity;
  if (publicIdentity)
    publicIdentity = (void *)PCSPublicIdentityCopyPublicKeyInfo();
  return (NSData *)publicIdentity;
}

+ (id)encodePublicKeyInfoDigestSuffix:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_msgSend(v3, "kt_sha256");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)objc_msgSend(v3, "mutableCopy");
    objc_msgSend(v5, "appendBytes:length:", objc_msgSend(objc_retainAutorelease(v4), "bytes"), 2);
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("_"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("+"), CFSTR("-"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("="));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSString)publicAccountIdentity
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (self->_publicIdentity)
  {
    -[KTAccountPublicID publicKeyInfo](self, "publicKeyInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "kt_sha256");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "mutableCopy");

    if (v4 && objc_msgSend(v4, "length") == 32)
    {
      +[KTAccountPublicID encodePublicKeyInfoDigestSuffix:](KTAccountPublicID, "encodePublicKeyInfoDigestSuffix:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), CFSTR("APKTID"), v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), CFSTR("APKTID"), self->_publicID);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v6;
}

- (NSString)ktStorageString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  if (self->_publicIdentity)
  {
    -[KTAccountPublicID publicKeyInfo](self, "publicKeyInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "kt_sha256");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "mutableCopy");

    if (v4 && objc_msgSend(v4, "length") == 32)
    {
      +[KTAccountPublicID encodePublicKeyInfoDigestSuffix:](KTAccountPublicID, "encodePublicKeyInfoDigestSuffix:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    -[KTAccountPublicID publicID](self, "publicID");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v2, "copy");
  }

  return (NSString *)v5;
}

- (NSString)publicAccountPKI
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[KTAccountPublicID publicKeyInfo](self, "publicKeyInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "kt_sha256");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)objc_msgSend(v3, "mutableCopy");
      if (v5)
      {
        objc_msgSend(v5, "appendBytes:length:", objc_msgSend(objc_retainAutorelease(v4), "bytes"), 2);
        objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), CFSTR("apple-ktpki:"), v6);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v7 = 0;
        }

      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return (NSString *)v7;
}

+ (KTAccountPublicID)ktAccountPublicIDWithString:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  KTAccountPublicID *v8;

  v6 = a3;
  if (objc_msgSend(v6, "hasPrefix:", CFSTR("apple-ktid:"))
    && (unint64_t)objc_msgSend(v6, "length") >= 0x47)
  {
    objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("apple-ktid:"), CFSTR("apple-ktpki:"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "ktAccountPublicIDWithPKIString:error:", v7, a4);
    v8 = (KTAccountPublicID *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = -[KTAccountPublicID initWithPublicKeyIdentity:error:]([KTAccountPublicID alloc], "initWithPublicKeyIdentity:error:", v6, a4);
  }

  return v8;
}

- (KTAccountPublicID)initWithPublicKeyInfo:(id)a3 error:(id *)a4
{
  id v6;
  KTAccountPublicID *v7;
  _PCSPublicIdentityData *v8;
  KTAccountPublicID *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v6 = a3;
  if (!v6)
  {
    +[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", CFSTR("TransparencyErrorInternal"), -366, CFSTR("No publicKeyInfo"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (a4 && v10)
      *a4 = objc_retainAutorelease(v10);

    goto LABEL_14;
  }
  v15.receiver = self;
  v15.super_class = (Class)KTAccountPublicID;
  v7 = -[KTAccountPublicID init](&v15, sel_init);
  if (v7)
  {
    self = v7;
    v8 = (_PCSPublicIdentityData *)PCSPublicIdentityCreateWithPublicKeyInfo();
    if (v8)
    {
      self->_publicIdentity = v8;
      v9 = self;
LABEL_15:

      goto LABEL_16;
    }
    +[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", CFSTR("TransparencyErrorDecode"), -296, 0, CFSTR("Failed to parse publicKeyInfo"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (a4 && v12)
      *a4 = objc_retainAutorelease(v12);

LABEL_14:
    v9 = 0;
    goto LABEL_15;
  }
  v9 = 0;
LABEL_16:

  return v9;
}

- (KTAccountPublicID)initWithPublicKeyIdentity:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  KTAccountPublicID *v8;
  void *v9;

  v6 = a3;
  if ((objc_msgSend(v6, "hasPrefix:", CFSTR("APKTID")) & 1) != 0)
  {
    objc_msgSend(v6, "substringFromIndex:", objc_msgSend(CFSTR("APKTID"), "length"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    self = -[KTAccountPublicID initWithStorageString:error:](self, "initWithStorageString:error:", v7, a4);
    v8 = self;
  }
  else
  {
    +[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", CFSTR("TransparencyErrorDecode"), -291, CFSTR("kt-id prefix missing"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    v8 = 0;
    if (a4 && v9)
    {
      v7 = objc_retainAutorelease(v9);
      v8 = 0;
      *a4 = v7;
    }
  }

  return v8;
}

- (KTAccountPublicID)initWithStorageString:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  KTAccountPublicID *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("/"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("+"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_msgSend(v8, "length") & 3;
    if (v9)
    {
      objc_msgSend(CFSTR("===="), "substringToIndex:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringByAppendingString:", v10);
      v11 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v11;
    }
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithBase64EncodedString:options:", v8, 1);
    if ((unint64_t)objc_msgSend(v12, "length") > 1)
    {
      objc_msgSend(v12, "subdataWithRange:", 0, objc_msgSend(v12, "length") - 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "subdataWithRange:", objc_msgSend(v12, "length") - 2, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "kt_sha256");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        objc_msgSend(objc_retainAutorelease(v17), "bytes");
        objc_msgSend(objc_retainAutorelease(v18), "bytes");
        if (cc_cmp_safe())
        {
          v23 = v17;
          v24[0] = *MEMORY[0x24BDD0FC8];
          v24[1] = CFSTR("storageString");
          v25[0] = CFSTR("initWithStorageString signature wrong ");
          v25[1] = v6;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          +[TransparencyError errorWithDomain:code:userInfo:](TransparencyError, "errorWithDomain:code:userInfo:", CFSTR("TransparencyErrorDecode"), -293, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (a4 && v20)
            *a4 = objc_retainAutorelease(v20);

          v15 = 0;
          v17 = v23;
        }
        else
        {
          +[KTAccountPublicID encodePublicKeyInfoDigestSuffix:](KTAccountPublicID, "encodePublicKeyInfoDigestSuffix:", v16);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            objc_storeStrong((id *)&self->_publicID, v21);
            v15 = self;
          }
          else
          {
            v15 = 0;
          }

        }
      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      +[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", CFSTR("TransparencyErrorDecode"), -292, CFSTR("info+signature too short"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (a4 && v13)
        *a4 = objc_retainAutorelease(v13);

      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (KTAccountPublicID)ktAccountPublicIDWithPKIString:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  KTAccountPublicID *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  CFTypeRef cf;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((objc_msgSend(v5, "hasPrefix:", CFSTR("apple-ktpki:")) & 1) != 0)
  {
    objc_msgSend(v5, "substringFromIndex:", objc_msgSend(CFSTR("apple-ktpki:"), "length"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithBase64EncodedString:options:", v6, 1);
    if ((unint64_t)objc_msgSend(v7, "length") <= 1)
    {
      +[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", CFSTR("TransparencyErrorDecode"), -292, CFSTR("info+signature too short"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (a4 && v8)
        *a4 = objc_retainAutorelease(v8);

      v10 = 0;
      goto LABEL_27;
    }
    objc_msgSend(v7, "subdataWithRange:", 0, objc_msgSend(v7, "length") - 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "subdataWithRange:", objc_msgSend(v7, "length") - 2, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "kt_sha256");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(objc_retainAutorelease(v14), "bytes");
      objc_msgSend(objc_retainAutorelease(v15), "bytes");
      if (cc_cmp_safe())
      {
        v23 = *MEMORY[0x24BDD0FC8];
        v24[0] = CFSTR("ktAccountPublicIDWithPKIString signature wrong ");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[TransparencyError errorWithDomain:code:userInfo:](TransparencyError, "errorWithDomain:code:userInfo:", CFSTR("TransparencyErrorDecode"), -293, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (a4 && v17)
          *a4 = objc_retainAutorelease(v17);

      }
      else
      {
        v18 = PCSPublicIdentityCreateWithPublicKeyInfo();
        if (v18)
        {
          v10 = objc_alloc_init(KTAccountPublicID);
          v10->_publicIdentity = (_PCSPublicIdentityData *)v18;
LABEL_26:

LABEL_27:
          goto LABEL_28;
        }
        +[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", CFSTR("TransparencyErrorDecode"), -294, 0, CFSTR("Failed to parse kt-id"), 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (a4 && v19)
          *a4 = objc_retainAutorelease(v19);
        if (cf)
          CFRelease(cf);

      }
    }
    v10 = 0;
    goto LABEL_26;
  }
  +[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", CFSTR("TransparencyErrorDecode"), -291, CFSTR("kt-id prefix missing"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (a4 && v11)
    *a4 = objc_retainAutorelease(v11);

  v10 = 0;
LABEL_28:

  return v10;
}

+ (KTAccountPublicID)ktAccountPublicIDWithPublicKeyInfo:(id)a3 error:(id *)a4
{
  id v5;
  KTAccountPublicID *v6;

  v5 = a3;
  v6 = -[KTAccountPublicID initWithPublicKeyInfo:error:]([KTAccountPublicID alloc], "initWithPublicKeyInfo:error:", v5, a4);

  return v6;
}

+ (KTAccountPublicID)ktAccountPublicIDWithStorageString:(id)a3 error:(id *)a4
{
  id v5;
  KTAccountPublicID *v6;

  v5 = a3;
  v6 = -[KTAccountPublicID initWithStorageString:error:]([KTAccountPublicID alloc], "initWithStorageString:error:", v5, a4);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v4 = a3;
  if (self->_publicIdentity)
  {
    v7 = v4;
    v5 = (void *)PCSPublicIdentityCopyPublicKeyInfo();
    v6 = CFSTR("pki");
LABEL_5:
    objc_msgSend(v7, "encodeObject:forKey:", v5, v6);

    v4 = v7;
    goto LABEL_6;
  }
  if (self->_publicID)
  {
    v7 = v4;
    -[KTAccountPublicID publicAccountIdentity](self, "publicAccountIdentity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = CFSTR("publicID");
    goto LABEL_5;
  }
LABEL_6:

}

- (KTAccountPublicID)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  KTAccountPublicID *v6;
  KTAccountPublicID *v7;
  KTAccountPublicID *v8;
  KTAccountPublicID *v9;
  id v10;
  KTAccountPublicID *v11;
  KTAccountPublicID *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  id v17;
  uint8_t buf[4];
  KTAccountPublicID *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pki"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[KTAccountPublicID initWithPublicKeyInfo:error:](self, "initWithPublicKeyInfo:error:", v5, 0);
    v7 = v6;
    if (v6)
    {
      v7 = v6;
      self = v7;
      v8 = v7;
    }
    else
    {
      if (TRANSPARENCY_DEFAULT_LOG_BLOCK_13 != -1)
        dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_13, &__block_literal_global_14);
      v13 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_13;
      if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v19 = 0;
        _os_log_impl(&dword_21A250000, v13, OS_LOG_TYPE_ERROR, "[KTAccountPublicID initWithCoder:]: pki %@", buf, 0xCu);
      }
      self = 0;
      v8 = 0;
    }
  }
  else
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("publicID"));
    v7 = (KTAccountPublicID *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v17 = 0;
      v9 = -[KTAccountPublicID initWithPublicKeyIdentity:error:](self, "initWithPublicKeyIdentity:error:", v7, &v17);
      v10 = v17;
      v11 = v9;
      self = v11;
      if (v11)
      {
        v12 = v11;
      }
      else
      {
        if (TRANSPARENCY_DEFAULT_LOG_BLOCK_13 != -1)
          dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_13, &__block_literal_global_49_0);
        v15 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_13;
        if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v19 = v7;
          v20 = 2112;
          v21 = v10;
          _os_log_impl(&dword_21A250000, v15, OS_LOG_TYPE_ERROR, "[KTAccountPublicID initWithCoder:]: publicID %@ %@", buf, 0x16u);
        }
      }

      v8 = self;
    }
    else
    {
      if (TRANSPARENCY_DEFAULT_LOG_BLOCK_13 != -1)
        dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_13, &__block_literal_global_51_0);
      v14 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_13;
      if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21A250000, v14, OS_LOG_TYPE_ERROR, "[KTAccountPublicID initWithCoder:]: unknown", buf, 2u);
      }
      v8 = 0;
    }
  }

  return v8;
}

void __35__KTAccountPublicID_initWithCoder___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_13;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_13 = (uint64_t)v0;

}

void __35__KTAccountPublicID_initWithCoder___block_invoke_48()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_13;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_13 = (uint64_t)v0;

}

void __35__KTAccountPublicID_initWithCoder___block_invoke_50()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_13;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_13 = (uint64_t)v0;

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  char v7;
  const void *v8;
  _PCSPublicIdentityData *publicIdentity;
  void *v10;
  uint64_t v11;
  void *v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = (void *)v5[2];
    if (v6 && self->_publicID)
    {
      v7 = objc_msgSend(v6, "isEqual:");
    }
    else
    {
      v8 = (const void *)v5[1];
      if (v8 && (publicIdentity = self->_publicIdentity) != 0)
      {
        v7 = CFEqual(v8, publicIdentity) != 0;
      }
      else
      {
        objc_msgSend(v5, "publicAccountIdentity");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[KTAccountPublicID publicAccountIdentity](self, "publicAccountIdentity");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v11;
        v7 = 0;
        if (v10 && v11)
          v7 = objc_msgSend(v10, "isEqual:", v11);

      }
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)dealloc
{
  _PCSPublicIdentityData *publicIdentity;
  objc_super v4;

  publicIdentity = self->_publicIdentity;
  if (publicIdentity)
  {
    CFRelease(publicIdentity);
    self->_publicIdentity = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)KTAccountPublicID;
  -[KTAccountPublicID dealloc](&v4, sel_dealloc);
}

- (NSString)publicID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPublicID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicID, 0);
}

@end
