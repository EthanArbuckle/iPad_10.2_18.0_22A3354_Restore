void sub_100003030(uint64_t a1, void *a2, void *a3, void *a4)
{
  sub_100003038(*(void **)(a1 + 32), a2, a3, a4);
}

void sub_100003038(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  CDGetInfoRequest *v11;
  uint64_t v12;
  NSObject *v13;
  CDLearnMoreGetAuthInfoResponse *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  os_activity_scope_state_s v20;
  uint8_t buf[4];
  CDGetInfoRequest *v22;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v10 = _os_activity_create((void *)&_mh_execute_header, "learn more session/handle get auth info request", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    v20.opaque[0] = 0;
    v20.opaque[1] = 0;
    os_activity_scope_enter(v10, &v20);
    v11 = -[CDGetInfoRequest initWithRapportDictionary:]([CDGetInfoRequest alloc], "initWithRapportDictionary:", v7);
    v12 = cps_session_log(v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received get auth info request: %@", buf, 0xCu);
    }

    v14 = objc_alloc_init(CDLearnMoreGetAuthInfoResponse);
    v15 = (void *)GestaltCopyAnswer(CFSTR("DeviceName"), 0, 0);
    -[CDLearnMoreGetAuthInfoResponse setDeviceClass:](v14, "setDeviceClass:", v15);

    v16 = (void *)GestaltCopyAnswer(CFSTR("UserAssignedDeviceName"), 0, 0);
    -[CDLearnMoreGetAuthInfoResponse setDeviceName:](v14, "setDeviceName:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "request"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "URL"));
    -[CDLearnMoreGetAuthInfoResponse setURL:](v14, "setURL:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CDLearnMoreGetAuthInfoResponse makeRapportDictionary](v14, "makeRapportDictionary"));
    (*((void (**)(id, void *, _QWORD, _QWORD))v9 + 2))(v9, v19, 0, 0);

    os_activity_scope_leave(&v20);
  }

}

void sub_100003238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_10000325C(uint64_t a1, void *a2, void *a3, void *a4)
{
  sub_100003264(*(void **)(a1 + 32), a2, a3, a4);
}

void sub_100003264(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  CDLearnMoreDidFinishRequest *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  os_activity_scope_state_s v18;
  uint8_t buf[4];
  CDLearnMoreDidFinishRequest *v20;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v10 = _os_activity_create((void *)&_mh_execute_header, "learn more session/handle did finish auth request", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    v18.opaque[0] = 0;
    v18.opaque[1] = 0;
    os_activity_scope_enter(v10, &v18);
    v11 = -[CDLearnMoreDidFinishRequest initWithRapportDictionary:]([CDLearnMoreDidFinishRequest alloc], "initWithRapportDictionary:", v7);
    v12 = cps_session_log(v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received did finish auth request: %@", buf, 0xCu);
    }

    v14 = objc_alloc_init((Class)CPSDevice);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CDLearnMoreDidFinishRequest deviceName](v11, "deviceName"));
    objc_msgSend(v14, "setName:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CDLearnMoreDidFinishRequest deviceModel](v11, "deviceModel"));
    objc_msgSend(v14, "setModel:", v16);

    objc_msgSend(v14, "setFlags:", -[CDLearnMoreDidFinishRequest deviceFlags](v11, "deviceFlags"));
    objc_msgSend(a1, "_notifyDeviceAcceptedNotification:", v14);
    v17 = objc_alloc_init((Class)CPSLearnMoreResponse);
    objc_msgSend(a1, "_notifySessionFinished:", v17);
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v9 + 2))(v9, 0, 0, 0);

    os_activity_scope_leave(&v18);
  }

}

void sub_100003450(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1000035F8(uint64_t a1, void *a2, void *a3, void *a4)
{
  sub_100003600(*(void **)(a1 + 32), a2, a3, a4);
}

void sub_100003600(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  CDGetInfoRequest *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  uint64_t v20;
  CDRestrictedAccessGetAuthInfoResponse *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  os_activity_scope_state_s v29;
  uint8_t buf[4];
  CDGetInfoRequest *v31;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v10 = _os_activity_create((void *)&_mh_execute_header, "restricted access session/handle get auth info request", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    v29.opaque[0] = 0;
    v29.opaque[1] = 0;
    os_activity_scope_enter(v10, &v29);
    v11 = -[CDGetInfoRequest initWithRapportDictionary:]([CDGetInfoRequest alloc], "initWithRapportDictionary:", v7);
    v12 = cps_session_log(v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received get auth info request: %@", buf, 0xCu);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "request"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "approversAppleAccountAltDSIDs"));
    v16 = v15 == 0;

    if (v16
      || (v17 = (void *)objc_claimAutoreleasedReturnValue(-[CDGetInfoRequest appleAccountToken](v11, "appleAccountToken")),
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[CDGetInfoRequest nonce](v11, "nonce")),
          v19 = sub_100003C4C(a1, v17, v18),
          v18,
          v17,
          (v19 & 1) != 0))
    {
      v21 = objc_alloc_init(CDRestrictedAccessGetAuthInfoResponse);
      v22 = (void *)GestaltCopyAnswer(CFSTR("DeviceName"), 0, 0);
      -[CDRestrictedAccessGetAuthInfoResponse setDeviceClass:](v21, "setDeviceClass:", v22);

      v23 = (void *)GestaltCopyAnswer(CFSTR("UserAssignedDeviceName"), 0, 0);
      -[CDRestrictedAccessGetAuthInfoResponse setDeviceName:](v21, "setDeviceName:", v23);

      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "request"));
      -[CDRestrictedAccessGetAuthInfoResponse setRestrictionType:](v21, "setRestrictionType:", objc_msgSend(v24, "restrictionType"));

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[CDRestrictedAccessGetAuthInfoResponse makeRapportDictionary](v21, "makeRapportDictionary"));
      (*((void (**)(id, void *, _QWORD, _QWORD))v9 + 2))(v9, v25, 0, 0);

    }
    else
    {
      v26 = cps_session_log(v20);
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        sub_10001E0B0(v27);

      v28 = NSErrorF(NSOSStatusErrorDomain, 4294960542, "Invalid account token.");
      v21 = (CDRestrictedAccessGetAuthInfoResponse *)objc_claimAutoreleasedReturnValue(v28);
      (*((void (**)(id, _QWORD, _QWORD, CDRestrictedAccessGetAuthInfoResponse *))v9 + 2))(v9, 0, 0, v21);
    }

    os_activity_scope_leave(&v29);
  }

}

void sub_1000038CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1000038F4(uint64_t a1, void *a2, void *a3, void *a4)
{
  sub_1000038FC(*(void **)(a1 + 32), a2, a3, a4);
}

void sub_1000038FC(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  CDRestrictedAccesssDidFinishAuthRequest *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  id v19;
  os_activity_scope_state_s v20;
  uint8_t buf[4];
  CDRestrictedAccesssDidFinishAuthRequest *v22;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v10 = _os_activity_create((void *)&_mh_execute_header, "restricted access session/handle did finish auth request", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    v20.opaque[0] = 0;
    v20.opaque[1] = 0;
    os_activity_scope_enter(v10, &v20);
    v11 = -[CDRestrictedAccesssDidFinishAuthRequest initWithRapportDictionary:]([CDRestrictedAccesssDidFinishAuthRequest alloc], "initWithRapportDictionary:", v7);
    v12 = cps_session_log(v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received did finish auth request: %@", buf, 0xCu);
    }

    v14 = objc_alloc_init((Class)CPSDevice);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CDRestrictedAccesssDidFinishAuthRequest deviceName](v11, "deviceName"));
    objc_msgSend(v14, "setName:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CDRestrictedAccesssDidFinishAuthRequest deviceModel](v11, "deviceModel"));
    objc_msgSend(v14, "setModel:", v16);

    objc_msgSend(v14, "setFlags:", -[CDRestrictedAccesssDidFinishAuthRequest deviceFlags](v11, "deviceFlags"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "model"));
    v18 = GestaltProductTypeStringToDeviceClass() == 6;

    if (v18)
      objc_msgSend(a1, "_notifyDeviceAcceptedNotification:", v14);
    if (-[CDRestrictedAccesssDidFinishAuthRequest isApproved](v11, "isApproved"))
    {
      v19 = objc_alloc_init((Class)CPSRestrictedAccessResponse);
      objc_msgSend(a1, "_notifySessionFinished:", v19);
    }
    else
    {
      v19 = (id)objc_claimAutoreleasedReturnValue(-[CDRestrictedAccesssDidFinishAuthRequest error](v11, "error"));
      objc_msgSend(a1, "_notifySessionFailed:", v19);
    }

    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v9 + 2))(v9, 0, 0, 0);
    os_activity_scope_leave(&v20);

  }
}

void sub_100003B40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void *sub_100003C4C(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  unsigned __int8 v33;
  _BYTE v34[128];

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "request"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "approversAppleAccountAltDSIDs"));

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v30;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v30 != v11)
            objc_enumerationMutation(v8);
          v13 = 0;
          if (v6 && *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i))
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@+%@"), *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i), v6));
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dataUsingEncoding:", 4));
            if (v15)
            {
              v16 = malloc_type_malloc(0x40uLL, 0xCC7B9F1DuLL);
              v27 = kCryptoHashDescriptor_SHA512;
              v17 = objc_retainAutorelease(v15);
              v28 = v14;
              v18 = v10;
              v19 = v11;
              v20 = v6;
              v21 = v8;
              v22 = v5;
              v23 = objc_msgSend(v17, "bytes");
              v24 = objc_msgSend(v17, "length");
              v25 = v23;
              v5 = v22;
              v8 = v21;
              v6 = v20;
              v11 = v19;
              v10 = v18;
              v14 = v28;
              CryptoHashOneShot(v27, v25, v24, v16);
              v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", v16, 64, 1));
            }
            else
            {
              v13 = 0;
            }

          }
          if (objc_msgSend(v13, "isEqualToData:", v5))
          {
            v33 = 1;

            a1 = (void *)v33;
            goto LABEL_18;
          }

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        if (v10)
          continue;
        break;
      }
    }

    a1 = 0;
  }
LABEL_18:

  return a1;
}

void sub_100004130(uint64_t a1, void *a2, void *a3, void *a4)
{
  sub_100004138(*(void **)(a1 + 32), a2, a3, a4);
}

void sub_100004138(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  CDGetInfoRequest *v11;
  uint64_t v12;
  NSObject *v13;
  CDSharingGetAuthInfoResponse *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  os_activity_scope_state_s v20;
  uint8_t buf[4];
  CDGetInfoRequest *v22;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v10 = _os_activity_create((void *)&_mh_execute_header, "sharing session/handle get auth info request", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    v20.opaque[0] = 0;
    v20.opaque[1] = 0;
    os_activity_scope_enter(v10, &v20);
    v11 = -[CDGetInfoRequest initWithRapportDictionary:]([CDGetInfoRequest alloc], "initWithRapportDictionary:", v7);
    v12 = cps_session_log(v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received get auth info request: %@", buf, 0xCu);
    }

    v14 = objc_alloc_init(CDSharingGetAuthInfoResponse);
    v15 = (void *)GestaltCopyAnswer(CFSTR("DeviceName"), 0, 0);
    -[CDSharingGetAuthInfoResponse setDeviceClass:](v14, "setDeviceClass:", v15);

    v16 = (void *)GestaltCopyAnswer(CFSTR("UserAssignedDeviceName"), 0, 0);
    -[CDSharingGetAuthInfoResponse setDeviceName:](v14, "setDeviceName:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "request"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "requestData"));
    -[CDSharingGetAuthInfoResponse setRequestData:](v14, "setRequestData:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CDSharingGetAuthInfoResponse makeRapportDictionary](v14, "makeRapportDictionary"));
    (*((void (**)(id, void *, _QWORD, _QWORD))v9 + 2))(v9, v19, 0, 0);

    os_activity_scope_leave(&v20);
  }

}

void sub_100004338(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_10000435C(uint64_t a1, void *a2, void *a3, void *a4)
{
  sub_100004364(*(void **)(a1 + 32), a2, a3, a4);
}

void sub_100004364(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  CDSharingDidFinishAuthRequest *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  id v15;
  os_activity_scope_state_s v16;
  uint8_t buf[4];
  CDSharingDidFinishAuthRequest *v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v10 = _os_activity_create((void *)&_mh_execute_header, "sharing session/handle did finish auth request", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    v16.opaque[0] = 0;
    v16.opaque[1] = 0;
    os_activity_scope_enter(v10, &v16);
    v11 = -[CDSharingDidFinishAuthRequest initWithRapportDictionary:]([CDSharingDidFinishAuthRequest alloc], "initWithRapportDictionary:", v7);
    v12 = cps_session_log(v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received did finish auth request: %@", buf, 0xCu);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CDSharingDidFinishAuthRequest error](v11, "error"));
    if (v14)
    {
      v15 = (id)objc_claimAutoreleasedReturnValue(-[CDSharingDidFinishAuthRequest error](v11, "error"));
      objc_msgSend(a1, "_notifySessionFailed:", v15);
    }
    else
    {
      v15 = objc_alloc_init((Class)CPSSharingResponse);
      objc_msgSend(a1, "_notifySessionFinished:", v15);
    }

    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v9 + 2))(v9, 0, 0, 0);
    os_activity_scope_leave(&v16);

  }
}

void sub_100004514(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

_BYTE *sub_100004704(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (!result[41])
    return objc_msgSend(result, "_activated");
  return result;
}

id sub_1000047BC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

id sub_100004AEC(uint64_t a1)
{
  id v2;

  v2 = objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("serviceListener"));
  return objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("currentSession"));
}

id sub_100004EE8(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "authenticationSessionDeviceTappedNotification:", a2);
}

id sub_100004EF4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "authenticationSessionDeviceStartedAuthentication:", a2);
}

id sub_100004F00(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "authenticationSessionDidFinishWithResponse:", a2);
}

id sub_100004F0C(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "authenticationSessionDidFailWithError:", a2);
}

void sub_100004F18(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = 0;

}

void sub_1000052F0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 114))
    sub_100005304(v1);
}

void sub_100005304(uint64_t a1)
{
  uint64_t v2;

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 176));
    sub_10000554C((id)a1);
    if (*(_QWORD *)(a1 + 152))
    {
      sub_100005628(a1);
    }
    else
    {
      sub_1000056AC((id)a1);
      v2 = *(_QWORD *)(a1 + 168);
      if (v2 == 2)
      {
        sub_100005918(a1);
      }
      else if (v2 == 1)
      {
        sub_100005854(a1);
      }
      else
      {
        sub_1000053F0(a1);
      }
    }
  }
}

void sub_1000053E8(uint64_t a1)
{
  sub_1000053F0(*(_QWORD *)(a1 + 32));
}

void sub_1000053F0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v14;
  void *v15;
  uint8_t v16[16];

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 176));
    if (!*(_BYTE *)(a1 + 114))
    {
      v3 = cps_session_log(v2);
      v4 = objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Session invalidated.", v16, 2u);
      }

      objc_msgSend(*(id *)(a1 + 16), "invalidate");
      v5 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = 0;

      objc_msgSend(*(id *)(a1 + 24), "invalidate");
      v6 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = 0;

      objc_msgSend(*(id *)(a1 + 32), "invalidate");
      v7 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = 0;

      v8 = *(void **)(a1 + 72);
      *(_QWORD *)(a1 + 72) = 0;

      objc_msgSend(*(id *)(a1 + 40), "invalidate");
      v9 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = 0;

      objc_msgSend(*(id *)(a1 + 48), "invalidate");
      v10 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = 0;

      objc_msgSend(*(id *)(a1 + 56), "invalidate");
      v11 = *(void **)(a1 + 56);
      *(_QWORD *)(a1 + 56) = 0;

      objc_msgSend(*(id *)(a1 + 128), "cancel");
      v12 = *(void **)(a1 + 128);
      *(_QWORD *)(a1 + 128) = 0;

      if (!*(_BYTE *)(a1 + 136) && !*(_BYTE *)(a1 + 112))
        objc_msgSend(*(id *)(a1 + 144), "invalidate");
      v13 = *(void **)(a1 + 144);
      *(_QWORD *)(a1 + 144) = 0;

      v14 = *(_QWORD *)(a1 + 200);
      if (v14)
      {
        (*(void (**)(void))(v14 + 16))();
        v15 = *(void **)(a1 + 200);
        *(_QWORD *)(a1 + 200) = 0;

      }
      *(_BYTE *)(a1 + 114) = 1;
    }
  }
}

id sub_10000554C(id result)
{
  id v1;
  uint64_t v2;
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[16];

  if (result)
  {
    v1 = result;
    v2 = cps_session_log(result);
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting system monitor.", buf, 2u);
    }

    v4 = objc_alloc_init((Class)CUSystemMonitor);
    v5 = (void *)*((_QWORD *)v1 + 5);
    *((_QWORD *)v1 + 5) = v4;

    objc_msgSend(*((id *)v1 + 5), "setDispatchQueue:", *((_QWORD *)v1 + 22));
    v6 = (void *)*((_QWORD *)v1 + 5);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100007868;
    v7[3] = &unk_1000307A0;
    v7[4] = v1;
    objc_msgSend(v6, "setScreenOnChangedHandler:", v7);
    return objc_msgSend(*((id *)v1 + 5), "activateWithCompletion:", &stru_1000309D8);
  }
  return result;
}

void sub_100005628(uint64_t a1)
{
  id *v2;
  id v3;
  uint64_t v4;
  NSObject *v5;

  if (a1)
  {
    v2 = (id *)(a1 + 152);
    v3 = objc_msgSend(*(id *)(a1 + 152), "authType");
    if (v3 == (id)14)
    {
      sub_1000074CC(a1);
    }
    else
    {
      v4 = cps_session_log(v3);
      v5 = objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        sub_10001E0F0(v2, v5);

      sub_1000053F0(a1);
    }
  }
}

id sub_1000056AC(id result)
{
  id v1;
  uint64_t v2;
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];
  uint8_t buf[16];

  if (result)
  {
    v1 = result;
    v2 = cps_session_log(result);
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting device discovery.", buf, 2u);
    }

    v4 = objc_alloc_init((Class)SFDeviceDiscovery);
    v5 = (void *)*((_QWORD *)v1 + 6);
    *((_QWORD *)v1 + 6) = v4;

    objc_msgSend(*((id *)v1 + 6), "setDispatchQueue:", *((_QWORD *)v1 + 22));
    objc_msgSend(*((id *)v1 + 6), "setChangeFlags:", 1);
    objc_msgSend(*((id *)v1 + 6), "setDiscoveryFlags:", 16);
    v6 = (void *)*((_QWORD *)v1 + 6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleIdentifier"));
    objc_msgSend(v6, "setPurpose:", v8);

    objc_msgSend(*((id *)v1 + 6), "setScanRate:", 30);
    objc_msgSend(*((id *)v1 + 6), "setRssiThreshold:", -75);
    objc_msgSend(*((id *)v1 + 6), "setOverrideScreenOff:", 1);
    v9 = (void *)*((_QWORD *)v1 + 6);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100007574;
    v14[3] = &unk_100030970;
    v14[4] = v1;
    objc_msgSend(v9, "setDeviceChangedHandler:", v14);
    v10 = (void *)*((_QWORD *)v1 + 6);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000076D4;
    v13[3] = &unk_100030998;
    v13[4] = v1;
    objc_msgSend(v10, "setDeviceLostHandler:", v13);
    v11 = (void *)*((_QWORD *)v1 + 6);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000077AC;
    v12[3] = &unk_100030840;
    v12[4] = v1;
    return objc_msgSend(v11, "activateWithCompletion:", v12);
  }
  return result;
}

void sub_100005854(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  if (a1)
  {
    v2 = objc_alloc_init((Class)RPCompanionLinkDevice);
    objc_msgSend(v2, "setIdentifier:", *(_QWORD *)(a1 + 160));
    v3 = objc_alloc_init((Class)RPCompanionLinkClient);
    v4 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v3;

    objc_msgSend(*(id *)(a1 + 16), "setDispatchQueue:", *(_QWORD *)(a1 + 176));
    objc_msgSend(*(id *)(a1 + 16), "setControlFlags:", 0x80000103800);
    objc_msgSend(*(id *)(a1 + 16), "setDestinationDevice:", v2);
    v5 = *(void **)(a1 + 16);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100005C60;
    v6[3] = &unk_100030840;
    v6[4] = a1;
    objc_msgSend(v5, "activateWithCompletion:", v6);

  }
}

void sub_100005918(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD v16[5];
  uint8_t buf[16];
  os_activity_scope_state_s state;

  if (a1)
  {
    v2 = _os_activity_create((void *)&_mh_execute_header, "legacy app sign in session/start", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v2, &state);
    v4 = cps_session_log(v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting legacy app sign in session.", buf, 2u);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](ACAccountStore, "defaultStore"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ams_activeiCloudAccount"));
    v8 = *(void **)(a1 + 64);
    *(_QWORD *)(a1 + 64) = v7;

    if (*(_QWORD *)(a1 + 64))
    {
      v10 = objc_alloc_init((Class)RPCompanionLinkDevice);
      objc_msgSend(v10, "setIdentifier:", *(_QWORD *)(a1 + 160));
      v11 = objc_alloc_init((Class)RPCompanionLinkClient);
      v12 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v11;

      objc_msgSend(*(id *)(a1 + 16), "setDispatchQueue:", *(_QWORD *)(a1 + 176));
      objc_msgSend(*(id *)(a1 + 16), "setDestinationDevice:", v10);
      v13 = *(void **)(a1 + 16);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100009420;
      v16[3] = &unk_100030840;
      v16[4] = a1;
      objc_msgSend(v13, "activateWithCompletion:", v16);

    }
    else
    {
      v14 = cps_session_log(v9);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_10001E170();

      sub_1000053F0(a1);
    }
    os_activity_scope_leave(&state);

  }
}

void sub_100005AB8(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 48));
  _Unwind_Resume(a1);
}

void sub_100005AD8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = cps_session_log(v3);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10001E19C();

    v7 = *(_QWORD *)(a1 + 192);
    if (v7)
    {
      if (v4)
      {
        (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v4);
      }
      else
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CPSErrorDomain, 100, 0));
        (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

      }
    }
  }

}

void sub_100005B94(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  id v8;

  v3 = a2;
  if (a1)
  {
    v4 = cps_session_log();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Authentication session finished: %@", (uint8_t *)&v7, 0xCu);
    }

    v6 = *(_QWORD *)(a1 + 184);
    if (v6)
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }

}

void sub_100005C60(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = cps_session_log(v3);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10001E1FC();

    sub_1000053F0(*(_QWORD *)(a1 + 32));
  }
  else
  {
    sub_100005CD4(*(_QWORD *)(a1 + 32));
  }

}

void sub_100005CD4(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];
  uint8_t buf[16];
  os_activity_scope_state_s state;

  if (a1)
  {
    v2 = _os_activity_create((void *)&_mh_execute_header, "auth session/send get auth type request", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v2, &state);
    v4 = cps_session_log(v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Sending get auth type request.", buf, 2u);
    }

    v6 = *(void **)(a1 + 16);
    v7 = *(_QWORD *)(a1 + 120);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100005DEC;
    v8[3] = &unk_100030868;
    v8[4] = a1;
    objc_msgSend(v6, "sendRequestID:request:options:responseHandler:", CFSTR("com.apple.CompanionAuthentication.GetAuthType"), &__NSDictionary0__struct, v7, v8);
    os_activity_scope_leave(&state);

  }
}

void sub_100005DD4(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 48));
  _Unwind_Resume(a1);
}

void sub_100005DEC(uint64_t a1, void *a2, void *a3, void *a4)
{
  sub_100005DF4(*(_QWORD **)(a1 + 32), a2, a3, a4);
}

void sub_100005DF4(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  CDGetAuthTypeResponse *v14;
  uint64_t v15;
  NSObject *v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_activity_scope_state_s v21;
  uint8_t buf[4];
  CDGetAuthTypeResponse *v23;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v10 = _os_activity_create((void *)&_mh_execute_header, "auth session/handle get auth type response", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    v21.opaque[0] = 0;
    v21.opaque[1] = 0;
    os_activity_scope_enter(v10, &v21);
    if (v9)
    {
      v12 = cps_session_log(v11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_10001E298();

      sub_1000053F0((uint64_t)a1);
    }
    else
    {
      v14 = -[CDGetAuthTypeResponse initWithRapportDictionary:]([CDGetAuthTypeResponse alloc], "initWithRapportDictionary:", v7);
      v15 = cps_session_log(v14);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v14;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Received get auth type response: %@", buf, 0xCu);
      }

      v17 = -[CDGetAuthTypeResponse authType](v14, "authType");
      v18 = 2;
      switch(v17)
      {
        case 1:
          sub_10000609C((uint64_t)a1, -[CDGetAuthTypeResponse isSandboxPurchase](v14, "isSandboxPurchase"));
          break;
        case 2:
        case 5:
        case 6:
          a1[10] = -[CDGetAuthTypeResponse authFlags](v14, "authFlags");
          sub_100006238((uint64_t)a1);
          break;
        case 4:
          goto LABEL_16;
        case 7:
          v18 = 3;
          goto LABEL_16;
        case 8:
          v18 = 4;
LABEL_16:
          a1[12] = v18;
          a1[13] = -[CDGetAuthTypeResponse authFlags](v14, "authFlags");
          sub_100006308((uint64_t)a1);
          break;
        case 9:
          sub_1000063D8((uint64_t)a1);
          break;
        case 10:
          sub_1000064A8((uint64_t)a1);
          break;
        case 11:
          sub_100006578((uint64_t)a1);
          break;
        case 12:
          sub_1000066E8((uint64_t)a1);
          break;
        case 13:
          sub_1000067B8((uint64_t)a1);
          break;
        default:
          v19 = cps_session_log(v17);
          v20 = objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            sub_10001E25C((uint64_t)buf, -[CDGetAuthTypeResponse authType](v14, "authType"), v20);

          sub_1000053F0((uint64_t)a1);
          break;
      }

    }
    os_activity_scope_leave(&v21);

  }
}

void sub_10000606C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_10000609C(uint64_t a1, int a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  id *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint8_t v17[16];
  os_activity_scope_state_s state;

  if (a1)
  {
    v4 = _os_activity_create((void *)&_mh_execute_header, "store purchase session/start", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v4, &state);
    v6 = cps_session_log(v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Starting store purchase session.", v17, 2u);
    }

    v8 = (id *)&AMSAccountMediaTypeAppStoreSandbox;
    if (!a2)
      v8 = (id *)&AMSAccountMediaTypeProduction;
    v9 = *v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStoreForMediaType:](ACAccountStore, "ams_sharedAccountStoreForMediaType:", v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ams_activeiTunesAccount"));

    if (v11 && (objc_msgSend(v11, "ams_isLocalAccount") & 1) == 0)
      v12 = v11;
    else
      v12 = 0;

    v13 = *(void **)(a1 + 88);
    *(_QWORD *)(a1 + 88) = v12;

    if (*(_QWORD *)(a1 + 88))
    {
      sub_100007B3C(a1);
    }
    else
    {
      v15 = cps_session_log(v14);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_10001E2F8();

      sub_1000053F0(a1);
    }

    os_activity_scope_leave(&state);
  }
}

