@implementation SWCSecurityGuard

+ (SWCSecurityGuard)sharedSecurityGuard
{
  if (qword_1000372A0 != -1)
    dispatch_once(&qword_1000372A0, &stru_1000311E0);
  return (SWCSecurityGuard *)(id)qword_100037298;
}

+ (SWCSecurityGuard)new
{
  abort();
}

- (SWCSecurityGuard)init
{
  abort();
}

- (id)JSONObjectWithSignedJSONData:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  int v10;
  int v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[4];
  _QWORD v27[4];

  v5 = a3;
  v6 = objc_autoreleasePoolPush();
  v23 = 0;
  v7 = objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v5, 0, &v23));
  v8 = v23;
  if (v7)
  {
    v9 = (void *)v7;
  }
  else
  {
    v22 = 0;
    v10 = SecCMSVerifyCopyDataAndAttributes(v5, 0, 0, 0, &v22, 0);
    v11 = v10;
    if (v10 == -26275)
    {
      v9 = 0;
    }
    else
    {
      if (v10)
      {
        v19 = objc_alloc((Class)NSError);
        v27[0] = &off_100032B28;
        v26[0] = CFSTR("Line");
        v26[1] = CFSTR("Function");
        v20 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCSecurityGuard JSONObjectWithSignedJSONData:error:]"));
        v27[1] = v20;
        v27[2] = CFSTR("Failed to extract JSON object when assuming signed");
        v26[2] = NSDebugDescriptionErrorKey;
        v26[3] = NSUnderlyingErrorKey;
        v13 = objc_alloc((Class)NSError);
        v24[1] = CFSTR("Function");
        v25[0] = &off_100032B28;
        v24[0] = CFSTR("Line");
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCSecurityGuard JSONObjectWithSignedJSONData:error:]"));
        v25[1] = v14;
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v25, v24, 2));
        v16 = objc_msgSend(v13, "initWithDomain:code:userInfo:", NSOSStatusErrorDomain, v11, v15);
        v27[3] = v16;
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v27, v26, 4));
        v12 = objc_msgSend(v19, "initWithDomain:code:userInfo:", _SWCErrorDomain, 104, v17);

        v9 = 0;
        v8 = (id)v20;
      }
      else
      {
        v21 = v8;
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v22, 0, &v21));
        v12 = v21;
      }

      v8 = v12;
    }

  }
  objc_autoreleasePoolPop(v6);
  if (a4 && !v9)
    *a4 = objc_retainAutorelease(v8);

  return v9;
}

- (BOOL)verifyTrust:(__SecTrust *)a3 error:(id *)a4
{
  return -[SWCSecurityGuard verifyTrust:allowInstalledRootCertificates:error:](self, "verifyTrust:allowInstalledRootCertificates:error:", a3, 0, a4);
}

- (BOOL)verifyTrust:(__SecTrust *)a3 allowInstalledRootCertificates:(BOOL)a4 error:(id *)a5
{
  optional<SecTrustResultType> v9;
  optional<SecTrustResultType> v10;
  BOOL v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  _QWORD v19[4];

  v9 = -[SWCSecurityGuard _evaluateTrust:allowingKeychains:error:](self, "_evaluateTrust:allowingKeychains:error:", a3, 0);
  if ((*(_QWORD *)&v9 & 0xFF00000000) == 0
    || (v10 = v9, v9.var0.var1 == 5)
    && (v10 = -[SWCSecurityGuard _evaluateTrust:allowingKeychains:error:](self, "_evaluateTrust:allowingKeychains:error:", a3, 1, a5), (*(_QWORD *)&v10 & 0xFF00000000) == 0))
  {
    v12 = 0;
    goto LABEL_14;
  }
  if (v10.var0.var1 == 1)
  {
    if (a4 || -[SWCSecurityGuard _isSystemTrusted:](self, "_isSystemTrusted:", a3))
    {
      v12 = 0;
      v11 = 1;
      goto LABEL_17;
    }
    v12 = (id)objc_claimAutoreleasedReturnValue(-[SWCSecurityGuard _errorForUntrustedRootCertificateOfTrust:](self, "_errorForUntrustedRootCertificateOfTrust:", a3));
    goto LABEL_14;
  }
  if (v10.var0.var1 != 4)
  {
    v13 = objc_alloc((Class)NSError);
    v19[0] = &off_100032B40;
    v18[0] = CFSTR("Line");
    v18[1] = CFSTR("Function");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCSecurityGuard verifyTrust:allowInstalledRootCertificates:error:]"));
    v19[1] = v14;
    v19[2] = CFSTR("Disallowed trust result type.");
    v18[2] = NSDebugDescriptionErrorKey;
    v18[3] = CFSTR("TrustResultType");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v10));
    v19[3] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 4));
    v12 = objc_msgSend(v13, "initWithDomain:code:userInfo:", _SWCErrorDomain, 100, v16);

