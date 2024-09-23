void sub_100002254(_QWORD *a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[LDLoginUIXPCConnection sharedConnection](LDLoginUIXPCConnection, "sharedConnection"));
  objc_msgSend(v2, "chooseUserWithIdentifier:inClassWithID:password:withCompletionHandler:", a1[4], a1[5], a1[6], a1[7]);

}

void sub_10000237C(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[LDLoginUIXPCConnection sharedConnection](LDLoginUIXPCConnection, "sharedConnection"));
  objc_msgSend(v2, "loginAppleID:password:localLoginOnly:isTemporarySession:withCompletionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57), *(_QWORD *)(a1 + 48));

}

void sub_100002470(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[LDLoginUIXPCConnection sharedConnection](LDLoginUIXPCConnection, "sharedConnection"));
  objc_msgSend(v2, "saveClassConfiguration:withCompletionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void sub_100002530(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[LDLoginUIXPCConnection sharedConnection](LDLoginUIXPCConnection, "sharedConnection"));
  objc_msgSend(v2, "isReadyToLoginWithCompletionHandler:", *(_QWORD *)(a1 + 32));

}

void sub_1000025F0(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[LDLoginUIXPCConnection sharedConnection](LDLoginUIXPCConnection, "sharedConnection"));
  objc_msgSend(v2, "isReadyToLogoutWithCompletionHandler:", *(_QWORD *)(a1 + 32));

}

void sub_1000026B4(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[LDLoginUIXPCConnection sharedConnection](LDLoginUIXPCConnection, "sharedConnection"));
  objc_msgSend(v2, "checkInWithCurrentEnvironment:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

}

void sub_1000027C0(_QWORD *a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[LDLoginUIXPCConnection sharedConnection](LDLoginUIXPCConnection, "sharedConnection"));
  objc_msgSend(v2, "updateGlobalDefaultsValue:forKey:completionHandler:", a1[4], a1[5], a1[6]);

}

void sub_1000028F8(_QWORD *a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[LDLoginUIXPCConnection sharedConnection](LDLoginUIXPCConnection, "sharedConnection"));
  objc_msgSend(v2, "triggerLocalUserSwitchTestForType:count:username:password:loginDelay:logoutDelay:completionHandler:", a1[7], a1[8], a1[4], a1[5], a1[9], a1[10], a1[6]);

}

void sub_100002958(id a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(+[LDLoginUIXPCConnection sharedConnection](LDLoginUIXPCConnection, "sharedConnection"));
  objc_msgSend(v1, "interruptLocalUserSwitchTest");

}

id sub_100002B34(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "connectionDidInvalidate");
}

void sub_100002B3C(id a1, NSError *a2)
{
  int v3;
  NSError *v4;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 138412290;
    v4 = a2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Could not get a proxy to LoginUI, error: %@", (uint8_t *)&v3, 0xCu);
  }
}

void sub_100002C4C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_opt_new(*(_QWORD *)(a1 + 32));
  v2 = (void *)qword_10000DD20;
  qword_10000DD20 = v1;

}

void sub_100002E3C(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];

  objc_msgSend(*(id *)(a1 + 32), "setClassID:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setUserIdentifier:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setPassword:", *(_QWORD *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_proxy"));
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100002ED4;
  v6[3] = &unk_100008480;
  v5 = *(_QWORD *)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "chooseUserWithIdentifier:inClassWithID:password:withCompletionHandler:", v3, v5, v4, v6);

}

id sub_100002ED4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_proxyCallDidFinishWithError:", a2);
}

void sub_100002FA4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[5];

  objc_msgSend(*(id *)(a1 + 32), "setAppleID:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setPassword:", *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_proxy"));
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(unsigned __int8 *)(a1 + 56);
  v6 = *(unsigned __int8 *)(a1 + 57);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100003038;
  v7[3] = &unk_100008480;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "loginAppleID:password:localLoginOnly:isTemporarySession:withCompletionHandler:", v3, v4, v5, v6, v7);

}

id sub_100003038(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_proxyCallDidFinishWithError:", a2);
}

