@implementation UMSyncService

- (void)getUserSessionAttributes:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, uint64_t);
  NSObject *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  UMSyncService *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, uint64_t))a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_100068D9C;
  v26 = sub_100068DAC;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_100068D9C;
  v20 = sub_100068DAC;
  v21 = 0;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.mkb.usersession.info")))
  {
    v8 = qword_1000E0320;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10006F308;
    v11[3] = &unk_1000D1968;
    v12 = v6;
    v13 = self;
    v14 = &v22;
    v15 = &v16;
    dispatch_sync(v8, v11);
    v7[2](v7, v23[5], v17[5]);

  }
  else
  {
    v9 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    v10 = (void *)v17[5];
    v17[5] = v9;

    if (v7)
      v7[2](v7, 0, v17[5]);
  }
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
}

- (BOOL)remoteProcessHasBooleanEntitlement:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unsigned __int8 v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForEntitlement:", v3));

  v6 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    v7 = objc_msgSend(v5, "BOOLValue");
  else
    v7 = 0;

  return v7;
}

- (void)replacePersonaMachPortVoucher:(id)a3 withAccountID:(id)a4 generationSet:(BOOL)a5 forPid:(int)a6 withReply:(id)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  void (**v14)(id, uint64_t, uint64_t);
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  char *v19;
  NSObject *v20;
  unsigned int v21;
  uint64_t v22;
  const char *v23;
  char *v24;
  void *v25;
  int v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  _BYTE *v30;
  uint64_t v31;
  _QWORD block[4];
  id v33;
  id v34;
  uint64_t *v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD *v38;
  uint64_t *v39;
  int v40;
  int v41;
  _QWORD v42[3];
  int v43;
  _QWORD v44[3];
  int v45;
  _QWORD v46[3];
  int v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  _BYTE v60[12];
  uint64_t v61;

  v9 = a5;
  v12 = a3;
  v13 = a4;
  v14 = (void (**)(id, uint64_t, uint64_t))a7;
  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = sub_100068D9C;
  v58 = sub_100068DAC;
  v59 = 0;
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = sub_100068D9C;
  v52 = sub_100068DAC;
  v53 = 0;
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x2020000000;
  v47 = 22;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x2020000000;
  v45 = 0;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  v43 = 0;
  if (v9)
  {
    if (qword_1000E0160 != -1)
      dispatch_once(&qword_1000E0160, &stru_1000D1B68);
    v15 = (id)qword_1000E0158;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v61 = 0;
      LODWORD(v16) = sub_100007750(1);
      v17 = v15;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        v16 = v16;
      else
        v16 = v16 & 0xFFFFFFFE;
      if ((_DWORD)v16)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[UMSyncService remoteServiceName](self, "remoteServiceName"));
        *(_DWORD *)v60 = 138412290;
        *(_QWORD *)&v60[4] = v18;
        LODWORD(v31) = 12;
        v30 = v60;
        v19 = (char *)_os_log_send_and_compose_impl(v16, &v61, 0, 0);

        if (v19)
          sub_100007780(v19);
      }
      else
      {

        v19 = 0;
      }
      free(v19);
    }

    goto LABEL_24;
  }
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.usermanagerd.persona.background")))
  {
LABEL_24:
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection", v30, v31));
    v26 = sub_100004BCC((uint64_t)objc_msgSend(v25, "processIdentifier"));

    v27 = qword_1000E0320;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005884;
    block[3] = &unk_1000D1A58;
    v40 = a6;
    v33 = v12;
    v35 = &v54;
    v34 = v13;
    v36 = v44;
    v41 = v26;
    v37 = v46;
    v38 = v42;
    v39 = &v48;
    dispatch_sync(v27, block);
    v14[2](v14, v49[5], v55[5]);

    goto LABEL_25;
  }
  if (qword_1000E0160 != -1)
    dispatch_once(&qword_1000E0160, &stru_1000D1B68);
  v20 = (id)qword_1000E0158;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_QWORD *)v60 = 0;
    v21 = sub_100007750(1);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      v22 = v21;
    else
      v22 = v21 & 0xFFFFFFFE;
    if ((_DWORD)v22)
    {
      LODWORD(v61) = 67109120;
      HIDWORD(v61) = a6;
      v23 = (const char *)_os_log_send_and_compose_impl(v22, v60, 0, 0);
      v24 = (char *)v23;
      if (v23)
        sub_100007780(v23);
    }
    else
    {
      v24 = 0;
    }
    free(v24);
  }

  v28 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
  v29 = (void *)v55[5];
  v55[5] = v28;

  if (v14)
    v14[2](v14, v49[5], v55[5]);
LABEL_25:
  _Block_object_dispose(v42, 8);
  _Block_object_dispose(v44, 8);
  _Block_object_dispose(v46, 8);
  _Block_object_dispose(&v48, 8);

  _Block_object_dispose(&v54, 8);
}

- (void)fetchPersona:(id)a3 forPid:(int)a4 completionHandler:(id)a5
{
  uint64_t v6;
  id v8;
  void (**v9)(id, _QWORD);
  NSObject *v10;
  unsigned int v11;
  uint64_t v12;
  const char *v13;
  char *v14;
  NSObject *v15;
  unsigned int v16;
  uint64_t v17;
  const char *v18;
  char *v19;
  uint64_t v20;
  void *v21;
  unsigned int v22;
  void *v23;
  int v24;
  NSObject *v25;
  id v26;
  _QWORD block[4];
  id v28;
  void (**v29)(id, _QWORD);
  uint64_t *v30;
  int v31;
  unsigned int v32;
  int v33;
  int v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  int v43;
  int v44;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = (void (**)(id, _QWORD))a5;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = sub_100068D9C;
  v41 = sub_100068DAC;
  v42 = 0;
  v36 = -1;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.usermanagerd.persona.fetch")))
  {
    if (v8)
      goto LABEL_28;
    if (qword_1000E0160 != -1)
      dispatch_once(&qword_1000E0160, &stru_1000D1B68);
    v10 = (id)qword_1000E0158;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v35 = 0;
      v11 = sub_100007750(1);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        v12 = v11;
      else
        v12 = v11 & 0xFFFFFFFE;
      if ((_DWORD)v12)
      {
        LOWORD(v43) = 0;
        v13 = (const char *)_os_log_send_and_compose_impl(v12, &v35, 0, 0);
        v14 = (char *)v13;
        if (v13)
          sub_100007780(v13);
      }
      else
      {
        v14 = 0;
      }
      free(v14);
    }

    v20 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0));
  }
  else
  {
    if (qword_1000E0160 != -1)
      dispatch_once(&qword_1000E0160, &stru_1000D1B68);
    v15 = (id)qword_1000E0158;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v35 = 0;
      v16 = sub_100007750(1);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        v17 = v16;
      else
        v17 = v16 & 0xFFFFFFFE;
      if ((_DWORD)v17)
      {
        v43 = 67109120;
        v44 = v6;
        v18 = (const char *)_os_log_send_and_compose_impl(v17, &v35, 0, 0);
        v19 = (char *)v18;
        if (v18)
          sub_100007780(v18);
      }
      else
      {
        v19 = 0;
      }
      free(v19);
    }

    v20 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
  }
  v21 = (void *)v38[5];
  v38[5] = v20;

LABEL_28:
  if (v38[5])
  {
    if (v9)
      v9[2](v9, 0);
  }
  else
  {
    v22 = -[UMSyncService asidForClient:withAuid:withPid:](self, "asidForClient:withAuid:withPid:", 0, &v36, v6);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
    v24 = sub_100004BCC((uint64_t)objc_msgSend(v23, "processIdentifier"));

    v25 = qword_1000E0320;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000749EC;
    block[3] = &unk_1000D1AD0;
    v26 = v8;
    v31 = v6;
    v32 = v22;
    v33 = v36;
    v34 = v24;
    v28 = v26;
    v30 = &v37;
    v29 = v9;
    dispatch_sync(v25, block);

  }
  _Block_object_dispose(&v37, 8);

}

+ (id)sharedService
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006833C;
  block[3] = &unk_1000D0DE0;
  block[4] = a1;
  if (qword_1000E0140 != -1)
    dispatch_once(&qword_1000E0140, block);
  return (id)qword_1000E0138;
}

- (id)remoteServiceName
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "serviceName"));

  return v3;
}

- (BOOL)retrievePasscodeFromFileHandle:(id)a3 ofLength:(unint64_t)a4 withbaseaddress:(char *)a5
{
  id v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  unsigned int v11;
  uint64_t v12;
  const char *v13;
  char *v14;
  uint64_t v16;

  v7 = a3;
  v8 = v7;
  if (!a4)
  {
LABEL_16:
    v9 = 1;
    goto LABEL_17;
  }
  if (read((int)objc_msgSend(v7, "fileDescriptor"), a5, a4) != a4)
  {
    if (qword_1000E0160 != -1)
      dispatch_once(&qword_1000E0160, &stru_1000D1B68);
    v10 = (id)qword_1000E0158;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 0;
      v11 = sub_100007750(1);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        v12 = v11;
      else
        v12 = v11 & 0xFFFFFFFE;
      if ((_DWORD)v12)
      {
        v13 = (const char *)_os_log_send_and_compose_impl(v12, &v16, 0, 0);
        v14 = (char *)v13;
        if (v13)
          sub_100007780(v13);
      }
      else
      {
        v14 = 0;
      }
      free(v14);
    }

    goto LABEL_16;
  }
  v9 = 0;
LABEL_17:

  return v9;
}

