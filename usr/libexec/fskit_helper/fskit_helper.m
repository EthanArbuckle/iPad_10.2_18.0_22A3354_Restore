void start()
{
  FSKitHelperDelegate *v0;
  id v1;
  uint64_t v2;
  NSObject *v3;
  NSMutableDictionary *v4;
  void *v5;
  uint8_t v6[16];

  v0 = objc_opt_new(FSKitHelperDelegate);
  v1 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.fskit.fskit_helper"));
  v2 = fskit_std_log(objc_msgSend(v1, "setDelegate:", v0));
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "FSKitHelper: listening", v6, 2u);
  }

  v4 = objc_opt_new(NSMutableDictionary);
  v5 = (void *)qword_1000087C0;
  qword_1000087C0 = (uint64_t)v4;

  objc_msgSend(v1, "resume");
  dispatch_main();
}

void sub_100001664(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_1000016E4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000017C4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000018EC(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  unsigned int v6;
  const char *v7;
  gid_t v8;
  const char *v9;
  int v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  int v19;
  _BOOL4 v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  int *v25;
  uint64_t v26;
  NSObject *v27;
  int v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  unsigned int v33;
  __int16 v34;
  gid_t v35;
  uint8_t buf[1032];

  v2 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String");
  v3 = fskit_std_log(v2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "FSKitHelper:message:processing:start", buf, 2u);
  }

  v5 = (void *)os_transaction_create("com.apple.fskit.helper.openDevice");
  v6 = objc_msgSend(*(id *)(a1 + 40), "euid");
  v7 = (const char *)objc_msgSend(*(id *)(a1 + 40), "egid");
  if (!v2 || (v8 = v7, (v7 = realpath_DARWIN_EXTSN(v2, (char *)buf)) == 0))
  {
    v10 = 2;
    goto LABEL_8;
  }
  v9 = v7;
  v7 = (const char *)strncmp(v7, "/dev/rdisk", 0xAuLL);
  if ((_DWORD)v7)
  {
    v10 = 22;
LABEL_8:
    v11 = fskit_std_log(v7);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_100002740((uint64_t)v2, v12);

    goto LABEL_11;
  }
  v17 = fskit_std_log(v7);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = *(_DWORD *)(a1 + 64);
    v28 = 136315906;
    v29 = v9;
    v30 = 1024;
    v31 = v19;
    v32 = 1024;
    v33 = v6;
    v34 = 1024;
    v35 = v8;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "FSKitHelper:message:processing:open:%s:flags:%d:uid:%d:gid:%d", (uint8_t *)&v28, 0x1Eu);
  }

  *__error() = 0;
  v20 = (v6 | v8) != 0;
  if (!(v6 | v8))
    goto LABEL_23;
  v21 = pthread_setugid_np(v6, v8);
  if (!(_DWORD)v21)
    goto LABEL_23;
  v22 = fskit_std_log(v21);
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    sub_100002830(v6, v8, v23);

  v10 = *__error();
  if (v10)
  {
    v24 = 0xFFFFFFFFLL;
  }
  else
  {
LABEL_23:
    v24 = open(v9, *(_DWORD *)(a1 + 64));
    v25 = __error();
    v10 = *v25;
    if (!v20)
    {
      if ((v24 & 0x80000000) != 0)
        goto LABEL_28;
      goto LABEL_25;
    }
  }
  v25 = (int *)pthread_setugid_np(0xFFFFFF9B, 0xFFFFFF9B);
  if ((v24 & 0x80000000) != 0)
  {
LABEL_28:
    v26 = fskit_std_log(v25);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      sub_1000027B0((uint64_t)v9, v10, v27);

    if (v10)
      goto LABEL_11;
    goto LABEL_31;
  }
LABEL_25:
  if (v10)
  {
LABEL_11:
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v10, 0));
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    goto LABEL_12;
  }
LABEL_31:
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[FSBlockDeviceResource resourceWithBSDName:devicePath:fileDescriptor:writable:](FSBlockDeviceResource, "resourceWithBSDName:devicePath:fileDescriptor:writable:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), v24, (*(_DWORD *)(a1 + 64) >> 1) & 1));
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  close(v24);
LABEL_12:

  v15 = fskit_std_log(v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    LOWORD(v28) = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "FSKitHelper:message:processing:done", (uint8_t *)&v28, 2u);
  }

}

