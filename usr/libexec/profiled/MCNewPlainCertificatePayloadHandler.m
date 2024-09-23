@implementation MCNewPlainCertificatePayloadHandler

- (id)userInputFields
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  if (objc_msgSend(v2, "dataEncoding") == 1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "password"));
    v5 = objc_msgSend(v4, "length");

    if (!v5)
    {
      v6 = MCLocalizedString(CFSTR("PASSWORD_PROMPT_TITLE"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "certificateFileName"));
      v9 = MCLocalizedFormat(CFSTR("IDENTITY_PASSWORD_PROMPT_DESCRIPTION"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:](MCNewPayloadHandler, "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:", CFSTR("certificatePassword"), v7, v10, 0, 0, 0, 0, 0, 3));
      objc_msgSend(v3, "addObject:", v11);

    }
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  }

  return v3;
}

- (void)dealloc
{
  __SecIdentity *identity;
  objc_super v4;

  identity = self->_identity;
  if (identity)
    CFRelease(identity);
  v4.receiver = self;
  v4.super_class = (Class)MCNewPlainCertificatePayloadHandler;
  -[MCNewPlainCertificatePayloadHandler dealloc](&v4, "dealloc");
}

- (__SecIdentity)_copyContentsOfPKCS12DataWithPasscode:(id)a3 outError:(id *)a4
{
  id v6;
  void *v7;
  const __CFDictionary *v8;
  uint64_t v9;
  void *v10;
  __SecIdentity *v11;
  const __CFDictionary *ValueAtIndex;
  __SecIdentity *Value;
  CFArrayRef theArray;
  CFStringRef v16;
  id v17;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  theArray = 0;
  if (v6)
  {
    v16 = kSecImportExportPassphrase;
    v17 = v6;
    v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
    if (SecPKCS12Import((CFDataRef)objc_msgSend(v7, "certificateData"), v8, &theArray))
    {
      v9 = objc_claimAutoreleasedReturnValue(-[MCNewPlainCertificatePayloadHandler _invalidPasscodeError](self, "_invalidPasscodeError"));
    }
    else
    {
      if (CFArrayGetCount(theArray) == 1)
      {
        v10 = 0;
        goto LABEL_10;
      }
      v9 = objc_claimAutoreleasedReturnValue(-[MCNewPlainCertificatePayloadHandler _tooManyCertificatesError](self, "_tooManyCertificatesError"));
    }
    v10 = (void *)v9;
LABEL_10:

    if (!a4)
      goto LABEL_13;
    goto LABEL_11;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPlainCertificatePayloadHandler _invalidPasscodeError](self, "_invalidPasscodeError"));
  if (!a4)
    goto LABEL_13;
LABEL_11:
  if (v10)
  {
    v11 = 0;
    *a4 = objc_retainAutorelease(v10);
    goto LABEL_17;
  }
LABEL_13:
  ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, 0);
  Value = (__SecIdentity *)CFDictionaryGetValue(ValueAtIndex, kSecImportItemIdentity);
  v11 = Value;
  if (Value)
    CFRetain(Value);
  if (theArray)
    CFRelease(theArray);
LABEL_17:

  return v11;
}

- (BOOL)preflightUserInputResponses:(id)a3 outError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  __SecIdentity *v10;
  id v11;
  BOOL v12;
  id v14;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  if (objc_msgSend(v7, "dataEncoding") == 1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "password"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MCNewPayloadHandler prioritizeUserInput:key:overField:](MCNewPayloadHandler, "prioritizeUserInput:key:overField:", v6, CFSTR("certificatePassword"), v8));

    v14 = 0;
    v10 = -[MCNewPlainCertificatePayloadHandler _copyContentsOfPKCS12DataWithPasscode:outError:](self, "_copyContentsOfPKCS12DataWithPasscode:outError:", v9, &v14);
    v11 = v14;
    if (v10)
      CFRelease(v10);

    v12 = v11 == 0;
    if (a4 && v11)
      *a4 = objc_retainAutorelease(v11);

  }
  else
  {
    v12 = 1;
  }

  return v12;
}

