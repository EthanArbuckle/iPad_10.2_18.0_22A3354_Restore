void __ICOSLogCreate()
{
  if (qword_10005F488 != -1)
    dispatch_once(&qword_10005F488, &stru_100048AD0);
}

void sub_10000601C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_10000603C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  NSObject *v12;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  void *v17;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    if ((a2 + 536870208) <= 0x2D && ((1 << (a2 + 64)) & 0x280002000001) != 0
      || (_DWORD)a2 == -536854453)
    {
      __ICOSLogCreate();
      v7 = CFSTR("HostUSB");
      if ((unint64_t)objc_msgSend(CFSTR("HostUSB"), "length") >= 0x15)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("HostUSB"), "substringWithRange:", 0, 18));
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingString:", CFSTR("..")));

      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("readInterruptData: (disconnected) 0x%x:0x%x"), objc_msgSend(v6, "locationID"), a2));
      v10 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v11 = objc_retainAutorelease(v7);
        v12 = v10;
        *(_DWORD *)buf = 136446466;
        v15 = -[__CFString UTF8String](v11, "UTF8String");
        v16 = 2114;
        v17 = v9;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

      }
      objc_msgSend(v6, "setConnected:", 0);
    }
    else if (!(_DWORD)a2)
    {
      if (a3)
        objc_msgSend(WeakRetained, "handleInterruptData:", a3);
      objc_msgSend(v6, "readInterruptData");
    }
  }

  return a2;
}

void sub_100006224(void (**a1)(void))
{
  if (a1)
  {
    a1[2]();

  }
}

void sub_100006A84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id *location, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26,char a27)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a26);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100006B00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  NSObject *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v7 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_32;
  if ((int)a2 <= -536854450)
  {
    v8 = (a2 + 536870208);
    if (v8 > 0x2D)
      goto LABEL_32;
    if (((1 << (a2 + 64)) & 0x280002000001) != 0)
    {
      __ICOSLogCreate();
      v9 = CFSTR("HostUSB");
      if ((unint64_t)objc_msgSend(CFSTR("HostUSB"), "length") >= 0x15)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("HostUSB"), "substringWithRange:", 0, 18));
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingString:", CFSTR("..")));

      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("readBulkData: (disconnected) 0x%x:0x%x"), objc_msgSend(v7, "locationID"), a2));
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
        sub_10002FADC();

      objc_msgSend(v7, "setConnected:", 0);
      goto LABEL_32;
    }
    if (v8 != 22)
      goto LABEL_32;
    goto LABEL_20;
  }
  if ((_DWORD)a2 == -536854449 || (_DWORD)a2 == -536850432)
  {
LABEL_20:
    __ICOSLogCreate();
    v18 = CFSTR("HostUSB");
    if ((unint64_t)objc_msgSend(CFSTR("HostUSB"), "length") >= 0x15)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("HostUSB"), "substringWithRange:", 0, 18));
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stringByAppendingString:", CFSTR("..")));

    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("readBulkData: (timedout) 0x%x:0x%x"), objc_msgSend(v7, "locationID"), a2));
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
      sub_10002FADC();

    if ((_DWORD)a2 == -536850432 || (_DWORD)a2 == -536854449)
    {
      __ICOSLogCreate();
      v21 = CFSTR("HostUSB");
      if ((unint64_t)objc_msgSend(CFSTR("HostUSB"), "length") >= 0x15)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("HostUSB"), "substringWithRange:", 0, 18));
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stringByAppendingString:", CFSTR("..")));

      }
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("readBulkData: (cleared pipestall) 0x%x:0x%x"), objc_msgSend(v7, "locationID"), a2));
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
        sub_10002FADC();

      objc_msgSend(v7, "performSelector:", "clearBulkInPipeStall");
    }
    objc_msgSend(v7, "setTimedOut:", 1);
    goto LABEL_32;
  }
  if (!(_DWORD)a2)
  {
    objc_msgSend(WeakRetained, "handleBulkData:result:forTxID:", a3, 0, *(_QWORD *)(a1 + 32));
    __ICOSLogCreate();
    if (__ICLogTypeEnabled(4))
    {
      v12 = CFSTR("HostUSB");
      if ((unint64_t)objc_msgSend(CFSTR("HostUSB"), "length") >= 0x15)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("HostUSB"), "substringWithRange:", 0, 18));
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByAppendingString:", CFSTR("..")));

      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("readBulkData: %lu bytes | continue: %d"), a3, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)));
      v15 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v16 = objc_retainAutorelease(v12);
        v17 = v15;
        *(_DWORD *)buf = 136446466;
        v26 = -[__CFString UTF8String](v16, "UTF8String");
        v27 = 2114;
        v28 = v14;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

      }
    }
  }
LABEL_32:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

  return a2;
}

void sub_100006F84(uint64_t a1, int a2, uint64_t a3)
{
  dispatch_block_t v3;
  dispatch_queue_global_t global_queue;
  NSObject *v5;
  _QWORD block[6];
  int v7;

  if (a1)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100007C38;
    block[3] = &unk_1000488B8;
    v7 = a2;
    block[4] = a1;
    block[5] = a3;
    v3 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    global_queue = dispatch_get_global_queue(33, 0);
    v5 = objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_async(v5, v3);

  }
}

void sub_100007088(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000712C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000071AC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100007C38(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 32);
  (*((void (**)(id, _QWORD, _QWORD))v1 + 2))(v1, *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

void sub_100007C6C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_100007C98(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

id sub_100007CB4()
{
  void *v0;

  return objc_msgSend(v0, "UTF8String");
}

uint64_t sub_100007CC0(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(_QWORD *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  return result;
}

id sub_100007CD8(id a1)
{
  return objc_retainAutorelease(a1);
}

id sub_100007CE0()
{
  void *v0;

  return v0;
}

void sub_100008D0C(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  PTPInitiator *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unsigned int v12;
  int v13;
  const __CFString *v14;
  os_log_t *v15;
  void *v16;
  void *v17;
  id v18;
  __CFString *v19;
  void *v20;
  void *v21;
  os_log_t v22;
  const __CFString *v23;
  os_log_t *v24;
  __CFString *v25;
  NSObject *v26;
  __CFString *v27;
  id v28;
  void *v29;
  unsigned int v30;
  __CFString *v31;
  void *v32;
  void *v33;
  os_log_t v34;
  void *v35;
  NSObject *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  const __CFString *v45;
  id v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  unsigned int v52;
  void *v53;
  void *v54;
  __CFString *v55;
  void *v56;
  void *v57;
  const __CFString *v58;
  const __CFString *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  id v106;
  id v107;
  uint64_t v108;
  void *i;
  unsigned int v110;
  void *v111;
  void *v112;
  unsigned __int8 v113;
  const __CFString *v114;
  void *v115;
  unsigned int v116;
  void *v117;
  __CFString *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  __CFString *v123;
  NSObject *v124;
  id v125;
  __CFString *v126;
  __CFString *v127;
  void *v128;
  uint64_t v129;
  id v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  uint8_t v135[128];
  uint8_t buf[4];
  id v137;
  __int16 v138;
  void *v139;

  v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "initiator"));

  if (v2)
    goto LABEL_2;
  v5 = -[PTPInitiator initWithHostLocationID:]([PTPInitiator alloc], "initWithHostLocationID:", objc_msgSend(*(id *)(v1 + 32), "locationID"));
  objc_msgSend(*(id *)(v1 + 32), "setInitiator:", v5);

  v6 = objc_msgSend(*(id *)(v1 + 40), "BOOLValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v1 + 32), "initiator"));
  objc_msgSend(v7, "setOrderAscending:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v1 + 32), "initiator"));
  objc_msgSend(v8, "setDelegate:", *(_QWORD *)(v1 + 32));

  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v1 + 32), "initiator"));
  if (!v9)
    goto LABEL_2;
  v10 = (void *)v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v1 + 32), "initiator"));
  v12 = objc_msgSend(v11, "start");

  if (!v12)
    goto LABEL_2;
  v13 = 1;
  v14 = CFSTR("..");
  v15 = (os_log_t *)&_gICOSLog;
  v129 = v1;
  while (1)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v1 + 32), "initiator"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "deviceInfo"));

    __ICOSLogCreate();
    v18 = objc_msgSend(CFSTR("deviceInfo"), "length");
    if (v17)
      break;
    v31 = CFSTR("deviceInfo");
    if ((unint64_t)v18 >= 0x15)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("deviceInfo"), "substringWithRange:", 0, 18));
      v31 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "stringByAppendingString:", v14));

    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed get deviceInfo -- Performing Close/Retry")));
    v34 = *v15;
    if (!os_log_type_enabled(*v15, OS_LOG_TYPE_DEFAULT))
      goto LABEL_20;
LABEL_19:
    v31 = objc_retainAutorelease(v31);
    v36 = v34;
    v37 = -[__CFString UTF8String](v31, "UTF8String");
    *(_DWORD *)buf = 136446466;
    v137 = v37;
    v138 = 2114;
    v139 = v33;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

LABEL_20:
    v1 = v129;
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v129 + 32), "initiator"));
    objc_msgSend(v38, "resetDevice");

    if (--v13)
      goto LABEL_2;
  }
  v19 = CFSTR("deviceInfo");
  if ((unint64_t)v18 >= 0x15)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("deviceInfo"), "substringWithRange:", 0, 18));
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stringByAppendingString:", v14));

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Dataset: %@"), v17));
  v22 = *v15;
  if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEFAULT))
  {
    v23 = v14;
    v24 = v15;
    v25 = objc_retainAutorelease(v19);
    v26 = v22;
    v27 = v25;
    v15 = v24;
    v14 = v23;
    v28 = -[__CFString UTF8String](v27, "UTF8String");
    *(_DWORD *)buf = 136446466;
    v137 = v28;
    v138 = 2114;
    v139 = v21;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v129 + 32), "initiator"));
  v30 = objc_msgSend(v29, "openSession");

  if (!v30)
  {
    __ICOSLogCreate();
    v31 = CFSTR("session");
    if ((unint64_t)objc_msgSend(CFSTR("session"), "length") >= 0x15)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("session"), "substringWithRange:", 0, 18));
      v31 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "stringByAppendingString:", v14));

    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to open -- Performing Close/Retry")));
    v34 = *v15;
    if (!os_log_type_enabled(*v15, OS_LOG_TYPE_DEFAULT))
      goto LABEL_20;
    goto LABEL_19;
  }
  v130 = objc_alloc_init((Class)NSMutableArray);
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "model"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v129 + 32), "initiator"));
  v41 = objc_msgSend(v40, "refreshAssignedDeviceName");

  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v129 + 32), "initiator"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "userAssignedDeviceName"));

  v44 = v43;
  if (v43 || v39 && (v46 = objc_msgSend(v39, "length"), v44 = v39, v46))
    v45 = v44;
  else
    v45 = CFSTR("PTP Camera");
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v129 + 32), "initiator"));
  if ((objc_msgSend(v47, "iCloudPhotosEnabled") & 1) != 0)
  {
    v48 = 1;
  }
  else
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "operationsSupported"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", 4107));
    v48 = objc_msgSend(v49, "containsObject:", v50) ^ 1;

  }
  if ((unint64_t)objc_msgSend(v39, "length") < 6
    || (v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "substringToIndex:", 6)),
        v52 = objc_msgSend(v51, "isEqualToString:", CFSTR("Apple ")),
        v51,
        !v52))
  {
LABEL_37:
    v1 = v129;
    v55 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v129 + 32), "cameraDictionary"));
    -[__CFString setObject:forKeyedSubscript:](v55, "setObject:forKeyedSubscript:", CFSTR("camera"), CFSTR("ICDeviceSystemSymbolName"));
    v59 = CFSTR("Camera");
    goto LABEL_38;
  }
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "substringFromIndex:", 6));
  v54 = v53;
  if (!v53 || !objc_msgSend(v53, "length"))
  {

    goto LABEL_37;
  }
  v55 = v54;
  if (-[__CFString isEqualToString:](v55, "isEqualToString:", CFSTR("iPhone")))
  {
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v129 + 32), "cameraDictionary"));
    v57 = v56;
    v58 = CFSTR("iphone");
    goto LABEL_73;
  }
  v1 = v129;
  if (-[__CFString isEqualToString:](v55, "isEqualToString:", CFSTR("iPad")))
  {
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v129 + 32), "cameraDictionary"));
    v57 = v56;
    v58 = CFSTR("ipad");
    goto LABEL_73;
  }
  if (-[__CFString isEqualToString:](v55, "isEqualToString:", CFSTR("iPod")))
  {
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v129 + 32), "cameraDictionary"));
    v57 = v56;
    v58 = CFSTR("ipod");
LABEL_73:
    objc_msgSend(v56, "setObject:forKeyedSubscript:", v58, CFSTR("ICDeviceSystemSymbolName"));

    v59 = v55;
    v1 = v129;
  }
  else
  {
    v59 = v55;
  }
LABEL_38:

  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v1 + 32), "cameraDictionary"));
  objc_msgSend(v60, "setObject:forKeyedSubscript:", v45, CFSTR("ICDeviceName"));

  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v1 + 32), "cameraDictionary"));
  objc_msgSend(v61, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("ICDeviceEjectable"));

  v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v48));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v1 + 32), "cameraDictionary"));
  objc_msgSend(v63, "setObject:forKeyedSubscript:", v62, CFSTR("ICDeviceLocked"));

  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v1 + 32), "cameraDictionary"));
  objc_msgSend(v64, "setObject:forKeyedSubscript:", CFSTR("ICTransportTypeUSB"), CFSTR("ICDeviceTransportType"));

  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v1 + 32), "cameraDictionary"));
  objc_msgSend(v65, "setObject:forKeyedSubscript:", CFSTR("Camera"), CFSTR("ICDeviceType"));

  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v1 + 32), "cameraDictionary"));
  objc_msgSend(v66, "setObject:forKeyedSubscript:", v59, CFSTR("ICDeviceProductKind"));

  v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(v1 + 32), "locationID")));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v1 + 32), "cameraDictionary"));
  objc_msgSend(v68, "setObject:forKeyedSubscript:", v67, CFSTR("ICDeviceUSBLocationID"));

  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v1 + 32), "initiator"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", objc_msgSend(v69, "deviceVendorID")));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v1 + 32), "cameraDictionary"));
  objc_msgSend(v71, "setObject:forKeyedSubscript:", v70, CFSTR("ICDeviceUSBVendorID"));

  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v1 + 32), "initiator"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", objc_msgSend(v72, "deviceProductID")));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v1 + 32), "cameraDictionary"));
  objc_msgSend(v74, "setObject:forKeyedSubscript:", v73, CFSTR("ICDeviceUSBProductID"));

  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v1 + 32), "initiator"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "deviceSerialNumberString"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v1 + 32), "cameraDictionary"));
  objc_msgSend(v77, "setObject:forKeyedSubscript:", v76, CFSTR("ICDeviceSerialNumberString"));

  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "serialNumber"));
  if (v78)
  {
    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "serialNumber"));
    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v1 + 32), "cameraDictionary"));
    objc_msgSend(v80, "setObject:forKeyedSubscript:", v79, CFSTR("ICDevicePTPSerialNumberString"));

  }
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v1 + 32), "initiator"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v81, "isAccessRestrictedAppleDevice")));
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v1 + 32), "cameraDictionary"));
  objc_msgSend(v83, "setObject:forKeyedSubscript:", v82, CFSTR("ICDeviceAccessRestrictedAppleDevice"));

  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v1 + 32), "initiator"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v84, "iCloudPhotosEnabled")));
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v1 + 32), "cameraDictionary"));
  objc_msgSend(v86, "setObject:forKeyedSubscript:", v85, CFSTR("ICDeviceiCloudPhotosEnabled"));

  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v1 + 32), "initiator"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v87, "iCloudPhotosOptimizeStorageState")));
  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v1 + 32), "cameraDictionary"));
  objc_msgSend(v89, "setObject:forKeyedSubscript:", v88, CFSTR("ICDeviceiCloudOptimizeStorageState"));

  v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v1 + 32), "initiator"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "mobdevProps"));

  if (v91)
  {
    v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v1 + 32), "initiator"));
    v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "mobdevProps"));
    v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v1 + 32), "cameraDictionary"));
    objc_msgSend(v94, "setObject:forKeyedSubscript:", v93, CFSTR("ICMobileDeviceProperties"));

  }
  v128 = v39;
  v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v1 + 32), "cameraDictionary"));
  v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "objectForKeyedSubscript:", CFSTR("ICMobileDeviceProperties")));

  if (!v96)
  {
    v97 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v1 + 32), "cameraDictionary"));
    objc_msgSend(v98, "setObject:forKeyedSubscript:", v97, CFSTR("ICMobileDeviceProperties"));

  }
  v126 = (__CFString *)v59;
  v127 = (__CFString *)v45;
  v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v1 + 32), "initiator"));
  v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "appleSerialNumberString"));

  if (v100)
  {
    v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v1 + 32), "initiator"));
    v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "appleSerialNumberString"));
    v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v1 + 32), "cameraDictionary"));
    v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("ICMobileDeviceProperties")));
    objc_msgSend(v104, "setObject:forKeyedSubscript:", v102, CFSTR("AppleSerialNumber"));

  }
  v133 = 0u;
  v134 = 0u;
  v131 = 0u;
  v132 = 0u;
  v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "operationsSupported"));
  v106 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v131, v135, 16);
  if (v106)
  {
    v107 = v106;
    v108 = *(_QWORD *)v132;
    do
    {
      for (i = 0; i != v107; i = (char *)i + 1)
      {
        if (*(_QWORD *)v132 != v108)
          objc_enumerationMutation(v105);
        v110 = objc_msgSend(*(id *)(*((_QWORD *)&v131 + 1) + 8 * (_QWORD)i), "unsignedShortValue");
        switch(v110)
        {
          case 0x1016u:
            v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "devicePropertiesSupported"));
            v116 = objc_msgSend(v115, "containsObject:", &off_1000508A8);

            v114 = CFSTR("ICCameraDeviceCanSyncClock");
            if (v116)
              goto LABEL_61;
            break;
          case 0x100Eu:
            v114 = CFSTR("ICCameraDeviceCanTakePicture");
LABEL_61:
            objc_msgSend(v130, "addObject:", v114);
            continue;
          case 0x100Bu:
            v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v1 + 32), "initiator"));
            if ((objc_msgSend(v111, "isAppleDevice") & 1) == 0)
            {

              v114 = CFSTR("ICCameraDeviceCanDeleteOneFile");
              goto LABEL_61;
            }
            v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v1 + 32), "initiator"));
            v113 = objc_msgSend(v112, "iCloudPhotosEnabled");

            v1 = v129;
            v114 = CFSTR("ICCameraDeviceCanDeleteOneFile");
            if ((v113 & 1) == 0)
              goto LABEL_61;
            break;
          default:
            continue;
        }
      }
      v107 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v131, v135, 16);
    }
    while (v107);
  }

  objc_msgSend(v130, "addObject:", CFSTR("ICCameraDeviceCanAcceptPTPCommands"));
  v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v1 + 32), "cameraDictionary"));
  objc_msgSend(v117, "setObject:forKeyedSubscript:", v130, CFSTR("ICDeviceCapabilities"));

  __ICOSLogCreate();
  v118 = CFSTR("session");
  if ((unint64_t)objc_msgSend(CFSTR("session"), "length") >= 0x15)
  {
    v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("session"), "substringWithRange:", 0, 18));
    v118 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "stringByAppendingString:", CFSTR("..")));

  }
  v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v1 + 32), "cameraDictionary"));
  v121 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTPCameraDevice Properties: %@"), v120));

  v122 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v123 = objc_retainAutorelease(v118);
    v124 = v122;
    v125 = -[__CFString UTF8String](v123, "UTF8String");
    *(_DWORD *)buf = 136446466;
    v137 = v125;
    v138 = 2114;
    v139 = v121;
    _os_log_impl((void *)&_mh_execute_header, v124, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
LABEL_2:
  v3 = *(_QWORD *)(v1 + 48);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v1 + 32), "cameraDictionary"));
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

}

void sub_100009C8C(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "sessionManager"));
  objc_msgSend(v2, "addNotifications:toSessionWithConnection:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void sub_100009D98(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "sessionManager"));
  objc_msgSend(v2, "remNotifications:fromSessionWithConnection:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void sub_100009EC4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "holdPowerAssertion");
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "itemForObjectHandle:", *(_QWORD *)(a1 + 40)));
  v5 = v2;
  if (v2)
  {
    objc_msgSend(v2, "metadataWithOptions:reply:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -21450));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("errCode"));

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  objc_msgSend(*(id *)(a1 + 32), "releasePowerAssertion");

}

void sub_10000A068(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "holdPowerAssertion");
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "itemForObjectHandle:", *(_QWORD *)(a1 + 40)));
  v5 = v2;
  if (v2)
  {
    objc_msgSend(v2, "thumbnailDataWithOptions:reply:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -21450));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("errCode"));

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  objc_msgSend(*(id *)(a1 + 32), "releasePowerAssertion");

}

void sub_10000A1E0(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v3, "addEntriesFromDictionary:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -9934));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, CFSTR("errCode"));

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_10000A3DC(uint64_t a1)
{
  void *v2;
  void *v3;
  char *v4;
  void *v5;
  void *v6;
  char *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  size_t v16;
  void *v17;
  id v18;
  dispatch_data_t v19;
  void *v20;
  void *v21;
  id v22;

  objc_msgSend(*(id *)(a1 + 32), "holdPowerAssertion");
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "initiator"));
  v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "cameraItemWithObjectID:", objc_msgSend(*(id *)(a1 + 40), "unsignedIntegerValue")));

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (char *)objc_msgSend(v22, "size");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("ICReadOffset")));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("ICReadOffset")));
    v7 = (char *)objc_msgSend(v6, "unsignedLongLongValue");

  }
  else
  {
    v7 = 0;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("ICReadLength")));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("ICReadLength")));
    v10 = (uint64_t)objc_msgSend(v9, "unsignedLongLongValue");

  }
  else
  {
    v10 = (uint64_t)objc_msgSend(v22, "size");
  }

  v13 = v10 >= 1 && (uint64_t)v7 <= (uint64_t)v4 && (uint64_t)v7 >= 0 && (uint64_t)&v7[v10] <= (uint64_t)v4;
  v14 = -21449;
  if (v13)
    v14 = 0;
  if (v10 <= 52428800)
    v15 = v14;
  else
    v15 = -21446;
  if (!v10 || v15)
  {
    objc_msgSend(v3, "addEntriesFromDictionary:", *(_QWORD *)(a1 + 48));
    v18 = 0;
LABEL_27:
    v19 = (dispatch_data_t)objc_claimAutoreleasedReturnValue(+[NSData data](NSData, "data"));
    goto LABEL_28;
  }
  v16 = sub_10001E788(v10);
  v17 = mmap(0, v16, 3, 4097, -1, 0);
  v18 = objc_msgSend(v22, "readStream:size:offset:", v17, v10, v7);
  v19 = dispatch_data_create(v17, v16, 0, _dispatch_data_destructor_munmap);
  objc_msgSend(v3, "addEntriesFromDictionary:", *(_QWORD *)(a1 + 48));
  if (!v19)
    goto LABEL_27;
