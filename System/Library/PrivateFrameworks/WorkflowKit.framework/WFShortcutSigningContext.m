@implementation WFShortcutSigningContext

- (id)generateAuthData
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  _QWORD v25[4];
  _QWORD v26[4];
  const __CFString *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  -[WFShortcutSigningContext signingCertificateChain](self, "signingCertificateChain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
  {
    -[WFShortcutSigningContext appleIDValidationRecord](self, "appleIDValidationRecord");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      v12 = 0;
      goto LABEL_10;
    }
    -[WFShortcutSigningContext appleIDCertificateChain](self, "appleIDCertificateChain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "if_compactMap:", &__block_literal_global_115_64405);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v6, "count");
    -[WFShortcutSigningContext appleIDCertificateChain](self, "appleIDCertificateChain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    if (v15 == v17)
    {
      v11 = SecKeyCopyExternalRepresentation(-[WFShortcutSigningContext signingPublicKey](self, "signingPublicKey"), 0);
      v18 = (void *)MEMORY[0x1E0C99E08];
      v25[0] = CFSTR("AppleIDCertificateChain");
      v25[1] = CFSTR("SigningPublicKey");
      v26[0] = v6;
      v26[1] = v11;
      v25[2] = CFSTR("SigningPublicKeySignature");
      -[WFShortcutSigningContext signingPublicKeySignature](self, "signingPublicKeySignature");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v26[2] = v19;
      v25[3] = CFSTR("AppleIDValidationRecord");
      -[WFShortcutSigningContext appleIDValidationRecord](self, "appleIDValidationRecord");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "data");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v26[3] = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "dictionaryWithDictionary:", v22);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
LABEL_8:

    return 0;
  }
  -[WFShortcutSigningContext signingCertificateChain](self, "signingCertificateChain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "if_compactMap:", &__block_literal_global_64403);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "count");
  -[WFShortcutSigningContext signingCertificateChain](self, "signingCertificateChain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v7 != v9)
    goto LABEL_8;
  v10 = (void *)MEMORY[0x1E0C99E08];
  v27 = CFSTR("SigningCertificateChain");
  v28[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryWithDictionary:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

LABEL_10:
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v12, 200, 0, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (WFShortcutSigningContext)initWithAppleIDValidationRecord:(id)a3 appleIDCertificateChain:(id)a4 signingPublicKey:(__SecKey *)a5 signingPublicKeyData:(id)a6
{
  id v11;
  id v12;
  id v13;
  WFShortcutSigningContext *v14;
  WFShortcutSigningContext *v15;
  uint64_t v16;
  NSArray *appleIDCertificateChain;
  uint64_t v18;
  NSData *signingPublicKeySignature;
  WFShortcutSigningContext *v20;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)WFShortcutSigningContext;
  v14 = -[WFShortcutSigningContext init](&v22, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_appleIDValidationRecord, a3);
    v16 = objc_msgSend(v12, "copy");
    appleIDCertificateChain = v15->_appleIDCertificateChain;
    v15->_appleIDCertificateChain = (NSArray *)v16;

    v15->_signingPublicKey = (__SecKey *)CFRetain(a5);
    v18 = objc_msgSend(v13, "copy");
    signingPublicKeySignature = v15->_signingPublicKeySignature;
    v15->_signingPublicKeySignature = (NSData *)v18;

    v20 = v15;
  }

  return v15;
}

- (WFShortcutSigningContext)initWithSigningCertificateChain:(id)a3
{
  id v4;
  WFShortcutSigningContext *v5;
  uint64_t v6;
  NSArray *signingCertificateChain;
  WFShortcutSigningContext *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFShortcutSigningContext;
  v5 = -[WFShortcutSigningContext init](&v10, sel_init);
  if (v5 && objc_msgSend(v4, "count"))
  {
    v6 = objc_msgSend(v4, "copy");
    signingCertificateChain = v5->_signingCertificateChain;
    v5->_signingCertificateChain = (NSArray *)v6;

    v8 = v5;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)dealloc
{
  __SecKey *signingPublicKey;
  objc_super v4;

  signingPublicKey = self->_signingPublicKey;
  if (signingPublicKey)
    CFRelease(signingPublicKey);
  v4.receiver = self;
  v4.super_class = (Class)WFShortcutSigningContext;
  -[WFShortcutSigningContext dealloc](&v4, sel_dealloc);
}

- (__SecKey)copyPublicKey
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  __SecKey *v7;

  -[WFShortcutSigningContext signingCertificateChain](self, "signingCertificateChain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return (__SecKey *)CFRetain(-[WFShortcutSigningContext signingPublicKey](self, "signingPublicKey"));
  -[WFShortcutSigningContext signingCertificateChain](self, "signingCertificateChain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (__SecKey *)objc_msgSend(v6, "copyPublicKey");

  return v7;
}

- (void)validateWithCompletion:(id)a3
{
  void (**v4)(id, _BOOL8, uint64_t, id, id);
  NSObject *v5;
  void *v6;
  _BOOL8 v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _BOOL8, uint64_t, id, id))a3;
  getWFSecurityLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[WFShortcutSigningContext validateWithCompletion:]";
    _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_DEFAULT, "%s Start validating Shortcut Signing Context", buf, 0xCu);
  }

  -[WFShortcutSigningContext appleIDCertificateChain](self, "appleIDCertificateChain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v16 = 0;
    v17 = 0;
    v7 = -[WFShortcutSigningContext validateSigningCertificateChainWithICloudIdentifier:error:](self, "validateSigningCertificateChainWithICloudIdentifier:error:", &v17, &v16);
    v10 = v17;
    v8 = v16;
    v11 = 1;
LABEL_10:
    v4[2](v4, v7, v11, v10, v8);

    goto LABEL_11;
  }
  v18 = 0;
  v7 = -[WFShortcutSigningContext validateAppleIDCertificatesWithError:](self, "validateAppleIDCertificatesWithError:", &v18);
  v8 = v18;
  if (!v7)
  {
    v10 = 0;
    v11 = 2;
    goto LABEL_10;
  }
  -[WFShortcutSigningContext appleIDValidationRecord](self, "appleIDValidationRecord");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0CB2D50];
    WFLocalizedString(CFSTR("This shortcut file data is corrupted"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("WFWorkflowErrorDomain"), 5, v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v10 = 0;
    v7 = 0;
    v11 = 2;
    v8 = (id)v15;
    goto LABEL_10;
  }
  -[WFShortcutSigningContext validateAppleIDValidationRecordWithCompletion:](self, "validateAppleIDValidationRecordWithCompletion:", v4);
LABEL_11:

}