void sub_1000030CC(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "setClassConfiguration:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_proxy"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100003148;
  v4[3] = &unk_100008480;
  v3 = *(_QWORD *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "saveClassConfiguration:withCompletionHandler:", v3, v4);

}

id sub_100003148(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_proxyCallDidFinishWithError:", a2);
}

void sub_1000031CC(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint8_t v4[16];

  if ((objc_msgSend(*(id *)(a1 + 32), "isLoginUICheckedIn") & 1) != 0)
  {
    v2 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "User is not in LoginUI yet.", v4, 2u);
    }
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[LKError errorWithCode:](LKError, "errorWithCode:", 1));
  }
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v2);

}

void sub_1000032EC(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint8_t v4[16];

  if (objc_msgSend(*(id *)(a1 + 32), "currentEnvironment") == (id)1)
  {
    v2 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "User is not in homescreen yet.", v4, 2u);
    }
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[LKError errorWithCode:](LKError, "errorWithCode:", 29));
  }
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v2);

}

uint64_t sub_100003418(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  unsigned int v15;
  int v16;
  unsigned int v17;
  void *v18;
  void *v19;
  double v20;
  uint64_t result;
  int v22;
  uint64_t v23;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v2 = *(_QWORD *)(a1 + 48);
    v22 = 134217984;
    v23 = v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Setting current environment to %lu", (uint8_t *)&v22, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "setCurrentEnvironment:", *(_QWORD *)(a1 + 48));
  if (*(_QWORD *)(a1 + 48) == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_postLoggedInNotification");
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "userSwitchCycleController"));
    v4 = objc_msgSend(v3, "triggerTestUserSwitchIfNeeded");

    if (v4)
      objc_msgSend(*(id *)(a1 + 32), "presentPerfTestOngoingIndicator");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentUser"));
    v7 = objc_msgSend(v6, "inFirstLoginSession");

    if (v7)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Enabling screen recording...", (uint8_t *)&v22, 2u);
      }
      +[LKControlCenterSupport enableControlCenterModule:completionHandler:](LKControlCenterSupport, "enableControlCenterModule:completionHandler:", LKControlCenterModuleScreenRecording, &stru_100008538);
      objc_msgSend(*(id *)(a1 + 32), "_deleteCredentials");
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "logind Attention start tracking.", (uint8_t *)&v22, 2u);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
    objc_msgSend(v8, "userSessionTimeout");
    v10 = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
    objc_msgSend(v11, "temporarySessionTimeout");
    v13 = v12;

    v14 = (void *)objc_opt_new(LKLogoutSupport);
    v15 = objc_msgSend(v14, "isCurrentUserAnonymous");

    if (v10 <= 0.0)
      v16 = 1;
    else
      v16 = v15;
    if (v13 > 0.0)
      v17 = v15;
    else
      v17 = 0;
    if (v16 != 1 || v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[LKAttentionAwareIdleTimer sharedInstance](LKAttentionAwareIdleTimer, "sharedInstance"));
      v19 = v18;
      if (v15)
        v20 = v13;
      else
        v20 = v10;
      objc_msgSend(v18, "startMonitoringAttentionAwareIdleWithDelegate:timeout:", *(_QWORD *)(a1 + 32), v20);

    }
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void sub_10000369C(id a1, BOOL a2, NSError *a3)
{
  NSError *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  if (!a2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100005108((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

}

void sub_100003738(uint64_t a1)
{
  void *v2;
  id v3;
  void ***v4;
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
  unsigned int v16;
  void **v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id v22;
  id buf[2];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "LoginUI checked in.", (uint8_t *)buf, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "setIsLoginUICheckedIn:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "completionHandler"));
  objc_initWeak(buf, *(id *)(a1 + 32));
  v17 = _NSConcreteStackBlock;
  v18 = 3221225472;
  v19 = sub_1000039CC;
  v20 = &unk_100008588;
  objc_copyWeak(&v22, buf);
  v3 = v2;
  v21 = v3;
  v4 = objc_retainBlock(&v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "classConfiguration", v17, v18, v19, v20));

  v6 = *(void **)(a1 + 32);
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "classConfiguration"));
    objc_msgSend(v6, "saveClassConfiguration:withCompletionHandler:", v7, v4);
LABEL_10:

    goto LABEL_11;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "classID"));
  if (v8)
  {

LABEL_8:
    v10 = *(void **)(a1 + 32);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "userIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "classID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "password"));
    objc_msgSend(v10, "chooseUserWithIdentifier:inClassWithID:password:withCompletionHandler:", v7, v11, v12, v4);

