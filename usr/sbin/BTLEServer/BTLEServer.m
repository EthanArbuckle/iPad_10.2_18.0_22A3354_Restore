void sub_1000073E4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_100007470(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void sub_100007484(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

id sub_100007498(id a1)
{
  return a1;
}

id sub_1000074A0(id a1)
{
  return a1;
}

uint64_t sub_1000074A8()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1000074B4()
{
  uint64_t v0;

  return v0;
}

void sub_100007590(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000079D8(id a1)
{
  NSArray *v1;
  void *v2;

  v1 = objc_opt_new(NSArray);
  v2 = (void *)qword_1000C8FD0;
  qword_1000C8FD0 = (uint64_t)v1;

}

void sub_100008580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100008D04(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_100069B00(a1, v5, v4);
  }

}

void sub_1000090E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000910C(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  const char *v11;
  __CFString *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  __CFString *v20;

  v5 = a3;
  v6 = (id)qword_1000C9178;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "peripheral"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "identifier"));
    if (a2)
      v11 = "OK";
    else
      v11 = "FAILED - ";
    if ((a2 & 1) != 0)
      v12 = &stru_1000AE858;
    else
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
    v13 = 138413058;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    v17 = 2082;
    v18 = v11;
    v19 = 2112;
    v20 = v12;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Finished data collection on “%@” for %@: %{public}s%@", (uint8_t *)&v13, 0x2Au);
    if ((a2 & 1) == 0)

  }
}

void sub_100009A5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_100009EFC(uint64_t a1)
{
  Class result;
  __int128 v3;
  uint64_t v4;

  if (!qword_1000C8FE8)
  {
    v3 = off_1000AD1E8;
    v4 = 0;
    qword_1000C8FE8 = _sl_dlopen(&v3, 0);
  }
  result = objc_getClass("HKQuantityType");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  qword_1000C8FE0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_100009FB0(uint64_t a1)
{
  Class result;
  __int128 v3;
  uint64_t v4;

  if (!qword_1000C8FE8)
  {
    v3 = off_1000AD1E8;
    v4 = 0;
    qword_1000C8FE8 = _sl_dlopen(&v3, 0);
  }
  result = objc_getClass("HKQuantity");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  qword_1000C8FF0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_10000A064(uint64_t a1)
{
  Class result;
  __int128 v3;
  uint64_t v4;

  if (!qword_1000C8FE8)
  {
    v3 = off_1000AD1E8;
    v4 = 0;
    qword_1000C8FE8 = _sl_dlopen(&v3, 0);
  }
  result = objc_getClass("HKQuantityDatum");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  qword_1000C8FF8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_10000A118(uint64_t a1)
{
  Class result;
  __int128 v3;
  uint64_t v4;

  if (!qword_1000C8FE8)
  {
    v3 = off_1000AD1E8;
    v4 = 0;
    qword_1000C8FE8 = _sl_dlopen(&v3, 0);
  }
  result = objc_getClass("HKDevice");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  qword_1000C9000 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_10000A1CC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

id sub_10000AB54(void *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
    sub_100069E04(v2, v3, v4, v5, v6, v7, v8, v9);
  return objc_msgSend(a1, "notifyDidStop");
}

void sub_10000ADCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000ADF0(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  id v29;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v29 = WeakRetained;
    if (byte_1000C9170)
    {
      kdebug_trace(730595468, objc_msgSend(WeakRetained, "instanceID"), 0, 0, 0);
      WeakRetained = v29;
    }
    v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "groupInit"));
    dispatch_group_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "groupStart"));
    dispatch_group_wait(v4, 0xFFFFFFFFFFFFFFFFLL);

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "deviceManagement"));
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "deviceManagement"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "queue"));
      IOHIDUserDeviceUnscheduleFromDispatchQueue(v6, v7);

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "touch"));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "touch"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "queue"));
      IOHIDUserDeviceUnscheduleFromDispatchQueue(v9, v10);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "buttons"));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "buttons"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "queue"));
      IOHIDUserDeviceUnscheduleFromDispatchQueue(v12, v13);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "inertial"));

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "inertial"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "queue"));
      IOHIDUserDeviceUnscheduleFromDispatchQueue(v15, v16);

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "infrared"));

    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "infrared"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "queue"));
      IOHIDUserDeviceUnscheduleFromDispatchQueue(v18, v19);

    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "audio"));

    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "audio"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "queue"));
      IOHIDUserDeviceUnscheduleFromDispatchQueue(v21, v22);

    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "radio"));

    if (v23)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "radio"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "queue"));
      IOHIDUserDeviceUnscheduleFromDispatchQueue(v24, v25);

    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "proximity"));

    if (v26)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "proximity"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "queue"));
      IOHIDUserDeviceUnscheduleFromDispatchQueue(v27, v28);

    }
    objc_msgSend(v29, "clearAppleMultitouchDeviceNotification");
    objc_msgSend(v29, "clearDeviceManagementNotification");
    objc_msgSend(v29, "clearButtonInterestNotification");
    if (objc_msgSend(v29, "notificationPort"))
    {
      IONotificationPortDestroy((IONotificationPortRef)objc_msgSend(v29, "notificationPort"));
      objc_msgSend(v29, "setNotificationPort:", 0);
    }
    objc_msgSend(v29, "setQueue:", 0);
    WeakRetained = v29;
    if (byte_1000C9170)
    {
      kdebug_trace(730595472, objc_msgSend(*(id *)(a1 + 32), "instanceID"), 0, 0, 0);
      WeakRetained = v29;
    }
  }

}

void sub_10000B584(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000B598(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
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
  id v20;

  if (byte_1000C9170)
    kdebug_trace(730595336, objc_msgSend(*(id *)(a1 + 32), "instanceID"), 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "properties"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[HIDAppleSiriRemoteDevice getButtonsHIDReportDescriptor:](HIDAppleSiriRemoteDevice, "getButtonsHIDReportDescriptor:", objc_msgSend(*(id *)(a1 + 32), "productID")));
  v20 = (id)objc_claimAutoreleasedReturnValue(+[HIDAppleSiriRemoteDevice properties:locationIdOffset:hidDescriptor:extendedData:](HIDAppleSiriRemoteDevice, "properties:locationIdOffset:hidDescriptor:extendedData:", v2, 2, v3, 0));

  v4 = (void *)IOHIDUserDeviceCreateWithOptions(kCFAllocatorDefault, v20, 1);
  objc_msgSend(*(id *)(a1 + 32), "setButtons:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "buttons"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "buttons"));
    v7 = IOHIDUserDeviceCopyService();

    if ((_DWORD)v7)
    {
      if (!IOServiceAddInterestNotification((IONotificationPortRef)objc_msgSend(*(id *)(a1 + 32), "notificationPort"), v7, "IOGeneralInterest", (IOServiceInterestCallback)sub_10000B87C, *(void **)(a1 + 32), (io_object_t *)(*(_QWORD *)(a1 + 32) + 60)))objc_msgSend(*(id *)(a1 + 32), "verifyButtonDriverOpenedByEventSystem:", v7);
      IOObjectRelease(v7);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "buttons"));
    IOHIDUserDeviceRegisterGetReportWithReturnLengthCallback(v8, sub_10000B898, *(_QWORD *)(a1 + 32));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "buttons"));
    IOHIDUserDeviceRegisterSetReportCallback(v9, sub_10000B8B4, *(_QWORD *)(a1 + 32));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "buttons"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
    IOHIDUserDeviceScheduleWithDispatchQueue(v10, v11);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[DoAPAudioRelayHub instance](DoAPAudioRelayHub, "instance"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peripheral"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "UUIDString"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "properties"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "relayWithIdentifier:deviceType:properties:codecType:", v15, 1, v16, 0));
  objc_msgSend(*(id *)(a1 + 32), "setDoapAudioRelay:", v17);

  v18 = *(void **)(a1 + 32);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "doapAudioRelay"));
  objc_msgSend(v19, "setDelegate:", v18);

  if (byte_1000C9170)
    kdebug_trace(730595340, objc_msgSend(*(id *)(a1 + 32), "instanceID"), 0, 0, 0);

}

void *sub_10000B87C(void *a1, const char *a2, int a3)
{
  if (a3 == -536870608)
    return objc_msgSend(a1, "verifyButtonDriverOpenedByEventSystem:", a2);
  return a1;
}

id sub_10000B898(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(a1, "getReport:reportLength:reportID:reportType:keyholeID:", a4, a5, a3, a2, 240);
}

id sub_10000B8B4(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(a1, "setReport:reportLength:reportID:reportType:keyholeID:", a4, a5, a3, a2, 240);
}

void sub_10000B8D0(uint64_t a1)
{
  IONotificationPort *v2;
  const __CFDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;

  if (byte_1000C9170)
    kdebug_trace(730595352, objc_msgSend(*(id *)(a1 + 32), "instanceID"), 0, 0, 0);
  v2 = (IONotificationPort *)objc_msgSend(*(id *)(a1 + 32), "notificationPort");
  v3 = IOServiceMatching("AppleMultitouchDevice");
  if (!IOServiceAddMatchingNotification(v2, "IOServiceFirstMatch", v3, (IOServiceMatchingCallback)sub_10000BAF8, *(void **)(a1 + 32), (io_iterator_t *)(*(_QWORD *)(a1 + 32) + 52))&& objc_msgSend(*(id *)(a1 + 32), "amdNotification"))
  {
    while (IOIteratorNext((io_iterator_t)objc_msgSend(*(id *)(a1 + 32), "amdNotification")))
      ;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "properties"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[HIDAppleSiriRemoteDevice getTouchHIDReportDescriptor](HIDAppleSiriRemoteDevice, "getTouchHIDReportDescriptor"));
  v13 = (id)objc_claimAutoreleasedReturnValue(+[HIDAppleSiriRemoteDevice properties:locationIdOffset:hidDescriptor:extendedData:](HIDAppleSiriRemoteDevice, "properties:locationIdOffset:hidDescriptor:extendedData:", v4, 1, v5, 0));

  v6 = (void *)IOHIDUserDeviceCreateWithOptions(kCFAllocatorDefault, v13, 1);
  objc_msgSend(*(id *)(a1 + 32), "setTouch:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "touch"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "touch"));
    IOHIDUserDeviceRegisterGetReportWithReturnLengthCallback(v8, sub_10000BB38, *(_QWORD *)(a1 + 32));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "touch"));
    IOHIDUserDeviceRegisterSetReportCallback(v9, sub_10000BB54, *(_QWORD *)(a1 + 32));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "touch"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
    IOHIDUserDeviceScheduleWithDispatchQueue(v10, v11);

  }
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "groupTouch"));
  dispatch_group_leave(v12);

  if (byte_1000C9170)
    kdebug_trace(730595356, objc_msgSend(*(id *)(a1 + 32), "instanceID"), 0, 0, 0);

}

void sub_10000BAF8(void *a1, uint64_t a2)
{
  id v3;

  v3 = a1;
  objc_msgSend(v3, "appleMultitouchDeviceArrived:", a2);
  objc_msgSend(v3, "clearAppleMultitouchDeviceNotification");

}

id sub_10000BB38(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(a1, "getReport:reportLength:reportID:reportType:keyholeID:", a4, a5, a3, a2, 241);
}

id sub_10000BB54(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(a1, "setReport:reportLength:reportID:reportType:keyholeID:", a4, a5, a3, a2, 241);
}

void sub_10000BB70(uint64_t a1)
{
  IONotificationPort *v2;
  const __CFDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;

  if (byte_1000C9170)
    kdebug_trace(730595344, objc_msgSend(*(id *)(a1 + 32), "instanceID"), 0, 0, 0);
  v2 = (IONotificationPort *)objc_msgSend(*(id *)(a1 + 32), "notificationPort");
  v3 = IOServiceMatching("AppleEmbeddedBluetoothDeviceManagement");
  if (!IOServiceAddMatchingNotification(v2, "IOServiceFirstMatch", v3, (IOServiceMatchingCallback)sub_10000BD9C, *(void **)(a1 + 32), (io_iterator_t *)(*(_QWORD *)(a1 + 32) + 56))&& objc_msgSend(*(id *)(a1 + 32), "deviceMgtNotification"))
  {
    while (IOIteratorNext((io_iterator_t)objc_msgSend(*(id *)(a1 + 32), "deviceMgtNotification")))
      ;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "properties"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[HIDAppleSiriRemoteDevice getDeviceManagementHIDReportDescriptor](HIDAppleSiriRemoteDevice, "getDeviceManagementHIDReportDescriptor"));
  v13 = (id)objc_claimAutoreleasedReturnValue(+[HIDAppleSiriRemoteDevice properties:locationIdOffset:hidDescriptor:extendedData:](HIDAppleSiriRemoteDevice, "properties:locationIdOffset:hidDescriptor:extendedData:", v4, 0, v5, &off_1000B3B48));

  v6 = (void *)IOHIDUserDeviceCreateWithOptions(kCFAllocatorDefault, v13, 1);
  objc_msgSend(*(id *)(a1 + 32), "setDeviceManagement:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "deviceManagement"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "deviceManagement"));
    IOHIDUserDeviceRegisterSetReportCallback(v8, sub_10000BDDC, *(_QWORD *)(a1 + 32));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "deviceManagement"));
    IOHIDUserDeviceRegisterGetReportWithReturnLengthCallback(v9, sub_10000BDF8, *(_QWORD *)(a1 + 32));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "deviceManagement"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
    IOHIDUserDeviceScheduleWithDispatchQueue(v10, v11);

  }
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "groupDeviceManagement"));
  dispatch_group_leave(v12);

  if (byte_1000C9170)
    kdebug_trace(730595348, objc_msgSend(*(id *)(a1 + 32), "instanceID"), 0, 0, 0);

}

void sub_10000BD9C(void *a1, uint64_t a2)
{
  id v3;

  v3 = a1;
  objc_msgSend(v3, "deviceMgtDriverArrived:", a2);
  objc_msgSend(v3, "clearDeviceManagementNotification");

}

id sub_10000BDDC(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(a1, "setReport:reportLength:reportID:reportType:keyholeID:", a4, a5, a3, a2, 240);
}

id sub_10000BDF8(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(a1, "getReport:reportLength:reportID:reportType:keyholeID:", a4, a5, a3, a2, 240);
}

void sub_10000BE14(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;

  if (byte_1000C9170)
    kdebug_trace(730595368, objc_msgSend(*(id *)(a1 + 32), "instanceID"), 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "properties"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[HIDAppleSiriRemoteDevice getInertialHIDReportDescriptor](HIDAppleSiriRemoteDevice, "getInertialHIDReportDescriptor"));
  v11 = (id)objc_claimAutoreleasedReturnValue(+[HIDAppleSiriRemoteDevice properties:locationIdOffset:hidDescriptor:extendedData:](HIDAppleSiriRemoteDevice, "properties:locationIdOffset:hidDescriptor:extendedData:", v2, 3, v3, 0));

  v4 = (void *)IOHIDUserDeviceCreateWithOptions(kCFAllocatorDefault, v11, 1);
  objc_msgSend(*(id *)(a1 + 32), "setInertial:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "inertial"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "inertial"));
    IOHIDUserDeviceRegisterGetReportWithReturnLengthCallback(v6, sub_10000BFD8, *(_QWORD *)(a1 + 32));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "inertial"));
    IOHIDUserDeviceRegisterSetReportCallback(v7, sub_10000BFF4, *(_QWORD *)(a1 + 32));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "inertial"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
    IOHIDUserDeviceScheduleWithDispatchQueue(v8, v9);

  }
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "groupInertial"));
  dispatch_group_leave(v10);

  if (byte_1000C9170)
    kdebug_trace(730595372, objc_msgSend(*(id *)(a1 + 32), "instanceID"), 0, 0, 0);

}

id sub_10000BFD8(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(a1, "getReport:reportLength:reportID:reportType:keyholeID:", a4, a5, a3, a2, 240);
}

id sub_10000BFF4(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(a1, "setReport:reportLength:reportID:reportType:keyholeID:", a4, a5, a3, a2, 240);
}

void sub_10000C010(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;

  if (byte_1000C9170)
    kdebug_trace(730595392, objc_msgSend(*(id *)(a1 + 32), "instanceID"), 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "properties"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[HIDAppleSiriRemoteDevice getProximityHIDReportDescriptor](HIDAppleSiriRemoteDevice, "getProximityHIDReportDescriptor"));
  v11 = (id)objc_claimAutoreleasedReturnValue(+[HIDAppleSiriRemoteDevice properties:locationIdOffset:hidDescriptor:extendedData:](HIDAppleSiriRemoteDevice, "properties:locationIdOffset:hidDescriptor:extendedData:", v2, 7, v3, 0));

  v4 = (void *)IOHIDUserDeviceCreateWithOptions(kCFAllocatorDefault, v11, 1);
  objc_msgSend(*(id *)(a1 + 32), "setProximity:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "proximity"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "proximity"));
    IOHIDUserDeviceRegisterGetReportWithReturnLengthCallback(v6, sub_10000C1D4, *(_QWORD *)(a1 + 32));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "proximity"));
    IOHIDUserDeviceRegisterSetReportCallback(v7, sub_10000C1F0, *(_QWORD *)(a1 + 32));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "proximity"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
    IOHIDUserDeviceScheduleWithDispatchQueue(v8, v9);

  }
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "groupProximity"));
  dispatch_group_leave(v10);

  if (byte_1000C9170)
    kdebug_trace(730595396, objc_msgSend(*(id *)(a1 + 32), "instanceID"), 0, 0, 0);

}

id sub_10000C1D4(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(a1, "getReport:reportLength:reportID:reportType:keyholeID:", a4, a5, a3, a2, 240);
}

id sub_10000C1F0(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(a1, "setReport:reportLength:reportID:reportType:keyholeID:", a4, a5, a3, a2, 240);
}

void sub_10000C20C(uint64_t a1)
{
  dispatch_time_t v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_queue_global_t global_queue;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD block[5];

  v2 = dispatch_time(0, 5000000000);
  if (objc_msgSend(*(id *)(a1 + 32), "productID") == 614
    || objc_msgSend(*(id *)(a1 + 32), "productID") == 621)
  {
    v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "sentHostReadyReport"));
    dispatch_semaphore_wait(v3, v2);

  }
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "gotDeviceExtendedInfoReport"));
  dispatch_semaphore_wait(v4, v2);

  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "groupInit"));
  global_queue = dispatch_get_global_queue(21, 0);
  v7 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C3A8;
  block[3] = &unk_1000AD230;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_group_async(v5, v7, block);

  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "groupInit"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000C58C;
  v11[3] = &unk_1000AD230;
  v11[4] = *(_QWORD *)(a1 + 32);
  dispatch_group_async(v8, v7, v11);

  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "groupInit"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000C770;
  v10[3] = &unk_1000AD230;
  v10[4] = *(_QWORD *)(a1 + 32);
  dispatch_group_async(v9, v7, v10);

}

void sub_10000C3A8(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (byte_1000C9170)
    kdebug_trace(730595360, objc_msgSend(*(id *)(a1 + 32), "instanceID"), 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "properties"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[HIDAppleSiriRemoteDevice getInfraredHIDReportDescriptor](HIDAppleSiriRemoteDevice, "getInfraredHIDReportDescriptor"));
  v10 = (id)objc_claimAutoreleasedReturnValue(+[HIDAppleSiriRemoteDevice properties:locationIdOffset:hidDescriptor:extendedData:](HIDAppleSiriRemoteDevice, "properties:locationIdOffset:hidDescriptor:extendedData:", v2, 4, v3, 0));

  v4 = (void *)IOHIDUserDeviceCreateWithOptions(kCFAllocatorDefault, v10, 1);
  objc_msgSend(*(id *)(a1 + 32), "setInfrared:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "infrared"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "infrared"));
    IOHIDUserDeviceRegisterGetReportWithReturnLengthCallback(v6, sub_10000C554, *(_QWORD *)(a1 + 32));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "infrared"));
    IOHIDUserDeviceRegisterSetReportCallback(v7, sub_10000C570, *(_QWORD *)(a1 + 32));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "infrared"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
    IOHIDUserDeviceScheduleWithDispatchQueue(v8, v9);

  }
  if (byte_1000C9170)
    kdebug_trace(730595364, objc_msgSend(*(id *)(a1 + 32), "instanceID"), 0, 0, 0);

}

id sub_10000C554(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(a1, "getReport:reportLength:reportID:reportType:keyholeID:", a4, a5, a3, a2, 240);
}

id sub_10000C570(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(a1, "setReport:reportLength:reportID:reportType:keyholeID:", a4, a5, a3, a2, 240);
}

void sub_10000C58C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (byte_1000C9170)
    kdebug_trace(730595376, objc_msgSend(*(id *)(a1 + 32), "instanceID"), 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "properties"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[HIDAppleSiriRemoteDevice getAudioHIDReportDescriptor](HIDAppleSiriRemoteDevice, "getAudioHIDReportDescriptor"));
  v10 = (id)objc_claimAutoreleasedReturnValue(+[HIDAppleSiriRemoteDevice properties:locationIdOffset:hidDescriptor:extendedData:](HIDAppleSiriRemoteDevice, "properties:locationIdOffset:hidDescriptor:extendedData:", v2, 5, v3, 0));

  v4 = (void *)IOHIDUserDeviceCreateWithOptions(kCFAllocatorDefault, v10, 1);
  objc_msgSend(*(id *)(a1 + 32), "setAudio:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "audio"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "audio"));
    IOHIDUserDeviceRegisterGetReportWithReturnLengthCallback(v6, sub_10000C738, *(_QWORD *)(a1 + 32));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "audio"));
    IOHIDUserDeviceRegisterSetReportCallback(v7, sub_10000C754, *(_QWORD *)(a1 + 32));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "audio"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
    IOHIDUserDeviceScheduleWithDispatchQueue(v8, v9);

  }
  if (byte_1000C9170)
    kdebug_trace(730595380, objc_msgSend(*(id *)(a1 + 32), "instanceID"), 0, 0, 0);

}

id sub_10000C738(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(a1, "getReport:reportLength:reportID:reportType:keyholeID:", a4, a5, a3, a2, 240);
}

id sub_10000C754(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(a1, "setReport:reportLength:reportID:reportType:keyholeID:", a4, a5, a3, a2, 240);
}

void sub_10000C770(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (byte_1000C9170)
    kdebug_trace(730595384, objc_msgSend(*(id *)(a1 + 32), "instanceID"), 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "properties"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[HIDAppleSiriRemoteDevice getRadioHIDReportDescriptor](HIDAppleSiriRemoteDevice, "getRadioHIDReportDescriptor"));
  v10 = (id)objc_claimAutoreleasedReturnValue(+[HIDAppleSiriRemoteDevice properties:locationIdOffset:hidDescriptor:extendedData:](HIDAppleSiriRemoteDevice, "properties:locationIdOffset:hidDescriptor:extendedData:", v2, 6, v3, 0));

  v4 = (void *)IOHIDUserDeviceCreateWithOptions(kCFAllocatorDefault, v10, 1);
  objc_msgSend(*(id *)(a1 + 32), "setRadio:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "radio"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "radio"));
    IOHIDUserDeviceRegisterGetReportWithReturnLengthCallback(v6, sub_10000C91C, *(_QWORD *)(a1 + 32));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "radio"));
    IOHIDUserDeviceRegisterSetReportCallback(v7, sub_10000C938, *(_QWORD *)(a1 + 32));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "radio"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
    IOHIDUserDeviceScheduleWithDispatchQueue(v8, v9);

  }
  if (byte_1000C9170)
    kdebug_trace(730595388, objc_msgSend(*(id *)(a1 + 32), "instanceID"), 0, 0, 0);

}

id sub_10000C91C(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(a1, "getReport:reportLength:reportID:reportType:keyholeID:", a4, a5, a3, a2, 240);
}

id sub_10000C938(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(a1, "setReport:reportLength:reportID:reportType:keyholeID:", a4, a5, a3, a2, 240);
}

void sub_10000C954(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  unsigned int v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  char v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    if (byte_1000C9170)
      kdebug_trace(730595400, objc_msgSend(WeakRetained, "instanceID"), 0, 0, 0);
    v7 = -81;
    v3 = objc_msgSend(v2, "setReport:reportLength:reportID:reportType:keyholeID:", &v7, 1, 175, 2, 240);
    if (v3)
    {
      v4 = v3;
      v5 = qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
        sub_100069FC4(v4, v5);
    }
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sentHostReadyReport"));
    dispatch_semaphore_signal(v6);

    if (byte_1000C9170)
      kdebug_trace(730595404, objc_msgSend(v2, "instanceID"), 0, 0, 0);
  }

}

void sub_10000CA6C(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;
  objc_super v7;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "groupInit"));
  dispatch_group_wait(v2, 0xFFFFFFFFFFFFFFFFLL);

  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)HIDAppleSiriRemoteDevice;
  objc_msgSendSuper2(&v7, "notifyDidStart");
  objc_msgSend(*(id *)(a1 + 32), "logHwFwVersions");
  location = 0;
  objc_initWeak(&location, *(id *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000CB68;
  v4[3] = &unk_1000AD258;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void sub_10000CB54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000CB68(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "notifyDesiredConnectionParametersDidChange");
    WeakRetained = v2;
  }

}

void sub_10000D034(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000D4E8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("SleepPeripheralLatency")));

  if (v2)
    v3 = (uint64_t)objc_msgSend(v4, "integerForKey:", CFSTR("SleepPeripheralLatency"));
  else
    v3 = 199;
  if (objc_msgSend(*(id *)(a1 + 32), "latency") != (_DWORD)v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setLatency:", v3);
    objc_msgSend(*(id *)(a1 + 32), "notifyDesiredConnectionParametersDidChange");
  }

}

void sub_10000D618(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  if (byte_1000C9170)
    kdebug_trace(730595416, objc_msgSend(*(id *)(a1 + 32), "instanceID"), 0, 0, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("NormalPeripheralLatency")));

  if (v2)
    v3 = (uint64_t)objc_msgSend(v4, "integerForKey:", CFSTR("NormalPeripheralLatency"));
  else
    v3 = 80;
  if (objc_msgSend(*(id *)(a1 + 32), "latency") != (_DWORD)v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setLatency:", v3);
    objc_msgSend(*(id *)(a1 + 32), "notifyDesiredConnectionParametersDidChange");
  }
  if (byte_1000C9170)
    kdebug_trace(730595420, objc_msgSend(*(id *)(a1 + 32), "instanceID"), 0, 0, 0);

}

id sub_10000D7B4(uint64_t a1)
{
  id result;

  result = objc_msgSend(*(id *)(a1 + 32), "latency");
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "setLatency:", 0);
    return objc_msgSend(*(id *)(a1 + 32), "notifyDesiredConnectionParametersDidChange");
  }
  return result;
}

id sub_10000D9DC(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  uint64_t v4;

  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("buttons");
  v4 = v1;
  return (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v4, &v3, 1));
}

void sub_10000DC58(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10000DD9C(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  uint64_t v4;

  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("proximity");
  v4 = v1;
  return (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v4, &v3, 1));
}

void sub_10000E824(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000E848(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10000E858(uint64_t a1)
{

}

id sub_10000E860(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
}

id sub_10000E870(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
}

id sub_10000EA00(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  uint64_t v4;

  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("inertial");
  v4 = v1;
  return (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v4, &v3, 1));
}

void sub_10000ECE4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

NSDictionary *__cdecl sub_10000ECFC(id a1)
{
  return (NSDictionary *)&off_1000B3C08;
}

id sub_10000ED08(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  void *v5;

  v4 = CFSTR("audio");
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "description"));
  v5 = v1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v5, &v4, 1));

  return v2;
}

void sub_1000101E0(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1000101F4(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v6 = 0u;
    v7 = 0u;
    v5 = 512;
    if (objc_msgSend(*(id *)(a1 + 32), "productID") == 614)
      v3 = 207;
    else
      v3 = 188;
    if (!objc_msgSend(WeakRetained, "getReport:reportLength:reportID:reportType:keyholeID:", &v6, &v5, v3, 2, 240))objc_msgSend(WeakRetained, "handleDeviceManagementData:dataLength:", &v6, v5);
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v6 = 0u;
    v7 = 0u;
    v5 = 512;
    if (objc_msgSend(*(id *)(a1 + 32), "productID") == 614)
      v4 = 206;
    else
      v4 = 187;
    if (!objc_msgSend(WeakRetained, "getReport:reportLength:reportID:reportType:keyholeID:", &v6, &v5, v4, 2, 240))objc_msgSend(WeakRetained, "handleDeviceManagementData:dataLength:", &v6, v5);
  }

}

void sub_10001052C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100010548(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  NSObject *v5;
  dispatch_time_t v6;
  intptr_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  NSObject *v21;
  _QWORD block[4];
  id v23;
  id v24;
  NSErrorUserInfoKey v25;
  void *v26;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "doapAudioStart"));
    v6 = dispatch_time(0, 10000000000);
    v7 = dispatch_semaphore_wait(v5, v6);

    if (v7)
    {
      v8 = qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
        sub_10006A728(v8, v9, v10, v11, v12, v13, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Timed out after %lld seconds waiting to start Siri"), 10));
      v25 = NSLocalizedDescriptionKey;
      v26 = v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSMachErrorDomain, -536870186, v17));

      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      v19 = v4;
      objc_sync_enter(v19);
      v20 = objc_alloc_init((Class)NSMutableArray);
      objc_msgSend(v19, "setAudioBuffer:", v20);

      objc_sync_exit(v19);
    }
    else
    {
      v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "queue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100010798;
      block[3] = &unk_1000AD310;
      objc_copyWeak(&v24, v2);
      v23 = *(id *)(a1 + 32);
      dispatch_async(v21, block);

      objc_destroyWeak(&v24);
    }
  }

}

void sub_10001077C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100010798(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  dispatch_semaphore_t v5;
  unsigned int v6;
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  id v21;
  __int16 v22;
  _BYTE v23[128];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_sync_enter(v4);
    v5 = dispatch_semaphore_create(0);
    objc_msgSend(v4, "setDoapAudioStop:", v5);

    objc_sync_exit(v4);
    v22 = 408;
    v21 = 0;
    v6 = objc_msgSend(v4, "setReport:reportLength:reportID:reportType:keyholeID:error:", &v22, 2, 152, 2, 240, &v21);
    v7 = v21;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    if (v6)
    {
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
        sub_10006A794();
      v8 = v4;
      objc_sync_enter(v8);
      objc_msgSend(v8, "setDoapAudioStop:", 0);
      v9 = objc_alloc_init((Class)NSMutableArray);
      objc_msgSend(v8, "setAudioBuffer:", v9);

      objc_sync_exit(v8);
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "doapAudioStart"));
      dispatch_semaphore_signal(v10);
    }
    else
    {
      v10 = v4;
      objc_sync_enter(v10);
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject audioBuffer](v10, "audioBuffer", 0));
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v18;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v18 != v13)
              objc_enumerationMutation(v11);
            v15 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v14);
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject doapAudioRelay](v10, "doapAudioRelay"));
            objc_msgSend(v16, "sendAudioFrame:", v15);

            v14 = (char *)v14 + 1;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
        }
        while (v12);
      }

      -[NSObject setAudioBuffer:](v10, "setAudioBuffer:", 0);
      objc_sync_exit(v10);
    }

  }
}

void sub_1000109F4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100010FAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100010FE0(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "waitForSiriAudioToStop:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

void sub_1000111E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100011200(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  unsigned int v4;
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  __int16 v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v11 = 152;
    v10 = 0;
    v4 = objc_msgSend(WeakRetained, "setReport:reportLength:reportID:reportType:keyholeID:error:", &v11, 2, 152, 2, 240, &v10);
    v5 = v10;
    if (v4)
    {
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
        sub_10006A838();
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "doapAudioStart"));
      dispatch_semaphore_signal(v6);

      v7 = v3;
      objc_sync_enter(v7);
      v8 = objc_alloc_init((Class)NSMutableArray);
      objc_msgSend(v7, "setAudioBuffer:", v8);

      objc_sync_exit(v7);
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      objc_msgSend(v3, "setLastAudioDate:", v9);

      objc_msgSend(v3, "waitForSiriAudioToStop:", *(_QWORD *)(a1 + 32));
    }

  }
}

void sub_10001134C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000119D4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1000119EC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_100011A24(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0xEu);
}

void sub_100011A38(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void sub_100011A5C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x14u);
}

void sub_100011A6C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id sub_100011A88(id a1)
{
  return a1;
}

BOOL sub_100011A90()
{
  return MGGetSInt32Answer(CFSTR("DeviceClassNumber"), 0xFFFFFFFFLL) == 4;
}

BOOL sub_100011AB8()
{
  return MGGetSInt32Answer(CFSTR("DeviceClassNumber"), 0xFFFFFFFFLL) == 6;
}

BOOL sub_100011AE0()
{
  return MGGetSInt32Answer(CFSTR("DeviceClassNumber"), 0xFFFFFFFFLL) == 1;
}

BOOL sub_100011B08()
{
  return MGGetSInt32Answer(CFSTR("DeviceClassNumber"), 0xFFFFFFFFLL) == 9;
}

void sub_100011B30()
{
  void *v0;
  id v1;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v1 = objc_msgSend(v0, "addObserverForName:object:queue:usingBlock:", NSUserDefaultsDidChangeNotification, 0, 0, &stru_1000AD350);

  sub_100011B8C();
}

void sub_100011B8C()
{
  void *v0;
  id v1;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "objectForKey:", CFSTR("EnableSignposts")));

  byte_1000C9170 = objc_msgSend(v1, "BOOLValue");
}

void sub_100011C2C(id a1)
{
  EndpointManager *v1;
  void *v2;

  if (sub_100011AB8() || sub_100011AE0() || sub_100011B08())
  {
    v1 = objc_alloc_init(EndpointManager);
    v2 = (void *)qword_1000C9028;
    qword_1000C9028 = (uint64_t)v1;

  }
}

id sub_100012D14(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(a1, "setReport:reportLength:reportID:reportType:", a4, a5, a3, a2);
}

id sub_100012D2C(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(a1, "getReport:reportLength:reportID:reportType:", a4, a5, a3, a2);
}

void sub_100013E38(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006AB14(a1, v5, v4);
  }

}

void sub_1000143E8(id a1, NSNumber *a2, HIDKeyholeUserDevice *a3, BOOL *a4)
{
  HIDKeyholeUserDevice *v4;

  v4 = a3;
  -[HIDKeyholeUserDevice setGetReportKeyholeID:](v4, "setGetReportKeyholeID:", 240);
  -[HIDKeyholeUserDevice setUseKeyholeOnGet:](v4, "setUseKeyholeOnGet:", 1);

}

void sub_100014CA4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1000188BC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_1000189B8(id a1)
{
  GenericSiriRemoteListener *v1;
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = objc_alloc_init(GenericSiriRemoteListener);
  v2 = (void *)qword_1000C9038;
  qword_1000C9038 = (uint64_t)v1;

  if (qword_1000C9038)
  {
    _objc_msgSend((id)qword_1000C9038, "setUpHidHandlers");
  }
  else
  {
    v3 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006B2A8(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

void sub_100018B54(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataValue"));
  objc_msgSend(v3, "handleAudioData:", v4);

}

void sub_100018B98(uint64_t a1, void *a2, int a3)
{
  id v5;
  id *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;

  v5 = a2;
  if (!a3)
  {
    v16 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412290;
      v20 = v5;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Destroying doapAudioRelay for GenericSiriRemote device %@", (uint8_t *)&v19, 0xCu);
    }
    v17 = *(void **)(a1 + 32);
    v6 = (id *)(a1 + 32);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "doapAudioRelay"));
    objc_msgSend(v18, "invalidate");

    objc_msgSend(*v6, "setDoapAudioRelay:", 0);
    v12 = 4;
    goto LABEL_9;
  }
  v7 = *(void **)(a1 + 32);
  v6 = (id *)(a1 + 32);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "doapAudioRelay"));

  if (!v8)
  {
    v9 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412290;
      v20 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Creating doapAudioRelay for GenericSiriRemote device %@", (uint8_t *)&v19, 0xCu);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[DoAPAudioRelayHub instance](DoAPAudioRelayHub, "instance"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "propertyForKey:", CFSTR("PhysicalDeviceUniqueID")));
    v12 = 2;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "relayWithIdentifier:deviceType:properties:codecType:", v11, 2, 0, 7));
    objc_msgSend(*v6, "setDoapAudioRelay:", v13);

    v14 = *v6;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v6, "doapAudioRelay"));
    objc_msgSend(v15, "setDelegate:", v14);

LABEL_9:
    objc_msgSend(*v6, "setState:", v12);
  }

}

void sub_100019134(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10001914C(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  void *v5;

  v4 = CFSTR("audio");
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "description"));
  v5 = v1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v5, &v4, 1));

  return v2;
}

