@implementation MSDSessionBaseTrustEvaluate

- (BOOL)trustServer:(__SecTrust *)a3 isRedirect:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  BOOL v8;
  void *v10;
  uint64_t v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  id v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;

  v4 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
  -[MSDSessionBaseTrustEvaluate setApplePKI:](self, "setApplePKI:", 1);
  if (v4)
  {
    v25 = 0;
    v8 = 0;
    if (!SecTrustEvaluate(a3, (SecTrustResultType *)&v25))
      v8 = v25 == 4 || v25 == 1;
    v10 = 0;
    goto LABEL_20;
  }
  if (!-[MSDSessionBaseTrustEvaluate trustServerWithApplePKI:](self, "trustServerWithApplePKI:", a3))
  {
    -[MSDSessionBaseTrustEvaluate setApplePKI:](self, "setApplePKI:", 0);
    if (!-[MSDSessionBaseTrustEvaluate trustServerWithAxinoePKI:](self, "trustServerWithAxinoePKI:", a3))
    {
      v20 = sub_1000604F0();
      v19 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        sub_1000C861C();
      goto LABEL_27;
    }
  }
  -[MSDSessionBaseTrustEvaluate setLeafCertificate:](self, "setLeafCertificate:", SecTrustGetCertificateAtIndex(a3, 0));
  if (!-[MSDSessionBaseTrustEvaluate leafCertificate](self, "leafCertificate"))
  {
    v18 = sub_1000604F0();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_1000C3CE8();
LABEL_27:

    v10 = 0;
LABEL_33:
    v8 = 0;
    goto LABEL_20;
  }
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "certificateHash"));
  v10 = (void *)v11;
  if (self->_applePKI || !v11)
  {
    -[MSDSessionBaseTrustEvaluate setIsDone:](self, "setIsDone:", 0);
    v8 = 0;
    goto LABEL_22;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionBaseTrustEvaluate hashForCertificate:](self, "hashForCertificate:", self->_leafCertificate));
  v13 = objc_msgSend(v10, "isEqualToData:", v12);

  v14 = sub_1000604F0();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = v15;
  if ((v13 & 1) == 0)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "hexStringRepresentation"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionBaseTrustEvaluate hashForCertificate:](self, "hashForCertificate:", self->_leafCertificate));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "hexStringRepresentation"));
      v25 = 138543618;
      v26 = v21;
      v27 = 2114;
      v28 = v23;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Certificate hash does not match the saved one - Saved:  %{public}@ - Current:  %{public}@", (uint8_t *)&v25, 0x16u);

    }
    goto LABEL_32;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v25) = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Migrating certificate pinning.", (uint8_t *)&v25, 2u);
  }

  if (!-[MSDSessionBaseTrustEvaluate saveHubCertificateIdentifer:applePKI:](self, "saveHubCertificateIdentifer:applePKI:", -[MSDSessionBaseTrustEvaluate leafCertificate](self, "leafCertificate"), -[MSDSessionBaseTrustEvaluate applePKI](self, "applePKI")))
  {
    v24 = sub_1000604F0();
    v16 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1000C3D40();
LABEL_32:

    goto LABEL_33;
  }
  v8 = 1;
LABEL_20:
  -[MSDSessionBaseTrustEvaluate setIsDone:](self, "setIsDone:", 1);
LABEL_22:

  return v8;
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
      sub_1000C8654(v14, v15, v16, v17, v18, v19, v20, v21);

    return 0;
  }
  v6 = v5;
  v7 = SecCertificateCreateWithData(kCFAllocatorDefault, v5);
  if (!v7)
  {
    v22 = sub_1000604F0();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      sub_1000C86C4(v23, v24, v25, v26, v27, v28, v29, v30);

    CFRelease(v6);
    return 0;
  }
  v8 = v7;
  if (!-[MSDSessionBaseTrustEvaluate trustServer:withRootCA:withHostName:](self, "trustServer:withRootCA:withHostName:", a3, v7, 0))
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
      sub_1000C8734(v12, v13, v14, v15, v16, v17, v18, v19);

    return 0;
  }
  v6 = v5;
  v7 = SecCertificateCreateWithData(kCFAllocatorDefault, v5);
  if (!v7)
  {
    v20 = sub_1000604F0();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_1000C87A4(v21, v22, v23, v24, v25, v26, v27, v28);

    CFRelease(v6);
    return 0;
  }
  v8 = v7;
  if (-[MSDSessionBaseTrustEvaluate trustServer:withRootCA:withHostName:](self, "trustServer:withRootCA:withHostName:", a3, v7, CFSTR("hub.iosdm.local")))
  {
    v9 = 1;
  }
  else
  {
    v9 = -[MSDSessionBaseTrustEvaluate trustServer:withRootCA:withHostName:](self, "trustServer:withRootCA:withHostName:", a3, v8, CFSTR("hub.iosdm.net"));
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
        sub_1000C8884(v28, v29, v30, v31, v32, v33, v34, v35);

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
        v52 = "-[MSDSessionBaseTrustEvaluate trustServer:withRootCA:withHostName:]";
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
    sub_1000C8814(v19, v20, v21, v22, v23, v24, v25, v26);

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
    v4 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x14uLL, 0x3345E798uLL);
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
      sub_1000C88F4(v9, v10, v11, v12, v13, v14, v15, v16);

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
  void *v4;
  void *v5;
  unsigned __int8 v6;
  BOOL v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionBaseTrustEvaluate identifierFor:applePKI:](self, "identifierFor:applePKI:", a3, a4));
  v7 = 0;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
    v6 = objc_msgSend(v5, "saveHubCertificateIdentifer:", v4);

    if ((v6 & 1) != 0)
      v7 = 1;
  }

  return v7;
}

- (BOOL)isDone
{
  return self->_isDone;
}

- (void)setIsDone:(BOOL)a3
{
  self->_isDone = a3;
}

- (BOOL)applePKI
{
  return self->_applePKI;
}

- (void)setApplePKI:(BOOL)a3
{
  self->_applePKI = a3;
}

- (__SecCertificate)leafCertificate
{
  return self->_leafCertificate;
}

- (void)setLeafCertificate:(__SecCertificate *)a3
{
  self->_leafCertificate = a3;
}

@end