void sub_10000621C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_100006238(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];
  os_activity_scope_state_s state;

  if (a1)
  {
    v2 = _os_activity_create((void *)&_mh_execute_header, "app sign in session/start", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v2, &state);
    v4 = cps_session_log(v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting app sign in session.", v6, 2u);
    }

    sub_100009F38(a1);
    os_activity_scope_leave(&state);

  }
}

void sub_1000062F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_100006308(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];
  os_activity_scope_state_s state;

  if (a1)
  {
    v2 = _os_activity_create((void *)&_mh_execute_header, "system authentication session/start", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v2, &state);
    v4 = cps_session_log(v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting System Authentication session.", v6, 2u);
    }

    sub_10000AC54(a1);
    os_activity_scope_leave(&state);

  }
}

void sub_1000063C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1000063D8(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];
  os_activity_scope_state_s state;

  if (a1)
  {
    v2 = _os_activity_create((void *)&_mh_execute_header, "sharing session/start", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v2, &state);
    v4 = cps_session_log(v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting Sharing session.", v6, 2u);
    }

    sub_10000B818(a1);
    os_activity_scope_leave(&state);

  }
}

void sub_100006490(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1000064A8(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];
  os_activity_scope_state_s state;

  if (a1)
  {
    v2 = _os_activity_create((void *)&_mh_execute_header, "restricted access session/start", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v2, &state);
    v4 = cps_session_log(v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting Restricted Access session.", v6, 2u);
    }

    sub_10000C04C(a1);
    os_activity_scope_leave(&state);

  }
}

void sub_100006560(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_100006578(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t v13[16];
  os_activity_scope_state_s state;

  if (a1)
  {
    v2 = _os_activity_create((void *)&_mh_execute_header, "store authentication session/start", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v2, &state);
    v4 = cps_session_log(v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting store authentication session.", v13, 2u);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStoreForMediaType:](ACAccountStore, "ams_sharedAccountStoreForMediaType:", AMSAccountMediaTypeProduction));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ams_activeiTunesAccount"));

    if (v7 && (objc_msgSend(v7, "ams_isLocalAccount") & 1) == 0)
      v8 = v7;
    else
      v8 = 0;

    v9 = *(void **)(a1 + 88);
    *(_QWORD *)(a1 + 88) = v8;

    if (*(_QWORD *)(a1 + 88))
    {
      sub_1000086DC(a1);
    }
    else
    {
      v11 = cps_session_log(v10);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_10001E2F8();

      sub_1000053F0(a1);
    }
    os_activity_scope_leave(&state);

  }
}

void sub_1000066CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1000066E8(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];
  os_activity_scope_state_s state;

  if (a1)
  {
    v2 = _os_activity_create((void *)&_mh_execute_header, "tv provider session/start", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v2, &state);
    v4 = cps_session_log(v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting TV Provider session.", v6, 2u);
    }

    sub_10000CAAC(a1);
    os_activity_scope_leave(&state);

  }
}

void sub_1000067A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1000067B8(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];
  os_activity_scope_state_s state;

  if (a1)
  {
    v2 = _os_activity_create((void *)&_mh_execute_header, "learn more session/start", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v2, &state);
    v4 = cps_session_log(v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting Learn More session.", v6, 2u);
    }

    sub_10000D020(a1);
    os_activity_scope_leave(&state);

  }
}

void sub_100006870(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_100006888(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v20;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = _os_activity_create((void *)&_mh_execute_header, "auth session/send get notif info request", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v7, &state);
    v9 = cps_session_log(v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Sending get notif info request: %@", buf, 0xCu);
    }

    v11 = *(void **)(a1 + 16);
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "makeRapportDictionary"));
    v13 = (void *)v12;
    if (v12)
      v14 = (void *)v12;
    else
      v14 = &__NSDictionary0__struct;
    v15 = *(_QWORD *)(a1 + 120);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100006A40;
    v16[3] = &unk_100030890;
    v17 = v6;
    objc_msgSend(v11, "sendRequestID:request:options:responseHandler:", CFSTR("com.apple.CompanionAuthentication.GetNotifInfo"), v14, v15, v16);

    os_activity_scope_leave(&state);
  }

}

void sub_100006A20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

uint64_t sub_100006A40(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100006A4C(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  CDDeviceUpdateEvent *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  os_activity_scope_state_s v12;
  uint8_t buf[4];
  CDDeviceUpdateEvent *v14;

  if (a1)
  {
    v2 = _os_activity_create((void *)&_mh_execute_header, "auth session/send did tap notif event", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    v12.opaque[0] = 0;
    v12.opaque[1] = 0;
    os_activity_scope_enter(v2, &v12);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[CPSDevice currentDevice](CPSDevice, "currentDevice"));
    v4 = objc_alloc_init(CDDeviceUpdateEvent);
    -[CDDeviceUpdateEvent setDeviceFlags:](v4, "setDeviceFlags:", objc_msgSend(v3, "flags"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "model"));
    -[CDDeviceUpdateEvent setDeviceModel:](v4, "setDeviceModel:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
    -[CDDeviceUpdateEvent setDeviceName:](v4, "setDeviceName:", v6);

    v8 = cps_session_log(v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Sending did tap notif event: %@", buf, 0xCu);
    }

    v10 = *(void **)(a1 + 16);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CDDeviceUpdateEvent makeRapportDictionary](v4, "makeRapportDictionary"));
    objc_msgSend(v10, "sendEventID:event:options:completion:", CFSTR("com.apple.CompanionAuthentication.DidTapNotif"), v11, *(_QWORD *)(a1 + 120), &stru_1000308D0);

    os_activity_scope_leave(&v12);
  }
}

void sub_100006BF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_100006C18(id a1, NSError *a2)
{
  NSError *v2;
  NSError *v3;
  uint64_t v4;
  NSObject *v5;

  v2 = a2;
  v3 = v2;
  if (v2)
  {
    v4 = cps_session_log(v2);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_10001E324();

  }
}

void sub_100006C6C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v20;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = _os_activity_create((void *)&_mh_execute_header, "auth session/send get auth info request", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v7, &state);
    v9 = cps_session_log(v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Sending get auth info request: %@", buf, 0xCu);
    }

    v11 = *(void **)(a1 + 16);
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "makeRapportDictionary"));
    v13 = (void *)v12;
    if (v12)
      v14 = (void *)v12;
    else
      v14 = &__NSDictionary0__struct;
    v15 = *(_QWORD *)(a1 + 120);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100006E24;
    v16[3] = &unk_100030890;
    v17 = v6;
    objc_msgSend(v11, "sendRequestID:request:options:responseHandler:", CFSTR("com.apple.CompanionAuthentication.GetAuthInfo"), v14, v15, v16);

    os_activity_scope_leave(&state);
  }

}

void sub_100006E04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

uint64_t sub_100006E24(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100006E30(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[5];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v16;

  v3 = a2;
  if (a1)
  {
    v4 = _os_activity_create((void *)&_mh_execute_header, "auth session/send did finish auth request", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v4, &state);
    v6 = cps_session_log(v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Sending did finish auth request: %@", buf, 0xCu);
    }

    v8 = *(void **)(a1 + 16);
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "makeRapportDictionary"));
    v10 = (void *)v9;
    if (v9)
      v11 = (void *)v9;
    else
      v11 = &__NSDictionary0__struct;
    v12 = *(_QWORD *)(a1 + 120);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100006FBC;
    v13[3] = &unk_100030868;
    v13[4] = a1;
    objc_msgSend(v8, "sendRequestID:request:options:responseHandler:", CFSTR("com.apple.CompanionAuthentication.DidFinishAuth"), v11, v12, v13);

    os_activity_scope_leave(&state);
  }

}

void sub_100006F9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_100006FBC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  sub_100006FC8(*(_QWORD *)(a1 + 32), a4);
}

void sub_100006FC8(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint8_t v9[16];
  os_activity_scope_state_s state;

  v3 = a2;
  if (a1)
  {
    v4 = _os_activity_create((void *)&_mh_execute_header, "auth session/handle did finish auth response", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v4, &state);
    if (v3)
    {
      v6 = cps_session_log(v5);
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_10001E384();
    }
    else
    {
      v8 = cps_session_log(v5);
      v7 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received did finish auth response.", v9, 2u);
      }
    }

    sub_1000053F0(a1);
    os_activity_scope_leave(&state);

  }
}

void sub_1000070B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1000070D4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  _QWORD block[5];
  id v9;
  id v10;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100007180;
    block[3] = &unk_100030948;
    block[4] = a1;
    v10 = v6;
    v9 = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
}

void sub_100007180(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[5];
  id v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 160);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100007224;
  v4[3] = &unk_100030920;
  v4[4] = v2;
  v6 = *(id *)(a1 + 48);
  v5 = *(id *)(a1 + 40);
  +[TVRCDeviceQuery getConnectionStatusToDeviceWithIdentifier:completion:](TVRCDeviceQuery, "getConnectionStatusToDeviceWithIdentifier:completion:", v3, v4);

}

void sub_100007224(uint64_t a1, int a2)
{
  uint64_t v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, void *);
  void *v14;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  int v18;

  v4 = cps_session_log(a1);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v18 = a2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Remote app isConnected = %d", buf, 8u);
  }

  v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "systemLockStateSync");
  if ((a2 & 1) == 0)
  {
    v7 = *(void **)(a1 + 48);
LABEL_10:
    v11 = _NSConcreteStackBlock;
    v12 = 3221225472;
    v13 = sub_1000073B4;
    v14 = &unk_1000308F8;
    v10 = *(void **)(a1 + 40);
    v15 = *(_QWORD *)(a1 + 32);
    v16 = v7;
    objc_msgSend(v10, "setActionHandler:", &v11);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 40), "activate", v11, v12, v13, v14, v15);

    return;
  }
  v7 = *(void **)(a1 + 48);
  if (!v7 || (_DWORD)v6 != 4)
    goto LABEL_10;
  v8 = cps_session_log(v6);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Remote app is open and connected, will skip presenting notification.", buf, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void sub_1000073B4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;

  v5 = a3;
  v6 = cps_session_log(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (a2 > 5)
      v8 = "?";
    else
      v8 = off_100030CB8[(int)a2];
    v12 = 136315394;
    v13 = v8;
    v14 = 2112;
    v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received notification action: %s, error: %@", (uint8_t *)&v12, 0x16u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "invalidate");
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 24);
  *(_QWORD *)(v9 + 24) = 0;

  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, uint64_t, id))(v11 + 16))(v11, a2, v5);

}

void sub_1000074CC(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  if (a1)
  {
    v2 = *(id *)(a1 + 152);
    v3 = sub_10000D5DC(a1, v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10000D690;
    v6[3] = &unk_100030BF8;
    v6[4] = a1;
    v7 = v2;
    v5 = v2;
    sub_1000070D4(a1, v4, v6);

  }
}

void sub_100007574(uint64_t a1, void *a2)
{
  sub_10000757C(*(_QWORD *)(a1 + 32), a2);
}

void sub_10000757C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  void *v13;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = objc_msgSend(v3, "cad_matchesDeviceIdentifier:", *(_QWORD *)(a1 + 160));
    if ((_DWORD)v5)
    {
      v6 = cps_session_log(v5);
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138412290;
        v13 = v4;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Discovery device changed: %@", (uint8_t *)&v12, 0xCu);
      }

      v8 = *(_QWORD *)(a1 + 168);
      if (v8 == 2)
      {
        v9 = objc_msgSend(v4, "deviceActionType");
        if ((_DWORD)v9 == 28)
          goto LABEL_13;
      }
      else
      {
        if (v8 != 1)
          goto LABEL_13;
        v9 = objc_msgSend(v4, "deviceActionType");
        if ((_DWORD)v9 == 34)
          goto LABEL_13;
      }
      v10 = cps_session_log(v9);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138412290;
        v13 = v4;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Discovery device removed nearby action: %@", (uint8_t *)&v12, 0xCu);
      }

      sub_1000053F0(a1);
    }
  }
LABEL_13:

}

void sub_1000076D4(uint64_t a1, void *a2)
{
  sub_1000076DC(*(_QWORD *)(a1 + 32), a2);
}

void sub_1000076DC(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  void *v9;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = objc_msgSend(v3, "cad_matchesDeviceIdentifier:", *(_QWORD *)(a1 + 160));
    if ((_DWORD)v5)
    {
      v6 = cps_session_log(v5);
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 138412290;
        v9 = v4;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Discovery device lost: %@", (uint8_t *)&v8, 0xCu);
      }

      sub_1000053F0(a1);
    }
  }

}

void sub_1000077AC(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint8_t v8[16];

  v3 = a2;
  v4 = cps_session_log(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_10001E3E4();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "invalidate");
    v7 = *(_QWORD *)(a1 + 32);
    v6 = *(NSObject **)(v7 + 48);
    *(_QWORD *)(v7 + 48) = 0;
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Device discovery started.", v8, 2u);
  }

}

_QWORD *sub_100007868(uint64_t a1)
{
  return sub_100007870(*(_QWORD **)(a1 + 32));
}

_QWORD *sub_100007870(_QWORD *result)
{
  _QWORD *v1;
  id v2;
  int v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _DWORD v9[2];

  if (result)
  {
    v1 = result;
    v2 = objc_msgSend((id)result[5], "screenOn");
    v3 = (int)v2;
    v4 = cps_session_log(v2);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Screen power changed: %{BOOL}d", (uint8_t *)v9, 8u);
    }

    if (v3)
    {
      v7 = cps_session_log(v6);
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v9[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Stopping screen sleep timer.", (uint8_t *)v9, 2u);
      }

      return objc_msgSend((id)v1[7], "cancel");
    }
    else
    {
      return sub_1000079E8(v1);
    }
  }
  return result;
}

void sub_100007984(id a1)
{
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[16];

  v1 = cps_session_log(a1);
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "System monitor started.", v3, 2u);
  }

}

_QWORD *sub_1000079E8(_QWORD *result)
{
  _QWORD *v1;
  uint64_t v2;
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];
  uint8_t buf[16];

  if (result)
  {
    v1 = result;
    v2 = cps_session_log(result);
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting screen sleep timer.", buf, 2u);
    }

    v4 = (void *)v1[7];
    if (!v4)
    {
      v5 = objc_msgSend(objc_alloc((Class)BSContinuousMachTimer), "initWithIdentifier:", CFSTR("CDProviderSession.screenSleepTimer"));
      v6 = (void *)v1[7];
      v1[7] = v5;

      v4 = (void *)v1[7];
    }
    v7 = v1[22];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100007ACC;
    v8[3] = &unk_100030A00;
    v8[4] = v1;
    return objc_msgSend(v4, "scheduleWithFireInterval:leewayInterval:queue:handler:", v7, v8, 60.0, 1.0);
  }
  return result;
}

void sub_100007ACC(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = cps_session_log(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Screen sleep timer fired.", v4, 2u);
  }

  sub_1000053F0(*(_QWORD *)(a1 + 32));
}

void sub_100007B3C(uint64_t a1)
{
  void *v2;
  void *v3;
  CDGetInfoRequest *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[5];

  if (a1)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "UUIDString"));

    v4 = objc_alloc_init(CDGetInfoRequest);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 88), "ams_altDSID"));
    v6 = sub_100007C30((uint64_t)v5, (uint64_t)v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[CDGetInfoRequest setStoreAccountToken:](v4, "setStoreAccountToken:", v7);

    -[CDGetInfoRequest setNonce:](v4, "setNonce:", v3);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100007D28;
    v8[3] = &unk_100030868;
    v8[4] = a1;
    sub_100006888(a1, v4, v8);

  }
}

id sub_100007C30(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v2 = 0;
  if (a1 && a2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@+%@"), a1, a2));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dataUsingEncoding:", 4));
    if (v4)
    {
      v5 = malloc_type_malloc(0x40uLL, 0xCC7B9F1DuLL);
      v6 = kCryptoHashDescriptor_SHA512;
      v7 = objc_retainAutorelease(v4);
      CryptoHashOneShot(v6, objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"), v5);
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", v5, 64, 1));
    }
    else
    {
      v2 = 0;
    }

  }
  return v2;
}

void sub_100007D28(uint64_t a1, void *a2, void *a3, void *a4)
{
  sub_100007D30(*(_QWORD *)(a1 + 32), a2, a3, a4);
}

void sub_100007D30(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  CDGetNotifInfoResponse *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  CDGetNotifInfoResponse *v23;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v10 = _os_activity_create((void *)&_mh_execute_header, "store purchase session/handle get notif info request", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v10, &state);
    if (v9)
    {
      v12 = cps_session_log(v11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_10001E444();

      sub_1000053F0(a1);
    }
    else
    {
      v14 = -[CDGetNotifInfoResponse initWithRapportDictionary:]([CDGetNotifInfoResponse alloc], "initWithRapportDictionary:", v7);
      v15 = cps_session_log(v14);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v14;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Received get notif info response: %@", buf, 0xCu);
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[CDUserNotificationContent storePurchaseContent](CDUserNotificationContent, "storePurchaseContent"));
      objc_msgSend(v17, "setIdentifier:", *(_QWORD *)(a1 + 160));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CDGetNotifInfoResponse deviceName](v14, "deviceName"));
      objc_msgSend(v17, "addBodyArgument:", v18);

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[CUUserNotificationSession cad_sessionWithContent:](CUUserNotificationSession, "cad_sessionWithContent:", v17));
      objc_msgSend(v19, "setDispatchQueue:", *(_QWORD *)(a1 + 176));
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100007F7C;
      v20[3] = &unk_100030A28;
      v20[4] = a1;
      sub_1000070D4(a1, v19, v20);

    }
    os_activity_scope_leave(&state);

  }
}

void sub_100007F4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_100007F7C(uint64_t a1, int a2)
{
  uint64_t v3;
  void *v4;

  if (a2 == 1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "invalidate");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 48);
    *(_QWORD *)(v3 + 48) = 0;

    sub_100006A4C(*(_QWORD *)(a1 + 32));
    sub_100007FCC(*(_QWORD *)(a1 + 32));
  }
}

void sub_100007FCC(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  CDGetInfoRequest *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  if (a1)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "UUIDString"));

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CPSDevice currentDevice](CPSDevice, "currentDevice"));
    v5 = objc_alloc_init(CDGetInfoRequest);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 88), "ams_altDSID"));
    v7 = sub_100007C30((uint64_t)v6, (uint64_t)v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[CDGetInfoRequest setStoreAccountToken:](v5, "setStoreAccountToken:", v8);

    -[CDGetInfoRequest setNonce:](v5, "setNonce:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "buildVersion"));
    -[CDGetInfoRequest setDeviceBuildVersion:](v5, "setDeviceBuildVersion:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "model"));
    -[CDGetInfoRequest setDeviceModel:](v5, "setDeviceModel:", v10);

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100008118;
    v11[3] = &unk_100030868;
    v11[4] = a1;
    sub_100006C6C(a1, v5, v11);

  }
}

void sub_100008118(uint64_t a1, void *a2, void *a3, void *a4)
{
  sub_100008120(*(_QWORD **)(a1 + 32), a2, a3, a4);
}

void sub_100008120(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  CDStorePurchaseGetAuthInfoResponse *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  dispatch_queue_global_t global_queue;
  NSObject *v26;
  CDStorePurchaseGetAuthInfoResponse *v27;
  _QWORD block[5];
  id v29;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  CDStorePurchaseGetAuthInfoResponse *v32;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v10 = _os_activity_create((void *)&_mh_execute_header, "store purchase session/handle get auth info request", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v10, &state);
    if (v9)
    {
      v12 = cps_session_log(v11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_10001E4A4();

      sub_1000053F0((uint64_t)a1);
    }
    else
    {
      v27 = -[CDStorePurchaseGetAuthInfoResponse initWithRapportDictionary:]([CDStorePurchaseGetAuthInfoResponse alloc], "initWithRapportDictionary:", v7);
      v14 = cps_session_log(v27);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v27;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Received get auth info response: %@", buf, 0xCu);
      }

      v16 = (CDStorePurchaseGetAuthInfoResponse *)objc_claimAutoreleasedReturnValue(-[CDStorePurchaseGetAuthInfoResponse purchaseRequest](v27, "purchaseRequest"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDelegatePurchaseTask bagSubProfile](AMSDelegatePurchaseTask, "bagSubProfile"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDelegatePurchaseTask bagSubProfileVersion](AMSDelegatePurchaseTask, "bagSubProfileVersion"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[AMSBag bagForProfile:profileVersion:](AMSBag, "bagForProfile:profileVersion:", v17, v18));

      v20 = objc_msgSend(objc_alloc((Class)AMSDelegatePurchaseTask), "initWithDelegatePurchaseRequest:bag:account:", v16, v19, a1[11]);
      v21 = (void *)a1[16];
      a1[16] = v20;

      v23 = cps_session_log(v22);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v16;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Submitting purchase request: %@", buf, 0xCu);
      }

      objc_initWeak((id *)buf, a1);
      global_queue = dispatch_get_global_queue(2, 0);
      v26 = objc_claimAutoreleasedReturnValue(global_queue);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100008438;
      block[3] = &unk_100030AA0;
      block[4] = a1;
      objc_copyWeak(&v29, (id *)buf);
      dispatch_async(v26, block);

      objc_destroyWeak(&v29);
      objc_destroyWeak((id *)buf);

    }
    os_activity_scope_leave(&state);

  }
}

void sub_100008404(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_100008438(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "performDelegatePurchase"));
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000084E4;
  v3[3] = &unk_100030A78;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  objc_msgSend(v2, "addFinishBlock:", v3);

  objc_destroyWeak(&v4);
}

void sub_1000084D0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1000084E4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *WeakRetained;
  _QWORD *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD block[5];
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      v9 = cps_session_log(WeakRetained);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_10001E504();

    }
    v11 = v8[22];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000085D0;
    block[3] = &unk_100030A50;
    block[4] = v8;
    v13 = v5;
    v14 = v6;
    dispatch_async(v11, block);

  }
}

void sub_1000085D0(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 114))
    sub_1000085EC(v2, *(void **)(a1 + 40), *(void **)(a1 + 48));
}

void sub_1000085EC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  CDStorePurchaseDidFinishAuthRequest *v10;

  if (a1)
  {
    v5 = a3;
    v6 = a2;
    v10 = objc_alloc_init(CDStorePurchaseDidFinishAuthRequest);
    -[CDStorePurchaseDidFinishAuthRequest setPurchaseResult:](v10, "setPurchaseResult:", v6);

    -[CDStorePurchaseDidFinishAuthRequest setError:](v10, "setError:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CPSDevice currentDevice](CPSDevice, "currentDevice"));
    -[CDStorePurchaseDidFinishAuthRequest setDeviceFlags:](v10, "setDeviceFlags:", objc_msgSend(v7, "flags"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "model"));
    -[CDStorePurchaseDidFinishAuthRequest setDeviceModel:](v10, "setDeviceModel:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
    -[CDStorePurchaseDidFinishAuthRequest setDeviceName:](v10, "setDeviceName:", v9);

    sub_100006E30(a1, v10);
  }
}

void sub_1000086DC(uint64_t a1)
{
  void *v2;
  void *v3;
  CDGetInfoRequest *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[5];

  if (a1)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "UUIDString"));

    v4 = objc_alloc_init(CDGetInfoRequest);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 88), "ams_altDSID"));
    v6 = sub_100007C30((uint64_t)v5, (uint64_t)v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[CDGetInfoRequest setStoreAccountToken:](v4, "setStoreAccountToken:", v7);

    -[CDGetInfoRequest setNonce:](v4, "setNonce:", v3);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000087D0;
    v8[3] = &unk_100030868;
    v8[4] = a1;
    sub_100006888(a1, v4, v8);

  }
}

void sub_1000087D0(uint64_t a1, void *a2, void *a3, void *a4)
{
  sub_1000087D8(*(_QWORD *)(a1 + 32), a2, a3, a4);
}

void sub_1000087D8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  CDGetNotifInfoResponse *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  CDGetNotifInfoResponse *v23;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v10 = _os_activity_create((void *)&_mh_execute_header, "store authentication session/handle get notif info request", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v10, &state);
    if (v9)
    {
      v12 = cps_session_log(v11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_10001E444();

      sub_1000053F0(a1);
    }
    else
    {
      v14 = -[CDGetNotifInfoResponse initWithRapportDictionary:]([CDGetNotifInfoResponse alloc], "initWithRapportDictionary:", v7);
      v15 = cps_session_log(v14);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v14;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Received get notif info response: %@", buf, 0xCu);
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[CDUserNotificationContent storeAuthenticationContent](CDUserNotificationContent, "storeAuthenticationContent"));
      objc_msgSend(v17, "setIdentifier:", *(_QWORD *)(a1 + 160));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CDGetNotifInfoResponse deviceName](v14, "deviceName"));
      objc_msgSend(v17, "addBodyArgument:", v18);

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[CUUserNotificationSession cad_sessionWithContent:](CUUserNotificationSession, "cad_sessionWithContent:", v17));
      objc_msgSend(v19, "setDispatchQueue:", *(_QWORD *)(a1 + 176));
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100008A24;
      v20[3] = &unk_100030A28;
      v20[4] = a1;
      sub_1000070D4(a1, v19, v20);

    }
    os_activity_scope_leave(&state);

  }
}

void sub_1000089F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_100008A24(uint64_t a1, int a2)
{
  uint64_t v3;
  void *v4;

  if (a2 == 1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "invalidate");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 48);
    *(_QWORD *)(v3 + 48) = 0;

    sub_100006A4C(*(_QWORD *)(a1 + 32));
    sub_100008A74(*(_QWORD *)(a1 + 32));
  }
}

