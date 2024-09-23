void sub_100001794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000018B4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1000018CC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  uint64_t v13;
  int v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(DEPLogObjects() + 8);
  if (v6)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v14 = 138543362;
    v15 = v6;
    v9 = "Error retrieving mid: %{public}@";
    v10 = v7;
    v11 = OS_LOG_TYPE_ERROR;
    v12 = 12;
  }
  else
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      goto LABEL_7;
    LOWORD(v14) = 0;
    v9 = "Successfully retrieved mid";
    v10 = v7;
    v11 = OS_LOG_TYPE_INFO;
    v12 = 2;
  }
  _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, (uint8_t *)&v14, v12);
LABEL_7:
  v13 = *(_QWORD *)(a1 + 32);
  if (v13)
    (*(void (**)(uint64_t, uint64_t))(v13 + 16))(v13, v8);

}

void *sub_1000019D4(uint64_t a1)
{
  void *v2;
  char *v3;
  void *result;
  char *v5;
  __int128 v6;
  uint64_t v7;

  v5 = 0;
  if (!qword_100021598)
  {
    v6 = off_100018640;
    v7 = 0;
    qword_100021598 = _sl_dlopen(&v6, &v5);
    v3 = v5;
    v2 = (void *)qword_100021598;
    if (qword_100021598)
    {
      if (!v5)
        goto LABEL_5;
    }
    else
    {
      v3 = (char *)abort_report_np("%s", v5);
    }
    free(v3);
    goto LABEL_5;
  }
  v2 = (void *)qword_100021598;
LABEL_5:
  result = dlsym(v2, "MAECopyActivationRecordWithError");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  off_100021590 = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_100001AC4(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;

  v3 = 0;
  if (!qword_1000215A8)
  {
    v4 = off_100018658;
    v5 = 0;
    qword_1000215A8 = _sl_dlopen(&v4, &v3);
    if (!qword_1000215A8)
    {
      abort_report_np("%s", (const char *)v3);
LABEL_8:
      sub_10000DFB8();
    }
    if (v3)
      free(v3);
  }
  result = objc_getClass("AKAnisetteProvisioningController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_8;
  qword_1000215A0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1000021AC(uint64_t a1)
{
  id v2;
  _QWORD v3[4];
  id v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100002230;
  v3[3] = &unk_100018890;
  v4 = *(id *)(a1 + 40);
  DeviceIdentityIssueClientCertificateWithCompletion(0, v2, v3);

}

void sub_100002230(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  int v16;
  void *v17;

  v7 = a3;
  v8 = a4;
  v11 = v8;
  if (v8)
  {
    v12 = *(NSObject **)(DEPLogObjects(v8, v9, v10) + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "description"));
      v16 = 138543362;
      v17 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Error while retrieving client certificates: %{public}@", (uint8_t *)&v16, 0xCu);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v15 = *(_QWORD *)(a1 + 32);
    if (v15)
    {
      (*(void (**)(uint64_t, void *, id, _QWORD))(v15 + 16))(v15, a2, v7, 0);

    }
  }

}

void sub_100003F9C(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "deviceType"));
  byte_1000215B0 = objc_msgSend(v1, "isEqualToString:", CFSTR("iPad"));

}

void sub_100004050(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "deviceType"));
  byte_1000215C0 = objc_msgSend(v1, "isEqualToString:", CFSTR("AppleTV"));

}

void sub_100004104(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "deviceType"));
  byte_1000215D0 = objc_msgSend(v1, "isEqualToString:", CFSTR("Watch"));

}

void sub_1000041B8(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "deviceType"));
  byte_1000215E0 = objc_msgSend(v1, "isEqualToString:", CFSTR("AudioAccessory"));

}

void sub_10000426C(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "deviceType"));
  byte_1000215F0 = objc_msgSend(v1, "isEqualToString:", CFSTR("iPhone"));

}

void sub_1000042FC(id a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v1 = MGCopyAnswer(CFSTR("3kmXfug8VcxLI5yEmsqQKw"), 0);
  v2 = (void *)v1;
  if (v1)
  {
    v4 = (void *)v1;
    v3 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v4, v3) & 1) != 0)
      LOBYTE(v1) = objc_msgSend(v4, "BOOLValue");
    else
      LOBYTE(v1) = 0;
    v2 = v4;
  }
  byte_100021600 = v1;

}

void sub_100004480(id a1)
{
  id v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithContentsOfFile:", CFSTR("/System/Library/CoreServices/SystemVersion.plist"));
  v2 = (void *)qword_100021610;
  qword_100021610 = (uint64_t)v1;

}

void sub_100006C20(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[9];
  _QWORD v14[9];

  v13[0] = CFSTR("PROFILE_NOT_ACTIVE");
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "profileNotActiveError"));
  v14[0] = v2;
  v13[1] = CFSTR("PROFILE_NOT_FOUND");
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "profileNotFoundError"));
  v14[1] = v3;
  v13[2] = CFSTR("DEVICE_NOT_FOUND");
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "deviceNotFoundError"));
  v14[2] = v4;
  v13[3] = CFSTR("DEVICE_NOT_ENROLLED");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "deviceNotEnrolledError"));
  v14[3] = v5;
  v13[4] = CFSTR("NONCE_EXPIRED");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "nonceExpiredError"));
  v14[4] = v6;
  v13[5] = CFSTR("INVALID_SIGNATURE");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "invalidSignatureError"));
  v14[5] = v7;
  v13[6] = CFSTR("INVALID_DEVICE");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "invalidDeviceError"));
  v14[6] = v8;
  v13[7] = CFSTR("INVALID_PROFILE");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "invalidProfileError"));
  v14[7] = v9;
  v13[8] = CFSTR("CANNOT_ENROLL");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "deviceAlreadyEnrolledError"));
  v14[8] = v10;
  v11 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 9));
  v12 = (void *)qword_100021628;
  qword_100021628 = v11;

}

