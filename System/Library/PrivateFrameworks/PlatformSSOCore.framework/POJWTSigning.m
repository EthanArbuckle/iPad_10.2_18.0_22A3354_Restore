@implementation POJWTSigning

- (POJWTSigning)initWithSecKeyAlgorithm:(__CFString *)a3 algorithmName:(id)a4 alg:(id)a5
{
  id v9;
  id v10;
  POJWTSigning *v11;
  POJWTSigning *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)POJWTSigning;
  v11 = -[POJWTSigning init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_algorithm = a3;
    objc_storeStrong((id *)&v11->_algorithmName, a4);
    objc_storeStrong((id *)&v12->_alg, a5);
  }

  return v12;
}

+ (id)algorithmWithIdentifier:(id)a3
{
  id v3;
  POJWTSigning *v4;
  uint64_t v5;
  const __CFString *v6;
  const __CFString *v7;
  _TtC15PlatformSSOCore30POCryptoKitAlgorithmCurve25519 *v8;
  _TtC15PlatformSSOCore30POCryptoKitAlgorithmCurve25519 *v9;

  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("ES256")))
  {
    v4 = [POJWTSigning alloc];
    v5 = *MEMORY[0x24BDE92B0];
    v6 = CFSTR("kSecKeyAlgorithmECDSASignatureMessageRFC4754SHA256");
    v7 = CFSTR("ES256");
LABEL_13:
    v8 = -[POJWTSigning initWithSecKeyAlgorithm:algorithmName:alg:](v4, "initWithSecKeyAlgorithm:algorithmName:alg:", v5, v6, v7);
    goto LABEL_14;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("ES384")))
  {
    v4 = [POJWTSigning alloc];
    v5 = *MEMORY[0x24BDE92B8];
    v6 = CFSTR("kSecKeyAlgorithmECDSASignatureMessageRFC4754SHA384");
    v7 = CFSTR("ES384");
    goto LABEL_13;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("ES512")))
  {
    v4 = [POJWTSigning alloc];
    v5 = *MEMORY[0x24BDE92C0];
    v6 = CFSTR("kSecKeyAlgorithmECDSASignatureMessageRFC4754SHA512");
    v7 = CFSTR("ES512");
    goto LABEL_13;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("RS256")))
  {
    v4 = [POJWTSigning alloc];
    v5 = *MEMORY[0x24BDE9350];
    v6 = CFSTR("kSecKeyAlgorithmRSASignatureMessagePKCS1v15SHA256");
    v7 = CFSTR("RS256");
    goto LABEL_13;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("RS384")))
  {
    v4 = [POJWTSigning alloc];
    v5 = *MEMORY[0x24BDE9358];
    v6 = CFSTR("kSecKeyAlgorithmRSASignatureMessagePKCS1v15SHA384");
    v7 = CFSTR("RS384");
    goto LABEL_13;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("RS512")))
  {
    v4 = [POJWTSigning alloc];
    v5 = *MEMORY[0x24BDE9360];
    v6 = CFSTR("kSecKeyAlgorithmRSASignatureMessagePKCS1v15SHA512");
    v7 = CFSTR("RS512");
    goto LABEL_13;
  }
  if (!objc_msgSend(v3, "isEqualToString:", CFSTR("EdDSA")))
  {
    v9 = 0;
    goto LABEL_15;
  }
  v8 = objc_alloc_init(_TtC15PlatformSSOCore30POCryptoKitAlgorithmCurve25519);
LABEL_14:
  v9 = v8;
LABEL_15:

  return v9;
}