- (id)externalizeUserDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_msgSend(a3, "mutableCopy");
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "removeObjectForKey:", kUMUserSessionKeybagOpaqueDataKey);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v4));
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)loadUserSession:(id)a3 withSecret:(id)a4 oldSize:(unint64_t)a5 reply:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD, uint64_t);
  NSObject *v13;
  unsigned int v14;
  uint64_t v15;
  const char *v16;
  char *v17;
  NSObject *v18;
  unsigned int v19;
  uint64_t v20;
  const char *v21;
  char *v22;
  NSObject *v23;
  unsigned int v24;
  uint64_t v25;
  const char *v26;
  char *v27;
  NSObject *v28;
  unsigned int v29;
  uint64_t v30;
  const char *v31;
  char *v32;
  vm_address_t v33;
  uint64_t v34;
  NSObject *v35;
  unsigned int v36;
  uint64_t v37;
  const char *v38;
  char *v39;
  NSObject *v40;
  vm_address_t v41;
  vm_map_t v42;
  vm_size_t v43;
  rsize_t v44;
  NSObject *v45;
  unsigned int v46;
  uint64_t v47;
  const char *v48;
  char *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  vm_map_t v55;
  vm_address_t v56;
  vm_size_t v57;
  rsize_t v58;
  _QWORD block[4];
  id v60;
  UMSyncService *v61;
  uint64_t *v62;
  uint64_t *v63;
  vm_address_t v64;
  unint64_t v65;
  __int16 v66;
  uint64_t v67;
  vm_address_t address;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  id v80;

  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, _QWORD, uint64_t))a6;
  v75 = 0;
  v76 = &v75;
  v77 = 0x3032000000;
  v78 = sub_100068D9C;
  v79 = sub_100068DAC;
  v80 = 0;
  v69 = 0;
  v70 = &v69;
  v71 = 0x3032000000;
  v72 = sub_100068D9C;
  v73 = sub_100068DAC;
  v74 = 0;
  address = 0;
  if (qword_1000E0160 != -1)
    dispatch_once(&qword_1000E0160, &stru_1000D1B68);
  v13 = (id)qword_1000E0158;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v67 = 0;
    v14 = sub_100007750(1);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      v15 = v14;
    else
      v15 = v14 & 0xFFFFFFFE;
    if ((_DWORD)v15)
    {
      v66 = 0;
      v16 = (const char *)_os_log_send_and_compose_impl(v15, &v67, 0, 0);
      v17 = (char *)v16;
      if (v16)
        sub_100007780(v16);
    }
    else
    {
      v17 = 0;
    }
    free(v17);
  }

  if (!-[UMSyncService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.mkb.usersession.load")))
  {
    if (qword_1000E0160 != -1)
      dispatch_once(&qword_1000E0160, &stru_1000D1B68);
    v23 = (id)qword_1000E0158;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v67 = 0;
      v24 = sub_100007750(1);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        v25 = v24;
      else
        v25 = v24 & 0xFFFFFFFE;
      if ((_DWORD)v25)
      {
        v66 = 0;
        v26 = (const char *)_os_log_send_and_compose_impl(v25, &v67, 0, 0);
        v27 = (char *)v26;
        if (v26)
          sub_100007780(v26);
      }
      else
      {
        v27 = 0;
      }
      free(v27);
    }

    v34 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
LABEL_74:
    v50 = (void *)v70[5];
    v70[5] = v34;

    if (v12)
    {
LABEL_88:
      v12[2](v12, 0, v70[5]);
      goto LABEL_89;
    }
    goto LABEL_89;
  }
  if (vm_page_size < a5)
  {
    if (qword_1000E0160 != -1)
      dispatch_once(&qword_1000E0160, &stru_1000D1B68);
    v18 = (id)qword_1000E0158;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v67 = 0;
      v19 = sub_100007750(1);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        v20 = v19;
      else
        v20 = v19 & 0xFFFFFFFE;
      if ((_DWORD)v20)
      {
        v66 = 0;
        v21 = (const char *)_os_log_send_and_compose_impl(v20, &v67, 0, 0);
        v22 = (char *)v21;
        if (v21)
          sub_100007780(v21);
      }
      else
      {
        v22 = 0;
      }
      free(v22);
    }

    v34 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 7, 0));
    goto LABEL_74;
  }
  if (a5)
  {
    if (vm_allocate(mach_task_self_, &address, vm_page_size, -268435455))
    {
      if (qword_1000E0160 != -1)
        dispatch_once(&qword_1000E0160, &stru_1000D1B68);
      v28 = (id)qword_1000E0158;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v67 = 0;
        v29 = sub_100007750(1);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          v30 = v29;
        else
          v30 = v29 & 0xFFFFFFFE;
        if ((_DWORD)v30)
        {
          v66 = 0;
          v31 = (const char *)_os_log_send_and_compose_impl(v30, &v67, 0, 0);
          v32 = (char *)v31;
          if (v31)
            sub_100007780(v31);
        }
        else
        {
          v32 = 0;
        }
        free(v32);
      }

      v51 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
      v52 = (void *)v70[5];
      v70[5] = v51;

      address = 0;
      goto LABEL_88;
    }
    v33 = address;
    if (-[UMSyncService retrievePasscodeFromFileHandle:ofLength:withbaseaddress:](self, "retrievePasscodeFromFileHandle:ofLength:withbaseaddress:", v11, a5, address))
    {
      if (qword_1000E0160 != -1)
        dispatch_once(&qword_1000E0160, &stru_1000D1B68);
      v35 = (id)qword_1000E0158;
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v67 = 0;
        v36 = sub_100007750(1);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          v37 = v36;
        else
          v37 = v36 & 0xFFFFFFFE;
        if ((_DWORD)v37)
        {
          v66 = 0;
          v38 = (const char *)_os_log_send_and_compose_impl(v37, &v67, 0, 0);
          v39 = (char *)v38;
          if (v38)
            sub_100007780(v38);
        }
        else
        {
          v39 = 0;
        }
        free(v39);
      }

      v53 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 5, 0));
      v54 = (void *)v70[5];
      v70[5] = v53;

      v55 = mach_task_self_;
      v56 = address;
      v57 = vm_page_size;
      if (vm_page_size >= a5)
        v58 = a5;
      else
        v58 = vm_page_size;
      memset_s((void *)address, v58, 0, v58);
      vm_deallocate(v55, v56, v57);
      goto LABEL_88;
    }
  }
  else
  {
    v33 = 0;
  }
  v40 = qword_1000E0320;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100068DB4;
  block[3] = &unk_1000D17D8;
  v64 = v33;
  v65 = a5;
  v60 = v10;
  v61 = self;
  v62 = &v75;
  v63 = &v69;
  dispatch_sync(v40, block);
  v41 = address;
  if (address)
  {
    v42 = mach_task_self_;
    v43 = vm_page_size;
    if (vm_page_size >= a5)
      v44 = a5;
    else
      v44 = vm_page_size;
    memset_s((void *)address, v44, 0, v44);
    vm_deallocate(v42, v41, v43);
  }
  v12[2](v12, v76[5], v70[5]);
  if (qword_1000E0160 != -1)
    dispatch_once(&qword_1000E0160, &stru_1000D1B68);
  v45 = (id)qword_1000E0158;
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    v67 = 0;
    v46 = sub_100007750(1);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      v47 = v46;
    else
      v47 = v46 & 0xFFFFFFFE;
    if ((_DWORD)v47)
    {
      v66 = 0;
      v48 = (const char *)_os_log_send_and_compose_impl(v47, &v67, 0, 0);
      v49 = (char *)v48;
      if (v48)
        sub_100007780(v48);
    }
    else
    {
      v49 = 0;
    }
    free(v49);
  }

LABEL_89:
  _Block_object_dispose(&v69, 8);

  _Block_object_dispose(&v75, 8);
}

- (void)unloadUserSession:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  unsigned int v9;
  uint64_t v10;
  const char *v11;
  char *v12;
  NSObject *v13;
  unsigned int v14;
  uint64_t v15;
  const char *v16;
  char *v17;
  NSObject *v18;
  unsigned int v19;
  uint64_t v20;
  const char *v21;
  char *v22;
  uint64_t v23;
  void *v24;
  _QWORD block[5];
  __int16 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_100068D9C;
  v32 = sub_100068DAC;
  v33 = 0;
  if (qword_1000E0160 != -1)
    dispatch_once(&qword_1000E0160, &stru_1000D1B68);
  v8 = (id)qword_1000E0158;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v27 = 0;
    v9 = sub_100007750(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      v10 = v9;
    else
      v10 = v9 & 0xFFFFFFFE;
    if ((_DWORD)v10)
    {
      v26 = 0;
      v11 = (const char *)_os_log_send_and_compose_impl(v10, &v27, 0, 0);
      v12 = (char *)v11;
      if (v11)
        sub_100007780(v11);
    }
    else
    {
      v12 = 0;
    }
    free(v12);
  }

  if (-[UMSyncService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.mkb.usersession.load")))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100069480;
    block[3] = &unk_1000D1800;
    block[4] = &v28;
    dispatch_sync((dispatch_queue_t)qword_1000E0320, block);
    v7[2](v7, v29[5]);
    if (qword_1000E0160 != -1)
      dispatch_once(&qword_1000E0160, &stru_1000D1B68);
    v13 = (id)qword_1000E0158;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 0;
      v14 = sub_100007750(1);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        v15 = v14;
      else
        v15 = v14 & 0xFFFFFFFE;
      if ((_DWORD)v15)
      {
        v26 = 0;
        v16 = (const char *)_os_log_send_and_compose_impl(v15, &v27, 0, 0);
        v17 = (char *)v16;
        if (v16)
          sub_100007780(v16);
      }
      else
      {
        v17 = 0;
      }
      free(v17);
    }

  }
  else
  {
    if (qword_1000E0160 != -1)
      dispatch_once(&qword_1000E0160, &stru_1000D1B68);
    v18 = (id)qword_1000E0158;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 0;
      v19 = sub_100007750(1);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        v20 = v19;
      else
        v20 = v19 & 0xFFFFFFFE;
      if ((_DWORD)v20)
      {
        v26 = 0;
        v21 = (const char *)_os_log_send_and_compose_impl(v20, &v27, 0, 0);
        v22 = (char *)v21;
        if (v21)
          sub_100007780(v21);
      }
      else
      {
        v22 = 0;
      }
      free(v22);
    }

    v23 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    v24 = (void *)v29[5];
    v29[5] = v23;

    if (v7)
      v7[2](v7, v29[5]);
  }
  _Block_object_dispose(&v28, 8);

}

- (void)createUserSession:(id)a3 withSecret:(id)a4 oldSize:(unint64_t)a5 withOpaqueData:(id)a6 reply:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, uint64_t, uint64_t);
  NSObject *v16;
  unsigned int v17;
  uint64_t v18;
  const char *v19;
  char *v20;
  NSObject *v21;
  unsigned int v22;
  uint64_t v23;
  const char *v24;
  char *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  unsigned int v29;
  uint64_t v30;
  const char *v31;
  char *v32;
  NSObject *v33;
  unsigned int v34;
  uint64_t v35;
  const char *v36;
  char *v37;
  NSObject *v38;
  unsigned int v39;
  uint64_t v40;
  const char *v41;
  char *v42;
  uint64_t v43;
  void *v44;
  NSObject *v45;
  unsigned int v46;
  uint64_t v47;
  const char *v48;
  char *v49;
  NSObject *v50;
  unsigned int v51;
  uint64_t v52;
  const char *v53;
  char *v54;
  uint64_t v55;
  void *v56;
  vm_address_t v57;
  vm_map_t v58;
  vm_size_t v59;
  rsize_t v60;
  NSObject *v61;
  unsigned int v62;
  uint64_t v63;
  const char *v64;
  char *v65;
  uint64_t v66;
  void *v67;
  vm_map_t v68;
  vm_address_t v69;
  vm_size_t v70;
  rsize_t v71;
  _QWORD block[6];
  __int16 v73;
  uint64_t v74;
  vm_address_t address;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t (*v79)(uint64_t, uint64_t);
  void (*v80)(uint64_t);
  id v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t (*v85)(uint64_t, uint64_t);
  void (*v86)(uint64_t);
  id v87;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = (void (**)(id, uint64_t, uint64_t))a7;
  v82 = 0;
  v83 = &v82;
  v84 = 0x3032000000;
  v85 = sub_100068D9C;
  v86 = sub_100068DAC;
  v87 = 0;
  v76 = 0;
  v77 = &v76;
  v78 = 0x3032000000;
  v79 = sub_100068D9C;
  v80 = sub_100068DAC;
  v81 = 0;
  address = 0;
  if (qword_1000E0160 != -1)
    dispatch_once(&qword_1000E0160, &stru_1000D1B68);
  v16 = (id)qword_1000E0158;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v74 = 0;
    v17 = sub_100007750(1);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      v18 = v17;
    else
      v18 = v17 & 0xFFFFFFFE;
    if ((_DWORD)v18)
    {
      v73 = 0;
      v19 = (const char *)_os_log_send_and_compose_impl(v18, &v74, 0, 0);
      v20 = (char *)v19;
      if (v19)
        sub_100007780(v19);
    }
    else
    {
      v20 = 0;
    }
    free(v20);
  }

  if (-[UMSyncService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.mkb.usersession.load")))
  {
    if (vm_page_size >= a5)
    {
      if (a5)
      {
        if (qword_1000E0160 != -1)
          dispatch_once(&qword_1000E0160, &stru_1000D1B68);
        v33 = (id)qword_1000E0158;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          v74 = 0;
          v34 = sub_100007750(1);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            v35 = v34;
          else
            v35 = v34 & 0xFFFFFFFE;
          if ((_DWORD)v35)
          {
            v73 = 0;
            v36 = (const char *)_os_log_send_and_compose_impl(v35, &v74, 0, 0);
            v37 = (char *)v36;
            if (v36)
              sub_100007780(v36);
          }
          else
          {
            v37 = 0;
          }
          free(v37);
        }

        if (vm_allocate(mach_task_self_, &address, vm_page_size, -268435455))
        {
          if (qword_1000E0160 != -1)
            dispatch_once(&qword_1000E0160, &stru_1000D1B68);
          v45 = (id)qword_1000E0158;
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            v74 = 0;
            v46 = sub_100007750(1);
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
              v47 = v46;
            else
              v47 = v46 & 0xFFFFFFFE;
            if ((_DWORD)v47)
            {
              v73 = 0;
              v48 = (const char *)_os_log_send_and_compose_impl(v47, &v74, 0, 0);
              v49 = (char *)v48;
              if (v48)
                sub_100007780(v48);
            }
            else
            {
              v49 = 0;
            }
            free(v49);
          }

          v55 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
          v56 = (void *)v77[5];
          v77[5] = v55;

          address = 0;
          goto LABEL_110;
        }
        if (-[UMSyncService retrievePasscodeFromFileHandle:ofLength:withbaseaddress:](self, "retrievePasscodeFromFileHandle:ofLength:withbaseaddress:", v13, a5, address))
        {
          if (qword_1000E0160 != -1)
            dispatch_once(&qword_1000E0160, &stru_1000D1B68);
          v50 = (id)qword_1000E0158;
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            v74 = 0;
            v51 = sub_100007750(1);
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
              v52 = v51;
            else
              v52 = v51 & 0xFFFFFFFE;
            if ((_DWORD)v52)
            {
              v73 = 0;
              v53 = (const char *)_os_log_send_and_compose_impl(v52, &v74, 0, 0);
              v54 = (char *)v53;
              if (v53)
                sub_100007780(v53);
            }
            else
            {
              v54 = 0;
            }
            free(v54);
          }

          v66 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 5, 0));
          v67 = (void *)v77[5];
          v77[5] = v66;

          v68 = mach_task_self_;
          v69 = address;
          v70 = vm_page_size;
          if (vm_page_size >= a5)
            v71 = a5;
          else
            v71 = vm_page_size;
          memset_s((void *)address, v71, 0, v71);
          vm_deallocate(v68, v69, v70);
          goto LABEL_110;
        }
      }
      else
      {
        if (qword_1000E0160 != -1)
          dispatch_once(&qword_1000E0160, &stru_1000D1B68);
        v38 = (id)qword_1000E0158;
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          v74 = 0;
          v39 = sub_100007750(1);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            v40 = v39;
          else
            v40 = v39 & 0xFFFFFFFE;
          if ((_DWORD)v40)
          {
            v73 = 0;
            v41 = (const char *)_os_log_send_and_compose_impl(v40, &v74, 0, 0);
            v42 = (char *)v41;
            if (v41)
              sub_100007780(v41);
          }
          else
          {
            v42 = 0;
          }
          free(v42);
        }

      }
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100069FDC;
      block[3] = &unk_1000D1388;
      block[4] = &v82;
      block[5] = &v76;
      dispatch_sync((dispatch_queue_t)qword_1000E0320, block);
      v57 = address;
      if (address)
      {
        v58 = mach_task_self_;
        v59 = vm_page_size;
        if (vm_page_size >= a5)
          v60 = a5;
        else
          v60 = vm_page_size;
        memset_s((void *)address, v60, 0, v60);
        vm_deallocate(v58, v57, v59);
      }
      v15[2](v15, v83[5], v77[5]);
      if (qword_1000E0160 != -1)
        dispatch_once(&qword_1000E0160, &stru_1000D1B68);
      v61 = (id)qword_1000E0158;
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        v74 = 0;
        v62 = sub_100007750(1);
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
          v63 = v62;
        else
          v63 = v62 & 0xFFFFFFFE;
        if ((_DWORD)v63)
        {
          v73 = 0;
          v64 = (const char *)_os_log_send_and_compose_impl(v63, &v74, 0, 0);
          v65 = (char *)v64;
          if (v64)
            sub_100007780(v64);
        }
        else
        {
          v65 = 0;
        }
        free(v65);
      }

    }
    else
    {
      if (qword_1000E0160 != -1)
        dispatch_once(&qword_1000E0160, &stru_1000D1B68);
      v21 = (id)qword_1000E0158;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v74 = 0;
        v22 = sub_100007750(1);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          v23 = v22;
        else
          v23 = v22 & 0xFFFFFFFE;
        if ((_DWORD)v23)
        {
          v73 = 0;
          v24 = (const char *)_os_log_send_and_compose_impl(v23, &v74, 0, 0);
          v25 = (char *)v24;
          if (v24)
            sub_100007780(v24);
        }
        else
        {
          v25 = 0;
        }
        free(v25);
      }

      v43 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 7, 0));
      v44 = (void *)v77[5];
      v77[5] = v43;

      if (v15)
