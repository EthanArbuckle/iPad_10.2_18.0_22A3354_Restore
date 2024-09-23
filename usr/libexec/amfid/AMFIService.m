@implementation AMFIService

- (BOOL)verifyBoolEntitlement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unsigned __int8 v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AMFIService connection](self, "connection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForEntitlement:", v4));

  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
      sub_10001A02C();
    goto LABEL_8;
  }
  v7 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
      sub_10001A098();
LABEL_8:
    v8 = 0;
    goto LABEL_9;
  }
  v8 = objc_msgSend(v6, "BOOLValue");
LABEL_9:

  return v8;
}

- (void)getSEPStateWithReply:(id)a3
{
  _QWORD *v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void (*v10)(_QWORD *, _BYTE *, id);
  id v11;
  _BYTE buf[32];
  __int128 v13;
  char v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  char v18;

  v3 = a3;
  v18 = 0;
  v16 = 0u;
  v17 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(objc_alloc((Class)LAStorage), "initWithDomain:authenticationContext:", 0, 0);
  v11 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dataForKey:error:", 15, &v11));
  v6 = v11;
  v7 = off_100028EF0;
  if (v6)
  {
    v8 = v6;
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
      sub_10001A104();
    v9 = objc_msgSend(objc_alloc((Class)AMFIError), "initWithAMFIErrorCode:withURL:", -408, 0);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[AMFIService getSEPStateWithReply:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v5 != 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%s] returning SEP state | [exists: %u]", buf, 0x12u);
    }
    if (v5)
      objc_msgSend(v5, "getBytes:length:", &v15, 49);
    v9 = 0;
  }
  v10 = (void (*)(_QWORD *, _BYTE *, id))v3[2];
  *(_OWORD *)buf = v15;
  *(_OWORD *)&buf[16] = v16;
  v13 = v17;
  v14 = v18;
  v10(v3, buf, v9);

}

- (void)signTeamID:(id)a3 withSignType:(unsigned int)a4 withLAContext:(id)a5 withReply:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, void *, id);
  id v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  unsigned int v36;
  _DWORD v37[33];
  __int128 v38;

  v10 = a3;
  v11 = a5;
  v12 = (void (**)(id, void *, id))a6;
  memset(&v37[1], 0, 128);
  v38 = 0u;
  v37[0] = 2;
  v37[2] = 5;
  if (!-[AMFIService verifyBoolEntitlement:](self, "verifyBoolEntitlement:", CFSTR("com.apple.private.amfi.set-trust")))
  {
    v14 = objc_alloc((Class)AMFIError);
    v15 = -440;
LABEL_17:
    v29 = objc_msgSend(v14, "initWithAMFIErrorCode:withURL:", v15, 0);
    v25 = 0;
    v27 = 0;
    goto LABEL_18;
  }
  if (!v10)
  {
    v16 = off_100028EF0;
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
      sub_10001A170(v16, v17, v18, v19, v20, v21, v22, v23);
    goto LABEL_16;
  }
  v13 = objc_msgSend(v10, "lengthOfBytesUsingEncoding:", 4);
  if ((unint64_t)v13 >= 0x81)
  {
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
      sub_10001A1E0();
LABEL_16:
    v14 = objc_alloc((Class)AMFIError);
    v15 = -406;
    goto LABEL_17;
  }
  v24 = off_100028EF0;
  if (a4 - 1 >= 2)
  {
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
      sub_10001A25C();
    goto LABEL_16;
  }
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v32 = "-[AMFIService signTeamID:withSignType:withLAContext:withReply:]";
    v33 = 2112;
    v34 = v10;
    v35 = 1024;
    v36 = a4;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[%s] creating auxiliary signature: %@ | %u", buf, 0x1Cu);
  }
  v37[3] = a4;
  HIDWORD(v38) = (_DWORD)v13;
  __memcpy_chk(&v37[4], objc_msgSend(objc_retainAutorelease(v10), "UTF8String"), v13, 132);
  v25 = objc_msgSend(objc_alloc((Class)LAStorage), "initWithDomain:authenticationContext:", 0, v11);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v37, 148));
  v30 = 0;
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "exchangeData:forKey:error:", v26, 13, &v30));
  v28 = v30;

  if (v28)
  {
    v29 = objc_msgSend(objc_alloc((Class)AMFIError), "initWithAMFIErrorCode:withURL:", -408, 0);

  }
  else
  {
    v29 = 0;
  }