LABEL_14:
    v11 = 0;
    if (!a5)
      goto LABEL_17;
    goto LABEL_15;
  }
  v11 = -[SWCSecurityGuard _verifyExtendedValidationOfTrust:error:](self, "_verifyExtendedValidationOfTrust:error:", a3, a5);
  v12 = 0;
  if (!a5)
    goto LABEL_17;
LABEL_15:
  if (!v11)
  {
    v12 = objc_retainAutorelease(v12);
    v11 = 0;
    *a5 = v12;
  }
LABEL_17:

  return v11;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SWCSecurityGuard;
  return -[SWCSecurityGuard init](&v3, "init");
}

- (optional<SecTrustResultType>)_evaluateTrust:(__SecTrust *)a3 error:(id *)a4
{
  void *v6;
  _BOOL4 v7;
  OSStatus TrustResult;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  __CFError *v15;
  CFErrorRef v16;
  void *v17;
  id v18;
  CFDictionaryRef v19;
  void *v20;
  id v21;
  void *v22;
  __CFError *v23;
  CFErrorRef v24;
  NSObject *v25;
  unsigned __int32 v26;
  int v27;
  const mach_header_64 *v28;
  void *v30;
  SecTrustResultType result;
  CFErrorRef error;
  uint8_t buf[4];
  __SecTrust *v34;
  __int16 v35;
  CFErrorRef v36;
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[4];
  _QWORD v40[4];

  error = 0;
  v6 = objc_autoreleasePoolPush();
  v7 = SecTrustEvaluateWithError(a3, &error);
  result = kSecTrustResultInvalid;
  TrustResult = SecTrustGetTrustResult(a3, &result);
  if (!TrustResult)
  {
    v26 = result & 0xFFFFFF00;
    v27 = result;
    v28 = &_mh_execute_header;
    goto LABEL_18;
  }
  if (v7)
  {
    v9 = objc_alloc((Class)NSError);
    v40[0] = &off_100032B58;
    v39[0] = CFSTR("Line");
    v39[1] = CFSTR("Function");
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCSecurityGuard(Private) _evaluateTrust:error:]"));
    v40[1] = v30;
    v40[2] = CFSTR("Failed to get trust result type.");
    v39[2] = NSDebugDescriptionErrorKey;
    v39[3] = NSUnderlyingErrorKey;
    v10 = objc_alloc((Class)NSError);
    v37[1] = CFSTR("Function");
    v38[0] = &off_100032B58;
    v37[0] = CFSTR("Line");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCSecurityGuard(Private) _evaluateTrust:error:]"));
    v38[1] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v38, v37, 2));
    v13 = objc_msgSend(v10, "initWithDomain:code:userInfo:", NSOSStatusErrorDomain, TrustResult, v12);
    v40[3] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v40, v39, 4));
    v15 = (__CFError *)objc_msgSend(v9, "initWithDomain:code:userInfo:", _SWCErrorDomain, 100, v14);
    v16 = error;
    error = v15;

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[__CFError userInfo](error, "userInfo"));
  v18 = objc_msgSend(v17, "mutableCopy");

  if (v18)
  {
    v19 = SecTrustCopyResult(a3);
    if (v19)
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, CFSTR("TrustResult"));

    v20 = (void *)SecTrustCopyFailureDescription(a3);
    if (v20)
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, CFSTR("TrustFailureReason"));

    v21 = objc_alloc((Class)NSError);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[__CFError domain](error, "domain"));
    v23 = (__CFError *)objc_msgSend(v21, "initWithDomain:code:userInfo:", v22, -[__CFError code](error, "code"), v18);
    v24 = error;
    error = v23;

  }
  if (qword_1000372B0 != -1)
    dispatch_once(&qword_1000372B0, &stru_100031200);
  v25 = qword_1000372A8;
  if (os_log_type_enabled((os_log_t)qword_1000372A8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v34 = a3;
    v35 = 2112;
    v36 = error;
    _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Error evaluating trust %@: %@", buf, 0x16u);
    if (a4)
      goto LABEL_14;
LABEL_17:
    v26 = 0;
    v27 = 0;
    v28 = 0;
    goto LABEL_18;
  }
  if (!a4)
    goto LABEL_17;
LABEL_14:
  v26 = 0;
  v27 = 0;
  v28 = 0;
  *a4 = objc_retainAutorelease(error);
LABEL_18:
  objc_autoreleasePoolPop(v6);

  return (optional<SecTrustResultType>)((unint64_t)v28 | v27 | v26);
}