- (id)_storeCertificate:(__SecCertificate *)a3 allowSSLTrust:(BOOL)a4 outError:(id *)a5
{
  _BOOL4 v6;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __SecCertificate *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  const void *v30;
  NSObject *v31;
  NSObject *v32;
  SecCertificateRef CertificateAtIndex;
  uint64_t SHA1Digest;
  void *v35;
  void *v36;
  void *v37;
  const __CFDictionary *v38;
  OSStatus v39;
  void *v40;
  OSStatus v41;
  OSStatus TrustResult;
  OSStatus v43;
  os_log_t v44;
  NSObject *v45;
  os_log_type_t v46;
  const char *v47;
  os_log_t v48;
  uint32_t v49;
  os_log_t v50;
  os_log_t v51;
  id v52;
  id v53;
  void *v55;
  NSObject *log;
  void *v57;
  id v58;
  SecTrustResultType v60;
  CFTypeRef result;
  SecTrustRef trust;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD v67[5];
  _QWORD v68[5];
  uint8_t v69[128];
  uint8_t buf[4];
  void *v71;

  v6 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v9 = -[MCNewCertificatePayloadHandler accessibility](self, "accessibility");
  v10 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v71 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Storing certificate, storing with accessibility %@", buf, 0xCu);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUID"));
  v12 = kMCAppleCertificatesKeychainGroup;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "profile"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MCKeychain saveItem:withLabel:group:useSystemKeychain:accessibility:](MCKeychain, "saveItem:withLabel:group:useSystemKeychain:accessibility:", a3, v11, v12, objc_msgSend(v14, "isInstalledForSystem"), v9));

  v57 = v8;
  if (!v15)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPlainCertificatePayloadHandler _cannotStoreCertificateError](self, "_cannotStoreCertificateError"));
    goto LABEL_10;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUID"));
  -[MCNewPayloadHandler _touchDependencyBetweenPersistentID:andUUID:](self, "_touchDependencyBetweenPersistentID:andUUID:", v15, v16);

  objc_msgSend(v8, "setCertificatePersistentID:", v15);
  v17 = a3;
  if ((objc_msgSend(v8, "isFullyTrustedRootCert") & 1) == 0
    && SecCertificateIsSelfSignedCA(a3))
  {
    if (v6)
    {
      v18 = SecTrustStoreForDomain(2);
      if (SecTrustStoreSetTrustSettings(v18, a3, 0))
      {
LABEL_8:
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPlainCertificatePayloadHandler _cannotStoreRootCertificateError](self, "_cannotStoreRootCertificateError"));
LABEL_10:
        v20 = v19;
        if (!v19)
          goto LABEL_54;
        if (a5)
        {
          v20 = objc_retainAutorelease(v19);
          v21 = 0;
          *a5 = v20;
        }
        else
        {
          v21 = 0;
        }
        goto LABEL_55;
      }
    }
    else if (-[MCNewPlainCertificatePayloadHandler _grantPartialNonSSLTrustPolicyForCertificate:](self, "_grantPartialNonSSLTrustPolicyForCertificate:", a3))
    {
      goto LABEL_8;
    }
  }
  v22 = (void *)SecCertificateCopyRFC822Names(a3);
  if (!v22)
    goto LABEL_54;
  v55 = v15;
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v23 = v22;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
  if (!v24)
    goto LABEL_53;
  v25 = v24;
  v26 = *(_QWORD *)v64;
  v58 = v23;
  do
  {
    v27 = 0;
    do
    {
      if (*(_QWORD *)v64 != v26)
        objc_enumerationMutation(v23);
      v28 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)v27);
      v29 = +[MFMessageKeychainManager copySMIMEEncryptionPolicyForAddress:](MFMessageKeychainManager, "copySMIMEEncryptionPolicyForAddress:", v28);
      if (v29)
      {
        v30 = v29;
        trust = 0;
        if (SecTrustCreateWithCertificates(v17, v29, &trust))
        {
          v31 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Cannot create certificate trust for S/MIME processing.", buf, 2u);
          }
          goto LABEL_39;
        }
        if (SecTrustGetCertificateCount(trust) < 1)
          goto LABEL_38;
        CertificateAtIndex = SecTrustGetCertificateAtIndex(trust, 0);
        SHA1Digest = SecCertificateGetSHA1Digest(CertificateAtIndex);
        v35 = (void *)objc_claimAutoreleasedReturnValue(SHA1Digest);
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "MCHexString"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("S/MIME: %@ - %@"), v28, v36));

        v67[0] = kSecClass;
        v67[1] = kSecAttrGeneric;
        v68[1] = v35;
        v68[2] = CFSTR("com.apple.certui");
        v67[2] = kSecAttrService;
        v67[3] = kSecAttrAccount;
        v67[4] = kSecReturnData;
        v68[0] = kSecClassGenericPassword;
        v68[3] = v37;
        v68[4] = &__kCFBooleanTrue;
        v38 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v68, v67, 5));
        result = 0;
        v39 = SecItemCopyMatching(v38, &result);
        v40 = (void *)result;
        if (v39 == -25300)
          goto LABEL_37;
        v41 = v39;
        if (v39)
        {
          v48 = _MCLogObjects[0];
          if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
            goto LABEL_37;
          *(_DWORD *)buf = 67109120;
          LODWORD(v71) = v41;
          v45 = v48;
          v46 = OS_LOG_TYPE_ERROR;
          v47 = "Could not query keychain for existing S/MIME certificate. Status: %d";
LABEL_35:
          v49 = 8;
        }
        else
        {
          SecTrustSetExceptions(trust, (CFDataRef)result);
          v60 = kSecTrustResultInvalid;
          SecTrustEvaluateWithError(trust, 0);
          TrustResult = SecTrustGetTrustResult(trust, &v60);
          if (TrustResult)
          {
            v43 = TrustResult;
            v44 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109120;
              LODWORD(v71) = v43;
              v45 = v44;
              v46 = OS_LOG_TYPE_ERROR;
              v47 = "Could not evaluate S/MIME certificate trust. Status: %d";
              goto LABEL_35;
            }
LABEL_37:

            v23 = v58;
            v17 = a3;
LABEL_38:
            CFRelease(trust);
LABEL_39:
            CFRelease(v30);
            goto LABEL_40;
          }
          if (v60 == kSecTrustResultDeny)
          {
            v50 = _MCLogObjects[0];
            if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
              goto LABEL_37;
            *(_WORD *)buf = 0;
            v45 = v50;
            v46 = OS_LOG_TYPE_INFO;
            v47 = "Not using certificate for S/MIME because we are denying this certificate.";
          }
          else
          {
            if ((SecCertificateGetKeyUsage(a3) & 4) != 0)
            {
              log = _MCLogObjects[0];
              if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v71 = v28;
                _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Saving certificate as the S/MIME encryption certificate for %{public}@", buf, 0xCu);
              }
              v52 = +[MFMessageKeychainManager saveEncryptionCertificate:forAddress:](MFMessageKeychainManager, "saveEncryptionCertificate:forAddress:", a3, v28);
              goto LABEL_37;
            }
            v51 = _MCLogObjects[0];
            if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
              goto LABEL_37;
            *(_WORD *)buf = 0;
            v45 = v51;
            v46 = OS_LOG_TYPE_INFO;
            v47 = "Not using certificate for S/MIME because it doesn't have the Key Encipherment usage.";
          }
          v49 = 2;
        }
        _os_log_impl((void *)&_mh_execute_header, v45, v46, v47, buf, v49);
        goto LABEL_37;
      }
      v32 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v71 = v28;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Cannot copy S/MIME policy for email address %{public}@", buf, 0xCu);
      }
