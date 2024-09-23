@implementation MCSelfSignedCertificatePayloadHandler

- (void)dealloc
{
  __SecIdentity *identity;
  objc_super v4;

  identity = self->_identity;
  if (identity)
    CFRelease(identity);
  v4.receiver = self;
  v4.super_class = (Class)MCSelfSignedCertificatePayloadHandler;
  -[MCSelfSignedCertificatePayloadHandler dealloc](&v4, "dealloc");
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v8;
  void *v9;
  __SecIdentity *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id *v27;
  id v28;
  uint8_t buf[4];
  void *v30;

  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v28 = 0;
  v10 = -[MCSelfSignedCertificatePayloadHandler copyIdentityImmediatelyWithInteractionClient:outError:](self, "copyIdentityImmediatelyWithInteractionClient:outError:", v8, &v28);
  v11 = v28;
  if (!v11)
  {
    v27 = a6;
    v12 = -[MCNewCertificatePayloadHandler accessibility](self, "accessibility");
    v13 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Storing self-signed identity with accessibility %@", buf, 0xCu);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUID"));
    v15 = kMCAppleIdentitiesKeychainGroup;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "profile"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[MCKeychain saveItem:withLabel:group:useSystemKeychain:accessibility:](MCKeychain, "saveItem:withLabel:group:useSystemKeychain:accessibility:", v10, v14, v15, objc_msgSend(v17, "isInstalledForSystem"), v12));

    CFRelease(v10);
    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUID"));
      -[MCNewPayloadHandler _touchDependencyBetweenPersistentID:andUUID:](self, "_touchDependencyBetweenPersistentID:andUUID:", v18, v19);

      if (v8)
      {
        v11 = 0;
        if ((objc_msgSend(v8, "didUpdateStatus:", 0) & 1) == 0)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
          v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "userCancelledError"));

        }
      }
      else
      {
        v11 = 0;
      }
      objc_msgSend(v9, "setCertificatePersistentID:", v18);
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUID"));
      -[MCNewPayloadHandler _retainDependencyBetweenPersistentID:andUUID:](self, "_retainDependencyBetweenPersistentID:andUUID:", v18, v24);

      v25 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "Successfully installed certificate.", buf, 2u);
      }
    }
    else
    {
      v21 = MCCertificateErrorDomain;
      v22 = MCErrorArray(CFSTR("ERROR_CERTIFICATE_CANNOT_STORE"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      v11 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v21, 9002, v23, MCErrorTypeFatal, 0));

    }
    a6 = v27;

  }
  if (a6 && v11)
    *a6 = objc_msgSend(v11, "MCCopyAsPrimaryError");

  return v11 == 0;
}

- (id)_createKeyPairType:(id)a3 size:(unint64_t)a4 hardwareBound:(BOOL)a5 outPublicKey:(__SecKey *)a6 outPrivateKey:(__SecKey *)a7
{
  _BOOL4 v9;
  id v11;
  void *v12;
  const CFStringRef *v13;
  void *v14;
  __SecKey *v15;
  __SecKey *v16;
  __SecKey *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __SecKey *v21;
  CFErrorRef v22;
  CFErrorRef error;

  v9 = a5;
  v11 = a3;
  error = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 3));
  if ((objc_msgSend(v11, "isEqualToString:", kMCSSCKeyTypeRSA) & 1) != 0)
  {
    v13 = &kSecAttrKeyTypeRSA;
  }
  else
  {
    if (!objc_msgSend(v11, "isEqualToString:", kMCSSCKeyTypeECSECPrimeRandom))
      goto LABEL_6;
    v13 = &kSecAttrKeyTypeECSECPrimeRandom;
  }
  objc_msgSend(v12, "setObject:forKeyedSubscript:", *v13, kSecAttrKeyType);
LABEL_6:
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, kSecAttrKeySizeInBits);

  if (v9)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", kSecAttrTokenIDSecureEnclave, kSecAttrTokenID);
  v15 = SecKeyCreateRandomKey((CFDictionaryRef)v12, &error);
  v16 = v15;
  if (error)
  {
    v17 = 0;
  }
  else
  {
    v17 = SecKeyCopyPublicKey(v15);
    if (!v17)
    {
      v18 = MCSelfSignedCertificateErrorDomain;
      v19 = MCErrorArray(CFSTR("SSC_ERROR_CANNOT_GET_PUBLIC_KEY"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      error = (CFErrorRef)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v18, 59001, v20, MCErrorTypeFatal, 0));

    }
    if (!error)
    {
      if (a6)
      {
        *a6 = v17;
      }
      else if (v17)
      {
        CFRelease(v17);
      }
      if (a7)
      {
        *a7 = v16;
        goto LABEL_18;
      }
      if (!v16)
        goto LABEL_18;
      v21 = v16;
      goto LABEL_17;
    }
  }
  if (v16)
    CFRelease(v16);
  if (v17)
  {
    v21 = v17;
LABEL_17:
    CFRelease(v21);
  }
LABEL_18:
  v22 = error;

  return v22;
}