+ (id)algorithmWithSigningAlgorithm:(id)a3
{
  id v3;
  POJWTSigning *v4;
  uint64_t v5;
  const __CFString *v6;
  const __CFString *v7;
  _TtC15PlatformSSOCore30POCryptoKitAlgorithmCurve25519 *v8;
  _TtC15PlatformSSOCore30POCryptoKitAlgorithmCurve25519 *v9;

  v3 = a3;
  if (objc_msgSend(v3, "isEqualToNumber:", 0x251520F48))
  {
    v4 = [POJWTSigning alloc];
    v5 = *MEMORY[0x24BDE92B0];
    v6 = CFSTR("kSecKeyAlgorithmECDSASignatureMessageRFC4754SHA256");
    v7 = CFSTR("ES256");
LABEL_5:
    v8 = -[POJWTSigning initWithSecKeyAlgorithm:algorithmName:alg:](v4, "initWithSecKeyAlgorithm:algorithmName:alg:", v5, v6, v7);
    goto LABEL_6;
  }
  if (objc_msgSend(v3, "isEqualToNumber:", 0x251520F60))
  {
    v4 = [POJWTSigning alloc];
    v5 = *MEMORY[0x24BDE92B8];
    v6 = CFSTR("kSecKeyAlgorithmECDSASignatureMessageRFC4754SHA384");
    v7 = CFSTR("ES384");
    goto LABEL_5;
  }
  if (!objc_msgSend(v3, "isEqualToNumber:", 0x251520F78))
  {
    v9 = 0;
    goto LABEL_7;
  }
  v8 = objc_alloc_init(_TtC15PlatformSSOCore30POCryptoKitAlgorithmCurve25519);
LABEL_6:
  v9 = v8;
LABEL_7:

  return v9;
}

+ (BOOL)verifyJWTSignature:(id)a3 algorithm:(id)a4 key:(__SecKey *)a5
{
  id v7;
  void *v8;
  void *v9;
  char v10;
  id v11;

  v7 = a3;
  +[POJWTSigning algorithmWithIdentifier:](POJWTSigning, "algorithmWithIdentifier:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = objc_msgSend(v8, "verifyJWTSignature:key:", v7, a5);
  }
  else
  {
    v11 = __49__POJWTSigning_verifyJWTSignature_algorithm_key___block_invoke();
    v10 = 0;
  }

  return v10;
}

id __49__POJWTSigning_verifyJWTSignature_algorithm_key___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Algorithm not found when verifying JWT."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POJWTSigning();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

+ (BOOL)verifyJWTSignature:(id)a3 signingAlgorithm:(id)a4 key:(__SecKey *)a5
{
  id v7;
  void *v8;
  void *v9;
  char v10;
  id v11;

  v7 = a3;
  +[POJWTSigning algorithmWithSigningAlgorithm:](POJWTSigning, "algorithmWithSigningAlgorithm:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = objc_msgSend(v8, "verifyJWTSignature:key:", v7, a5);
  }
  else
  {
    v11 = __49__POJWTSigning_verifyJWTSignature_algorithm_key___block_invoke();
    v10 = 0;
  }

  return v10;
}

- (BOOL)verifyJWTSignature:(id)a3 key:(__SecKey *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  id v16;

  v6 = a3;
  v7 = objc_alloc(MEMORY[0x24BDBCE50]);
  objc_msgSend(v6, "rawSignature");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "psso_initWithBase64URLEncodedString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v6, "rawHeader");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rawBody");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@.%@"), v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dataUsingEncoding:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = -[POJWTSigning verifySignature:onData:usingKey:](self, "verifySignature:onData:usingKey:", v9, v14, a4);
  }
  else
  {
    v16 = __39__POJWTSigning_verifyJWTSignature_key___block_invoke();
    v15 = 0;
  }

  return v15;
}

id __39__POJWTSigning_verifyJWTSignature_key___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Failed to decode signature."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POJWTSigning();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

+ (id)encodeAndSignJWT:(id)a3 algorithm:(id)a4 key:(__SecKey *)a5 certificate:(__SecCertificate *)a6
{
  return (id)objc_msgSend(a1, "encodeAndSignJWT:algorithm:key:certificate:error:", a3, a4, a5, a6, 0);
}

