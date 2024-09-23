@implementation UMProcessProvider

- (unint64_t)uniquePIDForPID:(int)a3 error:(id *)a4
{
  int v6;
  int v7;
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
  uint64_t v20;
  int v21;
  int v22;
  __int16 v23;
  int v24;
  __int128 buffer;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  if (a4)
    *a4 = 0;
  v28 = 0;
  v26 = 0u;
  v27 = 0u;
  buffer = 0u;
  v6 = proc_pidinfo(a3, 17, 0, &buffer, 56);
  if (v6 < 0)
  {
    v9 = *__error();
    if (a4)
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v9, 0));
    if (qword_1000E01B0 != -1)
      dispatch_once(&qword_1000E01B0, &stru_1000D1C30);
    v10 = (id)qword_1000E01A8;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v20 = 0;
      v11 = sub_100007750(0);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        v12 = v11;
      else
        v12 = v11 & 0xFFFFFFFE;
      if ((_DWORD)v12)
      {
        v21 = 67109376;
        v22 = a3;
        v23 = 1024;
        v24 = v9;
        v13 = (const char *)_os_log_send_and_compose_impl(v12, &v20, 0, 0);
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

  }
  else
  {
    v7 = v6;
    if (v6 == 56)
      return v26;
    if (a4)
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 5, 0));
    if (qword_1000E01B0 != -1)
      dispatch_once(&qword_1000E01B0, &stru_1000D1C30);
    v15 = (id)qword_1000E01A8;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v20 = 0;
      v16 = sub_100007750(0);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        v17 = v16;
      else
        v17 = v16 & 0xFFFFFFFE;
      if ((_DWORD)v17)
      {
        v21 = 67109376;
        v22 = a3;
        v23 = 1024;
        v24 = v7;
        v18 = (const char *)_os_log_send_and_compose_impl(v17, &v20, 0, 0);
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

  }
  return 0;
}

- (id)pathForPID:(int)a3 error:(id *)a4
{
  void *v6;
  int v7;
  NSObject *v8;
  unsigned int v9;
  uint64_t v10;
  const char *v11;
  char *v12;
  uint64_t v14;
  int v15;
  int v16;
  __int16 v17;
  int v18;
  _BYTE buffer[1025];

  if (a4)
    *a4 = 0;
  bzero(buffer, 0x401uLL);
  if (proc_pidpath(a3, buffer, 0x400u))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", buffer));
  }
  else
  {
    v7 = *__error();
    if (a4)
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v7, 0));
    if (qword_1000E01B0 != -1)
      dispatch_once(&qword_1000E01B0, &stru_1000D1C30);
    v8 = (id)qword_1000E01A8;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v14 = 0;
      v9 = sub_100007750(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        v10 = v9;
      else
        v10 = v9 & 0xFFFFFFFE;
      if ((_DWORD)v10)
      {
        v15 = 67109376;
        v16 = a3;
        v17 = 1024;
        v18 = v7;
        v11 = (const char *)_os_log_send_and_compose_impl(v10, &v14, 0, 0);
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

    v6 = 0;
  }
  return v6;
}

