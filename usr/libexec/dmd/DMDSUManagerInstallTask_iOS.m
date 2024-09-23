@implementation DMDSUManagerInstallTask_iOS

+ (id)defaultProductKey
{
  return CFSTR("iOSUpdate");
}

+ (id)_dmfDownloadErrorFromSUDownloadError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void **v13;
  NSErrorUserInfoKey *v14;
  NSErrorUserInfoKey v15;
  void *v16;
  NSErrorUserInfoKey v17;
  void *v18;
  NSErrorUserInfoKey v19;
  void *v20;
  NSErrorUserInfoKey v21;
  void *v22;
  NSErrorUserInfoKey v23;
  void *v24;
  NSErrorUserInfoKey v25;
  void *v26;
  NSErrorUserInfoKey v27;
  void *v28;
  NSErrorUserInfoKey v29;
  void *v30;
  NSErrorUserInfoKey v31;
  void *v32;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
    v6 = objc_msgSend(v5, "isEqualToString:", SUErrorDomain);

    if ((v6 & 1) != 0)
    {
      switch((unint64_t)objc_msgSend(v4, "code"))
      {
        case 1uLL:
        case 7uLL:
        case 8uLL:
        case 9uLL:
        case 0xAuLL:
        case 0x1AuLL:
        case 0x1DuLL:
        case 0x1EuLL:
        case 0x21uLL:
        case 0x22uLL:
        case 0x23uLL:
        case 0x24uLL:
          v25 = NSUnderlyingErrorKey;
          v26 = v4;
          v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
          v8 = 2203;
          break;
        case 6uLL:
        case 0x2BuLL:
          v23 = NSUnderlyingErrorKey;
          v24 = v4;
          v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
          v8 = 2204;
          break;
        case 0xBuLL:
          v29 = NSUnderlyingErrorKey;
          v30 = v4;
          v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1));
          v8 = 2200;
          break;
        case 0xEuLL:
          v17 = NSUnderlyingErrorKey;
          v18 = v4;
          v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
          v8 = 2207;
          break;
        case 0xFuLL:
        case 0x18uLL:
          v21 = NSUnderlyingErrorKey;
          v22 = v4;
          v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
          v8 = 2205;
          break;
        case 0x14uLL:
          v19 = NSUnderlyingErrorKey;
          v20 = v4;
          v13 = &v20;
          v14 = &v19;
          goto LABEL_15;
        case 0x29uLL:
          v27 = NSUnderlyingErrorKey;
          v28 = v4;
          v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
          v8 = 2201;
          break;
        default:
          v15 = NSUnderlyingErrorKey;
          v16 = v4;
          v13 = &v16;
          v14 = &v15;
LABEL_15:
          v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v14, 1));
          v8 = 2202;
          break;
      }
    }
    else
    {
      v31 = NSUnderlyingErrorKey;
      v32 = v4;
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
      v8 = 0;
    }
    v11 = DMFErrorWithCodeAndUserInfo(v8, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v11);

  }
  else
  {
    v9 = DMFErrorWithCodeAndUserInfo(0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  }

  return v10;
}

+ (id)_dmfInstallErrorFromSUInstallError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSErrorUserInfoKey v14;
  void *v15;
  NSErrorUserInfoKey v16;
  void *v17;
  NSErrorUserInfoKey v18;
  void *v19;
  NSErrorUserInfoKey v20;
  void *v21;
  NSErrorUserInfoKey v22;
  void *v23;
  NSErrorUserInfoKey v24;
  void *v25;
  NSErrorUserInfoKey v26;
  void *v27;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
    v6 = objc_msgSend(v5, "isEqualToString:", SUErrorDomain);

    if ((v6 & 1) != 0)
    {
      v7 = objc_msgSend(v4, "code");
      switch((unint64_t)v7)
      {
        case 3uLL:
        case 5uLL:
          v16 = NSUnderlyingErrorKey;
          v17 = v4;
          v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
          v9 = 2211;
          break;
        case 4uLL:
        case 7uLL:
        case 8uLL:
        case 9uLL:
        case 0xAuLL:
        case 0xCuLL:
        case 0xDuLL:
          goto LABEL_13;
        case 6uLL:
          goto LABEL_11;
        case 0xBuLL:
          v24 = NSUnderlyingErrorKey;
          v25 = v4;
          v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
          v9 = 2200;
          break;
        case 0xEuLL:
          v22 = NSUnderlyingErrorKey;
          v23 = v4;
          v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
          v9 = 2207;
          break;
        case 0xFuLL:
          goto LABEL_12;
        default:
          if (v7 == (id)24)
          {
LABEL_12:
            v18 = NSUnderlyingErrorKey;
            v19 = v4;
            v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
            v9 = 2210;
          }
          else if (v7 == (id)43)
          {
LABEL_11:
            v20 = NSUnderlyingErrorKey;
            v21 = v4;
            v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
            v9 = 2209;
          }
          else
          {
LABEL_13:
            v14 = NSUnderlyingErrorKey;
            v15 = v4;
            v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
            v9 = 2208;
          }
          break;
      }
    }
    else
    {
      v26 = NSUnderlyingErrorKey;
      v27 = v4;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));
      v9 = 0;
    }
    v12 = DMFErrorWithCodeAndUserInfo(v9, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v12);

  }
  else
  {
    v10 = DMFErrorWithCodeAndUserInfo(0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  }

  return v11;
}

