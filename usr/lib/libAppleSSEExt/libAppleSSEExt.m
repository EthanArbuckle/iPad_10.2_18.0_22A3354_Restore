void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_21AB728A0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __copy_helper_block_e8_32b40w(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 7);
  objc_copyWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

void __destroy_helper_block_e8_32s40w(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));

}

void activationStateHandler()
{
  NSObject *v0;

  v0 = dispatch_get_global_queue(21, 0);
  dispatch_async(v0, &__block_literal_global_25);

}

void networkReachabilityHandler(uint64_t a1, int a2)
{
  NSObject *v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = a2;
    _os_log_impl(&dword_21AB71000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "networkReachabilityHandler(): flags = 0x%x", (uint8_t *)v4, 8u);
  }
  v3 = dispatch_get_global_queue(21, 0);
  dispatch_async(v3, &__block_literal_global_27);

}

uint64_t issueNewBAACertificate()
{
  uint64_t v0;
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  int v6;
  id v7;
  id v8;
  int v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  dispatch_time_t v21;
  int v22;
  NSObject *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  double v33;
  id v35;
  id v36;
  id v37[9];
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  int v59;
  _QWORD v60[5];
  _QWORD v61[7];
  _QWORD v62[9];

  v62[7] = *MEMORY[0x24BDAC8D0];
  v0 = isDeviceReadyToIssueCertificate();
  v1 = 0;
  if ((_DWORD)v0)
  {
    v29 = 0;
    v31 = 0;
    goto LABEL_23;
  }
  if (!_delegate)
  {
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v2 = 0;
    v3 = 0;
    v4 = 0;
    v24 = 0;
    v25 = 0;
    v0 = 4294967290;
    goto LABEL_19;
  }
  v36 = 0;
  v37[0] = 0;
  v35 = 0;
  v0 = objc_msgSend((id)_delegate, "generateSigKey:keyData:attestation:pubKey:", 3, v37, &v36, &v35);
  v2 = v37[0];
  v3 = v36;
  v4 = v35;
  if ((_DWORD)v0)
  {
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v24 = 0;
    v25 = 0;
    goto LABEL_19;
  }
  v3 = v3;
  v4 = v4;
  v56 = 0;
  v57 = &v56;
  v58 = 0x2020000000;
  v59 = 0;
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy_;
  v54 = __Block_byref_object_dispose_;
  v55 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy_;
  v48 = __Block_byref_object_dispose_;
  v49 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy_;
  v42 = __Block_byref_object_dispose_;
  v5 = 0;
  v43 = dispatch_semaphore_create(0);
  v6 = -4;
  v7 = 0;
  v8 = 0;
  if (!v3 || !v4)
    goto LABEL_14;
  v9 = isDeviceReadyToIssueCertificate();
  v10 = v57;
  *((_DWORD *)v57 + 6) = v9;
  if (v9)
  {
    v5 = 0;
    v7 = 0;
    v8 = 0;
    goto LABEL_15;
  }
  v11 = *MEMORY[0x24BE2C488];
  v61[0] = *MEMORY[0x24BE2C3C0];
  v61[1] = v11;
  v62[0] = MEMORY[0x24BDBD1C8];
  v62[1] = MEMORY[0x24BDBD1C0];
  v12 = *MEMORY[0x24BE2C3B8];
  v61[2] = *MEMORY[0x24BE2C3B0];
  v61[3] = v12;
  v62[2] = v3;
  v62[3] = v4;
  v13 = *MEMORY[0x24BE2C470];
  v62[4] = MEMORY[0x24BDBD1C8];
  v14 = *MEMORY[0x24BE2C480];
  v61[4] = v13;
  v61[5] = v14;
  v15 = certificateValidity();
  v62[5] = v15;
  v61[6] = *MEMORY[0x24BE2C448];
  v16 = *MEMORY[0x24BE2C420];
  v60[0] = *MEMORY[0x24BE2C400];
  v60[1] = v16;
  v17 = *MEMORY[0x24BE2C410];
  v60[2] = *MEMORY[0x24BE2C430];
  v60[3] = v17;
  v60[4] = *MEMORY[0x24BE2C458];
  v18 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v60, 5);
  v62[6] = v18;
  v8 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v62, v61, 7);

  v19 = dispatch_get_global_queue(0, 0);
  v37[1] = (id)MEMORY[0x24BDAC760];
  v37[2] = (id)3254779904;
  v37[3] = __createBAACertificates_block_invoke;
  v37[4] = &__block_descriptor_64_e8_32r40r48r56r_e87_v32__0____SecKey____CFRuntimeBase_QAQ_____SecKeyDescriptor__v_8__NSArray_16__NSError_24l;
  v37[5] = &v56;
  v37[6] = &v44;
  v37[7] = &v50;
  v37[8] = &v38;
  DeviceIdentityIssueClientCertificateWithCompletion();

  v20 = v39[5];
  v21 = dispatch_time(0, 90000000000);
  if (!dispatch_semaphore_wait(v20, v21))
  {
    v10 = v57;
    if (!*((_DWORD *)v57 + 6))
    {
      _MergedGlobals = 0;
      v5 = objc_retainAutorelease((id)v51[5]);
      v7 = objc_retainAutorelease((id)v45[5]);
      v6 = 0;
LABEL_14:
      v10 = v57;
      *((_DWORD *)v57 + 6) = v6;
      goto LABEL_15;
    }
    v5 = 0;
    v7 = 0;
LABEL_15:
    if (!(_DWORD)_MergedGlobals)
      goto LABEL_17;
    goto LABEL_16;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    issueNewBAACertificate_cold_1();
  v5 = 0;
  v7 = 0;
  LODWORD(_MergedGlobals) = _MergedGlobals + 1;
  v22 = _MergedGlobals;
  v10 = v57;
  *((_DWORD *)v57 + 6) = -15;
  if (!v22)
    goto LABEL_17;
LABEL_16:
  v23 = dispatch_get_global_queue(21, 0);
  dispatch_async(v23, &__block_literal_global_62);

  v10 = v57;
LABEL_17:
  v0 = *((unsigned int *)v10 + 6);

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v56, 8);

  v24 = v5;
  v25 = v7;
  if ((_DWORD)v0)
  {
    v26 = 0;
    v27 = 0;
    v28 = 0;
  }
  else
  {
    v26 = objc_retainAutorelease(v2);
    v27 = objc_retainAutorelease(v24);
    v28 = objc_retainAutorelease(v25);
    v0 = 0;
    v2 = v26;
    v24 = v27;
    v25 = v28;
  }