void sub_100008A74(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  CDGetInfoRequest *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  if (a1)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "UUIDString"));

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CPSDevice currentDevice](CPSDevice, "currentDevice"));
    v5 = objc_alloc_init(CDGetInfoRequest);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 88), "ams_altDSID"));
    v7 = sub_100007C30((uint64_t)v6, (uint64_t)v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[CDGetInfoRequest setStoreAccountToken:](v5, "setStoreAccountToken:", v8);

    -[CDGetInfoRequest setNonce:](v5, "setNonce:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "buildVersion"));
    -[CDGetInfoRequest setDeviceBuildVersion:](v5, "setDeviceBuildVersion:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "model"));
    -[CDGetInfoRequest setDeviceModel:](v5, "setDeviceModel:", v10);

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100008BC0;
    v11[3] = &unk_100030868;
    v11[4] = a1;
    sub_100006C6C(a1, v5, v11);

  }
}

void sub_100008BC0(uint64_t a1, void *a2, void *a3, void *a4)
{
  sub_100008BC8(*(_QWORD *)(a1 + 32), a2, a3, a4);
}

void sub_100008BC8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  CDStoreAuthenticationGetAuthInfoResponse *v14;
  uint64_t v15;
  NSObject *v16;
  os_activity_scope_state_s v17;
  uint8_t buf[4];
  CDStoreAuthenticationGetAuthInfoResponse *v19;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v10 = _os_activity_create((void *)&_mh_execute_header, "store authentication session/handle get auth info request", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    v17.opaque[0] = 0;
    v17.opaque[1] = 0;
    os_activity_scope_enter(v10, &v17);
    if (v9)
    {
      v12 = cps_session_log(v11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_10001E4A4();

      sub_1000053F0(a1);
    }
    else
    {
      v14 = -[CDStoreAuthenticationGetAuthInfoResponse initWithRapportDictionary:]([CDStoreAuthenticationGetAuthInfoResponse alloc], "initWithRapportDictionary:", v7);
      v15 = cps_session_log(v14);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v14;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Received get auth info response: %@", buf, 0xCu);
      }

      sub_100008D74(a1, v14);
    }
    os_activity_scope_leave(&v17);

  }
}

void sub_100008D4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_100008D74(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  uint8_t buf[16];
  os_activity_scope_state_s state;

  v3 = a2;
  if (a1)
  {
    v4 = _os_activity_create((void *)&_mh_execute_header, "store authentication session/start prox card transaction", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v4, &state);
    v6 = cps_session_log(v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Starting prox card transaction.", buf, 2u);
    }

    v8 = objc_alloc_init((Class)SFClient);
    objc_msgSend(v8, "setDispatchQueue:", *(_QWORD *)(a1 + 176));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100008EB4;
    v9[3] = &unk_100030AC8;
    v9[4] = a1;
    v10 = v3;
    v11 = v8;
    objc_msgSend(v8, "startProxCardTransactionWithOptions:completion:", 127, v9);

    os_activity_scope_leave(&state);
  }

}

void sub_100008E9C(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 48));
  _Unwind_Resume(a1);
}

void sub_100008EB4(uint64_t a1, int a2)
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = cps_session_log(a1);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Prox card transaction activated.", v7, 2u);
    }

    sub_100006A4C(*(_QWORD *)(a1 + 32));
    sub_100008F70(*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_10001E564();

    objc_msgSend(*(id *)(a1 + 48), "invalidate");
    sub_1000053F0(*(_QWORD *)(a1 + 32));
  }
}

void sub_100008F70(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  CDProviderViewService *v13;
  void *v14;
  void *v15;
  CDProviderViewService *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[5];
  _QWORD v20[5];
  os_activity_scope_state_s state;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = _os_activity_create((void *)&_mh_execute_header, "store authentication session/present view service", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v7, &state);
    v8 = objc_alloc_init((Class)CPSStoreAuthenticationRequest);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "authenticationRequest"));
    objc_msgSend(v8, "setAuthenticationRequest:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStoreForMediaType:](ACAccountStore, "ams_sharedAccountStoreForMediaType:", 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ams_activeiTunesAccount"));

    if (v11 && (objc_msgSend(v11, "ams_isLocalAccount") & 1) == 0)
      v12 = v11;
    else
      v12 = 0;

    objc_msgSend(v8, "setAccount:", v12);
    v13 = objc_alloc_init(CDProviderViewService);
    -[CDProviderViewService setDispatchQueue:](v13, "setDispatchQueue:", *(_QWORD *)(a1 + 176));
    -[CDProviderViewService setViewControllerClassName:](v13, "setViewControllerClassName:", CFSTR("StoreAuthenticationViewController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deviceName"));
    -[CDProviderViewService setRemoteDeviceName:](v13, "setRemoteDeviceName:", v14);

    -[CDProviderViewService setStoreAuthenticationRequest:](v13, "setStoreAuthenticationRequest:", v8);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000091D4;
    v20[3] = &unk_100030AF0;
    v20[4] = a1;
    -[CDProviderViewService setStoreAuthenticationCompletionHandler:](v13, "setStoreAuthenticationCompletionHandler:", v20);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000093B0;
    v19[3] = &unk_100030B18;
    v19[4] = a1;
    -[CDProviderViewService setActionHandler:](v13, "setActionHandler:", v19);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000093C4;
    v17[3] = &unk_1000307A0;
    v18 = v6;
    -[CDProviderViewService setInvalidationHandler:](v13, "setInvalidationHandler:", v17);
    -[CDProviderViewService activateWithCompletionHandler:](v13, "activateWithCompletionHandler:", &stru_100030B38);
    v15 = *(void **)(a1 + 144);
    *(_QWORD *)(a1 + 144) = v13;
    v16 = v13;

    os_activity_scope_leave(&state);
  }

}

void sub_1000091BC(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 96));
  _Unwind_Resume(a1);
}

void sub_1000091D4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = cps_session_log(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Store authentication completion {authenticationResult = %@, error = %@}", (uint8_t *)&v9, 0x16u);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 112) = 1;
  sub_1000092C0(*(_QWORD *)(a1 + 32), v5, v6);

}

void sub_1000092C0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  CDStoreAuthenticationDidFinishAuthRequest *v10;

  if (a1)
  {
    v5 = a3;
    v6 = a2;
    v10 = objc_alloc_init(CDStoreAuthenticationDidFinishAuthRequest);
    -[CDStoreAuthenticationDidFinishAuthRequest setAuthenticationResult:](v10, "setAuthenticationResult:", v6);

    -[CDStoreAuthenticationDidFinishAuthRequest setError:](v10, "setError:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CPSDevice currentDevice](CPSDevice, "currentDevice"));
    -[CDStoreAuthenticationDidFinishAuthRequest setDeviceFlags:](v10, "setDeviceFlags:", objc_msgSend(v7, "flags"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "model"));
    -[CDStoreAuthenticationDidFinishAuthRequest setDeviceModel:](v10, "setDeviceModel:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
    -[CDStoreAuthenticationDidFinishAuthRequest setDeviceName:](v10, "setDeviceName:", v9);

    sub_100006E30(a1, v10);
  }
}

void sub_1000093B0(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3)
    sub_1000092C0(*(_QWORD *)(a1 + 32), 0, a3);
}

id sub_1000093C4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void sub_1000093CC(id a1, NSError *a2)
{
  NSError *v2;
  NSError *v3;
  uint64_t v4;
  NSObject *v5;

  v2 = a2;
  v3 = v2;
  if (v2)
  {
    v4 = cps_session_log(v2);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      sub_10001E590();

  }
}

void sub_100009420(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
    sub_1000053F0(v2);
  else
    sub_100009430(v2);
}

void sub_100009430(uint64_t a1)
{
  _QWORD v1[5];

  if (a1)
  {
    v1[0] = _NSConcreteStackBlock;
    v1[1] = 3221225472;
    v1[2] = sub_100009488;
    v1[3] = &unk_100030868;
    v1[4] = a1;
    sub_100006888(a1, 0, v1);
  }
}

void sub_100009488(uint64_t a1, void *a2, void *a3, void *a4)
{
  sub_100009490(*(_QWORD *)(a1 + 32), a2, a3, a4);
}

void sub_100009490(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  CDGetNotifInfoResponse *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  CDGetNotifInfoResponse *v29;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v10 = _os_activity_create((void *)&_mh_execute_header, "legacy app sign in session/handle get notif info request", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v10, &state);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "domain"));
    if (objc_msgSend(v11, "isEqualToString:", RPErrorDomain))
    {
      v12 = objc_msgSend(v9, "code") == (id)-6714;

      if (v12)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[CDUserNotificationContent legacyAppSignInContent](CDUserNotificationContent, "legacyAppSignInContent"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 64), "username"));
        objc_msgSend(v14, "addBodyArgument:", v15);

        v17 = cps_session_log(v16);
        v18 = (CDGetNotifInfoResponse *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(&v18->super, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, &v18->super, OS_LOG_TYPE_DEFAULT, "Request not handled. Will show legacy app sign in notification.", buf, 2u);
        }
        goto LABEL_14;
      }
    }
    else
    {

    }
    if (v9)
    {
      v19 = cps_session_log(v13);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        sub_10001E444();

      sub_1000053F0(a1);
      goto LABEL_15;
    }
    v18 = -[CDGetNotifInfoResponse initWithRapportDictionary:]([CDGetNotifInfoResponse alloc], "initWithRapportDictionary:", v7);
    v21 = cps_session_log(v18);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v18;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Received get notif info response: %@", buf, 0xCu);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[CDUserNotificationContent appSignInContent](CDUserNotificationContent, "appSignInContent"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CDGetNotifInfoResponse appName](v18, "appName"));
    objc_msgSend(v14, "addTitleArgument:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CDGetNotifInfoResponse deviceName](v18, "deviceName"));
    objc_msgSend(v14, "addBodyArgument:", v24);

LABEL_14:
    objc_msgSend(v14, "setIdentifier:", *(_QWORD *)(a1 + 160));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[CUUserNotificationSession cad_sessionWithContent:](CUUserNotificationSession, "cad_sessionWithContent:", v14));
    objc_msgSend(v25, "setDispatchQueue:", *(_QWORD *)(a1 + 176));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000097BC;
    v26[3] = &unk_100030A28;
    v26[4] = a1;
    sub_1000070D4(a1, v25, v26);

LABEL_15:
    os_activity_scope_leave(&state);

  }
}

void sub_10000978C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1000097BC(uint64_t a1, int a2)
{
  uint64_t v3;
  void *v4;

  if (a2 == 1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "invalidate");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 48);
    *(_QWORD *)(v3 + 48) = 0;

    sub_100009804(*(_QWORD *)(a1 + 32));
  }
}

void sub_100009804(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  CDGetInfoRequest *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[5];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  CDGetInfoRequest *v16;

  if (a1)
  {
    v2 = _os_activity_create((void *)&_mh_execute_header, "legacy app sign in session/send get auth info request", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v2, &state);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[CPSDevice currentDevice](CPSDevice, "currentDevice"));
    v4 = objc_alloc_init(CDGetInfoRequest);
    -[CDGetInfoRequest setDeviceFlags:](v4, "setDeviceFlags:", objc_msgSend(v3, "flags"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "model"));
    -[CDGetInfoRequest setDeviceModel:](v4, "setDeviceModel:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
    -[CDGetInfoRequest setDeviceName:](v4, "setDeviceName:", v6);

    v8 = cps_session_log(v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Sending get auth info request: %@", buf, 0xCu);
    }

    v10 = *(void **)(a1 + 16);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CDGetInfoRequest makeRapportDictionary](v4, "makeRapportDictionary"));
    v12 = *(_QWORD *)(a1 + 120);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000099FC;
    v13[3] = &unk_100030868;
    v13[4] = a1;
    objc_msgSend(v10, "sendRequestID:request:options:responseHandler:", CFSTR("com.apple.AuthKit.StartAuthorization"), v11, v12, v13);

    os_activity_scope_leave(&state);
  }
}

void sub_1000099D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1000099FC(uint64_t a1, void *a2, void *a3, void *a4)
{
  sub_100009A04(*(_QWORD *)(a1 + 32), a2, a3, a4);
}

void sub_100009A04(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  CDLegacyAppSignInGetAuthInfoResponse *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  CDLegacyAppSignInGetAuthInfoResponse *v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  _QWORD v22[5];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  CDLegacyAppSignInGetAuthInfoResponse *v25;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v10 = _os_activity_create((void *)&_mh_execute_header, "legacy app sign in session/handle get auth info response", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v10, &state);
    if (v9)
    {
      v12 = cps_session_log(v11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_10001E4A4();

      sub_1000053F0(a1);
    }
    else
    {
      v14 = -[CDLegacyAppSignInGetAuthInfoResponse initWithRapportDictionary:]([CDLegacyAppSignInGetAuthInfoResponse alloc], "initWithRapportDictionary:", v7);
      v15 = cps_session_log(v14);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v14;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Received get auth info response: %@", buf, 0xCu);
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CDLegacyAppSignInGetAuthInfoResponse credentialRequest](v14, "credentialRequest"));
      v18 = (CDLegacyAppSignInGetAuthInfoResponse *)objc_msgSend(v17, "copy");

      v19 = objc_alloc_init((Class)AKAuthorizationController);
      v20 = cps_session_log(v19);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v18;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Submitting credential request: %@", buf, 0xCu);
      }

      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100009C7C;
      v22[3] = &unk_100030B60;
      v22[4] = a1;
      objc_msgSend(v19, "performAuthorizationWithContext:completion:", v18, v22);

    }
    os_activity_scope_leave(&state);

  }
}

void sub_100009C48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_100009C7C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8 = cps_session_log(v6);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10001E5F0();

  }
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(NSObject **)(v10 + 176);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009D5C;
  block[3] = &unk_100030A50;
  block[4] = v10;
  v15 = v5;
  v16 = v7;
  v12 = v7;
  v13 = v5;
  dispatch_async(v11, block);

}

void sub_100009D5C(uint64_t a1)
{
  sub_100009D6C(*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));
}

void sub_100009D6C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  CDLegacyAppSignInDidFinishAuthRequest *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[5];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  CDLegacyAppSignInDidFinishAuthRequest *v17;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = _os_activity_create((void *)&_mh_execute_header, "legacy app sign in session/send did finish auth request", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v7, &state);
    v8 = objc_alloc_init(CDLegacyAppSignInDidFinishAuthRequest);
    -[CDLegacyAppSignInDidFinishAuthRequest setAuthorization:](v8, "setAuthorization:", v5);
    v9 = cps_session_log(-[CDLegacyAppSignInDidFinishAuthRequest setError:](v8, "setError:", v6));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Sending did finish auth request: %@", buf, 0xCu);
    }

    v11 = *(void **)(a1 + 16);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CDLegacyAppSignInDidFinishAuthRequest makeRapportDictionary](v8, "makeRapportDictionary"));
    v13 = *(_QWORD *)(a1 + 120);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100009F2C;
    v14[3] = &unk_100030868;
    v14[4] = a1;
    objc_msgSend(v11, "sendRequestID:request:options:responseHandler:", CFSTR("com.apple.AuthKit.AuthorizationDidFinish"), v12, v13, v14);

    os_activity_scope_leave(&state);
  }

}

void sub_100009F0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_100009F2C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  sub_100006FC8(*(_QWORD *)(a1 + 32), a4);
}

void sub_100009F38(uint64_t a1)
{
  _QWORD v1[5];

  if (a1)
  {
    v1[0] = _NSConcreteStackBlock;
    v1[1] = 3221225472;
    v1[2] = sub_100009F90;
    v1[3] = &unk_100030868;
    v1[4] = a1;
    sub_100006888(a1, 0, v1);
  }
}

void sub_100009F90(uint64_t a1, void *a2, void *a3, void *a4)
{
  sub_100009F98(*(_QWORD *)(a1 + 32), a2, a3, a4);
}

void sub_100009F98(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  CDGetNotifInfoResponse *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  CDGetNotifInfoResponse *v24;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v10 = _os_activity_create((void *)&_mh_execute_header, "app sign in session/handle get notif info request", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v10, &state);
    if (v9)
    {
      v12 = cps_session_log(v11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_10001E444();

      sub_1000053F0(a1);
    }
    else
    {
      v14 = -[CDGetNotifInfoResponse initWithRapportDictionary:]([CDGetNotifInfoResponse alloc], "initWithRapportDictionary:", v7);
      v15 = cps_session_log(v14);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v14;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Received get notif info response: %@", buf, 0xCu);
      }

      if ((*(_BYTE *)(a1 + 80) & 1) != 0)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[CDUserNotificationContent registerPasskeyContent](CDUserNotificationContent, "registerPasskeyContent"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[CDGetNotifInfoResponse appName](v14, "appName"));
        objc_msgSend(v17, "addBodyArgument:", v18);
      }
      else
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[CDUserNotificationContent appSignInContent](CDUserNotificationContent, "appSignInContent"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[CDGetNotifInfoResponse appName](v14, "appName"));
        objc_msgSend(v17, "addTitleArgument:", v18);
      }

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CDGetNotifInfoResponse deviceName](v14, "deviceName"));
      objc_msgSend(v17, "addBodyArgument:", v19);

      objc_msgSend(v17, "setIdentifier:", *(_QWORD *)(a1 + 160));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[CUUserNotificationSession cad_sessionWithContent:](CUUserNotificationSession, "cad_sessionWithContent:", v17));
      objc_msgSend(v20, "setDispatchQueue:", *(_QWORD *)(a1 + 176));
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10000A25C;
      v21[3] = &unk_100030A28;
      v21[4] = a1;
      sub_1000070D4(a1, v20, v21);

    }
    os_activity_scope_leave(&state);

  }
}

void sub_10000A22C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_10000A25C(uint64_t a1, int a2)
{
  uint64_t v3;
  void *v4;

  if (a2 == 1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "invalidate");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 48);
    *(_QWORD *)(v3 + 48) = 0;

    sub_100006A4C(*(_QWORD *)(a1 + 32));
    sub_10000A2AC(*(_QWORD *)(a1 + 32));
  }
}

void sub_10000A2AC(uint64_t a1)
{
  _QWORD v1[5];

  if (a1)
  {
    v1[0] = _NSConcreteStackBlock;
    v1[1] = 3221225472;
    v1[2] = sub_10000A304;
    v1[3] = &unk_100030868;
    v1[4] = a1;
    sub_100006C6C(a1, 0, v1);
  }
}

void sub_10000A304(uint64_t a1, void *a2, void *a3, void *a4)
{
  sub_10000A30C(*(_QWORD *)(a1 + 32), a2, a3, a4);
}

void sub_10000A30C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  CDAppSignInGetAuthInfoResponse *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  BOOL v18;
  CDAppSignInGetAuthInfoResponse *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  _QWORD v27[5];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  CDAppSignInGetAuthInfoResponse *v30;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v10 = _os_activity_create((void *)&_mh_execute_header, "app sign in session/handle get auth info response", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v10, &state);
    if (v9)
    {
      v12 = cps_session_log(v11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_10001E4A4();

      sub_1000053F0(a1);
    }
    else
    {
      v14 = -[CDAppSignInGetAuthInfoResponse initWithRapportDictionary:]([CDAppSignInGetAuthInfoResponse alloc], "initWithRapportDictionary:", v7);
      v15 = cps_session_log(v14);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v14;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Received get auth info response: %@", buf, 0xCu);
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CDAppSignInGetAuthInfoResponse webRequest](v14, "webRequest"));
      v18 = v17 == 0;

      if (v18)
      {
        v19 = (CDAppSignInGetAuthInfoResponse *)objc_claimAutoreleasedReturnValue(+[CDAppSignInUtilities credentialRequestFromClientAuthenticationContext:](CDAppSignInUtilities, "credentialRequestFromClientAuthenticationContext:", v14));
        v21 = objc_alloc_init((Class)ASCAgentProxy);
        v22 = *(void **)(a1 + 72);
        *(_QWORD *)(a1 + 72) = v21;

        v24 = cps_session_log(v23);
        v25 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v30 = v19;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Submitting credential request: %@", buf, 0xCu);
        }

        v26 = *(void **)(a1 + 72);
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_10000A808;
        v27[3] = &unk_100030B88;
        v27[4] = a1;
        objc_msgSend(v26, "performAuthorizationRequestsForContext:withCompletionHandler:", v19, v27);
      }
      else
      {
        v19 = (CDAppSignInGetAuthInfoResponse *)objc_claimAutoreleasedReturnValue(-[CDAppSignInGetAuthInfoResponse webRequest](v14, "webRequest"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[CDAppSignInGetAuthInfoResponse appDomains](v14, "appDomains"));
        sub_10000A5CC(a1, v19, v20);

      }
    }
    os_activity_scope_leave(&state);

  }
}

void sub_10000A59C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_10000A5CC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  CDProviderViewService *v11;
  void *v12;
  CDProviderViewService *v13;
  void *v14;
  _QWORD v15[5];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v18;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    if (!v5)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("webRequest != ((void *)0)")));
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_10001E650("_performWebAuthenticationWithRequest:proxiedAppDomains:", a1, (uint64_t)v14);
      _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v14), "UTF8String"));
      __break(0);
      JUMPOUT(0x10000A7E0);
    }
    v7 = _os_activity_create((void *)&_mh_execute_header, "CompAuth/WebAuth/perform", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v7, &state);
    v9 = cps_session_log(v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Performing web authentication: %@", buf, 0xCu);
    }

    v11 = objc_alloc_init(CDProviderViewService);
    -[CDProviderViewService setDispatchQueue:](v11, "setDispatchQueue:", *(_QWORD *)(a1 + 176));
    -[CDProviderViewService setViewControllerClassName:](v11, "setViewControllerClassName:", CFSTR("WebAuthenticationViewController"));
    -[CDProviderViewService setWebAuthenticationRequest:](v11, "setWebAuthenticationRequest:", v5);
    -[CDProviderViewService setProxiedAppDomains:](v11, "setProxiedAppDomains:", v6);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000AAF8;
    v15[3] = &unk_100030BB0;
    v15[4] = a1;
    -[CDProviderViewService setWebAuthenticationCompletionHandler:](v11, "setWebAuthenticationCompletionHandler:", v15);
    -[CDProviderViewService activateWithCompletionHandler:](v11, "activateWithCompletionHandler:", &stru_100030BD0);
    v12 = *(void **)(a1 + 144);
    *(_QWORD *)(a1 + 144) = v11;
    v13 = v11;

    os_activity_scope_leave(&state);
  }

}

void sub_10000A7E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_10000A808(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5)
  {
    v8 = cps_session_log(v6);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10001E5F0();

  }
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(NSObject **)(v10 + 176);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A8E8;
  block[3] = &unk_100030A50;
  block[4] = v10;
  v15 = v5;
  v16 = v7;
  v12 = v7;
  v13 = v5;
  dispatch_async(v11, block);

}

void sub_10000A8E8(uint64_t a1)
{
  sub_10000A8F8(*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));
}

void sub_10000A8F8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  CDAppSignInDidFinishAuthRequest *v7;
  uint64_t v8;
  void *v9;
  char isKindOfClass;
  id v11;
  uint64_t v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  char v20;
  uint64_t v21;
  void *v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = objc_alloc_init(CDAppSignInDidFinishAuthRequest);
    v8 = objc_opt_self(ASCAppleIDCredential);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    isKindOfClass = objc_opt_isKindOfClass(v5, v9);

    if ((isKindOfClass & 1) != 0)
    {
      v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "authorization"));
      -[CDAppSignInDidFinishAuthRequest setAppleIDAuthorization:](v7, "setAppleIDAuthorization:", v11);
    }
    else
    {
      v12 = objc_opt_self(ASCPasswordCredential);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v14 = objc_opt_isKindOfClass(v5, v13);

      if ((v14 & 1) == 0)
      {
        v18 = objc_opt_self(ASCPlatformPublicKeyCredentialAssertion);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        v20 = objc_opt_isKindOfClass(v5, v19);

        if ((v20 & 1) != 0)
        {
          -[CDAppSignInDidFinishAuthRequest setPlatformKeyCredentialAssertion:](v7, "setPlatformKeyCredentialAssertion:", v5);
        }
        else
        {
          v21 = objc_opt_self(ASCPlatformPublicKeyCredentialRegistration);
          v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
          v23 = objc_opt_isKindOfClass(v5, v22);

          if ((v23 & 1) != 0)
          {
            -[CDAppSignInDidFinishAuthRequest setPlatformKeyCredentialRegistration:](v7, "setPlatformKeyCredentialRegistration:", v5);
          }
          else
          {
            if (v5)
            {
              v25 = cps_session_log(v24);
              v26 = objc_claimAutoreleasedReturnValue(v25);
              if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
                sub_10001E750();

            }
            -[CDAppSignInDidFinishAuthRequest setError:](v7, "setError:", v6);
          }
        }
        goto LABEL_7;
      }
      v15 = objc_alloc((Class)CASPasswordCredential);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "user"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "password"));
      v11 = objc_msgSend(v15, "initWithUser:password:", v16, v17);

      -[CDAppSignInDidFinishAuthRequest setPasswordCredential:](v7, "setPasswordCredential:", v11);
    }

LABEL_7:
    sub_100006E30(a1, v7);

  }
}

void sub_10000AAF8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5)
  {
    v8 = cps_session_log(v6);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10001E7B0();

  }
  sub_10000AB78(*(_QWORD *)(a1 + 32), v5, v7);

}

void sub_10000AB78(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  CDAppSignInDidFinishAuthRequest *v7;

  if (a1)
  {
    v5 = a3;
    v6 = a2;
    v7 = objc_alloc_init(CDAppSignInDidFinishAuthRequest);
    -[CDAppSignInDidFinishAuthRequest setWebCallbackURL:](v7, "setWebCallbackURL:", v6);

    -[CDAppSignInDidFinishAuthRequest setError:](v7, "setError:", v5);
    sub_100006E30(a1, v7);

  }
}

void sub_10000AC00(id a1, NSError *a2)
{
  NSError *v2;
  NSError *v3;
  uint64_t v4;
  NSObject *v5;

  v2 = a2;
  v3 = v2;
  if (v2)
  {
    v4 = cps_session_log(v2);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      sub_10001E590();

  }
}

void sub_10000AC54(uint64_t a1)
{
  void *v2;
  void *v3;
  CDGetInfoRequest *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[5];

  if (a1)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "UUIDString"));

    v4 = objc_alloc_init(CDGetInfoRequest);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](ACAccountStore, "defaultStore"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aa_primaryAppleAccount"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "aa_altDSID"));
    v8 = sub_100007C30((uint64_t)v7, (uint64_t)v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[CDGetInfoRequest setAppleAccountToken:](v4, "setAppleAccountToken:", v9);

    -[CDGetInfoRequest setNonce:](v4, "setNonce:", v3);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000AD70;
    v10[3] = &unk_100030868;
    v10[4] = a1;
    sub_100006C6C(a1, v4, v10);

  }
}

void sub_10000AD70(uint64_t a1, void *a2, void *a3, void *a4)
{
  sub_10000AD78(*(_QWORD *)(a1 + 32), a2, a3, a4);
}

void sub_10000AD78(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  CDSystemAuthenticationGetAuthInfoResponse *v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  void *v18;
  _QWORD v19[6];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  CDSystemAuthenticationGetAuthInfoResponse *v22;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v10 = _os_activity_create((void *)&_mh_execute_header, "system authentication session/handle get auth info response", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v10, &state);
    if (v9)
    {
      v12 = cps_session_log(v11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_10001E4A4();

      sub_1000053F0(a1);
    }
    else
    {
      v14 = -[CDSystemAuthenticationGetAuthInfoResponse initWithRapportDictionary:]([CDSystemAuthenticationGetAuthInfoResponse alloc], "initWithRapportDictionary:", v7);
      v15 = cps_session_log(v14);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v14;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Received get auth info response: %@", buf, 0xCu);
      }

      v17 = sub_10000AF74(a1, v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10000B0D0;
      v19[3] = &unk_100030BF8;
      v19[4] = a1;
      v19[5] = v14;
      sub_1000070D4(a1, v18, v19);

    }
    os_activity_scope_leave(&state);

  }
}

