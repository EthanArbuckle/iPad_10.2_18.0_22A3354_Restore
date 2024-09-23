@implementation _SFSymmetricKey

- (void).cxx_destruct
{
  objc_storeStrong(&self->_symmetricKeyInternal, 0);
}

- (id)initRandomKeyWithSpecifier:(id)a3 error:(id *)a4
{
  id v7;
  size_t v8;
  void *v9;
  _SFSymmetricKey *v10;
  id v11;
  void *v12;
  void *v14;
  _QWORD v15[5];

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SFKey.m"), 653, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("specifier"));

  }
  v8 = objc_msgSend(v7, "keyLengthInBytes");
  v9 = malloc_type_malloc(v8, 0xB75DF116uLL);
  if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E0CD7000], v8, v9))
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SFKeychainErrorDomain"), 3, 0);
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v11 = objc_alloc(MEMORY[0x1E0C99D50]);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __52___SFSymmetricKey_initRandomKeyWithSpecifier_error___block_invoke;
    v15[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
    v15[4] = v8;
    v12 = (void *)objc_msgSend(v11, "initWithBytesNoCopy:length:deallocator:", v9, v8, v15);
    self = -[_SFSymmetricKey initWithData:specifier:error:](self, "initWithData:specifier:error:", v12, v7, a4);

    v10 = self;
  }

  return v10;
}

- (_SFSymmetricKey)initWithData:(id)a3 specifier:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  _SFSymmetricKey *v15;
  SFSymmetricKey_Ivars *v16;
  id symmetricKeyInternal;
  size_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  _QWORD *v22;
  void *v23;
  _SFSymmetricKey *v24;
  void *v26;
  void *v27;
  _QWORD v28[5];
  objc_super v29;

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
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SFKey.m"), 673, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SFKey.m"), 674, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keySpecifier2"));

LABEL_3:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v11;
    v13 = objc_msgSend(v9, "length");
    if (v13 == objc_msgSend(v12, "keyLengthInBytes"))
    {
      v14 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_attributesClass"), "alloc"), "initWithSpecifier:", v12);
      v29.receiver = self;
      v29.super_class = (Class)_SFSymmetricKey;
      v15 = -[_SFKey initWithAttributes:](&v29, sel_initWithAttributes_, v14);

      if (v15)
      {
        v16 = objc_alloc_init(SFSymmetricKey_Ivars);
        symmetricKeyInternal = v15->_symmetricKeyInternal;
        v15->_symmetricKeyInternal = v16;

        v18 = objc_msgSend(v9, "length");
        v19 = malloc_type_malloc(v18, 0x7110AB8AuLL);
        memcpy(v19, (const void *)objc_msgSend(objc_retainAutorelease(v9), "bytes"), v18);
        v20 = objc_alloc(MEMORY[0x1E0C99D50]);
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __48___SFSymmetricKey_initWithData_specifier_error___block_invoke;
        v28[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
        v28[4] = v18;
        v21 = objc_msgSend(v20, "initWithBytesNoCopy:length:deallocator:", v19, v18, v28);
        v22 = v15->_symmetricKeyInternal;
        v23 = (void *)v22[1];
        v22[1] = v21;

      }
      self = v15;
      v24 = self;
    }
    else if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SFKeychainErrorDomain"), 2, 0);
      v24 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = 0;
    }

  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SFCryptoServicesErrorDomain"), 4, 0);
    v24 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)keyData
{
  return *((id *)self->_symmetricKeyInternal + 1);
}

+ (Class)_attributesClass
{
  return (Class)objc_opt_class();
}

@end