LABEL_28:
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("ICReadData"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", &off_1000508D8, CFSTR("ICBufferOffset"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", v18));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("ICBytesRead"));

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v15));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("errCode"));

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "releasePowerAssertion");

}

void sub_10000A7A4(uint64_t a1)
{
  void *v2;
  void *v3;
  unsigned int v4;
  char v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "holdPowerAssertion");
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "itemForObjectHandle:", *(_QWORD *)(a1 + 40)));
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "initiator"));
    v4 = objc_msgSend(v3, "deleteFile:", v2);

    v5 = v4 ^ 1;
    if (v4)
      v6 = 0;
    else
      v6 = -9941;
  }
  else
  {
    v5 = 0;
    v6 = 0;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v7, "addEntriesFromDictionary:", *(_QWORD *)(a1 + 48));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v6));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("errCode"));

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "releasePowerAssertion");
  if ((v5 & 1) == 0)
  {
    v9 = *(void **)(a1 + 32);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000A928;
    v11[3] = &unk_100048908;
    v11[4] = v9;
    v12 = *(id *)(a1 + 56);
    v13 = *(id *)(a1 + 40);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v11));
    objc_msgSend(v9, "addInteractiveOperation:", v10);

  }
}

void sub_10000A928(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "allConnections"));
  v3 = objc_msgSend(v2, "mutableCopy");

  if (v3)
  {
    objc_msgSend(v3, "removeObject:", *(_QWORD *)(a1 + 40));
    v6 = *(_QWORD *)(a1 + 48);
    v7 = CFSTR("ICObjectIDArray");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
    v8 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));

    objc_msgSend(*(id *)(a1 + 32), "sendRemovedItemsNotification:toConnections:", v5, v3);
  }

}

void sub_10000AADC(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "holdPowerAssertion");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "initiator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cameraItemWithObjectID:", objc_msgSend(*(id *)(a1 + 40), "unsignedIntegerValue")));

  v9 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fingerprintWithError:", &v9));
  v6 = v9;
  if (v5)
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("ICCameraFileFingerprint"));
  if (v6)
    v7 = objc_msgSend(v6, "code");
  else
    v7 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v7));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("errCode"));

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "releasePowerAssertion");

}

void sub_10000AD84(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "initiator"));
  objc_msgSend(v2, "sendPTPCommand:andPayload:withReply:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void sub_10000B118(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  NSObject *v10;
  unsigned __int8 v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  NSObject *v17;
  id v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  NSObject *v24;
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  void *v31;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "initiator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "objectForKeyedSubscript:", CFSTR("ICEnumerationChronologicalOrder")));
  v4 = v3;
  if (v3)
    objc_msgSend(v2, "setEnumerationOrder:", objc_msgSend(v3, "integerValue"));
  __ICOSLogCreate();
  v5 = CFSTR("enumerateContent");
  if ((unint64_t)objc_msgSend(CFSTR("enumerateContent"), "length") >= 0x15)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("enumerateContent"), "substringWithRange:", 0, 18));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingString:", CFSTR("..")));

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Requested From:%d"), objc_msgSend(a1[6], "processIdentifier")));
  v8 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_retainAutorelease(v5);
    v10 = v8;
    *(_DWORD *)buf = 136446466;
    v29 = -[__CFString UTF8String](v9, "UTF8String");
    v30 = 2114;
    v31 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  v11 = objc_msgSend(v2, "readStorages");
  __ICOSLogCreate();
  if ((v11 & 1) != 0)
  {
    v12 = CFSTR("Content ^Enumerating^");
    if ((unint64_t)objc_msgSend(CFSTR("Content ^Enumerating^"), "length") >= 0x15)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("Content ^Enumerating^"), "substringWithRange:", 0, 18));
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByAppendingString:", CFSTR("..")));

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Requested From:%d"), objc_msgSend(a1[6], "processIdentifier")));
    v15 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_retainAutorelease(v12);
      v17 = v15;
      v18 = -[__CFString UTF8String](v16, "UTF8String");
      *(_DWORD *)buf = 136446466;
      v29 = v18;
      v30 = 2114;
      v31 = v14;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
  }
  else
  {
    v19 = CFSTR("Content -Enumerated-");
    if ((unint64_t)objc_msgSend(CFSTR("Content -Enumerated-"), "length") >= 0x15)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("Content -Enumerated-"), "substringWithRange:", 0, 18));
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stringByAppendingString:", CFSTR("..")));

    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Requested From:%d"), objc_msgSend(a1[6], "processIdentifier")));
    v22 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_retainAutorelease(v19);
      v24 = v22;
      v25 = -[__CFString UTF8String](v23, "UTF8String");
      *(_DWORD *)buf = 136446466;
      v29 = v25;
      v30 = 2114;
      v31 = v21;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    v26 = objc_msgSend(v2, "enumerationOrder");
    v27 = a1[6];
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v27, 1));
    objc_msgSend(v2, "sendContentsNotificationWithOrder:toConnections:", v26, v12);
  }

}

void sub_10000B6D0(id a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;

  v13 = objc_alloc((Class)NSSet);
  v1 = objc_opt_class(NSMutableDictionary);
  v2 = objc_opt_class(NSArray);
  v3 = objc_opt_class(NSURL);
  v4 = objc_opt_class(NSString);
  v5 = objc_opt_class(NSNumber);
  v6 = objc_opt_class(NSDictionary);
  v7 = objc_opt_class(NSData);
  v8 = objc_opt_class(NSXPCListenerEndpoint);
  v9 = objc_opt_class(NSMutableIndexSet);
  v10 = objc_opt_class(NSIndexSet);
  v11 = objc_msgSend(v13, "initWithObjects:", v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, objc_opt_class(NSError), 0);
  v12 = (void *)qword_10005F478;
  qword_10005F478 = (uint64_t)v11;

}

intptr_t sub_10000BCA8(uint64_t a1)
{
  __CFString *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;

  __ICOSLogCreate();
  v2 = CFSTR("closeDevice");
  if ((unint64_t)objc_msgSend(CFSTR("closeDevice"), "length") >= 0x15)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("closeDevice"), "substringWithRange:", 0, 18));
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingString:", CFSTR("..")));

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "cameraDictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICDeviceName")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(">>> Issuing Close: %@"), v5));

  v7 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_retainAutorelease(v2);
    v9 = v7;
    *(_DWORD *)buf = 136446466;
    v14 = -[__CFString UTF8String](v8, "UTF8String");
    v15 = 2114;
    v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "initiator"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "initiator"));
    objc_msgSend(v11, "stop");

  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_10000CD30(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  unsigned int v19;
  char v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  void *i;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  const __CFString *v61;
  void *v62;
  _QWORD v63[3];
  _QWORD v64[3];
  const __CFString *v65;
  void *v66;
  _BYTE v67[128];
  _QWORD v68[3];
  _QWORD v69[3];
  uint8_t buf[4];
  id v71;
  __int16 v72;
  void *v73;
  void *v74;
  const __CFString *v75;
  void *v76;
  void *v77;
  const __CFString *v78;
  void *v79;

  if (objc_msgSend(*(id *)(a1 + 32), "requestPending"))
  {
    v56 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "eventQueue"));
    objc_msgSend(v56, "addObject:", *(_QWORD *)(a1 + 40));

    return;
  }
  v2 = objc_msgSend(*(id *)(a1 + 40), "eventCode");
  if (v2 > 49152)
  {
    if (v2 == 49153)
    {
      if (objc_msgSend(*(id *)(a1 + 32), "isAppleDevice"))
      {
        objc_msgSend(*(id *)(a1 + 32), "setDeviceIsPasscodeLocked:", 0);
        objc_msgSend(*(id *)(a1 + 32), "setDeviceIsPairedWithThisHost:", 1);
        v64[0] = CFSTR("ICAppleDeviceUnlocked");
        v63[0] = CFSTR("ICDeviceStatus");
        v63[1] = CFSTR("deviceIsPasscodeLocked");
        v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "deviceIsPasscodeLocked")));
        v64[1] = v52;
        v63[2] = CFSTR("deviceIsPairedWithThisHost");
        v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "deviceIsPairedWithThisHost")));
        v64[2] = v53;
        v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v64, v63, 3));

        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "allConnections"));
        objc_msgSend(v51, "sendStatusNotification:toConnections:", v50, v55);

        goto LABEL_53;
      }
    }
    else if (v2 != 49154)
    {
      if (v2 == 49156)
      {
        if (objc_msgSend(*(id *)(a1 + 32), "isAppleDevice"))
        {
          v13 = objc_msgSend(*(id *)(a1 + 40), "parameter1");
          v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectInfoDatasetForNextObjectGroupInStorage:", v13));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "storageForStorageID:", v13));
          if (v14)
            objc_msgSend(v14, "enumerateContent:withOrder:", v4, objc_msgSend(*(id *)(a1 + 32), "enumerationOrder"));

LABEL_49:
          goto LABEL_54;
        }
      }
      else
      {
LABEL_57:
        if (objc_msgSend(*(id *)(a1 + 40), "eventCode") == 49173)
          objc_msgSend(*(id *)(a1 + 32), "setSessionOpen:", 0);
      }
    }
  }
  else
  {
    switch(v2)
    {
      case 16386:
        v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectInfo:", objc_msgSend(*(id *)(a1 + 40), "parameter1")));
        v4 = v3;
        if (!v3)
          goto LABEL_51;
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "storageForStorageID:", objc_msgSend(v3, "storageID")));
        if (!v5)
          goto LABEL_21;
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cameraFolderWithObjectID:", objc_msgSend(v4, "parentObject")));
        if (!v6)
          goto LABEL_20;
        v78 = CFSTR("ICPTPObjectInfoArray");
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "content:", 2));
        v77 = v7;
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v77, 1));
        v79 = v8;
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1));

        objc_msgSend(v6, "newItemWithObjectInfo:notify:", v4, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allConnections"));
        objc_msgSend(v10, "sendAddedItemsNotification:toConnections:", v9, v12);

LABEL_19:
LABEL_20:

LABEL_21:
LABEL_51:

        break;
      case 16387:
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "cameraItemWithObjectID:", objc_msgSend(*(id *)(a1 + 40), "parameter1")));
        v4 = v15;
        if (!v15)
          goto LABEL_51;
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "storageForStorageID:", objc_msgSend(v15, "storageID")));
        if (!v5)
          goto LABEL_21;
        v75 = CFSTR("ICObjectIDArray");
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 40), "parameter1")));
        v74 = v16;
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v74, 1));
        v76 = v17;
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1));

        objc_msgSend(v5, "removeCameraFileFromIndex:", objc_msgSend(*(id *)(a1 + 40), "parameter1"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allConnections"));
        objc_msgSend(v9, "sendRemovedItemsNotification:toConnections:", v6, v11);
        goto LABEL_19;
      case 16388:
        v18 = objc_msgSend(*(id *)(a1 + 40), "parameter1");
        v19 = objc_msgSend(*(id *)(a1 + 32), "isAppleDevice");
        v20 = v19;
        if (v19 && v18 != -17958194)
          objc_msgSend(*(id *)(a1 + 32), "setDeviceFinishedEnumerating");
        __ICOSLogCreate();
        v21 = CFSTR("storage");
        if ((unint64_t)objc_msgSend(CFSTR("storage"), "length") >= 0x15)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("storage"), "substringWithRange:", 0, 18));
          v21 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stringByAppendingString:", CFSTR("..")));

        }
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("added")));
        v24 = (void *)_gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          v25 = objc_retainAutorelease(v21);
          v26 = v24;
          *(_DWORD *)buf = 136446466;
          v71 = -[__CFString UTF8String](v25, "UTF8String");
          v72 = 2114;
          v73 = v23;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

        }
        if (objc_msgSend(*(id *)(a1 + 32), "sessionOpen"))
          objc_msgSend(*(id *)(a1 + 32), "readStorages");
        if ((v20 & 1) == 0)
          break;
        goto LABEL_54;
      case 16389:
        v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "storageForStorageID:", objc_msgSend(*(id *)(a1 + 40), "parameter1")));
        if (objc_msgSend(v4, "storageID") == -17958194)
        {
          objc_msgSend(*(id *)(a1 + 32), "setDeviceIsPasscodeLocked:", 0);
          objc_msgSend(*(id *)(a1 + 32), "setDeviceIsPairedWithThisHost:", 1);
          v69[0] = CFSTR("ICAppleDeviceUnlocked");
          v68[0] = CFSTR("ICDeviceStatus");
          v68[1] = CFSTR("deviceIsPasscodeLocked");
          v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "deviceIsPasscodeLocked")));
          v69[1] = v27;
          v68[2] = CFSTR("deviceIsPairedWithThisHost");
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "deviceIsPairedWithThisHost")));
          v69[2] = v28;
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v69, v68, 3));

          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "allConnections"));
          objc_msgSend(v30, "sendStatusNotification:toConnections:", v29, v32);

        }
        if (v4)
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "indexedFiles"));
          v57 = 0u;
          v58 = 0u;
          v59 = 0u;
          v60 = 0u;
          v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
          if (v35)
          {
            v36 = v35;
            v37 = *(_QWORD *)v58;
            do
            {
              for (i = 0; i != v36; i = (char *)i + 1)
              {
                if (*(_QWORD *)v58 != v37)
                  objc_enumerationMutation(v34);
                v39 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)i);
                v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v39, "objHandle")));
                objc_msgSend(v33, "addObject:", v40);

                objc_msgSend(v4, "removeCameraFileFromIndex:", objc_msgSend(v39, "objHandle"));
              }
              v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
            }
            while (v36);
          }
          if (objc_msgSend(v33, "count"))
          {
            v65 = CFSTR("ICObjectIDArray");
            v66 = v33;
            v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1));
            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
            v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
            v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "allConnections"));
            objc_msgSend(v42, "sendRemovedItemsNotification:toConnections:", v41, v44);

          }
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "storages"));
          objc_msgSend(v45, "removeObject:", v4);

        }
        if (!objc_msgSend(*(id *)(a1 + 32), "isAppleDevice"))
          goto LABEL_51;
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "storages"));
        v47 = objc_msgSend(v46, "count");

        if (!v47)
          objc_msgSend(*(id *)(a1 + 32), "setDeviceIsEnumerating");
        goto LABEL_49;
      case 16396:
        v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "storageForStorageID:", objc_msgSend(*(id *)(a1 + 40), "parameter1")));
        objc_msgSend(v4, "refreshInfo");
        goto LABEL_51;
      default:
        goto LABEL_57;
    }
  }
  v61 = CFSTR("ICPTPEvent");
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "contentForUSB"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "data"));
  v62 = v49;
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1));

  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
  objc_msgSend(v51, "sendPTPEventNotification:", v50);
LABEL_53:

LABEL_54:
  objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:afterDelay:", "processUnhandledEvents", 0, 0.0);
}

void sub_10000E5C4(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  uint64_t uint64;
  char *string;
  void *v11;
  const char *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  __CFString *v33;
  void *v34;
  char *v35;
  void *v36;
  __CFString *v37;
  NSObject *v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  char *v42;

  v5 = a2;
  v6 = v5;
  if (!v5 || (a3 & 1) != 0)
  {
    __ICOSLogCreate();
    v14 = objc_msgSend(CFSTR("RemoteServices"), "length");
    if (a3)
    {
      if ((unint64_t)v14 >= 0x15)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("RemoteServices"), "substringWithRange:", 0, 18));
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByAppendingString:", CFSTR("..")));

      }
      else
      {
        v8 = CFSTR("RemoteServices");
      }
      string = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Canceled: 0x%08X"), *(unsigned int *)(a1 + 48)));
      v21 = (void *)_gICOSLog;
      if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        goto LABEL_49;
    }
    else
    {
      if ((unint64_t)v14 >= 0x15)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("RemoteServices"), "substringWithRange:", 0, 18));
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringByAppendingString:", CFSTR("..")));

      }
      else
      {
        v8 = CFSTR("RemoteServices");
      }
      string = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid Device: 0x%08X"), *(unsigned int *)(a1 + 48)));
      v21 = (void *)_gICOSLog;
      if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        goto LABEL_49;
    }
    v8 = objc_retainAutorelease(v8);
    v22 = v21;
    *(_DWORD *)buf = 136446466;
    v40 = -[__CFString UTF8String](v8, "UTF8String");
    v41 = 2114;
    v42 = string;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

LABEL_49:
    goto LABEL_50;
  }
  v7 = (__CFString *)remote_device_copy_properties(v5);
  v8 = v7;
  if (v7)
  {
    uint64 = xpc_dictionary_get_uint64(v7, "LocationID");
    if (uint64 == *(_DWORD *)(a1 + 48))
    {
      string = (char *)xpc_dictionary_get_string(v8, "BuildVersion");
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      if (string)
      {
        string = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string));
        if (string)
          objc_msgSend(v11, "setObject:forKeyedSubscript:", string, CFSTR("BuildVersion"));
      }
      v12 = xpc_dictionary_get_string(v8, "DeviceClass");
      if (v12)
      {
        v13 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v12));

        if (v13)
        {
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("DeviceClass"));
          string = (char *)v13;
        }
        else
        {
          string = 0;
        }
      }
      v23 = xpc_dictionary_get_string(v8, "ProductType");
      if (v23)
      {
        v24 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v23));

        if (v24)
        {
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v24, CFSTR("ProductType"));
          string = (char *)v24;
        }
        else
        {
          string = 0;
        }
      }
      v25 = xpc_dictionary_get_string(v8, "OSVersion");
      if (v25)
      {
        v26 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v25));

        if (v26)
        {
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v26, CFSTR("ProductVersion"));
          string = (char *)v26;
        }
        else
        {
          string = 0;
        }
      }
      v27 = xpc_dictionary_get_string(v8, "DeviceColor");
      if (v27)
      {
        v28 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v27));

        if (v28)
        {
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v28, CFSTR("DeviceColor"));
          string = (char *)v28;
        }
        else
        {
          string = 0;
        }
      }
      v29 = xpc_dictionary_get_string(v8, "DeviceEnclosureColor");
      if (v29)
      {
        v30 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v29));

        if (v30)
        {
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v30, CFSTR("DeviceEnclosureColor"));
          string = (char *)v30;
        }
        else
        {
          string = 0;
        }
      }
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "deviceIsPairedWithThisHost")));
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v31, CFSTR("DevicePairedState"));

      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "deviceIsPasscodeLocked")));
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v32, CFSTR("PasswordProtected"));

      objc_msgSend(*(id *)(a1 + 32), "addMobdevProperties:", v11);
      __ICOSLogCreate();
      v33 = CFSTR("RemoteServices");
      if ((unint64_t)objc_msgSend(CFSTR("RemoteServices"), "length") >= 0x15)
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("RemoteServices"), "substringWithRange:", 0, 18));
        v33 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "stringByAppendingString:", CFSTR("..")));

      }
      v35 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Updated: 0x%08X"), *(unsigned int *)(a1 + 48)));
      v36 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v37 = objc_retainAutorelease(v33);
        v38 = v36;
        *(_DWORD *)buf = 136446466;
        v40 = -[__CFString UTF8String](v37, "UTF8String");
        v41 = 2114;
        v42 = v35;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

      }
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
    }
    else
    {
      v17 = uint64;
      __ICOSLogCreate();
      string = CFSTR("RemoteServices");
      if ((unint64_t)objc_msgSend(CFSTR("RemoteServices"), "length") >= 0x15)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("RemoteServices"), "substringWithRange:", 0, 18));
        string = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringByAppendingString:", CFSTR("..")));

      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Ignored: 0x%08llX"), v17));
      v19 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        string = objc_retainAutorelease(string);
        v20 = v19;
        *(_DWORD *)buf = 136446466;
        v40 = objc_msgSend(string, "UTF8String");
        v41 = 2114;
        v42 = (char *)v11;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

      }
    }

    goto LABEL_49;
  }
LABEL_50:

}

void sub_10000F2C0(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  dispatch_source_t v4;
  dispatch_time_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD handler[5];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "timer"));

  if (!v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "timerQueue"));
    v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v3);
    objc_msgSend(*(id *)(a1 + 32), "setTimer:", v4);

    v5 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 48) * 1000000000.0));
    v6 = (unint64_t)(*(double *)(a1 + 48) * 1000000000.0);
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "timer"));
    dispatch_source_set_timer(v7, v5, v6, 0x5F5E100uLL);

    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "timer"));
    dispatch_source_set_event_handler(v8, *(dispatch_block_t *)(a1 + 40));

    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "timer"));
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10000F424;
    handler[3] = &unk_100048A38;
    handler[4] = *(_QWORD *)(a1 + 32);
    dispatch_source_set_cancel_handler(v9, handler);

    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "timer"));
    dispatch_resume(v10);

  }
}

