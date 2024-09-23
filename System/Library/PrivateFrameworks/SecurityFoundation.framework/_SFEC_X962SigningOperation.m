@implementation _SFEC_X962SigningOperation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SFEC_X962SigningOperation)init
{
  _SFECKeySpecifier *v3;
  _SFEC_X962SigningOperation *v4;

  v3 = -[_SFECKeySpecifier initWithCurve:]([_SFECKeySpecifier alloc], "initWithCurve:", 2);
  v4 = -[_SFEC_X962SigningOperation initWithKeySpecifier:](self, "initWithKeySpecifier:", v3);

  return v4;
}

- (_SFEC_X962SigningOperation)initWithKeySpecifier:(id)a3
{
  id v4;
  void *v5;
  _SFEC_X962SigningOperation *v6;

  v4 = a3;
  _defaultDigestOperation();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_SFEC_X962SigningOperation initWithKeySpecifier:digestOperation:](self, "initWithKeySpecifier:digestOperation:", v4, v5);

  return v6;
}

- (_SFEC_X962SigningOperation)initWithKeySpecifier:(id)a3 digestOperation:(id)a4
{
  id v6;
  id v7;
  _SFEC_X962SigningOperation *v8;
  SFEC_X962SigningOperation_Ivars *v9;
  id x962SigningOperationInternal;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)_SFEC_X962SigningOperation;
  v8 = -[_SFEC_X962SigningOperation init](&v18, sel_init);
  if (v8)
  {
    v9 = objc_alloc_init(SFEC_X962SigningOperation_Ivars);
    x962SigningOperationInternal = v8->_x962SigningOperationInternal;
    v8->_x962SigningOperationInternal = v9;

    v11 = objc_msgSend(v6, "copy");
    v12 = v8->_x962SigningOperationInternal;
    v13 = (void *)v12[1];
    v12[1] = v11;

    v14 = objc_msgSend(v7, "copyWithZone:", 0);
    v15 = v8->_x962SigningOperationInternal;
    v16 = (void *)v15[2];
    v15[2] = v14;

  }
  return v8;
}

- (_SFEC_X962SigningOperation)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_SFEC_X962SigningOperation;
  return -[_SFEC_X962SigningOperation init](&v4, sel_init, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithKeySpecifier:", *((_QWORD *)self->_x962SigningOperationInternal + 1));
}

- (id)sign:(id)a3 withKey:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  __SecKey *v10;
  const __CFString *v11;
  const __CFData *v12;
  CFDataRef v13;
  void *v14;
  _SFSignedData *v15;
  CFErrorRef error;

  v8 = a3;
  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    error = 0;
    v10 = (__SecKey *)objc_msgSend(v9, "_secKey");
    v11 = (const __CFString *)objc_msgSend(*((id *)self->_x962SigningOperationInternal + 2), "_secKeyECDSAAlgorithm");
    v12 = (const __CFData *)objc_msgSend((id)objc_opt_class(), "digest:", v8);
    v13 = SecKeyCreateSignature(v10, v11, v12, &error);
    v14 = error;
    if (error)
    {
      if (!a5)
      {
        CFRelease(error);
        v15 = 0;
        error = 0;
        goto LABEL_11;
      }
    }
    else
    {
      if (v13)
      {
        v15 = -[_SFSignedData initWithData:signature:]([_SFSignedData alloc], "initWithData:signature:", v8, v13);
        goto LABEL_11;
      }
      if (!a5)
      {
        v15 = 0;
        goto LABEL_11;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -67688, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v15 = 0;
    *a5 = v14;
LABEL_11:

    goto LABEL_12;
  }
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SFCryptoServicesErrorDomain"), 9, 0);
    v15 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
LABEL_12:

  return v15;
}

- (id)verify:(id)a3 withKey:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  __SecKey *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  const __CFData *v14;
  const __CFData *v15;
  void *v16;
  BOOL v17;
  void *v18;
  CFErrorRef error;

  v8 = a3;
  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    error = 0;
    v10 = (__SecKey *)objc_msgSend(v9, "_secKey");
    v11 = (const __CFString *)objc_msgSend(*((id *)self->_x962SigningOperationInternal + 2), "_secKeyECDSAAlgorithm");
    v12 = (void *)objc_opt_class();
    objc_msgSend(v8, "data");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (const __CFData *)objc_msgSend(v12, "digest:", v13);
    objc_msgSend(v8, "signature");
    v15 = (const __CFData *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = SecKeyVerifySignature(v10, v11, v14, v15, &error);

    v16 = error;
    if ((_DWORD)v14)
      v17 = error == 0;
    else
      v17 = 0;
    if (v17)
    {
      objc_msgSend(v8, "data");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    if (!a5)
    {
      CFRelease(error);
LABEL_11:
      v18 = 0;
      goto LABEL_13;
    }
  }
  else
  {
    if (!a5)
      goto LABEL_11;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SFCryptoServicesErrorDomain"), 9, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18 = 0;
  *a5 = v16;
LABEL_13:

  return v18;
}

- (_SFECKeySpecifier)signingKeySpecifier
{
  return (_SFECKeySpecifier *)(id)objc_msgSend(*((id *)self->_x962SigningOperationInternal + 1), "copy");
}

- (void)setSigningKeySpecifier:(id)a3
{
  uint64_t v4;
  _QWORD *x962SigningOperationInternal;
  void *v6;

  v4 = objc_msgSend(a3, "copy");
  x962SigningOperationInternal = self->_x962SigningOperationInternal;
  v6 = (void *)x962SigningOperationInternal[1];
  x962SigningOperationInternal[1] = v4;

}

- (SFDigestOperation)digestOperation
{
  return (SFDigestOperation *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDigestOperation:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digestOperation, 0);
  objc_storeStrong(&self->_x962SigningOperationInternal, 0);
}

@end
