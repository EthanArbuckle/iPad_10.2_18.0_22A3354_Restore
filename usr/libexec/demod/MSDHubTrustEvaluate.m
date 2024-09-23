@implementation MSDHubTrustEvaluate

+ (id)getTrustObject
{
  return objc_alloc_init(MSDHubTrustEvaluate);
}

- (BOOL)trustServer:(__SecTrust *)a3 forRequestType:(BOOL)a4 typeOfCommand:(unint64_t)a5
{
  _BOOL4 v6;
  void *v9;
  unsigned __int8 v10;
  id v12;
  NSObject *v13;
  void *v14;
  _BOOL8 v15;
  SecCertificateRef CertificateAtIndex;
  SecCertificateRef v17;
  char v18;
  void *v19;
  unsigned __int8 v20;
  id v21;
  NSObject *v22;
  _BOOL4 v23;
  id v24;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  int v31;
  void *v32;
  __int16 v33;
  void *v34;

  v6 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
  if (!a5)
  {
    v12 = sub_1000604F0();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      sub_1000C3CB0();

    v10 = -[MSDHubTrustEvaluate trustDAServer:](self, "trustDAServer:", a3);
    goto LABEL_13;
  }
  if (!v6)
  {
    v15 = -[MSDHubTrustEvaluate trustServerWithApplePKI:](self, "trustServerWithApplePKI:", a3);
    if (v15 || -[MSDHubTrustEvaluate trustServerWithAxinoePKI:](self, "trustServerWithAxinoePKI:", a3))
    {
      CertificateAtIndex = SecTrustGetCertificateAtIndex(a3, 0);
      if (CertificateAtIndex)
      {
        v17 = CertificateAtIndex;
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "certificateHash"));
        if (v14)
          v18 = v15;
        else
          v18 = 1;
        if ((v18 & 1) != 0)
        {
          if (a5 != 3)
          {
            if (a5 == 1
              && !-[MSDHubTrustEvaluate saveHubCertificateIdentifer:applePKI:](self, "saveHubCertificateIdentifer:applePKI:", v17, v15))
            {
              goto LABEL_43;
            }
LABEL_32:
            v10 = 1;
            goto LABEL_33;
          }
          if (-[MSDHubTrustEvaluate isHubCertificatePinnedTo:applePKI:](self, "isHubCertificatePinnedTo:applePKI:", v17, v15))
          {
            goto LABEL_32;
          }
          v30 = sub_1000604F0();
          v22 = objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            sub_1000C3D14();
        }
        else
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHubTrustEvaluate hashForCertificate:](self, "hashForCertificate:", v17));
          v20 = objc_msgSend(v14, "isEqualToData:", v19);

          v21 = sub_1000604F0();
          v22 = objc_claimAutoreleasedReturnValue(v21);
          v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
          if ((v20 & 1) != 0)
          {
            if (v23)
            {
              LOWORD(v31) = 0;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Migrating certificate pinning.", (uint8_t *)&v31, 2u);
            }

            if (-[MSDHubTrustEvaluate saveHubCertificateIdentifer:applePKI:](self, "saveHubCertificateIdentifer:applePKI:", v17, 0))
            {
              goto LABEL_32;
            }
            v24 = sub_1000604F0();
            v22 = objc_claimAutoreleasedReturnValue(v24);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              sub_1000C3D40();
          }
          else if (v23)
          {
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "hexStringRepresentation"));
            v28 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHubTrustEvaluate hashForCertificate:](self, "hashForCertificate:", v17));
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "hexStringRepresentation"));
            v31 = 138543618;
            v32 = v27;
            v33 = 2114;
            v34 = v29;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Certificate hash does not match the saved one - Saved:  %{public}@ - Current:  %{public}@", (uint8_t *)&v31, 0x16u);

          }
        }
      }
      else
      {
        v26 = sub_1000604F0();
        v22 = objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          sub_1000C3CE8();
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }
LABEL_43:
    v10 = 0;
    goto LABEL_33;
  }
  v31 = 0;
  v10 = 0;
  if (!SecTrustEvaluate(a3, (SecTrustResultType *)&v31))
    v10 = v31 == 4 || v31 == 1;
LABEL_13:
  v14 = 0;