void sub_10000F424(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "timerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F498;
  block[3] = &unk_100048A38;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v2, block);

}

id sub_10000F498(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTimer:", 0);
}

uint64_t sub_10000F53C(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "timer"));

  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "timer"));
    dispatch_source_cancel(v3);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_10000F5E4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[2];

  objc_msgSend(*(id *)(a1 + 32), "setDeviceIsEnumerating:", 1);
  v7[1] = CFSTR("deviceIsEnumerating");
  v8[0] = CFSTR("ICDeviceIsEnumerating");
  v7[0] = CFSTR("ICDeviceStatus");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "deviceIsEnumerating")));
  v8[1] = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 2));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allConnections"));
  objc_msgSend(v4, "sendStatusNotification:toConnections:", v3, v6);

}

void sub_10000F750(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[2];

  objc_msgSend(*(id *)(a1 + 32), "setDeviceIsEnumerating:", 0);
  v7[1] = CFSTR("deviceIsEnumerating");
  v8[0] = CFSTR("ICDeviceIsEnumerating");
  v7[0] = CFSTR("ICDeviceStatus");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "deviceIsEnumerating")));
  v8[1] = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 2));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allConnections"));
  objc_msgSend(v4, "sendStatusNotification:toConnections:", v3, v6);

}

void sub_1000127AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000127C8(uint64_t a1)
{
  PTPOperationRequestPacket *v2;
  void *v3;
  id v4;
  PTPOperationRequestPacket *v5;
  PTPTransaction *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  unsigned int v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  __CFString *v27;
  NSObject *v28;
  __CFString *v29;
  id v30;
  __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  __CFString *v35;
  NSObject *v36;
  id v37;
  char v38;
  int v39;
  id v40;
  void *v41;
  void *v42;
  __CFString *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  id v47;
  void *v48;
  PTPTransaction *v49;
  PTPOperationRequestPacket *v50;
  id obj;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t v56[128];
  uint8_t buf[4];
  id v58;
  __int16 v59;
  void *v60;

  v2 = [PTPOperationRequestPacket alloc];
  v3 = *(void **)(a1 + 32);
  v4 = objc_msgSend(v3, "transactionID");
  objc_msgSend(v3, "setTransactionID:", ((_DWORD)v4 + 1));
  v5 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:](v2, "initWithOperationCode:transactionID:dataPhaseInfo:", 36865, v4, 1);
  v6 = -[PTPTransaction initWithOperationRequestPacket:txData:rxData:dataExpected:]([PTPTransaction alloc], "initWithOperationRequestPacket:txData:rxData:dataExpected:", v5, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "executeTransaction:timeout:", v6, 60.0));
  v8 = v7;
  if (v7 && objc_msgSend(v7, "responseCode") == 8193)
  {
    v9 = objc_msgSend(v8, "numParameters");
    if (v9 >= 3)
    {
      v10 = v9;
      objc_msgSend(*(id *)(a1 + 32), "setDeviceIsPasscodeLocked:", objc_msgSend(v8, "parameter3") != 0);
      __ICOSLogCreate();
      v11 = CFSTR("access");
      if ((unint64_t)objc_msgSend(CFSTR("access"), "length") >= 0x15)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("access"), "substringWithRange:", 0, 18));
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingString:", CFSTR("..")));

      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("deviceIsPasscodeLocked: %d"), objc_msgSend(*(id *)(a1 + 32), "deviceIsPasscodeLocked")));
      v14 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v15 = objc_retainAutorelease(v11);
        v16 = v14;
        *(_DWORD *)buf = 136446466;
        v58 = -[__CFString UTF8String](v15, "UTF8String");
        v59 = 2114;
        v60 = v13;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

      }
      if (v10 >= 4)
        objc_msgSend(*(id *)(a1 + 32), "setDeviceIsPairedWithThisHost:", objc_msgSend(v8, "parameter4") != 0);
    }
    v48 = v8;
    v49 = v6;
    v50 = v5;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "storageIDs"));
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    obj = v17;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(_QWORD *)v53 != v20)
            objc_enumerationMutation(obj);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)i), "unsignedIntValue") == -17958194)
          {
            __ICOSLogCreate();
            v22 = CFSTR("access");
            if ((unint64_t)objc_msgSend(CFSTR("access"), "length") >= 0x15)
            {
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("access"), "substringWithRange:", 0, 18));
              v22 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "stringByAppendingString:", CFSTR("..")));

            }
            v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("containsAccessRestrictedAppleDeviceStorage")));
            v25 = (void *)_gICOSLog;
            if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
            {
              v26 = a1;
              v27 = objc_retainAutorelease(v22);
              v28 = v25;
              v29 = v27;
              a1 = v26;
              v30 = -[__CFString UTF8String](v29, "UTF8String");
              *(_DWORD *)buf = 136446466;
              v58 = v30;
              v59 = 2114;
              v60 = v24;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

            }
            objc_msgSend(*(id *)(a1 + 32), "setDeviceIsPairedWithThisHost:", 0);
          }
        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
      }
      while (v19);
    }
    __ICOSLogCreate();
    v31 = CFSTR("access");
    if ((unint64_t)objc_msgSend(CFSTR("access"), "length") >= 0x15)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("access"), "substringWithRange:", 0, 18));
      v31 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "stringByAppendingString:", CFSTR("..")));

    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("deviceIsPairedWithThisHost: %d"), objc_msgSend(*(id *)(a1 + 32), "deviceIsPairedWithThisHost")));
    v34 = (void *)_gICOSLog;
    v6 = v49;
    v5 = v50;
    v8 = v48;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v35 = objc_retainAutorelease(v31);
      v36 = v34;
      v37 = -[__CFString UTF8String](v35, "UTF8String");
      *(_DWORD *)buf = 136446466;
      v58 = v37;
      v59 = 2114;
      v60 = v33;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "deviceIsPasscodeLocked") & 1) != 0)
    v38 = 1;
  else
    v38 = objc_msgSend(*(id *)(a1 + 32), "deviceIsPairedWithThisHost") ^ 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v38;
  v39 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  __ICOSLogCreate();
  v40 = objc_msgSend(CFSTR("trust"), "length");
  if (v39)
  {
    if ((unint64_t)v40 >= 0x15)
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("trust"), "substringWithRange:", 0, 18));
      v43 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "stringByAppendingString:", CFSTR("..")));

    }
    else
    {
      v43 = CFSTR("trust");
    }
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Setting self.needToReopenSession = YES")));
    v45 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
LABEL_41:
      v43 = objc_retainAutorelease(v43);
      v46 = v45;
      v47 = -[__CFString UTF8String](v43, "UTF8String");
      *(_DWORD *)buf = 136446466;
      v58 = v47;
      v59 = 2114;
      v60 = v44;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
  }
  else
  {
    if ((unint64_t)v40 >= 0x15)
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("trust"), "substringWithRange:", 0, 18));
      v43 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "stringByAppendingString:", CFSTR("..")));

    }
    else
    {
      v43 = CFSTR("trust");
    }
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Setting self.needToReopenSession = NO")));
    v45 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_41;
  }

  objc_msgSend(*(id *)(a1 + 32), "setNeedToReopenSession:", v39 != 0);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void sub_1000133B4(uint64_t a1)
{
  void *v2;
  id v3;
  void *(__cdecl **v4)(CFAllocatorRef, void *, CFIndex, CFOptionFlags);
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  int v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  __CFString *v42;
  NSObject *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  __CFString *v50;
  void *v51;
  void *v52;
  void *v53;
  __CFString *v54;
  NSObject *v55;
  id v56;
  void *v57;
  id obj;
  uint64_t v59;
  id v60;
  void *context;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  id v67;
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  const __CFString *v81;
  id v82;
  uint8_t buf[4];
  id v84;
  __int16 v85;
  void *v86;
  const __CFString *v87;
  id v88;
  _BYTE v89[128];
  const __CFString *v90;
  id v91;
  _BYTE v92[128];
  _BYTE v93[128];

  objc_msgSend(*(id *)(a1 + 32), "notifyDeviceReady:", 0);
  v66 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "storages"));
  v3 = objc_msgSend(v2, "copy");

  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  obj = v3;
  v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v93, 16);
  if (v60)
  {
    v59 = *(_QWORD *)v78;
    v4 = &CFAllocatorReallocate_ptr;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v78 != v59)
          objc_enumerationMutation(obj);
        v64 = v5;
        v6 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexedFolders"));
        if (v7)
        {
          v8 = objc_autoreleasePoolPush();
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4[72], "array"));
          v73 = 0u;
          v74 = 0u;
          v75 = 0u;
          v76 = 0u;
          v10 = v7;
          v11 = v7;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v73, v92, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v74;
            do
            {
              for (i = 0; i != v13; i = (char *)i + 1)
              {
                if (*(_QWORD *)v74 != v14)
                  objc_enumerationMutation(v11);
                v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1)
                                                                                   + 8 * (_QWORD)i), "info"));
                v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "content:", 2));
                objc_msgSend(v9, "addObject:", v17);

              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v73, v92, 16);
            }
            while (v13);
          }

          v90 = CFSTR("ICPTPObjectInfoArray");
          v18 = objc_msgSend(v9, "copy");
          v91 = v18;
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v91, &v90, 1));

          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v66 + 32), "delegate"));
          objc_msgSend(v20, "sendAddedItemsNotification:toConnections:", v19, *(_QWORD *)(v66 + 40));

          objc_msgSend(v9, "removeAllObjects");
          objc_autoreleasePoolPop(v8);
          v7 = v10;
          v4 = &CFAllocatorReallocate_ptr;
        }
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexedFiles"));
        if (v21)
        {
          v22 = objc_autoreleasePoolPush();
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4[72], "array"));
          context = v22;
          v62 = v21;
          if (*(_QWORD *)(v66 + 48) == -1)
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectEnumerator"));
          else
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "reverseObjectEnumerator"));
          v63 = v7;
          v71 = 0u;
          v72 = 0u;
          v69 = 0u;
          v70 = 0u;
          v25 = v24;
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v69, v89, 16);
          v68 = v25;
          if (v26)
          {
            v27 = v26;
            v28 = 0;
            v29 = 0;
            v30 = *(_QWORD *)v70;
            v65 = v23;
            do
            {
              v31 = 0;
              v67 = v27;
              do
              {
                if (*(_QWORD *)v70 != v30)
                  objc_enumerationMutation(v68);
                v32 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)v31);
                v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "info"));
                v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "relatedUUID"));

                if (v29)
                {
                  if (objc_msgSend(v29, "compare:", v34))
                  {
                    v35 = objc_msgSend(v34, "copy");

                    if (v28 < 1000)
                    {
                      ++v28;
                    }
                    else
                    {
                      v87 = CFSTR("ICPTPObjectInfoArray");
                      v36 = objc_msgSend(v23, "copy");
                      v88 = v36;
                      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1));

                      __ICOSLogCreate();
                      v38 = CFSTR("Flushing");
                      if ((unint64_t)objc_msgSend(CFSTR("Flushing"), "length") >= 0x15)
                      {
                        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("Flushing"), "substringWithRange:", 0, 18));
                        v38 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "stringByAppendingString:", CFSTR("..")));

                      }
                      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("FlushCount: %lu"), objc_msgSend(v23, "count")));
                      v41 = (void *)_gICOSLog;
                      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
                      {
                        v42 = objc_retainAutorelease(v38);
                        v43 = v41;
                        v44 = -[__CFString UTF8String](v42, "UTF8String");
                        *(_DWORD *)buf = 136446466;
                        v84 = v44;
                        v85 = 2114;
                        v86 = v40;
                        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

                      }
                      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v66 + 32), "delegate"));
                      objc_msgSend(v45, "sendAddedItemsNotification:toConnections:", v37, *(_QWORD *)(v66 + 40));

                      v23 = v65;
                      objc_msgSend(v65, "removeAllObjects");

                      v28 = 0;
                    }
                    v29 = v35;
                    v27 = v67;
                  }
                }
                else
                {
                  v29 = objc_msgSend(v34, "copy");
                }
                v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "info"));
                v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "content:", 2));
                objc_msgSend(v23, "addObject:", v47);

                v31 = (char *)v31 + 1;
              }
              while (v27 != v31);
              v27 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v69, v89, 16);
            }
            while (v27);
          }
          else
          {
            v29 = 0;
          }

          v81 = CFSTR("ICPTPObjectInfoArray");
          v48 = objc_msgSend(v23, "copy");
          v82 = v48;
          v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1));

          __ICOSLogCreate();
          v50 = CFSTR("Flushing");
          if ((unint64_t)objc_msgSend(CFSTR("Flushing"), "length") >= 0x15)
          {
            v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("Flushing"), "substringWithRange:", 0, 18));
            v50 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "stringByAppendingString:", CFSTR("..")));

          }
          v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("FlushCount: %lu"), objc_msgSend(v23, "count")));
          v53 = (void *)_gICOSLog;
          v4 = &CFAllocatorReallocate_ptr;
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          {
            v54 = objc_retainAutorelease(v50);
            v55 = v53;
            v56 = -[__CFString UTF8String](v54, "UTF8String");
            *(_DWORD *)buf = 136446466;
            v84 = v56;
            v85 = 2114;
            v86 = v52;
            _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

          }
          v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v66 + 32), "delegate"));
          objc_msgSend(v57, "sendAddedItemsNotification:toConnections:", v49, *(_QWORD *)(v66 + 40));

          objc_autoreleasePoolPop(context);
          v21 = v62;
          v7 = v63;
        }

        v5 = v64 + 1;
      }
      while ((id)(v64 + 1) != v60);
      v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v93, 16);
    }
    while (v60);
  }

}

void sub_100014784(id a1)
{
  void *v1;
  const char *v2;
  id v3;
  os_log_t v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "processName"));
  v2 = (const char *)objc_msgSend(ICLoggingDomain, "UTF8String");
  v3 = objc_retainAutorelease(v1);
  v4 = os_log_create(v2, (const char *)objc_msgSend(v3, "UTF8String"));
  v5 = (void *)_gICOSLog;
  _gICOSLog = (uint64_t)v4;

}

uint64_t __ICLogTypeEnabled(uint64_t a1)
{
  return ICLoggingLevel & a1;
}

void sub_10001559C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void sub_1000155D8(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  id v13;
  _QWORD v14[5];

  v6 = a2;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "transport"));
  v8 = objc_msgSend(v7, "connected");

  if ((v8 & 1) == 0)
    *a4 = 1;
  if (*(_BYTE *)(a1 + 64))
    v9 = v6;
  else
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectInfo:", objc_msgSend(v6, "unsignedIntValue")));
  v10 = v9;
  if (v9)
  {
    if (objc_msgSend(v9, "objectFormat") == 12289)
    {
      v11 = *(void **)(a1 + 40);
LABEL_11:
      objc_msgSend(v11, "addObject:", v10);
      goto LABEL_12;
    }
    if (*(_BYTE *)(a1 + 64))
    {
      v11 = *(void **)(a1 + 48);
      goto LABEL_11;
    }
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100015730;
    v14[3] = &unk_100048AF0;
    v14[4] = *(_QWORD *)(a1 + 56);
    v12 = objc_retainBlock(v14);
    v13 = objc_msgSend(*(id *)(a1 + 48), "indexOfObject:inSortedRange:options:usingComparator:", v10, 0, objc_msgSend(*(id *)(a1 + 48), "count"), 1024, v12);
    if (v13 != (id)0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(*(id *)(a1 + 48), "insertObject:atIndex:", v10, v13);

  }
LABEL_12:

}

uint64_t sub_100015730(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = objc_msgSend(a2, "intervalSince1970");
  v7 = objc_msgSend(v5, "intervalSince1970");

  if (v7 > v6)
    return *(_QWORD *)(a1 + 32);
  else
    return -*(_QWORD *)(a1 + 32);
}

uint64_t sub_100015788(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100015798(uint64_t a1)
{

}

void sub_1000157A0(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  unsigned int v10;
  void *v11;
  unsigned int v12;
  int v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  unsigned int v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *j;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];

  v6 = a2;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "transport"));
  v8 = objc_msgSend(v7, "connected");

  if ((v8 & 1) == 0)
    *a4 = 1;
  v9 = v6;
  v10 = objc_msgSend(v9, "parentObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "filename"));
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("DCIM"));

  if (v10)
  {
    v13 = v10 == objc_msgSend(*(id *)(a1 + 40), "storageID") ? 1 : v12;
    if (v13 != 1)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "cameraFolderWithObjectID:", v10));
      if (objc_msgSend(v30, "type") == (id)3)
        v31 = v30;
      else
        v31 = 0;
      v14 = v31;

      if (v14)
        goto LABEL_9;
LABEL_32:
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v9);
      goto LABEL_33;
    }
  }
  v14 = *(id *)(a1 + 40);
  if (!v14)
    goto LABEL_32;
LABEL_9:
  v15 = objc_autoreleasePoolPush();
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v17 = objc_msgSend(*(id *)(a1 + 40), "newFolderWithObjectInfo:inFolder:notify:", v9, v14, *(_BYTE *)(a1 + 56) == 0);
  if (v17)
  {
    v32 = v15;
    v33 = v14;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v18 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(_QWORD *)v39 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
          v24 = objc_msgSend(v23, "parentObject", v32, v33);
          if (v24 == objc_msgSend(v17, "objHandle"))
            objc_msgSend(v16, "addObject:", v23);
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      }
      while (v20);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "removeObjectsInArray:", v16);
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v25 = v16;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v35;
      do
      {
        for (j = 0; j != v27; j = (char *)j + 1)
        {
          if (*(_QWORD *)v35 != v28)
            objc_enumerationMutation(v25);

        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v27);
    }

    v15 = v32;
    v14 = v33;
  }

  objc_autoreleasePoolPop(v15);
LABEL_33:

}

void sub_100015ABC(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  NSObject *v21;
  void *v22;
  unsigned __int8 v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  void *v34;

  v6 = a2;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "transport"));
  v8 = objc_msgSend(v7, "connected");

  if ((v8 & 1) == 0)
    *a4 = 1;
  v9 = v6;
  v10 = objc_msgSend(v9, "parentObject");
  v11 = *(void **)(a1 + 40);
  if (v10)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cameraFolderWithObjectID:", v10));
    if (objc_msgSend(v12, "type") == (id)3)
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;

    if (v14)
      goto LABEL_8;
  }
  else
  {
    v14 = v11;
    if (v14)
    {
LABEL_8:
      v15 = objc_autoreleasePoolPush();
      if (objc_msgSend(v9, "objectFormat") == 12290
        || objc_msgSend(v9, "objectFormat") == 12291
        || objc_msgSend(v9, "objectFormat") == 12292
        || objc_msgSend(v9, "objectFormat") == 12293
        || objc_msgSend(v9, "objectFormat") == 12294)
      {
        __ICOSLogCreate();
        v16 = CFSTR("objInfo");
        if ((unint64_t)objc_msgSend(CFSTR("objInfo"), "length") >= 0x15)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("objInfo"), "substringWithRange:", 0, 18));
          v16 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByAppendingString:", CFSTR("..")));

        }
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("unknown: %@"), v9));
        v19 = (void *)_gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          v20 = objc_retainAutorelease(v16);
          v21 = v19;
          *(_DWORD *)buf = 136446466;
          v32 = -[__CFString UTF8String](v20, "UTF8String");
          v33 = 2114;
          v34 = v18;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

        }
      }
      objc_msgSend(*(id *)(a1 + 40), "newItemWithObjectInfo:notify:", v9, *(_BYTE *)(a1 + 48) == 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "transport"));
      v23 = objc_msgSend(v22, "connected");

      if ((v23 & 1) == 0)
        *a4 = 1;
      objc_autoreleasePoolPop(v15);
      goto LABEL_27;
    }
  }
  __ICOSLogCreate();
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "filename"));
  if ((unint64_t)objc_msgSend(v24, "length") >= 0x15)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "substringWithRange:", 0, 18));
    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "stringByAppendingString:", CFSTR("..")));

    v24 = (void *)v26;
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Missing Parent")));
  v28 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v29 = objc_retainAutorelease(v24);
    v30 = v28;
    *(_DWORD *)buf = 136446466;
    v32 = objc_msgSend(v29, "UTF8String");
    v33 = 2114;
    v34 = v27;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
LABEL_27:

}

void sub_1000162E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000162F8(uint64_t a1)
{
  void *v2;
  void *v3;
  unsigned __int8 v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  char *errmsg;
  uint64_t v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/var/mobile/Library/com.apple.imagecapture"), "stringByAppendingPathComponent:", CFSTR("externalDeviceAccess.db")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = objc_msgSend(v3, "fileExistsAtPath:", CFSTR("/var/mobile/Library/com.apple.imagecapture"));

  if ((v4 & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v11 = 0;
    objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/var/mobile/Library/com.apple.imagecapture"), 0, 0, &v11);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "openDB:", v2))
  {
    __ICOSLogCreate();
    v6 = CFSTR("icaccess");
    if ((unint64_t)objc_msgSend(CFSTR("icaccess"), "length") >= 0x15)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("icaccess"), "substringWithRange:", 0, 18));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingString:", CFSTR("..")));

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to open/create database")));
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
      sub_10002FADC();
  }
  else
  {
    errmsg = 0;
    if (!sqlite3_exec((sqlite3 *)objc_msgSend(*(id *)(a1 + 32), "externalMediaAccessDB"), "CREATE TABLE IF NOT EXISTS external_device_access (ID INTEGER PRIMARY KEY AUTOINCREMENT, bundle_id TEXT, date_added INTEGER, read_access INTEGER, write_access INTEGER, control_informed INTEGER)", 0, 0, &errmsg))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      goto LABEL_14;
    }
    __ICOSLogCreate();
    v6 = CFSTR("icaccess");
    if ((unint64_t)objc_msgSend(CFSTR("icaccess"), "length") >= 0x15)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("icaccess"), "substringWithRange:", 0, 18));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingString:", CFSTR("..")));

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to create table: external_device_access - %s"), errmsg));
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
      sub_10002FADC();
  }