LABEL_110:
        v15[2](v15, 0, v77[5]);
    }
  }
  else
  {
    v26 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    v27 = (void *)v77[5];
    v77[5] = v26;

    if (qword_1000E0160 != -1)
      dispatch_once(&qword_1000E0160, &stru_1000D1B68);
    v28 = (id)qword_1000E0158;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v74 = 0;
      v29 = sub_100007750(1);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        v30 = v29;
      else
        v30 = v29 & 0xFFFFFFFE;
      if ((_DWORD)v30)
      {
        v73 = 0;
        v31 = (const char *)_os_log_send_and_compose_impl(v30, &v74, 0, 0);
        v32 = (char *)v31;
        if (v31)
          sub_100007780(v31);
      }
      else
      {
        v32 = 0;
      }
      free(v32);
    }

    if (v15)
      goto LABEL_110;
  }
  _Block_object_dispose(&v76, 8);

  _Block_object_dispose(&v82, 8);
}

- (void)dataMigrationSetup:(id)a3 withSecret:(id)a4 oldSize:(unint64_t)a5 reply:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD);
  NSObject *v13;
  unsigned int v14;
  uint64_t v15;
  const char *v16;
  char *v17;
  NSObject *v18;
  unsigned int v19;
  uint64_t v20;
  const char *v21;
  char *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  unsigned int v26;
  uint64_t v27;
  const char *v28;
  char *v29;
  NSObject *v30;
  unsigned int v31;
  uint64_t v32;
  const char *v33;
  char *v34;
  NSObject *v35;
  unsigned int v36;
  uint64_t v37;
  const char *v38;
  char *v39;
  uint64_t v40;
  void *v41;
  NSObject *v42;
  unsigned int v43;
  uint64_t v44;
  const char *v45;
  char *v46;
  vm_address_t v47;
  NSObject *v48;
  unsigned int v49;
  uint64_t v50;
  const char *v51;
  char *v52;
  uint64_t v53;
  void *v54;
  NSObject *v55;
  NSObject *v56;
  unsigned int v57;
  uint64_t v58;
  const char *v59;
  char *v60;
  uint64_t v61;
  void *v62;
  vm_map_t v63;
  vm_address_t v64;
  vm_size_t v65;
  rsize_t v66;
  _QWORD block[4];
  id v68;
  uint64_t *v69;
  vm_address_t v70;
  unint64_t v71;
  vm_address_t v72;
  __int16 v73;
  uint64_t v74;
  vm_address_t address;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t (*v79)(uint64_t, uint64_t);
  void (*v80)(uint64_t);
  id v81;

  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, _QWORD))a6;
  v76 = 0;
  v77 = &v76;
  v78 = 0x3032000000;
  v79 = sub_100068D9C;
  v80 = sub_100068DAC;
  v81 = 0;
  address = 0;
  if (qword_1000E0160 != -1)
    dispatch_once(&qword_1000E0160, &stru_1000D1B68);
  v13 = (id)qword_1000E0158;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v74 = 0;
    v14 = sub_100007750(1);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      v15 = v14;
    else
      v15 = v14 & 0xFFFFFFFE;
    if ((_DWORD)v15)
    {
      v73 = 0;
      v16 = (const char *)_os_log_send_and_compose_impl(v15, &v74, 0, 0);
      v17 = (char *)v16;
      if (v16)
        sub_100007780(v16);
    }
    else
    {
      v17 = 0;
    }
    free(v17);
  }

  if (-[UMSyncService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.mkb.usersession.migration")))
  {
    if (vm_page_size >= a5)
    {
      if (a5)
      {
        if (qword_1000E0160 != -1)
          dispatch_once(&qword_1000E0160, &stru_1000D1B68);
        v30 = (id)qword_1000E0158;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          v74 = 0;
          v31 = sub_100007750(1);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            v32 = v31;
          else
            v32 = v31 & 0xFFFFFFFE;
          if ((_DWORD)v32)
          {
            v73 = 0;
            v33 = (const char *)_os_log_send_and_compose_impl(v32, &v74, 0, 0);
            v34 = (char *)v33;
            if (v33)
              sub_100007780(v33);
          }
          else
          {
            v34 = 0;
          }
          free(v34);
        }

        if (vm_allocate(mach_task_self_, &address, vm_page_size, -268435455))
        {
          if (qword_1000E0160 != -1)
            dispatch_once(&qword_1000E0160, &stru_1000D1B68);
          v42 = (id)qword_1000E0158;
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            v74 = 0;
            v43 = sub_100007750(1);
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
              v44 = v43;
            else
              v44 = v43 & 0xFFFFFFFE;
            if ((_DWORD)v44)
            {
              v73 = 0;
              v45 = (const char *)_os_log_send_and_compose_impl(v44, &v74, 0, 0);
              v46 = (char *)v45;
              if (v45)
                sub_100007780(v45);
            }
            else
            {
              v46 = 0;
            }
            free(v46);
          }

          v53 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
          v54 = (void *)v77[5];
          v77[5] = v53;

          address = 0;
          goto LABEL_105;
        }
        v47 = address;
        if (-[UMSyncService retrievePasscodeFromFileHandle:ofLength:withbaseaddress:](self, "retrievePasscodeFromFileHandle:ofLength:withbaseaddress:", v11, a5, address))
        {
          if (qword_1000E0160 != -1)
            dispatch_once(&qword_1000E0160, &stru_1000D1B68);
          v48 = (id)qword_1000E0158;
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            v74 = 0;
            v49 = sub_100007750(1);
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
              v50 = v49;
            else
              v50 = v49 & 0xFFFFFFFE;
            if ((_DWORD)v50)
            {
              v73 = 0;
              v51 = (const char *)_os_log_send_and_compose_impl(v50, &v74, 0, 0);
              v52 = (char *)v51;
              if (v51)
                sub_100007780(v51);
            }
            else
            {
              v52 = 0;
            }
            free(v52);
          }

          v61 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 5, 0));
          v62 = (void *)v77[5];
          v77[5] = v61;

          v63 = mach_task_self_;
          v64 = address;
          v65 = vm_page_size;
          if (vm_page_size >= a5)
            v66 = a5;
          else
            v66 = vm_page_size;
          memset_s((void *)address, v66, 0, v66);
          vm_deallocate(v63, v64, v65);
          goto LABEL_105;
        }
      }
      else
      {
        if (qword_1000E0160 != -1)
          dispatch_once(&qword_1000E0160, &stru_1000D1B68);
        v35 = (id)qword_1000E0158;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          v74 = 0;
          v36 = sub_100007750(1);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            v37 = v36;
          else
            v37 = v36 & 0xFFFFFFFE;
          if ((_DWORD)v37)
          {
            v73 = 0;
            v38 = (const char *)_os_log_send_and_compose_impl(v37, &v74, 0, 0);
            v39 = (char *)v38;
            if (v38)
              sub_100007780(v38);
          }
          else
          {
            v39 = 0;
          }
          free(v39);
        }

        v47 = 0;
      }
      v55 = qword_1000E0320;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10006ABF4;
      block[3] = &unk_1000D1828;
      v70 = v47;
      v71 = a5;
      v68 = v10;
      v69 = &v76;
      v72 = address;
      dispatch_sync(v55, block);
      v12[2](v12, v77[5]);
      if (qword_1000E0160 != -1)
        dispatch_once(&qword_1000E0160, &stru_1000D1B68);
      v56 = (id)qword_1000E0158;
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        v74 = 0;
        v57 = sub_100007750(1);
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
          v58 = v57;
        else
          v58 = v57 & 0xFFFFFFFE;
        if ((_DWORD)v58)
        {
          v73 = 0;
          v59 = (const char *)_os_log_send_and_compose_impl(v58, &v74, 0, 0);
          v60 = (char *)v59;
          if (v59)
            sub_100007780(v59);
        }
        else
        {
          v60 = 0;
        }
        free(v60);
      }

    }
    else
    {
      if (qword_1000E0160 != -1)
        dispatch_once(&qword_1000E0160, &stru_1000D1B68);
      v18 = (id)qword_1000E0158;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v74 = 0;
        v19 = sub_100007750(1);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          v20 = v19;
        else
          v20 = v19 & 0xFFFFFFFE;
        if ((_DWORD)v20)
        {
          v73 = 0;
          v21 = (const char *)_os_log_send_and_compose_impl(v20, &v74, 0, 0);
          v22 = (char *)v21;
          if (v21)
            sub_100007780(v21);
        }
        else
        {
          v22 = 0;
        }
        free(v22);
      }

      v40 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 7, 0));
      v41 = (void *)v77[5];
      v77[5] = v40;

      if (v12)