- (BOOL)validateWithSigningMethod:(int64_t *)a3 error:(id *)a4
{
  return -[WFShortcutSigningContext validateWithSigningMethod:iCloudIdentifier:error:](self, "validateWithSigningMethod:iCloudIdentifier:error:", a3, 0, a4);
}

- (BOOL)validateWithSigningMethod:(int64_t *)a3 iCloudIdentifier:(id *)a4 error:(id *)a5
{
  NSObject *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  dispatch_semaphore_t v13;
  NSObject *v14;
  dispatch_time_t v15;
  intptr_t v16;
  BOOL v17;
  char v18;
  void *v19;
  id *v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  BOOL v29;
  id obj;
  _QWORD v32[4];
  NSObject *v33;
  uint64_t *v34;
  __int128 *p_buf;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  __int128 buf;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v48 = 0;
  v49 = &v48;
  v50 = 0x2020000000;
  v51 = 0;
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__64390;
  v42 = __Block_byref_object_dispose__64391;
  v43 = 0;
  getWFSecurityLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[WFShortcutSigningContext validateWithSigningMethod:iCloudIdentifier:error:]";
    _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_DEFAULT, "%s Start validating Shortcut Signing Context", (uint8_t *)&buf, 0xCu);
  }

  -[WFShortcutSigningContext appleIDValidationRecord](self, "appleIDValidationRecord");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v45[3] = 2;
    v11 = -[WFShortcutSigningContext validateAppleIDCertificatesWithError:](self, "validateAppleIDCertificatesWithError:", a5);
    *((_BYTE *)v49 + 24) = v11;
    if (v11)
    {
      -[WFShortcutSigningContext appleIDValidationRecord](self, "appleIDValidationRecord");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v13 = dispatch_semaphore_create(0);
        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v57 = 0x3032000000;
        v58 = __Block_byref_object_copy__64390;
        v59 = __Block_byref_object_dispose__64391;
        v60 = 0;
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __77__WFShortcutSigningContext_validateWithSigningMethod_iCloudIdentifier_error___block_invoke;
        v32[3] = &unk_1E7AF9670;
        v34 = &v48;
        p_buf = &buf;
        v36 = &v44;
        v37 = &v38;
        v14 = v13;
        v33 = v14;
        -[WFShortcutSigningContext validateAppleIDValidationRecordWithCompletion:](self, "validateAppleIDValidationRecordWithCompletion:", v32);
        v15 = dispatch_time(0, 30000000000);
        v16 = dispatch_semaphore_wait(v14, v15);
        if (*((_BYTE *)v49 + 24))
          v17 = v16 == 0;
        else
          v17 = 0;
        v18 = v17;
        *((_BYTE *)v49 + 24) = v18;
        if (a5 && (v18 & 1) == 0)
        {
          v19 = *(void **)(*((_QWORD *)&buf + 1) + 40);
          if (v19)
          {
            *a5 = objc_retainAutorelease(v19);
          }
          else
          {
            v25 = (void *)MEMORY[0x1E0CB35C8];
            v54 = *MEMORY[0x1E0CB2D50];
            WFLocalizedString(CFSTR("Failed to verify Apple ID information of this shortcut"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = v26;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("WFWorkflowErrorDomain"), 5, v27);
            v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            *a5 = v28;

          }
        }

        _Block_object_dispose(&buf, 8);
      }
      else
      {
        *((_BYTE *)v49 + 24) = 0;
        if (a5)
        {
          v22 = (void *)MEMORY[0x1E0CB35C8];
          v52 = *MEMORY[0x1E0CB2D50];
          WFLocalizedString(CFSTR("This shortcut file data is corrupted"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = v23;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("WFWorkflowErrorDomain"), 5, v24);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

        }
      }
    }
  }
  else
  {
    v45[3] = 1;
    v20 = (id *)(v39 + 5);
    obj = (id)v39[5];
    v21 = -[WFShortcutSigningContext validateSigningCertificateChainWithICloudIdentifier:error:](self, "validateSigningCertificateChainWithICloudIdentifier:error:", &obj, a5);
    objc_storeStrong(v20, obj);
    *((_BYTE *)v49 + 24) = v21;
  }
  if (a3)
    *a3 = v45[3];
  if (a4)
    *a4 = objc_retainAutorelease((id)v39[5]);
  v29 = *((_BYTE *)v49 + 24) != 0;
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);
  return v29;
}

- (BOOL)validateAppleIDCertificatesWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  const void *AppleIDAuthorityPolicy;
  OSStatus v10;
  CFErrorDomain Domain;
  CFErrorRef v12;
  uint64_t v13;
  int v14;
  int v15;
  _BOOL4 v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v24;
  const char *v25;
  OSStatus v26;
  NSObject *v27;
  uint32_t v28;
  SecTrustRef trust;
  CFErrorRef error;
  _QWORD v31[2];
  _QWORD v32[2];
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  getWFSecurityLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v34 = "-[WFShortcutSigningContext validateAppleIDCertificatesWithError:]";
    _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_DEFAULT, "%s Validating AppleID Certificate Chain", buf, 0xCu);
  }

  -[WFShortcutSigningContext appleIDCertificateChain](self, "appleIDCertificateChain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "if_map:", &__block_literal_global_152);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v7;
  trust = 0;
  error = 0;
  if (!v8)
  {
    v14 = 0;
    v12 = 0;
    LODWORD(v13) = -6705;
    goto LABEL_15;
  }
  AppleIDAuthorityPolicy = (const void *)SecPolicyCreateAppleIDAuthorityPolicy();
  if (AppleIDAuthorityPolicy)
  {
    v10 = SecTrustCreateWithCertificates(v8, AppleIDAuthorityPolicy, &trust);
    if (v10)
    {
      v26 = v10;
      getWFSecurityLogObject();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v34 = "WFAppleIDVerifyCertificateChain";
        v35 = 1024;
        LODWORD(v36) = v26;
        v25 = "%s Signed Shortcut File Apple ID Certificate Chain Verification: SecTrustCreateWithCertificates failed with error %d";
        v27 = v24;
        v28 = 18;
LABEL_40:
        _os_log_impl(&dword_1C15B3000, v27, OS_LOG_TYPE_ERROR, v25, buf, v28);
      }
    }
    else
    {
      if (trust)
      {
        if (SecTrustEvaluateWithError(trust, &error)
          || (Domain = CFErrorGetDomain(error), CFEqual(Domain, (CFTypeRef)*MEMORY[0x1E0CB2F90]))
          && CFErrorGetCode(error) == -67818)
        {
          v12 = 0;
          LODWORD(v13) = 0;
          v14 = 1;
        }
        else
        {
          v12 = error;
          getWFSecurityLogObject();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v34 = "WFAppleIDVerifyCertificateChain";
            v35 = 2112;
            v36 = v12;
            _os_log_impl(&dword_1C15B3000, (os_log_t)v13, OS_LOG_TYPE_ERROR, "%s Signed Shortcut File Apple ID Certificate Chain Verification: SecTrustEvaluateWithError failed with error %@", buf, 0x16u);
          }

          LODWORD(v13) = NSErrorToOSStatus();
          v14 = 0;
        }
        goto LABEL_11;
      }
      getWFSecurityLogObject();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v34 = "WFAppleIDVerifyCertificateChain";
        v25 = "%s Signed Shortcut File Apple ID Certificate Chain Verification: SecTrustCreateWithCertificates returned NULL trust";
        goto LABEL_39;
      }
    }
  }
  else
  {
    getWFSecurityLogObject();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v34 = "WFAppleIDVerifyCertificateChain";
      v25 = "%s Signed Shortcut File Apple ID Certificate Chain Verification: SecPolicyCreateAppleIDAuthorityPolicy failed";
LABEL_39:
      v27 = v24;
      v28 = 12;
      goto LABEL_40;
    }
  }

  v14 = 0;
  v12 = 0;
  LODWORD(v13) = -6762;