NSDictionary *__cdecl sub_1000191E0(id a1)
{
  return (NSDictionary *)&off_1000B3CA8;
}

void sub_100019358(uint64_t a1)
{
  NSObject *v2;
  dispatch_time_t v3;
  intptr_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  _QWORD block[5];
  id v20;
  NSErrorUserInfoKey v21;
  void *v22;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "doapAudioStart"));
  v3 = dispatch_time(0, 10000000000);
  v4 = dispatch_semaphore_wait(v2, v3);

  if (v4)
  {
    v5 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006B370(v5, v6, v7, v8, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Timed out after %lld seconds waiting to start Siri"), 10));
    v21 = NSLocalizedDescriptionKey;
    v22 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSMachErrorDomain, -536870186, v14));

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v16 = *(id *)(a1 + 32);
    objc_sync_enter(v16);
    v17 = objc_alloc_init((Class)NSMutableArray);
    objc_msgSend(*(id *)(a1 + 32), "setAudioBuffer:", v17);

    objc_sync_exit(v16);
  }
  else
  {
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "eventQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100019588;
    block[3] = &unk_1000AD608;
    block[4] = *(_QWORD *)(a1 + 32);
    v20 = *(id *)(a1 + 40);
    dispatch_async(v18, block);

  }
}

void sub_10001956C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100019588(uint64_t a1)
{
  dispatch_semaphore_t v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v2 = dispatch_semaphore_create(0);
  objc_msgSend(*(id *)(a1 + 32), "setDoapAudioStop:", v2);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "audioBuffer", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "doapAudioRelay"));
        objc_msgSend(v9, "sendAudioFrame:", v8);

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "audioBuffer"));
  objc_msgSend(v10, "removeAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "setAudioBuffer:", 0);
  objc_sync_exit(v3);

}

void sub_10001970C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100019C78(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_100019C9C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "waitForSiriAudioToStop:", *(_QWORD *)(a1 + 40));
}

id sub_100019E2C(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(*(id *)(a1 + 32), "setLastAudioDate:", v2);

  return objc_msgSend(*(id *)(a1 + 32), "waitForSiriAudioToStop:", *(_QWORD *)(a1 + 40));
}

void sub_100019FB8(id a1)
{
  PolicyManager *v1;
  void *v2;

  v1 = objc_alloc_init(PolicyManager);
  v2 = (void *)qword_1000C9048;
  qword_1000C9048 = (uint64_t)v1;

}

void sub_10001AD80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_10001E6EC(uint64_t a1)
{
  Class result;
  __int128 v3;
  uint64_t v4;

  if (!qword_1000C9060)
  {
    v3 = off_1000AD648;
    v4 = 0;
    qword_1000C9060 = _sl_dlopen(&v3, 0);
  }
  result = objc_getClass("HKDevice");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  qword_1000C9058 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_10001E7D8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

uint64_t sub_10001E814()
{
  uint64_t v0;

  return v0;
}

id sub_10001F11C(uint64_t a1, void *a2)
{
  return _objc_msgSend(a2, "start:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
}

id sub_10001F1B4(uint64_t a1)
{
  dispatch_time_t v2;
  objc_super v4;

  v2 = dispatch_time(0, 3000000000);
  if (dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 48), v2))
    objc_msgSend(*(id *)(a1 + 32), "sendAnalyticsEvent:withPayload:", CFSTR("com.apple.Multitouch.PencilHostReadyTimeout"), &off_1000B3CD0);
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)HIDApplePencilDevice;
  return objc_msgSendSuper2(&v4, "notifyDidStart");
}

id sub_10001F29C(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)HIDApplePencilDevice;
  return objc_msgSendSuper2(&v2, "notifyDidStop");
}

id sub_10001F6C8(uint64_t a1, void *a2)
{
  id result;

  result = (id)kdebug_trace(730595784, 0, 0, 0, 0);
  if (a2)
    return _objc_msgSend(a2, "mtWillPowerOn");
  return result;
}

void sub_10001F7E4(id a1, HIDKeyholeUserDevice *a2, unint64_t a3, BOOL *a4)
{
  -[HIDKeyholeUserDevice stop](a2, "stop", a3, a4);
}

id sub_10001FBA4(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_100024990(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x2Au);
}

void sub_1000249A4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x22u);
}

void sub_100024E84(uint64_t a1)
{
  id v2;

  if (objc_msgSend(*(id *)(a1 + 32), "state") == 1)
    objc_msgSend(*(id *)(a1 + 32), "setState:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "service"));
  objc_msgSend(v2, "hidDeviceDidStart");

}

void sub_100024F34(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setState:", 4);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "service"));
  objc_msgSend(v2, "hidDeviceDidStop");

}

void sub_100024FD4(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "service"));
  objc_msgSend(v1, "hidDeviceDesiredConnectionParametersDidChange");

}

void sub_100025790(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "firstObject"));
  objc_msgSend(v2, "respondToRequest:withResult:", v3, *(_QWORD *)(a1 + 56));

  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "firstObject"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "central"));
    objc_msgSend(v5, "updateDataSource:central:", v4, v6);

  }
}

void sub_1000261DC(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "data"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "notificationSourceCharacteristic"));
  objc_msgSend(v2, "updateValue:forCharacteristic:onSubscribedCentrals:", v4, v3, *(_QWORD *)(a1 + 48));

}

id sub_1000265CC(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "handleWriteRequests:", *(_QWORD *)(a1 + 40));
}

void sub_1000268E0(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "activeCentrals"));
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

void sub_100026920(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  int8x16_t v5;
  _QWORD v6[4];
  int8x16_t v7;
  char v8;

  if (objc_msgSend(*(id *)(a1 + 32), "hasTag:", CFSTR("ANCSAuthorized")))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "activeCentrals"));
    objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 32));

    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "alertMap"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000269EC;
    v6[3] = &unk_1000AD768;
    v8 = 5;
    v5 = *(int8x16_t *)(a1 + 32);
    v4 = (id)v5.i64[0];
    v7 = vextq_s8(v5, v5, 8uLL);
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);

  }
}

void sub_1000269EC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v3 = *(unsigned __int8 *)(a1 + 48);
  v4 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  objc_msgSend(v4, "updateNotificationSource:notification:sourceFlags:centrals:", 0, v5, v3, v6, v7);

}

void sub_100026C50(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "activeCentrals"));
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

void sub_100026D30(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  id v21;

  v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "activeCentrals"));
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 40);
  if (v2)
    objc_msgSend(v3, "addObject:", v5);
  else
    objc_msgSend(v3, "removeObject:", v5);

  v6 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(unsigned __int8 *)(a1 + 48);
    if (*(_BYTE *)(a1 + 48))
      v8 = CFSTR("adding");
    else
      v8 = CFSTR("removing");
    v11 = a1 + 32;
    v9 = *(void **)(a1 + 32);
    v10 = *(_QWORD *)(v11 + 8);
    v12 = v6;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "activeCentrals"));
    v14 = 138413058;
    v15 = v10;
    v16 = 1024;
    v17 = v7;
    v18 = 2112;
    v19 = v8;
    v20 = 2048;
    v21 = objc_msgSend(v13, "count");
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Central %@ ancsAuthorization changed to %d. Active centrals after %@ %ld", (uint8_t *)&v14, 0x26u);

  }
}

uint64_t start(int a1, char *const *a2)
{
  NSObject *v4;
  char v5;
  char v6;
  int v7;
  uint64_t v8;
  void *v9;
  int v10;
  char *const *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v23;
  void *v24;
  void *v25;

  signal(15, (void (__cdecl *)(int))1);
  _set_user_dir_suffix("com.apple.BTLEServer");
  v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  dispatch_source_set_event_handler_f(v4, (dispatch_function_t)sub_100027CB0);
  dispatch_resume(v4);
  v5 = 0;
  do
  {
    v6 = v5;
    v7 = getopt(a1, a2, "c");
    v5 = 1;
  }
  while (v7 == 99);
  if (v7 == -1)
  {
    v8 = optind;
    sub_10003617C("BTLEServer");
    sub_100011B30();
    if ((v6 & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      if (a1 != (_DWORD)v8)
      {
        v10 = v8 - a1;
        v11 = &a2[v8];
        do
        {
          v12 = (uint64_t)*v11++;
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v12));
          v14 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v13);
          objc_msgSend(v9, "addObject:", v14);

        }
        while (!__CFADD__(v10++, 1));
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[ConnectionManager instance](ConnectionManager, "instance"));
      objc_msgSend(v16, "connectAlways:", v9);

    }
    else
    {
      v18 = +[BTLEXpcServer instance](BTLEXpcServer, "instance");
      v19 = +[DoAPAudioRelayHub instance](DoAPAudioRelayHub, "instance");
      v20 = +[GenericSiriRemoteListener instance](GenericSiriRemoteListener, "instance");
      v21 = +[LoggingManager instance](LoggingManager, "instance");
      if (!sub_100011A90())
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_100027D0C, CFSTR("com.apple.language.changed"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      }
    }
    xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_1000AD870);

    if (+[FitnessDeviceManager shouldRestartCollecting](FitnessDeviceManager, "shouldRestartCollecting"))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[FitnessDeviceManager instance](FitnessDeviceManager, "instance"));
      objc_msgSend(v23, "registerWithHealthKit:", 1);

      v24 = (void *)objc_claimAutoreleasedReturnValue(+[FitnessDeviceManager instance](FitnessDeviceManager, "instance"));
      objc_msgSend(v24, "loadCollectionState");

    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
    objc_msgSend(v25, "run");

    v17 = 0;
  }
  else
  {
    v17 = 1;
  }

  return v17;
}

void sub_100027CB0()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "SIGTERM received, exiting", v1, 2u);
  }
  exit(0);
}

void sub_100027D0C()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "Language did change, exiting", v1, 2u);
  }
  exit(1);
}

void sub_100027D68(id a1, OS_xpc_object *a2)
{
  NSString *v2;
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;

  v2 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_dictionary_get_string(a2, _xpc_event_key_name));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
    sub_10006C650((uint64_t)v3, v4);
  if ((objc_msgSend(CFSTR("HKHealthDaemonActiveDataCollectionWillStartNotification"), "isEqualToString:", v3) & 1) != 0|| objc_msgSend(CFSTR("BTSettingsHRMConnectedNotification"), "isEqualToString:", v3))
  {
    v5 = objc_msgSend(CFSTR("HKHealthDaemonActiveDataCollectionWillStartNotification"), "isEqualToString:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[FitnessDeviceManager instance](FitnessDeviceManager, "instance"));
    objc_msgSend(v6, "registerWithHealthKit:", v5);

  }
}

void sub_100027E84(id a1)
{
  CattManager *v1;
  void *v2;

  v1 = objc_alloc_init(CattManager);
  v2 = (void *)qword_1000C9068;
  qword_1000C9068 = (uint64_t)v1;

}

void sub_1000295A4(id a1, NSNumber *a2, HIDKeyholeUserDevice *a3, BOOL *a4)
{
  HIDKeyholeUserDevice *v4;

  v4 = a3;
  -[HIDKeyholeUserDevice setGetReportKeyholeID:](v4, "setGetReportKeyholeID:", 240);
  -[HIDKeyholeUserDevice setUseKeyholeOnGet:](v4, "setUseKeyholeOnGet:", 1);

}

id sub_100029840(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "handleEvent:", a2);
}

uint64_t sub_100029D7C(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  id v5;
  const uint8_t *bytes;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a3;
  v5 = objc_alloc((Class)NSUUID);
  bytes = xpc_uuid_get_bytes(v4);

  v7 = objc_msgSend(v5, "initWithUUIDBytes:", bytes);
  objc_msgSend(v3, "addObject:", v7);

  return 1;
}

void sub_10002B888(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 104), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002B8A8(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v5 = a3;
  v6 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a2));
  v7 = a1[5];
  v8 = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  v9 = *(void **)(v7 + 8 * v8);
  *(_QWORD *)(v7 + 8 * v8) = v6;

  v10 = sub_10002B950(v5);
  v11 = objc_claimAutoreleasedReturnValue(v10);

  v12 = a1[6];
  v13 = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  v14 = *(void **)(v12 + 8 * v13);
  *(_QWORD *)(v12 + 8 * v13) = v11;

  ++*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  return 1;
}

__CFString *sub_10002B950(void *a1)
{
  id v1;
  xpc_type_t type;
  __CFString *v3;
  NSNumber *v4;
  __CFString *v5;
  NSNumber *v6;
  _BOOL4 value;
  void *v8;
  NSString *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  id v13;
  const void *bytes_ptr;
  id v15;
  id v16;
  NSNumber *v17;
  NSNumber *v18;

  v1 = a1;
  type = xpc_get_type(v1);
  if (type == (xpc_type_t)&_xpc_type_int64)
  {
    v4 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", xpc_int64_get_value(v1));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(v4);
    goto LABEL_26;
  }
  if (type == (xpc_type_t)&_xpc_type_uint64)
  {
    v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", xpc_uint64_get_value(v1));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(v6);
    goto LABEL_26;
  }
  if (type == (xpc_type_t)&_xpc_type_BOOL)
  {
    value = xpc_BOOL_get_value(v1);
    v8 = &__kCFBooleanFalse;
    if (value)
      v8 = &__kCFBooleanTrue;
    v5 = v8;
    goto LABEL_26;
  }
  if (type != (xpc_type_t)&_xpc_type_string)
  {
    if (type == (xpc_type_t)&_xpc_type_data)
    {
      v13 = objc_alloc((Class)NSData);
      bytes_ptr = xpc_data_get_bytes_ptr(v1);
      v5 = (__CFString *)objc_msgSend(v13, "initWithBytes:length:", bytes_ptr, xpc_data_get_length(v1));
    }
    else if (type == (xpc_type_t)&_xpc_type_uuid)
    {
      v5 = (__CFString *)objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", xpc_uuid_get_bytes(v1));
    }
    else if (type == (xpc_type_t)&_xpc_type_array)
    {
      v15 = sub_10002C0A4(v1);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(v15);
    }
    else if (type == (xpc_type_t)&_xpc_type_dictionary)
    {
      v16 = sub_10002C1C4(v1);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(v16);
    }
    else if (type == (xpc_type_t)&_xpc_type_fd)
    {
      v17 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", xpc_fd_dup(v1));
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(v17);
    }
    else
    {
      if (type != (xpc_type_t)&_xpc_type_double)
      {
        NSLog(CFSTR("Unknown XPC type: %p"), type);
        v3 = 0;
        goto LABEL_27;
      }
      v18 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", xpc_double_get_value(v1));
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(v18);
    }
LABEL_26:
    v3 = v5;
    goto LABEL_27;
  }
  v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_string_get_string_ptr(v1));
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)v10;
  v12 = &stru_1000AE858;
  if (v10)
    v12 = (__CFString *)v10;
  v3 = v12;

LABEL_27:
  return v3;
}

id sub_10002C0A4(void *a1)
{
  id v1;
  size_t count;
  size_t v3;
  id v4;
  _QWORD applier[5];

  v1 = a1;
  count = xpc_array_get_count(v1);
  v3 = 8 * count;
  __chkstk_darwin();
  bzero((char *)applier - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
  applier[0] = _NSConcreteStackBlock;
  applier[1] = 3221225472;
  applier[2] = sub_10002C378;
  applier[3] = &unk_1000AD998;
  applier[4] = (char *)applier - ((8 * count + 15) & 0xFFFFFFFFFFFFFFF0);
  xpc_array_apply(v1, applier);
  v4 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:count:", (char *)applier - ((8 * count + 15) & 0xFFFFFFFFFFFFFFF0), count);
  if (count)
  {
    do
    {

      v3 -= 8;
    }
    while (v3);
  }

  return v4;
}

id sub_10002C1C4(void *a1)
{
  id v1;
  size_t count;
  uint64_t v3;
  char *v4;
  id v5;
  uint64_t v6;
  char *v7;
  _QWORD applier[7];
  _QWORD v10[4];

  v1 = a1;
  count = xpc_dictionary_get_count(v1);
  v3 = 8 * count;
  __chkstk_darwin();
  v4 = (char *)applier - ((8 * count + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v4, 8 * count);
  __chkstk_darwin();
  bzero(v4, 8 * count);
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0;
  applier[0] = _NSConcreteStackBlock;
  applier[1] = 3221225472;
  applier[2] = sub_10002C3B8;
  applier[3] = &unk_1000AD978;
  applier[4] = v10;
  applier[5] = v4;
  applier[6] = v4;
  xpc_dictionary_apply(v1, applier);
  v5 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjects:forKeys:count:", v4, v4, count);
  _Block_object_dispose(v10, 8);
  if (count)
  {
    v6 = 8 * count;
    do
    {

      v6 -= 8;
    }
    while (v6);
    v7 = v4 - 8;
    do
    {

      v3 -= 8;
    }
    while (v3);
  }

  return v5;
}

void sub_10002C358(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 104), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002C378(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v5 = sub_10002B950(a3);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 8 * a2);
  *(_QWORD *)(v7 + 8 * a2) = v6;

  return 1;
}

uint64_t sub_10002C3B8(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v5 = a3;
  v6 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a2));
  v7 = a1[5];
  v8 = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  v9 = *(void **)(v7 + 8 * v8);
  *(_QWORD *)(v7 + 8 * v8) = v6;

  v10 = sub_10002B950(v5);
  v11 = objc_claimAutoreleasedReturnValue(v10);

  v12 = a1[6];
  v13 = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  v14 = *(void **)(v12 + 8 * v13);
  *(_QWORD *)(v12 + 8 * v13) = v11;

  ++*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  return 1;
}

void sub_10002C460(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

id sub_10002C64C(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "handleServerEvent:", a2);
}

void sub_10002C698(id a1)
{
  DoAPAudioRelayHub *v1;
  void *v2;

  v1 = objc_alloc_init(DoAPAudioRelayHub);
  v2 = (void *)qword_1000C9078;
  qword_1000C9078 = (uint64_t)v1;

}

void sub_10002C908(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002CDB0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002CDD8(id a1, OS_xpc_object *a2)
{
  NSObject *v2;
  uint8_t v3[16];

  v2 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "DoAPAudioRelayHub - Event handler fired for previously torn down siri XPC connection", v3, 2u);
  }
}

id sub_10002CE3C(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "handleConnectionEvent:", a2);
}

void sub_10002CE48(id a1, OS_xpc_object *a2)
{
  NSObject *v2;
  uint8_t v3[16];

  v2 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "DoAPAudioRelayHub - Event handler fired for previously torn down sound sensor XPC connection", v3, 2u);
  }
}

id sub_10002CEAC(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "handleConnectionEvent:", a2);
}

void sub_10002D1A8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002D8C8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002DBC8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002E310(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002FAE8(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  if (a2)
  {
    v3 = a2;
    v4 = objc_alloc_init((Class)NSKeyedArchiver);
    objc_msgSend(v4, "encodeObject:forKey:", v3, CFSTR("kMsgArgError"));

    v7 = CFSTR("kMsgArgError");
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "encodedData"));
    v8 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));

  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "sendMsg:args:", "TransportDidStart", v6);

}

void sub_10002FC28(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  if (a2)
  {
    v3 = a2;
    v4 = objc_alloc_init((Class)NSKeyedArchiver);
    objc_msgSend(v4, "encodeObject:forKey:", v3, CFSTR("kMsgArgError"));

    v7 = CFSTR("kMsgArgError");
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "encodedData"));
    v8 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));

  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "sendMsg:args:", "TransportDidStop", v6);

}

id sub_100030138(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "handleServerEvent:", a2);
}

void sub_100030184(id a1)
{
  LoggingManager *v1;
  void *v2;

  v1 = objc_opt_new(LoggingManager);
  v2 = (void *)qword_1000C9088;
  qword_1000C9088 = (uint64_t)v1;

}

void sub_100030210(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_100030410(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "handleConnectionEvent:", a2);
}

void sub_100030BA4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100030BC0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", *(_QWORD *)(a1 + 32), "logRetrievalComplete", 0, 0, 420.0));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[UARPServiceUARPControllerManager instance](UARPServiceUARPControllerManager, "instance"));
  objc_msgSend(v5, "startTapToRadar");

}

BOOL sub_100031004(id a1, NSURL *a2, NSError *a3)
{
  NSURL *v4;
  NSError *v5;
  void *v6;

  v4 = a2;
  v5 = a3;
  if (v5)
  {
    v6 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006D518(v6, v5, v4);
  }

  return 1;
}

void sub_1000311CC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000312AC(id a1)
{
  ConnectionManager *v1;
  void *v2;

  v1 = objc_alloc_init(ConnectionManager);
  v2 = (void *)qword_1000C9098;
  qword_1000C9098 = (uint64_t)v1;

}

id sub_100033DFC(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUIDString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString"));
  v7 = objc_msgSend(v4, "isEqual:", v6);

  return v7;
}

void sub_1000348B8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v4 = *(void **)(a1 + 32);
  v5 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "outputStream"));
  v6 = objc_retainAutorelease(v5);
  v7 = objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "length");

  objc_msgSend(v9, "write:maxLength:", v7, v8);
}

void sub_100034934(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v4 = *(void **)(a1 + 32);
  v5 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "outputStream"));
  v6 = objc_retainAutorelease(v5);
  v7 = objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "length");

  objc_msgSend(v9, "write:maxLength:", v7, v8);
}

id sub_100035C58(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "disconnectPeripheral:force:", *(_QWORD *)(a1 + 40), 0);
}

id sub_100035D98(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "disconnectPeripheral:force:", *(_QWORD *)(a1 + 40), 1);
}

id sub_100035EBC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "disconnectPeripheral:force:", *(_QWORD *)(a1 + 40), 0);
}

void sub_100036168(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10003617C(char *category)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.bluetooth", category);
  v2 = (void *)qword_1000C9178;
  qword_1000C9178 = (uint64_t)v1;

}

void sub_100039BD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100039BE8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100039BF8(uint64_t a1)
{

}

void sub_100039C00(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v8;
  unsigned int v9;
  id v10;

  v10 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "UUID"));
  v9 = objc_msgSend(v8, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v9)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }

}

void sub_100039E08(id a1, CBService *a2, ClientService *a3, BOOL *a4)
{
  -[ClientService stop](a3, "stop");
}

void sub_100039F30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100039F48(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;

  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(v6, "isStarted") & 1) == 0)
  {
    v7 = objc_msgSend(v6, "priority");
    if (v7 >= objc_msgSend(*(id *)(a1 + 32), "startPriority"))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      v8 = objc_msgSend(v6, "priority");
      if (v8 == objc_msgSend(*(id *)(a1 + 32), "startPriority"))
      {
        v9 = (void *)qword_1000C9178;
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
        {
          v10 = v9;
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUID"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peripheral"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "name"));
          v15 = 138412546;
          v16 = v11;
          v17 = 2112;
          v18 = v13;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Starting service \"%@\" on peripheral \"%@\"", (uint8_t *)&v15, 0x16u);

        }
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "startingClientServices"));
        objc_msgSend(v14, "addObject:", v6);

        objc_msgSend(v6, "start");
      }
    }
  }

}

void sub_10003A45C(id a1, CBService *a2, ClientService *a3, BOOL *a4)
{
  -[ClientService stop](a3, "stop");
}

void sub_10003A96C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a41, 8);
  _Unwind_Resume(a1);
}

id sub_10003A990(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id result;

  result = objc_msgSend(a3, "isPrimary");
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void sub_10003B6F0(id a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init((Class)SDRDiagnosticReporter);
  v2 = (void *)qword_1000C90B0;
  qword_1000C90B0 = (uint64_t)v1;

}

void sub_10003B718(id a1, NSDictionary *a2)
{
  NSDictionary *v2;
  NSObject *v3;
  int v4;
  NSDictionary *v5;

  v2 = a2;
  v3 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Response from DiagnosticReporter - %@", (uint8_t *)&v4, 0xCu);
  }

}

void sub_10003DA74(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "setIsValid:", 0);
  v5 = *(void **)(a1 + 32);
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CBErrorDomain, 3, 0));
  objc_msgSend(v5, "signalCommandCondition:error:", v4, v6);

}

void sub_10003DD74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10003DD94(uint64_t a1)
{
  void *v1;
  id v2;

  v2 = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "systemMonitor"));
  objc_msgSend(v2, "screenStateChanged:", objc_msgSend(v1, "screenOn"));

}

uint64_t sub_10003F658(uint64_t a1)
{
  return IOAllowPowerChange((io_connect_t)objc_msgSend(*(id *)(a1 + 32), "pmService"), *(_QWORD *)(a1 + 40));
}

void sub_10003F9DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10003F9F4(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (!objc_msgSend(a3, "type") && (objc_msgSend(v7, "isNotifying") & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }

}

void sub_10003FBAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10003FBD0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10003FBE0(uint64_t a1)
{

}

void sub_10003FBE8(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;
  id v9;

  v9 = a2;
  v8 = a3;
  if (*(_DWORD *)(a1 + 40) == objc_msgSend(v8, "ID")
    && *(_DWORD *)(a1 + 44) == objc_msgSend(v8, "type"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

void sub_10003FEDC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

id sub_10003FF08()
{
  void *v0;

  return objc_msgSend(v0, "type");
}

id sub_10003FF14()
{
  void *v0;

  return objc_msgSend(v0, "ID");
}

void sub_1000402A8(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  id v6;
  id v7;
  unsigned int v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "lock"));
  objc_msgSend(v4, "lock");

  v5 = objc_loadWeakRetained(v2);
  v6 = objc_msgSend(v5, "state");

  v7 = objc_loadWeakRetained(v2);
  v8 = objc_msgSend(v7, "pending");

  v9 = objc_loadWeakRetained(v2);
  objc_msgSend(v9, "setPending:", 0);

  v10 = objc_loadWeakRetained(v2);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lock"));
  objc_msgSend(v11, "unlock");

  if (v8)
  {
    v12 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
    objc_msgSend(v12, "chargerStateChanged:", v6);

  }
}

void sub_10004077C(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "pairingInfoCompleted");

}

void sub_100042C00(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_100045A2C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t sub_100045A40()
{
  uint64_t v0;

  return v0;
}

void sub_100045A90(id a1)
{
  ServerServiceManager *v1;
  void *v2;

  if (!sub_100011A90())
  {
    v1 = objc_alloc_init(ServerServiceManager);
    v2 = (void *)qword_1000C90D8;
    qword_1000C90D8 = (uint64_t)v1;

  }
}

void sub_100045E3C(id a1, CBMutableService *a2, ServerService *a3, BOOL *a4)
{
  -[ServerService stop](a3, "stop");
}

id sub_100046300(uint64_t a1, uint64_t a2, void *a3)
{
  return _objc_msgSend(a3, "peripheralManagerDidUpdateState:", *(_QWORD *)(a1 + 32));
}

void sub_100046C58(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;

  v8 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "UUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString"));
  v7 = objc_msgSend(v6, "isEqualToString:", CBUUIDAppleNotificationCenterServiceString);

  if (v7)
    objc_msgSend(v8, "peripheralManager:central:didUpdateANCSAuthorization:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));

}

void sub_100046E64(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_100046E78(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void sub_1000472DC(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint8_t v7[16];

  dispatch_group_wait(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 40), 0xFFFFFFFFFFFFFFFFLL);
  v2 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Stop DoAPSoundSensorRemoteDevice - Queue is clean", v7, 2u);
  }
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = 0;

}

id sub_100047714(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  unsigned __int8 v5;

  v2 = *(void **)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  if (v1)
  {
    objc_msgSend(v1, "codec");
    v3 = v5;
  }
  else
  {
    v3 = 0;
  }
  return objc_msgSend(v2, "selectCodec:", v3);
}

id sub_100047760(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)DoAPSoundSensorRemoteDevice;
  return objc_msgSendSuper2(&v2, "notifyDidStart");
}

void sub_100047A28(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100047FBC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_100047FD0(uint64_t a1)
{
  void *v2;
  dispatch_semaphore_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "doapAudioStop"));

  if (!v2)
  {
    v3 = dispatch_semaphore_create(0);
    objc_msgSend(*(id *)(a1 + 32), "setDoapAudioStop:", v3);

  }
  return _objc_msgSend(*(id *)(a1 + 32), "waitForSoundSensorAudioToStop:", &stru_1000AE000);
}

void sub_100048914(id a1, NSNumber *a2, HIDKeyholeUserDevice *a3, BOOL *a4)
{
  HIDKeyholeUserDevice *v4;

  v4 = a3;
  -[HIDKeyholeUserDevice setGetReportKeyholeID:](v4, "setGetReportKeyholeID:", 240);
  -[HIDKeyholeUserDevice setUseKeyholeOnGet:](v4, "setUseKeyholeOnGet:", 1);

}

id sub_100049638(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "stictionCollectionGate");
}

id sub_100049640(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTimer:", 0);
}

id sub_100049F44(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "authCompleted:", 1);
}

id sub_10004A064(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "authCompleted:", 0);
}

void sub_10004AABC(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x14u);
}

void sub_10004AAD0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void sub_10004AAE4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void sub_10004AB0C(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_10004AB18(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xEu);
}

void sub_10004AEC4(id a1)
{
  BTLEXpcServer *v1;
  void *v2;

  v1 = objc_alloc_init(BTLEXpcServer);
  v2 = (void *)qword_1000C90E8;
  qword_1000C90E8 = (uint64_t)v1;

}

id sub_10004B6F8(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "handleEvent:", a2);
}

void sub_10004C198(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006AB14(a1, v5, v4);
  }

}

void sub_10004C738(id a1)
{
  FitnessDeviceManager *v1;
  void *v2;

  v1 = objc_alloc_init(FitnessDeviceManager);
  v2 = (void *)qword_1000C9100;
  qword_1000C9100 = (uint64_t)v1;

}

id sub_10004D1B0(uint64_t a1, void *a2)
{
  return _objc_msgSend(a2, "handleDevicePairingChangeCallback");
}

id sub_10004D1B8(uint64_t a1, void *a2)
{
  return _objc_msgSend(a2, "handlePeripheralStatusChangeCallback");
}

void sub_10004D4AC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10004D600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10004D74C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10004EB04(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  unsigned int v15;
  unsigned int v16;
  void *v17;
  _BOOL4 v18;
  NSObject *v19;
  void *v20;
  unsigned __int8 v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  _BYTE v37[128];

  v5 = a2;
  v30 = a3;
  if (!v30)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    if (!v7)
      goto LABEL_25;
    v8 = v7;
    v9 = *(_QWORD *)v32;
LABEL_6:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v32 != v9)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v10);
      v12 = objc_msgSend(*(id *)(a1 + 32), "shouldConnectDevice:", v11);
      v13 = *(void **)(a1 + 32);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
      v15 = objc_msgSend(v13, "isPeripheralConnected:", v14);
      v16 = v15;
      if (v12)
        break;
      if (!v15)
      {

        goto LABEL_23;
      }
      v21 = objc_msgSend(*(id *)(a1 + 32), "shouldCollectFromDevice:", v11);

      if ((v21 & 1) == 0)
      {
        v22 = (void *)qword_1000C9178;
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
        {
          v23 = v22;
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
          *(_DWORD *)buf = 138412290;
          v36 = v24;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Disconnecting disabled device: %@", buf, 0xCu);

        }
        v25 = *(void **)(a1 + 32);
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
        objc_msgSend(v25, "disconnectDevice:", v26);
LABEL_21:

      }
LABEL_23:
      if (v8 == (id)++v10)
      {
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
        if (!v8)
          goto LABEL_25;
        goto LABEL_6;
      }
    }

    v17 = (void *)qword_1000C9178;
    v18 = os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (v18)
      {
        v19 = v17;
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
        *(_DWORD *)buf = 138412290;
        v36 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Tagged device “%@” is already connected", buf, 0xCu);

      }
      goto LABEL_23;
    }
    if (v18)
    {
      v27 = v17;
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
      *(_DWORD *)buf = 138412290;
      v36 = v28;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Connect tagged device “%@”", buf, 0xCu);

    }
    v29 = *(void **)(a1 + 32);
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
    objc_msgSend(v29, "connectPeripheral:", v26);
    goto LABEL_21;
  }
  v6 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    sub_100070540(v6);
LABEL_25:

}

void sub_10004F1B4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSMutableArray *v8;
  NSMutableArray *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  unsigned int v23;
  void *v24;
  id v25;
  void *v26;
  unsigned int v27;
  uint64_t v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  unsigned int v35;
  __int16 v36;
  NSMutableArray *v37;
  _BYTE v38[128];

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_1000705C0(v7);
  }
  else
  {
    v28 = a1;
    v8 = objc_opt_new(NSMutableArray);
    v9 = objc_opt_new(NSMutableArray);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v29 = v5;
    v10 = v5;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v31 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
          v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "name", v28));
          v17 = (void *)v16;
          if (v16)
            v18 = (const __CFString *)v16;
          else
            v18 = CFSTR("(loading)");
          -[NSMutableArray addObject:](v8, "addObject:", v18);

          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
          -[NSMutableArray addObject:](v9, "addObject:", v19);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v12);
    }

    v20 = (void *)qword_1000C9178;
    v21 = v28;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v20;
      v23 = objc_msgSend(v10, "count");
      *(_DWORD *)buf = 67109378;
      v35 = v23;
      v36 = 2112;
      v37 = v8;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Found %d peripherals with custom property “Fitness”: %@", buf, 0x12u);

    }
    v24 = *(void **)(v28 + 32);
    v25 = -[NSMutableArray copy](v9, "copy", v28);
    objc_msgSend(v24, "updatePairedDevices:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v21 + 32), "requestedQuantityTypes"));
    if (objc_msgSend(v26, "count"))
    {
      v27 = objc_msgSend(*(id *)(v21 + 32), "workoutInSession");

      if (v27)
        objc_msgSend(*(id *)(v21 + 32), "connectTaggedDevices");
    }
    else
    {

    }
    v5 = v29;
  }

}

void sub_10004FC44(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  os_log_t *v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  os_log_t v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  os_log_t *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  const __CFString *v35;
  _BYTE v36[128];

  v5 = a2;
  v27 = a3;
  if (v27)
  {
    v6 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_100070640(v6);
  }
  else
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v29;
      v10 = (os_log_t *)&qword_1000C9178;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v29 != v9)
            objc_enumerationMutation(v5);
          v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[ConnectionManager instance](ConnectionManager, "instance"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "peripheralForIdentifier:", v14));

          if (v15
            && objc_msgSend(v15, "state") != (id)2
            && (objc_msgSend(*(id *)(a1 + 32), "shouldConnectDevice:", v15) & 1) == 0)
          {
            v16 = *v10;
            if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
            {
              v17 = v16;
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
              v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "name"));
              v20 = v5;
              v21 = a1;
              v22 = v10;
              v23 = (void *)v19;
              *(_DWORD *)buf = 138412546;
              v24 = CFSTR("(loading)");
              if (v19)
                v24 = (const __CFString *)v19;
              v33 = v18;
              v34 = 2112;
              v35 = v24;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "DISCONNECTING %@ “%@”", buf, 0x16u);

              v10 = v22;
              a1 = v21;
              v5 = v20;

            }
            v25 = (void *)objc_claimAutoreleasedReturnValue(+[ConnectionManager instance](ConnectionManager, "instance"));
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
            objc_msgSend(v25, "cancelPeripheralConnectionForConnectOnceIdentifier:", v26);

          }
        }
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      }
      while (v8);
    }
  }

}

void sub_10005139C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_1000514B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000514D0(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "stopHeartRateScanTimer");

}

