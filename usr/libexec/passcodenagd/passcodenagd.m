id sub_100003D58(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  _QWORD v8[5];

  v2 = (void *)a1[4];
  v1 = a1[5];
  v3 = a1[6];
  v4 = a1[7];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100003DE0;
  v8[3] = &unk_100008260;
  v5 = a1[8];
  v8[4] = a1[9];
  BYTE2(v7) = 1;
  LOWORD(v7) = 256;
  return objc_msgSend(v2, "displayUserNotificationWithIdentifier:title:message:defaultButtonText:alternateButtonText:otherButtonText:textfieldPlaceholder:displayOnLockScreen:dismissOnLock:displayInAppWhitelistModes:dismissAfterTimeInterval:assertion:completionBlock:", CFSTR("passcodenagd-user-notification-id"), v1, v3, v4, v5, 0, 0.0, 0, v7, 0, v8);
}

void sub_100003DE0(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  __int16 v10;
  __int16 v11;
  uint8_t buf[16];

  v5 = a3;
  if (a2 == 1)
  {
    v7 = _MCLogObjects[6];
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    v11 = 0;
    v8 = "later!";
    v9 = (uint8_t *)&v11;
LABEL_10:
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    goto LABEL_11;
  }
  if (a2)
  {
    v7 = _MCLogObjects[6];
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    v10 = 0;
    v8 = "default behavior!";
    v9 = (uint8_t *)&v10;
    goto LABEL_10;
  }
  v6 = _MCLogObjects[6];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "change now!", buf, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "beginPromptForChangePasscode");
LABEL_11:

}

id sub_10000402C(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  _QWORD v8[5];

  v2 = (void *)a1[4];
  v1 = a1[5];
  v3 = a1[6];
  v4 = a1[7];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000040B4;
  v8[3] = &unk_100008260;
  v5 = a1[8];
  v8[4] = a1[9];
  BYTE2(v7) = 1;
  LOWORD(v7) = 256;
  return objc_msgSend(v2, "displayUserNotificationWithIdentifier:title:message:defaultButtonText:alternateButtonText:otherButtonText:textfieldPlaceholder:displayOnLockScreen:dismissOnLock:displayInAppWhitelistModes:dismissAfterTimeInterval:assertion:completionBlock:", CFSTR("passcodenagd-user-notification-id"), v1, v3, v4, v5, 0, 0.0, 0, v7, 0, v8);
}

void sub_1000040B4(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  __int16 v10;
  __int16 v11;
  uint8_t buf[16];

  v5 = a3;
  if (a2 == 1)
  {
    v7 = _MCLogObjects[6];
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    v11 = 0;
    v8 = "cancel";
    v9 = (uint8_t *)&v11;
LABEL_10:
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    goto LABEL_11;
  }
  if (a2)
  {
    v7 = _MCLogObjects[6];
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    v10 = 0;
    v8 = "default behavior?";
    v9 = (uint8_t *)&v10;
    goto LABEL_10;
  }
  v6 = _MCLogObjects[6];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Continue", buf, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "beginPromptForChangePasscode");
LABEL_11:

}

id sub_1000042D8(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  _QWORD v7[5];

  v2 = (void *)a1[4];
  v1 = a1[5];
  v3 = a1[6];
  v4 = a1[7];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100004364;
  v7[3] = &unk_100008260;
  v7[4] = a1[8];
  BYTE2(v6) = 1;
  LOWORD(v6) = 256;
  return objc_msgSend(v2, "displayUserNotificationWithIdentifier:title:message:defaultButtonText:alternateButtonText:otherButtonText:textfieldPlaceholder:displayOnLockScreen:dismissOnLock:displayInAppWhitelistModes:dismissAfterTimeInterval:assertion:completionBlock:", CFSTR("passcodenagd-user-notification-id"), v1, v3, v4, 0, 0, 0.0, 0, v6, 0, v7);
}

void sub_100004364(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  uint8_t v8[16];
  uint8_t buf[16];

  v5 = a3;
  v6 = _MCLogObjects[6];
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "default behavior?", v8, 2u);
    }
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Change Passcode", buf, 2u);
    }
    objc_msgSend(*(id *)(a1 + 32), "beginPromptForChangePasscode");
  }

}