LABEL_18:
  v12[2](v12, v27, v29);

}

- (void)setSupervisedState:(unsigned int)a3 withReply:(id)a4
{
  void (**v6)(id, id);
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  unsigned int v17;
  int v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;

  v6 = (void (**)(id, id))a4;
  v19 = 0u;
  v27 = 0u;
  v26 = 0u;
  v25 = 0u;
  v24 = 0u;
  v23 = 0u;
  v22 = 0u;
  v21 = 0u;
  v20 = 0u;
  v18 = 2;
  DWORD1(v19) = 2;
  DWORD2(v19) = a3;
  v7 = off_100028EF0;
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "-[AMFIService setSupervisedState:withReply:]";
    v16 = 1024;
    v17 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%s] setting state: %u", buf, 0x12u);
  }
  if (-[AMFIService verifyBoolEntitlement:](self, "verifyBoolEntitlement:", CFSTR("com.apple.private.amfi.set-supervised")))
  {
    v8 = objc_msgSend(objc_alloc((Class)LAStorage), "initWithDomain:authenticationContext:", 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v18, 148));
    v13 = 0;
    v10 = objc_msgSend(v8, "exchangeData:forKey:error:", v9, 13, &v13);
    v11 = v13;

    if (v11)
    {
      v12 = objc_msgSend(objc_alloc((Class)AMFIError), "initWithAMFIErrorCode:withURL:", -408, 0);

    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v12 = objc_msgSend(objc_alloc((Class)AMFIError), "initWithAMFIErrorCode:withURL:", -440, 0);
    v8 = 0;
  }
  v6[2](v6, v12);

}

- (void)setDemoState:(unsigned int)a3 withReply:(id)a4
{
  void (**v6)(id, id);
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  unsigned int v17;
  int v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;

  v6 = (void (**)(id, id))a4;
  v19 = 0u;
  v27 = 0u;
  v26 = 0u;
  v25 = 0u;
  v24 = 0u;
  v23 = 0u;
  v22 = 0u;
  v21 = 0u;
  v20 = 0u;
  v18 = 2;
  DWORD1(v19) = 3;
  DWORD2(v19) = a3;
  v7 = off_100028EF0;
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "-[AMFIService setDemoState:withReply:]";
    v16 = 1024;
    v17 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%s] setting state: %u", buf, 0x12u);
  }
  if (-[AMFIService verifyBoolEntitlement:](self, "verifyBoolEntitlement:", CFSTR("com.apple.private.amfi.set-demo")))
  {
    v8 = objc_msgSend(objc_alloc((Class)LAStorage), "initWithDomain:authenticationContext:", 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v18, 148));
    v13 = 0;
    v10 = objc_msgSend(v8, "exchangeData:forKey:error:", v9, 13, &v13);
    v11 = v13;

    if (v11)
    {
      v12 = objc_msgSend(objc_alloc((Class)AMFIError), "initWithAMFIErrorCode:withURL:", -408, 0);

    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v12 = objc_msgSend(objc_alloc((Class)AMFIError), "initWithAMFIErrorCode:withURL:", -440, 0);
    v8 = 0;
  }
  v6[2](v6, v12);

}

- (void)setManagedState:(id)a3 withReply:(id)a4
{
  id v6;
  void (**v7)(id, id);
  NSObject *v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  _QWORD v21[19];

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  memset(&v21[6], 170, 100);
  *(_OWORD *)v21 = xmmword_10001DA48;
  memset(&v21[2], 0, 32);
  v8 = off_100028EF0;
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[AMFIService setManagedState:withReply:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: enabling MDM state", buf, 0xCu);
  }
  if (-[AMFIService verifyBoolEntitlement:](self, "verifyBoolEntitlement:", CFSTR("com.apple.private.amfi.set-managed")))
  {
    if (v6 && (objc_msgSend(v6, "isCredentialSet:", -1) & 1) == 0)
    {
      v9 = off_100028EF0;
      if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v20 = "-[AMFIService setManagedState:withReply:]";
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: attempting to set password credential with empty password", buf, 0xCu);
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100025C48, "dataUsingEncoding:", 4));
      v18 = 0;
      objc_msgSend(v6, "setCredential:type:error:", v10, -1, &v18);
      v11 = v18;

      if (v11 && os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
        sub_10001A2C8();

    }
    v12 = objc_msgSend(objc_alloc((Class)LAStorage), "initWithDomain:authenticationContext:", 0, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v21, 148));
    v17 = 0;
    v14 = objc_msgSend(v12, "exchangeData:forKey:error:", v13, 13, &v17);
    v15 = v17;

    if (v15)
    {
      v16 = objc_msgSend(objc_alloc((Class)AMFIError), "initWithAMFIErrorCode:withURL:", -408, 0);

    }
    else
    {
      v16 = 0;
    }
  }
  else
  {
    v16 = objc_msgSend(objc_alloc((Class)AMFIError), "initWithAMFIErrorCode:withURL:", -440, 0);
    v12 = 0;
  }
  v7[2](v7, v16);

}