void sub_100051680(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100051698(id a1, NSError *a2)
{
  NSError *v2;
  void *v3;

  v2 = a2;
  if (v2)
  {
    v3 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_100070848(v3);
  }

}

void sub_1000517A4(id a1, NSError *a2)
{
  NSError *v2;
  void *v3;

  v2 = a2;
  if (v2)
  {
    v3 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_100070950(v3);
  }

}

void sub_100051C08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100051C2C(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100051CF8;
  v5[3] = &unk_1000AE140;
  objc_copyWeak(&v9, a1 + 6);
  v6 = v3;
  v7 = a1[4];
  v8 = a1[5];
  v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

  objc_destroyWeak(&v9);
}

void sub_100051CF8(uint64_t a1)
{
  _QWORD *WeakRetained;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  id obj;
  _QWORD v25[5];
  id v26;
  _QWORD *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  id v33;
  uint8_t v34[4];
  uint64_t v35;
  void *v36;
  _BYTE v37[128];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v23 = a1;
  obj = *(id *)(a1 + 32);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        v8 = (void *)WeakRetained[3];
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier", v23));
        v36 = v9;
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v36, 1));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "retrievePeripheralsWithIdentifiers:", v10));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));

        if (v12)
        {
          objc_msgSend(v12, "tag:", HKQuantityTypeIdentifierHeartRate);
          objc_msgSend(v12, "setCustomProperty:value:", CFSTR("Fitness"), CFSTR("1"));
          v13 = (void *)WeakRetained[4];
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
          v25[0] = _NSConcreteStackBlock;
          v25[1] = 3221225472;
          v25[2] = sub_100052020;
          v25[3] = &unk_1000AE118;
          v25[4] = v7;
          v26 = v12;
          v27 = WeakRetained;
          objc_msgSend(v13, "getEnabledStatusForPeripheral:withCompletion:", v14, v25);

        }
        else
        {
          v15 = (void *)qword_1000C9178;
          if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
            sub_1000709D0(v34, v15, v7, &v35);
        }

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    }
    while (v4);
  }

  v16 = objc_msgSend(*(id *)(v23 + 40), "mutableCopy");
  objc_msgSend(v16, "setObject:forKey:", CFSTR("1"), CFSTR("HRM_MIGRATION_COMPLETE"));
  v17 = *(void **)(v23 + 48);
  v18 = objc_msgSend(v16, "copy");
  objc_msgSend(v17, "setPersistentDomain:forName:", v18, CFSTR("com.apple.BTLEServer"));

  v19 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v20 = *(void **)(v23 + 32);
    v21 = v19;
    v22 = objc_msgSend(v20, "count");
    *(_DWORD *)buf = 134217984;
    v33 = v22;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "HRM migration complete. Migrated %lu devices", buf, 0xCu);

  }
}

void sub_100052020(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;

  v5 = a3;
  if (v5)
  {
    v6 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_100070A68(a1, v6);
    v7 = *(void **)(a1 + 40);
    v8 = CFSTR("1");
  }
  else
  {
    v7 = *(void **)(a1 + 40);
    if (a2)
      v8 = CFSTR("1");
    else
      v8 = CFSTR("0");
  }
  objc_msgSend(v7, "setCustomProperty:value:", CFSTR("UpdateHealth"), v8);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 32), "removeHealthServicePairing:withCompletion:");
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 72), "count"))
    objc_msgSend(*(id *)(a1 + 48), "updateScan");

}

void sub_100052128(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;

  v4 = a3;
  v5 = (void *)qword_1000C9178;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_100070AF8(a1, v5);
  }
  else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(void **)(a1 + 32);
    v7 = v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
    v10 = 138412290;
    v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Successfully migrated HRM device from HK to BT for identifier %@", (uint8_t *)&v10, 0xCu);

  }
}

Class sub_1000523F0(uint64_t a1)
{
  Class result;
  __int128 v3;
  uint64_t v4;

  if (!qword_1000C9118)
  {
    v3 = off_1000AE188;
    v4 = 0;
    qword_1000C9118 = _sl_dlopen(&v3, 0);
  }
  result = objc_getClass("HKActiveDataCollectionObserver");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  qword_1000C9110 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_1000524A4(uint64_t a1)
{
  Class result;
  __int128 v3;
  uint64_t v4;

  if (!qword_1000C9118)
  {
    v3 = off_1000AE188;
    v4 = 0;
    qword_1000C9118 = _sl_dlopen(&v3, 0);
  }
  result = objc_getClass("HKHealthStore");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  qword_1000C9120 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_100052558(uint64_t a1)
{
  Class result;
  __int128 v3;
  uint64_t v4;

  if (!qword_1000C9118)
  {
    v3 = off_1000AE188;
    v4 = 0;
    qword_1000C9118 = _sl_dlopen(&v3, 0);
  }
  result = objc_getClass("HKDataCollector");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  qword_1000C9128 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_10005260C(uint64_t a1)
{
  Class result;
  __int128 v3;
  uint64_t v4;

  if (!qword_1000C9118)
  {
    v3 = off_1000AE188;
    v4 = 0;
    qword_1000C9118 = _sl_dlopen(&v3, 0);
  }
  result = objc_getClass("HKUnit");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  qword_1000C9130 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_1000526C0(uint64_t a1)
{
  Class result;
  __int128 v3;
  uint64_t v4;

  if (!qword_1000C9140)
  {
    v3 = off_1000AE1A0;
    v4 = 0;
    qword_1000C9140 = _sl_dlopen(&v3, 0);
  }
  result = objc_getClass("AAAudioRoutingControl");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  qword_1000C9138 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_10005278C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

id sub_1000527A0(uint64_t a1, void *a2)
{
  return a2;
}

void sub_10005284C(id a1)
{
  NSObject *v1;
  UARPServiceUARPControllerManager *v2;
  void *v3;
  uint8_t v4[16];

  v1 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Creating UARPServiceUARPControllerManager", v4, 2u);
  }
  v2 = objc_opt_new(UARPServiceUARPControllerManager);
  v3 = (void *)qword_1000C9148;
  qword_1000C9148 = (uint64_t)v2;

}

void sub_1000532B8(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "uuid"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "uarpServiceForAccessoryUuid:", v4));
  objc_msgSend(v3, "sendData:", *(_QWORD *)(a1 + 48));

}

void sub_100053B84(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

id sub_100053B98(void *a1, const char *a2)
{
  return objc_msgSend(a1, "UTF8String");
}

id sub_1000541C0(uint64_t a1, void *a2)
{
  return _objc_msgSend(a2, "significantTimeChange");
}

void sub_100054AE8(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint8_t v7[16];

  dispatch_group_wait(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 40), 0xFFFFFFFFFFFFFFFFLL);
  v2 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Stop DoAPSiriRemoteDevice - Queue is clean", v7, 2u);
  }
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = 0;

}

id sub_100054F64(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  unsigned __int8 v5;

  v2 = *(void **)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  if (v1)
  {
    objc_msgSend(v1, "codec");
    v3 = v5;
  }
  else
  {
    v3 = 0;
  }
  return objc_msgSend(v2, "selectCodec:", v3);
}

id sub_100054FB0(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)DoAPSiriRemoteDevice;
  return objc_msgSendSuper2(&v2, "notifyDidStart");
}

void sub_100055278(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10005553C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char *v7;
  void *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;

  v3 = a2;
  v4 = v3;
  if (v3
    && ((v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "error")), v5, !v5)
     || (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error")),
         v7 = (char *)objc_msgSend(v6, "code"),
         v6,
         (unint64_t)(v7 - 2500) >= 0xC)))
  {
    v10 = *(id *)(a1 + 32);
    objc_sync_enter(v10);
    if (objc_msgSend(*(id *)(a1 + 32), "state") == 2)
    {
      v11 = (id)qword_1000C9178;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peripheral"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUIDString"));
        v19 = 138477827;
        v20 = v14;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "DoAPSiri - activateSiri: SiriActivation success for ID %{private}@ received while Active", (uint8_t *)&v19, 0xCu);

      }
    }
    else if (objc_msgSend(*(id *)(a1 + 32), "state") == 3)
    {
      v15 = (id)qword_1000C9178;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peripheral"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "UUIDString"));
        v19 = 138477827;
        v20 = v18;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "DoAPSiri - activateSiri: SiriActivation succeeded for ID %{private}@", (uint8_t *)&v19, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 32), "doapStateSet:", 4);
    }
    objc_sync_exit(v10);

  }
  else
  {
    v8 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_100071248(v8, v4);
    if (objc_msgSend(*(id *)(a1 + 32), "state") == 5)
    {
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "doapAudioStart"));
      dispatch_semaphore_signal(v9);

    }
    objc_msgSend(*(id *)(a1 + 32), "stopStreaming:", 6);
    objc_msgSend(*(id *)(a1 + 32), "clearState");
  }

}

void sub_1000557C0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100055974(id a1, AFSiriActivationResult *a2)
{
  AFSiriActivationResult *v2;
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AFSiriActivationResult error](v2, "error"));

  v4 = qword_1000C9178;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_1000712DC(v4, v2);
  }
  else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "DoAPSiri - SiriCancellation success", v5, 2u);
  }

}

void sub_100055DAC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_100055DC0(uint64_t a1)
{
  void *v2;
  dispatch_semaphore_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "doapAudioStop"));

  if (!v2)
  {
    v3 = dispatch_semaphore_create(0);
    objc_msgSend(*(id *)(a1 + 32), "setDoapAudioStop:", v3);

  }
  return objc_msgSend(*(id *)(a1 + 32), "waitForSiriAudioToStop:", &stru_1000AE268);
}

void sub_1000564E4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100056514(id a1, BOOL a2, NSError *a3)
{
  _BOOL4 v3;
  NSError *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  v4 = a3;
  v5 = qword_1000C9178;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "DoAPSiri - SiriMyriad Score accepted", v6, 2u);
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
  {
    sub_100071488();
  }

}

void sub_1000565B4(id a1, AFSiriActivationResult *a2)
{
  AFSiriActivationResult *v2;
  NSObject *v3;
  int v4;
  AFSiriActivationResult *v5;

  v2 = a2;
  v3 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "DoAPSiri - DoAP Button Press and Hold complete: %@", (uint8_t *)&v4, 0xCu);
  }

}

void sub_10005665C(id a1, AFSiriActivationResult *a2)
{
  AFSiriActivationResult *v2;
  NSObject *v3;
  int v4;
  AFSiriActivationResult *v5;

  v2 = a2;
  v3 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "DoAPSiri - DoAP Button Release complete: %@", (uint8_t *)&v4, 0xCu);
  }

}

void sub_100056804(uint64_t a1)
{
  NSObject *v2;
  dispatch_time_t v3;
  intptr_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  _QWORD block[5];
  id v19;
  NSErrorUserInfoKey v20;
  void *v21;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "doapAudioStart"));
  v3 = dispatch_time(0, 10000000000);
  v4 = dispatch_semaphore_wait(v2, v3);

  if (v4)
  {
    v5 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_100071518(v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Timed out after %lld seconds waiting to start Siri"), 10));
    v20 = NSLocalizedDescriptionKey;
    v21 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSMachErrorDomain, -536870186, v9));

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v11 = *(id *)(a1 + 32);
    objc_sync_enter(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "audioBuffer"));
    objc_msgSend(v12, "removeAllObjects");

    objc_sync_exit(v11);
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "doapAudioStart"));
    dispatch_semaphore_signal(v13);

    v14 = *(id *)(a1 + 32);
    objc_sync_enter(v14);
    objc_msgSend(*(id *)(a1 + 32), "doapStateSet:", 2);
    objc_sync_exit(v14);

    objc_msgSend(*(id *)(a1 + 32), "clearState");
  }
  else
  {
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(void **)(a1 + 40);
    v17 = *(NSObject **)(v15 + 32);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100056A64;
    block[3] = &unk_1000AD608;
    block[4] = v15;
    v19 = v16;
    dispatch_async(v17, block);

  }
}

void sub_100056A44(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100056A64(uint64_t a1)
{
  dispatch_semaphore_t v2;
  id *v3;
  _BYTE *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  unsigned int v15;
  signed int v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  NSErrorUserInfoKey v29;
  void *v30;

  v2 = dispatch_semaphore_create(0);
  v3 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "setDoapAudioStop:", v2);

  v4 = *(_BYTE **)(a1 + 32);
  if (v4[56] || v4[57])
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "audioBuffer"));

    if (v5)
    {
      v6 = *v3;
      objc_sync_enter(v6);
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v3, "audioBuffer"));
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(_QWORD *)v25 != v9)
              objc_enumerationMutation(v7);
            v11 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v3, "doapAudioRelay"));
            objc_msgSend(v12, "sendAudioFrame:", v11);

          }
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        }
        while (v8);
      }

      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v3, "audioBuffer"));
      objc_msgSend(v13, "removeAllObjects");

      objc_sync_exit(v6);
    }
    v14 = *v3;
    objc_sync_enter(v14);
    objc_msgSend(*v3, "doapStateSet:", 5);
    objc_sync_exit(v14);
  }
  else
  {
    v15 = objc_msgSend(v4, "startStreaming");
    if (v15)
    {
      v16 = v15;
      v17 = (void *)qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
        sub_100071588(a1 + 32, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Fail to send DoAP StartStream message - device state(%d)"), objc_msgSend(*v3, "state")));
      v29 = NSLocalizedDescriptionKey;
      v30 = v18;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1));
      v14 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSMachErrorDomain, v16, v19));

      objc_msgSend(*v3, "setDoapAudioStop:", 0);
      v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(*v3, "doapAudioStart"));
      dispatch_semaphore_signal(v20);

    }
    else
    {
      v14 = 0;
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v3, "audioBuffer"));

    if (v21)
    {
      v22 = *v3;
      objc_sync_enter(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v3, "audioBuffer"));
      objc_msgSend(v23, "removeAllObjects");

      objc_sync_exit(v22);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void sub_100056D98(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100057328(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_100057350(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "waitForSiriAudioToStop:", *(_QWORD *)(a1 + 40));
}

void sub_10005745C(uint64_t a1)
{
  void **v2;
  unsigned int v3;
  void *v4;
  unsigned int v5;
  signed int v6;
  void *v7;
  id *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  NSErrorUserInfoKey v18;
  void *v19;

  v2 = (void **)(a1 + 32);
  v3 = objc_msgSend(*(id *)(a1 + 32), "state");
  v4 = *v2;
  if (v3 == 5)
  {
    v5 = objc_msgSend(v4, "stopStreaming:", 0);
    if (v5)
    {
      v6 = v5;
      v7 = (void *)qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
        sub_100071688((uint64_t)v2, v7);
      v8 = (id *)(a1 + 32);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Fail to send DoAP StopStream message - device state(%d)"), objc_msgSend(*(id *)(a1 + 32), "state")));
      v18 = NSLocalizedDescriptionKey;
      v19 = v9;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSMachErrorDomain, v6, v10));

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "doapAudioStart"));
      dispatch_semaphore_signal(v12);

      v13 = *v8;
      objc_sync_enter(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v8, "audioBuffer"));
      objc_msgSend(v14, "removeAllObjects");

      objc_sync_exit(v13);
    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      objc_msgSend(*(id *)(a1 + 32), "setLastAudioDate:", v16);

      objc_msgSend(*(id *)(a1 + 32), "waitForSiriAudioToStop:", *(_QWORD *)(a1 + 40));
    }
  }
  else if (objc_msgSend(v4, "state") == 4)
  {
    objc_msgSend(*(id *)(a1 + 32), "stopStreaming:", 6);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    obj = *(id *)(a1 + 32);
    objc_sync_enter(obj);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "audioBuffer"));
    objc_msgSend(v15, "removeAllObjects");

    objc_sync_exit(obj);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0);
  }
}

void sub_100057728(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1000579D0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 8u);
}

id sub_1000579DC(uint64_t a1, void *a2)
{
  return a2;
}

id sub_1000579E8()
{
  void *v0;

  return objc_msgSend(v0, "state");
}

id sub_100059350()
{
  void *v0;

  return objc_msgSend(v0, "authInfo");
}

void sub_10005935C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

const void *sub_100059368(const __CFDictionary *a1)
{
  const void *v1;

  return CFDictionaryGetValue(a1, v1);
}

void sub_1000597E0(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v8, "showsInNotificationCenter"))
        {
          v9 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sectionID"));
          objc_msgSend(v9, "requestNoticesBulletinsForSectionID:", v10);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

id sub_100059900(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "callStatusChanged");
}

id sub_100059908(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "callHistoryChanged:", 1);
}

id sub_100059914(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "voicemailsChanged:", 1);
}

void sub_1000599F4(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bbObserver"));
  objc_msgSend(v1, "invalidate");

}

id sub_100059A24(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDelegate:", 0);
}

void sub_10005AA40(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tuIncomingCallAlerts"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  objc_msgSend(*(id *)(a1 + 32), "removeAlert:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "tuIncomingCallAlerts"));
  objc_msgSend(v6, "removeObjectForKey:", v4);

}

void sub_10005AACC(uint64_t a1, void *a2)
{
  id v3;
  ANCIncomingCallAlert *v4;
  void *v5;
  void *v6;
  ANCIncomingCallAlert *v7;

  v3 = a2;
  v4 = [ANCIncomingCallAlert alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "tuCallCenter"));
  v7 = -[ANCIncomingCallAlert initWithCall:callCenter:](v4, "initWithCall:callCenter:", v3, v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "tuIncomingCallAlerts"));
  objc_msgSend(v6, "setObject:forKey:", v7, v3);

  objc_msgSend(*(id *)(a1 + 32), "addAlert:isPreExisting:", v7, 0);
}

void sub_10005AB74(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tuActiveCallAlerts"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  objc_msgSend(*(id *)(a1 + 32), "removeAlert:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "tuActiveCallAlerts"));
  objc_msgSend(v6, "removeObjectForKey:", v4);

}

void sub_10005AC00(uint64_t a1, void *a2)
{
  id v3;
  ANCActiveCallAlert *v4;
  void *v5;
  void *v6;
  ANCActiveCallAlert *v7;

  v3 = a2;
  v4 = [ANCActiveCallAlert alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "tuCallCenter"));
  v7 = -[ANCActiveCallAlert initWithCall:callCenter:](v4, "initWithCall:callCenter:", v3, v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "tuActiveCallAlerts"));
  objc_msgSend(v6, "setObject:forKey:", v7, v3);

  objc_msgSend(*(id *)(a1 + 32), "addAlert:isPreExisting:", v7, 0);
}

id sub_10005AE10(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "callHistoryChanged:", 0);
}

void sub_10005AFBC(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "chMissedCallAlerts"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueId"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v6));

  objc_msgSend(*(id *)(a1 + 32), "removeAlert:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "chMissedCallAlerts"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueId"));

  objc_msgSend(v7, "removeObjectForKey:", v8);
}

void sub_10005B078(uint64_t a1, void *a2)
{
  id v3;
  ANCMissedCallAlert *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  ANCMissedCallAlert *v9;

  v3 = a2;
  v4 = [ANCMissedCallAlert alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "chManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
  v9 = -[ANCMissedCallAlert initWithRecentCall:manager:queue:](v4, "initWithRecentCall:manager:queue:", v3, v5, v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "chMissedCallAlerts"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uniqueId"));

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, v8);
  objc_msgSend(*(id *)(a1 + 32), "addAlert:isPreExisting:", v9, *(unsigned __int8 *)(a1 + 40));

}

id sub_10005B1C4(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "voicemailsChanged:", 0);
}

BOOL sub_10005B2AC(id a1, VMVoicemail *a2)
{
  VMVoicemail *v2;
  unsigned __int8 v3;

  v2 = a2;
  if ((-[VMVoicemail isBlocked](v2, "isBlocked") & 1) != 0
    || (-[VMVoicemail isDeleted](v2, "isDeleted") & 1) != 0
    || (-[VMVoicemail isTrashed](v2, "isTrashed") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v3 = -[VMVoicemail isUnread](v2, "isUnread");
  }

  return v3;
}

void sub_10005B308(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "vvVoicemailAlerts"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  objc_msgSend(*(id *)(a1 + 32), "removeAlert:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "vvVoicemailAlerts"));
  objc_msgSend(v6, "removeObjectForKey:", v4);

}

void sub_10005B394(uint64_t a1, void *a2)
{
  id v3;
  ANCVoicemailAlert *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  ANCVoicemailAlert *v9;

  v3 = a2;
  v4 = [ANCVoicemailAlert alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "vvManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "lazyContactStore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
  v9 = -[ANCVoicemailAlert initWithVoicemail:manager:contactStore:queue:](v4, "initWithVoicemail:manager:contactStore:queue:", v3, v5, v6, v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "vvVoicemailAlerts"));
  objc_msgSend(v8, "setObject:forKey:", v9, v3);

  objc_msgSend(*(id *)(a1 + 32), "addAlert:isPreExisting:", v9, *(unsigned __int8 *)(a1 + 40));
}

void sub_10005EF2C(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", *(unsigned __int8 *)(a1 + 40)));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "powerSourceDetails"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("Current Capacity"));

}

void sub_10005F12C(uint64_t a1)
{
  unsigned int v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  id v13;

  v2 = *(_BYTE *)(a1 + 40) & 3;
  if (v2 >= 2)
  {
    if (v2 == 2)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "powerSourceDetails"));
      v3 = v4;
      v5 = &__kCFBooleanFalse;
    }
    else
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "powerSourceDetails"));
      v3 = v4;
      v5 = &__kCFBooleanTrue;
    }
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("Is Present"));
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "powerSourceDetails"));
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("Is Present"));
  }

  v6 = (*(unsigned __int8 *)(a1 + 40) >> 2) & 3;
  if (v6 >= 2)
  {
    if (v6 == 2)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "powerSourceDetails"));
      v7 = v8;
      v9 = CFSTR("AC Power");
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "powerSourceDetails"));
      v7 = v8;
      v9 = CFSTR("Battery Power");
    }
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("Power Source State"));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "powerSourceDetails"));
    objc_msgSend(v7, "removeObjectForKey:", CFSTR("Power Source State"));
  }

  v10 = (*(unsigned __int8 *)(a1 + 40) >> 4) & 3;
  if (v10 >= 2)
  {
    if (v10 == 2)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "powerSourceDetails"));
      v12 = &__kCFBooleanFalse;
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "powerSourceDetails"));
      v12 = &__kCFBooleanTrue;
    }
    v13 = v11;
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("Is Charging"));
  }
  else
  {
    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "powerSourceDetails"));
    objc_msgSend(v13, "removeObjectForKey:", CFSTR("Is Charging"));
  }

}

id sub_10005FFA8(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "batteryLevelDidChange");
}

void sub_10006033C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_100060394(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_100060520(uint64_t a1)
{
  id v2;
  id v3;

  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 1)
    objc_msgSend(*(id *)(a1 + 32), "doapStateSet:", 2);
  objc_sync_exit(v2);

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "service"));
  objc_msgSend(v3, "doapDeviceDidStart");

}

void sub_100060594(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100060600(uint64_t a1)
{
  id v2;
  id v3;

  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  objc_msgSend(*(id *)(a1 + 32), "doapStateSet:", 8);
  objc_sync_exit(v2);

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "service"));
  objc_msgSend(v3, "doapDeviceDidStop");

}

void sub_100060664(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000608AC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100060A18(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100061074(id a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init((Class)HKHealthStore);
  v2 = (void *)qword_1000C9160;
  qword_1000C9160 = (uint64_t)v1;

}

void sub_100061634(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_1000722B4(a1, v5, v4);
  }

}

void sub_10006200C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006AB14(a1, v5, v4);
  }

}

void sub_100064F24(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_100072880(a1, v5, v4);
  }

}

void sub_100065258(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_100072880(a1, v5, v4);
  }

}

void sub_100065FF0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void sub_100066004(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

id sub_100066014(uint64_t a1, void *a2)
{
  return a2;
}

id sub_1000660E4(void *a1, const char *a2, unsigned __int8 a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(a1, "getReport:reportLength:reportID:reportType:", a4, a5, a3, a2);
}

id sub_1000660FC(void *a1, const char *a2, unsigned __int8 a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(a1, "setReport:reportLength:reportID:reportType:", a4, a5, a3, a2);
}

void sub_1000665B8(uint64_t a1, const void *a2)
{
  objc_msgSend(*(id *)(a1 + 32), "supportedCommandsDidChange:", a2);
  CFRelease(a2);
}

id sub_1000665E4(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "applicationDidChange:", a2);
}

id sub_1000665F0(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "playbackStateDidChange:", a2);
}

id sub_1000665FC(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "infoDidChange:", a2);
}

void sub_1000673EC(uint64_t a1, const void *a2)
{
  objc_msgSend(*(id *)(a1 + 32), "supportedCommandsDidChange:", a2);
  CFRelease(a2);
}

id sub_100067470(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "applicationDidChange:", a2);
}

id sub_1000674D4(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "playbackStateDidChange:", a2);
}

id sub_100067540(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "infoDidChange:", a2);
}

void sub_1000691F0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x2Eu);
}

double sub_100069204()
{
  unsigned int v0;

  return (double)v0 * 0.0009765625;
}

void sub_100069218(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  sub_100007498(a1);
  v2 = objc_msgSend((id)sub_1000074A8(), "peripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  sub_1000073C4();
  sub_1000073E4((void *)&_mh_execute_header, v5, v6, "UDS reigster new user failed for peripheral \"%{private, mask.hash}@\"", v7, v8, v9, v10, v11);

  sub_1000073F8();
}

void sub_1000692AC(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  sub_100007498(a1);
  v2 = objc_msgSend((id)sub_1000074A8(), "peripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  sub_1000073C4();
  sub_1000073E4((void *)&_mh_execute_header, v5, v6, "UDS consent procedure failed for peripheral \"%{private, mask.hash}@\"", v7, v8, v9, v10, v11);

  sub_1000073F8();
}

void sub_100069340(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  sub_100007498(a1);
  v2 = objc_msgSend((id)sub_1000074A8(), "peripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  sub_1000073C4();
  sub_1000073E4((void *)&_mh_execute_header, v5, v6, "UDS delete user data failed for peripheral \"%{private, mask.hash}@\"", v7, v8, v9, v10, v11);

  sub_1000073F8();
}

void sub_1000693D4(void *a1)
{
  NSObject *v1;
  id v2;
  void *v3;
  void *v4;
  uint8_t v5[40];

  sub_1000074A0(a1);
  v2 = objc_msgSend((id)sub_1000074A8(), "peripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  sub_100007444();
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "UDS CP Op timeout for peripheral \"%{private, mask.hash}@\" pendingOpCode %d", v5, 0x1Cu);

  sub_100007408();
}

void sub_100069484()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  sub_1000074C0();
  sub_1000074A0(v1);
  v2 = objc_msgSend((id)sub_1000074B4(), "peripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  sub_100007418();
  sub_100007484((void *)&_mh_execute_header, v5, v6, "UDS characteristic discovery failed for peripheral \"%{private, mask.hash}@\": error %@", v7, v8, v9, v10, v11);

  sub_100007408();
}

void sub_100069518()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  sub_1000074C0();
  sub_1000074A0(v1);
  v2 = objc_msgSend((id)sub_1000074B4(), "peripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  sub_100007418();
  sub_100007484((void *)&_mh_execute_header, v5, v6, "UDS characteristic update value failed for peripheral \"%{private, mask.hash}@\": error %@", v7, v8, v9, v10, v11);

  sub_100007408();
}

void sub_1000695AC()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  sub_1000074C0();
  sub_1000074A0(v1);
  v2 = objc_msgSend((id)sub_1000074B4(), "peripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  sub_100007418();
  sub_100007484((void *)&_mh_execute_header, v5, v6, "UDS characteristic subscription failed for peripheral \"%{private, mask.hash}@\": error %@", v7, v8, v9, v10, v11);

  sub_100007408();
}

void sub_100069640(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  sub_1000074A0(a1);
  v2 = objc_msgSend((id)sub_1000074B4(), "peripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  sub_1000073C4();
  sub_100007470((void *)&_mh_execute_header, v5, v6, "UDS CP invalid response value received from peripheral \"%{private, mask.hash}@\": invalid responseVal %d", v7, v8, v9, v10, v11);

  sub_100007408();
}

void sub_1000696E4()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  sub_1000074C0();
  sub_1000074A0(v1);
  v2 = objc_msgSend((id)sub_1000074B4(), "peripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  sub_100007444();
  sub_100007470((void *)&_mh_execute_header, v5, v6, "UDS CP response for peripheral \"%{private, mask.hash}@\": OpCode %u not supported", v7, v8, v9, v10, v11);

  sub_100007408();
}

void sub_10006977C(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  sub_100007498(a1);
  v2 = objc_msgSend((id)sub_1000074A8(), "peripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  sub_1000073C4();
  sub_1000073E4((void *)&_mh_execute_header, v5, v6, "User CP response for peripheral \"%{private, mask.hash}@\": respValue parse failed", v7, v8, v9, v10, v11);

  sub_1000073F8();
}

void sub_100069810(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  sub_100007498(a1);
  v2 = objc_msgSend((id)sub_1000074A8(), "peripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  sub_1000073C4();
  sub_1000073E4((void *)&_mh_execute_header, v5, v6, "User CP response for peripheral \"%{private, mask.hash}@\": requestedOpCode parse failed", v7, v8, v9, v10, v11);

  sub_1000073F8();
}

void sub_1000698A4()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  sub_1000074C0();
  sub_1000074A0(v1);
  v2 = objc_msgSend((id)sub_1000074B4(), "peripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  sub_100007444();
  sub_100007470((void *)&_mh_execute_header, v5, v6, "User CP response for peripheral \"%{private, mask.hash}@\": invalid opCode %d", v7, v8, v9, v10, v11);

  sub_100007408();
}

void sub_10006993C(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  sub_100007498(a1);
  v2 = objc_msgSend((id)sub_1000074A8(), "peripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  sub_1000073C4();
  sub_1000073E4((void *)&_mh_execute_header, v5, v6, "User CP response for peripheral \"%{private, mask.hash}@\": opCode parse failed", v7, v8, v9, v10, v11);

  sub_1000073F8();
}

void sub_1000699D0(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  sub_100007498(a1);
  v2 = objc_msgSend((id)sub_1000074A8(), "peripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  sub_1000073C4();
  sub_1000073E4((void *)&_mh_execute_header, v5, v6, "Unexpected User CP response for peripheral \"%{private, mask.hash}@\"", v7, v8, v9, v10, v11);

  sub_1000073F8();
}

void sub_100069A64(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;

  v3 = sub_100007498(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "identifier"));
  v6 = 138412290;
  v7 = v4;
  sub_10000A1CC((void *)&_mh_execute_header, v3, v5, "createDatum for qty:%@ failed to soft link HKQuantity or HKQuantityDatum class", (uint8_t *)&v6);

}

void sub_100069B00(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v10 = 138412802;
  v11 = v7;
  v12 = 2112;
  v13 = v8;
  v14 = 2112;
  v15 = v9;
  _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "InsertDatums failed for “%@” - %@: %@", (uint8_t *)&v10, 0x20u);

}

void sub_100069BF0(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;

  v5 = sub_100007498(a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "peripheral"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
  v8 = 138412546;
  v9 = v7;
  v10 = 2112;
  v11 = a3;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to create data collector for device “%@” quantity type %@", (uint8_t *)&v8, 0x16u);

  sub_1000073F8();
}

void sub_100069CAC(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "createHKDevice called with null device", v1, 2u);
}

void sub_100069CEC(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;

  v3 = sub_100007498(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "peripheral"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  v7 = 138412290;
  v8 = v5;
  sub_10000A1CC((void *)&_mh_execute_header, v3, v6, "Could not create HKDevice for %@, could not soft load HKDevice class", (uint8_t *)&v7);

  sub_1000073F8();
}

void sub_100069D94(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000119D4((void *)&_mh_execute_header, a1, a3, "%s", a5, a6, a7, a8, 2u);
  sub_1000119E4();
}

void sub_100069E04(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000119D4((void *)&_mh_execute_header, a1, a3, "%s", a5, a6, a7, a8, 2u);
  sub_1000119E4();
}

void sub_100069E74(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000119D4((void *)&_mh_execute_header, a1, a3, "%s", a5, a6, a7, a8, 2u);
  sub_1000119E4();
}

void sub_100069EE4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000119D4((void *)&_mh_execute_header, a1, a3, "%s", a5, a6, a7, a8, 2u);
  sub_1000119E4();
}

void sub_100069F54(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000119D4((void *)&_mh_execute_header, a1, a3, "%s", a5, a6, a7, a8, 2u);
  sub_1000119E4();
}

void sub_100069FC4(int a1, NSObject *a2)
{
  _DWORD v2[2];
  __int16 v3;
  int v4;

  v2[0] = 67109376;
  v2[1] = a1;
  v3 = 1024;
  v4 = 175;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "error 0x%08X with set feature reportID 0x%02x", (uint8_t *)v2, 0xEu);
  sub_1000119E4();
}

void sub_10006A044(void *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v3 = sub_100011A88(a1);
  objc_msgSend(a2, "instanceID");
  sub_100011A7C();
  sub_100011A38((void *)&_mh_execute_header, v4, v5, "match for instance ID %u", v6, v7, v8, v9, v10);

  sub_1000119E4();
}

void sub_10006A0C0(uint8_t *a1, void *a2, void *a3, unsigned int *a4)
{
  NSObject *v7;
  unsigned int v8;

  v7 = a2;
  v8 = objc_msgSend(a3, "instanceID");
  *(_DWORD *)a1 = 67109120;
  *a4 = v8;
  _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Matched device management driver. Set Bond Management for instance ID %u", a1, 8u);

}

void sub_10006A134(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Matched AppleMultitouchDevice", buf, 2u);
}

void sub_10006A170(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000119D4((void *)&_mh_execute_header, a1, a3, "%s", a5, a6, a7, a8, 2u);
  sub_1000119E4();
}

void sub_10006A1E0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000119D4((void *)&_mh_execute_header, a1, a3, "%s", a5, a6, a7, a8, 2u);
  sub_1000119E4();
}

void sub_10006A250(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000119D4((void *)&_mh_execute_header, a1, a3, "%s", a5, a6, a7, a8, 2u);
  sub_1000119E4();
}

void sub_10006A2C0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000119D4((void *)&_mh_execute_header, a1, a3, "%s", a5, a6, a7, a8, 2u);
  sub_1000119E4();
}

void sub_10006A330(void *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v3 = sub_100011A88(a1);
  objc_msgSend(a2, "buttonData");
  sub_100011A7C();
  sub_100011A38((void *)&_mh_execute_header, v4, v5, "Button 0x%04X", v6, v7, v8, v9, v10);

  sub_1000119E4();
}

void sub_10006A3B0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100011A6C((void *)&_mh_execute_header, a2, a3, "Dropped multitouch data: %@", a5, a6, a7, a8, 2u);
  sub_1000119E4();
}

void sub_10006A41C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100011A4C();
  sub_1000119EC((void *)&_mh_execute_header, v0, v1, "Dropped multitouch packet with kMTStage_BreakTouch for pathID %u", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006A47C(void *a1, void *a2)
{
  NSObject *v3;
  uint8_t v4[8];

  v3 = sub_100011A88(a1);
  objc_msgSend(a2, "productID");
  sub_100011A7C();
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Input report for unknown productID 0x%02x", v4, 8u);

  sub_1000119E4();
}

void sub_10006A508()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100011A7C();
  sub_1000119EC((void *)&_mh_execute_header, v0, v1, "Unknown input report ID 0x%02x", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006A568(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;

  LOWORD(v3) = 1024;
  HIWORD(v3) = a2;
  sub_100011A24((void *)&_mh_execute_header, a2, a3, "Invalid report ID 0x%02X expecting 0x%02X", 67109376, v3);
  sub_1000119E4();
}

void sub_10006A5DC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000119D4((void *)&_mh_execute_header, a1, a3, "%s PART 2 GET success", a5, a6, a7, a8, 2u);
  sub_1000119E4();
}

void sub_10006A64C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000119D4((void *)&_mh_execute_header, a1, a3, "%s PART 1 SET success", a5, a6, a7, a8, 2u);
  sub_1000119E4();
}

void sub_10006A6BC()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  sub_100011A4C();
  LOWORD(v3) = 1024;
  HIWORD(v3) = v0;
  sub_100011A24((void *)&_mh_execute_header, v0, v1, "Invalid input report ID 0x%02X descriptor 0x%02X: both audio and inertial data present in descriptor", v2, v3);
  sub_1000119E4();
}

void sub_10006A728(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100011A6C((void *)&_mh_execute_header, a1, a3, "Timed out after %lld seconds waiting to start Siri", a5, a6, a7, a8, 0);
  sub_1000119E4();
}

void sub_10006A794()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000119FC();
  sub_100011A5C((void *)&_mh_execute_header, v0, v1, "Failed to start Siri: error 0x%08X with set feature reportID 0x%02X payload 0x%02X", v2, v3, v4, v5, v6);
  sub_1000119E4();
}

void sub_10006A7FC(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Stopping Siri session immediately.", v1, 2u);
  sub_100011A1C();
}

void sub_10006A838()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000119FC();
  sub_100011A5C((void *)&_mh_execute_header, v0, v1, "Failed to stop Siri: error 0x%08X with set feature reportID 0x%02X payload 0x%02X", v2, v3, v4, v5, v6);
  sub_1000119E4();
}

void sub_10006A89C(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to register endpoint \"%@\" with error %@", (uint8_t *)&v3, 0x16u);
  sub_1000119E4();
}

void sub_10006A91C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100011A6C((void *)&_mh_execute_header, a2, a3, "Failed to find endpoint for new pipe %@", a5, a6, a7, a8, 2u);
  sub_1000119E4();
}

void sub_10006A980(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100011A6C((void *)&_mh_execute_header, a2, a3, "Failed to find endpoint for disconnected pipe %@", a5, a6, a7, a8, 2u);
  sub_1000119E4();
}