LABEL_9:
    goto LABEL_10;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "userIdentifier"));

  if (v9)
    goto LABEL_8;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "appleID"));

  v14 = *(void **)(a1 + 32);
  if (v13)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "appleID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "password"));
    objc_msgSend(v14, "loginAppleID:password:localLoginOnly:isTemporarySession:withCompletionHandler:", v7, v11, 0, 0, v4);
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 32), "_postReadyToLoginNotification");
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "userSwitchCycleController"));
  v16 = objc_msgSend(v15, "triggerTestUserSwitchIfNeeded");

  if (v16)
    objc_msgSend(*(id *)(a1 + 32), "presentPerfTestOngoingIndicator");
LABEL_11:

  objc_destroyWeak(&v22);
  objc_destroyWeak(buf);

}

void sub_1000039AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000039CC(uint64_t a1, void *a2)
{
  id WeakRetained;
  uint64_t v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
    objc_msgSend(WeakRetained, "_postReadyToLoginNotification");
  }

}

uint64_t sub_100003B78(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  unsigned int v5;
  uint64_t result;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v2 = *(_QWORD *)(a1 + 64);
    v3 = *(_QWORD *)(a1 + 72);
    v7 = 134218240;
    v8 = v2;
    v9 = 2048;
    v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Client asked to trigger local perf test. Type: %lu, count: %ld", (uint8_t *)&v7, 0x16u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "userSwitchCycleController"));
  v5 = objc_msgSend(v4, "startUserSwitchWithType:count:username:password:loginDelay:logoutDelay:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88));

  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "presentPerfTestOngoingIndicator");
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void sub_100003CC4(uint64_t a1)
{
  void *v2;
  uint8_t v3[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Client asked to interrupt local perf test.", v3, 2u);
  }
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "userSwitchCycleController"));
  objc_msgSend(v2, "interruptLocalUserSwitchTest");

}

void sub_100003D90(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_proxy"));
  objc_msgSend(v1, "checkedInWithLoginD");

}

void sub_100003E10(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_proxy"));
  objc_msgSend(v1, "presentUserSwitchTestDonePopup");

}

void sub_100003E90(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_proxy"));
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100003F04;
  v3[3] = &unk_1000083F8;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "presentUserSwitchTestOngoingIndicatorWithCancelAction:", v3);

}

void sub_100003F04(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "userSwitchCycleController"));
  objc_msgSend(v1, "interruptLocalUserSwitchTest");

}

id sub_100003F84(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setConnection:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_nilOutStoredProperties");
}