LABEL_105:
        v12[2](v12, v77[5]);
    }
  }
  else
  {
    v23 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    v24 = (void *)v77[5];
    v77[5] = v23;

    if (qword_1000E0160 != -1)
      dispatch_once(&qword_1000E0160, &stru_1000D1B68);
    v25 = (id)qword_1000E0158;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v74 = 0;
      v26 = sub_100007750(1);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        v27 = v26;
      else
        v27 = v26 & 0xFFFFFFFE;
      if ((_DWORD)v27)
      {
        v73 = 0;
        v28 = (const char *)_os_log_send_and_compose_impl(v27, &v74, 0, 0);
        v29 = (char *)v28;
        if (v28)
          sub_100007780(v28);
      }
      else
      {
        v29 = 0;
      }
      free(v29);
    }

    if (v12)
      goto LABEL_105;
  }
  _Block_object_dispose(&v76, 8);

}

- (void)migrateSharedAndPrimaryUserVolumeWithReply:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  unsigned int v6;
  uint64_t v7;
  const char *v8;
  char *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  unsigned int v13;
  uint64_t v14;
  const char *v15;
  char *v16;
  NSObject *v17;
  unsigned int v18;
  uint64_t v19;
  const char *v20;
  char *v21;
  const void *v22;
  NSObject *v23;
  unsigned int v24;
  uint64_t v25;
  const char *v26;
  char *v27;
  _QWORD v28[6];
  __int16 v29;
  uint64_t v30;
  _QWORD block[7];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;

  v4 = (void (**)(id, _QWORD))a3;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = sub_100068D9C;
  v44 = sub_100068DAC;
  v45 = 0;
  if (qword_1000E0160 != -1)
    dispatch_once(&qword_1000E0160, &stru_1000D1B68);
  v5 = (id)qword_1000E0158;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v36 = 0;
    v6 = sub_100007750(1);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      v7 = v6;
    else
      v7 = v6 & 0xFFFFFFFE;
    if ((_DWORD)v7)
    {
      LOWORD(v32) = 0;
      v8 = (const char *)_os_log_send_and_compose_impl(v7, &v36, 0, 0);
      v9 = (char *)v8;
      if (v8)
        sub_100007780(v8);
    }
    else
    {
      v9 = 0;
    }
    free(v9);
  }

  if (-[UMSyncService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.mkb.usersession.migration")))
  {
    v36 = 0;
    v37 = &v36;
    v38 = 0x2020000000;
    v39 = 0;
    v32 = 0;
    v33 = &v32;
    v34 = 0x2020000000;
    v35 = 0;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006B238;
    block[3] = &unk_1000D1850;
    block[4] = &v36;
    block[5] = &v32;
    block[6] = &v40;
    dispatch_sync((dispatch_queue_t)qword_1000E0320, block);
    if (*((_BYTE *)v33 + 24))
    {
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_10006B708;
      v28[3] = &unk_1000D1388;
      v28[4] = &v36;
      v28[5] = &v40;
      dispatch_sync((dispatch_queue_t)qword_1000E0338, v28);
    }
    else
    {
      if (qword_1000E0160 != -1)
        dispatch_once(&qword_1000E0160, &stru_1000D1B68);
      v17 = (id)qword_1000E0158;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v30 = 0;
        v18 = sub_100007750(1);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          v19 = v18;
        else
          v19 = v18 & 0xFFFFFFFE;
        if ((_DWORD)v19)
        {
          v29 = 0;
          v20 = (const char *)_os_log_send_and_compose_impl(v19, &v30, 0, 0);
          v21 = (char *)v20;
          if (v20)
            sub_100007780(v20);
        }
        else
        {
          v21 = 0;
        }
        free(v21);
      }

    }
    if (*((_BYTE *)v33 + 24))
    {
      v22 = (const void *)v37[3];
      if (v22)
      {
        CFRelease(v22);
        v37[3] = 0;
      }
    }
    v4[2](v4, v41[5]);
    if (qword_1000E0160 != -1)
      dispatch_once(&qword_1000E0160, &stru_1000D1B68);
    v23 = (id)qword_1000E0158;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v30 = 0;
      v24 = sub_100007750(1);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        v25 = v24;
      else
        v25 = v24 & 0xFFFFFFFE;
      if ((_DWORD)v25)
      {
        v29 = 0;
        v26 = (const char *)_os_log_send_and_compose_impl(v25, &v30, 0, 0);
        v27 = (char *)v26;
        if (v26)
          sub_100007780(v26);
      }
      else
      {
        v27 = 0;
      }
      free(v27);
    }

    _Block_object_dispose(&v32, 8);
    _Block_object_dispose(&v36, 8);
  }
  else
  {
    v10 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    v11 = (void *)v41[5];
    v41[5] = v10;

    if (qword_1000E0160 != -1)
      dispatch_once(&qword_1000E0160, &stru_1000D1B68);
    v12 = (id)qword_1000E0158;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v36 = 0;
      v13 = sub_100007750(1);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        v14 = v13;
      else
        v14 = v13 & 0xFFFFFFFE;
      if ((_DWORD)v14)
      {
        LOWORD(v32) = 0;
        v15 = (const char *)_os_log_send_and_compose_impl(v14, &v36, 0, 0);
        v16 = (char *)v15;
        if (v15)
          sub_100007780(v15);
      }
      else
      {
        v16 = 0;
      }
      free(v16);
    }

    if (v4)
      v4[2](v4, v41[5]);
  }
  _Block_object_dispose(&v40, 8);

}

- (void)migrateGuestUserVolume:(id)a3 withReply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  unsigned int v9;
  uint64_t v10;
  const char *v11;
  char *v12;
  void *v13;
  id v14;
  unsigned int v15;
  void *v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  const void *v20;
  NSObject *v21;
  uint64_t *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  unsigned int v26;
  uint64_t v27;
  const char *v28;
  char *v29;
  unsigned int v30;
  uint64_t v31;
  const char *v32;
  char *v33;
  NSObject *v34;
  unsigned int v35;
  uint64_t v36;
  const char *v37;
  char *v38;
  uint64_t v39;
  _QWORD v40[4];
  NSObject *v41;
  uint64_t *v42;
  uint64_t *v43;
  _QWORD block[4];
  id v45;
  uint64_t *v46;
  uint64_t *v47;
  uint64_t *v48;
  unsigned int v49;
  int v50;
  int v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  if (qword_1000E0160 != -1)
    dispatch_once(&qword_1000E0160, &stru_1000D1B68);
  v8 = (id)qword_1000E0158;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v61 = 0;
    v9 = sub_100007750(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      v10 = v9;
    else
      v10 = v9 & 0xFFFFFFFE;
    if ((_DWORD)v10)
    {
      LOWORD(v56) = 0;
      v11 = (const char *)_os_log_send_and_compose_impl(v10, &v61, 0, 0);
      v12 = (char *)v11;
      if (v11)
        sub_100007780(v11);
    }
    else
    {
      v12 = 0;
    }
    free(v12);
  }

  v61 = 0;
  v62 = &v61;
  v63 = 0x3032000000;
  v64 = sub_100068D9C;
  v65 = sub_100068DAC;
  v66 = 0;
  v60 = -1;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.mkb.usersession.migration")))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
    v14 = objc_msgSend(v13, "processIdentifier");

    v15 = -[UMSyncService asidForClient:withAuid:withPid:](self, "asidForClient:withAuid:withPid:", 0, &v60, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
    LODWORD(v13) = sub_100004BCC((uint64_t)objc_msgSend(v16, "processIdentifier"));

    v56 = 0;
    v57 = &v56;
    v58 = 0x2020000000;
    v59 = 0;
    v52 = 0;
    v53 = &v52;
    v54 = 0x2020000000;
    v55 = 0;
    v17 = qword_1000E0320;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006C05C;
    block[3] = &unk_1000D1878;
    v49 = v15;
    v50 = v60;
    v51 = (int)v13;
    v46 = &v56;
    v18 = v6;
    v45 = v18;
    v47 = &v61;
    v48 = &v52;
    dispatch_sync(v17, block);
    if (*((_BYTE *)v53 + 24))
    {
      v19 = qword_1000E0338;
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_10006C114;
      v40[3] = &unk_1000D18A0;
      v41 = v18;
      v42 = &v56;
      v43 = &v61;
      dispatch_sync(v19, v40);
      v20 = (const void *)v57[3];
      if (v20)
      {
        CFRelease(v20);
        v57[3] = 0;
      }
      v21 = v41;
      v22 = &qword_1000E0000;
    }
    else
    {
      v22 = &qword_1000E0000;
      if (qword_1000E0160 != -1)
        dispatch_once(&qword_1000E0160, &stru_1000D1B68);
      v21 = (id)qword_1000E0158;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v39 = 0;
        v30 = sub_100007750(1);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          v31 = v30;
        else
          v31 = v30 & 0xFFFFFFFE;
        if ((_DWORD)v31)
        {
          v32 = (const char *)_os_log_send_and_compose_impl(v31, &v39, 0, 0);
          v33 = (char *)v32;
          if (v32)
            sub_100007780(v32);
        }
        else
        {
          v33 = 0;
        }
        free(v33);
      }
    }

    if (v22[44] != -1)
      dispatch_once(&qword_1000E0160, &stru_1000D1B68);
    v34 = (id)qword_1000E0158;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v39 = 0;
      v35 = sub_100007750(1);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        v36 = v35;
      else
        v36 = v35 & 0xFFFFFFFE;
      if ((_DWORD)v36)
      {
        v37 = (const char *)_os_log_send_and_compose_impl(v36, &v39, 0, 0);
        v38 = (char *)v37;
        if (v37)
          sub_100007780(v37);
      }
      else
      {
        v38 = 0;
      }
      free(v38);
    }

    v7[2](v7, v62[5]);
    _Block_object_dispose(&v52, 8);
    _Block_object_dispose(&v56, 8);
  }
  else
  {
    v23 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    v24 = (void *)v62[5];
    v62[5] = v23;

    if (qword_1000E0160 != -1)
      dispatch_once(&qword_1000E0160, &stru_1000D1B68);
    v25 = (id)qword_1000E0158;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v56 = 0;
      v26 = sub_100007750(1);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        v27 = v26;
      else
        v27 = v26 & 0xFFFFFFFE;
      if ((_DWORD)v27)
      {
        LOWORD(v52) = 0;
        v28 = (const char *)_os_log_send_and_compose_impl(v27, &v56, 0, 0);
        v29 = (char *)v28;
        if (v28)
          sub_100007780(v28);
      }
      else
      {
        v29 = 0;
      }
      free(v29);
    }

    if (v7)
      v7[2](v7, v62[5]);
  }
  _Block_object_dispose(&v61, 8);

}

- (void)removeUserSession:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  unsigned int v9;
  uint64_t v10;
  const char *v11;
  char *v12;
  NSObject *v13;
  NSObject *v14;
  unsigned int v15;
  uint64_t v16;
  const char *v17;
  char *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  unsigned int v22;
  uint64_t v23;
  const char *v24;
  char *v25;
  _QWORD block[4];
  id v27;
  uint64_t *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = sub_100068D9C;
  v35 = sub_100068DAC;
  v36 = 0;
  if (qword_1000E0160 != -1)
    dispatch_once(&qword_1000E0160, &stru_1000D1B68);
  v8 = (id)qword_1000E0158;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v30 = 0;
    v9 = sub_100007750(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      v10 = v9;
    else
      v10 = v9 & 0xFFFFFFFE;
    if ((_DWORD)v10)
    {
      v29 = 0;
      v11 = (const char *)_os_log_send_and_compose_impl(v10, &v30, 0, 0);
      v12 = (char *)v11;
      if (v11)
        sub_100007780(v11);
    }
    else
    {
      v12 = 0;
    }
    free(v12);
  }

  if (-[UMSyncService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.mkb.usersession.delete")))
  {
    v13 = qword_1000E0320;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006CA70;
    block[3] = &unk_1000D18C8;
    v27 = v6;
    v28 = &v31;
    dispatch_sync(v13, block);
    v7[2](v7, v32[5]);
    if (qword_1000E0160 != -1)
      dispatch_once(&qword_1000E0160, &stru_1000D1B68);
    v14 = (id)qword_1000E0158;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v30 = 0;
      v15 = sub_100007750(1);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        v16 = v15;
      else
        v16 = v15 & 0xFFFFFFFE;
      if ((_DWORD)v16)
      {
        v29 = 0;
        v17 = (const char *)_os_log_send_and_compose_impl(v16, &v30, 0, 0);
        v18 = (char *)v17;
        if (v17)
          sub_100007780(v17);
      }
      else
      {
        v18 = 0;
      }
      free(v18);
    }

  }
  else
  {
    v19 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    v20 = (void *)v32[5];
    v32[5] = v19;

    if (qword_1000E0160 != -1)
      dispatch_once(&qword_1000E0160, &stru_1000D1B68);
    v21 = (id)qword_1000E0158;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v30 = 0;
      v22 = sub_100007750(1);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        v23 = v22;
      else
        v23 = v22 & 0xFFFFFFFE;
      if ((_DWORD)v23)
      {
        v29 = 0;
        v24 = (const char *)_os_log_send_and_compose_impl(v23, &v30, 0, 0);
        v25 = (char *)v24;
        if (v24)
          sub_100007780(v24);
      }
      else
      {
        v25 = 0;
      }
      free(v25);
    }

    if (v7)
      v7[2](v7, v32[5]);
  }
  _Block_object_dispose(&v31, 8);

}