LABEL_19:

  v1 = v26;
  v29 = v27;
  v30 = v28;
  v31 = v30;
  if (!(_DWORD)v0)
  {
    v32 = (void *)_delegate;
    if (_delegate)
    {
      objc_msgSend(v30, "timeIntervalSinceReferenceDate");
      v0 = objc_msgSend(v32, "setSigKey:expirationDate:keyData:certificates:", 3, (unint64_t)v33, v1, v29);
      if (!(_DWORD)v0)
      {
        objc_storeStrong((id *)&_baaCertExpDate, v28);
        scheduleBAACertificateRenewalTimer();
        v0 = 0;
      }
    }
    else
    {
      v0 = 4294967290;
    }
  }
LABEL_23:
  objc_msgSend((id)_delegate, "confirmSigKey:status:", 3, v0);

  return v0;
}

void sub_21AB73978(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  _Block_object_dispose(&a38, 8);
  _Unwind_Resume(a1);
}

void checkBAACertificateRenewal()
{
  double v0;
  double v1;
  int v2;
  double v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (_baaCertExpDate)
  {
    objc_msgSend((id)_baaCertIssueLock, "lock");
    objc_msgSend((id)_baaCertExpDate, "timeIntervalSinceNow");
    v1 = v0;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v2 = 134218240;
      v3 = v1;
      v4 = 2048;
      v5 = certificateRenewPeriod();
      _os_log_impl(&dword_21AB71000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "checkBAACertificateRenewal(): remaining = %f (renew period = %llu)", (uint8_t *)&v2, 0x16u);
    }
    if (v1 <= (double)(unint64_t)certificateRenewPeriod())
      issueNewBAACertificate();
    else
      scheduleBAACertificateRenewalTimer();
    objc_msgSend((id)_baaCertIssueLock, "unlock");
  }
}