LABEL_33:

  return v10;
}

- (BOOL)trustDAServer:(__SecTrust *)a3
{
  const __CFData *v4;
  const __CFData *v5;
  SecCertificateRef v6;
  SecCertificateRef v7;
  const __CFArray *v8;
  OSStatus v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  BOOL v13;
  id v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  OSStatus v33;
  id v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  SecTrustResultType result;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  uint64_t v47;

  v4 = CFDataCreate(kCFAllocatorDefault, byte_100174928, dword_100174CB0);
  if (!v4)
  {
    v15 = sub_1000604F0();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1000C3D6C(v16, v17, v18, v19, v20, v21, v22, v23);

    return 0;
  }
  v5 = v4;
  v6 = SecCertificateCreateWithData(kCFAllocatorDefault, v4);
  if (!v6)
  {
    v24 = sub_1000604F0();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_1000C3DDC(v25, v26, v27, v28, v29, v30, v31, v32);

    CFRelease(v5);
    return 0;
  }
  v7 = v6;
  v8 = (const __CFArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v6, 0));
  v9 = SecTrustSetAnchorCertificates(a3, v8);
  if (v9)
  {
    v33 = v9;
    v34 = sub_1000604F0();
    v12 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v45 = "-[MSDHubTrustEvaluate trustDAServer:]";
      v46 = 2048;
      v47 = v33;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: Cannot set demounit anchor certificates: %ld", buf, 0x16u);
    }
    goto LABEL_25;
  }
  result = kSecTrustResultInvalid;
  v10 = SecTrustEvaluate(a3, &result);
  if ((_DWORD)v10)
  {
    v35 = v10;
    v36 = sub_1000604F0();
    v12 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1000C3E4C(v35, v12, v37, v38, v39, v40, v41, v42);
LABEL_25:
    v13 = 0;
    goto LABEL_10;
  }
  if (result != kSecTrustResultUnspecified && result != kSecTrustResultProceed)
  {
    v13 = 0;
    goto LABEL_12;
  }
  v11 = sub_1000604F0();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Demounit server certificate is valid.", buf, 2u);
  }
  v13 = 1;
LABEL_10:

LABEL_12:
  CFRelease(v5);
  CFRelease(v7);

  return v13;
}

- (BOOL)trustServerWithApplePKI:(__SecTrust *)a3
{
  const __CFData *v5;
  const __CFData *v6;
  SecCertificateRef v7;
  SecCertificateRef v8;
  __SecCertificate *CertificateAtIndex;
  __CFString *v10;
  BOOL v11;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  NSObject *v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  CFStringRef commonName;

  commonName = 0;
  v5 = CFDataCreate(kCFAllocatorDefault, byte_100174928, dword_100174CB0);
  if (!v5)
  {
    v13 = sub_1000604F0();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1000C3EB0(v14, v15, v16, v17, v18, v19, v20, v21);

    return 0;
  }
  v6 = v5;
  v7 = SecCertificateCreateWithData(kCFAllocatorDefault, v5);
  if (!v7)
  {
    v22 = sub_1000604F0();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      sub_1000C3F20(v23, v24, v25, v26, v27, v28, v29, v30);

    CFRelease(v6);
    return 0;
  }
  v8 = v7;
  if (!-[MSDHubTrustEvaluate trustServer:withRootCA:withHostName:](self, "trustServer:withRootCA:withHostName:", a3, v7, 0))
  {
    v10 = 0;
LABEL_26:
    v11 = 0;
    goto LABEL_8;
  }
  CertificateAtIndex = SecTrustGetCertificateAtIndex(a3, 0);
  if (!CertificateAtIndex)
  {
    v31 = sub_1000604F0();
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      sub_1000C3CE8();
    goto LABEL_22;
  }
  if (SecCertificateCopyCommonName(CertificateAtIndex, &commonName))
  {
    v33 = sub_1000604F0();
    v32 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      sub_1000C3FF4();
LABEL_22:
    v10 = 0;
LABEL_25:

    goto LABEL_26;
  }
  v10 = (__CFString *)commonName;
  if ((-[__CFString hasSuffix:]((id)commonName, "hasSuffix:", CFSTR(".hubs.iosdm.demounit.net")) & 1) == 0)
  {
    v34 = sub_1000604F0();
    v32 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      sub_1000C3F90((uint64_t)v10, v32, v35, v36, v37, v38, v39, v40);
    goto LABEL_25;
  }
  v11 = 1;
LABEL_8:
  CFRelease(v6);
  CFRelease(v8);

  return v11;
}