- (void)listAllUserSessionIDsWithAReply:(id)a3
{
  void (**v4)(id, void *, void *);
  NSObject *v5;
  unsigned int v6;
  uint64_t v7;
  const char *v8;
  char *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  unsigned int v13;
  uint64_t v14;
  const char *v15;
  char *v16;
  NSObject *v17;
  unsigned int v18;
  uint64_t v19;
  const char *v20;
  char *v21;
  uint64_t v22;

  v4 = (void (**)(id, void *, void *))a3;
  if (qword_1000E0160 != -1)
    dispatch_once(&qword_1000E0160, &stru_1000D1B68);
  v5 = (id)qword_1000E0158;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 0;
    v6 = sub_100007750(1);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      v7 = v6;
    else
      v7 = v6 & 0xFFFFFFFE;
    if ((_DWORD)v7)
    {
      v8 = (const char *)_os_log_send_and_compose_impl(v7, &v22, 0, 0);
      v9 = (char *)v8;
      if (v8)
        sub_100007780(v8);
    }
    else
    {
      v9 = 0;
    }
    free(v9);
  }

  if (-[UMSyncService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.mkb.usersession.info")))
  {
    v10 = (void *)sub_10001DB08();
    if (v10)
      v11 = 0;
    else
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 5, 0));
    v4[2](v4, v10, v11);
    if (qword_1000E0160 != -1)
      dispatch_once(&qword_1000E0160, &stru_1000D1B68);
    v17 = (id)qword_1000E0158;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 0;
      v18 = sub_100007750(1);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        v19 = v18;
      else
        v19 = v18 & 0xFFFFFFFE;
      if ((_DWORD)v19)
      {
        v20 = (const char *)_os_log_send_and_compose_impl(v19, &v22, 0, 0);
        v21 = (char *)v20;
        if (v20)
          sub_100007780(v20);
      }
      else
      {
        v21 = 0;
      }
      free(v21);
    }

  }
  else
  {
    if (qword_1000E0160 != -1)
      dispatch_once(&qword_1000E0160, &stru_1000D1B68);
    v12 = (id)qword_1000E0158;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 0;
      v13 = sub_100007750(1);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        v14 = v13;
      else
        v14 = v13 & 0xFFFFFFFE;
      if ((_DWORD)v14)
      {
        v15 = (const char *)_os_log_send_and_compose_impl(v14, &v22, 0, 0);
        v16 = (char *)v15;
        if (v15)
          sub_100007780(v15);
      }
      else
      {
        v16 = 0;
      }
      free(v16);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    if (v4)
      v4[2](v4, 0, v11);
  }

}

- (void)retrieveUserSessionBlobwithReply:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_100068D9C;
  v19 = sub_100068DAC;
  v20 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_100068D9C;
  v13 = sub_100068DAC;
  v14 = 0;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.mkb.usersession.retrieve")))
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10006D078;
    v8[3] = &unk_1000D1388;
    v8[4] = &v9;
    v8[5] = &v15;
    dispatch_sync((dispatch_queue_t)qword_1000E0320, v8);
    v5 = v10[5];
LABEL_5:
    v4[2](v4, v5, v16[5]);
    goto LABEL_6;
  }
  v6 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
  v7 = (void *)v16[5];
  v16[5] = v6;

  if (v4)
  {
    v5 = 0;
    goto LABEL_5;
  }
LABEL_6:
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
}

- (void)deleteUserSessionBlobwithReply:(id)a3
{
  void (**v4)(id, _QWORD);
  uint64_t v5;
  void *v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  _QWORD v14[3];
  int v15;

  v4 = (void (**)(id, _QWORD))a3;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v15 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_100068D9C;
  v12 = sub_100068DAC;
  v13 = 0;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.mkb.usersession.retrieve")))
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10006D45C;
    v7[3] = &unk_1000D1388;
    v7[4] = v14;
    v7[5] = &v8;
    dispatch_sync((dispatch_queue_t)qword_1000E0320, v7);
LABEL_4:
    v4[2](v4, v9[5]);
    goto LABEL_5;
  }
  v5 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
  v6 = (void *)v9[5];
  v9[5] = v5;

  if (v4)
    goto LABEL_4;
LABEL_5:
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(v14, 8);
}

- (void)switchToUserSession:(id)a3 withOpaqueData:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  NSObject *v11;
  uint64_t v12;
  void *v13;
  _QWORD block[4];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_100068D9C;
  v22 = sub_100068DAC;
  v23 = 0;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.mkb.usersession.switch")))
  {
    v11 = qword_1000E0320;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006D938;
    block[3] = &unk_1000D18F0;
    v17 = &v18;
    v15 = v8;
    v16 = v9;
    dispatch_sync(v11, block);
    v10[2](v10, v19[5]);

  }
  else
  {
    v12 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    v13 = (void *)v19[5];
    v19[5] = v12;

    if (v10)
      v10[2](v10, v19[5]);
  }
  _Block_object_dispose(&v18, 8);

}

- (void)setUserSessionSecureBackupBlob:(id)a3 withReply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  unsigned int v12;
  uint64_t v13;
  const char *v14;
  char *v15;
  _QWORD block[4];
  id v17;
  uint64_t *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_100068D9C;
  v25 = sub_100068DAC;
  v26 = 0;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.mkb.usersession.securebackup")))
  {
    v8 = qword_1000E0320;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006DF3C;
    block[3] = &unk_1000D18C8;
    v17 = v6;
    v18 = &v21;
    dispatch_sync(v8, block);
    v7[2](v7, v22[5]);

  }
  else
  {
    v9 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    v10 = (void *)v22[5];
    v22[5] = v9;

    if (qword_1000E0160 != -1)
      dispatch_once(&qword_1000E0160, &stru_1000D1B68);
    v11 = (id)qword_1000E0158;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 0;
      v12 = sub_100007750(1);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        v13 = v12;
      else
        v13 = v12 & 0xFFFFFFFE;
      if ((_DWORD)v13)
      {
        v19 = 0;
        v14 = (const char *)_os_log_send_and_compose_impl(v13, &v20, 0, 0);
        v15 = (char *)v14;
        if (v14)
          sub_100007780(v14);
      }
      else
      {
        v15 = 0;
      }
      free(v15);
    }

    if (v7)
      v7[2](v7, v22[5]);
  }
  _Block_object_dispose(&v21, 8);

}

- (void)setUserKeybagOpaqueData:(id)a3 keybagBlob:(id)a4 withReply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  NSObject *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD *v17;
  uint64_t *v18;
  _QWORD v19[3];
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_100068D9C;
  v25 = sub_100068DAC;
  v26 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v20 = 0;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.mkb.usersession.keybagopaquedata")))
  {
    v11 = qword_1000E0320;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10006E3B4;
    v14[3] = &unk_1000D1918;
    v17 = v19;
    v15 = v8;
    v16 = v9;
    v18 = &v21;
    dispatch_sync(v11, v14);
    v10[2](v10, v22[5]);

  }
  else
  {
    v12 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    v13 = (void *)v22[5];
    v22[5] = v12;

    if (v10)
      v10[2](v10, v22[5]);
  }
  _Block_object_dispose(v19, 8);
  _Block_object_dispose(&v21, 8);

}

- (void)userKeybagOpaqueData:(id)a3 KeybagBlobwithReply:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, uint64_t);
  NSObject *v8;
  uint64_t v9;
  void *v10;
  _QWORD block[4];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, uint64_t))a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_100068D9C;
  v25 = sub_100068DAC;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_100068D9C;
  v19 = sub_100068DAC;
  v20 = 0;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.mkb.usersession.keybagopaquedata"))|| -[UMSyncService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.keystore.device")))
  {
    v8 = qword_1000E0320;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006E7EC;
    block[3] = &unk_1000D1940;
    v13 = &v15;
    v12 = v6;
    v14 = &v21;
    dispatch_sync(v8, block);
    v7[2](v7, v16[5], v22[5]);

  }
  else
  {
    v9 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    v10 = (void *)v22[5];
    v22[5] = v9;

    if (v7)
      v7[2](v7, v16[5], v22[5]);
  }
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
}

- (void)retrieveUserSessionSecureBackupBlobwithReply:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_100068D9C;
  v19 = sub_100068DAC;
  v20 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_100068D9C;
  v13 = sub_100068DAC;
  v14 = 0;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.mkb.usersession.securebackup")))
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10006EBDC;
    v8[3] = &unk_1000D1388;
    v8[4] = &v9;
    v8[5] = &v15;
    dispatch_sync((dispatch_queue_t)qword_1000E0320, v8);
    v5 = v10[5];
LABEL_5:
    v4[2](v4, v5, v16[5]);
    goto LABEL_6;
  }
  v6 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
  v7 = (void *)v16[5];
  v16[5] = v6;

  if (v4)
  {
    v5 = 0;
    goto LABEL_5;
  }
LABEL_6:
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
}

- (void)deleteUserSessionSecureBlobwithReply:(id)a3
{
  void (**v4)(id, _QWORD);
  uint64_t v5;
  void *v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  _QWORD v14[3];
  int v15;

  v4 = (void (**)(id, _QWORD))a3;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v15 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_100068D9C;
  v12 = sub_100068DAC;
  v13 = 0;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.mkb.usersession.securebackup")))
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10006EFC0;
    v7[3] = &unk_1000D1388;
    v7[4] = v14;
    v7[5] = &v8;
    dispatch_sync((dispatch_queue_t)qword_1000E0320, v7);
LABEL_4:
    v4[2](v4, v9[5]);
    goto LABEL_5;
  }
  v5 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
  v6 = (void *)v9[5];
  v9[5] = v5;

  if (v4)
    goto LABEL_4;
LABEL_5:
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(v14, 8);
}

- (void)setUserSessionAttributes:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, uint64_t);
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  _QWORD block[4];
  id v14;
  UMSyncService *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, uint64_t))a4;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = sub_100068D9C;
  v35 = sub_100068DAC;
  v36 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_100068D9C;
  v29 = sub_100068DAC;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_100068D9C;
  v23 = sub_100068DAC;
  v24 = 0;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.mkb.usersession.info")))
  {
    if (v6)
    {
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", kUMUserSessionIDKey));
      v9 = (void *)v20[5];
      v20[5] = v8;

    }
    v10 = qword_1000E0320;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006F6AC;
    block[3] = &unk_1000D1990;
    v14 = v6;
    v15 = self;
    v16 = &v31;
    v17 = &v25;
    v18 = &v19;
    dispatch_sync(v10, block);
    v7[2](v7, v32[5], v26[5]);

  }
  else
  {
    v11 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    v12 = (void *)v26[5];
    v26[5] = v11;

    if (v7)
      v7[2](v7, 0, v26[5]);
  }
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

}

