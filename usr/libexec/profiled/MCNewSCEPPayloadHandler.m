@implementation MCNewSCEPPayloadHandler

- (void)dealloc
{
  __SecIdentity *identity;
  objc_super v4;

  identity = self->_identity;
  if (identity)
    CFRelease(identity);
  v4.receiver = self;
  v4.super_class = (Class)MCNewSCEPPayloadHandler;
  -[MCNewSCEPPayloadHandler dealloc](&v4, "dealloc");
}

- (id)userInputFields
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "challenge"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v5 = MCLocalizedString(CFSTR("SCEP_CHALLENGE_TITLE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "friendlyName"));
    v8 = MCLocalizedFormat(CFSTR("SCEP_CHALLENGE_P_NAME"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:](MCNewPayloadHandler, "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:", CFSTR("challenge"), v6, v9, 0, 0, 0, 0, 0, 3));
    objc_msgSend(v4, "addObject:", v10);

  }
  return v4;
}

- (id)_SCEPOperationURLWithBaseURLString:(id)a3 operation:(id)a4 message:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v17;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_msgSend(objc_alloc((Class)NSURLComponents), "initWithString:", v9);

  v11 = objc_msgSend(objc_alloc((Class)NSURLQueryItem), "initWithName:value:", CFSTR("operation"), v8);
  v17 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
  v13 = objc_msgSend(v12, "mutableCopy");

  if (v7)
  {
    v14 = objc_msgSend(objc_alloc((Class)NSURLQueryItem), "initWithName:value:", CFSTR("message"), v7);
    objc_msgSend(v13, "addObject:", v14);

  }
  objc_msgSend(v10, "setQueryItems:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URL"));

  return v15;
}

+ (id)mutableATSExceptionInExceptionDomains:(id)a3 matchingHost:(id)a4
{
  id v5;
  id v6;
  id i;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;

  v5 = a3;
  v6 = a4;
  for (i = v6; ; i = (id)v16)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", i));
    v9 = objc_opt_class(NSMutableDictionary);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) == 0)
      goto LABEL_7;
    v10 = v8;
    v11 = v10;
    if (i == v6)
    {
      i = v6;
      goto LABEL_12;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("NSIncludesSubdomains")));
    v13 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0 && (objc_msgSend(v12, "BOOLValue") & 1) != 0)
      break;

LABEL_7:
    v14 = (char *)objc_msgSend(i, "rangeOfString:", CFSTR("."));
    if (!v15)
    {
      v11 = 0;
      goto LABEL_12;
    }
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(i, "substringFromIndex:", v14 + 1));

  }
LABEL_12:

  return v11;
}

+ (id)atsOverrideDataWithInsecureHTTPForHost:(id)a3 fromATSOverrideData:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", a4, 1, 0, 0));
  v8 = objc_opt_class(NSMutableDictionary);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    v9 = v7;
  else
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 1));
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("NSExceptionDomains")));
  v12 = objc_opt_class(NSMutableDictionary);
  if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
  {
    v13 = v11;
  }
  else
  {
    v13 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 1));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("NSExceptionDomains"));
  }
  v14 = objc_msgSend((id)objc_opt_class(a1), "mutableATSExceptionInExceptionDomains:matchingHost:", v13, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  if (!v15)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 1));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, v6);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("NSExceptionAllowsInsecureHTTPLoads"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v10, 200, 0, 0));
  return v17;
}

+ (void)allowInsecureHTTPLoadsOfURL:(id)a3 forConfiguration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_class(a1);
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "host"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lowercaseString"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_atsContext"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "atsOverrideDataWithInsecureHTTPForHost:fromATSOverrideData:", v9, v10));
  objc_msgSend(v6, "set_atsContext:", v11);

}