LABEL_14:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void sub_1000166A8(id a1)
{
  ICDeviceAccessManager *v1;
  void *v2;

  v1 = objc_alloc_init(ICDeviceAccessManager);
  v2 = (void *)qword_10005F490;
  qword_10005F490 = (uint64_t)v1;

}

void sub_100017704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001771C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10001772C(uint64_t a1)
{

}

void sub_100017734(uint64_t a1)
{
  const char *v2;
  _QWORD *v3;
  sqlite3 *v4;
  _QWORD *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  char *errmsg;
  _QWORD v10[5];

  v2 = (const char *)objc_msgSend(CFSTR("SELECT bundle_id FROM external_device_access;"), "UTF8String");
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000178BC;
  v10[3] = &unk_100048BB8;
  v10[4] = *(_QWORD *)(a1 + 48);
  v3 = objc_retainBlock(v10);
  errmsg = 0;
  v4 = (sqlite3 *)objc_msgSend(*(id *)(a1 + 32), "externalMediaAccessDB");
  v5 = objc_retainBlock(v3);
  LODWORD(v2) = sqlite3_exec(v4, v2, (int (__cdecl *)(void *, int, char **, char **))sub_1000178D0, v5, &errmsg);

  if ((_DWORD)v2)
  {
    __ICOSLogCreate();
    v6 = CFSTR("icaccess");
    if ((unint64_t)objc_msgSend(CFSTR("icaccess"), "length") >= 0x15)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("icaccess"), "substringWithRange:", 0, 18));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingString:", CFSTR("..")));

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), errmsg));
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
      sub_10002FADC();

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

id sub_1000178BC(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObjectsFromArray:", a2);
}

uint64_t sub_1000178D0(void (**a1)(_QWORD, _QWORD), int a2, _QWORD *a3)
{
  uint64_t v5;
  os_log_t *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  os_log_t v11;
  os_log_t *v12;
  __CFString *v13;
  NSObject *v14;
  __CFString *v15;
  id v16;
  void *v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  void *v23;

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (a2 >= 1)
  {
    v5 = a2;
    v6 = (os_log_t *)&_gICOSLog;
    do
    {
      if (*a3)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:"));
        objc_msgSend(v19, "addObject:", v7);

      }
      __ICOSLogCreate();
      v8 = CFSTR("adding");
      if ((unint64_t)objc_msgSend(CFSTR("adding"), "length") >= 0x15)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("adding"), "substringWithRange:", 0, 18));
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingString:", CFSTR("..")));

      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), *a3));
      v11 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        v12 = v6;
        v13 = objc_retainAutorelease(v8);
        v14 = v11;
        v15 = v13;
        v6 = v12;
        v16 = -[__CFString UTF8String](v15, "UTF8String");
        *(_DWORD *)buf = 136446466;
        v21 = v16;
        v22 = 2114;
        v23 = v10;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

      }
      ++a3;
      --v5;
    }
    while (v5);
  }
  ((void (**)(_QWORD, void *))a1)[2](a1, v19);

  return 0;
}

void sub_100017C68(uint64_t a1)
{
  uint64_t v2;
  double v3;
  void *v4;
  sqlite3 *v5;
  id v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v7, "timeIntervalSince1970");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("INSERT INTO external_device_access(bundle_id,date_added,read_access,write_access,control_informed) VALUES ('%@',%lu,%lu,%lu,%lu);"),
                   v2,
                   (unint64_t)v3,
                   0,
                   0,
                   0));
  v5 = (sqlite3 *)objc_msgSend(*(id *)(a1 + 40), "externalMediaAccessDB");
  v6 = objc_retainAutorelease(v4);
  sqlite3_exec(v5, (const char *)objc_msgSend(v6, "UTF8String"), 0, 0, 0);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

void sub_100017E2C(uint64_t a1)
{
  void *v2;
  sqlite3 *v3;
  id v4;
  __CFString *v5;
  void *v6;
  void *v7;
  char *errmsg;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("UPDATE external_device_access SET %@ = %lu WHERE bundle_id = '%@';"),
                   *(_QWORD *)(a1 + 32),
                   *(_QWORD *)(a1 + 64),
                   *(_QWORD *)(a1 + 40)));
  errmsg = 0;
  v3 = (sqlite3 *)objc_msgSend(*(id *)(a1 + 48), "externalMediaAccessDB");
  v4 = objc_retainAutorelease(v2);
  if (sqlite3_exec(v3, (const char *)objc_msgSend(v4, "UTF8String"), 0, 0, &errmsg))
  {
    __ICOSLogCreate();
    v5 = CFSTR("icaccess");
    if ((unint64_t)objc_msgSend(CFSTR("icaccess"), "length") >= 0x15)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("icaccess"), "substringWithRange:", 0, 18));
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingString:", CFSTR("..")));

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), errmsg));
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
      sub_10002FADC();

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));

}

void sub_1000180C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000180D8(uint64_t a1)
{
  id v2;
  id v3;
  const char *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  char *errmsg;

  v2 = objc_alloc_init((Class)NSMutableArray);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SELECT bundle_id, %@ FROM external_device_access;"),
                                      *(_QWORD *)(a1 + 32))));
  v4 = (const char *)objc_msgSend(v3, "UTF8String");

  errmsg = 0;
  if (sqlite3_exec((sqlite3 *)objc_msgSend(*(id *)(a1 + 40), "externalMediaAccessDB"), v4, (int (__cdecl *)(void *, int, char **, char **))sub_100018240, v2, &errmsg))
  {
    __ICOSLogCreate();
    v5 = CFSTR("icaccess");
    if ((unint64_t)objc_msgSend(CFSTR("icaccess"), "length") >= 0x15)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("icaccess"), "substringWithRange:", 0, 18));
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingString:", CFSTR("..")));

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), errmsg));
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
      sub_10002FADC();

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObjectsFromArray:", v2);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

uint64_t sub_100018240(void *a1, int a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;

  v13 = a1;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (a2 >= 1)
  {
    v8 = 0;
    do
    {
      if (*(_QWORD *)(a3 + 8 * v8))
      {
        switch((int)v8)
        {
          case 0:
            v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:"));
            v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), *(_QWORD *)(a4 + 8 * v8)));
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, v10);
            goto LABEL_6;
          case 1:
          case 2:
          case 3:
          case 4:
            v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:"));
            v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v9, "integerValue")));
            v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), *(_QWORD *)(a4 + 8 * v8)));
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, v11);

LABEL_6:
            break;
          default:
            break;
        }
      }
      ++v8;
    }
    while (a2 != v8);
  }
  objc_msgSend(v13, "addObject:", v7);

  return 0;
}

void sub_1000187D8(uint64_t a1)
{
  void *v2;
  sqlite3 *v3;
  id v4;
  __CFString *v5;
  void *v6;
  void *v7;
  char *errmsg;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DELETE FROM external_device_access WHERE bundle_id IS '%@';"),
                   *(_QWORD *)(a1 + 32)));
  errmsg = 0;
  v3 = (sqlite3 *)objc_msgSend(*(id *)(a1 + 40), "externalMediaAccessDB");
  v4 = objc_retainAutorelease(v2);
  if (sqlite3_exec(v3, (const char *)objc_msgSend(v4, "UTF8String"), 0, 0, &errmsg))
  {
    __ICOSLogCreate();
    v5 = CFSTR("icaccess");
    if ((unint64_t)objc_msgSend(CFSTR("icaccess"), "length") >= 0x15)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("icaccess"), "substringWithRange:", 0, 18));
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingString:", CFSTR("..")));

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), errmsg));
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
      sub_10002FADC();

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

void sub_100018CAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_100018CE8(uint64_t a1)
{
  id v2;
  id v3;
  const char *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  char *errmsg;

  v2 = objc_alloc_init((Class)NSMutableArray);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SELECT bundle_id FROM external_device_access WHERE bundle_id IS '%@';"),
                                      *(_QWORD *)(a1 + 32))));
  v4 = (const char *)objc_msgSend(v3, "UTF8String");

  errmsg = 0;
  if (sqlite3_exec((sqlite3 *)objc_msgSend(*(id *)(a1 + 40), "externalMediaAccessDB"), v4, (int (__cdecl *)(void *, int, char **, char **))sub_100018240, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), &errmsg))
  {
    __ICOSLogCreate();
    v5 = CFSTR("icaccess");
    if ((unint64_t)objc_msgSend(CFSTR("icaccess"), "length") >= 0x15)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("icaccess"), "substringWithRange:", 0, 18));
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingString:", CFSTR("..")));

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), errmsg));
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
      sub_10002FADC();

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObjectsFromArray:", v2);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

void sub_100018FF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_100019010(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3 == 0;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

int64_t sub_10001AF9C(id a1, ICMediaItemProtocol *a2, ICMediaItemProtocol *a3)
{
  ICMediaItemProtocol *v4;
  id v5;
  id v6;
  int64_t v7;

  v4 = a3;
  v5 = -[ICMediaItemProtocol unsignedIntegerValue](a2, "unsignedIntegerValue");
  v6 = -[ICMediaItemProtocol unsignedIntegerValue](v4, "unsignedIntegerValue");

  v7 = -1;
  if (v6 <= v5)
    v7 = 1;
  if (v6 == v5)
    return 0;
  else
    return v7;
}

int64_t sub_10001B4D8(id a1, NSNumber *a2, NSNumber *a3)
{
  NSNumber *v4;
  NSUInteger v5;
  id v6;
  int64_t v7;

  v4 = a3;
  v5 = -[NSNumber unsignedIntegerValue](a2, "unsignedIntegerValue");
  v6 = -[NSNumber unsignedIntegerValue](v4, "unsignedIntegerValue");

  v7 = -1;
  if ((unint64_t)v6 <= v5)
    v7 = 1;
  if (v6 == (id)v5)
    return 0;
  else
    return v7;
}

void sub_10001CBF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001CC24(uint64_t a1)
{
  id WeakRetained;
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  NSObject *v8;
  uint8_t buf[4];
  id v10;
  __int16 v11;
  void *v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "removeSessionWithConnection:", WeakRetained);
  __ICOSLogCreate();
  v3 = CFSTR("CM");
  if ((unint64_t)objc_msgSend(CFSTR("CM"), "length") >= 0x15)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("CM"), "substringWithRange:", 0, 18));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("..")));

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("xpc-term: [%05d]"), objc_msgSend(WeakRetained, "processIdentifier")));
  v6 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_retainAutorelease(v3);
    v8 = v6;
    *(_DWORD *)buf = 136446466;
    v10 = -[__CFString UTF8String](v7, "UTF8String");
    v11 = 2114;
    v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
}

void sub_10001E360(uint64_t a1)
{
  PTPCameraFile *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  PTPCameraFile *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  uint8_t buf[4];
  void *v24;

  v2 = [PTPCameraFile alloc];
  v3 = objc_msgSend(*(id *)(a1 + 32), "storageID");
  v4 = *(void **)(a1 + 40);
  v5 = objc_msgSend(v4, "objectHandle");
  v6 = *(void **)(a1 + 32);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "initiator"));
  v8 = -[PTPCameraFile initWithStorageID:ptpObjectInfo:objHandle:parent:initiator:](v2, "initWithStorageID:ptpObjectInfo:objHandle:parent:initiator:", v3, v4, v5, v6, v7);

  __ICOSLogCreate();
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("File queued: %@\n"), v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "description"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v10));

  if (__ICLogTypeEnabled(4))
  {
    v12 = _gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v24 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "storage"));
  objc_msgSend(v13, "addCameraFileToIndex:", v8);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "initiator"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "delegate"));

  v21 = CFSTR("ICPTPObjectInfoArray");
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "content:", 2));
  v20 = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
  v22 = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "allConnections"));
  objc_msgSend(v15, "sendAddedItemsNotification:toConnections:", v18, v19);

}

unint64_t sub_10001E788(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 + 12;
  if (a1 < -12)
    v1 = a1 + 16395;
  return (v1 & 0xFFFFFFFFFFFFC000) + 0x4000;
}

id sub_10001E7A4(void *a1)
{
  NSDate *v1;
  tm v3;

  if (a1)
  {
    memset(&v3, 0, sizeof(v3));
    v3.tm_isdst = -1;
    strptime_l((const char *)objc_msgSend(objc_retainAutorelease(a1), "UTF8String", 0, 0, 0, 0, *(_QWORD *)&v3.tm_isdst, 0, 0), "%Y:%m:%d %H:%M:%S", &v3, 0);
    v1 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)mktime(&v3));
    a1 = (void *)objc_claimAutoreleasedReturnValue(v1);
  }
  return a1;
}

id sub_10001E81C(void *a1)
{
  const char *v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v11 = 0;
  v12 = 0;
  v10 = 0;
  v1 = (const char *)objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  if (v1 && (v2 = v1, strlen(v1) >= 0xF))
  {
    sscanf(v2, "%04d%02d%02dT%02d%02d%02d", (char *)&v12 + 4, &v12, (char *)&v11 + 4, &v11, (char *)&v10 + 4, &v10);
    v4 = v12;
    v3 = HIDWORD(v12);
    v6 = v11;
    v5 = HIDWORD(v11);
    v8 = v10;
    v7 = HIDWORD(v10);
  }
  else
  {
    v8 = 0;
    v7 = 0;
    v6 = 0;
    v5 = 0;
    v4 = 0;
    v3 = 0;
  }
  return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%04d:%02d:%02d %02d:%02d:%02d"), v3, v4, v5, v6, v7, v8));
}

void sub_10001E8E0(void *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4)
{
  _UNKNOWN **v7;
  _UNKNOWN **v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;

  v13 = a1;
  v7 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", kCGImagePropertyOrientation));
  if (!v7)
  {
    v7 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", kCGImagePropertyTIFFOrientation));
    if (!v7)
      v7 = &off_100050FC8;
  }
  v8 = objc_retainAutorelease(v7);
  *a2 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", CFSTR("RawPixelWidth")));
  if (!v9)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", kCGImagePropertyPixelWidth));
    if (!v9)
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", kCGImagePropertyExifPixelXDimension));
  }
  v10 = objc_retainAutorelease(v9);
  *a3 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", CFSTR("RawPixelHeight")));
  if (!v11)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", kCGImagePropertyPixelHeight));
    if (!v11)
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", kCGImagePropertyExifPixelYDimension));
  }
  v12 = objc_retainAutorelease(v11);
  *a4 = v12;

}

void sub_10001EA64(id a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;

  v13 = objc_alloc((Class)NSSet);
  v1 = objc_opt_class(NSDictionary);
  v2 = objc_opt_class(NSMutableDictionary);
  v3 = objc_opt_class(NSArray);
  v4 = objc_opt_class(NSMutableArray);
  v5 = objc_opt_class(NSSet);
  v6 = objc_opt_class(NSString);
  v7 = objc_opt_class(NSData);
  v8 = objc_opt_class(NSMutableData);
  v9 = objc_opt_class(NSNumber);
  v10 = objc_opt_class(NSError);
  v11 = objc_msgSend(v13, "initWithObjects:", v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, objc_opt_class(NSValue), 0);
  v12 = (void *)qword_10005F4A0;
  qword_10005F4A0 = (uint64_t)v11;

}

void sub_10001EE68(id a1)
{
  NSMutableDictionary *v1;
  void *v2;

  v1 = objc_opt_new(NSMutableDictionary);
  v2 = (void *)qword_10005F4B0;
  qword_10005F4B0 = (uint64_t)v1;

}

id sub_10001F810(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fetchBasicMetadata");
}

void sub_1000213EC(id a1)
{
  id v1;
  void *v2;
  id v3;

  v3 = (id)CGImageSourceCopyTypeExtensions(0);
  v1 = objc_msgSend(objc_alloc((Class)NSSet), "initWithArray:", v3);
  v2 = (void *)qword_10005F510;
  qword_10005F510 = (uint64_t)v1;

}

void sub_1000214D0(id a1)
{
  id v1;
  void *v2;
  id v3;

  v3 = (id)CGImageSourceCopyTypeExtensions(CFSTR("public.camera-raw-image"));
  v1 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithArray:", v3);
  v2 = (void *)qword_10005F518;
  qword_10005F518 = (uint64_t)v1;

  objc_msgSend((id)qword_10005F518, "removeObject:", CFSTR("tif"));
}

id sub_100023AEC(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  char *v9;
  id v10;

  v8 = a4 + 12;
  if (a4 < -12)
    v8 = a4 + 16395;
  v9 = (char *)malloc_type_malloc((v8 & 0xFFFFFFFFFFFFC000) + 0x4000, 0x6818771EuLL);
  v10 = objc_msgSend(a1, "readStream:size:offset:", v9, a4, a3);
  memcpy(a2, v9 + 12, (size_t)v10);
  free(v9);
  return v10;
}

void sub_100026680(void *a1, io_iterator_t a2)
{
  id v3;
  io_object_t v4;
  io_registry_entry_t v5;
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v7;
  void *Value;
  unsigned int v9;
  void *v10;
  void *v11;
  CFMutableDictionaryRef v12;
  uint64_t v13;
  void *v14;
  void *v15;
  CFMutableDictionaryRef v16;
  io_registry_entry_t parent;
  CFMutableDictionaryRef properties;

  v3 = a1;
  v4 = IOIteratorNext(a2);
  if (v4)
  {
    v5 = v4;
    do
    {
      properties = 0;
      Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (!Mutable)
        break;
      v7 = Mutable;
      if (IORegistryEntryCreateCFProperties(v5, &properties, 0, 0))
        break;
      Value = (void *)CFDictionaryGetValue(properties, CFSTR("locationID"));
      if (!Value)
        break;
      if (v3)
      {
        v9 = objc_msgSend(Value, "unsignedLongLongValue");
        parent = 0;
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUIDString"));

        if (!IORegistryEntryGetParentEntry(v5, "IOService", &parent))
        {
          if (parent)
          {
            v16 = 0;
            if (!IORegistryEntryCreateCFProperties(parent, &v16, kCFAllocatorDefault, 0))
            {
              v12 = v16;
              v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uuidStringForDeviceProperties:", v16));

              v11 = (void *)v13;
            }
          }
        }
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), v9));
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("LOC:%llu"), v9));
        objc_msgSend(v3, "notifyClientDeviceAdded:uuidString:deviceName:", v14, v11, v15);

      }
      CFRelease(properties);
      CFRelease(v7);
      IOObjectRelease(v5);
      v5 = IOIteratorNext(a2);
    }
    while (v5);
  }

}

void sub_100026858(void *a1, uint64_t a2)
{
  id v3;
  io_registry_entry_t v4;
  const __CFAllocator *v5;
  const __CFString *v6;
  const __CFString *v7;
  CFMutableDictionaryRef v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const __CFAllocator *v15;
  uint64_t v16;
  id v17;
  const __CFString *v18;
  const __CFString *v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  __CFDictionary *v25;
  CFMutableDictionaryRef properties;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;

  v3 = a1;
  v4 = IOIteratorNext(a2);
  if (v4)
  {
    v5 = kCFAllocatorDefault;
    v6 = CFSTR("locationID");
    v7 = CFSTR("_USBPTPInterfaceDeath | locID - 0x%08llX");
    do
    {
      properties = 0;
      if (!IORegistryEntryCreateCFProperties(v4, &properties, v5, 0))
      {
        v8 = properties;
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKey:](properties, "objectForKey:", v6));
        if (v3)
        {
          __ICOSLogCreate();
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "managedObjectName"));
          v25 = v8;
          if ((unint64_t)objc_msgSend(v10, "length") >= 0x15)
          {
            v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "substringWithRange:", 0, 18));
            v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingString:", CFSTR("..")));

            v10 = (void *)v12;
          }
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, objc_msgSend(v9, "unsignedLongLongValue")));
          v14 = (void *)_gICOSLog;
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          {
            v15 = v5;
            v16 = a2;
            v17 = v3;
            v18 = v7;
            v19 = v6;
            v20 = objc_retainAutorelease(v10);
            v21 = v14;
            v22 = v20;
            v6 = v19;
            v7 = v18;
            v3 = v17;
            a2 = v16;
            v5 = v15;
            v23 = objc_msgSend(v22, "UTF8String");
            *(_DWORD *)buf = 136446466;
            v28 = v23;
            v29 = 2114;
            v30 = v13;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

          }
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), objc_msgSend(v9, "unsignedLongLongValue")));
          objc_msgSend(v3, "notifyClientDeviceRemoved:", v24);

          v8 = v25;
        }

      }
      v4 = IOIteratorNext(a2);
    }
    while (v4);
  }

}

uint64_t sub_100027310(unint64_t *a1, unint64_t a2)
{
  unint64_t v2;
  __int16 v3;

  v2 = *a1 + 2;
  if (v2 <= a2)
  {
    v3 = *(_WORD *)*a1;
    *a1 = v2;
  }
  else
  {
    return 0;
  }
  return v3;
}

_WORD **sub_100027338(_WORD **result, __int16 a2)
{
  *(*result)++ = a2;
  return result;
}

uint64_t sub_100027350(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(unsigned __int16 *)*a1;
  *a1 += 2;
  return v1;
}