uint64_t __activationStateHandler_block_invoke()
{
  isDeviceActivated(1);
  return +[BAASupport prepare](BAASupport, "prepare");
}

uint64_t isDeviceActivated(int a1)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v15[8];
  id v16;

  objc_sync_enter(0);
  if (isDeviceActivated_wasRead != 1 || a1 != 0)
  {
    isDeviceActivated_wasRead = 0;
    v16 = 0;
    v3 = (void *)MAEGetActivationStateWithError();
    v4 = 0;
    if (v4)
    {
      v5 = v4;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        isDeviceActivated_cold_1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

      v13 = 4294967290;
      goto LABEL_15;
    }
    isDeviceActivated_activated = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE66A50]);
    isDeviceActivated_wasRead = 1;

  }
  if (isDeviceActivated_activated)
  {
    v13 = 0;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_21AB71000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "isDeviceActivated(): Not activated", v15, 2u);
    }
    v13 = 4294967285;
  }
LABEL_15:
  objc_sync_exit(0);
  return v13;
}

void sub_21AB73D00(_Unwind_Exception *a1)
{
  objc_sync_exit(0);
  _Unwind_Resume(a1);
}

SCNetworkReachabilityRef __getNetworkReachability_block_invoke()
{
  SCNetworkReachabilityRef result;
  sockaddr address;
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&address.sa_data[6] = 0;
  *(_QWORD *)&address.sa_len = 528;
  result = SCNetworkReachabilityCreateWithAddress((CFAllocatorRef)*MEMORY[0x24BDBD240], &address);
  getNetworkReachability_networkReachability = (uint64_t)result;
  return result;
}

uint64_t __networkReachabilityHandler_block_invoke()
{
  char v0;
  id v1;
  double v2;
  double v3;
  id v4;
  int v6;
  id v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (!HIDWORD(_MergedGlobals))
    return +[BAASupport prepare](BAASupport, "prepare");
  v0 = BYTE4(_MergedGlobals) - 1;
  if ((HIDWORD(_MergedGlobals) - 1) >= 6)
    v0 = 6;
  v1 = (id)objc_msgSend((id)_baaCertIssueNetworkFailTime, "dateByAddingTimeInterval:", (double)(60 << v0));
  objc_msgSend(v1, "timeIntervalSinceNow");
  v3 = v2;

  if (v3 <= 0.0)
    return +[BAASupport prepare](BAASupport, "prepare");
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v4 = (id)objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", v3);
    v6 = 138412546;
    v7 = v4;
    v8 = 1024;
    v9 = HIDWORD(_MergedGlobals);
    _os_log_impl(&dword_21AB71000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "networkReachabilityHandler(): Re-check scheduled to %@ (networkFailCount = %u)", (uint8_t *)&v6, 0x12u);

  }
  return objc_msgSend((id)_baaNetworkRetryTimer, "resetWithTimeInterval:block:", &__block_literal_global_29, v3);
}

uint64_t __networkReachabilityHandler_block_invoke_28()
{
  return +[BAASupport prepare](BAASupport, "prepare");
}

id getBAAQueryDictionary()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  id v4;
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BDE9230];
  v1 = *MEMORY[0x24BDE8F50];
  v6[0] = *MEMORY[0x24BDE9220];
  v6[1] = v1;
  v7[0] = v0;
  v7[1] = CFSTR("com.apple.applesse");
  v2 = *MEMORY[0x24BDE90A0];
  v6[2] = *MEMORY[0x24BDE9128];
  v6[3] = v2;
  v7[2] = CFSTR("com.apple.applesse");
  v7[3] = CFSTR("BAASigKey");
  v3 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
  v4 = (id)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v3);

  return v4;
}

