void sub_100004D98(id a1)
{
  MMTConnectionManager *v1;
  void *v2;

  v1 = objc_opt_new(MMTConnectionManager);
  v2 = (void *)qword_100014BB0;
  qword_100014BB0 = (uint64_t)v1;

}

void sub_100004F34(uint64_t a1)
{
  void *v2;
  MMTConnection *v3;

  v3 = -[MMTConnection initWithLockdownConnection:]([MMTConnection alloc], "initWithLockdownConnection:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "activeConnections"));
  objc_msgSend(v2, "addObject:", v3);

  -[MMTConnection start](v3, "start");
}

void sub_1000050BC(uint64_t a1)
{
  id v2;

  lockdown_disconnect(objc_msgSend(*(id *)(a1 + 32), "lockdownConnection"));
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "activeConnections"));
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 32));

}

void sub_1000052B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000052D0(uint64_t a1)
{
  void *v1;
  MTChaperoneParser *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "parser"));
  objc_msgSend(v1, "setEscalationBlock:", 0);

  v2 = objc_opt_new(MTChaperoneParser);
  objc_msgSend(WeakRetained, "setParser:", v2);

}

id sub_1000053A4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "executeNextCommand");
}

id sub_100006088(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "executeNextCommand");
}

void sub_100006090(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "workQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000612C;
  v7[3] = &unk_100010750;
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

void sub_10000612C(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD block[5];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "parseErrorFromResponse:"));
    v3 = kMDMPSettingsStatusKey;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", kMDMPSettingsStatusKey));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v4, "count")));
    if (v4)
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v6 = v4;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v15;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v15 != v9)
              objc_enumerationMutation(v6);
            v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "parseErrorFromResponse:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10)));
            objc_msgSend(v5, "addObject:", v11);

            v10 = (char *)v10 + 1;
          }
          while (v8 != v10);
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v8);
      }

      objc_msgSend(v2, "setObject:forKey:", v5, v3);
    }
    objc_msgSend(*(id *)(a1 + 40), "sendMessage:", v2);
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "workQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100006310;
    block[3] = &unk_1000107A0;
    block[4] = *(_QWORD *)(a1 + 40);
    dispatch_async(v12, block);

  }
}

id sub_100006310(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "executeNextCommand");
}

uint64_t start()
{
  void *v0;
  NSObject *v1;
  dispatch_queue_attr_t v2;
  NSObject *v3;
  dispatch_queue_t v4;
  passwd *v5;
  uid_t pw_uid;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  int v13;
  NSObject *v14;
  _DWORD v15[2];

  v0 = objc_autoreleasePoolPush();
  v1 = *(NSObject **)DMCLogObjects(v0);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "mc_mobile_tunnel starting.", (uint8_t *)v15, 2u);
  }
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  v4 = dispatch_queue_create("mc_mobile_tunnel Catalyst Queue", v3);
  CATSetCatalystQueue();

  v5 = getpwnam("mobile");
  if (v5)
    pw_uid = v5->pw_uid;
  else
    pw_uid = 501;
  geteuid();
  v7 = seteuid(pw_uid);
  if ((_DWORD)v7)
    sub_10000B638(v7);
  v8 = lockdown_checkin_xpc("com.apple.mobile.MCInstall", 0, &_dispatch_main_q, &stru_100010808);
  if ((_DWORD)v8)
  {
    v13 = v8;
    v14 = *(NSObject **)DMCLogObjects(v8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15[0] = 67109120;
      v15[1] = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Failed to checkin with lockdown: 0x%08x", (uint8_t *)v15, 8u);
    }
    exit(1);
  }

  objc_autoreleasePoolPop(v0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
  objc_msgSend(v9, "run");

  v11 = *(NSObject **)DMCLogObjects(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "mc_mobile_tunnel shutting down.", (uint8_t *)v15, 2u);
  }
  return 0;
}

void sub_100006574(id a1, _lockdown_connection *a2, __CFDictionary *a3)
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[MMTConnectionManager sharedInstance](MMTConnectionManager, "sharedInstance", a3));
  objc_msgSend(v4, "createConnectionForLockdownConnection:", a2);

}

