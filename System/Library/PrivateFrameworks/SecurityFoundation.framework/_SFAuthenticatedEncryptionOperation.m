@implementation _SFAuthenticatedEncryptionOperation

- (id)encrypt:(id)a3 withKey:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  SFIncrementingIVGenerator *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(SFIncrementingIVGenerator);
  -[_SFAuthenticatedEncryptionOperation encrypt:withKey:additionalAuthenticatedData:ivGenerator:error:](self, "encrypt:withKey:additionalAuthenticatedData:ivGenerator:error:", v9, v8, 0, v10, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)encrypt:(id)a3 withKey:(id)a4 additionalAuthenticatedData:(id)a5 ivGenerator:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  size_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  _SFAuthenticatedCiphertext *v26;
  id v27;
  void *v28;
  void *v29;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SFEncryptionOperation.m"), 687, CFSTR("currently only AES keys are supported for SFAuthenticatedEncryptionOperation"));

  }
  objc_msgSend(v14, "keyData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "generateIVWithLength:error:", objc_msgSend(v17, "length"), a7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    if (!a7)
    {
      v26 = 0;
      goto LABEL_14;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SFCryptoServicesErrorDomain"), 4, 0);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    goto LABEL_12;
  }
  v36 = v14;
  v19 = objc_msgSend(v13, "length");
  v20 = v18;
  v33 = malloc_type_malloc(v19, 0x32864A5uLL);
  v21 = malloc_type_malloc(*((_QWORD *)self->_authenticatedEncryptionOperationInternal + 3), 0xBAC2913CuLL);
  v38 = *((_QWORD *)self->_authenticatedEncryptionOperationInternal + 3);
  objc_msgSend(objc_retainAutorelease(v17), "bytes");
  v34 = v20;
  v22 = objc_retainAutorelease(v20);
  objc_msgSend(v22, "bytes");
  objc_msgSend(v22, "length");
  v35 = v15;
  v23 = objc_retainAutorelease(v15);
  objc_msgSend(v23, "bytes");
  objc_msgSend(v23, "length");
  v37 = v13;
  v24 = v13;
  v25 = v33;
  v32 = objc_msgSend(objc_retainAutorelease(v24), "bytes");
  if (CCCryptorGCM())
  {
    v26 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v33, v19, v32, v19, v33, v21, &v38);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v21, v38);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[_SFAuthenticatedCiphertext initWithCiphertext:authenticationCode:initializationVector:]([_SFAuthenticatedCiphertext alloc], "initWithCiphertext:authenticationCode:initializationVector:", v28, v29, v22);

    v25 = v33;
  }
  free(v25);
  free(v21);
  v14 = v36;
  v13 = v37;
  v15 = v35;
  v18 = v34;
  if (a7 && !v26)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SFCryptoServicesErrorDomain"), 2, 0);
    v27 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
    *a7 = v27;
  }
LABEL_14:

  return v26;
}

