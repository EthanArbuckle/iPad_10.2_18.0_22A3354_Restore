@implementation MCNewWAPIIdentityCertificatePayloadHandler

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
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "friendlyName"));
  v5 = MCErrorArray(CFSTR("ERROR_CERTIFICATE_MALFORMED_P_FILE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v3, 9005, v6, MCErrorTypeFatal, v4, 0));

  return v7;
}

- (id)_cannotStorePEMDataError
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v3 = MCCertificateErrorDomain;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "friendlyName"));
  v5 = MCErrorArray(CFSTR("ERROR_CERTIFICATE_CANNOT_STORE_PEM_DATA_P_FILE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v3, 9003, v6, MCErrorTypeFatal, v4, 0));

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
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "friendlyName"));
  v5 = MCErrorArray(CFSTR("ERROR_CERTIFICATE_CANNOT_STORE_P_FILE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v3, 9002, v6, MCErrorTypeFatal, v4, 0));

  return v7;
}

- (BOOL)_storePEMDataInKeychain:(id)a3 UUID:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  __SecCertificate *v10;
  __SecCertificate *v11;
  CFDataRef v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  id v18;
  uint64_t v19;
  void *v21;
  id v22;
  _QWORD v23[2];
  _QWORD v24[2];

  v8 = a3;
  v9 = a4;
  v10 = (__SecCertificate *)+[MCCrypto copyCertificateRefFromPEMData:](MCCrypto, "copyCertificateRefFromPEMData:", v8);
  if (!v10)
  {
    v18 = (id)objc_claimAutoreleasedReturnValue(-[MCNewWAPIIdentityCertificatePayloadHandler _malformedCertificateError](self, "_malformedCertificateError"));
    if (!a5)
      goto LABEL_15;
    goto LABEL_13;
  }
  v11 = v10;
  v12 = SecCertificateCopyData(v10);
  CFRelease(v11);
  if (v12)
  {
    v23[0] = CFSTR("pemData");
    v23[1] = CFSTR("certData");
    v24[0] = v8;
    v24[1] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v23, 2));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v13, 200, 0, 0));
    if (v14)
    {
      v21 = v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "profile"));
      v22 = 0;
      v17 = +[MCKeychain setData:forService:account:label:description:useSystemKeychain:outError:](MCKeychain, "setData:forService:account:label:description:useSystemKeychain:outError:", v14, CFSTR("com.apple.managedconfiguration.wapi-identity"), v9, 0, 0, objc_msgSend(v16, "isInstalledForSystem"), &v22);
      v18 = v22;

      if ((v17 & 1) == 0)
      {
        v19 = objc_claimAutoreleasedReturnValue(-[MCNewWAPIIdentityCertificatePayloadHandler _cannotStorePEMDataError](self, "_cannotStorePEMDataError"));

        v18 = (id)v19;
      }
      v13 = v21;
    }
    else
    {
      v18 = (id)objc_claimAutoreleasedReturnValue(-[MCNewWAPIIdentityCertificatePayloadHandler _malformedCertificateError](self, "_malformedCertificateError"));
    }

  }
  else
  {
    v18 = (id)objc_claimAutoreleasedReturnValue(-[MCNewWAPIIdentityCertificatePayloadHandler _malformedCertificateError](self, "_malformedCertificateError"));
  }

  if (a5)
  {
LABEL_13:
    if (v18)
      *a5 = objc_retainAutorelease(v18);
  }
LABEL_15:

  return v18 == 0;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v26;
  uint8_t buf[4];
  void *v28;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload", a3, a4, a5));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pemData"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUID"));
  v26 = 0;
  -[MCNewWAPIIdentityCertificatePayloadHandler _storePEMDataInKeychain:UUID:outError:](self, "_storePEMDataInKeychain:UUID:outError:", v9, v10, &v26);
  v11 = v26;

  if (!v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pemData"));
    v13 = +[MCCrypto copyCertificateRefFromPEMData:](MCCrypto, "copyCertificateRefFromPEMData:", v12);

    if (v13)
    {
      v14 = -[MCNewCertificatePayloadHandler accessibility](self, "accessibility");
      v15 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Storing WAPI certificate, storing with accessibility %@", buf, 0xCu);
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUID"));
      v17 = kMCAppleIdentitiesKeychainGroup;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "profile"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[MCKeychain saveItem:withLabel:group:useSystemKeychain:accessibility:](MCKeychain, "saveItem:withLabel:group:useSystemKeychain:accessibility:", v13, v16, v17, objc_msgSend(v19, "isInstalledForSystem"), -[MCNewCertificatePayloadHandler accessibility](self, "accessibility")));

      CFRelease(v13);
      if (v20)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUID"));
        -[MCNewPayloadHandler _retainDependencyBetweenPersistentID:andUUID:](self, "_retainDependencyBetweenPersistentID:andUUID:", v20, v21);

        objc_msgSend(v8, "setCertificatePersistentID:", v20);
        v11 = 0;
      }
      else
      {
        v11 = (id)objc_claimAutoreleasedReturnValue(-[MCNewWAPIIdentityCertificatePayloadHandler _cannotStoreCertificateError](self, "_cannotStoreCertificateError"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUID"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "profile"));
        +[MCKeychain removeItemForService:account:label:description:useSystemKeychain:group:](MCKeychain, "removeItemForService:account:label:description:useSystemKeychain:group:", CFSTR("com.apple.managedconfiguration.wapi-identity"), v22, 0, 0, objc_msgSend(v24, "isInstalledForSystem"), 0);

      }
    }
    else
    {
      v11 = (id)objc_claimAutoreleasedReturnValue(-[MCNewWAPIIdentityCertificatePayloadHandler _malformedCertificateError](self, "_malformedCertificateError"));
    }
  }
  if (a6 && v11)
    *a6 = objc_msgSend(v11, "MCCopyAsPrimaryError");

  return v11 == 0;
}

- (void)setAside
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "profile"));
  +[MCKeychain removeItemForService:account:label:description:useSystemKeychain:group:](MCKeychain, "removeItemForService:account:label:description:useSystemKeychain:group:", CFSTR("com.apple.managedconfiguration.wapi-identity"), v4, 0, 0, objc_msgSend(v6, "isInstalledForSystem"), 0);

  v7.receiver = self;
  v7.super_class = (Class)MCNewWAPIIdentityCertificatePayloadHandler;
  -[MCNewCertificatePayloadHandler setAside](&v7, "setAside");

}

- (void)unsetAside
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pemData"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUID"));
  -[MCNewWAPIIdentityCertificatePayloadHandler _storePEMDataInKeychain:UUID:outError:](self, "_storePEMDataInKeychain:UUID:outError:", v3, v4, 0);

}

- (void)remove
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;
  objc_super v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v8.receiver = self;
  v8.super_class = (Class)MCNewWAPIIdentityCertificatePayloadHandler;
  if (!-[MCNewCertificatePayloadHandler isSetAside](&v8, "isSetAside"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "profile"));
    +[MCKeychain removeItemForService:account:label:description:useSystemKeychain:group:](MCKeychain, "removeItemForService:account:label:description:useSystemKeychain:group:", CFSTR("com.apple.managedconfiguration.wapi-identity"), v4, 0, 0, objc_msgSend(v6, "isInstalledForSystem"), 0);

  }
  v7.receiver = self;
  v7.super_class = (Class)MCNewWAPIIdentityCertificatePayloadHandler;
  -[MCNewCertificatePayloadHandler remove](&v7, "remove");

}

@end