void sub_100007768(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "idleTimer"));
  objc_msgSend(v2, "invalidate");

  v3 = objc_alloc((Class)NSTimer);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 300.0));
  v5 = objc_msgSend(v3, "initWithFireDate:interval:target:selector:userInfo:repeats:", v4, *(_QWORD *)(a1 + 32), "idleTimerDidFire:", 0, 0, 0.0);
  objc_msgSend(*(id *)(a1 + 32), "setIdleTimer:", v5);

  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "idleTimer"));
  objc_msgSend(v7, "addTimer:forMode:", v6, NSRunLoopCommonModes);

}

void sub_1000085DC(id a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[4];
  _BYTE v22[128];

  v1 = objc_claimAutoreleasedReturnValue(+[CCDDeviceUtilities deviceType](CCDDeviceUtilities, "deviceType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CCDDeviceUtilities productName](CCDDeviceUtilities, "productName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CCDDeviceUtilities productBuildVersion](CCDDeviceUtilities, "productBuildVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CCDDeviceUtilities productBuildVersion](CCDDeviceUtilities, "productBuildVersion"));
  v16 = (void *)v1;
  v21[0] = v1;
  v21[1] = v2;
  v21[2] = v3;
  v21[3] = v4;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 4));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        if (v11)
        {
          if (objc_msgSend(v8, "length"))
          {
            objc_msgSend(v8, "appendFormat:", CFSTR("; %@"), v11);
          }
          else
          {
            v12 = objc_msgSend(v11, "mutableCopy");

            v8 = v12;
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  if (objc_msgSend(v8, "length"))
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" (%@)"), v8));
  else
    v13 = &stru_100019AB0;
  v14 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ConfigClient/1.0%@"), v13));
  v15 = (void *)qword_100021630;
  qword_100021630 = v14;

}

void sub_100008898(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  id v15;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9 && (v10 = objc_msgSend(*(id *)(a1 + 32), "isCancelled"), (v10 & 1) == 0))
  {
    v13 = *(NSObject **)(DEPLogObjects(v10, v11, v12) + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = 138543362;
      v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to retrieve the client certificate: %{public}@.", (uint8_t *)&v14, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "setCertificateRetrievalFailed:", 1);
    objc_msgSend(*(id *)(a1 + 32), "_retryCertificateRetrievalIfAllowedAfterDelayOrFailWithError:", v9);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_completeOperationWithReferenceKey:certificates:error:", v7, v8, v9);
  }

}

void sub_100009230(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  uint64_t v38;

  _Block_object_dispose(&a38, 8);
  _Block_object_dispose((const void *)(v38 - 248), 8);
  _Block_object_dispose((const void *)(v38 - 200), 8);
  _Block_object_dispose((const void *)(v38 - 168), 8);
  _Block_object_dispose((const void *)(v38 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000928C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10000929C(uint64_t a1)
{

}

id sub_1000092A4(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  uint8_t v6[16];

  v4 = *(NSObject **)(DEPLogObjects(a1, a2, a3) + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Done retrieving mid", v6, 2u);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "lock");
  if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
    (*(void (**)(void))(a1[4] + 16))();
  else
    *(_BYTE *)(*(_QWORD *)(a1[10] + 8) + 24) = 1;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "unlock");
}

void sub_100009378(_QWORD *a1, char a2, void *a3, void *a4)
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t v13[16];

  v8 = a3;
  v9 = a4;
  v12 = *(NSObject **)(DEPLogObjects(v9, v10, v11) + 8);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Done retrieving cloud configuration", v13, 2u);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "lock");
  if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    (*(void (**)(void))(a1[4] + 16))();
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = a2;
    objc_storeStrong((id *)(*(_QWORD *)(a1[8] + 8) + 40), a3);
    objc_storeStrong((id *)(*(_QWORD *)(a1[9] + 8) + 40), a4);
    *(_BYTE *)(*(_QWORD *)(a1[10] + 8) + 24) = 1;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "unlock");

}

uint64_t sub_1000098E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, BOOL, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a3 == 0, a2);
}

void sub_100009A9C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  void *v7;
  id v8;

  v8 = a3;
  if (a4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setPrivateKey:", a2);
    objc_msgSend(*(id *)(a1 + 32), "setClientCertificates:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_operationForEnrollmentRequest:", *(_QWORD *)(a1 + 32)));
    objc_msgSend(v7, "setEnrollmentCompletionBlock:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "_addOperationToQueue:", v7);

  }
}

