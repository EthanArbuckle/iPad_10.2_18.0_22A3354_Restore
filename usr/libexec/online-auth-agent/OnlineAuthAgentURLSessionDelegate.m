@implementation OnlineAuthAgentURLSessionDelegate

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  unsigned int v11;
  _QWORD *v12;
  id v13;
  _QWORD *v14;
  void *v15;
  __SecTrust *v16;
  CFIndex CertificateCount;
  id v18;
  CFIndex i;
  const void *ApplePPQService;
  uint64_t v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __SecTrust *v47;
  uint64_t v48;
  id v49;
  NSObject *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  SecTrustResultType result;
  _QWORD v73[4];
  id v74;
  id v75;
  _QWORD v76[6];
  uint64_t v77;
  SecTrustRef *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t v84;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!sub_100004520()
    || (v10 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.mis")), v11 = objc_msgSend(v10, "BOOLForKey:", CFSTR("disableServerPinning")), v10, !v11))
  {
    v81 = 0;
    v82 = &v81;
    v83 = 0x2020000000;
    v84 = 0;
    v77 = 0;
    v78 = (SecTrustRef *)&v77;
    v79 = 0x2020000000;
    v80 = 0;
    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472;
    v76[2] = sub_10000754C;
    v76[3] = &unk_100045818;
    v76[4] = &v77;
    v76[5] = &v81;
    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472;
    v73[2] = sub_100007598;
    v73[3] = &unk_100045840;
    v12 = objc_retainBlock(v76);
    v74 = v12;
    v13 = v9;
    v75 = v13;
    v14 = objc_retainBlock(v73);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "protectionSpace"));
    v16 = (__SecTrust *)objc_msgSend(v15, "serverTrust");

    if (!v16)
    {
      v30 = sub_100006C90();
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        sub_100032B4C(v31, v32, v33, v34, v35, v36, v37, v38);

      ((void (*)(_QWORD *))v14[2])(v14);
      goto LABEL_30;
    }
    CertificateCount = SecTrustGetCertificateCount(v16);
    v18 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", CertificateCount);
    if (CertificateCount)
    {
      for (i = 0; i != CertificateCount; ++i)
        objc_msgSend(v18, "addObject:", SecTrustGetCertificateAtIndex(v16, i));
    }
    ApplePPQService = (const void *)SecPolicyCreateApplePPQService(CFSTR("ppq.apple.com"), 0);
    v82[3] = (uint64_t)ApplePPQService;
    if (ApplePPQService)
    {
      v21 = SecTrustCreateWithCertificates(v18, ApplePPQService, v78 + 3);
      if ((_DWORD)v21)
      {
        v22 = sub_100006C90();
        v23 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          sub_100032CA8(v21, v23, v24, v25, v26, v27, v28, v29);
      }
      else
      {
        v47 = v78[3];
        if (v47)
        {
          result = kSecTrustResultDeny;
          v48 = SecTrustEvaluate(v47, &result);
          if ((_DWORD)v48)
          {
            v49 = sub_100006C90();
            v50 = objc_claimAutoreleasedReturnValue(v49);
            if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
              sub_100032C44(v48, v50, v51, v52, v53, v54, v55, v56);
          }
          else
          {
            if (result == kSecTrustResultProceed || result == kSecTrustResultUnspecified)
            {
              ((void (*)(_QWORD *))v12[2])(v12);
              (*((void (**)(id, uint64_t, _QWORD))v13 + 2))(v13, 1, 0);
              goto LABEL_29;
            }
            v65 = sub_100006C90();
            v50 = objc_claimAutoreleasedReturnValue(v65);
            if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
              sub_100032BDC((uint64_t)&result, v50, v66, v67, v68, v69, v70, v71);
          }

          ((void (*)(_QWORD *))v14[2])(v14);
LABEL_29:

LABEL_30:
          _Block_object_dispose(&v77, 8);
          _Block_object_dispose(&v81, 8);
          goto LABEL_31;
        }
        v57 = sub_100006C90();
        v23 = objc_claimAutoreleasedReturnValue(v57);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          sub_100032BAC(v23, v58, v59, v60, v61, v62, v63, v64);
      }
    }
    else
    {
      v39 = sub_100006C90();
      v23 = objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        sub_100032B7C(v23, v40, v41, v42, v43, v44, v45, v46);
    }

    ((void (*)(_QWORD *))v14[2])(v14);
    goto LABEL_29;
  }
  (*((void (**)(id, uint64_t, _QWORD))v9 + 2))(v9, 1, 0);
LABEL_31:

}

@end