LABEL_11:
  if (trust)
    CFRelease(trust);
  if (AppleIDAuthorityPolicy)
    CFRelease(AppleIDAuthorityPolicy);
LABEL_15:
  if ((_DWORD)v13)
    v15 = 1;
  else
    v15 = v14;
  if (v15)
    v13 = v13;
  else
    v13 = 4294960596;

  if ((_DWORD)v13)
    v16 = 0;
  else
    v16 = v14;
  if (v16)
  {
    getWFSecurityLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v34 = "-[WFShortcutSigningContext validateAppleIDCertificatesWithError:]";
      _os_log_impl(&dword_1C15B3000, v17, OS_LOG_TYPE_DEFAULT, "%s Shortcut AppleID Certificate Chain Validated Successfully", buf, 0xCu);
    }
  }
  else
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v31[0] = *MEMORY[0x1E0CB2D50];
    WFLocalizedString(CFSTR("Failed to verify Apple ID information of this shortcut"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v19;
    v31[1] = *MEMORY[0x1E0CB3388];
    WFErrorFromSecurityOSStatus(v13);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("WFWorkflowErrorDomain"), 5, v21);
    v17 = objc_claimAutoreleasedReturnValue();

    getWFSecurityLogObject();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v34 = "-[WFShortcutSigningContext validateAppleIDCertificatesWithError:]";
      v35 = 2112;
      v36 = v17;
      _os_log_impl(&dword_1C15B3000, v22, OS_LOG_TYPE_ERROR, "%s Failed to Evaluate AppleID Certificate Chain: %@", buf, 0x16u);
    }

    if (a3)
    {
      v17 = objc_retainAutorelease(v17);
      *a3 = v17;
    }
  }

  return v16;
}

- (void)validateAppleIDValidationRecordWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFSecurityLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[WFShortcutSigningContext validateAppleIDValidationRecordWithCompletion:]";
    _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_DEFAULT, "%s Validating AppleID Validation Record", buf, 0xCu);
  }

  v6 = objc_alloc_init(MEMORY[0x1E0D973D0]);
  objc_msgSend(v6, "myAccountWithError:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "altDSID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFShortcutSigningContext appleIDValidationRecord](self, "appleIDValidationRecord");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "altDSID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isEqualToString:", v10);

  if (v11)
  {
    getWFSecurityLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[WFShortcutSigningContext validateAppleIDValidationRecordWithCompletion:]";
      _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_DEFAULT, "%s Found the current user's AppleID Validation Record", buf, 0xCu);
    }

    (*((void (**)(id, uint64_t, uint64_t, _QWORD, _QWORD))v4 + 2))(v4, 1, 3, 0, 0);
  }
  else if (+[WFSharingSettings isPrivateSharingEnabled](WFSharingSettings, "isPrivateSharingEnabled"))
  {
    -[WFShortcutSigningContext appleIDValidationRecord](self, "appleIDValidationRecord");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "validatedEmailHashes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    WFCombinedHashStringFromArray(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFShortcutSigningContext appleIDValidationRecord](self, "appleIDValidationRecord");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "validatedPhoneHashes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    WFCombinedHashStringFromArray(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_alloc_init(MEMORY[0x1E0D973E8]);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __74__WFShortcutSigningContext_validateAppleIDValidationRecordWithCompletion___block_invoke;
    v22[3] = &unk_1E7AF96D8;
    v23 = v4;
    objc_msgSend(v19, "contactIDForEmailHash:phoneHash:completion:", v15, v18, v22);

  }
  else
  {
    getWFSecurityLogObject();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[WFShortcutSigningContext validateAppleIDValidationRecordWithCompletion:]";
      _os_log_impl(&dword_1C15B3000, v20, OS_LOG_TYPE_DEFAULT, "%s Skipping AppleID Validation Record due to Private Sharing Disabled", buf, 0xCu);
    }

    +[WFSharingSettings privateSharingDisabledErrorWithShortcutName:](WFSharingSettings, "privateSharingDisabledErrorWithShortcutName:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, uint64_t, _QWORD, void *))v4 + 2))(v4, 0, 2, 0, v21);

  }
}

