@implementation TRISignatureKey

+ (id)keyFromData:(id)a3
{
  id v3;
  __SecKey *v4;
  NSObject *v5;
  uint8_t v7[16];

  v3 = a3;
  if (v3)
  {
    v4 = +[TRISignatureKey _keyFromCertificateChain:](TRISignatureKey, "_keyFromCertificateChain:", v3);
    if (v4)
      v4 = -[TRISignatureKey initWithKey:]([TRISignatureKey alloc], "initWithKey:", v4);
  }
  else
  {
    TRILogCategory_Server();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl(&dword_1D207F000, v5, OS_LOG_TYPE_ERROR, "TRISignatureKey: no certificate data.", v7, 2u);
    }

    v4 = 0;
  }

  return v4;
}

+ (__SecKey)_keyFromCertificateChain:(id)a3
{
  const __CFData *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFDictionary *v9;
  __SecKey *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  const __CFData *v17;
  SecCertificateRef v18;
  SecCertificateRef v19;
  void *v20;
  __SecCertificate *v21;
  OSStatus v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  const void *ApplePinned;
  OSStatus v28;
  OSStatus v29;
  NSObject *v30;
  __CFString *v31;
  NSObject *v32;
  __SecCertificate *v33;
  NSObject *v34;
  NSObject *v35;
  const __CFData *v36;
  CFErrorRef error;
  SecTrustRef trust;
  CFStringRef commonName;
  id v40;
  uint8_t buf[4];
  void *v42;
  _QWORD v43[3];
  _QWORD v44[4];

  v44[3] = *MEMORY[0x1E0C80C00];
  v3 = (const __CFData *)a3;
  if (!os_variant_allows_internal_security_policies()
    || !os_variant_has_internal_diagnostics())
  {
LABEL_7:
    v36 = v3;
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v3, 4);
    v5 = (void *)objc_opt_new();
    if (objc_msgSend(v11, "length"))
    {
      while (1)
      {
        v12 = (void *)MEMORY[0x1D8232A5C]();
        objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("\n"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setCharactersToBeSkipped:", v14);

        objc_msgSend(v13, "scanUpToString:intoString:", CFSTR("-----BEGIN CERTIFICATE-----"), 0);
        objc_msgSend(v13, "scanString:intoString:", CFSTR("-----BEGIN CERTIFICATE-----"), 0);
        v40 = 0;
        objc_msgSend(v13, "scanUpToString:intoString:", CFSTR("-----END CERTIFICATE-----"), &v40);
        v15 = v40;
        if (!v15)
        {

          objc_autoreleasePoolPop(v12);
          goto LABEL_13;
        }
        v16 = v15;
        v17 = (const __CFData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v15, 1);
        v18 = SecCertificateCreateWithData(0, v17);
        if (!v18)
          break;
        v19 = v18;
        objc_msgSend(v5, "addObject:", v18);

        objc_msgSend(v13, "scanString:intoString:", CFSTR("-----END CERTIFICATE-----"), 0);
        objc_msgSend(v13, "string");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "substringFromIndex:", objc_msgSend(v13, "scanLocation"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        objc_autoreleasePoolPop(v12);
        v11 = v4;
        if (!objc_msgSend(v4, "length"))
          goto LABEL_14;
      }
      TRILogCategory_Server();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D207F000, v25, OS_LOG_TYPE_ERROR, "TRISignatureKey: invalid certificate data in certificate chain.", buf, 2u);
      }

      objc_autoreleasePoolPop(v12);
      v10 = 0;
      v4 = v11;
      goto LABEL_26;
    }
LABEL_13:
    v4 = v11;
LABEL_14:
    if (!objc_msgSend(v5, "count"))
    {
      TRILogCategory_Server();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D207F000, v24, OS_LOG_TYPE_ERROR, "TRISignatureKey: No certificates in cert chain.", buf, 2u);
      }

      v10 = 0;
LABEL_26:
      v3 = v36;
      goto LABEL_27;
    }
    commonName = 0;
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v21 = (__SecCertificate *)objc_claimAutoreleasedReturnValue();
    v22 = SecCertificateCopyCommonName(v21, &commonName);

    if (v22)
    {
      TRILogCategory_Server();
      v23 = objc_claimAutoreleasedReturnValue();
      v3 = v36;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D207F000, v23, OS_LOG_TYPE_ERROR, "TRISignatureKey: failed to get leaf common name.", buf, 2u);
      }
      v10 = 0;