void sub_10000B474(id a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD v50[3];
  _QWORD v51[3];
  _QWORD v52[3];
  _QWORD v53[3];
  _QWORD v54[2];
  _QWORD v55[2];
  _QWORD v56[2];
  _QWORD v57[2];
  _QWORD v58[3];
  _QWORD v59[3];
  const __CFString *v60;
  void *v61;
  _QWORD v62[2];
  _QWORD v63[2];
  _QWORD v64[3];
  _QWORD v65[3];
  _QWORD v66[3];
  _QWORD v67[3];
  _QWORD v68[3];
  _QWORD v69[3];
  _QWORD v70[3];
  _QWORD v71[3];
  _QWORD v72[4];
  _QWORD v73[4];
  _QWORD v74[3];
  _QWORD v75[3];
  _QWORD v76[3];
  _QWORD v77[3];
  _QWORD v78[3];
  _QWORD v79[3];
  _QWORD v80[3];
  _QWORD v81[3];
  _QWORD v82[3];
  _QWORD v83[3];
  _QWORD v84[3];
  _QWORD v85[3];
  _QWORD v86[3];
  _QWORD v87[3];
  _QWORD v88[3];
  _QWORD v89[3];
  _QWORD v90[3];
  _QWORD v91[3];
  _QWORD v92[3];
  _QWORD v93[3];
  _QWORD v94[3];
  _QWORD v95[3];
  _QWORD v96[3];
  _QWORD v97[3];
  _QWORD v98[3];
  _QWORD v99[3];
  _QWORD v100[3];
  _QWORD v101[3];
  _QWORD v102[3];
  _QWORD v103[3];
  _QWORD v104[3];
  _QWORD v105[3];
  _QWORD v106[17];
  _QWORD v107[17];
  _QWORD v108[2];
  _QWORD v109[2];
  _QWORD v110[3];
  _QWORD v111[3];
  _QWORD v112[3];
  _QWORD v113[3];
  _QWORD v114[3];
  _QWORD v115[3];
  _QWORD v116[3];
  _QWORD v117[3];
  _QWORD v118[3];
  _QWORD v119[3];
  _QWORD v120[3];
  _QWORD v121[3];
  _QWORD v122[3];
  _QWORD v123[3];
  _QWORD v124[3];
  _QWORD v125[3];
  _QWORD v126[3];
  _QWORD v127[3];
  _QWORD v128[3];
  _QWORD v129[3];
  _QWORD v130[3];
  _QWORD v131[3];
  _QWORD v132[3];
  _QWORD v133[3];
  _QWORD v134[3];
  _QWORD v135[3];
  _QWORD v136[3];
  _QWORD v137[3];
  _QWORD v138[3];
  _QWORD v139[3];
  _QWORD v140[15];
  _QWORD v141[15];
  _QWORD v142[2];
  _QWORD v143[2];
  _QWORD v144[4];
  _QWORD v145[4];

  v144[0] = CFSTR("org");
  v143[0] = &__kCFBooleanTrue;
  v142[0] = CFSTR("isRequired");
  v142[1] = CFSTR("keyInfo");
  v140[0] = CFSTR("name");
  v138[0] = CFSTR("isRequired");
  v138[1] = CFSTR("validationType");
  v139[0] = &__kCFBooleanTrue;
  v139[1] = &off_10001AAA8;
  v138[2] = CFSTR("destinationKey");
  v139[2] = CFSTR("OrganizationName");
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v139, v138, 3));
  v141[0] = v49;
  v140[1] = CFSTR("address");
  v136[0] = CFSTR("isRequired");
  v136[1] = CFSTR("validationType");
  v137[0] = &__kCFBooleanFalse;
  v137[1] = &off_10001AAA8;
  v136[2] = CFSTR("destinationKey");
  v137[2] = CFSTR("OrganizationAddress");
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v137, v136, 3));
  v141[1] = v48;
  v140[2] = CFSTR("address-line-1");
  v134[0] = CFSTR("isRequired");
  v134[1] = CFSTR("validationType");
  v135[0] = &__kCFBooleanFalse;
  v135[1] = &off_10001AAA8;
  v134[2] = CFSTR("destinationKey");
  v135[2] = CFSTR("OrganizationAddressLine1");
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v135, v134, 3));
  v141[2] = v47;
  v140[3] = CFSTR("address-line-2");
  v132[0] = CFSTR("isRequired");
  v132[1] = CFSTR("validationType");
  v133[0] = &__kCFBooleanFalse;
  v133[1] = &off_10001AAA8;
  v132[2] = CFSTR("destinationKey");
  v133[2] = CFSTR("OrganizationAddressLine2");
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v133, v132, 3));
  v141[3] = v46;
  v140[4] = CFSTR("address-line-3");
  v130[0] = CFSTR("isRequired");
  v130[1] = CFSTR("validationType");
  v131[0] = &__kCFBooleanFalse;
  v131[1] = &off_10001AAA8;
  v130[2] = CFSTR("destinationKey");
  v131[2] = CFSTR("OrganizationAddressLine3");
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v131, v130, 3));
  v141[4] = v45;
  v140[5] = CFSTR("city");
  v128[0] = CFSTR("isRequired");
  v128[1] = CFSTR("validationType");
  v129[0] = &__kCFBooleanFalse;
  v129[1] = &off_10001AAA8;
  v128[2] = CFSTR("destinationKey");
  v129[2] = CFSTR("OrganizationCity");
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v129, v128, 3));
  v141[5] = v44;
  v140[6] = CFSTR("region");
  v126[0] = CFSTR("isRequired");
  v126[1] = CFSTR("validationType");
  v127[0] = &__kCFBooleanFalse;
  v127[1] = &off_10001AAA8;
  v126[2] = CFSTR("destinationKey");
  v127[2] = CFSTR("OrganizationRegion");
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v127, v126, 3));
  v141[6] = v43;
  v140[7] = CFSTR("zip-code");
  v124[0] = CFSTR("isRequired");
  v124[1] = CFSTR("validationType");
  v125[0] = &__kCFBooleanFalse;
  v125[1] = &off_10001AAA8;
  v124[2] = CFSTR("destinationKey");
  v125[2] = CFSTR("OrganizationZipCode");
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v125, v124, 3));
  v141[7] = v42;
  v140[8] = CFSTR("country");
  v122[0] = CFSTR("isRequired");
  v122[1] = CFSTR("validationType");
  v123[0] = &__kCFBooleanFalse;
  v123[1] = &off_10001AAA8;
  v122[2] = CFSTR("destinationKey");
  v123[2] = CFSTR("OrganizationCountry");
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v123, v122, 3));
  v141[8] = v41;
  v140[9] = CFSTR("phone");
  v120[0] = CFSTR("isRequired");
  v120[1] = CFSTR("validationType");
  v121[0] = &__kCFBooleanFalse;
  v121[1] = &off_10001AAA8;
  v120[2] = CFSTR("destinationKey");
  v121[2] = CFSTR("OrganizationPhone");
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v121, v120, 3));
  v141[9] = v40;
  v140[10] = CFSTR("magic");
  v118[0] = CFSTR("isRequired");
  v118[1] = CFSTR("validationType");
  v119[0] = &__kCFBooleanFalse;
  v119[1] = &off_10001AAA8;
  v118[2] = CFSTR("destinationKey");
  v119[2] = CFSTR("OrganizationMagic");
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v119, v118, 3));
  v141[10] = v39;
  v140[11] = CFSTR("email");
  v116[0] = CFSTR("isRequired");
  v116[1] = CFSTR("validationType");
  v117[0] = &__kCFBooleanFalse;
  v117[1] = &off_10001AAA8;
  v116[2] = CFSTR("destinationKey");
  v117[2] = CFSTR("OrganizationEmail");
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v117, v116, 3));
  v141[11] = v38;
  v140[12] = CFSTR("department");
  v114[0] = CFSTR("isRequired");
  v114[1] = CFSTR("validationType");
  v115[0] = &__kCFBooleanFalse;
  v115[1] = &off_10001AAA8;
  v114[2] = CFSTR("destinationKey");
  v115[2] = CFSTR("OrganizationDepartment");
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v115, v114, 3));
  v141[12] = v37;
  v140[13] = CFSTR("support-phone-number");
  v112[0] = CFSTR("isRequired");
  v112[1] = CFSTR("validationType");
  v113[0] = &__kCFBooleanFalse;
  v113[1] = &off_10001AAA8;
  v112[2] = CFSTR("destinationKey");
  v113[2] = CFSTR("OrganizationSupportPhone");
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v113, v112, 3));
  v141[13] = v36;
  v140[14] = CFSTR("support-email-address");
  v110[0] = CFSTR("isRequired");
  v110[1] = CFSTR("validationType");
  v111[0] = &__kCFBooleanFalse;
  v111[1] = &off_10001AAA8;
  v110[2] = CFSTR("destinationKey");
  v111[2] = CFSTR("OrganizationSupportEmail");
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v111, v110, 3));
  v141[14] = v35;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v141, v140, 15));
  v143[1] = v34;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v143, v142, 2));
  v145[0] = v33;
  v144[1] = CFSTR("config");
  v109[0] = &__kCFBooleanFalse;
  v108[0] = CFSTR("isRequired");
  v108[1] = CFSTR("keyInfo");
  v106[0] = CFSTR("url");
  v104[0] = CFSTR("isRequired");
  v104[1] = CFSTR("validationType");
  v105[0] = &__kCFBooleanTrue;
  v105[1] = &off_10001AAC0;
  v104[2] = CFSTR("destinationKey");
  v105[2] = CFSTR("ConfigurationURL");
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v105, v104, 3));
  v107[0] = v32;
  v106[1] = CFSTR("management-protocol-version");
  v102[0] = CFSTR("isRequired");
  v102[1] = CFSTR("validationType");
  v103[0] = &__kCFBooleanFalse;
  v103[1] = &off_10001AAD8;
  v102[2] = CFSTR("destinationKey");
  v103[2] = CFSTR("MDMProtocolVersion");
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v103, v102, 3));
  v107[1] = v31;
  v106[2] = CFSTR("is-supervised");
  v100[0] = CFSTR("isRequired");
  v100[1] = CFSTR("validationType");
  v101[0] = &__kCFBooleanFalse;
  v101[1] = &off_10001AAF0;
  v100[2] = CFSTR("destinationKey");
  v101[2] = CFSTR("IsSupervised");
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v101, v100, 3));
  v107[2] = v30;
  v106[3] = CFSTR("allow-pairing");
  v98[0] = CFSTR("isRequired");
  v98[1] = CFSTR("validationType");
  v99[0] = &__kCFBooleanFalse;
  v99[1] = &off_10001AAF0;
  v98[2] = CFSTR("destinationKey");
  v99[2] = CFSTR("AllowPairing");
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v99, v98, 3));
  v107[3] = v29;
  v106[4] = CFSTR("is-mandatory");
  v96[0] = CFSTR("isRequired");
  v96[1] = CFSTR("validationType");
  v97[0] = &__kCFBooleanFalse;
  v97[1] = &off_10001AAF0;
  v96[2] = CFSTR("destinationKey");
  v97[2] = CFSTR("IsMandatory");
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v97, v96, 3));
  v107[4] = v28;
  v106[5] = CFSTR("is-mdm-removable");
  v94[0] = CFSTR("isRequired");
  v94[1] = CFSTR("validationType");
  v95[0] = &__kCFBooleanFalse;
  v95[1] = &off_10001AB08;
  v94[2] = CFSTR("destinationKey");
  v95[2] = CFSTR("IsMDMUnremovable");
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v95, v94, 3));
  v107[5] = v27;
  v106[6] = CFSTR("anchor-certs");
  v92[0] = CFSTR("isRequired");
  v92[1] = CFSTR("validationType");
  v93[0] = &__kCFBooleanFalse;
  v93[1] = &off_10001AB20;
  v92[2] = CFSTR("destinationKey");
  v93[2] = CFSTR("AnchorCertificates");
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v93, v92, 3));
  v107[6] = v26;
  v106[7] = CFSTR("supervision-host-certs");
  v90[0] = CFSTR("isRequired");
  v90[1] = CFSTR("validationType");
  v91[0] = &__kCFBooleanFalse;
  v91[1] = &off_10001AB20;
  v90[2] = CFSTR("destinationKey");
  v91[2] = CFSTR("SupervisorHostCertificates");
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v91, v90, 3));
  v107[7] = v25;
  v106[8] = CFSTR("skip-buddy-items");
  v88[0] = CFSTR("isRequired");
  v88[1] = CFSTR("validationType");
  v89[0] = &__kCFBooleanFalse;
  v89[1] = &off_10001AB38;
  v88[2] = CFSTR("destinationKey");
  v89[2] = CFSTR("SkipSetup");
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v89, v88, 3));
  v107[8] = v24;
  v106[9] = CFSTR("is-multi-user");
  v86[0] = CFSTR("isRequired");
  v86[1] = CFSTR("validationType");
  v87[0] = &__kCFBooleanFalse;
  v87[1] = &off_10001AAF0;
  v86[2] = CFSTR("destinationKey");
  v87[2] = CFSTR("IsMultiUser");
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v87, v86, 3));
  v107[9] = v23;
  v106[10] = CFSTR("await-device-configured");
  v84[0] = CFSTR("isRequired");
  v84[1] = CFSTR("validationType");
  v85[0] = &__kCFBooleanFalse;
  v85[1] = &off_10001AAF0;
  v84[2] = CFSTR("destinationKey");
  v85[2] = CFSTR("AwaitDeviceConfigured");
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v85, v84, 3));
  v107[10] = v22;
  v106[11] = CFSTR("auto-advance-setup");
  v82[0] = CFSTR("isRequired");
  v82[1] = CFSTR("validationType");
  v83[0] = &__kCFBooleanFalse;
  v83[1] = &off_10001AAF0;
  v82[2] = CFSTR("destinationKey");
  v83[2] = CFSTR("AutoAdvanceSetup");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v83, v82, 3));
  v107[11] = v21;
  v106[12] = CFSTR("language");
  v80[0] = CFSTR("isRequired");
  v80[1] = CFSTR("validationType");
  v81[0] = &__kCFBooleanFalse;
  v81[1] = &off_10001AAA8;
  v80[2] = CFSTR("destinationKey");
  v81[2] = CFSTR("Language");
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v81, v80, 3));
  v107[12] = v20;
  v106[13] = CFSTR("region");
  v78[0] = CFSTR("isRequired");
  v78[1] = CFSTR("validationType");
  v79[0] = &__kCFBooleanFalse;
  v79[1] = &off_10001AAA8;
  v78[2] = CFSTR("destinationKey");
  v79[2] = CFSTR("Region");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v79, v78, 3));
  v107[13] = v19;
  v106[14] = CFSTR("script");
  v76[0] = CFSTR("isRequired");
  v76[1] = CFSTR("validationType");
  v77[0] = &__kCFBooleanFalse;
  v77[1] = &off_10001AAA8;
  v76[2] = CFSTR("destinationKey");
  v77[2] = CFSTR("Script");
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v77, v76, 3));
  v107[14] = v18;
  v106[15] = CFSTR("configuration-web-url");
  v74[0] = CFSTR("isRequired");
  v74[1] = CFSTR("validationType");
  v75[0] = &__kCFBooleanFalse;
  v75[1] = &off_10001AAA8;
  v74[2] = CFSTR("destinationKey");
  v75[2] = CFSTR("ConfigurationWebURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v75, v74, 3));
  v106[16] = CFSTR("enrollment-server");
  v73[0] = &__kCFBooleanFalse;
  v73[1] = &off_10001AB50;
  v107[15] = v17;
  v73[2] = CFSTR("EnrollmentServer");
  v72[0] = CFSTR("isRequired");
  v72[1] = CFSTR("validationType");
  v72[2] = CFSTR("destinationKey");
  v72[3] = CFSTR("subKey");
  v70[0] = CFSTR("enrollment-url");
  v68[0] = CFSTR("isRequired");
  v68[1] = CFSTR("validationType");
  v69[0] = &__kCFBooleanTrue;
  v69[1] = &off_10001AAC0;
  v68[2] = CFSTR("destinationKey");
  v69[2] = CFSTR("EnrollmentURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v69, v68, 3));
  v71[0] = v16;
  v70[1] = CFSTR("enrollment-anchor-certificates");
  v66[0] = CFSTR("isRequired");
  v66[1] = CFSTR("validationType");
  v67[0] = &__kCFBooleanFalse;
  v67[1] = &off_10001AB20;
  v66[2] = CFSTR("destinationKey");
  v67[2] = CFSTR("EnrollmentAnchorCertificates");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v67, v66, 3));
  v71[1] = v15;
  v70[2] = CFSTR("supported-features");
  v64[0] = CFSTR("isRequired");
  v64[1] = CFSTR("validationType");
  v65[0] = &__kCFBooleanFalse;
  v65[1] = &off_10001AB68;
  v64[2] = CFSTR("destinationKey");
  v65[2] = CFSTR("SupportedFeatures");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v65, v64, 3));
  v71[2] = v14;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v71, v70, 3));
  v73[3] = v13;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v73, v72, 4));
  v107[16] = v12;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v107, v106, 17));
  v109[1] = v11;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v109, v108, 2));
  v145[1] = v10;
  v144[2] = CFSTR("enrollment");
  v63[0] = &__kCFBooleanFalse;
  v62[0] = CFSTR("isRequired");
  v62[1] = CFSTR("keyInfo");
  v60 = CFSTR("expiry");
  v58[0] = CFSTR("isRequired");
  v58[1] = CFSTR("validationType");
  v59[0] = &__kCFBooleanTrue;
  v59[1] = &off_10001AAD8;
  v58[2] = CFSTR("destinationKey");
  v59[2] = CFSTR("ProvisionalEnrollmentExpiry");
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v59, v58, 3));
  v61 = v1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1));
  v63[1] = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v63, v62, 2));
  v145[2] = v3;
  v144[3] = CFSTR("user");
  v56[1] = CFSTR("keyInfo");
  v57[0] = &__kCFBooleanFalse;
  v56[0] = CFSTR("isRequired");
  v54[0] = CFSTR("ft_maid");
  v52[0] = CFSTR("isRequired");
  v52[1] = CFSTR("validationType");
  v53[0] = &__kCFBooleanFalse;
  v53[1] = &off_10001AAA8;
  v52[2] = CFSTR("destinationKey");
  v53[2] = CFSTR("MAIDUsername");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v53, v52, 3));
  v55[0] = v4;
  v54[1] = CFSTR("ft_token");
  v50[0] = CFSTR("isRequired");
  v50[1] = CFSTR("validationType");
  v51[0] = &__kCFBooleanFalse;
  v51[1] = &off_10001AB80;
  v50[2] = CFSTR("destinationKey");
  v51[2] = CFSTR("MAIDHasCredential");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v51, v50, 3));
  v55[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v55, v54, 2));
  v57[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v57, v56, 2));
  v145[3] = v7;
  v8 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v145, v144, 4));
  v9 = (void *)qword_100021640;
  qword_100021640 = v8;

}