void sub_10000AF48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

id sub_10000AF74(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a2;
  if (a1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CDUserNotificationContent notificationContentForSystemService:](CDUserNotificationContent, "notificationContentForSystemService:", *(_QWORD *)(a1 + 96)));
    if (v4)
    {
      v5 = *(_QWORD *)(a1 + 96);
      if (v5 == 2)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "deviceName"));
        objc_msgSend(v4, "addBodyArgument:", v6);

        v5 = *(_QWORD *)(a1 + 96);
      }
      if (v5 == 3)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](ACAccountStore, "defaultStore"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "aa_primaryAppleAccount"));

        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "username"));
        objc_msgSend(v4, "addBodyArgument:", v9);

        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "deviceName"));
        objc_msgSend(v4, "addBodyArgument:", v10);

        v5 = *(_QWORD *)(a1 + 96);
      }
      if (v5 == 4)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "deviceName"));
        objc_msgSend(v4, "addBodyArgument:", v11);

      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[CUUserNotificationSession cad_sessionWithContent:](CUUserNotificationSession, "cad_sessionWithContent:", v4));
      objc_msgSend(v12, "setDispatchQueue:", *(_QWORD *)(a1 + 176));
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void sub_10000B0D0(uint64_t a1, unsigned int a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;

  v5 = a3;
  v6 = cps_session_log(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (a2 > 5)
      v8 = "?";
    else
      v8 = off_100030CB8[a2];
    v11 = 136315394;
    v12 = v8;
    v13 = 2112;
    v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received notification action: %s, error: %@", (uint8_t *)&v11, 0x16u);
  }

  if (a2 == 1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "invalidate");
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 48);
    *(_QWORD *)(v9 + 48) = 0;

    sub_10000B1E0(*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  }

}

void sub_10000B1E0(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  uint8_t buf[16];
  os_activity_scope_state_s state;

  v3 = a2;
  if (a1)
  {
    v4 = _os_activity_create((void *)&_mh_execute_header, "system authentication session/start prox card transaction", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v4, &state);
    v6 = cps_session_log(v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Starting prox card transaction.", buf, 2u);
    }

    v8 = objc_alloc_init((Class)SFClient);
    objc_msgSend(v8, "setDispatchQueue:", *(_QWORD *)(a1 + 176));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000B320;
    v9[3] = &unk_100030AC8;
    v9[4] = a1;
    v10 = v3;
    v11 = v8;
    objc_msgSend(v8, "startProxCardTransactionWithOptions:completion:", 127, v9);

    os_activity_scope_leave(&state);
  }

}

void sub_10000B308(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 48));
  _Unwind_Resume(a1);
}

void sub_10000B320(uint64_t a1, int a2)
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = cps_session_log(a1);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Prox card transaction activated.", v7, 2u);
    }

    sub_100006A4C(*(_QWORD *)(a1 + 32));
    sub_10000B3DC(*(_QWORD **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_10001E564();

    objc_msgSend(*(id *)(a1 + 48), "invalidate");
    sub_1000053F0(*(_QWORD *)(a1 + 32));
  }
}

void sub_10000B3DC(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  CDProviderViewService *v9;
  void *v10;
  void *v11;
  CDProviderViewService *v12;
  void **v13;
  uint64_t v14;
  id (*v15)(uint64_t);
  void *v16;
  id v17;
  _QWORD v18[5];
  os_activity_scope_state_s state;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = _os_activity_create((void *)&_mh_execute_header, "system authentication session/present view service", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v7, &state);
    v8 = objc_alloc_init((Class)CPSSystemAuthenticationRequest);
    objc_msgSend(v8, "setService:", a1[12]);
    objc_msgSend(v8, "setOptions:", a1[13]);
    v9 = objc_alloc_init(CDProviderViewService);
    -[CDProviderViewService setDispatchQueue:](v9, "setDispatchQueue:", a1[22]);
    -[CDProviderViewService setViewControllerClassName:](v9, "setViewControllerClassName:", CFSTR("ConfirmViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deviceName"));
    -[CDProviderViewService setRemoteDeviceName:](v9, "setRemoteDeviceName:", v10);

    -[CDProviderViewService setSystemAuthenticationRequest:](v9, "setSystemAuthenticationRequest:", v8);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000B5AC;
    v18[3] = &unk_100030B18;
    v18[4] = a1;
    -[CDProviderViewService setActionHandler:](v9, "setActionHandler:", v18);
    v13 = _NSConcreteStackBlock;
    v14 = 3221225472;
    v15 = sub_10000B7BC;
    v16 = &unk_1000307A0;
    v17 = v6;
    -[CDProviderViewService setInvalidationHandler:](v9, "setInvalidationHandler:", &v13);
    -[CDProviderViewService activateWithCompletionHandler:](v9, "activateWithCompletionHandler:", &stru_100030C18, v13, v14, v15, v16);
    v11 = (void *)a1[18];
    a1[18] = v9;
    v12 = v9;

    os_activity_scope_leave(&state);
  }

}

void sub_10000B594(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_10000B5AC(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  __CFString *v8;
  uint8_t buf[4];
  __CFString *v10;
  __int16 v11;
  id v12;

  v5 = a3;
  v6 = cps_session_log(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)(a2 - 1) >= 3)
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %ld)"), a2));
    else
      v8 = off_100030CE8[a2 - 1];
    *(_DWORD *)buf = 138412546;
    v10 = v8;
    v11 = 2112;
    v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received view service action: %@, error: %@", buf, 0x16u);

  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 136) = a2 == 3;
  sub_10000B6D8(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 136), v5);

}

void sub_10000B6D8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  CDSystemAuthenticationDidFinishAuthRequest *v9;

  if (a1)
  {
    v5 = a3;
    v9 = objc_alloc_init(CDSystemAuthenticationDidFinishAuthRequest);
    -[CDSystemAuthenticationDidFinishAuthRequest setEnabled:](v9, "setEnabled:", a2);
    -[CDSystemAuthenticationDidFinishAuthRequest setError:](v9, "setError:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CPSDevice currentDevice](CPSDevice, "currentDevice"));
    -[CDSystemAuthenticationDidFinishAuthRequest setDeviceFlags:](v9, "setDeviceFlags:", objc_msgSend(v6, "flags"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "model"));
    -[CDSystemAuthenticationDidFinishAuthRequest setDeviceModel:](v9, "setDeviceModel:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
    -[CDSystemAuthenticationDidFinishAuthRequest setDeviceName:](v9, "setDeviceName:", v8);

    sub_100006E30(a1, v9);
  }
}

id sub_10000B7BC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void sub_10000B7C4(id a1, NSError *a2)
{
  NSError *v2;
  NSError *v3;
  uint64_t v4;
  NSObject *v5;

  v2 = a2;
  v3 = v2;
  if (v2)
  {
    v4 = cps_session_log(v2);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      sub_10001E590();

  }
}

void sub_10000B818(uint64_t a1)
{
  void *v2;
  void *v3;
  CDGetInfoRequest *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[5];

  if (a1)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "UUIDString"));

    v4 = objc_alloc_init(CDGetInfoRequest);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](ACAccountStore, "defaultStore"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aa_primaryAppleAccount"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "aa_altDSID"));
    v8 = sub_100007C30((uint64_t)v7, (uint64_t)v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[CDGetInfoRequest setAppleAccountToken:](v4, "setAppleAccountToken:", v9);

    -[CDGetInfoRequest setNonce:](v4, "setNonce:", v3);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000B934;
    v10[3] = &unk_100030868;
    v10[4] = a1;
    sub_100006C6C(a1, v4, v10);

  }
}

void sub_10000B934(uint64_t a1, void *a2, void *a3, void *a4)
{
  sub_10000B93C(*(_QWORD *)(a1 + 32), a2, a3, a4);
}

void sub_10000B93C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  CDSharingGetAuthInfoResponse *v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  void *v18;
  _QWORD v19[6];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  CDSharingGetAuthInfoResponse *v22;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v10 = _os_activity_create((void *)&_mh_execute_header, "sharing session/handle get auth info response", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v10, &state);
    if (v9)
    {
      v12 = cps_session_log(v11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_10001E4A4();

      sub_1000053F0(a1);
    }
    else
    {
      v14 = -[CDSharingGetAuthInfoResponse initWithRapportDictionary:]([CDSharingGetAuthInfoResponse alloc], "initWithRapportDictionary:", v7);
      v15 = cps_session_log(v14);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v14;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Received get auth info response: %@", buf, 0xCu);
      }

      v17 = sub_10000BB38(a1, v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10000BCD8;
      v19[3] = &unk_100030BF8;
      v19[4] = a1;
      v19[5] = v14;
      sub_1000070D4(a1, v18, v19);

    }
    os_activity_scope_leave(&state);

  }
}

void sub_10000BB0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

id sub_10000BB38(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[2];

  v3 = a2;
  if (a1)
  {
    v4 = (void *)GestaltCopyAnswer(CFSTR("DeviceName"), 0, 0);
    v5 = v4;
    if (!v4)
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v11[0] = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "deviceName"));
    v7 = v6;
    if (!v6)
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v11[1] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2));
    if (!v6)

    if (!v4)
    v9 = objc_alloc_init((Class)CUUserNotificationSession);
    objc_msgSend(v9, "setFlags:", 1);
    objc_msgSend(v9, "setIdentifier:", *(_QWORD *)(a1 + 160));
    objc_msgSend(v9, "setBundleID:", CFSTR("com.apple.CompanionNotifications"));
    objc_msgSend(v9, "setCategoryID:", CFSTR("CDUserNotificationCategoryGeneric"));
    objc_msgSend(v9, "setTitleKey:", CFSTR("Apple TV"));
    objc_msgSend(v9, "setBodyKey:", CFSTR("Use your %@ to share from “%@”."));
    objc_msgSend(v9, "setBodyArguments:", v8);
    objc_msgSend(v9, "setDispatchQueue:", *(_QWORD *)(a1 + 176));

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void sub_10000BCD8(uint64_t a1, int a2)
{
  uint64_t v3;
  void *v4;

  if (a2 == 1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "invalidate");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 48);
    *(_QWORD *)(v3 + 48) = 0;

    sub_10000BD20(*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  }
}

void sub_10000BD20(uint64_t a1, void *a2)
{
  id v3;

  if (a1)
  {
    v3 = a2;
    sub_100006A4C(a1);
    sub_10000BD6C(a1, v3);

  }
}

void sub_10000BD6C(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  CDProviderViewService *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  os_activity_scope_state_s state;

  v3 = a2;
  if (a1)
  {
    v4 = _os_activity_create((void *)&_mh_execute_header, "sharing session/present view service", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v4, &state);
    v5 = objc_alloc_init(CDProviderViewService);
    -[CDProviderViewService setDispatchQueue:](v5, "setDispatchQueue:", *(_QWORD *)(a1 + 176));
    -[CDProviderViewService setViewControllerClassName:](v5, "setViewControllerClassName:", CFSTR("SharingViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "deviceName"));
    -[CDProviderViewService setRemoteDeviceName:](v5, "setRemoteDeviceName:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "requestData"));
    -[CDProviderViewService setSharingData:](v5, "setSharingData:", v7);

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000BEC8;
    v8[3] = &unk_100030B18;
    v8[4] = a1;
    -[CDProviderViewService setActionHandler:](v5, "setActionHandler:", v8);
    -[CDProviderViewService setInvalidationHandler:](v5, "setInvalidationHandler:", &stru_100030C38);
    -[CDProviderViewService activateWithCompletionHandler:](v5, "activateWithCompletionHandler:", &stru_100030C58);

    os_activity_scope_leave(&state);
  }

}

void sub_10000BEB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_10000BEC8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  id v8;

  v4 = a3;
  v5 = cps_session_log(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received view service dismissal, error: %@", (uint8_t *)&v7, 0xCu);
  }

  sub_10000BF88(*(_QWORD *)(a1 + 32), v4);
}

void sub_10000BF88(uint64_t a1, void *a2)
{
  id v3;
  CDSharingDidFinishAuthRequest *v4;

  if (a1)
  {
    v3 = a2;
    v4 = objc_alloc_init(CDSharingDidFinishAuthRequest);
    -[CDSharingDidFinishAuthRequest setError:](v4, "setError:", v3);

    sub_100006E30(a1, v4);
  }
}

void sub_10000BFF8(id a1, NSError *a2)
{
  NSError *v2;
  NSError *v3;
  uint64_t v4;
  NSObject *v5;

  v2 = a2;
  v3 = v2;
  if (v2)
  {
    v4 = cps_session_log(v2);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      sub_10001E590();

  }
}

void sub_10000C04C(uint64_t a1)
{
  void *v2;
  void *v3;
  CDGetInfoRequest *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[5];

  if (a1)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "UUIDString"));

    v4 = objc_alloc_init(CDGetInfoRequest);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](ACAccountStore, "defaultStore"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aa_primaryAppleAccount"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "aa_altDSID"));
    v8 = sub_100007C30((uint64_t)v7, (uint64_t)v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[CDGetInfoRequest setAppleAccountToken:](v4, "setAppleAccountToken:", v9);

    -[CDGetInfoRequest setNonce:](v4, "setNonce:", v3);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000C168;
    v10[3] = &unk_100030868;
    v10[4] = a1;
    sub_100006C6C(a1, v4, v10);

  }
}

void sub_10000C168(uint64_t a1, void *a2, void *a3, void *a4)
{
  sub_10000C170(*(_QWORD *)(a1 + 32), a2, a3, a4);
}

void sub_10000C170(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  CDRestrictedAccessGetAuthInfoResponse *v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  void *v18;
  _QWORD v19[6];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  CDRestrictedAccessGetAuthInfoResponse *v22;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v10 = _os_activity_create((void *)&_mh_execute_header, "restricted access session/handle get auth info response", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v10, &state);
    if (v9)
    {
      v12 = cps_session_log(v11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_10001E4A4();

      sub_1000053F0(a1);
    }
    else
    {
      v14 = -[CDRestrictedAccessGetAuthInfoResponse initWithRapportDictionary:]([CDRestrictedAccessGetAuthInfoResponse alloc], "initWithRapportDictionary:", v7);
      v15 = cps_session_log(v14);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v14;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Received get auth info response: %@", buf, 0xCu);
      }

      v17 = sub_10000C36C(a1, v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10000C440;
      v19[3] = &unk_100030BF8;
      v19[4] = a1;
      v19[5] = v14;
      sub_1000070D4(a1, v18, v19);

    }
    os_activity_scope_leave(&state);

  }
}

void sub_10000C340(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

id sub_10000C36C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CDUserNotificationContent restrictedAccessContentForRestrictionType:](CDUserNotificationContent, "restrictedAccessContentForRestrictionType:", objc_msgSend(v3, "restrictionType")));
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentUserName"));
      objc_msgSend(v5, "addBodyArgument:", v6);

      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceName"));
      objc_msgSend(v5, "addBodyArgument:", v7);

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[CUUserNotificationSession cad_sessionWithContent:](CUUserNotificationSession, "cad_sessionWithContent:", v5));
      objc_msgSend(v8, "setDispatchQueue:", *(_QWORD *)(a1 + 176));
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void sub_10000C440(uint64_t a1, int a2)
{
  uint64_t v3;
  void *v4;

  if (a2 == 1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "invalidate");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 48);
    *(_QWORD *)(v3 + 48) = 0;

    sub_10000C488(*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  }
}

void sub_10000C488(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  uint8_t buf[16];
  os_activity_scope_state_s state;

  v3 = a2;
  if (a1)
  {
    v4 = _os_activity_create((void *)&_mh_execute_header, "restricted access session/start prox card transaction", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v4, &state);
    v6 = cps_session_log(v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Starting prox card transaction.", buf, 2u);
    }

    v8 = objc_alloc_init((Class)SFClient);
    objc_msgSend(v8, "setDispatchQueue:", *(_QWORD *)(a1 + 176));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000C6AC;
    v9[3] = &unk_100030AC8;
    v9[4] = a1;
    v10 = v3;
    v11 = v8;
    objc_msgSend(v8, "startProxCardTransactionWithOptions:completion:", 127, v9);

    os_activity_scope_leave(&state);
  }

}

void sub_10000C5B0(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 48));
  _Unwind_Resume(a1);
}

void sub_10000C5C8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  CDRestrictedAccesssDidFinishAuthRequest *v9;

  if (a1)
  {
    v5 = a3;
    v9 = objc_alloc_init(CDRestrictedAccesssDidFinishAuthRequest);
    -[CDRestrictedAccesssDidFinishAuthRequest setApproved:](v9, "setApproved:", a2);
    -[CDRestrictedAccesssDidFinishAuthRequest setError:](v9, "setError:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CPSDevice currentDevice](CPSDevice, "currentDevice"));
    -[CDRestrictedAccesssDidFinishAuthRequest setDeviceFlags:](v9, "setDeviceFlags:", objc_msgSend(v6, "flags"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "model"));
    -[CDRestrictedAccesssDidFinishAuthRequest setDeviceModel:](v9, "setDeviceModel:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
    -[CDRestrictedAccesssDidFinishAuthRequest setDeviceName:](v9, "setDeviceName:", v8);

    sub_100006E30(a1, v9);
  }
}

void sub_10000C6AC(uint64_t a1, int a2)
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = cps_session_log(a1);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Prox card transaction activated.", v7, 2u);
    }

    sub_100006A4C(*(_QWORD *)(a1 + 32));
    sub_10000C768(*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_10001E564();

    objc_msgSend(*(id *)(a1 + 48), "invalidate");
    sub_1000053F0(*(_QWORD *)(a1 + 32));
  }
}

void sub_10000C768(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  CDProviderViewService *v9;
  void *v10;
  void *v11;
  CDProviderViewService *v12;
  void **v13;
  uint64_t v14;
  id (*v15)(uint64_t);
  void *v16;
  id v17;
  _QWORD v18[5];
  os_activity_scope_state_s state;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = _os_activity_create((void *)&_mh_execute_header, "restricted access session/present view service", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v7, &state);
    v8 = objc_alloc_init((Class)CPSRestrictedAccessRequest);
    v9 = objc_alloc_init(CDProviderViewService);
    -[CDProviderViewService setDispatchQueue:](v9, "setDispatchQueue:", *(_QWORD *)(a1 + 176));
    -[CDProviderViewService setViewControllerClassName:](v9, "setViewControllerClassName:", CFSTR("ConfirmViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deviceName"));
    -[CDProviderViewService setRemoteDeviceName:](v9, "setRemoteDeviceName:", v10);

    -[CDProviderViewService setRestrictedAccessRequest:](v9, "setRestrictedAccessRequest:", v8);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000C924;
    v18[3] = &unk_100030B18;
    v18[4] = a1;
    -[CDProviderViewService setActionHandler:](v9, "setActionHandler:", v18);
    v13 = _NSConcreteStackBlock;
    v14 = 3221225472;
    v15 = sub_10000CA50;
    v16 = &unk_1000307A0;
    v17 = v6;
    -[CDProviderViewService setInvalidationHandler:](v9, "setInvalidationHandler:", &v13);
    -[CDProviderViewService activateWithCompletionHandler:](v9, "activateWithCompletionHandler:", &stru_100030C78, v13, v14, v15, v16);
    v11 = *(void **)(a1 + 144);
    *(_QWORD *)(a1 + 144) = v9;
    v12 = v9;

    os_activity_scope_leave(&state);
  }

}

void sub_10000C90C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_10000C924(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  __CFString *v8;
  uint8_t buf[4];
  __CFString *v10;
  __int16 v11;
  id v12;

  v5 = a3;
  v6 = cps_session_log(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)(a2 - 1) >= 3)
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %ld)"), a2));
    else
      v8 = off_100030CE8[a2 - 1];
    *(_DWORD *)buf = 138412546;
    v10 = v8;
    v11 = 2112;
    v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received view service action: %@, error: %@", buf, 0x16u);

  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 136) = a2 == 3;
  sub_10000C5C8(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 136), v5);

}

id sub_10000CA50(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void sub_10000CA58(id a1, NSError *a2)
{
  NSError *v2;
  NSError *v3;
  uint64_t v4;
  NSObject *v5;

  v2 = a2;
  v3 = v2;
  if (v2)
  {
    v4 = cps_session_log(v2);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      sub_10001E590();

  }
}

void sub_10000CAAC(uint64_t a1)
{
  CDGetInfoRequest *v2;
  _QWORD v3[5];

  if (a1)
  {
    v2 = objc_alloc_init(CDGetInfoRequest);
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10000CB28;
    v3[3] = &unk_100030868;
    v3[4] = a1;
    sub_100006C6C(a1, v2, v3);

  }
}

void sub_10000CB28(uint64_t a1, void *a2, void *a3, void *a4)
{
  sub_10000CB30(*(_QWORD *)(a1 + 32), a2, a3, a4);
}

void sub_10000CB30(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  CDTVProviderGetAuthInfoResponse *v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  void *v18;
  _QWORD v19[6];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  CDTVProviderGetAuthInfoResponse *v22;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v10 = _os_activity_create((void *)&_mh_execute_header, "tv provider session/handle get auth info response", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v10, &state);
    if (v9)
    {
      v12 = cps_session_log(v11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_10001E4A4();

      sub_1000053F0(a1);
    }
    else
    {
      v14 = -[CDTVProviderGetAuthInfoResponse initWithRapportDictionary:]([CDTVProviderGetAuthInfoResponse alloc], "initWithRapportDictionary:", v7);
      v15 = cps_session_log(v14);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v14;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Received get auth info response: %@", buf, 0xCu);
      }

      v17 = sub_10000CD2C(a1, v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10000CDF0;
      v19[3] = &unk_100030BF8;
      v19[4] = a1;
      v19[5] = v14;
      sub_1000070D4(a1, v18, v19);

    }
    os_activity_scope_leave(&state);

  }
}

void sub_10000CD00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

id sub_10000CD2C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  if (a1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CDUserNotificationContent tvProviderContent](CDUserNotificationContent, "tvProviderContent"));
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "providerName"));
      objc_msgSend(v4, "addBodyArgument:", v5);

      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "deviceName"));
      objc_msgSend(v4, "addBodyArgument:", v6);

      v7 = (void *)objc_claimAutoreleasedReturnValue(+[CUUserNotificationSession cad_sessionWithContent:](CUUserNotificationSession, "cad_sessionWithContent:", v4));
      objc_msgSend(v7, "setDispatchQueue:", *(_QWORD *)(a1 + 176));
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void sub_10000CDF0(uint64_t a1, int a2)
{
  uint64_t v3;
  void *v4;

  if (a2 == 1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "invalidate");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 48);
    *(_QWORD *)(v3 + 48) = 0;

    sub_100006A4C(*(_QWORD *)(a1 + 32));
    sub_10000CE40(*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  }
}

void sub_10000CE40(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  CDProviderViewService *v8;
  void *v9;
  CDProviderViewService *v10;
  _QWORD v11[5];
  os_activity_scope_state_s state;

  v3 = a2;
  if (a1)
  {
    v4 = _os_activity_create((void *)&_mh_execute_header, "tv provider session/present view service", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v4, &state);
    v5 = objc_alloc_init((Class)CPSTVProviderRequest);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "providerURL"));
    objc_msgSend(v5, "setProviderURL:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "providerName"));
    objc_msgSend(v5, "setProviderName:", v7);

    v8 = objc_alloc_init(CDProviderViewService);
    -[CDProviderViewService setDispatchQueue:](v8, "setDispatchQueue:", *(_QWORD *)(a1 + 176));
    -[CDProviderViewService setViewControllerClassName:](v8, "setViewControllerClassName:", CFSTR("WebViewController"));
    -[CDProviderViewService setTvProviderRequest:](v8, "setTvProviderRequest:", v5);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000CFC4;
    v11[3] = &unk_1000307A0;
    v11[4] = a1;
    -[CDProviderViewService setInvalidationHandler:](v8, "setInvalidationHandler:", v11);
    -[CDProviderViewService activateWithCompletionHandler:](v8, "activateWithCompletionHandler:", &stru_100030C98);
    v9 = *(void **)(a1 + 144);
    *(_QWORD *)(a1 + 144) = v8;
    v10 = v8;

    os_activity_scope_leave(&state);
  }

}

void sub_10000CFAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_10000CFC4(uint64_t a1)
{
  sub_1000053F0(*(_QWORD *)(a1 + 32));
}

void sub_10000CFCC(id a1, NSError *a2)
{
  NSError *v2;
  NSError *v3;
  uint64_t v4;
  NSObject *v5;

  v2 = a2;
  v3 = v2;
  if (v2)
  {
    v4 = cps_session_log(v2);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      sub_10001E590();

  }
}

void sub_10000D020(uint64_t a1)
{
  CDGetInfoRequest *v2;
  _QWORD v3[5];

  if (a1)
  {
    v2 = objc_alloc_init(CDGetInfoRequest);
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10000D09C;
    v3[3] = &unk_100030868;
    v3[4] = a1;
    sub_100006C6C(a1, v2, v3);

  }
}

void sub_10000D09C(uint64_t a1, void *a2, void *a3, void *a4)
{
  sub_10000D0A4(*(_QWORD *)(a1 + 32), a2, a3, a4);
}

void sub_10000D0A4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  CDLearnMoreGetAuthInfoResponse *v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  void *v18;
  _QWORD v19[6];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  CDLearnMoreGetAuthInfoResponse *v22;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v10 = _os_activity_create((void *)&_mh_execute_header, "learn more session/handle get auth info response", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v10, &state);
    if (v9)
    {
      v12 = cps_session_log(v11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_10001E4A4();

      sub_1000053F0(a1);
    }
    else
    {
      v14 = -[CDLearnMoreGetAuthInfoResponse initWithRapportDictionary:]([CDLearnMoreGetAuthInfoResponse alloc], "initWithRapportDictionary:", v7);
      v15 = cps_session_log(v14);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v14;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Received get auth info response: %@", buf, 0xCu);
      }

      v17 = sub_10000D2A0(a1, v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10000D3B0;
      v19[3] = &unk_100030BF8;
      v19[4] = a1;
      v19[5] = v14;
      sub_1000070D4(a1, v18, v19);

    }
    os_activity_scope_leave(&state);

  }
}

void sub_10000D274(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

id sub_10000D2A0(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a2;
  if (a1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CDUserNotificationContent learnMoreContent](CDUserNotificationContent, "learnMoreContent"));
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URL"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "host"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "path"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingString:", v7));

      objc_msgSend(v4, "addBodyArgument:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "deviceName"));
      objc_msgSend(v4, "addBodyArgument:", v9);

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[CUUserNotificationSession cad_sessionWithContent:](CUUserNotificationSession, "cad_sessionWithContent:", v4));
      objc_msgSend(v10, "setDispatchQueue:", *(_QWORD *)(a1 + 176));

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void sub_10000D3B0(uint64_t a1, int a2)
{
  uint64_t v3;
  void *v4;

  if (a2 == 1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "invalidate");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 48);
    *(_QWORD *)(v3 + 48) = 0;

    sub_10000D3F8(*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  }
}