void sub_10006A9E4(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v3 = sub_100007498(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "peripheral"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  sub_1000073C4();
  sub_1000073E4((void *)&_mh_execute_header, v6, v7, "Parse live observation data for peripheral \"%{private, mask.hash}@\" failed.", v8, v9, v10, v11, v12);

  sub_1000073F8();
}

void sub_10006AA7C(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v3 = sub_100007498(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "peripheral"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  sub_1000073C4();
  sub_1000073E4((void *)&_mh_execute_header, v6, v7, "Parse stored observation data for peripheral \"%{private, mask.hash}@\" failed due to unsupported observation type.", v8, v9, v10, v11, v12);

  sub_1000073F8();
}

void sub_10006AB14(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "peripheral"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v9 = 141558531;
  v10 = 1752392040;
  v11 = 2113;
  v12 = v7;
  v13 = 2114;
  v14 = v8;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Save sample for peripheral \"%{private, mask.hash}@\" failed : %{public}@", (uint8_t *)&v9, 0x20u);

  sub_100007408();
}

void sub_10006ABFC(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v3 = sub_100007498(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "peripheral"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  sub_1000073C4();
  sub_1000073E4((void *)&_mh_execute_header, v6, v7, "Value for peripheral \"%{private, mask.hash}@\" parse failed", v8, v9, v10, v11, v12);

  sub_1000073F8();
}

void sub_10006AC94(void *a1, void *a2, unsigned __int16 *a3)
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  int v14;

  v5 = a1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "peripheral"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
  v8 = *a3;
  v9 = 141558531;
  v10 = 1752392040;
  v11 = 2113;
  v12 = v7;
  v13 = 1024;
  v14 = v8;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Unit for peripheral \"%{private, mask.hash}@\": invalid unit %d", (uint8_t *)&v9, 0x1Cu);

  sub_100007408();
}

void sub_10006AD6C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "Failed to create device management interface", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006AD98()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "Failed to create touch interface", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006ADC4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "Failed to create motion interface", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006ADF0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "Failed to create haptics interface", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006AE1C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "Failed to create firmware upgrade interface", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006AE48()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "Failed to create force interface", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006AE74(void *a1, void *a2, char a3)
{
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  int v10;

  v5 = a1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "loggingIdentifier"));
  v7 = 138412546;
  v8 = v6;
  v9 = 1024;
  v10 = a3 & 1;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%@ unexpectedly receiving authentication status: success=%{BOOL}d", (uint8_t *)&v7, 0x12u);

}

void sub_10006AF34(os_log_t log)
{
  _DWORD v1[2];
  __int16 v2;
  int v3;

  v1[0] = 67109376;
  v1[1] = 255;
  v2 = 1024;
  v3 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Received reportID 0x%x on interface %u that collides with host generated report", (uint8_t *)v1, 0xEu);
}

void sub_10006AFBC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_1000188BC((void *)&_mh_execute_header, v0, v1, "Dev management Pipe connected", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006AFE8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_1000188BC((void *)&_mh_execute_header, v0, v1, "Dev management Pipe disconnected", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006B014()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "Received 'connect classic device' message without a device address", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006B040()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "Received 'disconnect classic device' message without a device address", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006B06C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "Received 'classic device unexpected disconnection' message without a device address", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006B098()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "Ignoring malformed 'version info request' message", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006B0C4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "Ignoring malformed 'version info response' message", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006B0F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "Received 'classic pair state request' message without a device address", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006B11C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "Ignoring malformed 'classic pair state response' message", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006B148()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "Ignoring malformed 'store classic link key request' message", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006B174()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "Ignoring malformed 'store classic link key response' message", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006B1A0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "Ignoring malformed 'store classic device settings' message", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006B1CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "Ignoring malformed 'notifiy primary bud side' message", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006B1F8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "Received 'LEA easy pair request' message without a device address", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006B224()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "Ignoring malformed 'LEA easy pair response' message", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006B250()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "Ignoring malformed 'LEA store bonding info request' message", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006B27C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "Ignoring malformed 'LEA store bonding info response' message", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006B2A8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100014CA4((void *)&_mh_execute_header, a1, a3, "GenericSiriRemoteListener create failed", a5, a6, a7, a8, 0);
  sub_100011A1C();
}

void sub_10006B2D8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100011A6C((void *)&_mh_execute_header, a2, a3, "GenericSiriRemote dropping Audio frame as length : %ld is not sufficient", a5, a6, a7, a8, 0);
}

void sub_10006B340(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100014CA4((void *)&_mh_execute_header, a1, a3, "GenericSiriRemote ignoring Audio frame with wrong format", a5, a6, a7, a8, 0);
  sub_100011A1C();
}

void sub_10006B370(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100011A6C((void *)&_mh_execute_header, a1, a3, "Timed out after %lld seconds waiting to start Siri", a5, a6, a7, a8, 0);
}

void sub_10006B3E0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100014CA4((void *)&_mh_execute_header, a1, a3, "Stopping Siri session immediately.", a5, a6, a7, a8, 0);
  sub_100011A1C();
}

void sub_10006B410(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 134218240;
  v4 = a1;
  v5 = 2048;
  v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "activeHIDDeviceCount: %lu -> %lu", (uint8_t *)&v3, 0x16u);
}

void sub_10006B494(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  os_log_t v6;
  os_log_type_t v7;
  const char *v8;
  uint8_t *v9;
  void *v10;

  v3 = sub_1000074A0(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "peripheral"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  sub_10001E7EC();
  _os_log_error_impl(v5, v6, v7, v8, v9, 0x20u);

  sub_100007408();
}

void sub_10006B558(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not create HKDevice for %@, could not soft load HKDevice class", (uint8_t *)&v2, 0xCu);
}

void sub_10006B5CC(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;

  v3 = a1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "peripheral"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  v6 = 138412290;
  v7 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "DeviceInformation update for %@ - No combo device to update", (uint8_t *)&v6, 0xCu);

  sub_1000073F8();
}

void sub_10006B67C(void *a1, void *a2, void *a3)
{
  void *v3;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;

  sub_1000074A0(a1);
  v6 = objc_msgSend((id)sub_10001E814(), "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "peripheral"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "userInfo"));
  sub_10001E7D8((void *)&_mh_execute_header, v10, v11, "RECEIVED DEVICE INFO UPDATE NOTIFICATION - name:%@ device UUID:%@ notification userinfo:%@", v12, v13, v14, v15, 2u);

  sub_10001E7C4();
}

void sub_10006B768(void *a1, void *a2)
{
  NSObject *v2;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  uint64_t v14;

  sub_1000074A0(a1);
  v4 = objc_msgSend((id)sub_10001E814(), "peripheral");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "cyclingPowerSensorLocationCharacteristic"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "value"));
  v9 = 138412802;
  v10 = v6;
  v11 = 2048;
  v12 = objc_msgSend(v8, "length");
  v13 = 2048;
  v14 = 1;
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Cycling Power Sensor Location Characteristic data length does not follow spec for %@, %lu bytes instead of %lu expected", (uint8_t *)&v9, 0x20u);

  sub_10001E7C4();
}

void sub_10006B854(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  os_log_t v7;
  os_log_type_t v8;
  const char *v9;
  uint8_t *v10;

  v3 = sub_1000074A0(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "peripheral"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  sub_10001E7FC();
  sub_10001E7EC();
  _os_log_error_impl(v6, v7, v8, v9, v10, 0x1Cu);

  sub_100007408();
}

void sub_10006B908()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "Could not create cycling speed HKQuantityType", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006B934()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "Could not create cycling cadence HKQuantityType", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006B960()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "Cadence data available but not requested", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006B98C(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  os_log_t v7;
  os_log_type_t v8;
  const char *v9;
  uint8_t *v10;

  v3 = a1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "peripheral"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  sub_10001E7FC();
  sub_10001E7EC();
  _os_log_error_impl(v6, v7, v8, v9, v10, 0x12u);

  sub_1000073F8();
}

void sub_10006BA34(void *a1, void *a2, id *a3)
{
  NSObject *v3;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int16 v12;
  uint8_t v13[32];
  __int16 v14;
  const __CFString *v15;

  v6 = a1;
  v7 = objc_msgSend((id)sub_10001E814(), "peripheral");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a3, "quantity"));
  objc_msgSend(v10, "_value");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "sensorLocationSideString"));
  sub_10001E7A0();
  v14 = v12;
  v15 = CFSTR("no matching datum");
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "“%@” READ CP Measurement POWER distributed qty:%f (%{public}@) (held, %{public}@)", v13, 0x2Au);

}

void sub_10006BB3C(void *a1, void *a2, id *a3)
{
  void *v3;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t v17;

  sub_1000074A0(a1);
  v6 = objc_msgSend((id)sub_10001E814(), "peripheral");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a3, "quantity"));
  objc_msgSend(v9, "_value");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "sensorLocationSideString"));
  sub_10001E7A0();
  sub_10001E7D8((void *)&_mh_execute_header, v11, v12, "“%@” READ CP Measurement POWER distributed qty:%f (%{public}@) (held, other reading is too old to match)", v13, v14, v15, v16, v17);

}

void sub_10006BC20()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "Missing Power Control Point characteristic", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006BC4C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "Missing Power Feature characteristic", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006BC78()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "Missing Power Vector characteristic", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006BCA4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "Missing Power Measurement characteristic", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006BCD0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "[Firefly] Failed to create device mgnt interface", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006BCFC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "[Firefly] Failed to create inertial interface", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006BD28()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "[Firefly] Failed to create radio interface", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006BD54()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "[Firefly] Failed to create force interface", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006BD80()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "[Firefly] Failed to create force input report set", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006BDAC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "[Firefly] Failed to create HID queue", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006BDD8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "[Firefly] Failed to create semaphore", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006BE04()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "[Firefly] Failed to create notify queue", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006BE30(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_100007498(a1);
  v2 = objc_msgSend((id)sub_1000074A8(), "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_1000073C4();
  sub_1000073E4((void *)&_mh_execute_header, v4, v5, "UDS consent failed for peripheral \"%{private, mask.hash}@\"", v6, v7, v8, v9, v10);

}

void sub_10006BEB8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100014CA4((void *)&_mh_execute_header, a1, a3, "Error creating GHS device", a5, a6, a7, a8, 0);
  sub_100011A1C();
}

void sub_10006BEE8()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  sub_1000074C0();
  v2 = v1;
  v3 = objc_msgSend((id)sub_1000074B4(), "peripheral");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  sub_100024924();
  sub_100024990((void *)&_mh_execute_header, v6, v7, "Read property “%@” from \"%{private, mask.hash}@\" = “%@” and can't convert it to a number", v8, v9, v10, v11, v12);

  sub_1000249B8();
}

void sub_10006BF88(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100014CA4((void *)&_mh_execute_header, a1, a3, "Missing observation characteristic", a5, a6, a7, a8, 0);
  sub_100011A1C();
}

void sub_10006BFB8()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  sub_1000074C0();
  v2 = v1;
  v3 = objc_msgSend((id)sub_1000074B4(), "peripheral");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  sub_100024924();
  sub_100024990((void *)&_mh_execute_header, v6, v7, "Read property \"%{public}@\" from \"%{private, mask.hash}@\" = \"%@\" and can't convert it to a number", v8, v9, v10, v11, v12);

  sub_1000249B8();
}

void sub_10006C058()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  sub_1000074C0();
  sub_1000074A0(v1);
  v2 = objc_msgSend((id)sub_1000074B4(), "peripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  sub_100007418();
  sub_100007484((void *)&_mh_execute_header, v5, v6, "Subscription characteristic failed for peripheral\"%{private, mask.hash}@\": error %@", v7, v8, v9, v10, v11);

  sub_100007408();
}

void sub_10006C0EC()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  sub_1000074C0();
  sub_1000074A0(v1);
  v2 = objc_msgSend((id)sub_1000074B4(), "peripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  sub_100007418();
  sub_100007484((void *)&_mh_execute_header, v5, v6, "Write characteristic failed for peripheral\"%{private, mask.hash}@\": error %@", v7, v8, v9, v10, v11);

  sub_100007408();
}

void sub_10006C180(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100014CA4((void *)&_mh_execute_header, a1, a3, "GHS control point unexpected opCode received", a5, a6, a7, a8, 0);
  sub_100011A1C();
}

void sub_10006C1B0(char a1, unsigned __int16 *a2, os_log_t log)
{
  const char *v3;
  int v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;

  v3 = "stored";
  v4 = *a2;
  if ((a1 & 1) != 0)
    v3 = "live";
  v5 = 136315394;
  v6 = v3;
  v7 = 1024;
  v8 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Missing observation type in %s health observation, flags: %u", (uint8_t *)&v5, 0x12u);
}

void sub_10006C250()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  sub_1000074C0();
  sub_1000074A0(v1);
  v2 = objc_msgSend((id)sub_1000074B4(), "peripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  sub_10002495C();
  sub_1000249A4((void *)&_mh_execute_header, v5, v6, "RACP response for peripheral \"%{private, mask.hash}@\": invalid opCode %d, expected opCode %d", v7, v8, v9, v10, v11);

  sub_10001E7C4();
}

void sub_10006C2F8(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  sub_100007498(a1);
  v2 = objc_msgSend((id)sub_1000074A8(), "peripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  sub_1000073C4();
  sub_1000073E4((void *)&_mh_execute_header, v5, v6, "RACP response for peripheral \"%{private, mask.hash}@\": opCode parse failed", v7, v8, v9, v10, v11);

  sub_1000073F8();
}

void sub_10006C38C(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  sub_100007498(a1);
  v2 = objc_msgSend((id)sub_1000074A8(), "peripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  sub_1000073C4();
  sub_1000073E4((void *)&_mh_execute_header, v5, v6, "Request retrieve stored observation for peripheral \"%{private, mask.hash}@\" failed", v7, v8, v9, v10, v11);

  sub_1000073F8();
}

void sub_10006C420(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  sub_100007498(a1);
  v2 = objc_msgSend((id)sub_1000074A8(), "peripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  sub_1000073C4();
  sub_1000073E4((void *)&_mh_execute_header, v5, v6, "Request retrieve last stored observation for peripheral \"%{private, mask.hash}@\" failed", v7, v8, v9, v10, v11);

  sub_1000073F8();
}

void sub_10006C4B4(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  sub_100007498(a1);
  v2 = objc_msgSend((id)sub_1000074A8(), "peripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  sub_1000073C4();
  sub_1000073E4((void *)&_mh_execute_header, v5, v6, "Request delete stored observation for peripheral \"%{private, mask.hash}@\" failed", v7, v8, v9, v10, v11);

  sub_1000073F8();
}

void sub_10006C548(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  sub_100007498(a1);
  v2 = objc_msgSend((id)sub_1000074A8(), "peripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  sub_1000073C4();
  sub_1000073E4((void *)&_mh_execute_header, v5, v6, "GHS connection idle timeout for peripheral \"%{private, mask.hash}@\"", v7, v8, v9, v10, v11);

  sub_1000073F8();
}

void sub_10006C5DC(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Received malformed command: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10006C650(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Received event %@", (uint8_t *)&v2, 0xCu);
}

void sub_10006C6C4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "Failed to create wake interface", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006C6F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "Failed to create firmware upgrade interface", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006C71C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "Failed to create force interface", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006C748()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10002C46C();
  sub_10002C460((void *)&_mh_execute_header, v0, v1, "XPC client connection: %@", v2);
  sub_1000119E4();
}

void sub_10006C7AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10002C46C();
  sub_100011A6C((void *)&_mh_execute_header, v0, v1, "XPC error: %@", v2, v3, v4, v5, v6);
  sub_1000119E4();
}

void sub_10006C80C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10002C46C();
  sub_100011A6C((void *)&_mh_execute_header, v0, v1, "Unexpected XPC event: %@", v2, v3, v4, v5, v6);
  sub_1000119E4();
}

void sub_10006C86C(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = sub_100007498(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "connection"));
  sub_10002C46C();
  sub_10002C460((void *)&_mh_execute_header, v3, v5, "XPC client disconnection: %@", v6);

  sub_10002C478();
}

void sub_10006C8F8(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = sub_100007498(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "description"));
  sub_10002C46C();
  sub_10002C460((void *)&_mh_execute_header, v3, v5, "Received XPC message: %@", v6);

  sub_10002C478();
}

void sub_10006C984(void *a1, void *a2)
{
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = sub_100007498(a1);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "UUIDString")));
  objc_msgSend(v4, "UTF8String");
  sub_10002C46C();
  sub_10002C460((void *)&_mh_execute_header, v3, v5, "handleUARPAACPTransportChangeMsg received from buds for UUID: %s", v6);

  sub_10002C478();
}

void sub_10006CA18(void *a1, void *a2)
{
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;

  v3 = sub_100007498(a1);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "UUIDString")));
  objc_msgSend(v4, "UTF8String");
  sub_10002C46C();
  v7 = 2048;
  v8 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "handleUARPDataOverAACPMsg got data, uuid: %s length: %lu", v6, 0x16u);

}

void sub_10006CAD8()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10002C46C();
  sub_10002C460((void *)&_mh_execute_header, v0, v1, "Sending XPC message: %@", v2);
  sub_1000119E4();
}

void sub_10006CB3C()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10002C46C();
  sub_10000A1CC((void *)&_mh_execute_header, v0, v1, "Unexpected Siri XPC server event: %@", v2);
  sub_1000119E4();
}

void sub_10006CBA0(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 134217984;
  *(_QWORD *)(a2 + 4) = a1;
  sub_10000A1CC((void *)&_mh_execute_header, a3, (uint64_t)a3, "DoAPAudioRelayHub previous Siri XPC connection still exists (%p). Tear that down.", (uint8_t *)a2);

}

void sub_10006CBEC(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 134217984;
  *(_QWORD *)(a2 + 4) = a1;
  sub_10000A1CC((void *)&_mh_execute_header, a3, (uint64_t)a3, "DoAPAudioRelayHub previous Sound Sensor XPC connection still exists (%p). Tear that down.", (uint8_t *)a2);

}

void sub_10006CC38()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10002C46C();
  sub_10000A1CC((void *)&_mh_execute_header, v0, v1, "DoAPAudioRelayHub unexpected applicationID %s", v2);
  sub_1000119E4();
}

void sub_10006CC9C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "No application ID. Good bye.", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006CCC8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "Not an entitled process. Good bye.", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006CCF4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "DoAPAudioRelayHub XPC connection interrupted", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006CD20()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "DoAPAudioRelayHub XPC connection termination imminent", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006CD4C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "DoAPAudioRelayHub XPC connection code signing requirement", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006CD78()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10002C46C();
  sub_10000A1CC((void *)&_mh_execute_header, v0, v1, "DoAPAudioRelayHub Unknown XPC connection error: %@", v2);
  sub_1000119E4();
}

void sub_10006CDDC()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10002C46C();
  sub_10000A1CC((void *)&_mh_execute_header, v0, v1, "Unexpected DoAPAudioRelayHub XPC connection event: %@", v2);
  sub_1000119E4();
}

void sub_10006CE40()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "handleMsg: No entitlements. Good bye.", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006CE6C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "handleMsg: No application ID. Good bye.", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006CE98()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "No XPC connection for Siri Client", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006CEC4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "No XPC connection for Sound Sensor Client", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006CEF0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_1000188BC((void *)&_mh_execute_header, v0, v1, "DoAPAudioRelayHub - Received StartStreamMsg from AVVC", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006CF1C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_1000188BC((void *)&_mh_execute_header, v0, v1, "DoAPAudioRelayHub - Received StopStreamMsg from AVVC", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006CF48()
{
  os_log_t v0;
  uint8_t v1[24];

  sub_10002C46C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "DoAPAudioRelayHub - Remove DoAPAudioRelay %@", v1, 0xCu);
  sub_1000119E4();
}

void sub_10006CFB4(void *a1, uint64_t a2, int a3)
{
  NSObject *v3;
  id v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  int v13;

  sub_1000074A0(a1);
  v5 = objc_msgSend((id)sub_1000074B4(), "peripheral");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
  v8 = 141558531;
  v9 = 1752392040;
  v10 = 2113;
  v11 = v7;
  v12 = 1024;
  v13 = a3;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "ETS characteristic invalid time sync source received from peripheral \"%{private, mask.hash}@\": invalid type %d", (uint8_t *)&v8, 0x1Cu);

  sub_100007408();
}

void sub_10006D080(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  sub_1000074A0(a1);
  v2 = objc_msgSend((id)sub_1000074B4(), "peripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  sub_100007418();
  sub_100007484((void *)&_mh_execute_header, v5, v6, "ETS characteristic discovery failed for peripheral \"%{private, mask.hash}@\": error %@", v7, v8, v9, v10, v11);

  sub_100007408();
}

void sub_10006D118(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  sub_1000074A0(a1);
  v2 = objc_msgSend((id)sub_1000074B4(), "peripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  sub_100007418();
  sub_100007484((void *)&_mh_execute_header, v5, v6, "ETS characteristic update value failed for peripheral \"%{private, mask.hash}@\": error %@", v7, v8, v9, v10, v11);

  sub_100007408();
}

void sub_10006D1B0(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  sub_1000074A0(a1);
  v2 = objc_msgSend((id)sub_1000074B4(), "peripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  sub_100007418();
  sub_100007484((void *)&_mh_execute_header, v5, v6, "ETS characteristic subscription failed for peripheral \"%{private, mask.hash}@\": error %@", v7, v8, v9, v10, v11);

  sub_100007408();
}

void sub_10006D248(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000188BC((void *)&_mh_execute_header, a1, a3, "DoAPAudioRelay - Send AudioFrame to AVVC", a5, a6, a7, a8, 0);
  sub_100011A1C();
}

void sub_10006D278(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000188BC((void *)&_mh_execute_header, a1, a3, "DoAPAudioRelay - startStream", a5, a6, a7, a8, 0);
  sub_100011A1C();
}

void sub_10006D2A8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000188BC((void *)&_mh_execute_header, a1, a3, "DoAPAudioRelay - stopStream", a5, a6, a7, a8, 0);
  sub_100011A1C();
}

void sub_10006D2D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10002C46C();
  sub_100011A6C((void *)&_mh_execute_header, v0, v1, "LoggingManager - Unexpected XPC server event: %@", v2, v3, v4, v5, v6);
  sub_1000119E4();
}

void sub_10006D338()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10002C46C();
  sub_100011A6C((void *)&_mh_execute_header, v0, v1, "LoggingManager - XPC connection error: %@", v2, v3, v4, v5, v6);
  sub_1000119E4();
}

void sub_10006D398()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10002C46C();
  sub_100011A6C((void *)&_mh_execute_header, v0, v1, "LoggingManager - Unexpected XPC connection event: %@", v2, v3, v4, v5, v6);
  sub_1000119E4();
}

void sub_10006D3F8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10002C46C();
  sub_100011A6C((void *)&_mh_execute_header, v0, v1, "LoggingManager - Unexpected XPC message: %s", v2, v3, v4, v5, v6);
  sub_1000119E4();
}

void sub_10006D458(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "LoggingManager - handleLogRetrievalRequest Invalid args", v1, 2u);
}

void sub_10006D498(uint8_t *a1, void *a2, void *a3, _QWORD *a4)
{
  NSObject *v7;
  void *v8;

  v7 = a2;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "path"));
  *(_DWORD *)a1 = 138412290;
  *a4 = v8;
  _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "LoggingManager - Ignoring %@", a1, 0xCu);

}

void sub_10006D518(void *a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;

  v5 = a1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "localizedDescription"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "path"));
  v8 = 138412546;
  v9 = v6;
  v10 = 2112;
  v11 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "logRetrievalComplete - Failed to enumerate. Error: %@, Path: %@", (uint8_t *)&v8, 0x16u);

}

void sub_10006D5E8(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "name"));
  sub_100036168((void *)&_mh_execute_header, v5, v6, "Ignore peripheral \"%@\" disconnection event", v7, v8, v9, v10, 2u);

  sub_10002C478();
}

void sub_10006D674(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "name"));
  sub_100036168((void *)&_mh_execute_header, v5, v6, "Connection timed out for peripheral \"%@\"...", v7, v8, v9, v10, 2u);

  sub_10002C478();
}

void sub_10006D700(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Not tracking an Mfi peripheral", v1, 2u);
}

void sub_10006D740(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Properties did change : %@", (uint8_t *)&v2, 0xCu);
}

void sub_10006D7B4(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 134218242;
  v4 = a2;
  v5 = 2112;
  v6 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "data with size %ld read : %@", (uint8_t *)&v3, 0x16u);
}

void sub_10006D838(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to remove pipe \"%@\" as we weren't tracking it", (uint8_t *)&v2, 0xCu);
}

void sub_10006D8AC(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;

  v3 = a1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "pipe"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "output"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "streamError"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedDescription"));
  v9 = 138412290;
  v10 = v7;
  sub_10000A1CC((void *)&_mh_execute_header, v3, v8, "Encountered stream error while sending data: %@", (uint8_t *)&v9);

}

void sub_10006D988(uint8_t *a1, void *a2, void *a3, _QWORD *a4)
{
  NSObject *v7;
  void *v8;

  v7 = a2;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "description"));
  *(_DWORD *)a1 = 138412290;
  *a4 = v8;
  _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to deserialize JSON message: %@", a1, 0xCu);

}

void sub_10006DA08(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;

  v3 = a1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "pipe"));
  v6 = 138412290;
  v7 = v4;
  sub_10000A1CC((void *)&_mh_execute_header, v3, v5, "Received unexpected end of input stream on pipe %@", (uint8_t *)&v6);

}

void sub_10006DAA4(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;

  v5 = a1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "name"));
  v7 = 138412546;
  v8 = v6;
  v9 = 2112;
  v10 = a3;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Error discovering services on peripheral \"%@\": %@", (uint8_t *)&v7, 0x16u);

}

void sub_10006DB64(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100011A6C((void *)&_mh_execute_header, a2, a3, "%@", a5, a6, a7, a8, 2u);
  sub_1000119E4();
}

void sub_10006DBC8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000119EC((void *)&_mh_execute_header, a1, a3, "%u consecutive timestamp errors detected. Muting further logs", a5, a6, a7, a8, 0);
  sub_100011A1C();
}

void sub_10006DC34(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100011A6C((void *)&_mh_execute_header, a2, a3, "Failed to send ABC snapshot for signature %@", a5, a6, a7, a8, 2u);
  sub_1000119E4();
}

void sub_10006DC98(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100011A6C((void *)&_mh_execute_header, a1, a3, "Failed to match any IO service for <%s> driver", a5, a6, a7, a8, 2u);
  sub_1000119E4();
}

void sub_10006DD08(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000119EC((void *)&_mh_execute_header, a2, a3, "Failed to get any matched services (error=0x%X)", a5, a6, a7, a8, 0);
  sub_100011A1C();
}

void sub_10006DD6C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "No timestamp sync driver exists.", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006DD98()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "No <Timestamp Sync Period> key found", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006DDC4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "No <Timestamp Sync Count> key found", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006DDF0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "No <Last Timestamp Sync> key found", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006DE1C(int *a1, uint64_t a2, os_log_t log)
{
  int v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  int v7;

  v3 = *a1;
  v4 = 134218240;
  v5 = a2;
  v6 = 1024;
  v7 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Timestamp not received in %lluus (period %ums). Checking if timestamp sync is disabled.", (uint8_t *)&v4, 0x12u);
  sub_1000119E4();
}

void sub_10006DEA0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "Last BT tsync unreliable. Ignoring.", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006DECC(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;

  v3 = *(void **)(a1 + 48);
  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "name"));
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Service \"%@\" has timed out on peripheral \"%@\"", (uint8_t *)&v7, 0x16u);

}

void sub_10006DF9C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "Error creating HID device", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006DFC8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000119D4((void *)&_mh_execute_header, a2, a3, "Initial desired connection parameters: %@", a5, a6, a7, a8, 2u);
  sub_1000119E4();
}

void sub_10006E02C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000119D4((void *)&_mh_execute_header, a2, a3, "Creating HID device with properties: %@", a5, a6, a7, a8, 2u);
  sub_1000119E4();
}

void sub_10006E090()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "Not creating HID device as the link is not encrypted", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006E0BC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "Missing hid information characteristic", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006E0E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "Missing report characteristics", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006E114()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "Missing report map characteristic", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006E140(void *a1, uint64_t a2, void *a3)
{
  void *v3;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  v5 = a1;
  v6 = objc_msgSend(a3, "reportTypeToString:", sub_10003FF08());
  objc_claimAutoreleasedReturnValue(v6);
  sub_10003FF14();
  sub_10003FEF0();
  sub_10003FEDC((void *)&_mh_execute_header, v7, v8, "Did set %@ report for ID #%u", v9, v10, v11, v12, v13);

  sub_1000073F8();
}

void sub_10006E1D4(void *a1, uint64_t a2, void *a3)
{
  void *v3;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  v5 = a1;
  v6 = objc_msgSend(a3, "reportTypeToString:", sub_10003FF08());
  objc_claimAutoreleasedReturnValue(v6);
  sub_10003FF14();
  sub_10003FEF0();
  sub_10003FEDC((void *)&_mh_execute_header, v7, v8, "Started notifications on %@ report for ID #%u", v9, v10, v11, v12, v13);

  sub_1000073F8();
}

void sub_10006E268()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "Missing report reference descriptor", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006E294(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000119D4((void *)&_mh_execute_header, a2, a3, "New desired connection parameters: %@", a5, a6, a7, a8, 2u);
  sub_1000119E4();
}

void sub_10006E2F8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_1000188BC((void *)&_mh_execute_header, v0, v1, "Entering suspend mode", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006E324()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_1000188BC((void *)&_mh_execute_header, v0, v1, "Exiting suspend mode", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006E350(void *a1, uint8_t *buf, int a3, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a3;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not find %@ report characteristic for ID #%u", buf, 0x12u);

}

void sub_10006E3B4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100014CA4((void *)&_mh_execute_header, a1, a3, "Cannot load ACCBLEPairingProvider class from AccessoryBLEPairing.framework", a5, a6, a7, a8, 0);
  sub_100011A1C();
}

void sub_10006E3E4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100014CA4((void *)&_mh_execute_header, a1, a3, "Cannot init ACCTransport connection", a5, a6, a7, a8, 0);
  sub_100011A1C();
}

void sub_10006E414(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100014CA4((void *)&_mh_execute_header, a1, a3, "Cannot init ACCBLEPairingProvider", a5, a6, a7, a8, 0);
  sub_100011A1C();
}

void sub_10006E444(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100014CA4((void *)&_mh_execute_header, a1, a3, "Missing Body Sensor Location characteristic", a5, a6, a7, a8, 0);
  sub_100011A1C();
}

void sub_10006E474(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100014CA4((void *)&_mh_execute_header, a1, a3, "Missing Heart Rate Measurement characteristic", a5, a6, a7, a8, 0);
  sub_100011A1C();
}

void sub_10006E4A4(void *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15;

  v5 = sub_100007498(a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "UUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "debugDescription"));
  sub_100042C14();
  sub_100042C00((void *)&_mh_execute_header, v9, v10, "Error discovering characteristics for service %@: %@", v11, v12, v13, v14, v15);

  sub_1000073F8();
}

void sub_10006E554(void *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15;

  v5 = sub_100007498(a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "UUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "debugDescription"));
  sub_100042C14();
  sub_100042C00((void *)&_mh_execute_header, v9, v10, "Error reading HRM characteristic %@: %@", v11, v12, v13, v14, v15);

  sub_1000073F8();
}

void sub_10006E604(void *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15;

  v5 = sub_100007498(a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "UUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "debugDescription"));
  sub_100042C14();
  sub_100042C00((void *)&_mh_execute_header, v9, v10, "Error setting notify state for HRM characteristic %@: %@", v11, v12, v13, v14, v15);

  sub_1000073F8();
}

void sub_10006E6B4(void *a1, void *a2)
{
  NSObject *v3;
  int v4;
  id v5;

  v3 = sub_100007498(a1);
  v4 = 134217984;
  v5 = objc_msgSend(a2, "length");
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "HRM packet too small: %lu bytes", (uint8_t *)&v4, 0xCu);

}

void sub_10006E748(unsigned __int16 *a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];

  v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Heart rate measurement: %d", (uint8_t *)v3, 8u);
  sub_100011A1C();
}

void sub_10006E7BC()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  sub_100045A0C();
  sub_100011A24((void *)&_mh_execute_header, v0, v1, "kDoAPCodecAttributeIDSampleFrequency (2nd byte) - Read length (%u) exceeded data length (%u)", v2, v3);
  sub_1000119E4();
}

void sub_10006E81C()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  sub_100045A0C();
  sub_100011A24((void *)&_mh_execute_header, v0, v1, "kDoAPCodecAttributeIDSampleFrequency - Read length (%u) exceeded data length (%u)", v2, v3);
  sub_1000119E4();
}

void sub_10006E87C()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  sub_100045A0C();
  sub_100011A24((void *)&_mh_execute_header, v0, v1, "kDoAPCodecAttributeIDChannel - Read length (%u) exceeded data length (%u)", v2, v3);
  sub_1000119E4();
}

void sub_10006E8DC()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  sub_100045A0C();
  sub_100011A24((void *)&_mh_execute_header, v0, v1, "kDoAPCodecAttributeIDAllocMethod - Read length (%u) exceeded data length (%u)", v2, v3);
  sub_1000119E4();
}

void sub_10006E93C(unsigned __int8 a1, uint64_t a2, NSObject *a3)
{
  int v3;

  LOWORD(v3) = 1024;
  HIWORD(v3) = a1;
  sub_100011A24((void *)&_mh_execute_header, a2, a3, "kDoAPCodecAttributeIDBitrate - Read length (%u) exceeded data length (%u)", 67109376, v3);
  sub_1000119E4();
}

void sub_10006E9B4()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  sub_100045A0C();
  sub_100011A24((void *)&_mh_execute_header, v0, v1, "kDoAPCodecAttributeIDBlocks - Read length (%u) exceeded data length (%u)", v2, v3);
  sub_1000119E4();
}

void sub_10006EA14()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  sub_100045A0C();
  sub_100011A24((void *)&_mh_execute_header, v0, v1, "kDoAPCodecAttributeIDSubbands - Read length (%u) exceeded data length (%u)", v2, v3);
  sub_1000119E4();
}

void sub_10006EA74()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  sub_100045A0C();
  sub_100011A24((void *)&_mh_execute_header, v0, v1, "kDoAPCodecAttributeIDMinBitpool - Read length (%u) exceeded data length (%u)", v2, v3);
  sub_1000119E4();
}

void sub_10006EAD4()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  sub_100045A0C();
  sub_100011A24((void *)&_mh_execute_header, v0, v1, "kDoAPCodecAttributeIDMaxBitpool - Read length (%u) exceeded data length (%u)", v2, v3);
  sub_1000119E4();
}

void sub_10006EB34()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  sub_100045A0C();
  sub_100011A24((void *)&_mh_execute_header, v0, v1, "kDoAPCodecAttributeIDObjectType - Read length (%u) exceeded data length (%u)", v2, v3);
  sub_1000119E4();
}

void sub_10006EB94()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  sub_100045A0C();
  sub_100011A24((void *)&_mh_execute_header, v0, v1, "kDoAPCodecAttributeIDVBR - Read length (%u) exceeded data length (%u)", v2, v3);
  sub_1000119E4();
}

void sub_10006EBF4()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  sub_100045A0C();
  sub_100011A24((void *)&_mh_execute_header, v0, v1, "Read length (%u) exceeded data length (%u). Could not get value length.", v2, v3);
  sub_1000119E4();
}

void sub_10006EC54(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error creating DoAP device", buf, 2u);
}

void sub_10006EC90(unsigned __int8 a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "DoAP Number of stream client %u", (uint8_t *)v2, 8u);
  sub_100011A1C();
}

void sub_10006ED04()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "DoAP Missing SupportedCodecs characteristic", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006ED30()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "DoAP Missing SelectedCodec characteristic", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006ED5C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "DoAP Missing StartStreaming characteristic", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006ED88()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "DoAP Missing StopStreaming characteristic", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006EDB4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "DoAP Missing SendData characteristic", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006EDE0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "DoAP Missing EventIndicatior characteristic", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006EE0C(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = sub_100007498(a1);
  objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "UUID"));
  v4 = objc_msgSend((id)sub_100045A40(), "uuidToString:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_100045A2C((void *)&_mh_execute_header, v6, v7, "DoAP Started notifications on %@ characteristic", v8, v9, v10, v11, 2u);

  sub_1000073F8();
}