uint64_t start(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  CCDServer *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  uint8_t v15[16];
  uint8_t v16[16];
  uint8_t buf[16];

  v2 = *(NSObject **)(DEPLogObjects(a1, a2) + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "service starting...", buf, 2u);
  }
  v3 = objc_alloc_init(CCDServer);
  v5 = (void *)objc_opt_new(CCDGatekeeper, v4);
  objc_msgSend(v5, "setServer:", v3);
  v6 = objc_alloc((Class)NSXPCListener);
  v7 = objc_msgSend(v6, "initWithMachServiceName:", kCCServiceName);
  v8 = objc_msgSend(v7, "setDelegate:", v5);
  v10 = *(NSObject **)(DEPLogObjects(v8, v9) + 8);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "awaiting connections...", v16, 2u);
  }
  objc_msgSend(v7, "resume");
  CFRunLoopRun();
  v11 = objc_msgSend(v7, "invalidate");
  v13 = *(NSObject **)(DEPLogObjects(v11, v12) + 8);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "service stopping.", v15, 2u);
  }

  return 0;
}

void sub_10000DF98()
{
  char *v0;
  uint64_t v1;

  v0 = dlerror();
  v1 = abort_report_np("%s", v0);
  sub_10000DFB8(v1);
}

void sub_10000DFB8()
{
  __CFDictionary *v0;
  const void *v1;
  const void *v2;

  v0 = (__CFDictionary *)abort_report_np("Unable to find class %s", "AKAnisetteProvisioningController");
  CFDictionaryAddValue(v0, v1, v2);
}

