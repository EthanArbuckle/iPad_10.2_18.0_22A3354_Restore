@implementation TransparencyCertificateHelper

+ (__SecCertificate)certificateFromData:(id)a3 error:(id *)a4
{
  const __CFData *v5;
  __SecCertificate *v6;
  NSObject *v7;
  uint8_t v9[16];

  v5 = (const __CFData *)a3;
  v6 = SecCertificateCreateWithData(0, v5);
  if (!v6)
  {
    v6 = (__SecCertificate *)SecCertificateCreateWithPEM(0, v5);
    if (!v6)
    {
      if (a4)
        *a4 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, -7, CFSTR("Unable to decode certificate")));
      if (qword_10012A830 != -1)
        dispatch_once(&qword_10012A830, &stru_100106C60);
      v7 = qword_10012A838;
      if (os_log_type_enabled((os_log_t)qword_10012A838, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Unable to decode certificate", v9, 2u);
      }
      v6 = 0;
    }
  }

  return v6;
}

+ (BOOL)addTrustedCertificate:(id)a3 trustedKeys:(id)a4 error:(id *)a5
{
  id v7;
  __SecCertificate *v8;
  __SecCertificate *v9;
  SecKeyRef v10;
  SecKeyRef v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  NSObject *v15;
  NSObject *v16;
  __SecCertificate *v17;
  NSObject *v18;
  __int16 v20[8];
  uint8_t v21[16];
  uint8_t buf[16];

  v7 = a4;
  v8 = +[TransparencyCertificateHelper certificateFromData:error:](TransparencyCertificateHelper, "certificateFromData:error:", a3, a5);
  if (!v8)
  {
    if (qword_10012A830 != -1)
      dispatch_once(&qword_10012A830, &stru_100106C80);
    v15 = qword_10012A838;
    if (os_log_type_enabled((os_log_t)qword_10012A838, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "failed to decode trusted certificate", buf, 2u);
    }
    goto LABEL_24;
  }
  v9 = v8;
  v10 = SecCertificateCopyKey(v8);
  if (!v10)
  {
    if (a5)
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, -8, CFSTR("Unable to decode certificate public key")));
    if (qword_10012A830 != -1)
      dispatch_once(&qword_10012A830, &stru_100106CA0);
    v16 = qword_10012A838;
    if (os_log_type_enabled((os_log_t)qword_10012A838, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Unable to decode certificate public key", v21, 2u);
    }
    v17 = v9;
    goto LABEL_23;
  }
  v11 = v10;
  v12 = SecCertificateCopySubjectPublicKeyInfoSHA256Digest(v9);
  if (!v12)
  {
    if (a5)
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, -30, CFSTR("Unable to copy certificate key SPKI hash")));
    if (qword_10012A830 != -1)
      dispatch_once(&qword_10012A830, &stru_100106CC0);
    v18 = qword_10012A838;
    if (os_log_type_enabled((os_log_t)qword_10012A838, OS_LOG_TYPE_ERROR))
    {
      v20[0] = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Unable to copy certificate key SPKI hash", (uint8_t *)v20, 2u);
    }
    CFRelease(v9);
    v17 = v11;
LABEL_23:
    CFRelease(v17);
LABEL_24:
    v14 = 0;
    goto LABEL_25;
  }
  v13 = (void *)v12;
  objc_msgSend(v7, "setObject:forKey:", v11, v12);
  CFRelease(v9);
  CFRelease(v11);

  v14 = 1;
LABEL_25:

  return v14;
}

+ (id)copyTrustedKeysFromDataArray:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        if (!+[TransparencyCertificateHelper addTrustedCertificate:trustedKeys:error:](TransparencyCertificateHelper, "addTrustedCertificate:trustedKeys:error:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v11), v6, a4, (_QWORD)v14))
        {

          v12 = 0;
          goto LABEL_11;
        }
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
        continue;
      break;
    }
  }

  v12 = v6;
LABEL_11:

  return v12;
}