- (id)pidsUsingVolumeAtPath:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  int v7;
  int v8;
  void *v9;
  id v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  void *v14;
  uint64_t v15;
  unsigned int *v16;
  unsigned int v17;
  void *v18;
  int v19;
  NSObject *v20;
  unsigned int v21;
  uint64_t v22;
  const char *v23;
  char *v24;
  int v25;
  NSObject *v26;
  unsigned int v27;
  uint64_t v28;
  const char *v29;
  char *v30;
  uint64_t v32;
  int v33;
  id v34;
  __int16 v35;
  int v36;

  v5 = a3;
  if (a4)
    *a4 = 0;
  v6 = objc_retainAutorelease(v5);
  v7 = proc_listpidspath(1u, 0, (const char *)objc_msgSend(v6, "UTF8String"), 3u, 0, 0);
  if (v7 < 0)
  {
    v19 = *__error();
    if (a4)
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v19, 0));
    if (qword_1000E01B0 != -1)
      dispatch_once(&qword_1000E01B0, &stru_1000D1C30);
    v20 = (id)qword_1000E01A8;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v32 = 0;
      v21 = sub_100007750(0);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        v22 = v21;
      else
        v22 = v21 & 0xFFFFFFFE;
      if ((_DWORD)v22)
      {
        v33 = 138543618;
        v34 = v6;
        v35 = 1024;
        v36 = v19;
        v23 = (const char *)_os_log_send_and_compose_impl(v22, &v32, 0, 0);
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

    v14 = 0;
  }
  else
  {
    v8 = v7 + 200;
    v9 = malloc_type_malloc(v7 + 200, 0xDC870336uLL);
    v10 = objc_retainAutorelease(v6);
    v11 = proc_listpidspath(1u, 0, (const char *)objc_msgSend(v10, "UTF8String"), 3u, v9, v8);
    v12 = v11;
    if ((v11 & 0x80000000) != 0)
    {
      v25 = *__error();
      if (a4)
        *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v25, 0));
      if (qword_1000E01B0 != -1)
        dispatch_once(&qword_1000E01B0, &stru_1000D1C30);
      v26 = (id)qword_1000E01A8;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v32 = 0;
        v27 = sub_100007750(0);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          v28 = v27;
        else
          v28 = v27 & 0xFFFFFFFE;
        if ((_DWORD)v28)
        {
          v33 = 138543618;
          v34 = v10;
          v35 = 1024;
          v36 = v25;
          v29 = (const char *)_os_log_send_and_compose_impl(v28, &v32, 0, 0);
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

      v14 = 0;
    }
    else
    {
      v13 = v11 >> 2;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v11 >> 2));
      if (v12 >= 4)
      {
        if (v13 <= 1)
          v15 = 1;
        else
          v15 = v13;
        v16 = (unsigned int *)v9;
        do
        {
          v17 = *v16++;
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v17));
          objc_msgSend(v14, "addObject:", v18);

          --v15;
        }
        while (v15);
      }
    }
    free(v9);
  }

  return v14;
}

