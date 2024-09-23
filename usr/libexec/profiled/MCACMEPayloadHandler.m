@implementation MCACMEPayloadHandler

- (void)dealloc
{
  __SecIdentity *identity;
  objc_super v4;

  identity = self->_identity;
  if (identity)
    CFRelease(identity);
  v4.receiver = self;
  v4.super_class = (Class)MCACMEPayloadHandler;
  -[MCACMEPayloadHandler dealloc](&v4, "dealloc");
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  int v15;
  void *v16;
  __SecIdentity *v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  NSObject *v32;
  id *v34;
  id v35;
  id v36;
  uint8_t buf[4];
  void *v38;

  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "profile"));
  v13 = objc_msgSend(v12, "isUserEnrollmentProfile");

  if (v13)
  {
    self->_anonymous = 1;
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", kMCInstallProfileOptionIsInstalledByMDM));
    v15 = objc_msgSend(v14, "BOOLValue");

    if ((v15 & 1) != 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[MDMConfiguration sharedConfiguration](MDMConfiguration, "sharedConfiguration"));
      self->_anonymous = objc_msgSend(v16, "isUserEnrollment");

    }
    else
    {
      self->_anonymous = 0;
    }
  }
  v36 = 0;
  v17 = -[MCACMEPayloadHandler copyIdentityImmediatelyWithInteractionClient:outError:](self, "copyIdentityImmediatelyWithInteractionClient:outError:", v10, &v36);
  v18 = v36;
  if (!v18)
  {
    v34 = a6;
    v35 = v9;
    v19 = -[MCNewCertificatePayloadHandler accessibility](self, "accessibility");
    v20 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v19;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Storing ACME identity with accessibility %@", buf, 0xCu);
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUID"));
    v22 = kMCAppleIdentitiesKeychainGroup;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "profile"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[MCKeychain saveItem:withLabel:group:useSystemKeychain:accessibility:](MCKeychain, "saveItem:withLabel:group:useSystemKeychain:accessibility:", v17, v21, v22, objc_msgSend(v24, "isInstalledForSystem"), v19));

    if (v17)
      CFRelease(v17);
    if (v25)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUID"));
      -[MCNewPayloadHandler _touchDependencyBetweenPersistentID:andUUID:](self, "_touchDependencyBetweenPersistentID:andUUID:", v25, v26);

      if (v10)
      {
        v18 = 0;
        a6 = v34;
        if ((objc_msgSend(v10, "didUpdateStatus:", 0) & 1) == 0)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
          v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "userCancelledError"));

        }
      }
      else
      {
        v18 = 0;
        a6 = v34;
      }
      objc_msgSend(v11, "setCertificatePersistentID:", v25);
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUID"));
      -[MCNewPayloadHandler _retainDependencyBetweenPersistentID:andUUID:](self, "_retainDependencyBetweenPersistentID:andUUID:", v25, v31);

      v32 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "Successfully installed certificate.", buf, 2u);
      }
      v9 = v35;
    }
    else
    {
      v28 = MCCertificateErrorDomain;
      v29 = MCErrorArray(CFSTR("ERROR_CERTIFICATE_CANNOT_STORE"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
      v18 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v28, 9002, v30, MCErrorTypeFatal, 0));

      a6 = v34;
      v9 = v35;
    }

  }
  if (a6 && v18)
    *a6 = objc_msgSend(v18, "MCCopyAsPrimaryError");

  return v18 == 0;
}