void sub_1000067F0(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v8 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", kMCTPStatusKey));
  if (!objc_msgSend(v3, "isEqualToString:", kMCTPStatusError))
  {
    if (objc_msgSend(v3, "isEqualToString:", kMCTPStatusCommandFormatError))
      goto LABEL_7;
LABEL_9:
    (*(void (**)(void))(a1[7] + 16))();
    goto LABEL_10;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", kMCTPErrorObjectKey));
  if (!v4)
    goto LABEL_9;
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
  if ((objc_msgSend(v6, "isEqualToString:", MDMErrorDomain) & 1) == 0)
  {

    goto LABEL_9;
  }
  v7 = objc_msgSend(v5, "code");

  if (v7 != (id)12021)
    goto LABEL_9;
LABEL_7:
  objc_msgSend(*(id *)(a1[4] + 8), "processRequest:assertion:completionBlock:", a1[5], a1[6], a1[7]);
LABEL_10:

}

id sub_100006988(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  objc_super v15;
  _QWORD v16[13];
  _QWORD v17[28];

  v2 = objc_alloc((Class)NSSet);
  v17[0] = kMDMPRequestTypeDeviceInformation;
  v17[1] = kMDMPRequestTypeProfileList;
  v17[2] = kMDMPRequestTypeRemoveProfile;
  v17[3] = kMDMPRequestTypeInstallProfile;
  v17[4] = kMDMPRequestTypeDeviceLock;
  v17[5] = kMDMPRequestTypeEraseDevice;
  v17[6] = kMDMPRequestTypeRestartDevice;
  v17[7] = kMDMPRequestTypeShutDownDevice;
  v17[8] = kMDMPRequestTypeCertificateList;
  v17[9] = kMDMPRequestTypeProvisioningProfileList;
  v17[10] = kMDMPRequestTypeInstallProvisioningProfile;
  v17[11] = kMDMPRequestTypeRemoveProvisioningProfile;
  v17[12] = kMDMPRequestTypeInstalledApplicationList;
  v17[13] = kMDMPRequestTypeValidateApplications;
  v17[14] = kMDMPRequestTypeRestrictions;
  v17[15] = kMDMPRequestTypeSecurityInfo;
  v17[16] = kMDMPRequestTypeClearPasscode;
  v17[17] = kMDMPRequestTypeClearRestrictionsPassword;
  v17[18] = kMDMPRequestTypeSettings;
  v17[19] = kMDMPRequestTypeRequestMirroring;
  v17[20] = kMDMPRequestTypeStopMirroring;
  v17[21] = kMDMPRequestTypeActivationLockBypassCode;
  v17[22] = kMDMPRequestTypeClearActivationLockBypassCode;
  v17[23] = kMDMPRequestTypeDeviceConfigured;
  v17[24] = kMDMPRequestTypeScheduleOSUpdate;
  v17[25] = kMDMPRequestTypeScheduleOSUpdateScan;
  v17[26] = kMDMPRequestTypeAvailableOSUpdates;
  v17[27] = kMDMPRequestTypeOSUpdateStatus;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 28));
  v4 = objc_msgSend(v2, "initWithArray:", v3);
  v5 = (void *)qword_100014BD0;
  qword_100014BD0 = (uint64_t)v4;

  v6 = objc_alloc((Class)NSSet);
  v16[0] = CFSTR("DefaultMDMOptions");
  v16[1] = CFSTR("SetDefaultMDMOptions");
  v16[2] = CFSTR("ProceedWithKeybagMigration");
  v16[3] = kMDMPRequestTypeInstallProfileSilent;
  v16[4] = kMDMPRequestTypeRequestUnlockToken;
  v16[5] = CFSTR("GetProfileList");
  v16[6] = CFSTR("InstallProfile");
  v16[7] = CFSTR("RemoveProfile");
  v16[8] = CFSTR("StoreProfile");
  v16[9] = CFSTR("GetStoredProfile");
  v16[10] = CFSTR("GetCloudConfiguration");
  v16[11] = CFSTR("SetCloudConfiguration");
  v16[12] = CFSTR("Flush");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 13));
  v8 = objc_msgSend(v6, "initWithArray:", v7);
  v9 = (void *)qword_100014BD8;
  qword_100014BD8 = (uint64_t)v8;

  v15.receiver = *(id *)(a1 + 32);
  v15.super_class = (Class)MTChaperoneParser;
  v10 = objc_msgSendSuper2(&v15, "_allCommands");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = objc_msgSend(v11, "mutableCopy");
  v13 = (void *)qword_100014BC8;
  qword_100014BC8 = (uint64_t)v12;

  objc_msgSend((id)qword_100014BC8, "intersectSet:", qword_100014BD0);
  return objc_msgSend((id)qword_100014BC8, "unionSet:", qword_100014BD8);
}