- (id)_synchronousTransactionWithURL:(id)a3 method:(id)a4 content:(id)a5 contentType:(id)a6 outResponseCode:(int64_t *)a7 outContentType:(id *)a8 outError:(id *)a9
{
  id v15;
  void *v16;
  NSObject *v17;
  dispatch_semaphore_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  id v35;
  id v36;
  void *v37;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  _QWORD v46[4];
  NSObject *v47;
  __int128 *p_buf;
  uint8_t v49[4];
  id v50;
  __int16 v51;
  void *v52;
  __int128 buf;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;

  v15 = a3;
  v42 = a4;
  v43 = a5;
  v44 = a6;
  v45 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:](NSMutableURLRequest, "requestWithURL:", v15));
  objc_msgSend(v16, "setHTTPMethod:", v42);
  if (v43)
    objc_msgSend(v16, "setHTTPBody:");
  if (v44)
    objc_msgSend(v16, "setValue:forHTTPHeaderField:", v44, CFSTR("Content-Type"));
  v17 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v45;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Performing synchronous URL request: %{public}@", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v54 = 0x3032000000;
  v55 = sub_100071D90;
  v56 = sub_100071DA0;
  v57 = 0;
  v18 = dispatch_semaphore_create(0);
  v19 = objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration ephemeralSessionConfiguration](NSURLSessionConfiguration, "ephemeralSessionConfiguration"));
  objc_msgSend((id)objc_opt_class(self), "allowInsecureHTTPLoadsOfURL:forConfiguration:", v45, v19);
  v40 = (void *)v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:](NSURLSession, "sessionWithConfiguration:", v19));
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_100071DA8;
  v46[3] = &unk_1000E40C0;
  p_buf = &buf;
  v21 = v18;
  v47 = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "dataTaskWithRequest:completionHandler:", v16, v46));
  objc_msgSend(v22, "resume");
  dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "response"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "error"));
  v39 = v20;
  v24 = _MCLogObjects[0];
  if (v23)
  {
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v49 = 138543618;
      v50 = v45;
      v51 = 2114;
      v52 = v23;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "URL request to %{public}@ failed. Error: %{public}@", v49, 0x16u);
    }
    if (a9)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "domain"));
      v26 = objc_msgSend(v23, "code");
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedDescription"));
      v28 = MCErrorArrayFromLocalizedDescription(v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      v30 = MCErrorTypeFatal;
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v25, v26, v29, MCErrorTypeFatal));

      v32 = MCErrorArray(CFSTR("SCEP_ERROR_NETWORK"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
      *a9 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", MCSCEPErrorDomain, 22005, v33, v31, v30, 0));

    }
    v34 = _MCLogObjects[0];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      v35 = objc_msgSend(v41, "statusCode");
      *(_DWORD *)v49 = 134217984;
      v50 = v35;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "URL request failed. Status code: %ld", v49, 0xCu);
    }

    v36 = 0;
  }
  else
  {
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v49 = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "URL request succeeded.", v49, 2u);
    }
    if (a7)
      *a7 = (int64_t)objc_msgSend(v41, "statusCode");
    if (a8)
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "allHeaderFields"));
      *a8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKey:", CFSTR("Content-Type")));

    }
    v36 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  }

  _Block_object_dispose(&buf, 8);
  return v36;
}

- (id)_invalidRAResponse
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = MCSCEPErrorDomain;
  v3 = MCErrorArray(CFSTR("SCEP_ERROR_INVALID_RA_RESPONSE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v2, 22003, v4, MCErrorTypeFatal, 0));

  return v5;
}

- (BOOL)_createKeyPairLength:(unint64_t)a3 outPublicKey:(__SecKey *)a4 outPrivateKey:(__SecKey *)a5
{
  void *v7;
  const __CFDictionary *v8;
  _QWORD v10[2];
  _QWORD v11[2];

  v11[0] = kSecAttrKeyTypeRSA;
  v10[0] = kSecAttrKeyType;
  v10[1] = kSecAttrKeySizeInBits;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v11[1] = v7;
  v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 2));

  LOBYTE(a5) = SecKeyGeneratePair(v8, a4, a5) == 0;
  return (char)a5;
}