uint64_t sub_100027364(unint64_t *a1, unint64_t a2)
{
  unint64_t v2;
  uint64_t v3;

  v2 = *a1 + 2;
  if (v2 > a2)
    return 0;
  v3 = *(unsigned __int16 *)*a1;
  *a1 = v2;
  return v3;
}

uint64_t sub_10002738C(unint64_t *a1, unint64_t a2)
{
  unint64_t v2;
  uint64_t v3;

  v2 = *a1 + 4;
  if (v2 > a2)
    return 0;
  v3 = *(unsigned int *)*a1;
  *a1 = v2;
  return v3;
}

_DWORD **sub_1000273B4(_DWORD **result, int a2)
{
  *(*result)++ = a2;
  return result;
}

uint64_t sub_1000273CC(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(unsigned int *)*a1;
  *a1 += 4;
  return v1;
}

uint64_t sub_1000273E0(unint64_t *a1, unint64_t a2)
{
  unint64_t v2;
  uint64_t v3;

  v2 = *a1 + 8;
  if (v2 > a2)
    return 0;
  v3 = *(_QWORD *)*a1;
  *a1 = v2;
  return v3;
}

_QWORD **sub_100027408(_QWORD **result, uint64_t a2)
{
  *(*result)++ = a2;
  return result;
}

uint64_t sub_100027420(_QWORD **a1)
{
  return *(*a1)++;
}

id sub_100027434(const void **a1)
{
  uint64_t v1;
  void *v3;
  id v4;

  v1 = *(unsigned __int8 *)*a1;
  *a1 = (char *)*a1 + 1;
  if (v1)
  {
    v3 = malloc_type_malloc(2 * v1, 0x8B4C94EFuLL);
    memcpy(v3, *a1, 2 * v1);
    *a1 = (char *)*a1 + 2 * v1;
    v4 = objc_msgSend(objc_alloc((Class)NSString), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v3, (2 * v1 - 2), CFStringConvertEncodingToNSStringEncoding(0x14000100u), 1);
  }
  else
  {
    v4 = objc_msgSend(&stru_10004A300, "copy");
  }
  return v4;
}

id sub_1000274E0(const void **a1, unint64_t a2)
{
  id v3;

  if ((unint64_t)*a1 + *(unsigned __int8 *)*a1 > a2)
    return 0;
  v3 = sub_100027434(a1);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

void sub_100027514(_BYTE **a1, void *a2)
{
  unsigned int v3;
  id v4;
  void *v5;
  unsigned int v6;
  _BYTE *v7;
  id v8;
  _BYTE *v9;
  id v10;

  v10 = a2;
  v3 = objc_msgSend(v10, "length");
  if (v3)
  {
    v4 = objc_msgSend(v10, "dataUsingEncoding:", CFStringConvertEncodingToNSStringEncoding(0x14000100u));
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = v3 + 1;
    **a1 = v3 + 1;
    v7 = *a1 + 1;
    *a1 = v7;
    v8 = objc_retainAutorelease(v5);
    memcpy(v7, objc_msgSend(v8, "bytes"), 2 * v3);
    v9 = *a1;
    do
    {
      v9 += 2;
      --v3;
    }
    while (v3);
    *(_WORD *)v9 = 0;
    *a1 += 2 * v6;

  }
  else
  {
    *(*a1)++ = 0;
  }

}

id sub_1000275F0(const void **a1)
{
  _WORD *v2;
  unint64_t v3;
  int v4;
  int v5;
  void *v6;
  id v7;

  v2 = *a1;
  if (!*(_WORD *)*a1)
    goto LABEL_6;
  v3 = 0;
  v4 = 0;
  do
  {
    v5 = (unsigned __int16)v2[v3 / 2 + 1];
    --v4;
    v3 += 2;
  }
  while (v5);
  if (v4)
  {
    v6 = malloc_type_malloc(v3, 0x5593B8A2uLL);
    memcpy(v6, *a1, v3);
    *a1 = (char *)*a1 + (v3 + 2);
    v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v6, v3, CFStringConvertEncodingToNSStringEncoding(0x14000100u), 1);
  }
  else
  {
LABEL_6:
    *a1 = v2 + 1;
    v7 = objc_msgSend(&stru_10004A300, "copy");
  }
  return v7;
}

id sub_1000276C0(unsigned __int16 **a1)
{
  int v2;
  id v3;
  unsigned __int16 *v4;
  void *v5;

  v2 = *(_DWORD *)*a1;
  *a1 += 2;
  v3 = objc_alloc_init((Class)NSMutableArray);
  if (v2)
  {
    v4 = *a1;
    do
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", *v4));
      objc_msgSend(v3, "addObject:", v5);

      v4 = *a1 + 1;
      *a1 = v4;
      --v2;
    }
    while (v2);
  }
  return v3;
}

id sub_100027750(unsigned __int16 **a1, unint64_t a2)
{
  id v3;

  if ((unint64_t)*a1 + (2 * *(_DWORD *)*a1 + 4) > a2)
    return 0;
  v3 = sub_1000276C0(a1);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

void sub_10002778C(unsigned __int16 **a1, void *a2)
{
  unsigned int v3;
  unsigned __int16 *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unsigned __int16 v8;
  unsigned __int16 *v9;
  id v10;

  v10 = a2;
  v3 = objc_msgSend(v10, "count");
  v4 = *a1;
  *(_DWORD *)v4 = v3;
  *a1 = v4 + 2;
  if (v3)
  {
    v5 = 0;
    v6 = v3;
    do
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v5));
      v8 = (unsigned __int16)objc_msgSend(v7, "unsignedShortValue");

      v9 = *a1;
      *v9 = v8;
      *a1 = v9 + 1;
      ++v5;
    }
    while (v6 != v5);
  }

}

id sub_100027820(unsigned int **a1)
{
  int v2;
  id v3;
  unsigned int *v4;
  void *v5;

  v2 = *(*a1)++;
  v3 = objc_alloc_init((Class)NSMutableArray);
  if (v2)
  {
    v4 = *a1;
    do
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", *v4));
      objc_msgSend(v3, "addObject:", v5);

      v4 = *a1 + 1;
      *a1 = v4;
      --v2;
    }
    while (v2);
  }
  return v3;
}

id sub_1000278B0(unsigned int **a1, unint64_t a2)
{
  id v3;

  if ((unint64_t)&(*a1)[**a1 + 1] <= a2)
  {
    v3 = sub_100027820(a1);
    return (id)objc_claimAutoreleasedReturnValue(v3);
  }
  else
  {
    syslog(3, "%s", "PTPCamera attached returned an invalid buffer for object handles, cannot enumerate");
    return 0;
  }
}

__CFString *sub_100027910(uint64_t a1)
{
  __CFString *result;
  __CFString *v3;
  NSString *v4;

  if ((int)a1 <= 37120)
  {
    switch((int)a1)
    {
      case 36865:
        result = CFSTR("PTPOperationCodeGetNumDownloadableObjects_Apple");
        break;
      case 36866:
        result = CFSTR("PTPOperationCodeGetAllObjectInfo32_Apple");
        break;
      case 36867:
        result = CFSTR("PTPOperationCodeGetUserAssignedDeviceName_Apple");
        break;
      case 36868:
        result = CFSTR("PTPOperationCodeAllowKeepAwake_Apple");
        break;
      case 36869:
        result = CFSTR("PTPOperationCodeGetAllObjectInfo64_Apple");
        break;
      case 36870:
        result = CFSTR("PTPOperationCodeGetObjectCompressedSize64_Apple");
        break;
      case 36871:
        result = CFSTR("PTPOperationCodeGetPartialObject64_Apple");
        break;
      case 36872:
        result = CFSTR("Canon_InitiateReleaseControl");
        break;
      case 36873:
        result = CFSTR("PTPOperationCodeGetObjectMetadata_Apple");
        break;
      case 36874:
        result = CFSTR("PTPOperationCodeGetMD5PartialObject64_Apple");
        break;
      case 36875:
        result = CFSTR("PTPOperationCodeSetMediaCapabilities");
        break;
      case 36876:
        result = CFSTR("PTPOperationCodeGetAdjustedThumb_Apple");
        break;
      case 36877:
        result = CFSTR("PTPOperationCodeGetPartialAssetData_Apple");
        break;
      case 36878:
        result = CFSTR("PTPOperationCodeSetHostSupportedFormats_Apple");
        break;
      case 36879:
        result = CFSTR("PTPOperationCodeGetObjectInfosForNextGroup_Apple");
        break;
      case 36880:
        result = CFSTR("PTPOperationCodeSetHostSupportsGroups_Apple");
        break;
      case 36881:
        result = CFSTR("Canon_SetCustomizeData");
        break;
      case 36882:
        result = CFSTR("Canon_GetCaptureStatus");
        break;
      case 36883:
        result = CFSTR("Canon_CheckEvent");
        break;
      case 36884:
        result = CFSTR("Canon_FocusLock");
        break;
      case 36885:
        result = CFSTR("Canon_FocusUnlock");
        break;
      case 36886:
        result = CFSTR("Canon_GetLocalReleaseParam");
        break;
      case 36887:
        result = CFSTR("Canon_SetLocalReleaseParam");
        break;
      case 36888:
        result = CFSTR("Canon_AskAboutPcEvf");
        break;
      case 36889:
LABEL_19:
        result = CFSTR("Canon_SendPartialObject");
        break;
      case 36890:
        result = CFSTR("Canon_InitiateCaptureInMemory");
        break;
      case 36891:
LABEL_49:
        result = CFSTR("Canon_GetPartialObjectEx");
        break;
      case 36892:
LABEL_22:
        result = CFSTR("Canon_SetObjectTime");
        break;
      case 36893:
        result = CFSTR("Canon_GetViewfinderImage");
        break;
      case 36894:
        result = CFSTR("Canon_GetObjectAttributes");
        break;
      case 36895:
        result = CFSTR("Canon_ChangeUSBProtocol");
        break;
      case 36896:
        result = CFSTR("Canon_GetChanges");
        break;
      case 36897:
LABEL_10:
        result = CFSTR("Canon_GetObjectInfoEx");
        break;
      case 36898:
        result = CFSTR("Canon_InitiateDirectTransfer");
        break;
      case 36899:
        result = CFSTR("Canon_TerminateDirectTransfer");
        break;
      case 36900:
        result = CFSTR("Canon_SendObjectInfoByPath");
        break;
      case 36901:
        result = CFSTR("Canon_SendObjectByPath");
        break;
      case 36902:
        result = CFSTR("Canon_InitiateDirectTansferEx");
        break;
      case 36903:
        result = CFSTR("Canon_GetAncillaryObjectHandles");
        break;
      case 36904:
        result = CFSTR("Canon_GetTreeInfo");
        break;
      case 36905:
        result = CFSTR("Canon_GetTreeSize");
        break;
      case 36906:
        result = CFSTR("Canon_NotifyProgress");
        break;
      case 36907:
        result = CFSTR("Canon_NotifyCancelAccepted");
        break;
      case 36908:
        result = CFSTR("Canon_902C");
        break;
      case 36909:
        result = CFSTR("Canon_GetDirectory");
        break;
      case 36910:
        result = CFSTR("Canon_902E");
        break;
      case 36911:
        result = CFSTR("Canon_902F");
        break;
      case 36912:
        result = CFSTR("Canon_SetPairingInfo");
        break;
      case 36913:
        result = CFSTR("Canon_GetPairingInfo");
        break;
      case 36914:
        result = CFSTR("Canon_DeletePairingInfo");
        break;
      case 36915:
        result = CFSTR("Canon_GetMACAddress");
        break;
      case 36916:
        result = CFSTR("Canon_SetDisplayMonitor");
        break;
      case 36917:
        result = CFSTR("Canon_PairingComplete");
        break;
      case 36918:
        result = CFSTR("Canon_GetWirelessMAXChannel");
        break;
      case 36919:
      case 36920:
      case 36921:
      case 36922:
      case 36923:
      case 36924:
      case 36925:
      case 36926:
      case 36927:
      case 36928:
      case 36929:
      case 36930:
      case 36931:
      case 36932:
      case 36933:
      case 36934:
      case 36935:
      case 36936:
      case 36937:
      case 36938:
      case 36939:
      case 36940:
      case 36941:
      case 36942:
      case 36943:
      case 36944:
      case 36945:
      case 36946:
      case 36947:
      case 36948:
      case 36949:
      case 36950:
      case 36951:
      case 36952:
      case 36953:
      case 36954:
      case 36955:
      case 36956:
      case 36957:
      case 36958:
      case 36959:
      case 36960:
      case 36961:
      case 36962:
      case 36963:
      case 36964:
      case 36965:
      case 36966:
      case 36967:
      case 36974:
      case 36976:
      case 36977:
      case 36978:
      case 36979:
      case 36980:
      case 36986:
      case 36987:
      case 36988:
      case 36989:
      case 36990:
      case 36991:
      case 36992:
      case 36993:
      case 36994:
      case 36995:
      case 36996:
      case 36997:
LABEL_214:
        if ((a1 & 0xF000) == 0x9000)
        {
          v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTPOperationCodeVendorDefined (0x%04X)"), a1);
        }
        else if ((a1 & 0xF000) == 0x1000)
        {
          v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTPOperationCodeReserved (0x%04X)"), a1);
        }
        else
        {
          v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(0x%04X)"), a1);
        }
        v3 = (__CFString *)objc_claimAutoreleasedReturnValue(v4);
LABEL_220:
        result = v3;
        break;
      case 36968:
        result = CFSTR("Canon_GetWebServiceSpec");
        break;
      case 36969:
        result = CFSTR("Canon_GetWebServiceData");
        break;
      case 36970:
        result = CFSTR("Canon_SetWebServiceData");
        break;
      case 36971:
        result = CFSTR("Canon_DeleteWebServiceData");
        break;
      case 36972:
        result = CFSTR("Canon_GetRootCertificateSpec");
        break;
      case 36973:
        result = CFSTR("Canon_GetRootCertificateData");
        break;
      case 36975:
        result = CFSTR("Canon_SetRootCertificateData");
        break;
      case 36981:
        result = CFSTR("Canon_GetGpsMobilelinkObjectInfo");
        break;
      case 36982:
        result = CFSTR("Canon_SendGpsTagInfo");
        break;
      case 36983:
        result = CFSTR("Canon_GetTranscodeApproxSize");
        break;
      case 36984:
        result = CFSTR("Canon_RequestTranscodeStart");
        break;
      case 36985:
        result = CFSTR("Canon_RequestTranscodeCancel");
        break;
      case 36998:
        result = CFSTR("Canon_SetRemoteShootingMode");
        break;
      default:
        v3 = CFSTR("PTPOperationCodeUndefined");
        switch((int)a1)
        {
          case 4096:
            goto LABEL_220;
          case 4097:
            result = CFSTR("PTPOperationCodeGetDeviceInfo");
            break;
          case 4098:
            result = CFSTR("PTPOperationCodeOpenSession");
            break;
          case 4099:
            result = CFSTR("PTPOperationCodeCloseSession");
            break;
          case 4100:
            result = CFSTR("PTPOperationCodeGetStorageIDs");
            break;
          case 4101:
            result = CFSTR("PTPOperationCodeGetStorageInfo");
            break;
          case 4102:
            result = CFSTR("PTPOperationCodeGetNumObjects");
            break;
          case 4103:
            result = CFSTR("PTPOperationCodeGetObjectHandles");
            break;
          case 4104:
            result = CFSTR("PTPOperationCodeGetObjectInfo");
            break;
          case 4105:
            result = CFSTR("PTPOperationCodeGetObject");
            break;
          case 4106:
            result = CFSTR("PTPOperationCodeGetThumb");
            break;
          case 4107:
            result = CFSTR("PTPOperationCodeDeleteObject");
            break;
          case 4108:
            result = CFSTR("PTPOperationCodeSendObjectInfo");
            break;
          case 4109:
            result = CFSTR("PTPOperationCodeSendObject");
            break;
          case 4110:
            result = CFSTR("PTPOperationCodeInitiateCapture");
            break;
          case 4111:
            result = CFSTR("PTPOperationCodeFormatStore");
            break;
          case 4112:
            result = CFSTR("PTPOperationCodeResetDevice");
            break;
          case 4113:
            result = CFSTR("PTPOperationCodeSelfTest");
            break;
          case 4114:
            result = CFSTR("PTPOperationCodeSetObjectProtection");
            break;
          case 4115:
            result = CFSTR("PTPOperationCodePowerDown");
            break;
          case 4116:
            result = CFSTR("PTPOperationCodeGetDevicePropDesc");
            break;
          case 4117:
            result = CFSTR("PTPOperationCodeGetDevicePropValue");
            break;
          case 4118:
            result = CFSTR("PTPOperationCodeSetDevicePropValue");
            break;
          case 4119:
            result = CFSTR("PTPOperationCodeResetDevicePropValue");
            break;
          case 4120:
            result = CFSTR("PTPOperationCodeTerminateOpenCapture");
            break;
          case 4121:
            result = CFSTR("PTPOperationCodeMoveObject");
            break;
          case 4122:
            result = CFSTR("PTPOperationCodeCopyObject");
            break;
          case 4123:
            result = CFSTR("PTPOperationCodeGetPartialObject");
            break;
          case 4124:
            result = CFSTR("PTPOperationCodeInitiateOpenCapture");
            break;
          case 4131:
            result = CFSTR("PTPOperationCodeGetFilesystemManifest");
            break;
          default:
            goto LABEL_214;
        }
        break;
    }
  }
  else
  {
    switch((int)a1)
    {
      case 37121:
        result = CFSTR("Canon_GetStorageIDs");
        break;
      case 37122:
        result = CFSTR("Canon_GetStorageInfo");
        break;
      case 37123:
        result = CFSTR("Canon_GetObjectInfo");
        break;
      case 37124:
        result = CFSTR("Canon_GetObject");
        break;
      case 37125:
        result = CFSTR("Canon_DeleteObject");
        break;
      case 37126:
        result = CFSTR("Canon_FormatStore");
        break;
      case 37127:
        result = CFSTR("Canon_GetPartialObject");
        break;
      case 37128:
        result = CFSTR("Canon_GetDeviceInfoEx");
        break;
      case 37129:
        goto LABEL_10;
      case 37130:
        result = CFSTR("Canon_GetThumbEx");
        break;
      case 37131:
        goto LABEL_19;
      case 37132:
        result = CFSTR("Canon_SetObjectAttributes");
        break;
      case 37133:
        result = CFSTR("Canon_GetObjectTime");
        break;
      case 37134:
        goto LABEL_22;
      case 37135:
        result = CFSTR("Canon_RemoteRelease");
        break;
      case 37136:
        result = CFSTR("Canon_SetDevicePropValueEx");
        break;
      case 37137:
      case 37138:
      case 37156:
      case 37165:
      case 37166:
      case 37167:
      case 37198:
      case 37214:
      case 37215:
      case 37217:
      case 37218:
      case 37219:
      case 37220:
      case 37221:
      case 37222:
      case 37223:
      case 37224:
      case 37225:
      case 37226:
      case 37229:
      case 37238:
      case 37240:
      case 37241:
      case 37242:
      case 37243:
      case 37244:
      case 37245:
      case 37246:
      case 37247:
      case 37248:
      case 37249:
      case 37254:
      case 37255:
      case 37256:
      case 37257:
      case 37258:
      case 37259:
      case 37260:
      case 37261:
      case 37262:
      case 37263:
      case 37264:
      case 37265:
      case 37266:
      case 37267:
      case 37268:
      case 37269:
      case 37270:
      case 37271:
      case 37272:
      case 37273:
      case 37274:
      case 37275:
      case 37276:
      case 37277:
      case 37278:
      case 37279:
      case 37280:
      case 37281:
      case 37282:
      case 37283:
      case 37284:
      case 37285:
      case 37286:
      case 37287:
      case 37288:
      case 37289:
      case 37290:
      case 37292:
      case 37293:
      case 37294:
      case 37295:
      case 37296:
      case 37297:
      case 37298:
      case 37299:
      case 37300:
      case 37301:
      case 37302:
      case 37303:
      case 37304:
      case 37306:
      case 37307:
      case 37308:
      case 37309:
      case 37312:
      case 37313:
      case 37314:
      case 37315:
      case 37316:
      case 37317:
      case 37318:
      case 37319:
      case 37320:
      case 37321:
      case 37322:
      case 37323:
      case 37324:
      case 37325:
      case 37326:
      case 37327:
      case 37328:
      case 37329:
      case 37330:
      case 37331:
      case 37332:
      case 37333:
      case 37334:
      case 37335:
      case 37336:
      case 37337:
      case 37338:
      case 37339:
      case 37340:
      case 37341:
      case 37342:
      case 37343:
      case 37344:
      case 37345:
      case 37346:
      case 37347:
      case 37348:
      case 37349:
      case 37350:
      case 37351:
      case 37354:
      case 37355:
      case 37356:
      case 37357:
      case 37358:
      case 37359:
      case 37362:
      case 37363:
      case 37364:
      case 37365:
      case 37366:
      case 37367:
      case 37368:
      case 37369:
      case 37370:
      case 37371:
      case 37372:
      case 37373:
        goto LABEL_214;
      case 37139:
        result = CFSTR("Canon_GetRemoteMode");
        break;
      case 37140:
        result = CFSTR("Canon_SetRemoteMode");
        break;
      case 37141:
        result = CFSTR("Canon_SetEventMode");
        break;
      case 37142:
        result = CFSTR("Canon_GetEvent");
        break;
      case 37143:
        result = CFSTR("Canon_TransferComplete");
        break;
      case 37144:
        result = CFSTR("Canon_CancelTransfer");
        break;
      case 37145:
        result = CFSTR("Canon_ResetTransfer");
        break;
      case 37146:
        result = CFSTR("Canon_PCHDDCapacity");
        break;
      case 37147:
        result = CFSTR("Canon_SetUILock");
        break;
      case 37148:
        result = CFSTR("Canon_ResetUILock");
        break;
      case 37149:
        result = CFSTR("Canon_KeepDeviceOn");
        break;
      case 37150:
        result = CFSTR("Canon_SetNullPacketMode");
        break;
      case 37151:
        result = CFSTR("Canon_UpdateFirmware");
        break;
      case 37152:
        result = CFSTR("Canon_TransferCompleteDT");
        break;
      case 37153:
        result = CFSTR("Canon_CancelTransferDT");
        break;
      case 37154:
        result = CFSTR("Canon_SetWftProfile");
        break;
      case 37155:
        result = CFSTR("Canon_GetWftProfile");
        break;
      case 37157:
        result = CFSTR("Canon_BulbStart");
        break;
      case 37158:
        result = CFSTR("Canon_BulbEnd");
        break;
      case 37159:
        result = CFSTR("Canon_RequestDevicePropValue");
        break;
      case 37160:
        result = CFSTR("Canon_RemoteReleaseOn");
        break;
      case 37161:
        result = CFSTR("Canon_RemoteReleaseOff");
        break;
      case 37162:
        result = CFSTR("Canon_RegistBackgroundImage");
        break;
      case 37163:
        result = CFSTR("Canon_ChangePhotoStudioMode");
        break;
      case 37164:
        goto LABEL_49;
      case 37168:
        result = CFSTR("Canon_ResetMirrorLockupState");
        break;
      case 37169:
        result = CFSTR("Canon_PopupBuiltinFlash");
        break;
      case 37170:
        result = CFSTR("Canon_EndGetPartialObjectEx");
        break;
      case 37171:
        result = CFSTR("Canon_MovieSelectSWOn");
        break;
      case 37172:
        result = CFSTR("Canon_MovieSelectSWOff");
        break;
      case 37173:
        result = CFSTR("Canon_GetCTGInfo");
        break;
      case 37174:
        result = CFSTR("Canon_GetLensAdjust");
        break;
      case 37175:
        result = CFSTR("Canon_SetLensAdjust");
        break;
      case 37176:
        result = CFSTR("Canon_ReadyToSendMusic");
        break;
      case 37177:
        result = CFSTR("Canon_CreateHandle");
        break;
      case 37178:
        result = CFSTR("Canon_SendPartialObjectEx");
        break;
      case 37179:
        result = CFSTR("Canon_EndSendPartialObjectEx");
        break;
      case 37180:
        result = CFSTR("Canon_SetCTGInfo");
        break;
      case 37181:
        result = CFSTR("Canon_SetRequestOLCInfoGroup");
        break;
      case 37182:
        result = CFSTR("Canon_SetRequestRollingPitchingLevel");
        break;
      case 37183:
        result = CFSTR("Canon_GetCameraSupport");
        break;
      case 37184:
        result = CFSTR("Canon_SetRating");
        break;
      case 37185:
        result = CFSTR("Canon_RequestInnerDevelopStart");
        break;
      case 37186:
        result = CFSTR("Canon_RequestInnerDevelopParamChange");
        break;
      case 37187:
        result = CFSTR("Canon_RequestInnerDevelopEnd");
        break;
      case 37188:
        result = CFSTR("Canon_GpsLoggingDataMode");
        break;
      case 37189:
        result = CFSTR("Canon_GetGpsLogCurrentHandle");
        break;
      case 37190:
        result = CFSTR("Canon_SetImageRecoveryData");
        break;
      case 37191:
        result = CFSTR("Canon_GetImageRecoveryList");
        break;
      case 37192:
        result = CFSTR("Canon_FormatImageRecoveryData");
        break;
      case 37193:
        result = CFSTR("Canon_GetPresetLensAdjustParam");
        break;
      case 37194:
        result = CFSTR("Canon_GetRawDispImage");
        break;
      case 37195:
        result = CFSTR("Canon_SaveImageRecoveryData");
        break;
      case 37196:
        result = CFSTR("Canon_RequestBLE");
        break;
      case 37197:
        result = CFSTR("Canon_DrivePowerZoom");
        break;
      case 37199:
        result = CFSTR("Canon_GetIptcData");
        break;
      case 37200:
        result = CFSTR("Canon_SetIptcData");
        break;
      case 37201:
        result = CFSTR("Canon_InitiateViewfinder");
        break;
      case 37202:
        result = CFSTR("Canon_TerminateViewfinder");
        break;
      case 37203:
        result = CFSTR("Canon_GetViewFinderData");
        break;
      case 37204:
        result = CFSTR("Canon_DoAf");
        break;
      case 37205:
        result = CFSTR("Canon_DriveLens");
        break;
      case 37206:
        result = CFSTR("Canon_DepthOfFieldPreview");
        break;
      case 37207:
        result = CFSTR("Canon_ClickWB");
        break;
      case 37208:
        result = CFSTR("Canon_Zoom");
        break;
      case 37209:
        result = CFSTR("Canon_ZoomPosition");
        break;
      case 37210:
        result = CFSTR("Canon_SetLiveAfFrame");
        break;
      case 37211:
        result = CFSTR("Canon_TouchAfPosition");
        break;
      case 37212:
        result = CFSTR("Canon_SetLvPcFlavoreditMode");
        break;
      case 37213:
        result = CFSTR("Canon_SetLvPcFlavoreditParam");
        break;
      case 37216:
        result = CFSTR("Canon_AfCancel");
        break;
      case 37227:
        result = CFSTR("Canon_SetImageRecoveryDataEx");
        break;
      case 37228:
        result = CFSTR("Canon_GetImageRecoveryListEx");
        break;
      case 37230:
        result = CFSTR("Canon_NotifyAutoTransferStatus");
        break;
      case 37231:
        result = CFSTR("Canon_GetReducedObject");
        break;
      case 37232:
        result = CFSTR("Canon_GetObjectInfo64");
        break;
      case 37233:
        result = CFSTR("Canon_GetObject64");
        break;
      case 37234:
        result = CFSTR("Canon_GetPartialObject64");
        break;
      case 37235:
        result = CFSTR("Canon_GetObjectInfoEx64");
        break;
      case 37236:
        result = CFSTR("Canon_GetPartialObjectEX64");
        break;
      case 37237:
        result = CFSTR("Canon_CreateHandle64");
        break;
      case 37239:
        result = CFSTR("Canon_NotifySaveComplete");
        break;
      case 37250:
        result = CFSTR("Canon_NotifyEstimateNumberofImport");
        break;
      case 37251:
        result = CFSTR("Canon_NotifyNumberofImported");
        break;
      case 37252:
        result = CFSTR("Canon_NotifySizeOfPartialDataTransfer");
        break;
      case 37253:
        result = CFSTR("Canon_NotifyFinish");
        break;
      case 37291:
        result = CFSTR("Canon_GetObjectURL");
        break;
      case 37305:
        result = CFSTR("Canon_SetFELock");
        break;
      case 37310:
        result = CFSTR("Canon_SetDefaultCameraSetting");
        break;
      case 37311:
        result = CFSTR("Canon_GetAEData");
        break;
      case 37352:
        result = CFSTR("Canon_NotifyNetworkError");
        break;
      case 37353:
        result = CFSTR("Canon_AdapterTransferProgress");
        break;
      case 37360:
        result = CFSTR("Canon_TransferCompleteFTP");
        break;
      case 37361:
        result = CFSTR("Canon_CancelTransferFTP");
        break;
      case 37374:
        result = CFSTR("Canon_FAPIMessageTX");
        break;
      case 37375:
        result = CFSTR("Canon_FAPIMessageRX");
        break;
      default:
        switch((int)a1)
        {
          case 38913:
            result = CFSTR("MTPGetObjectPropsSupported");
            break;
          case 38914:
            result = CFSTR("MTPGetObjectPropDesc");
            break;
          case 38915:
            result = CFSTR("MTPGetObjectPropValue");
            break;
          case 38917:
            result = CFSTR("MTPGetObjectPropList");
            break;
          default:
            goto LABEL_214;
        }
        break;
    }
  }
  return result;
}