id objc_msgSend_DEPErrorWithDomain_code_descriptionArray_errorType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "DEPErrorWithDomain:code:descriptionArray:errorType:");
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_UDID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UDID");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend__addOperationToQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addOperationToQueue:");
}

id objc_msgSend__callCompletionBlockWithResponse_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_callCompletionBlockWithResponse:error:");
}

id objc_msgSend__certificateDataFromBase64EncodedString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_certificateDataFromBase64EncodedString:");
}

id objc_msgSend__cloudConfigErrorResponses(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cloudConfigErrorResponses");
}

id objc_msgSend__completeOperationWithReferenceKey_certificates_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_completeOperationWithReferenceKey:certificates:error:");
}

id objc_msgSend__contentType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_contentType");
}

id objc_msgSend__convertCloudConfigDictionary_toManagedConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_convertCloudConfigDictionary:toManagedConfiguration:");
}

id objc_msgSend__deviceDetails(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_deviceDetails");
}

id objc_msgSend__deviceInfoDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_deviceInfoDictionary");
}

id objc_msgSend__endpointURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_endpointURL");
}

id objc_msgSend__enrollmentURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_enrollmentURL");
}

id objc_msgSend__errorStringForResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_errorStringForResponse:");
}

id objc_msgSend__invalidateAndCancelURLSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_invalidateAndCancelURLSession");
}