- (id)decrypt:(id)a3 withKey:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a3;
  v9 = a4;
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[_SFAuthenticatedEncryptionOperation decrypt:withKey:additionalAuthenticatedData:error:](self, "decrypt:withKey:additionalAuthenticatedData:error:", v8, v9, 0, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SFCryptoServicesErrorDomain"), 9, 0);
    v10 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)decrypt:(id)a3 withKey:(id)a4 additionalAuthenticatedData:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  size_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  size_t v31;
  void *v32;
  id *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  const void *v38;
  int v39;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  id *v47;
  void *v48;
  void *v49;
  size_t v50;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SFEncryptionOperation.m"), 739, CFSTR("currently only AES keys are supported for SFAuthenticatedEncryptionOperation"));

  }
  v14 = v12;
  objc_msgSend(v11, "authenticationCode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "length");
  v17 = *((_QWORD *)self->_authenticatedEncryptionOperationInternal + 3);

  if (v16 == v17)
  {
    v47 = a6;
    objc_msgSend(v14, "keyData");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "length");
    objc_msgSend(v11, "initializationVector");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "ciphertext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v13;
    v22 = objc_msgSend(v20, "length");

    v23 = malloc_type_malloc(v22, 0x4A690FF5uLL);
    v24 = v11;
    v25 = malloc_type_malloc(*((_QWORD *)self->_authenticatedEncryptionOperationInternal + 3), 0x9E786422uLL);
    v50 = *((_QWORD *)self->_authenticatedEncryptionOperationInternal + 3);
    v46 = objc_retainAutorelease(v18);
    objc_msgSend(v46, "bytes");
    v26 = objc_retainAutorelease(v19);
    objc_msgSend(v26, "bytes");
    v45 = v26;
    objc_msgSend(v26, "length");
    v48 = v21;
    v27 = objc_retainAutorelease(v21);
    objc_msgSend(v27, "bytes");
    objc_msgSend(v27, "length");
    v49 = v24;
    objc_msgSend(v24, "ciphertext");
    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v44 = v25;
    v29 = v25;
    v30 = v23;
    v43 = v23;
    v31 = v22;
    v42 = objc_msgSend(v28, "bytes");
    LODWORD(v19) = CCCryptorGCM();

    if ((_DWORD)v19)
    {
      v32 = 0;
      v33 = v47;
      v13 = v48;
      v34 = v30;
      v36 = v45;
      v35 = v46;
      v11 = v49;
    }
    else
    {
      v11 = v49;
      objc_msgSend(v49, "authenticationCode", v42, v22, v43, v44, &v50);
      v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v38 = (const void *)objc_msgSend(v37, "bytes");
      v39 = timingsafe_bcmp(v29, v38, v50);

      if (v39)
      {
        v32 = 0;
        v33 = v47;
        v13 = v48;
        v35 = v46;
        v34 = v30;
      }
      else
      {
        v34 = v30;
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v30, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v47;
        v13 = v48;
        v35 = v46;
      }
      v36 = v45;
    }
    free(v34);
    free(v29);
    if (v33 && !v32)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SFCryptoServicesErrorDomain"), 3, 0);
      *v33 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else if (a6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SFCryptoServicesErrorDomain"), 5, 0);
    v32 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v32 = 0;
  }

  return v32;
}

+ (int64_t)_defaultAuthenticationMode
{
  return 1;
}

+ (id)_defaultEncryptionOperation
{
  return objc_alloc_init((Class)objc_opt_class());
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SFAuthenticatedEncryptionOperation)init
{
  _SFAESKeySpecifier *v3;
  _SFAuthenticatedEncryptionOperation *v4;

  v3 = -[_SFAESKeySpecifier initWithBitSize:]([_SFAESKeySpecifier alloc], "initWithBitSize:", 2);
  v4 = -[_SFAuthenticatedEncryptionOperation initWithKeySpecifier:](self, "initWithKeySpecifier:", v3);

  return v4;
}

- (_SFAuthenticatedEncryptionOperation)initWithKeySpecifier:(id)a3
{
  id v4;
  _SFAuthenticatedEncryptionOperation *v5;

  v4 = a3;
  v5 = -[_SFAuthenticatedEncryptionOperation initWithKeySpecifier:authenticationMode:](self, "initWithKeySpecifier:authenticationMode:", v4, objc_msgSend((id)objc_opt_class(), "_defaultAuthenticationMode"));

  return v5;
}