+ (id)encodeAndSignJWT:(id)a3 algorithm:(id)a4 key:(__SecKey *)a5 certificate:(__SecCertificate *)a6 error:(id *)a7
{
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v11 = a3;
  +[POJWTSigning algorithmWithIdentifier:](POJWTSigning, "algorithmWithIdentifier:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "encodeAndSignJWT:key:certificate:error:", v11, a5, a6, a7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = __65__POJWTSigning_encodeAndSignJWT_algorithm_key_certificate_error___block_invoke();
    v14 = 0;
  }

  return v14;
}

id __65__POJWTSigning_encodeAndSignJWT_algorithm_key_certificate_error___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Algorithm not found when signing JWT."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POJWTSigning();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

+ (id)encodeAndSignJWT:(id)a3 signingAlgorithm:(id)a4 key:(__SecKey *)a5 certificate:(__SecCertificate *)a6
{
  return (id)objc_msgSend(a1, "encodeAndSignJWT:signingAlgorithm:key:certificate:error:", a3, a4, a5, a6, 0);
}

+ (id)encodeAndSignJWT:(id)a3 signingAlgorithm:(id)a4 key:(__SecKey *)a5 certificate:(__SecCertificate *)a6 error:(id *)a7
{
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v11 = a3;
  +[POJWTSigning algorithmWithSigningAlgorithm:](POJWTSigning, "algorithmWithSigningAlgorithm:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "encodeAndSignJWT:key:certificate:error:", v11, a5, a6, a7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = __65__POJWTSigning_encodeAndSignJWT_algorithm_key_certificate_error___block_invoke();
    v14 = 0;
  }

  return v14;
}

- (id)encodeAndSignJWT:(id)a3 key:(__SecKey *)a4 certificate:(__SecCertificate *)a5 error:(id *)a6
{
  id v10;
  void *v11;
  POMutableJWTHeader *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  SecKeyRef v18;
  __SecKey *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  CFDataRef v24;
  void *v25;
  void *v26;
  void *v27;
  CFDataRef v28;
  CFDataRef v29;
  uint64_t v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  const __CFAllocator *v41;
  const __CFString *v42;
  const __CFAllocator *v43;
  CFDataRef ExternalRepresentation;
  void *v45;
  void *v46;
  const __CFAllocator *v47;
  __CFString *v48;
  void *v49;
  _QWORD v51[2];

  v51[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  objc_msgSend(v10, "header");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v12 = objc_alloc_init(POMutableJWTHeader);
    objc_msgSend(v10, "setHeader:", v12);

  }
  -[POJWTSigning alg](self, "alg");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "header");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAlg:", v13);

  objc_msgSend(v10, "header");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "typ");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    objc_msgSend(v10, "header");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTyp:", CFSTR("JWT"));

  }
  v18 = SecKeyCopyPublicKey(a4);
  if (v18)
  {
    v19 = v18;
    objc_msgSend(v10, "header");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "kid");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "length");

    if (v22)
    {
      if (!a5)
        goto LABEL_15;
    }
    else
    {
      v24 = SecKeyCopyExternalRepresentation(v19, 0);
      -[__CFData psso_sha256Hash](v24, "psso_sha256Hash");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "base64EncodedStringWithOptions:", 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "header");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setKid:", v26);

      if (!a5)
      {
LABEL_15:
        CFRelease(v19);
        objc_msgSend(v10, "header");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "dataRepresentation");
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v36, "psso_base64URLEncodedString");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "body");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "dataRepresentation");
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v39, "psso_base64URLEncodedString");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = (const __CFAllocator *)SecCFAllocatorZeroize();
        v42 = CFStringCreateWithFormat(v41, 0, CFSTR("%@.%@"), v37, v40);
        v43 = (const __CFAllocator *)SecCFAllocatorZeroize();
        ExternalRepresentation = CFStringCreateExternalRepresentation(v43, v42, 0x8000100u, 0);
        if (v42)
          CFRelease(v42);
        -[POJWTSigning signData:usingKey:error:](self, "signData:usingKey:error:", ExternalRepresentation, a4, a6);
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v45, "length"))
        {
          objc_msgSend(v45, "psso_base64URLEncodedString");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = (const __CFAllocator *)SecCFAllocatorZeroize();
          v48 = (__CFString *)CFStringCreateWithFormat(v47, 0, CFSTR("%@.%@.%@"), v37, v40, v46);

        }
        else
        {
          v48 = 0;
        }

        goto LABEL_25;
      }
    }
    v28 = SecCertificateCopyData(a5);
    if (v28)
    {
      v29 = v28;
      -[__CFData base64EncodedStringWithOptions:](v28, "base64EncodedStringWithOptions:", 0);
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = (void *)v30;
      v32 = &stru_251503878;
      if (v30)
        v32 = (const __CFString *)v30;
      v51[0] = v32;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v51, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "header");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setX5c:", v33);

      goto LABEL_15;
    }
    __55__POJWTSigning_encodeAndSignJWT_key_certificate_error___block_invoke_48();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __55__POJWTSigning_encodeAndSignJWT_key_certificate_error___block_invoke();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v49 = v23;
  if (a6)
    *a6 = objc_retainAutorelease(v23);

  v48 = 0;