__CFString *sub_100028420(uint64_t a1)
{
  NSString *v2;

  if ((a1 - 0x2000) < 0x21)
    return *(&off_100048DD0 + (__int16)(a1 - 0x2000));
  if ((a1 & 0xF000) == 0xA000)
  {
    v2 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTPResponseCodeVendorDefined (0x%04X)"), a1);
  }
  else if ((a1 & 0xF000) == 0x2000)
  {
    v2 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTPResponseCodeReserved (0x%04X)"), a1);
  }
  else
  {
    v2 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(0x%04X)"), a1);
  }
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue(v2);
}

__CFString *sub_1000284BC(int a1)
{
  int v1;
  __CFString *v2;
  __CFString *result;
  NSString *v4;

  v1 = a1 - 0x4000;
  v2 = CFSTR("PTPEventCodeUndefined");
  switch(v1)
  {
    case 0:
LABEL_28:
      result = v2;
      break;
    case 1:
      result = CFSTR("PTPEventCodeCancelTransaction");
      break;
    case 2:
      result = CFSTR("PTPEventCodeObjectAdded");
      break;
    case 3:
      result = CFSTR("PTPEventCodeObjectRemoved");
      break;
    case 4:
      result = CFSTR("PTPEventCodeStoreAdded");
      break;
    case 5:
      result = CFSTR("PTPEventCodeStoreRemoved");
      break;
    case 6:
      result = CFSTR("PTPEventCodeDevicePropChanged");
      break;
    case 7:
      result = CFSTR("PTPEventCodeObjectInfoChanged");
      break;
    case 8:
      result = CFSTR("PTPEventCodeDeviceInfoChanged");
      break;
    case 9:
      result = CFSTR("PTPEventCodeRequestObjectTransfer");
      break;
    case 10:
      result = CFSTR("PTPEventCodeStoreFull");
      break;
    case 11:
      result = CFSTR("PTPEventCodeDeviceReset");
      break;
    case 12:
      result = CFSTR("PTPEventCodeStorageInfoChanged");
      break;
    case 13:
      result = CFSTR("PTPEventCodeCaptureComplete");
      break;
    case 14:
      result = CFSTR("PTPEventCodeUnreportedStatus");
      break;
    default:
      switch(CFSTR("PTPEventCodeUndefined"))
      {
        case 0xC001u:
          result = CFSTR("PTPEventCodeAppleDeviceUnlocked");
          break;
        case 0xC002u:
          result = CFSTR("PTPEventCodeAppleUserAssignedNameChanged");
          break;
        case 0xC003u:
          result = CFSTR("PTPEventCodeAppleRestartSession");
          break;
        case 0xC004u:
          result = CFSTR("PTPEventCodeAppleGroupAdded");
          break;
        case 0xC005u:
          result = CFSTR("PTPEventCodeAppleGroupEnumerationFinished");
          break;
        default:
          if (((unint64_t)CFSTR("PTPEventCodeUndefined") & 0xF000) == 0xC000)
          {
            v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTPEventCodeVendorDefined (0x%04X)"), CFSTR("PTPEventCodeUndefined"));
          }
          else if (((unint64_t)CFSTR("PTPEventCodeUndefined") & 0xF000) == 0x4000)
          {
            v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTPEventCodeReserved (0x%04X)"), CFSTR("PTPEventCodeUndefined"));
          }
          else
          {
            v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(0x%04X)"), CFSTR("PTPEventCodeUndefined"));
          }
          v2 = (__CFString *)objc_claimAutoreleasedReturnValue(v4);
          goto LABEL_28;
      }
      break;
  }
  return result;
}

__CFString *sub_100028670(uint64_t a1)
{
  NSString *v2;

  if ((unsigned __int16)(a1 - 20480) < 0x20u)
    return *(&off_100048ED8 + (__int16)(a1 - 20480));
  if ((a1 & 0xF000) == 0xD000)
  {
    v2 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTPDevicePropCodeVendorDefined (0x%04X)"), a1);
  }
  else if ((a1 & 0xF000) == 0x5000)
  {
    v2 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTPDevicePropCodeReserved (0x%04X)"), a1);
  }
  else
  {
    v2 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(0x%04X)"), a1);
  }
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue(v2);
}

__CFString *sub_100028710(unsigned int a1)
{
  if (a1 >= 5)
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTPStorageTypeReserved (0x%04X)"), a1));
  else
    return *(&off_100048FD8 + (__int16)a1);
}

__CFString *sub_100028768(uint64_t a1)
{
  NSString *v2;

  if (a1 < 4)
    return *(&off_100049000 + (__int16)a1);
  if ((a1 & 0xF000) == 0x8000)
  {
    v2 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTPFilesystemTypeVendorDefined (0x%04X)"), a1);
  }
  else if ((a1 & 0xF000) != 0)
  {
    v2 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(0x%04X)"), a1);
  }
  else
  {
    v2 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTPFilesystemTypeReserved (0x%04X)"), a1);
  }
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue(v2);
}

__CFString *sub_1000287FC(unsigned int a1)
{
  if (a1 >= 3)
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTPAccessCapabilityReserved (0x%04X)"), a1));
  else
    return *(&off_100049020 + (__int16)a1);
}

__CFString *sub_100028854(unsigned int a1)
{
  __CFString *v1;

  if (!a1)
    return CFSTR("PTPProtectionStatusNoProtection");
  if (a1 == 1)
    v1 = CFSTR("PTPProtectionStatusReadOnly");
  else
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTPProtectionStatusReserved (0x%04X)"), a1));
  return v1;
}

__CFString *sub_1000288B4(int a1)
{
  __CFString *result;
  int v2;
  __CFString *v3;
  NSString *v4;

  switch(a1)
  {
    case 14336:
      result = CFSTR("PTPObjectFormatCodeUnknownImageObject");
      break;
    case 14337:
      result = CFSTR("PTPObjectFormatCodeEXIF_JPEG");
      break;
    case 14338:
      result = CFSTR("PTPObjectFormatCodeTIFF_EP");
      break;
    case 14339:
      result = CFSTR("PTPObjectFormatCodeFlashPix");
      break;
    case 14340:
      result = CFSTR("PTPObjectFormatCodeBMP");
      break;
    case 14341:
      result = CFSTR("PTPObjectFormatCodeCIFF");
      break;
    case 14342:
      result = CFSTR("PTPObjectFormatCodeReserved1");
      break;
    case 14343:
      result = CFSTR("PTPObjectFormatCodeGIF");
      break;
    case 14344:
      result = CFSTR("PTPObjectFormatCodeJFIF");
      break;
    case 14345:
      result = CFSTR("PTPObjectFormatCodePCD");
      break;
    case 14346:
      result = CFSTR("PTPObjectFormatCodePICT");
      break;
    case 14347:
      result = CFSTR("PTPObjectFormatCodePNG");
      break;
    case 14348:
      result = CFSTR("PTPObjectFormatCodeReserved2");
      break;
    case 14349:
      result = CFSTR("PTPObjectFormatCodeTIFF");
      break;
    case 14350:
      result = CFSTR("PTPObjectFormatCodeTIFF_IT");
      break;
    case 14351:
      result = CFSTR("PTPObjectFormatCodeJP2");
      break;
    case 14352:
      result = CFSTR("PTPObjectFormatCodeJPX");
      break;
    default:
      v2 = a1 - 12288;
      v3 = CFSTR("PTPObjectFormatCodeUndefinedNonImageObject");
      switch(v2)
      {
        case 0:
          goto LABEL_40;
        case 1:
          result = CFSTR("PTPObjectFormatCodeAssociation");
          break;
        case 2:
          result = CFSTR("PTPObjectFormatCodeScript");
          break;
        case 3:
          result = CFSTR("PTPObjectFormatCodeExecutable");
          break;
        case 4:
          result = CFSTR("PTPObjectFormatCodeText");
          break;
        case 5:
          result = CFSTR("PTPObjectFormatCodeHTML");
          break;
        case 6:
          result = CFSTR("PTPObjectFormatCodeDPOF");
          break;
        case 7:
          result = CFSTR("PTPObjectFormatCodeAIFF");
          break;
        case 8:
          result = CFSTR("PTPObjectFormatCodeWAV");
          break;
        case 9:
          result = CFSTR("PTPObjectFormatCodeMP3");
          break;
        case 10:
          result = CFSTR("PTPObjectFormatCodeAVI");
          break;
        case 11:
          result = CFSTR("PTPObjectFormatCodeMPEG");
          break;
        case 12:
          result = CFSTR("PTPObjectFormatCodeASF");
          break;
        case 13:
          result = CFSTR("PTPObjectFormatCodeMOV");
          break;
        case 14:
          result = CFSTR("PTPObjectFormatCodeXML");
          break;
        default:
          if (((unint64_t)CFSTR("PTPObjectFormatCodeUndefinedNonImageObject") & 0xF000) == 0xB000)
          {
            v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTPObjectFormatCodeVendorDefined (0x%04X)"), CFSTR("PTPObjectFormatCodeUndefinedNonImageObject"));
          }
          else if (((unint64_t)CFSTR("PTPObjectFormatCodeUndefinedNonImageObject") & 0xF000) == 0x3000)
          {
            v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTPObjectFormatCodeReservedForFuture (0x%04X)"), CFSTR("PTPObjectFormatCodeUndefinedNonImageObject"));
          }
          else
          {
            v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(0x%04X)"), CFSTR("PTPObjectFormatCodeUndefinedNonImageObject"));
          }
          v3 = (__CFString *)objc_claimAutoreleasedReturnValue(v4);
LABEL_40:
          result = v3;
          break;
      }
      break;
  }
  return result;
}

__CFString *sub_100028AF8(uint64_t a1)
{
  NSString *v2;

  if (a1 < 8)
    return *(&off_100049038 + (__int16)a1);
  if ((a1 & 0xF000) == 0x8000)
  {
    v2 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTPAssociationTypeVendorDefined (0x%04X)"), a1);
  }
  else if ((a1 & 0xF000) != 0)
  {
    v2 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(0x%04X)"), a1);
  }
  else
  {
    v2 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTPAssociationTypeReserved (0x%04X)"), a1);
  }
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue(v2);
}

uint64_t sub_100028B8C()
{
  int v0;
  uint64_t result;

  v0 = *__error();
  if (v0 > 28)
  {
    switch(v0)
    {
      case '6':
        result = fprintf(__stderrp, "Error 'ECONNRESET' (%d) occurred in '%s'.\n");
        break;
      case '7':
        result = fprintf(__stderrp, "Error 'ENOBUFS' (%d) occurred in '%s'.\n");
        break;
      case '8':
      case ':':
      case ';':
        goto LABEL_20;
      case '9':
        result = fprintf(__stderrp, "Error 'ENOTCONN' (%d) occurred in '%s'.\n");
        break;
      case '<':
        result = fprintf(__stderrp, "Error 'ETIMEDOUT' (%d) occurred in '%s'.\n");
        break;
      default:
        if (v0 == 29)
        {
          result = fprintf(__stderrp, "Error 'ESPIPE' (%d) occurred in '%s'.\n");
        }
        else if (v0 == 35)
        {
          result = fprintf(__stderrp, "Error 'EAGAIN' (%d) occurred in '%s'.\n");
        }
        else
        {
LABEL_20:
          result = fprintf(__stderrp, "Error %d occurred in '%s'.\n");
        }
        break;
    }
  }
  else
  {
    switch(v0)
    {
      case 4:
        result = fprintf(__stderrp, "Error 'EINTR' (%d) occurred in '%s'.\n");
        break;
      case 5:
        result = fprintf(__stderrp, "Error 'EIO' (%d) occurred in '%s'.\n");
        break;
      case 6:
        result = fprintf(__stderrp, "Error 'ENXIO' (%d) occurred in '%s'.\n");
        break;
      case 9:
        result = fprintf(__stderrp, "Error 'EBADF' (%d) occurred in '%s'.\n");
        break;
      case 12:
        result = fprintf(__stderrp, "Error 'ENOMEM' (%d) occurred in '%s'.\n");
        break;
      case 14:
        result = fprintf(__stderrp, "Error 'EFAULT' (%d) occurred in '%s'.\n");
        break;
      case 21:
        result = fprintf(__stderrp, "Error 'EISDIR' (%d) occurred in '%s'.\n");
        break;
      case 22:
        result = fprintf(__stderrp, "Error 'EINVAL' (%d) occurred in '%s'.\n");
        break;
      default:
        goto LABEL_20;
    }
  }
  return result;
}

void sub_10002984C(id a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = objc_alloc((Class)NSSet);
  v13 = objc_opt_class(NSMutableDictionary);
  v1 = objc_opt_class(NSArray);
  v2 = objc_opt_class(NSURL);
  v3 = objc_opt_class(NSSecurityScopedURLWrapper);
  v4 = objc_opt_class(NSString);
  v5 = objc_opt_class(NSNumber);
  v6 = objc_opt_class(NSDictionary);
  v7 = objc_opt_class(NSData);
  v8 = objc_opt_class(NSXPCListenerEndpoint);
  v9 = objc_opt_class(NSMutableIndexSet);
  v10 = objc_opt_class(NSIndexSet);
  v11 = objc_msgSend(v14, "initWithObjects:", v13, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, objc_opt_class(NSError), 0);
  v12 = (void *)qword_10005F4D8;
  qword_10005F4D8 = (uint64_t)v11;

}

void sub_100029C9C(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "sessionManager"));
  v2 = *(_QWORD *)(a1 + 40);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  objc_msgSend(v4, "addNotifications:toSessionWithConnection:", v2, v3);

}

void sub_100029DA0(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "sessionManager"));
  v2 = *(_QWORD *)(a1 + 40);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  objc_msgSend(v4, "remNotifications:fromSessionWithConnection:", v2, v3);

}