- (void)foregroundUserSessionAttributesWithReply:(id)a3
{
  void (**v4)(id, uint64_t, uint64_t);
  _QWORD block[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = (void (**)(id, uint64_t, uint64_t))a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_100068D9C;
  v16 = sub_100068DAC;
  v17 = 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_100068D9C;
  v10 = sub_100068DAC;
  v11 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006FA6C;
  block[3] = &unk_1000D1940;
  block[4] = self;
  block[5] = &v6;
  block[6] = &v12;
  dispatch_sync((dispatch_queue_t)qword_1000E0320, block);
  v4[2](v4, v7[5], v13[5]);
  _Block_object_dispose(&v6, 8);

  _Block_object_dispose(&v12, 8);
}

- (void)configureLoginUIWithUserSessionCount:(int)a3 reply:(id)a4
{
  void (**v6)(id, uint64_t, uint64_t);
  NSObject *v7;
  unsigned int v8;
  uint64_t v9;
  const char *v10;
  char *v11;
  uint64_t v12;
  NSObject *v13;
  unsigned int v14;
  uint64_t v15;
  const char *v16;
  char *v17;
  void *v18;
  _QWORD block[7];
  int v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v6 = (void (**)(id, uint64_t, uint64_t))a4;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = sub_100068D9C;
  v33 = sub_100068DAC;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_100068D9C;
  v27 = sub_100068DAC;
  v28 = 0;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.mkb.usersession.loginwindow")))
  {
    if (!_os_feature_enabled_impl("UserManagement", "LocalUserEnrollment"))
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100070034;
      block[3] = &unk_1000D19B8;
      v20 = a3;
      block[5] = &v29;
      block[6] = &v23;
      block[4] = self;
      dispatch_sync((dispatch_queue_t)qword_1000E0320, block);
      v6[2](v6, v24[5], v30[5]);
      goto LABEL_30;
    }
    if (qword_1000E0160 != -1)
      dispatch_once(&qword_1000E0160, &stru_1000D1B68);
    v7 = (id)qword_1000E0158;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 0;
      v8 = sub_100007750(1);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        v9 = v8;
      else
        v9 = v8 & 0xFFFFFFFE;
      if ((_DWORD)v9)
      {
        v21 = 0;
        v10 = (const char *)_os_log_send_and_compose_impl(v9, &v22, 0, 0);
        v11 = (char *)v10;
        if (v10)
          sub_100007780(v10);
      }
      else
      {
        v11 = 0;
      }
      free(v11);
    }

    if (qword_1000E0170 != -1)
      dispatch_once(&qword_1000E0170, &stru_1000D1B88);
    v13 = (id)qword_1000E0168;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v22 = 0;
      v14 = sub_100007750(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        v15 = v14;
      else
        v15 = v14 & 0xFFFFFFFE;
      if ((_DWORD)v15)
      {
        v21 = 0;
        v16 = (const char *)_os_log_send_and_compose_impl(v15, &v22, 0, 0);
        v17 = (char *)v16;
        if (v16)
          sub_100007780(v16);
      }
      else
      {
        v17 = 0;
      }
      free(v17);
    }

    v12 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 45, 0));
  }
  else
  {
    v12 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
  }
  v18 = (void *)v30[5];
  v30[5] = v12;

  if (v6)
    v6[2](v6, 0, v30[5]);
LABEL_30:
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
}

- (void)switchToLoginUIUserSessionWithReply:(id)a3
{
  int v4;
  void *v5;
  void (**v6)(id, void *);
  void (**v7)(id, void *);

  v7 = (void (**)(id, void *))a3;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.mkb.usersession.loginwindow")))
  {
    v4 = sub_10002D82C();
    if (v4)
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v4, 0));
    else
      v5 = 0;
    v6 = v7;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    v6 = v7;
    if (!v7)
      goto LABEL_9;
  }
  v6[2](v6, v5);
LABEL_9:

}

- (void)addSyncServiceSource:(id)a3 toUserSession:(int)a4 withReply:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  NSObject *v10;
  uint64_t v11;
  void *v12;
  _QWORD block[4];
  id v14;
  uint64_t *v15;
  int v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  int v20;

  v8 = a3;
  v9 = (void (**)(id, void *))a5;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = -1;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.mkb.usersession.synctest")))
  {
    v10 = qword_1000E0320;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000706E4;
    block[3] = &unk_1000D19E0;
    v16 = a4;
    v14 = v8;
    v15 = &v17;
    dispatch_sync(v10, block);
    v11 = *((int *)v18 + 6);
    if ((_DWORD)v11)
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v11, 0));
    else
      v12 = 0;
    v9[2](v9, v12);

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    if (v9)
      v9[2](v9, v12);
  }
  _Block_object_dispose(&v17, 8);

}

- (void)removeSyncServiceSource:(id)a3 toUserSession:(int)a4 withReply:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  NSObject *v10;
  uint64_t v11;
  void *v12;
  _QWORD block[4];
  id v14;
  uint64_t *v15;
  int v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  int v20;

  v8 = a3;
  v9 = (void (**)(id, void *))a5;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = -1;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.mkb.usersession.synctest")))
  {
    v10 = qword_1000E0320;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100070AE4;
    block[3] = &unk_1000D19E0;
    v16 = a4;
    v14 = v8;
    v15 = &v17;
    dispatch_sync(v10, block);
    v11 = *((int *)v18 + 6);
    if ((_DWORD)v11)
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v11, 0));
    else
      v12 = 0;
    v9[2](v9, v12);

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    if (v9)
      v9[2](v9, v12);
  }
  _Block_object_dispose(&v17, 8);

}

- (void)startUserSyncBubble:(int)a3 withReply:(id)a4
{
  void (**v6)(id, void *);
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  int v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  v6 = (void (**)(id, void *))a4;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = -1;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.mkb.usersession.synctest")))
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100070EC4;
    v9[3] = &unk_1000D1480;
    v10 = a3;
    v9[4] = &v11;
    dispatch_sync((dispatch_queue_t)qword_1000E0320, v9);
    v7 = *((int *)v12 + 6);
    if ((_DWORD)v7)
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v7, 0));
    else
      v8 = 0;
    v6[2](v6, v8);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    if (v6)
      v6[2](v6, v8);
  }
  _Block_object_dispose(&v11, 8);

}

- (void)stoptUserSyncBubble:(int)a3 withReply:(id)a4
{
  void (**v6)(id, void *);
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  int v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  v6 = (void (**)(id, void *))a4;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = -1;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.mkb.usersession.synctest")))
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000712FC;
    v9[3] = &unk_1000D1480;
    v10 = a3;
    v9[4] = &v11;
    dispatch_sync((dispatch_queue_t)qword_1000E0320, v9);
    v7 = *((int *)v12 + 6);
    if ((_DWORD)v7)
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v7, 0));
    else
      v8 = 0;
    v6[2](v6, v8);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    if (v6)
      v6[2](v6, v8);
  }
  _Block_object_dispose(&v11, 8);

}

- (void)MKBUserSessionSetInternalTest:(BOOL)a3 withReply:(id)a4
{
  void (**v6)(id, void *);
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  BOOL v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  v6 = (void (**)(id, void *))a4;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = -1;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.mkb.usersession.synctest")))
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100071738;
    v9[3] = &unk_1000D1A08;
    v10 = a3;
    v9[4] = &v11;
    dispatch_sync((dispatch_queue_t)qword_1000E0320, v9);
    v7 = *((int *)v12 + 6);
    if ((_DWORD)v7)
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v7, 0));
    else
      v8 = 0;
    v6[2](v6, v8);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    if (v6)
      v6[2](v6, v8);
  }
  _Block_object_dispose(&v11, 8);

}

- (void)currentSyncBubbleIDwithReply:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  uint64_t v5;
  void *v6;
  _QWORD block[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;

  v4 = (void (**)(id, _QWORD, void *))a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = -1;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.mkb.usersession.synctest")))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100071CCC;
    block[3] = &unk_1000D1800;
    block[4] = &v8;
    dispatch_sync((dispatch_queue_t)qword_1000E0320, block);
    v5 = *((unsigned int *)v9 + 6);
    if ((_DWORD)v5 == -1)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 5, 0));
      v5 = *((unsigned int *)v9 + 6);
    }
    else
    {
      v6 = 0;
    }
    v4[2](v4, v5, v6);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    if (v4)
      v4[2](v4, *((unsigned int *)v9 + 6), v6);
  }
  _Block_object_dispose(&v8, 8);

}

- (void)listSyncServiceSourcesForUserSession:(id)a3 withReply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  NSObject *v8;
  uint64_t v9;
  void *v10;
  _QWORD block[4];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  int v24;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = -1;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_100068D9C;
  v19 = sub_100068DAC;
  v20 = 0;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.mkb.usersession.synctest")))
  {
    if (v6)
    {
      v8 = qword_1000E0320;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100072038;
      block[3] = &unk_1000D18A0;
      v12 = v6;
      v13 = &v15;
      v14 = &v21;
      dispatch_sync(v8, block);
      v9 = *((int *)v22 + 6);
      if ((_DWORD)v9)
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v9, 0));
      else
        v10 = 0;

    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0));
    }
    v7[2](v7, v16[5], v10);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    if (v7)
      v7[2](v7, v16[5], v10);
  }
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
}

- (void)listSyncBubbleUserswithReply:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  uint64_t v5;
  void *v6;
  _QWORD block[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v4 = (void (**)(id, _QWORD, void *))a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_100068D9C;
  v12 = sub_100068DAC;
  v13 = 0;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.mkb.usersession.synctest")))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000724EC;
    block[3] = &unk_1000D1800;
    block[4] = &v8;
    dispatch_sync((dispatch_queue_t)qword_1000E0320, block);
    v5 = v9[5];
    if (v5)
    {
      v6 = 0;
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0));
      v5 = v9[5];
    }
    v4[2](v4, v5, v6);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    if (v4)
      v4[2](v4, 0, v6);
  }
  _Block_object_dispose(&v8, 8);

}

- (void)clearSyncBubbleUserswithReply:(id)a3
{
  void (**v4)(id, void *);
  uint64_t v5;
  void *v6;
  _QWORD block[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;

  v4 = (void (**)(id, void *))a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = -1;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.mkb.usersession.synctest")))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10007269C;
    block[3] = &unk_1000D1800;
    block[4] = &v8;
    dispatch_sync((dispatch_queue_t)qword_1000E0320, block);
    v5 = *((int *)v9 + 6);
    if ((_DWORD)v5)
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v5, 0));
    else
      v6 = 0;
    v4[2](v4, v6);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    if (v4)
      v4[2](v4, v6);
  }
  _Block_object_dispose(&v8, 8);

}

- (void)limitNumberOfUserSessions:(int)a3 withReply:(id)a4
{
  void *v6;
  void (*v7)(void);
  _QWORD *v8;

  v8 = a4;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.mkb.usersession.synctest")))
  {
    if (sub_1000354E4(a3) == -1)
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0));
    else
      v6 = 0;
    v7 = (void (*)(void))v8[2];
    goto LABEL_8;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
  if (v8)
  {
    v7 = (void (*)(void))v8[2];
LABEL_8:
    v7();
  }

}

- (void)switchBlockTasksInfoWithReply:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  uint64_t v5;
  void *v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = (void (**)(id, _QWORD, void *))a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_100068D9C;
  v16 = sub_100068DAC;
  v17 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = -1;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.mkb.usersession.synctest")))
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100072B40;
    v7[3] = &unk_1000D1388;
    v7[4] = &v12;
    v7[5] = &v8;
    dispatch_sync((dispatch_queue_t)qword_1000E0320, v7);
    v5 = *((int *)v9 + 6);
    if ((_DWORD)v5)
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v5, 0));
    else
      v6 = 0;
    v4[2](v4, v13[5], v6);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    if (v4)
      v4[2](v4, 0, v6);
  }
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);

}

- (void)userSessionLRUInfoWithReply:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  uint64_t v5;
  void *v6;
  _QWORD block[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v4 = (void (**)(id, _QWORD, void *))a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_100068D9C;
  v12 = sub_100068DAC;
  v13 = 0;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.mkb.usersession.synctest")))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100072E0C;
    block[3] = &unk_1000D1800;
    block[4] = &v8;
    dispatch_sync((dispatch_queue_t)qword_1000E0320, block);
    v5 = v9[5];
    if (v5)
    {
      v6 = 0;
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0));
      v5 = v9[5];
    }
    v4[2](v4, v5, v6);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    if (v4)
      v4[2](v4, 0, v6);
  }
  _Block_object_dispose(&v8, 8);

}