void sub_100006DEC(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (id)objc_claimAutoreleasedReturnValue(+[MTChaperoneParser responseWithStatus:](MTChaperoneParser, "responseWithStatus:", kMCTPStatusCommandFormatError));
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void sub_100007460(id a1)
{
  NSObject *v1;
  const char *v2;
  uint8_t *v3;
  __int16 v4;
  __int16 v5;

  if (IOMainPort(bootstrap_port, (mach_port_t *)&dword_100014BE8))
  {
    v1 = *(NSObject **)DMCLogObjects();
    if (!os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      return;
    v4 = 0;
    v2 = "Cannot create IO port to read NVRAM values.";
    v3 = (uint8_t *)&v4;
    goto LABEL_4;
  }
  dword_100014BEC = IORegistryEntryFromPath(dword_100014BE8, "IODeviceTree:/options");
  if (!dword_100014BEC)
  {
    v1 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      v5 = 0;
      v2 = "Cannot create IO Registry entry.";
      v3 = (uint8_t *)&v5;
LABEL_4:
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, v2, v3, 2u);
    }
  }
}

void sub_10000797C(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (id)objc_claimAutoreleasedReturnValue(+[MTChaperoneParser responseWithStatus:](MTChaperoneParser, "responseWithStatus:", kMCTPStatusAcknowledged));
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void sub_1000079D4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    v2 = (id)objc_claimAutoreleasedReturnValue(+[MTChaperoneParser responseWithStatus:](MTChaperoneParser, "responseWithStatus:", kMCTPStatusAcknowledged));
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

  }
}

id sub_100007A40(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "waitUntilKeybagRollingHasBeenPerformedCompletionBlock:timeRemaining:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48) - *(double *)(a1 + 56));
}

void sub_100007A54(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", DMCKeybagErrorDomain, 37001, 0));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTChaperoneParser responseWithError:](MTChaperoneParser, "responseWithError:", v4));
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

}

void sub_100007AD4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", DMCKeybagErrorDomain, 37000, 0));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTChaperoneParser responseWithError:](MTChaperoneParser, "responseWithError:", v4));
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

}

void sub_10000897C(id a1, NSError *a2)
{
  NSError *v2;
  NSError *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;

  v2 = a2;
  v3 = v2;
  if (v2)
  {
    v4 = *(NSObject **)DMCLogObjects(v2);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSError DMCVerboseDescription](v3, "DMCVerboseDescription"));
      v7 = 138543362;
      v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Store profile error. Error: %{public}@", (uint8_t *)&v7, 0xCu);

    }
  }

}

void sub_100008BA8(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTIPCUTunnelParser responseWithStatus:](MTIPCUTunnelParser, "responseWithStatus:", kMCTPStatusAcknowledged));
  if (v5)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("ProfileData"));
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);

}

void sub_100008F28(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8[16];

  v3 = a2;
  if (!v3)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[MTIPCUTunnelParser responseWithStatus:](MTIPCUTunnelParser, "responseWithStatus:", kMCTPStatusAcknowledged));
    goto LABEL_9;
  }
  if (!objc_msgSend(*(id *)(a1 + 32), "_isXPCInterruptionError:", v3)
    || (uint64_t)objc_msgSend(*(id *)(a1 + 32), "setCloudConfigurationCommandRetryCount") > 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setSetCloudConfigurationCommandRetryCount:", 0);
    v6 = objc_claimAutoreleasedReturnValue(+[MTIPCUTunnelParser responseWithError:](MTIPCUTunnelParser, "responseWithError:", v3));
LABEL_9:
    v5 = (void *)v6;
    goto LABEL_10;
  }
  v4 = *(NSObject **)DMCLogObjects(objc_msgSend(*(id *)(a1 + 32), "setSetCloudConfigurationCommandRetryCount:", (char *)objc_msgSend(*(id *)(a1 + 32), "setCloudConfigurationCommandRetryCount") + 1));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Couldn't communicate with the helper application, retrying the commandSetCloudConfiguration", v8, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_commandSetCloudConfiguration:completionBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v5 = 0;