- (void)removeManagedStateWithReply:(id)a3
{
  void (**v4)(id, id);
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  _QWORD v14[19];

  v4 = (void (**)(id, id))a3;
  memset(&v14[6], 170, 100);
  *(_OWORD *)v14 = xmmword_10001DADC;
  memset(&v14[2], 0, 32);
  v5 = off_100028EF0;
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[AMFIService removeManagedStateWithReply:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: disabling MDM state", buf, 0xCu);
  }
  if (-[AMFIService verifyBoolEntitlement:](self, "verifyBoolEntitlement:", CFSTR("com.apple.private.amfi.set-managed")))
  {
    v6 = objc_msgSend(objc_alloc((Class)LAStorage), "initWithDomain:authenticationContext:", 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v14, 148));
    v11 = 0;
    v8 = objc_msgSend(v6, "exchangeData:forKey:error:", v7, 13, &v11);
    v9 = v11;

    if (v9)
    {
      v10 = objc_msgSend(objc_alloc((Class)AMFIError), "initWithAMFIErrorCode:withURL:", -408, 0);

    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = objc_msgSend(objc_alloc((Class)AMFIError), "initWithAMFIErrorCode:withURL:", -440, 0);
    v6 = 0;
  }
  v4[2](v4, v10);

}

- (void)initiateDataMigrationWithReply:(id)a3
{
  void (**v4)(_QWORD);
  id v5;
  id v6;

  v4 = (void (**)(_QWORD))a3;
  if (-[AMFIService verifyBoolEntitlement:](self, "verifyBoolEntitlement:", CFSTR("com.apple.private.amfi.data-migration")))
  {
    sub_10000D75C();
    v5 = 0;
  }
  else
  {
    v5 = objc_msgSend(objc_alloc((Class)AMFIError), "initWithAMFIErrorCode:withURL:", -440, 0);
  }
  v6 = v5;
  v4[2](v4);

}

- (void)initiateDeveloperModeDaemonsWithReply:(id)a3
{
  void (**v4)(id, id);
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  int v17;
  const char *v18;

  v4 = (void (**)(id, id))a3;
  if (-[AMFIService verifyBoolEntitlement:](self, "verifyBoolEntitlement:", CFSTR("com.apple.private.amfi.developer-mode-control")))
  {
    v5 = off_100028EF0;
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 136315138;
      v18 = "-[AMFIService initiateDeveloperModeDaemonsWithReply:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: attempting to kick-off developer-mode-daemons", (uint8_t *)&v17, 0xCu);
    }
    if (amfi_developer_mode_status())
    {
      v6 = launch_enable_directory("/System/Library/DeveloperModeLaunchDaemons");
      if ((_DWORD)v6)
      {
        v7 = v6;
        v8 = off_100028EF0;
        if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
          sub_10001A334(v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
    else
    {
      v16 = off_100028EF0;
      if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 136315138;
        v18 = "-[AMFIService initiateDeveloperModeDaemonsWithReply:]";
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s: skipping developer-mode-daemons initiation", (uint8_t *)&v17, 0xCu);
      }
    }
    v15 = 0;
  }
  else
  {
    v15 = objc_msgSend(objc_alloc((Class)AMFIError), "initWithAMFIErrorCode:withURL:", -440, 0);
  }
  v4[2](v4, v15);

}