LABEL_40:
      v27 = (char *)v27 + 1;
    }
    while (v25 != v27);
    v53 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
    v25 = v53;
  }
  while (v53);
LABEL_53:

  CFRelease(v23);
  v15 = v55;
LABEL_54:
  v21 = v15;
  v20 = 0;
LABEL_55:

  return v21;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  __SecIdentity *v13;
  id v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  unsigned int v26;
  void *v27;
  unsigned int v28;
  int v29;
  uint64_t v31;
  id v32;
  id *v33;
  id *v34;
  id v35;
  id v36;
  _BYTE buf[24];

  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUID"));
  if (objc_msgSend(v11, "dataEncoding") != 1)
  {
    if (objc_msgSend(v11, "dataEncoding"))
    {
      v14 = (id)objc_claimAutoreleasedReturnValue(-[MCNewPlainCertificatePayloadHandler _malformedCertificateError](self, "_malformedCertificateError"));
      v20 = 0;
LABEL_16:
      -[MCNewPayloadHandler _retainDependencyBetweenPersistentID:andUUID:](self, "_retainDependencyBetweenPersistentID:andUUID:", v20, v12);

      goto LABEL_17;
    }
    v34 = a6;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "certificateData"));
    v23 = +[MCCrypto copyCertificateRefFromPKCS1Data:](MCCrypto, "copyCertificateRefFromPKCS1Data:", v22);

    if (v23
      || (v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "certificateData")),
          v23 = +[MCCrypto copyCertificateRefFromPEMData:](MCCrypto, "copyCertificateRefFromPEMData:", v24), v24, v23))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", kMCInstallProfileOptionIsInstalledByMDM));
      v26 = objc_msgSend(v25, "BOOLValue");

      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "profile"));
      v28 = objc_msgSend(v27, "containsPayloadOfClass:", objc_opt_class(MCMDMPayload));

      if (v10)
        v29 = v26;
      else
        v29 = 1;
      v35 = 0;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPlainCertificatePayloadHandler _storeCertificate:allowSSLTrust:outError:](self, "_storeCertificate:allowSSLTrust:outError:", v23, v29 | v28, &v35));
      v14 = v35;
      CFRelease(v23);
      if (v20)
      {
        objc_msgSend(v11, "setCertificatePersistentID:", v20);
        a6 = v34;
        goto LABEL_16;
      }
      v31 = objc_claimAutoreleasedReturnValue(-[MCNewPlainCertificatePayloadHandler _cannotStoreCertificateError](self, "_cannotStoreCertificateError"));

      v14 = (id)v31;
    }
    else
    {
      v14 = (id)objc_claimAutoreleasedReturnValue(-[MCNewPlainCertificatePayloadHandler _malformedCertificateError](self, "_malformedCertificateError"));
    }
    a6 = v34;
    goto LABEL_17;
  }
  v36 = 0;
  v13 = -[MCNewPlainCertificatePayloadHandler copyIdentityImmediatelyWithInteractionClient:outError:](self, "copyIdentityImmediatelyWithInteractionClient:outError:", v10, &v36);
  v14 = v36;
  if (!v14)
  {
    v32 = v9;
    v33 = a6;
    v15 = -[MCNewCertificatePayloadHandler accessibility](self, "accessibility");
    v16 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Storing identity, storing with accessibility %@", buf, 0xCu);
    }
    v17 = kMCAppleIdentitiesKeychainGroup;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "profile"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[MCKeychain saveItem:withLabel:group:useSystemKeychain:accessibility:](MCKeychain, "saveItem:withLabel:group:useSystemKeychain:accessibility:", v13, v12, v17, objc_msgSend(v19, "isInstalledForSystem"), -[MCNewCertificatePayloadHandler accessibility](self, "accessibility")));

    if (!v20)
    {
      CFRelease(v13);
      v14 = (id)objc_claimAutoreleasedReturnValue(-[MCNewPlainCertificatePayloadHandler _cannotStoreCertificateError](self, "_cannotStoreCertificateError"));
      v9 = v32;
      a6 = v33;
      goto LABEL_17;
    }
    -[MCNewPayloadHandler _touchDependencyBetweenPersistentID:andUUID:](self, "_touchDependencyBetweenPersistentID:andUUID:", v20, v12);
    objc_msgSend(v11, "setCertificatePersistentID:", v20);
    *(_QWORD *)buf = 0;
    SecIdentityCopyCertificate(v13, (SecCertificateRef *)buf);
    v21 = (__CFString *)SecCertificateCopySubjectSummary(*(SecCertificateRef *)buf);
    CFRelease(v13);
    CFRelease(*(CFTypeRef *)buf);
    objc_msgSend(v11, "setDisplayName:", v21);

    v14 = 0;
    v9 = v32;
    a6 = v33;
    goto LABEL_16;
  }