LABEL_10:
  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v5);

}

void sub_1000093FC(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  dispatch_queue_global_t global_queue;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[16];

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", kMCTPErrorObjectKey));
  if (v4
    && objc_msgSend(*(id *)(a1 + 32), "_isXPCInterruptionError:", v4)
    && (uint64_t)objc_msgSend(*(id *)(a1 + 32), "downloadAndApplyCloudConfigurationCommandRetryCount") <= 2)
  {
    v5 = *(NSObject **)DMCLogObjects(objc_msgSend(*(id *)(a1 + 32), "setDownloadAndApplyCloudConfigurationCommandRetryCount:", (char *)objc_msgSend(*(id *)(a1 + 32), "downloadAndApplyCloudConfigurationCommandRetryCount")+ 1));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Couldn't communicate with the helper application, retrying the commandDownloadAndApplyCloudConfiguration", buf, 2u);
    }
    objc_msgSend(*(id *)(a1 + 32), "_commandDownloadAndApplyCloudConfiguration:completionBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setDownloadAndApplyCloudConfigurationCommandRetryCount:", 0);
    v6 = *(void **)(a1 + 48);
    if (v6)
    {
      global_queue = dispatch_get_global_queue(0, 0);
      v8 = objc_claimAutoreleasedReturnValue(global_queue);
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100009560;
      v9[3] = &unk_1000109A8;
      v11 = v6;
      v10 = v3;
      dispatch_async(v8, v9);

    }
  }

}

uint64_t sub_100009560(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_100009570(id *a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void (**v7)(id, void *);
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "_configuratorCloudConfigurationErrorWithCloudConfigDetails:error:", v5, a2));
  if (v6)
  {
    v7 = (void (**)(id, void *))a1[6];
    v8 = objc_msgSend((id)objc_opt_class(a1[4]), "responseWithError:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v7[2](v7, v9);

  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "objectForKeyedSubscript:", CFSTR("MDMUsername")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "objectForKeyedSubscript:", CFSTR("MDMPassword")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", kCCConfigurationURLKey));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v12));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", kCCAnchorCertificatesKey));
    v15 = certificatesFromDERCertificateDataArray();
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10000973C;
    v19[3] = &unk_100010AD0;
    v17 = a1[6];
    v18 = a1[4];
    v21 = v17;
    v19[4] = v18;
    v20 = v5;
    +[MDMMCInterface retrieveCloudConfigurationFromURL:username:password:anchorCertificates:completion:](MDMMCInterface, "retrieveCloudConfigurationFromURL:username:password:anchorCertificates:completion:", v13, v10, v11, v16, v19);

  }
}

void sub_10000973C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(_QWORD *)(a1 + 48);
    v8 = objc_msgSend((id)objc_opt_class(*(_QWORD *)(a1 + 32)), "responseWithError:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v9);

  }
  else
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100009848;
    v13[3] = &unk_100010AA8;
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(id *)(a1 + 48);
    v12 = *(_QWORD *)(a1 + 32);
    v16 = v11;
    v13[4] = v12;
    v14 = v6;
    v15 = *(id *)(a1 + 40);
    +[MDMMCInterface storeCloudConfigurationDetails:completion:](MDMMCInterface, "storeCloudConfigurationDetails:completion:", v10, v13);

  }
}

