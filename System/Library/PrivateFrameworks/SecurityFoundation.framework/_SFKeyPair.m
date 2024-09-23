@implementation _SFKeyPair

+ (Class)_attributesClass
{
  return (Class)objc_opt_class();
}

+ (id)_secKeyCreationAttributesForSpecifier:(id)a3
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass((Class)a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SFKey.m"), 819, CFSTR("subclass %@ must implement %@"), v6, v7);

  return 0;
}

- (_SFKeyPair)initWithAttributes:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_SFKeyPair;
  return -[_SFKey initWithAttributes:](&v4, sel_initWithAttributes_, a3);
}

- (_SFKeyPair)initWithData:(id)a3 specifier:(id)a4 error:(id *)a5
{
  const __CFData *v9;
  id v10;
  void *v11;
  id v12;
  const __CFDictionary *v13;
  SecKeyRef v14;
  SecKeyRef v15;
  _SFKeyPair *v16;
  _SFKeyPair *v17;
  void *v19;
  void *v20;

  v9 = (const __CFData *)a3;
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
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SFKey.m"), 835, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SFKey.m"), 836, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("specifier2"));

LABEL_3:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v11;
    v13 = (const __CFDictionary *)objc_msgSend((id)objc_opt_class(), "_secKeyCreationAttributesForSpecifier:", v12);
    v14 = SecKeyCreateWithData(v9, v13, (CFErrorRef *)a5);
    if (v14)
    {
      v15 = v14;
      v16 = -[_SFKeyPair initWithSecKey:](self, "initWithSecKey:", v14);
      CFRelease(v15);
    }
    else
    {

      v16 = 0;
    }
    self = v16;

    v17 = self;
  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SFCryptoServicesErrorDomain"), 4, 0);
    v17 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (_SFKeyPair)initWithSecKey:(__SecKey *)a3
{
  void *v5;
  void *v6;
  void *v7;
  _SFKeyPair *v8;
  SFKeyPair_Ivars *v9;
  id keyPairInternal;
  void *v13;
  objc_super v14;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SFKey.m"), 860, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("secKey"));

  }
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_attributesClass"), "alloc");
  objc_msgSend((id)objc_opt_class(), "_specifierForSecKey:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithSpecifier:", v6);
  v14.receiver = self;
  v14.super_class = (Class)_SFKeyPair;
  v8 = -[_SFKey initWithAttributes:](&v14, sel_initWithAttributes_, v7);

  if (v8)
  {
    v9 = objc_alloc_init(SFKeyPair_Ivars);
    keyPairInternal = v8->_keyPairInternal;
    v8->_keyPairInternal = v9;

    *((_QWORD *)v8->_keyPairInternal + 1) = a3;
    CFRetain(*((CFTypeRef *)v8->_keyPairInternal + 1));
  }
  return v8;
}

- (id)initRandomKeyPairWithSpecifier:(id)a3
{
  return -[_SFKeyPair initRandomKeyPairWithSpecifier:privateKeyDomain:](self, "initRandomKeyPairWithSpecifier:privateKeyDomain:", a3, CFSTR("SFKeyDomainCPU"));
}

- (id)initRandomKeyPairWithSpecifier:(id)a3 privateKeyDomain:(id)a4
{
  id v5;
  void *v6;
  _SFKeyPair *v7;

  v5 = a3;
  v6 = (void *)objc_opt_new();
  v7 = -[_SFKeyPair initWithData:specifier:error:](self, "initWithData:specifier:error:", v6, v5, 0);

  return v7;
}

- (_SFPublicKey)publicKey
{
  return 0;
}

- (NSString)privateKeyDomain
{
  return (NSString *)(id)objc_msgSend(*((id *)self->_keyPairInternal + 2), "copy");
}

- (__SecKey)_secKey
{
  return (__SecKey *)*((_QWORD *)self->_keyPairInternal + 1);
}

- (id)keyData
{
  return SecKeyCopyExternalRepresentation(*((SecKeyRef *)self->_keyPairInternal + 1), 0);
}

- (void)dealloc
{
  const void *v3;
  objc_super v4;

  v3 = (const void *)*((_QWORD *)self->_keyPairInternal + 1);
  if (v3)
  {
    CFRelease(v3);
    *((_QWORD *)self->_keyPairInternal + 1) = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)_SFKeyPair;
  -[_SFKeyPair dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_keyPairInternal, 0);
}

@end