- (optional<SecTrustResultType>)_evaluateTrust:(__SecTrust *)a3 allowingKeychains:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  int KeychainsAllowed;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  optional<SecTrustResultType> v17;
  uint64_t v18;
  NSObject *v19;
  const __CFString *v20;
  id v22;
  unsigned __int8 v23;
  uint8_t buf[4];
  __SecTrust *v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  uint64_t var1;
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[4];
  _QWORD v33[4];

  v6 = a4;
  v23 = 0;
  KeychainsAllowed = SecTrustGetKeychainsAllowed(a3, &v23);
  if (KeychainsAllowed)
  {
    v10 = objc_alloc((Class)NSError);
    v33[0] = &off_100032B70;
    v32[0] = CFSTR("Line");
    v32[1] = CFSTR("Function");
    v17 = (optional<SecTrustResultType>)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCSecurityGuard(Private) _evaluateTrust:allowingKeychains:error:]"));
    v33[1] = v17;
    v33[2] = CFSTR("Failed to get whether keychains are allowed as a source of trust.");
    v32[2] = NSDebugDescriptionErrorKey;
    v32[3] = NSUnderlyingErrorKey;
    v11 = objc_alloc((Class)NSError);
    v30[1] = CFSTR("Function");
    v31[0] = &off_100032B70;
    v30[0] = CFSTR("Line");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCSecurityGuard(Private) _evaluateTrust:allowingKeychains:error:]"));
    v31[1] = v12;
    v13 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v31, v30, 2));
    v14 = objc_msgSend(v11, "initWithDomain:code:userInfo:", NSOSStatusErrorDomain, KeychainsAllowed, v13);
    v33[3] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v33, v32, 4));
    v16 = objc_msgSend(v10, "initWithDomain:code:userInfo:", _SWCErrorDomain, -1, v15);

    v17.var0.var0 = 0;
    goto LABEL_3;
  }
  SecTrustSetKeychainsAllowed(a3, v6);
  v22 = 0;
  v17 = -[SWCSecurityGuard _evaluateTrust:error:](self, "_evaluateTrust:error:", a3, &v22);
  v16 = v22;
  SecTrustSetKeychainsAllowed(a3, v23);
  LODWORD(v13) = v17.var0.var1 >> 8;
  v18 = *(_QWORD *)&v17 & 0xFF00000000;
  if ((*(_QWORD *)&v17 & 0xFF00000000) == 0)
  {
LABEL_3:
    if (a5)
    {
      v16 = objc_retainAutorelease(v16);
      v18 = 0;
      *a5 = v16;
    }
    else
    {
      v18 = 0;
    }
    goto LABEL_13;
  }
  if (qword_1000372B0 != -1)
    dispatch_once(&qword_1000372B0, &stru_100031200);
  v19 = qword_1000372A8;
  if (os_log_type_enabled((os_log_t)qword_1000372A8, OS_LOG_TYPE_DEBUG))
  {
    v20 = CFSTR("NOT ");
    *(_DWORD *)buf = 138412802;
    v25 = a3;
    if (v6)
      v20 = &stru_100031ED8;
    v26 = 2114;
    v27 = v20;
    v28 = 2048;
    var1 = v17.var0.var1;
    _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Trust result for %@ (keychains %{public}@allowed): %llu", buf, 0x20u);
  }
LABEL_13:

  return (optional<SecTrustResultType>)(v17.var0.var0 | ((v13 & 0xFFFFFF) << 8) | v18);
}

