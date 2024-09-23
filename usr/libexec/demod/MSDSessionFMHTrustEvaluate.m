@implementation MSDSessionFMHTrustEvaluate

- (BOOL)trustServer:(__SecTrust *)a3 isRedirect:(BOOL)a4
{
  const __CFData *v5;
  const __CFData *v6;
  SecCertificateRef v7;
  SecCertificateRef v8;
  const __CFArray *v9;
  OSStatus v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  BOOL v14;
  id v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  OSStatus v34;
  id v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  SecTrustResultType result;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  uint64_t v48;

  v5 = CFDataCreate(kCFAllocatorDefault, byte_100174928, dword_100174CB0);
  if (!v5)
  {
    v16 = sub_1000604F0();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_1000C8964(v17, v18, v19, v20, v21, v22, v23, v24);

    return 0;
  }
  v6 = v5;
  v7 = SecCertificateCreateWithData(kCFAllocatorDefault, v5);
  if (!v7)
  {
    v25 = sub_1000604F0();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      sub_1000C89D4(v26, v27, v28, v29, v30, v31, v32, v33);

    CFRelease(v6);
    return 0;
  }
  v8 = v7;
  v9 = (const __CFArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v7, 0));
  v10 = SecTrustSetAnchorCertificates(a3, v9);
  if (v10)
  {
    v34 = v10;
    v35 = sub_1000604F0();
    v13 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v46 = "-[MSDSessionFMHTrustEvaluate trustServer:isRedirect:]";
      v47 = 2048;
      v48 = v34;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: Cannot set demounit anchor certificates: %ld", buf, 0x16u);
    }
    goto LABEL_25;
  }
  result = kSecTrustResultInvalid;
  v11 = SecTrustEvaluate(a3, &result);
  if ((_DWORD)v11)
  {
    v36 = v11;
    v37 = sub_1000604F0();
    v13 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1000C3E4C(v36, v13, v38, v39, v40, v41, v42, v43);
LABEL_25:
    v14 = 0;
    goto LABEL_10;
  }
  if (result != kSecTrustResultUnspecified && result != kSecTrustResultProceed)
  {
    v14 = 0;
    goto LABEL_12;
  }
  v12 = sub_1000604F0();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Demounit server certificate is valid.", buf, 2u);
  }
  v14 = 1;
LABEL_10:

LABEL_12:
  CFRelease(v6);
  CFRelease(v8);

  return v14;
}

@end