- (BOOL)trustServerWithAxinoePKI:(__SecTrust *)a3
{
  const __CFData *v5;
  const __CFData *v6;
  SecCertificateRef v7;
  SecCertificateRef v8;
  BOOL v9;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v5 = CFDataCreate(kCFAllocatorDefault, byte_100174518, dword_100174924);
  if (!v5)
  {
    v11 = sub_1000604F0();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1000C4020(v12, v13, v14, v15, v16, v17, v18, v19);

    return 0;
  }
  v6 = v5;
  v7 = SecCertificateCreateWithData(kCFAllocatorDefault, v5);
  if (!v7)
  {
    v20 = sub_1000604F0();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_1000C4090(v21, v22, v23, v24, v25, v26, v27, v28);

    CFRelease(v6);
    return 0;
  }
  v8 = v7;
  if (-[MSDHubTrustEvaluate trustServer:withRootCA:withHostName:](self, "trustServer:withRootCA:withHostName:", a3, v7, CFSTR("hub.iosdm.local")))
  {
    v9 = 1;
  }
  else
  {
    v9 = -[MSDHubTrustEvaluate trustServer:withRootCA:withHostName:](self, "trustServer:withRootCA:withHostName:", a3, v8, CFSTR("hub.iosdm.net"));
  }
  CFRelease(v6);
  CFRelease(v8);
  return v9;
}

- (BOOL)trustServer:(__SecTrust *)a3 withRootCA:(__SecCertificate *)a4 withHostName:(id)a5
{
  SecPolicyRef SSL;
  SecPolicyRef v8;
  __CFArray *Mutable;
  CFIndex CertificateCount;
  CFIndex v11;
  CFIndex i;
  SecCertificateRef CertificateAtIndex;
  const __CFArray *v14;
  OSStatus v15;
  uint64_t v16;
  BOOL v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  OSStatus v36;
  id v37;
  NSObject *v38;
  uint64_t v39;
  id v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  SecTrustResultType result;
  SecTrustRef trust;
  uint8_t buf[4];
  const char *v52;
  __int16 v53;
  uint64_t v54;

  trust = 0;
  SSL = SecPolicyCreateSSL(1u, (CFStringRef)a5);
  if (SSL)
  {
    v8 = SSL;
    Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    CertificateCount = SecTrustGetCertificateCount(a3);
    if (CertificateCount >= 1)
    {
      v11 = CertificateCount;
      for (i = 0; i != v11; ++i)
      {
        CertificateAtIndex = SecTrustGetCertificateAtIndex(a3, i);
        CFArrayAppendValue(Mutable, CertificateAtIndex);
      }
    }
    if (SecTrustCreateWithCertificates(Mutable, v8, &trust))
    {
      v27 = sub_1000604F0();
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        sub_1000C4170(v28, v29, v30, v31, v32, v33, v34, v35);

      v17 = 0;
      v14 = 0;
      goto LABEL_24;
    }
    v14 = (const __CFArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", a4, 0));
    v15 = SecTrustSetAnchorCertificates(trust, v14);
    if (v15)
    {
      v36 = v15;
      v37 = sub_1000604F0();
      v38 = objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v52 = "-[MSDHubTrustEvaluate trustServer:withRootCA:withHostName:]";
        v53 = 2048;
        v54 = v36;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%s: Cannot set anchor certificates: %ld", buf, 0x16u);
      }

    }
    else
    {
      result = kSecTrustResultInvalid;
      v16 = SecTrustEvaluate(trust, &result);
      if ((_DWORD)v16)
      {
        v39 = v16;
        v40 = sub_1000604F0();
        v41 = objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          sub_1000C3E4C(v39, v41, v42, v43, v44, v45, v46, v47);

      }
      else if (result == kSecTrustResultUnspecified || result == kSecTrustResultProceed)
      {
        v17 = 1;
        goto LABEL_24;
      }
    }
    v17 = 0;
LABEL_24:
    CFRelease(v8);
    if (Mutable)
      CFRelease(Mutable);
    goto LABEL_26;
  }
  v18 = sub_1000604F0();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    sub_1000C4100(v19, v20, v21, v22, v23, v24, v25, v26);

  v17 = 0;
  v14 = 0;
LABEL_26:
  if (trust)
    CFRelease(trust);

  return v17;
}