- (void)stageProfileForUuid:(id)a3 withReply:(id)a4
{
  id v6;
  void (**v7)(id, id);
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  NSObject *v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  if (!-[AMFIService verifyBoolEntitlement:](self, "verifyBoolEntitlement:", CFSTR("com.apple.private.amfi.schedule-profile")))
  {
    v11 = objc_alloc((Class)AMFIError);
    v12 = -440;
LABEL_16:
    v10 = objc_msgSend(v11, "initWithAMFIErrorCode:withURL:", v12, 0);
    goto LABEL_17;
  }
  v8 = off_100028EF0;
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
      sub_10001A3AC(v8, v13, v14, v15, v16, v17, v18, v19);
    v11 = objc_alloc((Class)AMFIError);
    v12 = -406;
    goto LABEL_16;
  }
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v24 = "-[AMFIService stageProfileForUuid:withReply:]";
    v25 = 2112;
    v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%s] attempting to stage: %@", buf, 0x16u);
  }
  v22 = 0;
  objc_msgSend(v6, "writeToFile:atomically:encoding:error:", CFSTR("/private/var/db/amfid/UPPStaging.plist"), 1, 4, &v22);
  v9 = v22;
  if (v9)
  {
    v10 = v9;
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
      sub_10001A488();
    goto LABEL_17;
  }
  v20 = AMFIArmSecurityBootMode(3);
  v21 = off_100028EF0;
  if (v20)
  {
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
      sub_10001A41C();
    v11 = objc_alloc((Class)AMFIError);
    v12 = -401;
    goto LABEL_16;
  }
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v24 = "-[AMFIService stageProfileForUuid:withReply:]";
    v25 = 2112;
    v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[%s] successfully staged UUID: %@", buf, 0x16u);
  }
  v10 = 0;
LABEL_17:
  v7[2](v7, v10);

}

- (void)getStagedProfileWithReply:(id)a3
{
  void (**v3)(id, void *, id);
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  uint8_t buf[4];
  const char *v9;

  v3 = (void (**)(id, void *, id))a3;
  v4 = off_100028EF0;
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[AMFIService getStagedProfileWithReply:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%s] acquiring staged UUID", buf, 0xCu);
  }
  v7 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithContentsOfFile:encoding:error:](NSString, "stringWithContentsOfFile:encoding:error:", CFSTR("/private/var/db/amfid/UPPStaging.plist"), 4, &v7));
  v6 = v7;
  if (v6 && os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
    sub_10001A4F4();
  v3[2](v3, v5, v6);

}

- (void)commitProfileForUuid:(id)a3 withReply:(id)a4
{
  id v6;
  void (**v7)(id, id);
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  unsigned int v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  dispatch_queue_global_t global_queue;
  NSObject *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  _QWORD v32[5];
  id v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  id v37;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = sub_100008E18;
  v32[4] = sub_100008E28;
  v33 = (id)0xAAAAAAAAAAAAAAAALL;
  v8 = v6;
  v33 = v8;
  if (!-[AMFIService verifyBoolEntitlement:](self, "verifyBoolEntitlement:", CFSTR("com.apple.private.amfi.commit-profile")))
  {
    v15 = objc_msgSend(objc_alloc((Class)AMFIError), "initWithAMFIErrorCode:withURL:", -440, 0);
    goto LABEL_8;
  }
  v9 = off_100028EF0;
  v10 = os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT);
  if (!v8)
  {
    if (v10)
    {
      *(_DWORD *)buf = 136315138;
      v35 = "-[AMFIService commitProfileForUuid:withReply:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[%s] attempting to remove staged UUID", buf, 0xCu);
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v18 = objc_msgSend(v17, "fileExistsAtPath:", CFSTR("/private/var/db/amfid/UPPStaging.plist"));

    if (!v18)
    {
      v16 = 0;
      goto LABEL_27;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v31 = 0;
    objc_msgSend(v19, "removeItemAtPath:error:", CFSTR("/private/var/db/amfid/UPPStaging.plist"), &v31);
    v15 = v31;

LABEL_8:
    v16 = 0;
    goto LABEL_9;
  }
  if (v10)
  {
    *(_DWORD *)buf = 136315394;
    v35 = "-[AMFIService commitProfileForUuid:withReply:]";
    v36 = 2112;
    v37 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[%s] attempting to commit UUID: %@", buf, 0x16u);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v12 = objc_msgSend(v11, "fileExistsAtPath:", CFSTR("/private/var/db/amfid/UPPCommitting.plist"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v30 = 0;
    objc_msgSend(v13, "removeItemAtPath:error:", CFSTR("/private/var/db/amfid/UPPCommitting.plist"), &v30);
    v14 = v30;

  }
  else
  {
    v14 = 0;
  }
  v29 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithContentsOfFile:encoding:error:](NSString, "stringWithContentsOfFile:encoding:error:", CFSTR("/private/var/db/amfid/UPPStaging.plist"), 4, &v29));
  v15 = v29;

  if (v15)
  {
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
      sub_10001A6B0();
    goto LABEL_9;
  }
  if ((objc_msgSend(v8, "isEqualToString:", v16) & 1) != 0)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v28 = 0;
    objc_msgSend(v20, "removeItemAtPath:error:", CFSTR("/private/var/db/amfid/UPPStaging.plist"), &v28);
    v21 = v28;

    if (v21)
    {
      if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
        sub_10001A5CC();

    }
    v27 = 0;
    objc_msgSend(v8, "writeToFile:atomically:encoding:error:", CFSTR("/private/var/db/amfid/UPPCommitting.plist"), 1, 4, &v27);
    v22 = v27;
    v23 = off_100028EF0;
    if (v22)
    {
      v15 = v22;
      if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
        sub_10001A560();
      goto LABEL_9;
    }
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "-[AMFIService commitProfileForUuid:withReply:]";
      v36 = 2112;
      v37 = v8;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[%s] successfully committed UUID: %@", buf, 0x16u);
    }
    global_queue = dispatch_get_global_queue(33, 0);
    v25 = objc_claimAutoreleasedReturnValue(global_queue);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100008E30;
    v26[3] = &unk_100025070;
    v26[4] = v32;
    dispatch_async(v25, v26);

