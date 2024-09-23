@implementation TransparencySignatureVerifier

+ (__CFString)secKeyAlgorithmForProtoAlgorithm:(int)a3
{
  NSObject *v5;
  _DWORD v6[2];

  if (a3 == 1)
    return (__CFString *)kSecKeyAlgorithmECDSASignatureMessageX962SHA256;
  if (qword_1002A7AA8 != -1)
    dispatch_once(&qword_1002A7AA8, &stru_10024B630);
  v5 = qword_1002A7AB0;
  if (os_log_type_enabled((os_log_t)qword_1002A7AB0, OS_LOG_TYPE_ERROR))
  {
    v6[0] = 67109120;
    v6[1] = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Unknown signature algorithm: %d", (uint8_t *)v6, 8u);
  }
  return 0;
}

+ (int)protoAlgorithmForSecKeyAlgorithm:(__CFString *)a3
{
  __CFString *v3;
  int v4;
  NSObject *v5;
  int v7;
  __CFString *v8;

  v3 = a3;
  if ((-[__CFString isEqualToString:](v3, "isEqualToString:", kSecKeyAlgorithmECDSASignatureMessageX962SHA256) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    if (qword_1002A7AA8 != -1)
      dispatch_once(&qword_1002A7AA8, &stru_10024B650);
    v5 = qword_1002A7AB0;
    if (os_log_type_enabled((os_log_t)qword_1002A7AB0, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Unknown signature algorithm: %@", (uint8_t *)&v7, 0xCu);
    }
    v4 = 0;
  }

  return v4;
}

- (TransparencySignatureVerifier)initWithTrustedKeys:(id)a3
{
  id v5;
  TransparencySignatureVerifier *v6;
  TransparencySignatureVerifier *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TransparencySignatureVerifier;
  v6 = -[TransparencySignatureVerifier init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_trustedKeys, a3);

  return v7;
}

- (BOOL)verifyMessage:(id)a3 signature:(id)a4 spkiHash:(id)a5 algorithm:(__CFString *)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  BOOL v16;
  id v17;
  id v19;

  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencySignatureVerifier trustedKeys](self, "trustedKeys"));
  v19 = 0;
  v16 = +[TransparencySignatureVerifier verifyMessage:signature:spkiHash:trustedKeys:algorithm:error:](TransparencySignatureVerifier, "verifyMessage:signature:spkiHash:trustedKeys:algorithm:error:", v14, v13, v12, v15, a6, &v19);

  v17 = v19;
  if (!v16
    && +[TransparencyError hasUnknownSPKIHashError:](TransparencyError, "hasUnknownSPKIHashError:", v17))
  {
    -[TransparencySignatureVerifier setNeedsRefresh:](self, "setNeedsRefresh:", 1);
  }
  if (a7 && v17)
    *a7 = objc_retainAutorelease(v17);

  return v16;
}

+ (BOOL)verifyMessage:(id)a3 signature:(id)a4 spkiHash:(id)a5 trustedKeys:(id)a6 algorithm:(__CFString *)a7 error:(id *)a8
{
  const __CFData *v13;
  const __CFData *v14;
  id v15;
  id v16;
  void *v17;
  __SecKey *v18;
  BOOL v19;
  CFErrorRef v20;
  NSObject *v21;
  __CFError *v22;
  __CFError *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  __CFError *v27;
  CFErrorRef error;
  uint8_t buf[4];
  CFErrorRef v31;

  v13 = (const __CFData *)a3;
  v14 = (const __CFData *)a4;
  v15 = a5;
  v16 = a6;
  v17 = v16;
  if (a7)
  {
    v18 = (__SecKey *)objc_msgSend(v16, "objectForKey:", v15);
    if (v18)
    {
      error = 0;
      v19 = SecKeyVerifySignature(v18, a7, v13, v14, &error) == 1;
      v20 = error;
      if (error)
      {
        if (qword_1002A7AA8 != -1)
          dispatch_once(&qword_1002A7AA8, &stru_10024B690);
        v21 = qword_1002A7AB0;
        if (os_log_type_enabled((os_log_t)qword_1002A7AB0, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v31 = v20;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Signature verification failed: %@", buf, 0xCu);
        }
        if (a8)
        {
          v22 = objc_retainAutorelease(v20);
LABEL_13:
          *a8 = v22;
        }
      }
    }
    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "base64EncodedStringWithOptions:", 0));
      v20 = (CFErrorRef)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", CFSTR("TransparencyErrorVerify"), -9, CFSTR("Unable to find trusted key for SPKI hash: %@"), v24));

      if (a8 && v20)
        *a8 = objc_retainAutorelease(v20);
      if (qword_1002A7AA8 != -1)
        dispatch_once(&qword_1002A7AA8, &stru_10024B670);
      v25 = (void *)qword_1002A7AB0;
      if (os_log_type_enabled((os_log_t)qword_1002A7AB0, OS_LOG_TYPE_ERROR))
      {
        v26 = v25;
        v27 = (__CFError *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "base64EncodedStringWithOptions:", 0));
        *(_DWORD *)buf = 138412290;
        v31 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Unable to find trusted key for SPKI hash: %@", buf, 0xCu);

      }
      v19 = 0;
    }
  }
  else
  {
    v23 = (__CFError *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", CFSTR("TransparencyErrorVerify"), -136, CFSTR("Unknown signature algorithm")));
    v20 = v23;
    v19 = 0;
    if (a8 && v23)
    {
      v22 = objc_retainAutorelease(v23);
      v20 = v22;
      v19 = 0;
      goto LABEL_13;
    }
  }

  return v19;
}

- (BOOL)needsRefresh
{
  return self->_needsRefresh;
}

- (void)setNeedsRefresh:(BOOL)a3
{
  self->_needsRefresh = a3;
}

- (NSDictionary)trustedKeys
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTrustedKeys:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trustedKeys, 0);
}

@end