LABEL_25:

  return v48;
}

id __55__POJWTSigning_encodeAndSignJWT_key_certificate_error___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Failed to copy public key when signing JWT."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POJWTSigning();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __55__POJWTSigning_encodeAndSignJWT_key_certificate_error___block_invoke_48()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1004, CFSTR("Failed to extract certificate data when signing JWT."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POJWTSigning();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

- (id)signData:(id)a3 usingKey:(__SecKey *)a4 error:(id *)a5
{
  const __CFData *v8;
  CFDataRef Signature;
  void *v10;
  void *v11;
  void *v12;
  const __CFData *v13;
  void *v14;
  _QWORD v16[6];
  _QWORD v17[6];
  CFErrorRef error[11];

  v8 = (const __CFData *)a3;
  if (SecKeyIsAlgorithmSupported(a4, kSecKeyOperationTypeSign, -[POJWTSigning algorithm](self, "algorithm")))
  {
    if (-[__CFData length](v8, "length"))
    {
      error[0] = 0;
      Signature = SecKeyCreateSignature(a4, -[POJWTSigning algorithm](self, "algorithm"), v8, error);
      if (error[0])
      {
        if (CFErrorGetCode(error[0]) == -3)
        {
          v17[0] = MEMORY[0x24BDAC760];
          v17[1] = 3221225472;
          v17[2] = __40__POJWTSigning_signData_usingKey_error___block_invoke_62;
          v17[3] = &unk_2514FFFC8;
          v17[4] = self;
          v17[5] = error[0];
          __40__POJWTSigning_signData_usingKey_error___block_invoke_62((uint64_t)v17);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v16[0] = MEMORY[0x24BDAC760];
          v16[1] = 3221225472;
          v16[2] = __40__POJWTSigning_signData_usingKey_error___block_invoke_65;
          v16[3] = &unk_2514FFFC8;
          v16[4] = self;
          v16[5] = error[0];
          __40__POJWTSigning_signData_usingKey_error___block_invoke_65((uint64_t)v16);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v14 = v10;
        if (a5)
          *a5 = objc_retainAutorelease(v10);

        v13 = 0;
      }
      else
      {
        v13 = Signature;
      }

      goto LABEL_17;
    }
    error[1] = (CFErrorRef)MEMORY[0x24BDAC760];
    error[2] = (CFErrorRef)3221225472;
    error[3] = (CFErrorRef)__40__POJWTSigning_signData_usingKey_error___block_invoke_59;
    error[4] = (CFErrorRef)&unk_2514FF9D0;
    error[5] = (CFErrorRef)self;
    __40__POJWTSigning_signData_usingKey_error___block_invoke_59();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    error[6] = (CFErrorRef)MEMORY[0x24BDAC760];
    error[7] = (CFErrorRef)3221225472;
    error[8] = (CFErrorRef)__40__POJWTSigning_signData_usingKey_error___block_invoke;
    error[9] = (CFErrorRef)&unk_2514FF9D0;
    error[10] = (CFErrorRef)self;
    __40__POJWTSigning_signData_usingKey_error___block_invoke();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;
  if (a5)
    *a5 = objc_retainAutorelease(v11);

  v13 = 0;
LABEL_17:

  return v13;
}

id __40__POJWTSigning_signData_usingKey_error___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Signing algorithm not supported"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POJWTSigning();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POJWTSigning_signData_usingKey_error___block_invoke_cold_1();

  return v0;
}

id __40__POJWTSigning_signData_usingKey_error___block_invoke_59()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1005, CFSTR("No data to sign."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POJWTSigning();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POJWTSigning_signData_usingKey_error___block_invoke_cold_1();

  return v0;
}

id __40__POJWTSigning_signData_usingKey_error___block_invoke_62(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *v3;

  v1 = *(void **)(a1 + 40);
  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1010, v1, CFSTR("Key error creating signature"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  PO_LOG_POJWTSigning();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __40__POJWTSigning_signData_usingKey_error___block_invoke_cold_1();

  return v2;
}

id __40__POJWTSigning_signData_usingKey_error___block_invoke_65(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *v3;

  v1 = *(void **)(a1 + 40);
  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, v1, CFSTR("Error creating signature"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  PO_LOG_POJWTSigning();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __40__POJWTSigning_signData_usingKey_error___block_invoke_cold_1();

  return v2;
}

- (BOOL)verifySignature:(id)a3 onData:(id)a4 usingCertificateString:(id)a5
{
  id v8;
  id v9;
  id v10;
  const __CFData *v11;
  __SecCertificate *v12;
  __SecCertificate *v13;
  SecKeyRef v14;
  BOOL v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v10, "length"))
  {
    v11 = (const __CFData *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v10, 0);
    if (-[__CFData length](v11, "length"))
    {
      v12 = SecCertificateCreateWithData(0, v11);
      if (v12)
      {
        v13 = v12;
        v14 = SecCertificateCopyKey(v12);
        CFRelease(v13);
        if (v14)
        {
          v15 = -[POJWTSigning verifySignature:onData:usingKey:](self, "verifySignature:onData:usingKey:", v8, v9, v14);
          CFRelease(v14);
LABEL_11:

          goto LABEL_12;
        }
        v19 = __62__POJWTSigning_verifySignature_onData_usingCertificateString___block_invoke_76();
      }
      else
      {
        v18 = __62__POJWTSigning_verifySignature_onData_usingCertificateString___block_invoke_73();
      }
    }
    else
    {
      v17 = __62__POJWTSigning_verifySignature_onData_usingCertificateString___block_invoke_70();
    }
    v15 = 0;
    goto LABEL_11;
  }
  v16 = __62__POJWTSigning_verifySignature_onData_usingCertificateString___block_invoke();
  v15 = 0;
LABEL_12:

  return v15;
}

id __62__POJWTSigning_verifySignature_onData_usingCertificateString___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("No certificate string."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POJWTSigning();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POJWTSigning_signData_usingKey_error___block_invoke_cold_1();

  return v0;
}

id __62__POJWTSigning_verifySignature_onData_usingCertificateString___block_invoke_70()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Failed to base64 decode."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POJWTSigning();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POJWTSigning_signData_usingKey_error___block_invoke_cold_1();

  return v0;
}

