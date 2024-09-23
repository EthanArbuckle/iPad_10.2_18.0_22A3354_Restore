@implementation _SFECKeyPair

+ (id)_specifierForSecKey:(__SecKey *)a3
{
  return ECKeySpecifierForSecKey(a3);
}

+ (id)_secKeyCreationAttributesForSpecifier:(id)a3
{
  id v3;
  __CFDictionary *Mutable;
  const void *v5;
  void *v6;
  uint64_t v7;
  const void *v8;

  v3 = a3;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD69F8], (const void *)*MEMORY[0x1E0CD6A00]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6A38], (const void *)*MEMORY[0x1E0CD6A50]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CD6AA0], (const void *)*MEMORY[0x1E0C9AE50]);
  v5 = (const void *)*MEMORY[0x1E0CD6A20];
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = objc_msgSend(v3, "curve");

  v8 = (const void *)objc_msgSend(v6, "numberWithInteger:", ECKeyBitSize(v7));
  CFDictionaryAddValue(Mutable, v5, v8);
  return Mutable;
}

- (id)initRandomKeyPairWithSpecifier:(id)a3
{
  return -[_SFECKeyPair initRandomKeyPairWithSpecifier:privateKeyDomain:](self, "initRandomKeyPairWithSpecifier:privateKeyDomain:", a3, CFSTR("SFKeyDomainCPU"));
}

- (id)initRandomKeyPairWithSpecifier:(id)a3 privateKeyDomain:(id)a4
{
  id v7;
  id v8;
  id v9;
  __CFDictionary *Mutable;
  const void *v11;
  const void *v12;
  SecKeyRef v13;
  _SFECKeyPair *v14;
  _SFECKeyPair *v15;
  _SFECKeyPair *v16;
  void *v18;
  objc_super v19;
  CFErrorRef error;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SFKey.m"), 1066, CFSTR("specifier not set"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v7;
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CD6A38], (const void *)*MEMORY[0x1E0CD6A50]);
    v11 = (const void *)*MEMORY[0x1E0CD6A20];
    v12 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ECKeyBitSize(objc_msgSend(v9, "curve")));
    CFDictionarySetValue(Mutable, v11, v12);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CD6AA0], (const void *)*MEMORY[0x1E0C9AE50]);
    error = 0;
    v13 = SecKeyCreateRandomKey(Mutable, &error);
    v19.receiver = self;
    v19.super_class = (Class)_SFECKeyPair;
    v14 = -[_SFKeyPair initWithSecKey:](&v19, sel_initWithSecKey_, v13);
    v15 = v14;
    if (v14 && error)
    {

      CFRelease(error);
      v15 = 0;
    }
    CFRelease(Mutable);
    CFRelease(v13);
    self = v15;

    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)publicKey
{
  SecKeyRef v2;
  _SFECPublicKey *v3;

  v2 = SecKeyCopyPublicKey(-[_SFKeyPair _secKey](self, "_secKey"));
  v3 = -[_SFPublicKey initWithSecKey:]([_SFECPublicKey alloc], "initWithSecKey:", v2);
  if (v2)
    CFRelease(v2);
  return v3;
}

- (id)performWithCCKey:(id)a3
{
  void (**v4)(id, char *, uint64_t);
  void *v5;
  uint64_t v6;
  char *v7;
  CFDataRef v8;
  CFErrorRef v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  CFErrorRef error[2];

  error[1] = *(CFErrorRef *)MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, char *, uint64_t))a3;
  -[_SFKey keySpecifier](self, "keySpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CCCurveParameters(objc_msgSend(v5, "curve"));
  MEMORY[0x1E0C80A78]();
  v7 = (char *)error - v6;
  error[0] = 0;
  v8 = SecKeyCopyExternalRepresentation(*((SecKeyRef *)self->super._keyPairInternal + 1), error);
  v9 = error[0];
  if (-[__CFData length](v8, "length")
    && ccec_x963_import_priv_size()
    && (-[_SFKey keySpecifier](self, "keySpecifier"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        CCCurveParameters(objc_msgSend(v10, "curve")),
        -[__CFData length](v8, "length"),
        -[__CFData bytes](objc_retainAutorelease(v8), "bytes"),
        v11 = ccec_x963_import_priv(),
        v10,
        !v11))
  {
    v12 = 0;
  }
  else
  {
    v12 = (uint64_t)v9;
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SFKeychainErrorDomain"), 2, 0);
      v12 = objc_claimAutoreleasedReturnValue();
      v9 = (CFErrorRef)v12;
    }
  }
  v4[2](v4, v7, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_ecKeyPairInternal, 0);
}

@end