void sub_1000046E8(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  uint64_t v15;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = a1[7];
  v12[0] = _NSConcreteStackBlock;
  v12[2] = sub_1000047C0;
  v12[3] = &unk_100008300;
  v6 = (void *)a1[10];
  v14 = a1[11];
  v7 = a1[8];
  v8 = a1[9];
  v12[1] = 3221225472;
  v9 = v6;
  v10 = a1[12];
  v13 = v9;
  v15 = v10;
  BYTE2(v11) = 1;
  LOWORD(v11) = 256;
  objc_msgSend(v2, "displayUserNotificationWithIdentifier:title:message:defaultButtonText:alternateButtonText:otherButtonText:textfieldPlaceholder:displayOnLockScreen:dismissOnLock:displayInAppWhitelistModes:dismissAfterTimeInterval:assertion:completionBlock:", CFSTR("passcodenagd-user-notification-id"), v3, v4, v5, v7, 0, 0.0, v8, v11, 0, v12);

}

void sub_1000047C0(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unsigned int v13;
  id v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  unsigned int v22;
  NSObject *v23;
  id v24;
  void *v25;
  unsigned __int8 v26;
  id v27;
  NSObject *v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  id v48;
  uint8_t buf[4];
  int v50;

  v5 = a3;
  if (a2 == 1)
  {
    v17 = _MCLogObjects[6];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Emergency Call", buf, 2u);
    }
    v18 = (void *)objc_opt_new(SBSLockScreenService);
    objc_msgSend(v18, "launchEmergencyDialerWithCompletion:", 0);
    objc_msgSend(v18, "invalidate");

  }
  else if (a2)
  {
    v19 = _MCLogObjects[6];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v50 = a2;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Unexpected response type: %d", buf, 8u);
    }
  }
  else
  {
    v6 = _MCLogObjects[6];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Continue", buf, 2u);
    }
    v7 = *(_QWORD *)(a1 + 40);
    switch(v7)
    {
      case 2:
        v20 = objc_msgSend(v5, "copy");
        v21 = (void *)qword_10000C378;
        qword_10000C378 = (uint64_t)v20;

        v22 = objc_msgSend((id)qword_10000C370, "isEqualToString:", qword_10000C378);
        v23 = _MCLogObjects[6];
        if (v22)
        {
          if (os_log_type_enabled((os_log_t)_MCLogObjects[6], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "passcode matches!", buf, 2u);
          }
          v24 = objc_msgSend(objc_alloc((Class)DMCProcessAssertion), "initWithReason:", CFSTR("passcodenagd-changePasscode"));
          +[PNDConnection setIsChangingPasscode:](PNDConnection, "setIsChangingPasscode:", 1);
          v25 = *(void **)(a1 + 32);
          v46 = 0;
          v26 = objc_msgSend(v25, "changePasscodeFrom:to:outError:", qword_10000C368, qword_10000C378, &v46);
          v27 = v46;
          if ((v26 & 1) != 0)
          {
            v28 = _MCLogObjects[6];
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "New passcode has been set!", buf, 2u);
            }
            v29 = qword_10000C378;
            v44[0] = _NSConcreteStackBlock;
            v44[1] = 3221225472;
            v44[2] = sub_100004D54;
            v44[3] = &unk_1000082D8;
            v45 = v24;
            +[PNDConnection notifyCDPThatPasscodeChangedTo:completion:](PNDConnection, "notifyCDPThatPasscodeChangedTo:completion:", v29, v44);

          }
          else
          {
            +[PNDConnection setIsChangingPasscode:](PNDConnection, "setIsChangingPasscode:", 0);
            v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedDescription"));
            v43 = (void *)qword_10000C360;
            qword_10000C360 = v42;

            qword_10000C380 = 1;
            objc_msgSend(*(id *)(a1 + 48), "showCFUserNotifcationWithSecureTextFieldOptionForState:", 1);
          }

        }
        else
        {
          if (os_log_type_enabled((os_log_t)_MCLogObjects[6], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "passcode does not match!", buf, 2u);
          }
          v37 = MCLocalizedFormat(CFSTR("PASSCODENAGD_ENTRY_PROMPT_PASSCODE_MISMATCH_ERROR"));
          v38 = objc_claimAutoreleasedReturnValue(v37);
          v39 = (void *)qword_10000C360;
          qword_10000C360 = v38;

          qword_10000C380 = 1;
          objc_msgSend(*(id *)(a1 + 48), "showCFUserNotifcationWithSecureTextFieldOptionForState:", 1);
        }
        break;
      case 1:
        v30 = objc_msgSend(v5, "copy");
        v31 = (void *)qword_10000C370;
        qword_10000C370 = (uint64_t)v30;

        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "localizedDescriptionOfCurrentPasscodeConstraints"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v32, NSLocalizedDescriptionKey, 0));
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("EmptyPasscode"), 0, v33));

        v35 = *(void **)(a1 + 32);
        v47 = v34;
        LODWORD(v32) = objc_msgSend(v35, "passcode:meetsCurrentConstraintsOutError:", qword_10000C370, &v47);
        v14 = v47;

        v36 = _MCLogObjects[6];
        if ((_DWORD)v32)
        {
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "passcode works!", buf, 2u);
          }
          qword_10000C380 = 2;
          v15 = *(void **)(a1 + 48);
          v16 = 2;
          goto LABEL_33;
        }
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "passcode does not work!", buf, 2u);
        }
        v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedDescription"));
        v41 = (void *)qword_10000C360;
        qword_10000C360 = v40;

        goto LABEL_32;
      case 0:
        v8 = objc_msgSend(v5, "copy");
        v9 = (void *)qword_10000C368;
        qword_10000C368 = (uint64_t)v8;

        v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "localizedDescriptionOfCurrentPasscodeConstraints"));
        v11 = (void *)qword_10000C360;
        qword_10000C360 = v10;

        v12 = *(void **)(a1 + 32);
        v48 = 0;
        v13 = objc_msgSend(v12, "unlockDeviceWithPasscode:outError:", qword_10000C368, &v48);
        v14 = v48;
        if (v13)
        {
          qword_10000C380 = 1;
          v15 = *(void **)(a1 + 48);
          v16 = 1;
LABEL_33:
          objc_msgSend(v15, "showCFUserNotifcationWithSecureTextFieldOptionForState:", v16);

          break;
        }