+ (id)_dmfStatusErrorFromSUStatusError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSErrorUserInfoKey v10;
  id v11;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v10 = NSUnderlyingErrorKey;
    v11 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
    v6 = DMFErrorWithCodeAndUserInfo(0, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  }
  else
  {
    v8 = DMFErrorWithCodeAndUserInfo(0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v8);
  }

  return v7;
}

- (DMDSUManagerInstallTask_iOS)init
{
  DMDSUManagerInstallTask_iOS *v2;
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DMDSUManagerInstallTask_iOS;
  v2 = -[DMDSUManagerInstallTask_iOS init](&v5, "init");
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc((Class)SUManagerClient), "initWithDelegate:clientType:", 0, 0);
    -[DMDSUManagerInstallTask_iOS setSoftwareUpdateServices:](v2, "setSoftwareUpdateServices:", v3);

  }
  return v2;
}

- (BOOL)removeUpdateWithError:(id *)a3
{
  dispatch_semaphore_t v5;
  void *v6;
  NSObject *v7;
  dispatch_time_t v8;
  uint64_t v9;
  BOOL v10;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BOOL8 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void **v36;
  uint64_t v37;
  void (*v38)(uint64_t, char, id);
  void *v39;
  NSObject *v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t v43;
  _QWORD v44[4];
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  char v49;
  NSErrorUserInfoKey v50;
  uint64_t v51;

  v5 = dispatch_semaphore_create(0);
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 0;
  v43 = 0;
  v44[0] = &v43;
  v44[1] = 0x3032000000;
  v44[2] = sub_100066EBC;
  v44[3] = sub_100066ECC;
  v45 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSUManagerInstallTask_iOS softwareUpdateServices](self, "softwareUpdateServices"));
  v36 = _NSConcreteStackBlock;
  v37 = 3221225472;
  v38 = sub_100066ED4;
  v39 = &unk_1000BAE08;
  v41 = &v46;
  v42 = &v43;
  v7 = v5;
  v40 = v7;
  objc_msgSend(v6, "purgeDownload:", &v36);

  v8 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(v7, v8))
  {
    if (a3)
    {
      v9 = DMFErrorWithCodeAndUserInfo(801, 0);
      v10 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue(v9);
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    if (*((_BYTE *)v47 + 24))
    {
      v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
      if (v11)
        sub_100079A58(v11, v12, v13, v14, v15, v16, v17, v18);
    }
    else
    {
      v19 = *(_QWORD *)(v44[0] + 40);
      v20 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
      if (v19)
      {
        if (v20)
          sub_1000799D4((uint64_t)v44);
        if (a3)
        {
          v28 = *(_QWORD *)(v44[0] + 40);
          if (v28)
          {
            v50 = NSUnderlyingErrorKey;
            v51 = v28;
            v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1, v36, v37, v38, v39));
            v30 = DMFErrorWithCodeAndUserInfo(0, v29);
            v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v30));
            *a3 = v31;

          }
          else
          {
            v33 = DMFErrorWithCodeAndUserInfo(0, 0);
            v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v33));
            *a3 = v34;

          }
        }
      }
      else
      {
        if (v20)
          sub_10007999C(v20, v21, v22, v23, v24, v25, v26, v27);
        if (a3)
        {
          v32 = DMFErrorWithCodeAndUserInfo(0, 0);
          *a3 = (id)objc_claimAutoreleasedReturnValue(v32);
        }
      }
    }
    v10 = *((_BYTE *)v47 + 24) != 0;
  }

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v46, 8);

  return v10;
}

