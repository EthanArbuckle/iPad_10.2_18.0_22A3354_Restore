@implementation _SFECPublicKey

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
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD69F8], (const void *)*MEMORY[0x1E0CD6A10]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6A38], (const void *)*MEMORY[0x1E0CD6A50]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CD6AA0], (const void *)*MEMORY[0x1E0C9AE50]);
  v5 = (const void *)*MEMORY[0x1E0CD6A20];
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = objc_msgSend(v3, "curve");

  v8 = (const void *)objc_msgSend(v6, "numberWithInteger:", ECKeyBitSize(v7));
  CFDictionaryAddValue(Mutable, v5, v8);
  return Mutable;
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
  v8 = SecKeyCopyExternalRepresentation(*((SecKeyRef *)self->super._publicKeyInternal + 1), error);
  v9 = error[0];
  if (-[__CFData length](v8, "length")
    && ccec_x963_import_pub_size()
    && (-[_SFKey keySpecifier](self, "keySpecifier"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        CCCurveParameters(objc_msgSend(v10, "curve")),
        -[__CFData length](v8, "length"),
        -[__CFData bytes](objc_retainAutorelease(v8), "bytes"),
        v11 = ccec_x963_import_pub(),
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

- (id)encodeSubjectPublicKeyInfo
{
  -[_SFPublicKey _secKey](self, "_secKey");
  return (id)SecKeyCopySubjectPublicKeyInfo();
}

+ (id)keyWithSubjectPublicKeyInfo:(id)a3
{
  uint64_t v3;
  const void *v4;
  _SFECPublicKey *v5;

  v3 = SecKeyCreateFromSubjectPublicKeyInfoData();
  if (v3)
  {
    v4 = (const void *)v3;
    v5 = -[_SFPublicKey initWithSecKey:]([_SFECPublicKey alloc], "initWithSecKey:", v3);
    CFRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_ecPublicKeyInternal, 0);
}

@end