void sub_10000D3F8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  if (a1)
  {
    v3 = a2;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URL"));

    v18 = FBSOpenApplicationOptionKeyPromptUnlockDevice;
    v19 = &__kCFBooleanTrue;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
    v7 = objc_msgSend(v4, "openURL:withOptions:", v5, v6);

    if ((v7 & 1) == 0)
    {
      v9 = cps_session_log(v8);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_10001E810(v10, v11, v12, v13, v14, v15, v16, v17);

    }
    sub_10000D520(a1);
  }
}

void sub_10000D520(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  CDLearnMoreDidFinishRequest *v5;

  if (a1)
  {
    v5 = objc_alloc_init(CDLearnMoreDidFinishRequest);
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[CPSDevice currentDevice](CPSDevice, "currentDevice"));
    -[CDLearnMoreDidFinishRequest setDeviceFlags:](v5, "setDeviceFlags:", objc_msgSend(v2, "flags"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "model"));
    -[CDLearnMoreDidFinishRequest setDeviceModel:](v5, "setDeviceModel:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "name"));
    -[CDLearnMoreDidFinishRequest setDeviceName:](v5, "setDeviceName:", v4);

    sub_100006E30(a1, v5);
  }
}

id sub_10000D5DC(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CDUserNotificationContent dedicatedCameraContentForDeviceType:](CDUserNotificationContent, "dedicatedCameraContentForDeviceType:", objc_msgSend(v3, "deviceType")));
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceName"));
      objc_msgSend(v5, "addBodyArgument:", v6);

      v7 = (void *)objc_claimAutoreleasedReturnValue(+[CUUserNotificationSession cad_sessionWithContent:](CUUserNotificationSession, "cad_sessionWithContent:", v5));
      objc_msgSend(v7, "setDispatchQueue:", *(_QWORD *)(a1 + 176));
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void sub_10000D690(uint64_t a1, int a2)
{
  uint64_t v3;
  void *v4;

  if (a2 == 1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "invalidate");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 48);
    *(_QWORD *)(v3 + 48) = 0;

    sub_10000D6D8(*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  }
}

void sub_10000D6D8(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  uint8_t buf[16];
  os_activity_scope_state_s state;

  v3 = a2;
  if (a1)
  {
    v4 = _os_activity_create((void *)&_mh_execute_header, "dedicated camera session/start prox card transaction", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v4, &state);
    v6 = cps_session_log(v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Starting prox card transaction.", buf, 2u);
    }

    v8 = objc_alloc_init((Class)SFClient);
    objc_msgSend(v8, "setDispatchQueue:", *(_QWORD *)(a1 + 176));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000DBAC;
    v9[3] = &unk_100030AC8;
    v9[4] = a1;
    v10 = v3;
    v11 = v8;
    objc_msgSend(v8, "startProxCardTransactionWithOptions:completion:", 127, v9);

    os_activity_scope_leave(&state);
  }

}

void sub_10000D800(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 48));
  _Unwind_Resume(a1);
}

void sub_10000D818(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  CDProviderViewService *v8;
  void *v9;
  CDProviderViewService *v10;
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  os_activity_scope_state_s state;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = _os_activity_create((void *)&_mh_execute_header, "dedicated camera provider session/present view service", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v7, &state);
    v8 = objc_alloc_init(CDProviderViewService);
    -[CDProviderViewService setDispatchQueue:](v8, "setDispatchQueue:", *(_QWORD *)(a1 + 176));
    -[CDProviderViewService setViewControllerClassName:](v8, "setViewControllerClassName:", CFSTR("DedicatedCameraViewController"));
    -[CDProviderViewService setDedicatedCameraRequest:](v8, "setDedicatedCameraRequest:", v5);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000D9B0;
    v13[3] = &unk_1000307C8;
    v14 = v6;
    v15 = a1;
    -[CDProviderViewService setInvalidationHandler:](v8, "setInvalidationHandler:", v13);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000D9D8;
    v12[3] = &unk_100030B18;
    v12[4] = a1;
    -[CDProviderViewService setActionHandler:](v8, "setActionHandler:", v12);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000DB38;
    v11[3] = &unk_100030840;
    v11[4] = a1;
    -[CDProviderViewService activateWithCompletionHandler:](v8, "activateWithCompletionHandler:", v11);
    v9 = *(void **)(a1 + 144);
    *(_QWORD *)(a1 + 144) = v8;
    v10 = v8;

    os_activity_scope_leave(&state);
  }

}

void sub_10000D99C(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 80));
  _Unwind_Resume(a1);
}

void sub_10000D9B0(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  sub_1000053F0(*(_QWORD *)(a1 + 40));
}

void sub_10000D9D8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  __CFString *v8;
  uint64_t v9;
  id v10;
  uint8_t buf[4];
  __CFString *v12;
  __int16 v13;
  id v14;

  v5 = a3;
  v6 = cps_session_log(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)(a2 - 1) >= 3)
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %ld)"), a2));
    else
      v8 = off_100030CE8[a2 - 1];
    *(_DWORD *)buf = 138412546;
    v12 = v8;
    v13 = 2112;
    v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received view service action: %@, error: %@", buf, 0x16u);

  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 136) = a2 == 3;
  v9 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v9 + 136))
  {
    v10 = objc_alloc_init((Class)CPSDedicatedCameraResponse);
    sub_100005B94(v9, v10);

  }
  else
  {
    sub_100005AD8(*(_QWORD *)(a1 + 32), v5);
  }
  sub_1000053F0(*(_QWORD *)(a1 + 32));

}

void sub_10000DB38(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = cps_session_log(v3);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      sub_10001E590();

    sub_100005AD8(*(_QWORD *)(a1 + 32), v4);
    sub_1000053F0(*(_QWORD *)(a1 + 32));
  }

}

void sub_10000DBAC(uint64_t a1, int a2)
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = cps_session_log(a1);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Prox card transaction activated.", v7, 2u);
    }

    sub_10000D818(*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_10001E564();

    objc_msgSend(*(id *)(a1 + 48), "invalidate");
    sub_1000053F0(*(_QWORD *)(a1 + 32));
  }
}

void sub_10000DDA4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10000DDB4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_10000DDD4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_10000DDE4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10000DFB4(uint64_t a1, void *a2, void *a3, void *a4)
{
  sub_10000DFBC(*(_QWORD **)(a1 + 32), a2, a3, a4);
}

void sub_10000DFBC(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  CDGetInfoRequest *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  uint64_t v17;
  CDStoreAuthenticationGetAuthInfoResponse *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  os_activity_scope_state_s v35;
  uint8_t buf[4];
  void *v37;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v10 = _os_activity_create((void *)&_mh_execute_header, "store authentication session/handle get auth info request", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    v35.opaque[0] = 0;
    v35.opaque[1] = 0;
    os_activity_scope_enter(v10, &v35);
    v11 = -[CDGetInfoRequest initWithRapportDictionary:]([CDGetInfoRequest alloc], "initWithRapportDictionary:", v7);
    v12 = cps_session_log(v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received get auth info request: %@", buf, 0xCu);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CDGetInfoRequest storeAccountToken](v11, "storeAccountToken"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CDGetInfoRequest nonce](v11, "nonce"));
    v16 = sub_10000E680(a1, v14, v15);

    if ((v16 & 1) != 0)
    {
      v18 = objc_alloc_init(CDStoreAuthenticationGetAuthInfoResponse);
      -[CDStoreAuthenticationGetAuthInfoResponse setAuthenticationRequest:](v18, "setAuthenticationRequest:", a1[14]);
      v19 = (void *)GestaltCopyAnswer(CFSTR("DeviceName"), 0, 0);
      -[CDStoreAuthenticationGetAuthInfoResponse setDeviceClass:](v18, "setDeviceClass:", v19);

      v20 = (void *)GestaltCopyAnswer(CFSTR("UserAssignedDeviceName"), 0, 0);
      -[CDStoreAuthenticationGetAuthInfoResponse setDeviceName:](v18, "setDeviceName:", v20);

      v22 = cps_session_log(v21);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v18;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Sending get auth info response: %@", buf, 0xCu);
      }

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[CDStoreAuthenticationGetAuthInfoResponse makeRapportDictionary](v18, "makeRapportDictionary"));
      (*((void (**)(id, void *, _QWORD, _QWORD))v9 + 2))(v9, v24, 0, 0);

    }
    else
    {
      v25 = cps_session_log(v17);
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        sub_10001E878(v26, v27, v28, v29, v30, v31, v32, v33);

      v34 = NSErrorF(NSOSStatusErrorDomain, 4294960542, "Invalid store account token.");
      v18 = (CDStoreAuthenticationGetAuthInfoResponse *)objc_claimAutoreleasedReturnValue(v34);
      (*((void (**)(id, _QWORD, _QWORD, CDStoreAuthenticationGetAuthInfoResponse *))v9 + 2))(v9, 0, 0, v18);
    }

    os_activity_scope_leave(&v35);
  }

}

void sub_10000E298(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_10000E2C4(uint64_t a1, void *a2, void *a3, void *a4)
{
  sub_10000E2CC(*(void **)(a1 + 32), a2, a3, a4);
}

void sub_10000E2CC(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  CDStoreAuthenticationDidFinishAuthRequest *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  os_activity_scope_state_s v28;
  uint8_t buf[4];
  CDStoreAuthenticationDidFinishAuthRequest *v30;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v10 = _os_activity_create((void *)&_mh_execute_header, "store authentication session/handle did finish auth request", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    v28.opaque[0] = 0;
    v28.opaque[1] = 0;
    os_activity_scope_enter(v10, &v28);
    v11 = -[CDStoreAuthenticationDidFinishAuthRequest initWithRapportDictionary:]([CDStoreAuthenticationDidFinishAuthRequest alloc], "initWithRapportDictionary:", v7);
    v12 = objc_alloc_init((Class)CPSDevice);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CDStoreAuthenticationDidFinishAuthRequest deviceName](v11, "deviceName"));
    objc_msgSend(v12, "setName:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CDStoreAuthenticationDidFinishAuthRequest deviceModel](v11, "deviceModel"));
    objc_msgSend(v12, "setModel:", v14);

    objc_msgSend(v12, "setFlags:", -[CDStoreAuthenticationDidFinishAuthRequest deviceFlags](v11, "deviceFlags"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "model"));
    v16 = GestaltProductTypeStringToDeviceClass() == 6;

    if (v16)
      v17 = objc_msgSend(a1, "_notifyDeviceAcceptedNotification:", v12);
    v18 = cps_session_log(v17);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v11;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Received did finish auth request: %@", buf, 0xCu);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CDStoreAuthenticationDidFinishAuthRequest authenticationResult](v11, "authenticationResult"));
    v21 = v20 == 0;

    if (v21)
    {
      v25 = (id)objc_claimAutoreleasedReturnValue(-[CDStoreAuthenticationDidFinishAuthRequest error](v11, "error"));
      objc_msgSend(a1, "_notifySessionFailed:", v25);
    }
    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bs_safeStringForKey:", RPOptionSenderModelID));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bs_safeNumberForKey:", RPOptionStatusFlags));
      v24 = objc_msgSend(v23, "unsignedIntegerValue");
      if (CPSMetrics)
        +[CPSMetrics sendProviderDeviceUsageEvent:](CPSMetrics, "sendProviderDeviceUsageEvent:", v22, v24);
      else

      v26 = objc_alloc((Class)CPSStoreAuthenticationResponse);
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[CDStoreAuthenticationDidFinishAuthRequest authenticationResult](v11, "authenticationResult"));
      v25 = objc_msgSend(v26, "initWithAuthenticationResult:", v27);

      objc_msgSend(a1, "_notifySessionFinished:", v25);
    }

    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v9 + 2))(v9, 0, 0, 0);
    objc_msgSend(a1, "_invalidated");

    os_activity_scope_leave(&v28);
  }

}

void sub_10000E5B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

_QWORD *sub_10000E680(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  v5 = a3;
  if (a1)
  {
    v6 = (void *)a1[15];
    v7 = a2;
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ams_altDSID"));
    v9 = (void *)v8;
    v10 = 0;
    if (v5 && v8)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@+%@"), v8, v5));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dataUsingEncoding:", 4));
      if (v12)
      {
        v13 = malloc_type_malloc(0x40uLL, 0xCC7B9F1DuLL);
        v14 = kCryptoHashDescriptor_SHA512;
        v15 = objc_retainAutorelease(v12);
        CryptoHashOneShot(v14, objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"), v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", v13, 64, 1));
      }
      else
      {
        v10 = 0;
      }

    }
    a1 = objc_msgSend(v10, "isEqualToData:", v7);

  }
  return a1;
}

id sub_10000E9A4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("connection"));
}

void sub_10000EA54(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  void (**v8)(id, id);
  id WeakRetained;
  id v10;

  v10 = a2;
  v7 = a3;
  v8 = a4;
  if (a1)
  {
    if ((objc_msgSend(v10, "hasStorePurchaseEntitlement") & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
      objc_msgSend(WeakRetained, "serviceConnection:serviceClient:startAuthenticationSessionWithRequest:completionHandler:", a1, v10, v7, v8);
    }
    else
    {
      WeakRetained = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CPSErrorDomain, 103, 0));
      v8[2](v8, WeakRetained);
    }

  }
}

void sub_10000EB1C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  void (**v8)(id, id);
  void *v9;
  id WeakRetained;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v13 = a2;
  v7 = a3;
  v8 = a4;
  if (a1)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "overrideBundleIdentifier"));

    if (v9)
    {
      if ((objc_msgSend(v13, "hasAppSignInOverrideBundleIdentifierEntitlement") & 1) != 0)
      {
        if ((_BSIsInternalInstall("-[CDServiceConnection _serviceClient:startAppSignInSessionWithRequest:completionHandler:]") & 1) != 0)
          goto LABEL_5;
        v11 = CPSErrorDomain;
        v12 = 101;
      }
      else
      {
        v11 = CPSErrorDomain;
        v12 = 103;
      }
      WeakRetained = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v11, v12, 0));
      v8[2](v8, WeakRetained);
      goto LABEL_9;
    }
LABEL_5:
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    objc_msgSend(WeakRetained, "serviceConnection:serviceClient:startAuthenticationSessionWithRequest:completionHandler:", a1, v13, v7, v8);
LABEL_9:

  }
}

void sub_10000EC28(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  void (**v8)(id, id);
  id WeakRetained;
  id v10;

  v10 = a2;
  v7 = a3;
  v8 = a4;
  if (a1)
  {
    if ((objc_msgSend(v10, "hasSystemAuthenticationEntitlement") & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
      objc_msgSend(WeakRetained, "serviceConnection:serviceClient:startAuthenticationSessionWithRequest:completionHandler:", a1, v10, v7, v8);
    }
    else
    {
      WeakRetained = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CPSErrorDomain, 103, 0));
      v8[2](v8, WeakRetained);
    }

  }
}

void sub_10000ECF0(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v7;
  id v8;
  id v9;
  id v10;
  id WeakRetained;

  if (a1)
  {
    v7 = (id *)(a1 + 16);
    v8 = a4;
    v9 = a3;
    v10 = a2;
    WeakRetained = objc_loadWeakRetained(v7);
    objc_msgSend(WeakRetained, "serviceConnection:serviceClient:startAuthenticationSessionWithRequest:completionHandler:", a1, v10, v9, v8);

  }
}

void sub_10000ED80(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  void (**v8)(id, id);
  id WeakRetained;
  id v10;

  v10 = a2;
  v7 = a3;
  v8 = a4;
  if (a1)
  {
    if ((objc_msgSend(v10, "hasRestrictedAccessEntitlement") & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
      objc_msgSend(WeakRetained, "serviceConnection:serviceClient:startAuthenticationSessionWithRequest:completionHandler:", a1, v10, v7, v8);
    }
    else
    {
      WeakRetained = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CPSErrorDomain, 103, 0));
      v8[2](v8, WeakRetained);
    }

  }
}

void sub_10000EE48(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  void (**v8)(id, id);
  id WeakRetained;
  id v10;

  v10 = a2;
  v7 = a3;
  v8 = a4;
  if (a1)
  {
    if ((objc_msgSend(v10, "hasStoreAuthenticationEntitlement") & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
      objc_msgSend(WeakRetained, "serviceConnection:serviceClient:startAuthenticationSessionWithRequest:completionHandler:", a1, v10, v7, v8);
    }
    else
    {
      WeakRetained = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CPSErrorDomain, 103, 0));
      v8[2](v8, WeakRetained);
    }

  }
}

void sub_10000EF10(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  void (**v8)(id, id);
  id WeakRetained;
  id v10;

  v10 = a2;
  v7 = a3;
  v8 = a4;
  if (a1)
  {
    if ((objc_msgSend(v10, "hasDedicatedCameraEntitlement") & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
      objc_msgSend(WeakRetained, "serviceConnection:serviceClient:startAuthenticationSessionWithRequest:completionHandler:", a1, v10, v7, v8);
    }
    else
    {
      WeakRetained = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CPSErrorDomain, 103, 0));
      v8[2](v8, WeakRetained);
    }

  }
}

void sub_10000F470(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_10000F498(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13[16];

  v3 = a2;
  v4 = cps_service_log();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_10001E8D8((uint64_t)v3, v6, v7, v8, v9, v10, v11, v12);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Started authentication session.", v13, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10000F720(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_10000FA30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_10000FBC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_10000FBEC(id a1, NSError *a2)
{
  NSError *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = a2;
  v4 = cps_service_log(v2, v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_10001E9A4((uint64_t)v2, v5, v6, v7, v8, v9, v10, v11);

}

void sub_10000FD9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_10000FDC0(id a1, NSError *a2)
{
  NSError *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = a2;
  v4 = cps_service_log(v2, v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_10001E9A4((uint64_t)v2, v5, v6, v7, v8, v9, v10, v11);

}

id sub_100010004(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return (id)objc_opt_self(*(_QWORD *)(a1 + 32));
}

void sub_1000100CC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 48))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = "View service already activated.";
    v5 = 4294960575;
LABEL_5:
    v6 = NSErrorWithOSStatusF(v5, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v7);

    sub_100010164(*(_QWORD *)(a1 + 32));
    return;
  }
  v3 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v2 + 49))
  {
    v4 = "View service already invalidated.";
    v5 = 4294896148;
    goto LABEL_5;
  }
  sub_1000102A0(v2, *(void **)(a1 + 40));
}

void sub_100010164(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 64));
    if (!*(_BYTE *)(a1 + 49))
    {
      *(_BYTE *)(a1 + 49) = 1;
      v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 24), "remoteObjectProxyWithErrorHandler:", &stru_100030DB8));
      objc_msgSend(v2, "cancel");

      objc_msgSend(*(id *)(a1 + 16), "invalidate");
      v3 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = 0;

      objc_msgSend(*(id *)(a1 + 24), "invalidate");
      v4 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = 0;

      objc_msgSend(*(id *)(a1 + 32), "invalidate");
      v5 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = 0;

      v6 = *(_QWORD *)(a1 + 56);
      if (v6)
      {
        (*(void (**)(uint64_t, uint64_t, _QWORD))(v6 + 16))(v6, 1, 0);
        v7 = *(void **)(a1 + 56);
        *(_QWORD *)(a1 + 56) = 0;

      }
      v8 = *(_QWORD *)(a1 + 128);
      if (v8)
      {
        v9 = NSErrorF(CPSErrorDomain, 4294896148, "View service invalidated before completing");
        v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v10);

        v11 = *(void **)(a1 + 128);
        *(_QWORD *)(a1 + 128) = 0;

      }
      v12 = *(_QWORD *)(a1 + 72);
      if (v12)
      {
        (*(void (**)(void))(v12 + 16))();
        v13 = *(void **)(a1 + 72);
        *(_QWORD *)(a1 + 72) = 0;

      }
    }
  }
}

void sub_1000102A0(uint64_t a1, void *a2)
{
  void (**v3)(id, _QWORD);
  uint64_t v4;
  void *v5;
  void (**v6)(id, _QWORD);

  v3 = a2;
  if (a1)
  {
    v6 = v3;
    *(_BYTE *)(a1 + 48) = 1;
    if (*(_QWORD *)(a1 + 88))
    {
      sub_100010394((id)a1);
      sub_1000103F0(a1);
      v6[2](v6, 0);
    }
    else
    {
      v4 = NSErrorWithOSStatusF(4294960591, "Failed to activate view service with nil view controller class name.");
      v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
      ((void (**)(id, void *))v6)[2](v6, v5);

    }
    v3 = v6;
  }

}

void sub_10001038C(uint64_t a1)
{
  sub_100010164(*(_QWORD *)(a1 + 32));
}

id sub_100010394(id result)
{
  id v1;
  uint64_t v2;
  void *v3;

  if (result)
  {
    v1 = result;
    v2 = objc_claimAutoreleasedReturnValue(+[NSXPCListener anonymousListener](NSXPCListener, "anonymousListener"));
    v3 = (void *)*((_QWORD *)v1 + 2);
    *((_QWORD *)v1 + 2) = v2;

    objc_msgSend(*((id *)v1 + 2), "_setQueue:", *((_QWORD *)v1 + 8));
    objc_msgSend(*((id *)v1 + 2), "setDelegate:", v1);
    return objc_msgSend(*((id *)v1 + 2), "resume");
  }
  return result;
}

void sub_1000103F0(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  if (a1)
  {
    v9 = objc_msgSend(objc_alloc((Class)SBSRemoteAlertDefinition), "initWithServiceName:viewControllerClassName:", CFSTR("com.apple.CompanionViewService"), *(_QWORD *)(a1 + 88));
    v2 = objc_alloc_init((Class)SBSRemoteAlertConfigurationContext);
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 16), "endpoint"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_endpoint"));
    objc_msgSend(v2, "setXpcEndpoint:", v4);

    v5 = sub_10001050C((_QWORD *)a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    objc_msgSend(v2, "setUserInfo:", v6);

    v7 = +[SBSRemoteAlertHandle newHandleWithDefinition:configurationContext:](SBSRemoteAlertHandle, "newHandleWithDefinition:configurationContext:", v9, v2);
    v8 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = v7;

    objc_msgSend(*(id *)(a1 + 32), "registerObserver:", a1);
    objc_msgSend(*(id *)(a1 + 32), "activateWithContext:", 0);

  }
}

id *sub_1000104E4(id *a1)
{
  if (a1)
    a1 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[3], "remoteObjectProxyWithErrorHandler:", &stru_100030DB8));
  return a1;
}

_QWORD *sub_10001050C(_QWORD *a1)
{
  _QWORD *v1;
  void *v2;
  _QWORD *v3;
  void *v4;

  v1 = a1;
  if (a1)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v3 = sub_10001057C(v1);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("presentationContextData"));

    v1 = objc_msgSend(v2, "copy");
  }
  return v1;
}

_QWORD *sub_10001057C(_QWORD *a1)
{
  _QWORD *v1;
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v15;

  v1 = a1;
  if (a1)
  {
    v2 = objc_alloc_init((Class)CPSViewServicePresentationContext);
    objc_msgSend(v2, "setDeviceName:", v1[10]);
    objc_msgSend(v2, "setSystemAuthenticationRequest:", v1[13]);
    objc_msgSend(v2, "setWebAuthenticationRequest:", v1[14]);
    objc_msgSend(v2, "setProxiedAppDomains:", v1[15]);
    objc_msgSend(v2, "setSharingData:", v1[12]);
    objc_msgSend(v2, "setRestrictedAccessRequest:", v1[17]);
    objc_msgSend(v2, "setStoreAuthenticationRequest:", v1[18]);
    objc_msgSend(v2, "setTvProviderRequest:", v1[20]);
    objc_msgSend(v2, "setDedicatedCameraRequest:", v1[21]);
    v15 = 0;
    v1 = (_QWORD *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v2, 1, &v15));
    v3 = v15;
    v5 = v3;
    if (!v1)
    {
      v6 = cps_daemon_log(v3, v4);
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_10001EA08((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);

    }
  }
  return v1;
}

void sub_100010690(id a1, NSError *a2)
{
  NSError *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = a2;
  v4 = cps_daemon_log(v2, v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_10001EA6C((uint64_t)v2, v5, v6, v7, v8, v9, v10, v11);

}

void sub_100010878(uint64_t a1)
{
  sub_100010164(*(_QWORD *)(a1 + 32));
}

void sub_1000109FC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 56);
  if (v3)
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(v3 + 16))(*(_QWORD *)(v2 + 56), 2, *(_QWORD *)(a1 + 40));
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 56);
    *(_QWORD *)(v4 + 56) = 0;

    v2 = *(_QWORD *)(a1 + 32);
  }
  sub_100010164(v2);
}

void sub_100010A4C(uint64_t a1)
{
  sub_100010164(*(_QWORD *)(a1 + 32));
}

void sub_100010B58(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
  if (v2)
  {
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v2 + 16))(v2, 3, 0);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 56);
    *(_QWORD *)(v3 + 56) = 0;

  }
}

void sub_100010C24(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 56);
  if (v3)
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(v3 + 16))(*(_QWORD *)(v2 + 56), 2, *(_QWORD *)(a1 + 40));
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 56);
    *(_QWORD *)(v4 + 56) = 0;

    v2 = *(_QWORD *)(a1 + 32);
  }
  sub_100010164(v2);
}

void sub_100010CF0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 128);
  if (v3)
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v3 + 16))(*(_QWORD *)(v2 + 128), *(_QWORD *)(a1 + 40), 0);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 128);
    *(_QWORD *)(v4 + 128) = 0;

    v2 = *(_QWORD *)(a1 + 32);
  }
  sub_100010164(v2);
}

void sub_100010DBC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 128);
  if (v3)
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v3 + 16))(*(_QWORD *)(v2 + 128), 0, *(_QWORD *)(a1 + 40));
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 128);
    *(_QWORD *)(v4 + 128) = 0;

    v2 = *(_QWORD *)(a1 + 32);
  }
  sub_100010164(v2);
}

void sub_100010E64(uint64_t a1)
{
  sub_100010164(*(_QWORD *)(a1 + 32));
}

void sub_100010EE8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 56);
  if (v3)
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(v3 + 16))(*(_QWORD *)(v2 + 56), 2, *(_QWORD *)(a1 + 40));
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 56);
    *(_QWORD *)(v4 + 56) = 0;

    v2 = *(_QWORD *)(a1 + 32);
  }
  sub_100010164(v2);
}

void sub_100010FB4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152);
  if (v2)
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 40), 0);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 152);
    *(_QWORD *)(v3 + 152) = 0;

  }
}