- (id)availableUpdateWithVersion:(id)a3 useDelay:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  dispatch_semaphore_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  NSObject *v13;
  dispatch_time_t v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  unsigned int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  id v38;
  _QWORD v39[4];
  NSObject *v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  NSErrorUserInfoKey v55;
  void *v56;
  NSErrorUserInfoKey v57;
  uint64_t v58;
  NSErrorUserInfoKey v59;
  uint64_t v60;
  uint8_t buf[4];
  const __CFString *v62;

  v6 = a4;
  v8 = a3;
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = sub_100066EBC;
  v53 = sub_100066ECC;
  v54 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = sub_100066EBC;
  v47 = sub_100066ECC;
  v48 = 0;
  v9 = dispatch_semaphore_create(0);
  v10 = (void *)objc_opt_new(SUScanOptions);
  objc_msgSend(v10, "setIdentifier:", CFSTR("com.apple.mdm"));
  objc_msgSend(v10, "setForced:", 1);
  objc_msgSend(v10, "setRequestedPMV:", v8);
  objc_msgSend(v10, "setMDMUseDelayPeriod:", v6);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    v11 = CFSTR("NO");
    if (v6)
      v11 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v62 = v11;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "available-os-updates useDelay=%@", buf, 0xCu);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSUManagerInstallTask_iOS softwareUpdateServices](self, "softwareUpdateServices"));
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1000673C4;
  v39[3] = &unk_1000BBD48;
  v41 = &v49;
  v42 = &v43;
  v13 = v9;
  v40 = v13;
  objc_msgSend(v12, "scanForUpdates:withResult:", v10, v39);

  v14 = dispatch_time(0, 120000000000);
  if (!dispatch_semaphore_wait(v13, v14))
  {
    if (v50[5])
    {
      v18 = objc_alloc((Class)DMFOSUpdate);
      v17 = objc_msgSend(v18, "initWithDescriptor:", v50[5]);
      goto LABEL_23;
    }
    if (a5)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v44[5], "domain"));
      v20 = objc_msgSend(v19, "isEqualToString:", SUErrorDomain);

      v21 = (void *)v44[5];
      if (v20)
      {
        if (objc_msgSend(v21, "code") == (id)3
          || objc_msgSend((id)v44[5], "code") == (id)63
          || objc_msgSend((id)v44[5], "code") == (id)55)
        {
          v22 = v44[5];
          if (v22)
          {
            v59 = NSUnderlyingErrorKey;
            v60 = v22;
            v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1));
            v24 = DMFErrorWithCodeAndUserInfo(2213, v23);
            v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v24));
            *a5 = v25;

          }
          else
          {
            v30 = DMFErrorWithCodeAndUserInfo(2213, 0);
            v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v30));
            *a5 = v31;

          }
        }
        else
        {
          v33 = v44[5];
          if (v33)
          {
            v57 = NSUnderlyingErrorKey;
            v58 = v33;
            v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1));
            v35 = DMFErrorWithCodeAndUserInfo(2214, v34);
            v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v35));
            *a5 = v36;

          }
          else
          {
            v37 = DMFErrorWithCodeAndUserInfo(2214, 0);
            v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v37));
            *a5 = v38;

          }
        }
      }
      else
      {
        if (!v21)
        {
          v29 = DMFErrorWithCodeAndUserInfo(2214, 0);
          v16 = (id)objc_claimAutoreleasedReturnValue(v29);
          goto LABEL_8;
        }
        v55 = NSUnderlyingErrorKey;
        v56 = v21;
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1));
        v27 = DMFErrorWithCodeAndUserInfo(2214, v26);
        v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v27));
        *a5 = v28;

      }
    }
LABEL_22:
    v17 = 0;
    goto LABEL_23;
  }
  if (!a5)
    goto LABEL_22;
  v15 = DMFErrorWithCodeAndUserInfo(801, 0);
  v16 = (id)objc_claimAutoreleasedReturnValue(v15);
LABEL_8:
  v17 = 0;
  *a5 = v16;
LABEL_23:

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);

  return v17;
}

- (BOOL)startDownloadWithError:(id *)a3
{
  void *v5;
  dispatch_semaphore_t v6;
  id v7;
  unsigned int v8;
  unsigned int v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  NSObject *v13;
  dispatch_time_t v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  void *v18;
  _QWORD v20[4];
  NSObject *v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  uint8_t buf[4];
  const __CFString *v35;
  __int16 v36;
  const __CFString *v37;

  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_100066EBC;
  v28 = sub_100066ECC;
  v29 = 0;
  v5 = (void *)objc_opt_new(SUMutableDownloadMetadata);
  objc_msgSend(v5, "setAutoDownload:", 0);
  objc_msgSend(v5, "setDownloadOnly:", 1);
  v6 = dispatch_semaphore_create(0);
  v7 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend(v5, "isAutoDownload");
    v9 = objc_msgSend(v5, "isDownloadOnly");
    v10 = CFSTR("NO");
    if (v8)
      v11 = CFSTR("YES");
    else
      v11 = CFSTR("NO");
    if (v9)
      v10 = CFSTR("YES");
    *(_DWORD *)buf = 138543618;
    v35 = v11;
    v36 = 2114;
    v37 = v10;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "calling startDownloadWithMetadata:withResult:, autodownload is %{public}@, downloadOnly is %{public}@", buf, 0x16u);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSUManagerInstallTask_iOS softwareUpdateServices](self, "softwareUpdateServices"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10006771C;
  v20[3] = &unk_1000BAE08;
  v22 = &v30;
  v23 = &v24;
  v13 = v6;
  v21 = v13;
  objc_msgSend(v12, "startDownloadWithMetadata:withResult:", v5, v20);

  v14 = dispatch_time(0, 30000000000);
  if (!dispatch_semaphore_wait(v13, v14))
  {
    if (*((_BYTE *)v31 + 24))
    {
      v17 = 1;
      goto LABEL_17;
    }
    if (a3)
    {
      v18 = (void *)objc_opt_class(self);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "_dmfDownloadErrorFromSUDownloadError:", v25[5]));
      goto LABEL_11;
    }