LABEL_17:
  if (a6 && v14)
    *a6 = objc_msgSend(v14, "MCCopyAsPrimaryError");

  return v14 == 0;
}

- (void)setAside
{
  objc_super v3;

  -[MCNewPlainCertificatePayloadHandler _revertFullSSLTrustIfNeeded](self, "_revertFullSSLTrustIfNeeded");
  v3.receiver = self;
  v3.super_class = (Class)MCNewPlainCertificatePayloadHandler;
  -[MCNewCertificatePayloadHandler setAside](&v3, "setAside");
}

- (void)unsetAside
{
  void *v3;
  void *v4;
  id v5;
  const void *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  objc_super v13;
  uint8_t buf[4];
  uint64_t v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "profile"));
  if (objc_msgSend(v4, "shouldHaveFullSSLTrust") && objc_msgSend(v3, "isRoot"))
  {
    v5 = objc_msgSend(v3, "copyCertificate");
    if (v5)
    {
      v6 = v5;
      v7 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "On payload unset aside: restoring full SSL trust policy of root cert.", buf, 2u);
      }
      v8 = SecTrustStoreForDomain(2);
      v9 = SecTrustStoreSetTrustSettings(v8, v6, 0);
      if (v9)
      {
        v10 = v9;
        v11 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          v15 = v10;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to restore full SSL trust trust policy for certificate: %ld", buf, 0xCu);
        }
      }
      CFRelease(v6);
    }
  }
  else
  {
    v12 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Root cert was not installed with full trust from payload.", buf, 2u);
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)MCNewPlainCertificatePayloadHandler;
  -[MCNewCertificatePayloadHandler unsetAside](&v13, "unsetAside");

}