- (id)_performPKIOperation:(id)a3 withPayload:(id)a4 usingPost:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  uint8_t buf[4];
  __CFString *v21;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = CFSTR("GET");
  if (v7)
    v12 = CFSTR("POST");
  v13 = v12;
  if (v7)
    v14 = 0;
  else
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "base64EncodedStringWithOptions:", 0));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewSCEPPayloadHandler _SCEPOperationURLWithBaseURLString:operation:message:](self, "_SCEPOperationURLWithBaseURLString:operation:message:", v10, CFSTR("PKIOperation"), v14));
  v16 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v21 = v13;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Sending CSR via %{public}@.", buf, 0xCu);
  }
  if (v7)
    v17 = v11;
  else
    v17 = 0;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewSCEPPayloadHandler _synchronousTransactionWithURL:method:content:contentType:outResponseCode:outContentType:outError:](self, "_synchronousTransactionWithURL:method:content:contentType:outResponseCode:outContentType:outError:", v15, v13, v17, CFSTR("application/x-pki-message"), 0, 0, a6));

  return v18;
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
  v10 = -[MCNewSCEPPayloadHandler copyIdentityImmediatelyWithInteractionClient:outError:](self, "copyIdentityImmediatelyWithInteractionClient:outError:", v8, &v28);
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
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Storing SCEP identity, storing with accessibility %@", buf, 0xCu);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUID"));
    v15 = kMCAppleIdentitiesKeychainGroup;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "profile"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[MCKeychain saveItem:withLabel:group:useSystemKeychain:accessibility:](MCKeychain, "saveItem:withLabel:group:useSystemKeychain:accessibility:", v10, v14, v15, objc_msgSend(v17, "isInstalledForSystem"), v12));

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUID"));
    -[MCNewPayloadHandler _touchDependencyBetweenPersistentID:andUUID:](self, "_touchDependencyBetweenPersistentID:andUUID:", v18, v19);

    CFRelease(v10);
    if (v18)
    {
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

- (__SecIdentity)copyIdentityImmediatelyWithInteractionClient:(id)a3 outError:(id *)a4
{
  id v6;
  __SecIdentity *identity;
  __SecIdentity *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unsigned __int8 v15;
  uint64_t v16;
  void *v17;
  unsigned __int8 v18;
  void *v19;
  void *v20;
  uint64_t v21;
  const __CFData *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  SecCertificateRef v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  id *v32;
  void *v33;
  os_log_t v34;
  NSObject *v35;
  void *v36;
  __SecIdentity *v37;
  NSObject *v39;
  SecCertificateRef v40;
  void *v41;
  id v42;
  uint64_t v43;
  NSObject *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  unsigned int v53;
  unsigned __int8 v54;
  unsigned int v55;
  unsigned int v56;
  void *v57;
  void *v58;
  void *v59;
  os_log_t v60;
  const char *v61;
  NSObject *v62;
  os_log_type_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  os_log_t v75;
  NSObject *v76;
  const char *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  id v82;
  NSObject *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  id v92;
  uint64_t v93;
  void *v94;
  char *v95;
  id v96;
  char *v97;
  NSObject *v98;
  void *v99;
  void *v100;
  uint64_t v101;
  id v102;
  void *v103;
  id v104;
  void *v105;
  uint64_t v106;
  void *v107;
  os_log_t v108;
  NSObject *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  os_log_t v116;
  NSObject *v117;
  void *v118;
  unint64_t v119;
  NSObject *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  NSObject *v131;
  void *v132;
  __SecCertificate *v133;
  id v134;
  void *v135;
  void *v136;
  void *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  NSObject *v142;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  void *v146;
  NSObject *v147;
  id v148;
  __SecIdentity *v149;
  uint64_t v150;
  void *v151;
  uint64_t v152;
  uint64_t v153;
  NSObject *v154;
  uint64_t v155;
  unsigned int v156;
  char v157;
  void *v158;
  void *v159;
  void *v160;
  uint64_t v161;
  id v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  unsigned int v167;
  uint64_t v168;
  id v169;
  unsigned int v170;
  void *v171;
  __SecCertificate *v172;
  id *v173;
  id *v174;
  uint64_t v175;
  unint64_t v176;
  void *v177;
  CFDataRef data;
  void *v179;
  void *v180;
  void *v181;
  id v182;
  id v183;
  uint8_t v184[8];
  id v185;
  id v186;
  id v187;
  CFTypeRef v188;
  CFTypeRef v189;
  _BYTE buf[12];
  _QWORD v191[2];

  v6 = a3;
  identity = self->_identity;
  if (identity)
  {
    CFRetain(identity);
    v8 = self->_identity;
    goto LABEL_34;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler userInputResponses](self, "userInputResponses"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "challenge"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCNewPayloadHandler prioritizeUserInput:key:overField:](MCNewPayloadHandler, "prioritizeUserInput:key:overField:", v10, CFSTR("challenge"), v11));

  v188 = 0;
  v189 = 0;
  if (v6)
  {
    v13 = MCLocalizedString(CFSTR("PROGRESS_GENERATING_KEY"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = objc_msgSend(v6, "didUpdateStatus:", v14);

    if ((v15 & 1) == 0)
      goto LABEL_14;
  }
  if (!-[MCNewSCEPPayloadHandler _createKeyPairLength:outPublicKey:outPrivateKey:](self, "_createKeyPairLength:outPublicKey:outPrivateKey:", objc_msgSend(v9, "keySize"), &v189, &v188))
  {
    v30 = MCSCEPErrorDomain;
    v31 = MCErrorArray(CFSTR("SCEP_ERROR_CANNOT_GENERATE_KEY_PAIR"));
    v32 = a4;
    v33 = (void *)objc_claimAutoreleasedReturnValue(v31);
    v25 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v30, 22001, v33, MCErrorTypeFatal, 0));

    a4 = v32;
    goto LABEL_16;
  }
  if (v6)
  {
    v16 = MCLocalizedString(CFSTR("PROGRESS_ENROLLING_CERTIFICATE"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = objc_msgSend(v6, "didUpdateStatus:", v17);

    if ((v18 & 1) == 0)
    {
LABEL_14:
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
      v25 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "userCancelledError"));

LABEL_16:
      v28 = 0;
      v26 = 0;
      goto LABEL_17;
    }
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URLString"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "CAInstanceName"));
  v21 = objc_claimAutoreleasedReturnValue(-[MCNewSCEPPayloadHandler _SCEPOperationURLWithBaseURLString:operation:message:](self, "_SCEPOperationURLWithBaseURLString:operation:message:", v19, CFSTR("GetCACert"), v20));

  v186 = 0;
  v187 = 0;
  v180 = (void *)v21;
  v22 = (const __CFData *)objc_claimAutoreleasedReturnValue(-[MCNewSCEPPayloadHandler _synchronousTransactionWithURL:method:content:contentType:outResponseCode:outContentType:outError:](self, "_synchronousTransactionWithURL:method:content:contentType:outResponseCode:outContentType:outError:", v21, CFSTR("GET"), 0, 0, 0, &v187, &v186));
  v23 = v187;
  v24 = v186;
  v179 = v23;
  if (v24)
  {
    v25 = v24;
LABEL_10:
    v26 = 0;
    v27 = 0;
    v181 = 0;
    goto LABEL_11;
  }
  data = v22;
  if (!objc_msgSend(v23, "isEqualToString:", CFSTR("application/x-x509-ca-cert")))
  {
    if (!objc_msgSend(v23, "isEqualToString:", CFSTR("application/x-x509-ca-ra-cert")))
    {
      v27 = 0;
      v41 = 0;
      goto LABEL_45;
    }
    v27 = (SecCertificateRef)SecCMSCertificatesOnlyMessageCopyCertificates(v22);
    if (!v27)
    {
      v25 = (id)objc_claimAutoreleasedReturnValue(-[MCNewSCEPPayloadHandler _invalidRAResponse](self, "_invalidRAResponse"));
      v26 = 0;
      goto LABEL_59;
    }
    *(_QWORD *)buf = 0;
    v185 = 0;
    if (SecSCEPValidateCACertMessage(v27, objc_msgSend(v9, "CAFingerprint"), 0, buf, &v185))
    {
      v25 = (id)objc_claimAutoreleasedReturnValue(-[MCNewSCEPPayloadHandler _invalidRAResponse](self, "_invalidRAResponse"));
      CFRelease(v27);
      v26 = 0;
      v27 = 0;
LABEL_59:
      v181 = 0;
      goto LABEL_11;
    }
    if (*(_QWORD *)buf && v185)
    {
      v83 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v184 = 0;
        _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEBUG, "GetCACert returned separate signing and encryption certificates for RA.", v184, 2u);
      }
      v191[0] = v185;
      v191[1] = *(_QWORD *)buf;
      v84 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v191, 2));
    }
    else
    {
      if (!*(_QWORD *)buf)
      {
        v133 = 0;
        v132 = 0;
        goto LABEL_120;
      }
      v131 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v184 = 0;
        _os_log_impl((void *)&_mh_execute_header, v131, OS_LOG_TYPE_DEBUG, "GetCACert returned an RA certificate.", v184, 2u);
      }
      v84 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", *(_QWORD *)buf));
    }
    v132 = (void *)v84;
    v133 = *(__SecCertificate **)buf;
    CFRetain(*(CFTypeRef *)buf);