+ (id)createCACertificatesArray:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  __SecCertificate *v12;
  __SecCertificate *v13;
  NSObject *v14;
  uint8_t v16[16];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v5, "count")));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = +[TransparencyCertificateHelper certificateFromData:error:](TransparencyCertificateHelper, "certificateFromData:error:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i), a4);
        if (!v12)
        {
          if (qword_10012A830 != -1)
            dispatch_once(&qword_10012A830, &stru_100106CE0);
          v14 = qword_10012A838;
          if (os_log_type_enabled((os_log_t)qword_10012A838, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v16 = 0;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "failed to decode intermediate certificate", v16, 2u);
          }

          v6 = 0;
          goto LABEL_15;
        }
        v13 = v12;
        objc_msgSend(v6, "addObject:", v12);
        CFRelease(v13);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_15:

  return v6;
}

+ (BOOL)verifyLeaf:(id)a3 intermediates:(id)a4 policy:(__SecPolicy *)a5 error:(id *)a6
{
  id v9;
  __SecCertificate *v10;
  __SecCertificate *v11;
  void *v12;
  OSStatus v13;
  NSObject *v14;
  BOOL v15;
  NSObject *v16;
  id v17;
  SecTrustRef v18;
  id v20[2];
  SecTrustRef trust[2];

  v9 = a4;
  v10 = +[TransparencyCertificateHelper certificateFromData:error:](TransparencyCertificateHelper, "certificateFromData:error:", a3, a6);
  if (v10)
  {
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v10));
    CFRelease(v11);
    objc_msgSend(v12, "addObjectsFromArray:", v9);
    trust[0] = 0;
    v13 = SecTrustCreateWithCertificates(v12, a5, trust);
    if (v13)
    {
      if (a6)
        *a6 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorAlloc, v13, CFSTR("SecTrustCreate failed")));
      if (qword_10012A830 != -1)
        dispatch_once(&qword_10012A830, &stru_100106D20);
      v14 = qword_10012A838;
      if (os_log_type_enabled((os_log_t)qword_10012A838, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v20[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "SecTrustCreate failed", (uint8_t *)v20, 2u);
      }
      v15 = 0;
    }
    else
    {
      v20[0] = 0;
      v15 = SecTrustEvaluateWithError(trust[0], (CFErrorRef *)v20);
      v17 = v20[0];
      if (a6 && v20[0])
      {
        *a6 = v20[0];
        v20[0] = 0;
      }
      else if (v20[0])
      {
        v20[0] = 0;
        CFRelease(v17);
      }
      v18 = trust[0];
      if (trust[0])
      {
        trust[0] = 0;
        CFRelease(v18);
      }
    }

  }
  else
  {
    if (qword_10012A830 != -1)
      dispatch_once(&qword_10012A830, &stru_100106D00);
    v16 = qword_10012A838;
    if (os_log_type_enabled((os_log_t)qword_10012A838, OS_LOG_TYPE_ERROR))
    {
      LOWORD(trust[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "failed to decode leaf certificate", (uint8_t *)trust, 2u);
    }
    v15 = 0;
  }

  return v15;
}

+ (BOOL)verifyCertificates:(id)a3 intermediates:(id)a4 policy:(__SecPolicy *)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  unsigned __int8 v19;
  void *i;
  uint64_t v21;
  id v22;
  void *v24;
  id v25;
  id *v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  _BYTE v34[128];

  v10 = a3;
  v11 = a4;
  v12 = objc_autoreleasePoolPush();
  v33 = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "createCACertificatesArray:error:", v11, &v33));
  v14 = v33;
  if (v13)
  {
    v24 = v12;
    v25 = v11;
    v26 = a6;
    v27 = v10;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v15 = v10;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v30;
      v19 = 1;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(_QWORD *)v30 != v18)
            objc_enumerationMutation(v15);
          if ((v19 & 1) != 0)
          {
            v21 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
            v28 = v14;
            v19 = objc_msgSend(a1, "verifyLeaf:intermediates:policy:error:", v21, v13, a5, &v28);
            v22 = v28;

            v14 = v22;
          }
          else
          {
            v19 = 0;
          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v17);
    }
    else
    {
      v19 = 1;
    }

    a6 = v26;
    v10 = v27;
    v12 = v24;
    v11 = v25;
  }
  else
  {
    v19 = 0;
  }

  objc_autoreleasePoolPop(v12);
  if (a6 && v14)
    *a6 = objc_retainAutorelease(v14);

  return v19;
}

@end