uint64_t start()
{
  void *v0;
  __CFString *v1;
  void *v2;
  void *v3;
  void *v4;
  __CFString *v5;
  NSObject *v6;
  PTPRemoteCameraDeviceManager *v7;
  id v8;
  void *v9;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  void *v14;

  v0 = objc_autoreleasePoolPush();
  __ICOSLogCreate();
  v1 = CFSTR("ptpcamera[D]");
  if ((unint64_t)objc_msgSend(CFSTR("ptpcamera[D]"), "length") >= 0x15)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("ptpcamera[D]"), "substringWithRange:", 0, 18));
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByAppendingString:", CFSTR("..")));

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), CFSTR("Launching ptpcamera [D]")));
  v4 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_retainAutorelease(v1);
    v6 = v4;
    *(_DWORD *)buf = 136446466;
    v12 = -[__CFString UTF8String](v5, "UTF8String");
    v13 = 2114;
    v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  v7 = objc_alloc_init(PTPRemoteCameraDeviceManager);
  -[PTPRemoteCameraDeviceManager startUSBPTPInterfaceNotifications](v7, "startUSBPTPInterfaceNotifications");
  v8 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.ptpcamerad"));
  objc_msgSend(v8, "setDelegate:", v7);
  objc_msgSend(v8, "resume");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
  objc_msgSend(v9, "run");

  objc_autoreleasePoolPop(v0);
  return 0;
}

uint64_t sub_10002BFF8(void *a1)
{
  void *v1;
  uint64_t v2;
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  NSObject *v8;
  uint64_t v9;
  int v11;
  id v12;
  __int16 v13;
  void *v14;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "valueForEntitlement:", CFSTR("com.apple.private.imagecapturecore.authorization_bypass")));
  if (v1
    && (v2 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v1, v2) & 1) != 0)
    && objc_msgSend(v1, "BOOLValue"))
  {
    __ICOSLogCreate();
    v3 = CFSTR("privateBypass");
    if ((unint64_t)objc_msgSend(CFSTR("privateBypass"), "length") >= 0x15)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("privateBypass"), "substringWithRange:", 0, 18));
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("..")));

    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ICAuthorizationBypassEntitlement found")));
    v6 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_retainAutorelease(v3);
      v8 = v6;
      v11 = 136446466;
      v12 = -[__CFString UTF8String](v7, "UTF8String");
      v13 = 2114;
      v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v11, 0x16u);

    }
    v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void sub_10002CEF0(uint64_t a1)
{
  __CFString *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;

  __ICOSLogCreate();
  v2 = CFSTR("getDeviceList");
  if ((unint64_t)objc_msgSend(CFSTR("getDeviceList"), "length") >= 0x15)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("getDeviceList"), "substringWithRange:", 0, 18));
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingString:", CFSTR("..")));

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("requestDeviceListWithOptions:reply")));
  v5 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_retainAutorelease(v2);
    v7 = v5;
    *(_DWORD *)buf = 136446466;
    v22 = -[__CFString UTF8String](v6, "UTF8String");
    v23 = 2114;
    v24 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "remoteCameraDevices", 0));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v14), "deviceContext"));
        objc_msgSend(v8, "addObject:", v15);

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("ICDeviceContexts"));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_10002D1F8(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void (*v20)(void);
  NSString *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  NSObject *v45;
  uint8_t buf[4];
  id v47;
  __int16 v48;
  void *v49;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "remoteDeviceForUUID:", *(_QWORD *)(a1 + 40)));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (!v2)
    goto LABEL_16;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "camera"));

  if (v4)
  {
    __ICOSLogCreate();
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "managedObjectName"));
    if ((unint64_t)objc_msgSend(v5, "length") >= 0x15)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "substringWithRange:", 0, 18));
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingString:", CFSTR("..")));

      v5 = (void *)v7;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("> Existing Device")));
    v9 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_retainAutorelease(v5);
      v11 = v9;
      *(_DWORD *)buf = 136446466;
      v47 = objc_msgSend(v10, "UTF8String");
      v48 = 2114;
      v49 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "uuidString"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("ICInternalDeviceUUID"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "camera"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "endpoint"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("ICDeviceEndpoint"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedName"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("ICDeviceName"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "camera"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "additionalProperties"));

    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "camera"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "additionalProperties"));
      objc_msgSend(v3, "addEntriesFromDictionary:", v19);

    }
    v20 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_21:
    v20();
    goto LABEL_22;
  }
  v21 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "managedObjectName"));
  v22 = objc_alloc(NSClassFromString(v21));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "deviceContext"));
  v24 = objc_msgSend(v22, "initWithDeviceContext:", v23);

  if (!v24)
  {
LABEL_16:
    __ICOSLogCreate();
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "managedObjectName"));
    if ((unint64_t)objc_msgSend(v39, "length") >= 0x15)
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "substringWithRange:", 0, 18));
      v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "stringByAppendingString:", CFSTR("..")));

      v39 = (void *)v41;
    }
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("> Not Found: %@"), *(_QWORD *)(a1 + 40)));
    v43 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v44 = objc_retainAutorelease(v39);
      v45 = v43;
      *(_DWORD *)buf = 136446466;
      v47 = objc_msgSend(v44, "UTF8String");
      v48 = 2114;
      v49 = v42;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    v20 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_21;
  }
  objc_msgSend(v24, "startListening");
  __ICOSLogCreate();
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "managedObjectName"));
  if ((unint64_t)objc_msgSend(v25, "length") >= 0x15)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "substringWithRange:", 0, 18));
    v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "stringByAppendingString:", CFSTR("..")));

    v25 = (void *)v27;
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedName"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("> New Device: %@"), v28));

  v30 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v31 = objc_retainAutorelease(v25);
    v32 = v30;
    *(_DWORD *)buf = 136446466;
    v47 = objc_msgSend(v31, "UTF8String");
    v48 = 2114;
    v49 = v29;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  objc_msgSend(v24, "setDelegate:", *(_QWORD *)(a1 + 32));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "endpoint"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "cameraDictionary"));
  objc_msgSend(v34, "setObject:forKeyedSubscript:", v33, CFSTR("ICDeviceEndpoint"));

  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "uuidString"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "cameraDictionary"));
  objc_msgSend(v36, "setObject:forKeyedSubscript:", v35, CFSTR("ICInternalDeviceUUID"));

  objc_msgSend(v2, "setCamera:", v24);
  v37 = *(_QWORD *)(a1 + 48);
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "cameraDictionary"));
  (*(void (**)(uint64_t, void *))(v37 + 16))(v37, v38);

LABEL_22:
}

void sub_10002DA2C(id a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = objc_alloc((Class)NSSet);
  v13 = objc_opt_class(NSMutableDictionary);
  v1 = objc_opt_class(NSArray);
  v2 = objc_opt_class(NSURL);
  v3 = objc_opt_class(NSSecurityScopedURLWrapper);
  v4 = objc_opt_class(NSString);
  v5 = objc_opt_class(NSNumber);
  v6 = objc_opt_class(NSDictionary);
  v7 = objc_opt_class(NSData);
  v8 = objc_opt_class(NSXPCListenerEndpoint);
  v9 = objc_opt_class(NSMutableIndexSet);
  v10 = objc_opt_class(NSIndexSet);
  v11 = objc_msgSend(v14, "initWithObjects:", v13, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, objc_opt_class(NSError), 0);
  v12 = (void *)qword_10005F4E8;
  qword_10005F4E8 = (uint64_t)v11;

}

void sub_10002E148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002E18C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10002E19C(uint64_t a1)
{

}

void sub_10002E1A4(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v1)
  {
    v2 = *(void **)(a1 + 32);
    v3 = v1;
    objc_msgSend(v3, "removeRemoteManagerConnectionWithProcessIdentifier:", objc_msgSend(v2, "intValue"));

  }
}

time_t sub_10002EAE0(void *a1)
{
  tm v2;

  *(_OWORD *)&v2.tm_isdst = 0u;
  v2.tm_isdst = -1;
  strptime_l((const char *)objc_msgSend(objc_retainAutorelease(a1), "UTF8String", 0, 0, 0, 0, *(_QWORD *)&v2.tm_isdst, 0, 0), "%Y%m%dT%H%M%S.0", &v2, 0);
  return mktime(&v2);
}

void sub_10002FADC()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  sub_100007CE8();
  sub_100007CD8(v1);
  sub_100007CE0();
  sub_100007CB4();
  sub_100007C80();
  sub_100007C6C((void *)&_mh_execute_header, v2, v3, "%{public}20s ! %{public}@", v4, v5, v6, v7, v8);

  sub_100007CA4();
}

void sub_10002FB54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  sub_100007CC0(a1, a2, a3, 4.8752e-34);
  sub_100007C98((void *)&_mh_execute_header, v5, v3, "%{public}20s ! %{public}@", v4);
}

void sub_10002FB90(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_10002FC04(void *a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;

  v5 = objc_retainAutorelease(a1);
  v6 = a2;
  v7 = 136446466;
  v8 = objc_msgSend(v5, "UTF8String");
  v9 = 2114;
  v10 = a3;
  _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}20s ! %{public}@", (uint8_t *)&v7, 0x16u);

}

void sub_10002FCBC(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 136446466;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  sub_100007C98((void *)&_mh_execute_header, a4, a3, "%{public}20s ! %{public}@", (uint8_t *)a3);
}

void sub_10002FD08(void *a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  id v9;
  __int16 v10;
  uint64_t v11;

  v5 = objc_retainAutorelease(a1);
  v6 = a2;
  v8 = 136446466;
  v9 = objc_msgSend(v5, "UTF8String");
  v10 = 2114;
  v11 = a3;
  sub_100007C98((void *)&_mh_execute_header, v6, v7, "%{public}20s ! %{public}@", (uint8_t *)&v8);

}

void sub_10002FDB8(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = objc_retainAutorelease(a1);
  v4 = a2;
  sub_100007CB4();
  sub_100007C80();
  sub_100007C6C((void *)&_mh_execute_header, v5, v6, "%{public}20s ! %{public}@", v7, v8, v9, v10, v11);

  sub_100007CA4();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UTI(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTI");
}

id objc_msgSend_UTTypeWithFilenameExtension_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTTypeWithFilenameExtension:");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend__createSignatureGenerator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createSignatureGenerator");
}

id objc_msgSend_abortPendingIO(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "abortPendingIO");
}

id objc_msgSend_acceptConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "acceptConnection:");
}

id objc_msgSend_accessCapability(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessCapability");
}

id objc_msgSend_addCameraFileToIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addCameraFileToIndex:");
}

id objc_msgSend_addCameraFolderToIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addCameraFolderToIndex:");
}

id objc_msgSend_addCustomKeyword_withIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addCustomKeyword:withIdentifier:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addIndex:");
}

id objc_msgSend_addInitiatedOperation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addInitiatedOperation:");
}

id objc_msgSend_addInteractiveOperation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addInteractiveOperation:");
}

id objc_msgSend_addMediaItemToIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addMediaItemToIndex:");
}

id objc_msgSend_addMobdevProperties_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addMobdevProperties:");
}

id objc_msgSend_addNotifications_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addNotifications:");
}

id objc_msgSend_addNotifications_toSessionWithConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addNotifications:toSessionWithConnection:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addOperation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addOperation:");
}

id objc_msgSend_addRemoteCameraDevice_uuidString_deviceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addRemoteCameraDevice:uuidString:deviceName:");
}

id objc_msgSend_addRemoteManagerConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addRemoteManagerConnection:");
}

id objc_msgSend_addSelectorToInterface_selectorString_origin_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSelectorToInterface:selectorString:origin:");
}

id objc_msgSend_addSubImageDict_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubImageDict:");
}

id objc_msgSend_addTransaction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addTransaction:");
}

id objc_msgSend_addedBundles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addedBundles");
}

id objc_msgSend_additionalProperties(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "additionalProperties");
}

id objc_msgSend_allBundleIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allBundleIdentifiers");
}

id objc_msgSend_allConnections(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allConnections");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allocWithZone:");
}

id objc_msgSend_allowKeepAwake(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowKeepAwake");
}

id objc_msgSend_altThumbnaillForMaxPixelSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "altThumbnaillForMaxPixelSize:");
}

id objc_msgSend_anonymousListener(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "anonymousListener");
}

id objc_msgSend_appendBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendBytes:length:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendString:");
}

id objc_msgSend_appleSerialNumberString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appleSerialNumberString");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayForType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayForType:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "auditToken");
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_blockOperationWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blockOperationWithBlock:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bufMutableBytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bufMutableBytes");
}

id objc_msgSend_bufSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bufSize");
}

id objc_msgSend_bundleIdentifier_stateForAccessType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifier:stateForAccessType:");
}

id objc_msgSend_bundleIdentifiersWithAccessType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifiersWithAccessType:");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_camera(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "camera");
}

id objc_msgSend_cameraDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cameraDictionary");
}

id objc_msgSend_cameraFileWithObjectID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cameraFileWithObjectID:");
}

id objc_msgSend_cameraFolderWithObjectID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cameraFolderWithObjectID:");
}

id objc_msgSend_cameraItemWithObjectID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cameraItemWithObjectID:");
}

id objc_msgSend_cancelAllOperations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelAllOperations");
}

id objc_msgSend_cancelPreviousPerformRequestsWithTarget_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelPreviousPerformRequestsWithTarget:");
}

id objc_msgSend_cancelTimerAndFireBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelTimerAndFireBlock:");
}

id objc_msgSend_capabilitiesForCurrentDeviceWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "capabilitiesForCurrentDeviceWithOptions:");
}

id objc_msgSend_capacity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "capacity");
}

id objc_msgSend_captureDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "captureDate");
}

id objc_msgSend_caseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "caseInsensitiveCompare:");
}

id objc_msgSend_catalogingDone(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "catalogingDone");
}

id objc_msgSend_charValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "charValue");
}

id objc_msgSend_characterSetWithCharactersInString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "characterSetWithCharactersInString:");
}

id objc_msgSend_closeDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "closeDevice");
}

id objc_msgSend_closeDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "closeDevice:");
}

id objc_msgSend_closeFile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "closeFile");
}

id objc_msgSend_closeSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "closeSession");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:");
}

id objc_msgSend_componentsSeparatedByCharactersInSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByCharactersInSet:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_conformsToType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conformsToType:");
}

id objc_msgSend_connected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connected");
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connection");
}

id objc_msgSend_connections(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connections");
}

id objc_msgSend_connectionsMonitoringNotification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionsMonitoringNotification:");
}

id objc_msgSend_containerLength(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containerLength");
}

id objc_msgSend_containerType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containerType");
}

id objc_msgSend_containsIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsIndex:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_content_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "content:");
}

id objc_msgSend_contentForUSB(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentForUSB");
}

id objc_msgSend_contentForUSBUsingBuffer_capacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentForUSBUsingBuffer:capacity:");
}

id objc_msgSend_contentLength_bufferLength_contentType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentLength:bufferLength:contentType:");
}

id objc_msgSend_contentLengthValid_forContentType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentLengthValid:forContentType:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_copyPartialFile_fromOffset_size_to_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyPartialFile:fromOffset:size:to:");
}

id objc_msgSend_copyThumbnailForPixelWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyThumbnailForPixelWidth:");
}

id objc_msgSend_copyToBuffer_numBytes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyToBuffer:numBytes:");
}

id objc_msgSend_copyToWrappedBytes_forTransport_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyToWrappedBytes:forTransport:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createSessionWithConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createSessionWithConnection:");
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentConnection");
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRunLoop");
}

id objc_msgSend_currentSessionCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentSessionCount");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "data");
}

id objc_msgSend_dataExpected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataExpected");
}

id objc_msgSend_dataReceived(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataReceived");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytesNoCopy:length:freeWhenDone:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dateFromString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateFromString:");
}

id objc_msgSend_dateWithTimeIntervalSince1970_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSince1970:");
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeObjectOfClasses:forKey:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_deleteFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteFile:");
}

id objc_msgSend_deniedBundles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deniedBundles");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_deviceAccessQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceAccessQueue");
}

id objc_msgSend_deviceContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceContext");
}

id objc_msgSend_deviceDateTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceDateTime");
}

id objc_msgSend_deviceInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceInfo");
}

id objc_msgSend_deviceIsEnumerating(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceIsEnumerating");
}

id objc_msgSend_deviceIsPairedWithThisHost(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceIsPairedWithThisHost");
}

id objc_msgSend_deviceIsPasscodeLocked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceIsPasscodeLocked");
}

id objc_msgSend_deviceOperationQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceOperationQueue");
}

id objc_msgSend_deviceProductID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceProductID");
}

id objc_msgSend_devicePropertiesSupported(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "devicePropertiesSupported");
}

id objc_msgSend_deviceSerialNumberString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceSerialNumberString");
}

id objc_msgSend_deviceVendorID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceVendorID");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObject:forKey:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dictionaryWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjectsAndKeys:");
}

id objc_msgSend_displayAlertForApplication_withNotification_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayAlertForApplication:withNotification:completionBlock:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_dpOffset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dpOffset");
}

id objc_msgSend_endpoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endpoint");
}

id objc_msgSend_enumerateContent_withOrder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateContent:withOrder:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumerationOrder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerationOrder");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_eventCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventCode");
}

id objc_msgSend_eventQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventQueue");
}

id objc_msgSend_executeTransaction_timeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "executeTransaction:timeout:");
}

id objc_msgSend_exifCreationDateTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exifCreationDateTime");
}

id objc_msgSend_exifModificationDateTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exifModificationDateTime");
}

id objc_msgSend_externalMediaAccessDB(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "externalMediaAccessDB");
}

id objc_msgSend_fetchFullMetadata(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchFullMetadata");
}

id objc_msgSend_fileDescriptor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileDescriptor");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileHandleForReadingFromURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileHandleForReadingFromURL:error:");
}

id objc_msgSend_fileSystemManifestForStorage_objectFormatCode_association_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSystemManifestForStorage:objectFormatCode:association:");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSystemRepresentation");
}

id objc_msgSend_filename(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filename");
}

id objc_msgSend_filepath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filepath");
}

id objc_msgSend_fingerprint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fingerprint");
}

id objc_msgSend_fingerprintForData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fingerprintForData:error:");
}

id objc_msgSend_fingerprintForFD_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fingerprintForFD:error:");
}

id objc_msgSend_fingerprintWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fingerprintWithError:");
}

id objc_msgSend_fixupFileHandleError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fixupFileHandleError:");
}

id objc_msgSend_getBytes_maxLength_usedLength_encoding_options_range_remainingRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:");
}

id objc_msgSend_getTransaction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getTransaction:");
}

id objc_msgSend_handleBulkData_result_forTxID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleBulkData:result:forTxID:");
}

id objc_msgSend_handleInterruptData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleInterruptData:");
}

id objc_msgSend_headerOffsetBytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "headerOffsetBytes");
}

id objc_msgSend_holdPowerAssertion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "holdPowerAssertion");
}

id objc_msgSend_iCloudPhotosEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iCloudPhotosEnabled");
}

id objc_msgSend_iCloudPhotosOptimizeStorageState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iCloudPhotosOptimizeStorageState");
}

id objc_msgSend_icUnarchivedObjectFromData_withKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "icUnarchivedObjectFromData:withKey:");
}

id objc_msgSend_icWhitelistedClasses(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "icWhitelistedClasses");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_imageBitDepth(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageBitDepth");
}

id objc_msgSend_imageHeight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageHeight");
}

id objc_msgSend_imageIOSupported(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageIOSupported");
}

id objc_msgSend_imageInspectMetadata(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageInspectMetadata");
}

id objc_msgSend_imageOrientation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageOrientation");
}

id objc_msgSend_imagePixHeight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imagePixHeight");
}

id objc_msgSend_imagePixWidth(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imagePixWidth");
}

id objc_msgSend_imageScrapeAllocatedData_length_bufferOffset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageScrapeAllocatedData:length:bufferOffset:");
}

id objc_msgSend_imageValidateSubImage_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageValidateSubImage:error:");
}

id objc_msgSend_imageWidth(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageWidth");
}

id objc_msgSend_immediateMatch(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "immediateMatch");
}

id objc_msgSend_increaseLengthBy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "increaseLengthBy:");
}

id objc_msgSend_indexOfObject_inSortedRange_options_usingComparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexOfObject:inSortedRange:options:usingComparator:");
}

id objc_msgSend_indexSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexSet");
}

id objc_msgSend_indexedFiles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexedFiles");
}

id objc_msgSend_indexedFolders(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexedFolders");
}

id objc_msgSend_indexedMediaSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexedMediaSet");
}

id objc_msgSend_info(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "info");
}

id objc_msgSend_initForReadingFromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initForReadingFromData:error:");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleIdentifier:allowPlaceholder:error:");
}

id objc_msgSend_initWithBytes_capacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBytes:capacity:");
}

id objc_msgSend_initWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBytes:length:");
}

id objc_msgSend_initWithBytes_length_contentType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBytes:length:contentType:");
}

id objc_msgSend_initWithBytesNoCopy_length_encoding_freeWhenDone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBytesNoCopy:length:encoding:freeWhenDone:");
}

id objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBytesNoCopy:length:freeWhenDone:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithChar_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithChar:");
}

id objc_msgSend_initWithConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithConnection:");
}

id objc_msgSend_initWithDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDelegate:");
}

id objc_msgSend_initWithDeviceContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDeviceContext:");
}

id objc_msgSend_initWithHostLocationID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithHostLocationID:");
}

id objc_msgSend_initWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithInt:");
}

id objc_msgSend_initWithLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLength:");
}

id objc_msgSend_initWithLocationID_delegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLocationID:delegate:");
}

id objc_msgSend_initWithLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLongLong:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithMutableData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMutableData:");
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithObjects:");
}

id objc_msgSend_initWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithObjectsAndKeys:");
}

id objc_msgSend_initWithOperationCode_transactionID_andData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithOperationCode:transactionID:andData:");
}

