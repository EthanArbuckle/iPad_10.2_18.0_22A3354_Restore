@implementation BAASupport

+ (void)initialize
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  Timer *v8;
  void *v9;
  Timer *v10;
  void *v11;

  v3 = (id)objc_opt_self();

  if (v3 == a1)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDD1648]);
    v5 = (void *)_baaCertPrepareLock;
    _baaCertPrepareLock = (uint64_t)v4;

    v6 = objc_alloc_init(MEMORY[0x24BDD1648]);
    v7 = (void *)_baaCertIssueLock;
    _baaCertIssueLock = (uint64_t)v6;

    v8 = objc_alloc_init(Timer);
    v9 = (void *)_baaRenewalTimer;
    _baaRenewalTimer = (uint64_t)v8;

    v10 = objc_alloc_init(Timer);
    v11 = (void *)_baaNetworkRetryTimer;
    _baaNetworkRetryTimer = (uint64_t)v10;

  }
}

+ (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&_delegate, a3);
}

+ (int)prepare
{
  unint64_t v2;
  int v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  OSStatus v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const __CFDictionary *BAAQueryDictionary;
  id v40;
  double v41;
  void *v42;
  double v43;
  int v44;
  const __CFDictionary *v45;
  unint64_t v46;
  uint64_t i;
  id v48;
  uint64_t v49;
  const void *v50;
  id v51;
  int IsValid;
  double v53;
  NSObject *v54;
  double v55;
  id v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  id v65;
  CFTypeRef result;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v60 = 0;
  if (prepare_onceToken != -1)
    dispatch_once(&prepare_onceToken, &__block_literal_global);
  v2 = 0x253E47000uLL;
  objc_msgSend((id)_baaCertPrepareLock, "lock");
  if (!_delegate)
  {
    v8 = 0;
    v7 = 0;
    v6 = 0;
    v20 = -6;
    goto LABEL_52;
  }
  v3 = objc_msgSend((id)_delegate, "getSigKeyExpDate:expirationDate:", 3, &v60);
  if (v3)
  {
    v20 = v3;
    v8 = 0;
    v7 = 0;
    v6 = 0;
    goto LABEL_52;
  }
  if (!v60)
  {
    v9 = (void *)_baaCertExpDate;
    _baaCertExpDate = 0;

    v10 = getBAAQueryDictionary();
    result = 0;
    objc_msgSend(v10, "setValue:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDE94C8]);
    v11 = SecItemCopyMatching((CFDictionaryRef)v10, &result);
    v12 = 0;
    if (v11 == -25300)
    {
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
    }
    else
    {
      v20 = v11;
      v13 = 0;
      v19 = 0;
      v18 = 0;
      v17 = 0;
      v16 = 0;
      v15 = 0;
      v14 = 0;
      if (v11)
        goto LABEL_16;
      v21 = (void *)MEMORY[0x24BDBCF20];
      v22 = objc_opt_class();
      v23 = objc_opt_class();
      v24 = objc_opt_class();
      v25 = objc_opt_class();
      v26 = objc_opt_class();
      v27 = objc_opt_class();
      v28 = objc_opt_class();
      v29 = objc_opt_class();
      v30 = (id)objc_msgSend(v21, "setWithObjects:", v22, v23, v24, v25, v26, v27, v28, v29, objc_opt_class(), 0);
      v65 = 0;
      v14 = (id)objc_msgSend(MEMORY[0x24BDD1620], "_strictlyUnarchivedObjectOfClasses:fromData:error:", v30, result, &v65);
      v31 = v65;
      if (v31)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          +[BAASupport prepare].cold.1((uint64_t)v31, v32, v33, v34, v35, v36, v37, v38);
        v15 = 0;
        v16 = 0;
        v17 = 0;
        v18 = 0;
      }
      else
      {
        v15 = (id)objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("BAAVersion"));
        v18 = (id)objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("BAAKey"));
        v17 = (id)objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("BAACertificates"));
        v16 = (id)objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("BAAExpDate"));
        if (v15 && objc_msgSend(v15, "unsignedIntValue") >= 2 && v18 && v17 && v16)
        {
          v63 = 0u;
          v64 = 0u;
          v61 = 0u;
          v62 = 0u;
          v17 = v17;
          v46 = 0x24BDBC000uLL;
          v59 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
          if (v59)
          {
            v58 = *(_QWORD *)v62;
            v57 = v30;
            while (2)
            {
              for (i = 0; i != v59; ++i)
              {
                if (*(_QWORD *)v62 != v58)
                  objc_enumerationMutation(v17);
                v48 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v61 + 1) + 8 * i));
                objc_msgSend(v48, "bytes");
                objc_msgSend(v48, "length");
                v49 = SecCertificateCreateWithBytes();
                if (!v49
                  || (v50 = (const void *)v49,
                      v51 = (id)objc_msgSend(*(id *)(v46 + 3680), "date"),
                      objc_msgSend(v51, "timeIntervalSinceReferenceDate"),
                      IsValid = SecCertificateIsValid(),
                      v51,
                      CFRelease(v50),
                      !IsValid))
                {

                  v30 = v57;
                  v31 = 0;
                  goto LABEL_14;
                }
                v46 = 0x24BDBC000;
              }
              v30 = v57;
              v59 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
              if (v59)
                continue;
              break;
            }
          }

          v12 = objc_retainAutorelease(v18);
          v13 = objc_retainAutorelease(v17);
          v16 = objc_retainAutorelease(v16);
          v17 = v13;
          v18 = v12;
          v19 = v16;
          goto LABEL_15;
        }
      }