void sub_100009848(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  dispatch_queue_global_t global_queue;
  NSObject *v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;

  v3 = a2;
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 56);
    v5 = objc_msgSend((id)objc_opt_class(*(_QWORD *)(a1 + 32)), "responseWithError:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v6);

  }
  else
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue(global_queue);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100009948;
    v11[3] = &unk_100010A80;
    v12 = *(id *)(a1 + 40);
    v9 = *(id *)(a1 + 56);
    v10 = *(_QWORD *)(a1 + 32);
    v15 = v9;
    v13 = v10;
    v14 = *(id *)(a1 + 48);
    dispatch_async(v8, v11);

  }
}

void sub_100009948(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  id v8;

  v2 = *(_QWORD *)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000099E8;
  v6[3] = &unk_100010A58;
  v3 = *(id *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  v8 = v3;
  v6[4] = v4;
  v7 = v5;
  +[MDMMCInterface storeProfileData:completion:](MDMMCInterface, "storeProfileData:completion:", v2, v6);

}

void sub_1000099E8(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;

  v3 = a2;
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 48);
    v5 = objc_msgSend((id)objc_opt_class(*(_QWORD *)(a1 + 32)), "responseWithError:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v6);

  }
  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100009AC4;
    v9[3] = &unk_100010980;
    v7 = *(id *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 32);
    v10 = v7;
    v11 = v8;
    v12 = *(id *)(a1 + 48);
    +[MDMMCInterface installStoredProfileDataWithCompletion:](MDMMCInterface, "installStoredProfileDataWithCompletion:", v9);

  }
}

void sub_100009AC4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;

  v6 = a2;
  if (v6)
  {
    +[MDMMCInterface storeCloudConfigurationDetails:completion:](MDMMCInterface, "storeCloudConfigurationDetails:completion:", *(_QWORD *)(a1 + 32), &stru_1000109F0);
    +[MDMMCInterface storeProfileData:completion:](MDMMCInterface, "storeProfileData:completion:", 0, &stru_100010A30);
    v3 = objc_msgSend((id)objc_opt_class(*(_QWORD *)(a1 + 40)), "responseWithError:", v6);
  }
  else
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kCCCloudConfigurationUICompleteKey);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kCCCloudConfigurationWasAppliedKey);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kCCPostSetupProfileWasInstalledKey);
    +[MDMMCInterface storeCloudConfigurationDetails:completion:](MDMMCInterface, "storeCloudConfigurationDetails:completion:", v4, &stru_100010A10);

    +[MDMMCInterface storeProfileData:completion:](MDMMCInterface, "storeProfileData:completion:", 0, &stru_100010A30);
    v3 = objc_msgSend((id)objc_opt_class(*(_QWORD *)(a1 + 40)), "responseWithStatus:", kMCTPStatusAcknowledged);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void sub_100009C00(id a1, NSError *a2)
{
  NSError *v2;
  NSObject *v3;
  int v4;
  NSError *v5;

  v2 = a2;
  v3 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Failed to revert to original cloud configuration. This means that AwaitDeviceConfigured will remain set to YES. Error: %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

void sub_100009CA4(id a1, NSError *a2)
{
  NSError *v2;
  NSObject *v3;
  int v4;
  NSError *v5;

  v2 = a2;
  if (v2)
  {
    v3 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 138543362;
      v5 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Failed to set ConfigurationWasApplied to YES. Error: %{public}@", (uint8_t *)&v4, 0xCu);
    }
  }

}

void sub_100009D4C(id a1, NSError *a2)
{
  NSError *v2;
  NSError *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;

  v2 = a2;
  v3 = v2;
  if (v2)
  {
    v4 = *(NSObject **)DMCLogObjects(v2);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSError DMCVerboseDescription](v3, "DMCVerboseDescription"));
      v7 = 138543362;
      v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Clearing store profile error. Error: %{public}@", (uint8_t *)&v7, 0xCu);

    }
  }

}

void sub_100009EAC(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  dispatch_queue_global_t global_queue;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  if (v3)
    v4 = objc_claimAutoreleasedReturnValue(+[MTIPCUTunnelParser responseWithError:](MTIPCUTunnelParser, "responseWithError:", v3));
  else
    v4 = objc_claimAutoreleasedReturnValue(+[MTIPCUTunnelParser responseWithStatus:](MTIPCUTunnelParser, "responseWithStatus:", kMCTPStatusAcknowledged));
  v5 = (void *)v4;
  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue(global_queue);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100009F94;
    v9[3] = &unk_1000109A8;
    v11 = v6;
    v10 = v5;
    dispatch_async(v8, v9);

  }
}