id objc_msgSend__mutableKeyInfoArrayFromValidationInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_mutableKeyInfoArrayFromValidationInfo:");
}

id objc_msgSend__newQueryWithService_account_label_description_group_useSystemKeychain_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_newQueryWithService:account:label:description:group:useSystemKeychain:outError:");
}

id objc_msgSend__operationForDeviceUploadRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_operationForDeviceUploadRequest:");
}

id objc_msgSend__operationForEnrollmentRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_operationForEnrollmentRequest:");
}

id objc_msgSend__printStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_printStatusCode:");
}

id objc_msgSend__requestBodyData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_requestBodyData");
}

id objc_msgSend__requestForDeviceUploadRequestType_userCredentials_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_requestForDeviceUploadRequestType:userCredentials:");
}

id objc_msgSend__requestHeader(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_requestHeader");
}

id objc_msgSend__retryCertificateRetrievalIfAllowed_afterDelay_orFailWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_retryCertificateRetrievalIfAllowed:afterDelay:orFailWithError:");
}

id objc_msgSend__retryCertificateRetrievalIfAllowedAfterDelayOrFailWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_retryCertificateRetrievalIfAllowedAfterDelayOrFailWithError:");
}

id objc_msgSend__retryRequestIfAllowed_afterDelay_orFailWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_retryRequestIfAllowed:afterDelay:orFailWithError:");
}

id objc_msgSend__retryRequestOrFailWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_retryRequestOrFailWithError:");
}

id objc_msgSend__sendFailureNoticeToRemote(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendFailureNoticeToRemote");
}

id objc_msgSend__sendResponseInfoToRemoteWithStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendResponseInfoToRemoteWithStatusCode:");
}

id objc_msgSend__setEnrolledDeviceRequirementsIfNeededForCloudConfigurationDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setEnrolledDeviceRequirementsIfNeededForCloudConfigurationDictionary:");
}

id objc_msgSend__setLockdownCloudConfigAvailableKeyIfNeededWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setLockdownCloudConfigAvailableKeyIfNeededWithError:");
}

id objc_msgSend__signPayloadData_withPrivateKey_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_signPayloadData:withPrivateKey:outError:");
}

id objc_msgSend__startProcessForDeviceUploadRequest_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startProcessForDeviceUploadRequest:completionBlock:");
}

id objc_msgSend__startProcessForEnrollmentRequest_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startProcessForEnrollmentRequest:completionBlock:");
}

id objc_msgSend__startRetryTimerWithInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startRetryTimerWithInterval:");
}

id objc_msgSend__statusCodeFromResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_statusCodeFromResponse:");
}

id objc_msgSend__systemInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_systemInfo");
}

id objc_msgSend__validateBooleanInDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_validateBooleanInDictionary:");
}

id objc_msgSend__validateCertificateArrayInDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_validateCertificateArrayInDictionary:");
}

id objc_msgSend__validateCredentialTokenInDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_validateCredentialTokenInDictionary:");
}

id objc_msgSend__validateDictionaryInDictionary_resultsDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_validateDictionaryInDictionary:resultsDictionary:");
}

id objc_msgSend__validateEnrollmentResponse_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_validateEnrollmentResponse:error:");
}

id objc_msgSend__validateHttpsURLStringInDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_validateHttpsURLStringInDictionary:");
}

id objc_msgSend__validateNumberInDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_validateNumberInDictionary:");
}

id objc_msgSend__validateStringArrayInDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_validateStringArrayInDictionary:");
}

id objc_msgSend__validateStringInDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_validateStringInDictionary:");
}

id objc_msgSend__validateUnstructureddDictionaryInDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_validateUnstructureddDictionaryInDictionary:");
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "action");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addOperation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addOperation:");
}

id objc_msgSend_addTimer_forMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addTimer:forMode:");
}

id objc_msgSend_allHeaderFields(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allHeaderFields");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_anisetteDataWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "anisetteDataWithCompletion:");
}

id objc_msgSend_appendData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendData:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_approver(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "approver");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_badFormatError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "badFormatError");
}

id objc_msgSend_base64EncodedDataWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "base64EncodedDataWithOptions:");
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_base64Encodedx509CertificateStringFromCertificate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "base64Encodedx509CertificateStringFromCertificate:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancel");
}

id objc_msgSend_certificateRetrievalCompletionBlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "certificateRetrievalCompletionBlock");
}