void sub_10006EEAC(void *a1, void *a2)
{
  NSObject *v3;
  id v4;
  void *v5;
  int v6;
  void *v7;

  v3 = sub_100007498(a1);
  objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "UUID"));
  v4 = objc_msgSend((id)sub_100045A40(), "uuidToString:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = 138412290;
  v7 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "DoAP Missing CCCD for %@ chracteristic", (uint8_t *)&v6, 0xCu);

  sub_1000073F8();
}

void sub_10006EF5C(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = sub_100007498(a1);
  objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "UUID"));
  v4 = objc_msgSend((id)sub_100045A40(), "uuidToString:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_100045A2C((void *)&_mh_execute_header, v6, v7, "DoAP Found CCCD for %@ chracteristic", v8, v9, v10, v11, 2u);

  sub_1000073F8();
}

void sub_10006EFFC()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_100014CB4();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "DoAPService writeData", v1, 2u);
  sub_100011A1C();
}

void sub_10006F034()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100011A7C();
  sub_1000119EC((void *)&_mh_execute_header, v0, v1, "DoAP StopStreaming length(%d) is too short", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006F094()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100011A7C();
  sub_1000119EC((void *)&_mh_execute_header, v0, v1, "DoAP Received data is too short %d", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006F0F4(uint64_t a1, int a2, os_log_t log)
{
  int v3;
  _DWORD v4[2];
  __int16 v5;
  int v6;

  v3 = *(unsigned __int8 *)(a1 + 2);
  v4[0] = 67109376;
  v4[1] = v3;
  v5 = 1024;
  v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "DoAP Receive data, packet#[%d] payload length %d", (uint8_t *)v4, 0xEu);
  sub_1000119E4();
}

void sub_10006F178()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  sub_100011A7C();
  LOWORD(v3) = 1024;
  HIWORD(v3) = v0;
  sub_100011A24((void *)&_mh_execute_header, v0, v1, "DoAP Received payload length(%d) is different to sent length(%d)", v2, v3);
  sub_1000119E4();
}

void sub_10006F1E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100011A7C();
  sub_1000119EC((void *)&_mh_execute_header, v0, v1, "DoAP EventIndicator length(%d) is too short", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006F244()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "Invalid DoAP characteristic", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006F270(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;

  v5 = a1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "characteristic"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "value"));
  v9 = 134218498;
  v10 = a3;
  v11 = 2112;
  v12 = v7;
  v13 = 2112;
  v14 = v8;
  _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Responding with result %ld to request on characteristic \"%@\": %@", (uint8_t *)&v9, 0x20u);

}

void sub_10006F360(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = sub_100007498(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "pendingUpdates"));
  objc_msgSend(v4, "count");
  sub_100046E64((void *)&_mh_execute_header, v5, v6, "Queued update, %lu pending", v7, v8, v9, v10, 0);

  sub_10002C478();
}

void sub_10006F3EC(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;

  v5 = sub_100007498(a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "UUID"));
  v8 = 138412546;
  v9 = v6;
  v10 = 2112;
  v11 = a3;
  sub_100046E78((void *)&_mh_execute_header, v5, v7, "Updating value on characteristic \"%@\": %@", (uint8_t *)&v8);

}

void sub_10006F49C(void *a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;

  v5 = sub_100007498(a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "central"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "nameForCentral:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "characteristic"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUID"));
  v11 = 138412546;
  v12 = v7;
  v13 = 2112;
  v14 = v9;
  sub_100046E78((void *)&_mh_execute_header, v5, v10, "Central \"%@\" sent a read request on characteristic \"%@\"", (uint8_t *)&v11);

}

void sub_10006F590(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = sub_100007498(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "pendingUpdates"));
  objc_msgSend(v4, "count");
  sub_100046E64((void *)&_mh_execute_header, v5, v6, "Ready to send updates, %lu pending", v7, v8, v9, v10, 0);

  sub_10002C478();
}

void sub_10006F61C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100014CA4((void *)&_mh_execute_header, a1, a3, "DoAP Remote SoundSensor device doesn't have proper codec", a5, a6, a7, a8, 0);
  sub_100011A1C();
}

void sub_10006F64C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000119EC((void *)&_mh_execute_header, a2, a3, "DoAPSoundSensor - Send startStreaming failed %u", a5, a6, a7, a8, 0);
  sub_100011A1C();
}

void sub_10006F6B0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000119EC((void *)&_mh_execute_header, a2, a3, "DoAPSoundSensor - Send eventIndicator failed %u", a5, a6, a7, a8, 0);
  sub_100011A1C();
}

void sub_10006F714(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100014CA4((void *)&_mh_execute_header, a1, a3, "DoAPSoundSensor - handleAudioData: XPC connection lost", a5, a6, a7, a8, 0);
  sub_100011A1C();
}

void sub_10006F744(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000119EC((void *)&_mh_execute_header, a2, a3, "DoAPSoundSensor - Invalid DoAP Sound Sensor Event type (%u)", a5, a6, a7, a8, 0);
  sub_100011A1C();
}

void sub_10006F7A8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100014CA4((void *)&_mh_execute_header, a1, a3, "DoAPSoundSensor - Myriad not supported for Sound Sensor Client", a5, a6, a7, a8, 0);
  sub_100011A1C();
}

void sub_10006F7D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "Failed to create device mgnt interface", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006F804()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "Failed to create touch interface", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006F830(int a1, NSObject *a2, uint64_t a3)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;

  v3[0] = 67109376;
  v3[1] = a1;
  v4 = 1024;
  v5 = 8;
  sub_10004AB18((void *)&_mh_execute_header, a2, a3, "Invalid super packet header: %u bytes length < %u", (uint8_t *)v3);
  sub_1000119E4();
}

void sub_10006F8A8()
{
  int v0;
  NSObject *v1;
  uint8_t v2[10];
  int v3;

  sub_10004AB24();
  v3 = v0;
  sub_10004AB18((void *)&_mh_execute_header, v1, (uint64_t)v1, "Invalid super packet payload: %u bytes length < %u", v2);
  sub_1000119E4();
}

void sub_10006F918(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10004AAE4((void *)&_mh_execute_header, a2, a3, "handleInputReportData: 0.1C excess charge data = %u", a5, a6, a7, a8, 0);
  sub_100011A1C();
}

void sub_10006F97C(void *a1, void *a2)
{
  NSObject *v3;
  id v4;
  int v5;
  id v6;

  v3 = a1;
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "description")));
  v5 = 136315138;
  v6 = objc_msgSend(v4, "UTF8String");
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "piconetClockNotification: %s", (uint8_t *)&v5, 0xCu);

}

void sub_10006FA28()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  uint64_t v3;

  sub_10004AB0C(__stack_chk_guard);
  sub_10004AAF4();
  sub_10004AAD0((void *)&_mh_execute_header, v0, v1, "Failed to retrieve charge state, result: %d, length: %ld", v2, v3);
  sub_1000119E4();
}

void sub_10006FA88()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  sub_10004AB0C(__stack_chk_guard);
  sub_10004AAA0();
  sub_10004AABC((void *)&_mh_execute_header, v0, v1, "chargeStateCollection: retrieve report 0x%02x, result = 0x%08x, length = %d", 67109632, v2, v3);
  sub_1000119E4();
}

void sub_10006FAF0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_1000188BC((void *)&_mh_execute_header, v0, v1, "Start stiction collection timer", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006FB1C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_1000188BC((void *)&_mh_execute_header, v0, v1, "Stop stiction collection timer", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006FB48(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10004AAE4((void *)&_mh_execute_header, a2, a3, "stictionCollectionGate: stictionCollection result = 0x%08x", a5, a6, a7, a8, 0);
  sub_100011A1C();
}

void sub_10006FBAC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000119D4((void *)&_mh_execute_header, a1, a3, "stictionCollectionGate: delta_time = %lf", a5, a6, a7, a8, 0);
  sub_1000119E4();
}

void sub_10006FC14(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000119D4((void *)&_mh_execute_header, a1, a3, "stictionCollectionGate: get timestamp of stiction collection = %lf", a5, a6, a7, a8, 0);
  sub_1000119E4();
}

void sub_10006FC7C()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  sub_10004AB0C(__stack_chk_guard);
  sub_10004AAA0();
  sub_10004AABC((void *)&_mh_execute_header, v0, v1, "stictionCollection: retrieve report 0x%02x, result = 0x%08x, length = %d", 67109632, v2, v3);
  sub_1000119E4();
}

void sub_10006FCE4()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  sub_10004AB0C(__stack_chk_guard);
  sub_10004AAA0();
  sub_10004AABC((void *)&_mh_execute_header, v0, v1, "stictionCollection: retrieve report 0x%02x, result = 0x%08x, length = %d", 67109632, v2, v3);
  sub_1000119E4();
}

void sub_10006FD4C()
{
  int v0;
  os_log_t v1;
  uint8_t v2[10];
  int v3;

  sub_10004AB24();
  v3 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "stictionCollection: set      report 0x%02x, result = 0x%08x", v2, 0xEu);
  sub_1000119E4();
}

void sub_10006FDC4()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  uint64_t v3;

  sub_10004AB0C(__stack_chk_guard);
  sub_10004AAF4();
  sub_10004AAD0((void *)&_mh_execute_header, v0, v1, "OOB Query failed with ret=%x, length=%ld", v2, v3);
  sub_1000119E4();
}

void sub_10006FE24(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000119D4((void *)&_mh_execute_header, a2, a3, "OOB Query returned %@", a5, a6, a7, a8, 2u);
  sub_1000119E4();
}

void sub_10006FE88()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "Could not create CoreAccessory connection", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10006FEB4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Bluetooth is restricted", v1, 2u);
}

void sub_10006FEF4(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;

  v5 = a1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "UUID"));
  v7 = 138412546;
  v8 = v6;
  v9 = 2112;
  v10 = a3;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Error publishing service \"%@\": %@", (uint8_t *)&v7, 0x16u);

}

void sub_10006FFB0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100011A6C((void *)&_mh_execute_header, a2, a3, "XPC server error: %@", a5, a6, a7, a8, 2u);
}

void sub_100070018(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100011A6C((void *)&_mh_execute_header, a2, a3, "Unexpected XPC server event: %@", a5, a6, a7, a8, 2u);
}

void sub_100070080(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "XPC client does not have the proper entitlement, cancelling", v1, 2u);
}

void sub_1000700C0(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  sub_100007498(a1);
  v2 = objc_msgSend((id)sub_1000074A8(), "peripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  sub_1000073C4();
  sub_1000073E4((void *)&_mh_execute_header, v5, v6, "Parse live observation data for peripheral \"%{private, mask.hash}@\" failed.", v7, v8, v9, v10, v11);

  sub_1000073F8();
}

void sub_100070154(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  sub_100007498(a1);
  v2 = objc_msgSend((id)sub_1000074A8(), "peripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  sub_1000073C4();
  sub_1000073E4((void *)&_mh_execute_header, v5, v6, "Parse stored observation data for peripheral \"%{private, mask.hash}@\" failed due to unsupported observation type.", v7, v8, v9, v10, v11);

  sub_1000073F8();
}

void sub_1000701E8(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v3 = a1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "peripheral"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  sub_1000073C4();
  sub_100007470((void *)&_mh_execute_header, v6, v7, "Observation type for peripheral \"%{private, mask.hash}@\" not supported : %d", v8, v9, v10, v11, v12);

  sub_100007408();
}

void sub_100070294(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  sub_100007498(a1);
  v2 = objc_msgSend((id)sub_1000074A8(), "peripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  sub_1000073C4();
  sub_1000073E4((void *)&_mh_execute_header, v5, v6, "Peripheral \"%{private, mask.hash}@\" observation value not saved due to invalid value", v7, v8, v9, v10, v11);

  sub_1000073F8();
}

void sub_100070328(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  sub_100007498(a1);
  v2 = objc_msgSend((id)sub_1000074A8(), "peripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  sub_1000073C4();
  sub_1000073E4((void *)&_mh_execute_header, v5, v6, "Peripheral \"%{private, mask.hash}@\" observation value parse failed", v7, v8, v9, v10, v11);

  sub_1000073F8();
}

void sub_1000703BC(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = a1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "peripheral"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  sub_100007470((void *)&_mh_execute_header, v5, v6, "Unit for peripheral \"%{private, mask.hash}@\": invalid unit %d", v7, v8, v9, v10, 3u);

  sub_100007408();
}

void sub_100070484()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "registerWithHealthKit - Missing HealthKit framework", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_1000704B0()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_100014CB4();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "registerWithHealthKit - Fitness callback already registered with HealthKit", v1, 2u);
  sub_100011A1C();
}

void sub_1000704E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "Missing HealthKit framework", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_100070514()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "Received END WORKOUT call from HealthKit while not in workout. Ignoring.", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_100070540(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_100007498(a1);
  v2 = objc_msgSend((id)sub_1000074A8(), "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10002C46C();
  sub_100036168((void *)&_mh_execute_header, v4, v5, "Error retrieving tagged peripherals: %@", v6, v7, v8, v9, v10);

  sub_10002C478();
}

void sub_1000705C0(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_100007498(a1);
  v2 = objc_msgSend((id)sub_1000074A8(), "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10002C46C();
  sub_100036168((void *)&_mh_execute_header, v4, v5, "Error retrieving peripherals with fitness custom property: %@", v6, v7, v8, v9, v10);

  sub_10002C478();
}

void sub_100070640(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_100007498(a1);
  v2 = objc_msgSend((id)sub_1000074A8(), "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10002C46C();
  sub_100036168((void *)&_mh_execute_header, v4, v5, "Error retrieving peripherals with Fitness custom property: %@", v6, v7, v8, v9, v10);

  sub_10002C478();
}

void sub_1000706C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "connectPeripheral: uuid was NULL", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_1000706EC()
{
  uint64_t v0;
  os_log_t v1;

  sub_100052774();
  sub_10005278C((void *)&_mh_execute_header, v0, v1, "Register qty %@ for service UUID %@");
  sub_1000119E4();
}

void sub_10007074C()
{
  uint64_t v0;
  os_log_t v1;

  sub_100052774();
  sub_10005278C((void *)&_mh_execute_header, v0, v1, "Register unit %@ for qty %@");
  sub_1000119E4();
}

void sub_1000707AC()
{
  os_log_t v0;
  uint8_t v1[24];

  sub_100052774();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Could not register unit %@ for qty %@ - could not soft link HealthKit classes", v1, 0x16u);
  sub_1000119E4();
}

void sub_10007081C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "Failed to load AudioAccessoryServices", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_100070848(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_100007498(a1);
  v2 = objc_msgSend((id)sub_1000074A8(), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10002C46C();
  sub_100036168((void *)&_mh_execute_header, v4, v5, "Error activating audio routing control: %@", v6, v7, v8, v9, v10);

  sub_10002C478();
}

void sub_1000708C8(char a1, NSObject *a2)
{
  const __CFString *v2;
  int v3;
  const __CFString *v4;

  v2 = CFSTR("stopping");
  if ((a1 & 1) != 0)
    v2 = CFSTR("starting");
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Notify SmartRouting HRM session state changed: %@ collection", (uint8_t *)&v3, 0xCu);
  sub_1000119E4();
}

void sub_100070950(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_100007498(a1);
  v2 = objc_msgSend((id)sub_1000074A8(), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10002C46C();
  sub_100036168((void *)&_mh_execute_header, v4, v5, "Error notifying HRM session state changed: %@", v6, v7, v8, v9, v10);

  sub_10002C478();
}

void sub_1000709D0(uint8_t *a1, void *a2, void *a3, _QWORD *a4)
{
  NSObject *v7;
  void *v8;
  void *v9;

  v7 = a2;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
  *(_DWORD *)a1 = 138412290;
  *a4 = v9;
  _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to migrate HealthKit HRM with identifier %@. CBPeripheral does not exist", a1, 0xCu);

}

void sub_100070A68(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  sub_1000527A0(a1, a2);
  v3 = objc_msgSend((id)sub_1000074A8(), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));
  sub_10002C46C();
  sub_100036168((void *)&_mh_execute_header, v6, v7, "Failed to get HKHealthService enabled status during HRM migration for identifier %@", v8, v9, v10, v11, v12);

  sub_1000073F8();
}

void sub_100070AF8(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  sub_1000527A0(a1, a2);
  v3 = objc_msgSend((id)sub_1000074A8(), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));
  sub_10002C46C();
  sub_100036168((void *)&_mh_execute_header, v6, v7, "Failed to remove HKHealthService pairing during HRM migration for identifier %@", v8, v9, v10, v11, v12);

  sub_1000073F8();
}

void sub_100070B88()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10002C46C();
  sub_100011A6C((void *)&_mh_execute_header, v0, v1, "accessoryReachable failed! uarpAccessory:%@", v2, v3, v4, v5, v6);
  sub_1000119E4();
}

void sub_100070BE8()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  sub_10002C46C();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "addAccessory failed! uarpAccessory:%@ uarpAssetID:%@", v2, 0x16u);
  sub_1000119E4();
}

void sub_100070C64(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100014CA4((void *)&_mh_execute_header, a1, a3, "No uarpAccessory provided", a5, a6, a7, a8, 0);
  sub_100011A1C();
}

void sub_100070C94()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10002C46C();
  sub_100011A6C((void *)&_mh_execute_header, v0, v1, "removeAccessory failed! uarpAccessory:%@", v2, v3, v4, v5, v6);
  sub_1000119E4();
}

void sub_100070CF4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10002C46C();
  sub_100011A6C((void *)&_mh_execute_header, v0, v1, "accessoryUnreachable failed! uarpAccessory:%@", v2, v3, v4, v5, v6);
  sub_1000119E4();
}

void sub_100070D54()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10002C46C();
  sub_100011A6C((void *)&_mh_execute_header, v0, v1, "Error creating bluetooth UARP logs directory:%@", v2, v3, v4, v5, v6);
  sub_1000119E4();
}

void sub_100070DB4(void *a1, void *a2)
{
  id v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v3 = sub_100007498(a1);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "UUIDString")));
  sub_100053B98(v4, v5);
  sub_10002C46C();
  sub_100046E64((void *)&_mh_execute_header, v6, v7, "addUARPTransportDict: adding UUID: %s", v8, v9, v10, v11, v12);

  sub_10002C478();
}

void sub_100070E3C(void *a1, void *a2)
{
  id v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v3 = sub_100007498(a1);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "UUIDString")));
  sub_100053B98(v4, v5);
  sub_10002C46C();
  sub_100046E64((void *)&_mh_execute_header, v6, v7, "getAndRemoveFromUARPTransportDict: did not find anything for UUID: %s", v8, v9, v10, v11, v12);

  sub_10002C478();
}

void sub_100070EC4(void *a1, void *a2)
{
  id v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v3 = sub_100007498(a1);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "UUIDString")));
  sub_100053B98(v4, v5);
  sub_10002C46C();
  sub_100046E64((void *)&_mh_execute_header, v6, v7, "getAndRemoveFromUARPTransportDict: got for UUID: %s", v8, v9, v10, v11, v12);

  sub_10002C478();
}

void sub_100070F4C(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = sub_100007498(a1);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "UUIDString")));
  objc_msgSend(v6, "UTF8String");
  objc_msgSend(a3, "length");
  sub_100053B84((void *)&_mh_execute_header, v7, v8, "relayAACPUARP - accessory UUID:%s msgLength:%lu", v9, v10, v11, v12, 2u);

  sub_1000073F8();
}

void sub_100070FFC(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a2;
  objc_msgSend(a3, "length");
  sub_100053B84((void *)&_mh_execute_header, v5, v6, "sendMessageToAccessory - accessory:%@ msgLength:%lu", v7, v8, v9, v10, 2u);

  sub_1000073F8();
}

void sub_100071090(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100014CA4((void *)&_mh_execute_header, a1, a3, "stageFirmwareUpdateOnAccessoryList in dropbox failed!", a5, a6, a7, a8, 0);
  sub_100011A1C();
}

void sub_1000710C0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100014CA4((void *)&_mh_execute_header, a1, a3, "stageFirmwareUpdateOnAccessoryList failed!", a5, a6, a7, a8, 0);
  sub_100011A1C();
}

void sub_1000710F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "DoAP Siri remote device doesn't have proper codec", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10007111C()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[8];

  sub_100011A7C();
  sub_1000579D0((void *)&_mh_execute_header, v0, v1, "DoAPSiri - Send startStreaming failed %u", v2);
  sub_100011A1C();
}

void sub_100071180()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[8];

  sub_100011A7C();
  sub_1000579D0((void *)&_mh_execute_header, v0, v1, "DoAPSiri - Send eventIndicator failed %u", v2);
  sub_100011A1C();
}

void sub_1000711E4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10002C46C();
  sub_10000A1CC((void *)&_mh_execute_header, v0, v1, "DoAPSiri - activateSiri: Invalid Siri Activation event %tu", v2);
  sub_1000119E4();
}

void sub_100071248(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = a1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "error"));
  sub_10002C46C();
  sub_10000A1CC((void *)&_mh_execute_header, v3, v5, "DoAPSiri - activateSiri: SiriActivation failed: %@", v6);

  sub_10002C478();
}

void sub_1000712DC(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = a1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "error"));
  sub_10002C46C();
  sub_10000A1CC((void *)&_mh_execute_header, v3, v5, "DoAPSiri - SiriCancellation failed with error:%@", v6);

  sub_10002C478();
}

void sub_10007136C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "DoAPSiri - handleAudioData: XPC connection lost", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_100071398()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[8];

  sub_100011A7C();
  sub_1000579D0((void *)&_mh_execute_header, v0, v1, "DoAPSiri - Invalid DoAP Siri Event type (%u)", v2);
  sub_100011A1C();
}

void sub_1000713FC(void *a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint8_t v5[8];

  v3 = a1;
  objc_msgSend(a2, "state");
  sub_100011A7C();
  sub_1000579D0((void *)&_mh_execute_header, v3, v4, "DoAPSiri - Doap state %d mismatch for Button Event", v5);

  sub_1000119E4();
}

void sub_100071488()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10002C46C();
  sub_10000A1CC((void *)&_mh_execute_header, v0, v1, "DoAPSiri - SiriMyriad Score rejected: %@", v2);
  sub_1000119E4();
}

void sub_1000714EC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "DoAPSiri - No valid remote device, ignore DoAPSiri AudioStart request", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_100071518(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 134217984;
  v4 = 10;
  sub_10000A1CC((void *)&_mh_execute_header, a1, a3, "DoAPSiri - Timed out after %lld seconds waiting to start Siri", (uint8_t *)&v3);
  sub_1000119E4();
}

void sub_100071588(uint64_t a1, void *a2)
{
  NSObject *v2;
  uint64_t v3;
  uint8_t v4[8];

  sub_1000579DC(a1, a2);
  sub_1000579E8();
  sub_100011A7C();
  sub_1000579D0((void *)&_mh_execute_header, v2, v3, "DoAPSiri - Fail to send DoAP StartStream message - device state(%d)", v4);

  sub_1000119E4();
}

void sub_100071604()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "DoAPSiri - No valid remote device, skip DoAPSiri AudioToStop", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_100071630()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "DoAPSiri - Stopping Siri session immediately.", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_10007165C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "DoAPSiri - No valid remote device, ignore DoAPSiri AudioStop request", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_100071688(uint64_t a1, void *a2)
{
  NSObject *v2;
  uint64_t v3;
  uint8_t v4[8];

  sub_1000579DC(a1, a2);
  sub_1000579E8();
  sub_100011A7C();
  sub_1000579D0((void *)&_mh_execute_header, v2, v3, "DoAPSiri - Fail to send DoAP StopStream message - device state(%d)", v4);

  sub_1000119E4();
}

void sub_100071704(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Ignoring request to add ellipsis as there is insufficient space. bufferMaxLength = %lu", (uint8_t *)&v2, 0xCu);
}

void sub_100071778(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;

  v3 = sub_100007498(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "peripheral"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "versionCharacteristic"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "value"));
  v9 = 138412546;
  v10 = v5;
  sub_100059340();
  sub_10005935C((void *)&_mh_execute_header, v3, v8, "Invalid version for peripheral \"%@\": %@", (uint8_t *)&v9);

  sub_10005932C();
}

void sub_100071848()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  const __CFDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_1000074C0();
  sub_100007498(v2);
  v3 = objc_msgSend((id)sub_1000074B4(), "peripheral");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  v5 = (const __CFDictionary *)sub_100059350();
  sub_100059368(v5);
  sub_100059340();
  sub_100053B84((void *)&_mh_execute_header, v6, v7, "Issuing challenge for peripheral \"%@\": %@", v8, v9, v10, v11, 2u);

  sub_10005932C();
}

void sub_1000718EC(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  sub_100007498(a1);
  v2 = objc_msgSend((id)sub_1000074A8(), "peripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  sub_10002C46C();
  sub_100036168((void *)&_mh_execute_header, v5, v6, "Certificate invalid for peripheral \"%@\"", v7, v8, v9, v10, v11);

  sub_1000073F8();
}

void sub_100071980()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  const __CFDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_1000074C0();
  sub_100007498(v2);
  v3 = objc_msgSend((id)sub_1000074B4(), "peripheral");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  v5 = (const __CFDictionary *)sub_100059350();
  sub_100059368(v5);
  sub_100059340();
  sub_100053B84((void *)&_mh_execute_header, v6, v7, "Read certificate for peripheral \"%@\": %@", v8, v9, v10, v11, 2u);

  sub_10005932C();
}

void sub_100071A24()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "Failure to read the auth version", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_100071A50(void *a1)
{
  NSObject *v1;
  id v2;
  void *v3;
  void *v4;
  uint8_t v5[24];

  sub_100007498(a1);
  v2 = objc_msgSend((id)sub_1000074A8(), "peripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  sub_10002C46C();
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "Received notification that the response is ready for peripheral \"%@\"", v5, 0xCu);

  sub_1000073F8();
}

void sub_100071AF4(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  sub_100007498(a1);
  v2 = objc_msgSend((id)sub_1000074A8(), "peripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  sub_10002C46C();
  sub_100036168((void *)&_mh_execute_header, v5, v6, "Challenge response invalid for peripheral \"%@\"", v7, v8, v9, v10, v11);

  sub_1000073F8();
}

void sub_100071B88()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  const __CFDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_1000074C0();
  sub_100007498(v2);
  v3 = objc_msgSend((id)sub_1000074B4(), "peripheral");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  v5 = (const __CFDictionary *)sub_100059350();
  sub_100059368(v5);
  sub_100059340();
  sub_100053B84((void *)&_mh_execute_header, v6, v7, "Read response for peripheral \"%@\": %@", v8, v9, v10, v11, 2u);

  sub_10005932C();
}

void sub_100071C2C(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  sub_100007498(a1);
  v2 = objc_msgSend((id)sub_1000074A8(), "peripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  sub_10002C46C();
  sub_100036168((void *)&_mh_execute_header, v5, v6, "Still no response notification, attempting a last ditch read on peripheral \"%@\"", v7, v8, v9, v10, v11);

  sub_1000073F8();
}

void sub_100071CC0(void *a1, void *a2)
{
  void *v2;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;

  v4 = sub_100007498(a1);
  objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "authStateString"));
  v5 = objc_msgSend((id)sub_1000074B4(), "peripheral");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
  v9 = 138412546;
  v10 = v2;
  sub_100059340();
  sub_10005935C((void *)&_mh_execute_header, v4, v8, "Authentication has timed out (%@) on peripheral \"%@\"", (uint8_t *)&v9);

  sub_1000073F8();
}

void sub_100071D78()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "Missing challenge characteristics", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_100071DA4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "Missing certificate characteristics", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_100071DD0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100014CB4();
  sub_100014CA4((void *)&_mh_execute_header, v0, v1, "Missing version characteristic", v2, v3, v4, v5, v6);
  sub_100011A1C();
}

void sub_100071DFC()
{
  uint64_t v0;
  NSObject *v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[12];
  __int16 v8;
  uint64_t v9;

  sub_1000074C0();
  sub_100007498(v2);
  v3 = objc_msgSend((id)sub_1000074B4(), "peripheral");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  sub_10002C46C();
  v8 = 2112;
  v9 = v0;
  sub_10005935C((void *)&_mh_execute_header, v1, v6, "Failed to read challenge response for peripheral \"%@\": %@", v7);

  sub_1000073F8();
}

void sub_100071EA4(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error encountered resolving behavior via DND. Defaulting isSilent to NO. error=%@", (uint8_t *)&v2, 0xCu);
}

void sub_100071F18(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;

  v3 = a1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "recentCall"));
  v5 = 138412290;
  v6 = v4;
  _os_log_fault_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "Unable to create a TUCallProvider for call %@", (uint8_t *)&v5, 0xCu);

}

void sub_100071FBC(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Missing battery level characteristic", v1, 2u);
}

void sub_100071FFC(void *a1, void *a2, int a3)
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  int v11;

  v5 = a1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "peripheral"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
  v8 = 138412546;
  v9 = v7;
  v10 = 1024;
  v11 = a3;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to update the power source for peripheral \"%@\": 0x%X", (uint8_t *)&v8, 0x12u);

}

void sub_1000720C8(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "DoAP eventIndicator write value - Invalid event type(0x%02x)", (uint8_t *)v2, 8u);
}

void sub_10007213C(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "eventIndicator for SoundSensorClient not implemented yet", v1, 2u);
}

void sub_10007217C(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v3 = a1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "peripheral"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  sub_1000073C4();
  sub_1000073E4((void *)&_mh_execute_header, v6, v7, "Parse live observation data for peripheral \"%{private, mask.hash}@\" failed due to unsupported device type.", v8, v9, v10, v11, v12);

  sub_1000073F8();
}

void sub_100072218(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v3 = a1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "peripheral"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  sub_1000073C4();
  sub_1000073E4((void *)&_mh_execute_header, v6, v7, "Parse stored observation data for peripheral \"%{private, mask.hash}@\" failed due to unsupported device type.", v8, v9, v10, v11, v12);

  sub_1000073F8();
}

void sub_1000722B4(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "peripheral"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v9 = 141558531;
  v10 = 1752392040;
  v11 = 2113;
  v12 = v7;
  v13 = 2114;
  v14 = v8;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Request authorization to share sample types for peripheral \"%{private, mask.hash}@\" failed : %{public}@", (uint8_t *)&v9, 0x20u);

}

void sub_1000723A8(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  sub_1000074A0(a1);
  v2 = objc_msgSend((id)sub_1000074B4(), "peripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  sub_1000624F8();
  sub_100007470((void *)&_mh_execute_header, v5, v6, "Parse live observation data for peripheral \"%{private, mask.hash}@\" failed due to unsupported observation type %d.", v7, v8, v9, v10, v11);

  sub_100007408();
}

void sub_100072440(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  sub_100007498(a1);
  v2 = objc_msgSend((id)sub_1000074A8(), "peripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  sub_1000073C4();
  sub_1000073E4((void *)&_mh_execute_header, v5, v6, "Parse stored observation data for peripheral \"%{private, mask.hash}@\" failed", v7, v8, v9, v10, v11);

  sub_1000073F8();
}

void sub_1000724D4(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  sub_1000074A0(a1);
  v2 = objc_msgSend((id)sub_1000074B4(), "peripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  sub_1000624F8();
  sub_100007470((void *)&_mh_execute_header, v5, v6, "Parse stored observation data for peripheral \"%{private, mask.hash}@\" failed due to unsupported observation type %d.", v7, v8, v9, v10, v11);

  sub_100007408();
}

void sub_10007256C(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  sub_1000074A0(a1);
  v2 = objc_msgSend((id)sub_1000074B4(), "peripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  sub_100007444();
  sub_100007470((void *)&_mh_execute_header, v5, v6, "Unit for peripheral \"%{private, mask.hash}@\": invalid unit %d", v7, v8, v9, v10, v11);

  sub_100007408();
}

void sub_100072608(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100011A6C((void *)&_mh_execute_header, a2, a3, "didWriteValueForCharacteristic failed - error:%@", a5, a6, a7, a8, 2u);
  sub_1000119E4();
}

void sub_10007266C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100011A6C((void *)&_mh_execute_header, a2, a3, "didUpdateValueForCharacteristic failed - error:%@", a5, a6, a7, a8, 2u);
  sub_1000119E4();
}

void sub_1000726D0(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unsupported UARP accessory!", v1, 2u);
}

void sub_100072710(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "peripheral:didUpdateNotificationStateForCharacteristic: loggingSuperbinaryURL %@", (uint8_t *)&v3, 0xCu);
  sub_1000119E4();
}

void sub_100072784(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100011A6C((void *)&_mh_execute_header, a2, a3, "assetSolicitationComplete: Error decomposing asset:%@", a5, a6, a7, a8, 2u);
  sub_1000119E4();
}

void sub_1000727E8(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v3 = sub_100007498(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "peripheral"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  sub_1000073C4();
  sub_1000073E4((void *)&_mh_execute_header, v6, v7, "Parse live observation data for peripheral \"%{private, mask.hash}@\" failed due to unsupported observation type.", v8, v9, v10, v11, v12);

  sub_1000073F8();
}

void sub_100072880(uint64_t a1, void *a2, void *a3)
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15;

  v5 = sub_100066014(a1, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "peripheral"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  sub_100065FC4();
  sub_100065FF0((void *)&_mh_execute_header, v9, v10, "Save sample for peripheral \"%{private, mask.hash}@\" failed : %{public}@", v11, v12, v13, v14, v15);

  sub_100007408();
}

void sub_10007292C(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_100066004((void *)&_mh_execute_header, (int)a2, a3, "Unsupported observation type in live/stored health observation", a1);
}

void sub_10007295C(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_100066004((void *)&_mh_execute_header, (int)a2, a3, "Unsupported observation class type, only numeric type are supported for compound observation", a1);
}

void sub_10007298C(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v3 = sub_100007498(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "peripheral"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  sub_1000073C4();
  sub_1000073E4((void *)&_mh_execute_header, v6, v7, "Peripheral \"%{private, mask.hash}@\" observation value not saved due to invalid value", v8, v9, v10, v11, v12);

  sub_1000073F8();
}

void sub_100072A24(void *a1, void *a2, unsigned __int16 *a3)
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  int v14;

  v5 = a1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "peripheral"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
  v8 = *a3;
  v9 = 141558531;
  v10 = 1752392040;
  v11 = 2113;
  v12 = v7;
  v13 = 1024;
  v14 = v8;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Unit for peripheral \"%{private, mask.hash}@\": heart rate invalid unit %d", (uint8_t *)&v9, 0x1Cu);

  sub_100007408();
}

void sub_100072AFC(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;

  v5 = a1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "peripheral"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
  v8 = 138412802;
  v9 = CFSTR("wheelCircumferenceMM");
  v10 = 2112;
  v11 = v7;
  v12 = 2112;
  v13 = a3;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Read property “%@” from “%@” = “%@” and can't convert it to a number", (uint8_t *)&v8, 0x20u);

}

void sub_100072BD8(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  sub_100007498(a1);
  v2 = objc_msgSend((id)sub_1000074A8(), "peripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  sub_10002C46C();
  sub_100036168((void *)&_mh_execute_header, v5, v6, "“%@” Could not create cycling cadence HKQuantityType", v7, v8, v9, v10, v11);

  sub_1000073F8();
}

void sub_100072C6C(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  sub_100007498(a1);
  v2 = objc_msgSend((id)sub_1000074A8(), "peripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  sub_10002C46C();
  sub_100036168((void *)&_mh_execute_header, v5, v6, "“%@” cadence data available but not requested", v7, v8, v9, v10, v11);

  sub_1000073F8();
}

void sub_100072D00(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v3 = a1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "peripheral"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  sub_100069204();
  sub_1000691B4();
  sub_1000691F0((void *)&_mh_execute_header, v6, v7, "“%@” READ CSC Measurement CADENCE, CrankRev:%d (0x%04X) last Crank Event Time:%d (0x%04X) (%f in sec)", v8, v9, v10, v11, v12);

  sub_1000249B8();
}

void sub_100072DAC(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  sub_100007498(a1);
  v2 = objc_msgSend((id)sub_1000074A8(), "peripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  sub_10002C46C();
  sub_100036168((void *)&_mh_execute_header, v5, v6, "“%@” Could not create cycling speed HKQuantityType", v7, v8, v9, v10, v11);

  sub_1000073F8();
}

void sub_100072E40(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v3 = a1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "peripheral"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  sub_100069204();
  sub_1000691B4();
  sub_1000691F0((void *)&_mh_execute_header, v6, v7, "“%@” READ CSC Measurement SPEED, CumWheelRev:%d (0x%08X) last Wheel Event Time:%d (0x%04X) (%f in sec)", v8, v9, v10, v11, v12);

  sub_1000249B8();
}

void sub_100072EEC(void *a1)
{
  NSObject *v1;
  id v2;
  void *v3;
  void *v4;
  uint8_t v5[24];

  sub_100007498(a1);
  v2 = objc_msgSend((id)sub_1000074A8(), "peripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  sub_10002C46C();
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "updatedControlPointCharacteristicValue - “%@”", v5, 0xCu);

  sub_1000073F8();
}

void sub_100072F90(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  sub_100007498(a1);
  v2 = objc_msgSend((id)sub_1000074A8(), "peripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  sub_10002C46C();
  sub_100036168((void *)&_mh_execute_header, v5, v6, "“%@” - Missing Cadence & Speed Control Point characteristic", v7, v8, v9, v10, v11);

  sub_1000073F8();
}

void sub_100073024(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  sub_100007498(a1);
  v2 = objc_msgSend((id)sub_1000074A8(), "peripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  sub_10002C46C();
  sub_100036168((void *)&_mh_execute_header, v5, v6, "“%@” - Missing Cadence & Speed Feature characteristic", v7, v8, v9, v10, v11);

  sub_1000073F8();
}

void sub_1000730B8(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  sub_100007498(a1);
  v2 = objc_msgSend((id)sub_1000074A8(), "peripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  sub_10002C46C();
  sub_100036168((void *)&_mh_execute_header, v5, v6, "“%@” - Missing Cadence & Speed Measurement characteristic", v7, v8, v9, v10, v11);

  sub_1000073F8();
}

id objc_msgSend_EventIndicatorCharacteristic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "EventIndicatorCharacteristic");
}

id objc_msgSend_ID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ID");
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_L2CAPChannels(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "L2CAPChannels");
}

id objc_msgSend_SelectedCodecCharacteristic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "SelectedCodecCharacteristic");
}

id objc_msgSend_SendDataCharacteristic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "SendDataCharacteristic");
}

id objc_msgSend_StartStreamingCharacteristic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "StartStreamingCharacteristic");
}