void sub_100011080(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152);
  if (v2)
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, 0, *(_QWORD *)(a1 + 40));
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 152);
    *(_QWORD *)(v3 + 152) = 0;

  }
}

_BYTE *sub_1000113A4(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (!result[9])
    return objc_msgSend(result, "_activated");
  return result;
}

id sub_100011410(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

id sub_100011470(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startRapportDiscovery");
}

id sub_1000114F0()
{
  if (qword_10003B790 != -1)
    dispatch_once(&qword_10003B790, &stru_100030E00);
  return (id)qword_10003B788;
}

uint64_t sub_10001166C(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_100011768(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "invalidate");
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = 0;

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  if (v7)
    (*(void (**)(uint64_t, id, uint64_t))(v7 + 16))(v7, v8, a3);

}

void sub_1000117D4(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = 0;

}

void sub_100011844(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.CompanionServices", "CDDeviceDiscovery");
  v2 = (void *)qword_10003B788;
  qword_10003B788 = (uint64_t)v1;

}

_BYTE *sub_100011940(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (!result[9])
    return objc_msgSend(result, "_activated");
  return result;
}

id sub_1000119AC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

id sub_100011ABC(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleDeviceFound:", a2);
}

void sub_100011AC8(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint8_t v15[16];

  v3 = a2;
  v4 = sub_100011B90();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_10001EB50((uint64_t)v3, v6, v7, v8, v9, v10, v11, v12);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "invalidate");
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 16);
    *(_QWORD *)(v13 + 16) = 0;

  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Discovery started.", v15, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_startDiscoveryTimer");
  }

}

id sub_100011B90()
{
  if (qword_10003B7A0 != -1)
    dispatch_once(&qword_10003B7A0, &stru_100030E48);
  return (id)qword_10003B798;
}

id sub_100011E44(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint8_t v5[16];

  v2 = sub_100011B90();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Timer fired.", v5, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

void sub_100011F30(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.CompanionServices", "CDRapportDiscovery");
  v2 = (void *)qword_10003B798;
  qword_10003B798 = (uint64_t)v1;

}

void sub_100011FF8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  unsigned int v12;
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  os_activity_scope_state_s v23;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = _os_activity_create((void *)&_mh_execute_header, "CompAuth/RapportClient/handleRequest", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v23.opaque[0] = 0;
  v23.opaque[1] = 0;
  os_activity_scope_enter(v10, &v23);
  if (!*(_BYTE *)(a1 + 40)
    || (v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bs_safeNumberForKey:", RPOptionStatusFlags)),
        v12 = objc_msgSend(v11, "integerValue"),
        v11,
        (v12 & 0x80000) != 0))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v13 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v13)
      sub_10001EC20(v13, v14, v15, v16, v17, v18, v19, v20);
    v21 = NSErrorF(CPSErrorDomain, 4294960542, "Owner device required");
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    (*((void (**)(id, _QWORD, _QWORD, void *))v9 + 2))(v9, 0, 0, v22);

  }
  os_activity_scope_leave(&v23);

}

void sub_100012148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1000121F8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  unsigned int v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  os_activity_scope_state_s v18;

  v5 = a2;
  v6 = a3;
  v7 = _os_activity_create((void *)&_mh_execute_header, "CompAuth/RapportClient/handleEvent", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v18.opaque[0] = 0;
  v18.opaque[1] = 0;
  os_activity_scope_enter(v7, &v18);
  if (!*(_BYTE *)(a1 + 40)
    || (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bs_safeNumberForKey:", RPOptionStatusFlags)),
        v9 = objc_msgSend(v8, "integerValue"),
        v8,
        (v9 & 0x80000) != 0))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v10 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v10)
      sub_10001EC20(v10, v11, v12, v13, v14, v15, v16, v17);
  }
  os_activity_scope_leave(&v18);

}

void sub_1000122E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1000123DC(uint64_t a1, void *a2, void *a3, void *a4)
{
  sub_1000123E4(*(void **)(a1 + 32), a2, a3, a4);
}

void sub_1000123E4(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  CDGetInfoRequest *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  uint64_t v20;
  CDSystemAuthenticationGetAuthInfoResponse *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  os_activity_scope_state_s v28;
  uint8_t buf[4];
  CDGetInfoRequest *v30;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v10 = _os_activity_create((void *)&_mh_execute_header, "system auth session/handle get auth info request", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    v28.opaque[0] = 0;
    v28.opaque[1] = 0;
    os_activity_scope_enter(v10, &v28);
    v11 = -[CDGetInfoRequest initWithRapportDictionary:]([CDGetInfoRequest alloc], "initWithRapportDictionary:", v7);
    v12 = cps_session_log(v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received get auth info request: %@", buf, 0xCu);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "request"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "appleAccountAltDSID"));
    v16 = v15 == 0;

    if (v16
      || (v17 = (void *)objc_claimAutoreleasedReturnValue(-[CDGetInfoRequest appleAccountToken](v11, "appleAccountToken")),
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[CDGetInfoRequest nonce](v11, "nonce")),
          v19 = sub_100012C48(a1, v17, v18),
          v18,
          v17,
          (v19 & 1) != 0))
    {
      v21 = objc_alloc_init(CDSystemAuthenticationGetAuthInfoResponse);
      v22 = (void *)GestaltCopyAnswer(CFSTR("DeviceName"), 0, 0);
      -[CDSystemAuthenticationGetAuthInfoResponse setDeviceClass:](v21, "setDeviceClass:", v22);

      v23 = (void *)GestaltCopyAnswer(CFSTR("UserAssignedDeviceName"), 0, 0);
      -[CDSystemAuthenticationGetAuthInfoResponse setDeviceName:](v21, "setDeviceName:", v23);

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[CDSystemAuthenticationGetAuthInfoResponse makeRapportDictionary](v21, "makeRapportDictionary"));
      (*((void (**)(id, void *, _QWORD, _QWORD))v9 + 2))(v9, v24, 0, 0);

    }
    else
    {
      v25 = cps_session_log(v20);
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        sub_10001EC58(v26);

      v27 = NSErrorF(NSOSStatusErrorDomain, 4294960542, "Invalid account token.");
      v21 = (CDSystemAuthenticationGetAuthInfoResponse *)objc_claimAutoreleasedReturnValue(v27);
      (*((void (**)(id, _QWORD, _QWORD, CDSystemAuthenticationGetAuthInfoResponse *))v9 + 2))(v9, 0, 0, v21);
    }

    os_activity_scope_leave(&v28);
  }

}

void sub_100012684(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1000126AC(uint64_t a1, void *a2, void *a3, void *a4)
{
  sub_1000126B4(*(void **)(a1 + 32), a2, a3, a4);
}

void sub_1000126B4(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  CDSystemAuthenticationDidFinishAuthRequest *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  os_activity_scope_state_s v24;
  uint8_t buf[4];
  CDSystemAuthenticationDidFinishAuthRequest *v26;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v10 = _os_activity_create((void *)&_mh_execute_header, "system auth session/handle did finish auth request", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    v24.opaque[0] = 0;
    v24.opaque[1] = 0;
    os_activity_scope_enter(v10, &v24);
    v11 = -[CDSystemAuthenticationDidFinishAuthRequest initWithRapportDictionary:]([CDSystemAuthenticationDidFinishAuthRequest alloc], "initWithRapportDictionary:", v7);
    v12 = cps_session_log(v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received did finish auth request: %@", buf, 0xCu);
    }

    v14 = objc_alloc_init((Class)CPSDevice);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CDSystemAuthenticationDidFinishAuthRequest deviceName](v11, "deviceName"));
    objc_msgSend(v14, "setName:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CDSystemAuthenticationDidFinishAuthRequest deviceModel](v11, "deviceModel"));
    objc_msgSend(v14, "setModel:", v16);

    objc_msgSend(v14, "setFlags:", -[CDSystemAuthenticationDidFinishAuthRequest deviceFlags](v11, "deviceFlags"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "model"));
    v18 = GestaltProductTypeStringToDeviceClass() == 6;

    if (v18)
      objc_msgSend(a1, "_notifyDeviceAcceptedNotification:", v14);
    if (-[CDSystemAuthenticationDidFinishAuthRequest isEnabled](v11, "isEnabled"))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "request"));
      +[CPSMetrics sendSystemSessionCompletedEvent:](CPSMetrics, "sendSystemSessionCompletedEvent:", objc_msgSend(v19, "service"), 1);

      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bs_safeStringForKey:", RPOptionSenderModelID));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bs_safeNumberForKey:", RPOptionStatusFlags));
      v22 = objc_msgSend(v21, "unsignedIntegerValue");
      if (CPSMetrics)
        +[CPSMetrics sendProviderDeviceUsageEvent:](CPSMetrics, "sendProviderDeviceUsageEvent:", v20, v22);
      else

      v23 = objc_alloc_init((Class)CPSSystemAuthenticationResponse);
      objc_msgSend(a1, "_notifySessionFinished:", v23);
    }
    else
    {
      v23 = (id)objc_claimAutoreleasedReturnValue(-[CDSystemAuthenticationDidFinishAuthRequest error](v11, "error"));
      sub_100012B94(a1, v23);
      objc_msgSend(a1, "_notifySessionFailed:", v23);
    }

    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v9 + 2))(v9, 0, 0, 0);
    os_activity_scope_leave(&v24);

  }
}

void sub_100012994(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_100012B94(void *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a2;
  if (a1)
  {
    v8 = v3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
    if (objc_msgSend(v4, "isEqualToString:", CPSErrorDomain))
    {
      v5 = objc_msgSend(v8, "code");

      if (v5 == (id)104)
      {
        v6 = 2;
LABEL_7:
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "request"));
        +[CPSMetrics sendSystemSessionCompletedEvent:](CPSMetrics, "sendSystemSessionCompletedEvent:", objc_msgSend(v7, "service"), v6);

        v3 = v8;
        goto LABEL_8;
      }
    }
    else
    {

    }
    v6 = 3;
    goto LABEL_7;
  }
LABEL_8:

}

id sub_100012C48(id a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  v5 = a3;
  if (a1)
  {
    v6 = a2;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "request"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "appleAccountAltDSID"));
    v9 = (void *)v8;
    v10 = 0;
    if (v5 && v8)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@+%@"), v8, v5));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dataUsingEncoding:", 4));
      if (v12)
      {
        v13 = malloc_type_malloc(0x40uLL, 0xCC7B9F1DuLL);
        v14 = kCryptoHashDescriptor_SHA512;
        v15 = objc_retainAutorelease(v12);
        CryptoHashOneShot(v14, objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"), v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", v13, 64, 1));
      }
      else
      {
        v10 = 0;
      }

    }
    a1 = objc_msgSend(v10, "isEqualToData:", v6);

  }
  return a1;
}

_BYTE *sub_100012EA8(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (!result[9])
    return objc_msgSend(result, "_activated");
  return result;
}

id sub_100012F14(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

void sub_100012FBC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_100012FD8(uint64_t a1, void *a2)
{
  _BYTE *WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained && !WeakRetained[9])
    objc_msgSend(WeakRetained, "_handleEvent:", v5);

}

id sub_100013350(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleGetAuthInfoRequest:options:responseHandler:", a2, a3, a4);
}

void sub_1000135A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_100013778(uint64_t a1, void *a2, void *a3, void *a4)
{
  sub_100013780(*(_QWORD **)(a1 + 32), a2, a3, a4);
}

void sub_100013780(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  NSObject *v8;
  CDGetInfoRequest *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  uint64_t v15;
  CDStorePurchaseGetAuthInfoResponse *v16;
  uint64_t v17;
  id v18;
  id v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  id v44;
  id v45;
  _QWORD v46[5];
  CDStorePurchaseGetAuthInfoResponse *v47;
  id v48;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v51;

  v45 = a2;
  v44 = a3;
  v7 = a4;
  if (a1)
  {
    v8 = _os_activity_create((void *)&_mh_execute_header, "store purchase session/handle get auth info request", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v8, &state);
    v9 = -[CDGetInfoRequest initWithRapportDictionary:]([CDGetInfoRequest alloc], "initWithRapportDictionary:", v45);
    v10 = cps_session_log(v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v51 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received get auth info request: %@", buf, 0xCu);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CDGetInfoRequest storeAccountToken](v9, "storeAccountToken"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CDGetInfoRequest nonce](v9, "nonce"));
    v14 = sub_100014038(a1, v12, v13);

    if ((v14 & 1) != 0)
    {
      v16 = objc_alloc_init(CDStorePurchaseGetAuthInfoResponse);
      v17 = objc_claimAutoreleasedReturnValue(-[CDGetInfoRequest deviceBuildVersion](v9, "deviceBuildVersion"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[BSBuildVersion fromString:](BSBuildVersion, "fromString:", v17));

      v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectForKeyedSubscript:", RPOptionSenderModelID));
      LOBYTE(v17) = objc_msgSend(v18, "hasPrefix:", CFSTR("iPhone"));

      if (((v17 & 1) != 0
         || (v19 = v18,
             v20 = objc_msgSend(v19, "hasPrefix:", CFSTR("iPad")),
             v19,
             v20))
        && (v21 = (uint64_t)objc_msgSend(v43, "majorBuildNumber", v43), v21 <= 20))
      {
        v22 = cps_session_log(v21);
        v23 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "iOS device requires legacy purchase request", buf, 2u);
        }

        v24 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDelegatePurchaseTask bagSubProfile](AMSDelegatePurchaseTask, "bagSubProfile"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDelegatePurchaseTask bagSubProfileVersion](AMSDelegatePurchaseTask, "bagSubProfileVersion"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[AMSBag bagForProfile:profileVersion:](AMSBag, "bagForProfile:profileVersion:", v24, v25));

        v27 = objc_msgSend(objc_alloc((Class)AMSDelegatePurchasePaymentDialogTask), "initWithDelegatePurchaseRequest:bag:andDesignVersion:", a1[14], v26, &off_100032BA8);
        v28 = cps_session_log(v27);
        v29 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Loading legacy purchase request.", buf, 2u);
        }

        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "performTask"));
        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472;
        v46[2] = sub_1000141DC;
        v46[3] = &unk_100030F10;
        v46[4] = a1;
        v48 = v7;
        v47 = v16;
        objc_msgSend(v30, "addFinishBlock:", v46);

      }
      else
      {
        v41 = cps_session_log(-[CDStorePurchaseGetAuthInfoResponse setPurchaseRequest:](v16, "setPurchaseRequest:", a1[14], v43));
        v42 = objc_claimAutoreleasedReturnValue(v41);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v51 = v16;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Sending get auth info response: %@", buf, 0xCu);
        }

        v26 = (void *)objc_claimAutoreleasedReturnValue(-[CDStorePurchaseGetAuthInfoResponse makeRapportDictionary](v16, "makeRapportDictionary"));
        (*((void (**)(id, void *, _QWORD, _QWORD))v7 + 2))(v7, v26, 0, 0);
      }

    }
    else
    {
      v31 = cps_session_log(v15);
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        sub_10001EC98(v32, v33, v34, v35, v36, v37, v38, v39);

      v40 = NSErrorF(NSOSStatusErrorDomain, 4294960542, "Invalid store account token.");
      v16 = (CDStorePurchaseGetAuthInfoResponse *)objc_claimAutoreleasedReturnValue(v40);
      (*((void (**)(id, _QWORD, _QWORD, CDStorePurchaseGetAuthInfoResponse *))v7 + 2))(v7, 0, 0, v16);
    }

    os_activity_scope_leave(&state);
  }

}

void sub_100013C34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_100013C7C(uint64_t a1, void *a2, void *a3, void *a4)
{
  sub_100013C84(*(void **)(a1 + 32), a2, a3, a4);
}

void sub_100013C84(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  CDStorePurchaseDidFinishAuthRequest *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  os_activity_scope_state_s v28;
  uint8_t buf[4];
  CDStorePurchaseDidFinishAuthRequest *v30;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v10 = _os_activity_create((void *)&_mh_execute_header, "store purchase session/handle did finish auth request", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    v28.opaque[0] = 0;
    v28.opaque[1] = 0;
    os_activity_scope_enter(v10, &v28);
    v11 = -[CDStorePurchaseDidFinishAuthRequest initWithRapportDictionary:]([CDStorePurchaseDidFinishAuthRequest alloc], "initWithRapportDictionary:", v7);
    v12 = objc_alloc_init((Class)CPSDevice);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CDStorePurchaseDidFinishAuthRequest deviceName](v11, "deviceName"));
    objc_msgSend(v12, "setName:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CDStorePurchaseDidFinishAuthRequest deviceModel](v11, "deviceModel"));
    objc_msgSend(v12, "setModel:", v14);

    objc_msgSend(v12, "setFlags:", -[CDStorePurchaseDidFinishAuthRequest deviceFlags](v11, "deviceFlags"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "model"));
    v16 = GestaltProductTypeStringToDeviceClass() == 6;

    if (v16)
      v17 = objc_msgSend(a1, "_notifyDeviceAcceptedNotification:", v12);
    v18 = cps_session_log(v17);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v11;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Received did finish auth request: %@", buf, 0xCu);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CDStorePurchaseDidFinishAuthRequest purchaseResult](v11, "purchaseResult"));
    v21 = v20 == 0;

    if (v21)
    {
      v25 = (id)objc_claimAutoreleasedReturnValue(-[CDStorePurchaseDidFinishAuthRequest error](v11, "error"));
      objc_msgSend(a1, "_notifySessionFailed:", v25);
    }
    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bs_safeStringForKey:", RPOptionSenderModelID));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bs_safeNumberForKey:", RPOptionStatusFlags));
      v24 = objc_msgSend(v23, "unsignedIntegerValue");
      if (CPSMetrics)
        +[CPSMetrics sendProviderDeviceUsageEvent:](CPSMetrics, "sendProviderDeviceUsageEvent:", v22, v24);
      else

      v26 = objc_alloc((Class)CPSStorePurchaseResponse);
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[CDStorePurchaseDidFinishAuthRequest purchaseResult](v11, "purchaseResult"));
      v25 = objc_msgSend(v26, "initWithPurchaseResult:", v27);

      objc_msgSend(a1, "_notifySessionFinished:", v25);
    }

    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v9 + 2))(v9, 0, 0, 0);
    objc_msgSend(a1, "_invalidated");

    os_activity_scope_leave(&v28);
  }

}

void sub_100013F68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

_QWORD *sub_100014038(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  v5 = a3;
  if (a1)
  {
    v6 = (void *)a1[15];
    v7 = a2;
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ams_altDSID"));
    v9 = (void *)v8;
    v10 = 0;
    if (v5 && v8)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@+%@"), v8, v5));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dataUsingEncoding:", 4));
      if (v12)
      {
        v13 = malloc_type_malloc(0x40uLL, 0xCC7B9F1DuLL);
        v14 = kCryptoHashDescriptor_SHA512;
        v15 = objc_retainAutorelease(v12);
        CryptoHashOneShot(v14, objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"), v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", v13, 64, 1));
      }
      else
      {
        v10 = 0;
      }

    }
    a1 = objc_msgSend(v10, "isEqualToData:", v7);

  }
  return a1;
}

void sub_1000141DC(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "dispatchQueue"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000142C0;
  v10[3] = &unk_100030EE8;
  v11 = v6;
  v14 = a1[6];
  v12 = v5;
  v13 = a1[5];
  v8 = v5;
  v9 = v6;
  dispatch_async(v7, v10);

}

void sub_1000142C0(uint64_t a1)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;

  v2 = (uint64_t *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = cps_session_log(a1);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_10001ECCC(v2, v6);

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v13 = 138412290;
      v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Got legacy purchase request: %@", (uint8_t *)&v13, 0xCu);
    }

    v8 = cps_session_log(objc_msgSend(*(id *)(a1 + 48), "setPurchaseRequest:", *(_QWORD *)(a1 + 40)));
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 48);
      v13 = 138412290;
      v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Sending get auth info response: %@", (uint8_t *)&v13, 0xCu);
    }

    v11 = *(_QWORD *)(a1 + 56);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "makeRapportDictionary"));
    (*(void (**)(uint64_t, void *, _QWORD, _QWORD))(v11 + 16))(v11, v12, 0, 0);

  }
}

_BYTE *sub_10001457C(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (!result[21])
    return objc_msgSend(result, "_activated");
  return result;
}

id sub_100014618(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

void sub_100014810(id a1, int a2)
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = cps_service_listener_log(a1, *(_QWORD *)&a2);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "System language changed. Exiting.", v4, 2u);
  }

  xpc_transaction_exit_clean();
}

id sub_100014960(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("listener"));
}

id sub_100014B48(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_connectionInvalidated:", *(_QWORD *)(a1 + 40));
}

void sub_100014BB8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_100014EFC(uint64_t a1)
{
  _BYTE *v2;
  uint64_t v3;
  NSErrorDomain v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[33])
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = NSOSStatusErrorDomain;
    v5 = "Session already activated.";
    v6 = 4294960575;
LABEL_5:
    v7 = NSErrorF(v4, v6, v5);
    v8 = (id)objc_claimAutoreleasedReturnValue(v7);
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v8);

    return;
  }
  v3 = *(_QWORD *)(a1 + 40);
  if (v2[34])
  {
    v4 = NSOSStatusErrorDomain;
    v5 = "Session already invalidated.";
    v6 = 4294896148;
    goto LABEL_5;
  }
  sub_100014FA8(v2, *(void **)(a1 + 40));
}

void sub_100014FA8(void *a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100015084;
    v5[3] = &unk_100030F78;
    v5[4] = a1;
    v6 = v3;
    objc_msgSend(a1, "_prepareForActivationWithCompletionHandler:", v5);

  }
}

id sub_10001507C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

void sub_100015084(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "_invalidated");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_sessionActivated");
    objc_msgSend(*(id *)(a1 + 32), "_presentViewService");
    sub_1000150E4(*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
    sub_1000152A0(*(id *)(a1 + 32));
    sub_1000152EC(*(id **)(a1 + 32));
  }
}

void sub_1000150E4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];

  v3 = a2;
  if (a1)
  {
    v4 = objc_msgSend((id)a1, "_requireOwnerDevice");
    v5 = objc_alloc_init((Class)RPCompanionLinkClient);
    v6 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v5;

    objc_msgSend(*(id *)(a1 + 16), "setDispatchQueue:", *(_QWORD *)(a1 + 64));
    objc_msgSend((id)a1, "_configureRapportClient:", *(_QWORD *)(a1 + 16));
    v7 = *(void **)(a1 + 16);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100015490;
    v17[3] = &unk_100030778;
    v17[4] = a1;
    objc_msgSend(v7, "cad_registerRequestID:options:requireOwnerDevice:handler:", CFSTR("com.apple.CompanionAuthentication.GetNotifInfo"), 0, v4, v17);
    v8 = *(void **)(a1 + 16);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100015758;
    v16[3] = &unk_100030FA0;
    v16[4] = a1;
    objc_msgSend(v8, "cad_registerEventID:options:requireOwnerDevice:handler:", CFSTR("com.apple.CompanionAuthentication.DidTapNotif"), 0, v4, v16);
    v9 = *(void **)(a1 + 16);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100015954;
    v15[3] = &unk_100030778;
    v15[4] = a1;
    objc_msgSend(v9, "cad_registerRequestID:options:requireOwnerDevice:handler:", CFSTR("com.apple.CompanionAuthentication.GetAuthType"), 0, v4, v15);
    v10 = *(void **)(a1 + 16);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100015B78;
    v14[3] = &unk_100030FA0;
    v14[4] = a1;
    objc_msgSend(v10, "cad_registerEventID:options:requireOwnerDevice:handler:", CFSTR("com.apple.CompanionAuthentication.DidStartAuth"), 0, v4, v14);
    v11 = *(void **)(a1 + 16);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100015D48;
    v12[3] = &unk_100030F78;
    v12[4] = a1;
    v13 = v3;
    objc_msgSend(v11, "activateWithCompletion:", v12);

  }
}

id sub_1000152A0(id result)
{
  id v1;
  CDIDSService *v2;
  void *v3;

  if (result)
  {
    v1 = result;
    v2 = objc_alloc_init(CDIDSService);
    v3 = (void *)*((_QWORD *)v1 + 5);
    *((_QWORD *)v1 + 5) = v2;

    objc_msgSend(*((id *)v1 + 5), "setDispatchQueue:", *((_QWORD *)v1 + 8));
    return objc_msgSend(*((id *)v1 + 5), "activate");
  }
  return result;
}

void sub_1000152EC(id *a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (a1)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_idsMessageRecipientUsernames"));
    if (objc_msgSend(v2, "count"))
    {
      objc_msgSend(a1[5], "sendMessage:toUsernames:", 0, v2);
    }
    else
    {
      v3 = cps_session_log(0);
      v4 = objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        sub_10001EDAC(v4, v5, v6, v7, v8, v9, v10, v11);

    }
  }
}

void sub_10001541C(id *a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (a1)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_idsMessageRecipientUsernames"));
    if (objc_msgSend(v2, "count"))
    {
      objc_msgSend(a1[5], "sendMessage:toUsernames:", 1, v2);
    }
    else
    {
      v3 = cps_session_log(0);
      v4 = objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        sub_10001EDAC(v4, v5, v6, v7, v8, v9, v10, v11);

    }
  }
}

void sub_100015490(uint64_t a1, void *a2, void *a3, void *a4)
{
  sub_100015498(*(void **)(a1 + 32), a2, a3, a4);
}

void sub_100015498(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  CDGetInfoRequest *v11;
  uint64_t v12;
  NSObject *v13;
  CDGetInfoRequest *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  os_activity_scope_state_s v30;
  uint8_t buf[4];
  CDGetInfoRequest *v32;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v10 = _os_activity_create((void *)&_mh_execute_header, "auth session/handle get notif info request", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    v30.opaque[0] = 0;
    v30.opaque[1] = 0;
    os_activity_scope_enter(v10, &v30);
    v11 = -[CDGetInfoRequest initWithRapportDictionary:]([CDGetInfoRequest alloc], "initWithRapportDictionary:", v7);
    v12 = cps_session_log(v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received get notif info request: %@", buf, 0xCu);
    }

    v14 = (CDGetInfoRequest *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_responseForGetNotifInfoRequest:", v11));
    if (v14)
    {
      v15 = (void *)GestaltCopyAnswer(CFSTR("DeviceName"), 0, 0);
      -[CDGetInfoRequest setDeviceClass:](v14, "setDeviceClass:", v15);

      v16 = (void *)GestaltCopyAnswer(CFSTR("UserAssignedDeviceName"), 0, 0);
      -[CDGetInfoRequest setDeviceName:](v14, "setDeviceName:", v16);

      v18 = cps_session_log(v17);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v14;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Sending get notif info response: %@", buf, 0xCu);
      }

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CDGetInfoRequest makeRapportDictionary](v14, "makeRapportDictionary"));
      (*((void (**)(id, void *, _QWORD, _QWORD))v9 + 2))(v9, v20, 0, 0);
    }
    else
    {
      v21 = NSErrorF(CPSErrorDomain, 4294960582, "Get notif info request not handled.");
      v20 = (void *)objc_claimAutoreleasedReturnValue(v21);
      v22 = cps_session_log(v20);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        sub_10001EDE0((uint64_t)v20, v23, v24, v25, v26, v27, v28, v29);

      (*((void (**)(id, _QWORD, _QWORD, void *))v9 + 2))(v9, 0, 0, v20);
    }

    os_activity_scope_leave(&v30);
  }

}