- (BOOL)validateSigningCertificateChainWithICloudIdentifier:(id *)a3 error:(id *)a4
{
  NSObject *v7;
  void *v8;
  void *v9;
  SecPolicyRef Revocation;
  uint64_t v11;
  void (**v12)(_QWORD);
  uint64_t v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  BOOL v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  CFErrorRef v23;
  _QWORD v24[5];
  SecTrustRef trust;
  _QWORD aBlock[5];
  _BYTE buf[12];
  __int16 v28;
  NSObject *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  getWFSecurityLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[WFShortcutSigningContext validateSigningCertificateChainWithICloudIdentifier:error:]";
    _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_DEFAULT, "%s Validating Shortcut Signing Certificate Chain", buf, 0xCu);
  }

  -[WFShortcutSigningContext signingCertificateChain](self, "signingCertificateChain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "if_map:", &__block_literal_global_161);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  Revocation = SecPolicyCreateRevocation(3uLL);
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__WFShortcutSigningContext_validateSigningCertificateChainWithICloudIdentifier_error___block_invoke_2;
  aBlock[3] = &__block_descriptor_40_e5_v8__0l;
  aBlock[4] = Revocation;
  v12 = (void (**)(_QWORD))_Block_copy(aBlock);
  trust = 0;
  v13 = SecTrustCreateWithCertificates(v9, Revocation, &trust);
  if (!(_DWORD)v13 || !trust)
  {
    v24[0] = v11;
    v24[1] = 3221225472;
    v24[2] = __86__WFShortcutSigningContext_validateSigningCertificateChainWithICloudIdentifier_error___block_invoke_162;
    v24[3] = &__block_descriptor_40_e5_v8__0l;
    v24[4] = trust;
    v15 = _Block_copy(v24);
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3)
    {
      *(_QWORD *)buf = 0;
      SecCertificateCopyCommonName((SecCertificateRef)v18, (CFStringRef *)buf);
      *a3 = *(id *)buf;
    }
    v23 = 0;
    if (SecTrustEvaluateWithError(trust, &v23))
    {
      if (SecCertificateCopyExtensionValue())
      {
        getWFSecurityLogObject();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = "-[WFShortcutSigningContext validateSigningCertificateChainWithICloudIdentifier:error:]";
          _os_log_impl(&dword_1C15B3000, v19, OS_LOG_TYPE_DEFAULT, "%s Shortcut Signing Certificate Chain Validated Successfully", buf, 0xCu);
        }
        v17 = 1;
        goto LABEL_26;
      }
      WFShortcutSigningContextSigningCertificateChainFailureError(0);
      v19 = objc_claimAutoreleasedReturnValue();
      getWFSecurityLogObject();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[WFShortcutSigningContext validateSigningCertificateChainWithICloudIdentifier:error:]";
        v28 = 2112;
        v29 = v19;
        _os_log_impl(&dword_1C15B3000, v21, OS_LOG_TYPE_ERROR, "%s Unrecognized Shortcut Signing Certificate: %@", buf, 0x16u);
      }

      if (a4)
        goto LABEL_24;
    }
    else
    {
      WFShortcutSigningContextSigningCertificateChainFailureError(v23);
      v19 = objc_claimAutoreleasedReturnValue();
      getWFSecurityLogObject();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[WFShortcutSigningContext validateSigningCertificateChainWithICloudIdentifier:error:]";
        v28 = 2112;
        v29 = v19;
        _os_log_impl(&dword_1C15B3000, v20, OS_LOG_TYPE_ERROR, "%s Failed to Evaluate Shortcut Signing Certificate Chain: %@", buf, 0x16u);
      }

      if (a4)
      {
LABEL_24:
        v19 = objc_retainAutorelease(v19);
        v17 = 0;
        *a4 = v19;
LABEL_26:

        ((void (*))v15[2].isa)(v15);
        goto LABEL_27;
      }
    }
    v17 = 0;
    goto LABEL_26;
  }
  WFErrorFromSecurityOSStatus(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  WFShortcutSigningContextSigningCertificateChainFailureError(v14);
  v15 = objc_claimAutoreleasedReturnValue();

  if (a4)
    *a4 = objc_retainAutorelease(v15);
  getWFSecurityLogObject();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[WFShortcutSigningContext validateSigningCertificateChainWithICloudIdentifier:error:]";
    v28 = 2112;
    v29 = v15;
    _os_log_impl(&dword_1C15B3000, v16, OS_LOG_TYPE_ERROR, "%s Validating Shortcut Signing Certificate Chain Failed: %@", buf, 0x16u);
  }

  v17 = 0;
LABEL_27:

  v12[2](v12);
  return v17;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (NSArray)signingCertificateChain
{
  return self->_signingCertificateChain;
}

- (SFAppleIDValidationRecord)appleIDValidationRecord
{
  return self->_appleIDValidationRecord;
}