id objc_msgSend_StopStreamingCharacteristic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "StopStreamingCharacteristic");
}

id objc_msgSend_SupportedCodecsCharacteristic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "SupportedCodecsCharacteristic");
}

id objc_msgSend_UID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UID");
}

id objc_msgSend_URLByAppendingPathComponent_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:isDirectory:");
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByDeletingLastPathComponent");
}

id objc_msgSend_UTF8DataWithMaxLength_ellipsis_isTruncated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UTF8DataWithMaxLength:ellipsis:isTruncated:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UUIDString");
}

id objc_msgSend_UUIDWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UUIDWithString:");
}

id objc_msgSend__appIdentifierForTUCallProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_appIdentifierForTUCallProvider:");
}

id objc_msgSend__createPacket_payloadOffset_payloadLength_payload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createPacket:payloadOffset:payloadLength:payload:");
}

id objc_msgSend__createUARPLogPath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createUARPLogPath");
}

id objc_msgSend__extractHeader_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_extractHeader:");
}

id objc_msgSend__extractPayload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_extractPayload:");
}

id objc_msgSend__getUARPLogPath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getUARPLogPath");
}

id objc_msgSend__packetizeData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_packetizeData:");
}

id objc_msgSend__parseRecvdData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_parseRecvdData:");
}

id objc_msgSend__prepareForFirmwareDownload(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_prepareForFirmwareDownload");
}

id objc_msgSend__setFirmwareVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setFirmwareVersion:");
}

id objc_msgSend__setHardwareVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setHardwareVersion:");
}

id objc_msgSend__setManufacturer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setManufacturer:");
}

id objc_msgSend__setModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setModel:");
}

id objc_msgSend__unit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_unit");
}

id objc_msgSend__updateHealthEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateHealthEnabled");
}

id objc_msgSend__value(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_value");
}

id objc_msgSend_accessoryCategoryCharacteristic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accessoryCategoryCharacteristic");
}

id objc_msgSend_accessoryReachable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accessoryReachable:");
}

id objc_msgSend_accessoryUnreachable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accessoryUnreachable:");
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activate");
}

id objc_msgSend_activateHIDPolicy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateHIDPolicy");
}

id objc_msgSend_activateSiri_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateSiri:");
}

id objc_msgSend_activateWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateWithCompletion:");
}

id objc_msgSend_activeCentrals(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeCentrals");
}

id objc_msgSend_activeHIDDeviceCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeHIDDeviceCount");
}

id objc_msgSend_activeHIDDeviceCountDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeHIDDeviceCountDidChange:");
}

id objc_msgSend_addAccessory_assetID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAccessory:assetID:");
}

id objc_msgSend_addAlert_isPreExisting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAlert:isPreExisting:");
}

id objc_msgSend_addCodec_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCodec:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:forKeyPath:options:context:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addObserverForName_object_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserverForName:object:queue:usingBlock:");
}

id objc_msgSend_addPipe_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPipe:");
}

id objc_msgSend_addService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addService:");
}

id objc_msgSend_addTimer_forMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTimer:forMode:");
}

id objc_msgSend_addUARPTransportDict_UARPAACPSupported_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addUARPTransportDict:UARPAACPSupported:");
}

id objc_msgSend_alert(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alert");
}

id objc_msgSend_alertAdded_isPreExisting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertAdded:isPreExisting:");
}

id objc_msgSend_alertMap(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertMap");
}

id objc_msgSend_alertModified_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertModified:");
}

id objc_msgSend_alertRemoved_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertRemoved:");
}

id objc_msgSend_alertSource(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertSource");
}

id objc_msgSend_alerts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alerts");
}

id objc_msgSend_alertsForCategoryID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertsForCategoryID:");
}

id objc_msgSend_allInputReportsReady(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allInputReportsReady");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allObjects");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allValues");
}

id objc_msgSend_allocHIDQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allocHIDQueue");
}

id objc_msgSend_allocQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allocQueue");
}

id objc_msgSend_allowInRestrictedMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allowInRestrictedMode:");
}

id objc_msgSend_alwaysCollectQuantityTypes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alwaysCollectQuantityTypes");
}

id objc_msgSend_amdNotification(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "amdNotification");
}

id objc_msgSend_analyzeConnectionError_peripheral_info_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "analyzeConnectionError:peripheral:info:");
}

id objc_msgSend_analyzeError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "analyzeError:");
}

id objc_msgSend_andPredicateWithSubpredicates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "andPredicateWithSubpredicates:");
}

id objc_msgSend_answerCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "answerCall:");
}

id objc_msgSend_appAttributeIDToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appAttributeIDToString:");
}

id objc_msgSend_appIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appIdentifier");
}

id objc_msgSend_appIdentifierToCategoryCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appIdentifierToCategoryCache");
}

id objc_msgSend_appendBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendBytes:length:");
}

id objc_msgSend_appendData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendData:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:");
}

id objc_msgSend_appleMultitouchDeviceArrived_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appleMultitouchDeviceArrived:");
}

id objc_msgSend_applicationIDIsSiri_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationIDIsSiri:");
}

id objc_msgSend_applicationIDIsSoundSensor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationIDIsSoundSensor:");
}

id objc_msgSend_applicationProxyForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationProxyForIdentifier:");
}

id objc_msgSend_applyInverseTimestampOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyInverseTimestampOffset:");
}

id objc_msgSend_applyStagedFirmwareOnAccessoryList_withUserIntent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyStagedFirmwareOnAccessoryList:withUserIntent:");
}

id objc_msgSend_applyTimestampOffset_precise_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyTimestampOffset:precise:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "array");
}

id objc_msgSend_arrayByAddingObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObject:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_assetSolicitationComplete(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetSolicitationComplete");
}

id objc_msgSend_attributeIDToString_entityID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributeIDToString:entityID:");
}

id objc_msgSend_attributeIDsDidChange_entityID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributeIDsDidChange:entityID:");
}

id objc_msgSend_audio(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "audio");
}

id objc_msgSend_audioAndVideoCallsWithStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "audioAndVideoCallsWithStatus:");
}

id objc_msgSend_audioBuffer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "audioBuffer");
}

id objc_msgSend_audioRoutingControl(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "audioRoutingControl");
}

id objc_msgSend_authInProgress(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authInProgress");
}

id objc_msgSend_authInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authInfo");
}

id objc_msgSend_authState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authState");
}

id objc_msgSend_authStateString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authStateString");
}

id objc_msgSend_authTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authTimer");
}

id objc_msgSend_authenticationDidFail(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authenticationDidFail");
}

id objc_msgSend_authenticationDidSucceed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authenticationDidSucceed");
}

id objc_msgSend_batteryLevelCharacteristic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "batteryLevelCharacteristic");
}

id objc_msgSend_batteryLevelValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "batteryLevelValue");
}

id objc_msgSend_batteryPowerStateCharacteristic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "batteryPowerStateCharacteristic");
}

id objc_msgSend_batteryPowerStateString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "batteryPowerStateString:");
}

id objc_msgSend_bbBulletinAlerts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bbBulletinAlerts");
}

id objc_msgSend_bbObserver(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bbObserver");
}

id objc_msgSend_behaviorResolutionService(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "behaviorResolutionService");
}

id objc_msgSend_bodySensorLocationCharacteristic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bodySensorLocationCharacteristic");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_btClockMask(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "btClockMask");
}

id objc_msgSend_btSyncPeriod(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "btSyncPeriod");
}

id objc_msgSend_bulletin(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bulletin");
}

id objc_msgSend_bulletinID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bulletinID");
}

id objc_msgSend_bundleContainerURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleContainerURL");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_bundleWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleWithPath:");
}

id objc_msgSend_buttonData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buttonData");
}

id objc_msgSend_buttonInterestNotification(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buttonInterestNotification");
}

id objc_msgSend_buttons(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buttons");
}

id objc_msgSend_byteOrder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "byteOrder");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bytes");
}

id objc_msgSend_cachedButtonsAndTimestamps(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cachedButtonsAndTimestamps");
}

id objc_msgSend_calculateTimestampDifference_current_threshold_compensation_errorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "calculateTimestampDifference:current:threshold:compensation:errorHandler:");
}

id objc_msgSend_call(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "call");
}

id objc_msgSend_callCenter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callCenter");
}

id objc_msgSend_callCenterWithQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callCenterWithQueue:");
}

id objc_msgSend_callbackDestinationID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callbackDestinationID");
}

id objc_msgSend_callerId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callerId");
}

id objc_msgSend_callerIdLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callerIdLabel");
}

id objc_msgSend_callerNameForDisplay(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callerNameForDisplay");
}

id objc_msgSend_callsWithPredicate_limit_offset_batchSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callsWithPredicate:limit:offset:batchSize:");
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancel");
}

id objc_msgSend_cancelNextDSTTransitionTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelNextDSTTransitionTimer");
}

id objc_msgSend_cancelPeripheralConnection_force_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelPeripheralConnection:force:");
}

id objc_msgSend_cancelPeripheralConnection_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelPeripheralConnection:options:");
}

id objc_msgSend_cancelPeripheralConnectionForConnectOnceIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelPeripheralConnectionForConnectOnceIdentifier:");
}

id objc_msgSend_cancelSiri(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelSiri");
}

id objc_msgSend_cancelStaleConnectionRequests(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelStaleConnectionRequests");
}

id objc_msgSend_cancelStream(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelStream");
}

id objc_msgSend_caseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "caseInsensitiveCompare:");
}

id objc_msgSend_categoryID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "categoryID");
}

id objc_msgSend_categoryIDForAppIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "categoryIDForAppIdentifier:");
}

id objc_msgSend_categoryIDForGenreID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "categoryIDForGenreID:");
}

id objc_msgSend_categoryIDToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "categoryIDToString:");
}

id objc_msgSend_cattPeripheral(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cattPeripheral");
}

id objc_msgSend_central(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "central");
}

id objc_msgSend_centralManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "centralManager");
}

id objc_msgSend_centralManagerStateString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "centralManagerStateString");
}

id objc_msgSend_centrals(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "centrals");
}

id objc_msgSend_certificate1Characteristic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "certificate1Characteristic");
}

id objc_msgSend_certificate2Characteristic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "certificate2Characteristic");
}

id objc_msgSend_certificateSerialNumber(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "certificateSerialNumber");
}

id objc_msgSend_chManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chManager");
}

id objc_msgSend_chMissedCallAlerts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chMissedCallAlerts");
}

id objc_msgSend_chUnreadMissedCalls(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chUnreadMissedCalls");
}

id objc_msgSend_challengeResponseCharacteristic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "challengeResponseCharacteristic");
}

id objc_msgSend_changeState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changeState:");
}

id objc_msgSend_changeVolumeBy_forCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changeVolumeBy:forCategory:");
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterAtIndex:");
}

id objc_msgSend_characteristic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characteristic");
}

id objc_msgSend_characteristicForReportID_reportType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characteristicForReportID:reportType:");
}

id objc_msgSend_characteristics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characteristics");
}

id objc_msgSend_chargeStateCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chargeStateCollection:");
}

id objc_msgSend_chargerStateChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chargerStateChanged:");
}

id objc_msgSend_checkAndLogHostInputReportCollision_reportID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkAndLogHostInputReportCollision:reportID:");
}

id objc_msgSend_classNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "classNamed:");
}

id objc_msgSend_cleanup(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cleanup");
}

id objc_msgSend_clearAppleMultitouchDeviceNotification(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearAppleMultitouchDeviceNotification");
}

id objc_msgSend_clearBulletins_inSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearBulletins:inSection:");
}

id objc_msgSend_clearButtonInterestNotification(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearButtonInterestNotification");
}

id objc_msgSend_clearDeviceManagementNotification(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearDeviceManagementNotification");
}

id objc_msgSend_clearEvent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearEvent");
}

id objc_msgSend_clearState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearState");
}

id objc_msgSend_clearable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearable");
}

id objc_msgSend_clientService_desiresConnectionParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientService:desiresConnectionParameters:");
}

id objc_msgSend_clientServiceDidStart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientServiceDidStart:");
}

id objc_msgSend_clientServiceForUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientServiceForUUID:");
}

id objc_msgSend_clientServiceManagerMap(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientServiceManagerMap");
}

id objc_msgSend_clientServiceMap(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientServiceMap");
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "close");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "code");
}

id objc_msgSend_codec(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "codec");
}

id objc_msgSend_codecList(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "codecList");
}

id objc_msgSend_codecs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "codecs");
}

id objc_msgSend_collectData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectData:");
}

id objc_msgSend_collectDataForQuantityTypeIdentifiers_isWorkout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectDataForQuantityTypeIdentifiers:isWorkout:");
}

id objc_msgSend_collectDataForQuantityTypes_isWorkout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectDataForQuantityTypes:isWorkout:");
}

id objc_msgSend_combineCurrentArray_withNewArray_maxCount_objectRemoved_objectAdded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "combineCurrentArray:withNewArray:maxCount:objectRemoved:objectAdded:");
}

id objc_msgSend_comboHKDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "comboHKDevice");
}

id objc_msgSend_commandCondition(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commandCondition");
}

id objc_msgSend_commandError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commandError");
}

id objc_msgSend_commandPending(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commandPending");
}

id objc_msgSend_commandValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commandValue");
}

id objc_msgSend_communicationContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "communicationContext");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:");
}

id objc_msgSend_components_fromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "components:fromDate:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_connectAlways_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectAlways:");
}

id objc_msgSend_connectAlwaysIdentifiersMap(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectAlwaysIdentifiersMap");
}

id objc_msgSend_connectDevice_quickDisconnectEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectDevice:quickDisconnectEnabled:");
}

id objc_msgSend_connectOnce_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectOnce:");
}

id objc_msgSend_connectOnce_connectionTimeoutEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectOnce:connectionTimeoutEnabled:");
}

id objc_msgSend_connectOnceIdentifiersMap(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectOnceIdentifiersMap");
}

id objc_msgSend_connectOnceNoTimeoutIdentifiers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectOnceNoTimeoutIdentifiers");
}

id objc_msgSend_connectPeripheral_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectPeripheral:");
}

id objc_msgSend_connectPeripheral_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectPeripheral:options:");
}

id objc_msgSend_connectStateStr_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectStateStr:");
}

id objc_msgSend_connectTaggedDevices(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectTaggedDevices");
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connection");
}

id objc_msgSend_connectionAssertion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectionAssertion");
}

id objc_msgSend_connectionIdleTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectionIdleTimer");
}

id objc_msgSend_connectionUUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectionUUID");
}

id objc_msgSend_consentForUserIndex_withConsentCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "consentForUserIndex:withConsentCode:");
}

id objc_msgSend_consolidatedDataForRequests_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "consolidatedDataForRequests:");
}

id objc_msgSend_contactStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactStore");
}

id objc_msgSend_contactUsingContactStore_withKeysToFetch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactUsingContactStore:withKeysToFetch:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsString:");
}

id objc_msgSend_contentPreviewSetting(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentPreviewSetting");
}

id objc_msgSend_contentType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentType");
}

id objc_msgSend_contentsOfDirectoryAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentsOfDirectoryAtPath:error:");
}

id objc_msgSend_controlPointCharacteristic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "controlPointCharacteristic");
}

id objc_msgSend_controlPointTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "controlPointTimer");
}

id objc_msgSend_convertBTClockToMicrosec_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertBTClockToMicrosec:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copy");
}

id objc_msgSend_correlationTypeForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "correlationTypeForIdentifier:");
}

id objc_msgSend_correlationWithType_startDate_endDate_objects_device_metadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "correlationWithType:startDate:endDate:objects:device:metadata:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countUnit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countUnit");
}

id objc_msgSend_createConnectionWithType_andIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createConnectionWithType:andIdentifier:");
}

id objc_msgSend_createDataCollectorForQuantityType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDataCollectorForQuantityType:");
}

id objc_msgSend_createDatum_start_end_quantityType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDatum:start:end:quantityType:");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createDistributedHKDeviceWithSecondary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDistributedHKDeviceWithSecondary:");
}

id objc_msgSend_createDoAPDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDoAPDevice");
}

id objc_msgSend_createEndpointWithTransportType_andProtocol_andIdentifier_andDataOutHandler_forConnectionWithUUID_publishConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createEndpointWithTransportType:andProtocol:andIdentifier:andDataOutHandler:forConnectionWithUUID:publishConnection:");
}

id objc_msgSend_createGHSDeviceIfReady(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createGHSDeviceIfReady");
}

id objc_msgSend_createHIDDeviceIfEverythingReady(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createHIDDeviceIfEverythingReady");
}

id objc_msgSend_createHKDataCollectorForHKQuantityType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createHKDataCollectorForHKQuantityType:");
}

id objc_msgSend_createHKDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createHKDevice");
}

id objc_msgSend_createReportInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createReportInfo:");
}

id objc_msgSend_createServices(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createServices");
}

id objc_msgSend_csControlPointCharacteristic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "csControlPointCharacteristic");
}

id objc_msgSend_csFeatureCharacteristic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "csFeatureCharacteristic");
}

id objc_msgSend_csMeasurementCharacteristic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "csMeasurementCharacteristic");
}

id objc_msgSend_currentAttributeValueForAttributeID_entityID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentAttributeValueForAttributeID:entityID:");
}

id objc_msgSend_currentDstOffset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentDstOffset");
}

id objc_msgSend_currentElapsedTimeCharacteristic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentElapsedTimeCharacteristic");
}

id objc_msgSend_currentIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentIdentifier");
}

id objc_msgSend_currentInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentInfo");
}

id objc_msgSend_currentPlaybackState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentPlaybackState");
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentRunLoop");
}

id objc_msgSend_currentSettings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentSettings");
}

id objc_msgSend_currentSupportedCommands(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentSupportedCommands");
}

id objc_msgSend_currentTimeCharacteristic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentTimeCharacteristic");
}

id objc_msgSend_currentTimeDidChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentTimeDidChange");
}

id objc_msgSend_currentTimeValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentTimeValue");
}

id objc_msgSend_currentTimeZone(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentTimeZone");
}

id objc_msgSend_customProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "customProperty:");
}

id objc_msgSend_cyclingPowerControlPointCharacteristic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cyclingPowerControlPointCharacteristic");
}

id objc_msgSend_cyclingPowerFeatureCharacteristic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cyclingPowerFeatureCharacteristic");
}

id objc_msgSend_cyclingPowerMeasurementCharacteristic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cyclingPowerMeasurementCharacteristic");
}

id objc_msgSend_cyclingPowerSensorLocationCharacteristic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cyclingPowerSensorLocationCharacteristic");
}

id objc_msgSend_cyclingPowerVectorCharacteristic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cyclingPowerVectorCharacteristic");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "data");
}

id objc_msgSend_dataSourceCharacteristic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataSourceCharacteristic");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataValue");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithBytesNoCopy:length:freeWhenDone:");
}

id objc_msgSend_dataWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithData:");
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithJSONObject:options:error:");
}

id objc_msgSend_databaseChangeIncrementCharacteristic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "databaseChangeIncrementCharacteristic");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "date");
}

id objc_msgSend_dateInterval(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateInterval");
}

id objc_msgSend_dateWithElapsedTimeData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithElapsedTimeData:");
}

id objc_msgSend_dateWithTimeInterval_sinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeInterval:sinceDate:");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "day");
}

id objc_msgSend_daylightSavingTimeOffset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "daylightSavingTimeOffset");
}

id objc_msgSend_deactivateHIDPolicy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deactivateHIDPolicy");
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "debugDescription");
}

id objc_msgSend_debugLoggingEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "debugLoggingEnabled");
}

id objc_msgSend_decOpportunisticConnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decOpportunisticConnection");
}

id objc_msgSend_decomposeToURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decomposeToURL:error:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaultPlaybackRate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultPlaybackRate");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delegate");
}

id objc_msgSend_demultiplexInputReport_reportLength_reportID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "demultiplexInputReport:reportLength:reportID:");
}

id objc_msgSend_denylistedIdentifiers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "denylistedIdentifiers");
}

id objc_msgSend_deregisterForPowerManagementEvents(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deregisterForPowerManagementEvents");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "description");
}

id objc_msgSend_descriptorForRequiredKeysForStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptorForRequiredKeysForStyle:");
}

id objc_msgSend_descriptors(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptors");
}

id objc_msgSend_desiredConnectionParameters(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "desiredConnectionParameters");
}

id objc_msgSend_destroyConnectionWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "destroyConnectionWithUUID:");
}

id objc_msgSend_destroyDoAPDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "destroyDoAPDevice");
}

id objc_msgSend_destroyHIDDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "destroyHIDDevice");
}

id objc_msgSend_destroyServices(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "destroyServices");
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "device");
}

id objc_msgSend_deviceManagement(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceManagement");
}

id objc_msgSend_deviceManagementEndpoint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceManagementEndpoint");
}

id objc_msgSend_deviceMgntUserDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceMgntUserDevice");
}

id objc_msgSend_deviceMgtDriverArrived_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceMgtDriverArrived:");
}

id objc_msgSend_deviceMgtNotification(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceMgtNotification");
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceType");
}

id objc_msgSend_dialWithRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dialWithRequest:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_dictionaryWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithContentsOfFile:");
}

id objc_msgSend_dictionaryWithObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObject:forKey:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didUpdateBodySensorLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didUpdateBodySensorLocation:");
}

id objc_msgSend_didUpdateHeartRateMeasurement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didUpdateHeartRateMeasurement:");
}

id objc_msgSend_disconnectCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disconnectCall:");
}

id objc_msgSend_disconnectDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disconnectDevice:");
}

id objc_msgSend_disconnectDevicesWithoutRunningService(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disconnectDevicesWithoutRunningService");
}

id objc_msgSend_disconnectPeripheral_force_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disconnectPeripheral:force:");
}

id objc_msgSend_discoverCharacteristics_forService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "discoverCharacteristics:forService:");
}

id objc_msgSend_discoverDescriptorsForCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "discoverDescriptorsForCharacteristic:");
}

id objc_msgSend_discoverServices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "discoverServices:");
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayName");
}

id objc_msgSend_displayNameForAppIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayNameForAppIdentifier:");
}

id objc_msgSend_doapAudioDidStop_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doapAudioDidStop:");
}

id objc_msgSend_doapAudioRelay(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doapAudioRelay");
}

id objc_msgSend_doapAudioRelays(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doapAudioRelays");
}

id objc_msgSend_doapAudioStart(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doapAudioStart");
}

id objc_msgSend_doapAudioStop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doapAudioStop");
}

id objc_msgSend_doapAudioWillStart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doapAudioWillStart:");
}

id objc_msgSend_doapDeviceDidStart(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doapDeviceDidStart");
}

id objc_msgSend_doapDeviceDidStop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doapDeviceDidStop");
}

id objc_msgSend_doapDeviceWithCodecs_streamID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doapDeviceWithCodecs:streamID:");
}

id objc_msgSend_doapDevices(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doapDevices");
}

id objc_msgSend_doapStateNameFor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doapStateNameFor:");
}

id objc_msgSend_doapStateSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doapStateSet:");
}

id objc_msgSend_doesNotRecognizeSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doesNotRecognizeSelector:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "domain");
}

id objc_msgSend_doubleForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doubleForKey:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_downloadAvailableFirmwareUpdate_assetID_withUserIntent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadAvailableFirmwareUpdate:assetID:withUserIntent:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_encodedData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodedData");
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endDate");
}

id objc_msgSend_endpointForPipe_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endpointForPipe:");
}

id objc_msgSend_endpointUUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endpointUUID");
}

id objc_msgSend_entityAttributeCharacteristic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "entityAttributeCharacteristic");
}

id objc_msgSend_entityUpdateCharacteristic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "entityUpdateCharacteristic");
}

id objc_msgSend_entityUpdateFlagsToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "entityUpdateFlagsToString:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "error");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_eventFlagsToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventFlagsToString:");
}

id objc_msgSend_eventIDToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventIDToString:");
}

id objc_msgSend_eventIndicator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventIndicator:");
}

id objc_msgSend_eventIndicator_eventValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventIndicator:eventValue:");
}

id objc_msgSend_eventQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventQueue");
}

id objc_msgSend_exchangeObjectAtIndex_withObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exchangeObjectAtIndex:withObjectAtIndex:");
}

id objc_msgSend_extractBatteryLevel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extractBatteryLevel");
}

id objc_msgSend_extractBatteryPowerState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extractBatteryPowerState");
}

id objc_msgSend_extractButtonDataFromReport_buttonIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extractButtonDataFromReport:buttonIndex:");
}

id objc_msgSend_extractControlPointResponse(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extractControlPointResponse");
}

id objc_msgSend_extractDatabaseChangeIncrement(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extractDatabaseChangeIncrement");
}

id objc_msgSend_extractGHSControlPointResponse(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extractGHSControlPointResponse");
}

id objc_msgSend_extractHealthObservationBloodGlucoseWithStream_observationType_timestamp_isLive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extractHealthObservationBloodGlucoseWithStream:observationType:timestamp:isLive:");
}

id objc_msgSend_extractHealthObservationBloodPressureStatusWithStream_timestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extractHealthObservationBloodPressureStatusWithStream:timestamp:");
}

id objc_msgSend_extractHealthObservationBloodPressureWithStream_timestamp_isLive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extractHealthObservationBloodPressureWithStream:timestamp:isLive:");
}

id objc_msgSend_extractHealthObservationBodyHeightWithStream_timestamp_isLive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extractHealthObservationBodyHeightWithStream:timestamp:isLive:");
}

id objc_msgSend_extractHealthObservationBodyMassIndexWithStream_timestamp_isLive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extractHealthObservationBodyMassIndexWithStream:timestamp:isLive:");
}

id objc_msgSend_extractHealthObservationBodyMassWithStream_timestamp_isLive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extractHealthObservationBodyMassWithStream:timestamp:isLive:");
}

id objc_msgSend_extractHealthObservationBodySegmentFromData_isLive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extractHealthObservationBodySegmentFromData:isLive:");
}

id objc_msgSend_extractHealthObservationBodyTemperatureWithStream_observationType_timestamp_isLive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extractHealthObservationBodyTemperatureWithStream:observationType:timestamp:isLive:");
}

id objc_msgSend_extractHealthObservationHeartRateWithStream_timestamp_isLive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extractHealthObservationHeartRateWithStream:timestamp:isLive:");
}

id objc_msgSend_extractHealthSensorFeatures(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extractHealthSensorFeatures");
}

id objc_msgSend_extractIDs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extractIDs");
}

id objc_msgSend_extractLiveHealthObservation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extractLiveHealthObservation");
}

id objc_msgSend_extractObservationScheduleChanged(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extractObservationScheduleChanged");
}

id objc_msgSend_extractRACPResponse(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extractRACPResponse");
}

id objc_msgSend_extractRegisteredUserData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extractRegisteredUserData");
}

id objc_msgSend_extractStoredHealthObservation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extractStoredHealthObservation");
}

id objc_msgSend_extractTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extractTime");
}

id objc_msgSend_extractUserIndex(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extractUserIndex");
}

id objc_msgSend_featuresCharacteristic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "featuresCharacteristic");
}

id objc_msgSend_featuresReadComplete(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "featuresReadComplete");
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:isDirectory:");
}

id objc_msgSend_filterCriteria(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filterCriteria");
}

id objc_msgSend_findMatchingDistributedFitnessService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findMatchingDistributedFitnessService:");
}

id objc_msgSend_finishCollectionForQuantityType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishCollectionForQuantityType:");
}

id objc_msgSend_finishWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishWithCompletion:");
}

id objc_msgSend_firmwareRevision(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firmwareRevision");
}

id objc_msgSend_firmwareVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firmwareVersion");
}

id objc_msgSend_firstButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstButton");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstObject");
}

id objc_msgSend_firstPartyAppIdentifierToCategoryMap(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstPartyAppIdentifierToCategoryMap");
}

id objc_msgSend_firstSampleTimestamp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstSampleTimestamp");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "floatValue");
}

id objc_msgSend_forceInputReportSet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "forceInputReportSet");
}

id objc_msgSend_forceUserDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "forceUserDevice");
}

id objc_msgSend_fwRevisionCharacteristic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fwRevisionCharacteristic");
}

id objc_msgSend_genreIDForGenre_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "genreIDForGenre:");
}

id objc_msgSend_getAndRemoveFromUARPTransportDict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getAndRemoveFromUARPTransportDict:");
}

id objc_msgSend_getAudioHIDReportDescriptor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getAudioHIDReportDescriptor");
}

id objc_msgSend_getButtonsHIDReportDescriptor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getButtonsHIDReportDescriptor:");
}

id objc_msgSend_getBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBytes:length:");
}

id objc_msgSend_getBytes_maxLength_usedLength_encoding_options_range_remainingRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:");
}

id objc_msgSend_getBytes_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBytes:range:");
}

id objc_msgSend_getConnectedPeripheralUUIDsCollecting_andIdle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getConnectedPeripheralUUIDsCollecting:andIdle:");
}

id objc_msgSend_getDebugLoggingEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getDebugLoggingEnabled");
}

id objc_msgSend_getDescriptionForResponseValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getDescriptionForResponseValue:");
}

id objc_msgSend_getDescriptionForTimeSyncSourceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getDescriptionForTimeSyncSourceType:");
}

id objc_msgSend_getDeviceManagementHIDReportDescriptor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getDeviceManagementHIDReportDescriptor");
}

id objc_msgSend_getEnabledStatusForPeripheral_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getEnabledStatusForPeripheral:withCompletion:");
}

id objc_msgSend_getInertialHIDReportDescriptor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getInertialHIDReportDescriptor");
}

id objc_msgSend_getInfraredHIDReportDescriptor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getInfraredHIDReportDescriptor");
}

id objc_msgSend_getProximityHIDReportDescriptor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getProximityHIDReportDescriptor");
}

id objc_msgSend_getRadioHIDReportDescriptor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getRadioHIDReportDescriptor");
}

id objc_msgSend_getReport_reportLength_reportID_reportType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getReport:reportLength:reportID:reportType:");
}

id objc_msgSend_getReport_reportLength_reportID_reportType_keyholeID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getReport:reportLength:reportID:reportType:keyholeID:");
}

id objc_msgSend_getReportData_reportID_reportType_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getReportData:reportID:reportType:error:");
}

id objc_msgSend_getReportKeyholeID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getReportKeyholeID");
}

id objc_msgSend_getRequestedTags(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getRequestedTags");
}

id objc_msgSend_getResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getResourceValue:forKey:error:");
}

id objc_msgSend_getSectionInfoWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getSectionInfoWithCompletion:");
}

id objc_msgSend_getTouchHIDReportDescriptor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getTouchHIDReportDescriptor");
}

id objc_msgSend_getUUIDBytes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getUUIDBytes:");
}

id objc_msgSend_getVolume_forCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getVolume:forCategory:");
}

id objc_msgSend_ghsControlPointCharacteristic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ghsControlPointCharacteristic");
}

id objc_msgSend_ghsDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ghsDevice");
}

id objc_msgSend_ghsDeviceProperties(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ghsDeviceProperties");
}

id objc_msgSend_ghsDeviceWithProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ghsDeviceWithProperties:");
}

id objc_msgSend_gotDeviceExtendedInfoReport(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "gotDeviceExtendedInfoReport");
}

id objc_msgSend_groupDeviceManagement(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupDeviceManagement");
}

id objc_msgSend_groupInertial(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupInertial");
}

id objc_msgSend_groupInit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupInit");
}

id objc_msgSend_groupProximity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupProximity");
}

id objc_msgSend_groupStart(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupStart");
}

id objc_msgSend_groupTouch(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupTouch");
}

id objc_msgSend_handle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handle");
}

id objc_msgSend_handleAnalyticsData_data_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleAnalyticsData:data:length:");
}

id objc_msgSend_handleAudioData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleAudioData:");
}

id objc_msgSend_handleAudioData_dataLength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleAudioData:dataLength:");
}

id objc_msgSend_handleButtonData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleButtonData");
}

id objc_msgSend_handleCheckInMsg_applicationID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleCheckInMsg:applicationID:");
}

id objc_msgSend_handleConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleConnection:");
}

id objc_msgSend_handleControlPointWrite_responseData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleControlPointWrite:responseData:");
}

id objc_msgSend_handleDeviceManagementData_dataLength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleDeviceManagementData:dataLength:");
}

id objc_msgSend_handleDisconnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleDisconnection");
}

id objc_msgSend_handleDisconnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleDisconnection:");
}

id objc_msgSend_handleEntityAttributeRead_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleEntityAttributeRead:");
}

id objc_msgSend_handleEntityAttributeWrite_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleEntityAttributeWrite:");
}

id objc_msgSend_handleEntityUpdateWrite_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleEntityUpdateWrite:action:");
}

id objc_msgSend_handleEventIndicator_eventValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleEventIndicator:eventValue:");
}

id objc_msgSend_handleGetAppAttributesCommand_responseData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleGetAppAttributesCommand:responseData:");
}

id objc_msgSend_handleGetNotificationAttributesCommand_responseData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleGetNotificationAttributesCommand:responseData:");
}

id objc_msgSend_handleInertialData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleInertialData");
}

id objc_msgSend_handleInputData_targetDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleInputData:targetDevice:");
}

id objc_msgSend_handleInputReport_reportLength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleInputReport:reportLength:");
}

id objc_msgSend_handleInputReport_reportLength_timestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleInputReport:reportLength:timestamp:");
}

id objc_msgSend_handleInputReportData_reportID_timestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleInputReportData:reportID:timestamp:");
}

id objc_msgSend_handleInputReportDataV1_reportID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleInputReportDataV1:reportID:");
}

id objc_msgSend_handleInputReportDataV2_reportID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleInputReportDataV2:reportID:");
}

id objc_msgSend_handleLiveHealthObservationsData_observationClassType_observationType_userID_observationID_timestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleLiveHealthObservationsData:observationClassType:observationType:userID:observationID:timestamp:");
}

id objc_msgSend_handleLogRetrievalRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleLogRetrievalRequest:");
}

id objc_msgSend_handleMsg_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleMsg:");
}

id objc_msgSend_handlePerformNotificationActionCommand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handlePerformNotificationActionCommand:");
}

id objc_msgSend_handlePowerManagementNotification_notificationID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handlePowerManagementNotification:notificationID:");
}

id objc_msgSend_handleProximityData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleProximityData");
}

id objc_msgSend_handleRemoteCommandWrite_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleRemoteCommandWrite:");
}

id objc_msgSend_handleResetStream(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleResetStream");
}

id objc_msgSend_handleStartStream(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleStartStream");
}

id objc_msgSend_handleStartStreaming(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleStartStreaming");
}

id objc_msgSend_handleStopStream(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleStopStream");
}

id objc_msgSend_handleStopStreaming_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleStopStreaming:");
}