- (void)mountUserSessionVolumeforID:(int)a3 withReply:(id)a4
{
  void (**v6)(id, void *);
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  int v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  v6 = (void (**)(id, void *))a4;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = -1;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.mkb.usersession.synctest")))
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100072FCC;
    v9[3] = &unk_1000D1480;
    v10 = a3;
    v9[4] = &v11;
    dispatch_sync((dispatch_queue_t)qword_1000E0320, v9);
    v7 = *((int *)v12 + 6);
    if ((_DWORD)v7)
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v7, 0));
    else
      v8 = 0;
    v6[2](v6, v8);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    if (v6)
      v6[2](v6, v8);
  }
  _Block_object_dispose(&v11, 8);

}

- (void)unmountUserSessionVolumeforID:(int)a3 withReply:(id)a4
{
  void (**v6)(id, void *);
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  int v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  v6 = (void (**)(id, void *))a4;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = -1;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.mkb.usersession.synctest")))
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000732BC;
    v9[3] = &unk_1000D1480;
    v10 = a3;
    v9[4] = &v11;
    dispatch_sync((dispatch_queue_t)qword_1000E0320, v9);
    v7 = *((int *)v12 + 6);
    if ((_DWORD)v7)
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v7, 0));
    else
      v8 = 0;
    v6[2](v6, v8);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    if (v6)
      v6[2](v6, v8);
  }
  _Block_object_dispose(&v11, 8);

}

- (void)isLoginSessionwithReply:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD block[4];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v4 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_100068D9C;
  v24 = sub_100068DAC;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = -1;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.mkb.usersession.loginwindow")))
  {
    v5 = qword_1000E0320;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100073620;
    block[3] = &unk_1000D1A30;
    v14 = &v16;
    v15 = &v20;
    v6 = v4;
    v13 = v6;
    dispatch_sync(v5, block);
    v7 = *((int *)v17 + 6);
    if ((_DWORD)v7)
    {
      v8 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v7, 0));
      v9 = (void *)v21[5];
      v21[5] = v8;

    }
    (*((void (**)(id, uint64_t))v6 + 2))(v6, v21[5]);

  }
  else
  {
    v10 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    v11 = (void *)v21[5];
    v21[5] = v10;

    if (v4)
      (*((void (**)(id, uint64_t))v4 + 2))(v4, v21[5]);
  }
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

}

- (void)userSessionDeviceConfigurationInfo:(int)a3 withReply:(id)a4
{
  void (**v6)(id, void *);
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  int v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  v6 = (void (**)(id, void *))a4;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = -1;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.mkb.usersession.deviceconfig")))
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100073818;
    v9[3] = &unk_1000D1480;
    v10 = a3;
    v9[4] = &v11;
    dispatch_sync((dispatch_queue_t)qword_1000E0320, v9);
    v7 = *((int *)v12 + 6);
    if ((_DWORD)v7)
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v7, 0));
    else
      v8 = 0;
    v6[2](v6, v8);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    if (v6)
      v6[2](v6, v8);
  }
  _Block_object_dispose(&v11, 8);

}

- (void)fetchPersonaListforPid:(int)a3 withCompletionHandler:(id)a4
{
  uint64_t v4;
  id v6;
  unsigned int v7;
  void *v8;
  int v9;
  NSObject *v10;
  unsigned int v11;
  uint64_t v12;
  const char *v13;
  char *v14;
  NSObject *v15;
  unsigned int v16;
  uint64_t v17;
  const char *v18;
  char *v19;
  NSObject *v20;
  void *v21;
  _QWORD block[4];
  id v23;
  int v24;
  unsigned int v25;
  int v26;
  int v27;
  uint64_t v28;
  int v29;
  int v30;
  int v31;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v29 = -1;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.usermanagerd.persona.fetch")))
  {
    v7 = -[UMSyncService asidForClient:withAuid:withPid:](self, "asidForClient:withAuid:withPid:", 0, &v29, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
    v9 = sub_100004BCC((uint64_t)objc_msgSend(v8, "processIdentifier"));

    if (qword_1000E0160 != -1)
      dispatch_once(&qword_1000E0160, &stru_1000D1B68);
    v10 = (id)qword_1000E0158;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v28 = 0;
      v11 = sub_100007750(1);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        v12 = v11;
      else
        v12 = v11 & 0xFFFFFFFE;
      if ((_DWORD)v12)
      {
        v30 = 67109120;
        v31 = v4;
        v13 = (const char *)_os_log_send_and_compose_impl(v12, &v28, 0, 0);
        v14 = (char *)v13;
        if (v13)
          sub_100007780(v13);
      }
      else
      {
        v14 = 0;
      }
      free(v14);
    }

    v20 = qword_1000E0320;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100073EE4;
    block[3] = &unk_1000D1A80;
    v24 = v4;
    v25 = v7;
    v26 = v29;
    v27 = v9;
    v23 = v6;
    dispatch_sync(v20, block);

    v21 = 0;
  }
  else
  {
    if (qword_1000E0160 != -1)
      dispatch_once(&qword_1000E0160, &stru_1000D1B68);
    v15 = (id)qword_1000E0158;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v28 = 0;
      v16 = sub_100007750(1);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        v17 = v16;
      else
        v17 = v16 & 0xFFFFFFFE;
      if ((_DWORD)v17)
      {
        v30 = 67109120;
        v31 = v4;
        v18 = (const char *)_os_log_send_and_compose_impl(v17, &v28, 0, 0);
        v19 = (char *)v18;
        if (v18)
          sub_100007780(v18);
      }
      else
      {
        v19 = 0;
      }
      free(v19);
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    if (v6)
      (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v21);
  }

}

- (void)fetchAllUsersPersonaListforPid:(int)a3 withCompletionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  unsigned int v8;
  uint64_t v9;
  const char *v10;
  char *v11;
  NSObject *v12;
  unsigned int v13;
  uint64_t v14;
  const char *v15;
  char *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  _QWORD block[4];
  id v21;
  uint64_t *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  int v31;
  int v32;

  v6 = a4;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_100068D9C;
  v29 = sub_100068DAC;
  v30 = 0;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.usermanagerd.persona.fetch")))
  {
    if (qword_1000E0160 != -1)
      dispatch_once(&qword_1000E0160, &stru_1000D1B68);
    v7 = (id)qword_1000E0158;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v24 = 0;
      v8 = sub_100007750(1);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        v9 = v8;
      else
        v9 = v8 & 0xFFFFFFFE;
      if ((_DWORD)v9)
      {
        v31 = 67109120;
        v32 = a3;
        v10 = (const char *)_os_log_send_and_compose_impl(v9, &v24, 0, 0);
        v11 = (char *)v10;
        if (v10)
          sub_100007780(v10);
      }
      else
      {
        v11 = 0;
      }
      free(v11);
    }

    v17 = qword_1000E0320;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000744C8;
    block[3] = &unk_1000D1AA8;
    v23 = a3;
    v22 = &v25;
    v21 = v6;
    dispatch_sync(v17, block);

  }
  else
  {
    if (qword_1000E0160 != -1)
      dispatch_once(&qword_1000E0160, &stru_1000D1B68);
    v12 = (id)qword_1000E0158;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 0;
      v13 = sub_100007750(1);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        v14 = v13;
      else
        v14 = v13 & 0xFFFFFFFE;
      if ((_DWORD)v14)
      {
        v31 = 67109120;
        v32 = a3;
        v15 = (const char *)_os_log_send_and_compose_impl(v14, &v24, 0, 0);
        v16 = (char *)v15;
        if (v15)
          sub_100007780(v15);
      }
      else
      {
        v16 = 0;
      }
      free(v16);
    }

    v18 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    v19 = (void *)v26[5];
    v26[5] = v18;

    if (v6)
      (*((void (**)(id, _QWORD, uint64_t))v6 + 2))(v6, 0, v26[5]);
  }
  _Block_object_dispose(&v25, 8);

}

- (void)fetchAsidMapforPid:(int)a3 withCompletionHandler:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  NSObject *v7;
  unsigned int v8;
  uint64_t v9;
  const char *v10;
  char *v11;
  NSObject *v12;
  unsigned int v13;
  uint64_t v14;
  const char *v15;
  char *v16;
  void *v17;
  uint64_t v18;
  int v19;
  int v20;

  v6 = (void (**)(id, _QWORD, void *))a4;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.usermanagerd.persona.fetch")))
  {
    if (qword_1000E0160 != -1)
      dispatch_once(&qword_1000E0160, &stru_1000D1B68);
    v7 = (id)qword_1000E0158;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v18 = 0;
      v8 = sub_100007750(1);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        v9 = v8;
      else
        v9 = v8 & 0xFFFFFFFE;
      if ((_DWORD)v9)
      {
        LOWORD(v19) = 0;
        v10 = (const char *)_os_log_send_and_compose_impl(v9, &v18, 0, 0);
        v11 = (char *)v10;
        if (v10)
          sub_100007780(v10);
      }
      else
      {
        v11 = 0;
      }
      free(v11);
    }

    if (v6)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 45, 0));
LABEL_28:
      v6[2](v6, 0, v17);
      goto LABEL_29;
    }
    v17 = 0;
  }
  else
  {
    if (qword_1000E0160 != -1)
      dispatch_once(&qword_1000E0160, &stru_1000D1B68);
    v12 = (id)qword_1000E0158;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 0;
      v13 = sub_100007750(1);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        v14 = v13;
      else
        v14 = v13 & 0xFFFFFFFE;
      if ((_DWORD)v14)
      {
        v19 = 67109120;
        v20 = a3;
        v15 = (const char *)_os_log_send_and_compose_impl(v14, &v18, 0, 0);
        v16 = (char *)v15;
        if (v15)
          sub_100007780(v15);
      }
      else
      {
        v16 = 0;
      }
      free(v16);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    if (v6)
      goto LABEL_28;
  }
LABEL_29:

}

- (void)fetchPersonaGenerationNumberWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  NSObject *v7;
  NSObject *v8;
  unsigned int v9;
  uint64_t v10;
  const char *v11;
  char *v12;
  void *v13;
  _QWORD block[4];
  id v15;
  uint64_t v16;
  int v17;
  unsigned int v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v6 = objc_msgSend(v5, "processIdentifier");

  if (-[UMSyncService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.usermanagerd.persona.fetch")))
  {
    v7 = qword_1000E0320;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100074F60;
    block[3] = &unk_1000D1108;
    v15 = v4;
    dispatch_sync(v7, block);

  }
  else
  {
    if (qword_1000E0180 != -1)
      dispatch_once(&qword_1000E0180, &stru_1000D1BA8);
    v8 = (id)qword_1000E0178;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v16 = 0;
      v9 = sub_100007750(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        v10 = v9;
      else
        v10 = v9 & 0xFFFFFFFE;
      if ((_DWORD)v10)
      {
        v17 = 67109120;
        v18 = v6;
        v11 = (const char *)_os_log_send_and_compose_impl(v10, &v16, 0, 0);
        v12 = (char *)v11;
        if (v11)
          sub_100007780(v11);
      }
      else
      {
        v12 = 0;
      }
      free(v12);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v13);

  }
}

- (void)bundleIdentifiersForPersona:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  id v9;
  NSObject *v10;
  unsigned int v11;
  uint64_t v12;
  const char *v13;
  char *v14;
  NSObject *v15;
  unsigned int v16;
  uint64_t v17;
  const char *v18;
  char *v19;
  uint64_t v20;
  void *v21;
  unsigned int v22;
  void *v23;
  int v24;
  NSObject *v25;
  id v26;
  _QWORD block[4];
  id v28;
  void (**v29)(id, _QWORD);
  uint64_t *v30;
  int v31;
  unsigned int v32;
  int v33;
  int v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  int v43;
  int v44;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = sub_100068D9C;
  v41 = sub_100068DAC;
  v42 = 0;
  v36 = -1;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v9 = objc_msgSend(v8, "processIdentifier");

  if (-[UMSyncService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.usermanagerd.persona.fetchbundle")))
  {
    if (v6)
      goto LABEL_28;
    if (qword_1000E0160 != -1)
      dispatch_once(&qword_1000E0160, &stru_1000D1B68);
    v10 = (id)qword_1000E0158;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v35 = 0;
      v11 = sub_100007750(1);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        v12 = v11;
      else
        v12 = v11 & 0xFFFFFFFE;
      if ((_DWORD)v12)
      {
        LOWORD(v43) = 0;
        v13 = (const char *)_os_log_send_and_compose_impl(v12, &v35, 0, 0);
        v14 = (char *)v13;
        if (v13)
          sub_100007780(v13);
      }
      else
      {
        v14 = 0;
      }
      free(v14);
    }

    v20 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0));
  }
  else
  {
    if (qword_1000E0160 != -1)
      dispatch_once(&qword_1000E0160, &stru_1000D1B68);
    v15 = (id)qword_1000E0158;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v35 = 0;
      v16 = sub_100007750(1);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        v17 = v16;
      else
        v17 = v16 & 0xFFFFFFFE;
      if ((_DWORD)v17)
      {
        v43 = 67109120;
        v44 = (int)v9;
        v18 = (const char *)_os_log_send_and_compose_impl(v17, &v35, 0, 0);
        v19 = (char *)v18;
        if (v18)
          sub_100007780(v18);
      }
      else
      {
        v19 = 0;
      }
      free(v19);
    }

    v20 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
  }
  v21 = (void *)v38[5];
  v38[5] = v20;