- (void)remove
{
  void *v3;
  unsigned __int8 v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  v4 = objc_msgSend(v3, "isSetAside");

  if ((v4 & 1) == 0)
    -[MCNewPlainCertificatePayloadHandler _revertFullSSLTrustIfNeeded](self, "_revertFullSSLTrustIfNeeded");
  v5.receiver = self;
  v5.super_class = (Class)MCNewPlainCertificatePayloadHandler;
  -[MCNewCertificatePayloadHandler remove](&v5, "remove");
}

- (void)_revertFullSSLTrustIfNeeded
{
  MCNewPlainCertificatePayloadHandler *v2;
  void *v3;
  void *v4;
  unsigned int v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *j;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  unsigned int v28;
  NSObject *v29;
  id v30;
  const void *v31;
  const char *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  uint64_t v36;
  MCNewPlainCertificatePayloadHandler *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  uint64_t v55;
  __int16 v56;
  void *v57;
  _BYTE v58[128];
  _BYTE v59[128];

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "profile"));
  if (!objc_msgSend(v4, "shouldHaveFullSSLTrust"))
  {
    v6 = _MCLogObjects[0];
    if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
      goto LABEL_41;
    *(_WORD *)buf = 0;
    v32 = "Root cert was not installed with full trust from payload.";
LABEL_32:
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, v32, buf, 2u);
    goto LABEL_41;
  }
  v5 = objc_msgSend(v3, "isFullyTrustedRootCert");
  v6 = _MCLogObjects[0];
  v7 = os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO);
  if (!v5)
  {
    if (!v7)
      goto LABEL_41;
    *(_WORD *)buf = 0;
    v32 = "Root cert is not fully trusted root cert, skipping partial trust restore.";
    goto LABEL_32;
  }
  if (v7)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Removing fully-trusted root cert payload.", buf, 2u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](MCDependencyManager, "sharedManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "persistentResourceID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dependentsOfParent:inDomain:", v10, kMCDMCertificateToPayloadUUIDDependencyKey));
  v12 = objc_msgSend(v11, "mutableCopy");

  objc_msgSend(v12, "removeObject:", v8);
  if (objc_msgSend(v12, "count"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](MCManifest, "sharedManifest"));
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "allInstalledProfileIdentifiers"));
    v45 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
    if (v45)
    {
      v16 = *(_QWORD *)v51;
      v38 = v8;
      v39 = v4;
      v43 = v13;
      v44 = v12;
      v36 = *(_QWORD *)v51;
      v37 = v2;
      v41 = v15;
      v42 = v14;
      do
      {
        for (i = 0; i != v45; i = (char *)i + 1)
        {
          if (*(_QWORD *)v51 != v16)
            objc_enumerationMutation(v15);
          v18 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v18, "isEqual:", v13, v36, v37) & 1) == 0)
          {
            v40 = v18;
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "installedProfileWithIdentifier:", v18));
            v46 = 0u;
            v47 = 0u;
            v48 = 0u;
            v49 = 0u;
            v20 = v12;
            v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
            if (v21)
            {
              v22 = v21;
              v23 = *(_QWORD *)v47;
              while (2)
              {
                for (j = 0; j != v22; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v47 != v23)
                    objc_enumerationMutation(v20);
                  v25 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)j);
                  v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "payloadWithUUID:", v25));
                  if (v26)
                  {
                    v27 = (void *)v26;
                    v28 = objc_msgSend(v19, "shouldHaveFullSSLTrust");

                    if (v28)
                    {
                      v33 = _MCLogObjects[0];
                      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 138543618;
                        v55 = v25;
                        v56 = 2114;
                        v57 = v40;
                        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Payload %{public}@ from profile %{public}@ has installed this root cert with full trust.", buf, 0x16u);
                      }

                      v34 = _MCLogObjects[0];
                      v8 = v38;
                      v4 = v39;
                      v13 = v43;
                      v12 = v44;
                      v14 = v42;
                      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Root cert was installed with full trust, but other certs may have a full-trust dependency. Skipping restore of partial trust.", buf, 2u);
                      }
                      goto LABEL_37;
                    }
                  }
                }
                v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
                if (v22)
                  continue;
                break;
              }
            }

            v13 = v43;
            v12 = v44;
            v16 = v36;
            v2 = v37;
            v15 = v41;
            v14 = v42;
          }
        }
        v8 = v38;
        v4 = v39;
        v45 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
      }
      while (v45);
    }

    v29 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Root cert was installed with full trust, and no other certs have a full-trust dependency. Attempting to restore partial trust.", buf, 2u);
    }
    v30 = objc_msgSend(v3, "copyCertificate");
    if (v30)
    {
      v31 = v30;
      -[MCNewPlainCertificatePayloadHandler _grantPartialNonSSLTrustPolicyForCertificate:](v2, "_grantPartialNonSSLTrustPolicyForCertificate:", v30);
      CFRelease(v31);
    }