LABEL_32:
        v15 = *(void **)(a1 + 48);
        v16 = qword_10000C380;
        goto LABEL_33;
    }
  }

}

void sub_100004D54()
{
  void *v0;
  uint64_t v1;
  void *v2;
  unsigned int v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;

  +[PNDConnection setIsChangingPasscode:](PNDConnection, "setIsChangingPasscode:", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v1 = MCPasscodeNagKeepAliveFilePath();
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v3 = objc_msgSend(v0, "fileExistsAtPath:", v2);

  if (v3)
  {
    v4 = _MCLogObjects[6];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Deleting Keep-Alive file", buf, 2u);
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v6 = MCPasscodeNagKeepAliveFilePath();
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v13 = 0;
    v8 = objc_msgSend(v5, "removeItemAtPath:error:", v7, &v13);
    v9 = v13;

    if ((v8 & 1) == 0)
    {
      v10 = _MCLogObjects[6];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = v10;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedDescription"));
        *(_DWORD *)buf = 138543362;
        v15 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Error deleting Keep-Alive file: %{public}@", buf, 0xCu);

      }
    }

  }
}

void sub_100004F38(id a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init((Class)NSObject);
  v2 = (void *)qword_10000C3A0;
  qword_10000C3A0 = (uint64_t)v1;

}

id sub_1000051E0(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint8_t v5[16];
  uint8_t buf[16];

  v2 = _MCLogObjects[6];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Keep-Alive file has been deleted!", buf, 2u);
  }
  if (!objc_msgSend(*(id *)(a1 + 32), "isChangingPasscode"))
    return objc_msgSend(*(id *)(a1 + 32), "shutdown");
  v3 = _MCLogObjects[6];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Currently changing passcode. Postponing handling this notification until passcode change completes", v5, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "setPendingKeepAliveDeletion:", 1);
}

uint64_t sub_1000052B0(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

void sub_1000053E0(id a1)
{
  NSObject *v1;
  uint8_t v2[16];

  v1 = _MCLogObjects[6];
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Dying now...", v2, 2u);
  }
  exit(0);
}

void sub_100005550(uint64_t a1, int token)
{
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];
  uint8_t buf[8];
  uint64_t state64;

  state64 = 0;
  notify_get_state(token, &state64);
  if (state64 == 1)
  {
    v3 = _MCLogObjects[6];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Notified that we landed on HomeScreen", buf, 2u);
    }
    if (objc_msgSend(*(id *)(a1 + 32), "isChangingPasscode"))
    {
      v4 = _MCLogObjects[6];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Currently changing passcode. Ignoring this notification for now...", v5, 2u);
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_checkPasscodeCompliance");
    }
  }
}