- (NSArray)appleIDCertificateChain
{
  return self->_appleIDCertificateChain;
}

- (__SecKey)signingPublicKey
{
  return self->_signingPublicKey;
}

- (void)setSigningPublicKey:(__SecKey *)a3
{
  self->_signingPublicKey = a3;
}

- (NSData)signingPublicKeySignature
{
  return self->_signingPublicKeySignature;
}

- (void)setSigningPublicKeySignature:(id)a3
{
  objc_storeStrong((id *)&self->_signingPublicKeySignature, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signingPublicKeySignature, 0);
  objc_storeStrong((id *)&self->_appleIDCertificateChain, 0);
  objc_storeStrong((id *)&self->_appleIDValidationRecord, 0);
  objc_storeStrong((id *)&self->_signingCertificateChain, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
}

void __86__WFShortcutSigningContext_validateSigningCertificateChainWithICloudIdentifier_error___block_invoke_2(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void __86__WFShortcutSigningContext_validateSigningCertificateChainWithICloudIdentifier_error___block_invoke_162(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

uint64_t __86__WFShortcutSigningContext_validateSigningCertificateChainWithICloudIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "certificate");
}

void __74__WFShortcutSigningContext_validateAppleIDValidationRecordWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    getWFSecurityLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315138;
      v12 = "-[WFShortcutSigningContext validateAppleIDValidationRecordWithCompletion:]_block_invoke";
      _os_log_impl(&dword_1C15B3000, v6, OS_LOG_TYPE_DEFAULT, "%s Found contact matching with AppleID Validation Record", (uint8_t *)&v11, 0xCu);
    }
    v7 = 0;
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v13[0] = *MEMORY[0x1E0CB2D50];
    WFLocalizedString(CFSTR("This shortcut cannot be opened because it was shared by someone who is not in your contacts."));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = *MEMORY[0x1E0CB3388];
    v14[0] = v9;
    v14[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("WFWorkflowErrorDomain"), 5, v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    getWFSecurityLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315138;
      v12 = "-[WFShortcutSigningContext validateAppleIDValidationRecordWithCompletion:]_block_invoke";
      _os_log_impl(&dword_1C15B3000, v6, OS_LOG_TYPE_DEFAULT, "%s Contact with matching AppleID Validation Record Couldn't be found", (uint8_t *)&v11, 0xCu);
    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __65__WFShortcutSigningContext_validateAppleIDCertificatesWithError___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "certificate");
}

void __77__WFShortcutSigningContext_validateWithSigningMethod_iCloudIdentifier_error___block_invoke(uint64_t a1, char a2, uint64_t a3, void *a4, void *a5)
{
  id v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;

  v9 = a4;
  v15 = a5;
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v10 + 24))
    v11 = a2;
  else
    v11 = 0;
  *(_BYTE *)(v10 + 24) = v11;
  if ((a2 & 1) == 0)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a5);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a3;
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v9;
  v14 = v9;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __44__WFShortcutSigningContext_generateAuthData__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "generateAuthData");
}

uint64_t __44__WFShortcutSigningContext_generateAuthData__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "generateAuthData");
}

