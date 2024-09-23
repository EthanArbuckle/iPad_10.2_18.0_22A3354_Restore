@implementation MSDBAAInterface

+ (id)sharedInstance
{
  if (qword_100175448 != -1)
    dispatch_once(&qword_100175448, &stru_10013F0F8);
  return (id)qword_100175440;
}

- (BOOL)generateBAACertficate:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  int IsSupported;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  dispatch_time_t v14;
  id v15;
  NSObject *v16;
  BOOL v17;
  _QWORD v19[5];
  NSObject *v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  _QWORD v27[4];
  uint8_t buf[4];
  int v29;

  v4 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v5 = dispatch_semaphore_create(0);
  IsSupported = DeviceIdentityIsSupported();
  v7 = sub_1000604F0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v29 = IsSupported;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Device identity supported on this device: %d", buf, 8u);
  }

  v9 = objc_alloc((Class)NSMutableArray);
  v27[0] = kMAOptionsBAAOIDUCRTDeviceIdentifiers;
  v27[1] = kMAOptionsBAAOIDDeviceIdentifiers;
  v27[2] = kMAOptionsBAAOIDHardwareProperties;
  v27[3] = kMAOptionsBAAOIDDeviceOSInformation;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 4));
  v11 = objc_msgSend(v9, "initWithArray:", v10);

  if (IsSupported)
  {
    v12 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v12, "setObject:forKey:", &off_10014D9E8, kMAOptionsBAACACert);
    objc_msgSend(v12, "setObject:forKey:", &off_10014DA00, kMAOptionsBAANetworkTimeoutInterval);
    objc_msgSend(v12, "setObject:forKey:", &off_10014DA18, kMAOptionsBAAValidity);
    objc_msgSend(v12, "setObject:forKey:", v11, kMAOptionsBAAOIDSToInclude);
    objc_msgSend(v12, "setObject:forKey:", CFSTR("DeKOTA-BAA-Cert"), kMAOptionsBAAKeychainLabel);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100070274;
    v19[3] = &unk_10013F120;
    v19[4] = self;
    v22 = &v23;
    v21 = v4;
    v13 = v5;
    v20 = v13;
    DeviceIdentityIssueClientCertificateWithCompletion(0, v12, v19);
    v14 = dispatch_time(0, 60000000000);
    if (dispatch_semaphore_wait(v13, v14))
    {
      v15 = sub_1000604F0();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_1000C30E4(v16);

    }
  }
  v17 = *((_BYTE *)v24 + 24) != 0;

  _Block_object_dispose(&v23, 8);
  return v17;
}

- (BOOL)addBAAAuthenticationHeadersToRequest:(id)a3 withBody:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  BOOL v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v19;
  int v20;
  void *v21;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBAAInterface signDataAndEncodeToBase64:withPrivateKey:status:](self, "signDataAndEncodeToBase64:withPrivateKey:status:", v9, -[MSDBAAInterface privateKey](self, "privateKey"), a5));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBAAInterface clientCertArray](self, "clientCertArray"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBAAInterface certificatesEncodeToBase64:status:](self, "certificatesEncodeToBase64:status:", v11, a5));

  if (v10)
    v13 = v12 == 0;
  else
    v13 = 1;
  v14 = !v13;
  if (v13)
  {
    v19 = sub_1000604F0();
    v16 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1000C3170(v16);
  }
  else
  {
    objc_msgSend(v8, "setValue:forHTTPHeaderField:", v10, CFSTR("X-Apple-RM-Signature-Data"));
    objc_msgSend(v8, "setValue:forHTTPHeaderField:", v12, CFSTR("X-Apple-RM-Signature-Certificates"));
    v15 = sub_1000604F0();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allHTTPHeaderFields"));
      v20 = 138543362;
      v21 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Request header with BAA certificate: %{public}@", (uint8_t *)&v20, 0xCu);

    }
  }

  return v14;
}

- (id)signDataAndEncodeToBase64:(id)a3 withPrivateKey:(__SecKey *)a4 status:(id *)a5
{
  CFDataRef v5;
  CFDataRef v6;
  void *v7;
  CFErrorRef error;

  error = 0;
  v5 = SecKeyCreateSignature(a4, kSecKeyAlgorithmECDSASignatureMessageX962SHA256, (CFDataRef)a3, &error);
  v6 = v5;
  if (v5)
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[__CFData base64EncodedStringWithOptions:](v5, "base64EncodedStringWithOptions:", 0));
  else
    v7 = 0;

  return v7;
}

- (id)certificatesEncodeToBase64:(id)a3 status:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBAAInterface serializeCertificateChain:](self, "serializeCertificateChain:", a3, a4));
  v9 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v4, 0, &v9));
  v6 = v5;
  if (v5)
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "base64EncodedStringWithOptions:", 0));
  else
    v7 = 0;

  return v7;
}

- (id)serializeCertificateChain:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  CFDataRef v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v3, "count")));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = SecCertificateCopyData(*(SecCertificateRef *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v9));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[__CFData base64EncodedStringWithOptions:](v10, "base64EncodedStringWithOptions:", 0, (_QWORD)v14));
        objc_msgSend(v4, "addObject:", v11);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v12 = objc_msgSend(v4, "copy");
  return v12;
}

