@implementation CCDCertificateSupport

+ (BOOL)verifySignature:(id)a3 payload:(id)a4 clientCertificate:(id)a5
{
  const __CFData *v7;
  const __CFData *v8;
  __SecCertificate *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  __SecKey *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  int v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  CFErrorRef v24;
  NSObject *v25;
  id v26;
  id v27;
  CFErrorRef error;
  uint8_t buf[4];
  id v31;

  v7 = (const __CFData *)a3;
  v8 = (const __CFData *)a4;
  v9 = (__SecCertificate *)a5;
  v12 = *(NSObject **)(DEPLogObjects(v9, v10, v11) + 8);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Create signature", buf, 2u);
  }
  v13 = SecCertificateCopyKey(v9);

  v17 = *(NSObject **)(DEPLogObjects(v14, v15, v16) + 8);
  if (v13)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Verify signature", buf, 2u);
    }
    error = 0;
    v18 = SecKeyVerifySignature(v13, kSecKeyAlgorithmECDSASignatureMessageX962SHA256, v8, v7, &error);
    v19 = v18 != 0;
    CFRelease(v13);
    v23 = *(NSObject **)(DEPLogObjects(v20, v21, v22) + 8);
    if (v18)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Signature verified", buf, 2u);
      }
    }
    else if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = error;
      v25 = v23;
      v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[__CFError description](v24, "description")));
      v27 = objc_msgSend(v26, "UTF8String");
      *(_DWORD *)buf = 136446210;
      v31 = v27;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Failed to verify signature: %{public}s\n", buf, 0xCu);

    }
  }
  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to copy public key.\n", buf, 2u);
    }
    v19 = 0;
  }

  return v19;
}

+ (id)base64Encodedx509CertificateStringFromCertificate:(id)a3
{
  CFDataRef v3;
  void *v4;
  id v5;

  if (a3)
  {
    v3 = SecCertificateCopyData((SecCertificateRef)a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[__CFData base64EncodedDataWithOptions:](v3, "base64EncodedDataWithOptions:", 0));
    v5 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v4, 4);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)decodeCertificateFromBase64String:(id)a3
{
  id v3;
  id v4;
  SecCertificateRef v5;
  id v6;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v3, 1);

  if (v4 && (v5 = SecCertificateCreateWithData(0, (CFDataRef)v4)) != 0)
  {
    CFRelease(v5);
    v6 = v4;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