uint64_t sub_1000040A4(uint64_t a1)
{
  uint64_t v2;
  int v4;
  uint64_t v5;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Post %@ notification", (uint8_t *)&v4, 0xCu);
  }
  notify_set_state(dword_10000DB98, 1uLL);
  return notify_post((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"));
}

uint64_t sub_100004268(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCompletionHandler:", *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

id *sub_100004358(id *result, uint64_t a2)
{
  id *v2;

  if (a2)
  {
    v2 = result;
    objc_msgSend(result[4], "_ifStoredCompletionHandlerCallWithErrorAndThenNilOut:", a2);
    objc_msgSend(v2[4], "_nilOutStoredProperties");
    return (id *)objc_msgSend(v2[4], "setIsLoginUICheckedIn:", 0);
  }
  return result;
}

void sub_100004548(id a1, gss_OID_desc_struct *a2, gss_cred_id_t_desc_struct *a3)
{
  OM_uint32 min_stat;
  gss_cred_id_t cred_handle;

  cred_handle = a3;
  min_stat = 0;
  gss_destroy_cred(&min_stat, &cred_handle);
}

void sub_100004614(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_proxy"));
  objc_msgSend(v1, "hideUserSwitchTestOngoingIndicator");

}

void sub_100004720(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "setCompletionHandler:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "setAppleID:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setPassword:", *(_QWORD *)(a1 + 48));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000047D8;
  v4[3] = &unk_100008480;
  v4[4] = *(_QWORD *)(a1 + 32);
  v2 = objc_retainBlock(v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_proxy"));
  objc_msgSend(v3, "loginAppleID:password:localLoginOnly:isTemporarySession:withCompletionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), 0, v2);

}

id sub_1000047D8(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_proxyCallDidFinishWithError:", a2);
}

void sub_100004858(id a1, NSError *a2)
{
  NSError *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  if (v2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_1000051E0((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

void sub_100004B48(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t start()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v0 = objc_autoreleasePoolPush();
  v1 = objc_claimAutoreleasedReturnValue(+[LDXPCListener listenerForMachService:](LDClientXPCListener, "listenerForMachService:", LKLoginDaemonClientServiceName));
  v2 = (void *)qword_10000DD30;
  qword_10000DD30 = v1;

  v3 = objc_claimAutoreleasedReturnValue(+[LDXPCListener listenerForMachService:](LDLoginUIXPCListener, "listenerForMachService:", LKLoginDaemonLoginUIServiceName));
  v4 = (void *)qword_10000DD38;
  qword_10000DD38 = v3;

  objc_msgSend((id)qword_10000DD30, "resume");
  objc_msgSend((id)qword_10000DD38, "resume");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
  objc_msgSend(v5, "run");

  objc_autoreleasePoolPop(v0);
  return 0;
}

void sub_100005064(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100005084(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "clientConnections"));
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 32));

}

void sub_100005108(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004B48((void *)&_mh_execute_header, &_os_log_default, a3, "Failed to screen recording due to error: %{public}@", a5, a6, a7, a8, 2u);
  sub_100004B58();
}

void sub_100005174(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004B48((void *)&_mh_execute_header, &_os_log_default, a3, "Failed to post \"%@\" notification", a5, a6, a7, a8, 2u);
  sub_100004B58();
}

void sub_1000051E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004B48((void *)&_mh_execute_header, &_os_log_default, a3, "Failed to logout to Login Window with error: %{public}@.", a5, a6, a7, a8, 2u);
  sub_100004B58();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend__deleteCredentials(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_deleteCredentials");
}

id objc_msgSend__handlePossibleErrorsOrStoreCompletionHandler_inQueuedBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handlePossibleErrorsOrStoreCompletionHandler:inQueuedBlock:");
}

id objc_msgSend__ifMissingEntitlementCallCompletionHandler_elseCallBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_ifMissingEntitlementCallCompletionHandler:elseCallBlock:");
}

id objc_msgSend__ifStoredCompletionHandlerCallWithErrorAndThenNilOut_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_ifStoredCompletionHandlerCallWithErrorAndThenNilOut:");
}

id objc_msgSend__nilOutStoredProperties(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_nilOutStoredProperties");
}

id objc_msgSend__postLoggedInNotification(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_postLoggedInNotification");
}

id objc_msgSend__postReadyToLoginNotification(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_postReadyToLoginNotification");
}

id objc_msgSend__proxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_proxy");
}

id objc_msgSend__queueBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_queueBlock:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_appleID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appleID");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_checkInWithCurrentEnvironment_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkInWithCurrentEnvironment:completionHandler:");
}

id objc_msgSend_checkedInWithLoginD(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkedInWithLoginD");
}

id objc_msgSend_chooseUserWithIdentifier_inClassWithID_password_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chooseUserWithIdentifier:inClassWithID:password:withCompletionHandler:");
}

id objc_msgSend_classConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "classConfiguration");
}

id objc_msgSend_classID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "classID");
}

id objc_msgSend_clientConnections(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientConnections");
}

id objc_msgSend_completionHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completionHandler");
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connection");
}

id objc_msgSend_connectionWithConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionWithConnection:");
}

id objc_msgSend_currentEnvironment(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentEnvironment");
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRunLoop");
}

id objc_msgSend_currentUser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentUser");
}

id objc_msgSend_enableControlCenterModule_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableControlCenterModule:completionHandler:");
}

id objc_msgSend_errorWithCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithCode:");
}

