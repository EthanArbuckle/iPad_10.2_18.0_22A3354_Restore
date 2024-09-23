@implementation CLCertificatePinningHelper

+ (void)initialize
{
  if (qword_1023014D0 != -1)
    dispatch_once(&qword_1023014D0, &stru_10213E5D0);
}

+ (id)knownHosts
{
  return objc_msgSend((id)qword_1023014D8, "allKeys");
}

+ (int)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v7;
  __SecTrust *v8;
  NSNull *v9;
  NSNull *v10;
  const void *AppleSSLPinned;
  const void *v12;
  OSStatus v13;
  SecTrustResultType v14;
  unsigned int v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  id v23;
  const __CFString *v24;
  const char *v25;
  const char *v26;
  NSObject *v27;
  NSObject *v28;
  CFIndex Code;
  CFErrorDomain Domain;
  uint64_t v31;
  CFIndex v32;
  CFErrorDomain v33;
  CFErrorRef err;
  SecTrustResultType result;
  uint8_t buf[4];
  int v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  CFErrorDomain v43;

  if (!objc_msgSend(objc_msgSend(objc_msgSend(a4, "protectionSpace", a3), "authenticationMethod"), "isEqualToString:", NSURLAuthenticationMethodServerTrust))goto LABEL_18;
  v7 = objc_msgSend(objc_msgSend(a4, "protectionSpace"), "host");
  v8 = (__SecTrust *)objc_msgSend(objc_msgSend(a4, "protectionSpace"), "serverTrust");
  v9 = (NSNull *)objc_msgSend((id)qword_1023014D8, "objectForKeyedSubscript:", v7);
  if (v9)
  {
    v10 = v9;
    if (v9 == +[NSNull null](NSNull, "null"))
    {
      if (qword_1022A02A0 != -1)
        dispatch_once(&qword_1022A02A0, &stru_10213E5F0);
      v20 = qword_1022A02A8;
      if (!os_log_type_enabled((os_log_t)qword_1022A02A8, OS_LOG_TYPE_INFO))
      {
        v16 = 3;
        goto LABEL_21;
      }
      *(_DWORD *)buf = 68289283;
      v37 = 0;
      v38 = 2082;
      v39 = "";
      v40 = 2081;
      v41 = objc_msgSend(v7, "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#Warning Empty pinning rule for host\", \"host\":%{private, location:escape_only}s}", buf, 0x1Cu);
      v16 = 3;
      goto LABEL_19;
    }
    AppleSSLPinned = (const void *)SecPolicyCreateAppleSSLPinned(v7, v7, 0, v10);
    if (AppleSSLPinned)
    {
      v12 = AppleSSLPinned;
      v13 = SecTrustSetPolicies(v8, AppleSSLPinned);
      CFRelease(v12);
      v14 = kSecTrustResultInvalid;
      result = kSecTrustResultInvalid;
      if (v13)
      {
LABEL_8:
        if (v14 == kSecTrustResultProceed || v14 == kSecTrustResultUnspecified)
          v16 = 1;
        else
          v16 = 2;
LABEL_19:
        if (qword_1022A02A0 != -1)
          dispatch_once(&qword_1022A02A0, &stru_10213E5F0);
        goto LABEL_21;
      }
      err = 0;
      if (SecTrustEvaluateWithError(v8, &err))
      {
        SecTrustGetTrustResult(v8, &result);
        v14 = result;
        goto LABEL_8;
      }
      if (qword_1022A02A0 != -1)
        dispatch_once(&qword_1022A02A0, &stru_10213E5F0);
      v28 = qword_1022A02A8;
      if (os_log_type_enabled((os_log_t)qword_1022A02A8, OS_LOG_TYPE_ERROR))
      {
        Code = CFErrorGetCode(err);
        Domain = CFErrorGetDomain(err);
        *(_DWORD *)buf = 68289539;
        v37 = 0;
        v38 = 2082;
        v39 = "";
        v40 = 2049;
        v41 = (id)Code;
        v42 = 2113;
        v43 = Domain;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Can't SecTrustEvaluate returned the error\", \"errorCode\":%{private}ld, \"error\":%{private, location:escape_only}@}", buf, 0x26u);
        if (qword_1022A02A0 != -1)
          dispatch_once(&qword_1022A02A0, &stru_10213E5F0);
      }
      v31 = qword_1022A02A8;
      if (!os_signpost_enabled((os_log_t)qword_1022A02A8))
      {
LABEL_50:
        v16 = 2;
        goto LABEL_19;
      }
      v32 = CFErrorGetCode(err);
      v33 = CFErrorGetDomain(err);
      *(_DWORD *)buf = 68289539;
      v37 = 0;
      v38 = 2082;
      v39 = "";
      v40 = 2049;
      v41 = (id)v32;
      v42 = 2113;
      v43 = v33;
      v25 = "Can't SecTrustEvaluate returned the error";
      v26 = "{\"msg%{public}.0s\":\"Can't SecTrustEvaluate returned the error\", \"errorCode\":%{private}ld, \"error\":%{"
            "private, location:escape_only}@}";
      v27 = v31;
    }
    else
    {
      if (qword_1022A02A0 != -1)
        dispatch_once(&qword_1022A02A0, &stru_10213E5F0);
      v21 = qword_1022A02A8;
      if (os_log_type_enabled((os_log_t)qword_1022A02A8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68289538;
        v37 = 0;
        v38 = 2082;
        v39 = "";
        v40 = 2082;
        v41 = objc_msgSend(v7, "UTF8String");
        v42 = 2082;
        v43 = (CFErrorDomain)-[NSNull UTF8String](v10, "UTF8String");
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Unable to create a security policy\", \"host\":%{public, location:escape_only}s, \"leafOID\":%{public, location:escape_only}s}", buf, 0x26u);
        if (qword_1022A02A0 != -1)
          dispatch_once(&qword_1022A02A0, &stru_10213E5F0);
      }
      v22 = qword_1022A02A8;
      if (!os_signpost_enabled((os_log_t)qword_1022A02A8))
      {
        v16 = 2;
        goto LABEL_21;
      }
      v23 = objc_msgSend(v7, "UTF8String");
      v24 = (const __CFString *)-[NSNull UTF8String](v10, "UTF8String");
      *(_DWORD *)buf = 68289538;
      v37 = 0;
      v38 = 2082;
      v39 = "";
      v40 = 2082;
      v41 = v23;
      v42 = 2082;
      v43 = v24;
      v25 = "Unable to create a security policy";
      v26 = "{\"msg%{public}.0s\":\"Unable to create a security policy\", \"host\":%{public, location:escape_only}s, \"le"
            "afOID\":%{public, location:escape_only}s}";
      v27 = v22;
    }
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v27, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v25, v26, buf, 0x26u);
    goto LABEL_50;
  }
  if (qword_1022A02A0 != -1)
    dispatch_once(&qword_1022A02A0, &stru_10213E5F0);
  v17 = qword_1022A02A8;
  v16 = 0;
  if (os_log_type_enabled((os_log_t)qword_1022A02A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289283;
    v37 = 0;
    v38 = 2082;
    v39 = "";
    v40 = 2081;
    v41 = objc_msgSend(v7, "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Warning No pinning rule for host\", \"host\":%{private, location:escape_only}s}", buf, 0x1Cu);
LABEL_18:
    v16 = 0;
    goto LABEL_19;
  }
LABEL_21:
  v18 = qword_1022A02A8;
  if (os_log_type_enabled((os_log_t)qword_1022A02A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289283;
    v37 = 0;
    v38 = 2082;
    v39 = "";
    v40 = 2049;
    v41 = (id)v16;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#VerifyHost result\", \"result\":%{private}lu}", buf, 0x1Cu);
  }
  if (v16 == 2)
  {
    (*((void (**)(id, uint64_t, _QWORD))a5 + 2))(a5, 2, 0);
  }
  else if (v16 == 1)
  {
    (*((void (**)(id, _QWORD, NSURLCredential *))a5 + 2))(a5, 0, +[NSURLCredential credentialForTrust:](NSURLCredential, "credentialForTrust:", objc_msgSend(objc_msgSend(a4, "protectionSpace"), "serverTrust")));
  }
  else
  {
    (*((void (**)(id, uint64_t, _QWORD))a5 + 2))(a5, 1, 0);
  }
  return v16;
}

@end