LABEL_120:
    CFRelease(v27);
    v41 = v132;
    v27 = v133;
    goto LABEL_45;
  }
  v39 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "GetCACert returned a CA certificate.", buf, 2u);
  }
  v40 = SecCertificateCreateWithData(kCFAllocatorDefault, v22);
  if (!v40)
  {
    v67 = MCSCEPErrorDomain;
    v68 = MCErrorArray(CFSTR("SCEP_ERROR_INVALID_CA_RESPONSE"));
    v174 = a4;
    v69 = (void *)objc_claimAutoreleasedReturnValue(v68);
    v25 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v67, 22002, v69, MCErrorTypeFatal, 0));

    a4 = v174;
    goto LABEL_10;
  }
  v27 = v40;
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v40));
LABEL_45:
  v181 = v41;
  v42 = objc_msgSend(v41, "count");
  v177 = v12;
  if (!v27 || !v42)
  {
    v64 = MCSCEPErrorDomain;
    v65 = MCErrorArray(CFSTR("SCEP_ERROR_UNSUPPORTED_SERVER_CONFIGURATION"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
    v22 = data;
    v25 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v64, 22004, v66, MCErrorTypeFatal, 0));

    v12 = v177;
    v26 = 0;
    goto LABEL_11;
  }
  v172 = v27;
  v173 = a4;
  v43 = kSecAttrAccessibleAlwaysThisDeviceOnlyPrivate;
  v44 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v43;
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, "Temporarily storing SCEP server certificate, storing with accessibility %@", buf, 0xCu);
  }
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUID"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-signing"), v45));
  v47 = kMCAppleCertificatesKeychainGroup;
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  v49 = v43;
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "profile"));
  v175 = v47;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[MCKeychain saveItem:withLabel:group:useSystemKeychain:accessibility:](MCKeychain, "saveItem:withLabel:group:useSystemKeychain:accessibility:", v172, v46, v47, objc_msgSend(v50, "isInstalledForSystem"), v49));

  v166 = v26;
  if (!v26)
  {
    v70 = MCSCEPErrorDomain;
    v71 = MCErrorArray(CFSTR("SCEP_ERROR_CANNOT_STORE_CA_CERT"));
    v72 = objc_claimAutoreleasedReturnValue(v71);
    v73 = v70;
    v74 = (void *)v72;
    v25 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v73, 22012, v72, MCErrorTypeFatal, 0));
    v12 = v177;
    v22 = data;
    a4 = v173;
    goto LABEL_147;
  }
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUID"));
  -[MCNewPayloadHandler _touchDependencyBetweenPersistentID:andUUID:](self, "_touchDependencyBetweenPersistentID:andUUID:", v26, v51);

  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "CACaps"));
  if (v52)
    goto LABEL_51;
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URLString"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "CAInstanceName"));
  v80 = objc_claimAutoreleasedReturnValue(-[MCNewSCEPPayloadHandler _SCEPOperationURLWithBaseURLString:operation:message:](self, "_SCEPOperationURLWithBaseURLString:operation:message:", v78, CFSTR("GetCACaps"), v79));

  v74 = (void *)v80;
  v183 = 0;
  v81 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewSCEPPayloadHandler _synchronousTransactionWithURL:method:content:contentType:outResponseCode:outContentType:outError:](self, "_synchronousTransactionWithURL:method:content:contentType:outResponseCode:outContentType:outError:", v80, CFSTR("GET"), 0, 0, 0, 0, &v183));
  v82 = v183;
  v12 = v177;
  if (v82)
  {
    v25 = v82;
    v165 = v81;
    v26 = 0;
    a4 = v173;
    v22 = data;

    goto LABEL_147;
  }
  if (objc_msgSend(v81, "length"))
  {
    v134 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v81, 4);
    v135 = v74;
    v136 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR("\r\n")));
    v137 = v81;
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v134, "componentsSeparatedByCharactersInSet:", v136));

    if (v52)
    {
LABEL_51:
      v167 = objc_msgSend(v52, "containsObject:", CFSTR("POSTPKIOperation"));
      v53 = objc_msgSend(v52, "containsObject:", CFSTR("AES"));
      v54 = objc_msgSend(v52, "containsObject:", CFSTR("DES3"));
      v55 = objc_msgSend(v52, "containsObject:", CFSTR("SHA-512"));
      v56 = objc_msgSend(v52, "containsObject:", CFSTR("SHA-256"));
      v170 = objc_msgSend(v52, "containsObject:", CFSTR("SHA-1"));
      v160 = v52;
      goto LABEL_52;
    }
  }
  else
  {

  }
  v154 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v154, OS_LOG_TYPE_DEFAULT, "Did not receive GetCACaps information from SCEP server. Assuming support for SHA-1 only.", buf, 2u);
  }
  v160 = 0;
  v56 = 0;
  v55 = 0;
  v54 = 0;
  v53 = 0;
  v167 = 0;
  v170 = 1;
