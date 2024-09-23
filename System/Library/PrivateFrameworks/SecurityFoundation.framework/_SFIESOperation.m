@implementation _SFIESOperation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    ccrng_system_init();
}

- (_SFIESOperation)init
{
  return -[_SFIESOperation initWithCurve:](self, "initWithCurve:", 2);
}

- (_SFIESOperation)initWithCurve:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  _SFIESOperation *v8;

  +[_SFECDHOperation _defaultOperation](_SFECDHOperation, "_defaultOperation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_SFAuthenticatedEncryptionOperation _defaultEncryptionOperation](_SFAuthenticatedEncryptionOperation, "_defaultEncryptionOperation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _defaultDigestOperation();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_SFIESOperation initWithCurve:diffieHellmanOperation:encryptionOperation:digestOperation:](self, "initWithCurve:diffieHellmanOperation:encryptionOperation:digestOperation:", a3, v5, v6, v7);

  return v8;
}

- (_SFIESOperation)initWithCurve:(int64_t)a3 diffieHellmanOperation:(id)a4 encryptionOperation:(id)a5 digestOperation:(id)a6
{
  id v11;
  id v12;
  id v13;
  _SFIESOperation *v14;
  SFIESOperation_Ivars *v15;
  id iesOperationInternal;
  objc_super v18;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)_SFIESOperation;
  v14 = -[_SFIESOperation init](&v18, sel_init);
  if (v14)
  {
    v15 = objc_alloc_init(SFIESOperation_Ivars);
    iesOperationInternal = v14->_iesOperationInternal;
    v14->_iesOperationInternal = v15;

    *((_QWORD *)v14->_iesOperationInternal + 1) = a3;
    objc_storeStrong((id *)v14->_iesOperationInternal + 2, a4);
    objc_storeStrong((id *)v14->_iesOperationInternal + 3, a5);
    objc_storeStrong((id *)v14->_iesOperationInternal + 4, a6);
  }

  return v14;
}

- (_SFIESOperation)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_SFIESOperation;
  return -[_SFIESOperation init](&v4, sel_init, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCurve:diffieHellmanOperation:encryptionOperation:digestOperation:", *((_QWORD *)self->_iesOperationInternal + 1), *((_QWORD *)self->_iesOperationInternal + 2), *((_QWORD *)self->_iesOperationInternal + 3), *((_QWORD *)self->_iesOperationInternal + 4));
}

- (const)_ccDigestInfoWithError:(id *)a3
{
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_respondsToSelector() & 1) != 0)
      return (const ccdigest_info *)objc_msgSend(*((id *)self->_iesOperationInternal + 4), "_ccDigestInfo");
  }
  v6 = (void *)MEMORY[0x1E0CB35C8];
  v7 = *((_QWORD *)self->_iesOperationInternal + 4);
  v9 = CFSTR("SFCryptoServicesErrorDigest");
  v10[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("SFCryptoServicesErrorDomain"), 1, v8);
  *a3 = (id)objc_claimAutoreleasedReturnValue();

  return 0;
}

- (id)encrypt:(id)a3 withKey:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SFEncryptionOperation.m"), 1092, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("plaintext"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SFEncryptionOperation.m"), 1093, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key2"));

LABEL_3:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v11;
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__0;
    v26 = __Block_byref_object_dispose__0;
    v27 = 0;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __41___SFIESOperation_encrypt_withKey_error___block_invoke;
    v18[3] = &unk_1E6F130A0;
    v21 = &v22;
    v18[4] = self;
    v19 = v9;
    v13 = v12;
    v20 = v13;
    objc_msgSend(v13, "performWithCCKey:", v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (a5)
      *a5 = objc_retainAutorelease((id)v23[5]);

    _Block_object_dispose(&v22, 8);
  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SFCryptoServicesErrorDomain"), 9, 0);
    v14 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)decrypt:(id)a3 withKey:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SFEncryptionOperation.m"), 1152, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ciphertext2"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SFEncryptionOperation.m"), 1153, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key2"));

LABEL_3:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = v11;
      v21 = 0;
      v22 = &v21;
      v23 = 0x3032000000;
      v24 = __Block_byref_object_copy__0;
      v25 = __Block_byref_object_dispose__0;
      v26 = 0;
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __41___SFIESOperation_decrypt_withKey_error___block_invoke;
      v18[3] = &unk_1E6F130C8;
      v20 = &v21;
      v18[4] = self;
      v19 = v12;
      objc_msgSend(v13, "performWithCCKey:", v18);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (a5)
        *a5 = objc_retainAutorelease((id)v22[5]);

      _Block_object_dispose(&v21, 8);
    }
    else if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SFCryptoServicesErrorDomain"), 9, 0);
      v14 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }

  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SFCryptoServicesErrorDomain"), 9, 0);
    v14 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (_SFKeySpecifier)encryptionKeySpecifier
{
  return 0;
}

- (_SFECDHOperation)diffieHellmanOperation
{
  return (_SFECDHOperation *)(id)objc_msgSend(*((id *)self->_iesOperationInternal + 2), "copy");
}

- (void)setDiffieHellmanOperation:(id)a3
{
  uint64_t v4;
  _QWORD *iesOperationInternal;
  void *v6;

  v4 = objc_msgSend(a3, "copy");
  iesOperationInternal = self->_iesOperationInternal;
  v6 = (void *)iesOperationInternal[2];
  iesOperationInternal[2] = v4;

}

- (_SFAuthenticatedEncryptionOperation)encryptionOperation
{
  return (_SFAuthenticatedEncryptionOperation *)(id)objc_msgSend(*((id *)self->_iesOperationInternal + 3), "copy");
}

- (void)setEncryptionOperation:(id)a3
{
  uint64_t v4;
  _QWORD *iesOperationInternal;
  void *v6;

  v4 = objc_msgSend(a3, "copy");
  iesOperationInternal = self->_iesOperationInternal;
  v6 = (void *)iesOperationInternal[3];
  iesOperationInternal[3] = v4;

}

- (SFDigestOperation)digestOperation
{
  return (SFDigestOperation *)(id)objc_msgSend(*((id *)self->_iesOperationInternal + 4), "copyWithZone:", 0);
}

- (void)setDigestOperation:(id)a3
{
  uint64_t v4;
  _QWORD *iesOperationInternal;
  void *v6;

  v4 = objc_msgSend(a3, "copyWithZone:", 0);
  iesOperationInternal = self->_iesOperationInternal;
  v6 = (void *)iesOperationInternal[4];
  iesOperationInternal[4] = v4;

}

- (int64_t)curve
{
  return self->_curve;
}

- (void)setCurve:(int64_t)a3
{
  self->_curve = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_iesOperationInternal, 0);
}

@end