id objc_msgSend_globalDefaultsUpdateValue_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "globalDefaultsUpdateValue:forKey:");
}

id objc_msgSend_hideUserSwitchTestOngoingIndicator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hideUserSwitchTestOngoingIndicator");
}

id objc_msgSend_inFirstLoginSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inFirstLoginSession");
}

id objc_msgSend_initWithDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDelegate:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithQoS_hangThreshold_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithQoS:hangThreshold:");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_interruptLocalUserSwitchTest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interruptLocalUserSwitchTest");
}

id objc_msgSend_isCurrentUserAnonymous(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCurrentUserAnonymous");
}

id objc_msgSend_isLoginSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isLoginSession");
}

id objc_msgSend_isLoginUICheckedIn(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isLoginUICheckedIn");
}

id objc_msgSend_isReadyToLoginWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isReadyToLoginWithCompletionHandler:");
}

id objc_msgSend_isReadyToLogoutWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isReadyToLogoutWithCompletionHandler:");
}

id objc_msgSend_listener(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "listener");
}

id objc_msgSend_listenerForMachService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "listenerForMachService:");
}

id objc_msgSend_loginAppleID_password_localLoginOnly_isTemporarySession_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loginAppleID:password:localLoginOnly:isTemporarySession:withCompletionHandler:");
}

id objc_msgSend_logoutToLoginUserWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logoutToLoginUserWithCompletionHandler:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_password(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "password");
}

id objc_msgSend_persistentDomainForName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "persistentDomainForName:");
}

id objc_msgSend_presentPerfTestOngoingIndicator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentPerfTestOngoingIndicator");
}

id objc_msgSend_presentUserSwitchTestDonePopup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentUserSwitchTestDonePopup");
}

id objc_msgSend_presentUserSwitchTestOngoingIndicatorWithCancelAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentUserSwitchTestOngoingIndicatorWithCancelAction:");
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queue");
}

id objc_msgSend_queueBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queueBlock:");
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_remoteProcessHasEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteProcessHasEntitlement:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}

id objc_msgSend_saveClassConfiguration_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveClassConfiguration:withCompletionHandler:");
}

id objc_msgSend_setAppleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAppleID:");
}

id objc_msgSend_setClassConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClassConfiguration:");
}

id objc_msgSend_setClassID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClassID:");
}

id objc_msgSend_setCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCompletionHandler:");
}

id objc_msgSend_setConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnection:");
}

id objc_msgSend_setCurrentEnvironment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentEnvironment:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setIsLoginUICheckedIn_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsLoginUICheckedIn:");
}

id objc_msgSend_setListener_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setListener:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPassword_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPassword:");
}

id objc_msgSend_setPersistentDomain_forName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPersistentDomain:forName:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setUserIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserIdentifier:");
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedConnection");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedManager");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_startMonitoringAttentionAwareIdleWithDelegate_timeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startMonitoringAttentionAwareIdleWithDelegate:timeout:");
}

id objc_msgSend_startUserSwitchWithType_count_username_password_loginDelay_logoutDelay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startUserSwitchWithType:count:username:password:loginDelay:logoutDelay:");
}

id objc_msgSend_stopMonitoringAttentionAwareIdleWithDelegate_timeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopMonitoringAttentionAwareIdleWithDelegate:timeout:");
}

id objc_msgSend_suspend(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "suspend");
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchronize");
}

id objc_msgSend_temporarySessionTimeout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "temporarySessionTimeout");
}

id objc_msgSend_triggerLocalUserSwitchTestForType_count_username_password_loginDelay_logoutDelay_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "triggerLocalUserSwitchTestForType:count:username:password:loginDelay:logoutDelay:completionHandler:");
}

id objc_msgSend_triggerTestUserSwitchIfNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "triggerTestUserSwitchIfNeeded");
}

id objc_msgSend_updateGlobalDefaultsValue_forKey_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateGlobalDefaultsValue:forKey:completionHandler:");
}

id objc_msgSend_userIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userIdentifier");
}

id objc_msgSend_userSessionTimeout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userSessionTimeout");
}

id objc_msgSend_userSwitchCycleController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userSwitchCycleController");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}