- (_SFAuthenticatedEncryptionOperation)initWithKeySpecifier:(id)a3 authenticationMode:(int64_t)a4
{
  id v8;
  _SFAuthenticatedEncryptionOperation *v9;
  SFAuthenticatedEncryptionOperation_Ivars *v10;
  id authenticatedEncryptionOperationInternal;
  void *v13;
  void *v14;
  objc_super v15;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SFEncryptionOperation.m"), 636, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keySpecifier"));

  }
  if (a4 != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SFEncryptionOperation.m"), 637, CFSTR("unsupported authentication mode - at present only SFAuthenticatedEncryptionModeGCM is supported"));

  }
  v15.receiver = self;
  v15.super_class = (Class)_SFAuthenticatedEncryptionOperation;
  v9 = -[_SFAuthenticatedEncryptionOperation init](&v15, sel_init);
  if (v9)
  {
    v10 = objc_alloc_init(SFAuthenticatedEncryptionOperation_Ivars);
    authenticatedEncryptionOperationInternal = v9->_authenticatedEncryptionOperationInternal;
    v9->_authenticatedEncryptionOperationInternal = v10;

    objc_storeStrong((id *)v9->_authenticatedEncryptionOperationInternal + 1, a3);
    *((_QWORD *)v9->_authenticatedEncryptionOperationInternal + 2) = a4;
    *((_QWORD *)v9->_authenticatedEncryptionOperationInternal + 3) = objc_msgSend(v8, "blockSize");
  }

  return v9;
}

- (_SFAuthenticatedEncryptionOperation)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_SFAuthenticatedEncryptionOperation;
  return -[_SFAuthenticatedEncryptionOperation init](&v4, sel_init, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithKeySpecifier:authenticationMode:", *((_QWORD *)self->_authenticatedEncryptionOperationInternal + 1), *((_QWORD *)self->_authenticatedEncryptionOperationInternal + 2));
  *(_QWORD *)(*((_QWORD *)result + 1) + 24) = *((_QWORD *)self->_authenticatedEncryptionOperationInternal + 3);
  return result;
}

- (id)encrypt:(id)a3 withKey:(id)a4 additionalAuthenticatedData:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  SFIncrementingIVGenerator *v13;
  void *v14;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = objc_alloc_init(SFIncrementingIVGenerator);
  -[_SFAuthenticatedEncryptionOperation encrypt:withKey:additionalAuthenticatedData:ivGenerator:error:](self, "encrypt:withKey:additionalAuthenticatedData:ivGenerator:error:", v12, v11, v10, v13, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)encrypt:(id)a3 withKey:(id)a4 ivGenerator:(id)a5 error:(id *)a6
{
  return -[_SFAuthenticatedEncryptionOperation encrypt:withKey:additionalAuthenticatedData:ivGenerator:error:](self, "encrypt:withKey:additionalAuthenticatedData:ivGenerator:error:", a3, a4, 0, a5, a6);
}

- (_SFAESKeySpecifier)encryptionKeySpecifier
{
  return (_SFAESKeySpecifier *)objc_retainAutoreleaseReturnValue(*((id *)self->_authenticatedEncryptionOperationInternal
                                                                 + 1));
}

- (void)setEncryptionKeySpecifier:(id)a3
{
  uint64_t v4;
  _QWORD *authenticatedEncryptionOperationInternal;
  void *v6;

  v4 = objc_msgSend(a3, "copy");
  authenticatedEncryptionOperationInternal = self->_authenticatedEncryptionOperationInternal;
  v6 = (void *)authenticatedEncryptionOperationInternal[1];
  authenticatedEncryptionOperationInternal[1] = v4;

}

- (int64_t)authenticationMode
{
  return *((_QWORD *)self->_authenticatedEncryptionOperationInternal + 2);
}

- (void)setAuthenticationMode:(int64_t)a3
{
  void *v6;

  if (a3 != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SFEncryptionOperation.m"), 793, CFSTR("unsupported authentication mode - at present only SFAuthenticatedEncryptionModeGCM is supported"));

  }
  *((_QWORD *)self->_authenticatedEncryptionOperationInternal + 2) = a3;
}

- (int64_t)authenticationCodeLength
{
  return *((_QWORD *)self->_authenticatedEncryptionOperationInternal + 3);
}

- (void)setAuthenticationCodeLength:(int64_t)a3
{
  *((_QWORD *)self->_authenticatedEncryptionOperationInternal + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_authenticatedEncryptionOperationInternal, 0);
}

@end