id objc_msgSend_handleStoredHealthObservationsData_observationClassType_observationType_userID_observationID_timestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleStoredHealthObservationsData:observationClassType:observationType:userID:observationID:timestamp:");
}

id objc_msgSend_handleTouchData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleTouchData");
}

id objc_msgSend_handleType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleType");
}

id objc_msgSend_handleWithDestinationID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleWithDestinationID:");
}

id objc_msgSend_handleXpcDisconnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleXpcDisconnection:");
}

id objc_msgSend_hardwareRevision(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hardwareRevision");
}

id objc_msgSend_hardwareVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hardwareVersion");
}

id objc_msgSend_hasExtraContent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasExtraContent");
}

id objc_msgSend_hasIDs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasIDs");
}

id objc_msgSend_hasNegativeAction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasNegativeAction");
}

id objc_msgSend_hasPositiveAction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPositiveAction");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasTag:");
}

id objc_msgSend_hasWirelessCharging(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasWirelessCharging");
}

id objc_msgSend_healthDataSyncBloodGlucose_unit_startTime_endTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "healthDataSyncBloodGlucose:unit:startTime:endTime:");
}

id objc_msgSend_healthDataSyncBloodPressuresWithSystolicBP_systolicBPUnit_diastolicBP_diastolicBPUnit_startTime_endTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "healthDataSyncBloodPressuresWithSystolicBP:systolicBPUnit:diastolicBP:diastolicBPUnit:startTime:endTime:");
}

id objc_msgSend_healthDataSyncBodyMeasurement_measurementType_unit_startTime_endTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "healthDataSyncBodyMeasurement:measurementType:unit:startTime:endTime:");
}

id objc_msgSend_healthDataSyncBodyTemperature_unit_startTime_endTime_sensorLocType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "healthDataSyncBodyTemperature:unit:startTime:endTime:sensorLocType:");
}

id objc_msgSend_healthDataSyncHeartRate_unit_startTime_endTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "healthDataSyncHeartRate:unit:startTime:endTime:");
}

id objc_msgSend_healthPeripheralsWithFilter_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "healthPeripheralsWithFilter:handler:");
}

id objc_msgSend_heartRateMeasurementCharacteristic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "heartRateMeasurementCharacteristic");
}

id objc_msgSend_heartRateScanDidTimeOut(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "heartRateScanDidTimeOut");
}

id objc_msgSend_heartRateScanTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "heartRateScanTimer");
}

id objc_msgSend_hidControlPointCharacteristic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hidControlPointCharacteristic");
}

id objc_msgSend_hidDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hidDevice");
}

id objc_msgSend_hidDeviceDesiredConnectionParametersDidChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hidDeviceDesiredConnectionParametersDidChange");
}

id objc_msgSend_hidDeviceDidStart(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hidDeviceDidStart");
}

id objc_msgSend_hidDeviceDidStop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hidDeviceDidStop");
}

id objc_msgSend_hidDeviceProperties(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hidDeviceProperties");
}

id objc_msgSend_hidDeviceWithProperties_reports_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hidDeviceWithProperties:reports:");
}

id objc_msgSend_hidInformationCharacteristic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hidInformationCharacteristic");
}

id objc_msgSend_hidProperties(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hidProperties");
}

id objc_msgSend_hkDataCollectors(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hkDataCollectors");
}

id objc_msgSend_hkDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hkDevice");
}

id objc_msgSend_hkHealthStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hkHealthStore");
}

id objc_msgSend_hkQuantityType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hkQuantityType");
}

id objc_msgSend_hkQuantityTypeForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hkQuantityTypeForIdentifier:");
}

id objc_msgSend_hkQuantityTypesCollecting(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hkQuantityTypesCollecting");
}

id objc_msgSend_hkStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hkStore");
}

id objc_msgSend_hkUnitForHKQuantityType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hkUnitForHKQuantityType:");
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hour");
}

id objc_msgSend_hrmSessionStateChanged_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hrmSessionStateChanged:completion:");
}

id objc_msgSend_hub(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hub");
}

id objc_msgSend_hwRevisionCharacteristic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hwRevisionCharacteristic");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifier");
}

id objc_msgSend_identifierForConnectionWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifierForConnectionWithUUID:");
}

id objc_msgSend_ignoresQuietMode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ignoresQuietMode");
}

id objc_msgSend_incOpportunisticConnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "incOpportunisticConnection");
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_indexOfObjectPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObjectPassingTest:");
}

id objc_msgSend_inertial(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inertial");
}

id objc_msgSend_inertialData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inertialData");
}

id objc_msgSend_info(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "info");
}

id objc_msgSend_infrared(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "infrared");
}

id objc_msgSend_initWithBtClockMask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBtClockMask:");
}

id objc_msgSend_initWithBulletin_observer_categoryID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBulletin:observer:categoryID:");
}

id objc_msgSend_initWithByteOrder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithByteOrder:");
}

id objc_msgSend_initWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBytes:length:");
}

id objc_msgSend_initWithBytes_length_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBytes:length:encoding:");
}

id objc_msgSend_initWithCalendarIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCalendarIdentifier:");
}

id objc_msgSend_initWithCall_callCenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCall:callCenter:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithCodecs_streamID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCodecs:streamID:");
}

id objc_msgSend_initWithConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConnection:");
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:");
}

id objc_msgSend_initWithDelegate_pipe_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:pipe:");
}

id objc_msgSend_initWithDelegate_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:queue:");
}

id objc_msgSend_initWithDelegate_queue_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:queue:options:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithFireDate_interval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFireDate:interval:target:selector:userInfo:repeats:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithHardwareID_uuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHardwareID:uuid:");
}

id objc_msgSend_initWithHealthStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHealthStore:");
}

id objc_msgSend_initWithHealthStore_bundleIdentifier_quantityType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHealthStore:bundleIdentifier:quantityType:");
}

id objc_msgSend_initWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithID:");
}

id objc_msgSend_initWithID_type_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithID:type:");
}

id objc_msgSend_initWithIdentifier_dateInterval_quantity_resumeContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:dateInterval:quantity:resumeContext:");
}

id objc_msgSend_initWithIdentifier_deviceType_properties_codecType_hub_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:deviceType:properties:codecType:hub:");
}

id objc_msgSend_initWithLocationType_remoteURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLocationType:remoteURL:");
}

id objc_msgSend_initWithManager_peripheral_service_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithManager:peripheral:service:");
}

id objc_msgSend_initWithName_manufacturer_model_hardwareVersion_firmwareVersion_softwareVersion_localIdentifier_UDIDeviceIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:manufacturer:model:hardwareVersion:firmwareVersion:softwareVersion:localIdentifier:UDIDeviceIdentifier:");
}

id objc_msgSend_initWithName_options_queue_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:options:queue:delegate:");
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObjects:");
}

id objc_msgSend_initWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObjects:count:");
}

id objc_msgSend_initWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObjects:forKeys:count:");
}

id objc_msgSend_initWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPath:");
}

id objc_msgSend_initWithPeripheral_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPeripheral:");
}

id objc_msgSend_initWithProperties_healthStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithProperties:healthStore:");
}

id objc_msgSend_initWithProperties_hidDescriptor_keyholeID_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithProperties:hidDescriptor:keyholeID:delegate:");
}

id objc_msgSend_initWithProperties_reports_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithProperties:reports:");
}

id objc_msgSend_initWithProperties_reports_loggingIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithProperties:reports:loggingIdentifier:");
}

id objc_msgSend_initWithProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithProvider:");
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:");
}

id objc_msgSend_initWithRecentCall_manager_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRecentCall:manager:queue:");
}

id objc_msgSend_initWithStartDate_endDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStartDate:endDate:");
}

id objc_msgSend_initWithSubType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSubType:");
}

id objc_msgSend_initWithType_primary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:primary:");
}

id objc_msgSend_initWithType_priority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:priority:");
}

id objc_msgSend_initWithType_properties_value_permissions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:properties:value:permissions:");
}

id objc_msgSend_initWithUID_alert_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUID:alert:");
}

id objc_msgSend_initWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:");
}

id objc_msgSend_initWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUTF8String:");
}

id objc_msgSend_initWithUUIDBytes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUIDBytes:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_initWithValue_byteOrder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithValue:byteOrder:");
}

id objc_msgSend_initWithValue_characteristic_centrals_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithValue:characteristic:centrals:");
}

id objc_msgSend_initWithVendorIDSource_vendorID_productID_productVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithVendorIDSource:vendorID:productID:productVersion:");
}

id objc_msgSend_initWithVoicemail_manager_contactStore_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithVoicemail:manager:contactStore:queue:");
}

id objc_msgSend_input(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "input");
}

id objc_msgSend_inputReportTimestamp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inputReportTimestamp");
}

id objc_msgSend_inputStream(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inputStream");
}

id objc_msgSend_inputStreamWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inputStreamWithData:");
}

id objc_msgSend_inputStreamWithData_byteOrder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inputStreamWithData:byteOrder:");
}

id objc_msgSend_insertDatums_device_metadata_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertDatums:device:metadata:completion:");
}

id objc_msgSend_instance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "instance");
}

id objc_msgSend_instanceID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "instanceID");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerForKey:");
}

id objc_msgSend_interruptionLevel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interruptionLevel");
}

id objc_msgSend_interruptionSuppression(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interruptionSuppression");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidate");
}

id objc_msgSend_invocationForNotifyAttributeIDs_entityID_central_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invocationForNotifyAttributeIDs:entityID:central:");
}

id objc_msgSend_invocationWithMethodSignature_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invocationWithMethodSignature:");
}

id objc_msgSend_invokeWithTarget_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invokeWithTarget:");
}

id objc_msgSend_iopsNotifyPercentChangeToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "iopsNotifyPercentChangeToken");
}

id objc_msgSend_isAccessoryCategoryPencil_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAccessoryCategoryPencil:");
}

id objc_msgSend_isAlertSilent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAlertSilent:");
}

id objc_msgSend_isAlwaysConnecting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAlwaysConnecting:");
}

id objc_msgSend_isBlocked(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isBlocked");
}

id objc_msgSend_isCollectingHKQuantityType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCollectingHKQuantityType:");
}

id objc_msgSend_isDeleted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDeleted");
}

id objc_msgSend_isDirty(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDirty");
}

id objc_msgSend_isDistributed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDistributed");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToArray:");
}

id objc_msgSend_isEqualToData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToData:");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToSet:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isEventIndicatorNotificationEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEventIndicatorNotificationEnabled");
}

id objc_msgSend_isFaceTimeProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFaceTimeProvider");
}

id objc_msgSend_isFitnessClassicDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFitnessClassicDevice");
}

id objc_msgSend_isHKQuantityRequested_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isHKQuantityRequested:");
}

id objc_msgSend_isHealthDataAvailable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isHealthDataAvailable");
}

id objc_msgSend_isHubConnected(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isHubConnected");
}

id objc_msgSend_isImportant(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isImportant");
}

id objc_msgSend_isLinkEncrypted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isLinkEncrypted");
}

id objc_msgSend_isLoading(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isLoading");
}

id objc_msgSend_isMuted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMuted");
}

id objc_msgSend_isNotifying(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isNotifying");
}

id objc_msgSend_isPeripheralConnected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPeripheralConnected:");
}

id objc_msgSend_isPowerManagementBasedOnDisplayState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPowerManagementBasedOnDisplayState");
}

id objc_msgSend_isPrimary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPrimary");
}

id objc_msgSend_isRegisteredForAttributeID_entityID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRegisteredForAttributeID:entityID:");
}

id objc_msgSend_isSendDataNotificationEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSendDataNotificationEnabled");
}

id objc_msgSend_isSendingData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSendingData");
}

id objc_msgSend_isSensorLocationLeft(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSensorLocationLeft");
}

id objc_msgSend_isSensorLocationRight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSensorLocationRight");
}

id objc_msgSend_isSilent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSilent");
}

id objc_msgSend_isSpecialSectionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSpecialSectionID:");
}

id objc_msgSend_isStartStreamingNotificationEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isStartStreamingNotificationEnabled");
}

id objc_msgSend_isStarted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isStarted");
}

id objc_msgSend_isStopStreamingNotificationEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isStopStreamingNotificationEnabled");
}

id objc_msgSend_isSupportingService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSupportingService:");
}

id objc_msgSend_isTelephonyProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isTelephonyProvider");
}

id objc_msgSend_isTimestampSyncEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isTimestampSyncEnabled");
}

id objc_msgSend_isTrashed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isTrashed");
}

id objc_msgSend_isUnread(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isUnread");
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValid");
}

id objc_msgSend_isXpcConnectedForDeviceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isXpcConnectedForDeviceType:");
}

id objc_msgSend_issueChallenge(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "issueChallenge");
}

id objc_msgSend_keyholeID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyholeID");
}

id objc_msgSend_knownQuantityTypes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "knownQuantityTypes");
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "label");
}

id objc_msgSend_lastAudioDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastAudioDate");
}

id objc_msgSend_lastDistributedDatum(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastDistributedDatum");
}

id objc_msgSend_lastKnownAttributeValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastKnownAttributeValue");
}

id objc_msgSend_lastKnownAttributeValueForAttributeID_entityID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastKnownAttributeValueForAttributeID:entityID:");
}

id objc_msgSend_lastKnownSupportedCommands(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastKnownSupportedCommands");
}

id objc_msgSend_latency(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "latency");
}

id objc_msgSend_latestSampleTimestampWithinSeconds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "latestSampleTimestampWithinSeconds:");
}

id objc_msgSend_launchServer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "launchServer");
}

id objc_msgSend_lazyContactStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lazyContactStore");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "length");
}

id objc_msgSend_lengthOfBytesUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lengthOfBytesUsingEncoding:");
}

id objc_msgSend_linkIdleTimeout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "linkIdleTimeout");
}

id objc_msgSend_liveObservationCharacteristic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "liveObservationCharacteristic");
}

id objc_msgSend_loadCollectionState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadCollectionState");
}

id objc_msgSend_loadedAttributeID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadedAttributeID");
}

id objc_msgSend_loadedEntityID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadedEntityID");
}

id objc_msgSend_localIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localIdentifier");
}

id objc_msgSend_localTimeInformationCharacteristic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localTimeInformationCharacteristic");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_localizedLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedLabel");
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedName");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_localizedStringForLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForLabel:");
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lock");
}

id objc_msgSend_logBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logBlock:");
}

id objc_msgSend_logHwFwVersions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logHwFwVersions");
}

id objc_msgSend_loggingIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loggingIdentifier");
}

id objc_msgSend_machTimeToMicrosec_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "machTimeToMicrosec:");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainRunLoop");
}

id objc_msgSend_manager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "manager");
}

id objc_msgSend_manufacturer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "manufacturer");
}

id objc_msgSend_manufacturerName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "manufacturerName");
}

id objc_msgSend_manufacturerNameCharacteristic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "manufacturerNameCharacteristic");
}

id objc_msgSend_markAllCallsAsReadWithPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markAllCallsAsReadWithPredicate:");
}

id objc_msgSend_markFitnessTaskEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markFitnessTaskEnabled:");
}

id objc_msgSend_matchInstanceIDInHidEventDriver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "matchInstanceIDInHidEventDriver:");
}

id objc_msgSend_matchesDistributedService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "matchesDistributedService:");
}

id objc_msgSend_maxCELength(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maxCELength");
}

id objc_msgSend_maxDeferment(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maxDeferment");
}

id objc_msgSend_maxInterval(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maxInterval");
}

id objc_msgSend_maxPayloadSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maxPayloadSize");
}

id objc_msgSend_maxPeripheralLatency(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maxPeripheralLatency");
}

id objc_msgSend_maxReportRetry(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maxReportRetry");
}

id objc_msgSend_maximumUpdateValueLength(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maximumUpdateValueLength");
}

id objc_msgSend_maximumWriteValueLengthForType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maximumWriteValueLengthForType:");
}

id objc_msgSend_maybeQueryOOBPAndSendStatus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maybeQueryOOBPAndSendStatus");
}

id objc_msgSend_mediaInfoDidChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaInfoDidChange");
}

id objc_msgSend_mediaPlayerDidChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaPlayerDidChange");
}

id objc_msgSend_mediaStateDidChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaStateDidChange");
}

id objc_msgSend_mediaVolumeDidChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaVolumeDidChange");
}

id objc_msgSend_member_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "member:");
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "message");
}

id objc_msgSend_methodSignatureForSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "methodSignatureForSelector:");
}

id objc_msgSend_mfiAuthChannel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mfiAuthChannel");
}

id objc_msgSend_mfiPeripheral(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mfiPeripheral");
}

id objc_msgSend_microsecToMachTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "microsecToMachTime:");
}

id objc_msgSend_migrateHKPairedHealthDevices(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "migrateHKPairedHealthDevices");
}

id objc_msgSend_minCELength(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "minCELength");
}

id objc_msgSend_minInterval(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "minInterval");
}

id objc_msgSend_minusSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "minusSet:");
}

id objc_msgSend_minute(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "minute");
}

id objc_msgSend_mobileBluetoothBundle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mobileBluetoothBundle");
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "model");
}

id objc_msgSend_modelNumber(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "modelNumber");
}

id objc_msgSend_modelNumberCharacteristic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "modelNumberCharacteristic");
}

id objc_msgSend_modifyAlert_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "modifyAlert:");
}

id objc_msgSend_month(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "month");
}

id objc_msgSend_moveItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveItemAtURL:toURL:error:");
}

id objc_msgSend_msgIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "msgIdentifier");
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableBytes");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "name");
}

id objc_msgSend_nameForCentral_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nameForCentral:");
}

id objc_msgSend_nanosecond(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nanosecond");
}

id objc_msgSend_negativeActionLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "negativeActionLabel");
}

id objc_msgSend_newDeviceMgntDevice_keyholeID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newDeviceMgntDevice:keyholeID:");
}

id objc_msgSend_newForceDevice_keyholeID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newForceDevice:keyholeID:");
}

id objc_msgSend_newFwUpgradeDevice_keyholeID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newFwUpgradeDevice:keyholeID:");
}

id objc_msgSend_newHapticsDevice_keyholeID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newHapticsDevice:keyholeID:");
}

id objc_msgSend_newInertialSensorDevice_keyholeID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newInertialSensorDevice:keyholeID:");
}

id objc_msgSend_newMotionDevice_keyholeID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newMotionDevice:keyholeID:");
}

id objc_msgSend_newRadioDevice_keyholeID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newRadioDevice:keyholeID:");
}

id objc_msgSend_newTouchDevice_keyholeID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newTouchDevice:keyholeID:");
}

id objc_msgSend_newUserDevice_descriptor_descriptorLength_keyholeID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newUserDevice:descriptor:descriptorLength:keyholeID:");
}

id objc_msgSend_newUserDevices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newUserDevices:");
}

id objc_msgSend_newWakeDevice_keyholeID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newWakeDevice:keyholeID:");
}

id objc_msgSend_nextDSTTransitionTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nextDSTTransitionTimer");
}

id objc_msgSend_nextDaylightSavingTimeTransition(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nextDaylightSavingTimeTransition");
}

id objc_msgSend_notANumber(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notANumber");
}

id objc_msgSend_notifiableAttributeIDs_entityID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifiableAttributeIDs:entityID:");
}

id objc_msgSend_notificationAttributeIDToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationAttributeIDToString:");
}

id objc_msgSend_notificationForAlert_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationForAlert:");
}

id objc_msgSend_notificationForUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationForUID:");
}

id objc_msgSend_notificationPort(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationPort");
}

id objc_msgSend_notificationSourceCharacteristic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationSourceCharacteristic");
}

id objc_msgSend_notifyAttributeIDs_entityID_central_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyAttributeIDs:entityID:central:");
}

id objc_msgSend_notifyAttributeValue_attributeID_entityID_central_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyAttributeValue:attributeID:entityID:central:");
}

id objc_msgSend_notifyDesiredConnectionParametersDidChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyDesiredConnectionParametersDidChange");
}

id objc_msgSend_notifyDidStart(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyDidStart");
}

id objc_msgSend_notifyDidStartIfEverythingReady(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyDidStartIfEverythingReady");
}

id objc_msgSend_notifyDidStop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyDidStop");
}

id objc_msgSend_notifyDownstreamOnChargerState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyDownstreamOnChargerState:");
}

id objc_msgSend_notifyListeners_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyListeners:");
}

id objc_msgSend_notifyPencilOnChargerState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyPencilOnChargerState:");
}

id objc_msgSend_notifyPrimaryBudSide_device_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyPrimaryBudSide:device:");
}

id objc_msgSend_notifySupportedCommands_central_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifySupportedCommands:central:");
}

id objc_msgSend_notifySupportedCommandsValue_central_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifySupportedCommandsValue:central:");
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "now");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "null");
}

id objc_msgSend_numberFromString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberFromString:");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithUnsignedChar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedChar:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_numberWithUnsignedShort_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedShort:");
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "object");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectEnumerator");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_observationScheduleChangedCharacteristic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "observationScheduleChangedCharacteristic");
}

id objc_msgSend_obtainTimestampFromDriver_count_period_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "obtainTimestampFromDriver:count:period:");
}

id objc_msgSend_offset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "offset");
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "open");
}

id objc_msgSend_openL2CAPChannel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openL2CAPChannel:");
}

id objc_msgSend_opportunisticRefCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "opportunisticRefCount");
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "options");
}

id objc_msgSend_output(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "output");
}

id objc_msgSend_outputStream(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "outputStream");
}

id objc_msgSend_outputStreamWithByteOrder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "outputStreamWithByteOrder:");
}

id objc_msgSend_pairedFitnessDeviceUUIDS(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pairedFitnessDeviceUUIDS");
}

id objc_msgSend_pairingInfoCompleted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pairingInfoCompleted");
}

id objc_msgSend_pairingTimestamp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pairingTimestamp");
}

id objc_msgSend_parseTLVCodecList_dataLength_streamID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parseTLVCodecList:dataLength:streamID:");
}

id objc_msgSend_parseTLVCodecValue_dataLength_codecStruct_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parseTLVCodecValue:dataLength:codecStruct:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "path");
}

id objc_msgSend_pathIDs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathIDs");
}

id objc_msgSend_peer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peer");
}

id objc_msgSend_pending(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pending");
}

id objc_msgSend_pendingUpdates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pendingUpdates");
}

id objc_msgSend_performMFiAuth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performMFiAuth:");
}

id objc_msgSend_performNegativeAction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performNegativeAction");
}

id objc_msgSend_performPositiveAction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performPositiveAction");
}

id objc_msgSend_peripheral(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peripheral");
}

id objc_msgSend_peripheral_didDiscoverCharacteristicsForService_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peripheral:didDiscoverCharacteristicsForService:error:");
}

id objc_msgSend_peripheral_didDiscoverDescriptorsForCharacteristic_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peripheral:didDiscoverDescriptorsForCharacteristic:error:");
}

id objc_msgSend_peripheral_didDiscoverServices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peripheral:didDiscoverServices:");
}

id objc_msgSend_peripheral_didModifyServices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peripheral:didModifyServices:");
}

id objc_msgSend_peripheral_didUpdateNotificationStateForCharacteristic_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peripheral:didUpdateNotificationStateForCharacteristic:error:");
}

id objc_msgSend_peripheral_didUpdateValueForCharacteristic_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peripheral:didUpdateValueForCharacteristic:error:");
}

id objc_msgSend_peripheral_didUpdateValueForDescriptor_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peripheral:didUpdateValueForDescriptor:error:");
}

id objc_msgSend_peripheral_didWriteValueForCharacteristic_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peripheral:didWriteValueForCharacteristic:error:");
}

id objc_msgSend_peripheralForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peripheralForIdentifier:");
}

id objc_msgSend_peripheralManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peripheralManager");
}

id objc_msgSend_peripheralManager_central_didSubscribeToCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peripheralManager:central:didSubscribeToCharacteristic:");
}

id objc_msgSend_peripheralManager_central_didUnsubscribeFromCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peripheralManager:central:didUnsubscribeFromCharacteristic:");
}

id objc_msgSend_peripheralManager_central_didUpdateANCSAuthorization_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peripheralManager:central:didUpdateANCSAuthorization:");
}

id objc_msgSend_peripheralManager_didAddService_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peripheralManager:didAddService:error:");
}

id objc_msgSend_peripheralManager_didReceiveReadRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peripheralManager:didReceiveReadRequest:");
}

id objc_msgSend_peripheralManager_didReceiveWriteRequests_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peripheralManager:didReceiveWriteRequests:");
}

id objc_msgSend_peripheralManagerStateString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peripheralManagerStateString");
}

id objc_msgSend_peripherals(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peripherals");
}

id objc_msgSend_persistanceAssertion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "persistanceAssertion");
}

id objc_msgSend_persistentDomainForName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "persistentDomainForName:");
}

id objc_msgSend_phoneNumberWithStringValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "phoneNumberWithStringValue:");
}

id objc_msgSend_phoneNumbers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "phoneNumbers");
}

id objc_msgSend_pipe(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pipe");
}

id objc_msgSend_pipe_didReceiveMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pipe:didReceiveMessage:");
}

id objc_msgSend_pipeManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pipeManager");
}

id objc_msgSend_pipes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pipes");
}

id objc_msgSend_playbackRate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playbackRate");
}

id objc_msgSend_playerBundleID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playerBundleID");
}

id objc_msgSend_playerElapsedTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playerElapsedTime");
}

id objc_msgSend_playerName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playerName");
}

id objc_msgSend_playerPlaybackRate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playerPlaybackRate");
}

id objc_msgSend_playerPlaybackState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playerPlaybackState");
}

id objc_msgSend_playerVolume(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playerVolume");
}

id objc_msgSend_pmIsSuspended(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pmIsSuspended");
}

id objc_msgSend_pmNotificationPort(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pmNotificationPort");
}

id objc_msgSend_pmService(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pmService");
}

id objc_msgSend_pnpIDCharacteristic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pnpIDCharacteristic");
}

id objc_msgSend_positiveActionLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "positiveActionLabel");
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:userInfo:");
}

id objc_msgSend_powerBalanceForValue_otherService_otherValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "powerBalanceForValue:otherService:otherValue:");
}

id objc_msgSend_powerSourceDetails(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "powerSourceDetails");
}

id objc_msgSend_powerSourceID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "powerSourceID");
}

id objc_msgSend_predicateForCallsWithStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForCallsWithStatus:");
}

id objc_msgSend_predicateForCallsWithStatusRead_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForCallsWithStatusRead:");
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_preferredInterval(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredInterval");
}

id objc_msgSend_preferredIntervalForCommand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredIntervalForCommand:");
}

id objc_msgSend_preferredPeripheralLatency(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredPeripheralLatency");
}

id objc_msgSend_primaryAttachmentType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "primaryAttachmentType");
}

id objc_msgSend_priority(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "priority");
}

id objc_msgSend_processIncomingData_forEndpointWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processIncomingData:forEndpointWithUUID:");
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processInfo");
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processName");
}

id objc_msgSend_processTimestampSync_phase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processTimestampSync:phase:");
}

id objc_msgSend_productID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "productID");
}

id objc_msgSend_productVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "productVersion");
}

id objc_msgSend_properties(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "properties");
}

id objc_msgSend_properties_locationIdOffset_hidDescriptor_extendedData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "properties:locationIdOffset:hidDescriptor:extendedData:");
}

id objc_msgSend_propertyForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyForKey:");
}

id objc_msgSend_provider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "provider");
}

id objc_msgSend_providerForRecentCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "providerForRecentCall:");
}

id objc_msgSend_proximity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "proximity");
}

id objc_msgSend_proximityData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "proximityData");
}

id objc_msgSend_publicationDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "publicationDate");
}

id objc_msgSend_publish(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "publish");
}

id objc_msgSend_publishConnectionWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "publishConnectionWithUUID:");
}

id objc_msgSend_publishProperties(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "publishProperties");
}

id objc_msgSend_publisherMatchID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "publisherMatchID");
}

id objc_msgSend_quantity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "quantity");
}

id objc_msgSend_quantitySampleWithType_quantity_startDate_endDate_device_metadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "quantitySampleWithType:quantity:startDate:endDate:device:metadata:");
}

id objc_msgSend_quantityTypeForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "quantityTypeForIdentifier:");
}

id objc_msgSend_quantityWithUnit_doubleValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "quantityWithUnit:doubleValue:");
}

id objc_msgSend_queryCompleteForAccessory_hwFusingType_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryCompleteForAccessory:hwFusingType:error:");
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queue");
}

id objc_msgSend_queueCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queueCount");
}

id objc_msgSend_queueIndex(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queueIndex");
}

id objc_msgSend_queueRepeatMode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queueRepeatMode");
}

id objc_msgSend_queueShuffleMode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queueShuffleMode");
}

id objc_msgSend_racpCharacteristic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "racpCharacteristic");
}

id objc_msgSend_radio(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "radio");
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "raise:format:");
}

id objc_msgSend_read_maxLength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "read:maxLength:");
}

id objc_msgSend_readBytesFromNSData_into_startingAt_length_info_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readBytesFromNSData:into:startingAt:length:info:");
}

id objc_msgSend_readCurrentTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readCurrentTime");
}

id objc_msgSend_readIEEEFloat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readIEEEFloat:");
}

id objc_msgSend_readLocalTimeInformation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readLocalTimeInformation");
}

id objc_msgSend_readNumBytes_toData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readNumBytes:toData:");
}

id objc_msgSend_readReportData_reportID_reportType_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readReportData:reportID:reportType:error:");
}

id objc_msgSend_readString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readString:");
}

id objc_msgSend_readUint16_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readUint16:");
}

id objc_msgSend_readUint32_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readUint32:");
}

id objc_msgSend_readUint48_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readUint48:");
}

id objc_msgSend_readUint8_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readUint8:");
}

id objc_msgSend_readValueForCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readValueForCharacteristic:");
}

id objc_msgSend_readValueForDescriptor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readValueForDescriptor:");
}

id objc_msgSend_readWheelSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readWheelSize");
}

id objc_msgSend_receiveMessage_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receiveMessage:length:");
}

id objc_msgSend_receivedMessage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receivedMessage");
}

id objc_msgSend_recentCall(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recentCall");
}

id objc_msgSend_recordDatum_forType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordDatum:forType:");
}

id objc_msgSend_recordDatum_start_end_quantityType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordDatum:start:end:quantityType:");
}

id objc_msgSend_recvDataFromAccessory_data_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recvDataFromAccessory:data:error:");
}

id objc_msgSend_recvDataMessage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recvDataMessage");
}

id objc_msgSend_recvDataOverAACP_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recvDataOverAACP:");
}

id objc_msgSend_refreshConnectionAssertion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshConnectionAssertion");
}

id objc_msgSend_refreshPeripherals(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshPeripherals");
}

id objc_msgSend_refreshPersistanceAssertion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshPersistanceAssertion");
}

id objc_msgSend_refreshUpdateHealthEnabledStatus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshUpdateHealthEnabledStatus");
}

id objc_msgSend_registerEndpoint_type_priority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerEndpoint:type:priority:");
}

id objc_msgSend_registerFitnessService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerFitnessService:");
}

id objc_msgSend_registerForAVNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerForAVNotifications");
}

id objc_msgSend_registerForConnectionEventsWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerForConnectionEventsWithOptions:");
}

id objc_msgSend_registerForPowerManagementEvents(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerForPowerManagementEvents");
}

id objc_msgSend_registerNewUser(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerNewUser");
}

id objc_msgSend_registerServices(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerServices");
}

id objc_msgSend_registerUARPService_withUARPAccessory_withUARPAssetID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerUARPService:withUARPAccessory:withUARPAssetID:");
}

id objc_msgSend_registerWithHealthKit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerWithHealthKit:");
}

id objc_msgSend_registeredServices(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registeredServices");
}

id objc_msgSend_registeredUserCharacteristic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registeredUserCharacteristic");
}

id objc_msgSend_registrationForAttributeID_entityID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registrationForAttributeID:entityID:");
}

id objc_msgSend_registrations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registrations");
}

id objc_msgSend_relayAACPUARP_uarpMsg_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "relayAACPUARP:uarpMsg:error:");
}

id objc_msgSend_relayForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "relayForIdentifier:");
}

id objc_msgSend_relayWithIdentifier_deviceType_properties_codecType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "relayWithIdentifier:deviceType:properties:codecType:");
}

id objc_msgSend_remoteCommandCharacteristic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteCommandCharacteristic");
}

id objc_msgSend_remoteCommandIDToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteCommandIDToString:");
}

id objc_msgSend_removeAccessory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAccessory:");
}

id objc_msgSend_removeAlert_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAlert:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeFitnessServicesForPeripheral_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeFitnessServicesForPeripheral:");
}

id objc_msgSend_removeFromRunLoop_forMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeFromRunLoop:forMode:");
}

id objc_msgSend_removeHealthServicePairing_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeHealthServicePairing:withCompletion:");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_removeOpportunisticConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeOpportunisticConnection:");
}

id objc_msgSend_removePipe_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removePipe:");
}

id objc_msgSend_removeService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeService:");
}

id objc_msgSend_reportFailure_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportFailure:");
}

id objc_msgSend_reportMapCharacteristic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportMapCharacteristic");
}

id objc_msgSend_reportSuccess(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportSuccess");
}

id objc_msgSend_reportTypeToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportTypeToString:");
}

id objc_msgSend_reportsHaveMultipleReportIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportsHaveMultipleReportIDs:");
}

id objc_msgSend_requestAuthorizationToShareTypes_readTypes_shouldPrompt_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestAuthorizationToShareTypes:readTypes:shouldPrompt:completion:");
}

id objc_msgSend_requestLeaEasyPair_deviceIdentifier_deviceTags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestLeaEasyPair:deviceIdentifier:deviceTags:");
}

id objc_msgSend_requestLeaStoreBondingInfo_rand_ltk_irk_name_device_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestLeaStoreBondingInfo:rand:ltk:irk:name:device:");
}

id objc_msgSend_requestNoticesBulletinsForSectionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestNoticesBulletinsForSectionID:");
}

id objc_msgSend_requestPairStateForDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestPairStateForDevice:");
}

id objc_msgSend_requestStoreLinkKey_name_device_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestStoreLinkKey:name:device:");
}

id objc_msgSend_requestStoreLinkKeyExtended_name_device_deviceServiceMask_classOfDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestStoreLinkKeyExtended:name:device:deviceServiceMask:classOfDevice:");
}

id objc_msgSend_requestVersionInfo_cloudAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestVersionInfo:cloudAccount:");
}

id objc_msgSend_requestedQuantityTypes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestedQuantityTypes");
}

id objc_msgSend_requestedServices(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestedServices");
}

id objc_msgSend_requestedUUIDs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestedUUIDs");
}

id objc_msgSend_requireServicesAndMFi_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requireServicesAndMFi:");
}

id objc_msgSend_resetSystemTimeZone(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetSystemTimeZone");
}

id objc_msgSend_resolveBehaviorForEventDetails_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resolveBehaviorForEventDetails:error:");
}

id objc_msgSend_respondToLeaEasyPair_device_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "respondToLeaEasyPair:device:");
}

id objc_msgSend_respondToLeaStoreBondingInfo_device_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "respondToLeaStoreBondingInfo:device:");
}

id objc_msgSend_respondToPairState_device_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "respondToPairState:device:");
}

id objc_msgSend_respondToRequest_withResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "respondToRequest:withResult:");
}

id objc_msgSend_respondToStoreLinkKey_device_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "respondToStoreLinkKey:device:");
}

id objc_msgSend_respondVersionInfo_cloudAccount_easyPairingStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "respondVersionInfo:cloudAccount:easyPairingStatus:");
}

id objc_msgSend_responseForAppAttributeID_appIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "responseForAppAttributeID:appIdentifier:");
}

id objc_msgSend_responseForAttributeID_maxLength_attribute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "responseForAttributeID:maxLength:attribute:");
}

id objc_msgSend_responseForNotificationAttributeID_maxLength_notification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "responseForNotificationAttributeID:maxLength:notification:");
}

id objc_msgSend_restrictedMode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restrictedMode");
}

id objc_msgSend_retainArguments(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retainArguments");
}

id objc_msgSend_retrieveConnectedPeripheralsWithServices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retrieveConnectedPeripheralsWithServices:");
}

id objc_msgSend_retrieveConnectedPeripheralsWithServices_allowAll_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retrieveConnectedPeripheralsWithServices:allowAll:");
}

id objc_msgSend_retrieveLastStoredObservation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retrieveLastStoredObservation");
}

id objc_msgSend_retrievePairedPeers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retrievePairedPeers");
}

id objc_msgSend_retrievePairingInfoForPeripheral_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retrievePairingInfoForPeripheral:");
}