LABEL_52:
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 5));
  v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v9, "usageFlags")));
  objc_msgSend(v57, "setObject:forKeyedSubscript:", v58, kSecCertificateKeyUsage);

  objc_msgSend(v57, "setObject:forKeyedSubscript:", v177, kSecCSRChallengePassword);
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "subjectAltName"));
  objc_msgSend(v57, "setObject:forKeyedSubscript:", v59, kSecSubjectAltName);

  v164 = v57;
  if (v53)
  {
    objc_msgSend(v57, "setObject:forKeyedSubscript:", kSecCMSEncryptionAlgorithmAESCBC, kSecCMSBulkEncryptionAlgorithm);
    v60 = _MCLogObjects[0];
    if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
      goto LABEL_64;
    *(_WORD *)buf = 0;
    v61 = "SCEP: AES is supported.";
    v62 = v60;
    v63 = OS_LOG_TYPE_INFO;
    goto LABEL_63;
  }
  if ((v54 & 1) == 0)
  {
    v75 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v61 = "Insufficient required capability from Certificate Authority. AES, 3DES not supported. Falling back to 3DES anyway.";
      v62 = v75;
      v63 = OS_LOG_TYPE_ERROR;
LABEL_63:
      _os_log_impl((void *)&_mh_execute_header, v62, v63, v61, buf, 2u);
    }
  }