LABEL_27:
    v15 = 0;
    goto LABEL_9;
  }
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
    sub_10001A638();
  v15 = objc_msgSend(objc_alloc((Class)AMFIError), "initWithAMFIErrorCode:withURL:", -407, 0);
LABEL_9:
  v7[2](v7, v15);
  _Block_object_dispose(v32, 8);

}

- (void)setTrustForUuid:(id)a3 withSignature:(id)a4 withSignType:(unsigned int)a5 withReply:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, id);
  NSObject *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  const char *v25;
  __int16 v26;
  id v27;

  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, id))a6;
  if (!-[AMFIService verifyBoolEntitlement:](self, "verifyBoolEntitlement:", CFSTR("com.apple.private.amfi.set-trust")))
  {
    v15 = objc_alloc((Class)AMFIError);
    v16 = -440;
LABEL_12:
    v14 = objc_msgSend(v15, "initWithAMFIErrorCode:withURL:", v16, 0);
    goto LABEL_13;
  }
  v13 = off_100028EF0;
  if (!v10)
  {
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
      sub_10001A71C(v13, v17, v18, v19, v20, v21, v22, v23);
    v15 = objc_alloc((Class)AMFIError);
    v16 = -406;
    goto LABEL_12;
  }
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 136315394;
    v25 = "-[AMFIService setTrustForUuid:withSignature:withSignType:withReply:]";
    v26 = 2112;
    v27 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[%s] attempting to set trust for UUID: %@", (uint8_t *)&v24, 0x16u);
  }
  MISSetProfileTrust(v10, v11);
  if (a5 == 1)
    sub_10000E094(v10);
  v14 = 0;
LABEL_13:
  v12[2](v12, v14);

}

- (void)removeTrustforUuid:(id)a3 withReply:(id)a4
{
  id v6;
  void (**v7)(id, id);
  NSObject *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  const char *v20;
  __int16 v21;
  id v22;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  if (!-[AMFIService verifyBoolEntitlement:](self, "verifyBoolEntitlement:", CFSTR("com.apple.private.amfi.remove-trust")))
  {
    v10 = objc_alloc((Class)AMFIError);
    v11 = -440;
LABEL_10:
    v9 = objc_msgSend(v10, "initWithAMFIErrorCode:withURL:", v11, 0);
    goto LABEL_11;
  }
  v8 = off_100028EF0;
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
      sub_10001A78C(v8, v12, v13, v14, v15, v16, v17, v18);
    v10 = objc_alloc((Class)AMFIError);
    v11 = -406;
    goto LABEL_10;
  }
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 136315394;
    v20 = "-[AMFIService removeTrustforUuid:withReply:]";
    v21 = 2112;
    v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%s] attempting to remove trust for UUID: %@", (uint8_t *)&v19, 0x16u);
  }
  MISRemoveProfileTrust(v6);
  v9 = 0;
LABEL_11:
  v7[2](v7, v9);

}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_connection);
}

- (void)setConnection:(id)a3
{
  objc_storeWeak((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_connection);
}

@end