LABEL_14:
      BAAQueryDictionary = (const __CFDictionary *)getBAAQueryDictionary();
      SecItemDelete(BAAQueryDictionary);

      v12 = 0;
      v13 = 0;
      v19 = 0;
    }
LABEL_15:
    v20 = 0;
LABEL_16:
    if (result)
      CFRelease(result);

    v6 = v12;
    v7 = v13;
    v40 = v19;
    v8 = v40;
    if (!v20)
    {
      if (!v6)
        goto LABEL_43;
      if (!v7)
        goto LABEL_43;
      if (!v40)
        goto LABEL_43;
      objc_msgSend(v40, "timeIntervalSinceNow");
      if (v41 <= 0.0)
        goto LABEL_43;
      v42 = (void *)_delegate;
      if (_delegate)
      {
        objc_msgSend(v8, "timeIntervalSinceReferenceDate");
        v44 = objc_msgSend(v42, "setSigKey:expirationDate:keyData:certificates:", 3, (unint64_t)v43, v6, v7);
        if (v44 == -13)
        {
          v45 = (const __CFDictionary *)getBAAQueryDictionary();
          SecItemDelete(v45);
LABEL_43:
          v2 = 0x253E47000uLL;
          goto LABEL_44;
        }
        v20 = v44;
        if (!v44)
        {
          objc_storeStrong((id *)&_baaCertExpDate, v19);
          objc_msgSend((id)_delegate, "confirmSigKey:status:", 3, 0);
          goto LABEL_43;
        }
      }
      else
      {
        v20 = -6;
      }
    }
    v2 = 0x253E47000;
    goto LABEL_52;
  }
  v4 = (id)objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", (double)v60);
  v5 = (void *)_baaCertExpDate;
  _baaCertExpDate = (uint64_t)v4;

  v6 = 0;
  v7 = 0;
  v8 = 0;
LABEL_44:
  if (_baaCertExpDate && (objc_msgSend((id)_baaCertExpDate, "timeIntervalSinceNow"), v53 > 0.0))
  {
    v54 = dispatch_get_global_queue(21, 0);
    dispatch_async(v54, &__block_literal_global_11);

    v20 = 0;
  }
  else
  {
    objc_msgSend((id)_baaCertIssueLock, "lock");
    if (_baaCertExpDate && (objc_msgSend((id)_baaCertExpDate, "timeIntervalSinceNow"), v55 > 0.0)
      || (v20 = issueNewBAACertificate()) == 0)
    {
      v20 = 0;
    }
    objc_msgSend((id)_baaCertIssueLock, "unlock");
  }
LABEL_52:
  objc_msgSend(*(id *)(v2 + 1208), "unlock");

  return v20;
}

uint64_t __21__BAASupport_prepare__block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)activationStateHandler, (CFStringRef)*MEMORY[0x24BE66A70], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  if (getNetworkReachability_onceToken != -1)
    dispatch_once(&getNetworkReachability_onceToken, &__block_literal_global_26);
  result = SCNetworkReachabilitySetCallback((SCNetworkReachabilityRef)getNetworkReachability_networkReachability, (SCNetworkReachabilityCallBack)networkReachabilityHandler, 0);
  if ((_DWORD)result)
  {
    if (getNetworkReachability_onceToken != -1)
      dispatch_once(&getNetworkReachability_onceToken, &__block_literal_global_26);
    return SCNetworkReachabilitySetDispatchQueue((SCNetworkReachabilityRef)getNetworkReachability_networkReachability, MEMORY[0x24BDAC9B8]);
  }
  return result;
}

+ (int)getCertificateExpirationDate:(double *)a3
{
  int result;
  uint64_t v5;

  if (!a3)
    return -4;
  result = +[BAASupport prepare](BAASupport, "prepare");
  if (!result)
  {
    if (_baaCertExpDate)
      objc_msgSend((id)_baaCertExpDate, "timeIntervalSinceReferenceDate");
    else
      v5 = 0;
    result = 0;
    *(_QWORD *)a3 = v5;
  }
  return result;
}

+ (int)getCertificates:(id *)a3
{
  int result;

  if (!a3)
    return -4;
  result = +[BAASupport prepare](BAASupport, "prepare");
  if (!result)
    return objc_msgSend((id)_delegate, "getSigKeyCertificates:certificates:", 3, a3);
  return result;
}

+ (int)issueNewCertificate
{
  int v2;

  objc_msgSend((id)_baaCertIssueLock, "lock");
  LODWORD(_MergedGlobals) = 0;
  v2 = issueNewBAACertificate();
  objc_msgSend((id)_baaCertIssueLock, "unlock");
  return v2;
}

+ (void)prepare
{
  OUTLINED_FUNCTION_0(&dword_21AB71000, MEMORY[0x24BDACB70], a3, "unarchivedObjectOfClasses() -> %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