LABEL_64:
  v12 = v177;
  if (v55)
  {
    objc_msgSend(v164, "setObject:forKeyedSubscript:", kSecCMSHashingAlgorithmSHA512, kSecCMSSignHashAlgorithm);
    v76 = _MCLogObjects[0];
    if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
      goto LABEL_81;
    *(_WORD *)buf = 0;
    v77 = "SHA-512 is supported.";
    goto LABEL_80;
  }
  if (v56)
  {
    objc_msgSend(v164, "setObject:forKeyedSubscript:", kSecCMSHashingAlgorithmSHA256, kSecCMSSignHashAlgorithm);
    v76 = _MCLogObjects[0];
    if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
      goto LABEL_81;
    *(_WORD *)buf = 0;
    v77 = "SHA-512 not supported. Falling back to SHA-256 hash.";
    goto LABEL_80;
  }
  if (!v170)
  {
    v142 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v142, OS_LOG_TYPE_ERROR, "Insufficient required capability from Certificate Authority. SHA-512, SHA-256, and SHA-1 not supported.", buf, 2u);
    }
    v143 = MCSCEPErrorDomain;
    v144 = MCErrorArray(CFSTR("SCEP_ERROR_INSUFFICIENT_CA_CAPS"));
    v123 = objc_claimAutoreleasedReturnValue(v144);
    v124 = MCErrorTypeFatal;
    v125 = v143;
    v126 = 22006;
    goto LABEL_128;
  }
  objc_msgSend(v164, "setObject:forKeyedSubscript:", kSecCMSHashingAlgorithmSHA1, kSecCMSSignHashAlgorithm);
  v76 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    v77 = "SHA-512 & SHA-256 not supported. Falling back to SHA-1 hash.";