LABEL_28:
  if (v38[5])
  {
    if (v7)
      v7[2](v7, 0);
  }
  else
  {
    v22 = -[UMSyncService asidForClient:withAuid:withPid:](self, "asidForClient:withAuid:withPid:", 0, &v36, v9);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
    v24 = sub_100004BCC((uint64_t)objc_msgSend(v23, "processIdentifier"));

    v25 = qword_1000E0320;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000753AC;
    block[3] = &unk_1000D1AD0;
    v26 = v6;
    v31 = (int)v9;
    v32 = v22;
    v33 = v36;
    v34 = v24;
    v28 = v26;
    v30 = &v37;
    v29 = v7;
    dispatch_sync(v25, block);

  }
  _Block_object_dispose(&v37, 8);

}

- (void)setBundlesIdentifiers:(id)a3 forPersona:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  id v12;
  NSObject *v13;
  unsigned int v14;
  uint64_t v15;
  const char *v16;
  char *v17;
  NSObject *v18;
  unsigned int v19;
  uint64_t v20;
  const char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  unsigned int v27;
  uint64_t v28;
  const char *v29;
  char *v30;
  void *v31;
  unsigned int v32;
  void *v33;
  int v34;
  NSObject *v35;
  _QWORD block[4];
  id v37;
  id v38;
  void (**v39)(_QWORD);
  uint64_t *v40;
  int v41;
  unsigned int v42;
  int v43;
  int v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  int v53;
  int v54;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = sub_100068D9C;
  v51 = sub_100068DAC;
  v52 = 0;
  v46 = -1;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v12 = objc_msgSend(v11, "processIdentifier");

  if (!-[UMSyncService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.usermanagerd.persona.setbundle")))
  {
    if (qword_1000E0160 != -1)
      dispatch_once(&qword_1000E0160, &stru_1000D1B68);
    v18 = (id)qword_1000E0158;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v45 = 0;
      v19 = sub_100007750(1);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        v20 = v19;
      else
        v20 = v19 & 0xFFFFFFFE;
      if ((_DWORD)v20)
      {
        v53 = 67109120;
        v54 = (int)v12;
        v21 = (const char *)_os_log_send_and_compose_impl(v20, &v45, 0, 0);
        v22 = (char *)v21;
        if (v21)
          sub_100007780(v21);
      }
      else
      {
        v22 = 0;
      }
      free(v22);
    }

    v23 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    goto LABEL_40;
  }
  if (!v9)
  {
    if (qword_1000E0160 != -1)
      dispatch_once(&qword_1000E0160, &stru_1000D1B68);
    v13 = (id)qword_1000E0158;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v45 = 0;
      v14 = sub_100007750(1);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        v15 = v14;
      else
        v15 = v14 & 0xFFFFFFFE;
      if ((_DWORD)v15)
      {
        LOWORD(v53) = 0;
        v16 = (const char *)_os_log_send_and_compose_impl(v15, &v45, 0, 0);
        v17 = (char *)v16;
        if (v16)
          sub_100007780(v16);
      }
      else
      {
        v17 = 0;
      }
      free(v17);
    }

    v24 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0));
    v25 = (void *)v48[5];
    v48[5] = v24;

  }
  if (!v8)
  {
    if (qword_1000E0160 != -1)
      dispatch_once(&qword_1000E0160, &stru_1000D1B68);
    v26 = (id)qword_1000E0158;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v45 = 0;
      v27 = sub_100007750(1);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        v28 = v27;
      else
        v28 = v27 & 0xFFFFFFFE;
      if ((_DWORD)v28)
      {
        LOWORD(v53) = 0;
        v29 = (const char *)_os_log_send_and_compose_impl(v28, &v45, 0, 0);
        v30 = (char *)v29;
        if (v29)
          sub_100007780(v29);
      }
      else
      {
        v30 = 0;
      }
      free(v30);
    }

    v23 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0));
LABEL_40:
    v31 = (void *)v48[5];
    v48[5] = v23;

  }
  if (v48[5])
  {
    if (v10)
      v10[2](v10);
  }
  else
  {
    v32 = -[UMSyncService asidForClient:withAuid:withPid:](self, "asidForClient:withAuid:withPid:", 0, &v46, v12);
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
    v34 = sub_100004BCC((uint64_t)objc_msgSend(v33, "processIdentifier"));

    v35 = qword_1000E0320;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100075C74;
    block[3] = &unk_1000D1AF8;
    v37 = v9;
    v41 = (int)v12;
    v42 = v32;
    v43 = v46;
    v44 = v34;
    v38 = v8;
    v40 = &v47;
    v39 = v10;
    dispatch_sync(v35, block);

  }
  _Block_object_dispose(&v47, 8);

}

- (void)registerUserPersonaObserverForPID:(int)a3 withMachServiceName:(id)a4 completionHandler:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  unsigned int v10;
  void *v11;
  int v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  unsigned int v16;
  uint64_t v17;
  const char *v18;
  char *v19;
  uint64_t v20;
  void *v21;
  _QWORD block[4];
  id v23;
  id v24;
  uint64_t *v25;
  unsigned int v26;
  int v27;
  int v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  int v37;
  int v38;

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v9 = a5;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = sub_100068D9C;
  v35 = sub_100068DAC;
  v36 = 0;
  v30 = -1;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.usermanagerd.persona.observer")))
  {
    v10 = -[UMSyncService asidForClient:withAuid:withPid:](self, "asidForClient:withAuid:withPid:", 0, &v30, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
    v12 = sub_100004BCC((uint64_t)objc_msgSend(v11, "processIdentifier"));

    v13 = qword_1000E0320;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000762C0;
    block[3] = &unk_1000D1B20;
    v14 = v8;
    v26 = v10;
    v27 = v30;
    v28 = v12;
    v23 = v14;
    v25 = &v31;
    v24 = v9;
    dispatch_sync(v13, block);

  }
  else
  {
    if (qword_1000E0160 != -1)
      dispatch_once(&qword_1000E0160, &stru_1000D1B68);
    v15 = (id)qword_1000E0158;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v29 = 0;
      v16 = sub_100007750(1);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        v17 = v16;
      else
        v17 = v16 & 0xFFFFFFFE;
      if ((_DWORD)v17)
      {
        v37 = 67109120;
        v38 = v6;
        v18 = (const char *)_os_log_send_and_compose_impl(v17, &v29, 0, 0);
        v19 = (char *)v18;
        if (v18)
          sub_100007780(v18);
      }
      else
      {
        v19 = 0;
      }
      free(v19);
    }

    v20 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    v21 = (void *)v32[5];
    v32[5] = v20;

    if (v9)
      (*((void (**)(id, uint64_t))v9 + 2))(v9, v32[5]);
  }
  _Block_object_dispose(&v31, 8);

}

- (void)personaLoginWithPid:(int)a3 WithUserODuuid:(id)a4 withUid:(unsigned int)a5 completionHandler:(id)a6
{
  id v7;
  id v8;

  if (a6)
  {
    v7 = a6;
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 45, 0));
    (*((void (**)(id, id))a6 + 2))(v7, v8);

  }
}

- (void)personaLogoutWithPid:(int)a3 WithUserODuuid:(id)a4 withUid:(unsigned int)a5 completionHandler:(id)a6
{
  id v7;
  id v8;

  if (a6)
  {
    v7 = a6;
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 45, 0));
    (*((void (**)(id, id))a6 + 2))(v7, v8);

  }
}

- (void)grantSandboxExtensionForPersonaWithUniqueString:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  unsigned int v13;
  uint64_t v14;
  const char *v15;
  char *v16;
  unsigned int v17;
  void *v18;
  int v19;
  NSObject *v20;
  unsigned int v21;
  uint64_t v22;
  const char *v23;
  char *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  id v28;
  _QWORD block[4];
  id v30;
  id v31;
  uint64_t *v32;
  unsigned int v33;
  int v34;
  int v35;
  __int128 v36;
  __int128 v37;
  int v38;
  uint64_t v39;
  int v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  int v49;
  id v50;
  __int16 v51;
  int v52;
  __int16 v53;
  unsigned int v54;
  __int16 v55;
  int v56;

  v6 = a3;
  v7 = a4;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = sub_100068D9C;
  v47 = sub_100068DAC;
  v48 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v9 = objc_msgSend(v8, "processIdentifier");

  if (-[UMSyncService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.usermanagerd.persona.grantSandboxExtension")))
  {
    v42 = 0u;
    v41 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "auditToken");
    }
    else
    {
      v42 = 0u;
      v41 = 0u;
    }

    v40 = -1;
    v17 = -[UMSyncService asidForClient:withAuid:withPid:](self, "asidForClient:withAuid:withPid:", 0, &v40, v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
    v19 = sub_100004BCC((uint64_t)objc_msgSend(v18, "processIdentifier"));

    if (qword_1000E0160 != -1)
      dispatch_once(&qword_1000E0160, &stru_1000D1B68);
    v20 = (id)qword_1000E0158;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v39 = 0;
      v21 = sub_100007750(1);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        v22 = v21;
      else
        v22 = v21 & 0xFFFFFFFE;
      if ((_DWORD)v22)
      {
        v49 = 138413058;
        v50 = v6;
        v51 = 1024;
        v52 = (int)v9;
        v53 = 1024;
        v54 = v17;
        v55 = 1024;
        v56 = v40;
        v23 = (const char *)_os_log_send_and_compose_impl(v22, &v39, 0, 0);
        v24 = (char *)v23;
        if (v23)
          sub_100007780(v23);
      }
      else
      {
        v24 = 0;
      }
      free(v24);
    }

    v27 = qword_1000E0320;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100076BAC;
    block[3] = &unk_1000D1B48;
    v33 = v17;
    v34 = v40;
    v35 = v19;
    v28 = v6;
    v36 = v41;
    v37 = v42;
    v38 = (int)v9;
    v30 = v28;
    v32 = &v43;
    v31 = v7;
    dispatch_sync(v27, block);

  }
  else
  {
    if (qword_1000E0160 != -1)
      dispatch_once(&qword_1000E0160, &stru_1000D1B68);
    v12 = (id)qword_1000E0158;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_QWORD *)&v41 = 0;
      v13 = sub_100007750(1);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        v14 = v13;
      else
        v14 = v13 & 0xFFFFFFFE;
      if ((_DWORD)v14)
      {
        v49 = 67109120;
        LODWORD(v50) = (_DWORD)v9;
        v15 = (const char *)_os_log_send_and_compose_impl(v14, &v41, 0, 0);
        v16 = (char *)v15;
        if (v15)
          sub_100007780(v15);
      }
      else
      {
        v16 = 0;
      }
      free(v16);
    }

    v25 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    v26 = (void *)v44[5];
    v44[5] = v25;

    if (v7)
      (*((void (**)(id, _QWORD, uint64_t))v7 + 2))(v7, 0, v44[5]);
  }
  _Block_object_dispose(&v43, 8);

}

- (int)asidForClient:(id)a3 withAuid:(unsigned int *)a4 withPid:(int)a5
{
  if (a4)
    *a4 = -1;
  return -1;
}

@end