- (id)hashForCertificate:(__SecCertificate *)a3
{
  CFDataRef v3;
  unsigned __int8 *v4;
  const __CFData *v5;
  void *v6;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v3 = SecCertificateCopyData(a3);
  if (v3)
  {
    v4 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x14uLL, 0xEBA24A03uLL);
    v5 = objc_retainAutorelease(v3);
    CC_SHA1(-[__CFData bytes](v5, "bytes"), (CC_LONG)-[__CFData length](v5, "length"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v4, 20));
    free(v4);
  }
  else
  {
    v8 = sub_1000604F0();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000C41E0(v9, v10, v11, v12, v13, v14, v15, v16);

    v6 = 0;
  }

  return v6;
}

- (id)identifierFor:(__SecCertificate *)a3 applePKI:(BOOL)a4
{
  __CFString *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *j;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  uint64_t v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  CFStringRef commonName;
  _BYTE v35[128];
  _BYTE v36[128];

  commonName = 0;
  if (!a4)
  {
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v7 = (id)SecCertificateCopyProperties(a3, a2);
    v25 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v25)
    {
      v8 = *(_QWORD *)v31;
      v23 = *(_QWORD *)v31;
      v24 = v7;
      do
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(_QWORD *)v31 != v8)
            objc_enumerationMutation(v7);
          v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("label")));
          v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("Subject Name"));

          if (v12)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("value")));
            v26 = 0u;
            v27 = 0u;
            v28 = 0u;
            v29 = 0u;
            v14 = v13;
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
            if (v15)
            {
              v16 = v15;
              v17 = *(_QWORD *)v27;
              while (2)
              {
                for (j = 0; j != v16; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v27 != v17)
                    objc_enumerationMutation(v14);
                  v19 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)j);
                  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("label")));
                  v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("2.5.4.45"));

                  if ((v21 & 1) != 0)
                  {
                    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("value")));

                    v4 = 0;
                    goto LABEL_26;
                  }
                }
                v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
                if (v16)
                  continue;
                break;
              }
            }

            v8 = v23;
            v7 = v24;
          }
        }
        v25 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      }
      while (v25);
    }

    goto LABEL_23;
  }
  if (SecCertificateCopyCommonName(a3, &commonName))
  {
LABEL_23:
    v4 = 0;
    goto LABEL_24;
  }
  v4 = (__CFString *)commonName;
  v5 = -[__CFString rangeOfString:]((id)commonName, "rangeOfString:", CFSTR(".hubs.iosdm.demounit.net"));
  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_24:
    v6 = 0;
    goto LABEL_26;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v4, "substringWithRange:", 0, v5));
LABEL_26:

  return v6;
}

- (BOOL)saveHubCertificateIdentifer:(__SecCertificate *)a3 applePKI:(BOOL)a4
{
  void *v5;
  void *v6;
  unsigned int v7;
  BOOL v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHubTrustEvaluate identifierFor:applePKI:](self, "identifierFor:applePKI:", a3, a4));
  if (v5
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance")),
        v7 = objc_msgSend(v6, "saveHubCertificateIdentifer:", v5),
        v6,
        v7))
  {
    -[MSDHubTrustEvaluate setHubCertificateIdentifier:](self, "setHubCertificateIdentifier:", v5);
    v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isHubCertificatePinnedTo:(__SecCertificate *)a3 applePKI:(BOOL)a4
{
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHubTrustEvaluate identifierFor:applePKI:](self, "identifierFor:applePKI:", a3, a4));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHubTrustEvaluate hubCertificateIdentifier](self, "hubCertificateIdentifier"));
    v7 = objc_msgSend(v6, "isEqualToString:", v5);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)hubCertificateIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setHubCertificateIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hubCertificateIdentifier, 0);
}

@end