void sub_100005710(id a1, int a2)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  v2 = _MCLogObjects[6];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Notified that device lock state changed", v5, 2u);
  }
  v3 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v4 = (void *)qword_10000C388;
  qword_10000C388 = v3;

}

id sub_1000057C4()
{
  NSObject *v0;
  uint8_t v2[16];

  v0 = _MCLogObjects[6];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "System language changed", v2, 2u);
  }
  return +[PNDConnection shutdown](PNDConnection, "shutdown");
}

void sub_1000058BC(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void **v20;
  uint64_t v21;
  id (*v22)(uint64_t);
  void *v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD block[4];
  id v30;
  id v31;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  switch(a2)
  {
    case 0:
      v9 = _MCLogObjects[6];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "getPasscodeComplianceWarningLastLockDate completion: kMCPasscodeComplianceNone", buf, 2u);
      }
      break;
    case 1:
      v17 = _MCLogObjects[6];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "getPasscodeComplianceWarningLastLockDate completion: kMCPasscodeComplianceMandatory", buf, 2u);
      }
      v20 = _NSConcreteStackBlock;
      v21 = 3221225472;
      v22 = sub_100005BF4;
      v23 = &unk_100008450;
      v24 = v7;
      v25 = v8;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, &v20);
      v18 = *(void **)(a1 + 32);
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date", v20, v21, v22, v23));
      objc_msgSend(v18, "notifyUserHasSeenComplianceMessageWithLastLockDate:", v19);

      v13 = v24;
      goto LABEL_13;
    case 2:
      v10 = _MCLogObjects[6];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "getPasscodeComplianceWarningLastLockDate completion: kMCPasscodeComplianceOptional", buf, 2u);
      }
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100005BCC;
      block[3] = &unk_100008450;
      v30 = v7;
      v31 = v8;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      v11 = *(void **)(a1 + 32);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      objc_msgSend(v11, "notifyUserHasSeenComplianceMessageWithLastLockDate:", v12);

      v13 = v30;
      goto LABEL_13;
    case 3:
      v14 = _MCLogObjects[6];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "getPasscodeComplianceWarningLastLockDate completion: kMCPasscodeComplianceAdvisory", buf, 2u);
      }
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_100005BE0;
      v26[3] = &unk_100008450;
      v27 = v7;
      v28 = v8;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v26);
      v15 = *(void **)(a1 + 32);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      objc_msgSend(v15, "notifyUserHasSeenComplianceMessageWithLastLockDate:", v16);

      v13 = v27;
LABEL_13:

      break;
    default:
      break;
  }

}

id sub_100005BCC(uint64_t a1)
{
  return +[PNDUserNotificationView showPasscodePromptForMCPasscodeComplianceTypeOptionalWithTitle:message:](PNDUserNotificationView, "showPasscodePromptForMCPasscodeComplianceTypeOptionalWithTitle:message:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

id sub_100005BE0(uint64_t a1)
{
  return +[PNDUserNotificationView showPasscodePromptForMCPasscodeComplianceTypeAdvisoryWithTitle:message:](PNDUserNotificationView, "showPasscodePromptForMCPasscodeComplianceTypeAdvisoryWithTitle:message:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

id sub_100005BF4(uint64_t a1)
{
  return +[PNDUserNotificationView showPasscodePromptForMCPasscodeComplianceTypeMandatoryWithTitle:message:](PNDUserNotificationView, "showPasscodePromptForMCPasscodeComplianceTypeMandatoryWithTitle:message:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void sub_100005D20(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;

  v5 = a3;
  v6 = _MCLogObjects[6];
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Successfully notified CDP of passcode change", (uint8_t *)&v10, 2u);
    }
  }
  else if (v7)
  {
    v8 = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedDescription"));
    v10 = 138543362;
    v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Failed to notify CDP of passcode change. Error: %{public}@", (uint8_t *)&v10, 0xCu);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t start()
{
  void *v0;
  NSObject *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  unsigned int v6;
  NSObject *v7;
  void *v8;
  uint8_t v10[16];
  uint8_t buf[16];

  v0 = objc_autoreleasePoolPush();
  MCLoggingInitialize();
  v1 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "passcodenagd starting...", buf, 2u);
  }
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = MCPasscodeNagKeepAliveFilePath(v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(v2, "fileExistsAtPath:", v5);

  if (v6)
  {
    +[PNDConnection registerKeepAliveFileDeleteNotification](PNDConnection, "registerKeepAliveFileDeleteNotification");
    +[PNDConnection registerSpringboardNotification](PNDConnection, "registerSpringboardNotification");
    +[PNDConnection registerLockStateChangedNotification](PNDConnection, "registerLockStateChangedNotification");
    +[PNDConnection registerLanguageChangedNotification](PNDConnection, "registerLanguageChangedNotification");
  }
  else
  {
    v7 = _MCLogObjects[6];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "No Keep-Alive file!", v10, 2u);
    }
    +[PNDConnection shutdown](PNDConnection, "shutdown");
  }
  objc_autoreleasePoolPop(v0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
  objc_msgSend(v8, "run");

  return 0;
}

id objc_msgSend__cdpSecretTypeFromUnlockScreenType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cdpSecretTypeFromUnlockScreenType:");
}

id objc_msgSend__checkPasscodeCompliance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_checkPasscodeCompliance");
}

id objc_msgSend_beginPromptForChangePasscode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginPromptForChangePasscode");
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cStringUsingEncoding:");
}