void sub_100009F94(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[16];

  v1 = (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  v2 = *(NSObject **)DMCLogObjects(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Even more Logging", v3, 2u);
  }
}

void sub_10000A274(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = *(NSObject **)DMCLogObjects(v3);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = v5;
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "DMCVerboseDescription"));
      v8 = 138543362;
      v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Could not erase device: %{public}@", (uint8_t *)&v8, 0xCu);

    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }

}

void sub_10000AA48(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  dispatch_queue_global_t global_queue;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue(global_queue);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000AAF8;
    v7[3] = &unk_1000109A8;
    v9 = v4;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

uint64_t sub_10000AAF8(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_10000AB08(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_configuratorProvisionalEnrollmentErrorWithDetails:error:", v5, a2));
  if (v10)
  {
    v6 = *(_QWORD *)(a1 + 40);
    v7 = objc_msgSend((id)objc_opt_class(*(_QWORD *)(a1 + 32)), "responseWithError:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v8);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MTIPCUTunnelParser responseWithStatus:](MTIPCUTunnelParser, "responseWithStatus:", kMCTPStatusAcknowledged));
    v8 = v9;
    if (v5)
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v5, CFSTR("ProvisionalEnrollmentDetails"));
    (*(void (**)(_QWORD, void *))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v8);
  }

}

void sub_10000B5FC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void sub_10000B638(uint64_t a1)
{
  NSObject *v1;
  uint8_t v2[16];

  v1 = *(NSObject **)DMCLogObjects(a1);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "seteuid failed. Exiting.", v2, 2u);
  }
  abort();
}

void sub_10000B68C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000B620();
  sub_10000B60C();
  sub_10000B5FC((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  sub_10000B630();
}

void sub_10000B70C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000B620();
  sub_10000B60C();
  sub_10000B5FC((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  sub_10000B630();
}

void sub_10000B78C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000B620();
  sub_10000B60C();
  sub_10000B5FC((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  sub_10000B630();
}

void sub_10000B80C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000B620();
  sub_10000B60C();
  sub_10000B5FC((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  sub_10000B630();
}

void sub_10000B88C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000B620();
  sub_10000B60C();
  sub_10000B5FC((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
  sub_10000B630();
}

id objc_msgSend_CSR(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CSR");
}

id objc_msgSend_DMCAppendGreenteaSuffix(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "DMCAppendGreenteaSuffix");
}

id objc_msgSend_DMCCopyAsPrimaryError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "DMCCopyAsPrimaryError");
}

id objc_msgSend_DMCDataWithCFData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "DMCDataWithCFData:");
}

id objc_msgSend_DMCErrorWithDomain_code_descriptionArray_errorType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "DMCErrorWithDomain:code:descriptionArray:errorType:");
}

id objc_msgSend_DMCSafePropertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "DMCSafePropertyListWithData:options:format:error:");
}

id objc_msgSend_DMCUSEnglishDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "DMCUSEnglishDescription");
}

id objc_msgSend_DMCVerboseDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "DMCVerboseDescription");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend__commandDownloadAndApplyCloudConfiguration_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_commandDownloadAndApplyCloudConfiguration:completionBlock:");
}

id objc_msgSend__commandEraseDevice_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_commandEraseDevice:completionBlock:");
}

id objc_msgSend__commandEscalate_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_commandEscalate:completionBlock:");
}

id objc_msgSend__commandEscalateResponse_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_commandEscalateResponse:completionBlock:");
}

id objc_msgSend__commandEstablishProvisionalEnrollmentRequest_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_commandEstablishProvisionalEnrollmentRequest:completionBlock:");
}

id objc_msgSend__commandFlush_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_commandFlush:");
}

id objc_msgSend__commandGetCloudConfiguration_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_commandGetCloudConfiguration:completionBlock:");
}

id objc_msgSend__commandGetEncryptionKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_commandGetEncryptionKey:");
}

