void sub_100003AF4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  unsigned __int8 v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "_isRestricted:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  if ((v4 & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "vehicleStore"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allStoredVehicles"));
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

void sub_100004760(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000477C(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;

  v3 = a2;
  v4 = CarDNDWDLogging();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      sub_100068460(a1, (uint64_t)v3, v6);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    sub_1000683EC(a1, v6);
  }

}

void sub_1000049C0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100004A84(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100004A98(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_isKindOfClass(v3, *(_QWORD *)(a1 + 40)) & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "dismissAlert:", v3);

}

void sub_100005544(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_100005560(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "recordID"));
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

id sub_1000055A0(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "identifier"));
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

uint64_t sub_1000056A8(uint64_t a1, uint64_t a2)
{
  return objc_opt_isKindOfClass(a2, *(_QWORD *)(a1 + 32)) & 1;
}

void sub_100005764(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

void sub_100005CAC(uint64_t a1)
{
  SInt32 v2;
  void *v3;
  _QWORD block[5];
  id v5;
  CFOptionFlags v6;
  SInt32 v7;
  CFOptionFlags responseFlags;

  responseFlags = 0;
  v2 = CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(a1 + 48), 0.0, &responseFlags);
  CFRelease(*(CFTypeRef *)(a1 + 48));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005D50;
  block[3] = &unk_1000B5140;
  v7 = v2;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v6 = responseFlags;
  v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

id sub_100005D50(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  void *v4;
  char v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "alertDismissTimer"));
  v3 = objc_msgSend(v2, "isValid");

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "alertDismissTimer"));
    objc_msgSend(v4, "invalidate");

    objc_msgSend(*(id *)(a1 + 32), "setAlertDismissTimer:", 0);
  }
  if (objc_msgSend(*(id *)(a1 + 32), "requiresUnlockedDevice"))
    v5 = objc_msgSend(*(id *)(a1 + 32), "_isDeviceUnlocked") ^ 1;
  else
    v5 = 0;
  v6 = objc_msgSend(*(id *)(a1 + 32), "alertAutoDismissed");
  if (v6)
    v7 = 3;
  else
    v7 = 2;
  if ((v6 & 1) == 0 && (v5 & 1) == 0)
  {
    if (*(_DWORD *)(a1 + 56) || (v8 = *(_QWORD *)(a1 + 48) & 3, v8 == 3))
      v7 = 2;
    else
      v7 = qword_100085508[v8];
  }
  objc_msgSend(*(id *)(a1 + 32), "_setAlert:", 0);
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v9, v7);
  return objc_msgSend(*(id *)(a1 + 32), "setAlertAutoDismissed:", 0);
}

id sub_100005E48(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlertAutoDismissed:", objc_msgSend(*(id *)(a1 + 32), "dismissAlert"));
}

id sub_100006604(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;

  v2 = CarGeneralLogging(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_1000686F0();

  return objc_msgSend(*(id *)(a1 + 32), "_start");
}

id sub_1000066A8(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;

  v2 = CarGeneralLogging(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_10006871C();

  return objc_msgSend(*(id *)(a1 + 32), "_stop");
}

void sub_10000690C(uint64_t a1, void *a2)
{
  id v2;
  _QWORD block[4];
  id v4;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000716C;
  block[3] = &unk_1000B51B8;
  v4 = a2;
  v2 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

id sub_10000716C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_timeDidChangeSignificantly");
}

void sub_100007174(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_100007198(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

id sub_1000099A0(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[5];

  v3 = a2;
  if (!v3)
    goto LABEL_4;
  v4 = objc_opt_class(NSArray);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) == 0)
    goto LABEL_4;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000B034;
  v10[3] = &unk_1000B5200;
  v10[4] = a1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v10));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "filteredArrayUsingPredicate:", v5));
  v7 = objc_msgSend(v6, "count");

  if (!v7)
    v8 = v3;
  else
LABEL_4:
    v8 = 0;

  return v8;
}

id sub_100009A7C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v5 = a3;
  if (v5 && (v6 = objc_opt_class(NSDictionary), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allKeys"));
    v9 = sub_1000099A0(a1, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allValues"));
      v12 = sub_1000099A0(a2, v11);
      v13 = (id)objc_claimAutoreleasedReturnValue(v12);

      if (v13)
        v13 = v7;
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void sub_10000A4A8(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  unsigned int v25;

  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("name")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "_matchingKeychainItemForIdentifier:inKeychainItems:", v5, a1[5]));
  v9 = v8;
  if (v8)
  {
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", kSecValueData));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", kSecAttrGeneric));
    v12 = v11;
    v22 = v7;
    if (v11)
    {
      v25 = 0;
      objc_msgSend(v11, "getBytes:length:", &v25, 4);
      v13 = bswap32(v25);
      v25 = v13;
      if ((unint64_t)objc_msgSend(v12, "length") < 5)
      {
        v14 = 0;
      }
      else
      {
        v24 = 0;
        objc_msgSend(v12, "getBytes:range:", &v24, 4, 4);
        v14 = bswap32(v24);
      }
    }
    else
    {
      v14 = 0;
      v13 = 0;
    }
    objc_msgSend(a1[5], "removeObject:", v9, v22);
    v15 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v5);
    if (v15)
    {
      v16 = (void *)v10;
      v17 = objc_msgSend(objc_alloc((Class)CRVehicle), "initWithIdentifier:certificateSerial:", v15, v10);
      v18 = v17;
      if (!v17)
      {
        v20 = CarGeneralLogging(0);
        v21 = objc_claimAutoreleasedReturnValue(v20);
        v7 = v23;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          sub_100068DC8();

        goto LABEL_19;
      }
      -[NSObject setPairingStatus:](v17, "setPairingStatus:", v13);
      if (v14)
      {
        -[NSObject setSupportsEnhancedIntegration:](v18, "setSupportsEnhancedIntegration:", 1);
        -[NSObject setEnhancedIntegrationStatus:](v18, "setEnhancedIntegrationStatus:", v14);
      }
      objc_msgSend((id)objc_opt_class(a1[4]), "_applyPreferencesAttributes:toVehicle:", v6, v18);
      objc_msgSend(a1[6], "addObject:", v18);
    }
    else
    {
      v16 = (void *)v10;
      v19 = CarGeneralLogging(0);
      v18 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_100068D58((uint64_t)v5, v18);
    }
    v7 = v23;
LABEL_19:

    goto LABEL_20;
  }
  objc_msgSend((id)objc_opt_class(a1[4]), "_cleanupPreferencesForIncompleteVehicleIdentifier:name:", v5, v7);
LABEL_20:

}

void sub_10000A8C0(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_invalidateCachedVehicles");
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "allStoredVehicles"));
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "observers"));
    objc_msgSend(v4, "vehicleStoreDidBecomeAvailable:", *(_QWORD *)(a1 + 32));

    objc_msgSend((id)objc_opt_class(*(_QWORD *)(a1 + 32)), "postPairingsDidChangeNotification");
  }
}

void sub_10000AF44()
{
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_1000B5240);
}

BOOL sub_10000B034(uint64_t a1, uint64_t a2)
{
  return (objc_opt_isKindOfClass(a2, *(_QWORD *)(a1 + 32)) & 1) == 0;
}

void sub_10000B05C(id a1)
{
  +[CRVehicleStoreAvailability handleAvailabilityEvent](CRVehicleStoreAvailability, "handleAvailabilityEvent");
}

void sub_10000B068(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_10000B08C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void sub_10000B0E0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10000B744(id a1)
{
  CRDictationService *v1;
  void *v2;

  v1 = objc_alloc_init(CRDictationService);
  v2 = (void *)qword_1000DB808;
  qword_1000DB808 = (uint64_t)v1;

}

void sub_10000B864(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000BD68(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  NSObject *v5;
  unint64_t v6;
  __CFString *v7;
  void *v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  uint8_t buf[4];
  __CFString *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  uint64_t v20;

  v4 = CarDiagnosticsLogging(a1, a2, a3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = a1[7] + 1;
    if (v6 >= 6)
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unknown (%ld)"), a1[7]));
    else
      v7 = off_1000B5358[v6];
    v8 = (void *)a1[4];
    v9 = v7;
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "transcription"));
    v11 = (void *)v10;
    if (v10)
      v12 = (const __CFString *)v10;
    else
      v12 = CFSTR("(no result)");
    v13 = a1[5];

    *(_DWORD *)buf = 138412803;
    v16 = v7;
    v17 = 2113;
    v18 = v12;
    v19 = 2114;
    v20 = v13;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Dictation state: (%@) %{private}@ (error: %{public}@)", buf, 0x20u);

  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

Class sub_10000CA24(uint64_t a1)
{
  char *v2;
  Class result;
  char *v4;
  __int128 v5;
  uint64_t v6;

  v4 = 0;
  if (!qword_1000DB820)
  {
    v5 = off_1000B5340;
    v6 = 0;
    qword_1000DB820 = _sl_dlopen(&v5, &v4);
    v2 = v4;
    if (!qword_1000DB820)
    {
      abort_report_np("%s", v4);
      goto LABEL_7;
    }
    if (v4)
      goto LABEL_8;
  }
  while (1)
  {
    result = objc_getClass("AFDictationConnection");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_7:
    v2 = (char *)sub_100068EA0();
LABEL_8:
    free(v2);
  }
  qword_1000DB818 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_10000CE34(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  char v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "channel"));
  if (v2)
  {

LABEL_3:
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "channel"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "outputStream"));
    v5 = (uint64_t)objc_msgSend(v4, "write:maxLength:", objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "bytes"), objc_msgSend(*(id *)(a1 + 40), "length"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "channelDelegate"));
    v17 = v6;
    if (v5 >= 1 && (v7 = objc_msgSend(*(id *)(a1 + 40), "length"), v6 = v17, (id)v5 == v7))
    {
      if (!v17)
        goto LABEL_12;
      v8 = objc_opt_respondsToSelector(v17, "bluetoothLEChannel:didSendData:");
      v6 = v17;
      if ((v8 & 1) == 0)
        goto LABEL_12;
      objc_msgSend(v17, "bluetoothLEChannel:didSendData:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    }
    else
    {
      if (!v6)
        goto LABEL_12;
      v9 = objc_opt_respondsToSelector(v6, "bluetoothLEChannel:didFailToSendData:");
      v6 = v17;
      if ((v9 & 1) == 0)
        goto LABEL_12;
      objc_msgSend(v17, "bluetoothLEChannel:didFailToSendData:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    }
    v6 = v17;
LABEL_12:

    return;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "channel"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "outputStream"));
  if (objc_msgSend(v11, "streamStatus") == (id)2)
  {

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "channel"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "outputStream"));
    v14 = objc_msgSend(v13, "streamStatus");

    if (v14 != (id)4)
      goto LABEL_3;
  }
  v15 = sub_100056C84(2uLL);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    sub_100068EC4();

}

void sub_10000D08C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  unsigned int v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  uint8_t *v12;
  NSObject *v13;
  os_log_type_t v14;
  id v15;
  void *v16;
  void *v17;
  uint8_t v18[16];
  __int16 v19;
  uint8_t buf[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "channel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "inputStream"));
  if (objc_msgSend(v3, "streamStatus") == (id)2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "channel"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "outputStream"));
    v6 = objc_msgSend(v5, "streamStatus");

    if (v6 == (id)2)
    {
      v7 = objc_msgSend(*(id *)(a1 + 32), "isOpen");
      v8 = sub_100056C84(2uLL);
      v9 = objc_claimAutoreleasedReturnValue(v8);
      v10 = v9;
      if (v7)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v19 = 0;
          v11 = "L2CAP channel already opened";
          v12 = (uint8_t *)&v19;
          v13 = v10;
          v14 = OS_LOG_TYPE_INFO;
LABEL_9:
          _os_log_impl((void *)&_mh_execute_header, v13, v14, v11, v12, 2u);
          goto LABEL_10;
        }
      }
      else
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v18 = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "L2CAP channel opened", v18, 2u);
        }

        objc_msgSend(*(id *)(a1 + 32), "setOpen:", 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "service"));
        v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "serviceDelegate"));

        if (v10 && (objc_opt_respondsToSelector(v10, "bluetoothLEService:didOpenChannel:") & 1) != 0)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "service"));
          -[NSObject bluetoothLEService:didOpenChannel:](v10, "bluetoothLEService:didOpenChannel:", v17, *(_QWORD *)(a1 + 32));

        }
      }
      goto LABEL_10;
    }
  }
  else
  {

  }
  v15 = sub_100056C84(2uLL);
  v10 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v11 = "waiting for both streams to open";
    v12 = buf;
    v13 = v10;
    v14 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_9;
  }
LABEL_10:

}

void sub_10000D310(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  uint8_t buf[4];
  id v17;
  _BYTE v18[1024];

  v2 = sub_100056C84(2uLL);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_100068EF0();

  v4 = *(void **)(a1 + 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "channel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "inputStream"));
  LODWORD(v4) = objc_msgSend(v4, "isEqual:", v6);

  if ((_DWORD)v4)
  {
    *(_QWORD *)&v7 = 138412290;
    v15 = v7;
    do
    {
      v8 = (uint64_t)objc_msgSend(*(id *)(a1 + 32), "read:maxLength:", v18, 1024, v15);
      if (v8 < 1)
        break;
      v9 = v8;
      v10 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v18, v8);
      v11 = sub_100056C84(2uLL);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v15;
        v17 = v10;
        _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "received data %@", buf, 0xCu);
      }

      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "channelDelegate"));
      v14 = (void *)v13;
      if (v13)
      {
        if ((objc_opt_respondsToSelector(v13, "bluetoothLEChannel:didReceiveData:") & 1) != 0)
          objc_msgSend(v14, "bluetoothLEChannel:didReceiveData:", *(_QWORD *)(a1 + 40), v10);
      }

    }
    while (v9 == 1024);
  }
}

id sub_10000D57C(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = *(void **)(a1 + 32);
  v2 = (id *)(a1 + 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "channel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "inputStream"));
  LODWORD(v3) = objc_msgSend(v3, "isEqual:", v5);

  if ((_DWORD)v3)
  {
    v6 = sub_100056C84(2uLL);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100068F28(v2, v7);
LABEL_7:

    return objc_msgSend(*(id *)(a1 + 40), "_serviceQueue_handleChannelClosed");
  }
  v8 = *(void **)(a1 + 32);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "channel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "outputStream"));
  LODWORD(v8) = objc_msgSend(v8, "isEqual:", v10);

  if ((_DWORD)v8)
  {
    v11 = sub_100056C84(2uLL);
    v7 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100068FB0(v2, v7);
    goto LABEL_7;
  }
  return objc_msgSend(*(id *)(a1 + 40), "_serviceQueue_handleChannelClosed");
}

id sub_10000D728(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  const char *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint8_t v14[24];

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "channel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "inputStream"));
  LODWORD(v2) = objc_msgSend(v2, "isEqual:", v4);

  if ((_DWORD)v2)
  {
    v5 = sub_100056C84(2uLL);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "streamError"));
      *(_DWORD *)v14 = 138412290;
      *(_QWORD *)&v14[4] = v7;
      v8 = "L2CAP input stream closed: %@";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v8, v14, 0xCu);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v9 = *(void **)(a1 + 32);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "channel"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "outputStream"));
  LODWORD(v9) = objc_msgSend(v9, "isEqual:", v11);

  if ((_DWORD)v9)
  {
    v12 = sub_100056C84(2uLL);
    v6 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "streamError"));
      *(_DWORD *)v14 = 138412290;
      *(_QWORD *)&v14[4] = v7;
      v8 = "L2CAP output stream closed: %@";
      goto LABEL_7;
    }
LABEL_8:

  }
  return objc_msgSend(*(id *)(a1 + 40), "_serviceQueue_handleChannelClosed", *(_OWORD *)v14);
}

void sub_10000DDCC(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  CARBluetoothLEConnectionState *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  void *v12;

  v2 = sub_100056C84(2uLL);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serviceUUID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));
    *(_DWORD *)buf = 138412290;
    v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "starting discovery for service %@", buf, 0xCu);

  }
  v6 = objc_alloc_init(CARBluetoothLEConnectionState);
  objc_msgSend(*(id *)(a1 + 32), "setCurrentConnectionState:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peripheral"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serviceUUID"));
  v10 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
  objc_msgSend(v7, "discoverServices:", v9);

}

void sub_10000E008(uint64_t a1)
{
  uint64_t *v1;
  id v2;
  NSObject *v3;
  uint64_t v4;
  void *v6;
  unsigned int v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  void *v30;
  uint8_t v31[128];
  uint8_t buf[4];
  void *v33;

  v1 = (uint64_t *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = sub_100056C84(2uLL);
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_100069038(v1, v3, v4);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "currentConnectionState"));
    v7 = objc_msgSend(v6, "discoveredService");

    if (v7)
    {
      v8 = sub_100056C84(2uLL);
      v3 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "services"));
        *(_DWORD *)buf = 138412290;
        v33 = v9;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "didDiscoverServices but already discovered desired service. All discovered services: %@", buf, 0xCu);

      }
    }
    else
    {
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "services"));
      v10 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v27;
        while (2)
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(_QWORD *)v27 != v12)
              objc_enumerationMutation(v3);
            v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
            v15 = sub_100056C84(2uLL);
            v16 = objc_claimAutoreleasedReturnValue(v15);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v33 = v14;
              _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "discovered service %@", buf, 0xCu);
            }

            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "serviceUUID"));
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "UUID"));
            v19 = objc_msgSend(v17, "isEqual:", v18);

            if (v19)
            {
              v20 = sub_100056C84(2uLL);
              v21 = objc_claimAutoreleasedReturnValue(v20);
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "discovered the service, starting characteristic discovery", buf, 2u);
              }

              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "currentConnectionState"));
              objc_msgSend(v22, "setDiscoveredService:", 1);

              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "peripheral"));
              v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "psmCharacteristicUUID"));
              v30 = v24;
              v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v30, 1));
              objc_msgSend(v23, "discoverCharacteristics:forService:", v25, v14);

              goto LABEL_4;
            }
          }
          v11 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
          if (v11)
            continue;
          break;
        }
      }
    }
  }
LABEL_4:

}

void sub_10000E3EC(id *a1)
{
  void *v2;
  void *v3;
  unsigned __int8 v4;
  void *v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  __int128 v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  unsigned int v21;
  id v22;
  NSObject *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  void *v32;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "serviceUUID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "UUID"));
  v4 = objc_msgSend(v2, "isEqual:", v3);

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "currentConnectionState"));
    v6 = objc_msgSend(v5, "discoveredPSMCharacteristic");

    if (v6)
    {
      v7 = sub_100056C84(2uLL);
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "characteristics"));
        *(_DWORD *)buf = 138412290;
        v32 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "didDiscoverCharacteristicsForService but already discovered desired characteristic. All discovered characteristics: %@", buf, 0xCu);

      }
    }
    else
    {
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "characteristics"));
      v11 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v11)
      {
        v13 = v11;
        v14 = *(_QWORD *)v27;
        *(_QWORD *)&v12 = 138412290;
        v25 = v12;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(_QWORD *)v27 != v14)
              objc_enumerationMutation(v8);
            v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "UUID", v25));
            v18 = sub_100056C84(2uLL);
            v19 = objc_claimAutoreleasedReturnValue(v18);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v25;
              v32 = v17;
              _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "discovered characteristic %@", buf, 0xCu);
            }

            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "psmCharacteristicUUID"));
            v21 = objc_msgSend(v20, "isEqual:", v17);

            if (v21)
            {
              v22 = sub_100056C84(2uLL);
              v23 = objc_claimAutoreleasedReturnValue(v22);
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "found L2CAP characteristic, attempting to read PSM value", buf, 2u);
              }

              v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "currentConnectionState"));
              objc_msgSend(v24, "setDiscoveredPSMCharacteristic:", 1);

              objc_msgSend(a1[6], "setNotifyValue:forCharacteristic:", 1, v16);
              objc_msgSend(a1[6], "readValueForCharacteristic:", v16);
            }

          }
          v13 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        }
        while (v13);
      }
    }
  }
  else
  {
    v10 = sub_100056C84(2uLL);
    v8 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "didDiscoverCharacteristicsForService on a different service than desired", buf, 2u);
    }
  }

}

void sub_10000E7D4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  unsigned __int16 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  uint64_t v30;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serviceUUID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "service"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUID"));
  v5 = objc_msgSend(v2, "isEqual:", v4);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "psmCharacteristicUUID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "UUID"));
    v8 = objc_msgSend(v6, "isEqual:", v7);

    if ((v8 & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentConnectionState"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "PSM"));

      if (v10)
      {
        v11 = sub_100056C84(2uLL);
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentConnectionState"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "PSM"));
          *(_DWORD *)buf = 138412290;
          v28 = v14;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "already attempting to open channel with PSM: %@", buf, 0xCu);

        }
      }
      else
      {
        v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "value"));
        v12 = v18;
        if (v18)
        {
          v26 = 0;
          -[NSObject getBytes:length:](v18, "getBytes:length:", &v26, 2);
          v19 = bswap32(v26) >> 16;
          v20 = sub_100056C84(2uLL);
          v21 = objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v28) = v19;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "PSM value is %hu", buf, 8u);
          }

          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentConnectionState"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v19));
          objc_msgSend(v22, "setPSM:", v23);

          v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peripheral"));
          -[NSObject openL2CAPChannel:](v24, "openL2CAPChannel:", v19);
        }
        else
        {
          v25 = sub_100056C84(2uLL);
          v24 = objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            sub_1000690A8();
        }

      }
    }
    else
    {
      v15 = sub_100056C84(2uLL);
      v12 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v16 = *(void **)(a1 + 40);
        v17 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138412546;
        v28 = v16;
        v29 = 2112;
        v30 = v17;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "ignoring didUpdateValueForCharacteristic: %@, error: %@", buf, 0x16u);
      }
    }

  }
}

void sub_10000EB8C(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  id v5;
  CARBluetoothLEChannel *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned int v16;
  unsigned int v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  id v22;
  unsigned int v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  void *v27;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "currentConnectionState"));
    v3 = v2;
    if (v2)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject serviceChannel](v2, "serviceChannel"));

      if (v4)
      {
        v5 = sub_100056C84(2uLL);
        v6 = (CARBluetoothLEChannel *)objc_claimAutoreleasedReturnValue(v5);
        if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_DEFAULT))
        {
          v7 = *(_QWORD *)(a1 + 32);
          v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject serviceChannel](v3, "serviceChannel"));
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "channel"));
          v24 = 138412546;
          v25 = v7;
          v26 = 2112;
          v27 = v9;
          _os_log_impl((void *)&_mh_execute_header, &v6->super, OS_LOG_TYPE_DEFAULT, "ignoring didOpenL2CAPChannel for channel %@, already opened channel %@", (uint8_t *)&v24, 0x16u);

        }
      }
      else
      {
        v13 = objc_claimAutoreleasedReturnValue(-[NSObject PSM](v3, "PSM"));
        if (v13
          && (v14 = (void *)v13,
              v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject PSM](v3, "PSM")),
              v16 = objc_msgSend(v15, "unsignedShortValue"),
              v17 = objc_msgSend(*(id *)(a1 + 32), "PSM"),
              v15,
              v14,
              v16 == v17))
        {
          v18 = sub_100056C84(2uLL);
          v19 = objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            v20 = *(_QWORD *)(a1 + 32);
            v24 = 138412290;
            v25 = v20;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "opening L2CAP channel %@", (uint8_t *)&v24, 0xCu);
          }

          v6 = -[CARBluetoothLEChannel initWithService:channel:]([CARBluetoothLEChannel alloc], "initWithService:channel:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "currentConnectionState"));
          objc_msgSend(v21, "setServiceChannel:", v6);

        }
        else
        {
          v22 = sub_100056C84(2uLL);
          v6 = (CARBluetoothLEChannel *)objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_DEFAULT))
          {
            v23 = objc_msgSend(*(id *)(a1 + 32), "PSM");
            v24 = 67109120;
            LODWORD(v25) = v23;
            _os_log_impl((void *)&_mh_execute_header, &v6->super, OS_LOG_TYPE_DEFAULT, "ignoring didOpenL2CAPChannel for unknown PSM %hu", (uint8_t *)&v24, 8u);
          }
        }
      }
    }
    else
    {
      v12 = sub_100056C84(2uLL);
      v6 = (CARBluetoothLEChannel *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_ERROR))
        sub_100069144();
    }

  }
  else
  {
    v10 = sub_100056C84(2uLL);
    v3 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_1000690D4(a1, v3, v11);
  }

}

void sub_10000EF04(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_10000F9A8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1000108F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100010918(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100010928(uint64_t a1)
{

}

void sub_100010930(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;

  v6 = a5;
  v7 = objc_opt_class(NSDictionary);
  v8 = v6;
  v9 = v8;
  if (v8 && (objc_opt_isKindOfClass(v8, v7) & 1) != 0)
    v10 = v9;
  else
    v10 = 0;

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  v13 = sub_100056C84(0);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v16 = 138477827;
    v17 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "fetched digital car info: %{private}@", (uint8_t *)&v16, 0xCu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100010DF8(uint64_t a1, void *a2, const __CFString *a3)
{
  CFComparisonResult v4;
  id v5;

  v5 = a2;
  v4 = CFStringCompare(kCMVehicleConnectedNotification, a3, 0);
  if (v4 == kCFCompareEqualTo || CFStringCompare(kCMVehicleDisconnectedNotification, a3, 0) == kCFCompareEqualTo)
    objc_msgSend(v5, "setConnected:", v4 == kCFCompareEqualTo);
  objc_msgSend(v5, "_checkVehicleState");

}

id sub_100010E7C(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_checkVehicleState");
}

void sub_100010E84(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;

  v3 = objc_autoreleasePoolPush();
  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v4, "isInLostMode")));
  v10 = CarDNDWDLogging(v6, v7, v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Device lost state is currently: %@", buf, 0xCu);
  }

  if ((objc_opt_respondsToSelector(v5, "stateMachine:receivedFMDMode:") & 1) != 0)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100011808;
    block[3] = &unk_1000B53B8;
    v13 = v5;
    v14 = v4;
    v15 = v6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
  objc_autoreleasePoolPop(v3);
}

id sub_100011808(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stateMachine:receivedFMDMode:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "BOOLValue"));
}

void sub_100011A1C(id a1)
{
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[16];

  v1 = CarCertificationOverrideLogging(a1);
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "certification override service connection interrupted", v3, 2u);
  }

}

void sub_100011A80(id a1)
{
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[16];

  v1 = CarCertificationOverrideLogging(a1);
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "certification override service connection invalidated", v3, 2u);
  }

}

BOOL sub_100011DB4(id a1, id a2, NSDictionary *a3)
{
  id v3;
  uint64_t v4;
  char isKindOfClass;

  v3 = a2;
  v4 = objc_opt_class(NSString);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  return (isKindOfClass & 1) == 0;
}

void sub_100011FAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000132B0(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100013330;
  v5[3] = &unk_1000B5390;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

void sub_100013330(uint64_t a1)
{
  id v2;
  uint64_t v3;
  NSObject *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[8];
  _BYTE v17[128];

  v2 = objc_msgSend(*(id *)(a1 + 32), "activelyMonitoringGeofences");
  if ((v2 & 1) != 0)
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "_shouldCreateGeofences"))
      return;
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = *(id *)(a1 + 40);
    v5 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(a1 + 32);
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "locationOfInterest", (_QWORD)v12));
          objc_msgSend(v9, "_createGeofenceForLOI:", v10);

        }
        v6 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      }
      while (v6);
    }
  }
  else
  {
    v11 = CarDNDWDLogging(v2, v3);
    v4 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Cancelling geofences for predicted locations - no longer actively monitoring.", buf, 2u);
    }
  }

}

void sub_1000135E0(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100013660;
  v5[3] = &unk_1000B5390;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

void sub_100013660(uint64_t a1)
{
  id v2;
  uint64_t v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[8];
  _BYTE v19[128];

  v2 = objc_msgSend(*(id *)(a1 + 32), "activelyMonitoringGeofences");
  if ((v2 & 1) != 0)
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "_shouldCreateGeofences"))
      return;
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = *(id *)(a1 + 40);
    v5 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v5)
    {
      v7 = v5;
      v8 = *(_QWORD *)v15;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v4);
          v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v9);
          v11 = CarDNDWDLogging(v5, v6);
          v12 = objc_claimAutoreleasedReturnValue(v11);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Creating fence for home", buf, 2u);
          }

          v5 = objc_msgSend(*(id *)(a1 + 32), "_createGeofenceForLOI:", v10, (_QWORD)v14);
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v5 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
        v7 = v5;
      }
      while (v5);
    }
  }
  else
  {
    v13 = CarDNDWDLogging(v2, v3);
    v4 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Cancelling geofences for home location - no longer actively monitoring.", buf, 2u);
    }
  }

}

void sub_10001380C(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001388C;
  v5[3] = &unk_1000B5390;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

void sub_10001388C(uint64_t a1)
{
  id v2;
  uint64_t v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[8];
  _BYTE v19[128];

  v2 = objc_msgSend(*(id *)(a1 + 32), "activelyMonitoringGeofences");
  if ((v2 & 1) != 0)
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "_shouldCreateGeofences"))
      return;
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = *(id *)(a1 + 40);
    v5 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v5)
    {
      v7 = v5;
      v8 = *(_QWORD *)v15;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v4);
          v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v9);
          v11 = CarDNDWDLogging(v5, v6);
          v12 = objc_claimAutoreleasedReturnValue(v11);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Creating fence for work", buf, 2u);
          }

          v5 = objc_msgSend(*(id *)(a1 + 32), "_createGeofenceForLOI:", v10, (_QWORD)v14);
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v5 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
        v7 = v5;
      }
      while (v5);
    }
  }
  else
  {
    v13 = CarDNDWDLogging(v2, v3);
    v4 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Cancelling geofences for work location - no longer actively monitoring.", buf, 2u);
    }
  }

}

id sub_100013A90(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id result;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "setLocationServicesEnabled:", CRAutomaticDNDLocationServicesEnabled());
  if (objc_msgSend(*(id *)(a1 + 32), "activelyMonitoringGeofences")
    && (v2 = objc_msgSend(*(id *)(a1 + 32), "locationServicesEnabled"), (v2 & 1) == 0))
  {
    v8 = CarDNDWDLogging(v2, v3);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Deactivating geofences since location services are now disabled", buf, 2u);
    }

    return objc_msgSend(*(id *)(a1 + 32), "stopMonitoringLOIs");
  }
  else
  {
    result = objc_msgSend(*(id *)(a1 + 32), "isDNDActive");
    if ((_DWORD)result)
    {
      result = objc_msgSend(*(id *)(a1 + 32), "locationServicesEnabled");
      if ((_DWORD)result)
      {
        v6 = CarDNDWDLogging(result, v5);
        v7 = objc_claimAutoreleasedReturnValue(v6);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v10 = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Activating geofences since location services are now enabled", v10, 2u);
        }

        return objc_msgSend(*(id *)(a1 + 32), "beginMonitoringLOIsWithStartingLocationGeofence:", objc_msgSend(*(id *)(a1 + 32), "shouldCreateGeofenceAroundStart"));
      }
    }
  }
  return result;
}

void sub_100013C24(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint8_t v22[16];
  __int16 v23;
  uint8_t buf[2];
  __int16 v25;

  if (!*(_QWORD *)(a1 + 32))
  {
    v14 = CarDNDWDLogging(a1, a2);
    v11 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v25 = 0;
      v12 = "Received location update, but nil location";
      v13 = (uint8_t *)&v25;
      goto LABEL_10;
    }
LABEL_11:

    return;
  }
  v3 = objc_msgSend(*(id *)(a1 + 40), "activelyMonitoringGeofences");
  if ((v3 & 1) == 0)
  {
    v15 = CarDNDWDLogging(v3, v4);
    v11 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v12 = "Received location update, but no longer monitoring";
      v13 = buf;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "timestamp"));
  objc_msgSend(v5, "timeIntervalSinceNow");
  v7 = fabs(v6);

  if (v7 > 30.0)
  {
    v10 = CarDNDWDLogging(v8, v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 0;
      v12 = "Received location update, but age is too old";
      v13 = (uint8_t *)&v23;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, v13, 2u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "shouldCreateGeofenceAroundStart")
    && (objc_msgSend(*(id *)(a1 + 40), "didCreateGeofenceAroundStart") & 1) == 0)
  {
    v16 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "coordinate");
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "_addCoordinatesToMonitoredRegion:identifier:radius:", CFSTR("Start Identifier"), 100));
    objc_msgSend(v17, "setRegionState:", 1);
    objc_msgSend(*(id *)(a1 + 40), "setDidCreateGeofenceAroundStart:", 1);
    v18 = objc_msgSend(*(id *)(a1 + 40), "setIsCurrentlyInsideGeofence:", 1);
    v20 = CarDNDWDLogging(v18, v19);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Creating start geofence around received location", v22, 2u);
    }

    objc_msgSend(*(id *)(a1 + 40), "_postNotificationForGeofence");
  }
  objc_msgSend(*(id *)(a1 + 40), "_createGeofencesAroundPredictedLocationsFromLocation:", *(_QWORD *)(a1 + 32));
}

id sub_10001402C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateState:forRegion:", 1, *(_QWORD *)(a1 + 40));
}

id sub_100014180(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateState:forRegion:", 2, *(_QWORD *)(a1 + 40));
}

id sub_1000142C4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateState:forRegion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

Class sub_100014584(uint64_t a1)
{
  char *v2;
  Class result;
  char *v4;
  __int128 v5;
  uint64_t v6;

  v4 = 0;
  if (!qword_1000DB830)
  {
    v5 = off_1000B54D0;
    v6 = 0;
    qword_1000DB830 = _sl_dlopen(&v5, &v4);
    v2 = v4;
    if (!qword_1000DB830)
    {
      abort_report_np("%s", v4);
      goto LABEL_7;
    }
    if (v4)
      goto LABEL_8;
  }
  while (1)
  {
    result = objc_getClass("RTRoutineManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_7:
    v2 = (char *)sub_1000697D0();
LABEL_8:
    free(v2);
  }
  qword_1000DB828 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100014678(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

id sub_1000146C8()
{
  void *v0;

  return objc_msgSend(v0, "center");
}

id sub_1000146F8(void *a1, const char *a2)
{
  return objc_msgSend(a1, "center");
}

void sub_100014800(uint64_t a1)
{
  id *WeakRetained;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  int v13;
  const __CFString *v14;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  objc_storeStrong(WeakRetained + 1, *(id *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "delegate"));
  v4 = (void *)v3;
  if (v3 && (objc_opt_respondsToSelector(v3, "shouldPresentHeadUnitPairingPromptSession:") & 1) != 0)
  {
    v5 = objc_msgSend(v4, "shouldPresentHeadUnitPairingPromptSession:", WeakRetained);
    if (*(_QWORD *)(a1 + 40))
    {
      v6 = v5;
      v7 = CarPairingLogging(v5);
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = CFSTR("NO");
        if ((_DWORD)v6)
          v9 = CFSTR("YES");
        v13 = 138543362;
        v14 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "wantsToPresentHeadUnitPairingPrompt: %{public}@", (uint8_t *)&v13, 0xCu);
      }

      v10 = *(_QWORD *)(a1 + 40);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v6));
      (*(void (**)(uint64_t, void *, _QWORD))(v10 + 16))(v10, v11, 0);

    }
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 40);
    if (v12)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v12 + 16))(v12, 0, 0);
  }

}

void sub_100014A78(id *a1)
{
  id *WeakRetained;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  objc_storeStrong(WeakRetained + 1, a1[4]);
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "delegate"));
  v4 = (void *)v3;
  if (v3 && (objc_opt_respondsToSelector(v3, "presentHeadUnitPairingForPromptSession:") & 1) != 0)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100014B60;
    v6[3] = &unk_1000B5518;
    v7 = a1[5];
    objc_msgSend(WeakRetained, "setPairingPromptCompletion:", v6);
    objc_msgSend(v4, "presentHeadUnitPairingForPromptSession:", WeakRetained);

  }
  else
  {
    v5 = a1[5];
    if (v5)
      (*((void (**)(id, _QWORD, _QWORD))v5 + 2))(v5, 0, 0);
  }

}

void sub_100014B60(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint8_t v10[16];

  v5 = a3;
  v6 = CarPairingLogging(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "presentHeadUnitPairingPrompt completed", v10, 2u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    sub_100069854((uint64_t)v5, v8);
  }

  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, a2, v5);

}

void sub_100014D30(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void (*v12)(void);
  uint64_t v13;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = *(void **)(a1 + 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "keyIdentifier"));
  LOBYTE(v3) = objc_msgSend(v3, "isEqualToString:", v4);

  if ((v3 & 1) == 0)
  {
    v6 = CarPairingLogging(v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100069954(v7);

    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v8 + 16))(v8, 0, 0);
  }
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "delegate"));
  v10 = (void *)v9;
  if (v9 && (objc_opt_respondsToSelector(v9, "handleHeadUnitPairingPromptSession:receivedResponse:") & 1) != 0)
  {
    objc_msgSend(v10, "handleHeadUnitPairingPromptSession:receivedResponse:", WeakRetained, *(unsigned __int8 *)(a1 + 56));
    v11 = *(_QWORD *)(a1 + 40);
    if (v11)
    {
      v12 = *(void (**)(void))(v11 + 16);
LABEL_12:
      v12();
    }
  }
  else
  {
    v13 = *(_QWORD *)(a1 + 40);
    if (v13)
    {
      v12 = *(void (**)(void))(v13 + 16);
      goto LABEL_12;
    }
  }

}

void sub_100015008(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 48));
  _Unwind_Resume(a1);
}

void sub_10001502C(id *a1, char a2)
{
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  char v8;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000150E0;
  v4[3] = &unk_1000B5540;
  objc_copyWeak(&v7, a1 + 6);
  v8 = a2;
  v5 = a1[4];
  v6 = a1[5];
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

  objc_destroyWeak(&v7);
}

void sub_1000150E0(uint64_t a1)
{
  id WeakRetained;
  int v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint8_t v9[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = *(unsigned __int8 *)(a1 + 56);
  v4 = CarPairingLogging(WeakRetained);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "prox card can be presented", v9, 2u);
    }

    objc_msgSend(WeakRetained, "_launchRemoteAlertWithUserInfo:errorHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100069990(v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "sharingClient"));
    objc_msgSend(v7, "invalidate");

    objc_msgSend(WeakRetained, "setSharingClient:", 0);
    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
      (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, 0);
  }

}

void sub_10001532C(id a1)
{
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[16];

  v1 = CarPairingLogging(a1);
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "CarPlaySetup did activate.", v3, 2u);
  }

}

id sub_1000153E8(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v5[16];

  v2 = CarPairingLogging(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CarPlaySetup did deactivate.", v5, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void sub_100015508(uint64_t a1)
{
  id WeakRetained;
  id *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = *(void **)(a1 + 32);
  v3 = (id *)(a1 + 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
  v6 = objc_msgSend(v5, "isEqualToString:", SBSRemoteAlertHandleInvalidationErrorDomain);

  if (!v6)
  {
    v14 = CarPairingLogging(v7);
    v12 = objc_claimAutoreleasedReturnValue(v14);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
LABEL_8:
    sub_1000699D0((uint64_t)v3, v12, v15, v16, v17, v18, v19, v20);
    goto LABEL_9;
  }
  v8 = (unint64_t)objc_msgSend(*v3, "code");
  v9 = v8 & 0xFFFFFFFFFFFFFFFELL;
  v10 = CarPairingLogging(v8);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if (v9 != 4)
  {
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    goto LABEL_8;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(*v3, "code")));
    v23 = 138412290;
    v24 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "CarPlaySetup alert handle invalidated with code %@", (uint8_t *)&v23, 0xCu);

  }
LABEL_9:

  v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "currentErrorHandler"));
  v22 = (void *)v21;
  if (v21)
    (*(void (**)(uint64_t, id))(v21 + 16))(v21, *v3);
  objc_msgSend(WeakRetained, "invalidate");

}

void sub_1000157D4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id sub_1000159DC(uint64_t a1)
{
  void *v2;
  void *v3;

  if (objc_msgSend(*(id *)(a1 + 32), "channelIsOpen"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "channel"));
    objc_msgSend(v2, "closeChannel");

    objc_msgSend(*(id *)(a1 + 32), "setChannelIsOpen:", 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "setCurrentAcceptCompletion:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "channel"));
  objc_msgSend(v3, "setChannelDelegate:", 0);

  objc_msgSend(*(id *)(a1 + 32), "_internalQueue_signalChunkQueue");
  return objc_msgSend(*(id *)(a1 + 32), "setInternalQueueOutstandingSendCount:", 0);
}

uint64_t sub_100015CF4(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t result;
  int v10;
  uint64_t v11;

  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "internalQueue"));
  dispatch_assert_queue_V2(v4);

  v5 = sub_100056C84(4uLL);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if ((_DWORD)a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 40);
      v10 = 138412290;
      v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "completed file transfer for cluster theme version %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_100069AA8();
  }

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

uint64_t sub_100015F78(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t result;
  int v10;
  uint64_t v11;

  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "internalQueue"));
  dispatch_assert_queue_V2(v4);

  v5 = sub_100056C84(4uLL);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if ((_DWORD)a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 40);
      v10 = 138412290;
      v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "completed file transfer for log archive %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_100069B0C();
  }

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

void sub_1000162B4(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  unint64_t v21;
  NSObject *v22;
  id v23;
  id v24;
  NSObject *v25;
  void (**v26)(id, _QWORD);
  id v27;
  NSObject *v28;
  void (**v29)(id, _QWORD);
  id v30;
  id v31;
  _QWORD block[4];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  __int128 *v41;
  unint64_t v42;
  unint64_t v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  id v49;
  __int128 *p_buf;
  id v51;
  id v52;
  uint8_t v53[4];
  id v54;
  __int128 buf;
  uint64_t v56;
  char v57;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "path"));
  v52 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "attributesOfItemAtPath:error:", v3, &v52));
  v5 = v52;

  if (v4)
  {
    v6 = objc_msgSend(objc_alloc((Class)NSProgress), "initWithParent:userInfo:", 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", NSFileSize));
    v8 = objc_msgSend(v7, "unsignedLongLongValue");

    objc_msgSend(v6, "setTotalUnitCount:", v8);
    objc_msgSend(a1[5], "addChild:withPendingUnitCount:", v6, 1);
    v9 = sub_100056C84(4uLL);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "started tracking file transfer progress: %@", (uint8_t *)&buf, 0xCu);
    }

    v11 = a1[4];
    v51 = v5;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileHandle fileHandleForReadingFromURL:error:](NSFileHandle, "fileHandleForReadingFromURL:error:", v11, &v51));
    v31 = v51;

    if (v12)
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v56 = 0x2020000000;
      v57 = 0;
      v13 = objc_msgSend(objc_alloc((Class)NSProgress), "initWithParent:userInfo:", 0, 0);
      objc_msgSend(v13, "setTotalUnitCount:", 1);
      objc_msgSend(a1[5], "addChild:withPendingUnitCount:", v13, 1);
      v14 = sub_100056C84(4uLL);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v53 = 138412290;
        v54 = v13;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "started tracking file acknowledgment progress: %@", v53, 0xCu);
      }

      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_100016824;
      v45[3] = &unk_1000B5600;
      v16 = a1[6];
      v46 = a1[7];
      v30 = v13;
      v47 = v30;
      v48 = a1[5];
      p_buf = &buf;
      v49 = a1[9];
      objc_msgSend(v16, "setCurrentAcceptCompletion:", v45);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "UUIDString"));

      v19 = sub_100056C84(4uLL);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v53 = 138412290;
        v54 = v18;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "starting file transfer session %@", v53, 0xCu);
      }

      v21 = (unint64_t)objc_msgSend(a1[6], "_internalQueue_chunkSizeForTransferWithPriority:", objc_msgSend(a1[6], "isPriority"));
      v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1[6], "chunkQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100016940;
      block[3] = &unk_1000B56A0;
      v33 = a1[7];
      v40 = a1[9];
      v34 = a1[8];
      v35 = v18;
      v36 = a1[6];
      v41 = &buf;
      v42 = ((unint64_t)v8 + v21 - 1) / v21;
      v37 = v12;
      v43 = v21;
      v38 = a1[4];
      v39 = v6;
      v44 = v8;
      v23 = v18;
      dispatch_async(v22, block);

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      v27 = sub_100056C84(4uLL);
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        sub_100069BD0();

      v29 = (void (**)(id, _QWORD))a1[9];
      if (v29)
        v29[2](v29, 0);
    }

    v5 = v31;
  }
  else
  {
    v24 = sub_100056C84(4uLL);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_100069B70();

    v26 = (void (**)(id, _QWORD))a1[9];
    if (v26)
      v26[2](v26, 0);
  }

}

void sub_1000167F0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100016824(uint64_t a1, uint64_t a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  uint64_t result;
  int v10;
  uint64_t v11;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", 1);
  v4 = sub_100056C84(4uLL);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 48);
    v10 = 138412290;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "completed tracking acceptance progress: %@", (uint8_t *)&v10, 0xCu);
  }

  if ((a2 & 1) == 0)
  {
    v7 = sub_100056C84(4uLL);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100069C30();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  }
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

void sub_100016940(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  id v5;
  void *v6;
  void *Data;
  id v8;
  NSObject *v9;
  NSObject *v10;
  unint64_t v11;
  void *v12;
  NSObject *v13;
  int v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  uint64_t i;
  id v28;
  NSObject *v29;
  void *v30;
  id v31;
  NSObject *v32;
  id v33;
  NSObject *v34;
  id v35;
  NSObject *v36;
  id v37;
  NSObject *v38;
  id v39;
  NSObject *v40;
  uint64_t v41;
  id v42;
  double v43;
  double v44;
  double v45;
  id v46;
  NSObject *v47;
  uint64_t v48;
  id v49;
  NSObject *v50;
  uint64_t v51;
  id v52;
  NSObject *v53;
  uint64_t v54;
  id v55;
  _QWORD *v56;
  id v57;
  _QWORD block[6];
  _QWORD v59[4];
  id v60;
  id v61;
  uint8_t v62[4];
  id v63;
  _QWORD v64[4];
  _QWORD v65[4];
  uint8_t md[4];
  unint64_t v67;
  __int16 v68;
  uint64_t v69;
  __int16 v70;
  id v71;
  _BYTE v72[24];
  char v73;
  CC_SHA256_CTX buf;

  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472;
  v59[2] = sub_1000172F8;
  v59[3] = &unk_1000B5650;
  v60 = *(id *)(a1 + 32);
  v61 = *(id *)(a1 + 88);
  v56 = objc_retainBlock(v59);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v3 = v2;
  v4 = objc_autoreleasePoolPush();
  v5 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v5, "setObject:forKey:", &off_1000BE008);
  objc_msgSend(v5, "setObject:forKey:", *(_QWORD *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 104)));
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("chunkCount"));

  *(_DWORD *)v72 = 0;
  Data = (void *)OPACKEncoderCreateData(v5, 0, v72);
  v8 = sub_100056C84(4uLL);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (!Data)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100069C5C((int *)v72, v10);
    goto LABEL_43;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    buf.count[0] = 138412290;
    *(_QWORD *)&buf.count[1] = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "sending header %@", (uint8_t *)&buf, 0xCu);
  }

  if ((objc_msgSend(*(id *)(a1 + 56), "_chunkQueue_blockingSendChannelMessage:", Data) & 1) == 0)
  {
    v42 = sub_100056C84(4uLL);
    v10 = objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_100069CD0();
LABEL_43:

    ((void (*)(void))v56[2])();
    objc_autoreleasePoolPop(v4);
    goto LABEL_53;
  }

  objc_autoreleasePoolPop(v4);
  memset(&buf, 0, sizeof(buf));
  CC_SHA256_Init(&buf);
  if (*(_QWORD *)(a1 + 104))
  {
    v11 = 0;
    while (1)
    {
      v12 = objc_autoreleasePoolPush();
      *(_QWORD *)v72 = 0;
      *(_QWORD *)&v72[8] = v72;
      *(_QWORD *)&v72[16] = 0x2020000000;
      v73 = 0;
      v13 = *(NSObject **)(a1 + 32);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001737C;
      block[3] = &unk_1000B5678;
      block[4] = *(_QWORD *)(a1 + 96);
      block[5] = v72;
      dispatch_sync(v13, block);
      if (*(_BYTE *)(*(_QWORD *)&v72[8] + 24))
      {
        v14 = 1;
      }
      else
      {
        v15 = sub_100056C84(4uLL);
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)md = 134217984;
          v67 = v11;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "reading file chunk %lu", md, 0xCu);
        }

        v17 = *(void **)(a1 + 64);
        v18 = *(_QWORD *)(a1 + 112);
        v57 = 0;
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "readDataUpToLength:error:", v18, &v57));
        v55 = v57;
        if (v19)
        {
          v20 = objc_alloc((Class)NSMutableDictionary);
          v64[0] = CFSTR("messageType");
          v64[1] = CFSTR("sessionID");
          v21 = *(_QWORD *)(a1 + 48);
          v65[0] = &off_1000BE020;
          v65[1] = v21;
          v64[2] = CFSTR("chunkIndex");
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v11));
          v64[3] = CFSTR("data");
          v65[2] = v22;
          v65[3] = v19;
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v65, v64, 4));
          v24 = objc_msgSend(v20, "initWithDictionary:", v23);

          v25 = objc_retainAutorelease(v19);
          CC_SHA256_Update(&buf, objc_msgSend(v25, "bytes"), (CC_LONG)objc_msgSend(v25, "length"));
          if (v11 >= *(_QWORD *)(a1 + 104) - 1)
          {
            CC_SHA256_Final(md, &buf);
            v26 = objc_alloc_init((Class)NSMutableString);
            for (i = 0; i != 32; ++i)
              objc_msgSend(v26, "appendFormat:", CFSTR("%02x"), md[i]);
            v28 = sub_100056C84(4uLL);
            v29 = objc_claimAutoreleasedReturnValue(v28);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v62 = 138412290;
              v63 = v26;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "file checksum: %@\n", v62, 0xCu);
            }

            objc_msgSend(v24, "setObject:forKey:", v26, CFSTR("checksum"));
          }
          *(_DWORD *)v62 = 0;
          v30 = (void *)OPACKEncoderCreateData(v24, 0, v62);
          if (v30)
          {
            v31 = sub_100056C84(4uLL);
            v32 = objc_claimAutoreleasedReturnValue(v31);
            if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)md = 134217984;
              v67 = v11;
              _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "initiating send for file chunk %lu", md, 0xCu);
            }

            if ((objc_msgSend(*(id *)(a1 + 56), "_chunkQueue_blockingSendChannelMessage:", v30) & 1) != 0)
            {
              v33 = sub_100056C84(4uLL);
              v34 = objc_claimAutoreleasedReturnValue(v33);
              if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)md = 134217984;
                v67 = v11;
                _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "send in progress for file chunk %lu", md, 0xCu);
              }

              objc_msgSend(*(id *)(a1 + 80), "setCompletedUnitCount:", (char *)objc_msgSend(*(id *)(a1 + 80), "completedUnitCount") + (_QWORD)objc_msgSend(v25, "length"));
              v14 = 0;
            }
            else
            {
              v39 = sub_100056C84(4uLL);
              v40 = objc_claimAutoreleasedReturnValue(v39);
              if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)md = 134217984;
                v67 = v11;
                _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "failed to send file transfer chunk %lu", md, 0xCu);
              }

              ((void (*)(void))v56[2])();
              v14 = 1;
            }
          }
          else
          {
            v37 = sub_100056C84(4uLL);
            v38 = objc_claimAutoreleasedReturnValue(v37);
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)md = 67109120;
              LODWORD(v67) = *(_DWORD *)v62;
              _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "failed to encode file transfer payload message: %d", md, 8u);
            }

            ((void (*)(void))v56[2])();
            v14 = 1;
          }

        }
        else
        {
          v35 = sub_100056C84(4uLL);
          v36 = objc_claimAutoreleasedReturnValue(v35);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            v41 = *(_QWORD *)(a1 + 72);
            *(_DWORD *)md = 134218498;
            v67 = v11;
            v68 = 2112;
            v69 = v41;
            v70 = 2112;
            v71 = v55;
            _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "failed to read file chunk %lu of %@: %@", md, 0x20u);
          }

          ((void (*)(void))v56[2])();
          v14 = 1;
        }

      }
      _Block_object_dispose(v72, 8);
      objc_autoreleasePoolPop(v12);
      if (v14)
        break;
      if (++v11 >= *(_QWORD *)(a1 + 104))
        goto LABEL_44;
    }
  }
  else
  {
LABEL_44:
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    v44 = 0.0;
    if (v43 - v3 > 0.0)
    {
      +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
      v44 = v45 - v3;
    }
    v46 = sub_100056C84(4uLL);
    v47 = objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      v48 = *(_QWORD *)(a1 + 120);
      *(_DWORD *)v72 = 134218240;
      *(_QWORD *)&v72[4] = v48;
      *(_WORD *)&v72[12] = 2048;
      *(double *)&v72[14] = v44;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "sent file of size %llu bytes in %f seconds", v72, 0x16u);
    }

    v49 = sub_100056C84(4uLL);
    v50 = objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      v51 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)v72 = 138412290;
      *(_QWORD *)&v72[4] = v51;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "completed sending for file transfer session %@", v72, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 80), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 80), "totalUnitCount"));
    v52 = sub_100056C84(4uLL);
    v53 = objc_claimAutoreleasedReturnValue(v52);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      v54 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)v72 = 138412290;
      *(_QWORD *)&v72[4] = v54;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "waiting on acceptance message for file transfer session %@", v72, 0xCu);
    }

  }
LABEL_53:

}

void sub_1000172A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
  _Block_object_dispose(&a55, 8);
  _Unwind_Resume(a1);
}

void sub_1000172F8(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[4];
  id v3;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017364;
  block[3] = &unk_1000B5628;
  v1 = *(NSObject **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);

}

uint64_t sub_100017364(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void sub_10001737C(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v2 = sub_100056C84(4uLL);
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "file transfer is canceled, stopping", v4, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
}

void sub_100017628(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_100017654(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;

  if ((objc_msgSend(*(id *)(a1 + 32), "channelIsOpen") & 1) != 0)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "channel"));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "sendChannelMessage:", *(_QWORD *)(a1 + 40));

    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      objc_msgSend(*(id *)(a1 + 32), "setInternalQueueOutstandingSendCount:", (char *)objc_msgSend(*(id *)(a1 + 32), "internalQueueOutstandingSendCount") + 1);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = (unint64_t)objc_msgSend(*(id *)(a1 + 32), "internalQueueOutstandingSendCount") > 2;
    }
    else
    {
      v5 = sub_100056C84(4uLL);
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        sub_100069D28();

    }
  }
  else
  {
    v3 = sub_100056C84(4uLL);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_100069D54();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
}

id sub_100017754(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setInternalQueueOutstandingSendCount:", (char *)objc_msgSend(*(id *)(a1 + 32), "internalQueueOutstandingSendCount") - 1);
}

id sub_100017A08(uint64_t a1)
{
  id v2;
  NSObject *v3;

  v2 = sub_100056C84(4uLL);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_100069E48();

  return objc_msgSend(*(id *)(a1 + 32), "_internalQueue_signalChunkQueue");
}

void sub_100017B20(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  int v18;

  v18 = 0;
  v2 = objc_opt_class(NSDictionary);
  v3 = (id)OPACKDecodeData(*(_QWORD *)(a1 + 32), 0, &v18);
  v4 = v3;
  if (v3 && (objc_opt_isKindOfClass(v3, v2) & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  if (v5)
  {
    v6 = objc_opt_class(NSNumber);
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("messageType")));
    v8 = v7;
    if (v7 && (objc_opt_isKindOfClass(v7, v6) & 1) != 0)
      v9 = v8;
    else
      v9 = 0;

    if (v9)
    {
      switch((unint64_t)-[NSObject unsignedIntegerValue](v9, "unsignedIntegerValue"))
      {
        case 1uLL:
          v10 = sub_100056C84(4uLL);
          v11 = objc_claimAutoreleasedReturnValue(v10);
          if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            goto LABEL_25;
          goto LABEL_13;
        case 2uLL:
          v15 = sub_100056C84(4uLL);
          v11 = objc_claimAutoreleasedReturnValue(v15);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
LABEL_13:
            sub_100069FC4();
          goto LABEL_25;
        case 3uLL:
          v16 = sub_100056C84(4uLL);
          v11 = objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            sub_100069FF0();
          goto LABEL_25;
        case 4uLL:
          v17 = sub_100056C84(4uLL);
          v11 = objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            sub_10006A01C();
LABEL_25:

          break;
        case 5uLL:
          objc_msgSend(*(id *)(a1 + 40), "_internalQueue_handleFileAcceptMessage:", v5);
          break;
        default:
          break;
      }
    }
    else
    {
      v13 = sub_100056C84(4uLL);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_100069F64();

    }
  }
  else
  {
    v12 = sub_100056C84(4uLL);
    v9 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100069EE4();
  }

}

id sub_100017DCC(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint8_t v5[16];

  v2 = sub_100056C84(4uLL);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "closed file data connection", v5, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setChannelIsOpen:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_internalQueue_signalChunkQueue");
}

void sub_100017F00(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_100017F38(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_100018108(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001811C(uint64_t a1)
{
  void *v1;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained[5], "currentSession"));
  objc_msgSend(WeakRetained, "_worker_queue_setSession:", v1);

}

void sub_100018234(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_100018248(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  id *v4;
  void *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = *(void **)(a1 + 32);
  v4 = (id *)(a1 + 32);
  v3 = v5;
  if (v5)
  {
    v6 = objc_msgSend(v3, "isEqual:", WeakRetained[3]);
    if ((v6 & 1) == 0)
    {
      v7 = CarGeneralLogging(v6);
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        sub_10006A048();

      objc_storeStrong(WeakRetained + 3, *v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      objc_msgSend(v9, "setURL:forKey:", *v4, CFSTR("CRCarPlayCapabilitiesPlistPathKey"));

      objc_msgSend(WeakRetained, "_worker_queue_runStateMachineIfPossible");
    }
  }

}

void sub_100018678(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100018690(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000186A0(uint64_t a1)
{

}

void sub_1000186A8(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
}

void sub_100018900(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100018914(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_worker_queue_reloadSessionIfNeeded"));
  objc_msgSend(WeakRetained, "_worker_queue_setSession:", v2);

  v4 = CarGeneralLogging(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_10006A124(v5, v6, v7, v8, v9, v10, v11, v12);

}

void sub_100018A44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100018A58(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_worker_queue_reloadSessionIfNeeded"));
  objc_msgSend(WeakRetained, "_worker_queue_setSession:", v2);

  v4 = CarGeneralLogging(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_10006A194(v5, v6, v7, v8, v9, v10, v11, v12);

}

void sub_100018B8C(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_100018BA0(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  NSObject *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = CarGeneralLogging(WeakRetained);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_10006A204();

  objc_msgSend(WeakRetained, "_worker_queue_setSession:", *(_QWORD *)(a1 + 32));
  objc_msgSend(WeakRetained, "reconcileCapabilities");

}

void sub_100018CDC(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_100018CF0(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;
  NSObject *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = CarGeneralLogging(WeakRetained);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_10006A274();

  objc_msgSend(WeakRetained, "setLastLookupIdentifer:", 0);
  objc_msgSend(WeakRetained, "_worker_queue_setSession:", 0);

}

void sub_100018E30(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_100018E44(uint64_t a1)
{
  id v2;
  void *v3;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v3 = (void *)WeakRetained[4];
  WeakRetained[4] = v2;

  objc_msgSend(WeakRetained, "reconcileCapabilities");
}

void sub_100018FEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100019008(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = CarGeneralLogging(WeakRetained);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315650;
    v12 = "-[CRCarPlayCapabilitiesManager resolveCapabilitiesForSession:]_block_invoke";
    v13 = 2112;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: car carpabilities from state machine: %@, error: %@", (uint8_t *)&v11, 0x20u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CRCarPlayCapabilities capabilitiesIdentifier](CRCarPlayCapabilities, "capabilitiesIdentifier"));
  objc_msgSend(WeakRetained, "setLastLookupIdentifer:", v10);

  objc_msgSend(WeakRetained, "setCarCapabilities:", v5);
}

void sub_10001943C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100019470(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  const char *v21;
  _BYTE v22[128];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "lastLookupIdentifer"));
  if (v2)
  {
    v3 = (void *)v2;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "lookupCompletionHandlers"));
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "lookupCompletionHandlers"));
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v17;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v17 != v9)
              objc_enumerationMutation(v6);
            v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v10);
            v12 = CarGeneralLogging(v7);
            v13 = objc_claimAutoreleasedReturnValue(v12);
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v21 = "-[CRCarPlayCapabilitiesManager persistCarCapabilitiesIfNeeded]_block_invoke";
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: Invoking lookupFinishedCompletion callback", buf, 0xCu);
            }

            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "lastLookupIdentifer"));
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "carCapabilities"));
            (*(void (**)(uint64_t, void *, void *))(v11 + 16))(v11, v14, v15);

            v10 = (char *)v10 + 1;
          }
          while (v8 != v10);
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
          v8 = v7;
        }
        while (v7);
      }

      objc_msgSend(WeakRetained, "setLookupCompletionHandlers:", 0);
    }
  }

}

void sub_1000196FC(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_100019710(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  CRVehicleStore *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  char *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  int v52;
  uint64_t v53;
  NSObject *v54;
  _BOOL4 v55;
  void *v56;
  uint64_t v57;
  NSObject *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  NSObject *v70;
  void *v71;
  id v72;
  void *v73;
  int v74;
  const char *v75;
  __int16 v76;
  id v77;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "stateMachine"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "carCapabilities"));
  v4 = objc_msgSend(v3, "disabledFeature");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CARPrototypePref nowPlayingAlbumArt](CARPrototypePref, "nowPlayingAlbumArt"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "value"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CARPrototypePref nowPlayingAlbumArt](CARPrototypePref, "nowPlayingAlbumArt"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "value"));
    v9 = objc_msgSend(v8, "integerValue");

    if (v9 == (id)-1)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "stateMachine"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "carCapabilities"));
      v9 = objc_msgSend(v15, "nowPlayingAlbumArtMode");

      v17 = CarGeneralLogging(v16);
      v13 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        sub_10006A49C();
      v11 = 0;
    }
    else
    {
      v11 = (uint64_t)v9 > 0;
      v12 = CarGeneralLogging(v10);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        sub_10006A508();
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "carCapabilities"));
    v19 = objc_msgSend(v18, "nowPlayingAlbumArtMode");

    if (v19 != v9)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "carCapabilities"));
      objc_msgSend(v20, "setNowPlayingAlbumArtMode:", v9);

    }
  }
  else
  {
    v11 = 0;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "carCapabilities"));
  v22 = objc_msgSend(v21, "nowPlayingAlbumArtMode");

  if (!v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[CARPrototypePref nowPlayingAlbumArt](CARPrototypePref, "nowPlayingAlbumArt"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "defaultValue"));
    v25 = objc_msgSend(v24, "integerValue");

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "carCapabilities"));
    v27 = objc_msgSend(v26, "nowPlayingAlbumArtMode");

    if (v27 != v25)
    {
      v29 = CarGeneralLogging(v28);
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        sub_10006A42C(v30, v31, v32, v33, v34, v35, v36, v37);

      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "carCapabilities"));
      objc_msgSend(v38, "setNowPlayingAlbumArtMode:", v25);

    }
  }
  v39 = objc_alloc_init(CRVehicleStore);
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "MFiCertificateSerialNumber"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[CRVehicleStore vehicleForCertificateSerial:](v39, "vehicleForCertificateSerial:", v40));

  if (!v11)
  {
    if ((v4 & 1) == 0 && v41)
    {
      v43 = (char *)objc_msgSend(v41, "albumArtUserPreference");
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "carCapabilities"));
      v45 = v44;
      if ((unint64_t)(v43 - 1) > 1)
      {
        objc_msgSend(v41, "setAlbumArtUserPreference:", objc_msgSend(v44, "nowPlayingAlbumArtMode"));

        v46 = -[CRVehicleStore saveVehicle:](v39, "saveVehicle:", v41);
      }
      else
      {
        objc_msgSend(v44, "setNowPlayingAlbumArtMode:", v43);

      }
    }
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "countryCode"));

    if (!v48)
    {
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectForKey:", NSLocaleCountryCode));

    }
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", &off_1000BF1B8));
    v51 = objc_msgSend(v50, "containsObject:", v48);
    v52 = (int)v51;
    v53 = CarGeneralLogging(v51);
    v54 = objc_claimAutoreleasedReturnValue(v53);
    v55 = os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG);
    if (v52)
    {
      if (v55)
        sub_10006A354();

      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "carCapabilities"));
      objc_msgSend(v56, "setNowPlayingAlbumArtMode:", 1);

      v54 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "carCapabilities"));
      -[NSObject setDisabledFeature:](v54, "setDisabledFeature:", (unint64_t)-[NSObject disabledFeature](v54, "disabledFeature") | 1);
    }
    else if (v55)
    {
      sub_10006A3C0();
    }

  }
  v57 = CarGeneralLogging(v42);
  v58 = objc_claimAutoreleasedReturnValue(v57);
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "carCapabilities"));
    v74 = 136315394;
    v75 = "-[CRCarPlayCapabilitiesManager reconcileCapabilities]_block_invoke";
    v76 = 2048;
    v77 = objc_msgSend(v59, "nowPlayingAlbumArtMode");
    _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "%s: CarCapabilities final album art value: %ld", (uint8_t *)&v74, 0x16u);

  }
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained[2], "configuration"));
  v61 = objc_msgSend(v60, "defaultUserInterfaceStyle");

  if (v61 != (id)-1)
  {
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "carCapabilities"));
    objc_msgSend(v62, "setUserInterfaceStyle:", v61);

  }
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[CARPrototypePref interfaceStyle](CARPrototypePref, "interfaceStyle"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "value"));

  if (v64)
  {
    v65 = (void *)objc_claimAutoreleasedReturnValue(+[CARPrototypePref interfaceStyle](CARPrototypePref, "interfaceStyle"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "value"));
    v67 = objc_msgSend(v66, "integerValue");

    v69 = CarGeneralLogging(v68);
    v70 = objc_claimAutoreleasedReturnValue(v69);
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      v74 = 136315394;
      v75 = "-[CRCarPlayCapabilitiesManager reconcileCapabilities]_block_invoke";
      v76 = 2048;
      v77 = v67;
      _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "%s: CarCapabilities interfaceStyle CARPrototypePref.interfaceStyle=%ld", (uint8_t *)&v74, 0x16u);
    }

    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "carCapabilities"));
    v72 = objc_msgSend(v71, "userInterfaceStyle");

    if (v72 != v67)
    {
      v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "carCapabilities"));
      objc_msgSend(v73, "setUserInterfaceStyle:", v67);

    }
  }
  objc_msgSend(WeakRetained, "persistCarCapabilitiesIfNeeded");

}

void sub_100019DD4(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_100019DE8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "lastLookupIdentifer"));

    if (v2)
    {
      v3 = *(_QWORD *)(a1 + 32);
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "lastLookupIdentifer"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "carCapabilities"));
      (*(void (**)(uint64_t, void *, void *))(v3 + 16))(v3, v4, v5);

      objc_msgSend(WeakRetained, "persistCarCapabilitiesIfNeeded");
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "lookupCompletionHandlers"));

      if (!v6)
      {
        v8 = (void *)objc_opt_new(NSMutableArray, v7);
        objc_msgSend(WeakRetained, "setLookupCompletionHandlers:", v8);

      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "lookupCompletionHandlers"));
      v10 = objc_retainBlock(*(id *)(a1 + 32));
      objc_msgSend(v9, "addObject:", v10);

      objc_msgSend(WeakRetained, "_worker_queue_runStateMachineIfPossible");
    }
  }

}

void sub_10001A00C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_10001A01C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_10001A1D0(id a1, NSError *a2)
{
  NSError *v2;
  uint64_t v3;
  NSObject *v4;

  v2 = a2;
  v3 = CarPairingLogging(v2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_10006A5B4((uint64_t)v2, v4);

}

void sub_10001A2D0(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint8_t v7[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = CarPairingLogging(WeakRetained);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "presenter is ready", v7, 2u);
  }

  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "sessionDelegate"));
  v6 = (void *)v5;
  if (v5 && (objc_opt_respondsToSelector(v5, "presenterSessionDidBecomeReady:") & 1) != 0)
    objc_msgSend(v6, "presenterSessionDidBecomeReady:", WeakRetained);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_10001A44C(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint8_t v7[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = CarPairingLogging(WeakRetained);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "presenter did dismiss", v7, 2u);
  }

  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "dismissHandler"));
  v6 = (void *)v5;
  if (v5)
    (*(void (**)(uint64_t))(v5 + 16))(v5);
  objc_msgSend(WeakRetained, "setDismissHandler:", 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t sub_10001A5F4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10001A604(uint64_t a1)
{

}

void sub_10001A60C(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "assetProgress"));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v7 = CarPairingLogging(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v10 = 138412290;
    v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "returning asset progress to presenter: %@", (uint8_t *)&v10, 0xCu);
  }

}

void sub_10001A7C0(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001A844;
  v5[3] = &unk_1000B5858;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(a2, "presentBluetoothConfirmationPromptForVehicleName:numericCode:responseHandler:", v3, v4, v5);

}

void sub_10001A844(uint64_t a1, char a2)
{
  _QWORD v2[4];
  id v3;
  char v4;

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10001A8B0;
  v2[3] = &unk_1000B5830;
  v4 = a2;
  v3 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);

}

uint64_t sub_10001A8B0(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  const __CFString *v4;
  uint64_t result;
  int v6;
  const __CFString *v7;

  v2 = CarPairingLogging(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    if (*(_BYTE *)(a1 + 40))
      v4 = CFSTR("YES");
    else
      v4 = CFSTR("NO");
    v6 = 138543362;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "received response for Bluetooth confirmation prompt: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  return result;
}

void sub_10001AA08(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001AA78;
  v3[3] = &unk_1000B5858;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "presentBluetoothContactsSyncPromptWithResponseHandler:", v3);

}

void sub_10001AA78(uint64_t a1, char a2)
{
  _QWORD v2[4];
  id v3;
  char v4;

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10001AAE4;
  v2[3] = &unk_1000B5830;
  v4 = a2;
  v3 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);

}

uint64_t sub_10001AAE4(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  const __CFString *v4;
  uint64_t result;
  int v6;
  const __CFString *v7;

  v2 = CarPairingLogging(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    if (*(_BYTE *)(a1 + 40))
      v4 = CFSTR("YES");
    else
      v4 = CFSTR("NO");
    v6 = 138543362;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "received response for Bluetooth contacts sync prompt: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  return result;
}

void sub_10001AC6C(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v3 = *(unsigned __int8 *)(a1 + 48);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001ACF0;
  v5[3] = &unk_1000B5628;
  v4 = *(_QWORD *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(a2, "presentBluetoothFailedPromptForVehicleName:isTimeout:responseHandler:", v4, v3, v5);

}

void sub_10001ACF0(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001AD58;
  block[3] = &unk_1000B5628;
  v2 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

uint64_t sub_10001AD58(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t result;
  uint8_t v5[16];

  v2 = CarPairingLogging(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "received response for Bluetooth failed prompt", v5, 2u);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_10001AE04(id a1, CRSetupPromptPresenterService *a2)
{
  -[CRSetupPromptPresenterService presentWaitingPrompt](a2, "presentWaitingPrompt");
}

void sub_10001AEBC(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001AF30;
  v4[3] = &unk_1000B5858;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "presentAllowWhileLockedPromptForVehicleName:responseHandler:", v3, v4);

}

void sub_10001AF30(uint64_t a1, char a2)
{
  _QWORD v2[4];
  id v3;
  char v4;

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10001AF9C;
  v2[3] = &unk_1000B5830;
  v4 = a2;
  v3 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);

}

uint64_t sub_10001AF9C(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  const __CFString *v4;
  uint64_t result;
  int v6;
  const __CFString *v7;

  v2 = CarPairingLogging(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    if (*(_BYTE *)(a1 + 40))
      v4 = CFSTR("YES");
    else
      v4 = CFSTR("NO");
    v6 = 138543362;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "received response for allow while locked prompt: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  return result;
}

void sub_10001B108(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v3 = *(unsigned __int8 *)(a1 + 48);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001B18C;
  v5[3] = &unk_1000B5858;
  v4 = *(_QWORD *)(a1 + 40);
  v6 = *(id *)(a1 + 32);
  objc_msgSend(a2, "presentConnectPromptWithBluetoothOnlyOption:wirelessEnablement:responseHandler:", v3, v4, v5);

}

void sub_10001B18C(uint64_t a1, char a2)
{
  _QWORD v2[4];
  id v3;
  char v4;

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10001B1F8;
  v2[3] = &unk_1000B5830;
  v4 = a2;
  v3 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);

}

uint64_t sub_10001B1F8(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  const __CFString *v4;
  uint64_t result;
  int v6;
  const __CFString *v7;

  v2 = CarPairingLogging(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    if (*(_BYTE *)(a1 + 40))
      v4 = CFSTR("YES");
    else
      v4 = CFSTR("NO");
    v6 = 138543362;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "received response for connect prompt: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  return result;
}

void sub_10001B364(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v4 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001B3E8;
  v5[3] = &unk_1000B5858;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(a2, "presentUseWirelessPromptWithWirelessEnablement:declineVariant:responseHandler:", v4, v3, v5);

}

void sub_10001B3E8(uint64_t a1, char a2)
{
  _QWORD v2[4];
  id v3;
  char v4;

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10001B454;
  v2[3] = &unk_1000B5830;
  v4 = a2;
  v3 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);

}

uint64_t sub_10001B454(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  const __CFString *v4;
  uint64_t result;
  int v6;
  const __CFString *v7;

  v2 = CarPairingLogging(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    if (*(_BYTE *)(a1 + 40))
      v4 = CFSTR("YES");
    else
      v4 = CFSTR("NO");
    v6 = 138543362;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "received response for use wireless prompt: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  return result;
}

void sub_10001B5D4(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001B648;
  v4[3] = &unk_1000B5858;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "presentEnhancedIntegrationPromptForVehicleName:responseHandler:", v3, v4);

}

void sub_10001B648(uint64_t a1, char a2)
{
  _QWORD v2[4];
  id v3;
  char v4;

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10001B6B4;
  v2[3] = &unk_1000B5830;
  v4 = a2;
  v3 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);

}

uint64_t sub_10001B6B4(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  const __CFString *v4;
  uint64_t result;
  int v6;
  const __CFString *v7;

  v2 = CarPairingLogging(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    if (*(_BYTE *)(a1 + 40))
      v4 = CFSTR("YES");
    else
      v4 = CFSTR("NO");
    v6 = 138543362;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "received response for enhanced integration prompt: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  return result;
}

void sub_10001B820(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v3 = *(unsigned __int8 *)(a1 + 48);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001B8A4;
  v5[3] = &unk_1000B5858;
  v4 = *(_QWORD *)(a1 + 40);
  v6 = *(id *)(a1 + 32);
  objc_msgSend(a2, "presentAssetSupportingConnectPromptWithBluetoothOnlyOption:wirelessEnablement:responseHandler:", v3, v4, v5);

}

void sub_10001B8A4(uint64_t a1, char a2)
{
  _QWORD v2[4];
  id v3;
  char v4;

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10001B910;
  v2[3] = &unk_1000B5830;
  v4 = a2;
  v3 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);

}

uint64_t sub_10001B910(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  const __CFString *v4;
  uint64_t result;
  int v6;
  const __CFString *v7;

  v2 = CarPairingLogging(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    if (*(_BYTE *)(a1 + 40))
      v4 = CFSTR("YES");
    else
      v4 = CFSTR("NO");
    v6 = 138543362;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "received response for connect prompt: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  return result;
}

void sub_10001BA7C(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v4 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001BB00;
  v5[3] = &unk_1000B5858;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(a2, "presentAssetSupportingUseWirelessPromptWithWirelessEnablement:declineVariant:responseHandler:", v4, v3, v5);

}

void sub_10001BB00(uint64_t a1, char a2)
{
  _QWORD v2[4];
  id v3;
  char v4;

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10001BB6C;
  v2[3] = &unk_1000B5830;
  v4 = a2;
  v3 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);

}

uint64_t sub_10001BB6C(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  const __CFString *v4;
  uint64_t result;
  int v6;
  const __CFString *v7;

  v2 = CarPairingLogging(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    if (*(_BYTE *)(a1 + 40))
      v4 = CFSTR("YES");
    else
      v4 = CFSTR("NO");
    v6 = 138543362;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "received response for use wireless prompt: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  return result;
}

void sub_10001BDBC(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = *(_QWORD *)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001BE44;
  v6[3] = &unk_1000B59D8;
  v5 = *(id *)(a1 + 48);
  v6[4] = *(_QWORD *)(a1 + 40);
  v7 = v5;
  objc_msgSend(a2, "presentAssetProgressPromptForVehicleName:cancelHandler:", v4, v6);

}

void sub_10001BE44(uint64_t a1, char a2)
{
  id v4;
  _QWORD block[5];
  id v6;
  char v7;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001BEC4;
  block[3] = &unk_1000B59B0;
  v4 = *(id *)(a1 + 40);
  v7 = a2;
  block[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

id sub_10001BEC4(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint8_t v6[16];

  v2 = CarPairingLogging(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "received cancellation from asset progress prompt", v6, 2u);
  }

  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, *(unsigned __int8 *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "_cleanupAssetProgress");
}

void sub_10001C154(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001C1C8;
  v4[3] = &unk_1000B5628;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "presentAssetReadyPromptForVehicleName:confirmationHandler:", v3, v4);

}

void sub_10001C1C8(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001C230;
  block[3] = &unk_1000B5628;
  v2 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

uint64_t sub_10001C230(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t result;
  uint8_t v5[16];

  v2 = CarPairingLogging(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "received confirmation from asset ready prompt", v5, 2u);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_10001C358(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001C3CC;
  v4[3] = &unk_1000B5628;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "presentAssetReadySoonPromptForVehicleName:confirmationHandler:", v3, v4);

}

void sub_10001C3CC(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001C434;
  block[3] = &unk_1000B5628;
  v2 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

uint64_t sub_10001C434(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t result;
  uint8_t v5[16];

  v2 = CarPairingLogging(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "received confirmation from asset ready soon prompt", v5, 2u);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_10001C528(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  double v4;
  double v5;
  id v6;
  double v7;
  double v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "assetProgress"));
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKey:", NSKeyValueChangeOldKey));
    -[NSObject doubleValue](v3, "doubleValue");
    v5 = v4;
    v6 = objc_msgSend(v2, "fractionCompleted");
    v8 = v7;
    v9 = CarPairingLogging(v6);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      sub_10006A668(v10, v5, v8);

    if (objc_msgSend(v2, "isFinished"))
      objc_msgSend(*(id *)(a1 + 32), "_handleAssetProgressFinished");
  }
  else
  {
    v11 = CarPairingLogging(0);
    v3 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_10006A628(v3);
  }

}

void sub_10001C6E0(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001C764;
  v5[3] = &unk_1000B5628;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(a2, "presentSetupCarKeysPromptForVehicleName:carKeyInfo:cancelHandler:", v3, v4, v5);

}

void sub_10001C764(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001C7CC;
  block[3] = &unk_1000B5628;
  v2 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

uint64_t sub_10001C7CC(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t result;
  uint8_t v5[16];

  v2 = CarPairingLogging(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "received cancel for setup car keys prompt", v5, 2u);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_10001CD90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  id *v29;
  id *v30;

  objc_destroyWeak(v30);
  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001CDE4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10001CDF4(uint64_t a1)
{

}

id sub_10001CDFC(uint64_t a1)
{
  CRWirelessPairingServiceSession *v2;
  void *v3;
  void *v4;
  CRWirelessPairingServiceSession *v5;
  uint64_t v6;
  void *v7;

  v2 = [CRWirelessPairingServiceSession alloc];
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bluetoothManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "carPlayPreferences"));
  v5 = -[CRWirelessPairingServiceSession initWithBluetoothManager:preferences:](v2, "initWithBluetoothManager:preferences:", v3, v4);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setDelegate:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentPairingSession:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void sub_10001CE98(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  uint8_t buf[4];
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = CarPairingLogging(WeakRetained);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Pairing service connection interrupted: %@", buf, 0xCu);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001CFA4;
  v7[3] = &unk_1000B5390;
  v5 = *(_QWORD *)(a1 + 32);
  v8 = WeakRetained;
  v9 = v5;
  v6 = WeakRetained;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v7);

}

void sub_10001CFA4(uint64_t a1)
{
  void *v2;
  void *v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "exportedObject"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "currentPairingSession"));
  v4 = objc_msgSend(v2, "isEqual:", v3);

  if (v4)
  {
    v6 = CarPairingLogging(v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      sub_10006A75C();

    objc_msgSend(*(id *)(a1 + 40), "setCurrentPairingSession:", 0);
  }
}

void sub_10001D038(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  uint8_t buf[4];
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = CarPairingLogging(WeakRetained);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Pairing service connection invalidated: %@", buf, 0xCu);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001D144;
  v7[3] = &unk_1000B5390;
  v5 = *(_QWORD *)(a1 + 32);
  v8 = WeakRetained;
  v9 = v5;
  v6 = WeakRetained;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v7);

}

void sub_10001D144(uint64_t a1)
{
  void *v2;
  void *v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "exportedObject"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "currentPairingSession"));
  v4 = objc_msgSend(v2, "isEqual:", v3);

  if (v4)
  {
    v6 = CarPairingLogging(v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      sub_10006A75C();

    objc_msgSend(*(id *)(a1 + 40), "setCurrentPairingSession:", 0);
  }
}

void sub_10001D42C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001D46C(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  id WeakRetained;
  int v5;
  id v6;

  v2 = CarPairingLogging(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v5 = 138412290;
    v6 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "HUP prompt service connection interrupted: %@", (uint8_t *)&v5, 0xCu);

  }
}

void sub_10001D51C(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  id WeakRetained;
  int v5;
  id v6;

  v2 = CarPairingLogging(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v5 = 138412290;
    v6 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "HUP prompt service connection invalidated: %@", (uint8_t *)&v5, 0xCu);

  }
}

void sub_10001DF74(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_10001E268(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001E280(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;

  v4 = a3;
  v5 = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v6 + 24) || !*(_QWORD *)(a1 + 32))
  {
    v7 = CarGeneralLogging(v4);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      sub_10006A9D0(v8, v9, v10, v11, v12, v13, v14, v15);

  }
  else
  {
    *(_BYTE *)(v6 + 24) = 1;
    v16 = CarGeneralLogging(v4);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      sub_10006AA40();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void sub_10001E338(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  const char *v6;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (!*(_BYTE *)(v1 + 24) && *(_QWORD *)(a1 + 32))
  {
    *(_BYTE *)(v1 + 24) = 1;
    v2 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v3 = CarGeneralLogging(v2);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315138;
      v6 = "-[CRCarPlayAppServiceAgent requestCarCapabilitiesStatus:withReply:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: request timed out", (uint8_t *)&v5, 0xCu);
    }

  }
}

void sub_10001E64C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14[16];

  v4 = CarGeneralLogging(a1);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_10006AAAC(v6, v7, v8, v9, v10, v11, v12, v13);

  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CarPlay MobileAssets catalog downloaded", v14, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_queryForUpdatedAsset");
  }
}

void sub_10001E7E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_10001E7F4(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  id v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  void **v34;
  uint64_t v35;
  void (*v36)(uint64_t, uint64_t);
  void *v37;
  uint64_t v38;
  id v39;
  uint8_t buf[16];

  v2 = objc_msgSend(objc_alloc((Class)MAAssetQuery), "initWithType:", CFSTR("com.apple.MobileAsset.CarExperienceAssets"));
  objc_msgSend(v2, "returnTypes:", 2);
  objc_msgSend(v2, "setDoNotBlockBeforeFirstUnlock:", 1);
  v3 = objc_msgSend(v2, "queryMetaDataSync");
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "results"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_1000B5AB8));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "filteredArrayUsingPredicate:", v5));

  v7 = objc_claimAutoreleasedReturnValue(+[MAAsset cr_highestContentVersionAssetInAssets:](MAAsset, "cr_highestContentVersionAssetInAssets:", v6));
  v8 = (void *)v7;
  if (v3)
  {
    if (v3 == (id)2)
    {
      v9 = CarGeneralLogging(v7);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "CarPlay MobileAssets catalog not present", buf, 2u);
      }

      if (v8)
        objc_msgSend(*(id *)(a1 + 32), "_reloadWithAsset:", v8);
      v11 = 0;
LABEL_27:
      objc_msgSend(*(id *)(a1 + 32), "_requestAssetCatalogDownload", v34, v35, v36, v37, v38);
      goto LABEL_28;
    }
    v24 = CarGeneralLogging(v7);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_10006AADC((uint64_t)v3, v25);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.carkit.app"), 1, 0));
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastFetchDate"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v14 = +[CARAnalytics calendarUnitsOfType:fromDate:toDate:](CARAnalytics, "calendarUnitsOfType:fromDate:toDate:", 128, v12, v13);

    if (v14 >= 259201)
    {
      v16 = CarGeneralLogging(v15);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "CarPlay MobileAssets catalog out of date", buf, 2u);
      }

    }
    if (v8)
      objc_msgSend(*(id *)(a1 + 32), "_reloadWithAsset:", v8);
    v18 = objc_msgSend(v4, "count");
    v19 = CarGeneralLogging(v18);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    v21 = v20;
    if (v18)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "CarPlay MobileAssets asset exists but is not downloaded, requesting download", buf, 2u);
      }

      v22 = (void *)objc_claimAutoreleasedReturnValue(+[MAAsset cr_highestContentVersionAssetInAssets:](MAAsset, "cr_highestContentVersionAssetInAssets:", v4));
      if (objc_msgSend(v22, "state") == (id)1)
      {
        v23 = objc_alloc_init((Class)MADownloadOptions);
        objc_msgSend(v23, "setAllowsCellularAccess:", 1);
        v34 = _NSConcreteStackBlock;
        v35 = 3221225472;
        v36 = sub_10001EC2C;
        v37 = &unk_1000B5AE0;
        v38 = *(_QWORD *)(a1 + 32);
        v39 = v22;
        objc_msgSend(v39, "startDownload:then:", v23, &v34);

      }
      v11 = 0;
      if (v14 > 259200)
        goto LABEL_27;
    }
    else
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        sub_10006AB58(v21, v26, v27, v28, v29, v30, v31, v32);

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.carkit.app"), 1, 0));
      if (v14 >= 259201)
        goto LABEL_27;
    }
  }
LABEL_28:
  v33 = *(id *)(a1 + 32);
  objc_sync_enter(v33);
  objc_msgSend(*(id *)(a1 + 32), "setAssetQueryInProgress:", 0);
  objc_sync_exit(v33);

}

void sub_10001EBCC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL sub_10001EBE0(id a1, MAAsset *a2, NSDictionary *a3)
{
  MAAsset *v3;
  BOOL v4;

  v3 = a2;
  v4 = -[MAAsset state](v3, "state") == (id)2 || -[MAAsset state](v3, "state") == (id)6;

  return v4;
}

void sub_10001EC2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v4 = CarGeneralLogging(a1);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v6)
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CarPlay MobileAssets asset download failed", v7, 2u);
    }

  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CarPlay MobileAssets asset download successful", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_reloadWithAsset:", *(_QWORD *)(a1 + 40));
  }
}

void sub_10001F784(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001F79C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10001F7AC(uint64_t a1)
{

}

void sub_10001F7B4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "saveVehicle:", *(_QWORD *)(a1 + 40)));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void sub_10001F8CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10001F8E4(uint64_t a1)
{
  id result;

  result = objc_msgSend(*(id *)(a1 + 32), "removeVehicle:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (_BYTE)result;
  return result;
}

void sub_10001FA10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_10001FAAC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  (*(void (**)(uint64_t, BOOL, id))(v4 + 16))(v4, objc_msgSend(a2, "count") != 0, v5);

}

void sub_10001FCE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_10001FD24(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unsigned int v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id obj;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  NSObject *v44;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "_isRestricted:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  if ((v4 & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "vehicleStore"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "vehicleForBluetoothAddress:", *(_QWORD *)(a1 + 40)));

    if (v6
      && (objc_msgSend(*(id *)(a1 + 32), "_dismissReconnectionEnableWiFiAlertExceptForVehicle:", v6),
          v7 = objc_msgSend(v6, "isPaired"),
          (_DWORD)v7))
    {
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "carplayWiFiUUID"));
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "wifiManager"));
        v13 = objc_msgSend(v12, "hasCredentialsForCarPlayUUID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

        if (v13)
        {
          kdebug_trace(731971992, 0, 0, 0, 0);
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "postInCarNotificationForVehicle:", v6);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "wifiManager"));
          v15 = objc_msgSend(v14, "isPowered");

          if ((v15 & 1) != 0)
          {
LABEL_21:

            return;
          }
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bluetoothManager"));
          v17 = objc_msgSend(v16, "connectedServicesCountForBluetoothAddress:", *(_QWORD *)(a1 + 40));

          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serviceCountDuringAlertForBluetoothAddress"));
          v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", *(_QWORD *)(a1 + 40)));

          v21 = CarGeneralLogging(v20);
          v22 = objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            v23 = *(void **)(a1 + 40);
            v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v17));
            *(_DWORD *)buf = 138413058;
            v38 = v23;
            v39 = 2112;
            v40 = v6;
            v41 = 2112;
            v42 = v24;
            v43 = 2112;
            v44 = v19;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "WiFi disabled for %@ (%@) with current services count %@, previous services count %@", buf, 0x2Au);

          }
          if (!v19 || v17 <= -[NSObject unsignedIntegerValue](v19, "unsignedIntegerValue"))
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_presentedReconnectionEnableWiFiAlertForVehicle:", v6));

            if (v25)
            {
              v27 = CarGeneralLogging(v26);
              v28 = objc_claimAutoreleasedReturnValue(v27);
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v38 = v6;
                _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Existing enable WiFi alert for %@, cancelling presentation", buf, 0xCu);
              }

            }
            else
            {
              objc_msgSend(*(id *)(a1 + 32), "_presentReconnectionEnableWiFiAlertForVehicle:", v6);
            }
          }
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serviceCountDuringAlertForBluetoothAddress"));
          v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v17));
          objc_msgSend(v34, "setObject:forKey:", v35, *(_QWORD *)(a1 + 40));

LABEL_20:
          goto LABEL_21;
        }
      }
      v32 = CarGeneralLogging(v11);
      v19 = objc_claimAutoreleasedReturnValue(v32);
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        goto LABEL_20;
      v33 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v38 = v33;
      v31 = "skipping fast-reconnection with %@, no Wi-Fi credentials";
    }
    else
    {
      v29 = CarGeneralLogging(v7);
      v19 = objc_claimAutoreleasedReturnValue(v29);
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        goto LABEL_20;
      v30 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v38 = v30;
      v31 = "skipping fast-reconnection with %@, not a known & enabled CarPlay vehicle";
    }
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v31, buf, 0xCu);
    goto LABEL_20;
  }
}

void sub_1000201BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000201D4(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "vehicleStore"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "vehicleForBluetoothAddress:", *(_QWORD *)(a1 + 40)));

  if (v4)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 32), "_dismissReconnectionEnableWiFiAlertForVehicle:", v4);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serviceCountDuringAlertForBluetoothAddress"));
  objc_msgSend(v3, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

}

void sub_100020384(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1000203B4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  id obj;
  uint8_t buf[4];
  int v16;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "_isRestricted:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  if ((v4 & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pairedVehiclesConnectedOnBluetooth"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "anyObject"));
    v7 = v6;
    if (v6)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "carplayWiFiUUID"));
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

    }
    v11 = CarGeneralLogging(v6);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      *(_DWORD *)buf = 67109120;
      v16 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "isBluetoothInCar %i", buf, 8u);
    }

  }
}

void sub_10002060C(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unsigned int v8;
  id v9;
  void *v10;
  void *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  id obj;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  uint64_t v21;

  v2 = CarGeneralLogging(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v19 = v4;
    v20 = 2112;
    v21 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "handleBluetoothClassicPairingCompletedForDeviceAddress: %@ name: %@", buf, 0x16u);
  }

  v6 = *(void **)(a1 + 48);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v7 + 40);
  v8 = objc_msgSend(v6, "_isRestricted:", &obj);
  objc_storeStrong((id *)(v7 + 40), obj);
  if (v8)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v9 = objc_msgSend(objc_alloc((Class)CRVehicle), "initWithIdentifier:certificateSerial:", 0, 0);
    objc_msgSend(v9, "setBluetoothAddress:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v9, "setVehicleName:", *(_QWORD *)(a1 + 40));
    if (*(_BYTE *)(a1 + 72))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "preferencesManager"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "isCarPlaySetupEnabled"));
      v12 = objc_msgSend(v11, "BOOLValue");

      if (v12)
        v13 = 0;
      else
        v13 = 2;
    }
    else
    {
      v13 = 0;
    }
    v14 = CarGeneralLogging(objc_msgSend(v9, "setPairingStatus:", v13));
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Saving vehicle %@ from new BT Classic pairing.", buf, 0xCu);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "saveVehicle:", v9));
    (*(void (**)(_QWORD, BOOL, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v16 != 0, 0);

  }
}

void sub_1000208E4(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  unsigned int v7;
  id v8;
  void *v9;
  CRPairingPromptFlowController *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;

  v2 = CarGeneralLogging(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v18 = v4;
    v19 = 2112;
    v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "startBluetoothLEPairingForIdentifier: %@ name: %@", buf, 0x16u);
  }

  v6 = *(void **)(a1 + 48);
  v16 = 0;
  v7 = objc_msgSend(v6, "_isRestricted:", &v16);
  v8 = v16;
  if (v7)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v9 = *(void **)(a1 + 48);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100020ABC;
    v13[3] = &unk_1000B5C20;
    v14 = *(id *)(a1 + 32);
    v15 = *(id *)(a1 + 56);
    objc_msgSend(v9, "setCurrentBluetoothPairingCompletion:", v13);
    v10 = objc_alloc_init(CRPairingPromptFlowController);
    -[CRPairingPromptFlowController setPromptDelegate:](v10, "setPromptDelegate:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 48), "setCurrentPromptFlowController:", v10);
    -[CRPairingPromptFlowController handleBluetoothPairingStartedForDeviceIdentifier:showBluetoothOnlyOption:](v10, "handleBluetoothPairingStartedForDeviceIdentifier:showBluetoothOnlyOption:", *(_QWORD *)(a1 + 32), 0);
    v11 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", *(_QWORD *)(a1 + 32));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "messagingConnector"));
    objc_msgSend(v12, "pairWithBluetoothLEIdentifier:deviceName:", v11, *(_QWORD *)(a1 + 40));

  }
}

void sub_100020ABC(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  uint64_t *v9;
  id v10;
  char v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  _BOOL4 v15;
  uint64_t v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  id v27;

  v7 = a2;
  v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v9 = (uint64_t *)(a1 + 32);
  v10 = objc_msgSend(*(id *)(a1 + 32), "isEqual:", v7);
  v11 = (char)v10;
  v12 = CarPairingLogging(v10);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = v13;
  if ((v11 & 1) != 0)
  {
    v15 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)a3)
    {
      if (v15)
      {
        v16 = *v9;
        v22 = 141558275;
        v23 = 1752392040;
        v24 = 2113;
        v25 = v16;
        v17 = "pairing succeeded for %{private, mask.hash}@";
        v18 = v14;
        v19 = 22;
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v22, v19);
      }
    }
    else if (v15)
    {
      v20 = *v9;
      v22 = 141558531;
      v23 = 1752392040;
      v24 = 2113;
      v25 = v20;
      v26 = 2112;
      v27 = v8;
      v17 = "pairing failed for %{private, mask.hash}@, error: %@";
      v18 = v14;
      v19 = 32;
      goto LABEL_10;
    }

    (*(void (**)(_QWORD, uint64_t, id, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a3, v8, v21);
    goto LABEL_12;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    sub_10006ACE8();

LABEL_12:
}

void sub_100020D48(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  id v5;
  void *v6;
  unsigned int v7;
  void *v8;
  CRPairingPromptFlowController *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;

  v2 = CarGeneralLogging(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 141558275;
    v19 = 1752392040;
    v20 = 2113;
    v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "startBluetoothClassicPairingForDeviceAddress: %{private, mask.hash}@", buf, 0x16u);
  }

  if (*(_BYTE *)(a1 + 64))
  {
    v5 = 0;
  }
  else
  {
    v6 = *(void **)(a1 + 40);
    v17 = 0;
    v7 = objc_msgSend(v6, "_isRestricted:", &v17);
    v5 = v17;
    if (v7)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      goto LABEL_11;
    }
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100020F2C;
  v14[3] = &unk_1000B5C20;
  v8 = *(void **)(a1 + 40);
  v15 = *(id *)(a1 + 32);
  v16 = *(id *)(a1 + 56);
  objc_msgSend(v8, "setCurrentBluetoothPairingCompletion:", v14);
  v9 = objc_alloc_init(CRPairingPromptFlowController);
  -[CRPairingPromptFlowController setPromptDelegate:](v9, "setPromptDelegate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "setCurrentPromptFlowController:", v9);
  -[CRPairingPromptFlowController handleBluetoothPairingStartedForDeviceIdentifier:showBluetoothOnlyOption:](v9, "handleBluetoothPairingStartedForDeviceIdentifier:showBluetoothOnlyOption:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 64));
  v10 = *(_QWORD *)(a1 + 48);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "bluetoothManager"));
  v12 = v11;
  v13 = *(_QWORD *)(a1 + 32);
  if (v10)
    objc_msgSend(v11, "confirmPairingWithBluetoothAddress:numericCode:", v13, *(_QWORD *)(a1 + 48));
  else
    objc_msgSend(v11, "pairWithBluetoothAddress:", v13);

LABEL_11:
}

void sub_100020F2C(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  uint64_t *v9;
  id v10;
  char v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  _BOOL4 v15;
  uint64_t v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  id v27;

  v7 = a2;
  v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v9 = (uint64_t *)(a1 + 32);
  v10 = objc_msgSend(*(id *)(a1 + 32), "isEqual:", v7);
  v11 = (char)v10;
  v12 = CarPairingLogging(v10);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = v13;
  if ((v11 & 1) != 0)
  {
    v15 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)a3)
    {
      if (v15)
      {
        v16 = *v9;
        v22 = 141558275;
        v23 = 1752392040;
        v24 = 2113;
        v25 = v16;
        v17 = "pairing succeeded for %{private, mask.hash}@";
        v18 = v14;
        v19 = 22;
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v22, v19);
      }
    }
    else if (v15)
    {
      v20 = *v9;
      v22 = 141558531;
      v23 = 1752392040;
      v24 = 2113;
      v25 = v20;
      v26 = 2112;
      v27 = v8;
      v17 = "pairing failed for %{private, mask.hash}@, error: %@";
      v18 = v14;
      v19 = 32;
      goto LABEL_10;
    }

    (*(void (**)(_QWORD, uint64_t, id, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a3, v8, v21);
    goto LABEL_12;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    sub_10006ACE8();

LABEL_12:
}

void sub_10002118C(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  unsigned int v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  BOOL v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  void *v50;
  id v51;
  uint64_t v52;
  id v53;
  void *v54;
  uint64_t v55;
  id v56;
  void *v57;
  id v58;
  id v59;
  uint64_t v60;
  NSObject *v61;
  void *v62;
  uint64_t v63;
  NSObject *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  NSObject *v68;
  uint64_t v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  _QWORD v77[5];
  id v78;
  id v79;
  uint64_t *v80;
  uint64_t *v81;
  __int128 *p_buf;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t (*v86)(uint64_t, uint64_t);
  void (*v87)(uint64_t);
  id v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  char v92;
  id v93;
  uint8_t v94[4];
  void *v95;
  __int128 buf;
  uint64_t v97;
  uint64_t (*v98)(uint64_t, uint64_t);
  void (*v99)(uint64_t);
  id v100;

  v2 = CarGeneralLogging(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CarPlay connection request startSessionProperties: %@", (uint8_t *)&buf, 0xCu);
  }

  if (*(_QWORD *)(a1 + 32))
  {
    v6 = *(void **)(a1 + 40);
    v93 = 0;
    v7 = objc_msgSend(v6, "_isRestricted:", &v93);
    v8 = v93;
    v76 = v8;
    if (v7)
    {
      v9 = CarGeneralLogging(v8);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_10006AD74();

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "messagingConnector"));
      v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "vehicleAccessoryForiAPConnectionIdentifier:", *(unsigned int *)(a1 + 56)));

      if (!v75)
      {
        v15 = CarGeneralLogging(v14);
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          sub_10006ADA0();

        v17 = *(_QWORD *)(a1 + 48);
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.carkit"), 3, 0));
        (*(void (**)(uint64_t, _QWORD, void *))(v17 + 16))(v17, 0, v18);

      }
      v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("SSID_STR"), CFSTR("password"), CFSTR("CHANNEL"), 0));
      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "setByAddingObject:", CFSTR("securityType")));
      v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "cr_dictionaryWithValuesForPresentKeys:", v72));
      v89 = 0;
      v90 = &v89;
      v91 = 0x2020000000;
      v92 = 0;
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v97 = 0x3032000000;
      v98 = sub_10001F79C;
      v99 = sub_10001F7AC;
      v100 = 0;
      v83 = 0;
      v84 = &v83;
      v85 = 0x3032000000;
      v86 = sub_10001F79C;
      v87 = sub_10001F7AC;
      v88 = 0;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "allKeys"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v19));
      v21 = objc_msgSend(v74, "isSubsetOfSet:", v20);

      if (v21)
      {
        v23 = *(void **)(a1 + 40);
        v77[0] = _NSConcreteStackBlock;
        v77[1] = 3221225472;
        v77[2] = sub_100021B08;
        v77[3] = &unk_1000B5CC0;
        v81 = &v83;
        v80 = &v89;
        v77[4] = v23;
        v78 = v73;
        v79 = v75;
        p_buf = &buf;
        objc_msgSend(v23, "_findWirelessPairedVehicleForMessagingVehicle:result:", v79, v77);

      }
      else
      {
        v24 = CarGeneralLogging(v22);
        v25 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v94 = 138412290;
          v95 = v73;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Start session without Wi-Fi credentials: %@", v94, 0xCu);
        }

      }
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObjects:](NSMutableSet, "setWithObjects:", CFSTR("wiredIPAddresses"), CFSTR("port"), CFSTR("deviceID"), CFSTR("publicKey"), CFSTR("sourceVersion"), 0));
      v27 = v26;
      if (*((_BYTE *)v90 + 24))
        objc_msgSend(v26, "addObject:", CFSTR("wirelessIPAddresses"));
      objc_msgSend(v27, "addObject:", CFSTR("supportsMutualAuth"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "cr_dictionaryWithValuesForPresentKeys:", v27));
      v29 = objc_msgSend(v28, "mutableCopy");

      v31 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      if (v31)
        objc_msgSend(v29, "setObject:forKey:", v31, CFSTR("carplayWiFiUUID"));
      v32 = CRLocalizedStringForKey(CFSTR("CARPLAY"), v30);
      v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
      objc_msgSend(v29, "setObject:forKey:", v33, CFSTR("displayName"));

      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "certificateSerialNumber"));
      if (v34)
        objc_msgSend(v29, "setObject:forKey:", v34, CFSTR("authenticationCertificateSerial"));
      v35 = (void *)v84[5];
      if (v35)
        goto LABEL_66;
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "vehicleStore"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "certificateSerialNumber"));
      v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "vehicleForCertificateSerial:", v37));
      v39 = (void *)v84[5];
      v84[5] = v38;

      v35 = (void *)v84[5];
      if (v35)
      {
LABEL_66:
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "identifier"));
        v41 = v40 == 0;

        if (!v41)
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v84[5], "identifier"));
          objc_msgSend(v29, "setObject:forKey:", v42, CFSTR("pairedVehicleIdentifier"));

        }
      }
      v43 = objc_msgSend(*(id *)(a1 + 40), "carPlaySimulatorActive");
      v44 = objc_msgSend(objc_alloc((Class)CARSessionRequestHost), "initWithHostProperties:", v29);
      objc_msgSend(v44, "setWiredCarPlaySimulator:", v43);
      objc_msgSend(*(id *)(a1 + 40), "_mainQueue_startSessionForHost:reply:", v44, *(_QWORD *)(a1 + 48));
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "featuresAvailabilityAgent"));
      v46 = (unint64_t)objc_msgSend(v45, "deviceSupportedCarPlayFeatures");

      v47 = CRCarPlayFeaturesAllFerriteFeatures();
      if ((v47 & v46) == CRCarPlayFeaturesAllFerriteFeatures())
      {
        v48 = objc_opt_class(NSString);
        v49 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("clusterAssetIdentifer")));
        v50 = v49;
        if (v49 && (objc_opt_isKindOfClass(v49, v48) & 1) != 0)
          v51 = v50;
        else
          v51 = 0;

        v52 = objc_opt_class(NSNumber);
        v53 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("clusterAssetVersion")));
        v54 = v53;
        if (v53 && (objc_opt_isKindOfClass(v53, v52) & 1) != 0)
          v71 = v54;
        else
          v71 = 0;

        v55 = objc_opt_class(NSString);
        v56 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("SDKVersion")));
        v57 = v56;
        if (v56 && (objc_opt_isKindOfClass(v56, v55) & 1) != 0)
          v58 = v57;
        else
          v58 = 0;

        if (v51)
        {
          if (objc_msgSend(v51, "length"))
          {
            if (v71)
            {
              if (v58)
              {
                v59 = objc_msgSend(v58, "length");
                if (v59)
                {
                  v60 = CarGeneralLogging(v59);
                  v61 = objc_claimAutoreleasedReturnValue(v60);
                  if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)v94 = 0;
                    _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_INFO, "start session message has asset information", v94, 2u);
                  }

                  if ((_DWORD)v43)
                  {
                    v62 = (void *)v84[5];
                    if (!v62)
                    {
                      v63 = CarPairingLogging(0);
                      v64 = objc_claimAutoreleasedReturnValue(v63);
                      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)v94 = 0;
                        _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "creating a pairing for a simulated asset-supporting session", v94, 2u);
                      }

                      v65 = objc_claimAutoreleasedReturnValue(+[CRVehicle vehicleForMessagingVehicle:](CRVehicle, "vehicleForMessagingVehicle:", v75));
                      v66 = (void *)v84[5];
                      v84[5] = v65;

                      v62 = (void *)v84[5];
                    }
                    if (!objc_msgSend(v62, "pairingStatus"))
                    {
                      v67 = CarPairingLogging(0);
                      v68 = objc_claimAutoreleasedReturnValue(v67);
                      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)v94 = 0;
                        _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "accepting the pairing for a simulated asset-supporting session", v94, 2u);
                      }

                      objc_msgSend((id)v84[5], "setPairingStatus:", 2);
                    }
                    v69 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "saveVehicle:", v84[5]));
                    v70 = (void *)v84[5];
                    v84[5] = v69;

                  }
                  objc_msgSend(*(id *)(a1 + 40), "_mainQueue_updateClusterAssetIdentifier:assetVersion:sdkVersion:forVehicle:", v51, v71, v58, v84[5]);
                }
              }
            }
          }
        }

      }
      _Block_object_dispose(&v83, 8);

      _Block_object_dispose(&buf, 8);
      _Block_object_dispose(&v89, 8);

    }
  }
  else
  {
    v11 = CarGeneralLogging(v5);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_10006AD48();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void sub_100021A98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  uint64_t v36;

  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v36 - 160), 8);
  _Block_object_dispose(&a36, 8);
  _Unwind_Resume(a1);
}

void sub_100021B08(_QWORD *a1, void *a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  NSObject *v12;
  uint64_t v13;
  uint8_t buf[4];
  void *v15;

  v4 = a2;
  if (v4)
  {
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
    objc_storeStrong((id *)(*(_QWORD *)(a1[8] + 8) + 40), a2);
    v5 = (void *)a1[4];
    v6 = a1[5];
    v7 = a1[6];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100021C68;
    v11[3] = &unk_1000B5C98;
    v13 = a1[9];
    v12 = v4;
    objc_msgSend(v5, "_saveWiFiCredentials:fromMessagingVehicle:forWirelessPairedVehicle:result:", v6, v7, v12, v11);
    v8 = v12;
  }
  else
  {
    v9 = CarGeneralLogging(0);
    v8 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)a1[6], "vehicleName"));
      *(_DWORD *)buf = 138412290;
      v15 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "not saving WiFi credentials, not a wireless paired vehicle: %@", buf, 0xCu);

    }
  }

}

void sub_100021C68(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v6 = a2;
  v7 = a3;
  v8 = v7;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  else
  {
    v9 = CarGeneralLogging(v7);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10006AE08();

    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "carplayWiFiUUID"));
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
}

void sub_100021EA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_100021ECC(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  id obj;
  _BYTE v18[128];

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "_isRestricted:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagingConnector"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "connectedVehicles"));

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allObjects", 0));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v12, "transportType") == (id)1
            && objc_msgSend(v12, "supportsUSBCarPlay")
            && (objc_msgSend(v12, "supportsCarPlayConnectionRequest") & 1) == 0)
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
            goto LABEL_15;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_15:

  }
}

void sub_100022184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1000221A8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id obj;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *(void **)(a1 + 40);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    obj = *(id *)(v3 + 40);
    v4 = objc_msgSend(v2, "_isRestricted:", &obj);
    objc_storeStrong((id *)(v3 + 40), obj);
    if (v4)
    {
      v6 = CarGeneralLogging(v5);
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v32 = v8;
        v9 = "wantsCarPlayControlAdvertisingForWiFiUUID:%@ CarPlay restricted";
        v10 = v7;
        v11 = 12;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
        goto LABEL_25;
      }
      goto LABEL_25;
    }
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "pairedVehiclesConnectedOnBluetooth"));
    v13 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    if (!v13)
      goto LABEL_25;
    v14 = v13;
    v15 = *(_QWORD *)v27;
LABEL_10:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v15)
        objc_enumerationMutation(v7);
      v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v16);
      if (!v17)
        goto LABEL_20;
      v18 = *(void **)(a1 + 32);
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v16), "carplayWiFiUUID"));
      if ((objc_msgSend(v18, "isEqualToString:", v19) & 1) == 0)
        break;
      v20 = objc_msgSend(v17, "requiresBonjour");

      if (!v20)
        goto LABEL_20;
      v21 = CarGeneralLogging(v13);
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "wantsCarPlayControlAdvertisingForWiFiUUID: yes", buf, 2u);
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
LABEL_23:
      if (v14 == (id)++v16)
      {
        v13 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
        v14 = v13;
        if (!v13)
          goto LABEL_25;
        goto LABEL_10;
      }
    }

LABEL_20:
    v23 = CarGeneralLogging(v13);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v32 = v25;
      v33 = 2112;
      v34 = v17;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "wantsCarPlayControlAdvertisingForWiFiUUID:%@ didn't match criteria for vehicle %@", buf, 0x16u);
    }

    goto LABEL_23;
  }
  v12 = CarGeneralLogging(a1);
  v7 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v9 = "wantsCarPlayControlAdvertisingForWiFiUUID: nil UUID";
    v10 = v7;
    v11 = 2;
    goto LABEL_7;
  }
LABEL_25:

}

void sub_100022630(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id sub_100022660(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  _QWORD v5[4];
  __int128 v6;

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 64);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000226C0;
  v5[3] = &unk_1000B5D38;
  v6 = *(_OWORD *)(a1 + 48);
  return objc_msgSend(v2, "_saveWiFiCredentials:forAccessoryConnectionIdentifier:result:", v1, v3, v5);
}

void sub_1000226C0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void **v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (v10)
  {
    v6 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v7 = v10;
  }
  else
  {
    v6 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v7 = v5;
  }
  v8 = v7;
  v9 = *v6;
  *v6 = v8;

}

void sub_10002285C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_100022880(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  unsigned int v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  id obj;
  _BYTE v20[128];

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "_isRestricted:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }
  else if (*(_QWORD *)(a1 + 40))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "vehicleStore", 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allStoredVehicles"));

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          v12 = *(void **)(a1 + 40);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "carplayWiFiUUID"));
          if (objc_msgSend(v12, "isEqualToString:", v13))
          {
            v14 = objc_msgSend(v11, "isPaired");

            if (v14)
            {
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
              goto LABEL_15;
            }
          }
          else
          {

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v8);
    }
LABEL_15:

  }
}

void sub_100022B50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_100022B74(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  unsigned int v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  id obj;
  _BYTE v19[128];

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "_isRestricted:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4 || !*(_QWORD *)(a1 + 40))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "vehicleStore", 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allStoredVehicles"));

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          v12 = *(void **)(a1 + 40);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "certificateSerialNumber"));
          LODWORD(v12) = objc_msgSend(v12, "isEqualToData:", v13);

          if ((_DWORD)v12)
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_isVehicleActionable:", v11);
            goto LABEL_14;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_14:

  }
}

void sub_100022E38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_100022E5C(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  id obj;
  _BYTE v19[128];

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "_isRestricted:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  if ((v4 & 1) == 0 && *(_QWORD *)(a1 + 40))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "vehicleStore", 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allStoredVehicles"));

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          v12 = *(void **)(a1 + 40);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "certificateSerialNumber"));
          LODWORD(v12) = objc_msgSend(v12, "isEqualToData:", v13);

          if ((_DWORD)v12)
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v11, "isPaired");
            goto LABEL_13;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_13:

  }
}

void sub_10002310C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_100023130(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  id obj;
  _BYTE v19[128];

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "_isRestricted:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  if ((v4 & 1) == 0 && *(_QWORD *)(a1 + 40))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "vehicleStore", 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allStoredVehicles"));

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          v12 = *(void **)(a1 + 40);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "certificateSerialNumber"));
          LODWORD(v12) = objc_msgSend(v12, "isEqualToData:", v13);

          if ((_DWORD)v12)
          {
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v11, "enhancedIntegrationStatus");
            goto LABEL_13;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_13:

  }
}

id sub_100023334(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleCarPlayAllowedDidChange");
}

void sub_1000234A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000234BC(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "featuresAvailabilityAgent"));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "deviceSupportedCarPlayFeatures");

}

void sub_100023638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100023654(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "featuresAvailabilityAgent"));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "disablesCarPlayFeatures:forVehicleIdentifier:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));

}

void sub_1000237C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000237DC(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "featuresAvailabilityAgent"));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "setCarPlayFeatures:disabled:forVehicleIdentifier:", *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 40));

}

void sub_1000239AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000239D0(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "featuresAvailabilityAgent"));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "supportedCarPlayFeaturesForCertificateSerial:", *(_QWORD *)(a1 + 40));

}

void sub_100023B98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100023BBC(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;

  v2 = objc_claimAutoreleasedReturnValue(+[CRCertificationOverridesServiceAgent nextSessionOverrideAirPlayFeatureStrings](CRCertificationOverridesServiceAgent, "nextSessionOverrideAirPlayFeatureStrings"));
  v3 = (void *)v2;
  if (v2)
  {
    v4 = CarCertificationOverrideLogging(v2);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543362;
      v13 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "one-time applying certification override feature strings: %{public}@", (uint8_t *)&v12, 0xCu);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v3);
    +[CRCertificationOverridesServiceAgent setNextSessionOverrideAirPlayFeatureStrings:](CRCertificationOverridesServiceAgent, "setNextSessionOverrideAirPlayFeatureStrings:", 0);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "featuresAvailabilityAgent"));
    v7 = objc_msgSend(v6, "supportedCarPlayFeaturesForVehicleIdentifier:", *(_QWORD *)(a1 + 40));

    v8 = CRCarPlayFeaturesAsAirPlayFeatures(v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
}

void sub_100023DF8(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  void *i;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  void *v47;
  void *v48;
  id obj;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  _QWORD v55[4];
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[EAAccessoryManager sharedAccessoryManager](EAAccessoryManager, "sharedAccessoryManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "connectedAccessories"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagingConnector"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "connectedVehicles"));

  v48 = v4;
  v7 = objc_msgSend(v4, "count");
  v46 = (unint64_t)v7;
  if ((unint64_t)v7 < 2)
  {
    if (v7 == (id)1)
      objc_msgSend(v2, "appendFormat:", CFSTR("%ld accessory connected:\n\n"), 1);
  }
  else
  {
    objc_msgSend(v2, "appendFormat:", CFSTR("%ld accessories connected:\n\n"), v7);
  }
  v47 = v2;
  v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "vehicleStore"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allStoredVehicles"));

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = 0;
    v50 = *(_QWORD *)v62;
    v52 = 0;
    do
    {
      v13 = 0;
      v14 = v11;
      v15 = v12;
      do
      {
        if (*(_QWORD *)v62 != v50)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "radarDescription"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "analyticsDescription"));

        v18 = a1;
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "vehicleMatchingMessagingVehicle:inVehicles:", v16, v53));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "internalNotes"));
        v21 = objc_msgSend(v20, "length");

        if (v21)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "internalNotes"));
          v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByAppendingFormat:", CFSTR("Notes: %@\n"), v23));

          v17 = (void *)v24;
        }
        if (CRIsInternalInstall(v22))
        {
          v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "assetDescription"));

          v52 = (void *)v25;
        }
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "wallpaperDescription"));

        if ((objc_msgSend(v16, "supportsCarPlayConnectionRequest") & 1) != 0)
        {
          v26 = 1;
        }
        else
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "supportsStartSessionRequest"));
          v26 = (uint64_t)objc_msgSend(v27, "BOOLValue");

        }
        a1 = v18;
        objc_msgSend(v54, "addObject:", v17);

        v13 = (char *)v13 + 1;
        v14 = v11;
        v15 = v12;
      }
      while (v10 != v13);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
    }
    while (v10);
  }
  else
  {
    v52 = 0;
    v11 = 0;
    v26 = 0;
    v12 = 0;
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "componentsJoinedByString:", CFSTR("\n")));
  objc_msgSend(v47, "appendString:", v28);

  if (v46 > (unint64_t)objc_msgSend(obj, "count"))
  {
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v29 = v48;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v31; i = (char *)i + 1)
        {
          if (*(_QWORD *)v58 != v32)
            objc_enumerationMutation(v29);
          v34 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v34, "supportsCarPlay") & 1) == 0)
          {
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "accessoryRadarDescription:", v34));
            objc_msgSend(v47, "appendString:", v35);

          }
        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
      }
      while (v31);
    }

  }
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "loggingChannelManager"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "currentLoggingFileReceiver"));

  v39 = CarGeneralLogging(v38);
  v40 = objc_claimAutoreleasedReturnValue(v39);
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    sub_10006AFD8();

  v41 = (void *)objc_claimAutoreleasedReturnValue(+[CRDiagnosticsService sharedInstance](CRDiagnosticsService, "sharedInstance"));
  objc_msgSend(v41, "setSessionStatus:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
  v51 = *(_QWORD *)(a1 + 40);
  v42 = a1;
  v43 = *(_QWORD *)(a1 + 48);
  v44 = *(_QWORD *)(v42 + 56);
  v45 = *(_QWORD *)(v42 + 64);
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_100024334;
  v55[3] = &unk_1000B5628;
  v56 = *(id *)(v42 + 72);
  objc_msgSend(v41, "collectDiagnosticsWithDeviceScreenshotURL:carScreenshotURL:attachmentURLs:accessoryDetails:accessoryDescription:supportsStartSession:activeBundleIdentifier:wallpaperDescription:assetDescription:loggingFileReceiver:completionHandler:", v51, v43, v44, v12, v47, v26, v45, v11, v52, v37, v55);

}

uint64_t sub_100024334(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_100024558(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_100024664(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint8_t v10[16];
  _QWORD v11[4];
  NSObject *v12;
  id v13;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentPromptFlowController"));
  if (v2)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000247B0;
    v11[3] = &unk_1000B5E50;
    v3 = *(void **)(a1 + 32);
    v12 = *(id *)(a1 + 40);
    v13 = *(id *)(a1 + 64);
    v4 = CarPairingLogging(objc_msgSend(v3, "setCurrentBluetoothConfirmationHandler:", v11));
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "showing numeric confirmation in pairing prompt flow", v10, 2u);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "stringValue"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
    objc_msgSend(v2, "handleBluetoothPairingConfirmationRequestForDeviceIdentifier:vehicleName:numericCode:", v7, *(_QWORD *)(a1 + 56), v6);

    v8 = v12;
  }
  else
  {
    v9 = CarPairingLogging(0);
    v8 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10006B038();
  }

}

void sub_1000247B0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  unsigned __int8 v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const __CFString *v21;

  v5 = a2;
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "UUIDString"));
  v8 = objc_msgSend(v7, "isEqual:", v5);

  v10 = CarPairingLogging(v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if ((v8 & 1) != 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = CFSTR("confirmed");
      v17 = 1752392040;
      v16 = 141558531;
      if (!v6)
        v14 = CFSTR("declined");
      v18 = 2113;
      v19 = v13;
      v20 = 2114;
      v21 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "pairing for %{private, mask.hash}@ was %{public}@", (uint8_t *)&v16, 0x20u);
    }

    v15 = *(_QWORD *)(a1 + 40);
    if (v15)
      (*(void (**)(uint64_t, id, _QWORD))(v15 + 16))(v15, v6, 0);
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_10006B064();

  }
}

void sub_1000249F4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentPromptFlowController"));
  v3 = CarPairingLogging(v2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "showing BLE pairing failure in pairing prompt flow", v6, 2u);
    }

    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
    objc_msgSend(v2, "handleBluetoothPairingFailedForDeviceIdentifier:vehicleName:isTimeout:", v5, *(_QWORD *)(a1 + 48), 0);
    objc_msgSend(*(id *)(a1 + 32), "_invokeCurrentBluetoothPairingCompletionWithDeviceIdentifier:success:error:", v5, 0, *(_QWORD *)(a1 + 56));
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    sub_10006B0C4();
  }

}

void sub_100024B50(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "UUIDString"));
  objc_msgSend(*(id *)(a1 + 40), "_invokeCurrentBluetoothPairingCompletionWithDeviceIdentifier:success:error:", v2, 1, 0);

}

void sub_100024C18(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", *(_QWORD *)(a1 + 40)));
  objc_msgSend(v2, "handleDidConnectMessagingToVehicles:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "analyticsDescription"));
  v13 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v4));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("modelName")));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v5, CFSTR("iAPModel"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("manufacturer")));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v6, CFSTR("iAPManufacturer"));

  objc_msgSend(v13, "removeObjectForKey:", CFSTR("modelName"));
  objc_msgSend(v13, "removeObjectForKey:", CFSTR("manufacturer"));
  v7 = (char *)objc_msgSend(*(id *)(a1 + 40), "transportType");
  if ((unint64_t)(v7 - 1) > 3)
    v8 = CFSTR("unknown");
  else
    v8 = *(&off_1000B61F8 + (_QWORD)(v7 - 1));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v8, CARTransport);
  v9 = CARCarKitVehicleInformationEvent;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CARConnectionEvent eventWithName:type:date:payload:](CARConnectionEvent, "eventWithName:type:date:payload:", v9, 4, v10, v13));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "connectionTimeServiceAgent"));
  objc_msgSend(v12, "recordConnectionEvent:completion:", v11, &stru_1000B5EE0);

}

void sub_100024DD4(id a1, BOOL a2, NSError *a3)
{
  NSError *v4;
  NSError *v5;
  uint64_t v6;
  NSObject *v7;

  v4 = a3;
  v5 = v4;
  if (!a2)
  {
    v6 = CarGeneralLogging(v4);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10006B0F0(v5, v7);

  }
}

void sub_100024EA8(uint64_t a1)
{
  void *v2;
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  _QWORD v5[5];

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", *(_QWORD *)(a1 + 40)));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100024F54;
  v5[3] = &unk_1000B5F08;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "enumerateStoredVehiclesForMessagingVehicles:usingBlock:", v3, v5);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CARSessionAccessoryUpdatedNotification, 0, 0, 1u);
}

id *sub_100024F54(id *result, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (id *)objc_msgSend(result[4], "updateStoredVehicle:usingMessagingVehicle:", a3, a2);
  return result;
}

void sub_1000251E0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  uint8_t buf[8];
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  __int128 *v35;
  __int128 v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v5 = a2;
  v6 = a3;
  v29 = v6;
  if (v5)
  {
    *(_QWORD *)&v36 = 0;
    *((_QWORD *)&v36 + 1) = &v36;
    v37 = 0x3032000000;
    v38 = sub_10001F79C;
    v39 = sub_10001F7AC;
    v40 = 0;
    v8 = *(void **)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 32);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100025538;
    v33[3] = &unk_1000B5C98;
    v35 = &v36;
    v10 = v5;
    v34 = v10;
    objc_msgSend(v8, "_saveWiFiCredentials:fromMessagingVehicle:forWirelessPairedVehicle:result:", v7, v9, v10, v33);
    v12 = CRLocalizedStringForKey(CFSTR("CARPLAY"), v11);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "certificateSerialNumber"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
    v15 = objc_alloc((Class)CARSessionRequestHost);
    v16 = objc_msgSend(v15, "initWithDisplayName:authenticationCertificateSerial:pairedVehicleIdentifier:wiFiUUID:bleStartSessionMessage:", v28, v13, v14, *(_QWORD *)(*((_QWORD *)&v36 + 1) + 40), *(_QWORD *)(a1 + 56));
    v17 = *(void **)(a1 + 40);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1000255E4;
    v31[3] = &unk_1000B5F30;
    v18 = v16;
    v32 = v18;
    objc_msgSend(v17, "_mainQueue_startSessionForHost:reply:", v18, v31);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "assetIdentifier"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "assetVersion"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "sdkVersion"));
    if (v19)
    {
      if (objc_msgSend(v19, "length"))
      {
        if (v20)
        {
          if (v21)
          {
            v22 = objc_msgSend(v21, "length");
            if (v22)
            {
              v23 = CarGeneralLogging(v22);
              v24 = objc_claimAutoreleasedReturnValue(v23);
              if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "start session message has asset information", buf, 2u);
              }

              objc_msgSend(*(id *)(a1 + 40), "_mainQueue_updateClusterAssetIdentifier:assetVersion:sdkVersion:forVehicle:", v19, v20, v21, v10);
            }
          }
        }
      }
    }

    _Block_object_dispose(&v36, 8);
  }
  else
  {
    v25 = CarGeneralLogging(v6);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "vehicleName"));
      LODWORD(v36) = 138412290;
      *(_QWORD *)((char *)&v36 + 4) = v27;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "not handling CarPlayStartSession, not a wireless paired vehicle: %@", (uint8_t *)&v36, 0xCu);

    }
  }

}

void sub_1000254F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100025538(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v6 = a2;
  v7 = a3;
  v8 = v7;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  else
  {
    v9 = CarGeneralLogging(v7);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10006AE08();

    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "carplayWiFiUUID"));
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
}

void sub_1000255E4(uint64_t a1, char a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;

  v4 = a3;
  v5 = v4;
  if ((a2 & 1) == 0)
  {
    v6 = CarGeneralLogging(v4);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10006B19C();

  }
}

id sub_1000256C8(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentPromptFlowController"));

  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentPromptFlowController"));
    objc_msgSend(v3, "handleDisconnectedMessagingVehicle:", *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(*(id *)(a1 + 32), "_dismissApprovalAlertForMessagingVehicle:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_dismissPairingAlertForMessagingVehicle:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_dismissEnhancedIntegrationAlertForMessagingVehicle:", *(_QWORD *)(a1 + 40));
}

id sub_10002588C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleCarPlayAllowedDidChange");
}

void sub_100025BA0(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "handleAnyMessagingConnectionsToVehicles");
  v2 = *(void **)(a1 + 32);
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "pairedVehiclesConnectedOnBluetooth"));
  objc_msgSend(v2, "attemptConnectionWithVehicles:", v3);

}

uint64_t sub_100026024(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 32), a3);
}

id sub_1000262B0(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "certificateSerialNumber"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "certificateSerialNumber"));

  v6 = objc_msgSend(v4, "isEqualToData:", v5);
  return v6;
}

void sub_1000263CC(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  int v14;
  void *v15;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_saveWiFiCredentials:fromMessagingVehicle:forWirelessPairedVehicle:result:", *(_QWORD *)(a1 + 40), v7, a2, *(_QWORD *)(a1 + 48));
  }
  else
  {
    v10 = CarGeneralLogging(v8);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "vehicleName"));
      v14 = 138412290;
      v15 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Ignoring WiFi credentials for vehicle %@", (uint8_t *)&v14, 0xCu);

    }
    v13 = *(_QWORD *)(a1 + 48);
    if (v13)
      (*(void (**)(uint64_t, _QWORD, void *))(v13 + 16))(v13, 0, v9);
  }

}

void sub_1000269A0(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;

  v5 = a3;
  v6 = CarGeneralLogging(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_10006B384();

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);

}

void sub_100026E50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000271AC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v6, "updateStoredVehicle:usingMessagingVehicle:", v5, v7);
    objc_msgSend(*(id *)(a1 + 32), "_sendCarPlayAvailabilityForMessagingVehicle:storedVehicle:", v7, v5);
    objc_msgSend(*(id *)(a1 + 32), "_sendDeviceIdentifiersForMessagingVehicle:pairingStatus:", v7, objc_msgSend(v5, "pairingStatus"));
    if (objc_msgSend(v5, "isPaired"))
      objc_msgSend(*(id *)(a1 + 32), "_requestWiFiCredentialsIfNecessaryForApprovedMessagingVehicle:", v7);
    if (objc_msgSend(*(id *)(a1 + 32), "_shouldPromptEnhancedIntegrationForStoredVehicle:messagingVehicle:", v5, v7))objc_msgSend(*(id *)(a1 + 32), "_presentEnhancedIntegrationAlertForMessagingVehicle:", v7);
  }
  else
  {
    objc_msgSend(v6, "_sendCarPlayAvailabilityForMessagingVehicle:storedVehicle:", v7, 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "_presentApprovalIfNecessaryForMessagingVehicle:storedVehicle:", v7, v5);

}

id sub_1000278D8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;

  v5 = a2;
  v6 = a3;
  v7 = CarGeneralLogging(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUIDString"));
    v20 = 138412546;
    v21 = v10;
    v22 = 2112;
    v23 = v12;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Merging incomplete pairing %@ into pairing %@", (uint8_t *)&v20, 0x16u);

  }
  objc_msgSend(v6, "mergeAttributesFromVehicle:", v5);
  v13 = objc_msgSend(v6, "isEqual:", v5);
  if ((v13 & 1) == 0)
  {
    v14 = CarGeneralLogging(v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "UUIDString"));
      v20 = 138412290;
      v21 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Removing incomplete pairing %@", (uint8_t *)&v20, 0xCu);

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "vehicleStore"));
    objc_msgSend(v18, "removeVehicle:", v5);

  }
  return v6;
}

BOOL sub_1000285A4(id a1, CRMessagingServiceVehicleRepresenting *a2, NSDictionary *a3)
{
  id v3;

  v3 = -[CRMessagingServiceVehicleRepresenting transportType](a2, "transportType", a3);
  return v3 == (id)2 || v3 == (id)4;
}

void sub_100028870(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint8_t buf[16];

  v2 = CarGeneralLogging(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "waiting on vehicle policy monitor observers", buf, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "monitoringService"));
  v5 = *(void **)(a1 + 40);
  v6 = *(unsigned __int8 *)(a1 + 56);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100028960;
  v9[3] = &unk_1000B6088;
  v7 = v5;
  v13 = *(_BYTE *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 32);
  v10 = v7;
  v11 = v8;
  v12 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v4, "handleUpdatedVehicle:enabled:completion:", v7, v6, v9);

}

void sub_100028960(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  __int128 v4;
  char v5;

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000289E4;
  v2[3] = &unk_1000B6088;
  v3 = *(id *)(a1 + 32);
  v5 = *(_BYTE *)(a1 + 56);
  v4 = *(_OWORD *)(a1 + 40);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);

}

void sub_1000289E4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "carplayWiFiUUID"));
  if (!v2)
  {
    if (!*(_BYTE *)(a1 + 56))
      goto LABEL_6;
LABEL_5:
    v4 = *(void **)(a1 + 40);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", *(_QWORD *)(a1 + 32)));
    objc_msgSend(v4, "attemptConnectionWithVehicles:", v5);

    goto LABEL_6;
  }
  if (*(_BYTE *)(a1 + 56))
    goto LABEL_5;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "sessionRequestClient"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100028AF4;
  v8[3] = &unk_1000B6060;
  v8[4] = *(_QWORD *)(a1 + 40);
  v9 = v2;
  v10 = *(id *)(a1 + 32);
  objc_msgSend(v3, "prepareForRemovingWiFiUUID:completion:", v9, v8);

LABEL_6:
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

}

void sub_100028AF4(uint64_t a1)
{
  void *v2;
  _QWORD block[5];
  id v4;
  id v5;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100028B80;
  block[3] = &unk_1000B53B8;
  v2 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  v5 = *(id *)(a1 + 48);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_100028B80(uint64_t a1)
{
  void *v2;
  unsigned __int8 v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "wifiManager"));
  v3 = objc_msgSend(v2, "removeNetworkCredentialsForCarPlayUUID:", *(_QWORD *)(a1 + 40));

  if ((v3 & 1) == 0)
  {
    v5 = CarGeneralLogging(v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10006B580(a1, v6);

  }
}

void sub_100028E74(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  id v10;
  uint64_t v11;
  uint8_t buf[16];

  v2 = CarGeneralLogging(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "waiting on vehicle policy monitor observers", buf, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "monitoringService"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100028F6C;
  v8[3] = &unk_1000B60B0;
  v5 = *(_QWORD *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 56);
  v10 = v6;
  v11 = v7;
  objc_msgSend(v4, "handleUpdatedVehicle:enabled:completion:", v5, 0, v8);

}

void sub_100028F6C(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  id v7;
  uint64_t v8;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100028FFC;
  v5[3] = &unk_1000B60B0;
  v2 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v2;
  v3 = *(id *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v7 = v3;
  v8 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

void sub_100028FFC(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  id v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "sessionRequestClient"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000290BC;
  v6[3] = &unk_1000B6060;
  v3 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v2, "prepareForRemovingWiFiUUID:completion:", v7, v6);

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

}

void sub_1000290BC(uint64_t a1)
{
  void *v2;
  _QWORD block[5];
  id v4;
  id v5;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100029148;
  block[3] = &unk_1000B53B8;
  v2 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  v5 = *(id *)(a1 + 48);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_100029148(uint64_t a1)
{
  void *v2;
  unsigned __int8 v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "wifiManager"));
  v3 = objc_msgSend(v2, "removeNetworkCredentialsForCarPlayUUID:", *(_QWORD *)(a1 + 40));

  if ((v3 & 1) == 0)
  {
    v5 = CarGeneralLogging(v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10006B580(a1, v6);

  }
}

void sub_100029F60(uint64_t a1, void *a2)
{
  id v4;
  _QWORD v5[4];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100029FEC;
  v5[3] = &unk_1000B51B8;
  v6 = *(id *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setDismissHandler:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

id sub_100029FEC(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v5[16];

  v2 = CarPairingLogging(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "prompt presenter dismissed, canceling prompt flow", v5, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

void sub_10002A05C(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;

  v3 = a2;
  v4 = CarPairingLogging(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_10006B69C();

  objc_msgSend(*(id *)(a1 + 32), "cancel");
}

void sub_10002B8A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a18, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_10002B8D8(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v2 = CarGeneralLogging(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Presented approval alert", v8, 2u);
  }

  v4 = os_transaction_create("com.apple.carkit.vehicleApprovalAlert");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "outstandingApprovalAlerts"));
  objc_msgSend(v7, "addObject:", *(_QWORD *)(a1 + 40));

}

void sub_10002B97C(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint8_t v28[16];
  uint8_t v29[16];
  uint8_t v30[16];
  uint8_t buf[16];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "outstandingApprovalAlerts"));
  objc_msgSend(v4, "removeObject:", *(_QWORD *)(a1 + 40));

  switch(a2)
  {
    case 2:
      v6 = CarGeneralLogging(v5);
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "approval alert cancelled", buf, 2u);
      }

      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "vehicleStore"));
      v9 = objc_msgSend(v8, "removeVehicle:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

      v11 = CarGeneralLogging(v10);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      v13 = v12;
      if (v9)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v30 = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Temporary vehicle removed.", v30, 2u);
        }
      }
      else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        sub_10006B8F4();
      }

      goto LABEL_34;
    case 0:
      v17 = CarGeneralLogging(v5);
      v15 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v29 = 0;
        v16 = 2;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "approval alert accepted", v29, 2u);
      }
      else
      {
        v16 = 2;
      }
LABEL_19:

      goto LABEL_20;
    case 1:
      v14 = CarGeneralLogging(v5);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v28 = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "approval alert declined", v28, 2u);
      }
      v16 = 1;
      goto LABEL_19;
  }
  v16 = 0;
LABEL_20:
  if (objc_msgSend(*(id *)(a1 + 48), "transportType") == (id)2)
    objc_msgSend(*(id *)(a1 + 32), "_sendDeviceIdentifiersForMessagingVehicle:pairingStatus:", *(_QWORD *)(a1 + 48), v16);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setPairingStatus:", v16);
  v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "saveVehicle:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)));
  v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v20 = *(void **)(v19 + 40);
  *(_QWORD *)(v19 + 40) = v18;

  if (objc_msgSend(*(id *)(a1 + 48), "transportType") == (id)2
    || objc_msgSend(*(id *)(a1 + 48), "transportType") == (id)4)
  {
    objc_msgSend(*(id *)(a1 + 32), "_sendCarPlayAvailabilityForMessagingVehicle:storedVehicle:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  }
  if (!a2)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "preferencesManager"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "isCarPlaySetupEnabled"));
    v23 = objc_msgSend(v22, "BOOLValue");

    if ((v23 & 1) == 0)
    {
      if (objc_msgSend(*(id *)(a1 + 48), "transportType") == (id)1
        && objc_msgSend(*(id *)(a1 + 48), "supportsWiredBluetoothPairing")
        && objc_msgSend(*(id *)(a1 + 48), "supportsWirelessCarPlay"))
      {
        objc_msgSend(*(id *)(a1 + 32), "_presentWiredBluetoothPairingAlertForMessagingVehicle:storedVehicle:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
      }
      if (objc_msgSend(*(id *)(a1 + 32), "_shouldPromptEnhancedIntegrationForStoredVehicle:messagingVehicle:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 48)))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "preferencesManager"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "isCarPlaySetupEnabled"));

        if (!v25)
          objc_msgSend(*(id *)(a1 + 32), "_presentEnhancedIntegrationAlertForMessagingVehicle:", *(_QWORD *)(a1 + 48));
      }
    }
  }
LABEL_34:
  v26 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v27 = *(void **)(v26 + 40);
  *(_QWORD *)(v26 + 40) = 0;

}

void sub_10002C518(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_10002C538(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v2 = CarGeneralLogging(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Presented Wired BT pairing alert", v8, 2u);
  }

  v4 = os_transaction_create("com.apple.carkit.wiredBTApprovalAlert");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "outstandingPairingAlerts"));
  objc_msgSend(v7, "addObject:", *(_QWORD *)(a1 + 40));

}

void sub_10002C5DC(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  unsigned __int8 v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  uint8_t v20[16];
  uint8_t v21[16];
  uint8_t v22[16];
  uint8_t buf[16];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "outstandingPairingAlerts"));
  objc_msgSend(v4, "removeObject:", *(_QWORD *)(a1 + 40));

  if (a2)
  {
    if (a2 == 2)
    {
      v10 = CarGeneralLogging(v5);
      v9 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v22 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Wired BT pairing alert cancelled", v22, 2u);
      }
      goto LABEL_17;
    }
    if (a2 == 1)
    {
      v6 = CarGeneralLogging(v5);
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Wired BT pairing alert declined", buf, 2u);
      }

      if (*(_QWORD *)(a1 + 72) == 1)
      {
        v8 = objc_msgSend((id)objc_opt_class(*(_QWORD *)(a1 + 32)), "_pairingIdentifierForMessagingVehicle:", *(_QWORD *)(a1 + 48));
        v9 = objc_claimAutoreleasedReturnValue(v8);
        objc_msgSend((id)objc_opt_class(*(_QWORD *)(a1 + 32)), "_incrementPairingDeclineCountForIdentifier:", v9);
LABEL_17:

      }
    }
  }
  else
  {
    v11 = CarGeneralLogging(v5);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Wired BT pairing alert accepted", v21, 2u);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bluetoothManager"));
    v14 = objc_msgSend(v13, "isPowered");

    if ((v14 & 1) == 0)
    {
      v16 = CarGeneralLogging(v15);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Wired BT powering on", v20, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "setBTPowerMessagingVehicle:", *(_QWORD *)(a1 + 48));
      objc_msgSend(*(id *)(a1 + 32), "setBTPowerStoredVehicle:", *(_QWORD *)(a1 + 56));
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bluetoothManager"));
      -[NSObject setPowered:](v9, "setPowered:", 1);
      goto LABEL_17;
    }
    objc_msgSend(*(id *)(a1 + 32), "_beginWiredPairingWithMessagingVehicle:storedVehicle:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = 0;

}

void sub_10002C9C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_10002CA00(uint64_t a1, int a2)
{
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  id WeakRetained;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  id *v18;
  id v19;
  id v20;
  int v21;
  NSObject *v22;

  if (a2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[CRBluetoothManager addressStringForData:](CRBluetoothManager, "addressStringForData:"));
    v4 = CarGeneralLogging(v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 138412290;
      v22 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "wired pairing address: %@", (uint8_t *)&v21, 0xCu);
    }

    if (v3)
    {
      v7 = *(id *)(a1 + 32);
      if (!v7)
      {
        v7 = objc_claimAutoreleasedReturnValue(+[CRVehicle vehicleForMessagingVehicle:](CRVehicle, "vehicleForMessagingVehicle:", *(_QWORD *)(a1 + 40)));
        -[NSObject setPairingStatus:](v7, "setPairingStatus:", 2);
      }
      -[NSObject setBluetoothAddress:](v7, "setBluetoothAddress:", v3);
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
      v9 = objc_msgSend(WeakRetained, "saveVehicle:", v7);

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "_wirelessPairingAnalyticsDescriptionForMessagingVehicle:storedVehicle:", *(_QWORD *)(a1 + 40), v7));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[CARAnalytics sharedInstance](CARAnalytics, "sharedInstance"));
      objc_msgSend(v11, "userCreatedWirelessPairingWithSource:payload:", CFSTR("OOB"), v10);

    }
    else
    {
      v14 = CarGeneralLogging(v6);
      v7 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v15 = *(NSObject **)(a1 + 32);
        v21 = 138412290;
        v22 = v15;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "vehicle did not have a Bluetooth address after pairing: %@", (uint8_t *)&v21, 0xCu);
      }
    }

  }
  else
  {
    v12 = CarGeneralLogging(a1);
    v3 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(NSObject **)(a1 + 32);
      v21 = 138412290;
      v22 = v13;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "failed to complete Bluetooth pairing with %@", (uint8_t *)&v21, 0xCu);
    }
  }

  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = 0;

  v18 = (id *)(a1 + 64);
  v19 = objc_loadWeakRetained(v18);
  objc_msgSend(v19, "setBTPowerStoredVehicle:", 0);

  v20 = objc_loadWeakRetained(v18);
  objc_msgSend(v20, "setBTPowerMessagingVehicle:", 0);

}

void sub_10002D034(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002D04C(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v2 = CarGeneralLogging(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Presented enable Wi-Fi alert", v8, 2u);
  }

  v4 = os_transaction_create("com.apple.carkit.reconnectionEnableWiFi");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "outstandingEnableWiFiAlerts"));
  objc_msgSend(v7, "addObject:", *(_QWORD *)(a1 + 40));

}

void sub_10002D0F0(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint8_t v16[16];
  uint8_t buf[2];
  __int16 v18;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "outstandingEnableWiFiAlerts"));
  objc_msgSend(v4, "removeObject:", *(_QWORD *)(a1 + 40));

  if (a2)
  {
    if (a2 == 2)
    {
      v13 = CarGeneralLogging(v5);
      v7 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v8 = "Enable Wi-Fi alert cancelled";
        v9 = buf;
        goto LABEL_11;
      }
LABEL_12:

      goto LABEL_13;
    }
    if (a2 == 1)
    {
      v6 = CarGeneralLogging(v5);
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 0;
        v8 = "Enable Wi-Fi alert declined";
        v9 = (uint8_t *)&v18;
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
        goto LABEL_12;
      }
      goto LABEL_12;
    }
  }
  else
  {
    v10 = CarGeneralLogging(v5);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Enable Wi-Fi alert accepted, turning on Wi-Fi", v16, 2u);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "wifiManager"));
    objc_msgSend(v12, "setPowered:", 1);

    objc_msgSend(*(id *)(a1 + 32), "postInCarNotificationForVehicle:", *(_QWORD *)(a1 + 48));
  }
LABEL_13:
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = 0;

}

void sub_10002DB90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002DBA8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = os_transaction_create("com.apple.carkit.enhancedIntegrationAlert");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "outstandingEnhancedIntegrationAlerts"));
  objc_msgSend(v5, "addObject:", *(_QWORD *)(a1 + 40));

}

void sub_10002DC08(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint8_t v17[16];
  uint8_t v18[16];
  uint8_t buf[16];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "outstandingEnhancedIntegrationAlerts"));
  objc_msgSend(v4, "removeObject:", *(_QWORD *)(a1 + 40));

  switch(a2)
  {
    case 0:
      v11 = CarGeneralLogging(v5);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Enhanced integration alert accepted", v17, 2u);
      }

      v8 = *(void **)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 48);
      v10 = 2;
      goto LABEL_10;
    case 2:
      v13 = CarGeneralLogging(v5);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Enhanced integration alert cancelled", v18, 2u);
      }

      break;
    case 1:
      v6 = CarGeneralLogging(v5);
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Enhanced integration alert declined", buf, 2u);
      }

      v8 = *(void **)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 48);
      v10 = 1;
LABEL_10:
      objc_msgSend(v8, "_enhancedIntegrationUpdatedForMessagingVehicle:status:", v9, v10);
      break;
  }
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = 0;

}

void sub_10002E1E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10002E20C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  char v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  const __CFString *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  __int16 v19;
  const __CFString *v20;

  v5 = a2;
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = objc_msgSend(*(id *)(a1 + 32), "isEqual:", v5);
  v9 = (char)v8;
  v10 = CarPairingLogging(v8);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if ((v9 & 1) != 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = CFSTR("confirmed");
      v16 = 1752392040;
      v15 = 141558531;
      if (!v6)
        v13 = CFSTR("declined");
      v17 = 2113;
      v18 = v5;
      v19 = 2114;
      v20 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "pairing for %{private, mask.hash}@ was %{public}@", (uint8_t *)&v15, 0x20u);
    }

    v14 = *(_QWORD *)(a1 + 40);
    if (v14)
      (*(void (**)(uint64_t, id, _QWORD))(v14 + 16))(v14, v6, 0);
    if (!v6)
      objc_msgSend(WeakRetained, "_invokeCurrentBluetoothPairingCompletionWithDeviceIdentifier:success:error:", *(_QWORD *)(a1 + 32), 0, 0);
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_10006B9B8();

  }
}

void sub_10002E5CC(id a1, BOOL a2, NSError *a3)
{
  _BOOL4 v3;
  NSError *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];

  v3 = a2;
  v4 = a3;
  v5 = CarGeneralLogging(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "CARAnalytics: sent wirelessPairingCreatedEvent connection event", v8, 2u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_10006BA44(v4, v7);
  }

}

void *sub_10002EC5C(uint64_t a1)
{
  void *v2;
  char *v3;
  void *result;
  char *v5;
  __int128 v6;
  uint64_t v7;

  v5 = 0;
  if (!qword_1000DB840)
  {
    v6 = off_1000B61E0;
    v7 = 0;
    qword_1000DB840 = _sl_dlopen(&v6, &v5);
    v3 = v5;
    v2 = (void *)qword_1000DB840;
    if (qword_1000DB840)
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
  v2 = (void *)qword_1000DB840;
LABEL_5:
  result = dlsym(v2, "kAPEndpointProperty_EndpointInfo");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  qword_1000DB838 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_10002ED80(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x2Au);
}

void sub_10002EDA0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_10002EDD0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

id sub_10002F2DC()
{
  _QWORD v1[3];
  _QWORD v2[3];

  v1[0] = &off_1000BE038;
  v2[0] = objc_opt_class(CARCarPlayServiceMessageIdentification);
  v1[1] = &off_1000BE050;
  v2[1] = objc_opt_class(CARCarPlayServiceMessageAvailability);
  v1[2] = &off_1000BE068;
  v2[2] = objc_opt_class(CARCarPlayServiceMessageStartSession);
  return (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v2, v1, 3));
}

id sub_10002FC18(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  v4 = v3;
  if (v3 && (objc_opt_isKindOfClass(v3, a1) & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

void sub_100031B30(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_100032338(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_100032358(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "initializeStateMachine");
  return objc_msgSend(*(id *)(a1 + 32), "setSession:", *(_QWORD *)(a1 + 40));
}

void sub_100032798(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, id *a10, id *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,id a35)
{
  id *v35;

  objc_destroyWeak(v35);
  objc_destroyWeak(location);
  objc_destroyWeak(a10);
  objc_destroyWeak(a11);
  objc_destroyWeak(&a35);
  _Unwind_Resume(a1);
}

int64_t sub_100032834(id a1, CUStateEvent *a2)
{
  CUStateEvent *v2;
  NSObject *v3;
  uint64_t v5;
  uint64_t v6;

  v2 = a2;
  v3 = (id)objc_claimAutoreleasedReturnValue(-[CUStateEvent name](v2, "name"));
  if ((-[NSObject isEqualToString:](v3, "isEqualToString:", CFSTR("Start")) & 1) != 0
    || (-[NSObject isEqualToString:](v3, "isEqualToString:", CFSTR("Reset")) & 1) != 0
    || (-[NSObject isEqualToString:](v3, "isEqualToString:", CFSTR("Fail")) & 1) != 0
    || -[NSObject isEqualToString:](v3, "isEqualToString:", CFSTR("Finish")))
  {

  }
  else
  {

    v6 = CarGeneralLogging(v5);
    v3 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      sub_10006C548(v2, v3);
  }

  return 1;
}

uint64_t sub_1000328F0(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Start")) & 1) != 0)
  {
    v6 = 0;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Reset")) & 1) != 0)
  {
    v6 = 3;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Fail")) & 1) != 0)
  {
    v6 = 2;
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("Finish")))
  {
    v6 = 1;
  }
  else
  {
    v6 = -1;
  }

  v8 = CarGeneralLogging(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    sub_10006C5D4(v3, v9);

  if ((unint64_t)(v6 - 1) < 2)
  {
    objc_msgSend(WeakRetained, "_ignoreEvent:", v6);
  }
  else
  {
    if (v6 == 3)
    {
      objc_msgSend(*(id *)(a1 + 32), "performEnterReadyState");
      goto LABEL_19;
    }
    if (!v6)
    {
      objc_msgSend(WeakRetained, "_transitionToState:forEvent:", 1, 0);
LABEL_19:
      v10 = 2;
      goto LABEL_20;
    }
  }
  v10 = 1;
LABEL_20:

  return v10;
}

uint64_t sub_100032A3C(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (id)objc_claimAutoreleasedReturnValue(+[CUStateEvent enterState](CUStateEvent, "enterState"));

  if (v5 == v3)
  {
    v8 = 0;
  }
  else
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("Start")) & 1) != 0)
    {
      v8 = 0;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("Reset")) & 1) != 0)
    {
      v8 = 3;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("Fail")) & 1) != 0)
    {
      v8 = 2;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("Finish")))
    {
      v8 = 1;
    }
    else
    {
      v8 = -1;
    }

  }
  v9 = CarGeneralLogging(v6);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    sub_10006C660();

  switch(v8)
  {
    case 0:
      objc_msgSend(WeakRetained, "performLoadingPlistData:", 0);
      goto LABEL_22;
    case 1:
      v11 = 2;
      v12 = WeakRetained;
      v13 = 2;
      v14 = 1;
      goto LABEL_20;
    case 2:
      v11 = 2;
      v12 = WeakRetained;
      v13 = 3;
      v14 = 2;
LABEL_20:
      objc_msgSend(v12, "_transitionToState:forEvent:", v13, v14);
      break;
    case 3:
      objc_msgSend(WeakRetained, "_transitionToState:forEvent:", 0, 3);
LABEL_22:
      v11 = 2;
      break;
    default:
      v11 = 1;
      break;
  }

  return v11;
}

uint64_t sub_100032BD4(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue(+[CUStateEvent enterState](CUStateEvent, "enterState"));

  if (v5 == v3)
  {
    v8 = 0;
  }
  else
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("Start")) & 1) != 0)
    {
      v8 = 0;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("Reset")) & 1) != 0)
    {
      v8 = 3;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("Fail")) & 1) != 0)
    {
      v8 = 2;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("Finish")))
    {
      v8 = 1;
    }
    else
    {
      v8 = -1;
    }

  }
  v9 = CarGeneralLogging(v6);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    sub_10006C6E8();

  if ((unint64_t)(v8 - 1) < 2)
  {
    v11 = WeakRetained;
    v12 = 3;
    v13 = v8;
LABEL_21:
    objc_msgSend(v11, "_transitionToState:forEvent:", v12, v13);
    goto LABEL_22;
  }
  if (v8 == 3)
  {
    v11 = WeakRetained;
    v12 = 0;
    v13 = 3;
    goto LABEL_21;
  }
  if (v8)
  {
    v14 = 1;
    goto LABEL_24;
  }
  objc_msgSend(*(id *)(a1 + 32), "performLookup:", 0);
LABEL_22:
  v14 = 2;
LABEL_24:

  return v14;
}

uint64_t sub_100032D50(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue(+[CUStateEvent enterState](CUStateEvent, "enterState"));

  if (v5 == v3)
  {
    v8 = 0;
  }
  else
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("Start")) & 1) != 0)
    {
      v8 = 0;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("Reset")) & 1) != 0)
    {
      v8 = 3;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("Fail")) & 1) != 0)
    {
      v8 = 2;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("Finish")))
    {
      v8 = 1;
    }
    else
    {
      v8 = -1;
    }

  }
  v9 = CarGeneralLogging(v6);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    sub_10006C770();

  v11 = 2;
  switch(v8)
  {
    case -1:
      v11 = 1;
      break;
    case 0:
      objc_msgSend(*(id *)(a1 + 32), "performDoneCaptureResult");
      goto LABEL_20;
    case 1:
      objc_msgSend(*(id *)(a1 + 32), "performPostResponseAndReleaseData");
      goto LABEL_20;
    case 3:
      objc_msgSend(WeakRetained, "_transitionToState:forEvent:", 0, 3);
LABEL_20:
      v11 = 2;
      break;
    default:
      break;
  }

  return v11;
}

void sub_100033394(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000333A8(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v2 = CarGeneralLogging(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_10006CA8C(v3, v4, v5, v6, v7, v8, v9, v10);

  v11 = *(void **)(a1 + 32);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "session"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "plistURL"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "responseBlock"));
  objc_msgSend(v11, "lookupCarcapabilitiesForSession:plistURL:completionHandler:", v12, v13, v14);

}

void sub_100033A98(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a3;
  if (sub_100033AE8(a2, *(void **)(a1 + 32)))
    objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v5);

}

unint64_t sub_100033AE8(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t isKindOfClass;
  uint64_t v7;
  id v8;
  unint64_t v9;
  unsigned int v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  unsigned int v16;
  void *v17;
  void *v18;
  int v19;
  id v20;

  v3 = a1;
  v4 = a2;
  v5 = objc_opt_class(NSString);
  isKindOfClass = objc_opt_isKindOfClass(v3, v5);
  if ((isKindOfClass & 1) != 0
    && (v7 = objc_opt_class(NSString),
        isKindOfClass = objc_opt_isKindOfClass(v4, v7),
        (isKindOfClass & 1) != 0))
  {
    v8 = objc_msgSend(v3, "localizedCaseInsensitiveCompare:", v4);
    v9 = v8 == 0;
    if (v4 && v3 && v8)
    {
      if ((unint64_t)objc_msgSend(v3, "length") >= 3 && objc_msgSend(v3, "hasPrefix:", CFSTR("*")))
        v10 = objc_msgSend(v3, "hasSuffix:", CFSTR("*")) ^ 1;
      else
        v10 = 1;
      if ((unint64_t)objc_msgSend(v4, "length") >= 3 && objc_msgSend(v4, "hasPrefix:", CFSTR("*")))
        v16 = objc_msgSend(v4, "hasSuffix:", CFSTR("*")) ^ 1;
      else
        v16 = 1;
      if (((v10 | v16 ^ 1) & 1) == 0)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringWithRange:", 1, (char *)objc_msgSend(v3, "length") - 2));
        v18 = v4;
        goto LABEL_25;
      }
      if (((v16 | v10 ^ 1) & 1) == 0)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringWithRange:", 1, (char *)objc_msgSend(v4, "length") - 2));
        v18 = v3;
LABEL_25:
        v9 = (unint64_t)objc_msgSend(v18, "localizedCaseInsensitiveContainsString:", v17);

      }
    }
  }
  else
  {
    v11 = CarGeneralLogging(isKindOfClass);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_opt_class(NSString);
      if ((objc_opt_isKindOfClass(v3, v13) & 1) != 0)
        v14 = v4;
      else
        v14 = v3;
      v19 = 138412290;
      v20 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Invalid plist data, expecting a string: %@", (uint8_t *)&v19, 0xCu);
    }

    v9 = 0;
  }

  return v9;
}

void sub_100033FDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100033FFC(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10003400C(uint64_t a1)
{

}

void sub_100034014(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = a2;
  v5 = (void *)objc_opt_new(NSMutableSet, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectForKeyedSubscript:", v3));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v6));
    objc_msgSend(v5, "unionSet:", v7);

  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v13);
        v16 = 0;
        if (objc_msgSend(*(id *)(a1 + 32), "_vehicleSatisfiesConfiguration:propertyHits:", v14, &v16))
        {
          v15 = v16;
          if (v16 > v11)
          {
            objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v14);
            v11 = v15;
          }
        }
        v13 = (char *)v13 + 1;
      }
      while (v10 != v13);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

}

void sub_100034778(id a1)
{
  void *v1;

  v1 = (void *)qword_1000DB850;
  qword_1000DB850 = (uint64_t)&off_1000BF1D0;

}

void sub_1000348BC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void sub_1000348C8(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

uint64_t sub_100034B90(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 24) |= *(_QWORD *)(result + 40);
  return result;
}

uint64_t sub_100034CD8(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 24) &= ~*(_QWORD *)(result + 40);
  return result;
}

uint64_t sub_100034DB0(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 24) = 0;
  return result;
}

void sub_100034E64(uint64_t a1)
{
  id v1;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) &= 0xFFFFFFFFFFFFFFE4;
  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "preferences"));
  objc_msgSend(v1, "setDisableTimerTimestamp:", 0);

}

void sub_100035108(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100035590(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (!a2 && *(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "setPowered:", 1);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

uint64_t sub_100035924(uint64_t a1, uint64_t a2)
{
  CRWiFiCarManager *v4;
  uint64_t result;

  if (!a2)
  {
    v4 = objc_alloc_init(CRWiFiCarManager);
    -[CRWiFiCarManager setPowered:](v4, "setPowered:", 1);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

void sub_100035BE4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100035C00(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_mainQueue_performWithPromptPresenter:isUILocked:errorHandler:", *(_QWORD *)(a1 + 32), a2, *(_QWORD *)(a1 + 40));

}

void sub_100035E88(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_100035EB0(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "performWithPromptPresenter:errorHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void sub_100035EEC(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  uint64_t v6;
  NSObject *v7;
  void *v8;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v6 = CarPairingLogging(WeakRetained);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_10006CC68();

  objc_msgSend(WeakRetained, "_mainQueue_unblockSessionQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "setupLauncher"));
  objc_msgSend(v8, "invalidate");

  objc_msgSend(WeakRetained, "setSetupLauncher:", 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_100035F94(uint64_t a1)
{
  void *v2;
  _QWORD block[5];
  id v4;
  id v5;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100036020;
  block[3] = &unk_1000B6478;
  v2 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  v5 = *(id *)(a1 + 48);
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_100036020(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void (*v4)(void);
  uint64_t v5;
  NSObject *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentPresenterSession"));
  if (!v2)
  {
    v5 = CarPairingLogging(0);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10006CC94();

    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_7;
  }
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
  {
    v4 = *(void (**)(void))(v3 + 16);
LABEL_7:
    v4();
  }

}

void sub_1000361F4(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  NSObject *v5;
  const __CFString *v6;
  _QWORD v7[4];
  id v8;
  BOOL v9;
  uint8_t buf[4];
  const __CFString *v11;

  v2 = SBSGetScreenLockStatus(0);
  v3 = v2;
  v4 = CarPairingLogging(v2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = CFSTR("NO");
    if (v3)
      v6 = CFSTR("YES");
    *(_DWORD *)buf = 138543362;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "ui locked: %{public}@", buf, 0xCu);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003631C;
  v7[3] = &unk_1000B5830;
  v8 = *(id *)(a1 + 32);
  v9 = v3 != 0;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);

}

uint64_t sub_10003631C(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  return result;
}

intptr_t sub_10003642C(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;

  v2 = CarPairingLogging(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_10006CCCC();

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
}

void sub_100036608(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100036624(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  id WeakRetained;
  uint64_t v7;
  int v8;
  uint64_t v9;

  v4 = CarPairingLogging(a1);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v8 = 134217984;
    v9 = a2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "CarPlay Setup lockscreen alert dismiss with response: %lu", (uint8_t *)&v8, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setLockscreenAlert:", 0);
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(void))(v7 + 16))();

}

void sub_100036AD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  id *v29;
  id *v30;

  objc_destroyWeak(v30);
  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100036B2C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100036B3C(uint64_t a1)
{

}

id sub_100036B44(uint64_t a1)
{
  CRSetupPromptPresenterSession *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(CRSetupPromptPresenterSession);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setSessionDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setConnection:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentPresenterSession:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
}

void sub_100036BB4(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  id WeakRetained;
  _QWORD block[5];
  uint8_t buf[4];
  id v7;

  v2 = CarPairingLogging(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    *(_DWORD *)buf = 138412290;
    v7 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Setup prompt service connection interrupted: %@", buf, 0xCu);

  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100036CB0;
  block[3] = &unk_1000B51B8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_100036CB0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentPresenterSession:", 0);
}

void sub_100036CBC(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  id WeakRetained;
  _QWORD block[5];
  uint8_t buf[4];
  id v7;

  v2 = CarPairingLogging(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    *(_DWORD *)buf = 138412290;
    v7 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Setup prompt service connection invalidated: %@", buf, 0xCu);

  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100036DB8;
  block[3] = &unk_1000B51B8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_100036DB8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentPresenterSession:", 0);
}

void sub_1000371E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000371FC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a4;
  WeakRetained = objc_loadWeakRetained(v4);
  v6 = objc_retainAutorelease(v5);
  v7 = objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "length");

  objc_msgSend(WeakRetained, "_sendData:length:", v7, v8);
}

id sub_100037274()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)qword_1000DB858;
  v7 = qword_1000DB858;
  if (!qword_1000DB858)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100038590;
    v3[3] = &unk_1000B5320;
    v3[4] = &v4;
    sub_100038590((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_100037314(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100037430(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10003744C(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleReads");

}

void sub_100037844(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10003787C(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  void *v5;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "setRxpcConnection:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "rxpcConnection"));
  if (v4)
  {
    objc_msgSend(WeakRetained, "_setupACCTransportClient");
    objc_msgSend(WeakRetained, "_setupXPCEventHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "rxpcConnection"));
    xpc_remote_connection_activate();

  }
}

void sub_100037904(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleLockdownConnection:info:", a2, a3);

}

void sub_100037BC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100037BE4(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSString *v5;
  void *v6;
  xpc_type_t type;
  const void *data;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  size_t v20;
  NSErrorUserInfoKey v21;
  const __CFString *v22;
  NSErrorUserInfoKey v23;
  const __CFString *v24;
  NSErrorUserInfoKey v25;
  const __CFString *v26;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", xpc_copy_description(v3), 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  type = xpc_get_type(v3);
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (v3 == &_xpc_error_connection_invalid)
    {
      v25 = NSLocalizedDescriptionKey;
      v26 = CFSTR("Connection Invalid.");
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
      v14 = 0;
    }
    else if (v3 == &_xpc_error_termination_imminent)
    {
      v23 = NSLocalizedDescriptionKey;
      v24 = CFSTR("Termination Imminent.");
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
      v14 = 1;
    }
    else
    {
      if (v3 != &_xpc_error_connection_interrupted)
        goto LABEL_18;
      v21 = NSLocalizedDescriptionKey;
      v22 = CFSTR("Connection Interrupted.");
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
      v14 = 2;
    }
    v16 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.carkit.CRCarKitIAPServiceAgent"), v14, v13));

    if (v16)
    {
      v17 = CarGeneralLogging(type);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_10006CF84();

LABEL_20:
      objc_msgSend(WeakRetained, "_closeXPCConnection");
      goto LABEL_21;
    }
LABEL_18:
    v19 = CarGeneralLogging(type);
    v16 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_10006CF20();
    goto LABEL_20;
  }
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_dictionary)
  {
    v20 = 0;
    data = xpc_dictionary_get_data(v3, "payload", &v20);
    if (v20)
    {
      v9 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", data));
      v10 = objc_msgSend(sub_100037274(), "sharedClient");
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "endpointUUID"));
      objc_msgSend(v11, "processIncomingData:forEndpointWithUUID:", v9, v12);

    }
    else
    {
      v15 = CarGeneralLogging(data);
      v9 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        sub_10006CFE8();
    }

  }
LABEL_21:

}

void sub_10003808C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1000380B0(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v3;
  id v4;
  uint64_t v5;

  v5 = 0;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained + 2;
  do
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    os_unfair_lock_lock(v3);
    v4 = -[os_unfair_lock_s lock_lockdownConnection](WeakRetained, "lock_lockdownConnection");
    if (v4)
      lockdown_get_buffered_read_size(v4, &v5);
    else
      v5 = 0;
    os_unfair_lock_unlock(v3);
  }
  while (v5);

}

Class sub_100038590(uint64_t a1)
{
  char *v2;
  Class result;
  char *v4;
  __int128 v5;
  uint64_t v6;

  v4 = 0;
  if (!qword_1000DB860)
  {
    v5 = off_1000B6538;
    v6 = 0;
    qword_1000DB860 = _sl_dlopen(&v5, &v4);
    v2 = v4;
    if (!qword_1000DB860)
    {
      abort_report_np("%s", v4);
      goto LABEL_7;
    }
    if (v4)
      goto LABEL_8;
  }
  while (1)
  {
    result = objc_getClass("ACCTransportClient");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_7:
    v2 = (char *)sub_10006D0D0();
LABEL_8:
    free(v2);
  }
  qword_1000DB858 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100038798(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  unsigned int v4;
  id v5;
  NSObject *v6;
  CRLoggingFileReceiver *v7;
  void *v8;
  uint8_t v9[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "configuration"));
  v4 = objc_msgSend(v3, "supportsLogTransfer");

  if (v4)
  {
    v5 = sub_100056C84(0);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "session connected, setting up the logging file receiver", v9, 2u);
    }

    v7 = -[CRLoggingFileReceiver initWithSession:]([CRLoggingFileReceiver alloc], "initWithSession:", *(_QWORD *)(a1 + 32));
    v8 = (void *)WeakRetained[1];
    WeakRetained[1] = v7;

  }
}

void sub_1000388E8(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "currentLoggingFileReceiver"));

  if (v2)
  {
    v3 = sub_100056C84(0);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "session disconnected, removing the logging file receiver", v7, 2u);
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "currentLoggingFileReceiver"));
    objc_msgSend(v5, "invalidate");

    v6 = (void *)WeakRetained[1];
    WeakRetained[1] = 0;

  }
}

void sub_100038DB4(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;

  v2 = sub_100056C84(0);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v9 = 138412290;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Saved log archive from vehicle at %@", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "setTransaction:", 0);
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "currentCompletion"));
  v6 = (void *)v5;
  if (v5)
  {
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, *(_QWORD *)(a1 + 32));
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = 0;

  }
}

void sub_1000395BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10003999C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,id a23)
{
  _Block_object_dispose(&a23, 8);
  _Unwind_Resume(a1);
}

void sub_100039A04(uint64_t a1)
{
  id v2;
  NSObject *v3;
  id WeakRetained;
  id v5;

  v2 = sub_100056C84(1uLL);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    sub_10006D1D8(a1);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_removeConnection:", v5);

}

void sub_100039A7C(uint64_t a1)
{
  id v2;
  NSObject *v3;
  id WeakRetained;
  id v5;

  v2 = sub_100056C84(1uLL);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    sub_10006D248(a1);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_removeConnection:", v5);

}

void sub_100039C0C(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;

  v2 = sub_100056C84(1uLL);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v6 = 138543362;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Removing owners for connection: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "_work_queue_removeNavigationOwnerForConnection:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "observers"));
  objc_msgSend(v5, "removeObject:", *(_QWORD *)(a1 + 32));

}

id sub_100039E34(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_work_queue_updateOwnershipToiOSIfNecessary");
}

void sub_100039F60(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v2, "removeObserver:", *(_QWORD *)(a1 + 32));

}

id sub_10003A05C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_work_queue_navigationOwnershipChangedFromCar");
}

id sub_10003A140(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_work_queue_addNavigationIdentifer:supportsAccNav:forConnection:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

void sub_10003A1FC(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "observers"));
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

id sub_10003A300(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_work_queue_removeOwnerWithIdentifier:forConnection:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void sub_10003A460(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "owners"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastObject"));

  v3 = *(_QWORD *)(a1 + 40);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

}

void sub_10003A568(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_work_queue_activeNavigationIdentifiers"));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_10003A6A0(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  id v8;

  v8 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "connection"));
  if (objc_msgSend(v3, "processIdentifier") == *(_DWORD *)(a1 + 48))
  {
    v4 = *(void **)(a1 + 32);
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
      v6 = objc_msgSend(v4, "isEqualToString:", v5);

      v7 = v8;
      if (!v6)
        goto LABEL_9;
    }
    else
    {

    }
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
  }
  else
  {

  }
  v7 = v8;
LABEL_9:

}

void sub_10003ACCC(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;

  v3 = a2;
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "remoteObjectProxy"));
  if (objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___CRCarPlayNavigationOwnerClient))
    v5 = v4;
  else
    v5 = 0;

  if (v5)
  {
    v6 = sub_100056C84(1uLL);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138543362;
      v15 = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[addNavigationIdentifer] Informing navigation owner observer: %{public}@", (uint8_t *)&v14, 0xCu);
    }

    objc_msgSend(v5, "activeNavigationIdentifiersChangedTo:", *(_QWORD *)(a1 + 32));
  }
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "remoteObjectProxy"));
  if (objc_msgSend(v8, "conformsToProtocol:", &OBJC_PROTOCOL___CRNavigationClient))
    v9 = v8;
  else
    v9 = 0;

  if (v9)
  {
    v10 = sub_100056C84(1uLL);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138543362;
      v15 = v3;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[addNavigationIdentifer] Informing navigation observer: %{public}@", (uint8_t *)&v14, 0xCu);
    }

    objc_msgSend(v9, "activeNavigationIdentifiersChangedTo:", *(_QWORD *)(a1 + 32));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "accNavProvider"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "activeComponents"));
    objc_msgSend(v9, "didUpdateActiveComponents:", v13);

  }
}

void sub_10003B5FC(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;

  v3 = a2;
  v4 = sub_100056C84(1uLL);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[removeNavigationOwner] Informing navigation observer: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "remoteObjectProxy"));
  objc_msgSend(v6, "activeNavigationIdentifiersChangedTo:", *(_QWORD *)(a1 + 32));

}

void sub_10003B858(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  unsigned int v13;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "connection"));
  v5 = sub_100056C84(1uLL);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "connection"));
    v10 = 138543618;
    v11 = v7;
    v12 = 1024;
    v13 = objc_msgSend(v8, "processIdentifier");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[navigationOwnershipChangedFromCar] Informing navigation owner: %{public}@(%d)", (uint8_t *)&v10, 0x12u);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "remoteObjectProxy"));
  objc_msgSend(v9, "navigationOwnershipChangedTo:", *(_QWORD *)(a1 + 32));

}

void sub_10003BB50(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "identifier"));
  objc_msgSend(v2, "addObject:", v3);

}

void sub_10003C374(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  void *v19;

  v2 = sub_100056C84(1uLL);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "owners"));
    *(_DWORD *)buf = 138543618;
    v17 = v4;
    v18 = 2114;
    v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "activeComponents=%{public}@ owners=%{public}@", buf, 0x16u);

  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "owners", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(a1 + 40), "_work_queue_updateActiveComponents:forOwner:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10));
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

Class sub_10003C6E8(uint64_t a1)
{
  Class result;

  sub_10003C73C();
  result = objc_getClass("CRAccNavProvider");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_1000DB868 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_10006D450();
    return (Class)sub_10003C73C();
  }
  return result;
}

uint64_t sub_10003C73C()
{
  uint64_t v0;
  char *v1;
  char *v3;
  __int128 v4;
  uint64_t v5;

  v3 = 0;
  if (!qword_1000DB870)
  {
    v4 = off_1000B6660;
    v5 = 0;
    qword_1000DB870 = _sl_dlopen(&v4, &v3);
  }
  v0 = qword_1000DB870;
  v1 = v3;
  if (!qword_1000DB870)
  {
    v1 = (char *)abort_report_np("%s", v3);
    goto LABEL_7;
  }
  if (v3)
LABEL_7:
    free(v1);
  return v0;
}

id sub_10003C7EC(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "processIdentifier");
}

id sub_10003C7F8(uint64_t a1)
{
  return objc_loadWeakRetained((id *)(a1 + 32));
}

void sub_10003DD50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10003DD78(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003DE1C;
  v5[3] = &unk_1000B55B0;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

  objc_destroyWeak(&v7);
}

void sub_10003DE1C(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_presentNextStepAfterResponse:", *(_QWORD *)(a1 + 32));

}

void sub_10003E058(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_10003E074(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003E150;
  v6[3] = &unk_1000B5568;
  objc_copyWeak(&v9, (id *)(a1 + 64));
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  objc_msgSend(v3, "presentBluetoothConfirmationPromptForVehicleName:numericCode:responseHandler:", v4, v5, v6);

  objc_destroyWeak(&v9);
}

void sub_10003E13C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10003E150(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  const __CFString *v14;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = CarPairingLogging(WeakRetained);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if ((_DWORD)a2)
      v7 = CFSTR("YES");
    v13 = 138543362;
    v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Bluetooth confirmation prompt received response: %{public}@", (uint8_t *)&v13, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a2));
  objc_msgSend(WeakRetained, "setBluetoothConfirmed:", v8);

  if (!(_DWORD)a2 || (objc_msgSend(WeakRetained, "showBluetoothOnlyOption") & 1) == 0)
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "promptDelegate"));
    v10 = (void *)v9;
    if (v9
      && (objc_opt_respondsToSelector(v9, "pairingPromptFlow:receivedBluetoothConfirmationResponse:forDeviceIdentifier:") & 1) != 0)
    {
      objc_msgSend(v10, "pairingPromptFlow:receivedBluetoothConfirmationResponse:forDeviceIdentifier:", WeakRetained, a2, *(_QWORD *)(a1 + 32));
    }

  }
  objc_msgSend(WeakRetained, "setNumericCode:", 0);
  v11 = *(_QWORD *)(a1 + 40);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a2));
  (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

}

void sub_10003E3B8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_10003E3D4(id *a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;

  v3 = a2;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003E49C;
  v4[3] = &unk_1000B5568;
  objc_copyWeak(&v7, a1 + 6);
  v5 = a1[4];
  v6 = a1[5];
  objc_msgSend(v3, "presentBluetoothContactsSyncPromptWithResponseHandler:", v4);

  objc_destroyWeak(&v7);
}

void sub_10003E488(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10003E49C(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  int v14;
  const __CFString *v15;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = CarPairingLogging(WeakRetained);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if ((_DWORD)a2)
      v7 = CFSTR("YES");
    v14 = 138543362;
    v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Bluetooth contacts sync prompt received response: %{public}@", (uint8_t *)&v14, 0xCu);
  }

  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "promptDelegate"));
  v9 = (void *)v8;
  if (v8
    && (objc_opt_respondsToSelector(v8, "pairingPromptFlow:receivedBluetoothContactsSyncResponse:forDeviceIdentifier:") & 1) != 0)
  {
    objc_msgSend(v9, "pairingPromptFlow:receivedBluetoothContactsSyncResponse:forDeviceIdentifier:", WeakRetained, a2, *(_QWORD *)(a1 + 32));
  }
  if (objc_msgSend(WeakRetained, "showBluetoothOnlyOption"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "bluetoothConfirmed"));
    v11 = objc_msgSend(v10, "BOOLValue");

    if (v9)
    {
      if (v11
        && (objc_opt_respondsToSelector(v9, "pairingPromptFlow:receivedBluetoothConfirmationResponse:forDeviceIdentifier:") & 1) != 0)
      {
        objc_msgSend(v9, "pairingPromptFlow:receivedBluetoothConfirmationResponse:forDeviceIdentifier:", WeakRetained, 1, *(_QWORD *)(a1 + 32));
      }
    }
  }
  v12 = *(_QWORD *)(a1 + 40);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a2));
  (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);

}

void sub_10003E6FC(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v3 = *(unsigned __int8 *)(a1 + 48);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003E780;
  v5[3] = &unk_1000B5628;
  v4 = *(_QWORD *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(a2, "presentBluetoothFailedPromptForVehicleName:isTimeout:responseHandler:", v4, v3, v5);

}

uint64_t sub_10003E780(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v5[16];

  v2 = CarPairingLogging(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Bluetooth failed prompt received response", v5, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10003E878(id a1, CRPairingPromptPresenting *a2)
{
  -[CRPairingPromptPresenting presentWaitingPrompt](a2, "presentWaitingPrompt");
}

void sub_10003E95C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_10003E978(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003EA34;
  v5[3] = &unk_1000B6760;
  objc_copyWeak(&v7, (id *)(a1 + 48));
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "presentAllowWhileLockedPromptForVehicleName:responseHandler:", v4, v5);

  objc_destroyWeak(&v7);
}

void sub_10003EA20(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10003EA34(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  const __CFString *v14;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = CarPairingLogging(WeakRetained);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if ((_DWORD)a2)
      v7 = CFSTR("YES");
    v13 = 138543362;
    v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "allow while locked prompt received response: %{public}@", (uint8_t *)&v13, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a2));
  objc_msgSend(WeakRetained, "setPairingAccepted:", v8);

  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "promptDelegate"));
  v10 = (void *)v9;
  if (v9 && (objc_opt_respondsToSelector(v9, "pairingPromptFlow:receivedAllowWhileLockedResponse:") & 1) != 0)
    objc_msgSend(v10, "pairingPromptFlow:receivedAllowWhileLockedResponse:", WeakRetained, a2);
  v11 = *(_QWORD *)(a1 + 32);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a2));
  (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

}

void sub_10003EEB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10003EED0(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  __int16 v11;

  v3 = a2;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003EFBC;
  v8[3] = &unk_1000B67B0;
  objc_copyWeak(&v10, (id *)(a1 + 48));
  v11 = *(_WORD *)(a1 + 72);
  v9 = *(id *)(a1 + 40);
  v4 = objc_retainBlock(v8);
  v5 = objc_msgSend(*(id *)(a1 + 32), "_supportsThemeAssets");
  v6 = *(_QWORD *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 64);
  if (v5)
    objc_msgSend(v3, "presentAssetSupportingUseWirelessPromptWithWirelessEnablement:declineVariant:responseHandler:", v6, v7, v4);
  else
    objc_msgSend(v3, "presentUseWirelessPromptWithWirelessEnablement:declineVariant:responseHandler:", v6, v7, v4);

  objc_destroyWeak(&v10);
}

void sub_10003EFA8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10003EFBC(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  const __CFString *v13;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = CarPairingLogging(WeakRetained);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if ((_DWORD)a2)
      v7 = CFSTR("YES");
    v12 = 138543362;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "use wireless prompt received response: %{public}@", (uint8_t *)&v12, 0xCu);
  }

  if ((a2 & 1) == 0)
    objc_msgSend(WeakRetained, "_incrementOutOfBandPairingDeclineCount");
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "promptDelegate"));
  v9 = (void *)v8;
  if (v8
    && (objc_opt_respondsToSelector(v8, "pairingPromptFlow:receivedUseWirelessResponse:turnOnBluetooth:turnOnWiFi:") & 1) != 0)
  {
    objc_msgSend(v9, "pairingPromptFlow:receivedUseWirelessResponse:turnOnBluetooth:turnOnWiFi:", WeakRetained, a2, *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49));
  }
  v10 = *(_QWORD *)(a1 + 32);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a2));
  (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);

}

void sub_10003F244(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 64));
  _Unwind_Resume(a1);
}

void sub_10003F260(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  unsigned int v5;
  uint64_t v6;
  _BOOL8 v7;
  _QWORD v8[4];
  id v9;
  id v10;
  char v11;

  v3 = a2;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003F358;
  v8[3] = &unk_1000B6800;
  objc_copyWeak(&v10, (id *)(a1 + 48));
  v11 = *(_BYTE *)(a1 + 64);
  v9 = *(id *)(a1 + 40);
  v4 = objc_retainBlock(v8);
  v5 = objc_msgSend(*(id *)(a1 + 32), "_supportsThemeAssets");
  v6 = *(_QWORD *)(a1 + 56);
  v7 = *(_BYTE *)(a1 + 65) != 0;
  if (v5)
    objc_msgSend(v3, "presentAssetSupportingConnectPromptWithBluetoothOnlyOption:wirelessEnablement:responseHandler:", v7, v6, v4);
  else
    objc_msgSend(v3, "presentConnectPromptWithBluetoothOnlyOption:wirelessEnablement:responseHandler:", v7, v6, v4);

  objc_destroyWeak(&v10);
}

void sub_10003F344(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10003F358(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  const __CFString *v14;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = CarPairingLogging(WeakRetained);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if ((_DWORD)a2)
      v7 = CFSTR("YES");
    v13 = 138543362;
    v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "connect CarPlay prompt received response: %{public}@", (uint8_t *)&v13, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a2));
  objc_msgSend(WeakRetained, "setPairingAccepted:", v8);

  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "promptDelegate"));
  v10 = (void *)v9;
  if (v9 && (objc_opt_respondsToSelector(v9, "pairingPromptFlow:receivedConnectCarPlayResponse:turnOnWiFi:") & 1) != 0)
    objc_msgSend(v10, "pairingPromptFlow:receivedConnectCarPlayResponse:turnOnWiFi:", WeakRetained, a2, *(unsigned __int8 *)(a1 + 48));
  v11 = *(_QWORD *)(a1 + 32);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a2));
  (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

}

void sub_10003F5FC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 64));
  _Unwind_Resume(a1);
}

void sub_10003F618(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  unsigned int v5;
  uint64_t v6;
  _BOOL8 v7;
  _QWORD v8[4];
  id v9;
  id v10;
  char v11;

  v3 = a2;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003F710;
  v8[3] = &unk_1000B6800;
  objc_copyWeak(&v10, (id *)(a1 + 48));
  v11 = *(_BYTE *)(a1 + 64);
  v9 = *(id *)(a1 + 40);
  v4 = objc_retainBlock(v8);
  v5 = objc_msgSend(*(id *)(a1 + 32), "_supportsThemeAssets");
  v6 = *(_QWORD *)(a1 + 56);
  v7 = *(_BYTE *)(a1 + 65) != 0;
  if (v5)
    objc_msgSend(v3, "presentAssetSupportingConnectPromptWithBluetoothOnlyOption:wirelessEnablement:responseHandler:", v7, v6, v4);
  else
    objc_msgSend(v3, "presentConnectPromptWithBluetoothOnlyOption:wirelessEnablement:responseHandler:", v7, v6, v4);

  objc_destroyWeak(&v10);
}

void sub_10003F6FC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10003F710(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  const __CFString *v18;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = CarPairingLogging(WeakRetained);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if ((_DWORD)a2)
      v7 = CFSTR("YES");
    v17 = 138543362;
    v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "connect CarPlay from car key prompt received response: %{public}@", (uint8_t *)&v17, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a2));
  objc_msgSend(WeakRetained, "setPairingAccepted:", v8);

  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "promptDelegate"));
  v10 = (void *)v9;
  if (v9
    && (objc_opt_respondsToSelector(v9, "pairingPromptFlow:receivedConnectCarPlayFromCarKeyResponse:vehicleName:turnOnWiFi:") & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "vehicleName"));
    v12 = v11;
    if (v11)
      v13 = v11;
    else
      v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "bluetoothDeviceIdentifier"));
    v14 = v13;

    objc_msgSend(v10, "pairingPromptFlow:receivedConnectCarPlayFromCarKeyResponse:vehicleName:turnOnWiFi:", WeakRetained, a2, v14, *(unsigned __int8 *)(a1 + 48));
  }
  v15 = *(_QWORD *)(a1 + 32);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a2));
  (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v16);

}

void sub_10003F99C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_10003F9B8(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003FA74;
  v5[3] = &unk_1000B6760;
  objc_copyWeak(&v7, (id *)(a1 + 48));
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "presentEnhancedIntegrationPromptForVehicleName:responseHandler:", v4, v5);

  objc_destroyWeak(&v7);
}

void sub_10003FA60(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10003FA74(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  const __CFString *v13;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = CarPairingLogging(WeakRetained);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if ((_DWORD)a2)
      v7 = CFSTR("YES");
    v12 = 138543362;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "enhanced integrated prompt received response: %{public}@", (uint8_t *)&v12, 0xCu);
  }

  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "promptDelegate"));
  v9 = (void *)v8;
  if (v8 && (objc_opt_respondsToSelector(v8, "pairingPromptFlow:receivedEnhancedIntegrationResponse:") & 1) != 0)
    objc_msgSend(v9, "pairingPromptFlow:receivedEnhancedIntegrationResponse:", WeakRetained, a2);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a2));
  (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);

}

void sub_10003FCF8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_10003FD14(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003FE18;
  v9[3] = &unk_1000B5628;
  v10 = *(id *)(a1 + 48);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003FE94;
  v6[3] = &unk_1000B6760;
  objc_copyWeak(&v8, (id *)(a1 + 56));
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v3, "presentAssetProgressForVehicleName:progress:completionHandler:cancelHandler:", v4, v5, v9, v6);

  objc_destroyWeak(&v8);
}

void sub_10003FE04(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10003FE18(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v5[16];

  v2 = CarPairingLogging(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "asset progress prompt completed", v5, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10003FE94(uint64_t a1, int a2)
{
  id WeakRetained;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  uint8_t v8[16];
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = CarPairingLogging(WeakRetained);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "asset progress prompt: ready soon.", buf, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    if (v7)
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "asset progress prompt: canceled", v8, 2u);
    }

    objc_msgSend(WeakRetained, "_cancelWithRequiredStepsRemaining:", 1);
  }

}

void sub_100040018(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004008C;
  v4[3] = &unk_1000B5628;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "presentAssetReadyForVehicleName:confirmationHandler:", v3, v4);

}

uint64_t sub_10004008C(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v5[16];

  v2 = CarPairingLogging(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "asset ready prompt was confirmed", v5, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1000401AC(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100040220;
  v4[3] = &unk_1000B5628;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "presentAssetReadySoonForVehicleName:confirmationHandler:", v3, v4);

}

uint64_t sub_100040220(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v5[16];

  v2 = CarPairingLogging(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "asset ready soon prompt was confirmed", v5, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100040368(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000403EC;
  v5[3] = &unk_1000B5628;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(a2, "presentSetupCarKeysPromptForVehicleName:carKeyInfo:cancelHandler:", v3, v4, v5);

}

uint64_t sub_1000403EC(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v5[16];

  v2 = CarPairingLogging(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "setup car keys prompt was canceled", v5, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100040BBC(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = CarPairingLogging(WeakRetained);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "initializeForVehicleAddress: %@ keyIdentifier: %@", (uint8_t *)&v7, 0x16u);
  }

  objc_msgSend(WeakRetained, "setBluetoothAddress:", *(_QWORD *)(a1 + 32));
  objc_msgSend(WeakRetained, "setKeyIdentifier:", *(_QWORD *)(a1 + 40));
  objc_msgSend(WeakRetained, "setActive:", 1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void sub_100040D7C(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  _QWORD *v7;
  id v8;
  void *v9;
  id v10;
  char v11;
  void *v12;
  _BOOL8 v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  _QWORD v32[4];
  _QWORD *v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  uint8_t buf[4];
  void *v40;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = CarPairingLogging(WeakRetained);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = *(void **)(a1 + 48);
    *(_DWORD *)buf = 134217984;
    v40 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "requestPairingForIntent: %lu", buf, 0xCu);
  }

  objc_msgSend(WeakRetained, "setIntent:", *(_QWORD *)(a1 + 48));
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100041210;
  v36[3] = &unk_1000B6940;
  objc_copyWeak(&v38, v2);
  v37 = *(id *)(a1 + 32);
  v7 = objc_retainBlock(v36);
  v8 = objc_msgSend(WeakRetained, "isPairingAvailable");
  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "bluetoothAddress"));
    v10 = objc_msgSend(WeakRetained, "isActive");
    if (v9)
      v11 = (char)v10;
    else
      v11 = 0;
    if ((v11 & 1) == 0)
    {
      v18 = CarPairingLogging(v10);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_10006D57C();

      ((void (*)(_QWORD *, uint64_t, _QWORD))v7[2])(v7, 5, 0);
      goto LABEL_33;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[CRBluetoothManager addressStringForData:](CRBluetoothManager, "addressStringForData:", v9));
    v13 = +[CRBluetoothManager hasPairingWithAddress:](CRBluetoothManager, "hasPairingWithAddress:", v12);
    if (v13)
    {
      v14 = CarPairingLogging(v13);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        v40 = v12;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "cannot start pairing, already paired with %{private}@", buf, 0xCu);
      }

      ((void (*)(_QWORD *, uint64_t, _QWORD))v7[2])(v7, 1, 0);
      goto LABEL_32;
    }
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100041304;
    v32[3] = &unk_1000B6400;
    objc_copyWeak(&v35, v2);
    v33 = v7;
    v34 = *(id *)(a1 + 32);
    v20 = CarPairingLogging(objc_msgSend(WeakRetained, "setPromptResponseHandler:", v32));
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "pairing request setup, waiting on user prompt response", buf, 2u);
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "carPlayPreferences"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "isCCCHeadUnitPairingOverrideEnabled"));

    if (!v23 || !objc_msgSend(v23, "BOOLValue"))
    {
LABEL_31:

      objc_destroyWeak(&v35);
LABEL_32:

LABEL_33:
      goto LABEL_34;
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "carPlayPreferences"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "shouldAlwaysAcceptCCCHeadUnitPairing"));

    if (!v25)
    {
LABEL_30:

      goto LABEL_31;
    }
    v26 = objc_msgSend(v25, "BOOLValue");
    v27 = v26;
    if ((_DWORD)v26)
    {
      v28 = CarPairingLogging(v26);
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v30 = "accepting head unit pairing due to preview preference";
LABEL_28:
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, v30, buf, 2u);
      }
    }
    else
    {
      v31 = CarPairingLogging(v26);
      v29 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v30 = "declining head unit pairing due to preview preference";
        goto LABEL_28;
      }
    }

    objc_msgSend(WeakRetained, "handlePairingPromptResponse:", v27);
    goto LABEL_30;
  }
  v16 = CarPairingLogging(v8);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    sub_10006D5A8();

  ((void (*)(_QWORD *, uint64_t, _QWORD))v7[2])(v7, 2, 0);
LABEL_34:

  objc_destroyWeak(&v38);
}

void sub_1000411AC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100041210(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint8_t v14[16];

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setActive:", 0);
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
  {
    (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, id))(v7 + 16))(v7, a2, 0, 0, 0, 0, 0, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CARAnalytics sharedInstance](CARAnalytics, "sharedInstance"));
    v9 = v8;
    v10 = a2 ? 4 : 3;
    objc_msgSend(v8, "setCarKeyPairingResult:", v10);

    if (a2 == 5)
    {
      v12 = CarPairingLogging(v11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "failed CCC head unit pairing", v14, 2u);
      }

    }
  }

}

void sub_100041304(id *a1, char a2)
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v5 = WeakRetained;
  if ((a2 & 1) != 0)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10004142C;
    v10[3] = &unk_1000B6968;
    v11 = a1[5];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100041580;
    v8[3] = &unk_1000B5628;
    v9 = a1[4];
    objc_msgSend(v5, "_mainQueue_requestLocalOOBDataWithCompletion:errorHandler:", v10, v8);

  }
  else
  {
    v6 = CarPairingLogging(WeakRetained);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "declining head unit pairing", buf, 2u);
    }

    (*((void (**)(void))a1[4] + 2))();
  }

}

void sub_10004142C(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  int v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = CarPairingLogging(v15);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v19 = 138478851;
    v20 = v11;
    v21 = 2113;
    v22 = v12;
    v23 = 2113;
    v24 = v13;
    v25 = 2113;
    v26 = v14;
    v27 = 2113;
    v28 = v15;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "replying with this address: %{private}@, c192: %{private}@ r192: %{private}@ c256: %{private}@ r256: %{private}@", (uint8_t *)&v19, 0x34u);
  }

  v18 = *(_QWORD *)(a1 + 32);
  if (v18)
    (*(void (**)(uint64_t, _QWORD, id, id, id, id, id, _QWORD))(v18 + 16))(v18, 0, v11, v12, v13, v14, v15, 0);

}

uint64_t sub_100041580(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;

  v2 = CarPairingLogging(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    sub_10006D5D4();

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100041728(id *a1)
{
  id WeakRetained;
  uint64_t v3;
  NSObject *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;

  WeakRetained = objc_loadWeakRetained(a1 + 9);
  v3 = CarPairingLogging(WeakRetained);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = a1[4];
    v6 = a1[5];
    v7 = a1[6];
    v8 = a1[7];
    *(_DWORD *)buf = 138413058;
    v16 = v5;
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v7;
    v21 = 2112;
    v22 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "setupVehicleDataC192: %@ r192: %@ c256: %@ r256: %@", buf, 0x2Au);
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000418A4;
  v9[3] = &unk_1000B6A08;
  v9[4] = WeakRetained;
  v14 = a1[8];
  v10 = a1[4];
  v11 = a1[5];
  v12 = a1[6];
  v13 = a1[7];
  objc_msgSend(WeakRetained, "_mainQueue_performWithPairingAgent:", v9);

}

void sub_1000418A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  _QWORD *v19;
  void *v20;
  _QWORD *v21;
  void *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[4];
  _QWORD *v28;
  uint64_t v29;
  id v30;
  int v31;
  _QWORD v32[5];
  id v33;
  _QWORD v34[2];

  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100041B5C;
  v32[3] = &unk_1000B69B8;
  v32[4] = *(_QWORD *)(a1 + 32);
  v33 = *(id *)(a1 + 72);
  v6 = objc_retainBlock(v32);
  v7 = objc_msgSend(*(id *)(a1 + 32), "isActive");
  if ((_DWORD)v7
    && (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bluetoothAddress")),
        v8,
        v8))
  {
    v9 = objc_msgSend(*(id *)(a1 + 32), "_remoteDeviceFromSession:", a3);
    if (v9)
    {
      v10 = v9;
      v11 = BTPairingAgentClearOOBDataForDevice(a2, v9);
      if ((_DWORD)v11)
      {
        v12 = CarPairingLogging(v11);
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          sub_10006D68C();
      }
      else
      {
        v34[0] = 0;
        v34[1] = 0;
        v16 = *(void **)(a1 + 40);
        if (v16)
          v17 = objc_msgSend(objc_retainAutorelease(v16), "bytes");
        else
          v17 = v34;
        v18 = *(void **)(a1 + 48);
        if (v18)
          v19 = objc_msgSend(objc_retainAutorelease(v18), "bytes");
        else
          v19 = v34;
        v20 = *(void **)(a1 + 56);
        if (v20)
          v21 = objc_msgSend(objc_retainAutorelease(v20), "bytes");
        else
          v21 = v34;
        v22 = *(void **)(a1 + 64);
        if (v22)
          v23 = objc_msgSend(objc_retainAutorelease(v22), "bytes");
        else
          v23 = v34;
        v24 = BTPairingAgentSetOOBDataForDevice(a2, v10, v17, v19, v21, v23);
        if (!(_DWORD)v24)
        {
          v26 = *(void **)(a1 + 32);
          v27[0] = _NSConcreteStackBlock;
          v27[1] = 3221225472;
          v27[2] = sub_100041C40;
          v27[3] = &unk_1000B69E0;
          v28 = v6;
          v29 = a2;
          v30 = v10;
          v31 = 0;
          objc_msgSend(v26, "_mainQueue_connectDevice:session:completion:", v10, a3, v27);

          goto LABEL_10;
        }
        v25 = CarPairingLogging(v24);
        v13 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          sub_10006D62C();
      }
    }
    else
    {
      v15 = CarPairingLogging(0);
      v13 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_10006D600();
    }
  }
  else
  {
    v14 = CarPairingLogging(v7);
    v13 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10006D57C();
  }

  ((void (*)(_QWORD *, uint64_t, _QWORD))v6[2])(v6, 5, 0);
LABEL_10:

}

void sub_100041B5C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t v13[16];

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setActive:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_mainQueue_delegateDidFinishWithResult:error:", a2, v5);
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CARAnalytics sharedInstance](CARAnalytics, "sharedInstance"));
    v8 = v7;
    v9 = a2 ? 4 : 3;
    objc_msgSend(v7, "setCarKeyPairingResult:", v9);

    if (a2 == 5)
    {
      v11 = CarPairingLogging(v10);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "failed CCC head unit pairing", v13, 2u);
      }

    }
  }

}

void sub_100041C40(_QWORD *a1, int a2)
{
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  void (*v7)(void);
  uint64_t v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t v19[16];
  uint8_t v20[16];
  uint8_t buf[16];

  v4 = CarPairingLogging(a1);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "pairing completed successfully", buf, 2u);
    }

    v7 = *(void (**)(void))(a1[4] + 16);
  }
  else
  {
    if (v6)
    {
      *(_WORD *)v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "pairing completed with failure", v20, 2u);
    }

    v7 = *(void (**)(void))(a1[4] + 16);
  }
  v7();
  v8 = BTPairingAgentClearOOBDataForDevice(a1[5], a1[6]);
  v9 = v8;
  v10 = CarPairingLogging(v8);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_10006D6EC((uint64_t)a1, v12, v13, v14, v15, v16, v17, v18);
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "cleared OOB data", v19, 2u);
  }

}

void sub_100041E08(uint64_t a1)
{
  id WeakRetained;
  id v2;
  char v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "isActive");
  v3 = (char)v2;
  v4 = CarPairingLogging(v2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if ((v3 & 1) != 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "cancelPairing, canceling active session", buf, 2u);
    }

    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100041F18;
    v7[3] = &unk_1000B6A58;
    v7[4] = WeakRetained;
    objc_msgSend(WeakRetained, "_mainQueue_performWithPairingAgent:", v7);
    objc_msgSend(WeakRetained, "_mainQueue_delegateDidFinishWithResult:error:", 4, 0);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "skipping cancelPairing, no active session", buf, 2u);
    }

  }
}

id sub_100041F18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  NSObject *v19;
  uint8_t v21[16];
  uint8_t buf[8];
  int v23;
  __int16 v24;

  v6 = BTPairingAgentCancelPairing(a2);
  v7 = v6;
  v8 = CarPairingLogging(v6);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10006D814();
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "successfully canceled BT pairing", buf, 2u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bluetoothAddress"));
  if (v11)
  {
    v24 = 0;
    v23 = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bluetoothAddress"));
    objc_msgSend(v12, "getBytes:length:", &v23, 6);

    *(_QWORD *)buf = 0;
    v13 = BTDeviceFromAddress(a3, &v23, buf);
    if ((_DWORD)v13)
    {
      v14 = CarPairingLogging(v13);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_10006D7B4();
    }
    else
    {
      v16 = BTPairingAgentClearOOBDataForDevice(a2, *(_QWORD *)buf);
      v17 = v16;
      v18 = CarPairingLogging(v16);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      v15 = v19;
      if (v17)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          sub_10006D754();
      }
      else if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "cleared OOB data", v21, 2u);
      }
    }

  }
  return objc_msgSend(*(id *)(a1 + 32), "setActive:", 0);
}

void sub_10004254C(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

id sub_100042560(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7;
  NSObject *v8;
  _DWORD v10[2];

  v7 = CarPairingLogging(a1);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v10[0] = 67240192;
    v10[1] = a2;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "BT session event: %{public}i", (uint8_t *)v10, 8u);
  }

  return objc_msgSend(a4, "_mainQueue_handleEvent:forSession:", a2, a1);
}

void sub_100042620(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000426B0;
  v2[3] = &unk_1000B57A0;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  v3 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);

  objc_destroyWeak(&v4);
}

void sub_1000426B0(uint64_t a1)
{
  _QWORD *WeakRetained;
  uint64_t v3;
  _QWORD *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
    {
      v4 = WeakRetained;
      (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, WeakRetained[1]);
      WeakRetained = v4;
    }
  }

}

void sub_10004277C(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;

  v2 = CarPairingLogging(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_10006D9EC();

  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "waitingOnSession"));
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);

}

void sub_1000428C0(uint64_t a1)
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004291C;
  block[3] = &unk_1000B51B8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t sub_10004291C(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;

  v1 = result;
  v2 = *(_QWORD *)(result + 32);
  if (*(_QWORD *)(v2 + 16))
  {
    v3 = CarPairingLogging(result);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      sub_10006DA70();

    BTPairingAgentStop(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 16));
    result = BTPairingAgentDestroy(*(_QWORD *)(v1 + 32) + 16);
    *(_QWORD *)(*(_QWORD *)(v1 + 32) + 16) = 0;
    v2 = *(_QWORD *)(v1 + 32);
  }
  if (*(_QWORD *)(v2 + 8))
  {
    v5 = CarPairingLogging(result);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      sub_10006DA44();

    BTServiceRemoveCallbacks(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 8), sub_1000429E8);
    result = BTSessionDetachWithQueue(*(_QWORD *)(v1 + 32) + 8);
    *(_QWORD *)(*(_QWORD *)(v1 + 32) + 8) = 0;
  }
  return result;
}

void sub_1000429E8(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, void *a6)
{
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  int v14;

  if (a3 == 1)
  {
    if (a4 == 12)
    {
      v11 = CarPairingLogging(a1);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = 67240192;
        v14 = a2;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "disconnected BT service %{public}i", (uint8_t *)&v13, 8u);
      }

    }
  }
  else if (!a3 && a4 == 11)
  {
    v9 = CarPairingLogging(a1);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v13 = 67240192;
      v14 = a2;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "connected BT service %{public}i", (uint8_t *)&v13, 8u);
    }

    objc_msgSend(a6, "_mainQueue_handleDidConnectDevice:service:", a1, a2);
  }
}

id sub_100042C64(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;

  v2 = CarPairingLogging(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_10006DB20();

  return objc_msgSend(*(id *)(a1 + 32), "setSessionDetachHandler:", 0);
}

void sub_100042D74(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100042D90(uint64_t a1, uint64_t a2)
{
  char *WeakRetained;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void (*v9)(uint64_t, int);
  __int128 v10;
  __int128 v11;
  id (*v12)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *);

  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      if (!*((_QWORD *)WeakRetained + 2))
      {
        v11 = 0u;
        v10 = 0u;
        v9 = sub_100042E58;
        v12 = sub_100042EF8;
        v6 = BTPairingAgentCreate(a2, &v9, WeakRetained, WeakRetained + 16);
        if ((_DWORD)v6)
        {
          v7 = CarPairingLogging(v6);
          v8 = objc_claimAutoreleasedReturnValue(v7);
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
            sub_10006DB4C();

        }
      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void sub_100042E58(uint64_t a1, int a2)
{
  uint64_t v3;
  NSObject *v4;
  _DWORD v5[2];

  v3 = CarPairingLogging(a1);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67240192;
    v5[1] = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "BT pairing event: %{public}i", (uint8_t *)v5, 8u);
  }

}

id sub_100042EF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  return objc_msgSend(a6, "_mainQueue_handleLocalOOBDataC192:r192:c256:r256:", a2, a3, a4, a5);
}

void sub_100042FF4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100043010(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = WeakRetained;
  if (a2 && WeakRetained)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_localDeviceAddressFromSession:", a3));
    if (v8)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10004312C;
      v13[3] = &unk_1000B6AA8;
      v15 = *(id *)(a1 + 40);
      v14 = v8;
      objc_msgSend(v7, "setLocalOOBDataHandler:", v13);
      BTPairingAgentGetLocalOOBData(a2);

    }
    else
    {
      v10 = CarPairingLogging(0);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_10006DB78();

      v12 = *(_QWORD *)(a1 + 32);
      if (v12)
        (*(void (**)(void))(v12 + 16))();
    }

  }
  else
  {
    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
      (*(void (**)(void))(v9 + 16))();
  }

}

uint64_t sub_10004312C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t))(result + 16))(result, *(_QWORD *)(a1 + 32), a2, a3, a4, a5);
  return result;
}

void sub_100043520(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_100043544(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "connectionTimer"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "connectionTimer"));
    objc_msgSend(v5, "invalidate");

    objc_msgSend(WeakRetained, "setConnectionTimer:", 0);
  }
  BTServiceRemoveCallbacks(*(_QWORD *)(a1 + 48), sub_1000429E8);
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, a2);

}

uint64_t sub_1000435E0(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v5[16];

  v2 = CarPairingLogging(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "connected BT using OOB pairing data", v5, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_100043658(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;

  v2 = CarPairingLogging(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    sub_10006DC64();

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10004371C(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  id v7;
  int v8;
  uint64_t ConnectedServices;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  int v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bluetoothAddress"));
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRBluetoothManager addressStringForData:](CRBluetoothManager, "addressStringForData:", v2));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_addressStringForDevice:", *(_QWORD *)(a1 + 40)));
    v5 = (void *)v4;
    if (v3)
      v6 = v4 == 0;
    else
      v6 = 1;
    if (!v6)
    {
      v7 = objc_msgSend(v3, "isEqualToString:", v4);
      if ((v7 & 1) != 0)
      {
        v8 = objc_msgSend(*(id *)(a1 + 32), "_intendedServiceMask");
        v18 = 0;
        ConnectedServices = BTDeviceGetConnectedServices(*(_QWORD *)(a1 + 40), &v18);
        if ((_DWORD)ConnectedServices)
        {
          v10 = CarPairingLogging(ConnectedServices);
          v11 = objc_claimAutoreleasedReturnValue(v10);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            sub_10006DD18();
        }
        else
        {
          v14 = v18 & v8;
          v15 = CarPairingLogging(ConnectedServices);
          v16 = objc_claimAutoreleasedReturnValue(v15);
          v11 = v16;
          if (v14)
          {
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138478083;
              v20 = v5;
              v21 = 1024;
              LODWORD(v22) = v18;
              _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "bluetooth connected to %{private}@ with services: %i", buf, 0x12u);
            }

            v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bluetoothConnectedHandler"));
            v11 = v17;
            if (v17)
              (*(void (**)(uint64_t))(v17 + 16))(v17);
          }
          else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            sub_10006DC90(&v18, v8, v11);
          }
        }

      }
      else
      {
        v12 = CarPairingLogging(v7);
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138478083;
          v20 = v5;
          v21 = 2113;
          v22 = v3;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "connected address %{private}@ doesn't match expected address %{private}@", buf, 0x16u);
        }

      }
    }

  }
}

void sub_100043BB8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_100043C8C(uint64_t a1, void *a2)
{
  id v2;
  _QWORD block[4];
  id v4;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100044EB4;
  block[3] = &unk_1000B51B8;
  v4 = a2;
  v2 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_100043D90(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___CRCarPlayDNDService));
  v2 = (void *)qword_1000DB888;
  qword_1000DB888 = v1;

}

void sub_100044164(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_100044180(uint64_t a1)
{
  id WeakRetained;
  id v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  char v9;

  if (*(_BYTE *)(a1 + 48))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_createDrivingActivityModeIfNeeded:", 1);

  }
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v3, "setActivatedByUserAction:", *(unsigned __int8 *)(a1 + 48));

  v4 = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = *(unsigned __int8 *)(a1 + 48);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100044290;
  v6[3] = &unk_1000B6800;
  v9 = v5;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v4, "_setDNDActive:trigger:withStartingGeofence:completion:", v5, 1, 0, v6);

  objc_destroyWeak(&v8);
}

void sub_10004427C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100044290(uint64_t a1, uint64_t a2)
{
  char v2;
  unsigned __int8 *v4;
  uint64_t v5;
  NSObject *v6;
  id WeakRetained;
  _QWORD v8[4];
  id v9;

  v2 = a2;
  v4 = (unsigned __int8 *)(a1 + 48);
  if (*(unsigned __int8 *)(a1 + 48) == (_DWORD)a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v5 = CarDNDWDLogging(a1, a2);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      sub_10006DE24(v4, v2, v6);

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10004438C;
    v8[3] = &unk_1000B5858;
    v9 = *(id *)(a1 + 32);
    objc_msgSend(WeakRetained, "_setDNDActive:trigger:withStartingGeofence:completion:", 0, 1, 0, v8);

  }
}

uint64_t sub_10004438C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100044440(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(+[CARDNDManager sharedManager](CARDNDManager, "sharedManager"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "status"));
  objc_msgSend(v2, "setAutomaticDNDTriggeringMethod:", 0);

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "status"));
  objc_msgSend(v3, "setHasAdjustedTriggerMethod:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "status"));
  objc_msgSend(v4, "setActivateWithCarPlay:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "status"));
  objc_msgSend(v5, "setHasMigratedToDriving:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assertionTrap"));
  objc_msgSend(v6, "releaseAllAssertions");

  objc_msgSend(v7, "setLastKnownReportTime:", 0.0);
  objc_msgSend(v7, "_cancelUserDisabledTimer");

}

uint64_t sub_100044A5C(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  const __CFString *v6;
  unint64_t v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  __CFNotificationCenter *DarwinNotifyCenter;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CARAnalytics sharedInstance](CARAnalytics, "sharedInstance"));
  v5 = v4;
  if (a2 > 4)
    v6 = CFSTR("Unknown");
  else
    v6 = off_1000B6C38[a2];
  v7 = *(_QWORD *)(a1 + 40);
  if (v7 > 4)
    v8 = CFSTR("Unknown");
  else
    v8 = off_1000B6C38[v7];
  objc_msgSend(v4, "userChangedAutoReplyFromAudience:toAudience:messageChanged:", v6, v8, 0);

  v9 = (const __CFString *)CARDNDAutoReplyAudience;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40)));
  CFPreferencesSetAppValue(v9, v10, CRPreferencesAutomaticDNDDomain);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CARAutomaticDNDAutoReplyAudienceChangedNotification, 0, 0, 1u);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100044CA0(id a1, unint64_t a2, NSError *a3)
{
  void *v4;
  const __CFString *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CARAnalytics sharedInstance](CARAnalytics, "sharedInstance", a3));
  if (a2 > 4)
    v5 = CFSTR("Unknown");
  else
    v5 = off_1000B6C60[a2];
  v6 = v4;
  objc_msgSend(v4, "userChangedAutoReplyFromAudience:toAudience:messageChanged:", v5, v5, 1);

}

void sub_100044EB4(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "status"));
  objc_msgSend(v1, "_triggerModeChanged:mechanism:", objc_msgSend(v2, "automaticDNDTriggeringMethod"), CFSTR("Settings"));

}

id sub_100045208(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueue_updateAssetRequests");
}

void sub_100045B08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a20);
  _Unwind_Resume(a1);
}

void sub_100045B34(uint64_t a1, char a2)
{
  _QWORD block[4];
  id v5;
  id v6;
  char v7;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100045BD4;
  block[3] = &unk_1000B6C90;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  v7 = a2;
  v5 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v6);
}

void sub_100045BD4(uint64_t a1)
{
  id WeakRetained;
  int v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = *(unsigned __int8 *)(a1 + 48);
  v4 = CarThemeAssetsLogging();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v15 = 138412290;
      v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "asset version %@ file send completed", (uint8_t *)&v15, 0xCu);
    }
    v8 = 2;
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_10006E018(a1, v6, v9, v10, v11, v12, v13, v14);
    v8 = 3;
  }

  objc_msgSend(WeakRetained, "setCurrentSessionTransferStatus:", v8);
  objc_msgSend(WeakRetained, "_mainQueue_invalidateFileSenderSession");

}

void sub_100045FF8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;

  v5 = a2;
  v6 = a3;
  v7 = CarThemeAssetsLogging(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    sub_10006E080((uint64_t)v5, (uint64_t)v6, v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "assetDownloader"));
  objc_msgSend(v9, "removeAssetsBeforeVersion:", v6);

}

id sub_100046898(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueue_handleVehiclesChanged");
}

id sub_100046928(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_removeAssetProgressForVehicleIdentifier:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueue_handleVehiclesChanged");
}

id sub_1000469AC(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCurrentSessionTransferStatus:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueue_evaluateAssetTransferIfConnected");
}

void sub_100046A54(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_mainQueue_invalidateFileSenderSession");
  objc_msgSend(*(id *)(a1 + 32), "setCurrentSessionTransferStatus:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_mainQueue_vehicleForSession:", *(_QWORD *)(a1 + 40)));
  if (v2)
  {
    v4 = v2;
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "identifier"));
    objc_msgSend(*(id *)(a1 + 32), "_removeAssetProgressForVehicleIdentifier:", v3);
    objc_msgSend(*(id *)(a1 + 32), "_mainQueue_hintDownloadForVehicle:", v4);

    v2 = v4;
  }

}

void sub_100046B98(uint64_t a1)
{
  void *v2;
  id v3;
  __int128 v4;
  id v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  _BYTE v22[128];

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_vehiclesForAssetRequest:", *(_QWORD *)(a1 + 40)));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v15;
    *(_QWORD *)&v4 = 138412546;
    v13 = v4;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_assetProgressForVehicle:", v8, v13));
        v10 = CarThemeAssetsLogging(objc_msgSend(v9, "addChild:withPendingUnitCount:", *(_QWORD *)(a1 + 48), 1));
        v11 = objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v13;
          v19 = v8;
          v20 = 2112;
          v21 = v9;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "attempting download for vehicle %@, overall progress is now: %@", buf, 0x16u);
        }

      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v5);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "libraryAgent"));
  objc_msgSend(v12, "notifyAttemptingDownloadForAssetVersion:", *(_QWORD *)(a1 + 56));

}

void sub_100046DEC(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;

  v2 = CarThemeAssetsLogging(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v6 = 138543362;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "failed download for asset %{public}@", (uint8_t *)&v6, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "libraryAgent"));
  objc_msgSend(v5, "notifyFailedDownloadForAssetVersion:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

}

void sub_100046F58(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  __int128 v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  NSObject *v37;
  __int16 v38;
  void *v39;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "version"));
  v3 = CarThemeAssetsLogging(v2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(NSObject **)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v37 = v5;
    v38 = 2114;
    v39 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "hasAsset: %{public}@ forAssetRequest: %{public}@", buf, 0x16u);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "_vehiclesForAssetRequest:", *(_QWORD *)(a1 + 40)));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v32;
    *(_QWORD *)&v9 = 138543362;
    v30 = v9;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
        v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "_assetVersionForVehicle:", v13, v30));
        v15 = v14;
        if (v14 && (v14 = objc_msgSend(v14, "compare:", v2), v14 == (id)-1))
        {
          v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "_stagedAssetVersionForVehicle:", v13));
          v17 = v18;
          if (v18
            && (v18 = -[NSObject isEqualToThemeAssetVersion:](v18, "isEqualToThemeAssetVersion:", v2),
                (_DWORD)v18))
          {
            v19 = CarThemeAssetsLogging(v18);
            v20 = objc_claimAutoreleasedReturnValue(v19);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v30;
              v37 = v17;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "ignoring next cluster asset, already have staged asset version: %{public}@", buf, 0xCu);
            }

          }
          else
          {
            v21 = CarThemeAssetsLogging(v18);
            v22 = objc_claimAutoreleasedReturnValue(v21);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              v23 = *(NSObject **)(a1 + 32);
              *(_DWORD *)buf = v30;
              v37 = v23;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "staging asset %{public}@", buf, 0xCu);
            }

            v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject iOSContentVersion](v2, "iOSContentVersion"));
            objc_msgSend(v13, "setStagedClusterAssetiOSContentVersion:", v24);

            v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject accessoryContentVersion](v2, "accessoryContentVersion"));
            objc_msgSend(v13, "setStagedClusterAssetVersion:", v25);

            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "baseURL"));
            objc_msgSend(v13, "setStagedClusterAssetURL:", v26);

            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "vehicleStore"));
            v28 = objc_msgSend(v27, "saveVehicle:", v13);

            objc_msgSend(*(id *)(a1 + 48), "_mainQueue_evaluateAssetTransferIfConnected");
          }
        }
        else
        {
          v16 = CarThemeAssetsLogging(v14);
          v17 = objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v37 = v2;
            v38 = 2114;
            v39 = v15;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "not staging asset version %{public}@ for vehicle with equal or newer asset version: %{public}@", buf, 0x16u);
          }
        }

      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v10);
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "libraryAgent"));
  objc_msgSend(v29, "notifyCompletedDownloadOfAsset:", *(_QWORD *)(a1 + 32));

}

void sub_100047394(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  int v31;
  id v32;

  v2 = a1 + 40;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_vehicleForVehicleIdentifier:", *(_QWORD *)(a1 + 40)));
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "clusterAssetIdentifier"));
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_assetRequestForVehicle:", v4));
      if (v6)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "assetDownloader"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assetRequests"));
        v9 = objc_msgSend(v8, "containsObject:", v6);

        if ((v9 & 1) == 0)
        {
          v11 = CarThemeAssetsLogging(v10);
          v12 = objc_claimAutoreleasedReturnValue(v11);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            v31 = 138412290;
            v32 = v6;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "asset requested before vehicle ever connected, tracking asset request for download anyway: %@", (uint8_t *)&v31, 0xCu);
          }

          objc_msgSend(*(id *)(a1 + 32), "_mainQueue_updateAssetRequests");
        }
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_assetVersionForVehicle:", v4));
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clusterAssetURL"));
      v15 = (void *)v14;
      if (v13 && v14)
      {
        v16 = objc_msgSend(objc_alloc((Class)CARThemeAsset), "initWithBaseURL:version:", v14, v13);
        v17 = CarThemeAssetsLogging(v16);
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v31 = 138412290;
          v32 = v16;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "replying with asset %@", (uint8_t *)&v31, 0xCu);
        }

        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      }
      else
      {
        v29 = CarThemeAssetsLogging(v14);
        v30 = objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          v31 = 138412290;
          v32 = v4;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "vehicle doesn't have an applied asset yet: %@", (uint8_t *)&v31, 0xCu);
        }

        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      }

    }
    else
    {
      v27 = CarThemeAssetsLogging(0);
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v31 = 138412290;
        v32 = v4;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "vehicle doesn't have an asset ID: %@", (uint8_t *)&v31, 0xCu);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
  else
  {
    v19 = CarThemeAssetsLogging(0);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_10006E158(v2, v20, v21, v22, v23, v24, v25, v26);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void sub_100047744(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;

  v2 = a1 + 40;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_vehicleForVehicleIdentifier:", *(_QWORD *)(a1 + 40)));
  v4 = CarThemeAssetsLogging(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 48);
      v21 = 138543362;
      v22 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "staging override asset %{public}@", (uint8_t *)&v21, 0xCu);
    }

    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "version"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject iOSContentVersion](v6, "iOSContentVersion"));
    objc_msgSend(v3, "setStagedClusterAssetiOSContentVersion:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject accessoryContentVersion](v6, "accessoryContentVersion"));
    objc_msgSend(v3, "setStagedClusterAssetVersion:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "baseURL"));
    objc_msgSend(v3, "setStagedClusterAssetURL:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "vehicleStore"));
    v12 = objc_msgSend(v11, "saveVehicle:", v3);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_assetProgressForVehicle:", v3));
    v14 = objc_msgSend(objc_alloc((Class)NSProgress), "initWithParent:userInfo:", 0, 0);
    objc_msgSend(v14, "setTotalUnitCount:", 1);
    objc_msgSend(v14, "setCompletedUnitCount:", 1);
    objc_msgSend(v13, "addChild:withPendingUnitCount:", v14, 1);
    objc_msgSend(*(id *)(a1 + 32), "_mainQueue_handleVehiclesChanged");

  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    sub_10006E158(v2, v6, v15, v16, v17, v18, v19, v20);
  }

}

id sub_1000479EC(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "identifier"));
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

uint64_t sub_100047BCC(id *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  int v12;
  void *v13;
  __int16 v14;
  id v15;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "clusterAssetIdentifier"));
  if (v4 && objc_msgSend(a1[4], "isEqualToString:", v4))
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "SDKVersion"));
    v6 = v5;
    if (v5 && (v5 = objc_msgSend(a1[5], "cr_buildVersionCompare:", v5), v5 != (id)1))
    {
      v10 = 1;
    }
    else
    {
      v7 = CarThemeAssetsLogging(v5);
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[6], "maximumSDKVersion"));
        v12 = 138543618;
        v13 = v9;
        v14 = 2112;
        v15 = v3;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "asset from a request with SDK version %{public}@ cannot apply to vehicle with older SDK version: %@", (uint8_t *)&v12, 0x16u);

      }
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void sub_1000484C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18)
{
  id *v18;
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);
  _Unwind_Resume(a1);
}

void sub_100048504(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[16];

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    v5 = CarGeneralLogging(v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Monitoring service connection interrupted or invalidated; removing connection.",
        buf,
        2u);
    }

    v7 = objc_loadWeakRetained(v2);
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "connectionsQueue"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100048604;
    v9[3] = &unk_1000B55B0;
    objc_copyWeak(&v10, (id *)(a1 + 40));
    v9[4] = v7;
    dispatch_sync(v8, v9);

    objc_destroyWeak(&v10);
  }
}

void sub_100048604(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "_removeConnection:", WeakRetained);
    WeakRetained = v3;
  }

}

void sub_100048970(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10004899C(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_addConnection:forCertificateSerial:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void sub_100048EC0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100048EF8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100048F08(uint64_t a1)
{

}

void sub_100048F10(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "connections"));
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void sub_100048F60(id a1, NSError *a2)
{
  NSError *v2;
  uint64_t v3;
  NSObject *v4;

  v2 = a2;
  v3 = CarGeneralLogging(v2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_10006E25C((uint64_t)v2, v4);

}

void sub_100048FB0(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100048FB8(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t sub_100048FC0(uint64_t a1)
{
  NSObject *v2;
  dispatch_time_t v3;

  v2 = *(NSObject **)(a1 + 32);
  v3 = dispatch_time(0, 30000000000);
  dispatch_group_wait(v2, v3);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

int64_t sub_100049250(id a1, MAAsset *a2, MAAsset *a3)
{
  return -[MAAsset cr_contentVersionCompare:](a2, "cr_contentVersionCompare:", a3);
}

void sub_10004961C(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___CRCarPlayConnectionTimeService));
  v2 = (void *)qword_1000DB898;
  qword_1000DB898 = v1;

}

uint64_t sub_1000496CC(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "eraseConnectionData");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_10004977C(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *i;
  id v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  unsigned int v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id obj;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint8_t buf[4];
  uint64_t v69;
  __int16 v70;
  id v71;
  __int16 v72;
  void *v73;
  _BYTE v74[128];
  _BYTE v75[128];

  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "sortedConnectionEvents"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "valueForKeyPath:", CFSTR("@distinctUnionOfObjects.identifier")));
  v44 = (void *)objc_opt_new(NSMutableArray, v2);
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  obj = v1;
  v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v75, 16);
  if (v45)
  {
    v42 = *(_QWORD *)v65;
    v58 = CARBluetoothWirelessIAPProfileConnectionAttempt;
    v54 = CARBluetoothWirelessIAPProfileConnectionSuccess;
    v59 = CARCarKitVehicleInformationEvent;
    v53 = CARCarKitAttemptingConnectionEvent;
    v52 = CARCarKitTransportEvent;
    v51 = CARWiFiBasicAssociationCompleted;
    v50 = CARWiFiWPAHSCompleted;
    v49 = CARWiFiDHCPCompleted;
    v48 = CARAirPlayEndpointSelected;
    v46 = CARCarKitConnectionSessionEndEvent;
    v41 = CARAirPlayCarSentStatistics;
    v39 = CARAirPlayConnectionTimeInfo;
    v38 = CARiAPConnectionStart;
    v37 = CARiAPAuthStarted;
    v36 = CARiAPAuthComplete;
    v35 = CARiAPNCMStart;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v65 != v42)
          objc_enumerationMutation(obj);
        v4 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * v3);
        v55 = objc_alloc_init((Class)NSMutableArray);
        v56 = v4;
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("identifier = %@"), v4));
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "filteredArrayUsingPredicate:", v5));

        v7 = CarConnectionTimeLogging();
        v8 = objc_claimAutoreleasedReturnValue(v7);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v9 = objc_msgSend(v6, "count");
          *(_DWORD *)buf = 138412546;
          v69 = v56;
          v70 = 2048;
          v71 = v9;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Number of fetched events for session identifier %@ : %lu", buf, 0x16u);
        }

        v11 = (void *)objc_opt_new(NSMutableDictionary, v10);
        v60 = 0u;
        v61 = 0u;
        v62 = 0u;
        v63 = 0u;
        v57 = v6;
        v12 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v60, v74, 16);
        v47 = v3;
        if (v12)
        {
          v13 = v12;
          v14 = 0;
          v15 = *(_QWORD *)v61;
          do
          {
            for (i = 0; i != v13; i = (char *)i + 1)
            {
              if (*(_QWORD *)v61 != v15)
                objc_enumerationMutation(v57);
              v17 = objc_msgSend(objc_alloc((Class)CARConnectionEvent), "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)i));
              v18 = CarConnectionTimeLogging();
              v19 = objc_claimAutoreleasedReturnValue(v18);
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "eventName"));
                v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "eventDate"));
                *(_DWORD *)buf = 138412802;
                v69 = v56;
                v70 = 2112;
                v71 = v20;
                v72 = 2112;
                v73 = v21;
                _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Fetched event for session identifier %@ : %@ with date : %@", buf, 0x20u);

              }
              v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "eventName"));
              if ((objc_msgSend(v22, "isEqualToString:", v58) & 1) != 0)
              {
                v23 = 1;
              }
              else if ((objc_msgSend(v22, "isEqualToString:", v54) & 1) != 0)
              {
                v23 = 2;
              }
              else if ((objc_msgSend(v22, "isEqualToString:", v59) & 1) != 0)
              {
                v23 = 4;
              }
              else if ((objc_msgSend(v22, "isEqualToString:", v53) & 1) != 0)
              {
                v23 = 8;
              }
              else if ((objc_msgSend(v22, "isEqualToString:", v52) & 1) != 0)
              {
                v23 = 16;
              }
              else if ((objc_msgSend(v22, "isEqualToString:", v51) & 1) != 0)
              {
                v23 = 32;
              }
              else if ((objc_msgSend(v22, "isEqualToString:", v50) & 1) != 0)
              {
                v23 = 64;
              }
              else if ((objc_msgSend(v22, "isEqualToString:", v49) & 1) != 0)
              {
                v23 = 128;
              }
              else if ((objc_msgSend(v22, "isEqualToString:", v48) & 1) != 0)
              {
                v23 = 256;
              }
              else if ((objc_msgSend(v22, "isEqualToString:", v46) & 1) != 0)
              {
                v23 = 512;
              }
              else if ((objc_msgSend(v22, "isEqualToString:", v41) & 1) != 0)
              {
                v23 = 1024;
              }
              else if ((objc_msgSend(v22, "isEqualToString:", v39) & 1) != 0)
              {
                v23 = 2048;
              }
              else if ((objc_msgSend(v22, "isEqualToString:", v38) & 1) != 0)
              {
                v23 = 4096;
              }
              else if ((objc_msgSend(v22, "isEqualToString:", v37) & 1) != 0)
              {
                v23 = 0x2000;
              }
              else if ((objc_msgSend(v22, "isEqualToString:", v36) & 1) != 0)
              {
                v23 = 0x4000;
              }
              else if (objc_msgSend(v22, "isEqualToString:", v35))
              {
                v23 = 0x8000;
              }
              else
              {
                v23 = 0;
              }

              v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "eventName"));
              v25 = objc_msgSend(v24, "isEqualToString:", v59);

              if (v25)
              {
                v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "payload"));
                v27 = objc_msgSend(v26, "mutableCopy");

                v11 = v27;
              }
              else
              {
                objc_msgSend(v55, "addObject:", v17);
              }
              v14 |= v23;

            }
            v13 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v60, v74, 16);
          }
          while (v13);
        }
        else
        {
          v14 = 0;
        }

        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v14));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "stringValue"));
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v29, CFSTR("finalEventName"));

        v30 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v56);
        v31 = objc_msgSend(objc_alloc((Class)CARConnectionSession), "initWithEvents:sessionIdentifier:vehicleInformation:", v55, v30, v11);
        objc_msgSend(v44, "insertObject:atIndex:", v31, 0);

        v3 = v47 + 1;
      }
      while ((id)(v47 + 1) != v45);
      v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v75, 16);
    }
    while (v45);
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "sortedArrayUsingComparator:", &stru_1000B6E70));
  v33 = *(_QWORD *)(a1 + 40);
  if (v33)
    (*(void (**)(uint64_t, void *, _QWORD))(v33 + 16))(v33, v32, 0);

}

int64_t sub_100049EB8(id a1, CARConnectionSession *a2, CARConnectionSession *a3)
{
  CARConnectionSession *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CARConnectionSession events](a2, "events"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "eventDate"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CARConnectionSession events](v4, "events"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "eventDate"));

  v11 = objc_msgSend(v10, "compare:", v7);
  return (int64_t)v11;
}

int64_t sub_10004A11C(id a1, NSDictionary *a2, NSDictionary *a3)
{
  uint64_t v4;
  NSDictionary *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = CAREventTimestamp;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](a2, "objectForKey:", v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v5, "objectForKey:", v4));

  v8 = objc_msgSend(v7, "compare:", v6);
  return (int64_t)v8;
}

void sub_10004A244(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  void *v35;
  uint64_t v36;
  void *v37;
  unsigned __int8 v38;
  uint64_t v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  unsigned int v48;
  id v49;
  uint64_t v50;
  NSObject *v51;
  uint64_t v52;
  void *v53;
  unsigned int v54;
  uint64_t v55;
  NSObject *v56;
  void *v57;
  id v58;
  uint64_t v59;
  void *v60;
  void *v61;
  unsigned int v62;
  void *v63;
  unsigned int v64;
  void *v65;
  void *v66;
  double v67;
  double v68;
  uint64_t v69;
  NSObject *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  double v75;
  double v76;
  uint64_t v77;
  NSObject *v78;
  void *v79;
  uint64_t v80;
  id v81;
  uint64_t v82;
  id obj;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  uint8_t buf[4];
  id v89;
  __int16 v90;
  uint64_t v91;
  _BYTE v92[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "sortedConnectionEvents"));
  v3 = objc_msgSend(v2, "mutableCopy");

  if (objc_msgSend(*(id *)(a1 + 40), "eventType") != (id)1
    || (v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "sessionStatus")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentSession")),
        v5,
        v4,
        !v5))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "eventName"));
    if ((objc_msgSend(v18, "isEqualToString:", CFSTR("CARConnectionEventSessionDetails")) & 1) != 0)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "sessionUUIDString"));

      if (!v19)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
        obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "valueForKey:", CAREventTimestamp));

        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "valueForKey:", CAREventName));

        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "valueForKey:", CAREventIdentifier));

        if (v22 && objc_msgSend(v22, "isEqualToString:", CFSTR("CARSessionDidDisconnectEvent")) && obj)
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "eventDate"));
          objc_msgSend(v25, "timeIntervalSinceDate:", obj);
          if (round(v26) <= 5.0)
          {

            if (v24)
            {
              v42 = ((uint64_t (*)(void))CarConnectionTimeLogging)();
              v43 = objc_claimAutoreleasedReturnValue(v42);
              if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "CARConnectionTimeSessionDidDisconnectEvent occurred before session details could be added. Applying the previous session ID to this event.", buf, 2u);
              }

              objc_msgSend(*(id *)(a1 + 32), "setSessionUUIDString:", v24);
              objc_msgSend(*(id *)(a1 + 32), "_addConnectionData:toReconnectArray:", *(_QWORD *)(a1 + 40), v3);
              objc_msgSend(*(id *)(a1 + 32), "setSessionUUIDString:", 0);
              v44 = *(_QWORD *)(a1 + 48);
              if (v44)
                (*(void (**)(uint64_t, uint64_t, _QWORD))(v44 + 16))(v44, 1, 0);

              goto LABEL_75;
            }
          }
          else
          {

          }
        }

        goto LABEL_45;
      }
    }
    else
    {

    }
    if (!objc_msgSend(v3, "count"))
      goto LABEL_45;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "valueForKey:", CAREventTimestamp));

    if (v28)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "eventDate"));
      objc_msgSend(v29, "timeIntervalSinceDate:", v28);
      if (round(v30) > 180.0)
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "eventName"));
        if (!objc_msgSend(v31, "isEqualToString:", CFSTR("CARConnectionEventSessionDetails")))
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "eventName"));
          v38 = objc_msgSend(v37, "isEqualToString:", CFSTR("CARSessionDidDisconnectEvent"));

          if ((v38 & 1) == 0)
          {
            v39 = ((uint64_t (*)(void))CarConnectionTimeLogging)();
            v40 = objc_claimAutoreleasedReturnValue(v39);
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            {
              v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "eventName"));
              *(_DWORD *)buf = 138412290;
              v89 = v41;
              _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Observed %@ more than 3 minutes since the previous event. Resetting SessionUUID.", buf, 0xCu);

            }
            objc_msgSend(*(id *)(a1 + 32), "setSessionUUIDString:", 0);
            objc_msgSend(*(id *)(a1 + 32), "setWasPairing:", 0);
          }
          goto LABEL_29;
        }

      }
    }
LABEL_29:

    goto LABEL_45;
  }
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v81 = v3;
  obj = v3;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v92, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v85;
    v9 = CAREventName;
    v10 = CARCarKitConnectionSessionEndEvent;
    v82 = CAREventIdentifier;
LABEL_5:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v85 != v8)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", v9));
      if ((objc_msgSend(v13, "isEqualToString:", v10) & 1) != 0)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", v82));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "sessionUUIDString"));
        v16 = objc_msgSend(v14, "isEqualToString:", v15);

        if (v16)
        {
          v32 = CarConnectionTimeLogging(v17);
          v33 = objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "eventName"));
            *(_DWORD *)buf = 138412290;
            v89 = v35;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Observed %@ inside of a session, skipping record.", buf, 0xCu);

          }
          v36 = *(_QWORD *)(a1 + 48);
          v3 = v81;
          if (v36)
            goto LABEL_74;
          goto LABEL_75;
        }
      }
      else
      {

      }
      if (v7 == (id)++v11)
      {
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v92, 16);
        if (v7)
          goto LABEL_5;
        break;
      }
    }
  }

  v3 = v81;
LABEL_45:
  v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "sessionUUIDString"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "eventName"));
  v47 = v46;
  obj = (id)v45;
  if (v45)
  {
    v48 = objc_msgSend(v46, "isEqualToString:", CARBluetoothWirelessIAPProfileConnectionAttempt);

    if (!v48)
    {
LABEL_60:
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "eventName"));
      v62 = objc_msgSend(v61, "isEqualToString:", CARCarKitWirelessPairingCreatedEvent);

      if (v62)
        objc_msgSend(*(id *)(a1 + 32), "setWasPairing:", 1);
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "eventName"));
      v64 = objc_msgSend(v63, "isEqualToString:", CARAirPlayConnectionTimeInfo);

      if (v64)
      {
        v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "payload"));
        v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "valueForKey:", CFSTR("AP_SIGNPOST_ENDPOINTSELECTED")));
        objc_msgSend(v66, "doubleValue");
        v68 = v67;

        if (v68 == 0.0)
        {
          v72 = CarConnectionTimeLogging(v69);
          v70 = objc_claimAutoreleasedReturnValue(v72);
          if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "Unable to extract the time of AirPlay Endpoint Selected Event", buf, 2u);
          }
        }
        else
        {
          v70 = objc_msgSend(objc_alloc((Class)NSDate), "initWithTimeIntervalSinceReferenceDate:", v68);
          v71 = (void *)objc_claimAutoreleasedReturnValue(+[CARConnectionEvent eventWithName:type:date:payload:](CARConnectionEvent, "eventWithName:type:date:payload:", CARAirPlayEndpointSelected, 3, v70, 0));
          objc_msgSend(*(id *)(a1 + 32), "_addConnectionData:toReconnectArray:", v71, v3);

        }
        v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "payload"));
        v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "valueForKey:", CFSTR("AP_SIGNPOST_CAR_SENT_STATISTICS")));
        objc_msgSend(v74, "doubleValue");
        v76 = v75;

        if (v76 == 0.0)
        {
          v80 = CarConnectionTimeLogging(v77);
          v78 = objc_claimAutoreleasedReturnValue(v80);
          if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "Unable to extract the time of AirPlay Car Sent Statistics Event", buf, 2u);
          }
        }
        else
        {
          v78 = objc_msgSend(objc_alloc((Class)NSDate), "initWithTimeIntervalSinceReferenceDate:", v76);
          v79 = (void *)objc_claimAutoreleasedReturnValue(+[CARConnectionEvent eventWithName:type:date:payload:](CARConnectionEvent, "eventWithName:type:date:payload:", CARAirPlayCarSentStatistics, 3, v78, 0));
          objc_msgSend(*(id *)(a1 + 32), "_addConnectionData:toReconnectArray:", v79, v3);

        }
      }
      objc_msgSend(*(id *)(a1 + 32), "_addConnectionData:toReconnectArray:", *(_QWORD *)(a1 + 40), v3);
      goto LABEL_73;
    }
    v49 = objc_msgSend(*(id *)(a1 + 32), "wasPairing");
    if ((v49 & 1) != 0)
    {
      v50 = CarConnectionTimeLogging(v49);
      v51 = objc_claimAutoreleasedReturnValue(v50);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v52 = (uint64_t)obj;
        v89 = obj;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Detected user was previously pairing to CarPlay and we already have a sessionUUID. No new session UUID required. %@", buf, 0xCu);
      }
      else
      {
        v52 = (uint64_t)obj;
      }
LABEL_59:

      obj = (id)v52;
      goto LABEL_60;
    }
LABEL_56:
    v58 = objc_alloc_init((Class)NSUUID);
    v52 = objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "UUIDString"));

    v59 = CarConnectionTimeLogging(objc_msgSend(*(id *)(a1 + 32), "setSessionUUIDString:", v52));
    v51 = objc_claimAutoreleasedReturnValue(v59);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "eventName"));
      *(_DWORD *)buf = 138412546;
      v89 = v60;
      v90 = 2112;
      v91 = v52;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Expected BluetoothConnectionStarted Event, observed %@. Creating new SessionUUID: %@", buf, 0x16u);

    }
    goto LABEL_59;
  }
  if (objc_msgSend(v46, "isEqualToString:", CFSTR("EndpointAvailable")))
  {

  }
  else
  {
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "eventName"));
    v54 = objc_msgSend(v53, "isEqualToString:", CFSTR("EndpointActivated"));

    if (!v54)
      goto LABEL_56;
  }
  v55 = ((uint64_t (*)(void))CarConnectionTimeLogging)();
  v56 = objc_claimAutoreleasedReturnValue(v55);
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
  {
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "eventName"));
    *(_DWORD *)buf = 138412290;
    v89 = v57;
    _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "Observed %@ Outside of a session, skipping record.", buf, 0xCu);

  }
  obj = 0;
LABEL_73:
  v36 = *(_QWORD *)(a1 + 48);
  if (v36)
LABEL_74:
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v36 + 16))(v36, 1, 0);
LABEL_75:

}

id sub_10004AD18(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v5[16];

  v2 = CarConnectionTimeLogging(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Session disconnected and duration details recorded. Session identifier can be cleared, if any.", v5, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "setSessionUUIDString:", 0);
}

BOOL sub_10004B1F0(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _BOOL8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "objectForKey:", CAREventTimestamp));
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "compare:", *(_QWORD *)(a1 + 32)) == (id)1;
  else
    v5 = 0;

  return v5;
}

void sub_10004C8E8(id a1)
{
  CRDiagnosticsService *v1;
  void *v2;

  v1 = objc_alloc_init(CRDiagnosticsService);
  v2 = (void *)qword_1000DB8A8;
  qword_1000DB8A8 = (uint64_t)v1;

}

void sub_10004D3E4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;

  v3 = a2;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004D478;
  block[3] = &unk_1000B53B8;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v3;
  v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_10004D478(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentDiagnosticsData"));
  v3 = objc_msgSend(v2, "isCAFToolTreeCompletionCalled");

  v6 = CarDiagnosticsLogging(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "CAFTool tree already completed? Ignoring...", buf, 2u);
    }

  }
  else
  {
    if (v8)
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Attaching CAFTool tree output...", v10, 2u);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentDiagnosticsData"));
    objc_msgSend(v9, "setIsCAFToolTreeCompletionCalled:", 1);

    objc_msgSend(*(id *)(a1 + 40), "addTextAttachment:asFilename:", *(_QWORD *)(a1 + 48), CFSTR("CAFToolTree.txt"));
  }
}

void sub_10004D568(uint64_t a1)
{
  unsigned int v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  char v12;

  v2 = objc_msgSend(*(id *)(a1 + 32), "supportsVehicleData");
  v3 = *(void **)(a1 + 40);
  if (v2)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10004D668;
    v9[3] = &unk_1000B6F68;
    v9[4] = v3;
    v10 = *(id *)(a1 + 48);
    v12 = *(_BYTE *)(a1 + 64);
    v11 = *(id *)(a1 + 56);
    objc_msgSend(v3, "_mainQueue_displayFetchingVehicleLogsBannerWithCompletion:", v9);

    v4 = v10;
  }
  else
  {
    v5 = *(unsigned __int8 *)(a1 + 64);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10004D6F8;
    v7[3] = &unk_1000B5628;
    v6 = *(_QWORD *)(a1 + 48);
    v8 = *(id *)(a1 + 56);
    objc_msgSend(v3, "_mainQueue_gatherVehicleLogsThenPerformSysdiagnoseWithDiagnosticData:isInternal:completion:", v6, v5, v7);
    v4 = v8;
  }

}

void sub_10004D668(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(unsigned __int8 *)(a1 + 56);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004D6EC;
  v4[3] = &unk_1000B5628;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v1, "_mainQueue_gatherVehicleLogsThenPerformSysdiagnoseWithDiagnosticData:isInternal:completion:", v2, v3, v4);

}

uint64_t sub_10004D6EC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_10004D6F8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_10004D704(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10004DA58(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v3 = a2;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10004DAE4;
  v9[3] = &unk_1000B5390;
  v4 = *(_QWORD *)(a1 + 32);
  v10 = v3;
  v11 = v4;
  v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v6, v7, v8);

}

void sub_10004DAE4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = CarDiagnosticsLogging(a1, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "localizedDescription"));
      v10 = 138412546;
      v11 = v7;
      v12 = 2112;
      v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ Error creating draft - %@", (uint8_t *)&v10, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 40), "_mainQueue_displayDraftErrorBanner");
  }
  else
  {
    if (v6)
    {
      v9 = *(_QWORD *)(a1 + 40);
      v10 = 138412290;
      v11 = v9;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ Successfully created draft", (uint8_t *)&v10, 0xCu);
    }

  }
}

void sub_10004DD94(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  __CFString *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  void *v25;

  v5 = a3;
  v7 = v5;
  if (v5)
  {
    v8 = CarDiagnosticsLogging(v5, v6);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Failed to query initial Focus state: %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "setFocusModeDescription:", CFSTR("None"));
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "activeModeConfiguration"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mode"));

    v14 = CarDiagnosticsLogging(v12, v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v11;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Received updated focus state %@", buf, 0xCu);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "modeIdentifier"));
    v17 = objc_msgSend(v16, "length");

    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
      if (v18)
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
      else
        v19 = CFSTR("Unspecified");
      v20 = DNDModeSemanticTypeToString(objc_msgSend(v11, "semanticType"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "modeIdentifier"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (%@ - %@)"), v19, v21, v22));
      objc_msgSend(*(id *)(a1 + 32), "setFocusModeDescription:", v23);

      if (v18)
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "setFocusModeDescription:", CFSTR("None"));
    }

  }
}

void sub_10004E07C(uint64_t a1)
{
  void *v2;
  _QWORD block[5];
  id v4;
  id v5;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004E108;
  block[3] = &unk_1000B6D08;
  v2 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  v5 = *(id *)(a1 + 48);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_10004E108(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10004E18C;
  v3[3] = &unk_1000B7008;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_mainQueue_presentDictationBannerWithCompletion:", v3);

}

void sub_10004E18C(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10004E22C;
  v9[3] = &unk_1000B5390;
  v3 = a2;
  v10 = v3;
  v11 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 16))(v8, v4, v5, v6, v7);

}

id *sub_10004E22C(id *result)
{
  if (result[4])
    return (id *)objc_msgSend(result[5], "setTranscription:");
  return result;
}

void sub_10004E2FC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  _QWORD block[4];
  id v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  char v22;

  v5 = a2;
  v6 = a3;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10004E434;
  v16[3] = &unk_1000B7080;
  v7 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 32);
  v17 = v8;
  v18 = v9;
  v22 = *(_BYTE *)(a1 + 56);
  v10 = *(id *)(a1 + 48);
  v20 = v6;
  v21 = v10;
  v19 = v5;
  v11 = v6;
  v12 = v5;
  objc_msgSend(v7, "_mainQueue_gatherVehicleLogsWithCompletion:", v16);
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "diagnosticsSerialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004E548;
  block[3] = &unk_1000B51B8;
  v15 = *(id *)(a1 + 40);
  dispatch_async(v13, block);

}

void sub_10004E434(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;

  v3 = a2;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "addAttachment:", v3);
  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v6 = *(unsigned __int8 *)(a1 + 72);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10004E518;
  v10[3] = &unk_1000B7058;
  v7 = *(id *)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(a1 + 48);
  v13 = v7;
  v10[4] = v8;
  v11 = v9;
  v12 = *(id *)(a1 + 56);
  objc_msgSend(v4, "_mainQueue_performSysdiagnoseIncludingData:isInternal:completion:", v5, v6, v10);

}

id sub_10004E518(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_backgroundQueue_finishDiagnosticsOperationSemaphore:transaction:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void sub_10004E548(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "date"));
  +[CRDiagnosticsData removeDiagnosticsFoldersBeforeTime:](CRDiagnosticsData, "removeDiagnosticsFoldersBeforeTime:", v1);

}

void sub_10004E74C(id *a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_time_t v6;
  intptr_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  uint8_t buf[16];

  v3 = CarDiagnosticsLogging(a1, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "finished waiting on previous diagnostics", buf, 2u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004E898;
  block[3] = &unk_1000B70D0;
  v14 = a1[6];
  v12 = a1[4];
  v13 = a1[5];
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  v5 = a1[4];
  v6 = dispatch_time(0, 600000000000);
  v7 = dispatch_semaphore_wait(v5, v6);
  if (v7)
  {
    v9 = CarDiagnosticsLogging(v7, v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "timed out waiting on previous diagnostics", buf, 2u);
    }

  }
}

uint64_t sub_10004E898(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void sub_10004EAA8(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_10004ECFC(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10004ED8C;
  v9[3] = &unk_1000B5390;
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v10 = v3;
  v11 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 16))(v8, v5, v6, v7);

}

id sub_10004ED8C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = CarDiagnosticsLogging(a1, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "localizedDescription"));
      v11 = 138412546;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ Error creating draft - %@", (uint8_t *)&v11, 0x16u);

    }
    return objc_msgSend(*(id *)(a1 + 40), "_mainQueue_displayDraftErrorBanner");
  }
  else
  {
    if (v6)
    {
      v10 = *(_QWORD *)(a1 + 40);
      v11 = 138412290;
      v12 = v10;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ Successfully created draft", (uint8_t *)&v11, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "setPendingDrafts:", (char *)objc_msgSend(*(id *)(a1 + 40), "pendingDrafts") + 1);
    return objc_msgSend(*(id *)(a1 + 40), "_mainQueue_displayDraftCountBanner");
  }
}

void sub_10004EEC8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5)
  {
    v8 = CarGeneralLogging(v6);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10006E5DC(a1, v9);

  }
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(void))(v10 + 16))();

}

int64_t sub_10004EFB8(id a1, AFAccount *a2, AFAccount *a3)
{
  if (-[AFAccount isActive](a3, "isActive"))
    return 1;
  else
    return -1;
}

uint64_t sub_10004F120(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10004F254(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  __CFString *v10;
  const __CFString *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentDiagnosticsData"));
  v2 = *(id *)(a1 + 40);
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "type");
    objc_msgSend(v3, "coordinate");
    v6 = v5;
    objc_msgSend(v3, "coordinate");
    v8 = v7;
    if (((_DWORD)v4 - 1) > 0xA)
      v9 = CFSTR("Unknown");
    else
      v9 = *(&off_1000B72F0 + (int)v4 - 1);
    if (+[CRDiagnosticsService _accessorySupportsLocationDeadReckoning](CRDiagnosticsService, "_accessorySupportsLocationDeadReckoning"))
    {
      v11 = CFSTR("Yes");
    }
    else
    {
      v11 = CFSTR("No");
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "timestamp"));
    v13 = CRStringForDate(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Coordinates: (%f, %f)\nSource: %d (%@) [Dead Reckoning: %@]\nTime: %@"), v6, v8, v4, v9, v11, v14));

  }
  else
  {
    v10 = CFSTR("No location information");
  }

  objc_msgSend(v15, "setLocationDescription:", v10);
}

void sub_10004F47C(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  __CFString *v10;
  const __CFString *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentDiagnosticsData"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "firstObject"));
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "type");
    objc_msgSend(v3, "coordinate");
    v6 = v5;
    objc_msgSend(v3, "coordinate");
    v8 = v7;
    if (((_DWORD)v4 - 1) > 0xA)
      v9 = CFSTR("Unknown");
    else
      v9 = *(&off_1000B72F0 + (int)v4 - 1);
    if (+[CRDiagnosticsService _accessorySupportsLocationDeadReckoning](CRDiagnosticsService, "_accessorySupportsLocationDeadReckoning"))
    {
      v11 = CFSTR("Yes");
    }
    else
    {
      v11 = CFSTR("No");
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "timestamp"));
    v13 = CRStringForDate(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Coordinates: (%f, %f)\nSource: %d (%@) [Dead Reckoning: %@]\nTime: %@"), v6, v8, v4, v9, v11, v14));

  }
  else
  {
    v10 = CFSTR("No location information");
  }
  objc_msgSend(v15, "setLocationDescription:", v10);

}

id sub_10004F8D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  NSObject *v5;
  uint8_t v7[16];

  if (a2 == 2)
    return objc_msgSend(*(id *)(a1 + 32), "_beginDictationWithCompletion:", *(_QWORD *)(a1 + 40));
  v4 = CarDiagnosticsLogging(a1, a2, a3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Dictation dismissed", v7, 2u);
  }

  return (id)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t sub_10004F968(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_10004F978(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10004FA3C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;

  v7 = a3;
  v8 = a4;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004FB00;
  block[3] = &unk_1000B71F0;
  v18 = a2;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  v14 = v8;
  v15 = v9;
  v16 = v7;
  v17 = v10;
  v11 = v7;
  v12 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_10004FB00(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;

  if (*(_QWORD *)(a1 + 32))
  {
LABEL_2:
    v3 = CarDiagnosticsLogging(a1, a2);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 64) + 1;
      if (v5 >= 6)
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unknown (%ld)"), *(_QWORD *)(a1 + 64)));
      else
        v6 = *(&off_1000B7348 + v5);
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v23 = v6;
      v24 = 2112;
      v25 = v8;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Dictation failed: state %@, error %@", buf, 0x16u);

    }
    if (*(_QWORD *)(a1 + 64) == -1)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("Dictation Error. "), "stringByAppendingString:", CFSTR("Please make sure you have Dictation enabled.")));
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "localizedDescription"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("Dictation Error. "), "stringByAppendingString:", v9));

    }
    v11 = *(void **)(a1 + 40);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10004FDC8;
    v20[3] = &unk_1000B63C0;
    v21 = *(id *)(a1 + 56);
    objc_msgSend(v11, "_mainQueue_presentCarAlertWithTitle:dismissTime:completion:", v10, v20, 10.0);

    goto LABEL_15;
  }
  v7 = *(_QWORD *)(a1 + 64);
  switch(v7)
  {
    case 4:
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "transcription"));
      v12 = objc_msgSend(v10, "length");
      v14 = CarDiagnosticsLogging(v12, v13);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      if (v12)
      {
        if (v16)
        {
          *(_DWORD *)buf = 138477827;
          v23 = v10;
          v17 = "Dictation transcribed: %{private}@";
          v18 = v15;
          v19 = 12;
LABEL_23:
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
        }
      }
      else if (v16)
      {
        *(_WORD *)buf = 0;
        v17 = "Dictation stopped without transcription.";
        v18 = v15;
        v19 = 2;
        goto LABEL_23;
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_15:

      return;
    case 1:
      objc_msgSend(*(id *)(a1 + 40), "_mainQueue_presentCarAlertWithTitle:dismissTime:completion:", CFSTR("Dictation in Progress. Tap to Stop"), &stru_1000B71C8, 0.0);
      return;
    case -1:
      goto LABEL_2;
  }
}

uint64_t sub_10004FDC8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10004FDD8(id a1, unint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v2 = CarDiagnosticsLogging(a1, a2);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Stopping dictation.", v5, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CRDictationService sharedInstance](CRDictationService, "sharedInstance"));
  objc_msgSend(v4, "stopRecording");

}

void sub_10004FE94(id a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  uint8_t v7[16];

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObject:forKey:](NSMutableDictionary, "dictionaryWithObject:forKey:", &off_1000BE098, kAudioServicesPlaySystemSoundOptionFlagsKey));
  v2 = objc_msgSend(v1, "setObject:forKey:", &off_1000BF288, kAudioServicesPlaySystemSoundOptionVibrationPatternKey);
  v4 = CarDiagnosticsLogging(v2, v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Initiating vibrate for sysdiagnose", v7, 2u);
  }

  v6 = objc_msgSend(v1, "copy");
  AudioServicesPlaySystemSoundWithOptions(1352, v6, 0);

}

id sub_1000505E4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char *v9;
  char *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "lowercaseString"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4));

  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v5));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "componentsSeparatedByCharactersInSet:", v7));

    if ((unint64_t)objc_msgSend(v8, "count") < 2
      || (v9 = (char *)objc_msgSend(v8, "count"), v10 = v9 - 1, v9 == (char *)1))
    {
LABEL_7:
      v6 = 0;
    }
    else
    {
      while (1)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, v10));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectsAtIndexes:", v11));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "componentsJoinedByString:", CFSTR(" ")));

        if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v13) & 1) != 0)
          break;

        if (!--v10)
          goto LABEL_7;
      }
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v13));

    }
  }

  return v6;
}

void sub_100050C70(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  dispatch_time_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint8_t v15[8];
  _QWORD block[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v2 = objc_alloc_init((Class)NSTask);
  objc_msgSend(v2, "setLaunchPath:", CFSTR("/usr/local/bin/CAFTool"));
  objc_msgSend(v2, "setArguments:", &off_1000BF200);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSPipe pipe](NSPipe, "pipe"));
  objc_msgSend(v2, "setStandardOutput:", v3);

  v4 = objc_alloc_init((Class)NSMutableData);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "standardOutput"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fileHandleForReading"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100050E98;
  v22[3] = &unk_1000B7288;
  v7 = v4;
  v23 = v7;
  objc_msgSend(v6, "setReadabilityHandler:", v22);

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100050EDC;
  v19[3] = &unk_1000B72B0;
  v8 = v7;
  v20 = v8;
  v21 = *(id *)(a1 + 32);
  objc_msgSend(v2, "setTerminationHandler:", v19);
  v9 = dispatch_time(0, 10000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100051190;
  block[3] = &unk_1000B5650;
  v17 = v2;
  v18 = *(id *)(a1 + 32);
  v10 = v2;
  dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, block);
  v13 = CarDiagnosticsLogging(v11, v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "CAFTool tree task launched", v15, 2u);
  }

  objc_msgSend(v10, "launch");
  objc_msgSend(v10, "waitUntilExit");

}

void sub_100050E98(uint64_t a1, void *a2)
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "availableData"));
  objc_msgSend(*(id *)(a1 + 32), "appendData:", v3);

}

void sub_100050EDC(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;

  v3 = a2;
  v5 = CarDiagnosticsLogging(v3, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v22) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CAFTool tree termination handler called", (uint8_t *)&v22, 2u);
  }

  v7 = objc_msgSend(v3, "terminationStatus");
  if ((_DWORD)v7)
  {
    v9 = CarDiagnosticsLogging(v7, v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v3, "terminationStatus")));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v3, "terminationReason")));
      v22 = 138412546;
      v23 = v11;
      v24 = 2112;
      v25 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "CAFTool exited with status %@ reason %@", (uint8_t *)&v22, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "standardOutput"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "fileHandleForReading"));
    objc_msgSend(v14, "setReadabilityHandler:", 0);

    v15 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", *(_QWORD *)(a1 + 32), 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("(?:\\x{1B}[@-_]|[\\x{80}-\\x{9F}])[0-?]*[ -/]*[@-~]"), 1, 0));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringByReplacingMatchesInString:options:range:withTemplate:", v15, 0, 0, objc_msgSend(v15, "length"), &stru_1000B87A0));
    v19 = CarDiagnosticsLogging(v17, v18);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "length")));
      v22 = 138412290;
      v23 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "CAFTool received output with length %@", (uint8_t *)&v22, 0xCu);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

id sub_100051190(uint64_t a1)
{
  id result;
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];

  result = objc_msgSend(*(id *)(a1 + 32), "isRunning");
  if ((_DWORD)result)
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "terminate");
    v5 = CarDiagnosticsLogging(v3, v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CAFTool tree task terminated", v7, 2u);
    }

    return (id)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  return result;
}

id sub_100052130(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v6[16];

  v3 = CarDiagnosticsLogging(a1, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Session disconnect", v6, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setInitialDiagnosticsBannerPresented:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setPendingDrafts:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setLoggingFileReceiver:", 0);
}

void sub_100052324(id a1)
{
  void *v1;

  v1 = (void *)qword_1000DB8B8;
  qword_1000DB8B8 = (uint64_t)&off_1000BF2D8;

}

void sub_100052984(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;

  v3 = a2;
  v5 = CarDNDWDLogging(v3, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "eventBody"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "semanticModeIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "eventBody"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v9, "starting")));
    v11 = 138412546;
    v12 = v8;
    v13 = 2112;
    v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Store sink event received for mode %@ starting %@", (uint8_t *)&v11, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_drivingModeChanged:", v3);

}

void sub_100052BB8(uint64_t a1)
{
  CARDNDGeofencingObserver *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(CARDNDGeofencingObserver);
  -[CARDNDGeofencingObserver setDelegate:](v2, "setDelegate:", *(_QWORD *)(a1 + 32));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 128);
  *(_QWORD *)(v3 + 128) = v2;

}

void sub_100052C64(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  _BOOL4 v18;
  uint64_t v19;
  NSObject *v20;
  uint8_t v21[16];
  uint8_t v22[16];
  uint8_t buf[16];
  uint8_t v24[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "preferences"));
  v3 = objc_msgSend(v2, "shouldActivateWithCarPlay");

  if (v3)
  {
    v6 = CRIsTestContext(v4, v5);
    if ((v6 & 1) != 0 || (v6 = (uint64_t)objc_msgSend(*(id *)(a1 + 32), "_hasDrivingActivityMode"), (v6 & 1) != 0))
    {
      v8 = CarDNDWDLogging(v6, v7);
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CarPlay session started, engaging Driving from preferences.", buf, 2u);
      }

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[CARAnalytics sharedInstance](CARAnalytics, "sharedInstance"));
      objc_msgSend(v10, "DNDStartedWithTrigger:vehicleHints:", 3, objc_msgSend(*(id *)(a1 + 32), "lastKnownVehicularHints"));

      v11 = *(void **)(a1 + 32);
      v12 = 1;
LABEL_14:
      objc_msgSend(v11, "_setDNDActive:trigger:completion:", v12, 3, 0);
      return;
    }
    v19 = CarDNDWDLogging(v6, v7);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Ignoring CarPlay Driving activation request; no driving mode available.",
        v24,
        2u);
    }

  }
  else
  {
    v13 = objc_msgSend(*(id *)(a1 + 32), "activatedByUserAction");
    v14 = (int)v13;
    v16 = CarDNDWDLogging(v13, v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (!v14)
    {
      if (v18)
      {
        *(_WORD *)v21 = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "CarPlay session started, disabling Driving from preferences.", v21, 2u);
      }

      v11 = *(void **)(a1 + 32);
      v12 = 0;
      goto LABEL_14;
    }
    if (v18)
    {
      *(_WORD *)v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "CarPlay session started; leaving Driving as-is because of user activation.",
        v22,
        2u);
    }

  }
}

id sub_100053090(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setDNDActive:trigger:completion:", 0, 3, 0);
}

id sub_1000530A4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setDNDActive:trigger:completion:", 0, 3, 0);
}

id sub_100053244(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processVehicleState:", *(_QWORD *)(a1 + 40));
}

void sub_100053434(uint64_t a1)
{
  id v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  void *v13;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isDNDValid");
  v4 = *(unsigned __int8 *)(a1 + 48);
  if (v4 == (_DWORD)v2)
  {
    v5 = CarDNDWDLogging(v2, v3);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v7)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "activeAssertionsDebugString"));
        v12 = 138412290;
        v13 = v8;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Driving temporarily disabled due to %@", (uint8_t *)&v12, 0xCu);

      }
      if (objc_msgSend(*(id *)(a1 + 40), "hasAssertion:", 2))
        v9 = 4;
      else
        v9 = 0;
      objc_msgSend(*(id *)(a1 + 32), "_setDNDActive:trigger:completion:", 0, v9, 0);
    }
    else
    {
      if (v7)
      {
        LOWORD(v12) = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Driving re-enabled after last temporary assertion released.", (uint8_t *)&v12, 2u);
      }

    }
  }
  else
  {
    v10 = CarDNDWDLogging(v2, v3);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Driving assertion trap toggled, but no action needed.", (uint8_t *)&v12, 2u);
    }

    if (*(_BYTE *)(a1 + 48))
      objc_msgSend(*(id *)(a1 + 32), "_drivingModeEnded");
  }
}

void sub_1000536A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000536BC(uint64_t a1, uint64_t a2)
{
  char v2;
  unsigned __int8 *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  id WeakRetained;

  v2 = a2;
  v4 = (unsigned __int8 *)(a1 + 52);
  if (*(unsigned __int8 *)(a1 + 52) == (_DWORD)a2)
  {
    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
      (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);
  }
  else
  {
    v6 = CarDNDWDLogging(a1, a2);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      sub_10006E6CC(v4, v2, v7);

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_setDNDActive:trigger:withStartingGeofence:completion:", 0, *(unsigned int *)(a1 + 48), 0, *(_QWORD *)(a1 + 32));

  }
}

uint64_t sub_1000539F8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_100053A08(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100053FB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100053FD4(uint64_t a1, char a2)
{
  id WeakRetained;
  id v4;

  if ((a2 & 1) == 0)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[CARAnalytics sharedInstance](CARAnalytics, "sharedInstance"));
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v4, "DNDEndedWithTrigger:vehicleHints:context:", 2, objc_msgSend(WeakRetained, "lastKnownVehicularHints"), 0);

  }
}

void sub_100054890(id a1, int64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint8_t v14[16];
  uint8_t v15[16];
  uint8_t v16[16];
  uint8_t v17[16];
  uint8_t buf[16];

  switch(a2)
  {
    case 0:
      v2 = CarDNDWDLogging(a1, a2);
      v3 = objc_claimAutoreleasedReturnValue(v2);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "User indicated passenger.", buf, 2u);
      }

      v4 = objc_claimAutoreleasedReturnValue(+[CARAnalytics sharedInstance](CARAnalytics, "sharedInstance"));
      v5 = v4;
      v6 = CFSTR("Passenger");
      goto LABEL_14;
    case 1:
      v7 = CarDNDWDLogging(a1, a2);
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "User indicated pulled over.", v17, 2u);
      }

      v4 = objc_claimAutoreleasedReturnValue(+[CARAnalytics sharedInstance](CARAnalytics, "sharedInstance"));
      v5 = v4;
      v6 = CFSTR("Pulled Over");
      goto LABEL_14;
    case 2:
      v9 = CarDNDWDLogging(a1, a2);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "User indicated incorrect vehicle detection.", v16, 2u);
      }

      v4 = objc_claimAutoreleasedReturnValue(+[CARAnalytics sharedInstance](CARAnalytics, "sharedInstance"));
      v5 = v4;
      v6 = CFSTR("Incorrect Detection (Radar)");
      goto LABEL_14;
    case 3:
      v11 = CarDNDWDLogging(a1, a2);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "User indicated other.", v15, 2u);
      }

      v4 = objc_claimAutoreleasedReturnValue(+[CARAnalytics sharedInstance](CARAnalytics, "sharedInstance"));
      v5 = v4;
      v6 = CFSTR("Other");
LABEL_14:
      -[NSObject userIndicatedNotDrivingWithReason:](v4, "userIndicatedNotDrivingWithReason:", v6);
      break;
    default:
      v13 = CarDNDWDLogging(a1, a2);
      v5 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "User indicated unknown not driving reason.", v14, 2u);
      }
      break;
  }

}

void sub_100054F88(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "preferences"));
  objc_msgSend(v1, "setHasMigratedToDriving:", 1);

}

void sub_1000559FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_100055A20(uint64_t a1)
{
  _BOOL8 result;

  result = +[CRBluetoothManager hasPairingSupportingCarPlayWithAddress:](CRBluetoothManager, "hasPairingSupportingCarPlayWithAddress:", *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

id sub_100055DDC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_disableDNDUntilEndOfDrive");
}

void sub_100055FE8(id a1)
{
  id v1;
  void *v2;
  id v3;

  v1 = objc_alloc_init((Class)NSDateFormatter);
  v2 = (void *)qword_1000DB8D0;
  qword_1000DB8D0 = (uint64_t)v1;

  objc_msgSend((id)qword_1000DB8D0, "setTimeStyle:", 1);
  objc_msgSend((id)qword_1000DB8D0, "setDateStyle:", 1);
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  objc_msgSend((id)qword_1000DB8D0, "setLocale:", v3);

}

void sub_100056060(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

id sub_1000564C0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startWaitingForConnection");
}

void sub_1000564C8(id a1, BOOL a2, NSError *a3)
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = CarGeneralLogging(a1);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Recording startedConnectionAttemptOnTransport", v5, 2u);
  }

}

id sub_1000565B4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopWaitingForConnection");
}

void sub_100056638(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "configuration"));
  v3 = objc_msgSend(v2, "transportType");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CARAnalytics sharedInstance](CARAnalytics, "sharedInstance"));
  objc_msgSend(v4, "reconnectEndedOnTransport:", v3);

  if (v3 == (id)3)
    objc_msgSend(*(id *)(a1 + 40), "stopWaitingForConnection");
}

void sub_100056730(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  id v35;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "configuration"));
  v3 = objc_msgSend(v2, "transportType");

  if (v3 == (id)3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "messagingConnector"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "MFiCertificateSerialNumber"));
    v35 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "vehicleAccessoryForCertificateSerial:", v5));

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "configuration"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "analyticsDescription"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v7));

    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "sourceVersion"));
    v10 = (void *)v9;
    if (v9)
      v11 = (const __CFString *)v9;
    else
      v11 = CFSTR("Unknown");
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("SourceVersion"));

    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "vehicleFirmwareVersion"));
    v13 = (void *)v12;
    if (v12)
      v14 = (const __CFString *)v12;
    else
      v14 = CFSTR("Unknown");
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, CFSTR("vehicleFirmwareVersion"));

    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "vehicleHardwareVersion"));
    v16 = (void *)v15;
    if (v15)
      v17 = (const __CFString *)v15;
    else
      v17 = CFSTR("Unknown");
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, CFSTR("vehicleHardwareVersion"));

    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "vehicleManufacturer"));
    v19 = (void *)v18;
    if (v18)
      v20 = (const __CFString *)v18;
    else
      v20 = CFSTR("Unknown");
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v20, CFSTR("vehicleManufacturer"));

    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "vehicleModelName"));
    v22 = (void *)v21;
    if (v21)
      v23 = (const __CFString *)v21;
    else
      v23 = CFSTR("Unknown");
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v23, CFSTR("vehicleModel"));

    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "PPID"));
    v25 = (void *)v24;
    if (v24)
      v26 = (const __CFString *)v24;
    else
      v26 = CFSTR("Unknown");
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v26, CFSTR("ppid"));

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v6, "supportsVehicleData")));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v27, CFSTR("nextGenCarPlaySession"));

    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "storedVehicleProvider"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "storedVehicleForSession:", *(_QWORD *)(a1 + 32)));

    if (v29)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "supportsStartSessionRequest"));
      if (objc_msgSend(v30, "BOOLValue"))
        v31 = CFSTR("StartSession");
      else
        v31 = CFSTR("Bonjour");
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v31, CFSTR("sessionType"));

      if (objc_msgSend(v29, "supportsBluetoothLE"))
        v32 = CFSTR("BLE");
      else
        v32 = CFSTR("BT Classic");
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v32, CFSTR("bluetoothType"));
    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[CARAnalytics sharedInstance](CARAnalytics, "sharedInstance"));
    objc_msgSend(v33, "wirelessSessionEndedWithPayload:", v8);

    v34 = (void *)objc_claimAutoreleasedReturnValue(+[CARAnalytics sharedInstance](CARAnalytics, "sharedInstance"));
    objc_msgSend(v34, "setWifiChannel:", 0);

    objc_msgSend(*(id *)(a1 + 40), "stopWaitingForConnection");
  }
  else
  {
    v35 = (id)objc_claimAutoreleasedReturnValue(+[CARAnalytics sharedInstance](CARAnalytics, "sharedInstance"));
    objc_msgSend(v35, "wiredSessionEnded");
  }

}

id sub_100056C84(unint64_t a1)
{
  if (a1 >= 6)
    sub_10006E928();
  if (qword_1000DB910 != -1)
    dispatch_once(&qword_1000DB910, &stru_1000B7508);
  return (id)qword_1000DB8E0[a1];
}

void sub_100056CE0(id a1)
{
  os_log_t v1;
  void *v2;
  os_log_t v3;
  void *v4;
  os_log_t v5;
  void *v6;
  os_log_t v7;
  void *v8;
  os_log_t v9;
  void *v10;
  os_log_t v11;
  void *v12;

  v1 = os_log_create("com.apple.carkitd", "Default");
  v2 = (void *)qword_1000DB8E0;
  qword_1000DB8E0 = (uint64_t)v1;

  v3 = os_log_create("com.apple.carkitd", "NavigationOwnership");
  v4 = (void *)qword_1000DB8E8;
  qword_1000DB8E8 = (uint64_t)v3;

  v5 = os_log_create("com.apple.carkitd", "BluetoothService");
  v6 = (void *)qword_1000DB8F0;
  qword_1000DB8F0 = (uint64_t)v5;

  v7 = os_log_create("com.apple.carkitd", "ClusterControl");
  v8 = (void *)qword_1000DB8F8;
  qword_1000DB8F8 = (uint64_t)v7;

  v9 = os_log_create("com.apple.carkitd", "FileTransfer");
  v10 = (void *)qword_1000DB900;
  qword_1000DB900 = (uint64_t)v9;

  v11 = os_log_create("com.apple.carkitd", "StatisticsStream");
  v12 = (void *)qword_1000DB908;
  qword_1000DB908 = (uint64_t)v11;

}

uint64_t start()
{
  void *v0;
  uint64_t v1;
  NSObject *v2;
  id v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  CARConnectionTimeServiceAgent *v5;
  void *v6;
  CRCarKitServiceAgent *v7;
  CRCarPlayAppServiceAgent *v8;
  id v9;
  CRWirelessPairingServiceAgent *v10;
  id v11;
  id v12;
  CRCertificationOverridesServiceAgent *v13;
  id v14;
  CRCarPlayAppServiceAgent *v15;
  dispatch_queue_global_t global_queue;
  NSObject *v17;
  CRVehicleStore *v18;
  id v19;
  void *v20;
  CRCarKitIAPRemoteServiceAgent *v22;
  void *v23;
  CRNightModeFallbackManager *v24;
  void *v25;
  CRSessionSilentModeManager *v26;
  void *v27;
  void *context;
  void *contexta;
  CRSetupPromptDirectorAgent *v30;
  id v31;
  id v32;
  CRThemeAssetLibrarian *v33;
  id v34;
  CRCarPlayNavigationServiceAgent *v35;
  id v36;
  id v37;
  CRCarKitMonitoringServiceAgent *v38;
  id v39;
  CRBluetoothManager *v40;
  id v41;
  id v42;
  CARConnectionTimeServiceAgent *v43;
  id v44;
  id v45;
  CRVehicleStore *v46;
  _QWORD block[4];
  CRVehicleStore *v48;
  id v49;
  _QWORD *v50;
  _QWORD *v51;
  _QWORD handler[4];
  CRCarPlayAppServiceAgent *v53;
  uint8_t buf[8];
  _QWORD v55[5];
  id v56;
  _QWORD v57[5];
  id v58;

  v57[0] = 0;
  v57[1] = v57;
  v57[2] = 0x3032000000;
  v57[3] = sub_10005749C;
  v57[4] = sub_1000574AC;
  v58 = 0;
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x3032000000;
  v55[3] = sub_10005749C;
  v55[4] = sub_1000574AC;
  v56 = 0;
  v0 = objc_autoreleasePoolPush();
  v1 = CarGeneralLogging(v0);
  v2 = objc_claimAutoreleasedReturnValue(v1);
  context = v0;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "carkitd launching", buf, 2u);
  }

  v40 = objc_alloc_init(CRBluetoothManager);
  v39 = objc_alloc_init((Class)CRCarPlayPreferences);
  v3 = objc_msgSend(objc_alloc((Class)CARSessionStatus), "initWithOptions:", 12);
  v26 = -[CRSessionSilentModeManager initWithSessionStatus:]([CRSessionSilentModeManager alloc], "initWithSessionStatus:", v3);
  v24 = -[CRNightModeFallbackManager initWithSessionStatus:]([CRNightModeFallbackManager alloc], "initWithSessionStatus:", v3);
  v46 = objc_alloc_init(CRVehicleStore);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_1000574B4, CFSTR("com.apple.language.changed"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v44 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.carkit.reconnectiontime.service"));
  v5 = [CARConnectionTimeServiceAgent alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v43 = -[CARConnectionTimeServiceAgent initWithUserDefaults:sessionStatus:](v5, "initWithUserDefaults:sessionStatus:", v6, v3);

  objc_msgSend(v44, "setDelegate:", v43);
  objc_msgSend(v44, "resume");
  v42 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.carkit.service"));
  v7 = -[CRCarKitServiceAgent initWithVehicleStore:sessionStatus:bluetoothManager:preferences:connectionTimeServiceAgent:]([CRCarKitServiceAgent alloc], "initWithVehicleStore:sessionStatus:bluetoothManager:preferences:connectionTimeServiceAgent:", v46, v3, v40, v39, v43);
  objc_msgSend(v42, "setDelegate:", v7);
  objc_msgSend(v42, "resume");
  v22 = -[CRCarKitIAPRemoteServiceAgent initWithDelegate:]([CRCarKitIAPRemoteServiceAgent alloc], "initWithDelegate:", v7);
  v41 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.carkit.monitoring.service"));
  v38 = objc_alloc_init(CRCarKitMonitoringServiceAgent);
  objc_msgSend(v41, "setDelegate:", v38);
  objc_msgSend(v41, "resume");
  -[CRCarKitServiceAgent setMonitoringService:](v7, "setMonitoringService:", v38);
  v37 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.carkit.app.service"));
  v8 = -[CRCarPlayAppServiceAgent initWithSessionStatus:]([CRCarPlayAppServiceAgent alloc], "initWithSessionStatus:", v3);
  objc_msgSend(v37, "setDelegate:", v8);
  objc_msgSend(v37, "resume");
  v36 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.carkit.navowners.service"));
  v35 = -[CRCarPlayNavigationServiceAgent initWithSessionStatus:]([CRCarPlayNavigationServiceAgent alloc], "initWithSessionStatus:", v3);
  objc_msgSend(v36, "setDelegate:", v35);
  objc_msgSend(v36, "resume");
  v34 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.carkit.theme-asset-library"));
  v45 = objc_alloc_init((Class)CARThemeAssetLibraryAgent);
  objc_msgSend(v34, "setDelegate:", v45);
  v33 = -[CRThemeAssetLibrarian initWithLibraryAgent:vehicleStore:sessionStatus:]([CRThemeAssetLibrarian alloc], "initWithLibraryAgent:vehicleStore:sessionStatus:", v45, v46, v3);
  objc_msgSend(v45, "setDelegate:", v33);
  -[CRCarKitServiceAgent setVehicleAssetManager:](v7, "setVehicleAssetManager:", v33);
  objc_msgSend(v34, "resume");
  v32 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.carkit.navigation.service"));
  objc_msgSend(v32, "setDelegate:", v35);
  objc_msgSend(v32, "resume");
  v31 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.carkit.setupPromptDirector.service"));
  v30 = objc_alloc_init(CRSetupPromptDirectorAgent);
  objc_msgSend(v31, "setDelegate:", v30);
  -[CRCarKitServiceAgent setSetupPromptDirector:](v7, "setSetupPromptDirector:", v30);
  objc_msgSend(v31, "resume");
  v9 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.carkit.pairing.service"));
  v10 = -[CRWirelessPairingServiceAgent initWithBluetoothManager:preferences:vehicleStore:]([CRWirelessPairingServiceAgent alloc], "initWithBluetoothManager:preferences:vehicleStore:", v40, v39, v46);
  objc_msgSend(v9, "setDelegate:", v10);
  -[CRWirelessPairingServiceAgent setPresenter:](v10, "setPresenter:", v7);
  -[CRCarKitServiceAgent setHeadUnitPairingDelegate:](v7, "setHeadUnitPairingDelegate:", v10);
  objc_msgSend(v9, "resume");
  v11 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.carkit.headUnitPairingPrompt.service"));
  objc_msgSend(v11, "setDelegate:", v10);
  objc_msgSend(v11, "resume");
  v12 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.carkit.certificationOverrides.service"));
  v13 = objc_alloc_init(CRCertificationOverridesServiceAgent);
  objc_msgSend(v12, "setDelegate:", v13);
  objc_msgSend(v12, "resume");
  v14 = &_dispatch_main_q;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10005751C;
  handler[3] = &unk_1000B7530;
  v15 = v8;
  v53 = v15;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, handler);

  if (+[CRVehicleStoreAvailability isVehicleStoreAvailable](CRVehicleStoreAvailability, "isVehicleStoreAvailable"))
  {
    -[CRCarKitServiceAgent handleAnyMessagingConnectionsToVehicles](v7, "handleAnyMessagingConnectionsToVehicles", v22, v24, v26, context);
  }
  else
  {
    +[CRVehicleStoreAvailability registerForAvailabilityEvent](CRVehicleStoreAvailability, "registerForAvailabilityEvent", v22, v24, v26, context);
  }
  global_queue = dispatch_get_global_queue(2, 0);
  v17 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000576A0;
  block[3] = &unk_1000B5D10;
  v18 = v46;
  v48 = v18;
  v19 = v3;
  v49 = v19;
  v50 = v57;
  v51 = v55;
  dispatch_async(v17, block);

  objc_autoreleasePoolPop(contexta);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
  objc_msgSend(v20, "run");

  _Block_object_dispose(v55, 8);
  _Block_object_dispose(v57, 8);

  return 0;
}

void sub_100057474(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 200), 8);
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10005749C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000574AC(uint64_t a1)
{

}

uint64_t sub_1000574B4(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  uint8_t v4[16];

  v1 = CarGeneralLogging(a1);
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "system language changed, exiting", v4, 2u);
  }

  return xpc_transaction_exit_clean();
}

void sub_10005751C(uint64_t a1, xpc_object_t xdict)
{
  const char *string;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  int v10;
  void *v11;

  string = xpc_dictionary_get_string(xdict, _xpc_event_key_name);
  if (string)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string));
    v5 = CarGeneralLogging(v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Handling %@ notification", (uint8_t *)&v10, 0xCu);
    }

    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.carkit.carplay-attached")) & 1) == 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[CRVehicleStoreAvailability notifydEventName](CRVehicleStoreAvailability, "notifydEventName"));
      v8 = objc_msgSend(v4, "isEqualToString:", v7);

      if (v8)
      {
        +[CRVehicleStoreAvailability handleAvailabilityEvent](CRVehicleStoreAvailability, "handleAvailabilityEvent");
      }
      else if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.vehiclePolicy.DNDMode")))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[CARDNDManager sharedManager](CARDNDManager, "sharedManager"));
        objc_msgSend(v9, "_checkVehicleState");

      }
      else if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.carkit.capabilities-changed")))
      {
        objc_msgSend(*(id *)(a1 + 32), "requestCarCapabilitiesUpdate");
      }
    }

  }
}

id sub_1000576A0(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  CARDNDServiceAgent *v5;
  uint64_t v6;
  void *v7;

  +[CARDNDManager setupSharedManagerWithVehicleStore:sessionStatus:](CARDNDManager, "setupSharedManagerWithVehicleStore:sessionStatus:", a1[4], a1[5]);
  v2 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.carkit.dnd.service"));
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = -[CARDNDServiceAgent initWithVehicleStore:]([CARDNDServiceAgent alloc], "initWithVehicleStore:", a1[4]);
  v6 = *(_QWORD *)(a1[7] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setDelegate:", *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "resume");
}

void sub_100057960(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100057978(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "service"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activeChannel"));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2 != 0;

}

void sub_100057A68(uint64_t a1)
{
  unsigned __int16 v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  void *v16;

  v2 = (unsigned __int16)objc_msgSend((id)objc_opt_class(*(_QWORD *)(a1 + 32)), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "dictionaryRepresentation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "plistMessenger"));
  v14 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dataForMessageWithIdentifier:contents:error:", v2, v3, &v14));
  v6 = v14;

  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "service"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activeChannel"));

    if (v8)
    {
      objc_msgSend(v8, "sendData:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "activeMessagesForDatas"));
      objc_msgSend(v9, "setObject:forKey:", *(_QWORD *)(a1 + 32), v5);

    }
    else
    {
      v12 = sub_100056C84(2uLL);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "no active channel", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 40), "_queue_handleFailedToSendMessage:", *(_QWORD *)(a1 + 32));
    }

  }
  else
  {
    v10 = sub_100056C84(2uLL);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v3;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "failed to encode message contents: %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "_queue_handleFailedToSendMessage:", *(_QWORD *)(a1 + 32));
  }

}

void sub_100057E20(uint64_t a1)
{
  void *v2;
  void *v3;
  objc_class *v4;
  uint64_t *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  int v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  _DWORD v14[2];
  __int16 v15;
  uint64_t v16;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", *(unsigned __int16 *)(a1 + 48)));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messageClassesForIdentifiers"));
  v4 = (objc_class *)objc_msgSend(v3, "objectForKey:", v2);

  if (v4
    && (-[objc_class conformsToProtocol:](v4, "conformsToProtocol:", &OBJC_PROTOCOL___CARCarPlayServiceMessage) & 1) != 0)
  {
    v5 = (uint64_t *)(a1 + 40);
    v6 = objc_msgSend([v4 alloc], "initWithDictionaryRepresentation:", *(_QWORD *)(a1 + 40));
    if (v6)
    {
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serviceDelegate"));
      v8 = (void *)v7;
      if (v7 && (objc_opt_respondsToSelector(v7, "carPlayService:didReceiveMessage:") & 1) != 0)
        objc_msgSend(v8, "carPlayService:didReceiveMessage:", *(_QWORD *)(a1 + 32), v6);

    }
    else
    {
      v12 = sub_100056C84(2uLL);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_10006E9E0(v5, v13);

    }
  }
  else
  {
    v9 = sub_100056C84(2uLL);
    v6 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(unsigned __int16 *)(a1 + 48);
      v11 = *(_QWORD *)(a1 + 40);
      v14[0] = 67109378;
      v14[1] = v10;
      v15 = 2112;
      v16 = v11;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "unknown message ID: %hu: %@", (uint8_t *)v14, 0x12u);
    }
  }

}

void sub_10005805C(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;

  v2 = sub_100056C84(2uLL);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v7 = 138412290;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "did open BLE service channel: %@", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "setChannelDelegate:", *(_QWORD *)(a1 + 40));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "serviceDelegate"));
  v6 = (void *)v5;
  if (v5 && (objc_opt_respondsToSelector(v5, "carPlayServiceDidActivate:") & 1) != 0)
    objc_msgSend(v6, "carPlayServiceDidActivate:", *(_QWORD *)(a1 + 40));

}

void sub_1000581DC(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  uint64_t v21;

  v2 = sub_100056C84(2uLL);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "did close BLE service channel: %@", buf, 0xCu);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "activeMessagesForDatas", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allKeys"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(a1 + 40);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_queue_popMessageForData:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i)));
        objc_msgSend(v11, "_queue_handleFailedToSendMessage:", v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "serviceDelegate"));
  v14 = (void *)v13;
  if (v13 && (objc_opt_respondsToSelector(v13, "carPlayServiceDidDeactivate:") & 1) != 0)
    objc_msgSend(v14, "carPlayServiceDidDeactivate:", *(_QWORD *)(a1 + 40));

}

void sub_100058430(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_queue_popMessageForData:", *(_QWORD *)(a1 + 40)));
  if (v2)
  {
    v5 = v2;
    v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serviceDelegate"));
    v4 = (void *)v3;
    if (v3 && (objc_opt_respondsToSelector(v3, "carPlayService:didSendMessage:") & 1) != 0)
      objc_msgSend(v4, "carPlayService:didSendMessage:", *(_QWORD *)(a1 + 32), v5);

    v2 = v5;
  }

}

void sub_100058544(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_queue_popMessageForData:", *(_QWORD *)(a1 + 40)));
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 32), "_queue_handleFailedToSendMessage:", v2);
    v2 = v3;
  }

}

void sub_10005862C(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "plistMessenger"));
  objc_msgSend(v2, "handleReceivedData:", *(_QWORD *)(a1 + 40));

}

id sub_100059860(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "address"));
  if (objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)))
    v5 = objc_msgSend(v3, "isServiceSupported:", 0x40000);
  else
    v5 = 0;

  return v5;
}

id sub_100059980(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "address"));
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void sub_100059C30(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  int v18;
  const __CFString *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;

  v5 = a2;
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (v5)
  {
    v8 = objc_msgSend(v5, "BOOLValue");
    v9 = (int)v8;
    v10 = CarGeneralLogging(v8);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = CFSTR("NO");
      v13 = *(_QWORD *)(a1 + 48);
      v18 = 138543875;
      if (v9)
        v12 = CFSTR("YES");
      v19 = v12;
      v20 = 2160;
      v21 = 1752392040;
      v22 = 2113;
      v23 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "received numeric comparison confirmation response %{public}@ for device %{private, mask.hash}@", (uint8_t *)&v18, 0x20u);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"));
    objc_msgSend(v14, "acceptSSP:forDevice:", v9 ^ 1u, *(_QWORD *)(a1 + 40));

  }
  else
  {
    v15 = CarPairingLogging(v7);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_10006EBF8((uint64_t)v6, v16, v17);

    objc_msgSend(*(id *)(a1 + 32), "_pairingFailedForDevice:didTimeout:", *(_QWORD *)(a1 + 40), 0);
  }

}

void sub_10005ACB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = CarSilentModeLogging(a1, a2, a3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Ringer switch toggled", v7, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setLastModeChangeByCarkitd:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setShouldResetMuteState:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "muteStatus"));
  objc_msgSend(*(id *)(a1 + 32), "setShouldResetToMuted:", objc_msgSend(v6, "isDeviceSilentModeOn"));

}

void sub_10005ADE8(uint64_t a1)
{
  void *v1;
  id v2;
  const __CFString *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "muteStatus"));
  v2 = objc_msgSend(v1, "getCarPlaySilentModePreference");

  objc_msgSend(WeakRetained, "setLastModeChangeByCarkitd:", 1);
  if (v2)
  {
    v3 = CFSTR("Unmuted");
    if (v2 == (id)1)
      v3 = CFSTR("Muted");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CarPlay Silent Mode Panel changed during session. %@"), v3));
    objc_msgSend(WeakRetained, "matchDeviceSilentModeToCarPlaySilentModeWithReason:", v4);
  }
  else
  {
    objc_msgSend(WeakRetained, "setShouldResetMuteState:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "muteStatus"));
    objc_msgSend(v4, "setDeviceSilentMode:reason:", objc_msgSend(WeakRetained, "shouldResetToMuted"), CFSTR("Mirroring last non-CarPlay silent mode set"));
  }

}

BOOL sub_10005B018(id a1, MAAsset *a2, NSDictionary *a3)
{
  MAAsset *v3;
  BOOL v4;

  v3 = a2;
  v4 = -[MAAsset state](v3, "state") == (id)2 || -[MAAsset state](v3, "state") == (id)6;

  return v4;
}

void sub_10005B5C8(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;

  v2 = CarThemeAssetsLogging(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v9 = 138412290;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "setting tracked theme assets to: %@", (uint8_t *)&v9, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(v5 + 16);
  if (v6)
  {
    if ((objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32)) & 1) != 0)
      return;
    v5 = *(_QWORD *)(a1 + 40);
  }
  objc_storeStrong((id *)(v5 + 16), *(id *)(a1 + 32));
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "_assetQueue_removeUnusedAssets");
    v7 = *(void **)(a1 + 40);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assetRequests"));
    objc_msgSend(v7, "_assetQueue_queryUpdatedAssetsForRequests:", v8);

  }
}

void sub_10005B760(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;

  v2 = CarThemeAssetsLogging(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v13 = 138412290;
    v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "received download hint for asset request %@", (uint8_t *)&v13, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "assetRequests"));
  v6 = (uint64_t *)(a1 + 32);
  v7 = objc_msgSend(v5, "containsObject:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    v9 = CarThemeAssetsLogging(v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10006ECEC(v6, v10, v11);
  }
  else
  {
    v12 = *(void **)(a1 + 40);
    v10 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", *(_QWORD *)(a1 + 32)));
    objc_msgSend(v12, "_assetQueue_queryUpdatedAssetsForRequests:", v10);
  }

}

id sub_10005B91C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_assetQueue_removeAssetsBeforeVersion:", *(_QWORD *)(a1 + 40));
}

void sub_10005BA10(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  uint64_t v10;

  v5 = a3;
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "assetQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005BAB4;
  block[3] = &unk_1000B54B0;
  v9 = v5;
  v10 = a2;
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  dispatch_async(v6, block);

}

void sub_10005BAB4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint8_t v8[16];

  v2 = *(_QWORD *)(a1 + 48);
  v3 = CarThemeAssetsLogging(a1);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_10006ED58(a1, v5, v6);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "theme assets catalog downloaded", v8, 2u);
    }

    v7 = *(void **)(a1 + 32);
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assetRequests"));
    objc_msgSend(v7, "_assetQueue_queryUpdatedAssetsForRequests:", v5);
  }

}

void sub_10005BE90(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

id *sub_10005BEB4(id *result, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (id *)objc_msgSend(result[4], "_assetQueue_notifyObserverOfAsset:forAssetRequest:", a3, a2);
  return result;
}

void sub_10005BEC8(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  char v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  _QWORD v28[5];
  NSObject *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  uint8_t buf[4];
  id v38;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assetIdentifier"));
  v11 = (void *)v10;
  if (v8)
  {
    objc_msgSend(a1[4], "_assetQueue_notifyObserverOfAsset:forAssetRequest:", v8, v7);
  }
  else if (v9)
  {
    v12 = objc_msgSend(a1[5], "containsObject:", v7);
    v13 = (char)v12;
    v14 = CarThemeAssetsLogging(v12);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if ((v13 & 1) != 0)
    {
      if (v16)
      {
        *(_DWORD *)buf = 138412290;
        v38 = v7;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "theme asset exists for %@ but is not downloaded, requesting download", buf, 0xCu);
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cr_assetVersion"));
      if (v17)
      {
        v18 = objc_msgSend(objc_alloc((Class)NSProgress), "initWithParent:userInfo:", 0, 0);
        objc_msgSend(a1[4], "_assetQueue_notifyObserverOfDownloadAttemptForAssetRequest:version:progress:", v7, v17, v18);
        v19 = objc_alloc_init((Class)MADownloadOptions);
        objc_msgSend(v19, "setAllowsCellularAccess:", 1);
        objc_msgSend(v19, "setDiscretionary:", 0);
        objc_msgSend(v19, "setAllowsExpensiveAccess:", 1);
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472;
        v35[2] = sub_10005C250;
        v35[3] = &unk_1000B7640;
        v20 = v18;
        v36 = v20;
        objc_msgSend(v9, "attachProgressCallBack:", v35);
        v28[1] = 3221225472;
        v28[2] = sub_10005C33C;
        v28[3] = &unk_1000B7690;
        v28[4] = a1[4];
        v28[0] = _NSConcreteStackBlock;
        objc_copyWeak(&v34, a1 + 6);
        v21 = v20;
        v29 = v21;
        v22 = v9;
        v30 = v22;
        v31 = v7;
        v32 = v17;
        v23 = v11;
        v33 = v23;
        objc_msgSend(v22, "startDownload:completionWithError:", v19, v28);
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "assetQueue_currentlyDownloadingAssets"));
        objc_msgSend(v24, "setObject:forKey:", v22, v23);

        objc_destroyWeak(&v34);
      }
      else
      {
        v27 = CarThemeAssetsLogging(0);
        v21 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          sub_10006EEF4(v9, v21);
      }

    }
    else
    {
      if (v16)
      {
        *(_DWORD *)buf = 138412290;
        v38 = v7;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "newer theme asset exists for %@ but will download at another time", buf, 0xCu);
      }

    }
  }
  else
  {
    v25 = CarThemeAssetsLogging(v10);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      sub_10006EE90();

  }
}

void sub_10005C230(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  objc_destroyWeak(location);
  _Unwind_Resume(a1);
}

id sub_10005C250(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  int v10;
  id v11;
  __int16 v12;
  id v13;

  v3 = a2;
  v4 = objc_msgSend(v3, "totalExpected");
  v5 = objc_msgSend(v3, "totalWritten");

  v7 = CarThemeAssetsLogging(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v10 = 134349312;
    v11 = v5;
    v12 = 2050;
    v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "asset download progress: %{public}llu of %{public}llu bytes", (uint8_t *)&v10, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setTotalUnitCount:", v4);
  return objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", v5);
}

void sub_10005C33C(id *a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15[2];

  v5 = a3;
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "assetQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10005C460;
  v8[3] = &unk_1000B7668;
  objc_copyWeak(v15, a1 + 10);
  v15[1] = a2;
  v9 = a1[5];
  v10 = a1[6];
  v11 = a1[7];
  v12 = v5;
  v13 = a1[8];
  v14 = a1[9];
  v7 = v5;
  dispatch_async(v6, v8);

  objc_destroyWeak(v15);
}

void sub_10005C460(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint8_t v10[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v3 = WeakRetained;
  if (*(_QWORD *)(a1 + 88))
  {
    v4 = CarThemeAssetsLogging(WeakRetained);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_10006EF78(a1, v5, v6);

    objc_msgSend(v3, "_assetQueue_notifyObserverOfFailedDownloadForAssetRequest:version:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
  }
  else
  {
    v7 = CarThemeAssetsLogging(objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount")));
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "theme asset download successful", v10, 2u);
    }

    objc_msgSend(v3, "_assetQueue_notifyObserverOfAsset:forAssetRequest:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "assetQueue_currentlyDownloadingAssets"));
  objc_msgSend(v9, "removeObjectForKey:", *(_QWORD *)(a1 + 72));

}

uint64_t sub_10005CB48(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "cr_assetVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));

  if (v4)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "assetRequests", 0));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      while (2)
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v9), "assetIdentifier"));
          v11 = objc_msgSend(v10, "isEqualToString:", v4);

          if ((v11 & 1) != 0)
          {
            v12 = 0;
            goto LABEL_12;
          }
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          continue;
        break;
      }
    }
    v12 = 1;
LABEL_12:

  }
  else
  {
    v12 = 1;
  }

  return v12;
}

BOOL sub_10005CDCC(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "cr_assetVersion"));
  v4 = objc_msgSend(v3, "compare:", *(_QWORD *)(a1 + 32)) == (id)-1;

  return v4;
}

void sub_10005D5B0(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1000DB918;
  qword_1000DB918 = (uint64_t)v1;

}

void sub_10005DE70(id a1, BOOL a2, NSError *a3)
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = CarGeneralLogging(a1);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CARAnalytics: sent wirelessReconnectStarted connection event", v5, 2u);
  }

}

void sub_10005E138(id a1, BOOL a2, NSError *a3)
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = CarGeneralLogging(a1);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CARAnalytics: sent _wirelessReconnectEnded connection event", v5, 2u);
  }

}

void sub_10005E230(id a1, BOOL a2, NSError *a3)
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = CarGeneralLogging(a1);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CARAnalytics: sent _wirelessReconnectEnded connection event", v5, 2u);
  }

}

void sub_10005E4DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10005E4F8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  _BOOL4 v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  _BOOL4 v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  id v48;
  NSObject *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  NSObject *v57;
  id v58;
  uint64_t v59;
  NSObject *v60;
  const char *v61;
  uint32_t v62;
  uint64_t v63;
  _BOOL4 v64;
  _BOOL4 v65;
  NSObject *v66;
  uint64_t v67;
  id v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  void *j;
  void *v73;
  void *v74;
  void *v75;
  _BOOL4 v76;
  uint64_t v77;
  _BOOL4 v78;
  double v79;
  double v80;
  void *v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  NSObject *v85;
  void *v86;
  double v87;
  double v88;
  void *v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  NSObject *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  unsigned int v97;
  void *v98;
  void *v99;
  id v100;
  double v101;
  uint64_t v102;
  NSObject *v103;
  NSObject *v104;
  void *v105;
  void *v106;
  double v107;
  double v108;
  void *v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  double v114;
  double v115;
  void *v116;
  void *v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  uint64_t v121;
  uint64_t v122;
  NSObject *v123;
  void *v124;
  void *v125;
  id v126;
  uint64_t v127;
  void *v128;
  id v129;
  void *v130;
  void *v131;
  BOOL v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  _BOOL4 v137;
  void *v138;
  _BOOL4 v139;
  _BOOL4 v140;
  void *v141;
  void *v142;
  void *v143;
  _BOOL4 v144;
  void *v145;
  id v146;
  id v147;
  id WeakRetained;
  void *v149;
  void *v150;
  uint64_t v151;
  NSObject *v152;
  void *v153;
  NSObject *v154;
  NSObject *v155;
  NSObject *v156;
  NSObject *obj;
  void *v158;
  void *v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  _QWORD v172[4];
  id v173;
  id v174;
  __int128 *p_buf;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  uint8_t v180[128];
  uint8_t v181[4];
  void *v182;
  __int16 v183;
  void *v184;
  _BYTE v185[128];
  uint8_t v186[128];
  __int128 buf;
  uint64_t v188;
  uint64_t v189;
  _BYTE v190[128];

  v5 = a2;
  v147 = a3;
  v151 = a1;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v150 = v5;
  if (!objc_msgSend(v5, "count"))
    goto LABEL_123;
  v149 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
  v6 = CarGeneralLogging(v149);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "events"));
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v8, "count");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Number of events in the lastSession: %lu", (uint8_t *)&buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", CFSTR("Unknown"), CFSTR("reconnectionBTTime"));
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", CFSTR("Unknown"), CFSTR("reconnectioniAPTime"));
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", CFSTR("Unknown"), CFSTR("reconnectionWifiTime"));
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", CFSTR("Unknown"), CFSTR("reconnectionAirPlayTime"));
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", CFSTR("Unknown"), CFSTR("reconnectionCarkitTime"));
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", CFSTR("Unknown"), CFSTR("reconnectionTotalTime"));
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", CFSTR("Unknown"), CFSTR("reconnectioniAPOverBluetoothTime"));
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", CFSTR("Unknown"), CFSTR("reconnectioniAPOverWiFiTime"));
  v9 = objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", CFSTR("Unknown"), CFSTR("reconnectioniAPOverUSBTime"));
  if (!v149)
  {
    v24 = CarGeneralLogging(v9);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "No available session for wireless reconnect calculations - exiting.", (uint8_t *)&buf, 2u);
    }

    objc_msgSend(WeakRetained, "sendEvent:withDictionary:", 8, *(_QWORD *)(a1 + 32));
    goto LABEL_122;
  }
  v145 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", &off_1000BE6C8));
  v178 = 0u;
  v179 = 0u;
  v176 = 0u;
  v177 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "allEventsOfTypes:", v145));
  v10 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v176, v190, 16);
  v11 = v10 != 0;
  if (!v10)
  {
    v159 = 0;
    v12 = 0;
    v26 = obj;
    goto LABEL_25;
  }
  v12 = 0;
  v159 = 0;
  v13 = *(_QWORD *)v177;
  v14 = CARBluetoothWirelessIAPProfileConnectionAttempt;
  v15 = CARBluetoothWirelessIAPProfileConnectionSuccess;
  do
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(_QWORD *)v177 != v13)
        objc_enumerationMutation(obj);
      v17 = *(void **)(*((_QWORD *)&v176 + 1) + 8 * (_QWORD)i);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "eventName"));
      if (objc_msgSend(v18, "isEqualToString:", v14))
      {
        v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "eventDate"));
        v20 = v159;
        v159 = (void *)v19;
      }
      else
      {
        if (!objc_msgSend(v18, "isEqualToString:", v15))
          goto LABEL_15;
        v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "eventDate"));
        v20 = v12;
        v12 = (void *)v21;
      }

LABEL_15:
    }
    v10 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v176, v190, 16);
  }
  while (v10);

  v22 = v159 != 0;
  if (!v159)
    goto LABEL_26;
  v23 = v12;
  if (v12)
  {
    if (objc_msgSend(v159, "compare:", v12) != (id)-1)
    {
      v22 = 1;
      goto LABEL_26;
    }
    objc_msgSend(v12, "timeIntervalSinceDate:", v159);
    v108 = v107;
    v109 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "stringValue"));
    objc_msgSend(*(id *)(v151 + 32), "setObject:forKeyedSubscript:", v110, CFSTR("reconnectionBTTime"));

    v112 = CarGeneralLogging(v111);
    v26 = objc_claimAutoreleasedReturnValue(v112);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v113 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v108));
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v113;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Bluetooth reconnection time: %@", (uint8_t *)&buf, 0xCu);

    }
LABEL_25:

    v22 = v11;
LABEL_26:
    v23 = v12;
  }
  v143 = v23;
  v144 = v22;
  if (qword_1000DB938 != -1)
    dispatch_once(&qword_1000DB938, &stru_1000B7780);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v188 = 0x2020000000;
  v189 = 0;
  v27 = (void *)qword_1000DB928;
  v172[0] = _NSConcreteStackBlock;
  v172[1] = 3221225472;
  v172[2] = sub_10005F764;
  v172[3] = &unk_1000B77A8;
  v146 = v149;
  v173 = v146;
  p_buf = &buf;
  v174 = *(id *)(v151 + 32);
  objc_msgSend(v27, "enumerateObjectsUsingBlock:", v172);
  if (*(double *)(*((_QWORD *)&buf + 1) + 24) > 0.0)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "stringValue"));
    objc_msgSend(*(id *)(v151 + 32), "setObject:forKeyedSubscript:", v29, CFSTR("reconnectioniAPTime"));

  }
  v142 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", &off_1000BE770));
  v170 = 0u;
  v171 = 0u;
  v168 = 0u;
  v169 = 0u;
  v156 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "allEventsOfTypes:"));
  v30 = -[NSObject countByEnumeratingWithState:objects:count:](v156, "countByEnumeratingWithState:objects:count:", &v168, v186, 16);
  if (!v30)
  {
    v158 = 0;
    v153 = 0;
    v46 = v156;
    goto LABEL_49;
  }
  v153 = 0;
  v158 = 0;
  v31 = *(_QWORD *)v169;
  v32 = CARAirPlayEndpointSelected;
  v33 = CARAirPlayCarSentStatistics;
  while (2)
  {
    v34 = 0;
    while (2)
    {
      if (*(_QWORD *)v169 != v31)
        objc_enumerationMutation(v156);
      v35 = *(void **)(*((_QWORD *)&v168 + 1) + 8 * v34);
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "eventName"));
      if (objc_msgSend(v36, "isEqualToString:", v32))
      {
        v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "eventDate"));
        v38 = v158;
        v158 = (void *)v37;
        goto LABEL_40;
      }
      if (objc_msgSend(v36, "isEqualToString:", v33))
      {
        v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "eventDate"));
        v38 = v153;
        v153 = (void *)v39;
LABEL_40:

      }
      if (v30 != (id)++v34)
        continue;
      break;
    }
    v30 = -[NSObject countByEnumeratingWithState:objects:count:](v156, "countByEnumeratingWithState:objects:count:", &v168, v186, 16);
    if (v30)
      continue;
    break;
  }

  if (v158 && v153 && objc_msgSend(v158, "compare:") == (id)-1)
  {
    objc_msgSend(v153, "timeIntervalSinceDate:", v158);
    v41 = v40;
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "stringValue"));
    objc_msgSend(*(id *)(v151 + 32), "setObject:forKeyedSubscript:", v43, CFSTR("reconnectionAirPlayTime"));

    v45 = CarGeneralLogging(v44);
    v46 = objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v41));
      *(_DWORD *)v181 = 138412290;
      v182 = v47;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "AirPlay reconnection time: %@", v181, 0xCu);

    }
LABEL_49:

  }
  v141 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", &off_1000BE788));
  v166 = 0u;
  v167 = 0u;
  v164 = 0u;
  v165 = 0u;
  v155 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "allEventsOfTypes:"));
  v48 = -[NSObject countByEnumeratingWithState:objects:count:](v155, "countByEnumeratingWithState:objects:count:", &v164, v185, 16);
  v139 = v48 != 0;
  if (!v48)
  {
    v49 = 0;
    v152 = 0;
    v66 = v155;
    goto LABEL_72;
  }
  v152 = 0;
  v49 = 0;
  v50 = *(_QWORD *)v165;
  v51 = CARCarKitAttemptingConnectionEvent;
  v52 = CARCarKitConnectionSessionEndEvent;
  v53 = CARCarKitWirelessPairingCreatedEvent;
  while (2)
  {
    v54 = 0;
    while (2)
    {
      if (*(_QWORD *)v165 != v50)
        objc_enumerationMutation(v155);
      v55 = *(void **)(*((_QWORD *)&v164 + 1) + 8 * v54);
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "eventName"));
      if (objc_msgSend(v56, "isEqualToString:", v51))
      {
        v57 = v49;
        v49 = objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "eventDate"));
        goto LABEL_65;
      }
      if (objc_msgSend(v56, "isEqualToString:", v52))
      {
        v57 = v152;
        v152 = objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "eventDate"));
        goto LABEL_65;
      }
      v58 = objc_msgSend(v56, "isEqualToString:", v53);
      if ((_DWORD)v58)
      {
        v59 = CarGeneralLogging(objc_msgSend(*(id *)(v151 + 32), "setObject:forKeyedSubscript:", CFSTR("true"), CFSTR("wasPairing")));
        v57 = objc_claimAutoreleasedReturnValue(v59);
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v181 = 0;
          v60 = v57;
          v61 = "CARAnalytics: CARCarKitWirelessPairingCreatedEvent discovered. Marking this event as a first time pairing experience.";
          v62 = 2;
          goto LABEL_64;
        }
      }
      else
      {
        v63 = CarGeneralLogging(v58);
        v57 = objc_claimAutoreleasedReturnValue(v63);
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v181 = 138412546;
          v182 = v55;
          v183 = 2112;
          v184 = v56;
          v60 = v57;
          v61 = "CARAnalytics: Unknown CarKit Event name discovered in allCarKitEvents: %@ : %@";
          v62 = 22;
LABEL_64:
          _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, v61, v181, v62);
        }
      }
LABEL_65:

      if (v48 != (id)++v54)
        continue;
      break;
    }
    v48 = -[NSObject countByEnumeratingWithState:objects:count:](v155, "countByEnumeratingWithState:objects:count:", &v164, v185, 16);
    if (v48)
      continue;
    break;
  }

  v64 = v49 != 0;
  v65 = v152 != 0;
  if (v49 && v152)
  {
    if (-[NSObject compare:](v49, "compare:") != (id)-1)
    {
      v65 = 1;
      v64 = 1;
      goto LABEL_73;
    }
    -[NSObject timeIntervalSinceDate:](v152, "timeIntervalSinceDate:", v49);
    v115 = v114;
    v116 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "stringValue"));
    objc_msgSend(*(id *)(v151 + 32), "setObject:forKeyedSubscript:", v117, CFSTR("reconnectionCarkitTime"));

    v119 = CarGeneralLogging(v118);
    v66 = objc_claimAutoreleasedReturnValue(v119);
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      v120 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v115));
      *(_DWORD *)v181 = 138412290;
      v182 = v120;
      _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "CarKit reconnection time: %@", v181, 0xCu);

    }
LABEL_72:

    v65 = v139;
    v64 = v139;
  }
LABEL_73:
  v67 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", &off_1000BE7A0));
  v162 = 0u;
  v163 = 0u;
  v160 = 0u;
  v161 = 0u;
  v154 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "allEventsOfTypes:", v67));
  v68 = -[NSObject countByEnumeratingWithState:objects:count:](v154, "countByEnumeratingWithState:objects:count:", &v160, v180, 16);
  v140 = v65;
  v138 = (void *)v67;
  if (!v68)
  {
    v69 = 0;
    v85 = v154;
    goto LABEL_92;
  }
  v137 = v64;
  v69 = 0;
  v70 = *(_QWORD *)v161;
  v71 = CARWiFiWPAHSCompleted;
  do
  {
    for (j = 0; j != v68; j = (char *)j + 1)
    {
      if (*(_QWORD *)v161 != v70)
        objc_enumerationMutation(v154);
      v73 = *(void **)(*((_QWORD *)&v160 + 1) + 8 * (_QWORD)j);
      v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "eventName"));
      if (objc_msgSend(v74, "isEqualToString:", v71))
      {
        if (!v69
          || (v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "eventDate")),
              v76 = objc_msgSend(v75, "compare:", v69) == (id)-1,
              v75,
              v76))
        {
          v77 = objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "eventDate"));

          v69 = (void *)v77;
        }
      }

    }
    v68 = -[NSObject countByEnumeratingWithState:objects:count:](v154, "countByEnumeratingWithState:objects:count:", &v160, v180, 16);
  }
  while (v68);

  if (v69)
    v78 = v137;
  else
    v78 = 0;
  if (v78 && -[NSObject compare:](v49, "compare:", v69) == (id)-1)
  {
    objc_msgSend(v69, "timeIntervalSinceDate:", v49);
    v80 = v79;
    v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "stringValue"));
    objc_msgSend(*(id *)(v151 + 32), "setObject:forKeyedSubscript:", v82, CFSTR("reconnectionWifiTime"));

    v84 = CarGeneralLogging(v83);
    v85 = objc_claimAutoreleasedReturnValue(v84);
    if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
    {
      v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v80));
      *(_DWORD *)v181 = 138412290;
      v182 = v86;
      _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "Wi-Fi reconnection time: %@", v181, 0xCu);

    }
LABEL_92:

  }
  if (v144 && v140 && objc_msgSend(v159, "compare:", v152) == (id)-1)
  {
    -[NSObject timeIntervalSinceDate:](v152, "timeIntervalSinceDate:", v159);
    v88 = v87;
    v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "stringValue"));
    objc_msgSend(*(id *)(v151 + 32), "setObject:forKeyedSubscript:", v90, CFSTR("reconnectionTotalTime"));

    v92 = CarGeneralLogging(v91);
    v93 = objc_claimAutoreleasedReturnValue(v92);
    if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
    {
      v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v88));
      *(_DWORD *)v181 = 138412290;
      v182 = v94;
      _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEFAULT, "Total reconnection time: %@", v181, 0xCu);

    }
    if (CRIsInternalInstall(v95))
    {
      v96 = (void *)objc_claimAutoreleasedReturnValue(+[CARPrototypePref allowAutomaticConnectionDurationTTR](CARPrototypePref, "allowAutomaticConnectionDurationTTR"));
      v97 = objc_msgSend(v96, "internalSettingsState");

      if (v97)
      {
        v98 = (void *)objc_claimAutoreleasedReturnValue(+[CARPrototypePref wirelessConnectionDurationTTRThreshold](CARPrototypePref, "wirelessConnectionDurationTTRThreshold"));
        v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "internalSettingsValue"));

        v100 = objc_msgSend(v99, "doubleValue");
        if (v88 > v101)
        {
          if (v101 <= 7.0)
          {
            v121 = CarGeneralLogging(v100);
            v104 = objc_claimAutoreleasedReturnValue(v121);
            if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v181 = 0;
              _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_DEFAULT, "Reconnection time exceeded user-default threshold but the user-default value is lower than CarPlay spec requirement. No radar draft necessary.", v181, 2u);
            }
          }
          else
          {
            v102 = CarGeneralLogging(v100);
            v103 = objc_claimAutoreleasedReturnValue(v102);
            if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v181 = 0;
              _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_DEFAULT, "Reconnection time exceeded user-defined threshold. Preparing TTR Draft.", v181, 2u);
            }

            v104 = objc_alloc_init((Class)NSDateComponentsFormatter);
            -[NSObject setAllowedUnits:](v104, "setAllowedUnits:", 192);
            -[NSObject setZeroFormattingBehavior:](v104, "setZeroFormattingBehavior:", 0x10000);
            v105 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject stringFromTimeInterval:](v104, "stringFromTimeInterval:", v88));
            v106 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Total Reconnection Time: %@"), v105));
            objc_msgSend(WeakRetained, "_prepareConnectionTTRDraftWithConnectionSession:withAdditionalDescription:completionHandler:", v146, v106, &stru_1000B77C8);

          }
        }

      }
    }
  }
  v122 = CarGeneralLogging(objc_msgSend(WeakRetained, "sendEvent:withDictionary:", 8, *(_QWORD *)(v151 + 32)));
  v123 = objc_claimAutoreleasedReturnValue(v122);
  if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v181 = 0;
    _os_log_impl((void *)&_mh_execute_header, v123, OS_LOG_TYPE_DEFAULT, "CARAnalytics: sent wirelessSessionEndedWithPayload event", v181, 2u);
  }

  if ((unint64_t)objc_msgSend(v150, "count") >= 2)
  {
    v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "objectAtIndexedSubscript:", 1));
    v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "vehicleInformation"));
    v126 = objc_msgSend(v125, "mutableCopy");
    v128 = v126;
    if (v126)
      v129 = v126;
    else
      v129 = (id)objc_opt_new(NSMutableDictionary, v127);
    v130 = v129;

    v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "events"));
    v132 = objc_msgSend(v131, "count") == 0;

    if (!v132)
    {
      v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "events"));
      v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v133, "firstObject"));
      v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v134, "eventDate"));
      v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v135, "description"));
      objc_msgSend(v130, "setObject:forKeyedSubscript:", v136, CFSTR("finalEventTime"));

    }
    objc_msgSend(WeakRetained, "sendEvent:withDictionary:", 7, v130);

  }
  _Block_object_dispose(&buf, 8);

LABEL_122:
LABEL_123:

}

void sub_10005F658(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x3B0], 8);
  _Unwind_Resume(a1);
}

void sub_10005F728(id a1)
{
  void *v1;
  void *v2;

  v1 = (void *)qword_1000DB928;
  qword_1000DB928 = (uint64_t)&off_1000BF230;

  v2 = (void *)qword_1000DB930;
  qword_1000DB930 = (uint64_t)&off_1000BF248;

}

void sub_10005F764(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  const __CFString *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  _BYTE v43[128];

  v5 = a2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "allEventsOfTypes:", v6));
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (!v8)
  {
    v11 = 0;
    v10 = 0;
    goto LABEL_24;
  }
  v9 = v8;
  v33 = a1;
  v34 = a3;
  v35 = v6;
  v36 = v5;
  v10 = 0;
  v11 = 0;
  v12 = *(_QWORD *)v38;
  v13 = CARiAPConnectionStart;
  v14 = CARiAPAuthComplete;
  do
  {
    for (i = 0; i != v9; i = (char *)i + 1)
    {
      if (*(_QWORD *)v38 != v12)
        objc_enumerationMutation(v7);
      v16 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "eventName", v33));
      if (objc_msgSend(v17, "isEqualToString:", v13))
      {
        v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "eventDate"));
        v19 = v11;
        v11 = (void *)v18;
      }
      else
      {
        if (!objc_msgSend(v17, "isEqualToString:", v14))
          goto LABEL_11;
        v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "eventDate"));
        v19 = v10;
        v10 = (void *)v20;
      }

LABEL_11:
    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  }
  while (v9);
  if (v11)
  {
    v6 = v35;
    v5 = v36;
    if (v10 && objc_msgSend(v11, "compare:", v10) == (id)-1)
    {
      objc_msgSend(v10, "timeIntervalSinceDate:", v11);
      v22 = v21;
      *(double *)(*(_QWORD *)(*(_QWORD *)(v33 + 48) + 8) + 24) = v21
                                                                   + *(double *)(*(_QWORD *)(*(_QWORD *)(v33 + 48) + 8)
                                                                               + 24);
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v21));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "stringValue"));
      v25 = *(void **)(v33 + 40);
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000DB930, "objectAtIndexedSubscript:", v34));
      v27 = objc_msgSend(v26, "unsignedIntegerValue");
      if ((unint64_t)v27 > 0xA)
        v28 = CFSTR("Unknown");
      else
        v28 = *(&off_1000B7888 + (_QWORD)v27);
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v24, v28);

      v30 = CarGeneralLogging(v29);
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v22));
        *(_DWORD *)buf = 138412290;
        v42 = v32;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "iAP reconnection time: %@", buf, 0xCu);

      }
    }
  }
  else
  {
    v6 = v35;
    v5 = v36;
  }
LABEL_24:

}

void sub_10005FA68(id a1)
{
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[16];

  v1 = CarGeneralLogging(a1);
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "TTR Draft prepared for user.", v3, 2u);
  }

}

void sub_10005FB5C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_10005FB78(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((unint64_t)objc_msgSend(v17, "count") >= 2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", 1));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "vehicleInformation"));
    v6 = objc_msgSend(v5, "mutableCopy");
    v8 = v6;
    if (v6)
      v9 = v6;
    else
      v9 = (id)objc_opt_new(NSMutableDictionary, v7);
    v10 = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "events"));
    v12 = objc_msgSend(v11, "count");

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "events"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "eventDate"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "description"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, CFSTR("finalEventTime"));

    }
    objc_msgSend(WeakRetained, "sendEvent:withDictionary:", 7, v10);

  }
}

void sub_10005FE2C(id a1, BOOL a2, NSError *a3)
{
  _BOOL4 v3;
  NSError *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];

  v3 = a2;
  v4 = a3;
  v5 = CarGeneralLogging(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "CARAnalytics: sent wirelessPairingCreatedEvent connection event", v8, 2u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_10006F064(v4);
  }

}

uint64_t sub_1000603F0(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

int64_t sub_1000606A4(id a1, MAAsset *a2, MAAsset *a3)
{
  return -[MAAsset cr_themeAsset_versionCompare:](a2, "cr_themeAsset_versionCompare:", a3);
}

uint64_t sub_100060860(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  _BOOL4 v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  NSObject *v30;
  uint32_t v31;
  void *v32;
  int v34;
  id v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  uint64_t v39;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cr_themeAsset_assetIdentifier"));
  if (!v4 || !objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v4))
  {
    v16 = 0;
    goto LABEL_30;
  }
  if (*(_QWORD *)(a1 + 40))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cr_themeAsset_minimumSDKVersion"));
    v6 = v5;
    if (v5)
    {
      v7 = objc_msgSend(v5, "cr_buildVersionCompare:", *(_QWORD *)(a1 + 40));
      v8 = (unint64_t)v7 + 1;
      v9 = CarThemeAssetsLogging(v7);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      if (v8 > 1)
      {
        if (v11)
        {
          v26 = *(_QWORD *)(a1 + 40);
          v34 = 138412802;
          v35 = v3;
          v36 = 2112;
          v37 = v6;
          v38 = 2112;
          v39 = v26;
          v25 = "ignoring asset %@, the minimum SDK version of %@ is not valid for SDK: %@";
          goto LABEL_21;
        }
LABEL_22:
        v16 = 0;
LABEL_29:

        goto LABEL_30;
      }
      if (!v11)
        goto LABEL_12;
      v12 = *(void **)(a1 + 40);
      v34 = 138412546;
      v35 = v6;
      v36 = 2112;
      v37 = v12;
      v13 = "asset's minimum SDK version of %@ is valid for SDK: %@";
      v14 = v10;
      v15 = 22;
    }
    else
    {
      v17 = CarThemeAssetsLogging(0);
      v10 = objc_claimAutoreleasedReturnValue(v17);
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
LABEL_12:

        goto LABEL_13;
      }
      v18 = *(void **)(a1 + 40);
      v34 = 138412290;
      v35 = v18;
      v13 = "asset does not have a minimum SDK version, assuming it works with SDK: %@";
      v14 = v10;
      v15 = 12;
    }
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v34, v15);
    goto LABEL_12;
  }
LABEL_13:
  if (*(_QWORD *)(a1 + 48))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cr_themeAsset_minimumCompatibilityVersion"));
    v6 = v19;
    if (v19)
    {
      v20 = objc_msgSend(v19, "unsignedIntegerValue");
      v21 = objc_msgSend(*(id *)(a1 + 48), "unsignedIntegerValue");
      v22 = CarThemeAssetsLogging(v21);
      v10 = objc_claimAutoreleasedReturnValue(v22);
      v23 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      if (v20 > v21)
      {
        if (v23)
        {
          v24 = *(_QWORD *)(a1 + 48);
          v34 = 138412802;
          v35 = v3;
          v36 = 2112;
          v37 = v6;
          v38 = 2112;
          v39 = v24;
          v25 = "ignoring asset %@, the minimum compatibility version of %@ is not valid for supported compatibility version: %@";
LABEL_21:
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v25, (uint8_t *)&v34, 0x20u);
          goto LABEL_22;
        }
        goto LABEL_22;
      }
      if (v23)
      {
        v32 = *(void **)(a1 + 48);
        v34 = 138412546;
        v35 = v6;
        v36 = 2112;
        v37 = v32;
        v29 = "asset's minimum compatibility version of %@ is valid for supported compatibility version: %@";
        v30 = v10;
        v31 = 22;
        goto LABEL_27;
      }
    }
    else
    {
      v27 = CarThemeAssetsLogging(0);
      v10 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v28 = *(void **)(a1 + 48);
        v34 = 138412290;
        v35 = v28;
        v29 = "asset does not have a minimum compatibility version, assuming it works with compatibility version: %@";
        v30 = v10;
        v31 = 12;
LABEL_27:
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, v29, (uint8_t *)&v34, v31);
      }
    }
    v16 = 1;
    goto LABEL_29;
  }
  v16 = 1;
LABEL_30:

  return v16;
}

void sub_100060E40(uint64_t a1)
{
  void *v2;
  char *v3;
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  unsigned int v9;
  unsigned int v10;
  id v11;
  unint64_t v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  unint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  int v29;
  unsigned int v30;
  unsigned __int16 v31;
  uint8_t buf[4];
  int v33;
  __int16 v34;
  void *v35;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "receiveBuffer"));
  if (v2)
  {
    v3 = (char *)objc_msgSend(*(id *)(a1 + 40), "length");
    v4 = objc_msgSend(v2, "length");
    if (__CFADD__(v4, v3) || &v3[(_QWORD)v4] > (char *)0x100000)
    {
      v7 = sub_100056C84(2uLL);
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_10006F384();

      v6 = objc_claimAutoreleasedReturnValue(+[NSData data](NSData, "data"));
      objc_msgSend(v2, "setData:", v6);
      goto LABEL_10;
    }
    objc_msgSend(v2, "appendData:", *(_QWORD *)(a1 + 40));
    if ((unint64_t)objc_msgSend(v2, "length") <= 6)
    {
      v5 = sub_100056C84(2uLL);
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        sub_10006F3B0();
LABEL_10:

      goto LABEL_33;
    }
    v31 = 0;
    objc_msgSend(v2, "getBytes:range:", &v31, 0, 2);
    v9 = v31;
    v30 = 0;
    objc_msgSend(v2, "getBytes:range:", &v30, 2, 4);
    v10 = v30;
    v11 = objc_msgSend(v2, "length");
    v12 = (unint64_t)v11 - 6;
    if ((unint64_t)v11 >= 6)
    {
      v16 = bswap32(v10);
      if (v12 < v16)
      {
        v17 = sub_100056C84(2uLL);
        v15 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          sub_10006F414();
        goto LABEL_32;
      }
      if (v12 <= v16)
      {
        if (v12 != v16)
          goto LABEL_33;
        v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "subdataWithRange:", 6, v12));
        v29 = 0;
        v19 = objc_opt_class(NSDictionary);
        v20 = (void *)OPACKDecodeData(v15, 0, &v29);
        v21 = sub_10002FC18(v19, v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

        v23 = sub_100056C84(2uLL);
        v24 = objc_claimAutoreleasedReturnValue(v23);
        v25 = v24;
        if (v22)
        {
          v26 = bswap32(v9) >> 16;
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109378;
            v33 = v26;
            v34 = 2112;
            v35 = v22;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "received message { id: %hu, contents: %@ }", buf, 0x12u);
          }

          v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messageReceiver"));
          v25 = v27;
          if (v27
            && (objc_opt_respondsToSelector(v27, "propertyListMessenger:didReceiveMessageWithIdentifier:contents:") & 1) != 0)
          {
            -[NSObject propertyListMessenger:didReceiveMessageWithIdentifier:contents:](v25, "propertyListMessenger:didReceiveMessageWithIdentifier:contents:", *(_QWORD *)(a1 + 32), v26, v22);
          }
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](NSData, "data"));
          objc_msgSend(v2, "setData:", v28);

        }
        else if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          sub_10006F4E4(&v29, v25);
        }

LABEL_32:
        goto LABEL_33;
      }
      v18 = sub_100056C84(2uLL);
      v14 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_10006F484();
    }
    else
    {
      v13 = sub_100056C84(2uLL);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_10006F3E8();
    }

    v15 = objc_claimAutoreleasedReturnValue(+[NSData data](NSData, "data"));
    objc_msgSend(v2, "setData:", v15);
    goto LABEL_32;
  }
LABEL_33:

}

void sub_100061648(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = a2;
  v3 = CarGeneralLogging(v2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "wifid crashed, re-attaching", v5, 2u);
  }

  objc_msgSend(v2, "_updateWiFiDevice");
  objc_msgSend(v2, "_powerStateDidChange");

}

void sub_1000616C8(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a3;
  v4 = CarGeneralLogging(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "wifi device attached, updating", v6, 2u);
  }

  objc_msgSend(v3, "_updateWiFiDevice");
}

void sub_100061740(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v2 = a2;
  v3 = CarGeneralLogging(v2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "wifi power state changed.", v6, 2u);
  }

  objc_msgSend(v2, "_powerStateDidChange");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("CRWiFiPowerChangedNotification"), v2);

}

void sub_100061AC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100061AE4(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;

  v6 = a2;
  if (v6)
  {
    v9 = v6;
    v7 = v6;
    v8 = *(_QWORD *)(a1 + 32);
    if (v8 && (*(unsigned int (**)(uint64_t, id))(v8 + 16))(v8, v7))
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v7;
      CFRetain(*(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
      *a4 = 1;
    }
    CFRelease(v7);
    v6 = v9;
  }

}

id sub_100061BF0(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_uuidForNetwork:", a2));
  v4 = objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", v3);

  return v4;
}

id sub_100061CB8(uint64_t a1, uint64_t a2)
{
  uint64_t SSID;
  void *v5;
  id v6;

  SSID = WiFiNetworkGetSSID(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(SSID);
  if (WiFiNetworkIsCarPlay(a2))
    v6 = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v5);
  else
    v6 = 0;

  return v6;
}

void sub_100062DDC(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  id v10;
  uint8_t v11[4];
  int v12;
  _QWORD v13[2];
  _QWORD v14[2];

  v13[0] = CFSTR("messageType");
  v13[1] = CFSTR("request");
  v14[0] = &off_1000BE818;
  v14[1] = &off_1000BE830;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 2));
  v12 = 0;
  v3 = (void *)OPACKEncoderCreateData(v2, 0, &v12);
  if (v3)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "channelIsOpen") & 1) != 0)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "channel"));
      v5 = objc_msgSend(v4, "sendChannelMessage:", v3);

      v6 = sub_100056C84(4uLL);
      v7 = objc_claimAutoreleasedReturnValue(v6);
      v8 = v7;
      if ((v5 & 1) != 0)
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v11 = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "sent request for log archive", v11, 2u);
        }
      }
      else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        sub_10006F5FC();
      }
    }
    else
    {
      v10 = sub_100056C84(4uLL);
      v8 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_10006F628();
    }
  }
  else
  {
    v9 = sub_100056C84(4uLL);
    v8 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10006F598();
  }

}

void sub_100063008(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  uint8_t v12[4];
  int v13;
  _QWORD v14[3];
  _QWORD v15[3];

  v14[0] = CFSTR("messageType");
  v14[1] = CFSTR("request");
  v15[0] = &off_1000BE818;
  v15[1] = &off_1000BE848;
  v14[2] = CFSTR("interval");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40)));
  v15[2] = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 3));

  v13 = 0;
  v4 = (void *)OPACKEncoderCreateData(v3, 0, &v13);
  if (v4)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "channelIsOpen") & 1) != 0)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "channel"));
      v6 = objc_msgSend(v5, "sendChannelMessage:", v4);

      v7 = sub_100056C84(4uLL);
      v8 = objc_claimAutoreleasedReturnValue(v7);
      v9 = v8;
      if ((v6 & 1) != 0)
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v12 = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "sent request for start statistics", v12, 2u);
        }
      }
      else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        sub_10006F6B8();
      }
    }
    else
    {
      v11 = sub_100056C84(4uLL);
      v9 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_10006F6E4();
    }
  }
  else
  {
    v10 = sub_100056C84(4uLL);
    v9 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10006F654();
  }

}

id sub_10006325C(uint64_t a1)
{
  void *v2;
  id result;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "channel"));
  objc_msgSend(v2, "setChannelDelegate:", 0);

  result = objc_msgSend(*(id *)(a1 + 32), "channelIsOpen");
  if ((_DWORD)result)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "channel"));
    objc_msgSend(v4, "closeChannel");

    return objc_msgSend(*(id *)(a1 + 32), "setChannelIsOpen:", 0);
  }
  return result;
}

void sub_100063368(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  id v22;
  int v23;

  v23 = 0;
  v2 = objc_opt_class(NSDictionary);
  v3 = a1 + 32;
  v4 = (id)OPACKDecodeData(*(_QWORD *)(a1 + 32), 0, &v23);
  v5 = v4;
  if (v4 && (objc_opt_isKindOfClass(v4, v2) & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  if (v6)
  {
    v7 = objc_opt_class(NSNumber);
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("messageType")));
    v9 = v8;
    if (v8 && (objc_opt_isKindOfClass(v8, v7) & 1) != 0)
      v10 = v9;
    else
      v10 = 0;

    if (v10)
    {
      switch((unint64_t)-[NSObject unsignedIntegerValue](v10, "unsignedIntegerValue"))
      {
        case 1uLL:
          objc_msgSend(*(id *)(a1 + 40), "_fileQueue_handleFileHeaderMessage:", v6);
          break;
        case 2uLL:
          objc_msgSend(*(id *)(a1 + 40), "_fileQueue_handleFilePayloadMessage:", v6);
          break;
        case 3uLL:
          v20 = sub_100056C84(4uLL);
          v21 = objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            sub_10006F7F0();
          goto LABEL_24;
        case 4uLL:
          objc_msgSend(*(id *)(a1 + 40), "_fileQueue_handleStreamPayloadMessage:", v6);
          break;
        case 5uLL:
          v22 = sub_100056C84(4uLL);
          v21 = objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            sub_10006F81C();
LABEL_24:

          break;
        default:
          break;
      }
    }
    else
    {
      v12 = sub_100056C84(4uLL);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_10006F788(v3, v13, v14, v15, v16, v17, v18, v19);

    }
  }
  else
  {
    v11 = sub_100056C84(4uLL);
    v10 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10006F710((_QWORD *)(a1 + 32), &v23, v10);
  }

}

id sub_1000635E4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setChannelIsOpen:", 0);
}

void sub_100064DEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100064E40(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_mainQueue_handleDidDiscoverDevice:", v3);

}

void sub_100064E88(id a1, NSError *a2)
{
  NSError *v2;
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v2 = a2;
  v3 = sub_100056C84(2uLL);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_10006FD90();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    sub_10006FD5C(v5, v6, v7, v8, v9, v10, v11, v12);
  }

}

void sub_100065164(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100065188(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_pairWithBluetoothIdentifier:deviceName:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void sub_1000653A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000653CC(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_connectWithBluetoothIdentifier:completion:", *(_QWORD *)(a1 + 32), 0);

}

void sub_100065A04(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  unsigned int v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;

  v7 = a2;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
  v10 = objc_msgSend(v9, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v10)
  {
    v11 = sub_100056C84(2uLL);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = v12;
    if (a3)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(_QWORD *)(a1 + 32);
        v17 = 141558275;
        v18 = 1752392040;
        v19 = 2113;
        v20 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "starting BLE pairing to %{private, mask.hash}@", (uint8_t *)&v17, 0x16u);
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "centralManager"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sharedPairingAgent"));
      objc_msgSend(v16, "pairPeer:", v7);

    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_10006FF20((uint64_t *)(a1 + 32), (uint64_t)v8, v13);

      objc_msgSend(*(id *)(a1 + 40), "_finishedCurrentPairing");
    }
  }

}

void sub_100065F38(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7;
  id v8;
  CARBluetoothCarPlayService *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;

  v7 = a2;
  v8 = a4;
  if ((a3 & 1) != 0)
  {
    v9 = -[CARBluetoothCarPlayService initWithPeripheral:]([CARBluetoothCarPlayService alloc], "initWithPeripheral:", v7);
    -[CARBluetoothCarPlayService setServiceDelegate:](v9, "setServiceDelegate:", *(_QWORD *)(a1 + 32));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "servicesForBluetoothIdentifiers"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
    objc_msgSend(v10, "setObject:forKey:", v9, v11);

  }
  else
  {
    v12 = sub_100056C84(2uLL);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_100070078();

  }
}

void sub_100066908(uint64_t a1)
{
  id v2;
  NSObject *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;

  v2 = sub_100056C84(2uLL);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_signpost_enabled(v3))
  {
    LOWORD(v7) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "OpenedChannel", (const char *)&unk_1000A929A, (uint8_t *)&v7, 2u);
  }

  v4 = sub_100056C84(2uLL);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412290;
    v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "activated service: %@", (uint8_t *)&v7, 0xCu);
  }

}

void sub_100066A80(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;

  v2 = sub_100056C84(2uLL);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "sent message: %@", (uint8_t *)&v5, 0xCu);
  }

}

void sub_100066BA0(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = sub_100056C84(2uLL);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    sub_100070198(a1, v3, v4, v5, v6, v7, v8, v9);

}

void sub_100066C98(uint64_t a1)
{
  uint64_t *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = (uint64_t *)(a1 + 32);
  v3 = objc_msgSend((id)objc_opt_class(*(_QWORD *)(a1 + 32)), "identifier");
  if (v3 == (id)3)
  {
    v6 = *v2;
    v7 = objc_opt_class(CARCarPlayServiceMessageStartSession);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
      objc_msgSend(*(id *)(a1 + 40), "_handleStartSessionMessage:fromService:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }
  else if (v3 == (id)1)
  {
    v4 = *v2;
    v5 = objc_opt_class(CARCarPlayServiceMessageIdentification);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
      objc_msgSend(*(id *)(a1 + 40), "_handleIdentificationMessage:fromService:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v8 = sub_100056C84(2uLL);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100070200((uint64_t)v2, v9, v10, v11, v12, v13, v14, v15);

  }
}

void sub_100066DE8(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;

  v2 = sub_100056C84(2uLL);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v9 = 138412290;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "disconnected service: %@", (uint8_t *)&v9, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_vehicleForService:", *(_QWORD *)(a1 + 32)));
  if (v5)
    objc_msgSend(*(id *)(a1 + 40), "_removeConnectedVehicle:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peripheral"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "servicesForBluetoothIdentifiers"));
  objc_msgSend(v8, "removeObjectForKey:", v7);

}

void sub_100067F0C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  const __CFString *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  const __CFString *v26;

  v5 = a2;
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (v5)
  {
    v7 = objc_msgSend(v5, "BOOLValue");
    v8 = sub_100056C84(2uLL);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = CFSTR("declined");
      v22 = 1752392040;
      *(_DWORD *)buf = 141558531;
      if ((_DWORD)v7)
        v11 = CFSTR("confirmed");
      v23 = 2113;
      v24 = v10;
      v25 = 2114;
      v26 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "pairing for %{private, mask.hash}@ was %{public}@", buf, 0x20u);
    }

    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "centralManager"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject sharedPairingAgent](v12, "sharedPairingAgent"));
    v14 = *(_QWORD *)(a1 + 48);
    v15 = *(_QWORD *)(a1 + 56);
    v16 = *(_QWORD *)(a1 + 64);
    v19 = CBPairingAgentPairingDataPasskeyKey;
    v20 = v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
    objc_msgSend(v13, "respondToPairingRequest:type:accept:data:", v14, v16, v7, v17);

  }
  else
  {
    v18 = sub_100056C84(2uLL);
    v12 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1000704A4();
  }

}

void sub_1000683D8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x20u);
}

void sub_1000683EC(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Successfully requested bulletin %@", (uint8_t *)&v3, 0xCu);
  sub_100005778();
}

void sub_100068460(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 32);
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  sub_100005764((void *)&_mh_execute_header, a2, a3, "Error presenting bulletin %@: %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  sub_100005778();
}

void sub_1000684D4(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "No known presented bulletin matching identifier %@", (uint8_t *)&v2, 0xCu);
  sub_100005778();
}

void sub_100068544(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  sub_100005764((void *)&_mh_execute_header, a2, a3, "No matching action for %{public}@ on bulletin %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  sub_100005778();
}

void sub_1000685B4(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "failed to open URL to save file: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100068628(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "failed to create save file", v1, 2u);
}

void sub_100068668(unsigned __int8 *a1, NSObject *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;

  v3 = NSStringFromBOOL(*a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v6 = 138412290;
  v7 = v4;
  sub_100007198((void *)&_mh_execute_header, a2, v5, "[NightModeFallback] Posting notification with night mode: %@", (uint8_t *)&v6);

  sub_1000071A4();
}

void sub_1000686F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_100007174((void *)&_mh_execute_header, v0, v1, "[NightModeFallback] Starting location based night mode", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006871C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_100007174((void *)&_mh_execute_header, v0, v1, "[NightModeFallback] Observed session disconnect, invalidating", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_100068748(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 138412290;
  v4 = a1;
  sub_100007198((void *)&_mh_execute_header, a2, a3, "[NightModeFallback] Failed to get a location with error: %@", (uint8_t *)&v3);
}

void sub_1000687B4(unsigned __int8 *a1, NSObject *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;

  v3 = NSStringFromBOOL(*a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v6 = 138412290;
  v7 = v4;
  sub_100007198((void *)&_mh_execute_header, a2, v5, "[NightModeFallback] Initial fallback night mode value: %@", (uint8_t *)&v6);

  sub_1000071A4();
}

void sub_10006883C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_100007174((void *)&_mh_execute_header, v0, v1, "[NightModeFallback] Starting fallback", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_100068868()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_100007174((void *)&_mh_execute_header, v0, v1, "[NightModeFallback] Scheduling update because of sunset or sunrise event timer", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_100068894()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_100007174((void *)&_mh_execute_header, v0, v1, "[NightModeFallback] Scheduling timer for next night mode change", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_1000688C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_100007174((void *)&_mh_execute_header, v0, v1, "[NightModeFallback] Horizontal accuracy is negative, ignoring location update", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_1000688EC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_100007174((void *)&_mh_execute_header, v0, v1, "[NightModeFallback] Updating fallback night mode", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_100068918()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_100007174((void *)&_mh_execute_header, v0, v1, "[NightModeFallback] No previous location", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_100068944()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_100007174((void *)&_mh_execute_header, v0, v1, "[NightModeFallback] Distance change between previous location is less than 3km", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_100068970()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_100007174((void *)&_mh_execute_header, v0, v1, "[NightModeFallback] Comparing against previous location", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006899C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_100007174((void *)&_mh_execute_header, v0, v1, "[NightModeFallback] Significant time change, resetting", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_1000689C8()
{
  uint64_t v0;
  os_log_t v1;

  sub_10000B0B8();
  sub_10000B08C((void *)&_mh_execute_header, v0, v1, "Failed to create a keychain item: %@ error: %i");
  sub_100005778();
}

void sub_100068A28()
{
  uint64_t v0;
  os_log_t v1;

  sub_10000B0B8();
  sub_10000B08C((void *)&_mh_execute_header, v0, v1, "Failed to update a keychain item: %@  error: %i");
  sub_100005778();
}

void sub_100068A88(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000B0E0((void *)&_mh_execute_header, a1, a3, "Failed to save unpaired vehicle storage", a5, a6, a7, a8, 0);
  sub_100007184();
}

void sub_100068AB8(uint64_t a1, void *a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "vehicleName"));
  sub_10000B0A0();
  sub_10000B068((void *)&_mh_execute_header, a3, v5, "Failed to save vehicle preferences: %@ %@", v6);

  sub_10000B0D0();
}

void sub_100068B44(uint64_t a1, void *a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "vehicleName"));
  sub_10000B0A0();
  sub_10000B068((void *)&_mh_execute_header, a3, v5, "Failed to remove vehicle preferences: %@ %@", v6);

  sub_10000B0D0();
}

void sub_100068BD0()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_10000B074();
  sub_10000B068((void *)&_mh_execute_header, v0, (uint64_t)v0, "Failed to cleaned up preferences for missing keychain item %@ (%@)", v1);
  sub_100005778();
}

void sub_100068C38()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_10000B074();
  sub_10000B068((void *)&_mh_execute_header, v0, (uint64_t)v0, "No matching keychain item for %@ (%@)", v1);
  sub_100005778();
}

void sub_100068CA0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000B0E0((void *)&_mh_execute_header, a1, a3, "vehicle to remove is nil", a5, a6, a7, a8, 0);
  sub_100007184();
}

void sub_100068CD0(void *a1, NSObject *a2)
{
  int v3;
  id v4;

  v3 = 134217984;
  v4 = objc_msgSend(a1, "count");
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "using cache with %lu vehicles", (uint8_t *)&v3, 0xCu);
}

void sub_100068D58(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to create vehicle identifier: %@", (uint8_t *)&v2, 0xCu);
  sub_100005778();
}

void sub_100068DC8()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_10000B074();
  sub_10000B068((void *)&_mh_execute_header, v0, (uint64_t)v0, "Failed to reconstruct vehicle with %@ (%@)", v1);
  sub_100005778();
}

void sub_100068E30(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "failed to get first unlock status, error: %i", (uint8_t *)v2, 8u);
  sub_100007184();
}

uint64_t sub_100068EA0()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "AFDictationConnection");
  return sub_100068EC4(v0);
}

void sub_100068EC4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "attempting to send data before L2CAP channel is open", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_100068EF0()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_10000718C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "_handleHasBytesAvailableOnStream", v1, 2u);
  sub_100007184();
}

void sub_100068F28(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a1, "streamError"));
  v5 = 138412290;
  v6 = v3;
  sub_10000EF04((void *)&_mh_execute_header, a2, v4, "L2CAP input stream error: %@", (uint8_t *)&v5);

  sub_1000071A4();
}

void sub_100068FB0(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a1, "streamError"));
  v5 = 138412290;
  v6 = v3;
  sub_10000EF04((void *)&_mh_execute_header, a2, v4, "L2CAP output stream error: %@", (uint8_t *)&v5);

  sub_1000071A4();
}

void sub_100069038(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;

  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  sub_10000EF04((void *)&_mh_execute_header, a2, a3, "failed to discover services: %@", (uint8_t *)&v4);
}

void sub_1000690A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "no PSM value for L2CAP characteristic", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_1000690D4(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = 138412290;
  v5 = v3;
  sub_10000EF04((void *)&_mh_execute_header, a2, a3, "failed to connect L2CAP channel, error: %@", (uint8_t *)&v4);
}

void sub_100069144()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "ignoring didOpenL2CAPChannel, no active connection attempt", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_100069170(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "UUIDString"));
  sub_10000F9A8((void *)&_mh_execute_header, v2, v3, "disablesCarPlayFeatures: no vehicle for id %@", v4, v5, v6, v7, 2u);

  sub_1000071A4();
}

void sub_1000691EC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "out-of-band pairing is only supported for iAP connections", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_100069218()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "Wi-Fi credentials request is only supported for iAP connections", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_100069244()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "sending device transport identifiers is only supported for iAP connections", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_100069270()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "timed out waiting on CoreAccessories", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006929C(void *a1, NSObject *a2)
{
  int v3;
  void *v4;
  __int16 v5;
  unsigned int v6;

  v3 = 138412546;
  v4 = a1;
  v5 = 1024;
  v6 = objc_msgSend(a1, "processIdentifier");
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "certification override service connection is not entitled: %@: process: %i", (uint8_t *)&v3, 0x12u);
}

void sub_100069334(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "non-string objects in array: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000693A8()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_1000146D4();
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "region"));
  objc_msgSend(v2, "center");
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "region"));
  objc_msgSend(v3, "center");
  sub_10001468C();
  sub_100014678((void *)&_mh_execute_header, v4, v5, "Currently in region with lat/long: {%f, %f}", v6, v7, v8, v9, v10);

  sub_1000146A4();
}

void sub_100069448(os_log_t log, double a2, double a3)
{
  int v3;
  double v4;
  __int16 v5;
  double v6;

  v3 = 134218240;
  v4 = a2;
  v5 = 2048;
  v6 = a3;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Creating geofence around lat/long: {%f, %f}", (uint8_t *)&v3, 0x16u);
}

void sub_1000694CC()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_1000146D4();
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "location"));
  objc_msgSend(v2, "latitude");
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "location"));
  objc_msgSend(v3, "longitude");
  sub_1000146E0();
  sub_100014678((void *)&_mh_execute_header, v4, v5, "Not creating geofence around {%f, %f} since we're at our maximum geofence count.", v6, v7, v8, v9, v10);

  sub_1000146A4();
}

void sub_10006956C()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_1000146D4();
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "location"));
  objc_msgSend(v2, "latitude");
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "location"));
  objc_msgSend(v3, "longitude");
  sub_1000146E0();
  sub_100014678((void *)&_mh_execute_header, v4, v5, "Geofence already exists around lat/long: {%f, %f}", v6, v7, v8, v9, v10);

  sub_1000146A4();
}

void sub_10006960C()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  sub_1000146D4();
  sub_1000146F8(v0, v1);
  sub_1000146C8();
  sub_10001468C();
  sub_100014678((void *)&_mh_execute_header, v2, v3, "Begin monitoring for lat/long: {%f, %f}", v4, v5, v6, v7, v8);
  sub_1000146B8();
}

void sub_10006967C()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  sub_1000146D4();
  sub_1000146F8(v0, v1);
  sub_1000146C8();
  sub_10001468C();
  sub_100014678((void *)&_mh_execute_header, v2, v3, "Entered region for lat/long: {%f, %f}", v4, v5, v6, v7, v8);
  sub_1000146B8();
}

void sub_1000696EC()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  sub_1000146D4();
  sub_1000146F8(v0, v1);
  sub_1000146C8();
  sub_10001468C();
  sub_100014678((void *)&_mh_execute_header, v2, v3, "Exited region for lat/long: {%f, %f}", v4, v5, v6, v7, v8);
  sub_1000146B8();
}

void sub_10006975C(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Location manager failed for Geofencing: %@", (uint8_t *)&v2, 0xCu);
}

uint64_t sub_1000697D0()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "RTRoutineManager");
  return sub_1000697F4(v0);
}

void sub_1000697F4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007174((void *)&_mh_execute_header, a1, a3, "wantsToPresentHeadUnitPairingPrompt", a5, a6, a7, a8, 0);
  sub_100007184();
}

void sub_100069824(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007174((void *)&_mh_execute_header, a1, a3, "presentHeadUnitPairingPrompt", a5, a6, a7, a8, 0);
  sub_100007184();
}

void sub_100069854(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "presentHeadUnitPairingPrompt completed with error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000698C8(char a1, NSObject *a2)
{
  const __CFString *v2;
  int v3;
  const __CFString *v4;

  v2 = CFSTR("NO");
  if ((a1 & 1) != 0)
    v2 = CFSTR("YES");
  v3 = 138543362;
  v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "handleReceivedResponse: %{public}@", (uint8_t *)&v3, 0xCu);
}

void sub_100069954(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "keyIdentifier mismatch", v1, 2u);
  sub_100007184();
}

void sub_100069990(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "prox card can't be presented due to current UI state", v1, 2u);
}

void sub_1000699D0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000157D4((void *)&_mh_execute_header, a2, a3, "CarPlaySetup did invalidate with error %@", a5, a6, a7, a8, 2u);
}

void sub_100069A3C(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "CRSetupLauncher invalidate", v1, 2u);
}

void sub_100069A7C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_100007174((void *)&_mh_execute_header, v0, v1, "invalidating file sender", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_100069AA8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100017F2C();
  sub_1000157D4((void *)&_mh_execute_header, v0, v1, "failed file transfer for cluster theme version %@", v2, v3, v4, v5, v6);
  sub_100005778();
}

void sub_100069B0C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100017F2C();
  sub_1000157D4((void *)&_mh_execute_header, v0, v1, "failed file transfer for log archive %@", v2, v3, v4, v5, v6);
  sub_100005778();
}

void sub_100069B70()
{
  uint64_t v0;
  os_log_t v1;

  sub_100017F38(__stack_chk_guard);
  sub_100017F14();
  sub_100017F00((void *)&_mh_execute_header, v0, v1, "failed to find file %@: %@");
  sub_100005778();
}

void sub_100069BD0()
{
  uint64_t v0;
  os_log_t v1;

  sub_100017F38(__stack_chk_guard);
  sub_100017F14();
  sub_100017F00((void *)&_mh_execute_header, v0, v1, "failed to read file %@: %@");
  sub_100005778();
}

void sub_100069C30()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "received file transfer accept with failure status, canceling transfer", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_100069C5C(int *a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];

  v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "failed to encode file transfer header: %d", (uint8_t *)v3, 8u);
  sub_100007184();
}

void sub_100069CD0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "failed to send file transfer header", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_100069CFC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "timed out sending file transfer message", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_100069D28()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "failed to send file transfer message", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_100069D54()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "failed to send file transfer message, channel is closed", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_100069D80(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000157D4((void *)&_mh_execute_header, a2, a3, "no accept status in file accept message: %@", a5, a6, a7, a8, 2u);
  sub_100005778();
}

void sub_100069DE4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000157D4((void *)&_mh_execute_header, a2, a3, "file was declined with status: %@", a5, a6, a7, a8, 2u);
  sub_100005778();
}

void sub_100069E48()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_100007174((void *)&_mh_execute_header, v0, v1, "sent file data chunk", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_100069E74(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "received file data reply: %@", (uint8_t *)&v2, 0xCu);
  sub_100005778();
}

void sub_100069EE4()
{
  int v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;

  sub_100017F38(__stack_chk_guard);
  sub_100017F2C();
  v3 = 1024;
  v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "failed to parse file message: %@, error: %d", v2, 0x12u);
  sub_100005778();
}

void sub_100069F64()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100017F38(__stack_chk_guard);
  sub_100017F2C();
  sub_1000157D4((void *)&_mh_execute_header, v0, v1, "no message type in file channel message: %@", v2, v3, v4, v5, v6);
  sub_100005778();
}

void sub_100069FC4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "file sender can't receive files", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_100069FF0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "file sender can't receive file requests", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006A01C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "file sender can't receive streams", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006A048()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001A02C();
  sub_10001A00C((void *)&_mh_execute_header, v0, v1, "%s: car carpabilities: new plist %@", v2, v3, v4, v5, 2u);
  sub_100005778();
}

void sub_10006A0B8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001A040();
  sub_10001A00C((void *)&_mh_execute_header, v0, v1, "%s: received session %@", v2, v3, v4, v5, 2u);
  sub_100005778();
}

void sub_10006A124(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001A01C((void *)&_mh_execute_header, a1, a3, "%s", a5, a6, a7, a8, 2u);
  sub_100005778();
}

void sub_10006A194(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001A01C((void *)&_mh_execute_header, a1, a3, "%s", a5, a6, a7, a8, 2u);
  sub_100005778();
}

void sub_10006A204()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001A02C();
  sub_10001A00C((void *)&_mh_execute_header, v0, v1, "%s: %@", v2, v3, v4, v5, 2u);
  sub_100005778();
}

void sub_10006A274()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001A02C();
  sub_10001A00C((void *)&_mh_execute_header, v0, v1, "%s: %@", v2, v3, v4, v5, 2u);
  sub_100005778();
}

void sub_10006A2E4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001A01C((void *)&_mh_execute_header, a1, a3, "%s: car carpabilities requesting state machine lookup", a5, a6, a7, a8, 2u);
  sub_100005778();
}

void sub_10006A354()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001A040();
  sub_10001A00C((void *)&_mh_execute_header, v0, v1, "%s: CarCapabilities countryCode %@ album art forbidden", v2, v3, v4, v5, 2u);
  sub_100005778();
}

void sub_10006A3C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001A040();
  sub_10001A00C((void *)&_mh_execute_header, v0, v1, "%s: CarCapabilities countryCode %@ album art allowed", v2, v3, v4, v5, 2u);
  sub_100005778();
}

void sub_10006A42C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001A01C((void *)&_mh_execute_header, a1, a3, "%s: CarCapabilities using CARPrototypePref defaultValue overrride", a5, a6, a7, a8, 2u);
  sub_100005778();
}

void sub_10006A49C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001A054();
  sub_10001A00C((void *)&_mh_execute_header, v0, v1, "%s: CarCapabilities using plist album art value: %ld", v2, v3, v4, v5, 2u);
  sub_100005778();
}

void sub_10006A508()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001A054();
  sub_10001A00C((void *)&_mh_execute_header, v0, v1, "%s: CarCapabilities using internal setting album art value: %ld", v2, v3, v4, v5, 2u);
  sub_100005778();
}

void sub_10006A574(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "CRSetupPromptPresenterSession invalidate", v1, 2u);
}

void sub_10006A5B4(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "error calling setup prompt presenter service: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10006A628(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "coudn't update asset progress", v1, 2u);
}

void sub_10006A668(os_log_t log, double a2, double a3)
{
  int v3;
  double v4;
  __int16 v5;
  double v6;

  v3 = 134349312;
  v4 = a2;
  v5 = 2050;
  v6 = a3;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "updating asset progress from %{public}f to %{public}f", (uint8_t *)&v3, 0x16u);
}

void sub_10006A6EC(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "processIdentifier");
  sub_10001DF88();
  sub_10001DF74((void *)&_mh_execute_header, v1, v2, "pairing service connection is not entitled: %@: process: %i", v3, v4, v5, v6, v7);
  sub_1000071A4();
}

void sub_10006A75C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_100007174((void *)&_mh_execute_header, v0, v1, "clearing current pairing session", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006A788(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "processIdentifier");
  sub_10001DF88();
  sub_10001DF74((void *)&_mh_execute_header, v1, v2, "HUP prompt service connection is not entitled: %@: process: %i", v3, v4, v5, v6, v7);
  sub_1000071A4();
}

void sub_10006A7F8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "not presenting head unit pairing prompt, pairing is not available", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006A824()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "no BT address for current pairing session", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006A850(os_log_t log)
{
  int v1;
  uint64_t v2;

  v1 = 138412290;
  v2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "failed to save vehicle for head unit pairing: %@", (uint8_t *)&v1, 0xCu);
}

void sub_10006A8C8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "no matching BT address for current pairing session", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006A8F4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001A01C((void *)&_mh_execute_header, a1, a3, "%s", a5, a6, a7, a8, 2u);
  sub_100005778();
}

void sub_10006A964()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001A040();
  sub_10001A00C((void *)&_mh_execute_header, v0, v1, "%s: request with options %@", v2, v3, v4, v5, 2u);
  sub_100005778();
}

void sub_10006A9D0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001A01C((void *)&_mh_execute_header, a1, a3, "%s: request reply returned late, dropped", a5, a6, a7, a8, 2u);
  sub_100005778();
}

void sub_10006AA40()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001A040();
  sub_10001A00C((void *)&_mh_execute_header, v0, v1, "%s: request replied successfully %@", v2, v3, v4, v5, 2u);
  sub_100005778();
}

void sub_10006AAAC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000B0E0((void *)&_mh_execute_header, a1, a3, "CarPlay MobileAssets catalog failed to download", a5, a6, a7, a8, 0);
  sub_100007184();
}

void sub_10006AADC(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;

  v2 = 138412546;
  v3 = 0;
  v4 = 2048;
  v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to query for CarPlay MobileAssets asset: %@, queryResult: %ld", (uint8_t *)&v2, 0x16u);
  sub_100005778();
}

void sub_10006AB58(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000B0E0((void *)&_mh_execute_header, a1, a3, "Failed to find CarPlay MobileAssets asset", a5, a6, a7, a8, 0);
  sub_100007184();
}

void sub_10006AB88(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000B0E0((void *)&_mh_execute_header, a1, a3, "Failed to parse CarPlay MobileAssets file", a5, a6, a7, a8, 0);
  sub_100007184();
}

void sub_10006ABB8(void *a1, NSObject *a2)
{
  _DWORD v3[2];
  __int16 v4;
  const __CFString *v5;

  v3[0] = 67109378;
  v3[1] = objc_msgSend(a1, "processIdentifier");
  v4 = 2112;
  v5 = CFSTR("com.apple.private.carkit.app");
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Process %i does not have the %@ entitlement", (uint8_t *)v3, 0x12u);
}

void sub_10006AC54(void *a1, NSObject *a2)
{
  _DWORD v3[2];
  __int16 v4;
  const __CFString *v5;

  v3[0] = 67109378;
  v3[1] = objc_msgSend(a1, "processIdentifier");
  v4 = 2112;
  v5 = CFSTR("com.apple.private.carkit");
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Process %i does not have the %@ entitlement", (uint8_t *)v3, 0x12u);
  sub_1000071A4();
}

void sub_10006ACE8()
{
  uint64_t v0;
  os_log_t v1;

  sub_10002EDD0(__stack_chk_guard);
  sub_10002ED4C();
  sub_10002ED80((void *)&_mh_execute_header, v0, v1, "pairing completion address %{private, mask.hash}@ didn't match expected addresses %{private, mask.hash}@");
  sub_10002EDB4();
}

void sub_10006AD48()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "no startSessionProperties", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006AD74()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "not handling StartSession, CarPlay is restricted", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006ADA0()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100017F2C();
  sub_10000EF04((void *)&_mh_execute_header, v0, v1, "Failed to find a connected accessory with connection ID: %lu", v2);
  sub_100005778();
}

void sub_10006AE08()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10002ED94();
  sub_10000EF04((void *)&_mh_execute_header, v0, v1, "failed to save WiFi credentials: %@", v2);
  sub_100005778();
}

void sub_10006AE6C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100017F38(__stack_chk_guard);
  sub_100017F2C();
  sub_10001A01C((void *)&_mh_execute_header, v0, v1, "deviceSupportedCarPlayFeatures %{public}lu", v2, v3, v4, v5, v6);
  sub_100005778();
}

void sub_10006AED0()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  const __CFString *v3;
  _BYTE v4[24];

  sub_100017F38(__stack_chk_guard);
  if (*(_BYTE *)(v2 + 24))
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  *(_DWORD *)v4 = 134349314;
  *(_QWORD *)&v4[4] = v0;
  *(_WORD *)&v4[12] = 2114;
  *(_QWORD *)&v4[14] = v3;
  sub_10002EDA0((void *)&_mh_execute_header, v0, v1, "disablesCarPlayFeatures %{public}lu: %{public}@", *(_QWORD *)v4, *(_QWORD *)&v4[8], *(_QWORD *)&v4[16]);
  sub_100005778();
}

void sub_10006AF5C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100017F38(__stack_chk_guard);
  sub_100017F2C();
  sub_10001A01C((void *)&_mh_execute_header, v0, v1, "setCarPlayFeaturesDisabled was successful: %{public}@", v2, v3, v4, v5, v6);
  sub_100005778();
}

void sub_10006AFD8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10002ED94();
  sub_10001A01C((void *)&_mh_execute_header, v0, v1, "diagnostics request is using logging file receiver: %@", v2, v3, v4, v5, v6);
  sub_100005778();
}

void sub_10006B038()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "BLE numeric confirmation required but pairing prompt flow doesn't exist", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006B064()
{
  uint64_t v0;
  os_log_t v1;

  sub_10002EDD0(__stack_chk_guard);
  sub_10002ED4C();
  sub_10002ED80((void *)&_mh_execute_header, v0, v1, "pairing confirmation device identifier %{private, mask.hash}@ didn't match expected identifier %{private, mask.hash}@");
  sub_10002EDB4();
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

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "BLE pairing failed but pairing prompt flow doesn't exist", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006B0F0(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "description"));
  sub_10002ED94();
  sub_10000EF04((void *)&_mh_execute_header, a2, v4, "Error recording CARCarKitVehicleInformationEvent %@", v5);

  sub_1000071A4();
}

void sub_10006B170()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "no startSessionMessage", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006B19C()
{
  os_log_t v0;
  uint8_t v1[24];

  sub_100017F14();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "failed start session for host: %@ error: %@", v1, 0x16u);
  sub_100005778();
}

void sub_10006B210()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10002ED94();
  sub_10000EF04((void *)&_mh_execute_header, v0, v1, "Failed to find a connected accessory with connection ID: %lu", v2);
  sub_100005778();
}

void sub_10006B274()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10002ED94();
  sub_10000EF04((void *)&_mh_execute_header, v0, v1, "Failed to update vehicle %@", v2);
  sub_100005778();
}

void sub_10006B2D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "not posting in-car notification, WiFi credentials were not received while Bluetooth connected", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006B304(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "identifier"));
  sub_10002ED94();
  sub_10000EF04((void *)&_mh_execute_header, a2, v4, "Failed to save WiFi credentials for vehicle %@", v5);

  sub_1000071A4();
}

void sub_10006B384()
{
  uint64_t v0;
  os_log_t v1;

  sub_100017F14();
  sub_10002EDA0((void *)&_mh_execute_header, v0, v1, "startSessionWithHost replied with success: %@, error: %@");
  sub_100005778();
}

void sub_10006B3FC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "need to update vehicle asset but asset manager is nil", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006B428()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10002ED94();
  sub_10000EF04((void *)&_mh_execute_header, v0, v1, "failed to get an active carplay endpoint for %@", v2);
  sub_100005778();
}

uint64_t sub_10006B48C()
{
  char *v0;
  uint64_t v1;

  v0 = dlerror();
  v1 = abort_report_np("%s", v0);
  return sub_10006B4AC(v1);
}

void sub_10006B4AC(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "failed to get endpoint value for info response, error: %i", (uint8_t *)v2, 8u);
  sub_100007184();
}

void sub_10006B51C()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10002ED94();
  sub_10000EF04((void *)&_mh_execute_header, v0, v1, "Failed to save vehicle %@", v2);
  sub_100005778();
}

void sub_10006B580(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "identifier"));
  sub_10002ED94();
  sub_10000EF04((void *)&_mh_execute_header, a2, v4, "Failed to remove WiFi credentials for vehicle %@", v5);

  sub_1000071A4();
}

void sub_10006B604()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "vehicle to remove is nil", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006B630()
{
  uint64_t v0;
  os_log_t v1;

  sub_10002ED94();
  sub_10002EDA0((void *)&_mh_execute_header, v0, v1, "_sendDeviceIdentifiersForMessagingVehicle %@ pairingStatus %lu");
  sub_100005778();
}

void sub_10006B69C()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10002ED94();
  sub_10000EF04((void *)&_mh_execute_header, v0, v1, "failed to present setup prompt, error: %@", v2);
  sub_100005778();
}

void sub_10006B700()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10002ED94();
  sub_10000EF04((void *)&_mh_execute_header, v0, v1, "canceling setup prompt flow: unable to remove temporary vehicle %@", v2);
  sub_100005778();
}

void sub_10006B764()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "no bluetooth confirmation handler", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006B790()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "head unit pairing completed but no pairing flow controller", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006B7BC()
{
  uint64_t v0;
  os_log_t v1;

  sub_10002EDBC();
  sub_10002ED80((void *)&_mh_execute_header, v0, v1, "head unit pairing address %{private, mask.hash}@ didn't match expected addresses %{private, mask.hash}@");
  sub_10002EDB4();
}

void sub_10006B83C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "no setup flow to show head unit pairing error", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006B868()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  uint8_t v3[12];
  __int16 v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;

  sub_10002EDBC();
  v4 = 2113;
  v5 = v0;
  v6 = 2112;
  v7 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "head unit pairing failed for %{private, mask.hash}@, error: %@", v3, 0x20u);
}

void sub_10006B8F4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100017F38(__stack_chk_guard);
  sub_100017F2C();
  sub_10000EF04((void *)&_mh_execute_header, v0, v1, "Unable to remove temporary vehicle %@", v2);
  sub_100005778();
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

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "failed to get a vehicle for OOB decline count", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006B98C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "BT numeric confirmation required but pairing prompt flow doesn't exist", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006B9B8()
{
  uint64_t v0;
  os_log_t v1;

  sub_10002EDD0(__stack_chk_guard);
  sub_10002ED4C();
  sub_10002ED80((void *)&_mh_execute_header, v0, v1, "pairing confirmation address %{private, mask.hash}@ didn't match expected addresses %{private, mask.hash}@");
  sub_10002EDB4();
}

void sub_10006BA18()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "BT pairing failure but pairing prompt flow doesn't exist", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006BA44(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription"));
  sub_10002ED94();
  sub_10000EF04((void *)&_mh_execute_header, a2, v4, "CARAnalytics: unable to send wirelessPairingCreatedEvent connection event. Error: %@", v5);

  sub_1000071A4();
}

void sub_10006BAC4()
{
  uint64_t v0;
  os_log_t v1;

  sub_10000B074();
  sub_100017F00((void *)&_mh_execute_header, v0, v1, "failed to save signature to %@: %@");
  sub_100005778();
}

void sub_10006BB24()
{
  uint64_t v0;
  os_log_t v1;

  sub_10000B074();
  sub_100017F00((void *)&_mh_execute_header, v0, v1, "failed to save certificate to %@: %@");
  sub_100005778();
}

void sub_10006BB84()
{
  uint64_t v0;
  os_log_t v1;

  sub_10000B074();
  sub_100017F00((void *)&_mh_execute_header, v0, v1, "failed to save accessory additions to %@: %@");
  sub_100005778();
}

void sub_10006BBE4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001A040();
  sub_100031B30((void *)&_mh_execute_header, v0, v1, "missing parameter: %@ in %@", v2, v3, v4, v5, 2u);
  sub_100005778();
}

void sub_10006BC50()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001A040();
  sub_100031B30((void *)&_mh_execute_header, v0, v1, "missing parameter: %@ in %@", v2, v3, v4, v5, 2u);
  sub_100005778();
}

void sub_10006BCBC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001A040();
  sub_100031B30((void *)&_mh_execute_header, v0, v1, "missing parameter: %@ in %@", v2, v3, v4, v5, 2u);
  sub_100005778();
}

void sub_10006BD28()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001A040();
  sub_100031B30((void *)&_mh_execute_header, v0, v1, "missing parameter: %@ in %@", v2, v3, v4, v5, 2u);
  sub_100005778();
}

void sub_10006BD94()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001A040();
  sub_100031B30((void *)&_mh_execute_header, v0, v1, "missing parameter: %@ in %@", v2, v3, v4, v5, 2u);
  sub_100005778();
}

void sub_10006BE00()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001A040();
  sub_100031B30((void *)&_mh_execute_header, v0, v1, "missing parameter: %@ in %@", v2, v3, v4, v5, 2u);
  sub_100005778();
}

void sub_10006BE6C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001A040();
  sub_100031B30((void *)&_mh_execute_header, v0, v1, "missing parameter: %@ in %@", v2, v3, v4, v5, 2u);
  sub_100005778();
}

void sub_10006BED8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001A040();
  sub_100031B30((void *)&_mh_execute_header, v0, v1, "missing parameter: %@ in %@", v2, v3, v4, v5, 2u);
  sub_100005778();
}

void sub_10006BF44()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001A040();
  sub_100031B30((void *)&_mh_execute_header, v0, v1, "missing parameter: %@ in %@", v2, v3, v4, v5, 2u);
  sub_100005778();
}

void sub_10006BFB0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001A040();
  sub_100031B30((void *)&_mh_execute_header, v0, v1, "missing parameter: %@ in %@", v2, v3, v4, v5, 2u);
  sub_100005778();
}

void sub_10006C01C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001A040();
  sub_100031B30((void *)&_mh_execute_header, v0, v1, "missing parameter: %@ in %@", v2, v3, v4, v5, 2u);
  sub_100005778();
}

void sub_10006C088()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001A040();
  sub_100031B30((void *)&_mh_execute_header, v0, v1, "missing parameter: %@ in %@", v2, v3, v4, v5, 2u);
  sub_100005778();
}

void sub_10006C0F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001A040();
  sub_100031B30((void *)&_mh_execute_header, v0, v1, "missing parameter: %@ in %@", v2, v3, v4, v5, 2u);
  sub_100005778();
}

void sub_10006C160()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001A040();
  sub_100031B30((void *)&_mh_execute_header, v0, v1, "missing parameter: %@ in %@", v2, v3, v4, v5, 2u);
  sub_100005778();
}

void sub_10006C1CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001A040();
  sub_100031B30((void *)&_mh_execute_header, v0, v1, "missing parameter: %@ in %@", v2, v3, v4, v5, 2u);
  sub_100005778();
}

void sub_10006C238()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001A040();
  sub_100031B30((void *)&_mh_execute_header, v0, v1, "missing parameter: %@ in %@", v2, v3, v4, v5, 2u);
  sub_100005778();
}

void sub_10006C2A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001A040();
  sub_100031B30((void *)&_mh_execute_header, v0, v1, "missing parameter: %@ in %@", v2, v3, v4, v5, 2u);
  sub_100005778();
}

void sub_10006C310()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001A040();
  sub_100031B30((void *)&_mh_execute_header, v0, v1, "missing parameter: %@ in %@", v2, v3, v4, v5, 2u);
  sub_100005778();
}

void sub_10006C37C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001A040();
  sub_100031B30((void *)&_mh_execute_header, v0, v1, "missing parameter: %@ in %@", v2, v3, v4, v5, 2u);
  sub_100005778();
}

void sub_10006C3E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001A040();
  sub_10001A00C((void *)&_mh_execute_header, v0, v1, "%s: Created new state machine %@", v2, v3, v4, v5, 2u);
  sub_100005778();
}

void sub_10006C454(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001A01C((void *)&_mh_execute_header, a1, a3, "%s: Lookup request deferred", a5, a6, a7, a8, 2u);
  sub_100005778();
}

void sub_10006C4C4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001A00C((void *)&_mh_execute_header, a1, a3, "%s: dispatchEvent %@", a5, a6, a7, a8, 2u);
  sub_100005778();
}

void sub_10006C548(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[6];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "name"));
  v5[0] = 136315394;
  sub_10001A040();
  sub_1000348BC((void *)&_mh_execute_header, a2, v4, "%s: root fall through for inEvent %@", (uint8_t *)v5);

  sub_1000071A4();
}

void sub_10006C5D4(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[6];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "name"));
  v5[0] = 136315394;
  sub_10001A040();
  sub_1000348BC((void *)&_mh_execute_header, a2, v4, "%s: readyState event block inEvent %@", (uint8_t *)v5);

  sub_1000071A4();
}

void sub_10006C660()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000348C8(__stack_chk_guard);
  sub_10001A02C();
  sub_10001A00C((void *)&_mh_execute_header, v0, v1, "%s: loadingState event block inEvent %@", v2, v3, v4, v5, 2u);
  sub_100005778();
}

void sub_10006C6E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000348C8(__stack_chk_guard);
  sub_10001A02C();
  sub_10001A00C((void *)&_mh_execute_header, v0, v1, "%s: searchingState event block inEvent %@", v2, v3, v4, v5, 2u);
  sub_100005778();
}

void sub_10006C770()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000348C8(__stack_chk_guard);
  sub_10001A02C();
  sub_10001A00C((void *)&_mh_execute_header, v0, v1, "%s: doneState event block inEvent %@", v2, v3, v4, v5, 2u);
  sub_100005778();
}

void sub_10006C7F8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000348C8(__stack_chk_guard);
  sub_10001A02C();
  sub_10001A00C((void *)&_mh_execute_header, v0, v1, "%s: event = %@", v2, v3, v4, v5, 2u);
  sub_100005778();
}

void sub_10006C880()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001A040();
  sub_10001A00C((void *)&_mh_execute_header, v0, v1, "%s: moving to state %@", v2, v3, v4, v5, 2u);
  sub_100005778();
}

void sub_10006C8EC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000348C8(__stack_chk_guard);
  sub_10001A02C();
  sub_10001A00C((void *)&_mh_execute_header, v0, v1, "%s: state = %@", v2, v3, v4, v5, 2u);
  sub_100005778();
}

void sub_10006C974(id *a1, uint64_t a2, NSObject *a3)
{
  int v5[5];
  __int16 v6;
  uint64_t v7;

  objc_msgSend(*a1, "indexOfObject:", a2);
  v5[0] = 136315650;
  sub_10001A054();
  v6 = 2112;
  v7 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "%s: keyAtIndex (%ld) = %@", (uint8_t *)v5, 0x20u);
}

void sub_10006CA1C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001A01C((void *)&_mh_execute_header, a1, a3, "%s: Lookup request ended", a5, a6, a7, a8, 2u);
  sub_100005778();
}

void sub_10006CA8C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001A01C((void *)&_mh_execute_header, a1, a3, "%s: running delayed lookup", a5, a6, a7, a8, 2u);
  sub_100005778();
}

void sub_10006CAFC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001A01C((void *)&_mh_execute_header, a1, a3, "%s: lookup all keys searched", a5, a6, a7, a8, 2u);
  sub_100005778();
}

void sub_10006CB6C(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  int v4[6];

  objc_msgSend(*(id *)(a1 + 64), "count");
  v4[0] = 136315394;
  sub_10001A054();
  sub_1000348BC((void *)&_mh_execute_header, a2, v3, "%s: %ld candidates", (uint8_t *)v4);
  sub_1000071A4();
}

void sub_10006CBF0()
{
  os_log_t v0;
  int v1[6];

  v1[0] = 136315394;
  sub_10001A040();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: Car Capabilities plist key %@ is not allowlisted", (uint8_t *)v1, 0x16u);
  sub_100005778();
}

void sub_10006CC68()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_100007174((void *)&_mh_execute_header, v0, v1, "failed to launch CarPlaySetup", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006CC94()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_10000718C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "cannot perform prompt presenter action, no session", v1, 2u);
  sub_100007184();
}

void sub_10006CCCC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_100007174((void *)&_mh_execute_header, v0, v1, "blocking setup prompt queue", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006CCF8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_100007174((void *)&_mh_execute_header, v0, v1, "unblocking setup prompt queue", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006CD24(void *a1, NSObject *a2)
{
  int v3;
  void *v4;
  __int16 v5;
  unsigned int v6;

  v3 = 138412546;
  v4 = a1;
  v5 = 1024;
  v6 = objc_msgSend(a1, "processIdentifier");
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "setup prompt service connection is not entitled: %@: process: %i", (uint8_t *)&v3, 0x12u);
}

void sub_10006CDBC()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10002ED94();
  sub_10000EF04((void *)&_mh_execute_header, v0, v1, "lockdown_recv returned error: %zi, canceling dispatch source and removing lockdown connection", v2);
  sub_100005778();
}

void sub_10006CE20(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000B0E0((void *)&_mh_execute_header, a1, a3, "Failed to start lockdown listener and failed to start Remote XPC listener", a5, a6, a7, a8, 0);
  sub_100007184();
}

void sub_10006CE50(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to start lockdown service listener: %i", (uint8_t *)v2, 8u);
  sub_100007184();
}

void sub_10006CEC0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000B0E0((void *)&_mh_execute_header, a1, a3, "Failed to create Remote XPC listener", a5, a6, a7, a8, 0);
  sub_100007184();
}

void sub_10006CEF0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000B0E0((void *)&_mh_execute_header, a1, a3, "Failed to send data over lockdown connection", a5, a6, a7, a8, 0);
  sub_100007184();
}

void sub_10006CF20()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10002ED94();
  sub_10000EF04((void *)&_mh_execute_header, v0, v1, "Closing connection, received unknown RemoteXPC error: %@", v2);
  sub_100005778();
}

void sub_10006CF84()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10002ED94();
  sub_10000EF04((void *)&_mh_execute_header, v0, v1, "Closing connection, received RemoteXPC error: %@", v2);
  sub_100005778();
}

void sub_10006CFE8()
{
  os_log_t v0;
  uint8_t v1[24];

  sub_10002ED94();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "No data for dictionary key 'payload', %@", v1, 0xCu);
  sub_100005778();
}

void sub_10006D054(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  objc_msgSend(a1, "lock_lockdownConnection");
  sub_10002ED94();
  sub_10000EF04((void *)&_mh_execute_header, a2, v3, "Failed to get socket for lockdown connection: %@", v4);
}

uint64_t sub_10006D0D0()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "ACCTransportClient");
  return sub_10006D0F4(v0);
}

void sub_10006D0F4(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "no \"CommStats\" entry in %@", (uint8_t *)&v2, 0xCu);
}

void sub_10006D168()
{
  os_log_t v0;
  uint8_t v1[24];

  sub_10002ED94();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Receiving unknown connection: %{public}@", v1, 0xCu);
}

void sub_10006D1D8(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = sub_10003C7F8(a1);
  sub_10002ED94();
  sub_10000F9A8((void *)&_mh_execute_header, v2, v3, "Connection interrupted: %{public}@", v4, v5, v6, v7, v8);

  sub_1000071A4();
}

void sub_10006D248(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = sub_10003C7F8(a1);
  sub_10002ED94();
  sub_10000F9A8((void *)&_mh_execute_header, v2, v3, "Connection invalidated: %{public}@", v4, v5, v6, v7, v8);

  sub_1000071A4();
}

void sub_10006D2B8(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  sub_10003C7EC(a1, a2);
  sub_10001DF88();
  sub_10001DF74((void *)&_mh_execute_header, v2, v3, "[addNavigationIdentifer] Error adding navigation owner for %{public}@(%d). It is already in owner list", v4, v5, v6, v7, v8);
  sub_1000071A4();
}

void sub_10006D324(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  sub_10003C7EC(a1, a2);
  sub_10001DF88();
  sub_10001DF74((void *)&_mh_execute_header, v2, v3, "[addNavigationIdentifer] Error adding navigation owner %{public}@(%d) is already in owner list", v4, v5, v6, v7, v8);
  sub_1000071A4();
}

void sub_10006D390()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  sub_10002ED94();
  v3 = 2114;
  v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Unable to remove owner %{public}@ %{public}@", v2, 0x16u);
}

void sub_10006D410(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[updateOwnershipToiOSIfNecessary] Attempting to update ownership to iOS but no CarPlay session is available", v1, 2u);
}

uint64_t sub_10006D450()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "CRAccNavProvider");
  return sub_10006D474(v0);
}

void sub_10006D474()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "received Bluetooth confirmation request for a device other than the existing prompt flow device", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006D4A0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "received Bluetooth failed for a device other than the existing prompt flow device", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006D4CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "cannot present initial step", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006D4F8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "timed out waiting on messaging vehicle, will dismiss prompt flow", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006D524()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_100007174((void *)&_mh_execute_header, v0, v1, "CRWirelessPairingSession invalidate", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006D550()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "CarPlay is not allowed", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006D57C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "cannot start pairing, not an active pairing session", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006D5A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "cannot start pairing, pairing is not available", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006D5D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "carkitd failure during pairing", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006D600()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "cannot start pairing, failed to initialize remote device", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006D62C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100043BC8();
  sub_100043BB8((void *)&_mh_execute_header, v0, v1, "cannot start pairing, failed to setOOBData: %i", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006D68C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100043BC8();
  sub_100043BB8((void *)&_mh_execute_header, v0, v1, "cannot start pairing, failed to clearOOBData: %i", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006D6EC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100043BB8((void *)&_mh_execute_header, a2, a3, "failed to clearOOBData: %i", a5, a6, a7, a8, 0);
  sub_100007184();
}

void sub_10006D754()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100043BC8();
  sub_100043BB8((void *)&_mh_execute_header, v0, v1, "failed to clearOOBData: %i", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006D7B4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100043BC8();
  sub_100043BB8((void *)&_mh_execute_header, v0, v1, "failed to initialize bluetooth address: %i", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006D814()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100043BC8();
  sub_100043BB8((void *)&_mh_execute_header, v0, v1, "failed to cancel BT pairing: %i", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006D874()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "failed to get default local device", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006D8A0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100043BC8();
  sub_100043BB8((void *)&_mh_execute_header, v0, v1, "failed to get local device address data %d", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006D900()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100043BC8();
  sub_100043BB8((void *)&_mh_execute_header, v0, v1, "failed to get local device address string %d", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006D960()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100043BC8();
  sub_100043BB8((void *)&_mh_execute_header, v0, v1, "failed to initialize device from bluetooth address: %i", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006D9C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "failed to create a BTSession", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006D9EC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_100007174((void *)&_mh_execute_header, v0, v1, "blocking session queue", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006DA18()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_100007174((void *)&_mh_execute_header, v0, v1, "unblocking session queue", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006DA44()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_100007174((void *)&_mh_execute_header, v0, v1, "starting BTSessionDetach", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006DA70()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_100007174((void *)&_mh_execute_header, v0, v1, "starting BTPairingAgentDestroy", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006DA9C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_100007174((void *)&_mh_execute_header, v0, v1, "BTSession attached", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006DAC8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_100007174((void *)&_mh_execute_header, v0, v1, "invoking session detach handler", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006DAF4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_100007174((void *)&_mh_execute_header, v0, v1, "BTSession detached", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006DB20()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_100007174((void *)&_mh_execute_header, v0, v1, "clearing session detach handler", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006DB4C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "failed to create a BTPairingAgent", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006DB78()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "failed to get local device address", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006DBA4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100043BC8();
  sub_100043BB8((void *)&_mh_execute_header, v0, v1, "failed to connect services after starting OOB pairing: %i", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006DC04()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100043BC8();
  sub_100043BB8((void *)&_mh_execute_header, v0, v1, "failed to add BT callbacks, result %i", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006DC64()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "timed out trying to connect BT using OOB pairing data", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006DC90(int *a1, int a2, os_log_t log)
{
  int v3;
  _DWORD v4[2];
  __int16 v5;
  int v6;

  v3 = *a1;
  v4[0] = 67109376;
  v4[1] = v3;
  v5 = 1024;
  v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "connected services %i doesn't match expect service mask %i", (uint8_t *)v4, 0xEu);
}

void sub_10006DD18()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100043BC8();
  sub_100043BB8((void *)&_mh_execute_header, v0, v1, "failed to get connected services, result: %i", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006DD78(void *a1, NSObject *a2)
{
  _DWORD v3[2];
  __int16 v4;
  const __CFString *v5;
  __int16 v6;
  const __CFString *v7;

  v3[0] = 67109634;
  v3[1] = objc_msgSend(a1, "processIdentifier");
  v4 = 2112;
  v5 = CFSTR("com.apple.private.carkit.app");
  v6 = 2112;
  v7 = CFSTR("com.apple.private.carkit.dnd");
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Process %i has neither the %@ nor %@ entitlements", (uint8_t *)v3, 0x1Cu);
}

void sub_10006DE24(unsigned __int8 *a1, char a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *a1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a2 & 1));
  v7 = 138543618;
  v8 = v5;
  v9 = 2114;
  v10 = v6;
  _os_log_fault_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_FAULT, "Asked for Driving %{public}@, received %{public}@", (uint8_t *)&v7, 0x16u);

}

void sub_10006DEF8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "failed to find CarPlayAssetUI.framework", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006DF24()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "no MaximumAssetCompatibilityVersion in CarPlayAssetUI.framework", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006DF50(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000157D4((void *)&_mh_execute_header, a2, a3, "no certificate serial for session %@", a5, a6, a7, a8, 2u);
  sub_100005778();
}

void sub_10006DFB4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000157D4((void *)&_mh_execute_header, a2, a3, "staged asset version %{public}@ does not have a corresponding asset URL", a5, a6, a7, a8, 2u);
  sub_100005778();
}

void sub_10006E018(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000157D4((void *)&_mh_execute_header, a2, a3, "asset version %@ file send failed", a5, a6, a7, a8, 2u);
  sub_100005778();
}

void sub_10006E080(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "cleaning up any assets for id %{public}@ older than version: %{public}@", (uint8_t *)&v3, 0x16u);
  sub_100005778();
}

void sub_10006E100()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "Ignoring asset version, unpaired vehicle", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006E12C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "staged asset is older than current asset, do we have a valid current asset anymore?", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006E158(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000157D4((void *)&_mh_execute_header, a2, a3, "failed to find vehicle with identifier %@", a5, a6, a7, a8, 2u);
  sub_100005778();
}

void sub_10006E1C0(void *a1, NSObject *a2)
{
  _DWORD v3[2];
  __int16 v4;
  const __CFString *v5;

  v3[0] = 67109378;
  v3[1] = objc_msgSend(a1, "processIdentifier");
  v4 = 2112;
  v5 = CFSTR("com.apple.private.carkit");
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Process %i does not have the %@ entitlement", (uint8_t *)v3, 0x12u);
}

void sub_10006E25C(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "failed to connect to monitoring client service %@", (uint8_t *)&v2, 0xCu);
}

void sub_10006E2D0(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 138412290;
  v4 = a1;
  sub_10000EF04((void *)&_mh_execute_header, a2, a3, "Error creating logging folder: %@", (uint8_t *)&v3);
  sub_100005778();
}

void sub_10006E338(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 138412290;
  v4 = a1;
  sub_10000EF04((void *)&_mh_execute_header, a2, a3, "Error reading contents of logging folder: %@", (uint8_t *)&v3);
  sub_100005778();
}

void sub_10006E3A0()
{
  uint64_t v0;
  os_log_t v1;

  sub_10000B074();
  sub_100017F00((void *)&_mh_execute_header, v0, v1, "failed to mark %@ as purgeable: %@");
  sub_100005778();
}

void sub_10006E400()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "no attachment URL", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006E42C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "no attachment filename", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006E458()
{
  uint64_t v0;
  os_log_t v1;

  sub_10000B074();
  sub_100017F00((void *)&_mh_execute_header, v0, v1, "Failed to move diagnostic attachment %@: %@");
  sub_100005778();
}

void sub_10006E4B8()
{
  uint64_t v0;
  os_log_t v1;

  sub_10000B074();
  sub_100017F00((void *)&_mh_execute_header, v0, v1, "Failed to fetch attributes %@: %@");
  sub_100005778();
}

void sub_10006E518()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "no text or filename", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006E544()
{
  uint64_t v0;
  os_log_t v1;

  sub_10000B074();
  sub_100017F00((void *)&_mh_execute_header, v0, v1, "Failed to write text file diagnostic attachment %@: %@");
  sub_100005778();
}

void sub_10006E5A4()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_10000718C();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "CarPlay diagnostics gathering started", v1, 2u);
  sub_100007184();
}

void sub_10006E5DC(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "localizedDescription"));
  v5 = 138412290;
  v6 = v3;
  sub_10000EF04((void *)&_mh_execute_header, a2, v4, "sysdiagnose failed when gathering CarPlay diagnostics, error: %@", (uint8_t *)&v5);

}

void sub_10006E66C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10002ED94();
  sub_100056060((void *)&_mh_execute_header, v0, v1, "Failed to fetch current Driving state: %@", v2, v3, v4, v5, v6);
  sub_100005778();
}

void sub_10006E6CC(unsigned __int8 *a1, char a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *a1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a2 & 1));
  v7 = 138543618;
  v8 = v5;
  v9 = 2114;
  v10 = v6;
  _os_log_fault_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_FAULT, "Asked for DNDWD %{public}@, received %{public}@", (uint8_t *)&v7, 0x16u);

}

void sub_10006E7A0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10002ED94();
  sub_100056060((void *)&_mh_execute_header, v0, v1, "Failed to retrieve driving mode configuration with %@", v2, v3, v4, v5, v6);
  sub_100005778();
}

void sub_10006E800()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10002ED94();
  sub_100056060((void *)&_mh_execute_header, v0, v1, "Failed to create driving activity mode: %@", v2, v3, v4, v5, v6);
  sub_100005778();
}

void sub_10006E860()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10002ED94();
  sub_100056060((void *)&_mh_execute_header, v0, v1, "Unable to create DND mode configuration: %@", v2, v3, v4, v5, v6);
  sub_100005778();
}

void sub_10006E8C0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000B0E0((void *)&_mh_execute_header, a1, a3, "assertion manager timed out", a5, a6, a7, a8, 0);
}

void sub_10006E8F4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000B0E0((void *)&_mh_execute_header, a1, a3, "assertion manager timed out but there is an active session", a5, a6, a7, a8, 0);
}

void sub_10006E928()
{
  __assert_rtn("CRLogForCategory", "CRLogging.m", 14, "category < CRLoggingCategoryCount");
}

void sub_10006E950(uint64_t a1, NSObject *a2)
{
  _DWORD v3[2];

  v3[0] = 67109120;
  v3[1] = (unsigned __int16)objc_msgSend((id)objc_opt_class(a1), "identifier");
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "failed to send message with ID: %hu", (uint8_t *)v3, 8u);
}

void sub_10006E9E0(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "invalid message contents: %@", (uint8_t *)&v3, 0xCu);
}

void sub_10006EA58(uint64_t a1, int a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;

  v3 = 138412546;
  v4 = a1;
  v5 = 1024;
  v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "BTDeviceAddressToString(%@) failed with error %d.", (uint8_t *)&v3, 0x12u);
  sub_100005778();
}

void sub_10006EAD8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10005A530();
  sub_100031B30((void *)&_mh_execute_header, v0, v1, "failed to find device for address %{private, mask.hash}@", v2, v3, v4, v5, v6);
  sub_100005778();
}

void sub_10006EB38()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10005A530();
  sub_100031B30((void *)&_mh_execute_header, v0, v1, "failed to find the device (%{private, mask.hash}@) to unpair", v2, v3, v4, v5, v6);
  sub_100005778();
}

void sub_10006EB98()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10005A530();
  sub_100031B30((void *)&_mh_execute_header, v0, v1, "failed to find the device (%{private, mask.hash}@) to update contacts sync settings", v2, v3, v4, v5, v6);
  sub_100005778();
}

void sub_10006EBF8(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 138412290;
  v4 = a1;
  sub_10000EF04((void *)&_mh_execute_header, a2, a3, "failed to get a numeric comparison confirmation response: %@", (uint8_t *)&v3);
  sub_100005778();
}

void sub_10006EC60(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "name"));
  v5 = 138412290;
  v6 = v3;
  sub_10000EF04((void *)&_mh_execute_header, a2, v4, "unsupported pairing style %@", (uint8_t *)&v5);

}

void sub_10006ECEC(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;

  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  sub_10000EF04((void *)&_mh_execute_header, a2, a3, "download hint not a tracked asset request %@", (uint8_t *)&v4);
  sub_100005778();
}

void sub_10006ED58(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = 138412290;
  v5 = v3;
  sub_10000EF04((void *)&_mh_execute_header, a2, a3, "theme assets catalog failed to download: %@", (uint8_t *)&v4);
  sub_100005778();
}

void sub_10006EDC4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10002ED94();
  sub_10000EF04((void *)&_mh_execute_header, v0, v1, "Failed to query for theme asset: queryResult: %ld", v2);
  sub_100005778();
}

void sub_10006EE28(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000B0E0((void *)&_mh_execute_header, a1, a3, "theme assets catalog not present", a5, a6, a7, a8, 0);
}

void sub_10006EE5C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000B0E0((void *)&_mh_execute_header, a1, a3, "theme assets catalog out of date", a5, a6, a7, a8, 0);
}

void sub_10006EE90()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10002ED94();
  sub_10000EF04((void *)&_mh_execute_header, v0, v1, "Failed to find theme asset for %@", v2);
  sub_100005778();
}

void sub_10006EEF4(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "attributes"));
  sub_10002ED94();
  sub_10000EF04((void *)&_mh_execute_header, a2, v4, "downloadable asset doesn't have appropriate attributes: %@", v5);

  sub_1000071A4();
}

void sub_10006EF78(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a1 + 56);
  v4 = 138543362;
  v5 = v3;
  sub_10000EF04((void *)&_mh_execute_header, a2, a3, "theme asset download failed: %{public}@", (uint8_t *)&v4);
  sub_100005778();
}

void sub_10006EFE4(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "attributes"));
  sub_10002ED94();
  sub_10000EF04((void *)&_mh_execute_header, a2, v4, "cannot use asset: %@", v5);

  sub_1000071A4();
}

void sub_10006F064(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription"));
  sub_10002ED94();
  sub_10000F9A8((void *)&_mh_execute_header, v2, v3, "CARAnalytics: unable to send wirelessPairingCreatedEvent connection event. Error: %@", v4, v5, v6, v7, v8);

  sub_1000071A4();
}

void sub_10006F0DC()
{
  os_log_t v0;
  uint8_t v1[24];

  sub_10002ED94();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Sending CA event %@", v1, 0xCu);
}

void sub_10006F14C(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a1));
  sub_10002ED94();
  sub_10000F9A8((void *)&_mh_execute_header, v2, v3, "Unknown analytics event: %@", v4, v5, v6, v7, v8);

  sub_1000071A4();
}

void sub_10006F1D0(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a1));
  sub_10002ED94();
  sub_10000F9A8((void *)&_mh_execute_header, v2, v3, "Unsupported calendar unit type: %@", v4, v5, v6, v7, v8);

  sub_1000071A4();
}

void sub_10006F254(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000B0E0((void *)&_mh_execute_header, a1, a3, "asset doesn't have ContentIdentifier", a5, a6, a7, a8, 0);
  sub_100007184();
}

void sub_10006F284(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000B0E0((void *)&_mh_execute_header, a1, a3, "asset doesn't have AccessoryContentVersion", a5, a6, a7, a8, 0);
  sub_100007184();
}

void sub_10006F2B4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000B0E0((void *)&_mh_execute_header, a1, a3, "asset doesn't have iOSContentVersion", a5, a6, a7, a8, 0);
  sub_100007184();
}

void sub_10006F2E4(_DWORD *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  __int128 v4;

  LODWORD(v3) = 67109378;
  HIDWORD(v3) = *a1;
  LOWORD(v4) = 2112;
  *(_QWORD *)((char *)&v4 + 2) = a2;
  sub_10000B08C((void *)&_mh_execute_header, a2, a3, "failed to encode message, error: %d, contents: %@", v3, (_QWORD)v4, WORD4(v4));
  sub_100005778();
}

void sub_10006F358()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "message to encode is greater than maximum message size", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006F384()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "exceeded max message buffer size!", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006F3B0()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_10000718C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "waiting on the rest of the header", v1, 2u);
  sub_100007184();
}

void sub_10006F3E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "incorrect header size", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006F414()
{
  os_log_t v0;
  uint8_t v1[24];

  sub_10000B0B8();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "have %lu bytes for message of size %u", v1, 0x12u);
  sub_100005778();
}

void sub_10006F484()
{
  uint64_t v0;
  os_log_t v1;
  uint64_t v2;
  int v3;

  sub_10000B0B8();
  sub_10000B08C((void *)&_mh_execute_header, v0, v1, "buffer of size %lu bytes exceeded expected message size %u", v2, v3);
  sub_100005778();
}

void sub_10006F4E4(int *a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];

  v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "failed to decode message: %d", (uint8_t *)v3, 8u);
  sub_100007184();
}

void sub_10006F558(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "No WiFi device found; no WiFi until a device is attached.",
    v1,
    2u);
}

void sub_10006F598()
{
  uint64_t v0;
  os_log_t v1;

  sub_100064818();
  sub_10000B08C((void *)&_mh_execute_header, v0, v1, "failed to encode log archive request: %@, error: %d");
  sub_100005778();
}

void sub_10006F5FC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "failed to request log archive", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006F628()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "failed to request log archive, channel is not open", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006F654()
{
  uint64_t v0;
  os_log_t v1;

  sub_100064818();
  sub_10000B08C((void *)&_mh_execute_header, v0, v1, "failed to encode start statistics request: %@, error: %d");
  sub_100005778();
}

void sub_10006F6B8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "failed to request start statistics", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006F6E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "failed to request start statistics, channel is not open", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006F710(_QWORD *a1, _DWORD *a2, NSObject *a3)
{
  _BYTE v3[18];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 1024;
  *(_DWORD *)&v3[14] = *a2;
  sub_10000B08C((void *)&_mh_execute_header, (uint64_t)a2, a3, "failed to parse file message: %@, error %d", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_WORD *)&v3[16]);
  sub_100005778();
}

void sub_10006F788(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000157D4((void *)&_mh_execute_header, a2, a3, "no message type in file channel message: %@", a5, a6, a7, a8, 2u);
  sub_100005778();
}

void sub_10006F7F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "file receiver can't accept file requests", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006F81C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "file receiver can't receive file accepts", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006F848()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10002ED94();
  sub_1000157D4((void *)&_mh_execute_header, v0, v1, "no payload type in file header message: %@", v2, v3, v4, v5, v6);
  sub_100005778();
}

void sub_10006F8A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10002ED94();
  sub_1000157D4((void *)&_mh_execute_header, v0, v1, "no session ID in file message: %@", v2, v3, v4, v5, v6);
  sub_100005778();
}

void sub_10006F908()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10002ED94();
  sub_1000157D4((void *)&_mh_execute_header, v0, v1, "no chunk count in file header message: %@", v2, v3, v4, v5, v6);
  sub_100005778();
}

void sub_10006F968()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10002ED94();
  sub_1000157D4((void *)&_mh_execute_header, v0, v1, "no chunk data or chunk index in file payload message: %@", v2, v3, v4, v5, v6);
  sub_100005778();
}

void sub_10006F9C8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10002ED94();
  sub_1000157D4((void *)&_mh_execute_header, v0, v1, "no payload type in stream payload message: %@", v2, v3, v4, v5, v6);
  sub_100005778();
}

void sub_10006FA28()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10002ED94();
  sub_1000157D4((void *)&_mh_execute_header, v0, v1, "no statistics dictionary in message: %@", v2, v3, v4, v5, v6);
  sub_100005778();
}

void sub_10006FA88()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10002ED94();
  sub_1000157D4((void *)&_mh_execute_header, v0, v1, "payload type %@ is not a streaming payload type", v2, v3, v4, v5, v6);
  sub_100005778();
}

void sub_10006FAE8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "no version in theme asset message", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006FB14()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "no URL to save the file", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006FB40()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10002ED94();
  sub_1000157D4((void *)&_mh_execute_header, v0, v1, "cannot receive theme asset, failed to setup %@", v2, v3, v4, v5, v6);
  sub_100005778();
}

void sub_10006FBA0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "failed to determine URL to save the file", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006FBCC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "failed to create folder to save the log archive file", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006FBF8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "failed to determine URL to save the log archive file", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006FC24()
{
  uint64_t v0;
  os_log_t v1;

  sub_100064818();
  sub_10000B08C((void *)&_mh_execute_header, v0, v1, "failed to encode file accept message: %@ error: %d");
  sub_100005778();
}

void sub_10006FC88()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000718C();
  sub_10000B0E0((void *)&_mh_execute_header, v0, v1, "failed to send file accept message, channel is not open", v2, v3, v4, v5, v6);
  sub_100007184();
}

void sub_10006FCB4(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "updating BLE devices for discovery to: %@", (uint8_t *)&v3, 0xCu);
  sub_100005778();
}

void sub_10006FD28(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007174((void *)&_mh_execute_header, a1, a3, "already tracking all currently paired BLE devices for discovery", a5, a6, a7, a8, 0);
}

void sub_10006FD5C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007174((void *)&_mh_execute_header, a1, a3, "setup BLE CBDiscovery", a5, a6, a7, a8, 0);
}

void sub_10006FD90()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10002ED94();
  sub_1000157D4((void *)&_mh_execute_header, v0, v1, "failed to setup BLE CBDisccovery: %@", v2, v3, v4, v5, v6);
  sub_100005778();
}

void sub_10006FDF0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10005A530();
  sub_100031B30((void *)&_mh_execute_header, v0, v1, "couldn't remove %{private, mask.hash}@, not a paired BT peripheral", v2, v3, v4, v5, v6);
  sub_100005778();
}

void sub_10006FE50()
{
  os_log_t v0;
  uint8_t v1[40];

  sub_1000683AC();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "retrieved peripherals %@ for identifier %{private, mask.hash}@", v1, 0x20u);
  sub_1000683E4();
}

void sub_10006FEC0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10002ED94();
  sub_1000157D4((void *)&_mh_execute_header, v0, v1, "failed to find vehicle for service: %@, may not be identified yet", v2, v3, v4, v5, v6);
  sub_100005778();
}

void sub_10006FF20(uint64_t *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;

  v3 = *a1;
  v4 = 141558531;
  v5 = 1752392040;
  v6 = 2113;
  v7 = v3;
  v8 = 2112;
  v9 = a2;
  sub_1000683D8((void *)&_mh_execute_header, a3, (uint64_t)a3, "failed to start BLE pairing, couldn't connect to %{private, mask.hash}@, error: %@", (uint8_t *)&v4);
  sub_1000683E4();
}

void sub_10006FFB0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10005A530();
  sub_100031B30((void *)&_mh_execute_header, v0, v1, "couldn't connect to %{private, mask.hash}@, not a known BT peripheral", v2, v3, v4, v5, v6);
  sub_100005778();
}

void sub_100070010()
{
  NSObject *v0;
  uint8_t v1[40];

  sub_1000683AC();
  sub_1000683D8((void *)&_mh_execute_header, v0, (uint64_t)v0, "attempting to connect to %@ when already connected using service: %{private, mask.hash}@, resetting", v1);
  sub_1000683E4();
}

void sub_100070078()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10002ED94();
  sub_1000157D4((void *)&_mh_execute_header, v0, v1, "failed to connect to periperal to start CarPlay service: %@", v2, v3, v4, v5, v6);
  sub_100005778();
}

void sub_1000700D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10005A530();
  sub_100031B30((void *)&_mh_execute_header, v0, v1, "cannot get peripheral for discovered device: %{private, mask.hash}@", v2, v3, v4, v5, v6);
  sub_100005778();
}

void sub_100070138()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10005A530();
  sub_100031B30((void *)&_mh_execute_header, v0, v1, "discovered device not paired: %{private, mask.hash}@", v2, v3, v4, v5, v6);
  sub_100005778();
}

void sub_100070198(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000157D4((void *)&_mh_execute_header, a2, a3, "failed to send message: %@", a5, a6, a7, a8, 2u);
  sub_100005778();
}

void sub_100070200(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000157D4((void *)&_mh_execute_header, a2, a3, "received unhandled message: %@", a5, a6, a7, a8, 2u);
  sub_100005778();
}

void sub_100070268()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10005A530();
  sub_100031B30((void *)&_mh_execute_header, v0, v1, "couldn't find peripheral for paired peer %{private, mask.hash}@", v2, v3, v4, v5, v6);
  sub_100005778();
}

void sub_1000702C8(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint8_t v7[22];
  __int16 v8;
  uint64_t v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "identifier"));
  sub_10005A530();
  v8 = 2112;
  v9 = a2;
  sub_1000683D8((void *)&_mh_execute_header, a3, v6, "fail to BLE pair with %{private, mask.hash}@, error: %@", v7);

}

void sub_100070368(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "pairingPeripheralIdentifier"));
  v7 = 141558787;
  v8 = 1752392040;
  v9 = 2113;
  v10 = v5;
  v11 = 2160;
  v12 = 1752392040;
  v13 = 2113;
  v14 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "peerDidFailToCompletePairing %{private, mask.hash}@, current pairing identifier: %{private, mask.hash}@", (uint8_t *)&v7, 0x2Au);

}

void sub_100070444()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10002ED94();
  sub_1000157D4((void *)&_mh_execute_header, v0, v1, "incorrect pairing type: %li", v2, v3, v4, v5, v6);
  sub_100005778();
}

void sub_1000704A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10002ED94();
  sub_1000157D4((void *)&_mh_execute_header, v0, v1, "failed to confirm pairing: %@", v2, v3, v4, v5, v6);
  sub_100005778();
}

id objc_msgSend_BTPowerMessagingVehicle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BTPowerMessagingVehicle");
}

id objc_msgSend_BTPowerStoredVehicle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BTPowerStoredVehicle");
}

id objc_msgSend_CARActionWithTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CARActionWithTitle:");
}

id objc_msgSend_CARActionWithURL_title_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CARActionWithURL:title:");
}

id objc_msgSend_CARDNDQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CARDNDQueue");
}

id objc_msgSend_ComputedMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ComputedMode");
}

id objc_msgSend_DNDEndedWithTrigger_vehicleHints_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "DNDEndedWithTrigger:vehicleHints:context:");
}

id objc_msgSend_DNDStartedWithTrigger_vehicleHints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "DNDStartedWithTrigger:vehicleHints:");
}

id objc_msgSend_DSLPublisher(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "DSLPublisher");
}

id objc_msgSend_DoNotDisturbWhileDriving(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "DoNotDisturbWhileDriving");
}

id objc_msgSend_MFiCertificateSerialNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MFiCertificateSerialNumber");
}

id objc_msgSend_PPID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "PPID");
}

id objc_msgSend_PSM(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "PSM");
}

id objc_msgSend_SDKVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "SDKVersion");
}

id objc_msgSend_SSID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "SSID");
}

id objc_msgSend_TTRURLforEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "TTRURLforEvent:");
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLByAppendingPathComponent_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathComponent:isDirectory:");
}

id objc_msgSend_URLForDirectory_inDomain_appropriateForURL_create_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLForDirectory:inDomain:appropriateForURL:create:error:");
}

id objc_msgSend_URLForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLForKey:");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_URLsForDirectory_inDomains_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLsForDirectory:inDomains:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend_UUIDWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDWithString:");
}

id objc_msgSend_UserFocus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UserFocus");
}

id objc_msgSend__CARConnectionServiceInterface(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_CARConnectionServiceInterface");
}

id objc_msgSend__CARCoreAnalyticsEventNameForEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_CARCoreAnalyticsEventNameForEvent:");
}

id objc_msgSend__DNDServiceInterface(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_DNDServiceInterface");
}

id objc_msgSend__INFOResponseURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_INFOResponseURL");
}

id objc_msgSend__accessorySupportsLocationDeadReckoning(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_accessorySupportsLocationDeadReckoning");
}

id objc_msgSend__addConnectedVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addConnectedVehicle:");
}

id objc_msgSend__addConnection_forCertificateSerial_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addConnection:forCertificateSerial:");
}

id objc_msgSend__addConnectionData_toReconnectArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addConnectionData:toReconnectArray:");
}

id objc_msgSend__addCoordinatesToMonitoredRegion_identifier_radius_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addCoordinatesToMonitoredRegion:identifier:radius:");
}

id objc_msgSend__addKeychainAttributesForVehicle_toDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addKeychainAttributesForVehicle:toDictionary:");
}

id objc_msgSend__addKeychainPairingForVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addKeychainPairingForVehicle:");
}

id objc_msgSend__addPreferencesPairingForVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addPreferencesPairingForVehicle:");
}

id objc_msgSend__addressStringForDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addressStringForDevice:");
}

id objc_msgSend__alertContents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_alertContents");
}

id objc_msgSend__allKeychainAttributesForVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_allKeychainAttributesForVehicle:");
}

id objc_msgSend__allPreferencesPairings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_allPreferencesPairings");
}

id objc_msgSend__allUnpairedVehicleStorage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_allUnpairedVehicleStorage");
}

id objc_msgSend__applyPreferencesAttributes_toVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_applyPreferencesAttributes:toVehicle:");
}

id objc_msgSend__assetArchiveURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_assetArchiveURL");
}

id objc_msgSend__assetProgressForVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_assetProgressForVehicle:");
}

id objc_msgSend__assetQueue_cancelUnusedDownloads(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_assetQueue_cancelUnusedDownloads");
}

id objc_msgSend__assetQueue_installedAssets(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_assetQueue_installedAssets");
}

id objc_msgSend__assetQueue_notifyObserverOfAsset_forAssetRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_assetQueue_notifyObserverOfAsset:forAssetRequest:");
}

id objc_msgSend__assetQueue_notifyObserverOfDownloadAttemptForAssetRequest_version_progress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_assetQueue_notifyObserverOfDownloadAttemptForAssetRequest:version:progress:");
}

id objc_msgSend__assetQueue_notifyObserverOfFailedDownloadForAssetRequest_version_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_assetQueue_notifyObserverOfFailedDownloadForAssetRequest:version:error:");
}

id objc_msgSend__assetQueue_processPerAssetRequestAllAssets_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_assetQueue_processPerAssetRequestAllAssets:completion:");
}

id objc_msgSend__assetQueue_queryUpdatedAssetsForRequests_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_assetQueue_queryUpdatedAssetsForRequests:");
}

id objc_msgSend__assetQueue_removeAssets_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_assetQueue_removeAssets:");
}

id objc_msgSend__assetQueue_removeUnusedAssets(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_assetQueue_removeUnusedAssets");
}

id objc_msgSend__assetQueue_requestAssetCatalogDownload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_assetQueue_requestAssetCatalogDownload");
}

id objc_msgSend__assetRequestForVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_assetRequestForVehicle:");
}

id objc_msgSend__assetVersionForVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_assetVersionForVehicle:");
}

id objc_msgSend__beginIdleExitTransaction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_beginIdleExitTransaction");
}

id objc_msgSend__beginWiredPairingWithMessagingVehicle_storedVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_beginWiredPairingWithMessagingVehicle:storedVehicle:");
}

id objc_msgSend__cancelUserDisabledTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cancelUserDisabledTimer");
}

id objc_msgSend__cancelWithRequiredStepsRemaining_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cancelWithRequiredStepsRemaining:");
}

id objc_msgSend__carKeyInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_carKeyInfo");
}

id objc_msgSend__carPlayLogsFolderURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_carPlayLogsFolderURL");
}

id objc_msgSend__checkLockScreenStatusWithReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_checkLockScreenStatusWithReply:");
}

id objc_msgSend__checkVehicleState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_checkVehicleState");
}

id objc_msgSend__chunkQueue_blockingSendChannelMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_chunkQueue_blockingSendChannelMessage:");
}

id objc_msgSend__cleanup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cleanup");
}

id objc_msgSend__cleanupACCTransport(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cleanupACCTransport");
}

id objc_msgSend__cleanupAssetProgress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cleanupAssetProgress");
}

id objc_msgSend__cleanupPreferencesForIncompleteVehicleIdentifier_name_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cleanupPreferencesForIncompleteVehicleIdentifier:name:");
}

id objc_msgSend__closeFile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_closeFile");
}

id objc_msgSend__closeXPCConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_closeXPCConnection");
}

id objc_msgSend__collectCAFToolTree_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_collectCAFToolTree:");
}

id objc_msgSend__collectCarConfigurationForSession_supportingStartSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_collectCarConfigurationForSession:supportingStartSession:");
}

id objc_msgSend__configurationValueForSafeKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_configurationValueForSafeKey:");
}

id objc_msgSend__configureDiagnosticsData_withAttachmentURLs_withAdditionalDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_configureDiagnosticsData:withAttachmentURLs:withAdditionalDescription:");
}

id objc_msgSend__connectWithBluetoothIdentifier_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_connectWithBluetoothIdentifier:completion:");
}

id objc_msgSend__createDrivingActivityModeIfNeeded_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createDrivingActivityModeIfNeeded:");
}

id objc_msgSend__createGeofenceForLOI_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createGeofenceForLOI:");
}

id objc_msgSend__createGeofencesAroundHomeAndWork(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createGeofencesAroundHomeAndWork");
}

id objc_msgSend__createGeofencesAroundPredictedLocationsFromLocation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createGeofencesAroundPredictedLocationsFromLocation:");
}

id objc_msgSend__creationKeychainAttributesForVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_creationKeychainAttributesForVehicle:");
}

id objc_msgSend__currentSiriAccount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_currentSiriAccount");
}

id objc_msgSend__currentlyConnectedVehicleSupportsMixableAudio(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_currentlyConnectedVehicleSupportsMixableAudio");
}

id objc_msgSend__declineTypeForOOBPairingMessagingVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_declineTypeForOOBPairingMessagingVehicle:");
}

id objc_msgSend__delegateHeadUnitPairingDidCompletePairingFlow_forBluetoothAddress_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_delegateHeadUnitPairingDidCompletePairingFlow:forBluetoothAddress:error:");
}

id objc_msgSend__delegateHeadUnitPairingDidReceiveUserConfirmation_forBluetoothAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_delegateHeadUnitPairingDidReceiveUserConfirmation:forBluetoothAddress:");
}

id objc_msgSend__denylistPreference(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_denylistPreference");
}

id objc_msgSend__descriptionForStep_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_descriptionForStep:");
}

id objc_msgSend__descriptionForTransportType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_descriptionForTransportType:");
}

id objc_msgSend__detachObservers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_detachObservers");
}

id objc_msgSend__deviceForBluetoothAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_deviceForBluetoothAddress:");
}

id objc_msgSend__didCompletePairingFlow_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_didCompletePairingFlow:error:");
}

id objc_msgSend__disableDNDUntilEndOfDrive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_disableDNDUntilEndOfDrive");
}

id objc_msgSend__disabledCarPlayFeaturesForVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_disabledCarPlayFeaturesForVehicle:");
}

id objc_msgSend__discoverService(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_discoverService");
}

id objc_msgSend__dismiss(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dismiss");
}

id objc_msgSend__dismissApprovalAlertForMessagingVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dismissApprovalAlertForMessagingVehicle:");
}

id objc_msgSend__dismissApprovalAlerts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dismissApprovalAlerts");
}

id objc_msgSend__dismissEnhancedIntegrationAlerts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dismissEnhancedIntegrationAlerts");
}

id objc_msgSend__dismissPairingAlertForMessagingVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dismissPairingAlertForMessagingVehicle:");
}

id objc_msgSend__dismissPairingAlerts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dismissPairingAlerts");
}

id objc_msgSend__dismissPairingPromptFlow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dismissPairingPromptFlow:");
}

id objc_msgSend__dismissReconnectionEnableWiFiAlertExceptForVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dismissReconnectionEnableWiFiAlertExceptForVehicle:");
}

id objc_msgSend__dismissReconnectionEnableWiFiAlertForVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dismissReconnectionEnableWiFiAlertForVehicle:");
}

id objc_msgSend__drivingModeChanged_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_drivingModeChanged:");
}

id objc_msgSend__drivingModeEnded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_drivingModeEnded");
}

id objc_msgSend__drivingModeStartedWithStartingGeofence_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_drivingModeStartedWithStartingGeofence:");
}

id objc_msgSend__endIdleExitTransaction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_endIdleExitTransaction");
}

id objc_msgSend__enhancedIntegrationUpdatedForMessagingVehicle_status_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_enhancedIntegrationUpdatedForMessagingVehicle:status:");
}

id objc_msgSend__extensionIdentifiersForDiagnosticsData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_extensionIdentifiersForDiagnosticsData:");
}

id objc_msgSend__failWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_failWithError:");
}

id objc_msgSend__fileQueue_handleFileHeaderMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fileQueue_handleFileHeaderMessage:");
}

id objc_msgSend__fileQueue_handleFilePayloadMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fileQueue_handleFilePayloadMessage:");
}

id objc_msgSend__fileQueue_handleStreamPayloadMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fileQueue_handleStreamPayloadMessage:");
}

id objc_msgSend__fileQueue_sendFileAcceptMessageWithStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fileQueue_sendFileAcceptMessageWithStatus:");
}

id objc_msgSend__fileQueue_setupLogArchiveWriterForSessionID_chunkCount_message_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fileQueue_setupLogArchiveWriterForSessionID:chunkCount:message:");
}

id objc_msgSend__fileQueue_setupThemeWriterForSessionID_chunkCount_message_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fileQueue_setupThemeWriterForSessionID:chunkCount:message:");
}

id objc_msgSend__findWirelessPairedVehicleForAccessoryConnectionIdentifier_result_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_findWirelessPairedVehicleForAccessoryConnectionIdentifier:result:");
}

id objc_msgSend__findWirelessPairedVehicleForMessagingVehicle_result_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_findWirelessPairedVehicleForMessagingVehicle:result:");
}

id objc_msgSend__finishIfPossible(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_finishIfPossible");
}

id objc_msgSend__finishedCurrentPairing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_finishedCurrentPairing");
}

id objc_msgSend__fireHandler_withState_result_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fireHandler:withState:result:error:");
}

id objc_msgSend__getCreationDateForAttachmentURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getCreationDateForAttachmentURL:");
}

id objc_msgSend__getSecurityTypeForNetwork_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getSecurityTypeForNetwork:");
}

id objc_msgSend__handleAssetProgressFinished(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleAssetProgressFinished");
}

id objc_msgSend__handleChannelOpened(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleChannelOpened");
}

id objc_msgSend__handleConfigurationUpdated(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleConfigurationUpdated");
}

id objc_msgSend__handleEndedStream_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleEndedStream:");
}

id objc_msgSend__handleErrorOnStream_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleErrorOnStream:");
}

id objc_msgSend__handleHasBytesAvailableOnStream_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleHasBytesAvailableOnStream:");
}

id objc_msgSend__handleLocationUpdateToLocation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleLocationUpdateToLocation:");
}

id objc_msgSend__handleLockdownConnection_info_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleLockdownConnection:info:");
}

id objc_msgSend__handleReads(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleReads");
}

id objc_msgSend__handleReadsWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleReadsWithBlock:");
}

id objc_msgSend__handleStartSessionMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleStartSessionMessage:");
}

id objc_msgSend__hasDrivingActivityMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_hasDrivingActivityMode");
}

id objc_msgSend__hasExistingBluetoothPairing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_hasExistingBluetoothPairing");
}

id objc_msgSend__identifyingKeychainAttributesForVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_identifyingKeychainAttributesForVehicle:");
}

id objc_msgSend__ignoreEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_ignoreEvent:");
}

id objc_msgSend__incrementOutOfBandPairingDeclineCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_incrementOutOfBandPairingDeclineCount");
}

id objc_msgSend__incrementPairingDeclineCountForIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_incrementPairingDeclineCountForIdentifier:");
}

id objc_msgSend__intendedServiceMask(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_intendedServiceMask");
}

id objc_msgSend__internalQueue_chunkSizeForTransferWithPriority_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_internalQueue_chunkSizeForTransferWithPriority:");
}

id objc_msgSend__internalQueue_handleFileAcceptMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_internalQueue_handleFileAcceptMessage:");
}

id objc_msgSend__internalQueue_signalChunkQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_internalQueue_signalChunkQueue");
}

id objc_msgSend__internalText(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_internalText");
}

id objc_msgSend__invalidateCachedVehicles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_invalidateCachedVehicles");
}

id objc_msgSend__invokeCurrentBluetoothPairingCompletionWithDeviceIdentifier_success_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_invokeCurrentBluetoothPairingCompletionWithDeviceIdentifier:success:error:");
}

id objc_msgSend__isDeviceUnlocked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isDeviceUnlocked");
}

id objc_msgSend__isMessagingBluetoothConnected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isMessagingBluetoothConnected");
}

id objc_msgSend__isNightForLocation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isNightForLocation:");
}

id objc_msgSend__isRequiredStep_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isRequiredStep:");
}

id objc_msgSend__isRestricted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isRestricted:");
}

id objc_msgSend__isVehicleActionable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isVehicleActionable:");
}

id objc_msgSend__itemClassKeychainAttributes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_itemClassKeychainAttributes");
}

id objc_msgSend__keychainAttributesMatchingQuery_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_keychainAttributesMatchingQuery:");
}

id objc_msgSend__keychainItemAttributesForAllVehicles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_keychainItemAttributesForAllVehicles");
}

id objc_msgSend__keywordsToAttachForDiagnosticsData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_keywordsToAttachForDiagnosticsData:");
}

id objc_msgSend__launchRemoteAlertWithUserInfo_errorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_launchRemoteAlertWithUserInfo:errorHandler:");
}

id objc_msgSend__localDeviceAddressFromSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_localDeviceAddressFromSession:");
}

id objc_msgSend__localDeviceForSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_localDeviceForSession:");
}

id objc_msgSend__lock_setWiFiDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_lock_setWiFiDevice:");
}

id objc_msgSend__lock_wifiManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_lock_wifiManager");
}

id objc_msgSend__lock_wiredCarPlaySimulatorActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_lock_wiredCarPlaySimulatorActive");
}

id objc_msgSend__mainQueue_blockSessionQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_mainQueue_blockSessionQueue");
}

id objc_msgSend__mainQueue_connectDevice_session_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_mainQueue_connectDevice:session:completion:");
}

id objc_msgSend__mainQueue_delegateDidFinishWithResult_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_mainQueue_delegateDidFinishWithResult:error:");
}

id objc_msgSend__mainQueue_dismissLockscreenAlert(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_mainQueue_dismissLockscreenAlert");
}

id objc_msgSend__mainQueue_displayDraftCountBanner(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_mainQueue_displayDraftCountBanner");
}

id objc_msgSend__mainQueue_displayDraftErrorBanner(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_mainQueue_displayDraftErrorBanner");
}

id objc_msgSend__mainQueue_displayFetchingVehicleLogsBannerWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_mainQueue_displayFetchingVehicleLogsBannerWithCompletion:");
}

id objc_msgSend__mainQueue_evaluateAssetTransferIfConnected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_mainQueue_evaluateAssetTransferIfConnected");
}

id objc_msgSend__mainQueue_gatherVehicleLogsThenPerformSysdiagnoseWithDiagnosticData_isInternal_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_mainQueue_gatherVehicleLogsThenPerformSysdiagnoseWithDiagnosticData:isInternal:completion:");
}

id objc_msgSend__mainQueue_gatherVehicleLogsWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_mainQueue_gatherVehicleLogsWithCompletion:");
}

id objc_msgSend__mainQueue_handleDidConnectDevice_service_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_mainQueue_handleDidConnectDevice:service:");
}

id objc_msgSend__mainQueue_handleDidDiscoverDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_mainQueue_handleDidDiscoverDevice:");
}

id objc_msgSend__mainQueue_handleEvent_forSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_mainQueue_handleEvent:forSession:");
}

id objc_msgSend__mainQueue_handleVehiclesChanged(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_mainQueue_handleVehiclesChanged");
}

id objc_msgSend__mainQueue_hintDownloadForVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_mainQueue_hintDownloadForVehicle:");
}

id objc_msgSend__mainQueue_invalidateFileSenderSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_mainQueue_invalidateFileSenderSession");
}

id objc_msgSend__mainQueue_invalidateSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_mainQueue_invalidateSession");
}

id objc_msgSend__mainQueue_performSysdiagnoseIncludingData_isInternal_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_mainQueue_performSysdiagnoseIncludingData:isInternal:completion:");
}

id objc_msgSend__mainQueue_performWithPairingAgent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_mainQueue_performWithPairingAgent:");
}

id objc_msgSend__mainQueue_performWithPromptPresenter_isUILocked_errorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_mainQueue_performWithPromptPresenter:isUILocked:errorHandler:");
}

id objc_msgSend__mainQueue_performWithSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_mainQueue_performWithSession:");
}

id objc_msgSend__mainQueue_presentCarAlertWithTitle_dismissTime_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_mainQueue_presentCarAlertWithTitle:dismissTime:completion:");
}

id objc_msgSend__mainQueue_presentDictationBannerWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_mainQueue_presentDictationBannerWithCompletion:");
}

id objc_msgSend__mainQueue_presentLockscreenAlertWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_mainQueue_presentLockscreenAlertWithCompletion:");
}

id objc_msgSend__mainQueue_promptForInternalSysdiagnoseForDiagnosticData_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_mainQueue_promptForInternalSysdiagnoseForDiagnosticData:completion:");
}

id objc_msgSend__mainQueue_requestLocalOOBDataWithCompletion_errorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_mainQueue_requestLocalOOBDataWithCompletion:errorHandler:");
}

id objc_msgSend__mainQueue_setupBlockedSessionQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_mainQueue_setupBlockedSessionQueue");
}

id objc_msgSend__mainQueue_startDiagnosticsOperation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_mainQueue_startDiagnosticsOperation:");
}

id objc_msgSend__mainQueue_startSessionForHost_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_mainQueue_startSessionForHost:reply:");
}

id objc_msgSend__mainQueue_unblockSessionQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_mainQueue_unblockSessionQueue");
}

id objc_msgSend__mainQueue_updateAssetRequests(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_mainQueue_updateAssetRequests");
}

id objc_msgSend__mainQueue_updateClusterAssetIdentifier_assetVersion_sdkVersion_forVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_mainQueue_updateClusterAssetIdentifier:assetVersion:sdkVersion:forVehicle:");
}

id objc_msgSend__mainQueue_vehicleForSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_mainQueue_vehicleForSession:");
}

id objc_msgSend__markPurgeable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_markPurgeable:");
}

id objc_msgSend__matchingKeychainItemForIdentifier_inKeychainItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_matchingKeychainItemForIdentifier:inKeychainItems:");
}

id objc_msgSend__migrateToDrivingActivityModeIfNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_migrateToDrivingActivityModeIfNeeded");
}

id objc_msgSend__mutateAssertionsCallingDelegate_withBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_mutateAssertionsCallingDelegate:withBlock:");
}

id objc_msgSend__needsBluetoothTurnedOn(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_needsBluetoothTurnedOn");
}

id objc_msgSend__needsWiFiTurnedOn(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_needsWiFiTurnedOn");
}

id objc_msgSend__nextNightModeChangeDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_nextNightModeChangeDate");
}

id objc_msgSend__nextStepAfterResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_nextStepAfterResponse:");
}

id objc_msgSend__openFile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_openFile");
}

id objc_msgSend__outOfBandPairingDeclineCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_outOfBandPairingDeclineCount");
}

id objc_msgSend__pairWithBluetoothIdentifier_deviceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_pairWithBluetoothIdentifier:deviceName:");
}

id objc_msgSend__pairedBLEIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_pairedBLEIdentifiers");
}

id objc_msgSend__pairingCompletedForDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_pairingCompletedForDevice:");
}

id objc_msgSend__pairingDeclineCountForIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_pairingDeclineCountForIdentifier:");
}

id objc_msgSend__pairingFailedForDevice_didTimeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_pairingFailedForDevice:didTimeout:");
}

id objc_msgSend__pairingIdentifierForMessagingVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_pairingIdentifierForMessagingVehicle:");
}

id objc_msgSend__pairingIdentifierForPromptFlow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_pairingIdentifierForPromptFlow:");
}

id objc_msgSend__parseDenylistContent_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_parseDenylistContent:error:");
}

id objc_msgSend__performCARPreferencesBlock_forReading_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_performCARPreferencesBlock:forReading:");
}

id objc_msgSend__performPresentationAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_performPresentationAction:");
}

id objc_msgSend__performVibrate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_performVibrate");
}

id objc_msgSend__periperalForIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_periperalForIdentifier:");
}

id objc_msgSend__postNotificationForGeofence(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_postNotificationForGeofence");
}

id objc_msgSend__powerStateDidChange(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_powerStateDidChange");
}

id objc_msgSend__preferencesAttributesForVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_preferencesAttributesForVehicle:");
}

id objc_msgSend__prepareConnectionTTRDraftWithConnectionSession_withAdditionalDescription_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_prepareConnectionTTRDraftWithConnectionSession:withAdditionalDescription:completionHandler:");
}

id objc_msgSend__presentAllowWhileLockedPromptWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentAllowWhileLockedPromptWithCompletion:");
}

id objc_msgSend__presentApprovalIfNecessaryForMessagingVehicle_storedVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentApprovalIfNecessaryForMessagingVehicle:storedVehicle:");
}

id objc_msgSend__presentApprovalUsingAlertsForMessagingVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentApprovalUsingAlertsForMessagingVehicle:");
}

id objc_msgSend__presentAssetProgressPromptWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentAssetProgressPromptWithCompletion:");
}

id objc_msgSend__presentAssetReadyPromptWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentAssetReadyPromptWithCompletion:");
}

id objc_msgSend__presentAssetReadySoonPromptWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentAssetReadySoonPromptWithCompletion:");
}

id objc_msgSend__presentBluetoothConfirmationPromptWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentBluetoothConfirmationPromptWithCompletion:");
}

id objc_msgSend__presentBluetoothContactsSyncPromptWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentBluetoothContactsSyncPromptWithCompletion:");
}

id objc_msgSend__presentBluetoothFailedPromptWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentBluetoothFailedPromptWithCompletion:");
}

id objc_msgSend__presentCarPlaySetupForMessagingVehicle_storedVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentCarPlaySetupForMessagingVehicle:storedVehicle:");
}

id objc_msgSend__presentConnectCarPlayFromCarKeyPromptWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentConnectCarPlayFromCarKeyPromptWithCompletion:");
}

id objc_msgSend__presentConnectCarPlayPromptWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentConnectCarPlayPromptWithCompletion:");
}

id objc_msgSend__presentEnhancedIntegrationAlertForMessagingVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentEnhancedIntegrationAlertForMessagingVehicle:");
}

id objc_msgSend__presentEnhancedIntegrationPromptWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentEnhancedIntegrationPromptWithCompletion:");
}

id objc_msgSend__presentNextStepAfterResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentNextStepAfterResponse:");
}

id objc_msgSend__presentReconnectionEnableWiFiAlertForVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentReconnectionEnableWiFiAlertForVehicle:");
}

id objc_msgSend__presentSetupCarKeysWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentSetupCarKeysWithCompletion:");
}

id objc_msgSend__presentUseWirelessCarPlayPromptWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentUseWirelessCarPlayPromptWithCompletion:");
}

id objc_msgSend__presentWaitingPrompt(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentWaitingPrompt");
}

id objc_msgSend__presentWiredBluetoothPairingAlertForMessagingVehicle_storedVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentWiredBluetoothPairingAlertForMessagingVehicle:storedVehicle:");
}

id objc_msgSend__presentedReconnectionEnableWiFiAlertForVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentedReconnectionEnableWiFiAlertForVehicle:");
}

id objc_msgSend__queryForUpdatedAsset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_queryForUpdatedAsset");
}

id objc_msgSend__queue_handleFailedToSendMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_queue_handleFailedToSendMessage:");
}

id objc_msgSend__queue_popMessageForData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_queue_popMessageForData:");
}

id objc_msgSend__radarURLForDiagnosticsAndDescriptionText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_radarURLForDiagnosticsAndDescriptionText:");
}

id objc_msgSend__radarURLForDiagnosticsAtTime_didEnterRhodesGeofence_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_radarURLForDiagnosticsAtTime:didEnterRhodesGeofence:");
}

id objc_msgSend__radarURLForDiagnosticsAtTime_didStartRhodes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_radarURLForDiagnosticsAtTime:didStartRhodes:");
}

id objc_msgSend__radarURLForDiagnosticsAtTime_withEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_radarURLForDiagnosticsAtTime:withEvent:");
}

id objc_msgSend__reloadWithAsset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_reloadWithAsset:");
}

id objc_msgSend__remoteDeviceFromSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteDeviceFromSession:");
}

id objc_msgSend__removeAssetProgressForVehicleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeAssetProgressForVehicleIdentifier:");
}

id objc_msgSend__removeConnectedVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeConnectedVehicle:");
}

id objc_msgSend__removeConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeConnection:");
}

id objc_msgSend__removeKeychainPairingForVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeKeychainPairingForVehicle:");
}

id objc_msgSend__removePreferencesPairingForVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removePreferencesPairingForVehicle:");
}

id objc_msgSend__removePreferencesPairingForVehicleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removePreferencesPairingForVehicleIdentifier:");
}

id objc_msgSend__requestAssetCatalogDownload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_requestAssetCatalogDownload");
}

id objc_msgSend__requestConfirmationForDevice_numericCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_requestConfirmationForDevice:numericCode:");
}

id objc_msgSend__requestWiFiCredentialsIfNecessaryForApprovedMessagingVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_requestWiFiCredentialsIfNecessaryForApprovedMessagingVehicle:");
}

id objc_msgSend__sanitizeName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sanitizeName:");
}

id objc_msgSend__saveWiFiCredentials_forAccessoryConnectionIdentifier_result_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_saveWiFiCredentials:forAccessoryConnectionIdentifier:result:");
}

id objc_msgSend__saveWiFiCredentials_fromMessagingVehicle_forWirelessPairedVehicle_result_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_saveWiFiCredentials:fromMessagingVehicle:forWirelessPairedVehicle:result:");
}

id objc_msgSend__scheduleUserDisabledTimerWithInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_scheduleUserDisabledTimerWithInterval:");
}

id objc_msgSend__scheduleVehicleQuery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_scheduleVehicleQuery");
}

id objc_msgSend__sendCarPlayAvailabilityForMessagingVehicle_storedVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendCarPlayAvailabilityForMessagingVehicle:storedVehicle:");
}

id objc_msgSend__sendData_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendData:length:");
}

id objc_msgSend__sendDeviceIdentifiersForMessagingVehicle_pairingStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendDeviceIdentifiersForMessagingVehicle:pairingStatus:");
}

id objc_msgSend__sendFileURL_withMetadata_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendFileURL:withMetadata:completion:");
}

id objc_msgSend__servicePerform_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_servicePerform:");
}

id objc_msgSend__serviceQueue_handleChannelClosed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_serviceQueue_handleChannelClosed");
}

id objc_msgSend__setAlert_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setAlert:");
}

id objc_msgSend__setDNDActive_trigger_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setDNDActive:trigger:completion:");
}

id objc_msgSend__setDNDActive_trigger_withStartingGeofence_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setDNDActive:trigger:withStartingGeofence:completion:");
}

id objc_msgSend__setDenylistPreference_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setDenylistPreference:");
}

id objc_msgSend__setSecurityType_forNetwork_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setSecurityType:forNetwork:");
}

id objc_msgSend__setVehiclePairingStatus_forPromptFlow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setVehiclePairingStatus:forPromptFlow:");
}

id objc_msgSend__setupACCTransportClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupACCTransportClient");
}

id objc_msgSend__setupXPCEventHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupXPCEventHandler");
}

id objc_msgSend__shouldAcceptHeadUnitPairingPromptServiceConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shouldAcceptHeadUnitPairingPromptServiceConnection:");
}

id objc_msgSend__shouldAcceptPairingServiceConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shouldAcceptPairingServiceConnection:");
}

id objc_msgSend__shouldCreateGeofences(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shouldCreateGeofences");
}

id objc_msgSend__shouldPromptEnhancedIntegrationForStoredVehicle_messagingVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shouldPromptEnhancedIntegrationForStoredVehicle:messagingVehicle:");
}

id objc_msgSend__shouldScheduleTimerForNextNightModeChange(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shouldScheduleTimerForNextNightModeChange");
}

id objc_msgSend__showBulletin_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_showBulletin:");
}

id objc_msgSend__stagedAssetVersionForVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stagedAssetVersionForVehicle:");
}

id objc_msgSend__start(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_start");
}

id objc_msgSend__startListeners(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startListeners");
}

id objc_msgSend__startServiceForPeripheral_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startServiceForPeripheral:");
}

id objc_msgSend__startWaitingOnMessagingVehicleTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startWaitingOnMessagingVehicleTimer");
}

id objc_msgSend__stop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stop");
}

id objc_msgSend__stopWaitingOnMessagingVehicleTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stopWaitingOnMessagingVehicleTimer");
}

id objc_msgSend__stringForScreens_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stringForScreens:");
}

id objc_msgSend__stringForViewArea_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stringForViewArea:");
}

id objc_msgSend__supportedCarPlayFeaturesForVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_supportedCarPlayFeaturesForVehicle:");
}

id objc_msgSend__supportedCompatibilityVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_supportedCompatibilityVersion");
}

id objc_msgSend__supportsCarKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_supportsCarKeys");
}

id objc_msgSend__supportsEnhancedIntegration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_supportsEnhancedIntegration");
}

id objc_msgSend__supportsOutOfBandPairing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_supportsOutOfBandPairing");
}

id objc_msgSend__supportsThemeAssets(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_supportsThemeAssets");
}

id objc_msgSend__supportsUSB(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_supportsUSB");
}

id objc_msgSend__transitionToState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_transitionToState:");
}

id objc_msgSend__transitionToState_forEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_transitionToState:forEvent:");
}

id objc_msgSend__transitionToState_vehicularHints_operatorState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_transitionToState:vehicularHints:operatorState:");
}

id objc_msgSend__triggerModeChanged_mechanism_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_triggerModeChanged:mechanism:");
}

id objc_msgSend__updateCarKeyInformationForVehicleAccessory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateCarKeyInformationForVehicleAccessory:");
}

id objc_msgSend__updateDiscoverer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateDiscoverer");
}

id objc_msgSend__updateKeychainAttributesForVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateKeychainAttributesForVehicle:");
}

id objc_msgSend__updateNightMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateNightMode");
}

id objc_msgSend__updateUnlockedSinceBoot(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateUnlockedSinceBoot");
}

id objc_msgSend__updateWiFiDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateWiFiDevice");
}

id objc_msgSend__usbSerialNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_usbSerialNumber");
}

id objc_msgSend__uuidForNetwork_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_uuidForNetwork:");
}

id objc_msgSend__vehicleForService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_vehicleForService:");
}

id objc_msgSend__vehicleForVehicleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_vehicleForVehicleIdentifier:");
}

id objc_msgSend__vehicleSatisfiesConfiguration_propertyHits_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_vehicleSatisfiesConfiguration:propertyHits:");
}

id objc_msgSend__vehiclesForAssetRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_vehiclesForAssetRequest:");
}

id objc_msgSend__wirelessPairingAnalyticsDescriptionForMessagingVehicle_storedVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_wirelessPairingAnalyticsDescriptionForMessagingVehicle:storedVehicle:");
}

id objc_msgSend__work_queue_activeNavigationIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_work_queue_activeNavigationIdentifiers");
}

id objc_msgSend__work_queue_doWeHaveOwners(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_work_queue_doWeHaveOwners");
}

id objc_msgSend__work_queue_navigationOwnershipChangedFromCar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_work_queue_navigationOwnershipChangedFromCar");
}

id objc_msgSend__work_queue_ownersForIdentifier_pid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_work_queue_ownersForIdentifier:pid:");
}

id objc_msgSend__work_queue_removeNavigationOwner_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_work_queue_removeNavigationOwner:");
}

id objc_msgSend__work_queue_removeNavigationOwnerForConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_work_queue_removeNavigationOwnerForConnection:");
}

id objc_msgSend__work_queue_updateActiveComponents_forOwner_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_work_queue_updateActiveComponents:forOwner:");
}

id objc_msgSend__work_queue_updateNavigationStateForRemoval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_work_queue_updateNavigationStateForRemoval");
}

id objc_msgSend__work_queue_updateOwnershipToiOSIfNecessary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_work_queue_updateOwnershipToiOSIfNecessary");
}

id objc_msgSend__worker_queue_reloadSessionIfNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_worker_queue_reloadSessionIfNeeded");
}

id objc_msgSend__worker_queue_runStateMachineIfPossible(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_worker_queue_runStateMachineIfPossible");
}

id objc_msgSend__worker_queue_setSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_worker_queue_setSession:");
}

id objc_msgSend_accNavProvider(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accNavProvider");
}

id objc_msgSend_acceptSSP_forDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "acceptSSP:forDevice:");
}

id objc_msgSend_accessoryAdditionsData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryAdditionsData");
}

id objc_msgSend_accessoryContentVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryContentVersion");
}

id objc_msgSend_accessoryManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryManager");
}

id objc_msgSend_accessoryProperty_forEndpoint_connection_withReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryProperty:forEndpoint:connection:withReply:");
}

id objc_msgSend_accessoryProtocols(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryProtocols");
}

id objc_msgSend_accessoryRadarDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryRadarDescription:");
}

id objc_msgSend_accounts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accounts");
}

id objc_msgSend_actionHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionHandler");
}

id objc_msgSend_actionIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionIdentifier");
}

id objc_msgSend_actionPendingPowerOn(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionPendingPowerOn");
}

id objc_msgSend_actionWithIdentifier_title_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionWithIdentifier:title:options:");
}

id objc_msgSend_actionWithIdentifier_title_url_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionWithIdentifier:title:url:");
}

id objc_msgSend_actions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actions");
}

id objc_msgSend_activateWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateWithCompletion:");
}

id objc_msgSend_activateWithContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateWithContext:");
}

id objc_msgSend_activatedByUserAction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activatedByUserAction");
}

id objc_msgSend_activeAssertions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeAssertions");
}

id objc_msgSend_activeAssertionsDebugString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeAssertionsDebugString");
}

id objc_msgSend_activeBundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeBundleIdentifier");
}

id objc_msgSend_activeChannel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeChannel");
}

id objc_msgSend_activeComponents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeComponents");
}

id objc_msgSend_activeMessagesForDatas(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeMessagesForDatas");
}

id objc_msgSend_activeModeConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeModeConfiguration");
}

id objc_msgSend_activeModeIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeModeIdentifier");
}

id objc_msgSend_activeNavigationIdentifiersChangedTo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeNavigationIdentifiersChangedTo:");
}

id objc_msgSend_activePeripheral(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activePeripheral");
}

id objc_msgSend_activelyMonitoringGeofences(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activelyMonitoringGeofences");
}

id objc_msgSend_addAttachment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAttachment:");
}

id objc_msgSend_addAttachment_asFilename_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAttachment:asFilename:");
}

id objc_msgSend_addChild_withPendingUnitCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addChild:withPendingUnitCount:");
}

id objc_msgSend_addNotificationRequest_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addNotificationRequest:withCompletionHandler:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:");
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:forKeyPath:options:context:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addObserver_selector_name_object_suspensionBehavior_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:selector:name:object:suspensionBehavior:");
}

id objc_msgSend_addSessionObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSessionObserver:");
}

id objc_msgSend_addTextAttachment_asFilename_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addTextAttachment:asFilename:");
}

id objc_msgSend_addTimer_forMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addTimer:forMode:");
}

id objc_msgSend_additionalDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "additionalDescription");
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "address");
}

id objc_msgSend_addressStringForData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addressStringForData:");
}

id objc_msgSend_albumArtUserPreference(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "albumArtUserPreference");
}

id objc_msgSend_alertAcceptButtonTitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertAcceptButtonTitle");
}

id objc_msgSend_alertAutoDismissed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertAutoDismissed");
}

id objc_msgSend_alertDeclineButtonTitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertDeclineButtonTitle");
}

id objc_msgSend_alertDismissTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertDismissTimer");
}

id objc_msgSend_alertDismissal(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertDismissal");
}

id objc_msgSend_alertForEnteringGeofence_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertForEnteringGeofence:");
}

id objc_msgSend_alertManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertManager");
}

id objc_msgSend_alertMessage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertMessage");
}

id objc_msgSend_alertOtherButtonTitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertOtherButtonTitle");
}

id objc_msgSend_alertTitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertTitle");
}

id objc_msgSend_allEventsOfTypes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allEventsOfTypes:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allObjects");
}

id objc_msgSend_allStoredVehicles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allStoredVehicles");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allValues");
}

id objc_msgSend_allowAutomaticConnectionDurationTTR(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowAutomaticConnectionDurationTTR");
}

id objc_msgSend_allowInCar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowInCar");
}

id objc_msgSend_allowSessionDurationRecordingEvents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowSessionDurationRecordingEvents");
}

id objc_msgSend_allowUnlimitedConnectionEvents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowUnlimitedConnectionEvents");
}

id objc_msgSend_allowedAutoReplyAudienceWithReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowedAutoReplyAudienceWithReply:");
}

id objc_msgSend_almanac(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "almanac");
}

id objc_msgSend_analyticsDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "analyticsDescription");
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "anyObject");
}

id objc_msgSend_appearanceModePreference(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appearanceModePreference");
}

id objc_msgSend_appendBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendBytes:length:");
}

id objc_msgSend_appendData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendData:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendString:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayByAddingObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayByAddingObject:");
}

id objc_msgSend_arrayForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayForKey:");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithContentsOfURL:");
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_asDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "asDictionary");
}

id objc_msgSend_assertionTrap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assertionTrap");
}

id objc_msgSend_assertionTrap_didBecomeActive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assertionTrap:didBecomeActive:");
}

id objc_msgSend_assetArchiveWriter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetArchiveWriter");
}

id objc_msgSend_assetDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetDescription");
}

id objc_msgSend_assetDownloader(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetDownloader");
}

id objc_msgSend_assetDownloader_attemptingDownloadForAssetRequest_version_progress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetDownloader:attemptingDownloadForAssetRequest:version:progress:");
}

id objc_msgSend_assetDownloader_failedDownloadForAssetRequest_version_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetDownloader:failedDownloadForAssetRequest:version:error:");
}

id objc_msgSend_assetDownloader_hasAsset_forAssetRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetDownloader:hasAsset:forAssetRequest:");
}

id objc_msgSend_assetIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetIdentifier");
}

id objc_msgSend_assetProgress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetProgress");
}

id objc_msgSend_assetProgressForPairingPromptFlow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetProgressForPairingPromptFlow:");
}

id objc_msgSend_assetProgressForVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetProgressForVehicle:");
}

id objc_msgSend_assetProgressForVehicleIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetProgressForVehicleIdentifiers");
}

id objc_msgSend_assetQueryInProgress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetQueryInProgress");
}

id objc_msgSend_assetQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetQueue");
}

id objc_msgSend_assetQueue_currentlyDownloadingAssets(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetQueue_currentlyDownloadingAssets");
}

id objc_msgSend_assetQueue_queryInProgress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetQueue_queryInProgress");
}

id objc_msgSend_assetRequests(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetRequests");
}

id objc_msgSend_assetURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetURL");
}

id objc_msgSend_assetVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetVersion");
}

id objc_msgSend_assetsArchiveURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetsArchiveURL");
}

id objc_msgSend_assignCarCapabilities_valuesFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assignCarCapabilities:valuesFromDictionary:");
}

id objc_msgSend_attachProgressCallBack_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attachProgressCallBack:");
}

id objc_msgSend_attachmentURLs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attachmentURLs");
}

id objc_msgSend_attemptConnectionWithVehicles_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attemptConnectionWithVehicles:");
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributes");
}

id objc_msgSend_attributesOfItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributesOfItemAtPath:error:");
}

id objc_msgSend_authenticationSerialNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authenticationSerialNumber");
}

id objc_msgSend_automaticDNDTriggeringMethod(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "automaticDNDTriggeringMethod");
}

id objc_msgSend_availableData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "availableData");
}

id objc_msgSend_baseFolderURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "baseFolderURL");
}

id objc_msgSend_baseURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "baseURL");
}

id objc_msgSend_beginMonitoringLOIsWithStartingLocationGeofence_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginMonitoringLOIsWithStartingLocationGeofence:");
}

id objc_msgSend_beginRecordingWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginRecordingWithCompletion:");
}

id objc_msgSend_beginWiredBluetoothPairing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginWiredBluetoothPairing:");
}

id objc_msgSend_beginWiredBluetoothPairingWithVehicle_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginWiredBluetoothPairingWithVehicle:completion:");
}

id objc_msgSend_bluetoothAddress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bluetoothAddress");
}

id objc_msgSend_bluetoothConfirmed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bluetoothConfirmed");
}

id objc_msgSend_bluetoothConnectedHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bluetoothConnectedHandler");
}

id objc_msgSend_bluetoothDeviceIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bluetoothDeviceIdentifier");
}

id objc_msgSend_bluetoothFailureReason(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bluetoothFailureReason");
}

id objc_msgSend_bluetoothLEChannel_didFailToSendData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bluetoothLEChannel:didFailToSendData:");
}

id objc_msgSend_bluetoothLEChannel_didReceiveData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bluetoothLEChannel:didReceiveData:");
}

id objc_msgSend_bluetoothLEChannel_didSendData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bluetoothLEChannel:didSendData:");
}

id objc_msgSend_bluetoothLEService_didCloseChannel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bluetoothLEService:didCloseChannel:");
}

id objc_msgSend_bluetoothLEService_didOpenChannel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bluetoothLEService:didOpenChannel:");
}

id objc_msgSend_bluetoothManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bluetoothManager");
}

id objc_msgSend_bluetoothManager_completedPairingForDeviceAddress_deviceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bluetoothManager:completedPairingForDeviceAddress:deviceName:");
}

id objc_msgSend_bluetoothManager_didChangePowerState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bluetoothManager:didChangePowerState:");
}

id objc_msgSend_bluetoothManager_failedPairingForDeviceAddress_name_didTimeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bluetoothManager:failedPairingForDeviceAddress:name:didTimeout:");
}

id objc_msgSend_bluetoothManager_requestsConfirmationForDeviceAddress_name_numericCode_responseHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bluetoothManager:requestsConfirmationForDeviceAddress:name:numericCode:responseHandler:");
}

id objc_msgSend_boldTextPreference(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "boldTextPreference");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bs_filter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bs_filter:");
}

id objc_msgSend_bs_firstObjectPassingTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bs_firstObjectPassingTest:");
}

id objc_msgSend_bundlePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundlePath");
}

id objc_msgSend_bundleWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleWithPath:");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_cachedCarPlayAllowedChangeValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cachedCarPlayAllowedChangeValue");
}

id objc_msgSend_cachedVehicles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cachedVehicles");
}

id objc_msgSend_calculateAstronomicalTimeForLocation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "calculateAstronomicalTimeForLocation:");
}

id objc_msgSend_calendarUnitsOfType_fromDate_toDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "calendarUnitsOfType:fromDate:toDate:");
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancel");
}

id objc_msgSend_cancelDownloadSync(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelDownloadSync");
}

id objc_msgSend_cancelRequests(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelRequests");
}

id objc_msgSend_capabilitiesIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "capabilitiesIdentifier");
}

id objc_msgSend_carCapabilities(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "carCapabilities");
}

id objc_msgSend_carCapabilitiesURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "carCapabilitiesURL");
}

id objc_msgSend_carKeyInfoForPairingPromptFlow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "carKeyInfoForPairingPromptFlow:");
}

id objc_msgSend_carKeyPairingResult(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "carKeyPairingResult");
}

id objc_msgSend_carPlayPreferences(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "carPlayPreferences");
}

id objc_msgSend_carPlayService_didFailToSendMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "carPlayService:didFailToSendMessage:");
}

id objc_msgSend_carPlayService_didReceiveMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "carPlayService:didReceiveMessage:");
}

id objc_msgSend_carPlayService_didSendMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "carPlayService:didSendMessage:");
}

id objc_msgSend_carPlayServiceDidActivate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "carPlayServiceDidActivate:");
}

id objc_msgSend_carPlayServiceDidDeactivate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "carPlayServiceDidDeactivate:");
}

id objc_msgSend_carPlaySimulatorActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "carPlaySimulatorActive");
}

id objc_msgSend_carplayWiFiUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "carplayWiFiUUID");
}

id objc_msgSend_categoryIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "categoryIdentifier");
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "center");
}

id objc_msgSend_centralManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "centralManager");
}

id objc_msgSend_certificateData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "certificateData");
}

id objc_msgSend_certificateSerialNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "certificateSerialNumber");
}

id objc_msgSend_channel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "channel");
}

id objc_msgSend_channelDelegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "channelDelegate");
}

id objc_msgSend_channelIsOpen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "channelIsOpen");
}

id objc_msgSend_characteristics(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "characteristics");
}

id objc_msgSend_chunkCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chunkCount");
}

id objc_msgSend_chunkQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chunkQueue");
}

id objc_msgSend_chunkQueueSendSlots(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chunkQueueSendSlots");
}

id objc_msgSend_closeChannel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "closeChannel");
}

id objc_msgSend_closeFile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "closeFile");
}

id objc_msgSend_clusterAssetIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clusterAssetIdentifier");
}

id objc_msgSend_clusterAssetURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clusterAssetURL");
}

id objc_msgSend_clusterAssetVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clusterAssetVersion");
}

id objc_msgSend_clusterAssetiOSContentVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clusterAssetiOSContentVersion");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_collectDiagnosticsWithDeviceScreenshotURL_carScreenshotURL_attachmentURLs_accessoryDetails_accessoryDescription_supportsStartSession_activeBundleIdentifier_wallpaperDescription_assetDescription_loggingFileReceiver_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "collectDiagnosticsWithDeviceScreenshotURL:carScreenshotURL:attachmentURLs:accessoryDetails:accessoryDescription:supportsStartSession:activeBundleIdentifier:wallpaperDescription:assetDescription:loggingFileReceiver:completionHandler:");
}

id objc_msgSend_collectDiagnosticsWithSession_displayReason_additionalDescription_attachmentURLs_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "collectDiagnosticsWithSession:displayReason:additionalDescription:attachmentURLs:completionHandler:");
}

id objc_msgSend_colorFilterIntensityPreference(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "colorFilterIntensityPreference");
}

id objc_msgSend_colorFilterPreference(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "colorFilterPreference");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:");
}

id objc_msgSend_completedUnitCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completedUnitCount");
}

id objc_msgSend_components_fromDate_toDate_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "components:fromDate:toDate:options:");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsSeparatedByCharactersInSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByCharactersInSet:");
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configuration");
}

id objc_msgSend_confirmPairingWithBluetoothAddress_numericCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "confirmPairingWithBluetoothAddress:numericCode:");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_connect(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connect");
}

id objc_msgSend_connectDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectDevice:");
}

id objc_msgSend_connectPeripheral_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectPeripheral:options:");
}

id objc_msgSend_connectWithBluetoothAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectWithBluetoothAddress:");
}

id objc_msgSend_connectWithBluetoothLEIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectWithBluetoothLEIdentifier:");
}

id objc_msgSend_connected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connected");
}

id objc_msgSend_connectedAccessories(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectedAccessories");
}

id objc_msgSend_connectedBluetoothAddresses(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectedBluetoothAddresses");
}

id objc_msgSend_connectedDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectedDevices");
}

id objc_msgSend_connectedServicesCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectedServicesCount");
}

id objc_msgSend_connectedServicesCountForBluetoothAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectedServicesCountForBluetoothAddress:");
}

id objc_msgSend_connectedVehicleAccessories(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectedVehicleAccessories");
}

id objc_msgSend_connectedVehicles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectedVehicles");
}

id objc_msgSend_connectingDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectingDevices");
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connection");
}

id objc_msgSend_connection_isMonitoringSerial_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connection:isMonitoringSerial:");
}

id objc_msgSend_connectionTimeServiceAgent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionTimeServiceAgent");
}

id objc_msgSend_connectionTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionTimer");
}

id objc_msgSend_connectionUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionUUID");
}

id objc_msgSend_connections(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connections");
}

id objc_msgSend_connectionsQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionsQueue");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:");
}

id objc_msgSend_coordinate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "coordinate");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_coreAccessoriesEndpointUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "coreAccessoriesEndpointUUID");
}

id objc_msgSend_coreAccessoriesManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "coreAccessoriesManager");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countryCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countryCode");
}

id objc_msgSend_cr_assetVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cr_assetVersion");
}

id objc_msgSend_cr_buildVersionCompare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cr_buildVersionCompare:");
}

id objc_msgSend_cr_contentVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cr_contentVersion");
}

id objc_msgSend_cr_contentVersionSortedAssetsFromAssets_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cr_contentVersionSortedAssetsFromAssets:");
}

id objc_msgSend_cr_dictionaryWithValuesForPresentKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cr_dictionaryWithValuesForPresentKeys:");
}

id objc_msgSend_cr_highestContentVersionAssetInAssets_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cr_highestContentVersionAssetInAssets:");
}

id objc_msgSend_cr_installedAssetsInAssets_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cr_installedAssetsInAssets:");
}

id objc_msgSend_cr_numberForAttributesKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cr_numberForAttributesKey:");
}

id objc_msgSend_cr_setSafeObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cr_setSafeObject:forKey:");
}

id objc_msgSend_cr_stringForAttributesKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cr_stringForAttributesKey:");
}

id objc_msgSend_cr_themeAsset_accessoryContentVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cr_themeAsset_accessoryContentVersion");
}

id objc_msgSend_cr_themeAsset_assetIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cr_themeAsset_assetIdentifier");
}

id objc_msgSend_cr_themeAsset_filteredAssets_matchingAssetIdentifier_maximumSDKVersion_maximumCompatibilityVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cr_themeAsset_filteredAssets:matchingAssetIdentifier:maximumSDKVersion:maximumCompatibilityVersion:");
}

id objc_msgSend_cr_themeAsset_highestVersionAssetInAssets_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cr_themeAsset_highestVersionAssetInAssets:");
}

id objc_msgSend_cr_themeAsset_iOSContentVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cr_themeAsset_iOSContentVersion");
}

id objc_msgSend_cr_themeAsset_minimumCompatibilityVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cr_themeAsset_minimumCompatibilityVersion");
}

id objc_msgSend_cr_themeAsset_minimumSDKVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cr_themeAsset_minimumSDKVersion");
}

id objc_msgSend_cr_themeAsset_versionSortedAssetsFromAssets_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cr_themeAsset_versionSortedAssetsFromAssets:");
}

id objc_msgSend_createConnectionWithType_andIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createConnectionWithType:andIdentifier:");
}

id objc_msgSend_createDefaultDrivingModeConfigurationWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDefaultDrivingModeConfigurationWithError:");
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createDraft_forProcessNamed_withDisplayReason_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDraft:forProcessNamed:withDisplayReason:completionHandler:");
}

id objc_msgSend_createEndpointWithTransportType_andProtocol_andIdentifier_andDataOutHandler_forConnectionWithUUID_publishConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createEndpointWithTransportType:andProtocol:andIdentifier:andDataOutHandler:forConnectionWithUUID:publishConnection:");
}

id objc_msgSend_createFileAtPath_contents_attributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createFileAtPath:contents:attributes:");
}

id objc_msgSend_currentAcceptCompletion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentAcceptCompletion");
}

id objc_msgSend_currentBluetoothConfirmationHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentBluetoothConfirmationHandler");
}

id objc_msgSend_currentBluetoothPairingCompletion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentBluetoothPairingCompletion");
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentCalendar");
}

id objc_msgSend_currentChunkIndex(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentChunkIndex");
}

id objc_msgSend_currentCompletion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentCompletion");
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentConnection");
}

id objc_msgSend_currentConnectionCompletion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentConnectionCompletion");
}

id objc_msgSend_currentConnectionState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentConnectionState");
}

id objc_msgSend_currentDiagnosticsData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentDiagnosticsData");
}

id objc_msgSend_currentErrorHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentErrorHandler");
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentLocale");
}

id objc_msgSend_currentLocation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentLocation");
}

id objc_msgSend_currentLoggingFileReceiver(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentLoggingFileReceiver");
}

id objc_msgSend_currentPairingSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentPairingSession");
}

id objc_msgSend_currentPresenterSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentPresenterSession");
}

id objc_msgSend_currentPromptFlowController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentPromptFlowController");
}

id objc_msgSend_currentPromptSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentPromptSession");
}

id objc_msgSend_currentSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentSession");
}

id objc_msgSend_currentSessionTransferStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentSessionTransferStatus");
}

id objc_msgSend_currentStep(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentStep");
}

id objc_msgSend_currentlyInRegion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentlyInRegion");
}

id objc_msgSend_dashboardRoundedCorners(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dashboardRoundedCorners");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "data");
}

id objc_msgSend_dataForMessageWithIdentifier_contents_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataForMessageWithIdentifier:contents:error:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dateByAddingUnit_value_toDate_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateByAddingUnit:value:toDate:options:");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "day");
}

id objc_msgSend_declineType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "declineType");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaultUserInterfaceStyle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultUserInterfaceStyle");
}

id objc_msgSend_defaultValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultValue");
}

id objc_msgSend_delayedTasks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delayedTasks");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_descriptionForAvailableInteractionModels(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "descriptionForAvailableInteractionModels");
}

id objc_msgSend_descriptionForCapability_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "descriptionForCapability:");
}

id objc_msgSend_descriptionForEdgeInsets_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "descriptionForEdgeInsets:");
}

id objc_msgSend_descriptionForLimitableUserInterfaces(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "descriptionForLimitableUserInterfaces");
}

id objc_msgSend_descriptionForPrimaryInteractionModel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "descriptionForPrimaryInteractionModel");
}

id objc_msgSend_descriptionForTransportType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "descriptionForTransportType");
}

id objc_msgSend_descriptionForUserInterfaceStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "descriptionForUserInterfaceStyle:");
}

id objc_msgSend_destroyConnectionWithUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "destroyConnectionWithUUID:");
}

id objc_msgSend_destroyEndpointWithUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "destroyEndpointWithUUID:");
}

id objc_msgSend_deviceFromAddressString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceFromAddressString:");
}

id objc_msgSend_deviceID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceID");
}

id objc_msgSend_deviceId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceId");
}

id objc_msgSend_deviceIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceIdentifier");
}

id objc_msgSend_deviceSupportedCarPlayFeatures(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceSupportedCarPlayFeatures");
}

id objc_msgSend_diagnosticsSerialQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diagnosticsSerialQueue");
}

id objc_msgSend_dictationAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictationAvailable");
}

id objc_msgSend_dictationConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictationConnection");
}

id objc_msgSend_dictationEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictationEnabled");
}

id objc_msgSend_dictationEnabledInKeyboardSettings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictationEnabledInKeyboardSettings");
}

id objc_msgSend_dictationIsAvailableForLanguage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictationIsAvailableForLanguage:");
}

id objc_msgSend_dictationIsEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictationIsEnabled");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryRepresentation");
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_dictionaryWithContentsOfURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithContentsOfURL:error:");
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

id objc_msgSend_didCompletePairingPromptFlow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didCompletePairingPromptFlow:");
}

id objc_msgSend_didCreateGeofenceAroundStart(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didCreateGeofenceAroundStart");
}

id objc_msgSend_didFailToHeadUnitPairWithBluetoothAddress_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didFailToHeadUnitPairWithBluetoothAddress:error:");
}

id objc_msgSend_didHeadUnitPairWithBluetoothAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didHeadUnitPairWithBluetoothAddress:");
}

id objc_msgSend_didUpdateActiveComponents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didUpdateActiveComponents:");
}

id objc_msgSend_digitalCarKeyInformation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "digitalCarKeyInformation");
}

id objc_msgSend_disableTimerTimestamp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disableTimerTimestamp");
}

id objc_msgSend_disabledFeature(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disabledFeature");
}

id objc_msgSend_disabledFeaturesPreference(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disabledFeaturesPreference");
}

id objc_msgSend_disablesCarPlayFeatures_forVehicleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disablesCarPlayFeatures:forVehicleIdentifier:");
}

id objc_msgSend_discoverCharacteristics_forService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "discoverCharacteristics:forService:");
}

id objc_msgSend_discoverServices_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "discoverServices:");
}

id objc_msgSend_discoveredPSMCharacteristic(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "discoveredPSMCharacteristic");
}

id objc_msgSend_discoveredService(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "discoveredService");
}

id objc_msgSend_dismissAlert(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissAlert");
}

id objc_msgSend_dismissAlert_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissAlert:");
}

id objc_msgSend_dismissAlertsOfClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissAlertsOfClass:");
}

id objc_msgSend_dismissHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissHandler");
}

id objc_msgSend_dismissOnUnlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissOnUnlock");
}

id objc_msgSend_dismissPromptPresenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissPromptPresenter");
}

id objc_msgSend_dispatchEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dispatchEvent:");
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayName");
}

id objc_msgSend_displayThemeData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayThemeData");
}

id objc_msgSend_displaysTransitionControl(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displaysTransitionControl");
}

id objc_msgSend_distanceFromLocation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "distanceFromLocation:");
}

id objc_msgSend_doesNotRecognizeSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doesNotRecognizeSelector:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_downloadObserver(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadObserver");
}

id objc_msgSend_driveStartTimeInterval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "driveStartTimeInterval");
}

id objc_msgSend_drivingStream(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "drivingStream");
}

id objc_msgSend_earlierDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "earlierDate:");
}

id objc_msgSend_electronicTollCollectionAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "electronicTollCollectionAvailable");
}

id objc_msgSend_endpointIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endpointIdentifier");
}

id objc_msgSend_endpointUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endpointUUID");
}

id objc_msgSend_enhancedIntegrationStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enhancedIntegrationStatus");
}

id objc_msgSend_enhancedIntegrationSupportedForPairingPromptFlow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enhancedIntegrationSupportedForPairingPromptFlow:");
}

id objc_msgSend_enterState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enterState");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumerateStoredVehiclesForMessagingVehicles_usingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateStoredVehiclesForMessagingVehicles:usingBlock:");
}

id objc_msgSend_eraseConnectionData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eraseConnectionData");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "error");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_eventBody(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventBody");
}

id objc_msgSend_eventDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventDate");
}

id objc_msgSend_eventName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventName");
}

id objc_msgSend_eventType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventType");
}

id objc_msgSend_eventWithName_type_date_payload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventWithName:type:date:payload:");
}

id objc_msgSend_events(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "events");
}

id objc_msgSend_exitConfirmationOverride(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exitConfirmationOverride");
}

id objc_msgSend_exportedObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exportedObject");
}

id objc_msgSend_featuresAvailabilityAgent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "featuresAvailabilityAgent");
}

id objc_msgSend_fetchAllVehiclesWithReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchAllVehiclesWithReply:");
}

id objc_msgSend_fetchCarCapabilities(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchCarCapabilities");
}

id objc_msgSend_fetchConnectionSessions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchConnectionSessions:");
}

id objc_msgSend_fetchLocationsOfInterestOfType_withHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchLocationsOfInterestOfType:withHandler:");
}

id objc_msgSend_fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_withHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchNextPredictedLocationsOfInterestFromLocation:startDate:timeInterval:withHandler:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileHandle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileHandle");
}

id objc_msgSend_fileHandleForReading(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileHandleForReading");
}

id objc_msgSend_fileHandleForReadingFromURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileHandleForReadingFromURL:error:");
}

id objc_msgSend_fileHandleForWritingToURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileHandleForWritingToURL:error:");
}

id objc_msgSend_fileQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileQueue");
}

id objc_msgSend_fileReceiver(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileReceiver");
}

id objc_msgSend_fileReceiver_didReceiveStatistics_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileReceiver:didReceiveStatistics:");
}

id objc_msgSend_fileReceiver_didSaveThemeAssetOfVersion_atURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileReceiver:didSaveThemeAssetOfVersion:atURL:");
}

id objc_msgSend_fileReceiver_urlForSavingThemeAssetOfVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileReceiver:urlForSavingThemeAssetOfVersion:");
}

id objc_msgSend_fileReceiverSession_didSaveLogsAtURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileReceiverSession:didSaveLogsAtURL:");
}

id objc_msgSend_fileSenderSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSenderSession");
}

id objc_msgSend_fileURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURL");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:isDirectory:");
}

id objc_msgSend_filterWithKeyPath_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filterWithKeyPath:value:");
}

id objc_msgSend_filteredArrayUsingPredicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filteredArrayUsingPredicate:");
}

id objc_msgSend_filteredSetUsingPredicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filteredSetUsingPredicate:");
}

id objc_msgSend_finishedWelcome(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishedWelcome");
}

id objc_msgSend_firmwareRevision(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firmwareRevision");
}

id objc_msgSend_firstNetworkPassingTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstNetworkPassingTest:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_focusModeDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "focusModeDescription");
}

id objc_msgSend_fractionCompleted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fractionCompleted");
}

id objc_msgSend_geofencingObserver(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "geofencingObserver");
}

id objc_msgSend_geofencingObserver_didUpdateRegionState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "geofencingObserver:didUpdateRegionState:");
}

id objc_msgSend_getBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBytes:length:");
}

id objc_msgSend_getBytes_range_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBytes:range:");
}

id objc_msgSend_getCarPlaySilentModePreference(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCarPlaySilentModePreference");
}

id objc_msgSend_getLocalFileUrl(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getLocalFileUrl");
}

id objc_msgSend_getResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getResourceValue:forKey:error:");
}

id objc_msgSend_handleAnyMessagingConnectionsToVehicles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleAnyMessagingConnectionsToVehicles");
}

id objc_msgSend_handleAvailabilityEvent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleAvailabilityEvent");
}

id objc_msgSend_handleBluetoothPairingConfirmationRequestForDeviceIdentifier_vehicleName_numericCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleBluetoothPairingConfirmationRequestForDeviceIdentifier:vehicleName:numericCode:");
}

id objc_msgSend_handleBluetoothPairingFailedForDeviceIdentifier_vehicleName_isTimeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleBluetoothPairingFailedForDeviceIdentifier:vehicleName:isTimeout:");
}

id objc_msgSend_handleBluetoothPairingStartedForDeviceIdentifier_showBluetoothOnlyOption_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleBluetoothPairingStartedForDeviceIdentifier:showBluetoothOnlyOption:");
}

id objc_msgSend_handleCarKeyInitiatedConfirmationForDeviceAddress_showBluetoothOnlyOption_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleCarKeyInitiatedConfirmationForDeviceAddress:showBluetoothOnlyOption:");
}

id objc_msgSend_handleCarKeyInitiatedPairingFailed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleCarKeyInitiatedPairingFailed");
}

id objc_msgSend_handleConnectedMessagingVehicle_pairingAccepted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleConnectedMessagingVehicle:pairingAccepted:");
}

id objc_msgSend_handleDidConnectMessagingToVehicles_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleDidConnectMessagingToVehicles:");
}

id objc_msgSend_handleDisconnectedMessagingVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleDisconnectedMessagingVehicle:");
}

id objc_msgSend_handleDownloadHintForAssetRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleDownloadHintForAssetRequest:");
}

id objc_msgSend_handleEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleEvent:");
}

id objc_msgSend_handleHeadUnitPairingPromptSession_receivedResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleHeadUnitPairingPromptSession:receivedResponse:");
}

id objc_msgSend_handlePairingPromptResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handlePairingPromptResponse:");
}

id objc_msgSend_handleReceivedData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleReceivedData:");
}

id objc_msgSend_handleUnsupportedMessagingConnectionForDeviceIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleUnsupportedMessagingConnectionForDeviceIdentifier:");
}

id objc_msgSend_handleUpdatedVehicle_enabled_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleUpdatedVehicle:enabled:completion:");
}

id objc_msgSend_handler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handler");
}

id objc_msgSend_hardwareRevision(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hardwareRevision");
}

id objc_msgSend_hasAccessory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasAccessory");
}

id objc_msgSend_hasAdjustedTriggerMethod(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasAdjustedTriggerMethod");
}

id objc_msgSend_hasAllChunks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasAllChunks");
}

id objc_msgSend_hasAssertion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasAssertion:");
}

id objc_msgSend_hasCredentialsForCarPlayUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasCredentialsForCarPlayUUID:");
}

id objc_msgSend_hasExistingBluetoothPairingForPairingPromptFlow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasExistingBluetoothPairingForPairingPromptFlow:");
}

id objc_msgSend_hasGaugeClusterScreen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasGaugeClusterScreen");
}

id objc_msgSend_hasMigratedToDriving(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasMigratedToDriving");
}

id objc_msgSend_hasPairingSupportingCarPlayWithAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPairingSupportingCarPlayWithAddress:");
}

id objc_msgSend_hasPairingWithAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPairingWithAddress:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hash");
}

id objc_msgSend_headUnitPairingDelegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "headUnitPairingDelegate");
}

id objc_msgSend_headUnitPairingPresenter_didCompletePairingFlow_forBluetoothAddress_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "headUnitPairingPresenter:didCompletePairingFlow:forBluetoothAddress:error:");
}

id objc_msgSend_headUnitPairingPresenter_didReceiveUserConfirmation_forBluetoothAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "headUnitPairingPresenter:didReceiveUserConfirmation:forBluetoothAddress:");
}

id objc_msgSend_horizontalAccuracy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "horizontalAccuracy");
}

id objc_msgSend_hostname(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hostname");
}

id objc_msgSend_iOSContentVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iOSContentVersion");
}

id objc_msgSend_iconImagePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iconImagePath");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_identifiersToDiscover(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifiersToDiscover");
}

id objc_msgSend_idleExitTransaction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "idleExitTransaction");
}

id objc_msgSend_illegalCharacterSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "illegalCharacterSet");
}

id objc_msgSend_incrementOutOfBandPairingDeclineCountForPairingPromptFlow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "incrementOutOfBandPairingDeclineCountForPairingPromptFlow:");
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_indexOfObjectPassingTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexOfObjectPassingTest:");
}

id objc_msgSend_indexSetWithIndexesInRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexSetWithIndexesInRange:");
}

id objc_msgSend_indexesOfObjectsPassingTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexesOfObjectsPassingTest:");
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "infoDictionary");
}

id objc_msgSend_infoResponse(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "infoResponse");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "init");
}

id objc_msgSend_initFromBluetoothIdentifier_service_identificationMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initFromBluetoothIdentifier:service:identificationMessage:");
}

id objc_msgSend_initWithAssetIdentifier_maximumSDKVersion_maximumCompatibilityVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAssetIdentifier:maximumSDKVersion:maximumCompatibilityVersion:");
}

id objc_msgSend_initWithAssetURL_version_chunkCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAssetURL:version:chunkCount:");
}

id objc_msgSend_initWithBaseURL_version_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBaseURL:version:");
}

id objc_msgSend_initWithBluetoothManager_preferences_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBluetoothManager:preferences:");
}

id objc_msgSend_initWithBluetoothManager_preferences_vehicleStore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBluetoothManager:preferences:vehicleStore:");
}

id objc_msgSend_initWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleIdentifier:");
}

id objc_msgSend_initWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBytes:length:");
}

id objc_msgSend_initWithCenter_radius_identifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCenter:radius:identifier:");
}

id objc_msgSend_initWithChannel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithChannel:");
}

id objc_msgSend_initWithChannel_isPriority_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithChannel:isPriority:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDelegate:");
}

id objc_msgSend_initWithDelegate_queue_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDelegate:queue:options:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithDictionaryRepresentation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDictionaryRepresentation:");
}

id objc_msgSend_initWithDisplayName_authenticationCertificateSerial_pairedVehicleIdentifier_wiFiUUID_bleStartSessionMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDisplayName:authenticationCertificateSerial:pairedVehicleIdentifier:wiFiUUID:bleStartSessionMessage:");
}

id objc_msgSend_initWithDisplayName_modelName_PPID_authenticationSerialNumber_accessoryProtocols_supportsWiredCarPlay_supportsWiredToWirelessPairing_supportsEnhancedIntegration_supportsThemeAssets_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDisplayName:modelName:PPID:authenticationSerialNumber:accessoryProtocols:supportsWiredCarPlay:supportsWiredToWirelessPairing:supportsEnhancedIntegration:supportsThemeAssets:");
}

id objc_msgSend_initWithDisplayName_wiredIPv6Addresses_wirelessIPv6Addresses_port_carplayWiFiUUID_deviceIdentifier_publicKey_sourceVersion_supportsMutualAuthentication_authenticationCertificateSerial_pairedVehicleIdentifier_wiredCarPlaySimulator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDisplayName:wiredIPv6Addresses:wirelessIPv6Addresses:port:carplayWiFiUUID:deviceIdentifier:publicKey:sourceVersion:supportsMutualAuthentication:authenticationCertificateSerial:pairedVehicleIdentifier:wiredCarPlaySimulator:");
}

id objc_msgSend_initWithEffectiveBundle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEffectiveBundle:");
}

id objc_msgSend_initWithEffectiveBundle_delegate_onQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEffectiveBundle:delegate:onQueue:");
}

id objc_msgSend_initWithEvents_sessionIdentifier_vehicleInformation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEvents:sessionIdentifier:vehicleInformation:");
}

id objc_msgSend_initWithFileURL_chunkCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFileURL:chunkCount:");
}

id objc_msgSend_initWithHostProperties_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithHostProperties:");
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIdentifier:");
}

id objc_msgSend_initWithIdentifier_certificateSerial_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIdentifier:certificateSerial:");
}

id objc_msgSend_initWithIdentifier_iOSContentVersion_accessoryContentVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIdentifier:iOSContentVersion:accessoryContentVersion:");
}

id objc_msgSend_initWithIdentifier_targetQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIdentifier:targetQueue:");
}

id objc_msgSend_initWithLibraryAgent_vehicleStore_sessionStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLibraryAgent:vehicleStore:sessionStatus:");
}

id objc_msgSend_initWithLocationManager_sleepInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLocationManager:sleepInterval:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithMessagingVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMessagingVehicle:");
}

id objc_msgSend_initWithName_parent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:parent:");
}

id objc_msgSend_initWithName_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:userInfo:");
}

id objc_msgSend_initWithName_version_identifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:version:identifier:");
}

id objc_msgSend_initWithNotificationCenter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithNotificationCenter:");
}

id objc_msgSend_initWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithObjectsAndKeys:");
}

id objc_msgSend_initWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithOptions:");
}

id objc_msgSend_initWithParent_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithParent:userInfo:");
}

id objc_msgSend_initWithPeripheral_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPeripheral:");
}

id objc_msgSend_initWithPeripheral_serviceUUID_psmCharacteristicUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPeripheral:serviceUUID:psmCharacteristicUUID:");
}

id objc_msgSend_initWithPreferences_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPreferences:");
}

id objc_msgSend_initWithPreferencesManager_vehicleStore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPreferencesManager:vehicleStore:");
}

id objc_msgSend_initWithProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithProtocol:");
}

id objc_msgSend_initWithRadiosPreferences_vehicleStateClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRadiosPreferences:vehicleStateClass:");
}

id objc_msgSend_initWithRoutineManager_locationManager_wiFiManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRoutineManager:locationManager:wiFiManager:");
}

id objc_msgSend_initWithSSID_passphrase_channel_securityType_wirelessIPs_wiredIPs_port_deviceID_publicKey_sourceVersion_sdkVersion_assetIdentifier_assetVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSSID:passphrase:channel:securityType:wirelessIPs:wiredIPs:port:deviceID:publicKey:sourceVersion:sdkVersion:assetIdentifier:assetVersion:");
}

id objc_msgSend_initWithService_channel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithService:channel:");
}

id objc_msgSend_initWithServiceName_viewControllerClassName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithServiceName:viewControllerClassName:");
}

id objc_msgSend_initWithSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSession:");
}

id objc_msgSend_initWithSession_channelType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSession:channelType:");
}

id objc_msgSend_initWithSessionStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSessionStatus:");
}

id objc_msgSend_initWithSessionStatus_connectionTimeServiceAgent_messagingConnector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSessionStatus:connectionTimeServiceAgent:messagingConnector:");
}

id objc_msgSend_initWithSet_copyItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSet:copyItems:");
}

id objc_msgSend_initWithStarting_reason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStarting:reason:");
}

id objc_msgSend_initWithText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithText:");
}

id objc_msgSend_initWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_initWithTitle_message_destinations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTitle:message:destinations:");
}

id objc_msgSend_initWithType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithType:");
}

id objc_msgSend_initWithURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithURL:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_initWithUserDefaults_sessionStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUserDefaults:sessionStatus:");
}

id objc_msgSend_initWithVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithVehicle:");
}

id objc_msgSend_initWithVehicleState_alertManager_preferences_carSessionStatus_geoFencingObserver_assertionTrap_vehicleStore_stateService_modeConfigurationService_drivingStream_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithVehicleState:alertManager:preferences:carSessionStatus:geoFencingObserver:assertionTrap:vehicleStore:stateService:modeConfigurationService:drivingStream:");
}

id objc_msgSend_initWithVehicleStore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithVehicleStore:");
}

id objc_msgSend_initWithVehicleStore_sessionStatus_bluetoothManager_preferences_connectionTimeServiceAgent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithVehicleStore:sessionStatus:bluetoothManager:preferences:connectionTimeServiceAgent:");
}

id objc_msgSend_initWithVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithVersion:");
}

id objc_msgSend_initWithWirelessAvailable_wiredAvailable_usbIdentifier_themeAssetsAvailable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithWirelessAvailable:wiredAvailable:usbIdentifier:themeAssetsAvailable:");
}

id objc_msgSend_initialTimerLocation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initialTimerLocation");
}

id objc_msgSend_initializeStateMachine(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initializeStateMachine");
}

id objc_msgSend_inputStream(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputStream");
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertObject:atIndex:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerForKey:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_intent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intent");
}

id objc_msgSend_interfaceStyle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceStyle");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_internalNotes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "internalNotes");
}

id objc_msgSend_internalQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "internalQueue");
}

id objc_msgSend_internalQueueOutstandingSendCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "internalQueueOutstandingSendCount");
}

id objc_msgSend_internalSettingsState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "internalSettingsState");
}

id objc_msgSend_internalSettingsValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "internalSettingsValue");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isActive");
}

id objc_msgSend_isAutomaticDNDInternalExitConfirmationOverrideEnabledPreference(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAutomaticDNDInternalExitConfirmationOverrideEnabledPreference");
}

id objc_msgSend_isAutomaticDNDInternalForceOverrideEnabledPreference(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAutomaticDNDInternalForceOverrideEnabledPreference");
}

id objc_msgSend_isAutomaticDNDInternalShowGeofencingAlertsEnabledPreference(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAutomaticDNDInternalShowGeofencingAlertsEnabledPreference");
}

id objc_msgSend_isAutomaticDNDInternalShowUserAlertsEnabledPreference(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAutomaticDNDInternalShowUserAlertsEnabledPreference");
}

id objc_msgSend_isCAFToolTreeCompletionCalled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCAFToolTreeCompletionCalled");
}

id objc_msgSend_isCCCHeadUnitPairingOverrideEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCCCHeadUnitPairingOverrideEnabled");
}

id objc_msgSend_isCarPlayAllowed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCarPlayAllowed");
}

id objc_msgSend_isCarPlaySetupEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCarPlaySetupEnabled");
}

id objc_msgSend_isCarPlayThemeSupportEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCarPlayThemeSupportEnabled");
}

id objc_msgSend_isCatalogFetchedWithinThePastFewDays_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCatalogFetchedWithinThePastFewDays:");
}

id objc_msgSend_isConnectedToSystem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isConnectedToSystem");
}

id objc_msgSend_isCurrentlyDriving(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCurrentlyDriving");
}

id objc_msgSend_isCurrentlyInGeofencedRegion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCurrentlyInGeofencedRegion");
}

id objc_msgSend_isCurrentlyInsideGeofence(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCurrentlyInsideGeofence");
}

id objc_msgSend_isDNDActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDNDActive");
}

id objc_msgSend_isDNDValid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDNDValid");
}

id objc_msgSend_isDayLight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDayLight");
}

id objc_msgSend_isDeviceSilentModeOn(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDeviceSilentModeOn");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToData:");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToOwner_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToOwner:");
}

id objc_msgSend_isEqualToSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToSet:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isEqualToThemeAssetVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToThemeAssetVersion:");
}

id objc_msgSend_isFinished(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFinished");
}

id objc_msgSend_isInAirplaneMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInAirplaneMode");
}

id objc_msgSend_isInLostMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInLostMode");
}

id objc_msgSend_isManagedLostModeActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isManagedLostModeActive");
}

id objc_msgSend_isMapsActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMapsActive");
}

id objc_msgSend_isOpen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isOpen");
}

id objc_msgSend_isPaired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPaired");
}

id objc_msgSend_isPairingAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPairingAvailable");
}

id objc_msgSend_isPowered(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPowered");
}

id objc_msgSend_isPriority(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPriority");
}

id objc_msgSend_isReady(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isReady");
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRunning");
}

id objc_msgSend_isServiceSupported_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isServiceSupported:");
}

id objc_msgSend_isSiriBargeInDisabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSiriBargeInDisabled");
}

id objc_msgSend_isSubsetOfSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSubsetOfSet:");
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isValid");
}

id objc_msgSend_isVehicleStoreAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isVehicleStoreAvailable");
}

id objc_msgSend_keyIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyIdentifier");
}

id objc_msgSend_lastConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastConfiguration");
}

id objc_msgSend_lastConnectedDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastConnectedDate");
}

id objc_msgSend_lastFetchDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastFetchDate");
}

id objc_msgSend_lastKnownReportTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastKnownReportTime");
}

id objc_msgSend_lastKnownVehicularHints(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastKnownVehicularHints");
}

id objc_msgSend_lastKnownVehicularState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastKnownVehicularState");
}

id objc_msgSend_lastLookupIdentifer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastLookupIdentifer");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastObject");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_lastSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastSession");
}

id objc_msgSend_lastStartSessionDeviceID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastStartSessionDeviceID");
}

id objc_msgSend_latestInterfaceStyle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "latestInterfaceStyle");
}

id objc_msgSend_latitude(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "latitude");
}

id objc_msgSend_launch(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "launch");
}

id objc_msgSend_launchCarPlaySetupWithUserInfo_errorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "launchCarPlaySetupWithUserInfo:errorHandler:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_libraryAgent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "libraryAgent");
}

id objc_msgSend_limitUserInterfaces(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "limitUserInterfaces");
}

id objc_msgSend_localOOBDataHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localOOBDataHandler");
}

id objc_msgSend_localizedCaseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedCaseInsensitiveCompare:");
}

id objc_msgSend_localizedCaseInsensitiveContainsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedCaseInsensitiveContainsString:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "location");
}

id objc_msgSend_locationDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "locationDescription");
}

id objc_msgSend_locationManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "locationManager");
}

id objc_msgSend_locationOfInterest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "locationOfInterest");
}

id objc_msgSend_locationServicesEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "locationServicesEnabled");
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lock");
}

id objc_msgSend_lock_lockdownConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lock_lockdownConnection");
}

id objc_msgSend_lock_session(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lock_session");
}

id objc_msgSend_lockdownQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lockdownQueue");
}

id objc_msgSend_lockdownSource(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lockdownSource");
}

id objc_msgSend_lockscreenAlert(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lockscreenAlert");
}

id objc_msgSend_lockscreenMessage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lockscreenMessage");
}

id objc_msgSend_lockscreenTitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lockscreenTitle");
}

id objc_msgSend_logArchiveReceiver(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logArchiveReceiver");
}

id objc_msgSend_logArchiveWritersForSessionIDs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logArchiveWritersForSessionIDs");
}

id objc_msgSend_loggingChannelManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loggingChannelManager");
}

id objc_msgSend_loggingFileReceiver(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loggingFileReceiver");
}

id objc_msgSend_longitude(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longitude");
}

id objc_msgSend_lookupCarcapabilitiesForSession_plistURL_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lookupCarcapabilitiesForSession:plistURL:completionHandler:");
}

id objc_msgSend_lookupCompletionHandlers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lookupCompletionHandlers");
}

id objc_msgSend_lostModeIsActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lostModeIsActive");
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lowercaseString");
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainRunLoop");
}

id objc_msgSend_makeDiagnosticsFolderForTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeDiagnosticsFolderForTime:");
}

id objc_msgSend_manufacturer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "manufacturer");
}

id objc_msgSend_manufacturerIconLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "manufacturerIconLabel");
}

id objc_msgSend_manufacturerIconVisible(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "manufacturerIconVisible");
}

id objc_msgSend_manufacturerName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "manufacturerName");
}

id objc_msgSend_mapsAppearancePreference(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mapsAppearancePreference");
}

id objc_msgSend_matchDeviceSilentModeToCarPlaySilentModeWithReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "matchDeviceSilentModeToCarPlaySilentModeWithReason:");
}

id objc_msgSend_maxFramesPerSecond(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maxFramesPerSecond");
}

id objc_msgSend_maximumCompatibilityVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maximumCompatibilityVersion");
}

id objc_msgSend_maximumConcurrentNavigationOwners(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maximumConcurrentNavigationOwners");
}

id objc_msgSend_maximumSDKVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maximumSDKVersion");
}

id objc_msgSend_mergeAttributesFromVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mergeAttributesFromVehicle:");
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "message");
}

id objc_msgSend_messageClassesForIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "messageClassesForIdentifiers");
}

id objc_msgSend_messageReceiver(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "messageReceiver");
}

id objc_msgSend_messagingConnector(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "messagingConnector");
}

id objc_msgSend_messagingVehicle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "messagingVehicle");
}

id objc_msgSend_minute(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minute");
}

id objc_msgSend_mode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mode");
}

id objc_msgSend_modeConfigurationForModeIdentifier_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modeConfigurationForModeIdentifier:error:");
}

id objc_msgSend_modeIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modeIdentifier");
}

id objc_msgSend_modelName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modelName");
}

id objc_msgSend_modelNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modelNumber");
}

id objc_msgSend_monitoredRegions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "monitoredRegions");
}

id objc_msgSend_monitoringService(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "monitoringService");
}

id objc_msgSend_mostRecentTriggerMethodChange(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mostRecentTriggerMethodChange");
}

id objc_msgSend_mostRecentVehicleConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mostRecentVehicleConnection");
}

id objc_msgSend_moveItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moveItemAtURL:toURL:error:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_muteStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "muteStatus");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_navigationOwner(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "navigationOwner");
}

id objc_msgSend_navigationOwnershipChangedTo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "navigationOwnershipChangedTo:");
}

id objc_msgSend_navigationOwnershipEndedWithMaximumConcurrentCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "navigationOwnershipEndedWithMaximumConcurrentCount:");
}

id objc_msgSend_needsBluetoothTurnedOnForPairingPromptFlow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "needsBluetoothTurnedOnForPairingPromptFlow:");
}

id objc_msgSend_needsWiFiTurnedOnForPairingPromptFlow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "needsWiFiTurnedOnForPairingPromptFlow:");
}

id objc_msgSend_networkForCarPlayUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "networkForCarPlayUUID:");
}

id objc_msgSend_networkForSSID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "networkForSSID:");
}

id objc_msgSend_newHandleWithDefinition_configurationContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newHandleWithDefinition:configurationContext:");
}

id objc_msgSend_nextMetadataKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextMetadataKey");
}

id objc_msgSend_nextNightModeChangeTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextNightModeChangeTimer");
}

id objc_msgSend_nextSessionOverrideAirPlayFeatureStrings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextSessionOverrideAirPlayFeatureStrings");
}

id objc_msgSend_nextSunrise(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextSunrise");
}

id objc_msgSend_nextSunset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextSunset");
}

id objc_msgSend_nightMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nightMode");
}

id objc_msgSend_nightModeSupported(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nightModeSupported");
}

id objc_msgSend_notification(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notification");
}

id objc_msgSend_notificationCategory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notificationCategory");
}

id objc_msgSend_notificationCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notificationCenter");
}

id objc_msgSend_notificationRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notificationRequest");
}

id objc_msgSend_notifyAttemptingDownloadForAssetVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyAttemptingDownloadForAssetVersion:");
}

id objc_msgSend_notifyCompletedDownloadOfAsset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyCompletedDownloadOfAsset:");
}

id objc_msgSend_notifyDidUpdateFromAsset_toAsset_forVehicleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyDidUpdateFromAsset:toAsset:forVehicleIdentifier:");
}

id objc_msgSend_notifyFailedDownloadForAssetVersion_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyFailedDownloadForAssetVersion:error:");
}

id objc_msgSend_notifydEventName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifydEventName");
}

id objc_msgSend_nowPlayingAlbumArt(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nowPlayingAlbumArt");
}

id objc_msgSend_nowPlayingAlbumArtMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nowPlayingAlbumArtMode");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
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

id objc_msgSend_numberWithUnsignedShort_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedShort:");
}

id objc_msgSend_numericCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numericCode");
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "object");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
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

id objc_msgSend_objectsAtIndexes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectsAtIndexes:");
}

id objc_msgSend_objectsPassingTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectsPassingTest:");
}

id objc_msgSend_observers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "observers");
}

id objc_msgSend_observesVehicularReports(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "observesVehicularReports");
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "open");
}

id objc_msgSend_openChannel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openChannel");
}

id objc_msgSend_openL2CAPChannel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openL2CAPChannel:");
}

id objc_msgSend_outOfBandPairingDeclineCountForPairingPromptFlow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outOfBandPairingDeclineCountForPairingPromptFlow:");
}

id objc_msgSend_outputStream(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outputStream");
}

id objc_msgSend_outstandingApprovalAlerts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outstandingApprovalAlerts");
}

id objc_msgSend_outstandingEnableWiFiAlerts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outstandingEnableWiFiAlerts");
}

id objc_msgSend_outstandingEnhancedIntegrationAlerts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outstandingEnhancedIntegrationAlerts");
}

id objc_msgSend_outstandingPairingAlerts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outstandingPairingAlerts");
}

id objc_msgSend_owners(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "owners");
}

id objc_msgSend_pairPeer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairPeer:");
}

id objc_msgSend_pairWithBluetoothAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairWithBluetoothAddress:");
}

id objc_msgSend_pairWithBluetoothLEIdentifier_deviceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairWithBluetoothLEIdentifier:deviceName:");
}

id objc_msgSend_pairedDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairedDevices");
}

id objc_msgSend_pairedVehiclesConnectedOnBluetooth(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairedVehiclesConnectedOnBluetooth");
}

id objc_msgSend_pairingAccepted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairingAccepted");
}

id objc_msgSend_pairingDelegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairingDelegate");
}

id objc_msgSend_pairingPeripheralIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairingPeripheralIdentifier");
}

id objc_msgSend_pairingPeripheralName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairingPeripheralName");
}

id objc_msgSend_pairingPromptCompletion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairingPromptCompletion");
}

id objc_msgSend_pairingPromptFlow_didCancelWithRequiredStepsRemaining_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairingPromptFlow:didCancelWithRequiredStepsRemaining:");
}

id objc_msgSend_pairingPromptFlow_receivedAllowWhileLockedResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairingPromptFlow:receivedAllowWhileLockedResponse:");
}

id objc_msgSend_pairingPromptFlow_receivedBluetoothConfirmationResponse_forDeviceIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairingPromptFlow:receivedBluetoothConfirmationResponse:forDeviceIdentifier:");
}

id objc_msgSend_pairingPromptFlow_receivedBluetoothContactsSyncResponse_forDeviceIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairingPromptFlow:receivedBluetoothContactsSyncResponse:forDeviceIdentifier:");
}

id objc_msgSend_pairingPromptFlow_receivedConnectCarPlayFromCarKeyResponse_vehicleName_turnOnWiFi_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairingPromptFlow:receivedConnectCarPlayFromCarKeyResponse:vehicleName:turnOnWiFi:");
}

id objc_msgSend_pairingPromptFlow_receivedConnectCarPlayResponse_turnOnWiFi_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairingPromptFlow:receivedConnectCarPlayResponse:turnOnWiFi:");
}

id objc_msgSend_pairingPromptFlow_receivedEnhancedIntegrationResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairingPromptFlow:receivedEnhancedIntegrationResponse:");
}

id objc_msgSend_pairingPromptFlow_receivedUseWirelessResponse_turnOnBluetooth_turnOnWiFi_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairingPromptFlow:receivedUseWirelessResponse:turnOnBluetooth:turnOnWiFi:");
}

id objc_msgSend_pairingPromptFlow_wantsToPerformPresentation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairingPromptFlow:wantsToPerformPresentation:");
}

id objc_msgSend_pairingServiceSession_didFailPairingAttemptWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairingServiceSession:didFailPairingAttemptWithError:");
}

id objc_msgSend_pairingServiceSessionDidFinishPairing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairingServiceSessionDidFinishPairing:");
}

id objc_msgSend_pairingStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairingStatus");
}

id objc_msgSend_passphrase(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passphrase");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_payload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payload");
}

id objc_msgSend_payloadForVehicleWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadForVehicleWithIdentifier:");
}

id objc_msgSend_pendingDrafts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pendingDrafts");
}

id objc_msgSend_performDoneCaptureResult(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performDoneCaptureResult");
}

id objc_msgSend_performEnterReadyState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performEnterReadyState");
}

id objc_msgSend_performLoadingPlistData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performLoadingPlistData:");
}

id objc_msgSend_performLookup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performLookup:");
}

id objc_msgSend_performPostResponseAndReleaseData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performPostResponseAndReleaseData");
}

id objc_msgSend_performWithPromptPresenter_errorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performWithPromptPresenter:errorHandler:");
}

id objc_msgSend_peripheral(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "peripheral");
}

id objc_msgSend_persistCapabilitiesToGlobalDomain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "persistCapabilitiesToGlobalDomain");
}

id objc_msgSend_persistCarCapabilitiesIfNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "persistCarCapabilitiesIfNeeded");
}

id objc_msgSend_persisted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "persisted");
}

id objc_msgSend_physicalSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "physicalSize");
}

id objc_msgSend_pipe(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pipe");
}

id objc_msgSend_pixelSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pixelSize");
}

id objc_msgSend_plistLookupFinishedCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "plistLookupFinishedCompletionHandler:");
}

id objc_msgSend_plistMessenger(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "plistMessenger");
}

id objc_msgSend_plistURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "plistURL");
}

id objc_msgSend_plistVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "plistVersion");
}

id objc_msgSend_popFirstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "popFirstObject");
}

id objc_msgSend_port(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "port");
}

id objc_msgSend_postBannerWithTitle_message_destinations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postBannerWithTitle:message:destinations:");
}

id objc_msgSend_postInCarNotificationForVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postInCarNotificationForVehicle:");
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postNotificationName:object:userInfo:");
}

id objc_msgSend_postPairingsDidChangeNotification(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postPairingsDidChangeNotification");
}

id objc_msgSend_powered(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "powered");
}

id objc_msgSend_ppid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ppid");
}

id objc_msgSend_predicateWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateWithBlock:");
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_preferences(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferences");
}

id objc_msgSend_preferencesManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferencesManager");
}

id objc_msgSend_prepareForRemovingWiFiUUID_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prepareForRemovingWiFiUUID:completion:");
}

id objc_msgSend_presentAlertWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentAlertWithCompletion:");
}

id objc_msgSend_presentAllowWhileLockedPromptForVehicleName_responseHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentAllowWhileLockedPromptForVehicleName:responseHandler:");
}

id objc_msgSend_presentAssetProgressForVehicleName_progress_completionHandler_cancelHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentAssetProgressForVehicleName:progress:completionHandler:cancelHandler:");
}

id objc_msgSend_presentAssetProgressPromptForVehicleName_cancelHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentAssetProgressPromptForVehicleName:cancelHandler:");
}

id objc_msgSend_presentAssetReadyForVehicleName_confirmationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentAssetReadyForVehicleName:confirmationHandler:");
}

id objc_msgSend_presentAssetReadyPromptForVehicleName_confirmationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentAssetReadyPromptForVehicleName:confirmationHandler:");
}

id objc_msgSend_presentAssetReadySoonForVehicleName_confirmationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentAssetReadySoonForVehicleName:confirmationHandler:");
}

id objc_msgSend_presentAssetReadySoonPromptForVehicleName_confirmationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentAssetReadySoonPromptForVehicleName:confirmationHandler:");
}

id objc_msgSend_presentAssetSupportingConnectPromptWithBluetoothOnlyOption_wirelessEnablement_responseHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentAssetSupportingConnectPromptWithBluetoothOnlyOption:wirelessEnablement:responseHandler:");
}

id objc_msgSend_presentAssetSupportingUseWirelessPromptWithWirelessEnablement_declineVariant_responseHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentAssetSupportingUseWirelessPromptWithWirelessEnablement:declineVariant:responseHandler:");
}

id objc_msgSend_presentBluetoothConfirmationPromptForVehicleName_numericCode_responseHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentBluetoothConfirmationPromptForVehicleName:numericCode:responseHandler:");
}

id objc_msgSend_presentBluetoothContactsSyncPromptWithResponseHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentBluetoothContactsSyncPromptWithResponseHandler:");
}

id objc_msgSend_presentBluetoothFailedPromptForVehicleName_isTimeout_responseHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentBluetoothFailedPromptForVehicleName:isTimeout:responseHandler:");
}

id objc_msgSend_presentConnectPromptWithBluetoothOnlyOption_wirelessEnablement_responseHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentConnectPromptWithBluetoothOnlyOption:wirelessEnablement:responseHandler:");
}

id objc_msgSend_presentEnhancedIntegrationPromptForVehicleName_responseHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentEnhancedIntegrationPromptForVehicleName:responseHandler:");
}

id objc_msgSend_presentHeadUnitPairingForBluetoothAddress_showBluetoothOnlyOption_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentHeadUnitPairingForBluetoothAddress:showBluetoothOnlyOption:");
}

id objc_msgSend_presentHeadUnitPairingForPromptSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentHeadUnitPairingForPromptSession:");
}

id objc_msgSend_presentSetupCarKeysPromptForVehicleName_carKeyInfo_cancelHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentSetupCarKeysPromptForVehicleName:carKeyInfo:cancelHandler:");
}

id objc_msgSend_presentUseWirelessPromptWithWirelessEnablement_declineVariant_responseHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentUseWirelessPromptWithWirelessEnablement:declineVariant:responseHandler:");
}

id objc_msgSend_presentedBulletins(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentedBulletins");
}

id objc_msgSend_presenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presenter");
}

id objc_msgSend_presenterSessionDidBecomeReady_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presenterSessionDidBecomeReady:");
}

id objc_msgSend_previousWallpaperIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "previousWallpaperIdentifier");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processIdentifier");
}

id objc_msgSend_processIncomingData_forEndpointWithUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processIncomingData:forEndpointWithUUID:");
}

id objc_msgSend_processTransaction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processTransaction");
}

id objc_msgSend_processingTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processingTimer");
}

id objc_msgSend_progressPromptCompletion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "progressPromptCompletion");
}

id objc_msgSend_promptDelegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "promptDelegate");
}

id objc_msgSend_promptResponseHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "promptResponseHandler");
}

id objc_msgSend_propertyListMessenger_didReceiveMessageWithIdentifier_contents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "propertyListMessenger:didReceiveMessageWithIdentifier:contents:");
}

id objc_msgSend_psmCharacteristicUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "psmCharacteristicUUID");
}

id objc_msgSend_publicKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "publicKey");
}

id objc_msgSend_purgeSync(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "purgeSync");
}

id objc_msgSend_queryCurrentStateWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryCurrentStateWithCompletionHandler:");
}

id objc_msgSend_queryCurrentStateWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryCurrentStateWithError:");
}

id objc_msgSend_queryMetaDataSync(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryMetaDataSync");
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queue");
}

id objc_msgSend_radarDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "radarDescription");
}

id objc_msgSend_radarDescriptionForData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "radarDescriptionForData:");
}

id objc_msgSend_radarDraftFromDiagnosticsData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "radarDraftFromDiagnosticsData:");
}

id objc_msgSend_radarTitleTagsForData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "radarTitleTagsForData:");
}

id objc_msgSend_rangeOfUnit_startDate_interval_forDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeOfUnit:startDate:interval:forDate:");
}

id objc_msgSend_read_maxLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "read:maxLength:");
}

id objc_msgSend_readDataUpToLength_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readDataUpToLength:error:");
}

id objc_msgSend_readValueForCharacteristic_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readValueForCharacteristic:");
}

id objc_msgSend_receiveBuffer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receiveBuffer");
}

id objc_msgSend_receiveQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receiveQueue");
}

id objc_msgSend_receivedClusterAssetIdentifier_assetVersion_sdkVersion_forVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receivedClusterAssetIdentifier:assetVersion:sdkVersion:forVehicle:");
}

id objc_msgSend_reconcileCapabilities(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reconcileCapabilities");
}

id objc_msgSend_reconnectEndedOnTransport_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reconnectEndedOnTransport:");
}

id objc_msgSend_recordConnectionEvent_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordConnectionEvent:completion:");
}

id objc_msgSend_recordID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordID");
}

id objc_msgSend_refresh(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "refresh");
}

id objc_msgSend_region(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "region");
}

id objc_msgSend_regionState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "regionState");
}

id objc_msgSend_registerDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerDelegate:");
}

id objc_msgSend_registerForAvailabilityEvent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerForAvailabilityEvent");
}

id objc_msgSend_registerObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerObserver:");
}

id objc_msgSend_regularExpressionWithPattern_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "regularExpressionWithPattern:options:error:");
}

id objc_msgSend_releaseAllAssertions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "releaseAllAssertions");
}

id objc_msgSend_releaseAllTemporaryAssertions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "releaseAllTemporaryAssertions");
}

id objc_msgSend_releaseAssertion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "releaseAssertion:");
}

id objc_msgSend_releaseTurnByTurnOwnership(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "releaseTurnByTurnOwnership");
}

id objc_msgSend_remoteAlert(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteAlert");
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteObjectProxy");
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_remoteProgressCompletion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteProgressCompletion");
}

id objc_msgSend_removeAllDeliveredNotifications(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllDeliveredNotifications");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeAssetsBeforeVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAssetsBeforeVersion:");
}

id objc_msgSend_removeDeliveredNotificationsWithIdentifiers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeDeliveredNotificationsWithIdentifiers:");
}

id objc_msgSend_removeDiagnosticsFoldersBeforeTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeDiagnosticsFoldersBeforeTime:");
}

id objc_msgSend_removeFromRunLoop_forMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeFromRunLoop:forMode:");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeNetworkCredentialsForCarPlayNetwork_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeNetworkCredentialsForCarPlayNetwork:");
}

id objc_msgSend_removeNetworkCredentialsForCarPlayUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeNetworkCredentialsForCarPlayUUID:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectsInRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectsInRange:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_forKeyPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:forKeyPath:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_removePayloadForVehicleWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removePayloadForVehicleWithIdentifier:");
}

id objc_msgSend_removePendingNotificationRequestsWithIdentifiers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removePendingNotificationRequestsWithIdentifiers:");
}

id objc_msgSend_removeSpaceAfter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeSpaceAfter");
}

id objc_msgSend_removeSpaceBefore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeSpaceBefore");
}

id objc_msgSend_removeVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeVehicle:");
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "request");
}

id objc_msgSend_requestCarCapabilitiesUpdate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestCarCapabilitiesUpdate");
}

id objc_msgSend_requestLocation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestLocation");
}

id objc_msgSend_requestLogArchive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestLogArchive");
}

id objc_msgSend_requestLogsWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestLogsWithCompletion:");
}

id objc_msgSend_requestStartStatisticsOnInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestStartStatisticsOnInterval:");
}

id objc_msgSend_requestTurnByTurnOwnership(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestTurnByTurnOwnership");
}

id objc_msgSend_requestWiFiCredentials(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestWiFiCredentials");
}

id objc_msgSend_requestWiFiCredentialsFromVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestWiFiCredentialsFromVehicle:");
}

id objc_msgSend_requestWithIdentifier_content_trigger_destinations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestWithIdentifier:content:trigger:destinations:");
}

id objc_msgSend_requiresBonjour(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requiresBonjour");
}

id objc_msgSend_requiresUnlockedDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requiresUnlockedDevice");
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reset");
}

id objc_msgSend_resetActiveComponents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetActiveComponents");
}

id objc_msgSend_resourceValuesForKeys_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resourceValuesForKeys:error:");
}

id objc_msgSend_respondToPairingRequest_type_accept_data_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "respondToPairingRequest:type:accept:data:");
}

id objc_msgSend_responseBlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "responseBlock");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "result");
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "results");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_retrievePeripheralsWithIdentifiers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retrievePeripheralsWithIdentifiers:");
}

id objc_msgSend_returnTypes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "returnTypes:");
}

id objc_msgSend_rightHandDrive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rightHandDrive");
}

id objc_msgSend_routineManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "routineManager");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}

id objc_msgSend_rxpcConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rxpcConnection");
}

id objc_msgSend_rxpcListener(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rxpcListener");
}

id objc_msgSend_rxpcQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rxpcQueue");
}

id objc_msgSend_safeFrame(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "safeFrame");
}

id objc_msgSend_saveAdditionsData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveAdditionsData:");
}

id objc_msgSend_saveCertificateData_signatureData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveCertificateData:signatureData:");
}

id objc_msgSend_saveData_forIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveData:forIndex:");
}

id objc_msgSend_saveNetworkCredentials_forCarPlayUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveNetworkCredentials:forCarPlayUUID:");
}

id objc_msgSend_saveVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveVehicle:");
}

id objc_msgSend_saveVehicle_withMergePolicy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveVehicle:withMergePolicy:");
}

id objc_msgSend_scaledDisplays_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scaledDisplays:reply:");
}

id objc_msgSend_scanCharactersFromSet_intoString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scanCharactersFromSet:intoString:");
}

id objc_msgSend_scanUpToCharactersFromSet_intoString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scanUpToCharactersFromSet:intoString:");
}

id objc_msgSend_scannerWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scannerWithString:");
}

id objc_msgSend_scheduleInRunLoop_forMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduleInRunLoop:forMode:");
}

id objc_msgSend_scheduleVehicleStateCheckWithDelay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduleVehicleStateCheckWithDelay:");
}

id objc_msgSend_scheduledTimerWithTimeInterval_repeats_block_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduledTimerWithTimeInterval:repeats:block:");
}

id objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:");
}

id objc_msgSend_screenType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "screenType");
}

id objc_msgSend_screens(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "screens");
}

id objc_msgSend_sdkVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sdkVersion");
}

id objc_msgSend_second(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "second");
}

id objc_msgSend_securityType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "securityType");
}

id objc_msgSend_seekToEndReturningOffset_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "seekToEndReturningOffset:error:");
}

id objc_msgSend_semanticModeIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "semanticModeIdentifier");
}

id objc_msgSend_semanticType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "semanticType");
}

id objc_msgSend_sendCarPlayAvailability_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendCarPlayAvailability:");
}

id objc_msgSend_sendChannelMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendChannelMessage:");
}

id objc_msgSend_sendData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendData:");
}

id objc_msgSend_sendDeviceTransportIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendDeviceTransportIdentifiers");
}

id objc_msgSend_sendDeviceTransportIdentifiersToVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendDeviceTransportIdentifiersToVehicle:");
}

id objc_msgSend_sendDrivingModeEventWithReason_isStart_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendDrivingModeEventWithReason:isStart:");
}

id objc_msgSend_sendEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendEvent:");
}

id objc_msgSend_sendEvent_withDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendEvent:withDictionary:");
}

id objc_msgSend_sendInfo_toComponentUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendInfo:toComponentUID:");
}

id objc_msgSend_sendMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendMessage:");
}

id objc_msgSend_sendNoSupportForAppIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendNoSupportForAppIdentifier:");
}

id objc_msgSend_sendThemeAsset_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendThemeAsset:completion:");
}

id objc_msgSend_sendWiredCarPlayAvailable_usbIdentifier_wirelessCarPlayAvailable_bluetoothIdentifier_themeAssetsAvailable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendWiredCarPlayAvailable:usbIdentifier:wirelessCarPlayAvailable:bluetoothIdentifier:themeAssetsAvailable:");
}

id objc_msgSend_sendWiredCarPlayAvailable_wirelessCarPlayAvailable_themeAssetsAvailable_toVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendWiredCarPlayAvailable:wirelessCarPlayAvailable:themeAssetsAvailable:toVehicle:");
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serialNumber");
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "service");
}

id objc_msgSend_serviceChannel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceChannel");
}

id objc_msgSend_serviceConnector(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceConnector");
}

id objc_msgSend_serviceConnector_completedPairingForBluetoothLEIdentifier_name_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceConnector:completedPairingForBluetoothLEIdentifier:name:");
}

id objc_msgSend_serviceConnector_didConnectUnsupportedAccessoryWithBluetoothAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceConnector:didConnectUnsupportedAccessoryWithBluetoothAddress:");
}

id objc_msgSend_serviceConnector_didConnectVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceConnector:didConnectVehicle:");
}

id objc_msgSend_serviceConnector_didDisconnectVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceConnector:didDisconnectVehicle:");
}

id objc_msgSend_serviceConnector_didUpdateVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceConnector:didUpdateVehicle:");
}

id objc_msgSend_serviceConnector_failedPairingForBluetoothLEIdentifier_name_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceConnector:failedPairingForBluetoothLEIdentifier:name:error:");
}

id objc_msgSend_serviceConnector_receivedStartSessionMessage_fromVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceConnector:receivedStartSessionMessage:fromVehicle:");
}

id objc_msgSend_serviceConnector_requestsPairingConfirmationForBluetoothLEIdentifier_name_numericCode_responseHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceConnector:requestsPairingConfirmationForBluetoothLEIdentifier:name:numericCode:responseHandler:");
}

id objc_msgSend_serviceCountDuringAlertForBluetoothAddress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceCountDuringAlertForBluetoothAddress");
}

id objc_msgSend_serviceDelegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceDelegate");
}

id objc_msgSend_serviceForClientIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceForClientIdentifier:");
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceName");
}

id objc_msgSend_serviceUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceUUID");
}

id objc_msgSend_serviceVehicle_receivedStartSessionMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceVehicle:receivedStartSessionMessage:");
}

id objc_msgSend_services(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "services");
}

id objc_msgSend_servicesForBluetoothIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "servicesForBluetoothIdentifiers");
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "session");
}

id objc_msgSend_sessionDelegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionDelegate");
}

id objc_msgSend_sessionDetachHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionDetachHandler");
}

id objc_msgSend_sessionQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionQueue");
}

id objc_msgSend_sessionRequestClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionRequestClient");
}

id objc_msgSend_sessionStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionStatus");
}

id objc_msgSend_sessionUUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionUUIDString");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set");
}

id objc_msgSend_setAccessoryProtocols_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessoryProtocols:");
}

id objc_msgSend_setActionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActionHandler:");
}

id objc_msgSend_setActionPendingPowerOn_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActionPendingPowerOn:");
}

id objc_msgSend_setActions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActions:");
}

id objc_msgSend_setActivateWithCarPlay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActivateWithCarPlay:");
}

id objc_msgSend_setActivatedByUserAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActivatedByUserAction:");
}

id objc_msgSend_setActive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActive:");
}

id objc_msgSend_setActiveBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActiveBundleIdentifier:");
}

id objc_msgSend_setActivePeripheral_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActivePeripheral:");
}

id objc_msgSend_setActivelyMonitoringGeofences_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActivelyMonitoringGeofences:");
}

id objc_msgSend_setActivityType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActivityType:");
}

id objc_msgSend_setAdditionalDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAdditionalDescription:");
}

id objc_msgSend_setAlbumArtUserPreference_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlbumArtUserPreference:");
}

id objc_msgSend_setAlertAutoDismissed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlertAutoDismissed:");
}

id objc_msgSend_setAlertDismissTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlertDismissTimer:");
}

id objc_msgSend_setAllowedUnits_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowedUnits:");
}

id objc_msgSend_setAllowsCellularAccess_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsCellularAccess:");
}

id objc_msgSend_setAllowsExpensiveAccess_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsExpensiveAccess:");
}

id objc_msgSend_setAlmanac_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlmanac:");
}

id objc_msgSend_setAppearanceModePreference_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAppearanceModePreference:");
}

id objc_msgSend_setArguments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setArguments:");
}

id objc_msgSend_setAssertionManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAssertionManager:");
}

id objc_msgSend_setAssetProgress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAssetProgress:");
}

id objc_msgSend_setAssetQueryInProgress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAssetQueryInProgress:");
}

id objc_msgSend_setAssetQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAssetQueue:");
}

id objc_msgSend_setAssetQueue_queryInProgress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAssetQueue_queryInProgress:");
}

id objc_msgSend_setAssetRequests_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAssetRequests:");
}

id objc_msgSend_setAttachments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttachments:");
}

id objc_msgSend_setAttribute_forKey_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttribute:forKey:error:");
}

id objc_msgSend_setAutoDiagnostics_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutoDiagnostics:");
}

id objc_msgSend_setAutomaticDNDTriggeringMethod_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutomaticDNDTriggeringMethod:");
}

id objc_msgSend_setBTPowerMessagingVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBTPowerMessagingVehicle:");
}

id objc_msgSend_setBTPowerStoredVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBTPowerStoredVehicle:");
}

id objc_msgSend_setBannerMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBannerMessage:");
}

id objc_msgSend_setBluetoothAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBluetoothAddress:");
}

id objc_msgSend_setBluetoothConfirmed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBluetoothConfirmed:");
}

id objc_msgSend_setBluetoothConnectedHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBluetoothConnectedHandler:");
}

id objc_msgSend_setBluetoothDeviceIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBluetoothDeviceIdentifier:");
}

id objc_msgSend_setBluetoothFailureReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBluetoothFailureReason:");
}

id objc_msgSend_setBluetoothManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBluetoothManager:");
}

id objc_msgSend_setBody_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBody:");
}

id objc_msgSend_setBoldTextPreference_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBoldTextPreference:");
}

id objc_msgSend_setByAddingObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setByAddingObject:");
}

id objc_msgSend_setByAddingObjectsFromSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setByAddingObjectsFromSet:");
}

id objc_msgSend_setCachedCarPlayAllowedChangeValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCachedCarPlayAllowedChangeValue:");
}

id objc_msgSend_setCachedDoWeOwnNavigation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCachedDoWeOwnNavigation:");
}

id objc_msgSend_setCachedVehicles_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCachedVehicles:");
}

id objc_msgSend_setCapabilitiesVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCapabilitiesVersion:");
}

id objc_msgSend_setCarCapabilities_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCarCapabilities:");
}

id objc_msgSend_setCarCapabilitiesURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCarCapabilitiesURL:");
}

id objc_msgSend_setCarKeyPairingResult_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCarKeyPairingResult:");
}

id objc_msgSend_setCarPlayFeatures_disabled_forVehicleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCarPlayFeatures:disabled:forVehicleIdentifier:");
}

id objc_msgSend_setCarPlaySimulatorActive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCarPlaySimulatorActive:");
}

id objc_msgSend_setCarplayWiFiUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCarplayWiFiUUID:");
}

id objc_msgSend_setCategoryIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCategoryIdentifier:");
}

id objc_msgSend_setCertificateSerialNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCertificateSerialNumber:");
}

id objc_msgSend_setChannelDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setChannelDelegate:");
}

id objc_msgSend_setChannelIsOpen_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setChannelIsOpen:");
}

id objc_msgSend_setCharactersToBeSkipped_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCharactersToBeSkipped:");
}

id objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setClusterAssetIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClusterAssetIdentifier:");
}

id objc_msgSend_setClusterAssetURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClusterAssetURL:");
}

id objc_msgSend_setClusterAssetVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClusterAssetVersion:");
}

id objc_msgSend_setClusterAssetiOSContentVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClusterAssetiOSContentVersion:");
}

id objc_msgSend_setColorFilterIntensityPreference_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setColorFilterIntensityPreference:");
}

id objc_msgSend_setColorFilterPreference_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setColorFilterPreference:");
}

id objc_msgSend_setCompletedUnitCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCompletedUnitCount:");
}

id objc_msgSend_setComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setComponent:");
}

id objc_msgSend_setConnectable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnectable:");
}

id objc_msgSend_setConnected_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnected:");
}

id objc_msgSend_setConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnection:");
}

id objc_msgSend_setConnectionTimeServiceAgent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnectionTimeServiceAgent:");
}

id objc_msgSend_setConnectionTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnectionTimer:");
}

id objc_msgSend_setConnectionUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnectionUUID:");
}

id objc_msgSend_setConnections_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnections:");
}

id objc_msgSend_setConnectionsQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnectionsQueue:");
}

id objc_msgSend_setContactsSyncEnabled_forBluetoothAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContactsSyncEnabled:forBluetoothAddress:");
}

id objc_msgSend_setCurrentAcceptCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentAcceptCompletion:");
}

id objc_msgSend_setCurrentBluetoothConfirmationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentBluetoothConfirmationHandler:");
}

id objc_msgSend_setCurrentBluetoothPairingCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentBluetoothPairingCompletion:");
}

id objc_msgSend_setCurrentChunkIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentChunkIndex:");
}

id objc_msgSend_setCurrentCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentCompletion:");
}

id objc_msgSend_setCurrentConnectionCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentConnectionCompletion:");
}

id objc_msgSend_setCurrentConnectionState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentConnectionState:");
}

id objc_msgSend_setCurrentDiagnosticsData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentDiagnosticsData:");
}

id objc_msgSend_setCurrentErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentErrorHandler:");
}

id objc_msgSend_setCurrentLocation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentLocation:");
}

id objc_msgSend_setCurrentPairingSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentPairingSession:");
}

id objc_msgSend_setCurrentPromptFlowController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentPromptFlowController:");
}

id objc_msgSend_setCurrentPromptSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentPromptSession:");
}

id objc_msgSend_setCurrentSessionTransferStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentSessionTransferStatus:");
}

id objc_msgSend_setCurrentStep_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentStep:");
}

id objc_msgSend_setCurrentlyPairingAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentlyPairingAddress:");
}

id objc_msgSend_setDNDActive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDNDActive:");
}

id objc_msgSend_setDashboardRoundedCorners_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDashboardRoundedCorners:");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setData:");
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDateFormat:");
}

id objc_msgSend_setDateStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDateStyle:");
}

id objc_msgSend_setDeclineType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeclineType:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDesiredAccuracy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDesiredAccuracy:");
}

id objc_msgSend_setDeviceFilter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceFilter:");
}

id objc_msgSend_setDeviceFoundHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceFoundHandler:");
}

id objc_msgSend_setDeviceID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceID:");
}

id objc_msgSend_setDevicePairingEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDevicePairingEnabled:");
}

id objc_msgSend_setDeviceSilentMode_reason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceSilentMode:reason:");
}

id objc_msgSend_setDiagnosticExtensionIDs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDiagnosticExtensionIDs:");
}

id objc_msgSend_setDidCreateGeofenceAroundStart_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDidCreateGeofenceAroundStart:");
}

id objc_msgSend_setDigitalCarKeyInformation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDigitalCarKeyInformation:");
}

id objc_msgSend_setDisableTimerTimestamp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisableTimerTimestamp:");
}

id objc_msgSend_setDisabledFeature_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisabledFeature:");
}

id objc_msgSend_setDisabledFeaturesPreference_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisabledFeaturesPreference:");
}

id objc_msgSend_setDiscoveredPSMCharacteristic_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDiscoveredPSMCharacteristic:");
}

id objc_msgSend_setDiscoveredService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDiscoveredService:");
}

id objc_msgSend_setDiscoveryFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDiscoveryFlags:");
}

id objc_msgSend_setDiscretionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDiscretionary:");
}

id objc_msgSend_setDismissHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDismissHandler:");
}

id objc_msgSend_setDispatchQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDispatchQueue:");
}

id objc_msgSend_setDisplayName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisplayName:");
}

id objc_msgSend_setDisplayThemeData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisplayThemeData:");
}

id objc_msgSend_setDoNotBlockBeforeFirstUnlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDoNotBlockBeforeFirstUnlock:");
}

id objc_msgSend_setDownloadObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDownloadObserver:");
}

id objc_msgSend_setDriveStartTimeInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDriveStartTimeInterval:");
}

id objc_msgSend_setEndpointUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEndpointUUID:");
}

id objc_msgSend_setEnhancedIntegrationStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnhancedIntegrationStatus:");
}

id objc_msgSend_setError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setError:");
}

id objc_msgSend_setEventHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEventHandler:");
}

id objc_msgSend_setExitConfirmationActive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExitConfirmationActive:");
}

id objc_msgSend_setExitConfirmationOverride_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExitConfirmationOverride:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setFeaturesAvailabilityAgent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFeaturesAvailabilityAgent:");
}

id objc_msgSend_setFileHandle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFileHandle:");
}

id objc_msgSend_setFileSenderSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFileSenderSession:");
}

id objc_msgSend_setFinishedWelcome_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFinishedWelcome:");
}

id objc_msgSend_setFocusModeDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFocusModeDescription:");
}

id objc_msgSend_setHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHandler:");
}

id objc_msgSend_setHasAdjustedTriggerMethod_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHasAdjustedTriggerMethod:");
}

id objc_msgSend_setHasGaugeClusterScreen_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHasGaugeClusterScreen:");
}

id objc_msgSend_setHasMigratedToDriving_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHasMigratedToDriving:");
}

id objc_msgSend_setHeadUnitPairingDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHeadUnitPairingDelegate:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setIdleExitTransaction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdleExitTransaction:");
}

id objc_msgSend_setInCar_carPlayUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInCar:carPlayUUID:");
}

id objc_msgSend_setInitialDiagnosticsBannerPresented_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInitialDiagnosticsBannerPresented:");
}

id objc_msgSend_setInitialState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInitialState:");
}

id objc_msgSend_setInitialTimerLocation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInitialTimerLocation:");
}

id objc_msgSend_setInteger_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInteger:forKey:");
}

id objc_msgSend_setIntent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIntent:");
}

id objc_msgSend_setInternalNotes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInternalNotes:");
}

id objc_msgSend_setInternalQueueOutstandingSendCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInternalQueueOutstandingSendCount:");
}

id objc_msgSend_setInternalSettingsState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInternalSettingsState:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setIsCAFToolTreeCompletionCalled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsCAFToolTreeCompletionCalled:");
}

id objc_msgSend_setIsCurrentlyInsideGeofence_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsCurrentlyInsideGeofence:");
}

id objc_msgSend_setIsReady_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsReady:");
}

id objc_msgSend_setIsUserInitiated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsUserInitiated:");
}

id objc_msgSend_setIsVehicleDataSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsVehicleDataSession:");
}

id objc_msgSend_setKeyIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setKeyIdentifier:");
}

id objc_msgSend_setKeyboardType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setKeyboardType:");
}

id objc_msgSend_setKeywords_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setKeywords:");
}

id objc_msgSend_setLastConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastConfiguration:");
}

id objc_msgSend_setLastConnectedDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastConnectedDate:");
}

id objc_msgSend_setLastKnownReportTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastKnownReportTime:");
}

id objc_msgSend_setLastKnownVehicularHints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastKnownVehicularHints:");
}

id objc_msgSend_setLastKnownVehicularState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastKnownVehicularState:");
}

id objc_msgSend_setLastLookupIdentifer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastLookupIdentifer:");
}

id objc_msgSend_setLastModeChangeByCarkitd_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastModeChangeByCarkitd:");
}

id objc_msgSend_setLastSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastSession:");
}

id objc_msgSend_setLastStartSessionDeviceID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastStartSessionDeviceID:");
}

id objc_msgSend_setLaunchPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLaunchPath:");
}

id objc_msgSend_setLocalOOBDataHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocalOOBDataHandler:");
}

id objc_msgSend_setLocale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocale:");
}

id objc_msgSend_setLocationDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocationDescription:");
}

id objc_msgSend_setLocationManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocationManager:");
}

id objc_msgSend_setLocationServicesEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocationServicesEnabled:");
}

id objc_msgSend_setLock_lockdownConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLock_lockdownConnection:");
}

id objc_msgSend_setLock_session_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLock_session:");
}

id objc_msgSend_setLockdownSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLockdownSource:");
}

id objc_msgSend_setLockscreenAlert_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLockscreenAlert:");
}

id objc_msgSend_setLogArchiveReceiver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLogArchiveReceiver:");
}

id objc_msgSend_setLoggingFileReceiver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLoggingFileReceiver:");
}

id objc_msgSend_setLookupCompletionHandlers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLookupCompletionHandlers:");
}

id objc_msgSend_setMFiCertificateSerialNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMFiCertificateSerialNumber:");
}

id objc_msgSend_setMapsActive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMapsActive:");
}

id objc_msgSend_setMapsAppearancePreference_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMapsAppearancePreference:");
}

id objc_msgSend_setMaximumConcurrentNavigationOwners_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaximumConcurrentNavigationOwners:");
}

id objc_msgSend_setMessageReceiver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMessageReceiver:");
}

id objc_msgSend_setMessagingConnector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMessagingConnector:");
}

id objc_msgSend_setMessagingVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMessagingVehicle:");
}

id objc_msgSend_setModeConfiguration_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModeConfiguration:error:");
}

id objc_msgSend_setMonitoredRegions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMonitoredRegions:");
}

id objc_msgSend_setMonitoringService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMonitoringService:");
}

id objc_msgSend_setNextNightModeChangeTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNextNightModeChangeTimer:");
}

id objc_msgSend_setNextSessionOverrideAirPlayFeatureStrings_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNextSessionOverrideAirPlayFeatureStrings:");
}

id objc_msgSend_setNightMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNightMode:");
}

id objc_msgSend_setNotificationCategories_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNotificationCategories:");
}

id objc_msgSend_setNotifyValue_forCharacteristic_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNotifyValue:forCharacteristic:");
}

id objc_msgSend_setNowPlayingAlbumArtMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNowPlayingAlbumArtMode:");
}

id objc_msgSend_setNumericCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumericCode:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOpen_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOpen:");
}

id objc_msgSend_setOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOptions:");
}

id objc_msgSend_setOutstandingApprovalAlerts_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOutstandingApprovalAlerts:");
}

id objc_msgSend_setOutstandingEnableWiFiAlerts_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOutstandingEnableWiFiAlerts:");
}

id objc_msgSend_setOutstandingEnhancedIntegrationAlerts_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOutstandingEnhancedIntegrationAlerts:");
}

id objc_msgSend_setOutstandingPairingAlerts_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOutstandingPairingAlerts:");
}

id objc_msgSend_setPSM_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPSM:");
}

id objc_msgSend_setPairingAccepted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPairingAccepted:");
}

id objc_msgSend_setPairingDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPairingDelegate:");
}

id objc_msgSend_setPairingPeripheralIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPairingPeripheralIdentifier:");
}

id objc_msgSend_setPairingPeripheralName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPairingPeripheralName:");
}

id objc_msgSend_setPairingPromptCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPairingPromptCompletion:");
}

id objc_msgSend_setPairingStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPairingStatus:");
}

id objc_msgSend_setPayload_forVehicleWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPayload:forVehicleWithIdentifier:");
}

id objc_msgSend_setPendingDrafts_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPendingDrafts:");
}

id objc_msgSend_setPlistURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPlistURL:");
}

id objc_msgSend_setPlistVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPlistVersion:");
}

id objc_msgSend_setPowered_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPowered:");
}

id objc_msgSend_setPreferencesDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreferencesDelegate:");
}

id objc_msgSend_setPreferencesManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreferencesManager:");
}

id objc_msgSend_setPresenter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPresenter:");
}

id objc_msgSend_setPreviousWallpaperIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreviousWallpaperIdentifier:");
}

id objc_msgSend_setProblemDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProblemDescription:");
}

id objc_msgSend_setProcessTransaction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProcessTransaction:");
}

id objc_msgSend_setProcessingTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProcessingTimer:");
}

id objc_msgSend_setProgressPromptCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProgressPromptCompletion:");
}

id objc_msgSend_setPromptDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPromptDelegate:");
}

id objc_msgSend_setPromptResponseHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPromptResponseHandler:");
}

id objc_msgSend_setReadabilityHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReadabilityHandler:");
}

id objc_msgSend_setRegion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRegion:");
}

id objc_msgSend_setRegionState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRegionState:");
}

id objc_msgSend_setReleaseAudioSessionOnRecordingCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReleaseAudioSessionOnRecordingCompletion:");
}

id objc_msgSend_setRemoteAlert_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteAlert:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setRemoteProgressCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteProgressCompletion:");
}

id objc_msgSend_setResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResourceValue:forKey:error:");
}

id objc_msgSend_setResponseBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResponseBlock:");
}

id objc_msgSend_setResult_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResult:");
}

id objc_msgSend_setReturnKeyType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReturnKeyType:");
}

id objc_msgSend_setRoutineManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRoutineManager:");
}

id objc_msgSend_setRxpcConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRxpcConnection:");
}

id objc_msgSend_setRxpcListener_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRxpcListener:");
}

id objc_msgSend_setSDKVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSDKVersion:");
}

id objc_msgSend_setServiceChannel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setServiceChannel:");
}

id objc_msgSend_setServiceCountDuringAlertForBluetoothAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setServiceCountDuringAlertForBluetoothAddress:");
}

id objc_msgSend_setServiceDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setServiceDelegate:");
}

id objc_msgSend_setSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSession:");
}

id objc_msgSend_setSessionDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSessionDelegate:");
}

id objc_msgSend_setSessionDetachHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSessionDetachHandler:");
}

id objc_msgSend_setSessionQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSessionQueue:");
}

id objc_msgSend_setSessionRequestClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSessionRequestClient:");
}

id objc_msgSend_setSessionStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSessionStatus:");
}

id objc_msgSend_setSessionTransaction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSessionTransaction:");
}

id objc_msgSend_setSessionUUIDString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSessionUUIDString:");
}

id objc_msgSend_setSetupLauncher_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSetupLauncher:");
}

id objc_msgSend_setSetupPromptDirector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSetupPromptDirector:");
}

id objc_msgSend_setSharingClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSharingClient:");
}

id objc_msgSend_setShouldCreateGeofenceAroundStart_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldCreateGeofenceAroundStart:");
}

id objc_msgSend_setShouldEnableBluetooth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldEnableBluetooth:");
}

id objc_msgSend_setShouldEnableWiFi_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldEnableWiFi:");
}

id objc_msgSend_setShouldIgnoreDoNotDisturb_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldIgnoreDoNotDisturb:");
}

id objc_msgSend_setShouldResetMuteState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldResetMuteState:");
}

id objc_msgSend_setShouldResetToMuted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldResetToMuted:");
}

id objc_msgSend_setShouldSuppressScreenLightUp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldSuppressScreenLightUp:");
}

id objc_msgSend_setShowBluetoothOnlyOption_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShowBluetoothOnlyOption:");
}

id objc_msgSend_setSiriAccount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSiriAccount:");
}

id objc_msgSend_setSiriBargeInDisabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSiriBargeInDisabled:");
}

id objc_msgSend_setSoundRecognitionPreference_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSoundRecognitionPreference:");
}

id objc_msgSend_setStagedClusterAssetURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStagedClusterAssetURL:");
}

id objc_msgSend_setStagedClusterAssetVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStagedClusterAssetVersion:");
}

id objc_msgSend_setStagedClusterAssetiOSContentVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStagedClusterAssetiOSContentVersion:");
}

id objc_msgSend_setStandardOutput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStandardOutput:");
}

id objc_msgSend_setStartedFromCarKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStartedFromCarKey:");
}

id objc_msgSend_setStates_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStates:");
}

id objc_msgSend_setStatisticsReceiver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatisticsReceiver:");
}

id objc_msgSend_setStoredVehicleProvider_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStoredVehicleProvider:");
}

id objc_msgSend_setSupportsAccNav_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSupportsAccNav:");
}

id objc_msgSend_setSupportsBluetoothLE_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSupportsBluetoothLE:");
}

id objc_msgSend_setSupportsEnhancedIntegration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSupportsEnhancedIntegration:");
}

id objc_msgSend_setSupportsMixableAudio_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSupportsMixableAudio:");
}

id objc_msgSend_setSupportsStartSessionRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSupportsStartSessionRequest:");
}

id objc_msgSend_setSupportsThemeAssets_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSupportsThemeAssets:");
}

id objc_msgSend_setSupportsUSBCarPlay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSupportsUSBCarPlay:");
}

id objc_msgSend_setSupportsWirelessCarPlay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSupportsWirelessCarPlay:");
}

id objc_msgSend_setSyncSettings_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSyncSettings:");
}

id objc_msgSend_setTerminationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTerminationHandler:");
}

id objc_msgSend_setTimeOfIssue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeOfIssue:");
}

id objc_msgSend_setTimeStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeStyle:");
}

id objc_msgSend_setTimeoutInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeoutInterval:");
}

id objc_msgSend_setTimeoutTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeoutTimer:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTotalUnitCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTotalUnitCount:");
}

id objc_msgSend_setTransaction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTransaction:");
}

id objc_msgSend_setTranscriptionMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTranscriptionMode:");
}

id objc_msgSend_setTransportType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTransportType:");
}

id objc_msgSend_setURL_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setURL:forKey:");
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserInfo:");
}

id objc_msgSend_setUserInterfaceStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserInterfaceStyle:");
}

id objc_msgSend_setValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVehicle:");
}

id objc_msgSend_setVehicleAssetManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVehicleAssetManager:");
}

id objc_msgSend_setVehicleModelName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVehicleModelName:");
}

id objc_msgSend_setVehicleName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVehicleName:");
}

id objc_msgSend_setVehicleOperatorState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVehicleOperatorState:");
}

id objc_msgSend_setVehicleState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVehicleState:");
}

id objc_msgSend_setVehicleStateCheckTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVehicleStateCheckTimer:");
}

id objc_msgSend_setVehicleStore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVehicleStore:");
}

id objc_msgSend_setVehicleSupportsStartSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVehicleSupportsStartSession:");
}

id objc_msgSend_setVehicularHints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVehicularHints:");
}

id objc_msgSend_setViewAreaInsets_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setViewAreaInsets:");
}

id objc_msgSend_setVoiceControlPreference_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVoiceControlPreference:");
}

id objc_msgSend_setWaitingOnMessagingVehicleTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWaitingOnMessagingVehicleTimer:");
}

id objc_msgSend_setWaitingOnSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWaitingOnSession:");
}

id objc_msgSend_setWallpaperIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWallpaperIdentifier:");
}

id objc_msgSend_setWantsNotificationResponsesDelivered(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWantsNotificationResponsesDelivered");
}

id objc_msgSend_setWasPairing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWasPairing:");
}

id objc_msgSend_setWiFiManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWiFiManager:");
}

id objc_msgSend_setWifiChannel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWifiChannel:");
}

id objc_msgSend_setWifiManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWifiManager:");
}

id objc_msgSend_setWiredCarPlaySimulator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWiredCarPlaySimulator:");
}

id objc_msgSend_setWirelessReconnectEndDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWirelessReconnectEndDate:");
}

id objc_msgSend_setWirelessReconnectStartDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWirelessReconnectStartDate:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setZeroFormattingBehavior_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setZeroFormattingBehavior:");
}

id objc_msgSend_setupLauncher(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupLauncher");
}

id objc_msgSend_setupObservers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupObservers");
}

id objc_msgSend_setupPromptDirector(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupPromptDirector");
}

id objc_msgSend_setupSharedManagerWithVehicleStore_sessionStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupSharedManagerWithVehicleStore:sessionStatus:");
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shared");
}

id objc_msgSend_sharedAVSystemController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedAVSystemController");
}

id objc_msgSend_sharedAccessoryManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedAccessoryManager");
}

id objc_msgSend_sharedClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedClient");
}

id objc_msgSend_sharedConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedConfiguration");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedManager");
}

id objc_msgSend_sharedPairingAgent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedPairingAgent");
}

id objc_msgSend_sharedPreferences(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedPreferences");
}

id objc_msgSend_sharingClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharingClient");
}

id objc_msgSend_shouldActivateWithCarPlay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldActivateWithCarPlay");
}

id objc_msgSend_shouldAlwaysAcceptCCCHeadUnitPairing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldAlwaysAcceptCCCHeadUnitPairing");
}

id objc_msgSend_shouldCreateGeofenceAroundStart(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldCreateGeofenceAroundStart");
}

id objc_msgSend_shouldEnableBluetooth(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldEnableBluetooth");
}

id objc_msgSend_shouldEnableWiFi(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldEnableWiFi");
}

id objc_msgSend_shouldPresentHeadUnitPairingPromptSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldPresentHeadUnitPairingPromptSession:");
}

id objc_msgSend_shouldRecordAnalyticsEvents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldRecordAnalyticsEvents");
}

id objc_msgSend_shouldResetToMuted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldResetToMuted");
}

id objc_msgSend_shouldTriggerSysdiagnose(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldTriggerSysdiagnose");
}

id objc_msgSend_showBluetoothOnlyOption(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showBluetoothOnlyOption");
}

id objc_msgSend_showDNDEndNotificationWithText_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showDNDEndNotificationWithText:completion:");
}

id objc_msgSend_showDNDEnterGeofenceWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showDNDEnterGeofenceWithCompletion:");
}

id objc_msgSend_showDNDExitGeofenceWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showDNDExitGeofenceWithCompletion:");
}

id objc_msgSend_showDNDNotDrivingAlertWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showDNDNotDrivingAlertWithCompletion:");
}

id objc_msgSend_showsInternalAlerts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showsInternalAlerts");
}

id objc_msgSend_signatureData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "signatureData");
}

id objc_msgSend_sinkWithCompletion_receiveInput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sinkWithCompletion:receiveInput:");
}

id objc_msgSend_siriAccount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "siriAccount");
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_sortedConnectionEvents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedConnectionEvents");
}

id objc_msgSend_soundRecognitionPreference(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "soundRecognitionPreference");
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "source");
}

id objc_msgSend_sourceVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sourceVersion");
}

id objc_msgSend_stagedClusterAssetURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stagedClusterAssetURL");
}

id objc_msgSend_stagedClusterAssetVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stagedClusterAssetVersion");
}

id objc_msgSend_stagedClusterAssetiOSContentVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stagedClusterAssetiOSContentVersion");
}

id objc_msgSend_standardOutput(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardOutput");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "start");
}

id objc_msgSend_startAdvertisingCarPlayControlForUSB(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startAdvertisingCarPlayControlForUSB");
}

id objc_msgSend_startAdvertisingCarPlayControlForWiFiUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startAdvertisingCarPlayControlForWiFiUUID:");
}

id objc_msgSend_startCatalogDownload_options_completionWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startCatalogDownload:options:completionWithError:");
}

id objc_msgSend_startCatalogDownload_options_then_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startCatalogDownload:options:then:");
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startDate");
}

id objc_msgSend_startDictationWithLanguageCode_options_speechOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startDictationWithLanguageCode:options:speechOptions:");
}

id objc_msgSend_startDownload_completionWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startDownload:completionWithError:");
}

id objc_msgSend_startDownload_then_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startDownload:then:");
}

id objc_msgSend_startMonitoringForRegion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startMonitoringForRegion:");
}

id objc_msgSend_startMonitoringSignificantLocationChanges(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startMonitoringSignificantLocationChanges");
}

id objc_msgSend_startProxCardTransactionWithOptions_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startProxCardTransactionWithOptions:completion:");
}

id objc_msgSend_startSessionWithHost_requestIdentifier_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startSessionWithHost:requestIdentifier:completion:");
}

id objc_msgSend_startTimeoutTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startTimeoutTimer");
}

id objc_msgSend_startUpdatingLocation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startUpdatingLocation");
}

id objc_msgSend_startedFromCarKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startedFromCarKey");
}

id objc_msgSend_starting(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "starting");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "state");
}

id objc_msgSend_stateMachine(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateMachine");
}

id objc_msgSend_stateMachine_receivedAirplaneMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateMachine:receivedAirplaneMode:");
}

id objc_msgSend_stateMachine_receivedVehicleState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateMachine:receivedVehicleState:");
}

id objc_msgSend_statisticsReceiver(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statisticsReceiver");
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "status");
}

id objc_msgSend_stopMonitoringForRegion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopMonitoringForRegion:");
}

id objc_msgSend_stopMonitoringLOIs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopMonitoringLOIs");
}

id objc_msgSend_stopMonitoringSignificantLocationChanges(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopMonitoringSignificantLocationChanges");
}

id objc_msgSend_stopRecording(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopRecording");
}

id objc_msgSend_stopSpeechWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopSpeechWithOptions:");
}

id objc_msgSend_stopTimeoutTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopTimeoutTimer");
}

id objc_msgSend_stopUpdatingLocation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopUpdatingLocation");
}

id objc_msgSend_stopWaitingForConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopWaitingForConnection");
}

id objc_msgSend_stoppedSessionForHostIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stoppedSessionForHostIdentifier:");
}

id objc_msgSend_storedVehicleForSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storedVehicleForSession:");
}

id objc_msgSend_storedVehicleProvider(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storedVehicleProvider");
}

id objc_msgSend_streamError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "streamError");
}

id objc_msgSend_streamStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "streamStatus");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "string");
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByReplacingMatchesInString_options_range_withTemplate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByReplacingMatchesInString:options:range:withTemplate:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByTrimmingCharactersInSet:");
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringForKey:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringFromTimeInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromTimeInterval:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringValue");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithString:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_strongToWeakObjectsMapTable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "strongToWeakObjectsMapTable");
}

id objc_msgSend_subdataWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subdataWithRange:");
}

id objc_msgSend_subscribeOn_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subscribeOn:");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_sunrise(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sunrise");
}

id objc_msgSend_sunset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sunset");
}

id objc_msgSend_supportedCarPlayFeaturesForCertificateSerial_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportedCarPlayFeaturesForCertificateSerial:");
}

id objc_msgSend_supportedCarPlayFeaturesForVehicleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportedCarPlayFeaturesForVehicleIdentifier:");
}

id objc_msgSend_supportsACBack(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsACBack");
}

id objc_msgSend_supportsAccNav(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsAccNav");
}

id objc_msgSend_supportsBluetoothLE(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsBluetoothLE");
}

id objc_msgSend_supportsCarPlay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsCarPlay");
}

id objc_msgSend_supportsCarPlayConnectionRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsCarPlayConnectionRequest");
}

id objc_msgSend_supportsElectronicTollCollection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsElectronicTollCollection");
}

id objc_msgSend_supportsEnhancedIntegration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsEnhancedIntegration");
}

id objc_msgSend_supportsHighFidelityTouch(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsHighFidelityTouch");
}

id objc_msgSend_supportsLogTransfer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsLogTransfer");
}

id objc_msgSend_supportsMixableAudio(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsMixableAudio");
}

id objc_msgSend_supportsSiriMixable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsSiriMixable");
}

id objc_msgSend_supportsSiriZLL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsSiriZLL");
}

id objc_msgSend_supportsSiriZLLButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsSiriZLLButton");
}

id objc_msgSend_supportsStartSessionRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsStartSessionRequest");
}

id objc_msgSend_supportsThemeAssets(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsThemeAssets");
}

id objc_msgSend_supportsThemeAssetsForPairingPromptFlow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsThemeAssetsForPairingPromptFlow:");
}

id objc_msgSend_supportsUSBCarPlay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsUSBCarPlay");
}

id objc_msgSend_supportsVehicleData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsVehicleData");
}

id objc_msgSend_supportsWiredBluetoothPairing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsWiredBluetoothPairing");
}

id objc_msgSend_supportsWiredCarPlay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsWiredCarPlay");
}

id objc_msgSend_supportsWiredToWirelessPairing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsWiredToWirelessPairing");
}

id objc_msgSend_supportsWirelessCarPlay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsWirelessCarPlay");
}

id objc_msgSend_syncSettings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncSettings");
}

id objc_msgSend_sysdiagnoseWithMetadata_onCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sysdiagnoseWithMetadata:onCompletion:");
}

id objc_msgSend_systemNightMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemNightMode");
}

id objc_msgSend_takeAssertion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "takeAssertion:");
}

id objc_msgSend_tearDownObservers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tearDownObservers");
}

id objc_msgSend_temporaryDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "temporaryDirectory");
}

id objc_msgSend_terminate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "terminate");
}

id objc_msgSend_terminationReason(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "terminationReason");
}

id objc_msgSend_terminationStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "terminationStatus");
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "text");
}

id objc_msgSend_themeAssetReceiver(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "themeAssetReceiver");
}

id objc_msgSend_themeAssetsAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "themeAssetsAvailable");
}

id objc_msgSend_themeWritersForSessionIDs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "themeWritersForSessionIDs");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceNow");
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceReferenceDate");
}

id objc_msgSend_timeRange(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeRange");
}

id objc_msgSend_timeoutTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeoutTimer");
}

id objc_msgSend_timerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timerWithTimeInterval:target:selector:userInfo:repeats:");
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timestamp");
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "title");
}

id objc_msgSend_totalExpected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "totalExpected");
}

id objc_msgSend_totalUnitCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "totalUnitCount");
}

id objc_msgSend_totalWritten(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "totalWritten");
}

id objc_msgSend_transcription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transcription");
}

id objc_msgSend_transitionToState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transitionToState:");
}

id objc_msgSend_transportType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transportType");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "type");
}

id objc_msgSend_unionSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unionSet:");
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unlock");
}

id objc_msgSend_unpair(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unpair");
}

id objc_msgSend_unpairPeer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unpairPeer:");
}

id objc_msgSend_unpairWithBluetoothAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unpairWithBluetoothAddress:");
}

id objc_msgSend_unpairWithBluetoothLEIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unpairWithBluetoothLEIdentifier:");
}

id objc_msgSend_unregisterObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unregisterObserver:");
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

id objc_msgSend_updateExistingNetwork_password_securityType_channel_carPlayUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateExistingNetwork:password:securityType:channel:carPlayUUID:");
}

id objc_msgSend_updateIncompletePairingsMatchingMessagingVehicles_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateIncompletePairingsMatchingMessagingVehicles:");
}

id objc_msgSend_updateReason(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateReason");
}

id objc_msgSend_updateSource(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateSource");
}

id objc_msgSend_updateStoredVehicle_usingMessagingVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateStoredVehicle:usingMessagingVehicle:");
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uppercaseString");
}

id objc_msgSend_urlForSavingLogsForFileReceiverSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "urlForSavingLogsForFileReceiverSession:");
}

id objc_msgSend_usbIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "usbIdentifier");
}

id objc_msgSend_userChangedAutoReplyFromAudience_toAudience_messageChanged_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userChangedAutoReplyFromAudience:toAudience:messageChanged:");
}

id objc_msgSend_userChangedFromTriggerMethod_toMethod_withMechanism_fromPreviousInterval_activateWithCarPlay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userChangedFromTriggerMethod:toMethod:withMechanism:fromPreviousInterval:activateWithCarPlay:");
}

id objc_msgSend_userCreatedWirelessPairingWithSource_payload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userCreatedWirelessPairingWithSource:payload:");
}

id objc_msgSend_userDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userDefaults");
}

id objc_msgSend_userDisableTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userDisableTimer");
}

id objc_msgSend_userIndicatedNotDrivingWithReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userIndicatedNotDrivingWithReason:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userInfoDictionaryForConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfoDictionaryForConnection:");
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInterfaceStyle");
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "value");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_valueForKeyPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKeyPath:");
}

id objc_msgSend_valueWithEdgeInsets_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueWithEdgeInsets:");
}

id objc_msgSend_vehicle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vehicle");
}

id objc_msgSend_vehicleAccessoryForCertificateSerial_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vehicleAccessoryForCertificateSerial:");
}

id objc_msgSend_vehicleAccessoryForiAPConnectionIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vehicleAccessoryForiAPConnectionIdentifier:");
}

id objc_msgSend_vehicleAssetManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vehicleAssetManager");
}

id objc_msgSend_vehicleFirmwareVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vehicleFirmwareVersion");
}

id objc_msgSend_vehicleForBluetoothAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vehicleForBluetoothAddress:");
}

id objc_msgSend_vehicleForCertificateSerial_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vehicleForCertificateSerial:");
}

id objc_msgSend_vehicleForIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vehicleForIdentifier:");
}

id objc_msgSend_vehicleForMessagingVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vehicleForMessagingVehicle:");
}

id objc_msgSend_vehicleHardwareVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vehicleHardwareVersion");
}

id objc_msgSend_vehicleInformation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vehicleInformation");
}

id objc_msgSend_vehicleManufacturer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vehicleManufacturer");
}

id objc_msgSend_vehicleMatchingMessagingVehicle_inVehicles_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vehicleMatchingMessagingVehicle:inVehicles:");
}

id objc_msgSend_vehicleModelName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vehicleModelName");
}

id objc_msgSend_vehicleName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vehicleName");
}

id objc_msgSend_vehicleOperatorState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vehicleOperatorState");
}

id objc_msgSend_vehicleSerialNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vehicleSerialNumber");
}

id objc_msgSend_vehicleState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vehicleState");
}

id objc_msgSend_vehicleStateCheckTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vehicleStateCheckTimer");
}

id objc_msgSend_vehicleStateClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vehicleStateClass");
}

id objc_msgSend_vehicleStateDebugDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vehicleStateDebugDescription");
}

id objc_msgSend_vehicleStore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vehicleStore");
}

id objc_msgSend_vehicleStore_didRemoveVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vehicleStore:didRemoveVehicle:");
}

id objc_msgSend_vehicleStore_didSaveVehicle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vehicleStore:didSaveVehicle:");
}

id objc_msgSend_vehicleStoreDidBecomeAvailable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vehicleStoreDidBecomeAvailable:");
}

id objc_msgSend_vehicleSupportsDestinationSharing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vehicleSupportsDestinationSharing");
}

id objc_msgSend_vehicleSupportsStartSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vehicleSupportsStartSession");
}

id objc_msgSend_vehiclesForBluetoothIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vehiclesForBluetoothIdentifiers");
}

id objc_msgSend_vehicularHints(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vehicularHints");
}

id objc_msgSend_vehicularOperatorState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vehicularOperatorState");
}

id objc_msgSend_vehicularState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vehicularState");
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "version");
}

id objc_msgSend_viewAreaInsets(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewAreaInsets");
}

id objc_msgSend_viewAreas(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewAreas");
}

id objc_msgSend_visibleFrame(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "visibleFrame");
}

id objc_msgSend_voiceControlPreference(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "voiceControlPreference");
}

id objc_msgSend_voiceTriggerMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "voiceTriggerMode");
}

id objc_msgSend_waitForSessionInitialization(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitForSessionInitialization");
}

id objc_msgSend_waitUntilExit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitUntilExit");
}

id objc_msgSend_waitingOnMessagingVehicleTimeout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitingOnMessagingVehicleTimeout");
}

id objc_msgSend_waitingOnMessagingVehicleTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitingOnMessagingVehicleTimer");
}

id objc_msgSend_waitingOnSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitingOnSession");
}

id objc_msgSend_wallpaperDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wallpaperDescription");
}

id objc_msgSend_wallpaperIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wallpaperIdentifier");
}

id objc_msgSend_wasPairing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wasPairing");
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whitespaceAndNewlineCharacterSet");
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whitespaceCharacterSet");
}

id objc_msgSend_wiFiManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wiFiManager");
}

id objc_msgSend_wifiChannel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wifiChannel");
}

id objc_msgSend_wifiManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wifiManager");
}

id objc_msgSend_willDisableCertificateSerial_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willDisableCertificateSerial:reply:");
}

id objc_msgSend_willEnableCertificateSerial_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willEnableCertificateSerial:reply:");
}

id objc_msgSend_wiredAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wiredAvailable");
}

id objc_msgSend_wiredIPs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wiredIPs");
}

id objc_msgSend_wiredSessionEnded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wiredSessionEnded");
}

id objc_msgSend_wirelessAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wirelessAvailable");
}

id objc_msgSend_wirelessConnectionDurationTTRThreshold(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wirelessConnectionDurationTTRThreshold");
}

id objc_msgSend_wirelessIPs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wirelessIPs");
}

id objc_msgSend_wirelessReconnectCancelled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wirelessReconnectCancelled");
}

id objc_msgSend_wirelessReconnectEndDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wirelessReconnectEndDate");
}

id objc_msgSend_wirelessReconnectStartDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wirelessReconnectStartDate");
}

id objc_msgSend_wirelessReconnectStarted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wirelessReconnectStarted");
}

id objc_msgSend_wirelessSessionEndedWithPayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wirelessSessionEndedWithPayload:");
}

id objc_msgSend_workQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "workQueue");
}

id objc_msgSend_workerQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "workerQueue");
}

id objc_msgSend_write_maxLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "write:maxLength:");
}

id objc_msgSend_writeData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeData:error:");
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:");
}

id objc_msgSend_writeToURL_atomically_encoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:atomically:encoding:error:");
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:options:error:");
}