+ (id)contextWithAuthData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const __CFData *v16;
  void *v17;
  void *v18;
  const __CFData *v19;
  void *v20;
  __SecKey *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (**v26)(_QWORD);
  void *v27;
  dispatch_queue_t v28;
  NSObject *v29;
  dispatch_time_t v30;
  intptr_t v31;
  char v32;
  char v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  dispatch_queue_t v45;
  NSObject *v46;
  const __CFData *v47;
  const __CFData *v48;
  void *v49;
  void *v50;
  SecKeyRef v51;
  const __CFDictionary *attributes;
  _QWORD v53[4];
  NSObject *v54;
  uint64_t *v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  int v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  _QWORD aBlock[5];
  _QWORD v68[2];
  _QWORD v69[4];

  v69[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v4, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SigningCertificateChain"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v6, "if_compactMap:", &__block_literal_global_119_64423);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v7, "count");
          if (v8 == objc_msgSend(v6, "count"))
          {
            objc_msgSend(a1, "contextWithSigningCertificateChain:", v7);
            a1 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            a1 = 0;
          }

          goto LABEL_21;
        }
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AppleIDCertificateChain"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AppleIDCertificateChain"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v10, "if_compactMap:", &__block_literal_global_121_64424);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v11, "count");
            if (v12 == objc_msgSend(v10, "count"))
            {
              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SigningPublicKey"));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              if (v13)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  v14 = v13;
                else
                  v14 = 0;
              }
              else
              {
                v14 = 0;
              }
              v16 = v14;

              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SigningPublicKeySignature"));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if (v17)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  v18 = v17;
                else
                  v18 = 0;
              }
              else
              {
                v18 = 0;
              }
              v19 = v18;

              objc_msgSend(v11, "firstObject");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = (__SecKey *)objc_msgSend(v20, "copyPublicKey");

              v22 = *MEMORY[0x1E0CD6A50];
              v23 = *MEMORY[0x1E0CD69F8];
              v68[0] = *MEMORY[0x1E0CD6A38];
              v68[1] = v23;
              v24 = *MEMORY[0x1E0CD6A10];
              v69[0] = v22;
              v69[1] = v24;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, v68, 2);
              attributes = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
              v51 = SecKeyCreateWithData(v16, attributes, 0);
              v25 = MEMORY[0x1E0C809B0];
              aBlock[0] = MEMORY[0x1E0C809B0];
              aBlock[1] = 3221225472;
              aBlock[2] = __48__WFShortcutSigningContext_contextWithAuthData___block_invoke_3;
              aBlock[3] = &__block_descriptor_40_e5_v8__0l;
              aBlock[4] = v51;
              v26 = (void (**)(_QWORD))_Block_copy(aBlock);
              if (!SecKeyVerifySignature(v21, (SecKeyAlgorithm)*MEMORY[0x1E0CD6EB0], v16, v19, 0))
              {
                v33 = 0;
                a1 = 0;
                goto LABEL_56;
              }
              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AppleIDValidationRecord"));
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v27)
              {
                v33 = 1;
                goto LABEL_56;
              }
              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AppleIDValidationRecord"));
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              if (v49)
              {
                v47 = v16;
                v48 = v19;
                v61 = 0;
                v62 = &v61;
                v63 = 0x3032000000;
                v64 = __Block_byref_object_copy__64390;
                v65 = __Block_byref_object_dispose__64391;
                v66 = 0;
                v57 = 0;
                v58 = &v57;
                v59 = 0x2020000000;
                v60 = 1;
                dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
                v44 = objc_claimAutoreleasedReturnValue();
                v28 = dispatch_queue_create("SFAppleIDQueue", v44);
                v53[0] = v25;
                v53[1] = 3221225472;
                v53[2] = __48__WFShortcutSigningContext_contextWithAuthData___block_invoke_125;
                v53[3] = &unk_1E7AF9640;
                v55 = &v61;
                v56 = &v57;
                v29 = dispatch_semaphore_create(0);
                v54 = v29;
                v45 = v28;
                WFAppleIDParseValidationRecordData(v49, v28, v53);
                v30 = dispatch_time(0, 30000000000);
                v46 = v29;
                v31 = dispatch_semaphore_wait(v29, v30);
                v32 = 0;
                v50 = 0;
                v16 = v47;
                if (v62[5])
                {
                  v19 = v48;
                  if (!v31)
                  {
                    if (*((_DWORD *)v58 + 6))
                    {
                      v50 = 0;
                      v32 = 0;
                    }
                    else
                    {
                      v34 = objc_alloc(MEMORY[0x1E0D973D8]);
                      v50 = (void *)objc_msgSend(v34, "initWithDictionary:", v62[5]);
                      objc_msgSend((id)v62[5], "objectForKeyedSubscript:", CFSTR("altDsID"));
                      v35 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v50, "setAltDSID:", v35);

                      objc_msgSend((id)v62[5], "objectForKeyedSubscript:", CFSTR("SuggestValidDuration"));
                      v36 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v36)
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                          v37 = v36;
                        else
                          v37 = 0;
                      }
                      else
                      {
                        v37 = 0;
                      }
                      v38 = v37;

                      objc_msgSend(v50, "setSuggestedValidDuration:", objc_msgSend(v38, "unsignedIntValue"));
                      objc_msgSend((id)v62[5], "objectForKeyedSubscript:", CFSTR("ValidatedEmailHashes"));
                      v39 = (void *)objc_claimAutoreleasedReturnValue();
                      if (objc_msgSend(v39, "count"))
                        v40 = v39;
                      else
                        v40 = 0;
                      objc_msgSend(v50, "setValidatedEmailHashes:", v40);
                      objc_msgSend((id)v62[5], "objectForKeyedSubscript:", CFSTR("ValidatedPhoneHashes"));
                      v41 = (void *)objc_claimAutoreleasedReturnValue();

                      if (objc_msgSend(v41, "count"))
                        v42 = v41;
                      else
                        v42 = 0;
                      objc_msgSend(v50, "setValidatedPhoneHashes:", v42);
                      objc_msgSend((id)v62[5], "objectForKeyedSubscript:", CFSTR("ValidAsOf"));
                      v43 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v50, "setValidStartDate:", v43);

                      v32 = 1;
                    }
                  }
                }
                else
                {
                  v19 = v48;
                }

                _Block_object_dispose(&v57, 8);
                _Block_object_dispose(&v61, 8);

                if ((v32 & 1) == 0)
                {
                  a1 = 0;
                  goto LABEL_55;
                }
              }
              else
              {
                v50 = 0;
              }
              a1 = (id)objc_msgSend(objc_alloc((Class)a1), "initWithAppleIDValidationRecord:appleIDCertificateChain:signingPublicKey:signingPublicKeyData:", v50, v11, v51, v19);