id objc_msgSend_certificateRetrievalFailed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "certificateRetrievalFailed");
}

id objc_msgSend_certificateRetrievalRequestCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "certificateRetrievalRequestCount");
}

id objc_msgSend_cleanNSError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cleanNSError:");
}

id objc_msgSend_clientCertificates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientCertificates");
}

id objc_msgSend_cloudConfigErrorInResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cloudConfigErrorInResponse:");
}

id objc_msgSend_cloudConfigurationValidationDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cloudConfigurationValidationDictionary");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_completeOperationWithResponse_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completeOperationWithResponse:error:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsString:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_dataFromService_account_label_description_group_useSystemKeychain_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataFromService:account:label:description:group:useSystemKeychain:outError:");
}

id objc_msgSend_dataFromString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataFromString:");
}

id objc_msgSend_dataTaskWithRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataTaskWithRequest:");
}

id objc_msgSend_dataWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithContentsOfFile:");
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithJSONObject:options:error:");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_decodeCertificateFromBase64String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeCertificateFromBase64String:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaultSessionConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultSessionConfiguration");
}

id objc_msgSend_depDeviceSerialNumberWithValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "depDeviceSerialNumberWithValue:");
}

id objc_msgSend_depResponseContentTypeFromContentType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "depResponseContentTypeFromContentType:");
}

id objc_msgSend_depResponseDataFromData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "depResponseDataFromData:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_destinationKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "destinationKey");
}

id objc_msgSend_deviceAlreadyEnrolledError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceAlreadyEnrolledError");
}

id objc_msgSend_deviceCapacity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceCapacity");
}

id objc_msgSend_deviceColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceColor");
}

id objc_msgSend_deviceNotEnrolledError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceNotEnrolledError");
}

id objc_msgSend_deviceNotFoundError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceNotFoundError");
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceType");
}

id objc_msgSend_deviceUploadCompletionBlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceUploadCompletionBlock");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_dsToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dsToken");
}

id objc_msgSend_dsid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dsid");
}

id objc_msgSend_endOperation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endOperation");
}

id objc_msgSend_endpointPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endpointPath");
}

id objc_msgSend_enrollmentCompletionBlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enrollmentCompletionBlock");
}

id objc_msgSend_enrollmentURLString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enrollmentURLString");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "error");
}

id objc_msgSend_errorForStatusCode_responseData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorForStatusCode:responseData:");
}

id objc_msgSend_errorWithDomain_code_description_errorType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:description:errorType:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_fetchConfigurationAndActivateAnisetteWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchConfigurationAndActivateAnisetteWithCompletionBlock:");
}

id objc_msgSend_fetchConfigurationWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchConfigurationWithCompletionBlock:");
}

id objc_msgSend_fetchConfigurationWithoutActivatingAnisetteWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchConfigurationWithoutActivatingAnisetteWithCompletionBlock:");
}

id objc_msgSend_fetchConfigurationWithoutValidationWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchConfigurationWithoutValidationWithCompletionBlock:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_httpMethod(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "httpMethod");
}

id objc_msgSend_httpResponseContentType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "httpResponseContentType");
}

id objc_msgSend_idleTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "idleTimer");
}

id objc_msgSend_initWithBase64EncodedString_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBase64EncodedString:options:");
}

id objc_msgSend_initWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContentsOfFile:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithFireDate_interval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFireDate:interval:target:selector:userInfo:repeats:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithName_validationInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:validationInfo:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithURL_cachePolicy_timeoutInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithURL:cachePolicy:timeoutInterval:");
}

id objc_msgSend_initWithXPCConnection_server_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithXPCConnection:server:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_internalErrorWithCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "internalErrorWithCode:");
}

id objc_msgSend_invalidDeviceError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidDeviceError");
}

id objc_msgSend_invalidProfileError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidProfileError");
}

id objc_msgSend_invalidSignatureError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidSignatureError");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_invalidateAndCancel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidateAndCancel");
}

id objc_msgSend_isAppleInternal(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAppleInternal");
}

id objc_msgSend_isAppleTV(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAppleTV");
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCancelled");
}

id objc_msgSend_isDEPPushEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDEPPushEnabled");
}

id objc_msgSend_isEqualToData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToData:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isInternalBuild(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInternalBuild");
}

id objc_msgSend_isRequired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRequired");
}

id objc_msgSend_isRunningInDiagnosticsMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRunningInDiagnosticsMode");
}

id objc_msgSend_isRunningInRecovery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRunningInRecovery");
}

id objc_msgSend_isRunningInRootLaunchdContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRunningInRootLaunchdContext");
}

id objc_msgSend_isiPad(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isiPad");
}

id objc_msgSend_isiPhone(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isiPhone");
}

id objc_msgSend_keyInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyInfo");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lock");
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainQueue");
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainRunLoop");
}

id objc_msgSend_maxRetriesExceededErrorWithUnderlyingError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maxRetriesExceededErrorWithUnderlyingError:");
}

id objc_msgSend_midWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "midWithCompletion:");
}

id objc_msgSend_modelNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modelNumber");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_nonce(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nonce");
}

id objc_msgSend_nonceExpiredError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nonceExpiredError");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_operationQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "operationQueue");
}

id objc_msgSend_orgId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "orgId");
}

id objc_msgSend_orgName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "orgName");
}

id objc_msgSend_organization(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "organization");
}

id objc_msgSend_pingWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pingWithCompletionBlock:");
}

id objc_msgSend_privateKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "privateKey");
}

id objc_msgSend_productBuildVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "productBuildVersion");
}

id objc_msgSend_productName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "productName");
}

id objc_msgSend_profileNotActiveError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "profileNotActiveError");
}

id objc_msgSend_profileNotFoundError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "profileNotFoundError");
}

id objc_msgSend_provisionallyEnrollWithNonce_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "provisionallyEnrollWithNonce:completionBlock:");
}

id objc_msgSend_pushToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pushToken");
}

id objc_msgSend_pushTopic(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pushTopic");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_requestBody(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestBody");
}

id objc_msgSend_requestCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestCount");
}