uint64_t isDeviceReadyToIssueCertificate()
{
  SCNetworkReachabilityFlags v0;
  SCNetworkReachabilityFlags v1;
  SCNetworkReachabilityFlags flags;
  uint8_t buf[4];
  SCNetworkReachabilityFlags v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  flags = 0;
  if (getNetworkReachability_onceToken != -1)
    dispatch_once(&getNetworkReachability_onceToken, &__block_literal_global_26);
  if (!getNetworkReachability_networkReachability
    || !SCNetworkReachabilityGetFlags((SCNetworkReachabilityRef)getNetworkReachability_networkReachability, &flags))
  {
    return 4294967290;
  }
  v0 = flags;
  if ((flags & 2) != 0)
  {
    v1 = (flags >> 4) & 1;
    if ((flags & 0x28) == 0)
      v1 = 1;
    if ((flags & 0x40004) != 4 || !v1)
      return isDeviceActivated(0);
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v5 = v0;
    _os_log_impl(&dword_21AB71000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "isNetworkReachable(): Not reachable (flags = 0x%x)", buf, 8u);
  }
  return 4294967284;
}

void scheduleBAACertificateRenewalTimer()
{
  NSObject *v0;

  v0 = dispatch_get_global_queue(21, 0);
  dispatch_async(v0, &__block_literal_global_65);

}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

id certificateValidity()
{
  id v0;
  void *v1;
  id v2;

  if (objc_msgSend((id)_delegate, "isInternal"))
  {
    v0 = getNumberFromBootArgs(CFSTR("sseBAACertValidity"));
    v1 = v0;
    if (v0)
      v2 = v0;
    else
      v2 = &unk_24DDB69C8;

  }
  else
  {
    v2 = &unk_24DDB69C8;
  }
  return v2;
}

void __createBAACertificates_block_invoke(_QWORD *a1, const void *a2, id a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  uint64_t BytePtr;
  id v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  const void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __createBAACertificates_block_invoke_cold_1((uint64_t)v8);
    LODWORD(_MergedGlobals) = _MergedGlobals + 1;
    if (mobileactivationErrorHasDomainAndErrorCode())
    {
      ++HIDWORD(_MergedGlobals);
      v9 = (id)objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v10 = (void *)_baaCertIssueNetworkFailTime;
      _baaCertIssueNetworkFailTime = (uint64_t)v9;

    }
    v11 = *(_QWORD *)(a1[4] + 8);
    v12 = -15;
    goto LABEL_7;
  }
  if (!objc_msgSend(v7, "count"))
  {
    v11 = *(_QWORD *)(a1[4] + 8);
    v12 = -6;
LABEL_7:
    *(_DWORD *)(v11 + 24) = v12;
    goto LABEL_17;
  }
  v32 = a2;
  v13 = (void *)MEMORY[0x24BDBCE60];
  v14 = certificateValidity();
  v15 = (id)objc_msgSend(v13, "dateWithTimeIntervalSinceNow:", (double)(unint64_t)(60* objc_msgSend(v14, "unsignedIntegerValue")));
  v16 = *(_QWORD *)(a1[5] + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v33 = v7;
  v18 = v7;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v35 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
        v24 = (void *)MEMORY[0x24BDBCE50];
        BytePtr = SecCertificateGetBytePtr();
        v26 = (id)objc_msgSend(v24, "dataWithBytes:length:", BytePtr, SecCertificateGetLength());
        objc_msgSend(v23, "addObject:", v26);

        v27 = (void *)MEMORY[0x24BDBCE60];
        SecCertificateNotValidAfter();
        v28 = (id)objc_msgSend(v27, "dateWithTimeIntervalSinceReferenceDate:");
        v29 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "earlierDate:", v28);
        v30 = *(_QWORD *)(a1[5] + 8);
        v31 = *(void **)(v30 + 40);
        *(_QWORD *)(v30 + 40) = v29;

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v20);
  }

  a2 = v32;
  v7 = v33;