LABEL_19:

      goto LABEL_27;
    }
    v23 = commonName;
    -[__CFString isEqualToString:]((id)commonName, "isEqualToString:", CFSTR("Trial"));
    ApplePinned = (const void *)SecPolicyCreateApplePinned();
    if (!ApplePinned)
    {
      TRILogCategory_Server();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D207F000, v32, OS_LOG_TYPE_ERROR, "TRISignatureKey: failed to create security policy.", buf, 2u);
      }

      v10 = 0;
      v3 = v36;
      goto LABEL_19;
    }
    trust = 0;
    v28 = SecTrustCreateWithCertificates(v5, ApplePinned, &trust);
    if (v28)
    {
      v29 = v28;
      TRILogCategory_Server();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = (__CFString *)SecCopyErrorMessageString(v29, 0);
        *(_DWORD *)buf = 138543362;
        v42 = v31;
        _os_log_error_impl(&dword_1D207F000, v30, OS_LOG_TYPE_ERROR, "TRISignatureKey: trust creation for the certificate chain failed with error: %{public}@", buf, 0xCu);

      }
    }
    else
    {
      error = 0;
      if (SecTrustEvaluateWithError(trust, &error))
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
        v33 = (__SecCertificate *)objc_claimAutoreleasedReturnValue();
        v10 = SecCertificateCopyKey(v33);

        if (v10)
        {
LABEL_43:
          if (trust)
            CFRelease(trust);
          CFRelease(ApplePinned);
          v3 = v36;
          if (v10)
          {
            TRILogCategory_Server();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_debug_impl(&dword_1D207F000, v35, OS_LOG_TYPE_DEBUG, "TRISignatureKey: successfully created public key from the certificate chain.", buf, 2u);
            }

          }
          goto LABEL_19;
        }
        TRILogCategory_Server();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D207F000, v30, OS_LOG_TYPE_ERROR, "TRISignatureKey: failed to create public key from the certificate chain.", buf, 2u);
        }
      }
      else
      {
        v30 = error;
        TRILogCategory_Server();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v42 = v30;
          _os_log_error_impl(&dword_1D207F000, v34, OS_LOG_TYPE_ERROR, "TRISignatureKey: certificate chain validation failed with error: %{public}@.", buf, 0xCu);
        }

      }
    }

    v10 = 0;
    goto LABEL_43;
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", *MEMORY[0x1E0DC0E08]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "unsignedIntValue") != 4
    && objc_msgSend(v5, "unsignedIntValue") != 5)
  {
    goto LABEL_6;
  }
  v6 = *MEMORY[0x1E0CD6A50];
  v7 = *MEMORY[0x1E0CD69F8];
  v43[0] = *MEMORY[0x1E0CD6A38];
  v43[1] = v7;
  v8 = *MEMORY[0x1E0CD6A10];
  v44[0] = v6;
  v44[1] = v8;
  v43[2] = *MEMORY[0x1E0CD6A20];
  v44[2] = &unk_1E9363E58;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 3);
  v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v10 = SecKeyCreateWithData(v3, v9, 0);

  if (!v10)
  {
LABEL_6:

    goto LABEL_7;
  }
LABEL_27:

  return v10;
}

- (TRISignatureKey)initWithKey:(__SecKey *)a3
{
  TRISignatureKey *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TRISignatureKey;
  result = -[TRISignatureKey init](&v5, sel_init);
  if (result)
    result->_key = a3;
  return result;
}

- (void)dealloc
{
  __SecKey *key;
  objc_super v4;

  key = self->_key;
  if (key)
    CFRelease(key);
  v4.receiver = self;
  v4.super_class = (Class)TRISignatureKey;
  -[TRISignatureKey dealloc](&v4, sel_dealloc);
}

- (BOOL)validateBase64Signature:(id)a3 forFile:(id)a4
{
  uint64_t v6;
  id v7;
  void *v8;

  v6 = *MEMORY[0x1E0CD6DB0];
  v7 = a3;
  +[TRIMemoryEfficientFileDigest sha256DigestForFile:](TRIMemoryEfficientFileDigest, "sha256DigestForFile:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[TRISignatureKey _validateBase64Signature:data:algorithm:](self, "_validateBase64Signature:data:algorithm:", v7, v8, v6);

  return (char)self;
}

- (BOOL)validateBase64Signature:(id)a3 data:(id)a4
{
  return -[TRISignatureKey _validateBase64Signature:data:algorithm:](self, "_validateBase64Signature:data:algorithm:", a3, a4, *MEMORY[0x1E0CD6DF8]);
}

- (BOOL)_validateBase64Signature:(id)a3 data:(id)a4 algorithm:(__CFString *)a5
{
  id v8;
  objc_class *v9;
  id v10;
  BOOL v11;

  v8 = a4;
  if (a3)
  {
    v9 = (objc_class *)MEMORY[0x1E0C99D50];
    v10 = a3;
    a3 = (id)objc_msgSend([v9 alloc], "initWithBase64EncodedString:options:", v10, 1);

  }
  v11 = -[TRISignatureKey _validateSignature:data:algorithm:](self, "_validateSignature:data:algorithm:", a3, v8, a5);

  return v11;
}

- (BOOL)_validateSignature:(id)a3 data:(id)a4 algorithm:(__CFString *)a5
{
  const __CFData *v9;
  const __CFData *v10;
  const __CFData *v11;
  BOOL v12;
  __SecKey *key;
  int v14;
  CFErrorRef v15;
  NSObject *v16;
  NSObject *v17;
  void *v19;
  CFErrorRef error;
  uint8_t buf[4];
  CFErrorRef v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v9 = (const __CFData *)a3;
  v10 = (const __CFData *)a4;
  v11 = v10;
  v12 = 0;
  if (v9 && v10)
  {
    key = self->_key;
    if (!key)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISignatureKey.m"), 235, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_key"));

      key = self->_key;
    }
    if (SecKeyIsAlgorithmSupported(key, kSecKeyOperationTypeVerify, a5))
    {
      error = 0;
      v14 = SecKeyVerifySignature(self->_key, a5, v11, v9, &error);
      v12 = v14 != 0;
      if (!v14)
      {
        v15 = error;
        TRILogCategory_Server();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v22 = v15;
          _os_log_error_impl(&dword_1D207F000, v16, OS_LOG_TYPE_ERROR, "TRISignatureKey: signature validation failed -- %{public}@", buf, 0xCu);
        }

      }
    }
    else
    {
      TRILogCategory_Server();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D207F000, v17, OS_LOG_TYPE_ERROR, "TRISignatureKey: key/algorithm mismatch.", buf, 2u);
      }

      v12 = 0;
    }
  }

  return v12;
}

@end