id objc_msgSend_initWithOperationCode_transactionID_dataPhaseInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithOperationCode:transactionID:dataPhaseInfo:");
}

id objc_msgSend_initWithOperationCode_transactionID_dataPhaseInfo_parameter1_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithOperationCode:transactionID:dataPhaseInfo:parameter1:");
}

id objc_msgSend_initWithOperationCode_transactionID_dataPhaseInfo_parameter1_parameter2_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithOperationCode:transactionID:dataPhaseInfo:parameter1:parameter2:");
}

id objc_msgSend_initWithOperationCode_transactionID_dataPhaseInfo_parameter1_parameter2_parameter3_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithOperationCode:transactionID:dataPhaseInfo:parameter1:parameter2:parameter3:");
}

id objc_msgSend_initWithOperationCode_transactionID_dataPhaseInfo_parameter1_parameter2_parameter3_parameter4_parameter5_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithOperationCode:transactionID:dataPhaseInfo:parameter1:parameter2:parameter3:parameter4:parameter5:");
}

id objc_msgSend_initWithOperationRequestPacket_txData_rxData_dataExpected_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithOperationRequestPacket:txData:rxData:dataExpected:");
}

id objc_msgSend_initWithPrimaryIdentifierString_uuidString_localizedName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPrimaryIdentifierString:uuidString:localizedName:");
}

id objc_msgSend_initWithResponseCode_transactionID_parameter1_parameter2_parameter3_parameter4_parameter5_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithResponseCode:transactionID:parameter1:parameter2:parameter3:parameter4:parameter5:");
}

id objc_msgSend_initWithShort_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithShort:");
}

id objc_msgSend_initWithStorageID_initiator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStorageID:initiator:");
}

id objc_msgSend_initWithStorageID_objHandle_parent_initiator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStorageID:objHandle:parent:initiator:");
}

id objc_msgSend_initWithStorageID_ptpObjectInfo_objHandle_parent_initiator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStorageID:ptpObjectInfo:objHandle:parent:initiator:");
}

id objc_msgSend_initWithTransactionID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTransactionID:");
}

id objc_msgSend_initWithTypes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTypes:");
}

id objc_msgSend_initWithUSBBuffer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUSBBuffer:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_initWithUnsignedChar_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUnsignedChar:");
}

id objc_msgSend_initWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUnsignedInt:");
}

id objc_msgSend_initWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUnsignedLongLong:");
}

id objc_msgSend_initWithUnsignedShort_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUnsignedShort:");
}

id objc_msgSend_initiator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initiator");
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertObject:atIndex:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_interestedInNotification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interestedInNotification:");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_internalUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "internalUUID");
}

id objc_msgSend_intervalSince1970(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intervalSince1970");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_invalidationHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidationHandler");
}

id objc_msgSend_isAccessRestrictedAppleDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAccessRestrictedAppleDevice");
}

id objc_msgSend_isAppleDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAppleDevice");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isMemberOfClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMemberOfClass:");
}

id objc_msgSend_itemForObjectHandle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "itemForObjectHandle:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_listener(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "listener");
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedName");
}

id objc_msgSend_locationID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "locationID");
}

id objc_msgSend_locked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "locked");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longLongValue");
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longValue");
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lowercaseString");
}

id objc_msgSend_managedObjectName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "managedObjectName");
}

id objc_msgSend_mediaItemCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mediaItemCount");
}

id objc_msgSend_mediaItemType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mediaItemType");
}

id objc_msgSend_mediaItemWithHandle_inTypes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mediaItemWithHandle:inTypes:");
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "metadata");
}

id objc_msgSend_metadataFromFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "metadataFromFile:");
}

id objc_msgSend_metadataWithOptions_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "metadataWithOptions:reply:");
}

id objc_msgSend_mobdevPropertiesBrowser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mobdevPropertiesBrowser");
}

id objc_msgSend_mobdevPropertiesQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mobdevPropertiesQueue");
}

id objc_msgSend_mobdevProps(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mobdevProps");
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "model");
}

id objc_msgSend_modificationDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modificationDate");
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableBytes");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_newFolderWithObjectInfo_inFolder_notify_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newFolderWithObjectInfo:inFolder:notify:");
}

id objc_msgSend_newItemWithObjectInfo_notify_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newItemWithObjectInfo:notify:");
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextObject");
}

id objc_msgSend_notifyAddedDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyAddedDevice:");
}

id objc_msgSend_notifyClientDeviceAdded_uuidString_deviceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyClientDeviceAdded:uuidString:deviceName:");
}

id objc_msgSend_notifyClientDeviceRemoved_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyClientDeviceRemoved:");
}

id objc_msgSend_notifyDeviceReady_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyDeviceReady:");
}

id objc_msgSend_notifyRemovedDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyRemovedDevice:");
}

id objc_msgSend_numParameters(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numParameters");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithChar_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithChar:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithLong:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithShort_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithShort:");
}

id objc_msgSend_numberWithUnsignedChar_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedChar:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLong:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_numberWithUnsignedShort_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedShort:");
}

id objc_msgSend_objHandle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objHandle");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectCompressedSize64(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectCompressedSize64");
}

id objc_msgSend_objectCompressedSize64_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectCompressedSize64:");
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectEnumerator");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectFormat(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectFormat");
}

id objc_msgSend_objectHandle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectHandle");
}

id objc_msgSend_objectHandlesInStorage_objectFormatCode_association_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectHandlesInStorage:objectFormatCode:association:");
}

id objc_msgSend_objectInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectInfo:");
}

id objc_msgSend_objectInfoDatasetForNextObjectGroupInStorage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectInfoDatasetForNextObjectGroupInStorage:");
}

id objc_msgSend_objectInfoDatasetForObjectsInStorage_objectFormatCode_association_contentType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectInfoDatasetForObjectsInStorage:objectFormatCode:association:contentType:");
}

id objc_msgSend_opaqueRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "opaqueRepresentation");
}

id objc_msgSend_openDB_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openDB:");
}

id objc_msgSend_openSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openSession");
}

id objc_msgSend_operationCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "operationCode");
}

id objc_msgSend_operationsSupported(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "operationsSupported");
}

id objc_msgSend_orderAscending(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "orderAscending");
}

id objc_msgSend_orderedSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "orderedSet");
}

id objc_msgSend_osTransactions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "osTransactions");
}

id objc_msgSend_parameter1(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parameter1");
}

id objc_msgSend_parameter2(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parameter2");
}

id objc_msgSend_parameter3(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parameter3");
}

id objc_msgSend_parameter4(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parameter4");
}

id objc_msgSend_parameter5(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parameter5");
}

id objc_msgSend_parentObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parentObject");
}

id objc_msgSend_partialDataFromFile_fromOffset_maxSize_actualSize_useBuffer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "partialDataFromFile:fromOffset:maxSize:actualSize:useBuffer:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathExtension");
}

id objc_msgSend_performSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performSelector:");
}

id objc_msgSend_performSelector_withObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performSelector:withObject:");
}

id objc_msgSend_performSelector_withObject_afterDelay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performSelector:withObject:afterDelay:");
}

id objc_msgSend_performSelectorOnMainThread_withObject_waitUntilDone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performSelectorOnMainThread:withObject:waitUntilDone:");
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pid");
}

id objc_msgSend_preflightCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preflightCount");
}

id objc_msgSend_previewThumbnail(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "previewThumbnail");
}

id objc_msgSend_primaryIdentifierString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "primaryIdentifierString");
}

id objc_msgSend_prime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prime");
}

id objc_msgSend_prioritizeSpeed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prioritizeSpeed");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processIdentifier");
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processInfo");
}

id objc_msgSend_processMetadata_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processMetadata:");
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processName");
}

id objc_msgSend_productID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "productID");
}

id objc_msgSend_protectionStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "protectionStatus");
}

id objc_msgSend_ptpObjectCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ptpObjectCount");
}

id objc_msgSend_range(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "range");
}

id objc_msgSend_rawImageSupported(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rawImageSupported");
}

id objc_msgSend_read_length_offset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "read:length:offset:");
}

id objc_msgSend_readInterruptData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readInterruptData");
}

id objc_msgSend_readResponseData_withTimeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readResponseData:withTimeout:");
}

id objc_msgSend_readStorages(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readStorages");
}

id objc_msgSend_readStream_size_offset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readStream:size:offset:");
}

id objc_msgSend_refreshAssignedDeviceName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "refreshAssignedDeviceName");
}

id objc_msgSend_refreshInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "refreshInfo");
}

id objc_msgSend_relatedUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "relatedUUID");
}

id objc_msgSend_releasePowerAssertion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "releasePowerAssertion");
}

id objc_msgSend_remNotifications_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remNotifications:");
}

id objc_msgSend_remNotifications_fromSessionWithConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remNotifications:fromSessionWithConnection:");
}

id objc_msgSend_remoteCameraDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteCameraDevices");
}

id objc_msgSend_remoteDeviceForPrimaryIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteDeviceForPrimaryIdentifier:");
}

id objc_msgSend_remoteDeviceForUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteDeviceForUUID:");
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeAllSessions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllSessions");
}

id objc_msgSend_removeCameraFileFromIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeCameraFileFromIndex:");
}

id objc_msgSend_removeMediaItemFromIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeMediaItemFromIndex:");
}

id objc_msgSend_removeMediaItemWithHandleFromIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeMediaItemWithHandleFromIndex:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectsInArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectsInArray:");
}

id objc_msgSend_removeRemoteCameraDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeRemoteCameraDevice:");
}

id objc_msgSend_removeRemoteManagerConnectionWithProcessIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeRemoteManagerConnectionWithProcessIdentifier:");
}

id objc_msgSend_removeSessionWithConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeSessionWithConnection:");
}

id objc_msgSend_removeSessionsWithProcessIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeSessionsWithProcessIdentifier:");
}

id objc_msgSend_removeTransaction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeTransaction:");
}

id objc_msgSend_requestPacket(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestPacket");
}

id objc_msgSend_requestPending(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestPending");
}

id objc_msgSend_resetDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetDevice");
}

id objc_msgSend_responseCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "responseCode");
}

id objc_msgSend_responsePacket(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "responsePacket");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reverseObjectEnumerator");
}

id objc_msgSend_revokeBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "revokeBundleIdentifier:");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}

id objc_msgSend_rxCopyDataBuffer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rxCopyDataBuffer");
}

id objc_msgSend_rxDataBuffer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rxDataBuffer");
}

id objc_msgSend_rxDataMutableBytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rxDataMutableBytes");
}

id objc_msgSend_sendAddedItemsNotification_toConnections_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendAddedItemsNotification:toConnections:");
}

id objc_msgSend_sendContentsNotificationWithOrder_toConnections_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendContentsNotificationWithOrder:toConnections:");
}

id objc_msgSend_sendData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendData:");
}

id objc_msgSend_sendHostMediaCapabilities(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendHostMediaCapabilities");
}

id objc_msgSend_sendHostSupportsGroupNotifications(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendHostSupportsGroupNotifications");
}

id objc_msgSend_sendNotification_toConnections_selector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendNotification:toConnections:selector:");
}

id objc_msgSend_sendPTPCommand_andPayload_withReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendPTPCommand:andPayload:withReply:");
}

id objc_msgSend_sendPTPEventNotification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendPTPEventNotification:");
}

id objc_msgSend_sendRemovedItemsNotification_toConnections_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendRemovedItemsNotification:toConnections:");
}

id objc_msgSend_sendRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendRequest:");
}

id objc_msgSend_sendStatusNotification_toConnections_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendStatusNotification:toConnections:");
}

id objc_msgSend_sendTransaction_timeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendTransaction:timeout:");
}

id objc_msgSend_sendUpdatedItemsNotification_toConnections_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendUpdatedItemsNotification:toConnections:");
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serialNumber");
}

id objc_msgSend_sessionManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionManager");
}

id objc_msgSend_sessionManagerDidCloseAllSessions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionManagerDidCloseAllSessions:");
}

id objc_msgSend_sessionOpen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionOpen");
}

id objc_msgSend_sessionWithConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionWithConnection:");
}

id objc_msgSend_sessions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessions");
}

id objc_msgSend_setBytesTransferred_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBytesTransferred:");
}

id objc_msgSend_setCamera_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCamera:");
}

id objc_msgSend_setCancelOp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCancelOp:");
}

id objc_msgSend_setCatalogingDone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCatalogingDone:");
}

id objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setConnected_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnected:");
}

id objc_msgSend_setConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnection:");
}

id objc_msgSend_setContainerLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContainerLength:");
}

id objc_msgSend_setContainerType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContainerType:");
}

id objc_msgSend_setContent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContent:");
}

id objc_msgSend_setDataExpected_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDataExpected:");
}

id objc_msgSend_setDataPhaseInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDataPhaseInfo:");
}

id objc_msgSend_setDataReceived_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDataReceived:");
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDateFormat:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDeviceFinishedEnumerating(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceFinishedEnumerating");
}

id objc_msgSend_setDeviceIsEnumerating(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceIsEnumerating");
}

id objc_msgSend_setDeviceIsEnumerating_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceIsEnumerating:");
}

id objc_msgSend_setDeviceIsPairedWithThisHost_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceIsPairedWithThisHost:");
}

id objc_msgSend_setDeviceIsPasscodeLocked_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceIsPasscodeLocked:");
}

id objc_msgSend_setDeviceProductID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceProductID:");
}

id objc_msgSend_setDevicePropertyValue_forProperty_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDevicePropertyValue:forProperty:");
}

id objc_msgSend_setDeviceSerialNumberString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceSerialNumberString:");
}

id objc_msgSend_setDeviceVendorID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceVendorID:");
}

id objc_msgSend_setDpOffset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDpOffset:");
}

id objc_msgSend_setEnumerationOrder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnumerationOrder:");
}

id objc_msgSend_setExifCreationDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExifCreationDate:");
}

id objc_msgSend_setExifCreationDateTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExifCreationDateTime:");
}

id objc_msgSend_setExifModificationDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExifModificationDate:");
}

id objc_msgSend_setExifModificationDateTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExifModificationDateTime:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setFingerprint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFingerprint:");
}

id objc_msgSend_setHasThumbnail_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHasThumbnail:");
}

id objc_msgSend_setHeaderOffset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHeaderOffset:");
}

id objc_msgSend_setImageHeight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImageHeight:");
}

id objc_msgSend_setImageOrientation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImageOrientation:");
}

id objc_msgSend_setImagePixHeight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImagePixHeight:");
}

id objc_msgSend_setImagePixWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImagePixWidth:");
}

id objc_msgSend_setImageWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImageWidth:");
}

id objc_msgSend_setInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInfo:");
}

id objc_msgSend_setInitiator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInitiator:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setKeywords_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setKeywords:");
}

id objc_msgSend_setLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLength:");
}

id objc_msgSend_setListener_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setListener:");
}

id objc_msgSend_setLocalizedName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocalizedName:");
}

id objc_msgSend_setManagedObjectName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setManagedObjectName:");
}

id objc_msgSend_setMaxConcurrentOperationCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaxConcurrentOperationCount:");
}

id objc_msgSend_setMetadata_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMetadata:");
}

id objc_msgSend_setMobdevPropertiesBrowser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMobdevPropertiesBrowser:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNeedToReopenSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedToReopenSession:");
}

id objc_msgSend_setNumParameters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumParameters:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setObjectCompressedSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObjectCompressedSize:");
}

id objc_msgSend_setObjectHandle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObjectHandle:");
}

id objc_msgSend_setObjectInfoArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObjectInfoArray:");
}

id objc_msgSend_setOpenSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOpenSession:");
}

id objc_msgSend_setOrderAscending_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOrderAscending:");
}

id objc_msgSend_setPreviewThumbnail_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreviewThumbnail:");
}

id objc_msgSend_setPrioritizeSpeed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPrioritizeSpeed:");
}

id objc_msgSend_setProductID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProductID:");
}

id objc_msgSend_setQualityOfService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQualityOfService:");
}

id objc_msgSend_setQueuePriority_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQueuePriority:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setRequestPending_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRequestPending:");
}

id objc_msgSend_setResponsePacket_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResponsePacket:");
}

id objc_msgSend_setSessionOpen_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSessionOpen:");
}

id objc_msgSend_setSizeAndOrientationFromImageProperties_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSizeAndOrientationFromImageProperties:");
}

id objc_msgSend_setSmallThumbnail_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSmallThumbnail:");
}

id objc_msgSend_setSubImages_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSubImages:");
}

id objc_msgSend_setSystemDaemon_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSystemDaemon:");
}

id objc_msgSend_setThmOffset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setThmOffset:");
}

id objc_msgSend_setThmSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setThmSize:");
}

id objc_msgSend_setTimedOut_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimedOut:");
}

id objc_msgSend_setTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimer:");
}

id objc_msgSend_setTransactionID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTransactionID:");
}

id objc_msgSend_setTxComplete_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTxComplete:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setType:");
}

id objc_msgSend_setUTI_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUTI:");
}

id objc_msgSend_setUnderlyingQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUnderlyingQueue:");
}

id objc_msgSend_setUpdatedBasicMetadata_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpdatedBasicMetadata:");
}

id objc_msgSend_setUpdatedExpensiveMetadata_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpdatedExpensiveMetadata:");
}

id objc_msgSend_setUsbSerialNumberString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUsbSerialNumberString:");
}

id objc_msgSend_setUserAssignedDeviceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserAssignedDeviceName:");
}

id objc_msgSend_setUuidString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUuidString:");
}

id objc_msgSend_setVendorID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVendorID:");
}

id objc_msgSend_sharedAccessManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedAccessManager");
}

id objc_msgSend_shortValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shortValue");
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "size");
}

id objc_msgSend_smallThumbnail(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "smallThumbnail");
}

id objc_msgSend_smallestEncoding(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "smallestEncoding");
}

id objc_msgSend_sortedArrayUsingSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingSelector:");
}

id objc_msgSend_standardVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardVersion");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "start");
}

id objc_msgSend_startInitiator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startInitiator");
}

id objc_msgSend_startListening(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startListening");
}

id objc_msgSend_startTimerWithInterval_andFireBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startTimerWithInterval:andFireBlock:");
}

id objc_msgSend_startUSBPTPInterfaceNotifications(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startUSBPTPInterfaceNotifications");
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stop");
}

id objc_msgSend_storage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storage");
}

id objc_msgSend_storageForStorageID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storageForStorageID:");
}

id objc_msgSend_storageID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storageID");
}

id objc_msgSend_storageIDs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storageIDs");
}

id objc_msgSend_storageInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storageInfo:");
}

id objc_msgSend_storages(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storages");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_subImageDictForPixelWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subImageDictForPixelWidth:");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_thmSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "thmSize");
}

id objc_msgSend_thumbCompressedSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "thumbCompressedSize");
}

id objc_msgSend_thumbDataFromFile_maxPixelSize_actualSize_useBuffer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "thumbDataFromFile:maxPixelSize:actualSize:useBuffer:");
}

id objc_msgSend_thumbDataFromFile_maxSize_actualSize_useBuffer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "thumbDataFromFile:maxSize:actualSize:useBuffer:");
}

id objc_msgSend_thumbnailDataWithOptions_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "thumbnailDataWithOptions:reply:");
}

id objc_msgSend_thumbnailForPixelWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "thumbnailForPixelWidth:");
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSince1970");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceNow");
}

id objc_msgSend_timedOut(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timedOut");
}

id objc_msgSend_timer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timer");
}

id objc_msgSend_timerQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timerQueue");
}

id objc_msgSend_transactionID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transactionID");
}

id objc_msgSend_transactions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transactions");
}

id objc_msgSend_transport(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transport");
}

id objc_msgSend_txComplete(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "txComplete");
}

id objc_msgSend_txDataPacket(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "txDataPacket");
}

id objc_msgSend_txID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "txID");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "type");
}

id objc_msgSend_typeWithFilenameExtension_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "typeWithFilenameExtension:");
}

id objc_msgSend_unlinkWhenDone(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unlinkWhenDone");
}

id objc_msgSend_unsignedCharValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedCharValue");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongLongValue");
}

id objc_msgSend_unsignedShortValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedShortValue");
}

id objc_msgSend_updateBundleIdentifier_accessType_withState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateBundleIdentifier:accessType:withState:");
}

id objc_msgSend_updateCatalogingDone(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateCatalogingDone");
}

id objc_msgSend_updateContent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateContent");
}

id objc_msgSend_updateMobdevProps(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateMobdevProps");
}

id objc_msgSend_updatePropertiesOfMobileDeviceWithLocationID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updatePropertiesOfMobileDeviceWithLocationID:");
}

id objc_msgSend_updatedBasicMetadata(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updatedBasicMetadata");
}

id objc_msgSend_updatedExpensiveMetadata(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updatedExpensiveMetadata");
}

id objc_msgSend_usbSerialNumberString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "usbSerialNumberString");
}

id objc_msgSend_userAssignedDeviceName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userAssignedDeviceName");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_uuidString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uuidString");
}

id objc_msgSend_uuidStringForDeviceProperties_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uuidStringForDeviceProperties:");
}

id objc_msgSend_validateBundleIdentifierInstalled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateBundleIdentifierInstalled:");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_vendorExtensionDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vendorExtensionDescription");
}

id objc_msgSend_vendorID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vendorID");
}

id objc_msgSend_waitUntilAllOperationsAreFinished(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitUntilAllOperationsAreFinished");
}

id objc_msgSend_wrappedBytesWithBytes_capacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wrappedBytesWithBytes:capacity:");
}

id objc_msgSend_wrappedBytesWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wrappedBytesWithCapacity:");
}

id objc_msgSend_writeBulkData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeBulkData:");
}