id objc_msgSend_cancelNotificationsWithIdentifier_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelNotificationsWithIdentifier:completionBlock:");
}

id objc_msgSend_changePasscodeFrom_to_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "changePasscodeFrom:to:outError:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_dictionaryWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjectsAndKeys:");
}

id objc_msgSend_displayUserNotificationWithIdentifier_title_message_defaultButtonText_alternateButtonText_otherButtonText_textfieldPlaceholder_displayOnLockScreen_dismissOnLock_displayInAppWhitelistModes_dismissAfterTimeInterval_assertion_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayUserNotificationWithIdentifier:title:message:defaultButtonText:alternateButtonText:otherButtonText:textfieldPlaceholder:displayOnLockScreen:dismissOnLock:displayInAppWhitelistModes:dismissAfterTimeInterval:assertion:completionBlock:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_getPasscodeComplianceWarningLastLockDate_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPasscodeComplianceWarningLastLockDate:completionBlock:");
}

id objc_msgSend_initWithContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContext:");
}

id objc_msgSend_initWithReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithReason:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isChangingPasscode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isChangingPasscode");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isPasscodeSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPasscodeSet");
}

id objc_msgSend_launchEmergencyDialerWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "launchEmergencyDialerWithCompletion:");
}

id objc_msgSend_localSecretChangedTo_secretType_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localSecretChangedTo:secretType:completion:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_localizedDescriptionOfCurrentPasscodeConstraints(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescriptionOfCurrentPasscodeConstraints");
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainRunLoop");
}

id objc_msgSend_notifyCDPThatPasscodeChangedTo_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyCDPThatPasscodeChangedTo:completion:");
}

id objc_msgSend_notifyUserHasSeenComplianceMessageWithLastLockDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyUserHasSeenComplianceMessageWithLastLockDate:");
}

id objc_msgSend_passcode_meetsCurrentConstraintsOutError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passcode:meetsCurrentConstraintsOutError:");
}

id objc_msgSend_registerKeepAliveFileDeleteNotification(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerKeepAliveFileDeleteNotification");
}

id objc_msgSend_registerLanguageChangedNotification(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerLanguageChangedNotification");
}

id objc_msgSend_registerLockStateChangedNotification(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerLockStateChangedNotification");
}

id objc_msgSend_registerSpringboardNotification(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerSpringboardNotification");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}

id objc_msgSend_setIsChangingPasscode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsChangingPasscode:");
}

id objc_msgSend_setPendingKeepAliveDeletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPendingKeepAliveDeletion:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setType:");
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedConnection");
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedManager");
}

id objc_msgSend_showCFUserNotifcationWithSecureTextFieldOptionForState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showCFUserNotifcationWithSecureTextFieldOptionForState:");
}

id objc_msgSend_shutdown(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shutdown");
}

id objc_msgSend_statusLock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusLock");
}

id objc_msgSend_unlockDeviceWithPasscode_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unlockDeviceWithPasscode:outError:");
}

id objc_msgSend_unlockScreenTypeForPasscode_outSimplePasscodeType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unlockScreenTypeForPasscode:outSimplePasscodeType:");
}