LABEL_80:
    _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_INFO, v77, buf, 2u);
  }
LABEL_81:
  v85 = SecSCEPCreateTemporaryIdentity(v189, v188);
  if (!v85)
  {
    v121 = MCSCEPErrorDomain;
    v122 = MCErrorArray(CFSTR("SCEP_ERROR_CANNOT_CREATE_TEMP_IDENTITY"));
    v123 = objc_claimAutoreleasedReturnValue(v122);
    v124 = MCErrorTypeFatal;
    v125 = v121;
    v126 = 22009;
LABEL_128:
    v25 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v125, v126, v123, v124, 0));
    v145 = (void *)v123;
    v26 = 0;
    a4 = v173;
    v22 = data;
    v74 = v160;
    goto LABEL_146;
  }
  v26 = (void *)v85;
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUID"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-tempID"), v86));
  v88 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "profile"));
  v90 = objc_claimAutoreleasedReturnValue(+[MCKeychain saveItem:withLabel:group:useSystemKeychain:](MCKeychain, "saveItem:withLabel:group:useSystemKeychain:", v26, v87, v175, objc_msgSend(v89, "isInstalledForSystem")));

  v159 = (void *)v90;
  if (!v90)
  {
    v127 = MCSCEPErrorDomain;
    v128 = MCErrorArray(CFSTR("SCEP_ERROR_CANNOT_STORE_TEMP_IDENTITY"));
    v129 = objc_claimAutoreleasedReturnValue(v128);
    v25 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v127, 22010, v129, MCErrorTypeFatal, 0));
    v130 = (void *)v129;
    v12 = v177;
    v22 = data;
    a4 = v173;
    v74 = v160;
    goto LABEL_145;
  }
  v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUID"));
  -[MCNewPayloadHandler _touchDependencyBetweenPersistentID:andUUID:](self, "_touchDependencyBetweenPersistentID:andUUID:", v90, v91);

  v92 = objc_msgSend(v9, "subject");
  v93 = SecSCEPGenerateCertificateRequest(v92, v164, v189, v188, v26, v181);
  v158 = (void *)v93;
  if (!v93)
  {
    v138 = MCSCEPErrorDomain;
    v139 = MCErrorArray(CFSTR("SCEP_ERROR_CANNOT_CREATE_CSR"));
    v140 = objc_claimAutoreleasedReturnValue(v139);
    v25 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v138, 22011, v140, MCErrorTypeFatal, 0));
    v141 = (void *)v140;
    v12 = v177;
    v22 = data;
    a4 = v173;
    v74 = v160;
    goto LABEL_144;
  }
  v94 = (void *)v93;
  v95 = (char *)objc_msgSend(v9, "retries") + 1;
  v156 = objc_msgSend(v9, "retryDelay");
  v96 = v94;
  v25 = 0;
  v168 = MCErrorTypeFatal;
  v161 = MCSCEPErrorDomain;
  v157 = 1;
  v162 = v96;
  v169 = v96;
  v12 = v177;
  a4 = v173;
LABEL_85:
  v97 = v95;
  while (1)
  {
    v176 = (unint64_t)v97;
    v98 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEFAULT, "Attempting to retrieve issued certificate...", buf, 2u);
    }

    v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URLString"));
    v182 = 0;
    v100 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewSCEPPayloadHandler _performPKIOperation:withPayload:usingPost:error:](self, "_performPKIOperation:withPayload:usingPost:error:", v99, v169, v167, &v182));
    v25 = v182;

    if (v25)
    {

      v176 = 0;
      goto LABEL_104;
    }
    v185 = 0;
    v101 = SecSCEPVerifyReply(v162, v100, v181, &v185);
    v102 = v185;
    v163 = (void *)v101;
    if (v101)
      break;
    v171 = v100;
    if (v185)
    {
      v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v185, "domain"));
      v104 = objc_msgSend(v102, "code");
      v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "localizedDescription"));
      v106 = MCErrorArrayFromLocalizedDescription(v105);
      v107 = (void *)objc_claimAutoreleasedReturnValue(v106);
      v25 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v103, v104, v107, v168));

      v108 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        v109 = v108;
        v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "MCVerboseDescription"));
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v110;
        _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_ERROR, "Certificate retrieval reported error: %{public}@", buf, 0xCu);

      }
      v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "domain"));
      if ((objc_msgSend(v111, "isEqualToString:", CFSTR("PENDING")) & 1) != 0)
      {
        v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "userInfo"));

        a4 = v173;
        if (v112)
        {
          v113 = v169;
          v169 = (id)SecSCEPGetCertInitial(v172, objc_msgSend(v9, "subject"), 0, objc_msgSend(v102, "userInfo"), v26, v181);
          goto LABEL_99;
        }
      }
      else
      {

        a4 = v173;
      }
    }
    else
    {
      v25 = 0;
    }
    v114 = MCErrorArray(CFSTR("SCEP_ERROR_INVALID_PKI_RESPONSE"));
    v113 = (void *)objc_claimAutoreleasedReturnValue(v114);
    v115 = objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v161, 22013, v113, v168, 0));

    v176 = 0;
    v25 = (id)v115;