void sub_100001DB8(uint64_t a1)
{
  id *v2;
  id v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  char *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  NSObject *v25;
  char *v26;
  void *v27;
  id v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  _QWORD v37[6];
  _QWORD v38[6];
  uint64_t v39;
  uint8_t v40[16];
  uint8_t v41[32];
  _BYTE buf[24];
  void *v43;

  v2 = (id *)(a1 + 32);
  v3 = objc_msgSend(*(id *)(a1 + 32), "isRevoked");
  v4 = (int)v3;
  v5 = fskit_std_log(v3);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (!v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v11 = *v2;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v2, "getResourceID"));
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[FSKitHelper wipeFS:includingRanges:excludingRanges:replyHandler:]_block_invoke";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v11;
      *(_WORD *)&buf[22] = 2112;
      v43 = v12;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s:start:resource(%p):resourceID(%@)", buf, 0x20u);

    }
    v39 = 0;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LODWORD(v43) = 0;
    v14 = fskit_std_log(v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      sub_100002AD0(v41, (int)objc_msgSend(*v2, "fileDescriptor"), (uint64_t)objc_msgSend(*v2, "blockSize"), v15);

    v16 = (void *)os_transaction_create("com.apple.fskit.helper.wipeFS");
    v17 = wipefs_alloc(objc_msgSend(*v2, "fileDescriptor"), objc_msgSend(*v2, "blockSize"), &v39);
    *(_DWORD *)(*(_QWORD *)&buf[8] + 24) = v17;
    if ((_DWORD)v17)
    {
      v18 = fskit_std_log(v17);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = strerror(*(_DWORD *)(*(_QWORD *)&buf[8] + 24));
        sub_100002A9C((uint64_t)v20, (uint64_t)v40);
      }

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, *(int *)(*(_QWORD *)&buf[8] + 24), 0));
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_28:

      _Block_object_dispose(buf, 8);
      return;
    }
    v22 = *(void **)(a1 + 40);
    if (v22
      && (v38[0] = _NSConcreteStackBlock,
          v38[1] = 3221225472,
          v38[2] = sub_100002230,
          v38[3] = &unk_100004218,
          v38[4] = buf,
          v38[5] = v39,
          v23 = objc_msgSend(v22, "enumerateRangesUsingBlock:", v38),
          *(_DWORD *)(*(_QWORD *)&buf[8] + 24)))
    {
      v24 = fskit_std_log(v23);
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = strerror(*(_DWORD *)(*(_QWORD *)&buf[8] + 24));
        sub_100002A68((uint64_t)v26, (uint64_t)v40);
      }
    }
    else
    {
      v27 = *(void **)(a1 + 48);
      if (v27
        && (v37[0] = _NSConcreteStackBlock,
            v37[1] = 3221225472,
            v37[2] = sub_1000022CC,
            v37[3] = &unk_100004218,
            v37[4] = buf,
            v37[5] = v39,
            v28 = objc_msgSend(v27, "enumerateRangesUsingBlock:", v37),
            *(_DWORD *)(*(_QWORD *)&buf[8] + 24)))
      {
        v29 = fskit_std_log(v28);
        v25 = objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v30 = strerror(*(_DWORD *)(*(_QWORD *)&buf[8] + 24));
          sub_100002A34((uint64_t)v30, (uint64_t)v40);
        }
      }
      else
      {
        v31 = wipefs_wipe(v39);
        *(_DWORD *)(*(_QWORD *)&buf[8] + 24) = v31;
        if (!(_DWORD)v31)
        {
          v21 = 0;
          goto LABEL_25;
        }
        v32 = fskit_std_log(v31);
        v25 = objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v33 = strerror(*(_DWORD *)(*(_QWORD *)&buf[8] + 24));
          sub_100002A00((uint64_t)v33, (uint64_t)v40);
        }
      }
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, *(int *)(*(_QWORD *)&buf[8] + 24), 0));
LABEL_25:
    wipefs_free(&v39);

    v35 = fskit_std_log(v34);
    v36 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      sub_1000029C0(v36);

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    goto LABEL_28;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_100002934(v2);

  v8 = *(_QWORD *)(a1 + 56);
  v9 = fs_errorForPOSIXError(9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v10);

}

void sub_1000021E4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100002230(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v8;
  NSObject *v9;
  uint64_t result;

  v8 = fskit_std_log(a1);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    sub_100002B24();

  result = wipefs_include_blocks(*(_QWORD *)(a1 + 40), a2, a3);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    *a4 = 1;
  return result;
}

uint64_t sub_1000022CC(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v8;
  NSObject *v9;
  uint64_t result;

  v8 = fskit_std_log(a1);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    sub_100002B84();

  result = wipefs_except_blocks(*(_QWORD *)(a1 + 40), a2, a3);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    *a4 = 1;
  return result;
}

void sub_10000248C(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  int *v6;
  void *v7;
  id v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;

  v2 = fskit_std_log(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = *(void **)(a1 + 32);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getResourceID"));
    v16 = 136315650;
    v17 = "-[FSKitHelper revoke:replyHandler:]_block_invoke";
    v18 = 2048;
    v19 = v4;
    v20 = 2112;
    v21 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s:start:resource(%p):resourceID(%@)", (uint8_t *)&v16, 0x20u);

  }
  v6 = *(int **)(a1 + 32);
  if (v6 && (v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "devicePath")), v7, v7))
  {
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "devicePath")));
    v9 = revoke((const char *)objc_msgSend(v8, "UTF8String"));

    if (v9)
    {
      v6 = __error();
      v10 = *v6;
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 22;
  }
  v11 = fskit_std_log(v6);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v16 = 136315394;
    v17 = "-[FSKitHelper revoke:replyHandler:]_block_invoke";
    v18 = 1024;
    LODWORD(v19) = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s:reply(%d)", (uint8_t *)&v16, 0x12u);
  }

  v13 = *(_QWORD *)(a1 + 40);
  v14 = fs_errorForPOSIXError(v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v15);

}