id objc_msgSend__commandGetProfileList_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_commandGetProfileList:");
}

id objc_msgSend__commandGetStoredProfile_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_commandGetStoredProfile:completionBlock:");
}

id objc_msgSend__commandHello_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_commandHello:");
}

id objc_msgSend__commandInstallProfile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_commandInstallProfile:");
}

id objc_msgSend__commandPollMDMIfNetworkTetheredRequest_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_commandPollMDMIfNetworkTetheredRequest:completionBlock:");
}

id objc_msgSend__commandRemoveProfile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_commandRemoveProfile:");
}

id objc_msgSend__commandSetCertificate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_commandSetCertificate:");
}

id objc_msgSend__commandSetCloudConfiguration_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_commandSetCloudConfiguration:completionBlock:");
}

id objc_msgSend__commandSetWiFiPower_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_commandSetWiFiPower:");
}

id objc_msgSend__commandStoreProfile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_commandStoreProfile:");
}

id objc_msgSend__configuratorCloudConfigurationErrorWithCloudConfigDetails_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_configuratorCloudConfigurationErrorWithCloudConfigDetails:error:");
}

id objc_msgSend__configuratorProvisionalEnrollmentErrorWithDetails_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_configuratorProvisionalEnrollmentErrorWithDetails:error:");
}

id objc_msgSend__isLockdownModeEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isLockdownModeEnabled");
}

id objc_msgSend__isXPCInterruptionError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isXPCInterruptionError:");
}

id objc_msgSend__removeProfileWithIdentifier_installationType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeProfileWithIdentifier:installationType:");
}

id objc_msgSend__underlyingCloudConfigErrorFromError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_underlyingCloudConfigErrorFromError:");
}

id objc_msgSend_activeConnections(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeConnections");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_challenge(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "challenge");
}

id objc_msgSend_challengeCertificate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "challengeCertificate");
}

id objc_msgSend_clearPasscodeWithEscrowKeybagData_secret_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearPasscodeWithEscrowKeybagData:secret:outError:");
}

id objc_msgSend_cloudConfigurationDetails(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cloudConfigurationDetails");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_commandDefaultMDMOptionsCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "commandDefaultMDMOptionsCompletionBlock:");
}

id objc_msgSend_commandProceedWithKeybagMigrationRequest_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "commandProceedWithKeybagMigrationRequest:completionBlock:");
}

id objc_msgSend_commandSetDefaultMDMOptionsRequest_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "commandSetDefaultMDMOptionsRequest:completionBlock:");
}

id objc_msgSend_connectionQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionQueue");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
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

id objc_msgSend_createConnectionForLockdownConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createConnectionForLockdownConnection:");
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRunLoop");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "data");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithLength:");
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_defaultMDMOptions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultMDMOptions");
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_downloadAndApplyCloudConfigurationCommandRetryCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadAndApplyCloudConfigurationCommandRetryCount");
}

id objc_msgSend_encodeRootObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeRootObject:");
}

id objc_msgSend_enrollProvisionallyWithNonce_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enrollProvisionallyWithNonce:completion:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_escalationBlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "escalationBlock");
}

id objc_msgSend_flush(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flush");
}

id objc_msgSend_hostIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hostIdentifier");
}

id objc_msgSend_initForWritingWithMutableData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initForWritingWithMutableData:");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithLockdownConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLockdownConnection:");
}

id objc_msgSend_initWithMode_options_reason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMode:options:reason:");
}

id objc_msgSend_initWithReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithReason:");
}

id objc_msgSend_installStoredProfileDataWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installStoredProfileDataWithCompletion:");
}

id objc_msgSend_intersectSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intersectSet:");
}

id objc_msgSend_ipcuProfileList(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ipcuProfileList");
}

id objc_msgSend_ipcuRemoveProfileWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ipcuRemoveProfileWithIdentifier:");
}

id objc_msgSend_isAppleTV(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAppleTV");
}

id objc_msgSend_isEqualToData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToData:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isKeybagRollingNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isKeybagRollingNeeded");
}

id objc_msgSend_isLockdownModeEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isLockdownModeEnabled");
}