- (id)_errorForUntrustedRootCertificateOfTrust:(__SecTrust *)a3
{
  CFIndex CertificateCount;
  __SecCertificate *CertificateAtIndex;
  void *v6;
  unsigned int v7;
  const __CFString *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  id v15;
  __CFString *v17;
  _QWORD v18[4];
  _QWORD v19[4];

  CertificateCount = SecTrustGetCertificateCount(a3);
  if (CertificateCount < 1)
  {
    CertificateAtIndex = 0;
LABEL_9:
    v8 = CFSTR("Certificate is not rooted in the system trust store.");
    goto LABEL_10;
  }
  CertificateAtIndex = SecTrustGetCertificateAtIndex(a3, CertificateCount - 1);
  if (!CertificateAtIndex)
    goto LABEL_9;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_SWCPrefs sharedPrefs](_SWCPrefs, "sharedPrefs"));
  v7 = objc_msgSend(v6, "isAppleInternal");

  if (!v7)
    goto LABEL_9;
  v17 = 0;
  v8 = CFSTR("Certificate is not rooted in the system trust store.");
  if (!SecCertificateCopyCommonName(CertificateAtIndex, (CFStringRef *)&v17)
    && -[__CFString hasPrefix:](v17, "hasPrefix:", CFSTR("Apple Corporate")))
  {
    v8 = CFSTR("Root certificate appears to be issued by an internal Apple authority. Such certificates cannot be used with the public associated domains API. Internal Apple applications should use the internal associated domains API instead.");
  }

LABEL_10:
  v9 = objc_alloc((Class)NSError);
  v19[0] = &off_100032B88;
  v18[0] = CFSTR("Line");
  v18[1] = CFSTR("Function");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCSecurityGuard(Private) _errorForUntrustedRootCertificateOfTrust:]"));
  v19[1] = v10;
  v18[2] = CFSTR("RootCertificate");
  v11 = objc_claimAutoreleasedReturnValue(-[__SecCertificate description](CertificateAtIndex, "description"));
  v12 = (void *)v11;
  v13 = CFSTR("<none>");
  if (v11)
    v13 = (const __CFString *)v11;
  v18[3] = NSDebugDescriptionErrorKey;
  v19[2] = v13;
  v19[3] = v8;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 4));
  v15 = objc_msgSend(v9, "initWithDomain:code:userInfo:", _SWCErrorDomain, 103, v14);

  return v15;
}

- (BOOL)_verifyExtendedValidationOfTrust:(__SecTrust *)a3 error:(id *)a4
{
  void *v6;
  unsigned int v7;
  CFDictionaryRef v8;
  CFDictionaryRef v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v17[3];
  _QWORD v18[3];

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_SWCPrefs sharedPrefs](_SWCPrefs, "sharedPrefs"));
  v7 = objc_msgSend(v6, "verifyExtendedValidation");

  if (!v7)
    return 1;
  v8 = SecTrustCopyResult(a3);
  v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", kSecTrustExtendedValidation));
    v11 = v10;
    if (v10)
      v12 = objc_msgSend(v10, "isEqual:", &__kCFBooleanTrue);
    else
      v12 = 0;

  }
  else
  {
    v12 = 0;
  }

  if (a4 && (v12 & 1) == 0)
  {
    v13 = objc_alloc((Class)NSError);
    v18[0] = &off_100032BA0;
    v17[0] = CFSTR("Line");
    v17[1] = CFSTR("Function");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCSecurityGuard(Private) _verifyExtendedValidationOfTrust:error:]"));
    v18[1] = v14;
    v17[2] = NSDebugDescriptionErrorKey;
    v18[2] = CFSTR("Extended validation failed.");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 3));
    *a4 = objc_msgSend(v13, "initWithDomain:code:userInfo:", _SWCErrorDomain, 102, v15);

    return 0;
  }
  return v12;
}

- (BOOL)_isSystemTrusted:(__SecTrust *)a3
{
  CFIndex CertificateCount;
  SecCertificateRef CertificateAtIndex;
  SecCertificateRef v6;
  uint64_t v7;

  CertificateCount = SecTrustGetCertificateCount(a3);
  if (CertificateCount < 1)
  {
    LOBYTE(CertificateAtIndex) = 0;
  }
  else
  {
    CertificateAtIndex = SecTrustGetCertificateAtIndex(a3, CertificateCount - 1);
    if (CertificateAtIndex)
    {
      v6 = CertificateAtIndex;
      v7 = SecTrustStoreForDomain(1);
      LOBYTE(CertificateAtIndex) = SecTrustStoreContains(v7, v6) != 0;
    }
  }
  return (char)CertificateAtIndex;
}

@end