id __62__POJWTSigning_verifySignature_onData_usingCertificateString___block_invoke_73()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Failed to create certificate."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POJWTSigning();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POJWTSigning_signData_usingKey_error___block_invoke_cold_1();

  return v0;
}

id __62__POJWTSigning_verifySignature_onData_usingCertificateString___block_invoke_76()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Failed to get public key."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POJWTSigning();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POJWTSigning_signData_usingKey_error___block_invoke_cold_1();

  return v0;
}

- (BOOL)verifySignature:(id)a3 onData:(id)a4 usingKey:(__SecKey *)a5
{
  id v8;
  id v9;
  int v10;
  BOOL v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v17[6];
  CFErrorRef error[16];

  v8 = a3;
  v9 = a4;
  if (!SecKeyIsAlgorithmSupported(a5, kSecKeyOperationTypeVerify, -[POJWTSigning algorithm](self, "algorithm")))
  {
    error[11] = (CFErrorRef)MEMORY[0x24BDAC760];
    error[12] = (CFErrorRef)3221225472;
    error[13] = (CFErrorRef)__48__POJWTSigning_verifySignature_onData_usingKey___block_invoke;
    error[14] = (CFErrorRef)&unk_2514FF9D0;
    error[15] = (CFErrorRef)self;
    v13 = __48__POJWTSigning_verifySignature_onData_usingKey___block_invoke();
LABEL_9:
    v11 = 0;
    goto LABEL_10;
  }
  if (!objc_msgSend(v8, "length"))
  {
    error[6] = (CFErrorRef)MEMORY[0x24BDAC760];
    error[7] = (CFErrorRef)3221225472;
    error[8] = (CFErrorRef)__48__POJWTSigning_verifySignature_onData_usingKey___block_invoke_81;
    error[9] = (CFErrorRef)&unk_2514FF9D0;
    error[10] = (CFErrorRef)self;
    v14 = __48__POJWTSigning_verifySignature_onData_usingKey___block_invoke_81();
    goto LABEL_9;
  }
  if (!objc_msgSend(v9, "length"))
  {
    error[1] = (CFErrorRef)MEMORY[0x24BDAC760];
    error[2] = (CFErrorRef)3221225472;
    error[3] = (CFErrorRef)__48__POJWTSigning_verifySignature_onData_usingKey___block_invoke_84;
    error[4] = (CFErrorRef)&unk_2514FF9D0;
    error[5] = (CFErrorRef)self;
    v15 = __48__POJWTSigning_verifySignature_onData_usingKey___block_invoke_84();
    goto LABEL_9;
  }
  error[0] = 0;
  v10 = SecKeyVerifySignature(a5, -[POJWTSigning algorithm](self, "algorithm"), (CFDataRef)v9, (CFDataRef)v8, error);
  v11 = v10 != 0;
  if (!v10)
  {
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __48__POJWTSigning_verifySignature_onData_usingKey___block_invoke_87;
    v17[3] = &unk_2514FFFC8;
    v17[4] = self;
    v17[5] = error[0];
    v12 = __48__POJWTSigning_verifySignature_onData_usingKey___block_invoke_87((uint64_t)v17);
  }
LABEL_10:

  return v11;
}