- (__SecIdentity)copyIdentityImmediatelyWithInteractionClient:(id)a3 outError:(id *)a4
{
  id v6;
  __SecIdentity *identity;
  void *v8;
  unsigned __int8 v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  unsigned __int8 v18;
  id *v19;
  void *v20;
  unsigned __int8 v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  const CFBooleanRef *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  void *v45;
  const void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  const __CFString *v50;
  void *v51;
  dispatch_queue_global_t global_queue;
  void *v53;
  NSObject *v54;
  dispatch_time_t v55;
  NSObject *v56;
  uint64_t v57;
  void *v58;
  id v60;
  void *v61;
  uint8_t v62[8];
  _QWORD v63[7];
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  __int128 buf;
  uint64_t v75;
  uint64_t (*v76)(uint64_t, uint64_t);
  void (*v77)(uint64_t);
  dispatch_semaphore_t v78;

  v6 = a3;
  identity = self->_identity;
  if (!identity)
  {
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v68 = 0;
    v69 = &v68;
    v70 = 0x3032000000;
    v71 = sub_100026D28;
    v72 = sub_100026D38;
    v73 = 0;
    v64 = 0;
    v65 = &v64;
    v66 = 0x2020000000;
    v67 = 0;
    if (objc_msgSend(v61, "isHardwareBound"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCDeviceCapabilities currentDevice](MCDeviceCapabilities, "currentDevice"));
      v9 = objc_msgSend(v8, "hasSEP");

      if ((v9 & 1) == 0)
      {
        v10 = MCErrorArray(CFSTR("ACME_NO_SEP_ERROR"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        v12 = objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", MCACMEErrorDomain, 60001, v11, 0, MCErrorTypeFatal, 0));
        v13 = (void *)v69[5];
        v69[5] = v12;

      }
    }
    if (v6
      && (v14 = MCLocalizedString(CFSTR("PROGRESS_ENROLLING_CERTIFICATE")),
          v15 = (void *)objc_claimAutoreleasedReturnValue(v14),
          v16 = objc_msgSend(v6, "didUpdateStatus:", v15),
          v15,
          (v16 & 1) == 0))
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
      v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "userCancelledError"));
      v37 = (void *)v69[5];
      v69[5] = v36;

    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "keyType"));
      v18 = objc_msgSend(v17, "isEqualToString:", kMCACMEKeyTypeRSA);

      if ((v18 & 1) != 0)
      {
        v19 = (id *)&kSecAttrKeyTypeRSA;
      }
      else
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "keyType"));
        v21 = objc_msgSend(v20, "isEqualToString:", kMCACMEKeyTypeECSECPrimeRandom);

        if ((v21 & 1) == 0)
        {
          v43 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
          {
            LOWORD(buf) = 0;
            _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "Invalid ACME key type", (uint8_t *)&buf, 2u);
          }
          if (!a4)
            goto LABEL_52;
          v44 = MCErrorArray(CFSTR("ACME_INTERNAL_ERROR"));
          v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
          *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", MCACMEErrorDomain, 60000, v45, 0, MCErrorTypeFatal, 0));

          goto LABEL_51;
        }
        v19 = (id *)&kSecAttrKeyTypeECSECPrimeRandom;
      }
      v60 = *v19;
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "directoryURLString"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v22));

      if (!v23)
      {
        if (a4)
        {
          v41 = MCErrorArray(CFSTR("ACME_INTERNAL_ERROR"));
          v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
          *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", MCACMEErrorDomain, 60000, v42, 0, MCErrorTypeFatal, 0));

        }
        goto LABEL_51;
      }
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, kSecACMEDirectoryURL);
      v25 = objc_msgSend(v61, "isHardwareBound");
      v26 = &kCFBooleanTrue;
      if (!v25)
        v26 = &kCFBooleanFalse;
      objc_msgSend(v24, "setObject:forKeyedSubscript:", *v26, kSecUseHardwareBoundKey);
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v60, kSecAttrKeyType);
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v61, "keySize")));
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v27, kSecAttrKeySizeInBits);

      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "subjectAltName"));
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v28, kSecSubjectAltName);

      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v61, "usageFlags")));
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v29, kSecCertificateKeyUsage);

      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "extendedKeyUsage"));
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v30, kSecCertificateExtendedKeyUsage);

      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "clientIdentifier"));
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v31, kSecClientIdentifier);

      objc_msgSend(v24, "setObject:forKeyedSubscript:", kSecCMSHashingAlgorithmSHA256, kSecCMSSignHashAlgorithm);
      if (objc_msgSend(v61, "attest"))
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_1000ED100, &off_1000ED118, &off_1000ED130, 0));
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[DMCMobileGestalt chipID](DMCMobileGestalt, "chipID"));
        if (v33 && !objc_msgSend(v32, "containsObject:", v33))
        {
          v47 = (void *)objc_claimAutoreleasedReturnValue(+[MDMConfiguration sharedConfiguration](MDMConfiguration, "sharedConfiguration"));
          v48 = (void *)objc_claimAutoreleasedReturnValue(+[MDMSharedDefinitions oidsAnonymous:nonce:coresidency:](MDMSharedDefinitions, "oidsAnonymous:nonce:coresidency:", self->_anonymous, 1, 0));
          objc_msgSend(v24, "setObject:forKeyedSubscript:", v48, kSecAttestationOids);

        }
        else
        {
          v34 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
          {
            LOWORD(buf) = 0;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Ignoring request for attestation on unsupported device. Continuing without attestation.", (uint8_t *)&buf, 2u);
          }
        }

      }
      v49 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
      {
        if (self->_anonymous)
          v50 = &stru_1000E4AA0;
        else
          v50 = CFSTR("non-");
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v50;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "Requesting %@anonymous ACME attestation", (uint8_t *)&buf, 0xCu);
      }
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v75 = 0x3032000000;
      v76 = sub_100026D28;
      v77 = sub_100026D38;
      v78 = dispatch_semaphore_create(0);
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "subject"));
      global_queue = dispatch_get_global_queue(0, 0);
      v53 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
      v63[0] = _NSConcreteStackBlock;
      v63[1] = 3221225472;
      v63[2] = sub_100026D40;
      v63[3] = &unk_1000E38A0;
      v63[4] = &v68;
      v63[5] = &v64;
      v63[6] = &buf;
      SecRequestClientIdentity(v51, v24, v53, v63);

      v54 = *(NSObject **)(*((_QWORD *)&buf + 1) + 40);
      v55 = dispatch_time(0, 60000000000);
      if (dispatch_semaphore_wait(v54, v55))
      {
        v56 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v62 = 0;
          _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "Timeout waiting for ACME identity", v62, 2u);
        }
        if (a4)
        {
          v57 = MCErrorArray(CFSTR("ACME_TIMEOUT_ERROR"));
          v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
          *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", MCACMEErrorDomain, 60002, v58, 0, MCErrorTypeFatal, 0));

        }
        _Block_object_dispose(&buf, 8);

        goto LABEL_51;
      }
      _Block_object_dispose(&buf, 8);

      if (!v6)
      {
LABEL_22:
        v38 = (void *)v69[5];
        if (!v38)
        {
          v46 = (const void *)v65[3];
          if (v46)
          {
            CFRetain(v46);
            a4 = (id *)v65[3];
            self->_identity = (__SecIdentity *)a4;
          }
          else
          {
            a4 = (id *)self->_identity;
          }
          goto LABEL_52;
        }
        if (a4)
          *a4 = objc_retainAutorelease(v38);
        v39 = _MCLogObjects[0];
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v69[5], "MCVerboseDescription"));
          LODWORD(buf) = 138543362;
          *(_QWORD *)((char *)&buf + 4) = v40;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Cannot obtain ACME certificate: %{public}@", (uint8_t *)&buf, 0xCu);

        }
LABEL_51:
        a4 = 0;
LABEL_52:
        _Block_object_dispose(&v64, 8);
        _Block_object_dispose(&v68, 8);

        goto LABEL_53;
      }
    }
    objc_msgSend(v6, "didUpdateStatus:", 0);
    goto LABEL_22;
  }
  CFRetain(identity);
  a4 = (id *)self->_identity;
LABEL_53:

  return (__SecIdentity *)a4;
}

- (BOOL)anonymous
{
  return self->_anonymous;
}

- (void)setAnonymous:(BOOL)a3
{
  self->_anonymous = a3;
}

@end
