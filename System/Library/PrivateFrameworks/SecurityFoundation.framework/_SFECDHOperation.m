@implementation _SFECDHOperation

+ (int64_t)keySource
{
  return 1;
}

+ (int64_t)_defaultMode
{
  return 0;
}

+ (id)_defaultOperation
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithMode:", objc_msgSend(a1, "_defaultMode"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SFECDHOperation)init
{
  return -[_SFECDHOperation initWithMode:](self, "initWithMode:", objc_msgSend((id)objc_opt_class(), "_defaultMode"));
}

- (_SFECDHOperation)initWithMode:(int64_t)a3
{
  _SFECDHOperation *v4;
  SFECDHOperation_Ivars *v5;
  id ecdhOperationInternal;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_SFECDHOperation;
  v4 = -[_SFECDHOperation init](&v8, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(SFECDHOperation_Ivars);
    ecdhOperationInternal = v4->_ecdhOperationInternal;
    v4->_ecdhOperationInternal = v5;

    *((_QWORD *)v4->_ecdhOperationInternal + 1) = a3;
  }
  return v4;
}

- (_SFECDHOperation)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_SFECDHOperation;
  return -[_SFECDHOperation init](&v4, sel_init, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMode:", *((_QWORD *)self->_ecdhOperationInternal + 1));
}

- (id)deriveKeyWithSpecifier:(id)a3 fromKeySource:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  const __CFString **v12;
  const __CFString *v13;
  void *v14;
  const __CFDictionary *v15;
  void *v16;
  __SecKey *v17;
  void *v18;
  CFDataRef v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v9;
    v11 = objc_msgSend(v8, "keyLengthInBytes");
    if (*((_QWORD *)self->_ecdhOperationInternal + 1))
      v12 = (const __CFString **)MEMORY[0x1E0CD6D70];
    else
      v12 = (const __CFString **)MEMORY[0x1E0CD6D78];
    v13 = *v12;
    v24 = *MEMORY[0x1E0CD6EF8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "localKeyPair");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (__SecKey *)objc_msgSend(v16, "_secKey");
    objc_msgSend(v10, "remotePublicKey");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = SecKeyCopyKeyExchangeResult(v17, v13, (SecKeyRef)objc_msgSend(v18, "_secKey"), v15, (CFErrorRef *)a5);

    if (-[__CFData length](v19, "length") >= v11)
    {
      v21 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "keyClass"));
      -[__CFData subdataWithRange:](v19, "subdataWithRange:", 0, v11);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v21, "initWithData:specifier:error:", v22, v8, a5);

    }
    else
    {
      v20 = 0;
    }

  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SFCryptoServicesErrorDomain"), 4, 0);
    v20 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (int64_t)mode
{
  return *((_QWORD *)self->_ecdhOperationInternal + 1);
}

- (void)setMode:(int64_t)a3
{
  *((_QWORD *)self->_ecdhOperationInternal + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_ecdhOperationInternal, 0);
}

@end