id __48__POJWTSigning_verifySignature_onData_usingKey___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Signing algorithm not supported for verification."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POJWTSigning();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POJWTSigning_signData_usingKey_error___block_invoke_cold_1();

  return v0;
}

id __48__POJWTSigning_verifySignature_onData_usingKey___block_invoke_81()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("No signature to verify for verification."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POJWTSigning();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POJWTSigning_signData_usingKey_error___block_invoke_cold_1();

  return v0;
}

id __48__POJWTSigning_verifySignature_onData_usingKey___block_invoke_84()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("No data to verify."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POJWTSigning();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POJWTSigning_signData_usingKey_error___block_invoke_cold_1();

  return v0;
}

id __48__POJWTSigning_verifySignature_onData_usingKey___block_invoke_87(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *v3;

  v1 = *(void **)(a1 + 40);
  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1008, v1, CFSTR("Error verifying signature."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  PO_LOG_POJWTSigning();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __40__POJWTSigning_signData_usingKey_error___block_invoke_cold_1();

  return v2;
}

- (NSString)alg
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (__CFString)algorithm
{
  return self->_algorithm;
}

- (NSString)algorithmName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_algorithmName, 0);
  objc_storeStrong((id *)&self->_alg, 0);
}

void __40__POJWTSigning_signData_usingKey_error___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  objc_msgSend((id)OUTLINED_FUNCTION_4_2(v0, v1), "algorithmName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_24440D000, v3, v4, "%{public}@, %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

@end