void sub_100015728(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_100015758(uint64_t a1, void *a2, void *a3)
{
  sub_100015760(*(void **)(a1 + 32), a2, a3);
}

void sub_100015760(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  CDDeviceUpdateEvent *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  BOOL v12;
  id v13;
  void *v14;
  void *v15;
  os_activity_scope_state_s v16;
  uint8_t buf[4];
  CDDeviceUpdateEvent *v18;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = _os_activity_create((void *)&_mh_execute_header, "auth session/handle did tap notif event", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    v16.opaque[0] = 0;
    v16.opaque[1] = 0;
    os_activity_scope_enter(v7, &v16);
    v8 = -[CDDeviceUpdateEvent initWithRapportDictionary:]([CDDeviceUpdateEvent alloc], "initWithRapportDictionary:", v5);
    v9 = cps_session_log(v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Received did tap notif event: %@", buf, 0xCu);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CDDeviceUpdateEvent deviceModel](v8, "deviceModel"));
    v12 = GestaltProductTypeStringToDeviceClass() == 6;

    if (!v12)
      objc_msgSend(a1, "_stopAdvertisingNearbyAction");
    v13 = objc_alloc_init((Class)CPSDevice);
    objc_msgSend(v13, "setFlags:", -[CDDeviceUpdateEvent deviceFlags](v8, "deviceFlags"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CDDeviceUpdateEvent deviceModel](v8, "deviceModel"));
    objc_msgSend(v13, "setModel:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CDDeviceUpdateEvent deviceName](v8, "deviceName"));
    objc_msgSend(v13, "setName:", v15);

    objc_msgSend(a1, "_notifyDeviceAcceptedNotification:", v13);
    os_activity_scope_leave(&v16);

  }
}

void sub_100015930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_100015954(uint64_t a1, void *a2, void *a3, void *a4)
{
  sub_10001595C(*(void **)(a1 + 32), a2, a3, a4);
}

void sub_10001595C(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  CDGetAuthTypeResponse *v14;
  void *v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  os_activity_scope_state_s v20;
  uint8_t buf[4];
  CDGetAuthTypeResponse *v22;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v10 = _os_activity_create((void *)&_mh_execute_header, "auth session/handle get auth info request", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    v20.opaque[0] = 0;
    v20.opaque[1] = 0;
    os_activity_scope_enter(v10, &v20);
    v12 = cps_session_log(v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received get auth info request.", buf, 2u);
    }

    v14 = objc_alloc_init(CDGetAuthTypeResponse);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "request"));
    v16 = objc_msgSend(v15, "authType");

    -[CDGetAuthTypeResponse setAuthType:](v14, "setAuthType:", v16);
    -[CDGetAuthTypeResponse setSandboxPurchase:](v14, "setSandboxPurchase:", objc_msgSend(a1, "_isSandboxPurchase"));
    v17 = cps_session_log(-[CDGetAuthTypeResponse setAuthFlags:](v14, "setAuthFlags:", objc_msgSend(a1, "_authFlags")));
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v14;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Sending get auth type response: %@", buf, 0xCu);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CDGetAuthTypeResponse makeRapportDictionary](v14, "makeRapportDictionary"));
    (*((void (**)(id, void *, _QWORD, _QWORD))v9 + 2))(v9, v19, 0, 0);

    os_activity_scope_leave(&v20);
  }

}

void sub_100015B54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_100015B78(uint64_t a1, void *a2, void *a3)
{
  sub_100015B80(*(void **)(a1 + 32), a2, a3);
}

void sub_100015B80(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  CDDeviceUpdateEvent *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  os_activity_scope_state_s v14;
  uint8_t buf[4];
  CDDeviceUpdateEvent *v16;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = _os_activity_create((void *)&_mh_execute_header, "auth session/handle did start auth event", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    v14.opaque[0] = 0;
    v14.opaque[1] = 0;
    os_activity_scope_enter(v7, &v14);
    v8 = -[CDDeviceUpdateEvent initWithRapportDictionary:]([CDDeviceUpdateEvent alloc], "initWithRapportDictionary:", v5);
    v9 = cps_session_log(v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Received did start auth event: %@", buf, 0xCu);
    }

    v11 = objc_alloc_init((Class)CPSDevice);
    objc_msgSend(v11, "setFlags:", -[CDDeviceUpdateEvent deviceFlags](v8, "deviceFlags"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CDDeviceUpdateEvent deviceModel](v8, "deviceModel"));
    objc_msgSend(v11, "setModel:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CDDeviceUpdateEvent deviceName](v8, "deviceName"));
    objc_msgSend(v11, "setName:", v13);

    objc_msgSend(a1, "_notifyDeviceStartedAuthentication:", v11);
    os_activity_scope_leave(&v14);

  }
}

void sub_100015D24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_100015D48(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "_invalidated");
  }
  else
  {
    sub_100015D88(*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  }
}

void sub_100015D88(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v3 = a2;
  if (a1)
  {
    v4 = objc_alloc_init((Class)SFService);
    v5 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = v4;

    objc_msgSend(*(id *)(a1 + 24), "setDispatchQueue:", *(_QWORD *)(a1 + 64));
    objc_msgSend(*(id *)(a1 + 24), "setDeviceActionType:", objc_msgSend((id)a1, "_deviceActionType"));
    v6 = *(void **)(a1 + 24);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));
    objc_msgSend(v6, "setIdentifier:", v8);

    objc_msgSend(*(id *)(a1 + 24), "setAdvertiseRate:", 50);
    v9 = *(void **)(a1 + 24);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100015E98;
    v10[3] = &unk_100030F78;
    v10[4] = a1;
    v11 = v3;
    objc_msgSend(v9, "activateWithCompletion:", v10);

  }
}

id sub_100015E98(uint64_t a1, uint64_t a2)
{
  uint64_t (*v3)(void);

  v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  if (!a2)
    return (id)v3();
  v3();
  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

uint64_t start(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  CDProviderDaemon *v9;
  dispatch_queue_attr_t v10;
  NSObject *v11;
  dispatch_queue_t v12;
  id v13;
  void *v14;
  uint8_t v16[16];

  v2 = cps_daemon_log(a1, a2);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "The companion daemon is starting.", v16, 2u);
  }

  v4 = objc_autoreleasePoolPush();
  v5 = _set_user_dir_suffix("com.apple.companiond");
  if ((v5 & 1) == 0)
  {
    v7 = cps_daemon_log(v5, v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      sub_10001EEB0(v8);

  }
  +[AMSEphemeralDefaults setPreferEphemeralURLSessions:](AMSEphemeralDefaults, "setPreferEphemeralURLSessions:", 1);
  +[AMSEphemeralDefaults setSuppressEngagement:](AMSEphemeralDefaults, "setSuppressEngagement:", 1);
  v9 = objc_alloc_init(CDProviderDaemon);
  v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = dispatch_queue_create("com.apple.companiond.main", v11);
  -[CDProviderDaemon setDispatchQueue:](v9, "setDispatchQueue:", v12);
  -[CDProviderDaemon activate](v9, "activate");
  v13 = objc_alloc_init((Class)DTDaemonShim);
  objc_msgSend(v13, "activate");

  objc_autoreleasePoolPop(v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
  objc_msgSend(v14, "run");

  return 0;
}

void sub_1000174A4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  v5 = a2;
  v6 = a3;
  objc_opt_self(a1);
  if (v6)
  {
    if (objc_msgSend(v5, "length"))
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100018198;
      v16[3] = &unk_100031018;
      v17 = v6;
      +[SFSafariCredentialStore getApprovedSharedWebCredentialsEntriesSortedByHighestValueForAppWithAppID:completionHandler:](SFSafariCredentialStore, "getApprovedSharedWebCredentialsEntriesSortedByHighestValueForAppWithAppID:completionHandler:", v5, v16);

    }
    else
    {
      v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v7)
        sub_10001F000(v7, v8, v9, v10, v11, v12, v13, v14);
      (*((void (**)(id, void *))v6 + 2))(v6, &__NSArray0__struct);
    }

  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("completionHandler != ((void *)0)")));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10001EF54("_approvedWebCredentialsDomainsForApplicationIdentifier:completionHandler:");
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v15), "UTF8String"));
    __break(0);
  }
}

void sub_100017604(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  dispatch_queue_global_t global_queue;
  NSObject *v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD block[4];
  id v19;
  id v20;

  v5 = a2;
  v6 = a3;
  objc_opt_self(a1);
  if (v6)
  {
    if (objc_msgSend(v5, "length"))
    {
      global_queue = dispatch_get_global_queue(25, 0);
      v8 = objc_claimAutoreleasedReturnValue(global_queue);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000182E0;
      block[3] = &unk_100030D98;
      v19 = v5;
      v20 = v6;
      dispatch_async(v8, block);

    }
    else
    {
      v9 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v9)
        sub_10001F0E4(v9, v10, v11, v12, v13, v14, v15, v16);
      (*((void (**)(id, void *))v6 + 2))(v6, &__NSArray0__struct);
    }

  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("completionHandler != ((void *)0)")));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10001F038("_allWebCredentialsDomainsForApplicationIdentifier:completionHandler:");
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v17), "UTF8String"));
    __break(0);
  }
}

void sub_100017788(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;

  v9 = a4;
  v10 = a5;
  v11 = a3;
  v12 = a2;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000184D0;
  v15[3] = &unk_100031090;
  v17 = v10;
  v18 = objc_opt_self(a1);
  v16 = v9;
  v13 = v10;
  v14 = v9;
  sub_100018728(v18, v12, v11, v15);

}

void sub_1000179AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000179C4(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  uint64_t v6;
  id v7;
  unsigned int v8;

  v6 = CPSCustomAuthenticationMethodOther;
  v7 = a2;
  if (objc_msgSend(v7, "isEqualToString:", v6))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) |= 4u;
  if (objc_msgSend(v7, "isEqualToString:", CPSCustomAuthenticationMethodRestorePurchase))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) |= 8u;
  v8 = objc_msgSend(v7, "isEqualToString:", CPSCustomAuthenticationMethodVideoSubscriberAccount);

  if (v8)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) |= 0x10u;
  *a4 = (~*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) & 0x1C) == 0;
}

id sub_100017D78(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a3;
  v6 = a2;
  objc_opt_self(a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "relyingPartyIdentifier"));

  objc_msgSend(v7, "bs_safeAddObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "relyingPartyIdentifier"));

  objc_msgSend(v7, "bs_safeAddObject:", v9);
  if (objc_msgSend(v7, "count") == (id)1)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "anyObject"));
    if (objc_msgSend(v10, "length"))
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void sub_100018198(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001829C;
  v9[3] = &unk_100030FF0;
  v8 = objc_alloc_init((Class)NSMutableOrderedSet);
  v10 = v8;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v9);

  if (IsAppleInternalBuild())
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringArrayForKey:", CFSTR("ExtraAssociatedDomains")));
    objc_msgSend(v8, "addObjectsFromArray:", v5);

  }
  v6 = *(_QWORD *)(a1 + 32);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "array"));
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

}

void sub_10001829C(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "domain"));
  objc_msgSend(v2, "addObject:", v3);

}

void sub_1000182E0(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id v15;

  v2 = objc_msgSend(objc_alloc((Class)_SWCServiceSpecifier), "initWithServiceType:applicationIdentifier:domain:", 0, *(_QWORD *)(a1 + 32), 0);
  v15 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_SWCServiceDetails serviceDetailsWithServiceSpecifier:error:](_SWCServiceDetails, "serviceDetailsWithServiceSpecifier:error:", v2, &v15));
  v4 = v15;
  if (v3)
  {
    v10 = _NSConcreteStackBlock;
    v11 = 3221225472;
    v12 = sub_100018478;
    v13 = &unk_100031040;
    v5 = objc_alloc_init((Class)NSMutableOrderedSet);
    v14 = v5;
    if (IsAppleInternalBuild(objc_msgSend(v3, "enumerateObjectsUsingBlock:", &v10)))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults", v10, v11, v12, v13));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringArrayForKey:", CFSTR("ExtraAssociatedDomains")));
      objc_msgSend(v5, "addObjectsFromArray:", v7);

    }
    v8 = *(_QWORD *)(a1 + 40);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "array", v10, v11, v12, v13));
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10001F1C8((uint64_t)v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void sub_100018478(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "serviceSpecifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void sub_1000184D0(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
  v5 = objc_msgSend(v4, "isEqualToString:", AKAppleIDAuthenticationErrorDomain);

  if (v5)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000185AC;
    v8[3] = &unk_100031068;
    v6 = *(void **)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 48);
    v10 = *(id *)(a1 + 40);
    v9 = v3;
    sub_1000185BC(v7, v9, v6, v8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t sub_1000185AC(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_1000185BC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v7 = a2;
  v8 = a4;
  v9 = a3;
  objc_opt_self(a1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));
  v11 = objc_msgSend(v10, "mutableCopy");
  v12 = v11;
  if (v11)
    v13 = v11;
  else
    v13 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v14 = v13;

  objc_msgSend(v14, "setObject:forKeyedSubscript:", v9, AKClientBundleIDKey);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "domain"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v15, objc_msgSend(v7, "code"), v14));

  v17 = objc_alloc_init((Class)AKAlertHandler);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000188C8;
  v19[3] = &unk_1000310E0;
  v20 = v8;
  v18 = v8;
  objc_msgSend(v17, "showAlertForError:withCompletion:", v16, v19);

}

void sub_100018728(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v7 = a3;
  v8 = a4;
  v9 = a2;
  objc_opt_self(a1);
  v18 = 0;
  LOBYTE(a1) = +[AKAuthorizationValidator canPerformCredentialRequest:error:](AKAuthorizationValidator, "canPerformCredentialRequest:error:", v9, &v18);

  v10 = v18;
  if ((a1 & 1) != 0)
  {
    if (v7
      && (v11 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance")),
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "continuationTokenForAccount:", v7)),
          v12,
          v11,
          !v12))
    {
      v13 = objc_alloc_init((Class)AKAppleIDAuthenticationContext);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "username"));
      objc_msgSend(v13, "setUsername:", v14);

      objc_msgSend(v13, "setIsUsernameEditable:", 0);
      v15 = objc_alloc_init((Class)AKAppleIDAuthenticationController);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1000188B8;
      v16[3] = &unk_1000310B8;
      v17 = v8;
      objc_msgSend(v15, "authenticateWithContext:completion:", v13, v16);

    }
    else
    {
      (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
    }
  }
  else
  {
    (*((void (**)(id, id))v8 + 2))(v8, v10);
  }

}

uint64_t sub_1000188B8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1000188C8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1000188FC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x3Au);
}

uint64_t sub_10001891C()
{
  uint64_t v0;

  return objc_opt_class(v0);
}

_BYTE *sub_100018A14(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (!result[9])
    return objc_msgSend(result, "_activated");
  return result;
}

id sub_100018A80(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

id sub_100018B28()
{
  if (qword_10003B7B0 != -1)
    dispatch_once(&qword_10003B7B0, &stru_100031128);
  return (id)qword_10003B7A8;
}

void sub_100018C8C(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  const __CFString *v33;
  void *v34;
  _QWORD v35[2];
  _QWORD v36[2];
  _BYTE v37[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v37, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v24;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(v3);
        v8 = (void *)IDSCopyBestGuessIDForID(*(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v7));
        if (v8)
          objc_msgSend(v2, "addObject:", v8);

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v37, 16);
    }
    while (v5);
  }

  v35[0] = IDSSessionAlwaysSkipSelfKey;
  v35[1] = IDSSendMessageOptionFireAndForgetKey;
  v36[0] = &__kCFBooleanTrue;
  v36[1] = &__kCFBooleanTrue;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v36, v35, 2));
  v33 = CFSTR("type");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", *(_QWORD *)(a1 + 48)));
  v34 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1));

  v12 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
  v21 = 0;
  v22 = 0;
  v13 = objc_msgSend(v12, "sendMessage:toDestinations:priority:options:identifier:error:", v11, v2, 300, v9, &v22, &v21);
  v14 = v22;
  v15 = v21;
  v16 = sub_100018B28();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  v18 = v17;
  if ((v13 & 1) != 0)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v19 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v28 = v19;
      v29 = 2112;
      v30 = v2;
      v31 = 2112;
      v32 = v14;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Sent IDS message. {users = %@, destinations = %@, identifier=%@}", buf, 0x20u);
    }
  }
  else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v20 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    v28 = v20;
    v29 = 2112;
    v30 = v2;
    v31 = 2112;
    v32 = v15;
    _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Error sending IDS message. {usernames = %@, destinations = %@, error = %@}", buf, 0x20u);
  }

}

void sub_100019268(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.CompanionServices", "CDIDSService");
  v2 = (void *)qword_10003B7A8;
  qword_10003B7A8 = (uint64_t)v1;

}

id sub_100019F54(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v23;

  v5 = a1;
  v6 = a2;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", a3));
  v8 = v5;
  v9 = v6;
  TypeID = CFDataGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v8, v9, TypeID, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);

  if (v12)
  {
    v23 = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v7, v12, &v23));
    v14 = v23;
    if (v14 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10001F244((uint64_t)v14, v15, v16, v17, v18, v19, v20, v21);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

id sub_10001A22C(uint64_t a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v11;

  if (a1)
  {
    v11 = 0;
    v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", a1, 1, &v11));
    v2 = v11;
    if (v2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10001F2B4((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

  }
  else
  {
    v1 = 0;
  }
  return v1;
}

_BYTE *sub_10001D590(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (!result[49])
    return objc_msgSend(result, "_activated");
  return result;
}

id sub_10001D5FC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

void sub_10001D88C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 32);
  *(_QWORD *)(v1 + 32) = 0;

}

id sub_10001D928(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_foundDeviceWithIdentifier:discoveryType:", a2, a3);
}

_QWORD *sub_10001D9C4(_QWORD *result, uint64_t a2)
{
  uint64_t v2;

  if (a2 == 1)
    return objc_msgSend(*(id *)(result[4] + 32), "invalidate");
  if (!a2)
  {
    v2 = result[4];
    if (!*(_QWORD *)(v2 + 32))
      return objc_msgSend(*(id *)(v2 + 24), "startDiscovery");
  }
  return result;
}

id sub_10001DB24(uint64_t a1)
{
  id v2;
  id v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("serviceListener"));
  v3 = objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("deviceDiscovery"));
  return objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), CFSTR("currentSession"));
}

id sub_10001DEC0(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "authenticationSessionDidFinishWithResponse:", a2);
}

id sub_10001DECC(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "authenticationSessionDidFailWithError:", a2);
}

void sub_10001DED8(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

}

void sub_10001E0B0(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Device account is not in list of approvers.", v1, 2u);
}

void sub_10001E0F0(id *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  objc_msgSend(*a1, "authType");
  sub_10000DDC8();
  sub_10000DDB4((void *)&_mh_execute_header, a2, v3, "Unknown local auth type: %ld", v4);
}

void sub_10001E170()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000DDFC();
  sub_10000DDE4((void *)&_mh_execute_header, v0, v1, "No eligible iCloud account found.", v2, v3, v4, v5, v6);
  sub_10000DDF4();
}

void sub_10001E19C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000DDC8();
  sub_10000DDA4((void *)&_mh_execute_header, v0, v1, "Authentication session failed: %@", v2, v3, v4, v5, v6);
  sub_10000DDC0();
}

void sub_10001E1FC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000DDC8();
  sub_10000DDA4((void *)&_mh_execute_header, v0, v1, "Failed to start rapport client : %@", v2, v3, v4, v5, v6);
  sub_10000DDC0();
}

void sub_10001E25C(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(_QWORD *)(a1 + 4) = a2;
  sub_10000DDB4((void *)&_mh_execute_header, a3, (uint64_t)a3, "Received unknown auth type: %ld", (uint8_t *)a1);
}

void sub_10001E298()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000DDC8();
  sub_10000DDA4((void *)&_mh_execute_header, v0, v1, "Get auth type request failed: %@", v2, v3, v4, v5, v6);
  sub_10000DDC0();
}

void sub_10001E2F8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000DDFC();
  sub_10000DDE4((void *)&_mh_execute_header, v0, v1, "No eligible store account found.", v2, v3, v4, v5, v6);
  sub_10000DDF4();
}

void sub_10001E324()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000DDC8();
  sub_10000DDA4((void *)&_mh_execute_header, v0, v1, "Failed to send did tap notif event: %@", v2, v3, v4, v5, v6);
  sub_10000DDC0();
}

void sub_10001E384()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000DDC8();
  sub_10000DDA4((void *)&_mh_execute_header, v0, v1, "Received did finish auth response with error: %{public}@", v2, v3, v4, v5, v6);
  sub_10000DDC0();
}

void sub_10001E3E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000DDC8();
  sub_10000DDA4((void *)&_mh_execute_header, v0, v1, "Failed to start device discovery: %@", v2, v3, v4, v5, v6);
  sub_10000DDC0();
}

void sub_10001E444()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000DDC8();
  sub_10000DDA4((void *)&_mh_execute_header, v0, v1, "Get notif info request failed: %@", v2, v3, v4, v5, v6);
  sub_10000DDC0();
}

void sub_10001E4A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000DDC8();
  sub_10000DDA4((void *)&_mh_execute_header, v0, v1, "Get auth info request failed: %@", v2, v3, v4, v5, v6);
  sub_10000DDC0();
}

void sub_10001E504()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000DDC8();
  sub_10000DDA4((void *)&_mh_execute_header, v0, v1, "Purchase request failed: %@", v2, v3, v4, v5, v6);
  sub_10000DDC0();
}

void sub_10001E564()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000DDFC();
  sub_10000DDE4((void *)&_mh_execute_header, v0, v1, "Prox card transaction rejected.", v2, v3, v4, v5, v6);
  sub_10000DDF4();
}

void sub_10001E590()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000DDC8();
  sub_10000DDD4((void *)&_mh_execute_header, v0, v1, "Failed to activate view service: %@", v2, v3, v4, v5, v6);
  sub_10000DDC0();
}

void sub_10001E5F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000DDC8();
  sub_10000DDA4((void *)&_mh_execute_header, v0, v1, "Credential request failed: %@", v2, v3, v4, v5, v6);
  sub_10000DDC0();
}

void sub_10001E650(const char *a1, uint64_t a2, uint64_t a3)
{
  NSString *v5;
  void *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uint64_t v21;

  v5 = NSStringFromSelector(a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (objc_class *)objc_opt_class(a2);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = 138544642;
  v11 = v6;
  v12 = 2114;
  v13 = v9;
  v14 = 2048;
  v15 = a2;
  v16 = 2114;
  v17 = CFSTR("CDProviderSession.m");
  v18 = 1024;
  v19 = 1520;
  v20 = 2114;
  v21 = a3;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v10, 0x3Au);

}

void sub_10001E750()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000DDC8();
  sub_10000DDD4((void *)&_mh_execute_header, v0, v1, "Unexpected credential type: %@", v2, v3, v4, v5, v6);
  sub_10000DDC0();
}

void sub_10001E7B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000DDC8();
  sub_10000DDA4((void *)&_mh_execute_header, v0, v1, "Web authentication failed: %@", v2, v3, v4, v5, v6);
  sub_10000DDC0();
}

void sub_10001E810(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000DDA4((void *)&_mh_execute_header, a1, a3, "Failed to open Learn More URL: %@", a5, a6, a7, a8, 2u);
  sub_10000DDC0();
}

void sub_10001E878(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000DDE4((void *)&_mh_execute_header, a1, a3, "Invalid store account token.", a5, a6, a7, a8, 0);
  sub_10000DDF4();
}

void sub_10001E8A8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000DDE4((void *)&_mh_execute_header, a1, a3, "No ams altDSID.", a5, a6, a7, a8, 0);
  sub_10000DDF4();
}

void sub_10001E8D8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000DDA4((void *)&_mh_execute_header, a2, a3, "Failed to start authentication session: %@", a5, a6, a7, a8, 2u);
  sub_10000DDC0();
}

void sub_10001E93C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000DDE4((void *)&_mh_execute_header, a1, a3, "performAMSDelegatePurchaseWithRequest is only supported on internal builds.", a5, a6, a7, a8, 0);
}

void sub_10001E970(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000DDE4((void *)&_mh_execute_header, a1, a3, "Missing AMS delegate purchase entitlement.", a5, a6, a7, a8, 0);
}

void sub_10001E9A4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000DDA4((void *)&_mh_execute_header, a2, a3, "Failed to get remote object proxy. error=%@", a5, a6, a7, a8, 2u);
  sub_10000DDC0();
}

void sub_10001EA08(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000DDA4((void *)&_mh_execute_header, a2, a3, "Failed to encode presentation context: %@", a5, a6, a7, a8, 2u);
  sub_10000DDC0();
}

void sub_10001EA6C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000DDA4((void *)&_mh_execute_header, a2, a3, "remoteViewService proxy error: %@", a5, a6, a7, a8, 2u);
  sub_10000DDC0();
}

void sub_10001EAD0(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "View service invalidated: %@, error: %@", (uint8_t *)&v3, 0x16u);
  sub_10000DDC0();
}

void sub_10001EB50(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000DDA4((void *)&_mh_execute_header, a2, a3, "Failed to start discovery: %@", a5, a6, a7, a8, 2u);
}

void sub_10001EBB8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000DDA4((void *)&_mh_execute_header, a2, a3, "Device found with nil IDS identifier: %@", a5, a6, a7, a8, 2u);
}

void sub_10001EC20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000DDE4((void *)&_mh_execute_header, &_os_log_default, a3, "Rejecting message from non-owner device", a5, a6, a7, a8, 0);
}

void sub_10001EC58(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid account token.", v1, 2u);
}

void sub_10001EC98(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000DDE4((void *)&_mh_execute_header, a1, a3, "Invalid store account token.", a5, a6, a7, a8, 0);
}

void sub_10001ECCC(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to load legacy purchase request: %@", (uint8_t *)&v3, 0xCu);
}

void sub_10001ED44(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100014BB8((void *)&_mh_execute_header, a1, a3, "activate called", a5, a6, a7, a8, 0);
}

void sub_10001ED78(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100014BB8((void *)&_mh_execute_header, a1, a3, "invalidate called", a5, a6, a7, a8, 0);
}

void sub_10001EDAC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000DDE4((void *)&_mh_execute_header, a1, a3, "IDS recipient usernames is nil or empty. Will not send message.", a5, a6, a7, a8, 0);
}

void sub_10001EDE0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000DDA4((void *)&_mh_execute_header, a2, a3, "Rejecting get notif info request: %@", a5, a6, a7, a8, 2u);
}