id objc_msgSend_requestFailed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestFailed");
}

id objc_msgSend_requestPayload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestPayload");
}

id objc_msgSend_requestType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestType");
}

id objc_msgSend_requestWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestWithError:");
}

id objc_msgSend_requestWithPayload_URL_privateKey_clientCertificates_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestWithPayload:URL:privateKey:clientCertificates:outError:");
}

id objc_msgSend_resetIdleTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetIdleTimer");
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "response");
}

id objc_msgSend_responseData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "responseData");
}

id objc_msgSend_responseWithResponseData_contentType_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "responseWithResponseData:contentType:outError:");
}

id objc_msgSend_responseWithResponseData_contentType_statusCode_retryNeeded_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "responseWithResponseData:contentType:statusCode:retryNeeded:outError:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_retrieveClientCertificateWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retrieveClientCertificateWithCompletion:");
}

id objc_msgSend_retrieveDeviceUploadOrganizationsWithCredentials_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retrieveDeviceUploadOrganizationsWithCredentials:completionBlock:");
}

id objc_msgSend_retrieveDeviceUploadRequestTypesWithCredentials_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retrieveDeviceUploadRequestTypesWithCredentials:completionBlock:");
}

id objc_msgSend_retrieveDeviceUploadSoldToIdsForOrganization_credentials_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retrieveDeviceUploadSoldToIdsForOrganization:credentials:completionBlock:");
}

id objc_msgSend_retryAfterInterval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retryAfterInterval");
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheme");
}

id objc_msgSend_sentinelExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sentinelExistsAtPath:");
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serialNumber");
}

id objc_msgSend_server(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "server");
}

id objc_msgSend_serviceBusyError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceBusyError");
}

id objc_msgSend_sessionWithConfiguration_delegate_delegateQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionWithConfiguration:delegate:delegateQueue:");
}

id objc_msgSend_setCertificateRetrievalCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCertificateRetrievalCompletionBlock:");
}

id objc_msgSend_setCertificateRetrievalFailed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCertificateRetrievalFailed:");
}

id objc_msgSend_setCertificateRetrievalRequestCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCertificateRetrievalRequestCount:");
}

id objc_msgSend_setClientCertificates_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClientCertificates:");
}

id objc_msgSend_setData_forService_account_label_description_access_group_useSystemKeychain_sysBound_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setData:forService:account:label:description:access:group:useSystemKeychain:sysBound:outError:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDeviceUploadCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceUploadCompletionBlock:");
}

id objc_msgSend_setEnrollmentCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnrollmentCompletionBlock:");
}

id objc_msgSend_setError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setError:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setHTTPBody_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHTTPBody:");
}

id objc_msgSend_setHTTPMethod_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHTTPMethod:");
}

id objc_msgSend_setHttpResponseContentType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHttpResponseContentType:");
}

id objc_msgSend_setIdleTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdleTimer:");
}

id objc_msgSend_setMaxConcurrentOperationCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaxConcurrentOperationCount:");
}

id objc_msgSend_setNonce_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNonce:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOperationExecuting_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOperationExecuting:");
}

id objc_msgSend_setOperationFinished_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOperationFinished:");
}

id objc_msgSend_setOrganization_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOrganization:");
}

id objc_msgSend_setPrivateKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPrivateKey:");
}

id objc_msgSend_setPushToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPushToken:");
}

id objc_msgSend_setPushTopic_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPushTopic:");
}

id objc_msgSend_setRequestCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRequestCount:");
}

id objc_msgSend_setRequestFailed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRequestFailed:");
}

id objc_msgSend_setResponseData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResponseData:");
}

id objc_msgSend_setRetryAfterInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRetryAfterInterval:");
}

id objc_msgSend_setServer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setServer:");
}

id objc_msgSend_setSubmitDeviceRequestPayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSubmitDeviceRequestPayload:");
}

id objc_msgSend_setTeslaRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTeslaRequest:");
}

id objc_msgSend_setTimeoutTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeoutTimer:");
}

id objc_msgSend_setUrlSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUrlSession:");
}

id objc_msgSend_setUserCredentials_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserCredentials:");
}

id objc_msgSend_setValue_forHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forHTTPHeaderField:");
}

id objc_msgSend_shouldActivateAnisette(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldActivateAnisette");
}

id objc_msgSend_soldToId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "soldToId");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusCode");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByTrimmingCharactersInSet:");
}

id objc_msgSend_stringForDefaultsKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringForDefaultsKey:");
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringForKey:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringValue");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_subKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subKeys");
}

id objc_msgSend_submitDeviceRequestPayload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "submitDeviceRequestPayload");
}

id objc_msgSend_submitDeviceUploadRequest_credentials_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "submitDeviceUploadRequest:credentials:completionBlock:");
}

id objc_msgSend_submitter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "submitter");
}

id objc_msgSend_syncDEPPushToken_pushTopic_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncDEPPushToken:pushTopic:completionBlock:");
}

id objc_msgSend_teslaRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "teslaRequest");
}

id objc_msgSend_teslaServiceDownError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "teslaServiceDownError");
}

id objc_msgSend_timeoutTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeoutTimer");
}

id objc_msgSend_unenrollWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unenrollWithCompletionBlock:");
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unlock");
}

id objc_msgSend_urlSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "urlSession");
}

id objc_msgSend_userAgentString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userAgentString");
}

id objc_msgSend_userCredentials(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userCredentials");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_validateCloudConfiguration_withResultDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateCloudConfiguration:withResultDictionary:");
}

id objc_msgSend_validateGroupDependenciesInCloudConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateGroupDependenciesInCloudConfiguration:");
}

id objc_msgSend_validateSelfUsingValidationInfoWithDictionary_resultsDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateSelfUsingValidationInfoWithDictionary:resultsDictionary:");
}

id objc_msgSend_validateSelfWithDictionary_resultsDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateSelfWithDictionary:resultsDictionary:");
}

id objc_msgSend_validationInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validationInfo");
}

id objc_msgSend_validationType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validationType");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whitespaceCharacterSet");
}

id objc_msgSend_willChangeValueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willChangeValueForKey:");
}