LABEL_17:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1[7] + 8) + 40));
  if (a2)
    CFRelease(a2);

}

void __copy_helper_block_e8_32r40r48r56r(uint64_t a1, const void **a2)
{
  _Block_object_assign((void *)(a1 + 32), a2[4], 8);
  _Block_object_assign((void *)(a1 + 40), a2[5], 8);
  _Block_object_assign((void *)(a1 + 48), a2[6], 8);
  _Block_object_assign((void *)(a1 + 56), a2[7], 8);
}

void __destroy_helper_block_e8_32r40r48r56r(const void **a1)
{
  _Block_object_dispose(a1[7], 8);
  _Block_object_dispose(a1[6], 8);
  _Block_object_dispose(a1[5], 8);
  _Block_object_dispose(a1[4], 8);
}

id getNumberFromBootArgs(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  id v8;
  id v9;
  int v10;
  void *v11;
  id v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  if (getBootArgs_onceToken != -1)
    dispatch_once(&getBootArgs_onceToken, &__block_literal_global_57);
  v2 = (id)getBootArgs_bootArgs;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v2);
        v8 = (id)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "componentsSeparatedByString:", CFSTR("="), (_QWORD)v15);
        v9 = (id)objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
        v10 = objc_msgSend(v9, "isEqualToString:", v1);

        if (v10 && objc_msgSend(v8, "count") == 2)
        {
          v11 = (void *)MEMORY[0x24BDD16E0];
          v12 = (id)objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
          v13 = (id)objc_msgSend(v11, "numberWithInteger:", objc_msgSend(v12, "integerValue"));

          v5 = v13;
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __getBootArgs_block_invoke()
{
  io_registry_entry_t v0;
  io_registry_entry_t v1;
  const __CFString *v2;
  void *CFProperty;
  id v4;
  void *v5;
  id v6;
  void *v7;

  v0 = IORegistryEntryFromPath(*MEMORY[0x24BDD8B20], "IODeviceTree:/options");
  if (v0)
  {
    v1 = v0;
    v2 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], "boot-args", 0x8000100u);
    CFProperty = (void *)IORegistryEntryCreateCFProperty(v1, v2, 0, 0);
    CFRelease(v2);
    IOObjectRelease(v1);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = CFProperty;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v5 = 0;
        goto LABEL_8;
      }
      v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", CFProperty, 1);
    }
    v5 = v4;
LABEL_8:
    v6 = (id)objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(" "));
    v7 = (void *)getBootArgs_bootArgs;
    getBootArgs_bootArgs = (uint64_t)v6;

  }
}

void __scheduleBAACertificateIssuanceRetryTimer_block_invoke(double a1)
{
  double v1;
  id v2;
  int v3;
  id v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if ((_MergedGlobals - 1) <= 3)
  {
    LODWORD(a1) = _baaCertRetryPeriods[(_MergedGlobals - 1)];
    v1 = (double)*(unint64_t *)&a1;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v2 = (id)objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", v1);
      v3 = 138412290;
      v4 = v2;
      _os_log_impl(&dword_21AB71000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "scheduleBAACertificateIssuanceRetryTimer(): scheduled to %@", (uint8_t *)&v3, 0xCu);

    }
    objc_msgSend((id)_baaRenewalTimer, "resetWithTimeInterval:block:", &__block_literal_global_64, v1);
  }
}

uint64_t __scheduleBAACertificateIssuanceRetryTimer_block_invoke_63()
{
  objc_msgSend((id)_baaCertIssueLock, "lock");
  if ((_DWORD)_MergedGlobals)
    issueNewBAACertificate();
  return objc_msgSend((id)_baaCertIssueLock, "unlock");
}