void sub_100002654(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_100002664(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_100002698(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

uint64_t sub_1000026CC(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(_QWORD *)(a2 + 4) = result;
  return result;
}

void sub_1000026D8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100001664((void *)&_mh_execute_header, a1, a3, "FSKitHelper:connection:reject", a5, a6, a7, a8, 0);
}

void sub_10000270C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100001664((void *)&_mh_execute_header, a1, a3, "FSKitHelper:connection:accept", a5, a6, a7, a8, 0);
}

void sub_100002740(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 136446210;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "FSKitHelper: %{public}s: invalid path\n", (uint8_t *)&v2, 0xCu);
  sub_1000026AC();
}

void sub_1000027B0(uint64_t a1, int a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;

  v3 = 136446466;
  v4 = a1;
  v5 = 1024;
  v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "FSKitHelper: %{public}s: error=%d\n", (uint8_t *)&v3, 0x12u);
  sub_1000026AC();
}

void sub_100002830(int a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;

  v3[0] = 67109376;
  v3[1] = a1;
  v4 = 1024;
  v5 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to setugid to (%d,%d)", (uint8_t *)v3, 0xEu);
  sub_1000026AC();
}

void sub_1000028B0(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "BSDName"));
  sub_100002678();
  sub_100002664((void *)&_mh_execute_header, v2, v3, "%s:reply(EBADF): Can't find queue for BSD name (%@), resource was revoked already, can't wipeFS", v4, v5, v6, v7, 2u);

  sub_10000268C();
}

void sub_100002934(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a1, "BSDName"));
  sub_100002678();
  sub_100002664((void *)&_mh_execute_header, v2, v3, "%s:reply(EBADF): BSD name (%@) resource was revoked already, can't wipeFS", v4, v5, v6, v7, 2u);

  sub_10000268C();
}

void sub_1000029C0(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "FSKitHelper:wipeFS:done", v1, 2u);
}

void sub_100002A00(uint64_t a1, uint64_t a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  sub_1000026CC(a1, a2, 4.8149e-34);
  sub_100002654((void *)&_mh_execute_header, v2, v3, "FSKitHelper:wipeFS:wipefs_wipe:%s", v4);
}

void sub_100002A34(uint64_t a1, uint64_t a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  sub_1000026CC(a1, a2, 4.8149e-34);
  sub_100002654((void *)&_mh_execute_header, v2, v3, "FSKitHelper:wipeFS:wipefs_except_blocks:%s", v4);
}

void sub_100002A68(uint64_t a1, uint64_t a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  sub_1000026CC(a1, a2, 4.8149e-34);
  sub_100002654((void *)&_mh_execute_header, v2, v3, "FSKitHelper:wipeFS:wipefs_include_blocks:%s", v4);
}

void sub_100002A9C(uint64_t a1, uint64_t a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  sub_1000026CC(a1, a2, 4.8149e-34);
  sub_100002654((void *)&_mh_execute_header, v2, v3, "FSKitHelper:wipeFS:wipefs_alloc:%s", v4);
}

void sub_100002AD0(uint8_t *buf, int a2, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 67109376;
  *((_DWORD *)buf + 1) = a2;
  *((_WORD *)buf + 4) = 2048;
  *(_QWORD *)(buf + 10) = a3;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "FSKitHelper:wipeFS:start:fd:%d:blockSize:%llu", buf, 0x12u);
}

void sub_100002B24()
{
  uint64_t v0;
  os_log_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_1000026B4();
  sub_100002698((void *)&_mh_execute_header, v0, v1, "FSKitHelper:wipeFS:wipefs_include_blocks:%lu.%lu", v2, v3);
  sub_1000026AC();
}

void sub_100002B84()
{
  uint64_t v0;
  os_log_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_1000026B4();
  sub_100002698((void *)&_mh_execute_header, v0, v1, "FSKitHelper:wipeFS:wipefs_except_blocks::%lu.%lu", v2, v3);
  sub_1000026AC();
}

void sub_100002BE4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "BSDName"));
  sub_100002678();
  sub_100002664((void *)&_mh_execute_header, v2, v3, "%s:reply(EINVAL): Can't find queue for BSD name (%@), resouce wasn't opened or was revoked already", v4, v5, v6, v7, 2u);

  sub_10000268C();
}

id objc_msgSend_BSDName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BSDName");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_blockSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blockSize");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_createQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createQueue:");
}

id objc_msgSend_devicePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "devicePath");
}

id objc_msgSend_egid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "egid");
}

id objc_msgSend_enumerateRangesUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateRangesUsingBlock:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_euid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "euid");
}

id objc_msgSend_fileDescriptor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileDescriptor");
}

id objc_msgSend_getResourceID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getResourceID");
}

id objc_msgSend_getResourceQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getResourceQueue:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_isRevoked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRevoked");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_resourceWithBSDName_devicePath_fileDescriptor_writable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resourceWithBSDName:devicePath:fileDescriptor:writable:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
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

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}
