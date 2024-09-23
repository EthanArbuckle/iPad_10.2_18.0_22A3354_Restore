@implementation CCDDeviceIdentitySupport

+ (void)retrieveClientCertificateWithCompletion:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  SecAccessControlRef v12;
  void *v13;
  id v14;
  id v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint8_t buf[8];
  _QWORD v24[6];
  _QWORD v25[4];
  _QWORD v26[4];

  v3 = a3;
  v6 = *(NSObject **)(DEPLogObjects(v3, v4, v5) + 8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Retrieve Client Certificate.\n", buf, 2u);
  }
  v26[0] = &__kCFBooleanTrue;
  v7 = kMAOptionsBAAOIDSToInclude;
  v25[0] = CFSTR("AllowInvalidNetworkCertificates");
  v25[1] = kMAOptionsBAAOIDSToInclude;
  v24[0] = kMAOptionsBAAOIDUCRTDeviceIdentifiers;
  v24[1] = kMAOptionsBAAOIDIMG4Manifest;
  v24[2] = kMAOptionsBAAOIDDeviceIdentifiers;
  v24[3] = kMAOptionsBAAOIDHardwareProperties;
  v24[4] = kMAOptionsBAAOIDKeyUsageProperties;
  v24[5] = kMAOptionsBAAOIDDeviceOSInformation;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 6));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v8));
  v26[1] = v9;
  v26[2] = CFSTR("DEP-client-cert");
  v25[2] = kMAOptionsBAAKeychainLabel;
  v25[3] = kMAOptionsBAAKeychainAccessGroup;
  v26[3] = CFSTR("com.apple.cloudconfigd");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 4));
  v11 = objc_msgSend(v10, "mutableCopy");

  if (+[CCDDeviceUtilities isInternalBuild](CCDDeviceUtilities, "isInternalBuild")
    && !+[CCDDeviceUtilities isRunningInRootLaunchdContext](CCDDeviceUtilities, "isRunningInRootLaunchdContext")&& !+[CCDDeviceUtilities isRunningInRecovery](CCDDeviceUtilities, "isRunningInRecovery")&& !+[CCDDeviceUtilities isRunningInDiagnosticsMode](CCDDeviceUtilities, "isRunningInDiagnosticsMode"))
  {
    v12 = SecAccessControlCreateWithFlags(0, kSecAttrAccessibleAlwaysThisDeviceOnlyPrivate, 0x40000000uLL, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v7));
    objc_msgSend(v13, "addObject:", kMAOptionsBAAOIDAccessControls);

    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, kMAOptionsBAAAccessControls);
  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000021AC;
  v20[3] = &unk_1000188B8;
  v21 = v11;
  v22 = v3;
  v14 = v3;
  v15 = v11;
  v16 = objc_retainBlock(v20);
  ((void (*)(_QWORD *, uint64_t, uint64_t, uint64_t))v16[2])(v16, v17, v18, v19);

}

+ (id)_signPayloadData:(id)a3 withPrivateKey:(id)a4 outError:(id *)a5
{
  const __CFData *v7;
  __SecKey *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  CFDataRef v13;
  __CFError *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  id v20;
  CFErrorRef error;
  uint8_t buf[4];
  id v24;

  v7 = (const __CFData *)a3;
  v8 = (__SecKey *)a4;
  v11 = DEPLogObjects(v8, v9, v10);
  v12 = *(NSObject **)(v11 + 8);
  if (v7 && v8)
  {
    if (os_log_type_enabled(*(os_log_t *)(v11 + 8), OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Signing the payload with the private key...", buf, 2u);
    }
    error = 0;
    v13 = SecKeyCreateSignature(v8, kSecKeyAlgorithmECDSASignatureMessageX962SHA256, v7, &error);
    if (!v13)
    {
      v14 = error;
      v17 = *(NSObject **)(DEPLogObjects(v14, v15, v16) + 8);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = v17;
        v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[__CFError description](v14, "description")));
        v20 = objc_msgSend(v19, "UTF8String");
        *(_DWORD *)buf = 136446210;
        v24 = v20;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to create signature: %{public}s\n", buf, 0xCu);

      }
      if (a5)
        *a5 = (id)objc_claimAutoreleasedReturnValue(+[CCDError internalErrorWithCode:](CCDError, "internalErrorWithCode:", 33010));

    }
  }
  else
  {
    if (os_log_type_enabled(*(os_log_t *)(v11 + 8), OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "No private key, can't sign the payload", buf, 2u);
    }
    v13 = 0;
    if (a5)
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[CCDError internalErrorWithCode:](CCDError, "internalErrorWithCode:", 33011));
  }

  return v13;
}