LABEL_16:
    v17 = 0;
    goto LABEL_17;
  }
  if (!a3)
    goto LABEL_16;
  v15 = DMFErrorWithCodeAndUserInfo(801, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
LABEL_11:
  v17 = 0;
  *a3 = v16;
LABEL_17:

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);
  return v17;
}

- (BOOL)startInstallWithError:(id *)a3
{
  dispatch_semaphore_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  dispatch_time_t v9;
  uint64_t v10;
  id v11;
  BOOL v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  NSObject *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint64_t v30;

  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_100066EBC;
  v24 = sub_100066ECC;
  v25 = 0;
  v5 = dispatch_semaphore_create(0);
  v30 = kSUInstallOptionRequireUpdate;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v30, 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSUManagerInstallTask_iOS softwareUpdateServices](self, "softwareUpdateServices"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000679DC;
  v16[3] = &unk_1000BAE08;
  v18 = &v26;
  v19 = &v20;
  v8 = v5;
  v17 = v8;
  objc_msgSend(v7, "installUpdateWithOptions:withResult:", v6, v16);

  v9 = dispatch_time(0, 30000000000);
  if (!dispatch_semaphore_wait(v8, v9))
  {
    if (objc_msgSend((id)v21[5], "code") == (id)20)
    {
      v13 = (void *)v21[5];
      v21[5] = 0;

      v12 = 1;
      *((_BYTE *)v27 + 24) = 1;
      goto LABEL_12;
    }
    if (*((_BYTE *)v27 + 24))
    {
      v12 = 1;
      goto LABEL_12;
    }
    if (a3)
    {
      v14 = (void *)objc_opt_class(self);
      v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_dmfInstallErrorFromSUInstallError:", v21[5]));
      goto LABEL_4;
    }
LABEL_11:
    v12 = 0;
    goto LABEL_12;
  }
  if (!a3)
    goto LABEL_11;
  v10 = DMFErrorWithCodeAndUserInfo(801, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue(v10);
LABEL_4:
  v12 = 0;
  *a3 = v11;
LABEL_12:

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);
  return v12;
}

- (id)currentStatusWithError:(id *)a3
{
  void *v5;
  dispatch_time_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  DMDSUStatus *v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  dispatch_semaphore_t v27;

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_100066EBC;
  v26 = sub_100066ECC;
  v27 = dispatch_semaphore_create(0);
  v19 = 0;
  v20[0] = &v19;
  v20[1] = 0x3032000000;
  v20[2] = sub_100066EBC;
  v20[3] = sub_100066ECC;
  v21 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_100066EBC;
  v17 = sub_100066ECC;
  v18 = objc_opt_new(DMDSUStatus);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSUManagerInstallTask_iOS softwareUpdateServices](self, "softwareUpdateServices"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100067C68;
  v12[3] = &unk_1000BBD70;
  v12[4] = &v13;
  v12[5] = &v19;
  v12[6] = &v22;
  objc_msgSend(v5, "downloadAndInstallState:", v12);

  v6 = dispatch_time(0, 30000000000);
  if (!dispatch_semaphore_wait((dispatch_semaphore_t)v23[5], v6))
  {
    if (!*(_QWORD *)(v20[0] + 40))
    {
      v10 = (id)v14[5];
      goto LABEL_12;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100079A90((uint64_t)v20);
      if (!a3)
        goto LABEL_11;
    }
    else if (!a3)
    {
      goto LABEL_11;
    }
    v9 = (void *)objc_opt_class(self);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_dmfStatusErrorFromSUStatusError:", *(_QWORD *)(v20[0] + 40)));
    goto LABEL_8;
  }
  if (!a3)
  {
LABEL_11:
    v10 = 0;
    goto LABEL_12;
  }
  v7 = DMFErrorWithCodeAndUserInfo(801, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
LABEL_8:
  v10 = 0;
  *a3 = v8;
LABEL_12:
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

- (SUManagerClient)softwareUpdateServices
{
  return self->softwareUpdateServices;
}

- (void)setSoftwareUpdateServices:(id)a3
{
  objc_storeStrong((id *)&self->softwareUpdateServices, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->softwareUpdateServices, 0);
}

@end