- (id)generateSelfSignedCertificatePublicKey:(__SecKey *)a3 privateKey:(__SecKey *)a4 keyUsage:(unsigned int)a5 extendedKeyUsage:(id)a6 lifetime:(unint64_t)a7 outCert:(__SecCertificate *)a8
{
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __SecCertificate *SelfSignedCertificate;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v32;
  _QWORD v35[2];
  void *v36;
  _QWORD v37[2];
  void *v38;
  _QWORD v39[2];

  v9 = kSecOidCommonName;
  v37[0] = kSecOidCommonName;
  v32 = a6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
  v37[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v37, 2));
  v38 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v38, 1));
  v39[0] = v13;
  v35[0] = v9;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "profile"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
  v35[1] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 2));
  v36 = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v36, 1));
  v39[1] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v39, 2));

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 3));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a5));
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, kSecCertificateKeyUsage);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a7));
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, kSecCertificateLifetime);

  objc_msgSend(v20, "setObject:forKeyedSubscript:", v32, kSecCertificateExtendedKeyUsage);
  SelfSignedCertificate = (__SecCertificate *)SecGenerateSelfSignedCertificate(v19, v20, a3, a4);
  if (SelfSignedCertificate)
  {
    if (a8)
    {
      v24 = 0;
      *a8 = SelfSignedCertificate;
    }
    else
    {
      CFRelease(SelfSignedCertificate);
      v24 = 0;
    }
  }
  else
  {
    v25 = MCSelfSignedCertificateErrorDomain;
    v26 = MCErrorArray(CFSTR("SSC_ERROR_CANNOT_GENERATE_CERTIFICATE"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v25, 59002, v27, MCErrorTypeFatal, 0));

  }
  return v24;
}

- (__SecIdentity)copyIdentityImmediatelyWithInteractionClient:(id)a3 outError:(id *)a4
{
  id v6;
  __SecIdentity *identity;
  __SecIdentity *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  unsigned __int8 v23;
  CFTypeRef v24;
  CFTypeRef v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  os_log_t v32;
  NSObject *v33;
  void *v34;
  __SecIdentity *v35;
  __SecIdentity *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  CFTypeRef v41;
  CFTypeRef v42;
  CFTypeRef cf;
  uint8_t buf[4];
  void *v45;

  v6 = a3;
  identity = self->_identity;
  if (!identity)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v42 = 0;
    cf = 0;
    v41 = 0;
    if (v6)
    {
      v10 = MCLocalizedString(CFSTR("PROGRESS_GENERATING_KEY"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v12 = objc_msgSend(v6, "didUpdateStatus:", v11);

      if ((v12 & 1) == 0)
        goto LABEL_12;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "keyType"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCSelfSignedCertificatePayloadHandler _createKeyPairType:size:hardwareBound:outPublicKey:outPrivateKey:](self, "_createKeyPairType:size:hardwareBound:outPublicKey:outPrivateKey:", v13, objc_msgSend(v9, "keySize"), objc_msgSend(v9, "isHardwareBound"), &v42, &v41));

    if (v14)
    {
      v15 = MCSelfSignedCertificateErrorDomain;
      v16 = MCErrorArray(CFSTR("SSC_ERROR_CANNOT_GENERATE_KEY_PAIR"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v18 = MCErrorTypeFatal;
      v19 = v15;
      v20 = 59000;
LABEL_11:
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v19, v20, v17, v14, v18, 0));

      goto LABEL_13;
    }
    if (v6
      && (v21 = MCLocalizedString(CFSTR("PROGRESS_GENERATING_CERTIFICATE")),
          v22 = (void *)objc_claimAutoreleasedReturnValue(v21),
          v23 = objc_msgSend(v6, "didUpdateStatus:", v22),
          v22,
          (v23 & 1) == 0))
    {
LABEL_12:
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "userCancelledError"));

    }
    else
    {
      v25 = v41;
      v24 = v42;
      v26 = objc_msgSend(v9, "keyUsage");
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "extendedKeyUsage"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCSelfSignedCertificatePayloadHandler generateSelfSignedCertificatePublicKey:privateKey:keyUsage:extendedKeyUsage:lifetime:outCert:](self, "generateSelfSignedCertificatePublicKey:privateKey:keyUsage:extendedKeyUsage:lifetime:outCert:", v24, v25, v26, v27, objc_msgSend(v9, "lifetime"), &cf));

      if (v14)
      {
        v28 = MCSelfSignedCertificateErrorDomain;
        v29 = MCErrorArray(CFSTR("SSC_ERROR_CANNOT_GENERATE_CERTIFICATE"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(v29);
        v18 = MCErrorTypeFatal;
        v19 = v28;
        v20 = 59002;
        goto LABEL_11;
      }
      v37 = (__SecIdentity *)SecIdentityCreate(kCFAllocatorDefault, cf, v41);
      self->_identity = v37;
      if (v37)
      {
        v30 = 0;
      }
      else
      {
        v38 = MCSelfSignedCertificateErrorDomain;
        v39 = MCErrorArray(CFSTR("SSC_ERROR_CANNOT_CREATE_IDENTITY"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v38, 59003, v40, MCErrorTypeFatal, 0));

      }
    }
LABEL_13:
    if (cf)
      CFRelease(cf);
    if (v42)
      CFRelease(v42);
    if (v41)
      CFRelease(v41);
    if (v6)
      objc_msgSend(v6, "didUpdateStatus:", 0);
    if (v30)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v30);
      v32 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        v33 = v32;
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "MCVerboseDescription"));
        *(_DWORD *)buf = 138543362;
        v45 = v34;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Cannot generate self-signed certificate: %{public}@", buf, 0xCu);

      }
    }
    else
    {
      v35 = self->_identity;
      if (v35)
      {
        CFRetain(v35);
        v8 = self->_identity;
LABEL_29:

        goto LABEL_30;
      }
    }
    v8 = 0;
    goto LABEL_29;
  }
  CFRetain(identity);
  v8 = self->_identity;
LABEL_30:

  return v8;
}

@end