+ (id)requestWithPayload:(id)a3 URL:(id)a4 privateKey:(id)a5 clientCertificates:(id)a6 outError:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  _BOOL4 v40;
  id v41;
  void *v42;
  void *v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  _BOOL8 v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  NSObject *v51;
  NSObject *v52;
  void *v53;
  void *v55;
  uint64_t v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  uint8_t buf[4];
  void *v70;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v18 = v15;
  if (v15 && (v15 = objc_msgSend(v15, "count"), v15 == (id)2))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dictionary"));
    v68 = 0;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v19, 0, &v68));
    v21 = v68;
    if (v20)
    {
      v67 = 0;
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_signPayloadData:withPrivateKey:outError:", v20, v14, &v67));
      v23 = v67;
      v66 = v23;
      if (!v22 || v23)
      {
        v45 = *(NSObject **)(DEPLogObjects(v23, v24, v25) + 8);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "Error while signing the request payload", buf, 2u);
        }
        v41 = 0;
        if (a7)
          *a7 = objc_retainAutorelease(v66);
      }
      else
      {
        v57 = v19;
        v58 = v13;
        v63 = v22;
        v56 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "base64EncodedDataWithOptions:", 0));
        v65 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v56, 4);
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndexedSubscript:", 0));
        v27 = objc_claimAutoreleasedReturnValue(+[CCDCertificateSupport base64Encodedx509CertificateStringFromCertificate:](CCDCertificateSupport, "base64Encodedx509CertificateStringFromCertificate:", v26));

        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndexedSubscript:", 1));
        v29 = objc_claimAutoreleasedReturnValue(+[CCDCertificateSupport base64Encodedx509CertificateStringFromCertificate:](CCDCertificateSupport, "base64Encodedx509CertificateStringFromCertificate:", v28));

        v30 = objc_alloc((Class)NSString);
        v62 = v20;
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "base64EncodedDataWithOptions:", 0));
        v32 = objc_msgSend(v30, "initWithData:encoding:", v31, 4);

        v34 = (void *)objc_opt_new(NSMutableDictionary, v33);
        objc_msgSend(v34, "setObject:forKeyedSubscript:", v32, CFSTR("payload"));
        objc_msgSend(v34, "setObject:forKeyedSubscript:", v65, CFSTR("payload_signature"));
        v55 = (void *)v27;
        objc_msgSend(v34, "setObject:forKeyedSubscript:", v27, CFSTR("sign_cert"));
        objc_msgSend(v34, "setObject:forKeyedSubscript:", v29, CFSTR("intermediate_cert"));
        v59 = v34;
        v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v34));
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:"));
        v64 = v21;

        v61 = (void *)v29;
        if (v35)
        {
          v39 = *(NSObject **)(DEPLogObjects(v36, v37, v38) + 8);
          v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
          v13 = v58;
          if (v58)
          {
            v19 = v57;
            if (v40)
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Setting up the request.", buf, 2u);
            }
            v41 = objc_msgSend(objc_alloc((Class)NSMutableURLRequest), "initWithURL:cachePolicy:timeoutInterval:", v58, 0, 30.0);
            objc_msgSend(v41, "setHTTPMethod:", CFSTR("POST"));
            objc_msgSend(v41, "setValue:forHTTPHeaderField:", CFSTR("3"), CFSTR("X-Profile-Protocol-Version"));
            v42 = (void *)objc_claimAutoreleasedReturnValue(+[CCDRequestSupport userAgentString](CCDRequestSupport, "userAgentString"));
            objc_msgSend(v41, "setValue:forHTTPHeaderField:", v42, CFSTR("User-Agent"));

            v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v35, "length")));
            objc_msgSend(v41, "setValue:forHTTPHeaderField:", v43, CFSTR("Content-Length"));

            objc_msgSend(v41, "setHTTPBody:", v35);
          }
          else
          {
            v19 = v57;
            if (v40)
            {
              v52 = v39;
              v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "description"));
              *(_DWORD *)buf = 138543362;
              v70 = v53;
              _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Couldn't build up the URL from string: %{public}@", buf, 0xCu);

            }
            v41 = 0;
            if (a7)
              *a7 = (id)objc_claimAutoreleasedReturnValue(+[CCDError internalErrorWithCode:](CCDError, "internalErrorWithCode:", 33012));
          }
          v50 = (void *)v56;
        }
        else
        {
          v46 = *(NSObject **)(DEPLogObjects(v36, v37, v38) + 8);
          v47 = os_log_type_enabled(v46, OS_LOG_TYPE_ERROR);
          v13 = v58;
          if (v47)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "No serial request data", buf, 2u);
          }
          v50 = (void *)v56;
          v19 = v57;
          if (a7 && v64)
            goto LABEL_31;
          v51 = *(NSObject **)(DEPLogObjects(v47, v48, v49) + 8);
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "Unknown error while serializing the request dictionary", buf, 2u);
          }
          if (a7)
          {
LABEL_31:
            v41 = 0;
            *a7 = (id)objc_claimAutoreleasedReturnValue(+[CCDError internalErrorWithCode:](CCDError, "internalErrorWithCode:", 33009));
          }
          else
          {
            v41 = 0;
          }
        }

        v20 = v62;
        v22 = v63;
        v21 = v64;
      }

    }
    else
    {
      v41 = 0;
      if (a7)
        *a7 = (id)objc_claimAutoreleasedReturnValue(+[CCDError internalErrorWithCode:](CCDError, "internalErrorWithCode:", 33009));
    }

  }
  else
  {
    v44 = *(NSObject **)(DEPLogObjects(v15, v16, v17) + 8);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "No certificate, can't do the request", buf, 2u);
    }
    v41 = 0;
    if (a7)
      *a7 = (id)objc_claimAutoreleasedReturnValue(+[CCDError internalErrorWithCode:](CCDError, "internalErrorWithCode:", 33013));
  }

  return v41;
}

@end