LABEL_37:

  }
  else
  {
    v35 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "No other payloads are dependent on fully-trusted root cert that is about to be removed. Skipping restore of partial trust.", buf, 2u);
    }
  }

LABEL_41:
}

- (int)_grantPartialNonSSLTrustPolicyForCertificate:(__SecCertificate *)a3
{
  SecPolicyRef SSL;
  NSObject *v5;
  SecPolicyRef v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  NSObject *v12;
  int v14;
  uint64_t v15;
  const __CFString *v16;
  _UNKNOWN **v17;
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];

  CFRetain(a3);
  SSL = SecPolicyCreateSSL(1u, 0);
  v5 = _MCLogObjects[0];
  if (SSL)
  {
    v6 = SSL;
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Setting partial trust policy for root cert.", (uint8_t *)&v14, 2u);
    }
    v18[0] = CFSTR("kSecTrustSettingsPolicy");
    v18[1] = CFSTR("kSecTrustSettingsResult");
    v19[0] = v6;
    v19[1] = &off_1000ED148;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 2));
    v20[0] = v7;
    v16 = CFSTR("kSecTrustSettingsResult");
    v17 = &off_1000ED160;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
    v20[1] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 2));

    v10 = SecTrustStoreForDomain(2);
    v11 = SecTrustStoreSetTrustSettings(v10, a3, v9);
    if (v11)
    {
      v12 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        v14 = 134217984;
        v15 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to set partial trust policy for certificate: %ld", (uint8_t *)&v14, 0xCu);
      }
    }
    CFRelease(v6);

  }
  else
  {
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to create partial trust policy for certificate.", (uint8_t *)&v14, 2u);
    }
    v11 = -50;
  }
  CFRelease(a3);
  return v11;
}