void sub_10001EE48(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000DDA4((void *)&_mh_execute_header, a2, a3, "Authentication session failed: %@", a5, a6, a7, a8, 2u);
}

void sub_10001EEB0(NSObject *a1)
{
  int v2;
  int *v3;
  char *v4;
  _DWORD v5[2];
  __int16 v6;
  char *v7;

  v2 = *__error();
  v3 = __error();
  v4 = strerror(*v3);
  v5[0] = 67109378;
  v5[1] = v2;
  v6 = 2080;
  v7 = v4;
  _os_log_fault_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_FAULT, "_set_user_dir_suffix failed. Error code: %d, Error: %s", (uint8_t *)v5, 0x12u);
}

void sub_10001EF54(const char *a1)
{
  void *v1;
  NSString *v2;
  objc_class *v3;
  NSString *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue(v2);
  v3 = (objc_class *)sub_10001891C();
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_1000188D4();
  sub_100018928();
  sub_100018938();
  sub_1000188FC((void *)&_mh_execute_header, &_os_log_default, v6, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v7, v8, v9, v10, v11);

  sub_10001890C();
}

void sub_10001F000(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000DDE4((void *)&_mh_execute_header, &_os_log_default, a3, "Failed to fetch approved web credentials domains: missing application identifier", a5, a6, a7, a8, 0);
}

void sub_10001F038(const char *a1)
{
  void *v1;
  NSString *v2;
  objc_class *v3;
  NSString *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue(v2);
  v3 = (objc_class *)sub_10001891C();
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_1000188D4();
  sub_100018928();
  sub_100018938();
  sub_1000188FC((void *)&_mh_execute_header, &_os_log_default, v6, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v7, v8, v9, v10, v11);

  sub_10001890C();
}

void sub_10001F0E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000DDE4((void *)&_mh_execute_header, &_os_log_default, a3, "Failed to fetch web credentials domains: missing application identifier", a5, a6, a7, a8, 0);
}

void sub_10001F11C(const char *a1)
{
  void *v1;
  NSString *v2;
  objc_class *v3;
  NSString *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue(v2);
  v3 = (objc_class *)sub_10001891C();
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_1000188D4();
  sub_100018928();
  sub_100018938();
  sub_1000188FC((void *)&_mh_execute_header, &_os_log_default, v6, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v7, v8, v9, v10, v11);

  sub_10001890C();
}

void sub_10001F1C8(uint64_t a1)
{
  int v1;
  uint64_t v2;

  v1 = 138412290;
  v2 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to fetch associated domains: %@", (uint8_t *)&v1, 0xCu);
}

void sub_10001F244(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000DDA4((void *)&_mh_execute_header, &_os_log_default, a3, "Failed to unarchive: %@", a5, a6, a7, a8, 2u);
}

void sub_10001F2B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000DDA4((void *)&_mh_execute_header, &_os_log_default, a3, "Failed to archive: %@", a5, a6, a7, a8, 2u);
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URL");
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

id objc_msgSend__authFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_authFlags");
}

id objc_msgSend__authenticationSessionWithClient_request_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_authenticationSessionWithClient:request:");
}

id objc_msgSend__configureRapportClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_configureRapportClient:");
}

id objc_msgSend__deviceActionType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_deviceActionType");
}

id objc_msgSend__endpoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_endpoint");
}

id objc_msgSend__handleEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleEvent:");
}

id objc_msgSend__idsMessageRecipientUsernames(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_idsMessageRecipientUsernames");
}

id objc_msgSend__invalidated(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_invalidated");
}

id objc_msgSend__isSandboxPurchase(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isSandboxPurchase");
}

id objc_msgSend__languageNotificationEnsureStarted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_languageNotificationEnsureStarted");
}

id objc_msgSend__languageNotificationEnsureStopped(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_languageNotificationEnsureStopped");
}

id objc_msgSend__notifyDeviceAcceptedNotification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_notifyDeviceAcceptedNotification:");
}

id objc_msgSend__notifyDeviceStartedAuthentication_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_notifyDeviceStartedAuthentication:");
}

id objc_msgSend__notifySessionFailed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_notifySessionFailed:");
}

id objc_msgSend__notifySessionFinished_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_notifySessionFinished:");
}

id objc_msgSend__photosContent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_photosContent");
}

id objc_msgSend__prepareForActivationWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_prepareForActivationWithCompletionHandler:");
}

id objc_msgSend__presentViewService(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentViewService");
}

id objc_msgSend__recognizeMyVoiceContent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_recognizeMyVoiceContent");
}

id objc_msgSend__requireOwnerDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_requireOwnerDevice");
}

id objc_msgSend__responseForGetNotifInfoRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_responseForGetNotifInfoRequest:");
}

id objc_msgSend__sessionActivated(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sessionActivated");
}

id objc_msgSend__setQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setQueue:");
}

id objc_msgSend__sharedWithYouContent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sharedWithYouContent");
}

id objc_msgSend__startDeviceDiscovery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startDeviceDiscovery");
}

id objc_msgSend__startDiscoveryTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startDiscoveryTimer");
}

id objc_msgSend__startRapportListener(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startRapportListener");
}

id objc_msgSend__startServiceListener(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startServiceListener");
}

id objc_msgSend__stopAdvertisingNearbyAction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stopAdvertisingNearbyAction");
}

id objc_msgSend_aa_altDSID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "aa_altDSID");
}

id objc_msgSend_aa_appleAccountWithAltDSID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "aa_appleAccountWithAltDSID:");
}

id objc_msgSend_aa_primaryAppleAccount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "aa_primaryAppleAccount");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "account");
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activate");
}

id objc_msgSend_activateWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateWithCompletion:");
}

id objc_msgSend_activateWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateWithCompletionHandler:");
}

id objc_msgSend_activateWithContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateWithContext:");
}

id objc_msgSend_addBodyArgument_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addBodyArgument:");
}

id objc_msgSend_addDelegate_queue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addDelegate:queue:");
}

id objc_msgSend_addFinishBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addFinishBlock:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addTitleArgument_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addTitleArgument:");
}

id objc_msgSend_ams_activeiCloudAccount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ams_activeiCloudAccount");
}

id objc_msgSend_ams_activeiTunesAccount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ams_activeiTunesAccount");
}

id objc_msgSend_ams_altDSID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ams_altDSID");
}

id objc_msgSend_ams_isLocalAccount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ams_isLocalAccount");
}

id objc_msgSend_ams_sharedAccountStoreForMediaType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ams_sharedAccountStoreForMediaType:");
}

id objc_msgSend_anonymousListener(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "anonymousListener");
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "anyObject");
}

id objc_msgSend_appBundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appBundleIdentifier");
}

id objc_msgSend_appDomains(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appDomains");
}

id objc_msgSend_appIconData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appIconData");
}

id objc_msgSend_appIconScale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appIconScale");
}

id objc_msgSend_appIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appIdentifier");
}

id objc_msgSend_appName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appName");
}

id objc_msgSend_appSignInContent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appSignInContent");
}

id objc_msgSend_appTeamIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appTeamIdentifier");
}

id objc_msgSend_appendBodySectionWithName_multilinePrefix_block_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendBodySectionWithName:multilinePrefix:block:");
}

id objc_msgSend_appendBool_withName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendBool:withName:");
}

id objc_msgSend_appendBool_withName_ifEqualTo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendBool:withName:ifEqualTo:");
}

id objc_msgSend_appendInteger_withName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendInteger:withName:");
}

id objc_msgSend_appendObject_withName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendObject:withName:");
}

id objc_msgSend_appendObject_withName_skipIfNil_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendObject:withName:skipIfNil:");
}

id objc_msgSend_appendString_withName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendString:withName:");
}

id objc_msgSend_appendString_withName_skipIfEmpty_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendString:withName:skipIfEmpty:");
}

id objc_msgSend_appleAccountAltDSID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appleAccountAltDSID");
}

id objc_msgSend_appleAccountToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appleAccountToken");
}

id objc_msgSend_appleIDRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appleIDRequest");
}

id objc_msgSend_approversAppleAccountAltDSIDs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "approversAppleAccountAltDSIDs");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_authFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authFlags");
}

id objc_msgSend_authType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authType");
}

id objc_msgSend_authenticateWithContext_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authenticateWithContext:completion:");
}

id objc_msgSend_authenticationRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authenticationRequest");
}

id objc_msgSend_authenticationResult(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authenticationResult");
}

id objc_msgSend_authenticationSessionDeviceStartedAuthentication_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authenticationSessionDeviceStartedAuthentication:");
}

id objc_msgSend_authenticationSessionDeviceTappedNotification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authenticationSessionDeviceTappedNotification:");
}

id objc_msgSend_authenticationSessionDidFailWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authenticationSessionDidFailWithError:");
}

id objc_msgSend_authenticationSessionDidFinishWithResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authenticationSessionDidFinishWithResponse:");
}

id objc_msgSend_authorization(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authorization");
}

id objc_msgSend_bagForProfile_profileVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bagForProfile:profileVersion:");
}

id objc_msgSend_bagSubProfile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bagSubProfile");
}

id objc_msgSend_bagSubProfileVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bagSubProfileVersion");
}

id objc_msgSend_bodyArguments(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bodyArguments");
}

id objc_msgSend_bodyKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bodyKey");
}

id objc_msgSend_bs_safeAddObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bs_safeAddObject:");
}

id objc_msgSend_bs_safeNumberForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bs_safeNumberForKey:");
}

id objc_msgSend_bs_safeStringForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bs_safeStringForKey:");
}

id objc_msgSend_build(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "build");
}

id objc_msgSend_buildVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buildVersion");
}

id objc_msgSend_builderWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "builderWithObject:");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_cad_matchesDeviceIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cad_matchesDeviceIdentifier:");
}

id objc_msgSend_cad_registerEventID_options_requireOwnerDevice_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cad_registerEventID:options:requireOwnerDevice:handler:");
}

id objc_msgSend_cad_registerRequestID_options_requireOwnerDevice_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cad_registerRequestID:options:requireOwnerDevice:handler:");
}

id objc_msgSend_cad_sessionWithContent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cad_sessionWithContent:");
}

id objc_msgSend_canPerformCredentialRequest_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canPerformCredentialRequest:error:");
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancel");
}

id objc_msgSend_categoryIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "categoryIdentifier");
}

id objc_msgSend_clientInterface(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientInterface");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_continuationTokenForAccount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "continuationTokenForAccount:");
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

id objc_msgSend_credentialRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "credentialRequest");
}

id objc_msgSend_credentialRequestFromClientAuthenticationContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "credentialRequestFromClientAuthenticationContext:");
}

id objc_msgSend_currentClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentClient");
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentConnection");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentDevice");
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRunLoop");
}

id objc_msgSend_currentUserName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentUserName");
}

id objc_msgSend_customAuthenticationMethods(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "customAuthenticationMethods");
}

id objc_msgSend_daemonInterface(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "daemonInterface");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytesNoCopy:length:freeWhenDone:");
}

id objc_msgSend_dedicatedCameraContentForDeviceType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dedicatedCameraContentForDeviceType:");
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultStore");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_descriptionBuilderWithMultilinePrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "descriptionBuilderWithMultilinePrefix:");
}

id objc_msgSend_descriptionWithMultilinePrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "descriptionWithMultilinePrefix:");
}

id objc_msgSend_deviceActionType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceActionType");
}

id objc_msgSend_deviceBuildVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceBuildVersion");
}

id objc_msgSend_deviceFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceFlags");
}

id objc_msgSend_deviceModel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceModel");
}

id objc_msgSend_deviceName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceName");
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceType");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dispatchQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dispatchQueue");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_endpoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endpoint");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "error");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_establishConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "establishConnection");
}

id objc_msgSend_flags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flags");
}

id objc_msgSend_fromString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fromString:");
}

id objc_msgSend_getApprovedSharedWebCredentialsEntriesSortedByHighestValueForAppWithAppID_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getApprovedSharedWebCredentialsEntriesSortedByHighestValueForAppWithAppID:completionHandler:");
}

id objc_msgSend_getConnectionStatusToDeviceWithIdentifier_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getConnectionStatusToDeviceWithIdentifier:completion:");
}

id objc_msgSend_hasAMSDelegatePurchaseEntitlement(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasAMSDelegatePurchaseEntitlement");
}

id objc_msgSend_hasAppSignInOverrideBundleIdentifierEntitlement(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasAppSignInOverrideBundleIdentifierEntitlement");
}

id objc_msgSend_hasDaemonStatusEntitlement(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasDaemonStatusEntitlement");
}

id objc_msgSend_hasDedicatedCameraEntitlement(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasDedicatedCameraEntitlement");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasRestrictedAccessEntitlement(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasRestrictedAccessEntitlement");
}

id objc_msgSend_hasStoreAuthenticationEntitlement(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasStoreAuthenticationEntitlement");
}

id objc_msgSend_hasStorePurchaseEntitlement(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasStorePurchaseEntitlement");
}

id objc_msgSend_hasSystemAuthenticationEntitlement(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasSystemAuthenticationEntitlement");
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "host");
}

id objc_msgSend_iconName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iconName");
}

id objc_msgSend_iconSystemName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iconSystemName");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_idsDeviceIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "idsDeviceIdentifier");
}

id objc_msgSend_idsIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "idsIdentifier");
}

id objc_msgSend_initWithAuditToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAuditToken:");
}

id objc_msgSend_initWithAuthenticationResult_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAuthenticationResult:");
}

id objc_msgSend_initWithClient_request_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithClient:request:");
}

id objc_msgSend_initWithConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithConnection:");
}

id objc_msgSend_initWithDelegatePurchaseRequest_bag_account_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDelegatePurchaseRequest:bag:account:");
}

id objc_msgSend_initWithDelegatePurchaseRequest_bag_andDesignVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDelegatePurchaseRequest:bag:andDesignVersion:");
}

id objc_msgSend_initWithDeviceIdentifier_discoveryType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDeviceIdentifier:discoveryType:");
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIdentifier:");
}

id objc_msgSend_initWithLocalAuthenticationRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLocalAuthenticationRequest:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithPurchaseResult_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPurchaseResult:");
}

id objc_msgSend_initWithRapportDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRapportDictionary:");
}

id objc_msgSend_initWithRequestTypes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRequestTypes:");
}

id objc_msgSend_initWithService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithService:");
}

id objc_msgSend_initWithServiceName_viewControllerClassName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithServiceName:viewControllerClassName:");
}

id objc_msgSend_initWithServiceType_applicationIdentifier_domain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithServiceType:applicationIdentifier:domain:");
}

id objc_msgSend_initWithUser_password_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUser:password:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isApproved(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isApproved");
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEnabled");
}

id objc_msgSend_isEqualToData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToData:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isSandboxPurchase(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSandboxPurchase");
}

id objc_msgSend_learnMoreContent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "learnMoreContent");
}

id objc_msgSend_legacyAppSignInContent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "legacyAppSignInContent");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_majorBuildNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "majorBuildNumber");
}

id objc_msgSend_makeRapportDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeRapportDictionary");
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "model");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_newHandleWithDefinition_configurationContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newHandleWithDefinition:configurationContext:");
}

id objc_msgSend_nonce(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nonce");
}

id objc_msgSend_notificationContentForSystemService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notificationContentForSystemService:");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "null");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_openURL_withOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openURL:withOptions:");
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "options");
}

id objc_msgSend_overrideBundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "overrideBundleIdentifier");
}

id objc_msgSend_password(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "password");
}

id objc_msgSend_passwordRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passwordRequest");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_performAuthorizationRequestsForContext_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performAuthorizationRequestsForContext:withCompletionHandler:");
}

id objc_msgSend_performAuthorizationWithContext_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performAuthorizationWithContext:completion:");
}

id objc_msgSend_performDelegatePurchase(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performDelegatePurchase");
}

id objc_msgSend_performTask(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performTask");
}

id objc_msgSend_platformKeyCredentialAssertionOptions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "platformKeyCredentialAssertionOptions");
}

id objc_msgSend_platformKeyCredentialRegistrationOptions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "platformKeyCredentialRegistrationOptions");
}

id objc_msgSend_presenterInterface(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presenterInterface");
}

id objc_msgSend_presentingInterface(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentingInterface");
}

id objc_msgSend_providerName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "providerName");
}

id objc_msgSend_providerURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "providerURL");
}

id objc_msgSend_purchaseRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "purchaseRequest");
}

id objc_msgSend_purchaseResult(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "purchaseResult");
}

id objc_msgSend_rapportIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rapportIdentifier");
}

id objc_msgSend_registerEventID_options_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerEventID:options:handler:");
}

id objc_msgSend_registerObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerObserver:");
}

id objc_msgSend_registerPasskeyContent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerPasskeyContent");
}

id objc_msgSend_registerRequestID_options_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerRequestID:options:handler:");
}

id objc_msgSend_relyingPartyIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "relyingPartyIdentifier");
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteObjectProxy");
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "request");
}

id objc_msgSend_requestData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestData");
}

id objc_msgSend_restrictedAccessContentForRestrictionType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restrictedAccessContentForRestrictionType:");
}

id objc_msgSend_restrictionType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restrictionType");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}

id objc_msgSend_scheduleWithFireInterval_leewayInterval_queue_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduleWithFireInterval:leewayInterval:queue:handler:");
}

id objc_msgSend_screenOn(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "screenOn");
}

id objc_msgSend_sendAppSignInSessionActivatedEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendAppSignInSessionActivatedEvent:");
}

id objc_msgSend_sendAppSignInSessionCompletedEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendAppSignInSessionCompletedEvent:");
}

id objc_msgSend_sendEventID_event_options_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendEventID:event:options:completion:");
}

id objc_msgSend_sendMessage_toDestinations_priority_options_identifier_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendMessage:toDestinations:priority:options:identifier:error:");
}

id objc_msgSend_sendMessage_toUsernames_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendMessage:toUsernames:");
}

id objc_msgSend_sendProviderDeviceUsageEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendProviderDeviceUsageEvent:");
}

id objc_msgSend_sendRequestID_request_options_responseHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendRequestID:request:options:responseHandler:");
}

id objc_msgSend_sendSystemSessionCompletedEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendSystemSessionCompletedEvent:");
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "service");
}

id objc_msgSend_serviceConnection_fetchDaemonStatusWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceConnection:fetchDaemonStatusWithCompletionHandler:");
}

id objc_msgSend_serviceConnection_serviceClient_startAuthenticationSessionWithRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceConnection:serviceClient:startAuthenticationSessionWithRequest:completionHandler:");
}

id objc_msgSend_serviceDetailsWithServiceSpecifier_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceDetailsWithServiceSpecifier:error:");
}

id objc_msgSend_serviceListener_connectionInvalidated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceListener:connectionInvalidated:");
}

id objc_msgSend_serviceListener_willAcceptConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceListener:willAcceptConnection:");
}

id objc_msgSend_serviceSpecifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceSpecifier");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set");
}

id objc_msgSend_setAccount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccount:");
}

id objc_msgSend_setActionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActionHandler:");
}

id objc_msgSend_setAdvertiseRate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAdvertiseRate:");
}

id objc_msgSend_setAppleAccountToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAppleAccountToken:");
}

id objc_msgSend_setAppleIDAuthorization_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAppleIDAuthorization:");
}

id objc_msgSend_setAppleIDAuthorizationRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAppleIDAuthorizationRequest:");
}

id objc_msgSend_setApproved_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setApproved:");
}

id objc_msgSend_setAuthFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAuthFlags:");
}

id objc_msgSend_setAuthType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAuthType:");
}

id objc_msgSend_setAuthenticationRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAuthenticationRequest:");
}

id objc_msgSend_setAuthenticationResult_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAuthenticationResult:");
}

id objc_msgSend_setAuthorization_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAuthorization:");
}

id objc_msgSend_setBodyArguments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBodyArguments:");
}

id objc_msgSend_setBodyKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBodyKey:");
}

id objc_msgSend_setBundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBundleID:");
}

id objc_msgSend_setBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBundleIdentifier:");
}

id objc_msgSend_setCategoryID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCategoryID:");
}

id objc_msgSend_setCategoryIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCategoryIdentifier:");
}

id objc_msgSend_setChangeFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setChangeFlags:");
}

id objc_msgSend_setControlFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setControlFlags:");
}

id objc_msgSend_setDedicatedCameraRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDedicatedCameraRequest:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDestinationDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDestinationDevice:");
}

id objc_msgSend_setDeviceAcceptedNotificationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceAcceptedNotificationHandler:");
}

id objc_msgSend_setDeviceActionType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceActionType:");
}

id objc_msgSend_setDeviceBuildVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceBuildVersion:");
}

id objc_msgSend_setDeviceChangedHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceChangedHandler:");
}

id objc_msgSend_setDeviceClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceClass:");
}

id objc_msgSend_setDeviceFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceFlags:");
}

id objc_msgSend_setDeviceFoundHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceFoundHandler:");
}

id objc_msgSend_setDeviceLostHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceLostHandler:");
}

id objc_msgSend_setDeviceModel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceModel:");
}

id objc_msgSend_setDeviceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceName:");
}

id objc_msgSend_setDeviceStartedAuthenticationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceStartedAuthenticationHandler:");
}

id objc_msgSend_setDiscoveryFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDiscoveryFlags:");
}

id objc_msgSend_setDispatchQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDispatchQueue:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnabled:");
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

id objc_msgSend_setFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFlags:");
}

id objc_msgSend_setIconName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIconName:");
}

id objc_msgSend_setIconSystemName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIconSystemName:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setIsUsernameEditable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsUsernameEditable:");
}

id objc_msgSend_setMessageReceivedHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMessageReceivedHandler:");
}

id objc_msgSend_setModel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModel:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNonce_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNonce:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOptions:");
}

id objc_msgSend_setOverrideScreenOff_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOverrideScreenOff:");
}

id objc_msgSend_setPasswordCredential_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPasswordCredential:");
}

id objc_msgSend_setPlatformKeyCredentialAssertion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPlatformKeyCredentialAssertion:");
}

id objc_msgSend_setPlatformKeyCredentialAssertionOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPlatformKeyCredentialAssertionOptions:");
}

id objc_msgSend_setPlatformKeyCredentialCreationOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPlatformKeyCredentialCreationOptions:");
}

id objc_msgSend_setPlatformKeyCredentialRegistration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPlatformKeyCredentialRegistration:");
}

id objc_msgSend_setPreferEphemeralURLSessions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreferEphemeralURLSessions:");
}

id objc_msgSend_setProviderName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProviderName:");
}

id objc_msgSend_setProviderURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProviderURL:");
}

id objc_msgSend_setProxiedAppDomains_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProxiedAppDomains:");
}

id objc_msgSend_setProxiedAppIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProxiedAppIdentifier:");
}

id objc_msgSend_setProxiedAppName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProxiedAppName:");
}

id objc_msgSend_setProxiedAssociatedDomains_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProxiedAssociatedDomains:");
}

id objc_msgSend_setProxiedBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProxiedBundleIdentifier:");
}

id objc_msgSend_setProxiedIconData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProxiedIconData:");
}

id objc_msgSend_setProxiedIconScale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProxiedIconScale:");
}

id objc_msgSend_setProxiedOriginDeviceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProxiedOriginDeviceName:");
}

id objc_msgSend_setProxiedTeamIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProxiedTeamIdentifier:");
}

id objc_msgSend_setPurchaseRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPurchaseRequest:");
}

id objc_msgSend_setPurchaseResult_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPurchaseResult:");
}

id objc_msgSend_setPurpose_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPurpose:");
}

id objc_msgSend_setRelyingPartyIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRelyingPartyIdentifier:");
}

id objc_msgSend_setRemoteDeviceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteDeviceName:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setRequestData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRequestData:");
}

id objc_msgSend_setRestrictedAccessRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRestrictedAccessRequest:");
}

id objc_msgSend_setRestrictionType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRestrictionType:");
}

id objc_msgSend_setRssiThreshold_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRssiThreshold:");
}

id objc_msgSend_setSandboxPurchase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSandboxPurchase:");
}

id objc_msgSend_setScanRate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScanRate:");
}

id objc_msgSend_setScreenOnChangedHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScreenOnChangedHandler:");
}

id objc_msgSend_setService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setService:");
}

id objc_msgSend_setSessionFailedHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSessionFailedHandler:");
}

id objc_msgSend_setSessionFinishedHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSessionFinishedHandler:");
}

id objc_msgSend_setSharingData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSharingData:");
}

id objc_msgSend_setStoreAccountToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStoreAccountToken:");
}

id objc_msgSend_setStoreAuthenticationCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStoreAuthenticationCompletionHandler:");
}

id objc_msgSend_setStoreAuthenticationRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStoreAuthenticationRequest:");
}

id objc_msgSend_setSuppressEngagement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSuppressEngagement:");
}

id objc_msgSend_setSystemAuthenticationRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSystemAuthenticationRequest:");
}

id objc_msgSend_setTitleArguments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitleArguments:");
}

id objc_msgSend_setTitleKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitleKey:");
}

id objc_msgSend_setTvProviderRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTvProviderRequest:");
}

id objc_msgSend_setURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setURL:");
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserInfo:");
}

id objc_msgSend_setUsername_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUsername:");
}

id objc_msgSend_setViewControllerClassName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setViewControllerClassName:");
}

id objc_msgSend_setWebAuthenticationCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWebAuthenticationCompletionHandler:");
}

id objc_msgSend_setWebAuthenticationRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWebAuthenticationRequest:");
}

id objc_msgSend_setWebCallbackURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWebCallbackURL:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setXpcEndpoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setXpcEndpoint:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_shouldReceiveDeviceEvents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldReceiveDeviceEvents");
}

id objc_msgSend_showAlertForError_withCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showAlertForError:withCompletion:");
}

id objc_msgSend_signal(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "signal");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_startProxCardTransactionWithOptions_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startProxCardTransactionWithOptions:completion:");
}

id objc_msgSend_statusFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusFlags");
}

id objc_msgSend_storeAccountToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storeAccountToken");
}

id objc_msgSend_storeAuthenticationContent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storeAuthenticationContent");
}

id objc_msgSend_storePurchaseContent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storePurchaseContent");
}

id objc_msgSend_stringArrayForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringArrayForKey:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_succinctDescriptionBuilder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "succinctDescriptionBuilder");
}

id objc_msgSend_systemLockStateSync(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemLockStateSync");
}

id objc_msgSend_titleArguments(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "titleArguments");
}

id objc_msgSend_titleKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "titleKey");
}

id objc_msgSend_tokenFromNSXPCConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tokenFromNSXPCConnection:");
}

id objc_msgSend_tvProviderContent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tvProviderContent");
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uppercaseString");
}

id objc_msgSend_user(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "user");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "username");
}

id objc_msgSend_webRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "webRequest");
}