uint64_t __scheduleBAACertificateRenewalTimer_block_invoke()
{
  uint64_t result;
  double v1;
  double v2;
  uint64_t v3;
  double v4;
  id v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  result = _baaCertExpDate;
  if (_baaCertExpDate)
  {
    objc_msgSend((id)_baaCertExpDate, "timeIntervalSinceNow");
    v2 = v1;
    v3 = certificateRenewPeriod();
    if (v2 - (double)(unint64_t)v3 >= 0.0)
      v4 = v2 - (double)(unint64_t)v3;
    else
      v4 = 0.0;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v5 = (id)objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", v4);
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_21AB71000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "scheduleBAACertificateRenewalTimer(): scheduled to %@", (uint8_t *)&v6, 0xCu);

    }
    return objc_msgSend((id)_baaRenewalTimer, "resetWithTimeInterval:block:", &__block_literal_global_67, v4);
  }
  return result;
}

uint64_t certificateRenewPeriod()
{
  uint64_t v0;
  id v1;
  void *v2;

  v0 = 2592000;
  if (objc_msgSend((id)_delegate, "isInternal"))
  {
    v1 = getNumberFromBootArgs(CFSTR("sseBAACertRenewPeriod"));
    v2 = v1;
    if (v1)
      v0 = objc_msgSend(v1, "unsignedIntegerValue");

  }
  return v0;
}

void issueNewBAACertificate_cold_1()
{
  _DWORD v0[2];
  uint64_t v1;

  v1 = *MEMORY[0x24BDAC8D0];
  v0[0] = 67109120;
  v0[1] = _MergedGlobals;
  _os_log_error_impl(&dword_21AB71000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "DeviceIdentityIssueClientCertificateWithCompletion(attempt = %u) timeout", (uint8_t *)v0, 8u);
}

void isDeviceActivated_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21AB71000, MEMORY[0x24BDACB70], a3, "MAEGetActivationStateWithError() -> %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __createBAACertificates_block_invoke_cold_1(uint64_t a1)
{
  _DWORD v1[2];
  __int16 v2;
  int v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v1[0] = 67109634;
  v1[1] = _MergedGlobals;
  v2 = 1024;
  v3 = HIDWORD(_MergedGlobals);
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_21AB71000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "DeviceIdentityIssueClientCertificateWithCompletion(attempt = %u, networkFailCount = %u) failed: %@", (uint8_t *)v1, 0x18u);
  OUTLINED_FUNCTION_1();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

uint64_t DeviceIdentityIssueClientCertificateWithCompletion()
{
  return MEMORY[0x24BE2C378]();
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x24BDD88C0](*(_QWORD *)&mainPort, path);
}

uint64_t MAEGetActivationStateWithError()
{
  return MEMORY[0x24BE66A40]();
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return (SCNetworkReachabilityRef)MEMORY[0x24BDF5760](allocator, address);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x24BDF5790](target, flags);
}

Boolean SCNetworkReachabilitySetCallback(SCNetworkReachabilityRef target, SCNetworkReachabilityCallBack callout, SCNetworkReachabilityContext *context)
{
  return MEMORY[0x24BDF57A0](target, callout, context);
}

Boolean SCNetworkReachabilitySetDispatchQueue(SCNetworkReachabilityRef target, dispatch_queue_t queue)
{
  return MEMORY[0x24BDF57A8](target, queue);
}

uint64_t SecCertificateCreateWithBytes()
{
  return MEMORY[0x24BDE8910]();
}

uint64_t SecCertificateGetBytePtr()
{
  return MEMORY[0x24BDE8928]();
}

uint64_t SecCertificateGetLength()
{
  return MEMORY[0x24BDE8930]();
}

uint64_t SecCertificateIsValid()
{
  return MEMORY[0x24BDE8968]();
}

uint64_t SecCertificateNotValidAfter()
{
  return MEMORY[0x24BDE8970]();
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A78](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x24BDE8A80](query);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x24BDAC728](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x24BDAE008](when, delta);
}

uint64_t mobileactivationErrorHasDomainAndErrorCode()
{
  return MEMORY[0x24BE2C4A0]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