LABEL_55:

              v33 = 0;
LABEL_56:
              v26[2](v26);

              if ((v33 & 1) == 0)
                goto LABEL_21;
              goto LABEL_20;
            }

          }
        }

      }
LABEL_20:
      a1 = 0;
LABEL_21:

      goto LABEL_22;
    }
  }

  a1 = 0;
LABEL_22:

  return a1;
}

+ (id)contextWithAppleIDAccount:(id)a3 signingKey:(__SecKey *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  WFShortcutSigningCertificate *v13;
  uint64_t v14;
  __SecKey *v15;
  __SecKey *v16;
  uint64_t v17;
  void (**v18)(_QWORD);
  const __CFData *v19;
  void (**v20)(_QWORD);
  CFDataRef Signature;
  void *v22;
  id v23;
  void *v24;
  WFShortcutSigningCertificate *v26;
  _QWORD v27[5];
  _QWORD aBlock[5];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "identity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "identity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copyCertificate");

    objc_msgSend(v6, "identity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copyIntermediateCertificate");

    v12 = 0;
    if (v9 && v11)
    {
      v26 = -[WFShortcutSigningCertificate initWithCertificate:]([WFShortcutSigningCertificate alloc], "initWithCertificate:", v9);
      v13 = -[WFShortcutSigningCertificate initWithCertificate:]([WFShortcutSigningCertificate alloc], "initWithCertificate:", v11);
      v14 = objc_msgSend(v7, "copyPrivateKey");
      if (v14)
      {
        v15 = (__SecKey *)v14;
        v16 = SecKeyCopyPublicKey(a4);
        v17 = MEMORY[0x1E0C809B0];
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __65__WFShortcutSigningContext_contextWithAppleIDAccount_signingKey___block_invoke;
        aBlock[3] = &__block_descriptor_40_e5_v8__0l;
        aBlock[4] = v16;
        v18 = (void (**)(_QWORD))_Block_copy(aBlock);
        v19 = SecKeyCopyExternalRepresentation(v16, 0);
        v27[0] = v17;
        v27[1] = 3221225472;
        v27[2] = __65__WFShortcutSigningContext_contextWithAppleIDAccount_signingKey___block_invoke_2;
        v27[3] = &__block_descriptor_40_e5_v8__0l;
        v27[4] = v19;
        v20 = (void (**)(_QWORD))_Block_copy(v27);
        Signature = SecKeyCreateSignature(v15, (SecKeyAlgorithm)*MEMORY[0x1E0CD6EB0], v19, 0);
        v29[0] = v26;
        v29[1] = v13;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_alloc((Class)a1);
        objc_msgSend(v6, "validationRecord");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v23, "initWithAppleIDValidationRecord:appleIDCertificateChain:signingPublicKey:signingPublicKeyData:", v24, v22, v16, Signature);

        v20[2](v20);
        v18[2](v18);

      }
      else
      {
        v12 = 0;
      }

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)contextWithSigningCertificateChain:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSigningCertificateChain:", v4);

  return v5;
}

void __65__WFShortcutSigningContext_contextWithAppleIDAccount_signingKey___block_invoke(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void __65__WFShortcutSigningContext_contextWithAppleIDAccount_signingKey___block_invoke_2(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void __48__WFShortcutSigningContext_contextWithAuthData___block_invoke_3(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void __48__WFShortcutSigningContext_contextWithAuthData___block_invoke_125(uint64_t a1, void *a2, int a3)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v6 = a2;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

WFShortcutSigningCertificate *__48__WFShortcutSigningContext_contextWithAuthData___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  WFShortcutSigningCertificate *v3;

  v2 = a2;
  v3 = -[WFShortcutSigningCertificate initWithCertificateData:]([WFShortcutSigningCertificate alloc], "initWithCertificateData:", v2);

  return v3;
}

WFShortcutSigningCertificate *__48__WFShortcutSigningContext_contextWithAuthData___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  WFShortcutSigningCertificate *v3;

  v2 = a2;
  v3 = -[WFShortcutSigningCertificate initWithCertificateData:]([WFShortcutSigningCertificate alloc], "initWithCertificateData:", v2);

  return v3;
}

@end