- (int)pidForLaunchdJobWithLabel:(id)a3 forUser:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  dispatch_queue_t v10;
  void *v11;
  int v12;
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
  int v26;
  const char *v27;
  char *v28;
  uint64_t v30;
  _QWORD v31[6];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  int v35;
  int v36;
  id v37;
  __int16 v38;
  int v39;
  __int16 v40;
  int v41;
  _BYTE v42[24];
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;

  v6 = *(_QWORD *)&a4;
  v7 = a3;
  if (objc_opt_class(OSLaunchdJob))
  {
    if (a5)
      *a5 = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[OSLaunchdDomain domainForUser:](OSLaunchdDomain, "domainForUser:", v6));
    v9 = +[OSLaunchdJob copyJobWithLabel:domain:](OSLaunchdJob, "copyJobWithLabel:domain:", v7, v8);
    if (!v9)
    {
      if (qword_1000E01B0 != -1)
        dispatch_once(&qword_1000E01B0, &stru_1000D1C30);
      v18 = (id)qword_1000E01A8;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v32 = 0;
        v19 = sub_100007750(0);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          v20 = v19;
        else
          v20 = v19 & 0xFFFFFFFE;
        if ((_DWORD)v20)
        {
          *(_DWORD *)v42 = 138543618;
          *(_QWORD *)&v42[4] = v7;
          *(_WORD *)&v42[12] = 1024;
          *(_DWORD *)&v42[14] = v6;
          v21 = (const char *)_os_log_send_and_compose_impl(v20, &v32, 0, 0);
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

      v12 = 0;
      if (a5)
        *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 2, 0));
      goto LABEL_51;
    }
    *(_QWORD *)v42 = 0;
    *(_QWORD *)&v42[8] = v42;
    *(_QWORD *)&v42[16] = 0x3032000000;
    v43 = sub_100083A90;
    v44 = sub_100083AA0;
    v45 = 0;
    v32 = 0;
    v33 = &v32;
    v34 = 0x2020000000;
    v35 = 8;
    v10 = dispatch_queue_create("com.apple.usermanagerd.launchjobmonitor", 0);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100083AA8;
    v31[3] = &unk_1000D1C10;
    v31[4] = v42;
    v31[5] = &v32;
    objc_msgSend(v9, "monitorOnQueue:withHandler:", v10, v31);
    objc_msgSend(v9, "cancelMonitor");
    v11 = *(void **)(*(_QWORD *)&v42[8] + 40);
    if (v11)
    {
      if (objc_msgSend(v11, "state") == (id)2)
      {
        v12 = objc_msgSend(*(id *)(*(_QWORD *)&v42[8] + 40), "pid");
LABEL_50:

        _Block_object_dispose(&v32, 8);
        _Block_object_dispose(v42, 8);

LABEL_51:
        goto LABEL_52;
      }
    }
    else
    {
      if (qword_1000E01B0 != -1)
        dispatch_once(&qword_1000E01B0, &stru_1000D1C30);
      v23 = (id)qword_1000E01A8;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v30 = 0;
        v24 = sub_100007750(0);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          v25 = v24;
        else
          v25 = v24 & 0xFFFFFFFE;
        if ((_DWORD)v25)
        {
          v26 = *((_DWORD *)v33 + 6);
          v36 = 138543874;
          v37 = v7;
          v38 = 1024;
          v39 = v6;
          v40 = 1024;
          v41 = v26;
          v27 = (const char *)_os_log_send_and_compose_impl(v25, &v30, 0, 0);
          v28 = (char *)v27;
          if (v27)
            sub_100007780(v27);
        }
        else
        {
          v28 = 0;
        }
        free(v28);
      }

      if (a5)
      {
        v12 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 2, 0));
        goto LABEL_50;
      }
    }
    v12 = 0;
    goto LABEL_50;
  }
  if (qword_1000E01B0 != -1)
    dispatch_once(&qword_1000E01B0, &stru_1000D1C30);
  v13 = (id)qword_1000E01A8;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v32 = 0;
    v14 = sub_100007750(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      v15 = v14;
    else
      v15 = v14 & 0xFFFFFFFE;
    if ((_DWORD)v15)
    {
      *(_DWORD *)v42 = 138543362;
      *(_QWORD *)&v42[4] = v7;
      v16 = (const char *)_os_log_send_and_compose_impl(v15, &v32, 0, 0);
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

  v12 = 0;
  if (a5)
    *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 45, 0));
LABEL_52:

  return v12;
}

- (BOOL)terminatePID:(int)a3 withReasonNamespace:(unsigned int)a4 reasonCode:(unint64_t)a5 reasonString:(id)a6 error:(id *)a7
{
  int v11;
  int v12;
  NSObject *v13;
  unsigned int v14;
  uint64_t v15;
  const char *v16;
  char *v17;
  NSObject *v18;
  uint64_t v20;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  unsigned int v24;
  __int16 v25;
  unint64_t v26;
  __int16 v27;
  int v28;

  if (a7)
    *a7 = 0;
  v11 = terminate_with_reason(*(_QWORD *)&a3, *(_QWORD *)&a4, a5, objc_msgSend(objc_retainAutorelease(a6), "UTF8String"), 129);
  if (v11)
  {
    v12 = *__error();
    if (a7)
      *a7 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v12, 0));
    if (qword_1000E01B0 != -1)
      dispatch_once(&qword_1000E01B0, &stru_1000D1C30);
    v13 = (id)qword_1000E01A8;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v20 = 0;
      v14 = sub_100007750(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        v15 = v14;
      else
        v15 = v14 & 0xFFFFFFFE;
      if ((_DWORD)v15)
      {
        *(_DWORD *)buf = 67109888;
        v22 = a3;
        v23 = 1024;
        v24 = a4;
        v25 = 2048;
        v26 = a5;
        v27 = 1024;
        v28 = v12;
        v16 = (const char *)_os_log_send_and_compose_impl(v15, &v20, 0, 0);
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
    if (qword_1000E01B0 != -1)
      dispatch_once(&qword_1000E01B0, &stru_1000D1C30);
    v18 = qword_1000E01A8;
    if (os_log_type_enabled((os_log_t)qword_1000E01A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v22 = a3;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Terminated process %d", buf, 8u);
    }
  }
  return v11 == 0;
}

@end