id objc_msgSend_isPasscodeSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPasscodeSet");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_lockdownConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lockdownConnection");
}

id objc_msgSend_mdmProfileIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mdmProfileIdentifier");
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableBytes");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
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

id objc_msgSend_parseErrorFromResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parseErrorFromResponse:");
}

id objc_msgSend_parser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parser");
}

id objc_msgSend_performRequest_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performRequest:error:");
}

id objc_msgSend_personaID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "personaID");
}

id objc_msgSend_powerAssertion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "powerAssertion");
}

id objc_msgSend_processRequest_assertion_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processRequest:assertion:completionBlock:");
}

id objc_msgSend_profileIdentifierForProfileData_allowEmptyPayload_outIsSupervisionProfile_outProfileSigner_outMayInstallCloudProfile_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "profileIdentifierForProfileData:allowEmptyPayload:outIsSupervisionProfile:outProfileSigner:outMayInstallCloudProfile:outError:");
}

id objc_msgSend_profileIdentifiersWithFilterFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "profileIdentifiersWithFilterFlags:");
}

id objc_msgSend_receiveMessage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receiveMessage");
}

id objc_msgSend_removeConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeConnection:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_resetWithRequest_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetWithRequest:completion:");
}

id objc_msgSend_responseWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "responseWithError:");
}

id objc_msgSend_responseWithStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "responseWithStatus:");
}

id objc_msgSend_retrieveCloudConfigurationDetailsCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retrieveCloudConfigurationDetailsCompletion:");
}

id objc_msgSend_retrieveCloudConfigurationFromURL_username_password_anchorCertificates_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retrieveCloudConfigurationFromURL:username:password:anchorCertificates:completion:");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}

id objc_msgSend_sendMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendMessage:");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set");
}

id objc_msgSend_setCSR_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCSR:");
}

id objc_msgSend_setChallenge_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setChallenge:");
}

id objc_msgSend_setChallengeCertificate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setChallengeCertificate:");
}

id objc_msgSend_setCloudConfigurationCommandRetryCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCloudConfigurationCommandRetryCount");
}

id objc_msgSend_setDefaultMDMOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDefaultMDMOptions:");
}

id objc_msgSend_setDisallowProximitySetup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisallowProximitySetup:");
}

id objc_msgSend_setDownloadAndApplyCloudConfigurationCommandRetryCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDownloadAndApplyCloudConfigurationCommandRetryCount:");
}

id objc_msgSend_setEraseDataPlan_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEraseDataPlan:");
}

id objc_msgSend_setEscalationBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEscalationBlock:");
}

id objc_msgSend_setHideProgress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHideProgress:");
}

id objc_msgSend_setHostIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHostIdentifier:");
}

id objc_msgSend_setIsMDM_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsMDM:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setParser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setParser:");
}

id objc_msgSend_setProfileData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProfileData:");
}

id objc_msgSend_setSetCloudConfigurationCommandRetryCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSetCloudConfigurationCommandRetryCount:");
}

id objc_msgSend_setStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStyle:");
}

id objc_msgSend_sharedClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedClient");
}

id objc_msgSend_sharedConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedConfiguration");
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedConnection");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_simulatePushIfNetworkTetheredWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "simulatePushIfNetworkTetheredWithCompletion:");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "start");
}

id objc_msgSend_storeCertificateData_forHostIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storeCertificateData:forHostIdentifier:");
}

id objc_msgSend_storeCloudConfigurationDetails_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storeCloudConfigurationDetails:completion:");
}

id objc_msgSend_storeProfileData_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storeProfileData:completion:");
}

id objc_msgSend_storedProfileDataWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storedProfileDataWithCompletion:");
}

id objc_msgSend_systemConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemConnection");
}

id objc_msgSend_unionSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unionSet:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_validatedMDMOptionsFromOptionsDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validatedMDMOptionsFromOptionsDictionary:");
}

id objc_msgSend_waitUntilKeybagRollingHasBeenPerformedCompletionBlock_timeRemaining_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitUntilKeybagRollingHasBeenPerformedCompletionBlock:timeRemaining:");
}

id objc_msgSend_workQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "workQueue");
}