- (void)writeCertsToDevice:(id)a3
{
  id v3;
  __SecCertificate *v4;
  __SecCertificate *v5;
  CFDataRef v6;
  CFDataRef v7;

  v3 = a3;
  v4 = (__SecCertificate *)objc_msgSend(v3, "objectAtIndex:", 0);
  v5 = (__SecCertificate *)objc_msgSend(v3, "objectAtIndex:", 1);

  v7 = SecCertificateCopyData(v4);
  v6 = SecCertificateCopyData(v5);
  -[__CFData writeToFile:atomically:](v7, "writeToFile:atomically:", CFSTR("/tmp/leafCertificate"), 1);
  -[__CFData writeToFile:atomically:](v6, "writeToFile:atomically:", CFSTR("/tmp/intermediateCertificate"), 1);

}

- (__SecKey)lockcrypto_extract_public:(id)a3
{
  id v3;
  SecPolicyRef BasicX509;
  id v5;
  NSObject *v6;
  __SecKey *v7;
  SecKeyRef v9;
  id v10;
  NSObject *v11;
  CFDataRef v12;
  id v13;
  id v14;
  NSObject *v15;
  CFErrorRef v16;
  SecTrustRef trust;

  v3 = a3;
  trust = 0;
  if (v3
    && (BasicX509 = SecPolicyCreateBasicX509()) != 0
    && !SecTrustCreateWithCertificates(v3, BasicX509, &trust)
    && (v9 = SecTrustCopyPublicKey(trust)) != 0)
  {
    v7 = v9;
    v10 = sub_1000604F0();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      sub_1000C3270((uint64_t)v7, v11);

    v16 = 0;
    v12 = SecKeyCopyExternalRepresentation(v7, &v16);
    v13 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v12, 4);
    v14 = sub_1000604F0();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      sub_1000C31F0((uint64_t)v12, (uint64_t)v13, v15);

  }
  else
  {
    v5 = sub_1000604F0();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      sub_1000C31B0(v6);

    v7 = 0;
  }

  return v7;
}

- (void)printAllKeys:(id)a3
{
  id v4;
  _UNKNOWN **v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  id v27;
  id v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  void *i;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];

  v4 = a3;
  v5 = &AATermsEntryDevice_ptr;
  v7 = objc_opt_class(NSDictionary, v6);
  if ((objc_opt_isKindOfClass(v4, v7) & 1) != 0)
  {
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v37 = v4;
    v9 = v4;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v44;
      v13 = kMAOptionsBAAOIDUCRTDeviceIdentifiers;
      v14 = kMAOptionsBAAOIDDeviceIdentifiers;
      v38 = kMAOptionsBAAOIDHardwareProperties;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v44 != v12)
            objc_enumerationMutation(v9);
          v16 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)v15);
          if ((objc_msgSend(v16, "isEqualToString:", v13) & 1) == 0
            && (objc_msgSend(v16, "isEqualToString:", v14) & 1) == 0)
          {
            objc_msgSend(v16, "isEqualToString:", v38);
          }
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v16));
          v19 = objc_opt_class(v5[274], v18);
          if ((objc_opt_isKindOfClass(v17, v19) & 1) != 0
            || (v21 = objc_opt_class(NSArray, v20), (objc_opt_isKindOfClass(v17, v21) & 1) != 0))
          {
            -[MSDBAAInterface printAllKeys:](self, "printAllKeys:", v17);
          }
          else
          {
            v23 = objc_opt_class(NSData, v22);
            if ((objc_opt_isKindOfClass(v17, v23) & 1) != 0)
            {
              v24 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v17, 4);
              NSLog(CFSTR("Key:%@ val:%@"), v16, v24);

              v5 = &AATermsEntryDevice_ptr;
            }
            else
            {
              NSLog(CFSTR("Key:%@ val:%@"), v16, v17);
            }
          }

          v15 = (char *)v15 + 1;
        }
        while (v11 != v15);
        v25 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
        v11 = v25;
      }
      while (v25);
    }

    v4 = v37;
  }
  else
  {
    v26 = objc_opt_class(NSArray, v8);
    if ((objc_opt_isKindOfClass(v4, v26) & 1) != 0)
    {
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v27 = v4;
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      if (v28)
      {
        v30 = v28;
        v31 = *(_QWORD *)v40;
        do
        {
          for (i = 0; i != v30; i = (char *)i + 1)
          {
            if (*(_QWORD *)v40 != v31)
              objc_enumerationMutation(v27);
            v33 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
            v34 = objc_opt_class(NSDictionary, v29);
            if ((objc_opt_isKindOfClass(v33, v34) & 1) == 0)
            {
              v36 = objc_opt_class(NSArray, v35);
              if ((objc_opt_isKindOfClass(v33, v36) & 1) == 0)
                continue;
            }
            -[MSDBAAInterface printAllKeys:](self, "printAllKeys:", v33);
          }
          v30 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
        }
        while (v30);
      }

    }
    else
    {
      NSLog(CFSTR("object:%@"), v4);
    }
  }

}

- (NSMutableArray)clientCertArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setClientCertArray:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (__SecKey)privateKey
{
  return self->_privateKey;
}

- (void)setPrivateKey:(__SecKey *)a3
{
  self->_privateKey = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientCertArray, 0);
}

@end