- (id)_invalidPasscodeError
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v3 = MCCertificateErrorDomain;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "certificateFileName"));
  v5 = MCErrorArray(CFSTR("ERROR_CERTIFICATE_WRONG_PASSWORD_P_FILE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v3, 9000, v6, MCErrorTypeNeedsRetry, v4, 0));

  return v7;
}

- (id)_tooManyCertificatesError
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v3 = MCCertificateErrorDomain;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "certificateFileName"));
  v5 = MCErrorArray(CFSTR("ERROR_CERTIFICATE_TOO_MANY_CERTIFICATES_P_FILE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v3, 9001, v6, MCErrorTypeFatal, v4, 0));

  return v7;
}

- (id)_cannotStoreCertificateError
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v3 = MCCertificateErrorDomain;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "certificateFileName"));
  v5 = MCErrorArray(CFSTR("ERROR_CERTIFICATE_CANNOT_STORE_P_FILE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v3, 9002, v6, MCErrorTypeFatal, v4, 0));

  return v7;
}

- (id)_cannotStoreRootCertificateError
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v3 = MCCertificateErrorDomain;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "certificateFileName"));
  v5 = MCErrorArray(CFSTR("ERROR_CERTIFICATE_CANNOT_STORE_ROOT_P_FILE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v3, 9004, v6, MCErrorTypeFatal, v4, 0));

  return v7;
}

- (id)_malformedCertificateError
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v3 = MCCertificateErrorDomain;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "certificateFileName"));
  v5 = MCErrorArray(CFSTR("ERROR_CERTIFICATE_MALFORMED_P_FILE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v3, 9005, v6, MCErrorTypeFatal, v4, 0));

  return v7;
}

- (__SecIdentity)copyIdentityImmediatelyWithInteractionClient:(id)a3 outError:(id *)a4
{
  __SecIdentity *identity;
  __SecIdentity *v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __SecIdentity *v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  os_log_t v18;
  NSObject *v19;
  void *v20;
  __SecIdentity *v21;
  id v23;
  uint8_t buf[4];
  void *v25;

  identity = self->_identity;
  if (!identity)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload", a3));
    if (objc_msgSend(v8, "dataEncoding") == 1)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler userInputResponses](self, "userInputResponses"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "password"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[MCNewPayloadHandler prioritizeUserInput:key:overField:](MCNewPayloadHandler, "prioritizeUserInput:key:overField:", v9, CFSTR("certificatePassword"), v10));

      if (v11)
      {
        v23 = 0;
        v12 = -[MCNewPlainCertificatePayloadHandler _copyContentsOfPKCS12DataWithPasscode:outError:](self, "_copyContentsOfPKCS12DataWithPasscode:outError:", v11, &v23);
        v13 = v23;
        self->_identity = v12;
      }
      else
      {
        v13 = (id)objc_claimAutoreleasedReturnValue(-[MCNewPlainCertificatePayloadHandler _invalidPasscodeError](self, "_invalidPasscodeError"));
      }

      if (!v13)
      {
LABEL_13:
        v21 = self->_identity;
        if (v21)
        {
          CFRetain(v21);
          v6 = self->_identity;
LABEL_16:

          return v6;
        }
LABEL_15:
        v6 = 0;
        goto LABEL_16;
      }
    }
    else
    {
      v14 = MCCertificateErrorDomain;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "friendlyName"));
      v16 = MCErrorArray(CFSTR("ERROR_CERTIFICATE_NOT_IDENTITY_P_NAME"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v13 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v14, 9006, v17, MCErrorTypeFatal, v15, 0));

      if (!v13)
        goto LABEL_13;
    }
    if (a4)
      *a4 = objc_retainAutorelease(v13);
    v18 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v19 = v18;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "MCVerboseDescription"));
      *(_DWORD *)buf = 138543362;
      v25 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Cannot copy identity: %{public}@", buf, 0xCu);

    }
    goto LABEL_15;
  }
  CFRetain(identity);
  return self->_identity;
}

@end