LABEL_99:

    if (v25)
    {
      v12 = v177;
LABEL_104:
      v116 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        v117 = v116;
        v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "MCVerboseDescription"));
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v118;
        _os_log_impl((void *)&_mh_execute_header, v117, OS_LOG_TYPE_DEFAULT, "Could not retrieve issued certificate: %{public}@", buf, 0xCu);

      }
      v119 = v176;
      if ((v176 == 0) | v157 & 1)
      {
        v157 &= v176 == 0;
      }
      else
      {
        v120 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v120, OS_LOG_TYPE_DEFAULT, "Sleeping before polling SCEP server again.", buf, 2u);
        }
        sleep(v156);
        v157 = 0;
        v119 = v176;
      }
      v95 = (char *)(v119 - 1);
      if (v119 < 2)
      {
        v163 = 0;
        goto LABEL_143;
      }
      goto LABEL_85;
    }
    v12 = v177;
    v97 = (char *)(v176 - 1);
    if (v176 <= 1)
      goto LABEL_132;
  }
  v146 = v100;
  v147 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v147, OS_LOG_TYPE_DEFAULT, "Issued certificate received.", buf, 2u);
  }

  v12 = v177;
LABEL_132:
  if (objc_msgSend(v163, "count"))
  {
    v148 = objc_msgSend(v163, "objectAtIndex:", 0);
    v149 = (__SecIdentity *)SecIdentityCreate(kCFAllocatorDefault, v148, v188);
    self->_identity = v149;
    if (v149)
    {
      v25 = 0;
      goto LABEL_143;
    }
    v155 = MCErrorArray(CFSTR("SCEP_ERROR_INVALID_IDENTITY"));
    v151 = (void *)objc_claimAutoreleasedReturnValue(v155);
    v152 = v161;
    v153 = 22008;
  }
  else
  {
    v150 = MCErrorArray(CFSTR("SCEP_ERROR_INVALID_CSR_RESPONSE"));
    v151 = (void *)objc_claimAutoreleasedReturnValue(v150);
    v152 = v161;
    v153 = 22007;
  }
  v25 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v152, v153, v151, v168, 0));

LABEL_143:
  v22 = data;
  v74 = v160;
  v141 = v163;
LABEL_144:

  v130 = v158;
LABEL_145:

  v145 = v159;
LABEL_146:

LABEL_147:
  v27 = v172;
LABEL_11:

  if (v27)
    CFRelease(v27);
  v28 = v181;
LABEL_17:
  if (v189)
  {
    CFRelease(v189);
    v189 = 0;
  }
  if (v188)
  {
    CFRelease(v188);
    v188 = 0;
  }
  if (v26)
    CFRelease(v26);
  if (v6)
    objc_msgSend(v6, "didUpdateStatus:", 0);
  if (v25)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v25);
    v34 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v35 = v34;
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "MCVerboseDescription"));
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v36;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Cannot retrieve SCEP identity: %{public}@", buf, 0xCu);

    }
LABEL_32:
    v8 = 0;
  }
  else
  {
    v37 = self->_identity;
    if (!v37)
      goto LABEL_32;
    CFRetain(v37);
    v8 = self->_identity;
  }

LABEL_34:
  return v8;
}

@end