id objc_msgSend_retrievePeripheralsWithCustomProperties_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retrievePeripheralsWithCustomProperties:completion:");
}

id objc_msgSend_retrievePeripheralsWithIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retrievePeripheralsWithIdentifiers:");
}

id objc_msgSend_retrievePeripheralsWithTags_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retrievePeripheralsWithTags:completion:");
}

id objc_msgSend_retrieveStoredObservationsAfterRecordNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retrieveStoredObservationsAfterRecordNumber:");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "run");
}

id objc_msgSend_saveObjects_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveObjects:withCompletion:");
}

id objc_msgSend_scalablePipeManagerStateString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scalablePipeManagerStateString");
}

id objc_msgSend_scheduleInRunLoop_forMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleInRunLoop:forMode:");
}

id objc_msgSend_scheduledTimerWithTimeInterval_repeats_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduledTimerWithTimeInterval:repeats:block:");
}

id objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:");
}

id objc_msgSend_screenOn(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenOn");
}

id objc_msgSend_screenStateChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenStateChanged:");
}

id objc_msgSend_second(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "second");
}

id objc_msgSend_secondsFromGMT(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "secondsFromGMT");
}

id objc_msgSend_sectionID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sectionID");
}

id objc_msgSend_selectCodec_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectCodec:");
}

id objc_msgSend_sendANCSNotificationSourceRegisteredMsg_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendANCSNotificationSourceRegisteredMsg:");
}

id objc_msgSend_sendAnalyticsEvent_withPayload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendAnalyticsEvent:withPayload:");
}

id objc_msgSend_sendAudioFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendAudioFrame:");
}

id objc_msgSend_sendButtonDataToUserDevice_withTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendButtonDataToUserDevice:withTimestamp:");
}

id objc_msgSend_sendCommand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendCommand:");
}

id objc_msgSend_sendData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendData:");
}

id objc_msgSend_sendDevMgmtPipeConnectedMsg_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendDevMgmtPipeConnectedMsg:");
}

id objc_msgSend_sendDevMgmtPipeDisconnectedMsg_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendDevMgmtPipeDisconnectedMsg:");
}

id objc_msgSend_sendDuplicateReadingsAsZero(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendDuplicateReadingsAsZero");
}

id objc_msgSend_sendEnableBTSyncMsg_forPeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendEnableBTSyncMsg:forPeer:");
}

id objc_msgSend_sendMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendMessage:");
}

id objc_msgSend_sendMsg_args_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendMsg:args:");
}

id objc_msgSend_sendMsg_args_forClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendMsg:args:forClient:");
}

id objc_msgSend_sendMsgIfCheckedIn_args_forClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendMsgIfCheckedIn:args:forClient:");
}

id objc_msgSend_sendNextQueuedMessage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendNextQueuedMessage");
}

id objc_msgSend_sendOutputReportData_reportID_reportType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendOutputReportData:reportID:reportType:");
}

id objc_msgSend_sendSetConnectionParametersMsg_forPeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendSetConnectionParametersMsg:forPeer:");
}

id objc_msgSend_sendZeroForDuplicates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendZeroForDuplicates");
}

id objc_msgSend_sender(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sender");
}

id objc_msgSend_senderDestinationID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "senderDestinationID");
}

id objc_msgSend_sensorLocationSideString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sensorLocationSideString");
}

id objc_msgSend_sensorLocationString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sensorLocationString");
}

id objc_msgSend_sentHostReadyReport(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sentHostReadyReport");
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serialNumber");
}

id objc_msgSend_serialNumberCharacteristic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serialNumberCharacteristic");
}

id objc_msgSend_serverConnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverConnection");
}

id objc_msgSend_serverServiceMap(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverServiceMap");
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "service");
}

id objc_msgSend_serviceForClientIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceForClientIdentifier:");
}

id objc_msgSend_services(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "services");
}

id objc_msgSend_servicesForHKQuantityType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "servicesForHKQuantityType:");
}

id objc_msgSend_sessionForCentral_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionForCentral:");
}

id objc_msgSend_sessions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessions");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set");
}

id objc_msgSend_setAccessoryCategoryCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessoryCategoryCharacteristic:");
}

id objc_msgSend_setAccessoryInfo_forEndpointWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessoryInfo:forEndpointWithUUID:");
}

id objc_msgSend_setActiveCentrals_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveCentrals:");
}

id objc_msgSend_setActiveHIDDeviceCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveHIDDeviceCount:");
}

id objc_msgSend_setAlertMap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlertMap:");
}

id objc_msgSend_setAlertSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlertSource:");
}

id objc_msgSend_setArgument_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArgument:atIndex:");
}

id objc_msgSend_setAttribute_forKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttribute:forKey:error:");
}

id objc_msgSend_setAudio_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAudio:");
}

id objc_msgSend_setAudioBuffer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAudioBuffer:");
}

id objc_msgSend_setAudioRoutingControl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAudioRoutingControl:");
}

id objc_msgSend_setAuthInProgress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAuthInProgress:");
}

id objc_msgSend_setAuthState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAuthState:");
}

id objc_msgSend_setAuthTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAuthTimer:");
}

id objc_msgSend_setAutoDownloadAllowed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoDownloadAllowed:");
}

id objc_msgSend_setBTAuthState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBTAuthState:");
}

id objc_msgSend_setBatteryLevelCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBatteryLevelCharacteristic:");
}

id objc_msgSend_setBatteryPowerStateCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBatteryPowerStateCharacteristic:");
}

id objc_msgSend_setBodySensorLocationCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBodySensorLocationCharacteristic:");
}

id objc_msgSend_setBtSyncPeriod_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBtSyncPeriod:");
}

id objc_msgSend_setBulletin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBulletin:");
}

id objc_msgSend_setBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBundleIdentifier:");
}

id objc_msgSend_setButtonData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setButtonData:");
}

id objc_msgSend_setButtons_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setButtons:");
}

id objc_msgSend_setCachedButtonsAndTimestamps_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCachedButtonsAndTimestamps:");
}

id objc_msgSend_setCertificate1Characteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCertificate1Characteristic:");
}

id objc_msgSend_setCertificate2Characteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCertificate2Characteristic:");
}

id objc_msgSend_setChallengeResponseCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChallengeResponseCharacteristic:");
}

id objc_msgSend_setCharacteristics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCharacteristics:");
}

id objc_msgSend_setChargingConnParamDefaults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChargingConnParamDefaults");
}

id objc_msgSend_setCodec_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCodec:");
}

id objc_msgSend_setComboHKDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setComboHKDevice:");
}

id objc_msgSend_setCommandError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCommandError:");
}

id objc_msgSend_setCommandPending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCommandPending:");
}

id objc_msgSend_setCommandValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCommandValue:");
}

id objc_msgSend_setConnectAlwaysIdentifiersMap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConnectAlwaysIdentifiersMap:");
}

id objc_msgSend_setConnectionAssertion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConnectionAssertion:");
}

id objc_msgSend_setConnectionAuthenticated_state_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConnectionAuthenticated:state:");
}

id objc_msgSend_setConnectionIdleTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConnectionIdleTimer:");
}

id objc_msgSend_setConnectionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConnectionUUID:");
}

id objc_msgSend_setContactStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContactStore:");
}

id objc_msgSend_setControlPointTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setControlPointTimer:");
}

id objc_msgSend_setCsControlPointCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCsControlPointCharacteristic:");
}

id objc_msgSend_setCsFeatureCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCsFeatureCharacteristic:");
}

id objc_msgSend_setCsMeasurementCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCsMeasurementCharacteristic:");
}

id objc_msgSend_setCurrentElapsedTimeCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentElapsedTimeCharacteristic:");
}

id objc_msgSend_setCurrentIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentIdentifier:");
}

id objc_msgSend_setCurrentInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentInfo:");
}

id objc_msgSend_setCurrentPlaybackState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentPlaybackState:");
}

id objc_msgSend_setCurrentSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentSettings:");
}

id objc_msgSend_setCurrentSupportedCommands_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentSupportedCommands:");
}

id objc_msgSend_setCustomProperty_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCustomProperty:value:");
}

id objc_msgSend_setCyclingPowerControlPointCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCyclingPowerControlPointCharacteristic:");
}

id objc_msgSend_setCyclingPowerFeatureCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCyclingPowerFeatureCharacteristic:");
}

id objc_msgSend_setCyclingPowerMeasurementCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCyclingPowerMeasurementCharacteristic:");
}

id objc_msgSend_setCyclingPowerSensorLocationCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCyclingPowerSensorLocationCharacteristic:");
}

id objc_msgSend_setCyclingPowerVectorCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCyclingPowerVectorCharacteristic:");
}

id objc_msgSend_setDatabaseChangeIncrementCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDatabaseChangeIncrementCharacteristic:");
}

id objc_msgSend_setDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDate:");
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateFormat:");
}

id objc_msgSend_setDebugLoggingEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDebugLoggingEnabled:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDenylistedIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDenylistedIdentifiers:");
}

id objc_msgSend_setDesiredConnectionLatency_forPeripheral_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDesiredConnectionLatency:forPeripheral:");
}

id objc_msgSend_setDeviceManagement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceManagement:");
}

id objc_msgSend_setDeviceManagementEndpoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceManagementEndpoint:");
}

id objc_msgSend_setDeviceMatching_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceMatching:");
}

id objc_msgSend_setDeviceNotificationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceNotificationHandler:");
}

id objc_msgSend_setDispatchQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDispatchQueue:");
}

id objc_msgSend_setDoapAudioRelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDoapAudioRelay:");
}

id objc_msgSend_setDoapAudioStop_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDoapAudioStop:");
}

id objc_msgSend_setDouble_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDouble:forKey:");
}

id objc_msgSend_setEndpointUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEndpointUUID:");
}

id objc_msgSend_setEventIndicatorCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEventIndicatorCharacteristic:");
}

id objc_msgSend_setFeaturesCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFeaturesCharacteristic:");
}

id objc_msgSend_setFilterCriteria_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFilterCriteria:");
}

id objc_msgSend_setFirstButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFirstButton:");
}

id objc_msgSend_setFwRevisionCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFwRevisionCharacteristic:");
}

id objc_msgSend_setGetReportKeyholeID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGetReportKeyholeID:");
}

id objc_msgSend_setGhsControlPointCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGhsControlPointCharacteristic:");
}

id objc_msgSend_setGhsDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGhsDevice:");
}

id objc_msgSend_setHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHandle:");
}

id objc_msgSend_setHeartRateMeasurementCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHeartRateMeasurementCharacteristic:");
}

id objc_msgSend_setHeartRateScanDidTimeOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHeartRateScanDidTimeOut:");
}

id objc_msgSend_setHeartRateScanTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHeartRateScanTimer:");
}

id objc_msgSend_setHidControlPointCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidControlPointCharacteristic:");
}

id objc_msgSend_setHidDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidDevice:");
}

id objc_msgSend_setHidInformationCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidInformationCharacteristic:");
}

id objc_msgSend_setHighPriorityLink_burstTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHighPriorityLink:burstTime:");
}

id objc_msgSend_setHighPriorityStream_duration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHighPriorityStream:duration:");
}

id objc_msgSend_setHkDataCollectors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHkDataCollectors:");
}

id objc_msgSend_setHkDatumBuffers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHkDatumBuffers:");
}

id objc_msgSend_setHkDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHkDevice:");
}

id objc_msgSend_setHkQuantityType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHkQuantityType:");
}

id objc_msgSend_setHkStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHkStore:");
}

id objc_msgSend_setHwRevisionCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHwRevisionCharacteristic:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setInertial_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInertial:");
}

id objc_msgSend_setInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInfo:");
}

id objc_msgSend_setInfrared_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInfrared:");
}

id objc_msgSend_setInputElementHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInputElementHandler:");
}

id objc_msgSend_setInputElementMatching_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInputElementMatching:");
}

id objc_msgSend_setInputReportTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInputReportTimestamp:");
}

id objc_msgSend_setIopsNotifyPercentChangeToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIopsNotifyPercentChangeToken:");
}

id objc_msgSend_setIsDirty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsDirty:");
}

id objc_msgSend_setIsEventIndicatorNotificationEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsEventIndicatorNotificationEnabled:");
}

id objc_msgSend_setIsPrimary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsPrimary:");
}

id objc_msgSend_setIsSendDataNotificationEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsSendDataNotificationEnabled:");
}

id objc_msgSend_setIsSendingData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsSendingData:");
}

id objc_msgSend_setIsStartStreamingNotificationEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsStartStreamingNotificationEnabled:");
}

id objc_msgSend_setIsStarted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsStarted:");
}

id objc_msgSend_setIsStopStreamingNotificationEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsStopStreamingNotificationEnabled:");
}

id objc_msgSend_setIsStreaming_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsStreaming:");
}

id objc_msgSend_setIsValid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsValid:");
}

id objc_msgSend_setKnownQuantityTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKnownQuantityTypes:");
}

id objc_msgSend_setLastAudioDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastAudioDate:");
}

id objc_msgSend_setLastDistributedDatum_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastDistributedDatum:");
}

id objc_msgSend_setLastKnownAttributeValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastKnownAttributeValue:");
}

id objc_msgSend_setLastKnownAttributeValue_attributeID_entityID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastKnownAttributeValue:attributeID:entityID:");
}

id objc_msgSend_setLastKnownSupportedCommands_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastKnownSupportedCommands:");
}

id objc_msgSend_setLatency_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLatency:");
}

id objc_msgSend_setLength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLength:");
}

id objc_msgSend_setLiveObservationCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLiveObservationCharacteristic:");
}

id objc_msgSend_setLoadedAttributeID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLoadedAttributeID:");
}

id objc_msgSend_setLoadedEntityID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLoadedEntityID:");
}

id objc_msgSend_setLocale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocale:");
}

id objc_msgSend_setManufacturerNameCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setManufacturerNameCharacteristic:");
}

id objc_msgSend_setMaxCELength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxCELength:");
}

id objc_msgSend_setMaxDeferment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxDeferment:");
}

id objc_msgSend_setMaxInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxInterval:");
}

id objc_msgSend_setMaxPayloadSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxPayloadSize:");
}

id objc_msgSend_setMaxPeripheralLatency_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxPeripheralLatency:");
}

id objc_msgSend_setMfiAuthChannel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMfiAuthChannel:");
}

id objc_msgSend_setMfiPeripheral_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMfiPeripheral:");
}

id objc_msgSend_setMfiVoucher_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMfiVoucher:");
}

id objc_msgSend_setMinCELength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinCELength:");
}

id objc_msgSend_setMinInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinInterval:");
}

id objc_msgSend_setModelNumberCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModelNumberCharacteristic:");
}

id objc_msgSend_setNextDSTTransitionTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNextDSTTransitionTimer:");
}

id objc_msgSend_setNormalConnParamDefaults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNormalConnParamDefaults");
}

id objc_msgSend_setNormalPeripheralLatency(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNormalPeripheralLatency");
}

id objc_msgSend_setNotificationEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNotificationEnabled:");
}

id objc_msgSend_setNotificationPort_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNotificationPort:");
}

id objc_msgSend_setNotify_forCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNotify:forCharacteristic:");
}

id objc_msgSend_setNotifyValue_forCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNotifyValue:forCharacteristic:");
}

id objc_msgSend_setNumberStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberStyle:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setObservationScheduleChangedCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObservationScheduleChangedCharacteristic:");
}

id objc_msgSend_setObserverFeed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObserverFeed:");
}

id objc_msgSend_setOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOffset:");
}

id objc_msgSend_setOpportunisticConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOpportunisticConnection:");
}

id objc_msgSend_setOpportunisticConnection_forAccessoryUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOpportunisticConnection:forAccessoryUUID:");
}

id objc_msgSend_setOpportunisticRefCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOpportunisticRefCount:");
}

id objc_msgSend_setPairedFitnessDeviceUUIDS_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPairedFitnessDeviceUUIDS:");
}

id objc_msgSend_setPairingData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPairingData:");
}

id objc_msgSend_setPeerChannel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPeerChannel:");
}

id objc_msgSend_setPending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPending:");
}

id objc_msgSend_setPeripheral_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPeripheral:");
}

id objc_msgSend_setPeripherals_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPeripherals:");
}

id objc_msgSend_setPersist_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPersist:");
}

id objc_msgSend_setPersistanceAssertion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPersistanceAssertion:");
}

id objc_msgSend_setPersistentDomain_forName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPersistentDomain:forName:");
}

id objc_msgSend_setPmIsSuspended_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPmIsSuspended:");
}

id objc_msgSend_setPmNotifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPmNotifier:");
}

id objc_msgSend_setPmService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPmService:");
}

id objc_msgSend_setPnpIDCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPnpIDCharacteristic:");
}

id objc_msgSend_setPowerSourceDetails_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPowerSourceDetails:");
}

id objc_msgSend_setPreferredInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredInterval:");
}

id objc_msgSend_setPreferredPeripheralLatency_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredPeripheralLatency:");
}

id objc_msgSend_setPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPriority:");
}

id objc_msgSend_setProperty_value_forConnectionWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProperty:value:forConnectionWithUUID:");
}

id objc_msgSend_setProperty_value_forEndpointWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProperty:value:forEndpointWithUUID:");
}

id objc_msgSend_setProximity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProximity:");
}

id objc_msgSend_setProximityData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProximityData:");
}

id objc_msgSend_setQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQueue:");
}

id objc_msgSend_setRacpCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRacpCharacteristic:");
}

id objc_msgSend_setRadio_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRadio:");
}

id objc_msgSend_setReceivedMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReceivedMessage:");
}

id objc_msgSend_setRecvDataMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecvDataMessage:");
}

id objc_msgSend_setRegisteredAttributeIDs_entityID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRegisteredAttributeIDs:entityID:");
}

id objc_msgSend_setRegisteredServices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRegisteredServices:");
}

id objc_msgSend_setRegisteredUserCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRegisteredUserCharacteristic:");
}

id objc_msgSend_setReport_reportLength_reportID_reportType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReport:reportLength:reportID:reportType:");
}

id objc_msgSend_setReport_reportLength_reportID_reportType_keyholeID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReport:reportLength:reportID:reportType:keyholeID:");
}

id objc_msgSend_setReport_reportLength_reportID_reportType_keyholeID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReport:reportLength:reportID:reportType:keyholeID:error:");
}

id objc_msgSend_setReportData_reportID_reportType_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReportData:reportID:reportType:error:");
}

id objc_msgSend_setReportMapCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReportMapCharacteristic:");
}

id objc_msgSend_setRequestedQuantityTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequestedQuantityTypes:");
}

id objc_msgSend_setScreenOnChangedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScreenOnChangedHandler:");
}

id objc_msgSend_setSelectedCodecCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectedCodecCharacteristic:");
}

id objc_msgSend_setSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelector:");
}

id objc_msgSend_setSendDataCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSendDataCharacteristic:");
}

id objc_msgSend_setSender_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSender:");
}

id objc_msgSend_setSerialNumberCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSerialNumberCharacteristic:");
}

id objc_msgSend_setServerConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServerConnection:");
}

id objc_msgSend_setService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setService:");
}

id objc_msgSend_setServiceUUID_forQuantityType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServiceUUID:forQuantityType:");
}

id objc_msgSend_setServiceUUIDForSupportedHKQuantityType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServiceUUIDForSupportedHKQuantityType:");
}

id objc_msgSend_setSessions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSessions:");
}

id objc_msgSend_setShouldPersist_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldPersist:");
}

id objc_msgSend_setSilent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSilent:");
}

id objc_msgSend_setSiriXpcConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSiriXpcConnection:");
}

id objc_msgSend_setSoundSensorXpcConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSoundSensorXpcConnection:");
}

id objc_msgSend_setStartPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartPriority:");
}

id objc_msgSend_setStartStreamingCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartStreamingCharacteristic:");
}

id objc_msgSend_setStartTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartTimeout:");
}

id objc_msgSend_setStartTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartTimer:");
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setState:");
}

id objc_msgSend_setStopStreamingCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStopStreamingCharacteristic:");
}

id objc_msgSend_setStoredObservationCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStoredObservationCharacteristic:");
}

id objc_msgSend_setSupportedCodecsCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportedCodecsCharacteristic:");
}

id objc_msgSend_setSwRevisionCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSwRevisionCharacteristic:");
}

id objc_msgSend_setSystemMonitor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSystemMonitor:");
}

id objc_msgSend_setThreadIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setThreadIdentifier:");
}

id objc_msgSend_setTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeout:");
}

id objc_msgSend_setTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimer:");
}

id objc_msgSend_setTouch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTouch:");
}

id objc_msgSend_setTryCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTryCount:");
}

id objc_msgSend_setTxDataQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTxDataQueue:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setType:");
}

id objc_msgSend_setUarpAccessory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUarpAccessory:");
}

id objc_msgSend_setUarpAssetID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUarpAssetID:");
}

id objc_msgSend_setUarpDataControlPointCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUarpDataControlPointCharacteristic:");
}

id objc_msgSend_setUarpOverAACP_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUarpOverAACP:");
}

id objc_msgSend_setUdiForMedicalDevicesCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUdiForMedicalDevicesCharacteristic:");
}

id objc_msgSend_setUidGenerator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUidGenerator:");
}

id objc_msgSend_setUidMap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUidMap:");
}

id objc_msgSend_setUnit_forQuantityType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUnit:forQuantityType:");
}

id objc_msgSend_setUnitForSupportedHKQuantityType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUnitForSupportedHKQuantityType:");
}

id objc_msgSend_setUrgency_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUrgency:");
}

id objc_msgSend_setUseKeyholeOnGet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUseKeyholeOnGet:");
}

id objc_msgSend_setUserControlPointCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserControlPointCharacteristic:");
}

id objc_msgSend_setUserDevices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserDevices:");
}

id objc_msgSend_setUserIndexCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserIndexCharacteristic:");
}

id objc_msgSend_setValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setVersionCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVersionCharacteristic:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setWorkoutInSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWorkoutInSession:");
}

id objc_msgSend_setXpcConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setXpcConnection:");
}

id objc_msgSend_set_alwaysCollectQuantityTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_alwaysCollectQuantityTypes:");
}

id objc_msgSend_set_isFitnessClassicDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_isFitnessClassicDevice:");
}

id objc_msgSend_set_updateHealthEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_updateHealthEnabled:");
}

id objc_msgSend_setupAudioRoutingControl(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupAudioRoutingControl");
}

id objc_msgSend_setupNextDSTTransitionTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupNextDSTTransitionTimer");
}

id objc_msgSend_sharedAVSystemController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedAVSystemController");
}

id objc_msgSend_sharedClient(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedClient");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedPairingAgent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedPairingAgent");
}

id objc_msgSend_shouldCollectFromDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldCollectFromDevice:");
}

id objc_msgSend_shouldConnectDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldConnectDevice:");
}

id objc_msgSend_shouldForwardFitnessService_quantityType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldForwardFitnessService:quantityType:");
}

id objc_msgSend_shouldPersist(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldPersist");
}

id objc_msgSend_shouldRestartCollecting(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldRestartCollecting");
}

id objc_msgSend_showsInNotificationCenter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showsInNotificationCenter");
}

id objc_msgSend_signal(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signal");
}

id objc_msgSend_signalCommandCondition_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signalCommandCondition:error:");
}

id objc_msgSend_signatureWithDomain_type_subType_subtypeContext_detectedProcess_triggerThresholdValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:");
}

id objc_msgSend_silent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "silent");
}

id objc_msgSend_siriXpcConnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriXpcConnection");
}

id objc_msgSend_snapshotWithSignature_duration_events_payload_actions_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "snapshotWithSignature:duration:events:payload:actions:reply:");
}

id objc_msgSend_softwareRevision(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "softwareRevision");
}

id objc_msgSend_soundSensorXpcConnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "soundSensorXpcConnection");
}

id objc_msgSend_stageFirmwareUpdateOnAccessoryList_withUserIntent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stageFirmwareUpdateOnAccessoryList:withUserIntent:");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "start");
}

id objc_msgSend_startClientServices(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startClientServices");
}

id objc_msgSend_startCollectionTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startCollectionTimer");
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startDate");
}

id objc_msgSend_startLiveHealthObservation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startLiveHealthObservation");
}

id objc_msgSend_startNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startNotifications");
}

id objc_msgSend_startPersonalizationHelperService_entitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startPersonalizationHelperService:entitlement:");
}

id objc_msgSend_startPriority(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startPriority");
}

id objc_msgSend_startStream_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startStream:");
}

id objc_msgSend_startStreaming(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startStreaming");
}

id objc_msgSend_startStreaming_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startStreaming:");
}

id objc_msgSend_startTapToRadar(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startTapToRadar");
}

id objc_msgSend_startTapToRadar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startTapToRadar:");
}

id objc_msgSend_startTimeout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startTimeout");
}

id objc_msgSend_startTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startTimer");
}

id objc_msgSend_startingClientServices(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startingClientServices");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "state");
}

id objc_msgSend_stateToStr_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stateToStr:");
}

id objc_msgSend_stictionCollection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stictionCollection");
}

id objc_msgSend_stictionCollectionRestartTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stictionCollectionRestartTimer:");
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stop");
}

id objc_msgSend_stopCollectionTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopCollectionTimer");
}

id objc_msgSend_stopHeartRateScanTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopHeartRateScanTimer");
}

id objc_msgSend_stopNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopNotifications");
}

id objc_msgSend_stopStream_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopStream:");
}

id objc_msgSend_stopStreaming_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopStreaming:");
}

id objc_msgSend_stopTapToRadar(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopTapToRadar");
}

id objc_msgSend_storeCollectionState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeCollectionState");
}

id objc_msgSend_storeDatumsForQuantityType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeDatumsForQuantityType:");
}

id objc_msgSend_storeDatumsForQuantityType_usingHKDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeDatumsForQuantityType:usingHKDevice:");
}

id objc_msgSend_storeDeviceSettings_inEarEnable_doubleTapMode_deviceSettings_deviceName_device_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeDeviceSettings:inEarEnable:doubleTapMode:deviceSettings:deviceName:device:");
}

id objc_msgSend_storedObservationCharacteristic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storedObservationCharacteristic");
}

id objc_msgSend_stream(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stream");
}

id objc_msgSend_streamError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "streamError");
}

id objc_msgSend_streamID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "streamID");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "string");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringFromContact_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromContact:style:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringValue");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_strongToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "strongToStrongObjectsMapTable");
}

id objc_msgSend_subdataWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subdataWithRange:");
}

id objc_msgSend_subscribeForQuantityTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscribeForQuantityTypes:");
}

id objc_msgSend_subscribedCentrals(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscribedCentrals");
}

id objc_msgSend_subscriptionCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscriptionCount");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_substringWithValidUnicode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringWithValidUnicode");
}

id objc_msgSend_subtitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subtitle");
}

id objc_msgSend_supportedCommands(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportedCommands");
}

id objc_msgSend_supportedCommandsDidChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportedCommandsDidChange");
}

id objc_msgSend_supportedCommandsDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportedCommandsDidChange:");
}

id objc_msgSend_supportedQuantityTypesForServiceUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportedQuantityTypesForServiceUUID:");
}

id objc_msgSend_supportsHKQuantityType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportsHKQuantityType:");
}

id objc_msgSend_swRevisionCharacteristic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "swRevisionCharacteristic");
}

id objc_msgSend_systemLocale(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemLocale");
}

id objc_msgSend_systemMonitor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemMonitor");
}

id objc_msgSend_systemTimeZone(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemTimeZone");
}

id objc_msgSend_tag(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tag");
}

id objc_msgSend_tag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tag:");
}

id objc_msgSend_tapToRadarIsOngoing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tapToRadarIsOngoing");
}

id objc_msgSend_telephonyProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "telephonyProvider");
}

id objc_msgSend_threadID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "threadID");
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSince1970");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceNow");
}

id objc_msgSend_timeout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeout");
}

id objc_msgSend_timer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timer");
}

id objc_msgSend_timestampSync(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timestampSync");
}

id objc_msgSend_timestampSyncIsValid_hostTimestamp_btSyncTimestampUs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timestampSyncIsValid:hostTimestamp:btSyncTimestampUs:");
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "title");
}

id objc_msgSend_touch(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "touch");
}

id objc_msgSend_touchData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "touchData");
}

id objc_msgSend_trackAlbum(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trackAlbum");
}

id objc_msgSend_trackArtist(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trackArtist");
}

id objc_msgSend_trackDuration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trackDuration");
}

id objc_msgSend_trackTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trackTitle");
}

id objc_msgSend_trashVoicemail_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trashVoicemail:");
}

id objc_msgSend_tryCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tryCount");
}

id objc_msgSend_tuActiveCallAlerts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tuActiveCallAlerts");
}

id objc_msgSend_tuActiveCalls(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tuActiveCalls");
}

id objc_msgSend_tuCallCenter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tuCallCenter");
}

id objc_msgSend_tuIncomingCallAlerts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tuIncomingCallAlerts");
}

id objc_msgSend_tuIncomingCalls(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tuIncomingCalls");
}

id objc_msgSend_txDataQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "txDataQueue");
}

id objc_msgSend_txMessageQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "txMessageQueue");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "type");
}

id objc_msgSend_uarpAACPTransportAvailability(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uarpAACPTransportAvailability");
}

id objc_msgSend_uarpAccessory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uarpAccessory");
}

id objc_msgSend_uarpAssetID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uarpAssetID");
}

id objc_msgSend_uarpController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uarpController");
}

id objc_msgSend_uarpDataControlPointCharacteristic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uarpDataControlPointCharacteristic");
}

id objc_msgSend_uarpLogPath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uarpLogPath");
}

id objc_msgSend_uarpOverAACP(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uarpOverAACP");
}

id objc_msgSend_uarpServiceForAccessoryUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uarpServiceForAccessoryUuid:");
}

id objc_msgSend_udiForMedicalDevices(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "udiForMedicalDevices");
}

id objc_msgSend_udiForMedicalDevicesCharacteristic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "udiForMedicalDevicesCharacteristic");
}

id objc_msgSend_uidGenerator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uidGenerator");
}

id objc_msgSend_uidMap(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uidMap");
}

id objc_msgSend_unexpectedDisconnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unexpectedDisconnection:");
}

id objc_msgSend_uniqueId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uniqueId");
}

id objc_msgSend_unitFromString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unitFromString:");
}

id objc_msgSend_unitString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unitString");
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unlock");
}

id objc_msgSend_unpublishProperties(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unpublishProperties");
}

id objc_msgSend_unregisterAllEndpoints(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterAllEndpoints");
}

id objc_msgSend_unregisterForAVNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterForAVNotifications");
}

id objc_msgSend_unregisterUARPService_withUARPAccessory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterUARPService:withUARPAccessory:");
}

id objc_msgSend_unsignedCharValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedCharValue");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedLongLongValue");
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedLongValue");
}

id objc_msgSend_unsignedShortValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedShortValue");
}

id objc_msgSend_updateAvailabilityStatus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAvailabilityStatus");
}

id objc_msgSend_updateComboString_withValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateComboString:withValue:");
}

id objc_msgSend_updateDNDEventDetails_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateDNDEventDetails:");
}

id objc_msgSend_updateDataSource_central_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateDataSource:central:");
}

id objc_msgSend_updateForSensorLocation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateForSensorLocation");
}

id objc_msgSend_updateNotificationSource_notification_sourceFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateNotificationSource:notification:sourceFlags:");
}

id objc_msgSend_updateNotificationSource_notification_sourceFlags_centrals_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateNotificationSource:notification:sourceFlags:centrals:");
}

id objc_msgSend_updatePairedDevices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePairedDevices:");
}

id objc_msgSend_updatePeripheral_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePeripheral:options:");
}

id objc_msgSend_updatePowerSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePowerSource:");
}

id objc_msgSend_updateRequestedQuantityTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateRequestedQuantityTypes:");
}

id objc_msgSend_updateScan(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateScan");
}

id objc_msgSend_updateValue_forCharacteristic_onSubscribedCentrals_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateValue:forCharacteristic:onSubscribedCentrals:");
}

id objc_msgSend_updateWithValue_characteristic_centrals_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithValue:characteristic:centrals:");
}

id objc_msgSend_updateZeroDuplicateValues(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateZeroDuplicateValues");
}

id objc_msgSend_updatedCadenceMeasurementValue_at_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatedCadenceMeasurementValue:at:");
}

id objc_msgSend_updatedCadenceMeasurementValueForRevolutions_andCrankEventTime_timeStamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatedCadenceMeasurementValueForRevolutions:andCrankEventTime:timeStamp:");
}

id objc_msgSend_updatedControlPointCharacteristicValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatedControlPointCharacteristicValue");
}

id objc_msgSend_updatedFeatureCharacteristicValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatedFeatureCharacteristicValue");
}

id objc_msgSend_updatedMeasurementCharacteristicValue_at_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatedMeasurementCharacteristicValue:at:");
}

id objc_msgSend_updatedPowerMeasurementValue_timeStamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatedPowerMeasurementValue:timeStamp:");
}

id objc_msgSend_updatedSensorLocationCharacteristicValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatedSensorLocationCharacteristicValue");
}

id objc_msgSend_updatedSpeedMeasurementValue_at_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatedSpeedMeasurementValue:at:");
}

id objc_msgSend_updatedSpeedMeasurementValueForRevolutions_andWheelEventTime_timeStamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatedSpeedMeasurementValueForRevolutions:andWheelEventTime:timeStamp:");
}

id objc_msgSend_updatedVectorCharacteristicValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatedVectorCharacteristicValue");
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uppercaseString");
}

id objc_msgSend_useKeyholeOnGet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "useKeyholeOnGet");
}

id objc_msgSend_userControlPointCharacteristic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userControlPointCharacteristic");
}

id objc_msgSend_userDevices(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userDevices");
}

id objc_msgSend_userIndexCharacteristic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userIndexCharacteristic");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInfo");
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uuid");
}

id objc_msgSend_uuidToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uuidToString:");
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "value");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_valueTimestamp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueTimestamp");
}

id objc_msgSend_vendorID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "vendorID");
}

id objc_msgSend_vendorIDSource(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "vendorIDSource");
}

id objc_msgSend_vendorIDSourceString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "vendorIDSourceString");
}

id objc_msgSend_verifyButtonDriverOpenedByEventSystem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifyButtonDriverOpenedByEventSystem:");
}

id objc_msgSend_verifyCertificateIsUnique(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifyCertificateIsUnique");
}

id objc_msgSend_verifyChallenge(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifyChallenge");
}

id objc_msgSend_versionCharacteristic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "versionCharacteristic");
}

id objc_msgSend_voicemail(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "voicemail");
}

id objc_msgSend_voicemailsPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "voicemailsPassingTest:");
}

id objc_msgSend_volumeDidChangeForCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "volumeDidChangeForCategory:");
}

id objc_msgSend_vvManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "vvManager");
}

id objc_msgSend_vvUnreadVoicemails(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "vvUnreadVoicemails");
}

id objc_msgSend_vvVoicemailAlerts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "vvVoicemailAlerts");
}

id objc_msgSend_waitForSiriAudioToStop_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waitForSiriAudioToStop:");
}

id objc_msgSend_waitUntilDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waitUntilDate:");
}

id objc_msgSend_wasPairedAfter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wasPairedAfter:");
}

id objc_msgSend_wasUUIDRequestedForLogRetrieval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wasUUIDRequestedForLogRetrieval:");
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "weakObjectsHashTable");
}

id objc_msgSend_weekday(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "weekday");
}

id objc_msgSend_workoutInSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "workoutInSession");
}

id objc_msgSend_write_maxLength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "write:maxLength:");
}

id objc_msgSend_writeBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeBytes:length:");
}

id objc_msgSend_writeControlPointCommand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeControlPointCommand:");
}

id objc_msgSend_writeData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeData:");
}

id objc_msgSend_writeData_forCharacteristic_withResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeData:forCharacteristic:withResponse:");
}

id objc_msgSend_writeReportData_reportID_reportType_withResponse_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeReportData:reportID:reportType:withResponse:error:");
}

id objc_msgSend_writeString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeString:");
}

id objc_msgSend_writeUint16_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeUint16:");
}

id objc_msgSend_writeUint32_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeUint32:");
}

id objc_msgSend_writeUint8_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeUint8:");
}

id objc_msgSend_writeValue_forCharacteristic_type_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeValue:forCharacteristic:type:");
}

id objc_msgSend_xpcConnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "xpcConnection");
}

id objc_msgSend_xpcServer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "xpcServer");
}

id objc_msgSend_year(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "year");
}
