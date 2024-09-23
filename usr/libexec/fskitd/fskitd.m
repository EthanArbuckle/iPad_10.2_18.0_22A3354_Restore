uint64_t sub_100003CD4(int a1, id a2, _OWORD *a3)
{
  const char *v5;
  const char *v6;
  size_t v7;
  int v9;

  v5 = (const char *)objc_msgSend(objc_retainAutorelease(a2), "UTF8String");
  v6 = v5;
  *a3 = 0u;
  a3[1] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  if (a1 || *v5 != 47)
  {
    v7 = strlen(v5);
    memcpy((char *)a3 + 4, v6, v7);
  }
  else
  {
    v9 = 0;
    sscanf(v5 + 1, "%x", &v9);
    *((_DWORD *)a3 + 1) = v9;
    a1 = -1;
  }
  *(_DWORD *)a3 = a1;
  return 0;
}

id sub_100003D80(unsigned int *a1, _DWORD *a2, _QWORD *a3, int *a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  int v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BOOL8 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id v38;

  *a4 = 0;
  v9 = *a1;
  *a2 = v9;
  v10 = v9;
  if ((_DWORD)v9 == -1)
  {
    v10 = a1[1];
    *a2 = v10;
  }
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C760, "lookup:", v10)));
  v12 = v11;
  *a3 = v11;
  *a4 = 70;
  if (v11)
  {
    if (objc_msgSend(v11, "is_killing_io"))
    {
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 5;
LABEL_16:
      *a4 = v16;
      goto LABEL_17;
    }
    if ((_DWORD)v9 == -1)
    {
      v38 = 0;
      v18 = objc_msgSend(v12, "ensureConnected:status:", a5, &v38);
      v19 = v38;
      v14 = v19;
      if ((v18 & 1) != 0)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "rootLIFileHandle"));
        if (!v20)
        {
          v29 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
          if (v29)
            sub_100036DC4(v29, v30, v31, v32, v33, v34, v35, v36);
          v13 = 0;
          v15 = 0;
          v16 = 70;
          goto LABEL_16;
        }
        *a4 = 0;
        v13 = v20;
        v15 = v13;
      }
      else
      {
        v13 = 0;
        v15 = 0;
        if (!v19)
          *a4 = 0;
      }
    }
    else
    {
      v37 = 0;
      v17 = objc_msgSend(v12, "ensureConnected:status:", 0, &v37);
      v14 = v37;
      if ((v17 & 1) == 0)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          sub_100036DF8((uint64_t)v14, v21, v22, v23, v24, v25, v26, v27);
        v13 = 0;
        v15 = 0;
        v16 = 57;
        goto LABEL_16;
      }
      *a4 = 0;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a1 + 1));
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
    v14 = 0;
    v15 = 0;
  }
LABEL_17:

  return v15;
}

uint64_t sub_100003F5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, __int16 a5, int a6, unsigned int *a7)
{
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  void *v29;
  _BOOL8 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  _QWORD v40[6];
  _QWORD v41[5];
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  int v46[3];
  int v47;
  __int128 v48;
  _OWORD v49[64];
  _OWORD buf[65];

  v48 = 0u;
  memset(v49, 0, 496);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a4));
  v47 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46[0] = 0;
  if (a6)
  {
    v42 = 0;
    v14 = sub_100003D80(a7, &v47, &v42, v46, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = v42;
    if (v16)
      goto LABEL_3;
LABEL_16:
    v30 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v30)
      sub_100036E64(v30, v31, v32, v33, v34, v35, v36, v37);
    v17 = 0;
    v25 = 22;
    goto LABEL_19;
  }
  v28 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
  if ((a5 & 0x400) != 0)
  {
    v29 = v12;
    if (v28)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "mounting detached lifs mount", (uint8_t *)buf, 2u);
      v29 = v12;
    }
  }
  else
  {
    v29 = v13;
    if (v28)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "mounting lifs mount", (uint8_t *)buf, 2u);
      v29 = v13;
    }
  }
  v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C760, "lookupByPath:", v29));
  v15 = 0;
  if (!v16)
    goto LABEL_16;
LABEL_3:
  if ((objc_msgSend(v16, "is_connected") & 1) == 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "connect"));
    if (v17)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_100036E98((uint64_t)v17, v18, v19, v20, v21, v22, v23, v24);
      v25 = 61;
LABEL_19:
      v27 = 0;
      v26 = 0;
      *((_DWORD *)v44 + 6) = v25;
      goto LABEL_22;
    }
  }
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100004388;
  v41[3] = &unk_100054868;
  v41[4] = &v43;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "fsSynchObjWithErrorHandler:", v41));
  if (v26)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "rootLIFileHandle"));
    sub_100003CD4((int)objc_msgSend(v16, "midx"), v27, v49);
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_1000043E0;
    v40[3] = &unk_100054890;
    v40[4] = &v43;
    v40[5] = &v48;
    objc_msgSend(v26, "fileAttributes:requestID:reply:", v27, -1, v40);
  }
  else
  {
    v27 = 0;
  }
  v17 = 0;
LABEL_22:
  v38 = *((_DWORD *)v44 + 6);
  if (v38)
  {
    memset(buf, 0, 512);
    sub_100004480(a2, v38, 2, (uint64_t *)buf);
  }
  else
  {
    sub_100004480(a2, 0, 25, (uint64_t *)&v48);
  }
  _Block_object_dispose(&v43, 8);

  return 0;
}

void sub_100004368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100004388(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100036F04((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 22;

}

void sub_1000043E0(uint64_t a1, int a2, void *a3)
{
  id v5;
  BOOL v6;
  uint64_t v7;
  _OWORD *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  id v19;

  v5 = a3;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  if (!a2)
  {
    if (v5)
    {
      v19 = v5;
      v6 = (unint64_t)objc_msgSend(v5, "length") >= 0xB8;
      v5 = v19;
      if (v6)
      {
        v7 = *(_QWORD *)(a1 + 40);
        v8 = objc_msgSend(objc_retainAutorelease(v19), "bytes");
        v9 = v8[3];
        v11 = *v8;
        v10 = v8[1];
        *(_OWORD *)(v7 + 112) = v8[2];
        *(_OWORD *)(v7 + 128) = v9;
        *(_OWORD *)(v7 + 80) = v11;
        *(_OWORD *)(v7 + 96) = v10;
        v12 = v8[7];
        v14 = v8[4];
        v13 = v8[5];
        *(_OWORD *)(v7 + 176) = v8[6];
        *(_OWORD *)(v7 + 192) = v12;
        *(_OWORD *)(v7 + 144) = v14;
        *(_OWORD *)(v7 + 160) = v13;
        v16 = v8[9];
        v15 = v8[10];
        v17 = *((_QWORD *)v8 + 22);
        v18 = v8[8];
        v5 = v19;
        *(_QWORD *)(v7 + 256) = v17;
        *(_OWORD *)(v7 + 224) = v16;
        *(_OWORD *)(v7 + 240) = v15;
        *(_OWORD *)(v7 + 208) = v18;
      }
    }
  }

}

void sub_100004480(uint64_t a1, int a2, int a3, uint64_t *a4)
{
  id v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  int v19;

  v11 = 0;
  *a4 = a1;
  *((_DWORD *)a4 + 2) = a2;
  v6 = objc_msgSend((id)qword_10005C718, "callStructMethod:inStruct:inSize:outStruct:outStructSize:");
  if ((_DWORD)v6)
  {
    v7 = (int)v6;
    v8 = livefs_std_log(v6);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *a4;
      *(_DWORD *)buf = 136315906;
      v13 = "lifs_send_reply";
      v14 = 1024;
      v15 = a3;
      v16 = 2048;
      v17 = v10;
      v18 = 1024;
      v19 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s: Failed to send reply with selector: %u reqid: %llu status: %d", buf, 0x22u);
    }

  }
}

uint64_t sub_100004588(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int *a4)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  int v21;
  uint64_t v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  _QWORD v27[5];
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  int v32[3];
  int v33;
  uint8_t buf[16];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;

  v33 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32[0] = 0;
  v28 = 0;
  v5 = sub_100003D80(a4, &v33, &v28, v32, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v28;
  v8 = v7;
  if (!v7)
  {
    v12 = livefs_std_log(0);
    v11 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100036F70(v11, v13, v14, v15, v16, v17, v18, v19);
    goto LABEL_10;
  }
  v9 = livefs_std_log(v7);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v24 = objc_msgSend(v8, "mnt_flags");
    v25 = objc_msgSend(v8, "is_in_unmount_method");
    v26 = objc_msgSend(v8, "is_killing_io");
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)&buf[4] = v24;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v25;
    *(_WORD *)&buf[14] = 1024;
    LODWORD(v35) = v26;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Unmount callback fired flags %x, is_in_unmount %d killing %d", buf, 0x14u);
  }

  if ((objc_msgSend(v8, "mnt_flags") & 0x100) != 0
    && (objc_msgSend(v8, "is_in_unmount_method") & 1) == 0)
  {
    v11 = v8;
    objc_sync_enter(v11);
    if (-[NSObject is_in_unmount_method](v11, "is_in_unmount_method"))
    {
      objc_sync_exit(v11);
LABEL_10:

      goto LABEL_11;
    }
    if ((-[NSObject mnt_flags](v11, "mnt_flags") & 0x200) != 0)
    {
      -[NSObject setIs_killing_io:](v11, "setIs_killing_io:", 1);
      v23 = 6;
    }
    else
    {
      v23 = 2;
    }
    -[NSObject setIs_in_unmount_syscall:](v11, "setIs_in_unmount_syscall:", 1);
    objc_sync_exit(v11);

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000048B8;
    v27[3] = &unk_1000548B8;
    v27[4] = &v29;
    +[fskitdXPCServer LiveMounterDoUnmountPreflight:how:reply:](fskitdXPCServer, "LiveMounterDoUnmountPreflight:how:reply:", v11, v23, v27);
  }
LABEL_11:
  v20 = v8;
  objc_sync_enter(v20);
  if (objc_msgSend(v20, "is_in_unmount_syscall"))
    objc_msgSend(v20, "setIs_in_unmount_syscall:", 0);
  objc_sync_exit(v20);

  v21 = *((_DWORD *)v30 + 6);
  if (!v21)
  {
    v21 = -1;
    *((_DWORD *)v30 + 6) = -1;
  }
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v37 = 0u;
  v35 = 0u;
  v36 = 0u;
  *(_OWORD *)buf = 0u;
  sub_100004480(a2, v21, 2, (uint64_t *)buf);
  _Block_object_dispose(&v29, 8);

  return 0;
}

void sub_100004870(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  void *v16;

  objc_sync_exit(v16);
  _Block_object_dispose(&a16, 8);
  _Unwind_Resume(a1);
}

void sub_1000048B8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = livefs_std_log(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100036FA0();

    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 22;
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10 = 138412546;
      v11 = 0;
      v12 = 2112;
      v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "spontaneous unmount done with error %@ name %@", (uint8_t *)&v10, 0x16u);
    }

  }
}

uint64_t sub_1000049C4(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int *a4)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD block[4];
  id v21;
  uint64_t v22;
  int v23;
  id v24;
  uint64_t v25;
  _OWORD v26[65];

  v24 = 0;
  v25 = 0;
  v5 = sub_100003D80(a4, (_DWORD *)&v25 + 1, &v24, (int *)&v25, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v24;
  v8 = v7;
  if (!v7)
  {
    v10 = livefs_std_log(0);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100036F70(v11, v12, v13, v14, v15, v16, v17, v18);

    goto LABEL_7;
  }
  if ((objc_msgSend(v7, "mnt_flags") & 0x100) == 0)
  {
LABEL_7:
    memset(v26, 0, 512);
    sub_100004480(a2, v25, 2, (uint64_t *)v26);
    goto LABEL_8;
  }
  v9 = qword_10005C710;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004B58;
  block[3] = &unk_100054920;
  v21 = v8;
  v22 = a2;
  v23 = 2;
  dispatch_async(v9, block);

LABEL_8:
  return 0;
}

void sub_100004B58(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[5];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  _BYTE v19[32];
  _OWORD v20[65];

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_100004DB8;
  v17 = sub_100004DC8;
  v18 = 0;
  if (objc_msgSend(*(id *)(a1 + 32), "isFSKitModule"))
  {
    v2 = *(void **)(a1 + 32);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100004DD0;
    v12[3] = &unk_100054868;
    v12[4] = &v13;
    v3 = objc_msgSend(v2, "forgetModuleVolumeWithFlags:reply:", 2, v12);
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "providerName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "volumeName"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100004DE0;
    v11[3] = &unk_100054868;
    v11[4] = &v13;
    +[LIFSClientConnector forgetLiveFilesVolumeForProvider:volume:withFlags:handler:](LIFSClientConnector, "forgetLiveFilesVolumeForProvider:volume:withFlags:handler:", v4, v5, 2, v11);

  }
  if (v14[5])
  {
    v6 = livefs_std_log(v3);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = v14[5];
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "volumeName"));
      sub_100037008(v8, v9, (uint64_t)v19, v7);
    }

  }
  v10 = *(_QWORD *)(a1 + 40);
  memset(v20, 0, 512);
  sub_100004480(v10, 0, 2, (uint64_t *)v20);
  +[fskitdXPCServer LiveMounterDoUnmountCleanup:how:reply:](fskitdXPCServer, "LiveMounterDoUnmountCleanup:how:reply:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 48), &stru_1000548F8);
  _Block_object_dispose(&v13, 8);

}

void sub_100004D90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100004DB8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100004DC8(uint64_t a1)
{

}

void sub_100004DD0(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_100004DE0(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_100004DF0(id a1, NSError *a2, NSString *a3)
{
  NSError *v4;
  NSString *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  NSString *v12;

  v4 = a2;
  v5 = a3;
  v6 = livefs_std_log();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100037064();
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = 138412546;
    v10 = 0;
    v11 = 2112;
    v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "spontaneous unmount cleanup done with error %@ name %@", (uint8_t *)&v9, 0x16u);
  }

}

uint64_t sub_100004EE0(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD v18[5];
  _QWORD v19[5];
  int v20;
  id v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;

  v21 = 0;
  v22 = 0;
  v4 = sub_100003D80(a3, (_DWORD *)&v22 + 1, &v21, (int *)&v22, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = v21;
  v7 = v6;
  if (!v6)
  {
    v11 = livefs_std_log(0);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1000370CC();

    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v13 = a2;
    v14 = 22;
    goto LABEL_10;
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000513C;
  v19[3] = &unk_100054940;
  v20 = HIDWORD(v22);
  v19[4] = a2;
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fsObjWithErrorHandler:", v19));
  if (!v8)
  {
    v15 = livefs_std_log(0);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_100037138();

    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v13 = a2;
    v14 = 5;
LABEL_10:
    sub_100004480(v13, v14, 2, (uint64_t *)&v23);
    goto LABEL_11;
  }
  v9 = (void *)v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rootLIFileHandle"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000522C;
  v18[3] = &unk_100054960;
  v18[4] = a2;
  objc_msgSend(v9, "volumeStatistics:requestID:reply:", v10, a2, v18);

LABEL_11:
  return 0;
}

void sub_10000513C(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _OWORD v7[65];

  v3 = a2;
  v4 = livefs_std_log(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_1000371A4();

  v6 = *(_QWORD *)(a1 + 32);
  memset(v7, 0, 512);
  sub_100004480(v6, 5, 2, (uint64_t *)v7);

}

void sub_10000522C(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;

  v5 = a3;
  v6 = v5;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  if (!a2
    && v5
    && (unint64_t)objc_msgSend(v5, "length", v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26,
                           v27,
                           v28,
                           v29,
                           v30,
                           v31,
                           v32,
                           v33,
                           v34,
                           v35,
                           v36,
                           v37,
                           v38,
                           v39,
                           (_QWORD)v40) >= 0x28)
  {
    v7 = objc_msgSend(objc_retainAutorelease(v6), "bytes");
    v8 = v7[4];
    v9 = *((_OWORD *)v7 + 1);
    v11 = *(_OWORD *)v7;
    v12 = v9;
    *(_QWORD *)&v13 = v8;
  }
  sub_100004480(*(_QWORD *)(a1 + 32), a2, 3, (uint64_t *)&v10);

}

uint64_t sub_100005324(uint64_t a1, uint64_t a2, unsigned int *a3, uint64_t a4)
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  _QWORD v23[5];
  int v24;
  id v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;

  v25 = 0;
  v26 = 0;
  v6 = sub_100003D80(a3, (_DWORD *)&v26 + 1, &v25, (int *)&v26, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = v25;
  v9 = v8;
  if (!v8)
  {
    v13 = livefs_std_log(0);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_100037210();

    v15 = v26;
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v16 = a2;
    goto LABEL_10;
  }
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100005598;
  v23[3] = &unk_100054940;
  v24 = HIDWORD(v26);
  v23[4] = a2;
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fsObjWithErrorHandler:", v23));
  if (!v10)
  {
    v17 = livefs_std_log(0);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_10003727C();

    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v16 = a2;
    v15 = 5;
LABEL_10:
    sub_100004480(v16, v15, 2, (uint64_t *)&v27);
    goto LABEL_11;
  }
  v11 = (void *)v10;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100005688;
  v20[3] = &unk_100054988;
  v21 = (id)objc_claimAutoreleasedReturnValue(+[FSFileName nameWithCString:](FSFileName, "nameWithCString:", a4));
  v22 = a2;
  v12 = v21;
  objc_msgSend(v11, "otherAttributeOf:named:requestID:reply:", v7, v12, a2, v20);

LABEL_11:
  return 0;
}

void sub_100005598(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _OWORD v7[65];

  v3 = a2;
  v4 = livefs_std_log(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_1000372E8();

  v6 = *(_QWORD *)(a1 + 32);
  memset(v7, 0, 512);
  sub_100004480(v6, 5, 2, (uint64_t *)v7);

}

void sub_100005688(uint64_t a1, int a2, void *a3)
{
  id v6;
  _BYTE *v7;
  id v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;
  unsigned int v11;
  int v12;
  int v13;
  __int128 v14;
  int v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  v18 = 0u;
  v19 = 0u;
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "data", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                      0,
                                      0,
                                      0,
                                      0,
                                      0,
                                      0,
                                      0,
                                      0,
                                      0,
                                      0,
                                      0,
                                      0,
                                      0,
                                      0,
                                      0,
                                      0,
                                      0,
                                      0,
                                      0,
                                      0,
                                      0,
                                      0,
                                      0,
                                      0,
                                      0,
                                      0,
                                      0,
                                      0,
                                      0,
                                      0,
                                      0,
                                      0,
                                      0,
                                      0,
                                      0,
                                      0,
                                      0,
                                      0,
                                      0,
                                      0,
                                      0,
                                      0,
                                      0,
                                      0,
                                      0)));
  v7 = objc_msgSend(v6, "bytes");

  v8 = objc_retainAutorelease(a3);
  v9 = (unsigned __int8 *)objc_msgSend(v8, "bytes");
  if (!v8)
    goto LABEL_16;
  if (*v7 == 95)
  {
    v10 = v9;
    v11 = v7[1];
    v12 = 45;
    if (v11 > 0x4E)
    {
      if (v11 == 79 || v11 == 83)
      {
        LODWORD(v16) = objc_msgSend(v8, "length");
        *(_QWORD *)&v17 = v10;
        if (*v7 == 95 && v7[1] == 83)
          v13 = 3;
        else
          v13 = 2;
        v15 = v13;
        goto LABEL_16;
      }
    }
    else
    {
      if (v11 == 66)
      {
        v15 = 0;
        LODWORD(v16) = *v9;
        goto LABEL_16;
      }
      if (v11 == 78)
      {
        v15 = 1;
        v16 = *(_QWORD *)v9;
LABEL_16:
        v12 = a2;
      }
    }
  }
  else
  {
    v12 = 45;
  }
  sub_100004480(*(_QWORD *)(a1 + 40), v12, 23, (uint64_t *)&v14);
}

uint64_t sub_100005824(uint64_t a1, uint64_t a2, unsigned int *a3, const char *a4, const char *a5, unsigned int a6)
{
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  BOOL v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  void *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  uint64_t v38;
  BOOL v39;
  _QWORD v40[5];
  int v41;
  id v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;

  v42 = 0;
  v43 = 0;
  v10 = sub_100003D80(a3, (_DWORD *)&v43 + 1, &v42, (int *)&v43, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = v42;
  v13 = v12;
  if (v12)
  {
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_100005C88;
    v40[3] = &unk_100054940;
    v41 = HIDWORD(v43);
    v40[4] = a2;
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "fsObjWithErrorHandler:", v40));
    if (v14)
    {
      v15 = (void *)v14;
      v16 = strcmp("_S_f_vol_name", a4);
      v17 = v16 == 0;
      v18 = a6;
      if (v16)
      {
        v19 = 0;
      }
      else
      {
        v19 = objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", a5, strnlen(a5, a6), 4);
        if (!v19)
        {
          v74 = 0u;
          v75 = 0u;
          v72 = 0u;
          v73 = 0u;
          v70 = 0u;
          v71 = 0u;
          v68 = 0u;
          v69 = 0u;
          v66 = 0u;
          v67 = 0u;
          v64 = 0u;
          v65 = 0u;
          v62 = 0u;
          v63 = 0u;
          v60 = 0u;
          v61 = 0u;
          v58 = 0u;
          v59 = 0u;
          v56 = 0u;
          v57 = 0u;
          v54 = 0u;
          v55 = 0u;
          v52 = 0u;
          v53 = 0u;
          v50 = 0u;
          v51 = 0u;
          v48 = 0u;
          v49 = 0u;
          v46 = 0u;
          v47 = 0u;
          v44 = 0u;
          v45 = 0u;
          sub_100004480(a2, 22, 2, (uint64_t *)&v44);
          goto LABEL_21;
        }
      }
      v34 = v11;
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", a5, v18));
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[FSFileName nameWithCString:](FSFileName, "nameWithCString:", a4));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "string"));
      if (objc_msgSend(v28, "isEqual:", CFSTR("_N_SYNC")))
      {
        v29 = *(_QWORD *)a5;

        if ((v29 & 2) != 0)
        {
          v74 = 0u;
          v75 = 0u;
          v72 = 0u;
          v73 = 0u;
          v70 = 0u;
          v71 = 0u;
          v68 = 0u;
          v69 = 0u;
          v66 = 0u;
          v67 = 0u;
          v64 = 0u;
          v65 = 0u;
          v62 = 0u;
          v63 = 0u;
          v60 = 0u;
          v61 = 0u;
          v58 = 0u;
          v59 = 0u;
          v56 = 0u;
          v57 = 0u;
          v54 = 0u;
          v55 = 0u;
          v52 = 0u;
          v53 = 0u;
          v50 = 0u;
          v51 = 0u;
          v48 = 0u;
          v49 = 0u;
          v46 = 0u;
          v47 = 0u;
          v44 = 0u;
          v45 = 0u;
          v31 = livefs_std_log(v30);
          v32 = objc_claimAutoreleasedReturnValue(v31);
          v11 = v34;
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
            sub_10003742C(v32);

          objc_msgSend(v15, "setOtherAttributeOf:named:value:requestID:reply:", v34, v27, v26, a2, &stru_1000549C8);
          LODWORD(v61) = 0;
          sub_100004480(a2, 0, 22, (uint64_t *)&v44);
          goto LABEL_20;
        }
      }
      else
      {

      }
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_100005D7C;
      v35[3] = &unk_100054A58;
      v39 = v17;
      v38 = a2;
      v36 = v13;
      v37 = v19;
      v11 = v34;
      objc_msgSend(v15, "setOtherAttributeOf:named:value:requestID:reply:", v34, v27, v26, a2, v35);

LABEL_20:
LABEL_21:

      goto LABEL_22;
    }
    v24 = livefs_std_log(0);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_1000373C0();

    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v23 = a2;
    v22 = 5;
  }
  else
  {
    v20 = livefs_std_log(0);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_100037354();

    v22 = v43;
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v23 = a2;
  }
  sub_100004480(v23, v22, 2, (uint64_t *)&v44);
LABEL_22:

  return 0;
}

void sub_100005C88(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _OWORD v7[65];

  v3 = a2;
  v4 = livefs_std_log(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_1000374A8();

  v6 = *(_QWORD *)(a1 + 32);
  memset(v7, 0, 512);
  sub_100004480(v6, 5, 2, (uint64_t *)v7);

}

void sub_100005D7C(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  dispatch_queue_global_t global_queue;
  NSObject *v9;
  uint64_t v10;
  _QWORD block[4];
  id v12;
  id v13;
  uint64_t v14;
  __int128 *v15;
  int v16;
  __int128 v17;
  _OWORD v18[64];

  v7 = a4;
  v17 = 0u;
  memset(v18, 0, 496);
  if (a2)
    goto LABEL_2;
  if (a3 && objc_msgSend(a3, "length"))
  {
    LODWORD(v18[16]) = objc_msgSend(a3, "length");
    __memcpy_chk(v18, objc_msgSend(objc_retainAutorelease(a3), "bytes"), SLODWORD(v18[16]), 1024);
  }
  if (v7)
    *(_OWORD *)((char *)&v18[16] + 8) = *(_OWORD *)objc_msgSend(objc_retainAutorelease(v7), "bytes");
  else
    *(_QWORD *)&v18[17] = 0;
  if (!*(_BYTE *)(a1 + 56))
  {
LABEL_2:
    sub_100004480(*(_QWORD *)(a1 + 48), a2, 22, (uint64_t *)&v17);
  }
  else
  {
    global_queue = dispatch_get_global_queue(2, 0);
    v9 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005F60;
    block[3] = &unk_100054A30;
    v10 = *(_QWORD *)(a1 + 48);
    v16 = 0;
    v14 = v10;
    v15 = &v17;
    v12 = *(id *)(a1 + 32);
    v13 = *(id *)(a1 + 40);
    dispatch_async(v9, block);

  }
}

id sub_100005F60(uint64_t a1)
{
  sub_100004480(*(_QWORD *)(a1 + 48), *(_DWORD *)(a1 + 64), 22, *(uint64_t **)(a1 + 56));
  return objc_msgSend(*(id *)(a1 + 32), "renameToName:reply:", *(_QWORD *)(a1 + 40), &stru_100054A08);
}

void sub_100005FA0(id a1, NSError *a2)
{
  NSError *v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  NSError *v6;

  v2 = a2;
  if (v2)
  {
    v3 = livefs_std_log();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = v2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Error setting volume name: %@", (uint8_t *)&v5, 0xCu);
    }

  }
}

uint64_t sub_10000604C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _DWORD *a5)
{
  *a5 = 45;
  return 0;
}

uint64_t sub_10000605C(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int *a4, uint64_t a5)
{
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  _QWORD v23[5];
  int v24;
  _QWORD v25[5];
  int v26;
  id v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", a5, 184));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[FSFileName nameWithCString:](FSFileName, "nameWithCString:", a3));
  v27 = 0;
  v28 = 0;
  v10 = sub_100003D80(a4, (_DWORD *)&v28 + 1, &v27, (int *)&v28, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = v27;
  v13 = v12;
  if (!v12)
  {
    v16 = livefs_std_log(0);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_100037514();

    v18 = v28;
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v19 = a2;
    goto LABEL_10;
  }
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000062F0;
  v25[3] = &unk_100054940;
  v26 = HIDWORD(v28);
  v25[4] = a2;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "fsObjWithErrorHandler:", v25));
  if (!v14)
  {
    v20 = livefs_std_log(0);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_100037580();

    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v19 = a2;
    v18 = 5;
LABEL_10:
    sub_100004480(v19, v18, 2, (uint64_t *)&v29);
    goto LABEL_11;
  }
  v15 = v14;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000063E0;
  v23[3] = &unk_100054A78;
  v24 = HIDWORD(v28);
  v23[4] = a2;
  objc_msgSend(v14, "makeDirectoryIn:named:attributes:requestID:reply:", v11, v9, v8, a2, v23);

LABEL_11:
  return 0;
}

void sub_1000062F0(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _OWORD v7[65];

  v3 = a2;
  v4 = livefs_std_log(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_1000375EC();

  v6 = *(_QWORD *)(a1 + 32);
  memset(v7, 0, 512);
  sub_100004480(v6, 5, 2, (uint64_t *)v7);

}

void sub_1000063E0(uint64_t a1, int a2, void *a3, void *a4, void *a5, uint64_t a6, void *a7)
{
  id v12;
  id v13;
  id v14;
  _OWORD *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _OWORD *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _OWORD v51[12];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;

  v12 = a3;
  v13 = a5;
  v14 = a7;
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  memset(v51, 0, sizeof(v51));
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  if (!a2)
  {
    sub_100003CD4(*(_DWORD *)(a1 + 40), a4, &v36);
    if (v13
      && (unint64_t)objc_msgSend(v13, "length", v35, v36, v37, v38, v39, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v50, v51[0],
                             v51[1],
                             v51[2],
                             v51[3],
                             v51[4],
                             v51[5],
                             v51[6],
                             v51[7],
                             v51[8],
                             v51[9],
                             v51[10],
                             v51[11],
                             v52,
                             v53,
                             (_QWORD)v54) >= 0xB8)
    {
      v15 = objc_msgSend(objc_retainAutorelease(v13), "bytes");
      v16 = v15[3];
      v18 = *v15;
      v17 = v15[1];
      v42 = v15[2];
      v43 = v16;
      v40 = v18;
      v41 = v17;
      v19 = v15[7];
      v21 = v15[4];
      v20 = v15[5];
      v46 = v15[6];
      v47 = v19;
      v44 = v21;
      v45 = v20;
      v23 = v15[9];
      v22 = v15[10];
      v24 = v15[8];
      *(_QWORD *)&v51[0] = *((_QWORD *)v15 + 22);
      v49 = v23;
      v50 = v22;
      v48 = v24;
      if (!v12)
        goto LABEL_10;
    }
    else
    {
      *(_QWORD *)&v51[0] = 0;
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v40 = 0u;
      if (!v12)
        goto LABEL_10;
    }
    if ((unint64_t)objc_msgSend(v12, "length", v35, v36, v37, v38, v39, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v50, *(_QWORD *)&v51[0]) >= 0xB8)
    {
      v25 = objc_msgSend(objc_retainAutorelease(v12), "bytes");
      v26 = v25[3];
      v28 = *v25;
      v27 = v25[1];
      *(_OWORD *)((char *)&v51[2] + 8) = v25[2];
      *(_OWORD *)((char *)&v51[3] + 8) = v26;
      *(_OWORD *)((char *)v51 + 8) = v28;
      *(_OWORD *)((char *)&v51[1] + 8) = v27;
      v29 = v25[7];
      v31 = v25[4];
      v30 = v25[5];
      *(_OWORD *)((char *)&v51[6] + 8) = v25[6];
      *(_OWORD *)((char *)&v51[7] + 8) = v29;
      *(_OWORD *)((char *)&v51[4] + 8) = v31;
      *(_OWORD *)((char *)&v51[5] + 8) = v30;
      v32 = *((_QWORD *)v25 + 22);
      v33 = v25[10];
      v34 = v25[8];
      *(_OWORD *)((char *)&v51[9] + 8) = v25[9];
      *(_OWORD *)((char *)&v51[10] + 8) = v33;
      *(_OWORD *)((char *)&v51[8] + 8) = v34;
      *((_QWORD *)&v51[11] + 1) = v32;
      if (v14)
      {
LABEL_11:
        v52 = *(_OWORD *)objc_msgSend(objc_retainAutorelease(v14), "bytes");
        goto LABEL_12;
      }
      goto LABEL_9;
    }
LABEL_10:
    memset((char *)v51 + 8, 0, 184);
    if (v14)
      goto LABEL_11;
LABEL_9:
    *((_QWORD *)&v52 + 1) = 0;
  }
LABEL_12:
  sub_100004480(*(_QWORD *)(a1 + 32), a2, 5, (uint64_t *)&v35);

}

uint64_t sub_10000661C(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int *a4, uint64_t a5)
{
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  _QWORD v23[5];
  int v24;
  _QWORD v25[5];
  int v26;
  id v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", a5, 184));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[FSFileName nameWithCString:](FSFileName, "nameWithCString:", a3));
  v27 = 0;
  v28 = 0;
  v10 = sub_100003D80(a4, (_DWORD *)&v28 + 1, &v27, (int *)&v28, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = v27;
  v13 = v12;
  if (!v12)
  {
    v16 = livefs_std_log(0);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_100037658();

    v18 = v28;
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v19 = a2;
    goto LABEL_10;
  }
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000068B0;
  v25[3] = &unk_100054940;
  v26 = HIDWORD(v28);
  v25[4] = a2;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "fsObjWithErrorHandler:", v25));
  if (!v14)
  {
    v20 = livefs_std_log(0);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_1000376C4();

    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v19 = a2;
    v18 = 5;
LABEL_10:
    sub_100004480(v19, v18, 2, (uint64_t *)&v29);
    goto LABEL_11;
  }
  v15 = v14;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000069A0;
  v23[3] = &unk_100054A98;
  v24 = HIDWORD(v28);
  v23[4] = a2;
  objc_msgSend(v14, "createIn:named:attributes:requestID:reply:", v11, v9, v8, a2, v23);

LABEL_11:
  return 0;
}

void sub_1000068B0(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _OWORD v7[65];

  v3 = a2;
  v4 = livefs_std_log(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_100037730();

  v6 = *(_QWORD *)(a1 + 32);
  memset(v7, 0, 512);
  sub_100004480(v6, 5, 2, (uint64_t *)v7);

}

void sub_1000069A0(uint64_t a1, int a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  _OWORD *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _OWORD *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _OWORD v51[12];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  memset(v51, 0, sizeof(v51));
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  if (!a2)
  {
    sub_100003CD4(*(_DWORD *)(a1 + 40), a4, &v36);
    if (v12)
    {
      v14 = objc_retainAutorelease(v12);
      v15 = objc_msgSend(v14, "bytes", v35, v36, v37, v38, v39, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v50, v51[0],
              v51[1],
              v51[2],
              v51[3],
              v51[4],
              v51[5],
              v51[6],
              v51[7],
              v51[8],
              v51[9],
              v51[10],
              v51[11],
              v52,
              v53,
              (_QWORD)v54);
      v16 = v15[3];
      v18 = *v15;
      v17 = v15[1];
      v42 = v15[2];
      v43 = v16;
      v40 = v18;
      v41 = v17;
      v19 = v15[7];
      v21 = v15[4];
      v20 = v15[5];
      v46 = v15[6];
      v47 = v19;
      v44 = v21;
      v45 = v20;
      v23 = v15[9];
      v22 = v15[10];
      v24 = v15[8];
      *(_QWORD *)&v51[0] = *((_QWORD *)v15 + 22);
      v49 = v23;
      v50 = v22;
      v48 = v24;
    }
    else
    {
      *(_QWORD *)&v51[0] = 0;
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v40 = 0u;
    }
    if (v11)
    {
      v25 = objc_msgSend(objc_retainAutorelease(v11), "bytes");
      v26 = v25[3];
      v28 = *v25;
      v27 = v25[1];
      *(_OWORD *)((char *)&v51[2] + 8) = v25[2];
      *(_OWORD *)((char *)&v51[3] + 8) = v26;
      *(_OWORD *)((char *)v51 + 8) = v28;
      *(_OWORD *)((char *)&v51[1] + 8) = v27;
      v29 = v25[7];
      v31 = v25[4];
      v30 = v25[5];
      *(_OWORD *)((char *)&v51[6] + 8) = v25[6];
      *(_OWORD *)((char *)&v51[7] + 8) = v29;
      *(_OWORD *)((char *)&v51[4] + 8) = v31;
      *(_OWORD *)((char *)&v51[5] + 8) = v30;
      v33 = v25[9];
      v32 = v25[10];
      v34 = v25[8];
      *((_QWORD *)&v51[11] + 1) = *((_QWORD *)v25 + 22);
      *(_OWORD *)((char *)&v51[9] + 8) = v33;
      *(_OWORD *)((char *)&v51[10] + 8) = v32;
      *(_OWORD *)((char *)&v51[8] + 8) = v34;
      if (v13)
      {
LABEL_7:
        v52 = *(_OWORD *)objc_msgSend(objc_retainAutorelease(v13), "bytes");
        goto LABEL_10;
      }
    }
    else
    {
      memset((char *)v51 + 8, 0, 184);
      if (v13)
        goto LABEL_7;
    }
    *((_QWORD *)&v52 + 1) = 0;
  }
LABEL_10:
  sub_100004480(*(_QWORD *)(a1 + 32), a2, 4, (uint64_t *)&v35);

}

uint64_t sub_100006BB4(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int *a4, unsigned int *a5, uint64_t a6, uint64_t a7)
{
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  _QWORD v30[5];
  int v31;
  _QWORD v32[5];
  int v33;
  id v34;
  id v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", a7, 184));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[FSFileName nameWithCString:](FSFileName, "nameWithCString:", a3));
  v35 = 0;
  v36 = 0;
  v14 = sub_100003D80(a5, (_DWORD *)&v36 + 1, &v35, (int *)&v36, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = v35;
  v34 = v16;
  v17 = sub_100003D80(a4, (_DWORD *)&v36 + 1, &v34, (int *)&v36, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = v34;

  if (!v19)
  {
    v23 = livefs_std_log(v20);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_10003779C();

    v25 = v36;
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v38 = 0u;
    v37 = 0u;
    v26 = a2;
    goto LABEL_10;
  }
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100006EA4;
  v32[3] = &unk_100054940;
  v33 = HIDWORD(v36);
  v32[4] = a2;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "fsObjWithErrorHandler:", v32));
  if (!v21)
  {
    v27 = livefs_std_log(0);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      sub_100037808();

    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v38 = 0u;
    v37 = 0u;
    v26 = a2;
    v25 = 5;
LABEL_10:
    sub_100004480(v26, v25, 2, (uint64_t *)&v37);
    goto LABEL_11;
  }
  v22 = v21;
  v30[1] = 3221225472;
  v30[2] = sub_100006F94;
  v30[3] = &unk_100054A98;
  v31 = HIDWORD(v36);
  v30[4] = a2;
  v30[0] = _NSConcreteStackBlock;
  objc_msgSend(v21, "makeCloneOf:named:inDirectory:attributes:usingFlags:requestID:reply:", v15, v13, v18, v12, a6, a2, v30);

LABEL_11:
  return 0;
}

void sub_100006EA4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _OWORD v7[65];

  v3 = a2;
  v4 = livefs_std_log(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_100037874();

  v6 = *(_QWORD *)(a1 + 32);
  memset(v7, 0, 512);
  sub_100004480(v6, 5, 2, (uint64_t *)v7);

}

void sub_100006F94(uint64_t a1, int a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  _OWORD *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _OWORD *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _OWORD v50[12];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  memset(v50, 0, sizeof(v50));
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  if (!a2)
  {
    sub_100003CD4(*(_DWORD *)(a1 + 40), a4, &v35);
    if (v12
      && (unint64_t)objc_msgSend(v12, "length", v34, v35, v36, v37, v38, v39, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v50[0],
                             v50[1],
                             v50[2],
                             v50[3],
                             v50[4],
                             v50[5],
                             v50[6],
                             v50[7],
                             v50[8],
                             v50[9],
                             v50[10],
                             v50[11],
                             v51,
                             v52,
                             (_QWORD)v53) >= 0xB8)
    {
      v14 = objc_msgSend(objc_retainAutorelease(v12), "bytes");
      v15 = v14[3];
      v17 = *v14;
      v16 = v14[1];
      v41 = v14[2];
      v42 = v15;
      v39 = v17;
      v40 = v16;
      v18 = v14[7];
      v20 = v14[4];
      v19 = v14[5];
      v45 = v14[6];
      v46 = v18;
      v43 = v20;
      v44 = v19;
      v22 = v14[9];
      v21 = v14[10];
      v23 = v14[8];
      *(_QWORD *)&v50[0] = *((_QWORD *)v14 + 22);
      v48 = v22;
      v49 = v21;
      v47 = v23;
      if (!v11)
        goto LABEL_10;
    }
    else
    {
      *(_QWORD *)&v50[0] = 0;
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v39 = 0u;
      if (!v11)
        goto LABEL_10;
    }
    if ((unint64_t)objc_msgSend(v11, "length", v34, v35, v36, v37, v38, v39, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, *(_QWORD *)&v50[0]) >= 0xB8)
    {
      v24 = objc_msgSend(objc_retainAutorelease(v11), "bytes");
      v25 = v24[3];
      v27 = *v24;
      v26 = v24[1];
      *(_OWORD *)((char *)&v50[2] + 8) = v24[2];
      *(_OWORD *)((char *)&v50[3] + 8) = v25;
      *(_OWORD *)((char *)v50 + 8) = v27;
      *(_OWORD *)((char *)&v50[1] + 8) = v26;
      v28 = v24[7];
      v30 = v24[4];
      v29 = v24[5];
      *(_OWORD *)((char *)&v50[6] + 8) = v24[6];
      *(_OWORD *)((char *)&v50[7] + 8) = v28;
      *(_OWORD *)((char *)&v50[4] + 8) = v30;
      *(_OWORD *)((char *)&v50[5] + 8) = v29;
      v31 = *((_QWORD *)v24 + 22);
      v32 = v24[10];
      v33 = v24[8];
      *(_OWORD *)((char *)&v50[9] + 8) = v24[9];
      *(_OWORD *)((char *)&v50[10] + 8) = v32;
      *(_OWORD *)((char *)&v50[8] + 8) = v33;
      *((_QWORD *)&v50[11] + 1) = v31;
      if (v13)
      {
LABEL_11:
        v51 = *(_OWORD *)objc_msgSend(objc_retainAutorelease(v13), "bytes");
        goto LABEL_12;
      }
      goto LABEL_9;
    }
LABEL_10:
    memset((char *)v50 + 8, 0, 184);
    if (v13)
      goto LABEL_11;
LABEL_9:
    *((_QWORD *)&v51 + 1) = 0;
  }
LABEL_12:
  sub_100004480(*(_QWORD *)(a1 + 32), a2, 26, (uint64_t *)&v34);

}

uint64_t sub_1000071D0(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int *a4, uint64_t a5)
{
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v13;
  uint64_t v14;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[FSFileName nameWithCString:](FSFileName, "nameWithCString:"));
  v13 = 0;
  v14 = 0;
  v9 = sub_100003D80(a4, (_DWORD *)&v14 + 1, &v13, (int *)&v14, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = v13;
  sub_10000727C(a2, SHIDWORD(v14), v10, v8, v11, a5);

  return 0;
}

void sub_10000727C(uint64_t a1, int a2, void *a3, void *a4, void *a5, uint64_t a6)
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  NSObject *v22;
  _QWORD v23[5];
  int v24;
  int v25;
  _QWORD v26[5];
  int v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = v13;
  if (!v13)
  {
    v17 = livefs_std_log(0);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_1000378E0();

    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v19 = a1;
    v20 = 22;
    goto LABEL_10;
  }
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000074C4;
  v26[3] = &unk_100054940;
  v27 = a2;
  v26[4] = a1;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "fsObjWithErrorHandler:", v26));
  if (!v15)
  {
    v21 = livefs_std_log(0);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_10003794C();

    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v19 = a1;
    v20 = 5;
LABEL_10:
    sub_100004480(v19, v20, 2, (uint64_t *)&v28);
    goto LABEL_11;
  }
  v16 = v15;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000075B4;
  v23[3] = &unk_100054AB8;
  v23[4] = a1;
  v24 = a2;
  v25 = a6;
  objc_msgSend(v15, "lookupIn:name:usingFlags:requestID:reply:", v11, v12, a6, a1, v23);

LABEL_11:
}

void sub_1000074C4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _OWORD v7[65];

  v3 = a2;
  v4 = livefs_std_log(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_1000379B8();

  v6 = *(_QWORD *)(a1 + 32);
  memset(v7, 0, 512);
  sub_100004480(v6, 5, 2, (uint64_t *)v7);

}

void sub_1000075B4(uint64_t a1, int a2, int a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9, void *a10)
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t *v25;
  int v26;
  int v27;
  _OWORD *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  int v38;
  unint64_t v39;
  id v40;
  _OWORD *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  unint64_t v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _OWORD v58[12];
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[196];
  uint64_t v63;
  int v64;
  uint64_t v65;
  int v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;

  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  memset(v62, 0, 192);
  v60 = 0u;
  v61 = 0u;
  v59 = 0u;
  v57 = 0u;
  memset(v58, 0, sizeof(v58));
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  if (!a2)
  {
    if (!v18
      || (unint64_t)objc_msgSend(v18, "length", v53, v54, v55, v56, v57, v58[0], v58[1], v58[2], v58[3], v58[4], v58[5], v58[6], v58[7], v58[8], v58[9], v58[10], v58[11],
                             v59,
                             v60,
                             v61,
                             *(_OWORD *)v62,
                             *(_OWORD *)&v62[16],
                             *(_OWORD *)&v62[32],
                             *(_OWORD *)&v62[48],
                             *(_OWORD *)&v62[64],
                             *(_OWORD *)&v62[80],
                             *(_OWORD *)&v62[96],
                             *(_OWORD *)&v62[112],
                             *(_OWORD *)&v62[128],
                             *(_OWORD *)&v62[144],
                             *(_QWORD *)&v62[160]) <= 0xB7)
    {
      v24 = *(_QWORD *)(a1 + 32);
      v98 = 0u;
      v97 = 0u;
      v96 = 0u;
      v95 = 0u;
      v94 = 0u;
      v93 = 0u;
      v92 = 0u;
      v91 = 0u;
      v90 = 0u;
      v89 = 0u;
      v88 = 0u;
      v87 = 0u;
      v86 = 0u;
      v85 = 0u;
      v84 = 0u;
      v83 = 0u;
      v82 = 0u;
      v81 = 0u;
      v80 = 0u;
      v79 = 0u;
      v78 = 0u;
      v77 = 0u;
      v76 = 0u;
      v75 = 0u;
      v74 = 0u;
      v73 = 0u;
      v72 = 0u;
      v71 = 0u;
      v70 = 0u;
      v69 = 0u;
      v68 = 0u;
      v67 = 0u;
      v25 = (uint64_t *)&v67;
      v26 = 96;
      goto LABEL_6;
    }
    v28 = objc_msgSend(objc_retainAutorelease(v18), "bytes");
    v30 = v28[9];
    v29 = v28[10];
    v31 = v28[8];
    *(_QWORD *)((char *)&v58[11] + 4) = *((_QWORD *)v28 + 22);
    v32 = v28[2];
    v33 = v28[3];
    v34 = v28[1];
    *(_OWORD *)((char *)v58 + 4) = *v28;
    *(_OWORD *)((char *)&v58[3] + 4) = v33;
    *(_OWORD *)((char *)&v58[2] + 4) = v32;
    *(_OWORD *)((char *)&v58[1] + 4) = v34;
    v35 = v28[6];
    v36 = v28[7];
    v37 = v28[5];
    *(_OWORD *)((char *)&v58[4] + 4) = v28[4];
    *(_OWORD *)((char *)&v58[7] + 4) = v36;
    *(_OWORD *)((char *)&v58[6] + 4) = v35;
    *(_OWORD *)((char *)&v58[5] + 4) = v37;
    *(_OWORD *)((char *)&v58[8] + 4) = v31;
    *(_OWORD *)((char *)&v58[10] + 4) = v29;
    *(_OWORD *)((char *)&v58[9] + 4) = v30;
    sub_100003CD4(*(_DWORD *)(a1 + 40), v17, (__int128 *)((char *)&v54 + 4));
    v38 = *(_DWORD *)(a1 + 44);
    if (v22 && (v38 & 0x10000000) != 0)
    {
      v39 = (unint64_t)objc_msgSend(v22, "length") / 0x18;
      if (v39 >= 2)
        LODWORD(v39) = 2;
      v64 = v39;
      v40 = objc_msgSend(objc_retainAutorelease(v22), "bytes");
      __memcpy_chk(&v63, v40, 24 * v64, 520);
      v38 = *(_DWORD *)(a1 + 44);
    }
    else
    {
      v64 = 0;
    }
    if (!a3 && (v38 & 0x20000000) != 0)
    {
      if (v20 && (unint64_t)objc_msgSend(v20, "length") >= 0xB8)
      {
        v41 = objc_msgSend(objc_retainAutorelease(v20), "bytes");
        v42 = v41[3];
        v44 = *v41;
        v43 = v41[1];
        *(_OWORD *)&v62[44] = v41[2];
        *(_OWORD *)&v62[60] = v42;
        *(_OWORD *)&v62[12] = v44;
        *(_OWORD *)&v62[28] = v43;
        v45 = v41[7];
        v47 = v41[4];
        v46 = v41[5];
        *(_OWORD *)&v62[108] = v41[6];
        *(_OWORD *)&v62[124] = v45;
        *(_OWORD *)&v62[76] = v47;
        *(_OWORD *)&v62[92] = v46;
        v49 = v41[9];
        v48 = v41[10];
        v50 = v41[8];
        *(_QWORD *)&v62[188] = *((_QWORD *)v41 + 22);
        *(_OWORD *)&v62[156] = v49;
        *(_OWORD *)&v62[172] = v48;
        *(_OWORD *)&v62[140] = v50;
        sub_100003CD4(*(_DWORD *)(a1 + 40), v19, (_OWORD *)((char *)&v58[11] + 12));
        if (v23)
        {
          v51 = (unint64_t)objc_msgSend(v23, "length") / 0x18;
          if (v51 >= 2)
            LODWORD(v51) = 2;
          v66 = v51;
          v52 = objc_msgSend(objc_retainAutorelease(v23), "bytes");
          __memcpy_chk(&v65, v52, 24 * v66, 464);
          a3 = 0;
          goto LABEL_24;
        }
        a3 = 0;
      }
      else
      {
        a3 = 96;
      }
      v66 = 0;
    }
LABEL_24:
    LODWORD(v54) = a3;
    v24 = *(_QWORD *)(a1 + 32);
    v25 = (uint64_t *)&v53;
    v26 = 0;
    v27 = 6;
    goto LABEL_7;
  }
  v24 = *(_QWORD *)(a1 + 32);
  v98 = 0uLL;
  v97 = 0uLL;
  v96 = 0uLL;
  v95 = 0uLL;
  v94 = 0uLL;
  v93 = 0uLL;
  v92 = 0uLL;
  v91 = 0uLL;
  v90 = 0uLL;
  v89 = 0uLL;
  v88 = 0uLL;
  v87 = 0uLL;
  v86 = 0uLL;
  v85 = 0uLL;
  v84 = 0uLL;
  v83 = 0uLL;
  v82 = 0uLL;
  v81 = 0uLL;
  v80 = 0uLL;
  v79 = 0uLL;
  v78 = 0uLL;
  v77 = 0uLL;
  v76 = 0uLL;
  v75 = 0uLL;
  v74 = 0uLL;
  v73 = 0uLL;
  v72 = 0uLL;
  v71 = 0uLL;
  v70 = 0uLL;
  v69 = 0uLL;
  v68 = 0uLL;
  v67 = 0uLL;
  v25 = (uint64_t *)&v67;
  v26 = a2;
LABEL_6:
  v27 = 2;
LABEL_7:
  sub_100004480(v24, v26, v27, v25);

}

uint64_t sub_100007A04(uint64_t a1, uint64_t a2, unsigned int *a3, uint64_t a4)
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  _QWORD v19[5];
  _QWORD v20[5];
  int v21;
  id v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;

  v22 = 0;
  v23 = 0;
  v6 = sub_100003D80(a3, (_DWORD *)&v23 + 1, &v22, (int *)&v23, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = v22;
  v9 = v8;
  if (!v8)
  {
    v12 = livefs_std_log(0);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_100037A24();

    v14 = v23;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v15 = a2;
    goto LABEL_10;
  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100007C50;
  v20[3] = &unk_100054940;
  v21 = HIDWORD(v23);
  v20[4] = a2;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fsObjWithErrorHandler:", v20));
  if (!v10)
  {
    v16 = livefs_std_log(0);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_100037A90();

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v15 = a2;
    v14 = 5;
LABEL_10:
    sub_100004480(v15, v14, 2, (uint64_t *)&v24);
    goto LABEL_11;
  }
  v11 = v10;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100007D40;
  v19[3] = &unk_100054AD8;
  v19[4] = a2;
  objc_msgSend(v10, "open:withMode:requestID:reply:", v7, a4, a2, v19);

LABEL_11:
  return 0;
}

void sub_100007C50(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _OWORD v7[65];

  v3 = a2;
  v4 = livefs_std_log(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_100037AFC();

  v6 = *(_QWORD *)(a1 + 32);
  memset(v7, 0, 512);
  sub_100004480(v6, 5, 2, (uint64_t *)v7);

}

void sub_100007D40(uint64_t a1, int a2)
{
  uint64_t v2;
  _OWORD v3[65];

  v2 = *(_QWORD *)(a1 + 32);
  memset(v3, 0, 512);
  sub_100004480(v2, a2, 2, (uint64_t *)v3);
}

uint64_t sub_100007DE4(uint64_t a1, uint64_t a2, unsigned int *a3, uint64_t a4)
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  _QWORD v19[5];
  _QWORD v20[5];
  int v21;
  id v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;

  v22 = 0;
  v23 = 0;
  v6 = sub_100003D80(a3, (_DWORD *)&v23 + 1, &v22, (int *)&v23, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = v22;
  v9 = v8;
  if (!v8)
  {
    v12 = livefs_std_log(0);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_100037B68();

    v14 = v23;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v15 = a2;
    goto LABEL_10;
  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100008030;
  v20[3] = &unk_100054940;
  v21 = HIDWORD(v23);
  v20[4] = a2;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fsObjWithErrorHandler:", v20));
  if (!v10)
  {
    v16 = livefs_std_log(0);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_100037BD4();

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v15 = a2;
    v14 = 5;
LABEL_10:
    sub_100004480(v15, v14, 2, (uint64_t *)&v24);
    goto LABEL_11;
  }
  v11 = v10;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100008120;
  v19[3] = &unk_100054AD8;
  v19[4] = a2;
  objc_msgSend(v10, "close:keepingMode:requestID:reply:", v7, a4, a2, v19);

LABEL_11:
  return 0;
}

void sub_100008030(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _OWORD v7[65];

  v3 = a2;
  v4 = livefs_std_log(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_100037C40();

  v6 = *(_QWORD *)(a1 + 32);
  memset(v7, 0, 512);
  sub_100004480(v6, 5, 2, (uint64_t *)v7);

}

void sub_100008120(uint64_t a1, int a2)
{
  uint64_t v2;
  _OWORD v3[65];

  v2 = *(_QWORD *)(a1 + 32);
  memset(v3, 0, 512);
  sub_100004480(v2, a2, 2, (uint64_t *)v3);
}

uint64_t sub_1000081C4(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int *a4, unsigned int *a5, uint64_t a6, unsigned int *a7, unsigned int *a8, int a9)
{
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v39;
  _QWORD v40[5];
  _QWORD v41[5];
  int v42;
  id v43;
  id v44;
  id v45;
  id v46;
  uint64_t v47;
  _OWORD __s1[4];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[FSFileName nameWithCString:](FSFileName, "nameWithCString:"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[FSFileName nameWithCString:](FSFileName, "nameWithCString:", a6));
  v46 = 0;
  v47 = 0;
  v17 = sub_100003D80(a5, (_DWORD *)&v47 + 1, &v46, (int *)&v47, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = v46;
  v45 = v19;
  v20 = sub_100003D80(a4, (_DWORD *)&v47 + 1, &v45, (int *)&v47, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v22 = v45;

  memset(__s1, 0, sizeof(__s1));
  if (!memcmp(__s1, a7, 0x40uLL))
  {
    v24 = 0;
  }
  else
  {
    v44 = v22;
    v23 = sub_100003D80(a7, (_DWORD *)&v47 + 1, &v44, (int *)&v47, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v25 = v44;

    v22 = v25;
  }
  v43 = v22;
  v26 = sub_100003D80(a8, (_DWORD *)&v47 + 1, &v43, (int *)&v47, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  v28 = v43;

  if (!v28)
  {
    v32 = livefs_std_log(v29);
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      sub_100037CAC();

    v34 = v47;
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v35 = a2;
    goto LABEL_13;
  }
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100008540;
  v41[3] = &unk_100054940;
  v42 = HIDWORD(v47);
  v41[4] = a2;
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "fsObjWithErrorHandler:", v41));
  if (!v30)
  {
    v36 = livefs_std_log(0);
    v37 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      sub_100037D18();

    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v35 = a2;
    v34 = 5;
LABEL_13:
    sub_100004480(v35, v34, 2, (uint64_t *)&v49);
    goto LABEL_14;
  }
  v31 = v30;
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_100008630;
  v40[3] = &unk_100054AF8;
  v40[4] = a2;
  LODWORD(v39) = a9;
  objc_msgSend(v30, "renameItemIn:named:item:toDirectory:newName:toItem:usingFlags:requestID:reply:", v18, v15, v21, v27, v16, v24, v39, a2, v40);

LABEL_14:
  return 0;
}

void sub_100008540(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _OWORD v7[65];

  v3 = a2;
  v4 = livefs_std_log(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_100037D84();

  v6 = *(_QWORD *)(a1 + 32);
  memset(v7, 0, 512);
  sub_100004480(v6, 5, 2, (uint64_t *)v7);

}

void sub_100008630(uint64_t a1, int a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  _OWORD *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _OWORD *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _OWORD v44[12];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  memset(v44, 0, sizeof(v44));
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  if (!a2)
  {
    if (v9
      && (unint64_t)objc_msgSend(v9, "length", v32, v33, v34, v35, v36, v37, v38, v39, v40, v41, v42, v43, v44[0], v44[1], v44[2], v44[3], v44[4],
                             v44[5],
                             v44[6],
                             v44[7],
                             v44[8],
                             v44[9],
                             v44[10],
                             v44[11],
                             v45,
                             v46,
                             v47,
                             v48,
                             v49,
                             v50,
                             (_QWORD)v51) >= 0xB8)
    {
      v12 = objc_msgSend(objc_retainAutorelease(v9), "bytes");
      v13 = v12[3];
      v15 = *v12;
      v14 = v12[1];
      v35 = v12[2];
      v36 = v13;
      v33 = v15;
      v34 = v14;
      v16 = v12[7];
      v18 = v12[4];
      v17 = v12[5];
      v39 = v12[6];
      v40 = v16;
      v37 = v18;
      v38 = v17;
      v20 = v12[9];
      v19 = v12[10];
      v21 = v12[8];
      *(_QWORD *)&v44[0] = *((_QWORD *)v12 + 22);
      v42 = v20;
      v43 = v19;
      v41 = v21;
    }
    else
    {
      *(_QWORD *)&v44[0] = 0;
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v33 = 0u;
    }
    if (v10 && (unint64_t)objc_msgSend(v10, "length") >= 0xB8)
    {
      v22 = objc_msgSend(objc_retainAutorelease(v10), "bytes");
      v23 = v22[6];
      v24 = v22[7];
      v25 = v22[5];
      *(_OWORD *)((char *)&v44[4] + 8) = v22[4];
      *(_OWORD *)((char *)&v44[6] + 8) = v23;
      *(_OWORD *)((char *)&v44[7] + 8) = v24;
      *(_OWORD *)((char *)&v44[5] + 8) = v25;
      v26 = *((_QWORD *)v22 + 22);
      v27 = v22[10];
      v28 = v22[8];
      *(_OWORD *)((char *)&v44[9] + 8) = v22[9];
      *(_OWORD *)((char *)&v44[10] + 8) = v27;
      *(_OWORD *)((char *)&v44[8] + 8) = v28;
      v29 = v22[2];
      v30 = v22[3];
      v31 = v22[1];
      *(_OWORD *)((char *)v44 + 8) = *v22;
      *(_OWORD *)((char *)&v44[3] + 8) = v30;
      *(_OWORD *)((char *)&v44[2] + 8) = v29;
      *(_OWORD *)((char *)&v44[1] + 8) = v31;
      *((_QWORD *)&v44[11] + 1) = v26;
      if (!v11)
      {
LABEL_9:
        *((_QWORD *)&v45 + 1) = 0;
        goto LABEL_12;
      }
    }
    else
    {
      memset((char *)v44 + 8, 0, 184);
      if (!v11)
        goto LABEL_9;
    }
    v45 = *(_OWORD *)objc_msgSend(objc_retainAutorelease(v11), "bytes");
  }
LABEL_12:
  sub_100004480(*(_QWORD *)(a1 + 32), a2, 7, (uint64_t *)&v32);

}

uint64_t sub_100008878(uint64_t a1, uint64_t a2, unsigned int *a3, unsigned int *a4, uint64_t a5)
{
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  _QWORD v28[5];
  id v29;
  _QWORD v30[5];
  int v31;
  id v32;
  int v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[FSFileName nameWithCString:](FSFileName, "nameWithCString:", a5));
  v34 = 0;
  v33 = 0;
  v32 = 0;
  v9 = sub_100003D80(a3, (_DWORD *)&v34 + 1, &v32, &v33, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = v32;
  if (v11)
  {
    v12 = v11;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100008C8C;
    v30[3] = &unk_100054940;
    v31 = HIDWORD(v34);
    v30[4] = a2;
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fsObjWithErrorHandler:", v30));
    if (v13)
    {
      v14 = (void *)v13;
      v29 = v12;
      v15 = sub_100003D80(a4, &v34, &v29, &v33, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v17 = v29;

      if (v17)
      {
        if (!HIDWORD(v34) || HIDWORD(v34) == (_DWORD)v34)
        {
          v28[0] = _NSConcreteStackBlock;
          v28[1] = 3221225472;
          v28[2] = sub_100008D7C;
          v28[3] = &unk_100054B18;
          v28[4] = a2;
          objc_msgSend(v14, "removeDirectory:from:named:usingFlags:requestID:reply:", v16, v10, v8, 0, a2, v28);
        }
        else
        {
          v19 = livefs_std_log(v18);
          v20 = objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            sub_100037EC8();

          v65 = 0u;
          v66 = 0u;
          v63 = 0u;
          v64 = 0u;
          v61 = 0u;
          v62 = 0u;
          v59 = 0u;
          v60 = 0u;
          v57 = 0u;
          v58 = 0u;
          v55 = 0u;
          v56 = 0u;
          v53 = 0u;
          v54 = 0u;
          v51 = 0u;
          v52 = 0u;
          v49 = 0u;
          v50 = 0u;
          v47 = 0u;
          v48 = 0u;
          v45 = 0u;
          v46 = 0u;
          v43 = 0u;
          v44 = 0u;
          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          v37 = 0u;
          v38 = 0u;
          v36 = 0u;
          v35 = 0u;
          sub_100004480(a2, 18, 2, (uint64_t *)&v35);
        }

      }
      else
      {
        v25 = livefs_std_log(v18);
        v26 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          sub_100037DF0();

        v65 = 0u;
        v66 = 0u;
        v63 = 0u;
        v64 = 0u;
        v61 = 0u;
        v62 = 0u;
        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        v36 = 0u;
        v35 = 0u;
        sub_100004480(a2, v33, 2, (uint64_t *)&v35);

      }
    }
    else
    {
      v23 = livefs_std_log(0);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        sub_100037E5C();

      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v36 = 0u;
      v35 = 0u;
      sub_100004480(a2, 5, 2, (uint64_t *)&v35);

    }
  }
  else
  {
    v21 = livefs_std_log(0);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_100037DF0();

    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v36 = 0u;
    v35 = 0u;
    sub_100004480(a2, v33, 2, (uint64_t *)&v35);
  }

  return 0;
}

void sub_100008C8C(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _OWORD v7[65];

  v3 = a2;
  v4 = livefs_std_log(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_100037F3C();

  v6 = *(_QWORD *)(a1 + 32);
  memset(v7, 0, 512);
  sub_100004480(v6, 5, 2, (uint64_t *)v7);

}

void sub_100008D7C(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  _OWORD *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _OWORD v31[2];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;

  v7 = a3;
  v8 = a4;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  memset(v31, 0, sizeof(v31));
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  if (!a2)
  {
    if (v7
      && (unint64_t)objc_msgSend(v7, "length", v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31[0], v31[1], v32, v33, v34,
                             v35,
                             v36,
                             v37,
                             v38,
                             v39,
                             v40,
                             v41,
                             v42,
                             v43,
                             v44,
                             v45,
                             v46,
                             v47,
                             (_QWORD)v48) >= 0xB8)
    {
      v9 = objc_msgSend(objc_retainAutorelease(v7), "bytes");
      v10 = v9[3];
      v12 = *v9;
      v11 = v9[1];
      v22 = v9[2];
      v23 = v10;
      v20 = v12;
      v21 = v11;
      v13 = v9[7];
      v15 = v9[4];
      v14 = v9[5];
      v26 = v9[6];
      v27 = v13;
      v24 = v15;
      v25 = v14;
      v17 = v9[9];
      v16 = v9[10];
      v18 = v9[8];
      *(_QWORD *)&v31[0] = *((_QWORD *)v9 + 22);
      v29 = v17;
      v30 = v16;
      v28 = v18;
      if (!v8)
      {
LABEL_5:
        *(_QWORD *)&v31[1] = 0;
        goto LABEL_8;
      }
    }
    else
    {
      *(_QWORD *)&v31[0] = 0;
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v20 = 0u;
      if (!v8)
        goto LABEL_5;
    }
    *(_OWORD *)((char *)v31 + 8) = *(_OWORD *)objc_msgSend(objc_retainAutorelease(v8), "bytes");
  }
LABEL_8:
  sub_100004480(*(_QWORD *)(a1 + 32), a2, 8, (uint64_t *)&v19);

}

uint64_t sub_100008EF8(uint64_t a1, uint64_t a2, int a3, uint64_t a4, unsigned int *a5, unsigned int a6, uint64_t a7)
{
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  id v22;
  _QWORD v24[7];
  unsigned int v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  __int128 *v29;
  _QWORD v30[5];
  int v31;
  id v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;

  v32 = 0;
  v33 = 0;
  v12 = sub_100003D80(a5, (_DWORD *)&v33 + 1, &v32, (int *)&v33, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = v32;
  v15 = v14;
  if (v14)
  {
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1000092D4;
    v30[3] = &unk_100054940;
    v31 = HIDWORD(v33);
    v30[4] = a2;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "fsObjWithErrorHandler:", v30));
    if (v16)
    {
      if (a3)
      {
        v64 = 0u;
        v65 = 0u;
        v62 = 0u;
        v63 = 0u;
        v60 = 0u;
        v61 = 0u;
        v58 = 0u;
        v59 = 0u;
        v56 = 0u;
        v57 = 0u;
        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        sub_100004480(a2, 45, 2, (uint64_t *)&v34);

      }
      else
      {
        *(_QWORD *)&v34 = 0;
        *((_QWORD *)&v34 + 1) = &v34;
        *(_QWORD *)&v35 = 0x43010000000;
        *((_QWORD *)&v35 + 1) = &unk_10004BE75;
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        v59 = 0u;
        v60 = 0u;
        v61 = 0u;
        v62 = 0u;
        v63 = 0u;
        v64 = 0u;
        v65 = 0u;
        v66 = 0u;
        v67 = 0u;
        v26 = 0;
        v27 = &v26;
        v28 = 0x2020000000;
        v29 = &v36;
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[LiveFSSharedMutableBuffer dataWithLength:](LiveFSSharedMutableBuffer, "dataWithLength:", a6));
        v22 = objc_msgSend(v21, "mutableBytes");
        *(_QWORD *)(v27[3] + 32) = v22;
        objc_msgSend(v21, "detachBytes");
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_1000093C4;
        v24[3] = &unk_100054B40;
        v24[4] = &v26;
        v24[5] = &v34;
        v24[6] = a2;
        v25 = a6;
        objc_msgSend(v16, "readDirectory:intoBuffer:cookie:verifier:requestID:reply:", v13, v21, a4, a7, a2, v24);

        _Block_object_dispose(&v26, 8);
        _Block_object_dispose(&v34, 8);

      }
    }
    else
    {
      v19 = livefs_std_log(0);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        sub_100038014();

      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      sub_100004480(a2, 5, 2, (uint64_t *)&v34);
    }
  }
  else
  {
    v17 = livefs_std_log(0);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_100037FA8();

    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    sub_100004480(a2, v33, 2, (uint64_t *)&v34);
  }

  return 0;
}

void sub_1000092A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_1000092D4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _OWORD v7[65];

  v3 = a2;
  v4 = livefs_std_log(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_100038080();

  v6 = *(_QWORD *)(a1 + 32);
  memset(v7, 0, 512);
  sub_100004480(v6, 5, 2, (uint64_t *)v7);

}

uint64_t sub_1000093C4(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  BOOL v5;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32;
  if (a3)
    v5 = a2 == -1001;
  else
    v5 = 0;
  if (v5)
    a2 = 0;
  if (!a2)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 16) = a4;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 24) = a3;
  }
  sub_100004480(*(_QWORD *)(a1 + 48), a2, 9, *(uint64_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  return vm_deallocate(mach_task_self_, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 32), *(unsigned int *)(a1 + 56));
}

uint64_t sub_100009464(uint64_t a1, uint64_t a2, unsigned int *a3, uint64_t a4, unsigned int *a5)
{
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  _QWORD v25[5];
  _QWORD v26[5];
  int v27;
  id v28;
  id v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[FSFileName nameWithCString:](FSFileName, "nameWithCString:", a4));
  v29 = 0;
  v30 = 0;
  v9 = sub_100003D80(a3, (_DWORD *)&v30 + 1, &v29, (int *)&v30, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = v29;
  v28 = v11;
  v12 = sub_100003D80(a5, (_DWORD *)&v30 + 1, &v28, (int *)&v30, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = v28;

  if (!v14)
  {
    v18 = livefs_std_log(v15);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_1000380EC();

    v20 = v30;
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v21 = a2;
    goto LABEL_10;
  }
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100009708;
  v26[3] = &unk_100054940;
  v27 = HIDWORD(v30);
  v26[4] = a2;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "fsObjWithErrorHandler:", v26));
  if (!v16)
  {
    v22 = livefs_std_log(0);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      sub_100038158();

    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v21 = a2;
    v20 = 5;
LABEL_10:
    sub_100004480(v21, v20, 2, (uint64_t *)&v31);
    goto LABEL_11;
  }
  v17 = v16;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000097F8;
  v25[3] = &unk_100054AF8;
  v25[4] = a2;
  objc_msgSend(v16, "makeLinkOf:named:inDirectory:requestID:reply:", v10, v8, v13, a2, v25);

LABEL_11:
  return 0;
}

void sub_100009708(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _OWORD v7[65];

  v3 = a2;
  v4 = livefs_std_log(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_1000381C4();

  v6 = *(_QWORD *)(a1 + 32);
  memset(v7, 0, 512);
  sub_100004480(v6, 5, 2, (uint64_t *)v7);

}

void sub_1000097F8(uint64_t a1, int a2, void *a3, void *a4, void *a5)
{
  id v9;
  _OWORD *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _OWORD *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _OWORD v42[12];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;

  v9 = a5;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  memset(v42, 0, sizeof(v42));
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  if (!a2)
  {
    if (a3
      && (unint64_t)objc_msgSend(a3, "length", v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40, v41, v42[0], v42[1], v42[2], v42[3], v42[4],
                             v42[5],
                             v42[6],
                             v42[7],
                             v42[8],
                             v42[9],
                             v42[10],
                             v42[11],
                             v43,
                             v44,
                             v45,
                             v46,
                             v47,
                             v48,
                             (_QWORD)v49) >= 0xB8)
    {
      v10 = objc_msgSend(objc_retainAutorelease(a3), "bytes");
      v11 = v10[6];
      v12 = v10[7];
      v13 = v10[5];
      *(_OWORD *)((char *)&v42[4] + 8) = v10[4];
      *(_OWORD *)((char *)&v42[6] + 8) = v11;
      *(_OWORD *)((char *)&v42[7] + 8) = v12;
      *(_OWORD *)((char *)&v42[5] + 8) = v13;
      v14 = *((_QWORD *)v10 + 22);
      v15 = v10[10];
      v16 = v10[8];
      *(_OWORD *)((char *)&v42[9] + 8) = v10[9];
      *(_OWORD *)((char *)&v42[10] + 8) = v15;
      *(_OWORD *)((char *)&v42[8] + 8) = v16;
      v17 = v10[2];
      v18 = v10[3];
      v19 = v10[1];
      *(_OWORD *)((char *)v42 + 8) = *v10;
      *(_OWORD *)((char *)&v42[3] + 8) = v18;
      *(_OWORD *)((char *)&v42[2] + 8) = v17;
      *(_OWORD *)((char *)&v42[1] + 8) = v19;
      *((_QWORD *)&v42[11] + 1) = v14;
      if (!a4)
        goto LABEL_10;
    }
    else
    {
      memset((char *)v42 + 8, 0, 184);
      if (!a4)
        goto LABEL_10;
    }
    if ((unint64_t)objc_msgSend(a4, "length", v30) >= 0xB8)
    {
      v20 = objc_msgSend(objc_retainAutorelease(a4), "bytes");
      v21 = v20[3];
      v23 = *v20;
      v22 = v20[1];
      v33 = v20[2];
      v34 = v21;
      v31 = v23;
      v32 = v22;
      v24 = v20[7];
      v26 = v20[4];
      v25 = v20[5];
      v37 = v20[6];
      v38 = v24;
      v35 = v26;
      v36 = v25;
      v28 = v20[9];
      v27 = v20[10];
      v29 = v20[8];
      *(_QWORD *)&v42[0] = *((_QWORD *)v20 + 22);
      v40 = v28;
      v41 = v27;
      v39 = v29;
      if (v9)
      {
LABEL_11:
        v43 = *(_OWORD *)objc_msgSend(objc_retainAutorelease(v9), "bytes");
        goto LABEL_12;
      }
      goto LABEL_9;
    }
LABEL_10:
    *(_QWORD *)&v42[0] = 0;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v31 = 0u;
    if (v9)
      goto LABEL_11;
LABEL_9:
    *((_QWORD *)&v43 + 1) = 0;
  }
LABEL_12:
  sub_100004480(*(_QWORD *)(a1 + 32), a2, 11, (uint64_t *)&v30);

}

uint64_t sub_100009A2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int *a5, uint64_t a6)
{
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  _QWORD v26[5];
  int v27;
  _QWORD v28[5];
  int v29;
  id v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[FSFileName nameWithCString:](FSFileName, "nameWithCString:"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a4));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", a6, 184));
  v30 = 0;
  v31 = 0;
  v13 = sub_100003D80(a5, (_DWORD *)&v31 + 1, &v30, (int *)&v31, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = v30;
  v16 = v15;
  if (!v15)
  {
    v19 = livefs_std_log(0);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_100038230();

    v21 = v31;
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v22 = a2;
    goto LABEL_10;
  }
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100009CE8;
  v28[3] = &unk_100054940;
  v29 = HIDWORD(v31);
  v28[4] = a2;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "fsObjWithErrorHandler:", v28));
  if (!v17)
  {
    v23 = livefs_std_log(0);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_10003829C();

    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v22 = a2;
    v21 = 5;
LABEL_10:
    sub_100004480(v22, v21, 2, (uint64_t *)&v32);
    goto LABEL_11;
  }
  v18 = v17;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100009DD8;
  v26[3] = &unk_100054A98;
  v27 = HIDWORD(v31);
  v26[4] = a2;
  objc_msgSend(v17, "makeSymLinkIn:named:contents:attributes:requestID:reply:", v14, v10, v11, v12, a2, v26);

LABEL_11:
  return 0;
}

void sub_100009CE8(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _OWORD v7[65];

  v3 = a2;
  v4 = livefs_std_log(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_100038308();

  v6 = *(_QWORD *)(a1 + 32);
  memset(v7, 0, 512);
  sub_100004480(v6, 5, 2, (uint64_t *)v7);

}

void sub_100009DD8(uint64_t a1, int a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  _OWORD *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  _OWORD *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _OWORD v51[12];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  memset(v51, 0, sizeof(v51));
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  if (!a2)
  {
    if (v11
      && (unint64_t)objc_msgSend(v11, "length", v35, v36, v37, v38, v39, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v50, v51[0],
                             v51[1],
                             v51[2],
                             v51[3],
                             v51[4],
                             v51[5],
                             v51[6],
                             v51[7],
                             v51[8],
                             v51[9],
                             v51[10],
                             v51[11],
                             v52,
                             v53,
                             (_QWORD)v54) >= 0xB8)
    {
      v15 = objc_msgSend(objc_retainAutorelease(v11), "bytes");
      v16 = v15[3];
      v18 = *v15;
      v17 = v15[1];
      *(_OWORD *)((char *)&v51[2] + 8) = v15[2];
      *(_OWORD *)((char *)&v51[3] + 8) = v16;
      *(_OWORD *)((char *)v51 + 8) = v18;
      *(_OWORD *)((char *)&v51[1] + 8) = v17;
      v19 = v15[7];
      v21 = v15[4];
      v20 = v15[5];
      *(_OWORD *)((char *)&v51[6] + 8) = v15[6];
      *(_OWORD *)((char *)&v51[7] + 8) = v19;
      *(_OWORD *)((char *)&v51[4] + 8) = v21;
      *(_OWORD *)((char *)&v51[5] + 8) = v20;
      v22 = *((_QWORD *)v15 + 22);
      v23 = v15[10];
      v24 = v15[8];
      *(_OWORD *)((char *)&v51[9] + 8) = v15[9];
      *(_OWORD *)((char *)&v51[10] + 8) = v23;
      *(_OWORD *)((char *)&v51[8] + 8) = v24;
      *((_QWORD *)&v51[11] + 1) = v22;
      if (!v13)
        goto LABEL_10;
    }
    else
    {
      memset((char *)v51 + 8, 0, 184);
      if (!v13)
        goto LABEL_10;
    }
    if ((unint64_t)objc_msgSend(v13, "length", v35, v36, v37, v38, v39) >= 0xB8)
    {
      v25 = objc_msgSend(objc_retainAutorelease(v13), "bytes");
      v26 = v25[3];
      v28 = *v25;
      v27 = v25[1];
      v42 = v25[2];
      v43 = v26;
      v40 = v28;
      v41 = v27;
      v29 = v25[7];
      v31 = v25[4];
      v30 = v25[5];
      v46 = v25[6];
      v47 = v29;
      v44 = v31;
      v45 = v30;
      v33 = v25[9];
      v32 = v25[10];
      v34 = v25[8];
      *(_QWORD *)&v51[0] = *((_QWORD *)v25 + 22);
      v49 = v33;
      v50 = v32;
      v48 = v34;
      if (v14)
      {
LABEL_11:
        v52 = *(_OWORD *)objc_msgSend(objc_retainAutorelease(v14), "bytes");
        goto LABEL_12;
      }
LABEL_9:
      *((_QWORD *)&v52 + 1) = 0;
LABEL_12:
      sub_100003CD4(*(_DWORD *)(a1 + 40), v12, &v36);
      goto LABEL_13;
    }
LABEL_10:
    *(_QWORD *)&v51[0] = 0;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v40 = 0u;
    if (v14)
      goto LABEL_11;
    goto LABEL_9;
  }
LABEL_13:
  sub_100004480(*(_QWORD *)(a1 + 32), a2, 10, (uint64_t *)&v35);

}

uint64_t sub_10000A020(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD v17[5];
  _QWORD v18[5];
  int v19;
  id v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;

  v20 = 0;
  v21 = 0;
  v4 = sub_100003D80(a3, (_DWORD *)&v21 + 1, &v20, (int *)&v21, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = v20;
  v7 = v6;
  if (!v6)
  {
    v10 = livefs_std_log(0);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100038374();

    v12 = v21;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v13 = a2;
    goto LABEL_10;
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000A264;
  v18[3] = &unk_100054940;
  v19 = HIDWORD(v21);
  v18[4] = a2;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fsObjWithErrorHandler:", v18));
  if (!v8)
  {
    v14 = livefs_std_log(0);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_1000383E0();

    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v13 = a2;
    v12 = 5;
LABEL_10:
    sub_100004480(v13, v12, 2, (uint64_t *)&v22);
    goto LABEL_11;
  }
  v9 = v8;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000A354;
  v17[3] = &unk_100054B18;
  v17[4] = a2;
  objc_msgSend(v8, "readLinkOf:requestID:reply:", v5, a2, v17);

LABEL_11:
  return 0;
}

void sub_10000A264(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _OWORD v7[65];

  v3 = a2;
  v4 = livefs_std_log(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_10003844C();

  v6 = *(_QWORD *)(a1 + 32);
  memset(v7, 0, 512);
  sub_100004480(v6, 5, 2, (uint64_t *)v7);

}

void sub_10000A354(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  if (a2 || !v7)
  {
    if (!a2 && !v7)
    {
      v12 = livefs_std_log(v8);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_1000384B8(v13, v14, v15, v16, v17, v18, v19, v20);

      a2 = 22;
    }
  }
  else
  {
    v10 = objc_msgSend(v7, "length", v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37,
            v38,
            v39,
            v40,
            v41,
            v42,
            v43,
            v44,
            v45,
            v46,
            v47,
            v48,
            v49,
            v50,
            (_QWORD)v51);
    if ((unint64_t)v10 >= 0x3FF)
      v11 = 1023;
    else
      v11 = (uint64_t)v10;
    __memcpy_chk(&v22, objc_msgSend(objc_retainAutorelease(v7), "bytes"), v11, 1024);
    a2 = 0;
    *((_BYTE *)&v22 + v11) = 0;
  }
  sub_100004480(*(_QWORD *)(a1 + 32), a2, 12, (uint64_t *)&v21);

}

uint64_t sub_10000A4BC(uint64_t a1, uint64_t a2, unsigned int *a3, unsigned int *a4, uint64_t a5, uint64_t a6)
{
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  _QWORD v30[5];
  id v31;
  _QWORD v32[5];
  int v33;
  id v34;
  int v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[FSFileName nameWithCString:](FSFileName, "nameWithCString:", a5));
  v36 = 0;
  v35 = 0;
  v34 = 0;
  v11 = sub_100003D80(a3, (_DWORD *)&v36 + 1, &v34, &v35, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = v34;
  if (v13)
  {
    v14 = v13;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10000A8CC;
    v32[3] = &unk_100054940;
    v33 = HIDWORD(v36);
    v32[4] = a2;
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "fsObjWithErrorHandler:", v32));
    if (v15)
    {
      v16 = (void *)v15;
      v31 = v14;
      v17 = sub_100003D80(a4, &v36, &v31, &v35, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v19 = v31;

      if (v19)
      {
        if (HIDWORD(v36) == (_DWORD)v36)
        {
          v30[0] = _NSConcreteStackBlock;
          v30[1] = 3221225472;
          v30[2] = sub_10000A9BC;
          v30[3] = &unk_100054B18;
          v30[4] = a2;
          objc_msgSend(v16, "removeItem:from:named:usingFlags:requestID:reply:", v18, v12, v10, a6, a2, v30);
        }
        else
        {
          v27 = livefs_std_log(v20);
          v28 = objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            sub_100038600();

          v67 = 0u;
          v68 = 0u;
          v65 = 0u;
          v66 = 0u;
          v63 = 0u;
          v64 = 0u;
          v61 = 0u;
          v62 = 0u;
          v59 = 0u;
          v60 = 0u;
          v57 = 0u;
          v58 = 0u;
          v55 = 0u;
          v56 = 0u;
          v53 = 0u;
          v54 = 0u;
          v51 = 0u;
          v52 = 0u;
          v49 = 0u;
          v50 = 0u;
          v47 = 0u;
          v48 = 0u;
          v45 = 0u;
          v46 = 0u;
          v43 = 0u;
          v44 = 0u;
          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          v38 = 0u;
          v37 = 0u;
          sub_100004480(a2, 18, 2, (uint64_t *)&v37);
        }

      }
      else
      {
        v25 = livefs_std_log(v20);
        v26 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          sub_100038528();

        v67 = 0u;
        v68 = 0u;
        v65 = 0u;
        v66 = 0u;
        v63 = 0u;
        v64 = 0u;
        v61 = 0u;
        v62 = 0u;
        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        v38 = 0u;
        v37 = 0u;
        sub_100004480(a2, v35, 2, (uint64_t *)&v37);

      }
    }
    else
    {
      v23 = livefs_std_log(0);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        sub_100038594();

      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v38 = 0u;
      v37 = 0u;
      sub_100004480(a2, 5, 2, (uint64_t *)&v37);

    }
  }
  else
  {
    v21 = livefs_std_log(0);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_100038528();

    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v38 = 0u;
    v37 = 0u;
    sub_100004480(a2, v35, 2, (uint64_t *)&v37);
  }

  return 0;
}

void sub_10000A8CC(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _OWORD v7[65];

  v3 = a2;
  v4 = livefs_std_log(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_100038674();

  v6 = *(_QWORD *)(a1 + 32);
  memset(v7, 0, 512);
  sub_100004480(v6, 5, 2, (uint64_t *)v7);

}

void sub_10000A9BC(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  _OWORD *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _OWORD v31[2];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;

  v7 = a3;
  v8 = a4;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  memset(v31, 0, sizeof(v31));
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  if (!a2)
  {
    if (v7
      && (unint64_t)objc_msgSend(v7, "length", v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31[0], v31[1], v32, v33, v34,
                             v35,
                             v36,
                             v37,
                             v38,
                             v39,
                             v40,
                             v41,
                             v42,
                             v43,
                             v44,
                             v45,
                             v46,
                             v47,
                             (_QWORD)v48) >= 0xB8)
    {
      v9 = objc_msgSend(objc_retainAutorelease(v7), "bytes");
      v10 = v9[3];
      v12 = *v9;
      v11 = v9[1];
      v22 = v9[2];
      v23 = v10;
      v20 = v12;
      v21 = v11;
      v13 = v9[7];
      v15 = v9[4];
      v14 = v9[5];
      v26 = v9[6];
      v27 = v13;
      v24 = v15;
      v25 = v14;
      v17 = v9[9];
      v16 = v9[10];
      v18 = v9[8];
      *(_QWORD *)&v31[0] = *((_QWORD *)v9 + 22);
      v29 = v17;
      v30 = v16;
      v28 = v18;
      if (!v8)
      {
LABEL_5:
        *(_QWORD *)&v31[1] = 0;
        goto LABEL_8;
      }
    }
    else
    {
      *(_QWORD *)&v31[0] = 0;
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v20 = 0u;
      if (!v8)
        goto LABEL_5;
    }
    *(_OWORD *)((char *)v31 + 8) = *(_OWORD *)objc_msgSend(objc_retainAutorelease(v8), "bytes");
  }
LABEL_8:
  sub_100004480(*(_QWORD *)(a1 + 32), a2, 13, (uint64_t *)&v19);

}

uint64_t sub_10000AB38(uint64_t a1, uint64_t a2, unsigned int *a3, uint64_t a4)
{
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  _QWORD v20[5];
  _QWORD v21[5];
  int v22;
  id v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", a4, 184));
  v23 = 0;
  v24 = 0;
  v7 = sub_100003D80(a3, (_DWORD *)&v24 + 1, &v23, (int *)&v24, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = v23;
  v10 = v9;
  if (!v9)
  {
    v13 = livefs_std_log(0);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1000386E0();

    v15 = v24;
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v16 = a2;
    goto LABEL_10;
  }
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10000ADA4;
  v21[3] = &unk_100054940;
  v22 = HIDWORD(v24);
  v21[4] = a2;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fsObjWithErrorHandler:", v21));
  if (!v11)
  {
    v17 = livefs_std_log(0);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_10003874C();

    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v16 = a2;
    v15 = 5;
LABEL_10:
    sub_100004480(v16, v15, 2, (uint64_t *)&v25);
    goto LABEL_11;
  }
  v12 = v11;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10000AE94;
  v20[3] = &unk_100054B18;
  v20[4] = a2;
  objc_msgSend(v11, "setFileAttributesOf:to:requestID:reply:", v8, v6, a2, v20);

LABEL_11:
  return 0;
}

void sub_10000ADA4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _OWORD v7[65];

  v3 = a2;
  v4 = livefs_std_log(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_1000387B8();

  v6 = *(_QWORD *)(a1 + 32);
  memset(v7, 0, 512);
  sub_100004480(v6, 5, 2, (uint64_t *)v7);

}

void sub_10000AE94(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  _OWORD *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _OWORD v31[2];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;

  v7 = a3;
  v8 = a4;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  memset(v31, 0, sizeof(v31));
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  if (!a2)
  {
    if (v7
      && (unint64_t)objc_msgSend(v7, "length", v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31[0], v31[1], v32, v33, v34,
                             v35,
                             v36,
                             v37,
                             v38,
                             v39,
                             v40,
                             v41,
                             v42,
                             v43,
                             v44,
                             v45,
                             v46,
                             v47,
                             (_QWORD)v48) >= 0xB8)
    {
      v9 = objc_msgSend(objc_retainAutorelease(v7), "bytes");
      v10 = v9[3];
      v12 = *v9;
      v11 = v9[1];
      v22 = v9[2];
      v23 = v10;
      v20 = v12;
      v21 = v11;
      v13 = v9[7];
      v15 = v9[4];
      v14 = v9[5];
      v26 = v9[6];
      v27 = v13;
      v24 = v15;
      v25 = v14;
      v17 = v9[9];
      v16 = v9[10];
      v18 = v9[8];
      *(_QWORD *)&v31[0] = *((_QWORD *)v9 + 22);
      v29 = v17;
      v30 = v16;
      v28 = v18;
      if (!v8)
      {
LABEL_5:
        *(_QWORD *)&v31[1] = 0;
        goto LABEL_8;
      }
    }
    else
    {
      *(_QWORD *)&v31[0] = 0;
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v20 = 0u;
      if (!v8)
        goto LABEL_5;
    }
    *(_OWORD *)((char *)v31 + 8) = *(_OWORD *)objc_msgSend(objc_retainAutorelease(v8), "bytes");
  }
LABEL_8:
  sub_100004480(*(_QWORD *)(a1 + 32), a2, 14, (uint64_t *)&v19);

}

uint64_t sub_10000B010(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  int v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  _QWORD v19[5];
  _QWORD v20[5];
  int v21;
  id v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;

  v22 = 0;
  v23 = 0;
  v4 = sub_100003D80(a3, (_DWORD *)&v23 + 1, &v22, (int *)&v23, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = v22;
  v7 = v6;
  v8 = v23;
  if (!v5 && !(_DWORD)v23)
  {
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v6, "copyDisconnectedRootAttrs:", &v25);
    v9 = a2;
    v10 = 0;
    v11 = 15;
LABEL_14:
    sub_100004480(v9, v10, v11, (uint64_t *)&v24);
    goto LABEL_15;
  }
  if (!v6)
  {
    v14 = livefs_std_log(0);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_100038824();

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v9 = a2;
    v10 = v8;
    goto LABEL_13;
  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10000B2CC;
  v20[3] = &unk_100054940;
  v21 = HIDWORD(v23);
  v20[4] = a2;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fsObjWithErrorHandler:", v20));
  if (!v12)
  {
    v16 = livefs_std_log(0);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_100038890();

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v9 = a2;
    v10 = 5;
LABEL_13:
    v11 = 2;
    goto LABEL_14;
  }
  v13 = v12;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000B3BC;
  v19[3] = &unk_100054960;
  v19[4] = a2;
  objc_msgSend(v12, "fileAttributes:requestID:reply:", v5, a2, v19);

LABEL_15:
  return 0;
}

void sub_10000B2CC(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _OWORD v7[65];

  v3 = a2;
  v4 = livefs_std_log(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_1000388FC();

  v6 = *(_QWORD *)(a1 + 32);
  memset(v7, 0, 512);
  sub_100004480(v6, 5, 2, (uint64_t *)v7);

}

void sub_10000B3BC(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  _OWORD *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;

  v5 = a3;
  v6 = v5;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  if (!a2)
  {
    if (v5
      && (unint64_t)objc_msgSend(v5, "length", v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33,
                             v34,
                             v35,
                             v36,
                             v37,
                             v38,
                             v39,
                             v40,
                             v41,
                             v42,
                             v43,
                             v44,
                             v45,
                             v46,
                             (_QWORD)v47) >= 0xB8)
    {
      v7 = objc_msgSend(objc_retainAutorelease(v6), "bytes");
      a2 = 0;
      v8 = v7[3];
      v10 = *v7;
      v9 = v7[1];
      v20 = v7[2];
      v21 = v8;
      v18 = v10;
      v19 = v9;
      v11 = v7[7];
      v13 = v7[4];
      v12 = v7[5];
      v24 = v7[6];
      v25 = v11;
      v22 = v13;
      v23 = v12;
      v15 = v7[9];
      v14 = v7[10];
      v16 = v7[8];
      *(_QWORD *)&v29 = *((_QWORD *)v7 + 22);
      v27 = v15;
      v28 = v14;
      v26 = v16;
    }
    else
    {
      a2 = 96;
    }
  }
  sub_100004480(*(_QWORD *)(a1 + 32), a2, 15, (uint64_t *)&v17);

}

uint64_t sub_10000B4E8(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int *a4, unsigned int a5, uint64_t a6, uint64_t a7)
{
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  _QWORD v24[7];
  unsigned int v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  __int128 *v29;
  _QWORD v30[5];
  int v31;
  id v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;

  v32 = 0;
  v33 = 0;
  v12 = sub_100003D80(a4, (_DWORD *)&v33 + 1, &v32, (int *)&v33, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = v32;
  v15 = v14;
  if (v14)
  {
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10000B864;
    v30[3] = &unk_100054940;
    v31 = HIDWORD(v33);
    v30[4] = a2;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "fsObjWithErrorHandler:", v30));
    if (v16)
    {
      *(_QWORD *)&v34 = 0;
      *((_QWORD *)&v34 + 1) = &v34;
      *(_QWORD *)&v35 = 0x43010000000;
      *((_QWORD *)&v35 + 1) = &unk_10004BE75;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v56 = 0u;
      v57 = 0u;
      v58 = 0u;
      v59 = 0u;
      v60 = 0u;
      v61 = 0u;
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      v65 = 0u;
      v66 = 0u;
      v67 = 0u;
      v26 = 0;
      v27 = &v26;
      v28 = 0x2020000000;
      v29 = &v36;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[LiveFSSharedMutableBuffer dataWithLength:](LiveFSSharedMutableBuffer, "dataWithLength:", a5));
      v18 = objc_msgSend(v17, "mutableBytes");
      *(_QWORD *)(v27[3] + 40) = v18;
      objc_msgSend(v17, "detachBytes");
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_10000B954;
      v24[3] = &unk_100054B40;
      v24[4] = &v26;
      v24[5] = &v34;
      v24[6] = a2;
      v25 = a5;
      objc_msgSend(v16, "readDirectory:intoBuffer:requestedAttributes:cookie:verifier:requestID:reply:", v13, v17, a7 | 0x100, a3, a6, a2, v24);

      _Block_object_dispose(&v26, 8);
      _Block_object_dispose(&v34, 8);

    }
    else
    {
      v21 = livefs_std_log(0);
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        sub_1000389D4();

      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      sub_100004480(a2, 5, 2, (uint64_t *)&v34);
    }
  }
  else
  {
    v19 = livefs_std_log(0);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_100038968();

    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    sub_100004480(a2, v33, 2, (uint64_t *)&v34);
  }

  return 0;
}

void sub_10000B838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_10000B864(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _OWORD v7[65];

  v3 = a2;
  v4 = livefs_std_log(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_100038A40();

  v6 = *(_QWORD *)(a1 + 32);
  memset(v7, 0, 512);
  sub_100004480(v6, 5, 2, (uint64_t *)v7);

}

uint64_t sub_10000B954(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32;
  if (a2 < 0)
  {
    if (a2 == -1002)
    {
      a2 = 22;
      goto LABEL_10;
    }
    if (a2 == -1001)
    {
      if (!a3)
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 16) = -1;
      goto LABEL_8;
    }
  }
  else if (!a2)
  {
LABEL_8:
    a2 = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 24) = a4;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 32) = a3;
  }
LABEL_10:
  sub_100004480(*(_QWORD *)(a1 + 48), a2, 16, *(uint64_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  return vm_deallocate(mach_task_self_, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 40), *(unsigned int *)(a1 + 56));
}

uint64_t sub_10000BA20(uint64_t a1, uint64_t a2, unsigned int *a3, uint64_t a4, const void *a5, unsigned int a6)
{
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  dispatch_queue_global_t global_queue;
  NSObject *v17;
  dispatch_data_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v37[5];
  _QWORD v38[5];
  int v39;
  id v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;

  v40 = 0;
  v41 = 0;
  v10 = sub_100003D80(a3, (_DWORD *)&v41 + 1, &v40, (int *)&v41, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = v40;
  v13 = v12;
  if (!v12)
  {
    v21 = livefs_std_log(0);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_100038AAC();

    v23 = v41;
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v24 = a2;
    goto LABEL_11;
  }
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_10000BD5C;
  v38[3] = &unk_100054940;
  v39 = HIDWORD(v41);
  v38[4] = a2;
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "fsObjWithErrorHandler:", v38));
  if (!v14)
  {
    v25 = livefs_std_log(0);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      sub_100038B18();

    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v24 = a2;
    v23 = 5;
LABEL_11:
    sub_100004480(v24, v23, 2, (uint64_t *)&v42);
    goto LABEL_16;
  }
  v15 = (void *)v14;
  global_queue = dispatch_get_global_queue(0, 0);
  v17 = objc_claimAutoreleasedReturnValue(global_queue);
  v18 = dispatch_data_create(a5, a6, v17, _dispatch_data_destructor_munmap);

  if (v18)
  {
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10000BE4C;
    v37[3] = &unk_100054B60;
    v37[4] = a2;
    v20 = v18;
    objc_msgSend(v15, "writeTo:atOffset:fromBuffer:requestID:reply:", v11, a4, v20, a2, v37);

  }
  else
  {
    v27 = livefs_std_log(v19);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      sub_100038B84(v28, v29, v30, v31, v32, v33, v34, v35);

    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    sub_100004480(a2, 12, 2, (uint64_t *)&v42);
  }

LABEL_16:
  return 0;
}

void sub_10000BD5C(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _OWORD v7[65];

  v3 = a2;
  v4 = livefs_std_log(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_100038BF4();

  v6 = *(_QWORD *)(a1 + 32);
  memset(v7, 0, 512);
  sub_100004480(v6, 5, 2, (uint64_t *)v7);

}

void sub_10000BE4C(uint64_t a1, int a2, int a3, void *a4)
{
  id v7;
  void *v8;
  _OWORD v9[3];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;

  v7 = a4;
  v8 = v7;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v10 = 0u;
  memset(v9, 0, sizeof(v9));
  if (!a2)
  {
    LODWORD(v9[1]) = a3;
    if (v7)
      *(_OWORD *)((char *)&v9[1] + 8) = *(_OWORD *)objc_msgSend(objc_retainAutorelease(v7), "bytes", v9[0], v9[1], v9[2], v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23,
                                                     v24,
                                                     v25,
                                                     v26,
                                                     v27,
                                                     v28,
                                                     v29,
                                                     v30,
                                                     v31,
                                                     v32,
                                                     v33,
                                                     v34,
                                                     v35,
                                                     v36,
                                                     (_QWORD)v37);
  }
  sub_100004480(*(_QWORD *)(a1 + 32), a2, 17, (uint64_t *)v9);

}

uint64_t sub_10000BF3C(uint64_t a1, unsigned int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int *a7)
{
  dispatch_semaphore_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  NSObject *v20;
  dispatch_time_t v21;
  _QWORD v23[4];
  NSObject *v24;
  int *v25;
  uint64_t v26;
  _QWORD v27[4];
  NSObject *v28;
  int *v29;
  id v30;
  int v31;

  v12 = dispatch_semaphore_create(0);
  v31 = 0;
  v30 = 0;
  v13 = sub_100003D80(a2, &v31, &v30, a7, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = v30;
  v16 = v15;
  if (v14 && v15)
  {
    *a7 = 0;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10000C100;
    v27[3] = &unk_100054B88;
    v29 = a7;
    v17 = v12;
    v28 = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "fsObjWithErrorHandler:", v27));
    v19 = +[LiveFSSharedMutableBuffer newByCopyingPort:](LiveFSSharedMutableBuffer, "newByCopyingPort:", a5);
    if (v19)
    {
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10000C114;
      v23[3] = &unk_100054BB0;
      v25 = a7;
      v26 = a6;
      v20 = v17;
      v24 = v20;
      objc_msgSend(v18, "writeTo:atOffset:sharedBuffer:requestID:reply:", v14, a3, v19, -1, v23);
      v21 = dispatch_time(0, 5000000000);
      if (dispatch_semaphore_wait(v20, v21))
        *a7 = 60;

    }
    else
    {
      *a7 = 12;
    }

  }
  else
  {
    *a7 = 70;
  }

  return 0;
}

intptr_t sub_10000C100(uint64_t a1)
{
  **(_DWORD **)(a1 + 40) = 5;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t sub_10000C114(uint64_t a1, int a2, int a3)
{
  **(_DWORD **)(a1 + 40) = a2;
  if (!a2)
    **(_DWORD **)(a1 + 48) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_10000C130(uint64_t a1, uint64_t a2, unsigned int *a3, unsigned int a4, uint64_t a5)
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  _QWORD v20[7];
  unsigned int v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  __int128 *v25;
  _QWORD v26[5];
  int v27;
  id v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;

  v28 = 0;
  v29 = 0;
  v8 = sub_100003D80(a3, (_DWORD *)&v29 + 1, &v28, (int *)&v29, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = v28;
  v11 = v10;
  if (v10)
  {
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10000C498;
    v26[3] = &unk_100054940;
    v27 = HIDWORD(v29);
    v26[4] = a2;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fsObjWithErrorHandler:", v26));
    if (v12)
    {
      *(_QWORD *)&v30 = 0;
      *((_QWORD *)&v30 + 1) = &v30;
      *(_QWORD *)&v31 = 0x43010000000;
      *((_QWORD *)&v31 + 1) = &unk_10004BE75;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v56 = 0u;
      v57 = 0u;
      v58 = 0u;
      v59 = 0u;
      v60 = 0u;
      v61 = 0u;
      v62 = 0u;
      v63 = 0u;
      v22 = 0;
      v23 = &v22;
      v24 = 0x2020000000;
      v25 = &v32;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[LiveFSSharedMutableBuffer dataWithLength:](LiveFSSharedMutableBuffer, "dataWithLength:", a4));
      v14 = objc_msgSend(v13, "mutableBytes");
      *(_QWORD *)(v23[3] + 24) = v14;
      objc_msgSend(v13, "detachBytes");
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10000C588;
      v20[3] = &unk_100054BD8;
      v20[4] = &v22;
      v20[5] = &v30;
      v20[6] = a2;
      v21 = a4;
      objc_msgSend(v12, "readFrom:atOffset:intoBuffer:requestID:reply:", v9, a5, v13, a2, v20);

      _Block_object_dispose(&v22, 8);
      _Block_object_dispose(&v30, 8);

    }
    else
    {
      v17 = livefs_std_log(0);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_100038CCC();

      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      sub_100004480(a2, 5, 2, (uint64_t *)&v30);
    }
  }
  else
  {
    v15 = livefs_std_log(0);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_100038C60();

    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    sub_100004480(a2, v29, 2, (uint64_t *)&v30);
  }

  return 0;
}

void sub_10000C46C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_10000C498(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _OWORD v7[65];

  v3 = a2;
  v4 = livefs_std_log(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_100038D38();

  v6 = *(_QWORD *)(a1 + 32);
  memset(v7, 0, 512);
  sub_100004480(v6, 5, 2, (uint64_t *)v7);

}

uint64_t sub_10000C588(uint64_t a1, int a2, int a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32;
  if (!a2)
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 16) = a3;
  sub_100004480(*(_QWORD *)(a1 + 48), a2, 19, *(uint64_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  return vm_deallocate(mach_task_self_, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 24), *(unsigned int *)(a1 + 56));
}

uint64_t sub_10000C608(uint64_t a1, unsigned int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int *a7)
{
  dispatch_semaphore_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  NSObject *v20;
  dispatch_time_t v21;
  _QWORD v23[4];
  NSObject *v24;
  int *v25;
  uint64_t v26;
  _QWORD v27[4];
  NSObject *v28;
  int *v29;
  id v30;
  int v31;

  v12 = dispatch_semaphore_create(0);
  v31 = 0;
  v30 = 0;
  v13 = sub_100003D80(a2, &v31, &v30, a7, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = v30;
  v16 = v15;
  if (v14 && v15)
  {
    *a7 = 0;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10000C7CC;
    v27[3] = &unk_100054B88;
    v29 = a7;
    v17 = v12;
    v28 = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "fsObjWithErrorHandler:", v27));
    v19 = +[LiveFSSharedMutableBuffer newByCopyingPort:](LiveFSSharedMutableBuffer, "newByCopyingPort:", a5);
    if (v19)
    {
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10000C7E0;
      v23[3] = &unk_100054C00;
      v25 = a7;
      v26 = a6;
      v20 = v17;
      v24 = v20;
      objc_msgSend(v18, "readFrom:atOffset:intoBuffer:requestID:reply:", v14, a3, v19, -1, v23);
      v21 = dispatch_time(0, 5000000000);
      if (dispatch_semaphore_wait(v20, v21))
        *a7 = 60;

    }
    else
    {
      *a7 = 12;
    }

  }
  else
  {
    *a7 = 70;
  }

  return 0;
}

intptr_t sub_10000C7CC(uint64_t a1)
{
  **(_DWORD **)(a1 + 40) = 5;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t sub_10000C7E0(uint64_t a1, int a2, int a3)
{
  **(_DWORD **)(a1 + 40) = a2;
  if (!a2)
    **(_DWORD **)(a1 + 48) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_10000C7FC(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD v18[5];
  _QWORD v19[5];
  int v20;
  id v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;

  v21 = 0;
  v22 = 0;
  v4 = sub_100003D80(a3, (_DWORD *)&v22 + 1, &v21, (int *)&v22, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = v21;
  v7 = v6;
  if (!v6)
  {
    v11 = livefs_std_log(0);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_100038DA4();

    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v13 = a2;
    v14 = 22;
    goto LABEL_10;
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000CA58;
  v19[3] = &unk_100054940;
  v20 = HIDWORD(v22);
  v19[4] = a2;
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fsSynchObjWithErrorHandler:", v19));
  if (!v8)
  {
    v15 = livefs_std_log(0);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_100038E10();

    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v13 = a2;
    v14 = 5;
LABEL_10:
    sub_100004480(v13, v14, 2, (uint64_t *)&v23);
    goto LABEL_11;
  }
  v9 = (void *)v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rootLIFileHandle"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000CB48;
  v18[3] = &unk_100054960;
  v18[4] = a2;
  objc_msgSend(v9, "pathConfiguration:requestID:reply:", v10, a2, v18);

LABEL_11:
  return 0;
}

void sub_10000CA58(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _OWORD v7[65];

  v3 = a2;
  v4 = livefs_std_log(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_100038E7C();

  v6 = *(_QWORD *)(a1 + 32);
  memset(v7, 0, 512);
  sub_100004480(v6, 5, 2, (uint64_t *)v7);

}

void sub_10000CB48(uint64_t a1, int a2, id a3)
{
  _DWORD *v5;
  unsigned int v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;

  v5 = objc_msgSend(objc_retainAutorelease(a3), "bytes");
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  if (!a2)
  {
    LODWORD(v8) = *v5;
    v6 = *((unsigned __int8 *)v5 + 12);
    LODWORD(v9) = (v6 & 4) == 0;
    DWORD1(v9) = (v6 >> 3) & 1;
    DWORD2(v8) = (v6 >> 1) & 1;
    DWORD1(v8) = v5[1];
    HIDWORD(v8) = v6 & 1;
    DWORD2(v9) = v5[2];
  }
  sub_100004480(*(_QWORD *)(a1 + 32), a2, 21, (uint64_t *)&v7);
}

uint64_t sub_10000CC4C(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD v17[5];
  _QWORD v18[4];
  int v19;
  id v20;
  uint64_t v21;
  uint8_t buf[32];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;

  v20 = 0;
  v21 = 0;
  v4 = sub_100003D80(a3, (_DWORD *)&v21 + 1, &v20, (int *)&v21, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = v20;
  v7 = v6;
  if (!v6)
  {
    v10 = livefs_std_log(0);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "lifs_reclaim_send";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = HIDWORD(v21);
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s: Unable to find entry for index %u", buf, 0x12u);
    }

    v12 = v21;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    memset(buf, 0, sizeof(buf));
    v13 = a2;
    goto LABEL_10;
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000CEF8;
  v18[3] = &unk_100054C20;
  v19 = HIDWORD(v21);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fsObjWithErrorHandler:", v18));
  if (!v8)
  {
    v14 = livefs_std_log(0);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "lifs_reclaim_send";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = HIDWORD(v21);
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s: Unable to get fsobj for idx %u", buf, 0x12u);
    }

    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    memset(buf, 0, sizeof(buf));
    v13 = a2;
    v12 = 5;
LABEL_10:
    sub_100004480(v13, v12, 2, (uint64_t *)buf);
    goto LABEL_11;
  }
  v9 = v8;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000CF58;
  v17[3] = &unk_100054960;
  v17[4] = a2;
  objc_msgSend(v8, "reclaim:requestID:reply:", v5, a2, v17);

LABEL_11:
  return 0;
}

void sub_10000CEF8(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  NSObject *v4;

  v2 = a2;
  v3 = livefs_std_log(v2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_100038EE8();

}

void sub_10000CF58(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;

  v5 = a3;
  v6 = v5;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  if (!a2 && v5)
    v8 = *(_OWORD *)objc_msgSend(objc_retainAutorelease(v5), "bytes", v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23,
                      v24,
                      v25,
                      v26,
                      v27,
                      v28,
                      v29,
                      v30,
                      v31,
                      v32,
                      v33,
                      v34,
                      v35,
                      v36,
                      (_QWORD)v37);
  sub_100004480(*(_QWORD *)(a1 + 32), a2, 42, (uint64_t *)&v7);

}

uint64_t sub_10000D038(uint64_t a1, uint64_t a2, unsigned int *a3, uint64_t a4)
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  _QWORD v19[5];
  _QWORD v20[5];
  int v21;
  id v22;
  uint64_t v23;
  uint8_t buf[32];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;

  v22 = 0;
  v23 = 0;
  v6 = sub_100003D80(a3, (_DWORD *)&v23 + 1, &v22, (int *)&v23, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = v22;
  v9 = v8;
  if (!v8)
  {
    v12 = livefs_std_log(0);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "lifs_access_send";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = HIDWORD(v23);
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s: Unable to find entry for index %u", buf, 0x12u);
    }

    v14 = v23;
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    memset(buf, 0, sizeof(buf));
    v15 = a2;
    goto LABEL_10;
  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10000D2FC;
  v20[3] = &unk_100054940;
  v21 = HIDWORD(v23);
  v20[4] = a2;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fsObjWithErrorHandler:", v20));
  if (!v10)
  {
    v16 = livefs_std_log(0);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "lifs_access_send";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = HIDWORD(v23);
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s: Unable to get fsobj for idx %u", buf, 0x12u);
    }

    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    memset(buf, 0, sizeof(buf));
    v15 = a2;
    v14 = 5;
LABEL_10:
    sub_100004480(v15, v14, 2, (uint64_t *)buf);
    goto LABEL_11;
  }
  v11 = v10;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000D3EC;
  v19[3] = &unk_100054AD8;
  v19[4] = a2;
  objc_msgSend(v10, "checkAccessTo:requestedAccess:requestID:reply:", v7, a4, a2, v19);

LABEL_11:
  return 0;
}

void sub_10000D2FC(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _OWORD v7[65];

  v3 = a2;
  v4 = livefs_std_log(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_100038F58();

  v6 = *(_QWORD *)(a1 + 32);
  memset(v7, 0, 512);
  sub_100004480(v6, 5, 2, (uint64_t *)v7);

}

void sub_10000D3EC(uint64_t a1, int a2)
{
  uint64_t v2;
  _OWORD v3[65];

  v2 = *(_QWORD *)(a1 + 32);
  memset(v3, 0, 512);
  sub_100004480(v2, a2, 2, (uint64_t *)v3);
}

uint64_t sub_10000D490(uint64_t a1, uint64_t a2, unsigned int *a3, uint64_t a4, uint64_t a5, int a6)
{
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  _QWORD v26[6];
  _QWORD v27[5];
  int v28;
  id v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;

  v29 = 0;
  v30 = 0;
  v10 = sub_100003D80(a3, (_DWORD *)&v30 + 1, &v29, (int *)&v30, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = v29;
  v13 = v12;
  if (!v12)
  {
    v18 = livefs_std_log(0);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_100038FC4();

    v20 = v30;
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v21 = a2;
    goto LABEL_13;
  }
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10000D798;
  v27[3] = &unk_100054940;
  v28 = HIDWORD(v30);
  v27[4] = a2;
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "fsObjWithErrorHandler:", v27));
  if (!v14)
  {
    v22 = livefs_std_log(0);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      sub_100039030();

    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v21 = a2;
    v20 = 5;
LABEL_13:
    sub_100004480(v21, v20, 2, (uint64_t *)&v31);
    goto LABEL_16;
  }
  v15 = (void *)v14;
  if (a6)
  {
    v16 = livefs_std_log(v14);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_10003909C();

    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    sub_100004480(a2, 22, 2, (uint64_t *)&v31);
  }
  else
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[FSFileName nameWithCString:](FSFileName, "nameWithCString:", a4));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10000D888;
    v26[3] = &unk_100054C40;
    v26[4] = a5;
    v26[5] = a2;
    objc_msgSend(v15, "xattrOf:named:requestID:reply:", v11, v24, a2, v26);

  }
LABEL_16:

  return 0;
}

void sub_10000D798(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _OWORD v7[65];

  v3 = a2;
  v4 = livefs_std_log(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_100039108();

  v6 = *(_QWORD *)(a1 + 32);
  memset(v7, 0, 512);
  sub_100004480(v6, 5, 2, (uint64_t *)v7);

}

void sub_10000D888(uint64_t a1, int a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  if (!a2)
  {
    v5 = a3;
    *(_QWORD *)&v11 = objc_msgSend(v5, "length", v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26,
                        v27,
                        v28,
                        v29,
                        v30,
                        v31,
                        v32,
                        v33,
                        v34,
                        v35,
                        v36,
                        v37,
                        v38,
                        v39,
                        (_QWORD)v40);
    v6 = objc_msgSend(v5, "length");
    v7 = *(id *)(a1 + 32);
    if (v6 < v7)
      v7 = v6;
    *((_QWORD *)&v11 + 1) = v7;
    v8 = objc_retainAutorelease(v5);
    v9 = objc_msgSend(v8, "bytes");

    *(_QWORD *)&v12 = v9;
  }
  sub_100004480(*(_QWORD *)(a1 + 40), a2, 24, (uint64_t *)&v10);
}

uint64_t sub_10000D990(uint64_t a1, uint64_t a2, unsigned int *a3, uint64_t a4, uint64_t a5, unint64_t a6, int a7, uint64_t a8)
{
  _OWORD v9[65];

  if (a6 < 0x401)
  {
    sub_10000DA64(a2, a3, a4, a5, a6, a7, a8);
  }
  else
  {
    memset(v9, 0, 512);
    sub_100004480(a2, 22, 2, (uint64_t *)v9);
  }
  return 0;
}

void sub_10000DA64(uint64_t a1, unsigned int *a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7)
{
  id v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  _QWORD v28[5];
  int v29;
  id v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;

  v30 = 0;
  v31 = 0;
  v13 = sub_100003D80(a2, (_DWORD *)&v31 + 1, &v30, (int *)&v31, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = v30;
  v16 = v15;
  if (v15)
  {
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10000F248;
    v28[3] = &unk_100054940;
    v29 = HIDWORD(v31);
    v28[4] = a1;
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "fsObjWithErrorHandler:", v28));
    if (v17)
    {
      v18 = (void *)v17;
      if (a6)
      {
        v19 = livefs_std_log(v17);
        v20 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          sub_10003924C();

        v62 = 0u;
        v63 = 0u;
        v60 = 0u;
        v61 = 0u;
        v58 = 0u;
        v59 = 0u;
        v56 = 0u;
        v57 = 0u;
        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        sub_100004480(a1, 22, 2, (uint64_t *)&v32);

      }
      else
      {
        if (a4)
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", a4, a5));
        else
          v25 = 0;
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[FSFileName nameWithCString:](FSFileName, "nameWithCString:", a3));
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_10000F338;
        v27[3] = &unk_100054AD8;
        v27[4] = a1;
        objc_msgSend(v18, "setXattrOf:named:value:how:requestID:reply:", v14, v26, v25, a7, a1, v27);

      }
    }
    else
    {
      v23 = livefs_std_log(0);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        sub_1000391E0();

      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      sub_100004480(a1, 5, 2, (uint64_t *)&v32);
    }
  }
  else
  {
    v21 = livefs_std_log(0);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_100039174();

    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    sub_100004480(a1, v31, 2, (uint64_t *)&v32);
  }

}

uint64_t sub_10000DDC8(uint64_t a1, uint64_t a2, unsigned int *a3, uint64_t a4, vm_address_t a5, unsigned int a6, int a7, uint64_t a8)
{
  vm_size_t v8;
  _OWORD v11[65];

  LODWORD(v8) = a6;
  if (a6 <= 0x40000)
  {
    v8 = a6;
    sub_10000DA64(a2, a3, a4, a5, a6, a7, a8);
  }
  else
  {
    memset(v11, 0, 512);
    sub_100004480(a2, 22, 2, (uint64_t *)v11);
    v8 = v8;
  }
  vm_deallocate(mach_task_self_, a5, v8);
  return 0;
}

uint64_t sub_10000DECC(uint64_t a1, uint64_t a2, unsigned int *a3, uint64_t a4)
{
  sub_10000DA64(a2, a3, a4, 0, 0, 0, 3);
  return 0;
}

uint64_t sub_10000DF00(uint64_t a1, uint64_t a2, unsigned int *a3, uint64_t a4)
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  _QWORD v19[6];
  _QWORD v20[5];
  int v21;
  id v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;

  v22 = 0;
  v23 = 0;
  v6 = sub_100003D80(a3, (_DWORD *)&v23 + 1, &v22, (int *)&v23, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = v22;
  v9 = v8;
  if (!v8)
  {
    v12 = livefs_std_log(0);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1000392B8();

    v14 = v23;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v15 = a2;
    goto LABEL_10;
  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10000E144;
  v20[3] = &unk_100054940;
  v21 = HIDWORD(v23);
  v20[4] = a2;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fsObjWithErrorHandler:", v20));
  if (!v10)
  {
    v16 = livefs_std_log(0);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_100039324();

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v15 = a2;
    v14 = 5;
LABEL_10:
    sub_100004480(v15, v14, 2, (uint64_t *)&v24);
    goto LABEL_11;
  }
  v11 = v10;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000E234;
  v19[3] = &unk_100054C60;
  v19[4] = a2;
  v19[5] = a4;
  objc_msgSend(v10, "listXattrsOf:requestID:reply:", v7, a2, v19);

LABEL_11:
  return 0;
}

void sub_10000E144(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _OWORD v7[65];

  v3 = a2;
  v4 = livefs_std_log(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_100039390();

  v6 = *(_QWORD *)(a1 + 32);
  memset(v7, 0, 512);
  sub_100004480(v6, 5, 2, (uint64_t *)v7);

}

void sub_10000E234(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  id v10;
  size_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  char *v15;
  void *v16;
  _BYTE *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _OWORD v53[65];

  v5 = a3;
  v6 = objc_msgSend(v5, "count");
  if (v6)
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
    do
    {
      v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", v7));

      v9 += objc_msgSend(v10, "lengthOfBytesUsingEncoding:", 4) + 1;
      ++v7;
      v8 = v10;
    }
    while (v6 != v7);
  }
  else
  {
    v9 = 0;
    v10 = 0;
  }
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  if (v9 <= 1)
    v11 = 1;
  else
    v11 = v9;
  v21 = 0uLL;
  v22 = 0uLL;
  v12 = malloc_type_malloc(v11, 0xEF231BD2uLL);
  if (v12)
  {
    v13 = v12;
    if (v6)
    {
      v14 = 0;
      v15 = (char *)v12;
      do
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", v14, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35,
                          v36,
                          v37,
                          v38,
                          v39,
                          v40,
                          v41,
                          v42,
                          v43,
                          v44,
                          v45,
                          v46,
                          v47,
                          v48,
                          v49,
                          v50));

        v10 = objc_retainAutorelease(v16);
        strcpy(v15, (const char *)objc_msgSend(v10, "UTF8String"));
        v17 = (char *)objc_msgSend(v10, "lengthOfBytesUsingEncoding:", 4) + (_QWORD)v15;
        *v17 = 0;
        v15 = v17 + 1;
        ++v14;
      }
      while (v6 != v14);
    }
    v18 = *(_QWORD *)(a1 + 32);
    v19 = *(_QWORD *)(a1 + 40);
    if (v19 >= v9)
      v19 = v9;
    *(_QWORD *)&v22 = v9;
    *((_QWORD *)&v22 + 1) = v19;
    *(_QWORD *)&v23 = v13;
    sub_100004480(v18, a2, 24, (uint64_t *)&v21);
    free(v13);
  }
  else
  {
    v20 = *(_QWORD *)(a1 + 32);
    memset(v53, 0, 512);
    sub_100004480(v20, 12, 2, (uint64_t *)v53);
  }

}

uint64_t sub_10000E4AC(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD v17[5];
  _QWORD v18[5];
  int v19;
  id v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;

  v20 = 0;
  v21 = 0;
  v4 = sub_100003D80(a3, (_DWORD *)&v21 + 1, &v20, (int *)&v21, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = v20;
  v7 = v6;
  if (!v6)
  {
    v10 = livefs_std_log(0);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1000393FC();

    v12 = v21;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v13 = a2;
    goto LABEL_10;
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000E6F8;
  v18[3] = &unk_100054940;
  v19 = HIDWORD(v21);
  v18[4] = a2;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fsObjWithErrorHandler:", v18));
  if (!v8)
  {
    v14 = livefs_std_log(0);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_100039468();

    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v13 = a2;
    v12 = 5;
LABEL_10:
    sub_100004480(v13, v12, 2, (uint64_t *)&v22);
    goto LABEL_11;
  }
  v9 = v8;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000E7E8;
  v17[3] = &unk_100054C80;
  v17[4] = a2;
  objc_msgSend(v8, "fetchVolumeMachPortLabeled:requestID:reply:", FSKitVolumeMachPortForKernelMount, a2, v17);

LABEL_11:
  return 0;
}

void sub_10000E6F8(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _OWORD v7[65];

  v3 = a2;
  v4 = livefs_std_log(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_1000394D4();

  v6 = *(_QWORD *)(a1 + 32);
  memset(v7, 0, 512);
  sub_100004480(v6, 5, 2, (uint64_t *)v7);

}

void sub_10000E7E8(uint64_t a1, int a2, void *a3)
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v5 = 0u;
  v6 = 0u;
  if (!a2)
    LODWORD(v6) = objc_msgSend(a3, "machPort", v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21,
                                  v22,
                                  v23,
                                  v24,
                                  v25,
                                  v26,
                                  v27,
                                  v28,
                                  v29,
                                  v30,
                                  v31,
                                  v32,
                                  v33,
                                  v34,
                                  (_QWORD)v35);
  sub_100004480(*(_QWORD *)(a1 + 32), a2, 30, (uint64_t *)&v5);
}

uint64_t sub_10000E8B0(uint64_t a1, uint64_t a2, unsigned int *a3, uint64_t a4, unsigned int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  _QWORD v25[6];
  int v26;
  int v27;
  _QWORD v28[5];
  int v29;
  id v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;

  v30 = 0;
  v31 = 0;
  v14 = sub_100003D80(a3, (_DWORD *)&v31 + 1, &v30, (int *)&v31, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = v30;
  v17 = v16;
  if (v16)
  {
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10000EB48;
    v28[3] = &unk_100054940;
    v29 = HIDWORD(v31);
    v28[4] = a2;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "fsObjWithErrorHandler:", v28));
    if (v18)
    {
      v19 = v18;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10000EC38;
      v25[3] = &unk_100054CA0;
      v26 = a6;
      v27 = a7;
      v25[4] = a8;
      v25[5] = a2;
      objc_msgSend(v18, "blockmapFile:range:startIO:flags:operationID:reply:", v15, a4, a5, a6, a7, a8, v25);

    }
    else
    {
      v22 = livefs_std_log(0);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        sub_1000395AC();

      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v33 = 0u;
      v32 = 0u;
      sub_100004480(a2, 5, 2, (uint64_t *)&v32);
    }
  }
  else
  {
    v20 = livefs_std_log(0);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_100039540();

    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v33 = 0u;
    v32 = 0u;
    sub_100004480(a2, v31, 2, (uint64_t *)&v32);
  }

  return 0;
}

void sub_10000EB48(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _OWORD v7[65];

  v3 = a2;
  v4 = livefs_std_log(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_100039618();

  v6 = *(_QWORD *)(a1 + 32);
  memset(v7, 0, 512);
  sub_100004480(v6, 5, 2, (uint64_t *)v7);

}

void sub_10000EC38(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  unint64_t v12;
  int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _OWORD v39[2];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v40 = 0u;
  v38 = 0u;
  memset(v39, 0, sizeof(v39));
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  if (a2)
  {
    v10 = livefs_std_log(v8);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100039684();

  }
  else
  {
    if (v7)
    {
      v12 = (unint64_t)objc_msgSend(v7, "length", v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30,
                                v31,
                                v32,
                                v33,
                                v34,
                                v35,
                                v36,
                                v37,
                                v38,
                                v39[0],
                                v39[1],
                                v40,
                                v41,
                                v42,
                                (_QWORD)v43)
          / 0x18;
      if (v12 >= 0x10)
        v13 = 16;
      else
        v13 = v12;
      LODWORD(v39[0]) = v13;
      __memcpy_chk(&v15, objc_msgSend(objc_retainAutorelease(v7), "bytes"), (24 * v13), 1024);
    }
    if (v9)
      *(_OWORD *)((char *)v39 + 8) = *(_OWORD *)objc_msgSend(objc_retainAutorelease(v9), "bytes");
    else
      *(_QWORD *)&v39[1] = 0;
  }
  sub_100004480(*(_QWORD *)(a1 + 40), a2, 31, (uint64_t *)&v14);

}

uint64_t sub_10000EDD4(uint64_t a1, uint64_t a2, unsigned int *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  _QWORD v25[6];
  int v26;
  int v27;
  _QWORD v28[5];
  int v29;
  id v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;

  v30 = 0;
  v31 = 0;
  v14 = sub_100003D80(a3, (_DWORD *)&v31 + 1, &v30, (int *)&v31, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = v30;
  v17 = v16;
  if (v16)
  {
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10000F06C;
    v28[3] = &unk_100054940;
    v29 = HIDWORD(v31);
    v28[4] = a2;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "fsObjWithErrorHandler:", v28));
    if (v18)
    {
      v19 = v18;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10000F15C;
      v25[3] = &unk_100054CC0;
      v26 = a6;
      v27 = a7;
      v25[4] = a8;
      v25[5] = a2;
      objc_msgSend(v18, "endIO:range:status:flags:operationID:reply:", v15, a4, a5, a6, a7, a8, v25);

    }
    else
    {
      v22 = livefs_std_log(0);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        sub_100039760();

      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v33 = 0u;
      v32 = 0u;
      sub_100004480(a2, 5, 2, (uint64_t *)&v32);
    }
  }
  else
  {
    v20 = livefs_std_log(0);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_1000396F4();

    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v33 = 0u;
    v32 = 0u;
    sub_100004480(a2, v31, 2, (uint64_t *)&v32);
  }

  return 0;
}

void sub_10000F06C(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _OWORD v7[65];

  v3 = a2;
  v4 = livefs_std_log(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_1000397CC();

  v6 = *(_QWORD *)(a1 + 32);
  memset(v7, 0, 512);
  sub_100004480(v6, 5, 2, (uint64_t *)v7);

}

void sub_10000F15C(uint64_t a1, int a2)
{
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _OWORD v7[65];

  if (a2)
  {
    v4 = livefs_std_log(a1);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100039838();

  }
  v6 = *(_QWORD *)(a1 + 40);
  memset(v7, 0, 512);
  sub_100004480(v6, a2, 2, (uint64_t *)v7);
}

void sub_10000F248(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _OWORD v7[65];

  v3 = a2;
  v4 = livefs_std_log(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_1000398A8();

  v6 = *(_QWORD *)(a1 + 32);
  memset(v7, 0, 512);
  sub_100004480(v6, 5, 2, (uint64_t *)v7);

}

void sub_10000F338(uint64_t a1, int a2)
{
  uint64_t v2;
  _OWORD v3[65];

  v2 = *(_QWORD *)(a1 + 32);
  memset(v3, 0, 512);
  sub_100004480(v2, a2, 2, (uint64_t *)v3);
}

void sub_10000F3DC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_10000F420(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x1Cu);
}

void sub_10000F43C(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_10000F450(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_10000F45C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10000F4A0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10000F4C4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_10000F4D0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x28u);
}

void sub_10000F4E4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x18u);
}

void sub_10000F534(void *a1)
{
  id v1;
  NSObject *v2;
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  NSObject *v11;
  _QWORD *v12;
  uint64_t *v13;
  _QWORD v14[5];
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v1 = a1;
  v2 = dispatch_group_create();
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = sub_10000F6F0;
  v14[4] = sub_10000F700;
  v15 = objc_alloc_init((Class)NSCondition);
  if (!*((_BYTE *)v17 + 24))
    dispatch_group_enter(v2);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000F708;
  v8[3] = &unk_100054D60;
  v12 = v14;
  v13 = &v16;
  v4 = v1;
  v9 = v4;
  v5 = v3;
  v10 = v5;
  v6 = v2;
  v11 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FPProviderDomain beginMonitoringProviderDomainChangesWithHandler:](FPProviderDomain, "beginMonitoringProviderDomainChangesWithHandler:", v8));
  dispatch_group_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  +[FPProviderDomain endMonitoringProviderDomainChanges:](FPProviderDomain, "endMonitoringProviderDomainChanges:", v7);

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(&v16, 8);

}

void sub_10000F6C4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000F6F0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10000F700(uint64_t a1)
{

}

void sub_10000F708(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id obj;
  uint64_t v27;
  _QWORD v28[4];
  NSObject *v29;
  _QWORD v30[4];
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];

  v25 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "lock");
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v24 = v5;
  if (*(_BYTE *)(v6 + 24))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "unlock");
    goto LABEL_28;
  }
  *(_BYTE *)(v6 + 24) = 1;
  v27 = a1;
  v7 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "unlock");
  if (!v5)
  {
    v39 = 0u;
    v40 = 0u;
    v38 = 0u;
    v37 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "allValues"));
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (!v10)
      goto LABEL_26;
    v11 = *(_QWORD *)v38;
    while (1)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v38 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "componentsSeparatedByString:", CFSTR("/")));

        if ((unint64_t)objc_msgSend(v15, "count") < 2)
        {
          v16 = 0;
          goto LABEL_24;
        }
        v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", 1));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "providerID"));
        if (objc_msgSend(v17, "isEqual:", CFSTR("com.apple.SMBClientProvider.FileProvider")))
        {

        }
        else
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "providerID"));
          v19 = objc_msgSend(v18, "isEqual:", CFSTR("com.apple.filesystems.UserFS.FileProvider"));

          if (!v19)
            goto LABEL_24;
        }
        v33 = 0;
        v34 = &v33;
        v35 = 0x2020000000;
        v36 = 1;
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "providerID"));
        if (!objc_msgSend(v20, "isEqual:", CFSTR("com.apple.SMBClientProvider.FileProvider")))
        {

LABEL_20:
          v22 = *(void **)(v27 + 32);
          v30[0] = _NSConcreteStackBlock;
          v30[1] = 3221225472;
          v30[2] = sub_10000FAEC;
          v30[3] = &unk_100054CE8;
          v16 = v16;
          v31 = v16;
          v32 = &v33;
          objc_msgSend(v22, "enumerateObjectsUsingBlock:", v30);
          if (*((_BYTE *)v34 + 24))
          {
            objc_msgSend(*(id *)(v27 + 40), "addObject:", v13);
            dispatch_group_enter(*(dispatch_group_t *)(v27 + 48));
          }

          goto LABEL_23;
        }
        v21 = (unint64_t)objc_msgSend(v16, "length") < 7;

        if (!v21)
          goto LABEL_20;
        *((_BYTE *)v34 + 24) = 0;
LABEL_23:
        _Block_object_dispose(&v33, 8);
LABEL_24:

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      if (!v10)
      {
LABEL_26:

        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_10000FB60;
        v28[3] = &unk_100054D38;
        v23 = *(void **)(v27 + 40);
        v29 = *(id *)(v27 + 48);
        objc_msgSend(v23, "enumerateObjectsWithOptions:usingBlock:", 1, v28);
        v9 = v29;
        goto LABEL_27;
      }
    }
  }
  v8 = livefs_std_log(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    sub_100039914();
LABEL_27:

  dispatch_group_leave(*(dispatch_group_t *)(v27 + 48));
LABEL_28:

}

void sub_10000FACC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000FAEC(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;

  v6 = *(void **)(a1 + 32);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "objectForKeyedSubscript:", LiveFSMounterDomainStorageKey));
  LODWORD(v6) = objc_msgSend(v6, "isEqual:", v7);

  if ((_DWORD)v6)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

void sub_10000FB60(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("/")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "providerID"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000FC6C;
  v9[3] = &unk_100054D10;
  v10 = v3;
  v11 = *(id *)(a1 + 32);
  v8 = v3;
  +[LivefsDomainManager removeDomain:provider:how:reply:](LivefsDomainManager, "removeDomain:provider:how:reply:", v6, v7, 0, v9);

}

void sub_10000FC6C(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;

  v3 = a2;
  if (v3)
  {
    v4 = livefs_std_log();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100039974(a1, (uint64_t)v3, v5);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void sub_10000FF98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000FFD4(uint64_t a1)
{
  id WeakRetained;
  dispatch_queue_global_t global_queue;
  NSObject *v3;
  _QWORD block[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    global_queue = dispatch_get_global_queue(2, 0);
    v3 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100010068;
    block[3] = &unk_100054D88;
    v5 = WeakRetained;
    dispatch_async(v3, block);

  }
}

id sub_100010068(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleInvalidated");
}

void sub_100010070(uint64_t a1)
{
  id WeakRetained;
  dispatch_queue_global_t global_queue;
  NSObject *v3;
  _QWORD block[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    global_queue = dispatch_get_global_queue(2, 0);
    v3 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100010104;
    block[3] = &unk_100054D88;
    v5 = WeakRetained;
    dispatch_async(v3, block);

  }
}

id sub_100010104(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleInvalidated");
}

uint64_t start(uint64_t a1, char *const *a2)
{
  int v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  dispatch_queue_attr_t v12;
  NSObject *v13;
  dispatch_queue_attr_t v14;
  NSObject *v15;
  dispatch_queue_t v16;
  void *v17;
  dispatch_source_t v18;
  NSObject *v19;
  uint64_t inserted;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  unsigned __int16 v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  __CFString *v41;
  __CFString *v42;
  __CFString *v43;
  __CFString *v44;
  uint64_t v45;
  NSObject *v46;
  uint64_t has_internal_content;
  uint64_t v48;
  NSObject *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  mountTable *v53;
  void *v54;
  uint64_t v55;
  NSObject *v56;
  uint64_t v57;
  void *v58;
  NSObject *v59;
  uint64_t v60;
  void *v61;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v63;
  uint64_t v64;
  NSObject *v65;
  uint64_t v66;
  uint64_t v67;
  NSObject *v68;
  uint64_t v69;
  uint64_t v70;
  NSObject *v71;
  uint64_t v73;
  NSObject *v74;
  kern_return_t v75;
  uint64_t v76;
  NSObject *v77;
  uint64_t v78;
  NSObject *v79;
  uint64_t v80;
  uint64_t v81;
  NSObject *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  NSObject *v91;
  uint64_t v92;
  NSObject *v93;
  uint64_t v94;
  NSObject *v95;
  int v96;
  unsigned __int16 v97;
  _QWORD handler[4];
  NSObject *v99;
  mach_port_name_t name;
  char *__endptr;
  uint8_t buf[4];
  _QWORD v103[2];

  v3 = a1;
  __endptr = 0;
  name = 0;
  v4 = livefs_std_log(a1);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_100039FD4();

  v7 = livefs_std_log(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v103[0]) = 1;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "main:lifs:v2:%d", buf, 8u);
  }

  v9 = mach_port_allocate(mach_task_self_, 1u, &name);
  if ((_DWORD)v9)
  {
    v75 = v9;
    v76 = livefs_std_log(v9);
    v77 = objc_claimAutoreleasedReturnValue(v76);
    if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
      sub_100039F28(v75, v77);

    bootstrap_strerror(v75);
    err(1, "%s: ERROR: bootstrap_check_in() failed: %s - %d");
  }
  if (name - 1 >= 0xFFFFFFFE)
  {
    v78 = livefs_std_log(v9);
    v79 = objc_claimAutoreleasedReturnValue(v78);
    if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
      sub_100039E90(&name, v79, v80);

    err(1, "%s: invalid port - %s");
  }
  v10 = dispatch_queue_attr_make_with_overcommit(&_dispatch_queue_attr_concurrent, 1);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_USER_INITIATED, 0);
  v13 = objc_claimAutoreleasedReturnValue(v12);

  v14 = dispatch_queue_attr_make_with_autorelease_frequency(v13, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v15 = objc_claimAutoreleasedReturnValue(v14);

  v16 = dispatch_queue_create("lifs_queue", v15);
  v17 = (void *)qword_10005C710;
  qword_10005C710 = (uint64_t)v16;

  v18 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_mach_recv, name, 0, (dispatch_queue_t)qword_10005C710);
  if (!v18)
  {
    v81 = livefs_std_log(0);
    v82 = objc_claimAutoreleasedReturnValue(v81);
    if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
      sub_100039B60(v82, v83, v84, v85, v86, v87, v88, v89);

    err(1, "%s: ERROR: dispatch_source_create() failed");
  }
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100010A08;
  handler[3] = &unk_100054D88;
  v19 = v18;
  v99 = v19;
  dispatch_source_set_event_handler(v19, handler);
  dispatch_activate(v19);
  inserted = mach_port_insert_right(mach_task_self_, name, name, 0x14u);
  if ((_DWORD)inserted)
  {
    v90 = livefs_std_log(inserted);
    v91 = objc_claimAutoreleasedReturnValue(v90);
    if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
      sub_100039E20();

    err(1, "%s: ERROR: mach_port_insert_right failed: %d");
  }
  v21 = objc_claimAutoreleasedReturnValue(+[LiveFSUserClient defaultClient](LiveFSUserClient, "defaultClient"));
  v22 = (void *)qword_10005C718;
  qword_10005C718 = v21;

  v23 = objc_msgSend((id)qword_10005C718, "setMainMachPort:forDomain:", name, &stru_100056698);
  v24 = livefs_std_log(v23);
  v25 = objc_claimAutoreleasedReturnValue(v24);
  v26 = v25;
  if ((_DWORD)v23)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_100039DB0();

    err(1, "%s: ERROR sending mach port to kernel: %d");
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Done setting up mach ports", buf, 2u);
  }

  v28 = objc_opt_new(LivefsSettings, v27);
  v29 = (void *)qword_10005C720;
  qword_10005C720 = v28;

  v31 = objc_opt_new(fskitdExtensionManager, v30);
  v32 = (void *)qword_10005C728;
  qword_10005C728 = v31;

  v33 = objc_alloc_init((Class)FSAuditToken);
  v34 = (void *)qword_10005C730;
  qword_10005C730 = (uint64_t)v33;

  if (!qword_10005C730)
  {
    v92 = fskit_std_log(v35);
    v93 = objc_claimAutoreleasedReturnValue(v92);
    if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
      sub_100039BD0();

    errx(71, "Unable to get own audit token. Exiting");
  }
  v36 = getuid();
  v96 = v36;
  v37 = (v36 & 0xF) + 9000;
  v38 = livefs_std_log(v36);
  v39 = objc_claimAutoreleasedReturnValue(v38);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    sub_100039D28(v37, v39);
  v97 = v37;

  while (1)
  {
    v40 = getopt(v3, a2, "Ln:p:t:v");
    switch((int)v40)
    {
      case 'n':
        strtoul(optarg, &__endptr, 10);
        if (*__endptr)
          sub_100039CA4();
        continue;
      case 'o':
      case 'q':
      case 'r':
      case 's':
      case 'u':
        goto LABEL_54;
      case 'p':
        if (*optarg == 47)
        {
          v41 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:"));
          v42 = off_10005C388;
          off_10005C388 = v41;

        }
        else
        {
          v97 = strtol(optarg, &__endptr, 10);
          if (!v97 || *__endptr)
            sub_100039CD0();
LABEL_20:
          byte_10005C70C = 1;
        }
        break;
      case 't':
        strtoul(optarg, &__endptr, 10);
        if (*__endptr)
          sub_100039CFC();
        continue;
      case 'v':
        ++dword_10005C708;
        continue;
      default:
        if ((_DWORD)v40 == 76)
          goto LABEL_20;
        if ((_DWORD)v40 != -1)
LABEL_54:
          sub_100039BFC();
        if (byte_10005C70C)
        {
          v43 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), v97));
          v44 = off_10005C388;
          off_10005C388 = v43;

        }
        if (dword_10005C708)
        {
          v45 = livefs_std_log(v40);
          v46 = objc_claimAutoreleasedReturnValue(v45);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109378;
            LODWORD(v103[0]) = v96;
            WORD2(v103[0]) = 2112;
            *(_QWORD *)((char *)v103 + 6) = off_10005C388;
            _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Running as %d for port %@", buf, 0x12u);
          }

        }
        has_internal_content = os_variant_has_internal_content("com.apple.filesystems.fskitd");
        byte_10005C738 = has_internal_content;
        if ((_DWORD)has_internal_content)
        {
          v48 = livefs_std_log(has_internal_content);
          v49 = objc_claimAutoreleasedReturnValue(v48);
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Running on internal build.", buf, 2u);
          }

        }
        v50 = objc_autoreleasePoolPush();
        v51 = os_transaction_create("initial startup processing");
        v52 = (void *)qword_10005C770;
        qword_10005C770 = v51;

        v53 = objc_alloc_init(mountTable);
        v54 = (void *)qword_10005C760;
        qword_10005C760 = (uint64_t)v53;

        if (!qword_10005C760)
        {
          v94 = livefs_std_log(v55);
          v95 = objc_claimAutoreleasedReturnValue(v94);
          if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
            sub_100039C20();

          err(1, "Could not allocate mount table");
        }
        v56 = sub_100010A68(2, &stru_100054DF0);
        v57 = objc_claimAutoreleasedReturnValue(v56);
        v58 = (void *)qword_10005C700;
        qword_10005C700 = v57;

        v59 = sub_100010A68(15, &stru_100054E10);
        v60 = objc_claimAutoreleasedReturnValue(v59);
        v61 = (void *)qword_10005C6F8;
        qword_10005C6F8 = v60;

        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_100010B9C, CFSTR("com.apple.mobile.keybagd.first_unlock"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
        v63 = MKBGetDeviceLockState(0);
        if ((_DWORD)v63 == 3 || (v63 = MKBDeviceUnlockedSinceBoot(), (_DWORD)v63))
        {
          v64 = livefs_std_log(v63);
          v65 = objc_claimAutoreleasedReturnValue(v64);
          if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v103[0] = "checkIfUnlocked";
            _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "%s:Device was unlocked, proceed with main flow.", buf, 0xCu);
          }

          sub_100010C04();
        }
        else
        {
          v73 = livefs_std_log(v63);
          v74 = objc_claimAutoreleasedReturnValue(v73);
          if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "checkIfUnlocked - Device was never unlocked.", buf, 2u);
          }

        }
        objc_autoreleasePoolPop(v50);
        v67 = livefs_std_log(v66);
        v68 = objc_claimAutoreleasedReturnValue(v67);
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
          sub_100039C78();

        CFRunLoopRun();
        v70 = livefs_std_log(v69);
        v71 = objc_claimAutoreleasedReturnValue(v70);
        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
          sub_100039C4C();

        return 70;
    }
  }
}

void sub_100010A08(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = dispatch_mig_server(*(_QWORD *)(a1 + 32), 2364, sub_100036D3C);
  if ((_DWORD)v1)
  {
    v2 = v1;
    v3 = livefs_std_log();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_10003A000(v2, v4, v5, v6, v7, v8, v9, v10);

  }
}

NSObject *sub_100010A68(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v3 = a2;
  if (signal(a1, (void (__cdecl *)(int))1) == (void (__cdecl *)(int))-1)
  {
    v7 = livefs_std_log();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10003A064(a1, v8, v9, v10, v11, v12, v13, v14);
LABEL_8:

    exit(71);
  }
  v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, a1, 0, (dispatch_queue_t)&_dispatch_main_q);
  if (!v4)
  {
    v15 = livefs_std_log();
    v8 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10003A0C8(a1, v8, v16, v17, v18, v19, v20, v21);
    goto LABEL_8;
  }
  v5 = v4;
  dispatch_source_set_event_handler(v4, v3);
  dispatch_resume(v5);

  return v5;
}

void sub_100010B3C(id a1)
{
  objc_msgSend((id)qword_10005C760, "tearDownDaemon:withPath:", 1, off_10005C6F0);
  exit(0);
}

void sub_100010B6C(id a1)
{
  objc_msgSend((id)qword_10005C760, "tearDownDaemon:withPath:", 1, off_10005C6F0);
  exit(0);
}

void sub_100010B9C(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[16];

  v1 = livefs_std_log(a1);
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "firstUnlockNotificationCallback: Device unlocked", v3, 2u);
  }

  sub_100010C04();
}

void sub_100010C04()
{
  __CFString *v0;
  void *v1;
  void *v2;
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  unsigned __int8 v9;
  id v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  FPnfsMemFS *v23;
  FPnfsMemFS *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  id v29;
  void *v30;
  id v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  liveFilesMountServiceDelegate *v40;
  void *v41;
  uint64_t v42;
  id v43;
  void *v44;
  fskitdAgentManager *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  uint64_t v53;
  NSObject *v54;
  void *v55;
  __int128 v56;
  __CFString *v57;
  uint64_t v58;
  uint64_t v59;
  NSObject *v60;
  int v61;
  id v62;
  uint64_t v63;
  NSObject *v64;
  uint64_t v65;
  __CFString *v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  NSObject *v72;
  uint64_t v73;
  NSObject *v74;
  uint64_t v75;
  NSObject *v76;
  uint64_t v77;
  NSObject *v78;
  uint64_t v79;
  NSObject *v80;
  uint64_t v81;
  NSObject *v82;
  uint64_t v83;
  NSObject *v84;
  __int128 v85;
  id v86;
  id v87;
  char v88;
  __int128 buf;
  void (*v90)(uint64_t, uint64_t);
  void *v91;
  __CFString *v92;
  id v93;
  uint8_t v94[4];
  __CFString *v95;
  __int16 v96;
  int v97;
  NSFileAttributeKey v98;
  _UNKNOWN **v99;

  objc_msgSend((id)qword_10005C760, "tearDownDaemon:withPath:", 0, off_10005C6F0);
  v0 = off_10005C6F0;
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v88 = 0;
  v98 = NSFilePosixPermissions;
  v99 = &off_100057050;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v99, &v98, 1));
  v3 = objc_msgSend(v1, "fileExistsAtPath:isDirectory:", v0, &v88);
  if (!(_DWORD)v3)
  {
    *(_QWORD *)&buf = 0;
    v9 = objc_msgSend(v1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v0, 0, v2, &buf);
    v10 = (id)buf;
    v6 = v10;
    if ((v9 & 1) == 0)
    {
      v12 = livefs_std_log(v10);
      v4 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        sub_10003A468();
      goto LABEL_14;
    }
    v11 = 0;
    goto LABEL_16;
  }
  if (!v88)
  {
    v13 = livefs_std_log(v3);
    v4 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_10003A268();
    v6 = 0;
    goto LABEL_14;
  }
  v87 = 0;
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "contentsOfDirectoryAtPath:error:", v0, &v87));
  v5 = v87;
  if (v5)
  {
    v6 = v5;
    v7 = livefs_std_log(v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10003A3F4();
    goto LABEL_6;
  }
  if (-[NSObject count](v4, "count"))
  {
    if ((objc_msgSend(v1, "isWritableFileAtPath:", v0) & 1) == 0)
    {
      v57 = objc_retainAutorelease(v0);
      v58 = chmod((const char *)-[__CFString fileSystemRepresentation](v57, "fileSystemRepresentation"), 0x1EDu);
      if ((_DWORD)v58)
      {
        v59 = livefs_std_log(v58);
        v60 = objc_claimAutoreleasedReturnValue(v59);
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
          sub_10003A378((uint64_t)v57, v60);

      }
    }
  }
  v61 = 0;
  *(_QWORD *)&v56 = 138543618;
  v85 = v56;
  while (1)
  {
    v62 = -[NSObject count](v4, "count", v85);
    if (!v62)
    {
      v6 = 0;
LABEL_69:
      if (objc_msgSend(v1, "isWritableFileAtPath:", v0))
      {
        v70 = chmod((const char *)-[__CFString fileSystemRepresentation](objc_retainAutorelease(v0), "fileSystemRepresentation"), 0x16Du);
        if ((_DWORD)v70)
        {
          v71 = livefs_std_log(v70);
          v72 = objc_claimAutoreleasedReturnValue(v71);
          if (os_log_type_enabled(v72, OS_LOG_TYPE_FAULT))
            sub_10003A2C8((uint64_t)v0, v72);

        }
      }
      v11 = 0;
      goto LABEL_15;
    }
    v63 = livefs_std_log(v62);
    v64 = objc_claimAutoreleasedReturnValue(v63);
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v94 = v85;
      v95 = v0;
      v96 = 1024;
      v97 = v61;
      _os_log_error_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "%{public}@ not empty on base system, loop %d!", v94, 0x12u);
    }

    if (v61 == 5)
      break;
    ++v61;
    *(_QWORD *)&buf = _NSConcreteStackBlock;
    *((_QWORD *)&buf + 1) = 3221225472;
    v90 = sub_100011A28;
    v91 = &unk_100054F18;
    v66 = v0;
    v92 = v66;
    v67 = v1;
    v93 = v67;
    -[NSObject enumerateObjectsUsingBlock:](v4, "enumerateObjectsUsingBlock:", &buf);
    v86 = 0;
    v68 = objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "contentsOfDirectoryAtPath:error:", v66, &v86));
    v6 = v86;

    v4 = v68;
    if (v6)
    {
      v4 = v68;
      goto LABEL_69;
    }
  }
  v69 = livefs_std_log(v65);
  v8 = objc_claimAutoreleasedReturnValue(v69);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    sub_10003A34C();
  v6 = 0;
LABEL_6:

LABEL_14:
  v11 = 1;
LABEL_15:

LABEL_16:
  if (v11)
  {
    v73 = livefs_std_log(v14);
    v74 = objc_claimAutoreleasedReturnValue(v73);
    if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
      sub_10003A23C();

    err(1, "Could not build LiveFiles mount path");
  }
  if (dword_10005C708)
  {
    v15 = livefs_std_log(v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "About to tear down pre-existing mounts", (uint8_t *)&buf, 2u);
    }

    if (dword_10005C708)
    {
      v18 = livefs_std_log(v17);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = off_10005C388;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Creating transport on port %@", (uint8_t *)&buf, 0xCu);
      }

    }
  }
  v20 = arc4random();
  dword_10005C768 = v20;
  if (dword_10005C708)
  {
    v21 = livefs_std_log(v20);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Creating the root (FPnfsMemFS) filesystem", (uint8_t *)&buf, 2u);
    }

  }
  v23 = [FPnfsMemFS alloc];
  v24 = -[FPnfsMemFS initWithRootPath:](v23, "initWithRootPath:", off_10005C6F0);
  v25 = (void *)qword_10005C750;
  qword_10005C750 = (uint64_t)v24;

  if (!qword_10005C750)
  {
    v75 = livefs_std_log(v26);
    v76 = objc_claimAutoreleasedReturnValue(v75);
    if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
      sub_10003A12C();

    err(1, "Could not allocate root filesystem");
  }
  if (dword_10005C708)
  {
    v27 = livefs_std_log(v26);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Creating the root mountEntry", (uint8_t *)&buf, 2u);
    }

  }
  v29 = +[mountEntry newWithObject:path:mntTable:](mountEntry, "newWithObject:path:mntTable:");
  v30 = (void *)qword_10005C758;
  qword_10005C758 = (uint64_t)v29;

  v31 = (id)qword_10005C758;
  if (!qword_10005C758)
  {
    v77 = livefs_std_log(0);
    v78 = objc_claimAutoreleasedReturnValue(v77);
    if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
      sub_10003A158();

    err(1, "Could not alloc/init the root mount table entry");
  }
  if (byte_10005C70C)
    v31 = objc_msgSend((id)qword_10005C758, "setIs_inet:", 1);
  if (dword_10005C708)
  {
    v32 = livefs_std_log(v31);
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Mount the root filesystem (FPnfsMemFS", (uint8_t *)&buf, 2u);
    }

  }
  v34 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C758, "mount:", 0));
  if (v34)
  {
    v79 = livefs_std_log(v34);
    v80 = objc_claimAutoreleasedReturnValue(v79);
    if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
      sub_10003A1DC();

    err(1, "Could not initialize the fskitd's root memory filesystem.");
  }
  v35 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "mounts"));
  v36 = (void *)qword_10005C778;
  qword_10005C778 = v35;

  objc_msgSend((id)qword_10005C778, "enumerateObjectsUsingBlock:", &stru_100054E50);
  objc_msgSend((id)qword_10005C760, "resetIndex");
  sub_10000F534((void *)qword_10005C778);
  if (dword_10005C708)
  {
    v38 = livefs_std_log(v37);
    v39 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Staring mounting service", (uint8_t *)&buf, 2u);
    }

  }
  v40 = objc_alloc_init(liveFilesMountServiceDelegate);
  v41 = (void *)qword_10005C780;
  qword_10005C780 = (uint64_t)v40;

  if (!qword_10005C780)
  {
    v81 = livefs_std_log(v42);
    v82 = objc_claimAutoreleasedReturnValue(v81);
    if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
      sub_10003A184();

    err(1, "Could not alloc/init mountServiceDelegate");
  }
  v43 = objc_msgSend(objc_alloc((Class)FSModuleHost), "initWithProbeList:", 1);
  v44 = (void *)qword_10005C740;
  qword_10005C740 = (uint64_t)v43;

  objc_msgSend((id)qword_10005C740, "setModulesLoaded:", &stru_100054E90);
  objc_msgSend((id)qword_10005C740, "setModulesUnloaded:", &stru_100054EB0);
  objc_msgSend((id)qword_10005C740, "loadModulesAndMonitor");
  v45 = objc_alloc_init(fskitdAgentManager);
  v46 = (void *)qword_10005C748;
  qword_10005C748 = (uint64_t)v45;

  v48 = objc_opt_new(FSAuditToken, v47);
  v49 = (void *)qword_10005C730;
  qword_10005C730 = v48;

  v50 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.filesystems.fskitd"));
  v51 = (void *)qword_10005C788;
  qword_10005C788 = (uint64_t)v50;

  if (!qword_10005C788)
  {
    v83 = livefs_std_log(0);
    v84 = objc_claimAutoreleasedReturnValue(v83);
    if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
      sub_10003A1B0();

    err(1, "Could not obtain NSXPCListerner serviceListener");
  }
  v52 = objc_msgSend((id)qword_10005C788, "setDelegate:", qword_10005C780);
  if (dword_10005C708)
  {
    v53 = livefs_std_log(v52);
    v54 = objc_claimAutoreleasedReturnValue(v53);
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "Resuming liveFilesMountService", (uint8_t *)&buf, 2u);
    }

  }
  objc_msgSend((id)qword_10005C788, "resume");
  v55 = (void *)qword_10005C770;
  qword_10005C770 = 0;

}

void sub_100011580(id a1, NSDictionary *a2, unint64_t a3, BOOL *a4)
{
  uint64_t v4;
  NSDictionary *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;

  v4 = LiveFSMounterMountedOnKey;
  v5 = a2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", LiveFSMounterVolumeNameKey));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", LiveFSMounterDisplayNameKey));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", LiveFSMounterDomainStorageKey));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", LiveFSMounterVolumeProviderNameKey));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v5, "objectForKey:", LiveFSMounterDomainErrorKey));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", LiveFSMounterMountIDKey));

  v13 = objc_msgSend(v12, "intValue");
  if (objc_msgSend(v6, "isAbsolutePath"))
    v14 = v6;
  else
    v14 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@"), off_10005C6F0, v6));
  v15 = v14;
  LODWORD(v27) = (_DWORD)v13;
  v16 = +[mountEntry newWithName:fileSystem:displayName:storageName:provider:path:mountID:auditToken:mntTable:](mountEntry, "newWithName:fileSystem:displayName:storageName:provider:path:mountID:auditToken:mntTable:", v7, 0, v8, v9, v10, v14, v27, qword_10005C730, qword_10005C760);
  if (v16)
  {
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C750, "mkMountPath:mountID:", v6, v13));
  }
  else
  {
    v18 = fs_errorForPOSIXError(12);
    v17 = objc_claimAutoreleasedReturnValue(v18);
  }
  v19 = (void *)v17;
  if (v17)
  {
    v20 = livefs_std_log(v17);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v29 = v19;
      v30 = 2114;
      v31 = v10;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Got error %@ reconstituting mount for provider %{public}@", buf, 0x16u);
    }

    v23 = livefs_std_log(v22);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      sub_10003A4D4();

  }
  else
  {
    if (v11)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "deserializedError:", v11));
      objc_msgSend(v16, "setDomainError:", v25);

    }
    objc_msgSend(v16, "setCurrentState:", 1);
    v26 = objc_msgSend(v16, "mount:", 0);
  }

}

void sub_100011880(id a1, NSArray *a2, NSDictionary *a3, NSArray *a4)
{
  NSArray *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  NSUInteger v8;
  __int16 v9;
  NSArray *v10;

  v4 = a2;
  v5 = fskit_std_log(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134218242;
    v8 = -[NSArray count](v4, "count");
    v9 = 2112;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Added %lu identifiers: %@", (uint8_t *)&v7, 0x16u);
  }

}

void sub_10001193C(id a1, NSArray *a2, NSDictionary *a3, NSArray *a4)
{
  NSArray *v4;
  uint64_t v5;
  NSObject *v6;
  NSUInteger v7;
  void *v8;
  int v9;
  NSUInteger v10;
  __int16 v11;
  void *v12;

  v4 = a2;
  v5 = fskit_std_log(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = -[NSArray count](v4, "count");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray fs_map:](v4, "fs_map:", &stru_100054EF0));
    v9 = 134218242;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Removed %lu identifiers: %@", (uint8_t *)&v9, 0x16u);

  }
}

id sub_100011A20(id a1, FSModuleInstance *a2)
{
  return -[FSModuleInstance bundleIdentifier](a2, "bundleIdentifier");
}

void sub_100011A28(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stringByAppendingPathComponent:", a2));
  v4 = *(void **)(a1 + 40);
  v8 = 0;
  objc_msgSend(v4, "removeItemAtPath:error:", v3, &v8);
  v5 = v8;
  v6 = livefs_std_log(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v10 = v3;
    v11 = 2112;
    v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Removal of items at %{public}@ returned %@", buf, 0x16u);
  }

}

void sub_100011B24(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_100011B34(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_100011B44(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x12u);
}

void sub_100011B50(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_100011B60(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

uint64_t sub_100011E38(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_100011F2C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_100011FFC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1000120CC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1000121BC(uint64_t a1, int a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  void *v13;
  id v14;

  v14 = a3;
  v11 = a5;
  v12 = a6;
  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", objc_msgSend(objc_retainAutorelease(a4), "bytes")));
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

uint64_t sub_100012380(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_100012420(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1000124E4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1000125FC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", objc_msgSend(objc_retainAutorelease(a2), "bytes")));
    v8 = fskit_std_log(v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v12 = 136315650;
      v13 = "-[FSVolumeConnectorBridge getRootFileHandleWithError:]_block_invoke";
      v14 = 2112;
      v15 = v7;
      v16 = 2112;
      v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s:reply:rootFH:%@:err:%@", (uint8_t *)&v12, 0x20u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v10 = fskit_std_log(v5);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = 136315650;
      v13 = "-[FSVolumeConnectorBridge getRootFileHandleWithError:]_block_invoke";
      v14 = 2112;
      v15 = 0;
      v16 = 2112;
      v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s:reply:rootFH:%@:err:%@", (uint8_t *)&v12, 0x20u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

uint64_t sub_100012848(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100012928(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9, void *a10)
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v20 = a10;
  if ((_DWORD)a2)
  {
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2);
  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", objc_msgSend(objc_retainAutorelease(a4), "bytes")));
    if (v16)
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", objc_msgSend(objc_retainAutorelease(v16), "bytes")));
    else
      v22 = 0;
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0);

  }
}

void sub_100012BBC(uint64_t a1, int a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  void *v13;
  id v14;

  v14 = a3;
  v11 = a5;
  v12 = a6;
  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", objc_msgSend(objc_retainAutorelease(a4), "bytes")));
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

void sub_100012D7C(uint64_t a1, int a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  int v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  id v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = fskit_std_log(v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v18 = 136315650;
    v19 = "-[FSVolumeConnectorBridge makeDirectoryIn:named:attributes:requestID:reply:]_block_invoke";
    v20 = 1024;
    v21 = a2;
    v22 = 2112;
    v23 = v12;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s:result:%d theItem:%@", (uint8_t *)&v18, 0x1Cu);
  }

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", objc_msgSend(objc_retainAutorelease(v12), "bytes")));
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

uint64_t sub_100013010(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100013130(uint64_t a1, int a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  void *v13;
  id v14;

  v14 = a3;
  v11 = a5;
  v12 = a6;
  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", objc_msgSend(objc_retainAutorelease(a4), "bytes")));
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

uint64_t sub_1000132CC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1000133A4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_100013444(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100013780(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001379C(uint64_t result, int a2, int a3)
{
  if (!a2)
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 32) = a3;
  return result;
}

uint64_t sub_1000137B4(uint64_t result, int a2, int a3)
{
  if (!a2)
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 36) = a3;
  return result;
}

uint64_t sub_1000137CC(uint64_t result, int a2)
{
  if (!a2)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 44) |= 2u;
  return result;
}

uint64_t sub_1000137EC(uint64_t result, int a2, int a3)
{
  if (!a2)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 44) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                          + 8)
                                                                              + 44) & 0xFE | (a3 != 0);
  return result;
}

uint64_t sub_100013818(uint64_t result, int a2, int a3)
{
  if (!a2)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 44) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                          + 8)
                                                                              + 44) & 0xFB | (4 * (a3 == 0));
  return result;
}

uint64_t sub_100013844(uint64_t result, int a2, int a3)
{
  if (!a2)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 44) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                          + 8)
                                                                              + 44) & 0xF7 | (8 * (a3 != 0));
  return result;
}

uint64_t sub_100013870(uint64_t result, int a2, int a3)
{
  if (!a2)
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 40) = a3;
  return result;
}

uint64_t sub_1000139B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, a3, a4, objc_msgSend(*(id *)(a1 + 32), "mutableBytes"));
}

uint64_t sub_100013B40(uint64_t a1, uint64_t a2, size_t a3)
{
  memcpy(objc_msgSend(*(id *)(a1 + 32), "mutableBytes"), objc_msgSend(*(id *)(a1 + 40), "bytes"), a3);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t sub_100013CDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, a3, a4, objc_msgSend(*(id *)(a1 + 32), "mutableBytes"));
}

uint64_t sub_100013E78(uint64_t a1, uint64_t a2, size_t a3)
{
  memcpy(objc_msgSend(*(id *)(a1 + 32), "mutableBytes"), objc_msgSend(*(id *)(a1 + 40), "bytes"), a3);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t sub_10001401C(uint64_t a1, uint64_t a2, size_t a3)
{
  memcpy(objc_msgSend(*(id *)(a1 + 32), "mutableBytes"), objc_msgSend(*(id *)(a1 + 40), "bytes"), a3);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t sub_100014188(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, objc_msgSend(*(id *)(a1 + 32), "mutableBytes"));
}

uint64_t sub_10001426C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_100014328(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_10001443C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_100014550(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1000146FC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1000147B8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1000148E8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1000149C0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_100014AB0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_100014B7C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_100014C7C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100014D4C(uint64_t a1, int a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  _QWORD v7[5];

  if (a2)
  {
    v4 = 0;
  }
  else
  {
    v5 = a3;
    v7[0] = objc_msgSend(v5, "totalBytes");
    v7[1] = objc_msgSend(v5, "availableBytes");
    v7[2] = objc_msgSend(v5, "freeBytes");
    v7[3] = objc_msgSend(v5, "totalFiles");
    v6 = objc_msgSend(v5, "freeFiles");

    v7[4] = v6;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v7, 40));
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t sub_100014ED8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_100014FCC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1000150A8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100015870(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a4;
  v7 = *(_QWORD *)(a1 + 32);
  if ((_DWORD)a2)
  {
    (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD))(v7 + 16))(v7, a2, 0, 0);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataUsingEncoding:", 4));
    (*(void (**)(uint64_t, _QWORD, void *, id))(v7 + 16))(v7, 0, v8, v9);

  }
}

void sub_100015FCC(_Unwind_Exception *a1)
{
  void *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v3 - 80));
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100016008(uint64_t a1)
{
  id *WeakRetained;
  id obj;

  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained[1], "removeObjectForKey:", *(_QWORD *)(a1 + 40));

  objc_sync_exit(obj);
}

void sub_100016064(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

id sub_100016078(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend((id)qword_10005C728, "instanceDied:instanceUUID:uid:", a2, a3, *(unsigned int *)(a1 + 32));
}

FSModuleIdentity *__cdecl sub_100016190(id a1, FSModuleInstance *a2)
{
  return (FSModuleIdentity *)-[FSModuleInstance identity](a2, "identity");
}

void sub_100016420(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100016458(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100016468(uint64_t a1)
{

}

void sub_100016470(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void sub_1000164DC(uint64_t *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;

  v7 = a2;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "attributes"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", FSModuleIdentityAttributeShortName));
  v10 = v9;
  if (v9 && !objc_msgSend(v9, "caseInsensitiveCompare:", a1[4]))
  {
    v11 = fskit_std_log(0);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      sub_10003A500(a1 + 4, v12);

    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
    v13 = *(_QWORD *)(a1[6] + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = 0;

    *a4 = 1;
  }

}

void sub_100016754(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  BOOL v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  if (v7)
    v9 = v11 == 0;
  else
    v9 = 1;
  if (v9 && !v8)
  {
    v10 = fs_errorForPOSIXError(54);
    v8 = (id)objc_claimAutoreleasedReturnValue(v10);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void sub_100016934(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v7 = a2;
  v5 = a3;
  if (!(v7 | v5))
  {
    v6 = fs_errorForPOSIXError(54);
    v5 = objc_claimAutoreleasedReturnValue(v6);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void sub_100016AF0(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100016B7C(id a1)
{
  NSObject *v1;
  uint64_t v2;
  NSObject *v3;
  int v4;
  uint64_t v5;

  qword_10005C798 = (uint64_t)DASessionCreate(kCFAllocatorDefault);
  v1 = dispatch_queue_create("com.apple.fskitd.da", 0);
  DASessionSetDispatchQueue((DASessionRef)qword_10005C798, v1);
  v2 = fskit_std_log();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = qword_10005C798;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Setup main DA session, %@", (uint8_t *)&v4, 0xCu);
  }

}

uint64_t sub_100016D4C(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_100016E88(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1000173FC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100017424(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)FSTaskPurposeFormat;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "taskPurpose"));
  LODWORD(v2) = objc_msgSend(v2, "isEqualToString:", v3);

  if ((_DWORD)v2)
    +[fskitdDAOperations probeDisk:replyHandler:](fskitdDAOperations, "probeDisk:replyHandler:", *(_QWORD *)(a1 + 40), &stru_100055438);
}

void sub_1000174A8(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id obj;

  obj = a2;
  objc_sync_enter(obj);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "ourConn"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "ourConn"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "remoteObjectProxy"));

    objc_msgSend(v5, "taskStatusUpdate:", *(_QWORD *)(a1 + 32));
  }
  objc_sync_exit(obj);

}

void sub_100017540(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_100017630(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001782C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100017BA0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100017BB4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  v4 = fskit_std_log(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_10003AB50((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100017C20(uint64_t a1, void *a2)
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
  uint64_t v13;

  v3 = a2;
  v4 = fskit_std_log(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_10003AC24();
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    sub_10003ABB4(v6, v7, v8, v9, v10, v11, v12, v13);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100018248(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_10001825C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_1000184EC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100018500(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  uint64_t v10;

  v6 = a2;
  *a4 = 0;
  v7 = *(void **)(a1 + 32);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
  if (objc_msgSend(v7, "localizedStandardCompare:", v8))
  {

  }
  else
  {
    v9 = objc_msgSend(v6, "nascent");

    if ((v9 & 1) == 0)
    {
      v10 = 1;
      *a4 = 1;
      goto LABEL_6;
    }
  }
  v10 = 0;
LABEL_6:

  return v10;
}

void sub_1000186F4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL sub_100018708(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v5;
  void *v6;
  id v7;

  *a4 = 0;
  v5 = *(void **)(a1 + 32);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "name"));
  v7 = objc_msgSend(v5, "localizedStandardCompare:", v6);

  if (!v7)
    *a4 = 1;
  return v7 == 0;
}

void sub_100018964(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL sub_100018978(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v5;
  void *v6;
  id v7;

  *a4 = 0;
  v5 = *(void **)(a1 + 32);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "name"));
  v7 = objc_msgSend(v5, "localizedStandardCompare:", v6);

  if (!v7)
    *a4 = 1;
  return v7 == 0;
}

void sub_100018A74(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100018CB0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL sub_100018CCC(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v5;
  void *v6;
  id v7;

  *a4 = 0;
  v5 = *(void **)(a1 + 32);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "name"));
  v7 = objc_msgSend(v5, "localizedStandardCompare:", v6);

  if (!v7)
    *a4 = 1;
  return v7 == 0;
}

void sub_100018D30(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "fs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "fullPathForRelativePath:", v3));

  v5 = objc_retainAutorelease(v4);
  v6 = rmdir((const char *)objc_msgSend(v5, "fileSystemRepresentation"));
  if ((_DWORD)v6 && (_DWORD)v6 != 66)
  {
    v7 = livefs_std_log(v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10003B06C(v5, v8);

  }
}

void sub_100019078(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1000190A8(uint64_t a1, char *__s, uint64_t a3, uint64_t a4)
{
  size_t v8;

  v8 = strlen(__s);
  *(_QWORD *)a4 = a1;
  *(_QWORD *)(a4 + 8) = a3;
  *(_WORD *)(a4 + 16) = (v8 + 29) & 0xFFF8;
  *(_BYTE *)(a4 + 20) = 2;
  *(_WORD *)(a4 + 18) = v8;
  strlcpy((char *)(a4 + 21), __s, v8 + 1);
  return a4 + *(unsigned __int16 *)(a4 + 16);
}

void sub_10001937C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_100019514(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100019948(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 224);
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "fh"));
  objc_msgSend(v2, "setObject:forKey:", v1, v3);

}

void sub_100019B88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100019BB0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100019BC0(uint64_t a1)
{

}

void sub_100019BC8(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1[4] + 224), "objectForKey:", a1[5]));
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void sub_100019C84(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 224);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "fh"));
  objc_msgSend(v1, "removeObjectForKey:", v2);

}

void sub_10001A47C(uint64_t a1)
{
  void *v2;
  void *v3;
  char *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  unsigned int v19;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "rootNode"));
  if (objc_msgSend(*(id *)(a1 + 40), "count") != (id)2)
  {
    v4 = 0;
    while (1)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", v4));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lookup:", v5));

      if (!v6)
        break;
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "findNode:", v6));

      ++v4;
      v2 = v3;
      if (v4 >= (char *)objc_msgSend(*(id *)(a1 + 40), "count") - 2)
        goto LABEL_6;
    }
  }
  v3 = v2;
LABEL_6:
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", (char *)objc_msgSend(*(id *)(a1 + 40), "count") - 1));
  v8 = objc_msgSend(v3, "rmDir:", v7);

  if (dword_10005C708)
  {
    v10 = livefs_std_log(v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", (char *)objc_msgSend(*(id *)(a1 + 40), "count") - 1));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
      v14 = 138412802;
      v15 = v12;
      v16 = 2112;
      v17 = v13;
      v18 = 1024;
      v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Attempting to remove %@ from %@ returned %d", (uint8_t *)&v14, 0x1Cu);

    }
  }

}

void sub_10001CD00(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v2);
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001DBFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001DC84(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10001DC94(uint64_t a1)
{

}

void sub_10001DC9C(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;

  v4 = a2;
  v5 = v4;
  if (v4)
  {
    v6 = livefs_std_log(v4);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10003B678();

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_10001DD1C(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_10001DE4C(id *a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  stat v11;

  v2 = a1 + 4;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "stringByAppendingPathComponent:", CFSTR("."), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                   0,
                   0,
                   0));
  v4 = livefs_std_log(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_10003B73C();

  v6 = objc_retainAutorelease(v3);
  stat((const char *)objc_msgSend(v6, "fileSystemRepresentation"), &v11);
  if (objc_msgSend(a1[5], "isEqual:", CFSTR("com.apple.filesystems.UserFS.FileProvider"))
    && (objc_msgSend(a1[6], "isFSKitModule") & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", *v2));
    +[CSSearchableIndex volumeMountedAtURL:withOptions:](CSSearchableIndex, "volumeMountedAtURL:withOptions:", v7, 0);

    v9 = livefs_std_log(v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      sub_10003B6D8();

  }
}

id sub_10001E1E8(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;
  _OWORD v14[2];

  v2 = *(_QWORD **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 72);
  v8 = *(_DWORD *)(a1 + 104);
  v9 = *(_QWORD *)(a1 + 80);
  v10 = *(_QWORD *)(a1 + 88);
  v11 = (void *)v2[2];
  if (v11)
    objc_msgSend(v11, "auditToken");
  else
    memset(v14, 0, sizeof(v14));
  LODWORD(v13) = v8;
  return objc_msgSend(v2, "LiveMounterReallyMountVolume:fileSystem:displayName:provider:domainError:on:how:options:auditToken:reply:", v3, v4, v5, v6, v7, v9, v13, v10, v14, *(_QWORD *)(a1 + 96));
}

id sub_10001E448(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v11;
  _OWORD v12[2];

  v2 = *(_QWORD **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 72);
  v8 = *(_DWORD *)(a1 + 88);
  v9 = (void *)v2[2];
  if (v9)
    objc_msgSend(v9, "auditToken");
  else
    memset(v12, 0, sizeof(v12));
  LODWORD(v11) = v8;
  return objc_msgSend(v2, "LiveMounterReallyMountVolume:fileSystem:displayName:provider:domainError:on:how:options:auditToken:reply:", v3, 0, v4, v5, v6, v7, v11, 0, v12, *(_QWORD *)(a1 + 80));
}

id sub_10001E72C(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v12;
  _OWORD v13[2];

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 64);
  v6 = *(_QWORD *)(a1 + 72);
  v7 = *(_DWORD *)(a1 + 96);
  v8 = *(_QWORD *)(a1 + 80);
  v9 = *(_QWORD *)(a1 + 88);
  v10 = *(_OWORD *)(a1 + 116);
  v13[0] = *(_OWORD *)(a1 + 100);
  v13[1] = v10;
  LODWORD(v12) = v7;
  return objc_msgSend(v2, "LiveMounterReallyMountVolume:fileSystem:displayName:provider:domainError:on:how:options:auditToken:reply:", v1, 0, v3, v4, v5, v6, v12, v8, v13, v9);
}

void sub_10001E978(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", LiveFSMounterDomainErrorKey));

  if (v3)
    objc_msgSend(v5, "setValue:forKey:", 0, LiveFSMounterDomainErrorKey);
  if (*(_QWORD *)(a1 + 32))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "serializedError:"));
    objc_msgSend(v5, "setObject:forKey:", v4, LiveFSMounterDomainErrorKey);

  }
}

id sub_10001EB70(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reallyUpdateErrorStateForVolume:provider:domainError:reply:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

void sub_10001EF7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001EF98(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_10001F41C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001F460(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_10001FAC4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqual:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    if (!v5 || (*(_BYTE *)(a1 + 88) & 1) != 0)
    {
      v7 = *(void **)(a1 + 56);
      v8 = *(_QWORD *)(a1 + 64);
      v9 = *(_QWORD *)(a1 + 40);
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10001FBC8;
      v11[3] = &unk_100055310;
      v10 = *(_QWORD *)(a1 + 72);
      v13 = *(id *)(a1 + 80);
      v12 = v6;
      objc_msgSend(v7, "updateErrorStateForVolume:provider:domainError:reply:", v8, v10, v9, v11);

      goto LABEL_7;
    }
    objc_msgSend(*(id *)(a1 + 48), "setDomainError:", *(_QWORD *)(a1 + 32));
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
LABEL_7:

}

uint64_t sub_10001FBC8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 32));
}

uint64_t sub_10001FDE8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10002017C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a15, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1000201B4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void sub_100020220(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;

  v7 = a2;
  v8 = *(void **)(a1 + 32);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleIdentifier"));
  LODWORD(v8) = objc_msgSend(v8, "isEqualToString:", v9);

  if ((_DWORD)v8)
  {
    v11 = fskit_std_log(v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      sub_10003B828(v7, v12);

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

void sub_1000203A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000203C0(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  if (a2 || !a3)
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "bundleIdentifier"));
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  else
  {
    v4 = fskit_std_log(a1);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      sub_10003B8F8();

    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = 0;

  }
}

void sub_1000209A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100020A08(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;

  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v7 = a2;
  v8 = objc_claimAutoreleasedReturnValue(+[FSBlockDeviceResource dynamicCast:](FSBlockDeviceResource, "dynamicCast:", v7));

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  v12 = fskit_std_log(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v16 = 138412546;
    v17 = v14;
    v18 = 2112;
    v19 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "openWith returned err %@ dev %@", (uint8_t *)&v16, 0x16u);
  }

}

void sub_1000213A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
  uint64_t v53;

  _Block_object_dispose((const void *)(v53 - 176), 8);
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose(&a53, 8);
  _Block_object_dispose((const void *)(v53 - 256), 8);
  _Block_object_dispose((const void *)(v53 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_10002142C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void sub_100021498(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  v8 = a3;
  if (v8)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void sub_100021508(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void sub_100021554(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  id v8;

  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  if (v4)
  {
    v5 = fskit_std_log();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "checkIn returned error %@", (uint8_t *)&v7, 0xCu);
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void sub_10002162C(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  int v18;
  void *v19;
  __int16 v20;
  uint64_t v21;

  v3 = a2;
  v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v5 + 24))
  {
    objc_sync_exit(v4);

  }
  else
  {
    *(_BYTE *)(v5 + 24) = 1;
    objc_sync_exit(v4);

    if (v3)
    {
      v6 = v3;
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "tasks"));
      objc_sync_enter(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "tasks"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "taskID"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v9));

      objc_sync_exit(v7);
      objc_msgSend(v10, "setTaskReferenceHolder:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v6, "taskState") == 3;
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
      {
        v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "taskID"));
        objc_msgSend(v11, "addTaskID:", v12);

        v14 = fskit_std_log(v13);
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "taskID"));
          v17 = *(_QWORD *)(a1 + 40);
          v18 = 138412546;
          v19 = v16;
          v20 = 2112;
          v21 = v17;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Adding taskID %@ to resource %@", (uint8_t *)&v18, 0x16u);

        }
      }

    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }

}

void sub_100021844(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000219F4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100021C00(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100021EDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  void *v15;

  objc_sync_exit(v15);
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_100021F30(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  const char *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;

  v5 = a2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "tasks"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v5));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "taskPurpose"));
    v9 = objc_msgSend(v8, "isEqualToString:", FSTaskPurposeActivate);

    if ((v9 & 1) == 0)
    {
      v10 = fs_errorForPOSIXError(16);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;

      v15 = fskit_std_log(v14);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "getResourceID"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "taskPurpose"));
        v19 = 136315906;
        v20 = "-[fskitdXPCServer canStartUnloadTask:resource:]_block_invoke";
        v21 = 2112;
        v22 = v17;
        v23 = 2112;
        v24 = v5;
        v25 = 2112;
        v26 = v18;
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s:%@: Can't start unload task, previous task (%@) runs task purpose (%@)", (uint8_t *)&v19, 0x2Au);

      }
      *a3 = 1;
    }
  }

}

uint64_t sub_10002251C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1000225C4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_10002266C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100022784(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v2);
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000229A8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1000229BC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1000229D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 32), a3);
}

void sub_100022DB8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100023054(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000234CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  void *v15;

  objc_sync_exit(v15);
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_100023520(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  const char *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;

  v5 = a2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "tasks"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v5));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "taskPurpose"));
    v9 = objc_msgSend(v8, "isEqualToString:", FSTaskPurposeActivate);

    if ((v9 & 1) == 0)
    {
      v10 = fs_errorForPOSIXError(16);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;

      v15 = fskit_std_log(v14);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "getResourceID"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "taskPurpose"));
        v19 = 136315906;
        v20 = "-[fskitdXPCServer canStartDeactivateTask:resource:]_block_invoke";
        v21 = 2112;
        v22 = v17;
        v23 = 2112;
        v24 = v5;
        v25 = 2112;
        v26 = v18;
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s:%@: Can't start deactivate task, previous task (%@) runs task purpose (%@)", (uint8_t *)&v19, 0x2Au);

      }
      *a3 = 1;
    }
  }

}

void sub_100023D64(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  __int128 v25;
  id v26;
  uint64_t v27;
  id v28;
  int8x16_t v29;
  void *v30;
  _QWORD v31[4];
  int8x16_t v32;
  id v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t *v37;
  __int128 v38;
  __int128 v39;
  _OWORD v40[2];
  _QWORD v41[7];
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  id *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;

  v68 = 0;
  v69 = &v68;
  v70 = 0x3032000000;
  v71 = sub_10001DC84;
  v72 = sub_10001DC94;
  v73 = (id)objc_opt_new(NSUUID, a2);
  v62 = 0;
  v63 = &v62;
  v64 = 0x3032000000;
  v65 = sub_10001DC84;
  v66 = sub_10001DC94;
  v67 = 0;
  v56 = 0;
  v57 = &v56;
  v58 = 0x3032000000;
  v59 = sub_10001DC84;
  v60 = sub_10001DC94;
  v3 = fs_errorForPOSIXError(2);
  v61 = (id)objc_claimAutoreleasedReturnValue(v3);
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = sub_10001DC84;
  v54 = sub_10001DC94;
  v55 = 0;
  v44 = 0;
  v45 = (id *)&v44;
  v46 = 0x3032000000;
  v47 = sub_10001DC84;
  v48 = sub_10001DC94;
  v49 = 0;
  v4 = (void *)qword_10005C728;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_OWORD *)(a1 + 88);
  v42 = *(_OWORD *)(a1 + 72);
  v43 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FSAuditToken tokenWithToken:](FSAuditToken, "tokenWithToken:", &v42));
  v8 = *(_QWORD *)(a1 + 40);
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_1000241AC;
  v41[3] = &unk_1000557E8;
  v41[4] = &v44;
  v41[5] = &v62;
  v41[6] = &v50;
  objc_msgSend(v4, "existingExtensionForBundle:user:volume:replyHandler:", v5, v7, v8, v41);

  if (v45[5])
    goto LABEL_2;
  if (v51[5])
  {
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "canStartActivateTask:resource:", v69[5]));
    v11 = v45[5];
    v45[5] = (id)v10;

    if (v45[5])
    {
LABEL_2:
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
      goto LABEL_3;
    }
    v30 = *(void **)(a1 + 48);
    v12 = v51[5];
    v13 = *(_QWORD *)(a1 + 32);
    v14 = v63[5];
    v15 = *(_OWORD *)(a1 + 88);
    v42 = *(_OWORD *)(a1 + 72);
    v43 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[FSAuditToken tokenWithToken:](FSAuditToken, "tokenWithToken:", &v42));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "ourConn"));
    v18 = v17;
    if (v17)
      objc_msgSend(v17, "auditToken");
    else
      memset(v40, 0, sizeof(v40));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[FSAuditToken tokenWithToken:](FSAuditToken, "tokenWithToken:", v40));
    v31[1] = 3221225472;
    v25 = *(_OWORD *)(a1 + 88);
    v38 = *(_OWORD *)(a1 + 72);
    v39 = v25;
    v31[0] = _NSConcreteStackBlock;
    v31[2] = sub_1000242B0;
    v31[3] = &unk_100055860;
    v34 = &v56;
    v35 = &v68;
    v29 = *(int8x16_t *)(a1 + 40);
    v36 = &v62;
    v26 = (id)v29.i64[0];
    v32 = vextq_s8(v29, v29, 8uLL);
    v37 = &v50;
    v33 = *(id *)(a1 + 56);
    v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "applyResource:targetBundle:instanceID:initiatorAuditToken:authorizingAuditToken:isProbe:usingBlock:", v12, v13, v14, v16, v24, 0, v31));
    v28 = v45[5];
    v45[5] = (id)v27;

    if (!v45[5])
      objc_storeStrong(v45 + 5, (id)v57[5]);
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

  }
  else
  {
    v19 = fskit_std_log(v9);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      sub_10003C3C8();

    v21 = *(_QWORD *)(a1 + 64);
    v22 = fs_errorForPOSIXError(22);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v23);

  }
LABEL_3:
  _Block_object_dispose(&v44, 8);

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v56, 8);

  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(&v68, 8);

}

void sub_100024158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
  uint64_t v51;

  _Block_object_dispose(&a45, 8);
  _Block_object_dispose(&a51, 8);
  _Block_object_dispose((const void *)(v51 - 256), 8);
  _Block_object_dispose((const void *)(v51 - 208), 8);
  _Block_object_dispose((const void *)(v51 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1000241AC(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;

  v17 = a2;
  v5 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), a3);
  if (!v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "instanceID"));
    v7 = *(_QWORD *)(a1[5] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "resourceIDs"));
    v10 = objc_msgSend(v9, "count");

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "resourceIDs"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", 0));

      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "resourceManager"));
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "getResource:", v12));
      v15 = *(_QWORD *)(a1[6] + 8);
      v16 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v14;

    }
  }

}

void sub_1000242B0(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  void *v22;
  void *v23;
  __int128 v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[4];
  id v41;
  __int128 v42;

  v33 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v9, "setState:", 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "resourceManager"));
  objc_sync_enter(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "resourceManager"));
  objc_msgSend(v13, "addResource:", v9);

  objc_sync_exit(v12);
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_10002459C;
  v40[3] = &unk_100055810;
  v42 = *(_OWORD *)(a1 + 56);
  v14 = v11;
  v41 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v40));
  v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  v17 = FSTaskPurposeActivate;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "fs_containerIdentifier"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[FSTaskDescription taskDescriptionWithID:state:purpose:error:bundleID:extensionID:resource:](FSTaskDescription, "taskDescriptionWithID:state:purpose:error:bundleID:extensionID:resource:", v16, 0, v17, 0, v33, v18, v9));

  v20 = *(void **)(a1 + 32);
  v21 = *(_OWORD *)(a1 + 104);
  v38 = *(_OWORD *)(a1 + 88);
  v39 = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "getInitiatorBundleIDForToken:", &v38));
  objc_msgSend(v19, "setTaskInitiatorID:", v22);

  v23 = *(void **)(a1 + 32);
  v24 = *(_OWORD *)(a1 + 104);
  v38 = *(_OWORD *)(a1 + 88);
  v39 = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "getInitiatorSigningIDForToken:", &v38));
  objc_msgSend(v19, "setTaskSigningID:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "tasks"));
  objc_sync_enter(v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "tasks"));
  objc_msgSend(v27, "setObject:forKey:", v19, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));

  objc_sync_exit(v26);
  objc_msgSend((id)qword_10005C720, "taskSetChanged");
  v28 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  v29 = *(_QWORD *)(a1 + 40);
  v30 = *(_QWORD *)(a1 + 48);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100024614;
  v34[3] = &unk_100055838;
  v37 = *(_OWORD *)(a1 + 56);
  v35 = v19;
  v36 = v14;
  v31 = v14;
  v32 = v19;
  objc_msgSend(v15, "activateVolume:resource:options:replyHandler:", v29, v28, v30, v34);

}

void sub_10002457C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002459C(_QWORD *a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
  v4 = a2;
  objc_msgSend((id)qword_10005C720, "removeReferencesToTask:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  objc_msgSend((id)qword_10005C720, "taskSetChanged");
  (*(void (**)(void))(a1[4] + 16))();

}

void sub_100024614(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  v4 = *(id *)(a1 + 32);
  if (v6)
  {
    objc_msgSend((id)qword_10005C720, "removeReferencesToTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    objc_msgSend((id)qword_10005C720, "taskSetChanged");
  }
  else
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "updatedDescriptionInState:error:", 3, 0));

    +[fskitdExtensionClient postTaskStatusUpdate:](fskitdExtensionClient, "postTaskStatusUpdate:", v5);
    v4 = (id)v5;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_10002490C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  __int128 v24;
  __int128 v25;
  _OWORD v26[2];
  _OWORD v27[2];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = sub_10001DC84;
  v38 = sub_10001DC94;
  v39 = (id)objc_opt_new(NSUUID, a2);
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_10001DC84;
  v32 = sub_10001DC94;
  v3 = fs_errorForPOSIXError(2);
  v33 = (id)objc_claimAutoreleasedReturnValue(v3);
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "canStartTask:resource:", v35[5], *(_QWORD *)(a1 + 40)));
  if (v4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v8 = v35[5];
    v9 = *(_OWORD *)(a1 + 96);
    v27[0] = *(_OWORD *)(a1 + 80);
    v27[1] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[FSAuditToken tokenWithToken:](FSAuditToken, "tokenWithToken:", v27));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "ourConn"));
    v12 = v11;
    if (v11)
      objc_msgSend(v11, "auditToken");
    else
      memset(v26, 0, sizeof(v26));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[FSAuditToken tokenWithToken:](FSAuditToken, "tokenWithToken:", v26));
    v17[1] = 3221225472;
    v14 = *(_OWORD *)(a1 + 96);
    v24 = *(_OWORD *)(a1 + 80);
    v17[0] = _NSConcreteStackBlock;
    v17[2] = sub_100024BD8;
    v17[3] = &unk_100055900;
    v22 = &v28;
    v23 = &v34;
    v17[4] = *(_QWORD *)(a1 + 32);
    v25 = v14;
    v18 = *(id *)(a1 + 56);
    v19 = *(id *)(a1 + 64);
    v20 = *(id *)(a1 + 40);
    v21 = *(id *)(a1 + 48);
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "applyResource:targetBundle:instanceID:initiatorAuditToken:authorizingAuditToken:isProbe:usingBlock:", v6, v7, v8, v10, v13, 0, v17));

    if (v4)
    {
      v15 = 0;
      v16 = *(_QWORD *)(a1 + 72);
    }
    else
    {
      v4 = (id)v29[5];
      v16 = *(_QWORD *)(a1 + 72);
      if (v4)
        v15 = 0;
      else
        v15 = v35[5];
    }
    (*(void (**)(uint64_t, uint64_t, id))(v16 + 16))(v16, v15, v4);

  }
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
}

void sub_100024BAC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_100024BD8(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  void *v23;
  void *v24;
  __int128 v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  id v36;
  _QWORD *v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  NSObject *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  uint64_t v67;
  __int128 v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  _QWORD v76[5];
  _OWORD v77[2];
  __int128 v78;
  __int128 v79;
  void (*v80)(uint64_t);
  id v81;
  _QWORD v82[4];
  _QWORD *v83;
  _QWORD v84[4];
  _QWORD *v85;
  _QWORD v86[4];
  id v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  _QWORD v91[5];
  _QWORD v92[4];
  id v93;
  __int128 v94;
  _QWORD v95[4];
  id v96;
  __int128 v97;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v10, "setState:", 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "resourceManager"));
  objc_sync_enter(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "resourceManager"));
  objc_msgSend(v14, "addResource:", v10);

  objc_sync_exit(v13);
  v95[0] = _NSConcreteStackBlock;
  v95[1] = 3221225472;
  v95[2] = sub_100025238;
  v95[3] = &unk_100055810;
  v97 = *(_OWORD *)(a1 + 72);
  v15 = v12;
  v96 = v15;
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v95));
  v92[0] = _NSConcreteStackBlock;
  v92[1] = 3221225472;
  v92[2] = sub_1000252B0;
  v92[3] = &unk_100055810;
  v94 = *(_OWORD *)(a1 + 72);
  v16 = v15;
  v93 = v16;
  v74 = v11;
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v92));
  v17 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  v18 = FSTaskPurposeCheck;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "fs_containerIdentifier"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[FSTaskDescription taskDescriptionWithID:state:purpose:error:bundleID:extensionID:resource:](FSTaskDescription, "taskDescriptionWithID:state:purpose:error:bundleID:extensionID:resource:", v17, 0, v18, 0, v9, v19, v10));

  objc_msgSend(v20, "setTerminateExtensionWhenFinished:", 1);
  v21 = *(void **)(a1 + 32);
  v22 = *(_OWORD *)(a1 + 104);
  v78 = *(_OWORD *)(a1 + 88);
  v79 = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "getInitiatorBundleIDForToken:", &v78));
  objc_msgSend(v20, "setTaskInitiatorID:", v23);

  v24 = *(void **)(a1 + 32);
  v25 = *(_OWORD *)(a1 + 104);
  v78 = *(_OWORD *)(a1 + 88);
  v79 = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "getInitiatorSigningIDForToken:", &v78));
  objc_msgSend(v20, "setTaskSigningID:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "tasks"));
  objc_sync_enter(v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "tasks"));
  objc_msgSend(v28, "setObject:forKey:", v20, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
  v72 = v9;

  objc_sync_exit(v27);
  v29 = fskit_std_log(objc_msgSend((id)qword_10005C720, "taskSetChanged"));
  v30 = objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    sub_10003C51C(v10, v30);

  v32 = (void *)objc_opt_new(FSTaskOptionsBundle, v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[FSTaskOption optionWithoutValue:](FSTaskOption, "optionWithoutValue:", FSTaskParameterConstantForceLoad));
  objc_msgSend(v32, "addOption:", v33);

  v91[0] = _NSConcreteStackBlock;
  v91[1] = 3221225472;
  v91[2] = sub_100025328;
  v91[3] = &unk_1000558B0;
  v91[4] = *(_QWORD *)(a1 + 72);
  objc_msgSend(v75, "loadResource:options:replyHandler:", v10, v32, v91);
  v86[0] = _NSConcreteStackBlock;
  v86[1] = 3221225472;
  v86[2] = sub_10002533C;
  v86[3] = &unk_100055838;
  v89 = *(_QWORD *)(a1 + 72);
  v34 = v20;
  v35 = *(_QWORD *)(a1 + 80);
  v87 = v34;
  v90 = v35;
  v36 = v16;
  v88 = v36;
  v37 = objc_retainBlock(v86);
  v38 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  if (!v38)
  {
    v53 = fskit_std_log(0);
    v54 = objc_claimAutoreleasedReturnValue(v53);
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
      sub_10003C43C(v54, v55, v56, v57, v58, v59, v60, v61);

    v62 = *(_QWORD *)(a1 + 40);
    v63 = *(_QWORD *)(a1 + 48);
    v64 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    v84[0] = _NSConcreteStackBlock;
    v84[1] = 3221225472;
    v84[2] = sub_10002540C;
    v84[3] = &unk_1000551E8;
    v85 = v37;
    v51 = v73;
    objc_msgSend(v73, "checkWithOptions:connection:taskID:replyHandler:", v62, v63, v64, v84);
    v52 = v85;
    goto LABEL_11;
  }
  if (objc_msgSend(v38, "code") == (id)45)
  {
    v39 = fskit_std_log(45);
    v40 = objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      sub_10003C4AC(v40, v41, v42, v43, v44, v45, v46, v47);

    v48 = *(_QWORD *)(a1 + 40);
    v49 = *(_QWORD *)(a1 + 48);
    v50 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    v82[0] = _NSConcreteStackBlock;
    v82[1] = 3221225472;
    v82[2] = sub_100025418;
    v82[3] = &unk_1000551E8;
    v83 = v37;
    v51 = v73;
    objc_msgSend(v73, "checkResource:options:connection:taskID:replyHandler:", v10, v48, v49, v50, v82);
    v52 = v83;
LABEL_11:

    goto LABEL_15;
  }
  objc_msgSend((id)qword_10005C720, "removeReferencesToTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "resourceManager"));
  objc_msgSend(v65, "removeResource:", *(_QWORD *)(a1 + 56));

  objc_msgSend((id)qword_10005C720, "taskSetChanged");
  *(_QWORD *)&v78 = 0;
  *((_QWORD *)&v78 + 1) = &v78;
  *(_QWORD *)&v79 = 0x3032000000;
  *((_QWORD *)&v79 + 1) = sub_10001DC84;
  v80 = sub_10001DC94;
  v81 = 0;
  v66 = (void *)qword_10005C728;
  v67 = *(_QWORD *)(a1 + 64);
  v68 = *(_OWORD *)(a1 + 104);
  v77[0] = *(_OWORD *)(a1 + 88);
  v77[1] = v68;
  v69 = (void *)objc_claimAutoreleasedReturnValue(+[FSAuditToken tokenWithToken:](FSAuditToken, "tokenWithToken:", v77));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "fs_containerIdentifier"));
  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472;
  v76[2] = sub_100025424;
  v76[3] = &unk_1000558D8;
  v76[4] = &v78;
  objc_msgSend(v66, "existingExtensionForBundle:user:instance:replyHandler:", v67, v69, v70, v76);

  v71 = *(void **)(*((_QWORD *)&v78 + 1) + 40);
  if (v71)
    objc_msgSend(v71, "terminate");
  (*((void (**)(id, _QWORD))v36 + 2))(v36, 0);
  _Block_object_dispose(&v78, 8);

  v51 = v73;
LABEL_15:

}

void sub_10002520C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100025238(_QWORD *a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
  v4 = a2;
  objc_msgSend((id)qword_10005C720, "removeReferencesToTask:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  objc_msgSend((id)qword_10005C720, "taskSetChanged");
  (*(void (**)(void))(a1[4] + 16))();

}

void sub_1000252B0(_QWORD *a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
  v4 = a2;
  objc_msgSend((id)qword_10005C720, "removeReferencesToTask:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  objc_msgSend((id)qword_10005C720, "taskSetChanged");
  (*(void (**)(void))(a1[4] + 16))();

}

void sub_100025328(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
}

void sub_10002533C(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  v4 = *(id *)(a1 + 32);
  if (v6)
  {
    objc_msgSend((id)qword_10005C720, "removeReferencesToTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    objc_msgSend((id)qword_10005C720, "taskSetChanged");
  }
  else
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "updatedDescriptionInState:error:", 1, 0));

    +[fskitdExtensionClient postTaskStatusUpdate:](fskitdExtensionClient, "postTaskStatusUpdate:", v5);
    v4 = (id)v5;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t sub_10002540C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_100025418(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100025424(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_100025714(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100025910(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_100025924(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "taskBundleID"));
  v4 = objc_msgSend(v3, "hasPrefix:", *(_QWORD *)(a1 + 32));

  return v4;
}

void sub_100025B40(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  __int128 *v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  __int128 v32;
  id v33;
  uint64_t v34;
  id v35;
  int8x16_t v36;
  _QWORD v37[4];
  int8x16_t v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t *v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  _OWORD v45[2];
  _QWORD v46[6];
  _QWORD v47[7];
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  id *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  id v79;

  v74 = 0;
  v75 = &v74;
  v76 = 0x3032000000;
  v77 = sub_10001DC84;
  v78 = sub_10001DC94;
  v79 = (id)objc_opt_new(NSUUID, a2);
  v68 = 0;
  v69 = &v68;
  v70 = 0x3032000000;
  v71 = sub_10001DC84;
  v72 = sub_10001DC94;
  v73 = 0;
  v62 = 0;
  v63 = &v62;
  v64 = 0x3032000000;
  v65 = sub_10001DC84;
  v66 = sub_10001DC94;
  v3 = fs_errorForPOSIXError(2);
  v67 = (id)objc_claimAutoreleasedReturnValue(v3);
  v56 = 0;
  v57 = &v56;
  v58 = 0x3032000000;
  v59 = sub_10001DC84;
  v60 = sub_10001DC94;
  v61 = 0;
  v50 = 0;
  v51 = (id *)&v50;
  v52 = 0x3032000000;
  v53 = sub_10001DC84;
  v54 = sub_10001DC94;
  v55 = 0;
  v4 = (void *)qword_10005C728;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_OWORD *)(a1 + 88);
  v48 = *(_OWORD *)(a1 + 72);
  v49 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FSAuditToken tokenWithToken:](FSAuditToken, "tokenWithToken:", &v48));
  v8 = *(_QWORD *)(a1 + 40);
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_100025FDC;
  v47[3] = &unk_1000557E8;
  v47[4] = &v50;
  v47[5] = &v68;
  v47[6] = &v56;
  objc_msgSend(v4, "existingExtensionForBundle:user:volume:replyHandler:", v5, v7, v8, v47);

  if (v51[5])
    goto LABEL_2;
  if (v57[5])
  {
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "canStartDeactivateTask:resource:", v75[5]));
    v11 = v51[5];
    v51[5] = (id)v10;

    if (v51[5])
      goto LABEL_2;
    v12 = (__int128 *)(a1 + 72);
    v13 = (void *)qword_10005C728;
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(_OWORD *)(a1 + 88);
    v48 = *(_OWORD *)(a1 + 72);
    v49 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[FSAuditToken tokenWithToken:](FSAuditToken, "tokenWithToken:", &v48));
    v17 = *(_QWORD *)(a1 + 40);
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_1000260E0;
    v46[3] = &unk_100055748;
    v46[4] = &v50;
    v46[5] = &v68;
    objc_msgSend(v13, "existingExtensionForBundle:user:volume:replyHandler:", v14, v16, v17, v46);

    if (v51[5])
    {
LABEL_2:
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      goto LABEL_3;
    }
    v18 = *(void **)(a1 + 48);
    v19 = v57[5];
    v20 = *(_QWORD *)(a1 + 32);
    v21 = v69[5];
    v22 = *(_OWORD *)(a1 + 88);
    v48 = *v12;
    v49 = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[FSAuditToken tokenWithToken:](FSAuditToken, "tokenWithToken:", &v48));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "ourConn"));
    v25 = v24;
    if (v24)
      objc_msgSend(v24, "auditToken");
    else
      memset(v45, 0, sizeof(v45));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[FSAuditToken tokenWithToken:](FSAuditToken, "tokenWithToken:", v45));
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100026160;
    v37[3] = &unk_1000559A0;
    v39 = &v62;
    v40 = &v74;
    v32 = *(_OWORD *)(a1 + 88);
    v43 = *v12;
    v44 = v32;
    v36 = *(int8x16_t *)(a1 + 40);
    v41 = &v68;
    v33 = (id)v36.i64[0];
    v38 = vextq_s8(v36, v36, 8uLL);
    v42 = *(_QWORD *)(a1 + 64);
    v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "applyResource:targetBundle:instanceID:initiatorAuditToken:authorizingAuditToken:isProbe:usingBlock:", v19, v20, v21, v23, v31, 0, v37));
    v35 = v51[5];
    v51[5] = (id)v34;

    if (!v51[5])
      objc_storeStrong(v51 + 5, (id)v63[5]);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  else
  {
    v26 = fskit_std_log(v9);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      sub_10003C5AC();

    v28 = *(_QWORD *)(a1 + 56);
    v29 = fs_errorForPOSIXError(22);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    (*(void (**)(uint64_t, void *))(v28 + 16))(v28, v30);

  }
LABEL_3:
  _Block_object_dispose(&v50, 8);

  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v62, 8);

  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(&v74, 8);

}

void sub_100025F88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,char a56)
{
  uint64_t v56;

  _Block_object_dispose(&a50, 8);
  _Block_object_dispose(&a56, 8);
  _Block_object_dispose((const void *)(v56 - 248), 8);
  _Block_object_dispose((const void *)(v56 - 200), 8);
  _Block_object_dispose((const void *)(v56 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_100025FDC(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;

  v17 = a2;
  v5 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), a3);
  if (!v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "instanceID"));
    v7 = *(_QWORD *)(a1[5] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "resourceIDs"));
    v10 = objc_msgSend(v9, "count");

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "resourceIDs"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", 0));

      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "resourceManager"));
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "getResource:", v12));
      v15 = *(_QWORD *)(a1[6] + 8);
      v16 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v14;

    }
  }

}

void sub_1000260E0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  if (!v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "instanceID"));
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

void sub_100026160(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  void *v21;
  void *v22;
  __int128 v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[4];
  id v40;
  __int128 v41;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1000263F0;
  v39[3] = &unk_100055810;
  v41 = *(_OWORD *)(a1 + 48);
  v13 = v12;
  v40 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v39));
  v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v16 = FSTaskPurposeDeactivate;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "fs_containerIdentifier"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[FSTaskDescription taskDescriptionWithID:state:purpose:error:bundleID:extensionID:resource:](FSTaskDescription, "taskDescriptionWithID:state:purpose:error:bundleID:extensionID:resource:", v15, 0, v16, 0, v9, v17, v10));

  v19 = *(void **)(a1 + 32);
  v20 = *(_OWORD *)(a1 + 96);
  v37 = *(_OWORD *)(a1 + 80);
  v38 = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "getInitiatorBundleIDForToken:", &v37));
  objc_msgSend(v18, "setTaskInitiatorID:", v21);

  v22 = *(void **)(a1 + 32);
  v23 = *(_OWORD *)(a1 + 96);
  v37 = *(_OWORD *)(a1 + 80);
  v38 = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "getInitiatorSigningIDForToken:", &v37));
  objc_msgSend(v18, "setTaskSigningID:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "tasks"));
  objc_sync_enter(v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "tasks"));
  objc_msgSend(v26, "setObject:forKey:", v18, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

  objc_sync_exit(v25);
  objc_msgSend((id)qword_10005C720, "taskSetChanged");
  v27 = *(_QWORD *)(a1 + 40);
  v28 = *(_QWORD *)(a1 + 72);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100026468;
  v32[3] = &unk_100055978;
  v36 = *(_OWORD *)(a1 + 48);
  v33 = v18;
  v34 = v10;
  v35 = v13;
  v29 = v13;
  v30 = v10;
  v31 = v18;
  objc_msgSend(v14, "deactivateVolume:numericOptions:replyHandler:", v27, v28, v32);

}

void sub_1000263DC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000263F0(_QWORD *a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
  v4 = a2;
  objc_msgSend((id)qword_10005C720, "removeReferencesToTask:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  objc_msgSend((id)qword_10005C720, "taskSetChanged");
  (*(void (**)(void))(a1[4] + 16))();

}

void sub_100026468(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
  v4 = *(id *)(a1 + 32);
  if (v8)
  {
    objc_msgSend((id)qword_10005C720, "removeReferencesToTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
    objc_msgSend((id)qword_10005C720, "taskSetChanged");
  }
  else
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "updatedDescriptionInState:error:", 3, 0));

    +[fskitdExtensionClient postTaskStatusUpdate:](fskitdExtensionClient, "postTaskStatusUpdate:", v5);
    objc_msgSend(*(id *)(a1 + 40), "setState:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "resourceManager"));
    objc_sync_enter(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "resourceManager"));
    objc_msgSend(v7, "updateResource:", *(_QWORD *)(a1 + 40));

    objc_sync_exit(v6);
    v4 = (id)v5;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void sub_100026588(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000267C4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  __int128 v28;
  __int128 v29;
  _OWORD v30[2];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint8_t buf[40];

  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = sub_10001DC84;
  v41 = sub_10001DC94;
  v42 = (id)objc_opt_new(NSUUID, a2);
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = sub_10001DC84;
  v35 = sub_10001DC94;
  v3 = fs_errorForPOSIXError(2);
  v36 = (id)objc_claimAutoreleasedReturnValue(v3);
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "canStartTask:resource:", v38[5], *(_QWORD *)(a1 + 40)));
  if (v4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v8 = v38[5];
    v9 = *(_OWORD *)(a1 + 96);
    *(_OWORD *)buf = *(_OWORD *)(a1 + 80);
    *(_OWORD *)&buf[16] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[FSAuditToken tokenWithToken:](FSAuditToken, "tokenWithToken:", buf));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "ourConn"));
    v12 = v11;
    if (v11)
      objc_msgSend(v11, "auditToken");
    else
      memset(v30, 0, sizeof(v30));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[FSAuditToken tokenWithToken:](FSAuditToken, "tokenWithToken:", v30));
    v21[1] = 3221225472;
    v14 = *(_OWORD *)(a1 + 96);
    v28 = *(_OWORD *)(a1 + 80);
    v21[0] = _NSConcreteStackBlock;
    v21[2] = sub_100026B30;
    v21[3] = &unk_100055900;
    v26 = &v31;
    v27 = &v37;
    v21[4] = *(_QWORD *)(a1 + 32);
    v29 = v14;
    v22 = *(id *)(a1 + 56);
    v23 = *(id *)(a1 + 64);
    v24 = *(id *)(a1 + 40);
    v25 = *(id *)(a1 + 48);
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "applyResource:targetBundle:instanceID:initiatorAuditToken:authorizingAuditToken:isProbe:usingBlock:", v6, v7, v8, v10, v13, 0, v21));

    v16 = fskit_std_log(v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = v38[5];
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v4;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Format about to return err %@ uuid %@", buf, 0x16u);
    }

    if (v4)
    {
      v19 = 0;
      v20 = *(_QWORD *)(a1 + 72);
    }
    else
    {
      v4 = (id)v32[5];
      v20 = *(_QWORD *)(a1 + 72);
      if (v4)
        v19 = 0;
      else
        v19 = v38[5];
    }
    (*(void (**)(uint64_t, uint64_t, id))(v20 + 16))(v20, v19, v4);

  }
  _Block_object_dispose(&v31, 8);

  _Block_object_dispose(&v37, 8);
}

void sub_100026AF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_100026B30(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  void *v23;
  void *v24;
  __int128 v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  id v36;
  _QWORD *v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  NSObject *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  uint64_t v67;
  __int128 v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  _QWORD v76[5];
  _OWORD v77[2];
  __int128 v78;
  __int128 v79;
  void (*v80)(uint64_t);
  id v81;
  _QWORD v82[4];
  _QWORD *v83;
  _QWORD v84[4];
  _QWORD *v85;
  _QWORD v86[4];
  id v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  _QWORD v91[5];
  _QWORD v92[4];
  id v93;
  __int128 v94;
  _QWORD v95[4];
  id v96;
  __int128 v97;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v10, "setState:", 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "resourceManager"));
  objc_sync_enter(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "resourceManager"));
  objc_msgSend(v14, "addResource:", v10);

  objc_sync_exit(v13);
  v95[0] = _NSConcreteStackBlock;
  v95[1] = 3221225472;
  v95[2] = sub_100027190;
  v95[3] = &unk_100055810;
  v97 = *(_OWORD *)(a1 + 72);
  v15 = v12;
  v96 = v15;
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v95));
  v92[0] = _NSConcreteStackBlock;
  v92[1] = 3221225472;
  v92[2] = sub_100027208;
  v92[3] = &unk_100055810;
  v94 = *(_OWORD *)(a1 + 72);
  v16 = v15;
  v93 = v16;
  v74 = v11;
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v92));
  v17 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  v18 = FSTaskPurposeFormat;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "fs_containerIdentifier"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[FSTaskDescription taskDescriptionWithID:state:purpose:error:bundleID:extensionID:resource:](FSTaskDescription, "taskDescriptionWithID:state:purpose:error:bundleID:extensionID:resource:", v17, 0, v18, 0, v9, v19, v10));

  objc_msgSend(v20, "setTerminateExtensionWhenFinished:", 1);
  v21 = *(void **)(a1 + 32);
  v22 = *(_OWORD *)(a1 + 104);
  v78 = *(_OWORD *)(a1 + 88);
  v79 = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "getInitiatorBundleIDForToken:", &v78));
  objc_msgSend(v20, "setTaskInitiatorID:", v23);

  v24 = *(void **)(a1 + 32);
  v25 = *(_OWORD *)(a1 + 104);
  v78 = *(_OWORD *)(a1 + 88);
  v79 = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "getInitiatorSigningIDForToken:", &v78));
  objc_msgSend(v20, "setTaskSigningID:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "tasks"));
  objc_sync_enter(v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "tasks"));
  objc_msgSend(v28, "setObject:forKey:", v20, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
  v72 = v9;

  objc_sync_exit(v27);
  v29 = fskit_std_log(objc_msgSend((id)qword_10005C720, "taskSetChanged"));
  v30 = objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    sub_10003C700(v10, v30);

  v32 = (void *)objc_opt_new(FSTaskOptionsBundle, v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[FSTaskOption optionWithoutValue:](FSTaskOption, "optionWithoutValue:", FSTaskParameterConstantForceLoad));
  objc_msgSend(v32, "addOption:", v33);

  v91[0] = _NSConcreteStackBlock;
  v91[1] = 3221225472;
  v91[2] = sub_100027280;
  v91[3] = &unk_1000558B0;
  v91[4] = *(_QWORD *)(a1 + 72);
  objc_msgSend(v75, "loadResource:options:replyHandler:", v10, v32, v91);
  v86[0] = _NSConcreteStackBlock;
  v86[1] = 3221225472;
  v86[2] = sub_100027294;
  v86[3] = &unk_100055838;
  v89 = *(_QWORD *)(a1 + 72);
  v34 = v20;
  v35 = *(_QWORD *)(a1 + 80);
  v87 = v34;
  v90 = v35;
  v36 = v16;
  v88 = v36;
  v37 = objc_retainBlock(v86);
  v38 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  if (!v38)
  {
    v53 = fskit_std_log(0);
    v54 = objc_claimAutoreleasedReturnValue(v53);
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
      sub_10003C620(v54, v55, v56, v57, v58, v59, v60, v61);

    v62 = *(_QWORD *)(a1 + 40);
    v63 = *(_QWORD *)(a1 + 48);
    v64 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    v84[0] = _NSConcreteStackBlock;
    v84[1] = 3221225472;
    v84[2] = sub_100027364;
    v84[3] = &unk_1000551E8;
    v85 = v37;
    v51 = v73;
    objc_msgSend(v73, "formatWithOptions:connection:taskID:replyHandler:", v62, v63, v64, v84);
    v52 = v85;
    goto LABEL_11;
  }
  if (objc_msgSend(v38, "code") == (id)45)
  {
    v39 = fskit_std_log(45);
    v40 = objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      sub_10003C690(v40, v41, v42, v43, v44, v45, v46, v47);

    v48 = *(_QWORD *)(a1 + 40);
    v49 = *(_QWORD *)(a1 + 48);
    v50 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    v82[0] = _NSConcreteStackBlock;
    v82[1] = 3221225472;
    v82[2] = sub_100027370;
    v82[3] = &unk_1000551E8;
    v83 = v37;
    v51 = v73;
    objc_msgSend(v73, "formatResource:options:connection:taskID:replyHandler:", v10, v48, v49, v50, v82);
    v52 = v83;
LABEL_11:

    goto LABEL_15;
  }
  objc_msgSend((id)qword_10005C720, "removeReferencesToTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "resourceManager"));
  objc_msgSend(v65, "removeResource:", *(_QWORD *)(a1 + 56));

  objc_msgSend((id)qword_10005C720, "taskSetChanged");
  *(_QWORD *)&v78 = 0;
  *((_QWORD *)&v78 + 1) = &v78;
  *(_QWORD *)&v79 = 0x3032000000;
  *((_QWORD *)&v79 + 1) = sub_10001DC84;
  v80 = sub_10001DC94;
  v81 = 0;
  v66 = (void *)qword_10005C728;
  v67 = *(_QWORD *)(a1 + 64);
  v68 = *(_OWORD *)(a1 + 104);
  v77[0] = *(_OWORD *)(a1 + 88);
  v77[1] = v68;
  v69 = (void *)objc_claimAutoreleasedReturnValue(+[FSAuditToken tokenWithToken:](FSAuditToken, "tokenWithToken:", v77));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "fs_containerIdentifier"));
  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472;
  v76[2] = sub_10002737C;
  v76[3] = &unk_1000558D8;
  v76[4] = &v78;
  objc_msgSend(v66, "existingExtensionForBundle:user:instance:replyHandler:", v67, v69, v70, v76);

  v71 = *(void **)(*((_QWORD *)&v78 + 1) + 40);
  if (v71)
    objc_msgSend(v71, "terminate");
  (*((void (**)(id, _QWORD))v36 + 2))(v36, 0);
  _Block_object_dispose(&v78, 8);

  v51 = v73;
LABEL_15:

}

void sub_100027164(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100027190(_QWORD *a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
  v4 = a2;
  objc_msgSend((id)qword_10005C720, "removeReferencesToTask:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  objc_msgSend((id)qword_10005C720, "taskSetChanged");
  (*(void (**)(void))(a1[4] + 16))();

}

void sub_100027208(_QWORD *a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
  v4 = a2;
  objc_msgSend((id)qword_10005C720, "removeReferencesToTask:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  objc_msgSend((id)qword_10005C720, "taskSetChanged");
  (*(void (**)(void))(a1[4] + 16))();

}

void sub_100027280(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
}

void sub_100027294(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  v4 = *(id *)(a1 + 32);
  if (v6)
  {
    objc_msgSend((id)qword_10005C720, "removeReferencesToTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    objc_msgSend((id)qword_10005C720, "taskSetChanged");
  }
  else
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "updatedDescriptionInState:error:", 1, 0));

    +[fskitdExtensionClient postTaskStatusUpdate:](fskitdExtensionClient, "postTaskStatusUpdate:", v5);
    v4 = (id)v5;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t sub_100027364(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_100027370(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10002737C(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_100027664(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_100027694(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

uint64_t sub_100027700(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleIdentifier"));
  if ((objc_msgSend(v4, "hasPrefix:", *(_QWORD *)(a1 + 32)) & 1) != 0)
    v5 = 1;
  else
    v5 = (uint64_t)objc_msgSend(v3, "isSystem");

  return v5;
}

void sub_100027A40(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t *v34;
  __int128 v35;
  __int128 v36;
  _OWORD v37[2];
  _QWORD v38[6];
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  id *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;

  v65 = 0;
  v66 = &v65;
  v67 = 0x3032000000;
  v68 = sub_10001DC84;
  v69 = sub_10001DC94;
  v70 = (id)objc_opt_new(NSUUID, a2);
  v59 = 0;
  v60 = &v59;
  v61 = 0x3032000000;
  v62 = sub_10001DC84;
  v63 = sub_10001DC94;
  v64 = 0;
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = sub_10001DC84;
  v57 = sub_10001DC94;
  v3 = fs_errorForPOSIXError(2);
  v58 = (id)objc_claimAutoreleasedReturnValue(v3);
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = sub_10001DC84;
  v51 = sub_10001DC94;
  v52 = 0;
  v41 = 0;
  v42 = (id *)&v41;
  v43 = 0x3032000000;
  v44 = sub_10001DC84;
  v45 = sub_10001DC94;
  v46 = 0;
  v4 = (void *)qword_10005C728;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_OWORD *)(a1 + 96);
  v39 = *(_OWORD *)(a1 + 80);
  v40 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FSAuditToken tokenWithToken:](FSAuditToken, "tokenWithToken:", &v39));
  v8 = *(_QWORD *)(a1 + 40);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_100027E7C;
  v38[3] = &unk_100055748;
  v38[4] = &v41;
  v38[5] = &v59;
  objc_msgSend(v4, "extensionForBundle:user:instance:replyHandler:", v5, v7, v8, v38);

  if (v42[5]
    || (v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "canStartTask:resource:", v66[5], *(_QWORD *)(a1 + 56))),
        v10 = v42[5],
        v42[5] = (id)v9,
        v10,
        v42[5]))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  else
  {
    v11 = *(void **)(a1 + 48);
    v12 = *(_QWORD *)(a1 + 56);
    v13 = *(_QWORD *)(a1 + 32);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v60[5], "instanceID"));
    v15 = *(_OWORD *)(a1 + 96);
    v39 = *(_OWORD *)(a1 + 80);
    v40 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[FSAuditToken tokenWithToken:](FSAuditToken, "tokenWithToken:", &v39));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "ourConn"));
    v18 = v17;
    if (v17)
      objc_msgSend(v17, "auditToken");
    else
      memset(v37, 0, sizeof(v37));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[FSAuditToken tokenWithToken:](FSAuditToken, "tokenWithToken:", v37));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100027EE8;
    v27[3] = &unk_100055A68;
    v32 = &v65;
    v33 = &v59;
    v20 = *(_QWORD *)(a1 + 48);
    v31 = &v53;
    v27[4] = v20;
    v21 = *(_OWORD *)(a1 + 96);
    v35 = *(_OWORD *)(a1 + 80);
    v36 = v21;
    v28 = *(id *)(a1 + 64);
    v34 = &v47;
    v29 = *(id *)(a1 + 32);
    v30 = *(id *)(a1 + 56);
    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "applyResource:targetBundle:instanceID:initiatorAuditToken:authorizingAuditToken:isProbe:usingBlock:", v12, v13, v14, v16, v19, 0, v27));
    v23 = v42[5];
    v42[5] = (id)v22;

    if (v54[5])
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v60[5], "resourceIDs"));
      objc_msgSend(v24, "enumerateObjectsUsingBlock:", &stru_100055AA8);

      objc_msgSend((id)v60[5], "terminate");
    }
    if (v42[5])
    {
      v25 = 0;
      v26 = *(_QWORD *)(a1 + 72);
    }
    else
    {
      objc_storeStrong(v42 + 5, (id)v54[5]);
      v26 = *(_QWORD *)(a1 + 72);
      if (v42[5])
        v25 = 0;
      else
        v25 = v48[5];
    }
    (*(void (**)(uint64_t, uint64_t))(v26 + 16))(v26, v25);

  }
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v53, 8);

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v65, 8);

}

void sub_100027E2C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 200), 8);
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_100027E7C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void sub_100027EE8(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  void *v23;
  void *v24;
  __int128 v25;
  void *v26;
  void *v27;
  void *v28;
  int8x16_t v29;
  uint64_t v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  __int128 v40;
  int8x16_t v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  id v45;
  __int128 v46;

  v34 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v9, "setState:", 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "resourceManager"));
  objc_sync_enter(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "resourceManager"));
  objc_msgSend(v13, "addResource:", v9);

  objc_sync_exit(v12);
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_1000281FC;
  v44[3] = &unk_100055810;
  v46 = *(_OWORD *)(a1 + 64);
  v14 = v11;
  v45 = v14;
  v33 = v10;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v44));
  v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  v17 = FSTaskPurposeLoad;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "instanceID"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "fs_containerIdentifier"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[FSTaskDescription taskDescriptionWithID:state:purpose:error:bundleID:extensionID:resource:](FSTaskDescription, "taskDescriptionWithID:state:purpose:error:bundleID:extensionID:resource:", v16, 0, v17, 0, v34, v19, v9));

  v21 = *(void **)(a1 + 32);
  v22 = *(_OWORD *)(a1 + 112);
  v42 = *(_OWORD *)(a1 + 96);
  v43 = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "getInitiatorBundleIDForToken:", &v42));
  objc_msgSend(v20, "setTaskInitiatorID:", v23);

  v24 = *(void **)(a1 + 32);
  v25 = *(_OWORD *)(a1 + 112);
  v42 = *(_OWORD *)(a1 + 96);
  v43 = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "getInitiatorSigningIDForToken:", &v42));
  objc_msgSend(v20, "setTaskSigningID:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "tasks"));
  objc_sync_enter(v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "tasks"));
  objc_msgSend(v28, "setObject:forKey:", v20, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));

  objc_sync_exit(v27);
  objc_msgSend((id)qword_10005C720, "taskSetChanged");
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100028274;
  v35[3] = &unk_100055A40;
  v36 = v20;
  v29 = vextq_s8(*(int8x16_t *)(a1 + 80), *(int8x16_t *)(a1 + 80), 8uLL);
  v40 = *(_OWORD *)(a1 + 64);
  v41 = v29;
  v30 = *(_QWORD *)(a1 + 40);
  v37 = *(id *)(a1 + 48);
  v38 = *(id *)(a1 + 56);
  v39 = v14;
  v31 = v14;
  v32 = v20;
  objc_msgSend(v15, "loadResource:options:replyHandler:", v9, v30, v35);

}

void sub_1000281DC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000281FC(_QWORD *a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
  v4 = a2;
  objc_msgSend((id)qword_10005C720, "removeReferencesToTask:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  objc_msgSend((id)qword_10005C720, "taskSetChanged");
  (*(void (**)(void))(a1[4] + 16))();

}

void sub_100028274(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;

  v5 = a2;
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a3);
  v7 = *(id *)(a1 + 32);
  if (v6)
  {
    objc_msgSend((id)qword_10005C720, "removeReferencesToTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
    objc_msgSend((id)qword_10005C720, "taskSetChanged");
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "updatedDescriptionInState:error:", 3, 0));

    +[fskitdExtensionClient postTaskStatusUpdate:](fskitdExtensionClient, "postTaskStatusUpdate:", v8);
    v9 = objc_msgSend(v5, "copy");
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "errorFromStartingProc"));
    v13 = (void *)v12;
    if (v12)
    {
      v14 = fskit_std_log(v12);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 136315650;
        v22 = "-[fskitdXPCServer _loadResource:usingBundle:options:auditToken:replyHandler:]_block_invoke_5";
        v23 = 2112;
        v24 = v16;
        v25 = 2112;
        v26 = v13;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s: Can't find instance of bundleID %@ err %@", buf, 0x20u);
      }

      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v13);
    }
    v17 = *(_QWORD *)(a1 + 88);
    if (*(_QWORD *)(*(_QWORD *)(v17 + 8) + 40))
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1000284C0;
      v20[3] = &unk_100055A18;
      v20[4] = v17;
      objc_msgSend(v5, "enumerateObjectsUsingBlock:", v20);
      v18 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "getResourceID"));
      objc_msgSend(v18, "addResourceID:", v19);

    }
    v7 = (id)v8;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void sub_1000284C0(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;

  v3 = a2;
  v4 = fskit_std_log(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_10003C790(v3, v5);

  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "volumeID"));
  objc_msgSend(v6, "addVolumeID:", v7);

}

void sub_100028548(id a1, NSString *a2, unint64_t a3, BOOL *a4)
{
  void *v4;
  NSString *v5;
  void *v6;
  id v7;

  v4 = (void *)qword_10005C720;
  v5 = a2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resourceManager"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getResource:", v5));

  +[fskitdExtensionClient closeResource:andRevoke:](fskitdExtensionClient, "closeResource:andRevoke:", v7, 1);
}

void sub_10002880C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  __int128 v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  _QWORD v26[8];
  __int128 v27;
  __int128 v28;
  _BYTE v29[32];
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  id *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  _QWORD v44[5];
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;

  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = sub_10001DC84;
  v50 = sub_10001DC94;
  v51 = (id)objc_opt_new(NSUUID, a2);
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3032000000;
  v44[3] = sub_10001DC84;
  v44[4] = sub_10001DC94;
  v45 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = sub_10001DC84;
  v42 = sub_10001DC94;
  v3 = fs_errorForPOSIXError(2);
  v43 = (id)objc_claimAutoreleasedReturnValue(v3);
  v32 = 0;
  v33 = (id *)&v32;
  v34 = 0x3032000000;
  v35 = sub_10001DC84;
  v36 = sub_10001DC94;
  v37 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "canStartProbeTask:resource:", v47[5], *(_QWORD *)(a1 + 40)));
  if (v33[5])
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[FSModuleHost defaultInstanceUUID](FSModuleHost, "defaultInstanceUUID"));
    v8 = *(_OWORD *)(a1 + 80);
    v30 = *(_OWORD *)(a1 + 64);
    v31 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[FSAuditToken tokenWithToken:](FSAuditToken, "tokenWithToken:", &v30));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "ourConn"));
    v11 = v10;
    if (v10)
      objc_msgSend(v10, "auditToken");
    else
      memset(v29, 0, sizeof(v29));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[FSAuditToken tokenWithToken:](FSAuditToken, "tokenWithToken:", v29));
    v26[0] = _NSConcreteStackBlock;
    v13 = *(_OWORD *)(a1 + 80);
    v27 = *(_OWORD *)(a1 + 64);
    v26[1] = 3221225472;
    v26[2] = sub_100028BCC;
    v26[3] = &unk_100055AF8;
    v26[4] = *(_QWORD *)(a1 + 32);
    v26[5] = &v38;
    v28 = v13;
    v26[6] = &v46;
    v26[7] = v44;
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "applyResource:targetBundle:instanceID:initiatorAuditToken:authorizingAuditToken:isProbe:usingBlock:", v5, v6, v7, v9, v12, 1, v26));
    v15 = v33[5];
    v33[5] = (id)v14;

    if (!v33[5])
    {
      objc_storeStrong(v33 + 5, (id)v39[5]);
      if (!v33[5])
      {
        v16 = (void *)qword_10005C728;
        v17 = *(_QWORD *)(a1 + 48);
        v18 = *(_OWORD *)(a1 + 80);
        v30 = *(_OWORD *)(a1 + 64);
        v31 = v18;
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[FSAuditToken tokenWithToken:](FSAuditToken, "tokenWithToken:", &v30));
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[FSModuleHost defaultInstanceUUID](FSModuleHost, "defaultInstanceUUID"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "fs_containerIdentifier"));
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_100029090;
        v22[3] = &unk_100055B20;
        v24 = &v32;
        v23 = *(id *)(a1 + 40);
        v25 = &v46;
        objc_msgSend(v16, "existingExtensionForBundle:user:instance:replyHandler:", v17, v19, v21, v22);

      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(v44, 8);

  _Block_object_dispose(&v46, 8);
}

void sub_100028B80(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 256), 8);
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_100028BCC(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  __int128 v22;
  void *v23;
  void *v24;
  __int128 v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  __int128 v35;
  uint64_t *v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[4];
  id v41;
  __int128 v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;

  v31 = a2;
  v9 = a3;
  v32 = a4;
  v10 = a5;
  objc_msgSend(v9, "setState:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "resourceManager"));
  objc_sync_enter(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "resourceManager"));
  objc_msgSend(v12, "addResource:", v9);

  objc_sync_exit(v11);
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = sub_10001DC84;
  v47 = sub_10001DC94;
  v48 = 0;
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_100028F18;
  v40[3] = &unk_100055810;
  v42 = *(_OWORD *)(a1 + 40);
  v13 = v10;
  v41 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "remoteObjectProxyWithErrorHandler:", v40));
  v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v16 = FSTaskPurposeProbe;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[FSModuleHost defaultInstanceUUID](FSModuleHost, "defaultInstanceUUID"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "fs_containerIdentifier"));
  v19 = objc_claimAutoreleasedReturnValue(+[FSTaskDescription taskDescriptionWithID:state:purpose:error:bundleID:extensionID:resource:](FSTaskDescription, "taskDescriptionWithID:state:purpose:error:bundleID:extensionID:resource:", v15, 0, v16, 0, v31, v18, v9));
  v20 = (void *)v44[5];
  v44[5] = v19;

  v21 = *(void **)(a1 + 32);
  v22 = *(_OWORD *)(a1 + 80);
  v38 = *(_OWORD *)(a1 + 64);
  v39 = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "getInitiatorBundleIDForToken:", &v38));
  objc_msgSend((id)v44[5], "setTaskInitiatorID:", v23);

  v24 = *(void **)(a1 + 32);
  v25 = *(_OWORD *)(a1 + 80);
  v38 = *(_OWORD *)(a1 + 64);
  v39 = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "getInitiatorSigningIDForToken:", &v38));
  objc_msgSend((id)v44[5], "setTaskSigningID:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "tasks"));
  objc_sync_enter(v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "tasks"));
  objc_msgSend(v28, "setObject:forKey:", v44[5], *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

  objc_sync_exit(v27);
  objc_msgSend((id)qword_10005C720, "taskSetChanged");
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100028F90;
  v33[3] = &unk_100055AD0;
  v35 = *(_OWORD *)(a1 + 40);
  v29 = *(_QWORD *)(a1 + 56);
  v36 = &v43;
  v37 = v29;
  v30 = v13;
  v34 = v30;
  objc_msgSend(v14, "probeResource:replyHandler:", v9, v33);

  _Block_object_dispose(&v43, 8);
}

void sub_100028EE0(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;

  objc_sync_exit(v1);
  _Block_object_dispose((const void *)(v2 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_100028F18(_QWORD *a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
  v4 = a2;
  objc_msgSend((id)qword_10005C720, "removeReferencesToTask:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  objc_msgSend((id)qword_10005C720, "taskSetChanged");
  (*(void (**)(void))(a1[4] + 16))();

}

void sub_100028F90(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v12 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a3);
  if (v12)
  {
    objc_msgSend((id)qword_10005C720, "removeReferencesToTask:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
    objc_msgSend((id)qword_10005C720, "taskSetChanged");
  }
  else
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "updatedDescriptionInState:error:", 3, 0));
    v7 = *(_QWORD *)(a1[7] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    +[fskitdExtensionClient postTaskStatusUpdate:](fskitdExtensionClient, "postTaskStatusUpdate:", *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));
  }
  v9 = *(_QWORD *)(a1[8] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;
  v11 = v5;

  (*(void (**)(void))(a1[4] + 16))();
}

void sub_100029090(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    v7 = fskit_std_log(0);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      sub_10003C81C(a1, v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "getResourceID"));
    objc_msgSend(v5, "removeResourceID:", v9);

    objc_msgSend(v5, "removeTaskID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  }

}

void sub_100029344(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  _QWORD v25[5];
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t *v29;
  __int128 v30;
  __int128 v31;
  _OWORD v32[2];
  _QWORD v33[6];
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  id *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
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

  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = sub_10001DC84;
  v58 = sub_10001DC94;
  v59 = (id)objc_opt_new(NSUUID, a2);
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = sub_10001DC84;
  v52 = sub_10001DC94;
  v3 = fs_errorForPOSIXError(2);
  v53 = (id)objc_claimAutoreleasedReturnValue(v3);
  v42 = 0;
  v43 = (id *)&v42;
  v44 = 0x3032000000;
  v45 = sub_10001DC84;
  v46 = sub_10001DC94;
  v47 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = sub_10001DC84;
  v40 = sub_10001DC94;
  v41 = 0;
  v4 = (void *)qword_10005C728;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_OWORD *)(a1 + 88);
  v34 = *(_OWORD *)(a1 + 72);
  v35 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FSAuditToken tokenWithToken:](FSAuditToken, "tokenWithToken:", &v34));
  v8 = *(_QWORD *)(a1 + 40);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1000296AC;
  v33[3] = &unk_100055748;
  v33[4] = &v42;
  v33[5] = &v36;
  objc_msgSend(v4, "existingExtensionForBundle:user:resource:replyHandler:", v5, v7, v8, v33);

  if (v43[5]
    || (v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "canStartUnloadTask:resource:", v55[5], *(_QWORD *)(a1 + 40))),
        v10 = v43[5],
        v43[5] = (id)v9,
        v10,
        v43[5]))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 40);
    v11 = *(void **)(a1 + 48);
    v13 = *(_QWORD *)(a1 + 32);
    v14 = v37[5];
    v15 = *(_OWORD *)(a1 + 88);
    v34 = *(_OWORD *)(a1 + 72);
    v35 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[FSAuditToken tokenWithToken:](FSAuditToken, "tokenWithToken:", &v34));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "ourConn"));
    v18 = v17;
    if (v17)
      objc_msgSend(v17, "auditToken");
    else
      memset(v32, 0, sizeof(v32));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[FSAuditToken tokenWithToken:](FSAuditToken, "tokenWithToken:", v32));
    v25[1] = 3221225472;
    v20 = *(_OWORD *)(a1 + 88);
    v30 = *(_OWORD *)(a1 + 72);
    v31 = v20;
    v25[0] = _NSConcreteStackBlock;
    v25[2] = sub_10002972C;
    v25[3] = &unk_100055B70;
    v28 = &v54;
    v29 = &v36;
    v21 = *(_QWORD *)(a1 + 48);
    v22 = *(void **)(a1 + 56);
    v27 = &v48;
    v25[4] = v21;
    v26 = v22;
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "applyResource:targetBundle:instanceID:initiatorAuditToken:authorizingAuditToken:isProbe:usingBlock:", v12, v13, v14, v16, v19, 0, v25));
    v24 = v43[5];
    v43[5] = (id)v23;

    if (!v43[5])
      objc_storeStrong(v43 + 5, (id)v49[5]);
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

  }
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v48, 8);

  _Block_object_dispose(&v54, 8);
}

void sub_100029668(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1000296AC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  if (!v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "instanceID"));
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

void sub_10002972C(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  void *v21;
  void *v22;
  __int128 v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[4];
  id v37;
  __int128 v38;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_1000299AC;
  v36[3] = &unk_100055810;
  v38 = *(_OWORD *)(a1 + 48);
  v13 = v12;
  v37 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v36));
  v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v16 = FSTaskPurposeUnload;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "fs_containerIdentifier"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[FSTaskDescription taskDescriptionWithID:state:purpose:error:bundleID:extensionID:resource:](FSTaskDescription, "taskDescriptionWithID:state:purpose:error:bundleID:extensionID:resource:", v15, 0, v16, 0, v9, v17, v10));

  v19 = *(void **)(a1 + 32);
  v20 = *(_OWORD *)(a1 + 88);
  v34 = *(_OWORD *)(a1 + 72);
  v35 = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "getInitiatorBundleIDForToken:", &v34));
  objc_msgSend(v18, "setTaskInitiatorID:", v21);

  v22 = *(void **)(a1 + 32);
  v23 = *(_OWORD *)(a1 + 88);
  v34 = *(_OWORD *)(a1 + 72);
  v35 = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "getInitiatorSigningIDForToken:", &v34));
  objc_msgSend(v18, "setTaskSigningID:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "tasks"));
  objc_sync_enter(v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "tasks"));
  objc_msgSend(v26, "setObject:forKey:", v18, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

  objc_sync_exit(v25);
  objc_msgSend((id)qword_10005C720, "taskSetChanged");
  v27 = *(_QWORD *)(a1 + 40);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100029A24;
  v30[3] = &unk_100055838;
  v33 = *(_OWORD *)(a1 + 48);
  v31 = v18;
  v32 = v13;
  v28 = v13;
  v29 = v18;
  objc_msgSend(v14, "unloadResource:options:replyHandler:", v10, v27, v30);

}

void sub_100029998(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000299AC(_QWORD *a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
  v4 = a2;
  objc_msgSend((id)qword_10005C720, "removeReferencesToTask:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  objc_msgSend((id)qword_10005C720, "taskSetChanged");
  (*(void (**)(void))(a1[4] + 16))();

}

void sub_100029A24(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  v4 = *(id *)(a1 + 32);
  if (v6)
  {
    objc_msgSend((id)qword_10005C720, "removeReferencesToTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    objc_msgSend((id)qword_10005C720, "taskSetChanged");
  }
  else
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "updatedDescriptionInState:error:", 3, 0));

    +[fskitdExtensionClient postTaskStatusUpdate:](fskitdExtensionClient, "postTaskStatusUpdate:", v5);
    v4 = (id)v5;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_100029B3C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void sub_100029B48(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t sub_100029B58(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  *(_QWORD *)(a3 + 4) = v3;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = result;
  *(_WORD *)(a3 + 22) = 2112;
  *(_QWORD *)(a3 + 24) = a2;
  return result;
}

uint64_t sub_100029B74@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_QWORD *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2112;
  *(_QWORD *)(a2 + 14) = result;
  return result;
}

void sub_100029B90(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_error_impl(a1, a4, OS_LOG_TYPE_ERROR, a2, a3, 0x20u);
}

void sub_100029BC0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

uint64_t sub_100029BD0(uint64_t result, uint64_t a2, int a3)
{
  uint64_t v3;

  *(_QWORD *)(a2 + 4) = v3;
  *(_WORD *)(a2 + 12) = 2112;
  *(_QWORD *)(a2 + 14) = result;
  *(_WORD *)(a2 + 22) = 1024;
  *(_DWORD *)(a2 + 24) = a3;
  return result;
}

void sub_100029C04(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_error_impl(a1, a4, OS_LOG_TYPE_ERROR, a2, a3, 0x1Cu);
}

void sub_100029F1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100029F40(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100029F50(uint64_t a1)
{

}

void sub_100029F58(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a2;
  v5 = v4;
  if (v4)
  {
    v6 = livefs_std_log(v4);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10003C8AC((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_100029FD8(uint64_t a1, void *a2)
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
  int v13;
  uint64_t v14;

  v3 = a2;
  v4 = livefs_std_log(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_10003C910((uint64_t)v3, v6, v7, v8, v9, v10, v11, v12);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "setConnected:completionHandler: returned %@", (uint8_t *)&v13, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10002A3D4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = livefs_std_log(v3);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10003C974((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_10002A710(id a1)
{
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[16];

  v1 = livefs_std_log(a1);
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "exit", v3, 2u);
  }

  objc_msgSend((id)qword_10005C760, "tearDownDaemon:withPath:", 1, off_10005C6F0);
  exit(0);
}

void sub_10002A7D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_10002A860(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_10002A8B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_10002B4D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  void *v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  objc_sync_exit(v15);
  _Unwind_Resume(a1);
}

void sub_10002B4F8(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  id v15;

  v15 = a2;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", LiveFSMounterVolumeProviderNameKey));
  v8 = objc_msgSend(v7, "isEqualToString:", a1[4]);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", LiveFSMounterMountedOnKey));
  if ((objc_msgSend(v9, "isEqualToString:", a1[5]) & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", LiveFSMounterMountIDKey));
    if ((objc_msgSend(v10, "isEqualToNumber:", a1[6]) & 1) == 0)
    {
      if (!v8)
      {

        v12 = v15;
        goto LABEL_9;
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", LiveFSMounterDomainStorageKey));
      if (!objc_msgSend(v11, "isEqualToString:", a1[7]))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", LiveFSMounterVolumeNameKey));
        v14 = objc_msgSend(v13, "isEqualToString:", a1[8]);

        v12 = v15;
        if ((v14 & 1) == 0)
          goto LABEL_9;
        goto LABEL_8;
      }

    }
  }

  v12 = v15;
LABEL_8:
  *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24) = a3;
  *a4 = 1;
LABEL_9:

}

void sub_10002B88C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  void *v11;
  uint64_t v12;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v12 - 112), 8);
  objc_sync_exit(v11);
  _Unwind_Resume(a1);
}

uint64_t sub_10002B8BC(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10002B8CC(uint64_t a1)
{

}

void sub_10002B8D4(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v8;
  unsigned int v9;
  void *v10;
  unsigned int v11;
  id v12;

  v12 = a2;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", LiveFSMounterVolumeProviderNameKey));
  v9 = objc_msgSend(v8, "isEqualToString:", a1[4]);

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", LiveFSMounterVolumeNameKey));
    v11 = objc_msgSend(v10, "isEqualToString:", a1[5]);

    if (v11)
    {
      *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a3;
      objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), a2);
      *a4 = 1;
    }
  }

}

void sub_10002BB14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  void *v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  objc_sync_exit(v9);
  _Unwind_Resume(a1);
}

void sub_10002BB34(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  id v11;

  v11 = a2;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", LiveFSMounterVolumeProviderNameKey));
  if ((objc_msgSend(v7, "isEqualToString:", a1[4]) & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", LiveFSMounterVolumeNameKey));
    v9 = objc_msgSend(v8, "isEqualToString:", a1[5]);

    v10 = v11;
    if (v9)
    {
      *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a3;
      *a4 = 1;
    }
  }
  else
  {

    v10 = v11;
  }

}

void sub_10002BC74(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002C0A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002C0D0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10002C0E0(uint64_t a1)
{

}

void sub_10002C0E8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void sub_10002C2F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10002C324(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void sub_10002C860(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_10002C888(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void sub_10002D5C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  uint64_t v45;

  _Block_object_dispose((const void *)(v45 - 176), 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a45, 8);
  _Unwind_Resume(a1);
}

void sub_10002D634(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void sub_10002D6A8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void sub_10002D714(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_10002D724(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

uint64_t sub_10002D798(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10002DEB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  uint64_t v34;

  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 176), 8);
  _Block_object_dispose((const void *)(v34 - 224), 8);
  _Unwind_Resume(a1);
}

void sub_10002DF3C(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id buf[2];

  v6 = a2;
  v7 = a3;
  v8 = livefs_std_log(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Got connection", (uint8_t *)buf, 2u);
    }

    if (*(_BYTE *)(a1 + 56))
      v11 = objc_claimAutoreleasedReturnValue(+[FSKitConstants FSVolumeXPCProtocol](FSKitConstants, "FSVolumeXPCProtocol"));
    else
      v11 = objc_claimAutoreleasedReturnValue(+[LiveFSClient interfaceForListeners](LiveFSClient, "interfaceForListeners"));
    v12 = (void *)v11;
    objc_msgSend(v6, "setRemoteObjectInterface:", v11);

    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 24), a2);
    objc_initWeak(buf, *(id *)(a1 + 40));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10002E19C;
    v21[3] = &unk_100054DB0;
    objc_copyWeak(&v22, buf);
    objc_msgSend(v6, "setInterruptionHandler:", v21);
    v16 = _NSConcreteStackBlock;
    v17 = 3221225472;
    v18 = sub_10002E1CC;
    v19 = &unk_100054DB0;
    objc_copyWeak(&v20, buf);
    objc_msgSend(v6, "setInvalidationHandler:", &v16);
    v14 = (void *)objc_opt_new(LiveFSVolumeClient, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[LiveFSVolumeClient exportedClientInterface](LiveFSVolumeClient, "exportedClientInterface", v16, v17, v18, v19));
    objc_msgSend(v6, "setExportedInterface:", v15);

    objc_msgSend(v6, "setExportedObject:", v14);
    objc_msgSend(v6, "resume");
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(buf);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10003CFA0();

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }

}

void sub_10002E16C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10002E19C(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "handleConnectionInterrupted");
    WeakRetained = v2;
  }

}

void sub_10002E1CC(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = livefs_std_log(WeakRetained);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    sub_10003D000((uint64_t)WeakRetained, v3, v4);

  if (WeakRetained)
    objc_msgSend(WeakRetained, "handleConnectionInvalidated");

}

void sub_10002E22C(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_10002E23C(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v30;

  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 176), a2);
  if (v6)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 96) = 1;
    v9 = livefs_std_log(v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176);
      v29 = 138412290;
      v30 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Got root fh %@", (uint8_t *)&v29, 0xCu);
    }
  }
  else
  {
    v12 = livefs_std_log(v8);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (v7)
    {
      if (v14)
        sub_10003D0AC();

      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 96) = 0;
      v22 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v23 = v7;
      v10 = *(NSObject **)(v22 + 40);
      *(_QWORD *)(v22 + 40) = v23;
    }
    else
    {
      if (v14)
        sub_10003D07C(v13, v15, v16, v17, v18, v19, v20, v21);

      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 96) = 0;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "invalidate");
      v24 = *(_QWORD *)(a1 + 32);
      v25 = *(void **)(v24 + 24);
      *(_QWORD *)(v24 + 24) = 0;

      v26 = fs_errorForPOSIXError(52);
      v27 = objc_claimAutoreleasedReturnValue(v26);
      v28 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v10 = *(NSObject **)(v28 + 40);
      *(_QWORD *)(v28 + 40) = v27;
    }
  }

}

void sub_10002E3D4(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_10002E3E4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;

  v5 = a3;
  v6 = v5;
  if (!(_DWORD)a2 && v5 && (v7 = objc_retainAutorelease(v5), (v5 = objc_msgSend(v7, "bytes")) != 0))
  {
    v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", objc_msgSend(objc_retainAutorelease(v7), "bytes")));
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "stringByReplacingOccurrencesOfString:withString:", CFSTR("/dev/"), &stru_100056698));
    v12 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v13 = fskit_std_log(v5);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10003D10C(a2, v14, v15, v16, v17, v18, v19, v20);

    v21 = fs_errorForPOSIXError(a2);
    v11 = objc_claimAutoreleasedReturnValue(v21);
    v12 = *(_QWORD *)(a1 + 40);
  }
  v22 = *(_QWORD *)(v12 + 8);
  v23 = *(void **)(v22 + 40);
  *(_QWORD *)(v22 + 40) = v11;

}

void sub_10002E4E4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v5 = a3;
  v6 = v5;
  if (!(_DWORD)a2 && v5 && (v7 = objc_retainAutorelease(v5), (v5 = objc_msgSend(v7, "bytes")) != 0))
  {
    v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", objc_msgSend(objc_retainAutorelease(v7), "bytes")));
    v9 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v10 = fskit_std_log(v5);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_10003D170(a2, v11, v12, v13, v14, v15, v16, v17);

    v18 = fs_errorForPOSIXError(a2);
    v8 = objc_claimAutoreleasedReturnValue(v18);
    v9 = *(_QWORD *)(a1 + 40);
  }
  v19 = *(_QWORD *)(v9 + 8);
  v20 = *(void **)(v19 + 40);
  *(_QWORD *)(v19 + 40) = v8;

}

id sub_10002EA30(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "doConnect");
}

void sub_10002EB2C(uint64_t a1)
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
  id v11;
  uint64_t v12;
  void *v13;
  id v14;

  v2 = livefs_std_log(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    sub_10003D27C(v3, v4, v5, v6, v7, v8, v9, v10);

  v11 = objc_msgSend(*(id *)(a1 + 32), "unmount:", 1);
  objc_msgSend(*(id *)(a1 + 32), "removeMountTask");
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 24);
  *(_QWORD *)(v12 + 24) = 0;
  v14 = v13;

  objc_msgSend(v14, "invalidate");
}

id sub_10002F7B8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setObject:forKey:", *(_QWORD *)(a1 + 32), LiveFSMounterDisplayNameKey);
}

void sub_10002FAAC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000303BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000303F8(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;

  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v6 = fskit_std_log(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    sub_10003DB00();

}

void sub_100030470(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_1000309C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000309DC(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1[4] + 208), "objectForKey:", a1[5]));
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void sub_100030AEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100030B04(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  unsigned int v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1[4] + 208), "objectEnumerator"));
  do
  {
    v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nextObject"));
    v3 = *(_QWORD *)(a1[6] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    if (!v2)
      break;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "mntOn"));
    v6 = objc_msgSend(v5, "isEqualToString:", a1[5]);

  }
  while (!v6);

}

void sub_100030CA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100030CB8(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  id i;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1[4] + 208), "objectEnumerator"));
  for (i = v2; ; v2 = i)
  {
    v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "nextObject"));
    v4 = *(_QWORD *)(a1[7] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    if (!v3)
      break;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "volumeName"));
    if (objc_msgSend(v6, "isEqualToString:", a1[5]))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "providerName"));
      v8 = objc_msgSend(v7, "isEqualToString:", a1[6]);

      if ((v8 & 1) != 0)
        break;
    }
    else
    {

    }
  }

}

void sub_100031020(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100031050(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t v19;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 208);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100031160;
  v16[3] = &unk_100055DC0;
  v17 = v2;
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 72);
  v18 = v4;
  v19 = v5;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v16);
  v6 = *(void **)(a1 + 40);
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 208);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100031214;
  v10[3] = &unk_100055DE8;
  v14 = *(_QWORD *)(a1 + 72);
  v11 = v6;
  v12 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 64);
  v9 = *(_QWORD *)(a1 + 80);
  v13 = v8;
  v15 = v9;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v10);

}

void sub_100031160(_QWORD *a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  id v10;
  id v11;

  v11 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "providerName"));
  if (!objc_msgSend(v6, "isEqualToString:", a1[4]))
    goto LABEL_4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "volumeName"));
  v8 = objc_msgSend(v7, "isEqualToString:", a1[5]);

  if (v8)
  {
    *a4 = 1;
    v9 = *(_QWORD *)(a1[6] + 8);
    v10 = v11;
    v6 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v10;
LABEL_4:

  }
}

void sub_100031214(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  void *v4;
  id v8;
  void *v9;
  id v10;
  BOOL v11;
  void *v12;
  unsigned int v13;
  void *v14;
  unsigned int v15;
  id v16;

  v16 = a2;
  v8 = a3;
  v9 = v8;
  v10 = *(id *)(*(_QWORD *)(a1[7] + 8) + 40);
  if (v10)
    v11 = v10 == v8;
  else
    v11 = 0;
  if (!v11 && (unint64_t)objc_msgSend(v8, "currentState") <= 1)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "providerName"));
    v13 = objc_msgSend(v12, "isEqualToString:", a1[4]);
    if (v13)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "storageName"));
      if (objc_msgSend(v4, "isEqualToString:", a1[5]))
      {

        goto LABEL_13;
      }
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mntOn"));
    v15 = objc_msgSend(v14, "isEqualToString:", a1[6]);

    if (v13)
    {

      if ((v15 & 1) == 0)
        goto LABEL_14;
      goto LABEL_13;
    }

    if (v15)
    {
LABEL_13:
      *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = 1;
      *a4 = 1;
    }
  }
LABEL_14:

}

id sub_1000313F0(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 208), "setObject:forKey:", a1[5], a1[6]);
}

id sub_100031498(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

void sub_100031554(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10003156C(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  CFTypeID (__cdecl **v3)(CFTypeRef);
  CFTypeID (__cdecl **v4)(CFTypeRef);
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[3];
  _QWORD v33[3];
  _QWORD v34[7];
  _QWORD v35[7];

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "count")));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "objectEnumerator"));
  v1 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "nextObject"));
  if (v1)
  {
    v2 = (void *)v1;
    v3 = &CFGetTypeID_ptr;
    v4 = &CFGetTypeID_ptr;
    do
    {
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "volumeName"));
      if (v5)
      {
        v6 = (void *)v5;
        if (objc_msgSend(v2, "currentState") == (id)1)
        {

LABEL_7:
          v34[0] = LiveFSMounterMountedOnKey;
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mntOn"));
          v35[0] = v8;
          v34[1] = LiveFSMounterVolumeNameKey;
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "volumeName"));
          v35[1] = v9;
          v34[2] = LiveFSMounterVolumeProviderNameKey;
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "providerName"));
          v35[2] = v10;
          v34[3] = LiveFSMounterDisplayNameKey;
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "displayName"));
          v35[3] = v11;
          v34[4] = LiveFSMounterMountIDKey;
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3[85], "numberWithUnsignedInt:", objc_msgSend(v2, "midx")));
          v35[4] = v12;
          v34[5] = LiveFSMounterDomainStorageKey;
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "volumeName"));
          v35[5] = v13;
          v34[6] = LiveFSMounterMountStateKey;
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stateAsString"));
          v35[6] = v14;
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4[74], "dictionaryWithObjects:forKeys:count:", v35, v34, 7));

          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "domainError"));
          if (v16)
          {
            v18 = (void *)objc_opt_new(NSMutableDictionary, v17);
            objc_msgSend(v18, "addEntriesFromDictionary:", v15);
            v32[0] = CFSTR("errorDomain");
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "domainError"));
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "domain"));
            v33[0] = v19;
            v32[1] = CFSTR("errorCode");
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "domainError"));
            v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v20, "code")));
            v33[1] = v21;
            v32[2] = CFSTR("errorDescription");
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "domainError"));
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "description"));
            v33[2] = v23;
            v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v33, v32, 3));
            objc_msgSend(v18, "setValue:forKey:", v24, LiveFSMounterDomainErrorKey);

            v15 = v18;
            v4 = &CFGetTypeID_ptr;
          }
          else
          {
            v4 = &CFGetTypeID_ptr;
          }
          objc_msgSend(v29, "addObject:", v15);

          v3 = &CFGetTypeID_ptr;
          goto LABEL_11;
        }
        v7 = *(unsigned __int8 *)(a1 + 48);

        if (v7)
          goto LABEL_7;
      }
LABEL_11:
      v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "nextObject"));

      v2 = (void *)v25;
    }
    while (v25);
  }
  v26 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v27 = *(void **)(v26 + 40);
  *(_QWORD *)(v26 + 40) = v29;

}

void sub_10003199C(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;
  uint8_t buf[4];
  int v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "allKeys"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100031B00;
  v7[3] = &unk_100055E60;
  v7[4] = &v8;
  v3 = objc_msgSend(v2, "enumerateObjectsUsingBlock:", v7);
  atomic_store(*((_DWORD *)v9 + 6) + 1, (unsigned int *)(*(_QWORD *)(a1 + 32) + 216));
  v4 = livefs_std_log(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *((_DWORD *)v9 + 6) + 1;
    *(_DWORD *)buf = 67109120;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Index reset to %u", buf, 8u);
  }

  _Block_object_dispose(&v8, 8);
}

void sub_100031ADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100031B00(uint64_t a1, void *a2)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(a2, "unsignedIntValue");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (result > *(_DWORD *)(v4 + 24))
    *(_DWORD *)(v4 + 24) = (_DWORD)result;
  return result;
}

void sub_100031B7C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x20u);
}

void sub_100031B90(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

void sub_100032108(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100032124(uint64_t a1, uint64_t a2)
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

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FSTaskDescription taskDescriptionWithID:state:purpose:error:bundleID:extensionID:resource:](FSTaskDescription, "taskDescriptionWithID:state:purpose:error:bundleID:extensionID:resource:", a2, 3, &stru_100056698, *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56), 0));
  v3 = fskit_std_log(v2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_10003DC14((uint64_t)v2, v4, v5, v6, v7, v8, v9, v10);

  +[fskitdExtensionClient postTaskStatusUpdate:](fskitdExtensionClient, "postTaskStatusUpdate:", v2);
}

void sub_10003275C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000327E4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000327F4(uint64_t a1)
{

}

void sub_1000327FC(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "weDied");
    WeakRetained = v2;
  }

}

void sub_10003282C(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(a1[4] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v7;
  v17 = v7;

  v12 = *(_QWORD *)(a1[5] + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v8;
  v14 = v8;

  v15 = *(_QWORD *)(a1[6] + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v9;

}

void sub_100032B94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  void *v7;
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  objc_sync_exit(v7);
  _Unwind_Resume(a1);
}

void sub_100032BD8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;

  v5 = a2;
  v6 = a3;
  v7 = fskit_std_log();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412546;
    v15 = v5;
    v16 = 2112;
    v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Got ep %@ error %@", (uint8_t *)&v14, 0x16u);
  }

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;
  v11 = v5;

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v6;

}

void sub_100032EC0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100032ED4(id a1, NSString *a2, unint64_t a3, BOOL *a4)
{
  void *v4;
  NSString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;

  v4 = (void *)qword_10005C720;
  v5 = a2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resourceManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getResource:", v5));

  if (v7)
  {
    v9 = fskit_std_log(v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      sub_10003DE5C(v7);

    +[fskitdExtensionClient closeResource:andRevoke:](fskitdExtensionClient, "closeResource:andRevoke:", v7, 1);
  }

}

void sub_100032F78(id a1, NSError *a2)
{
  NSError *v2;
  NSError *v3;
  uint64_t v4;
  NSObject *v5;

  v2 = a2;
  v3 = v2;
  if (v2)
  {
    v4 = fskit_std_log(v2);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_10003DEE0((uint64_t)v3, v5);

  }
}

void sub_100033078(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000330F4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100033170(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000331EC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100033268(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000332E4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000337F4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000339D4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100033BE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

id sub_100033DCC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;

  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "volumeIDs"));
  v8 = objc_msgSend(v7, "containsObject:", *(_QWORD *)(a1 + 32));

  if ((_DWORD)v8)
  {
    v10 = fskit_std_log(v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      sub_10003E04C(v5, (uint64_t *)(a1 + 32), v11);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

  return v8;
}

void sub_100033FB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100033FC8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "volumeIDs"));
  v6 = objc_msgSend(v5, "containsObject:", *(_QWORD *)(a1 + 32));

  if ((_DWORD)v6)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    v8 = fskit_std_log(v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "instanceID"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleID"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resourceIDs"));
      v15 = 136316162;
      v16 = "-[fskitdExtensionManager isVolumeIDUsed:bundle:user:replyHandler:]_block_invoke";
      v17 = 2112;
      v18 = v10;
      v19 = 2112;
      v20 = v11;
      v21 = 2112;
      v22 = v12;
      v23 = 2112;
      v24 = v13;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s:volumeID(%@) is being used by instance (%@:%@:%@)", (uint8_t *)&v15, 0x34u);

    }
  }

  return v6;
}

id sub_100034284(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;

  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "resourceIDs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "getResourceID"));
  v9 = objc_msgSend(v7, "containsObject:", v8);

  if ((_DWORD)v9)
  {
    v11 = fskit_std_log(v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      sub_10003E2EC(v5, (id *)(a1 + 32), v12);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

  return v9;
}

void sub_10003467C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1000347AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1000347C4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "instanceID"));
  v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32));

  if ((_DWORD)v7)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);

  return v7;
}

void sub_1000348E8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10003494C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x20u);
}

void sub_100034958(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x34u);
}

uint64_t sub_100034964(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 706) >= 0xFFFFFFD8)
    return (uint64_t)*(&off_100055F78 + 5 * (v1 - 666) + 5);
  else
    return 0;
}

_DWORD *sub_100034998(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  char *v8;
  unsigned int v9;
  unsigned int v10;
  int v11;
  uint64_t v13;
  char *v14;
  _BYTE *v15;
  size_t v16;
  _DWORD *v17;
  int v18;

  if ((*result & 0x80000000) != 0)
    goto LABEL_26;
  v3 = result;
  v4 = result[1];
  if (v4 < 0x80)
    goto LABEL_26;
  if (v4 > 0x880)
    goto LABEL_26;
  v5 = result[11];
  if (v5 > 0x400)
    goto LABEL_26;
  v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 128 < v5 || v4 < v6 + 128)
    goto LABEL_26;
  v8 = (char *)result + v6;
  v9 = *((_DWORD *)v8 + 13);
  if (v9 > 0x400)
    goto LABEL_26;
  v10 = (v9 + 3) & 0xFFFFFFFC;
  v11 = v4 - v6;
  if (v11 - 128 < v9 || v11 != v10 + 128)
    goto LABEL_26;
  v13 = 1072;
  if (result[1] < 0x430uLL)
    v13 = result[1];
  result = memchr(result + 12, 0, v13 - 48);
  if (result
    && ((v14 = v8 - 1024, v15 = v8 + 56, (char *)v3 + v4 - v15 >= 1024) ? (v16 = 1024) : (v16 = (char *)v3 + v4 - v15),
        (result = memchr(v15, 0, v16)) != 0))
  {
    v17 = (_DWORD *)((char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL));
    if (!*v17 && v17[1] > 0x1Fu)
    {
      result = (_DWORD *)sub_100003F5C(v3[3], *((_QWORD *)v3 + 4), (uint64_t)(v3 + 12), (uint64_t)v15, *(_DWORD *)&v14[v10 + 1080], *(_DWORD *)&v14[v10 + 1084], (unsigned int *)&v14[v10 + 1088]);
      *(_DWORD *)(a2 + 32) = (_DWORD)result;
      return result;
    }
    v18 = -309;
  }
  else
  {
LABEL_26:
    v18 = -304;
  }
  *(_DWORD *)(a2 + 32) = v18;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100034B1C(uint64_t result, uint64_t a2)
{
  int v3;

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 108)
  {
    v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 108) && *(_DWORD *)(result + 112) > 0x1Fu)
    {
      result = sub_100004588(*(unsigned int *)(result + 12), *(_QWORD *)(result + 32), *(unsigned int *)(result + 40), (unsigned int *)(result + 44));
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100034BBC(uint64_t result, uint64_t a2)
{
  int v3;

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 108)
  {
    v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 108) && *(_DWORD *)(result + 112) > 0x1Fu)
    {
      result = sub_1000049C4(*(unsigned int *)(result + 12), *(_QWORD *)(result + 32), *(unsigned int *)(result + 40), (unsigned int *)(result + 44));
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100034C5C(uint64_t result, uint64_t a2)
{
  int v3;

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 104)
  {
    v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 104) && *(_DWORD *)(result + 108) > 0x1Fu)
    {
      result = sub_100004EE0(*(unsigned int *)(result + 12), *(_QWORD *)(result + 32), (unsigned int *)(result + 40));
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_100034CF8(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  uint64_t v4;
  unsigned int v5;
  BOOL v6;
  unsigned int v7;
  int v9;
  uint64_t v10;
  _DWORD *v11;

  if ((*result & 0x80000000) != 0)
    goto LABEL_11;
  v3 = result;
  v4 = result[1];
  if (v4 < 0x70 || v4 > 0x94)
    goto LABEL_11;
  v5 = result[27];
  v6 = v5 <= 0x21 && (int)v4 - 112 >= v5;
  v7 = ((v5 + 3) & 0xFFFFFFFC) + 112;
  if (!v6 || (_DWORD)v4 != v7)
    goto LABEL_11;
  v10 = 145;
  if (result[1] < 0x91uLL)
    v10 = result[1];
  result = memchr(result + 28, 0, v10 - 112);
  if (result)
  {
    v11 = (_DWORD *)((char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL));
    if (!*v11 && v11[1] > 0x1Fu)
    {
      result = (_DWORD *)sub_100005324(v3[3], *((_QWORD *)v3 + 4), v3 + 10, (uint64_t)(v3 + 28));
      *(_DWORD *)(a2 + 32) = (_DWORD)result;
      return result;
    }
    v9 = -309;
  }
  else
  {
LABEL_11:
    v9 = -304;
  }
  *(_DWORD *)(a2 + 32) = v9;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_100034DF8(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  BOOL v7;
  _DWORD *v8;
  int v9;

  if ((*result & 0x80000000) == 0
    && (v3 = result, v4 = result[1], v4 >= 0x174)
    && v4 <= 0x198
    && (v5 = result[27], v5 <= 0x21)
    && ((v6 = (v5 + 3) & 0xFFFFFFFC, (int)v4 - 372 >= v5) ? (v7 = (_DWORD)v4 == v6 + 372) : (v7 = 0),
        v7 && (result = memchr(result + 28, 0, 0x21uLL)) != 0))
  {
    v8 = (_DWORD *)((char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL));
    if (!*v8 && v8[1] > 0x1Fu)
    {
      result = (_DWORD *)sub_100005824(v3[3], *((_QWORD *)v3 + 4), v3 + 10, (const char *)v3 + 112, (const char *)v3 + v6 + 112, *(_DWORD *)((char *)v3 + v6 + 368));
      *(_DWORD *)(a2 + 32) = (_DWORD)result;
      return result;
    }
    v9 = -309;
  }
  else
  {
    v9 = -304;
  }
  *(_DWORD *)(a2 + 32) = v9;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100034F08(uint64_t result, uint64_t a2)
{
  int v3;
  NDR_record_t v4;

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 108)
  {
    v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(result + 108) || *(_DWORD *)(result + 112) <= 0x1Fu)
  {
    v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    v4 = NDR_record;
    goto LABEL_8;
  }
  result = sub_10000604C(*(unsigned int *)(result + 12), *(_QWORD *)(result + 32), result + 40, *(unsigned int *)(result + 104), (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  v4 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_8:
  *(NDR_record_t *)(a2 + 24) = v4;
  return result;
}

_DWORD *sub_100034FC8(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v8;
  _DWORD *v9;
  int v10;

  if ((*result & 0x80000000) != 0)
    goto LABEL_16;
  v3 = result;
  v4 = result[1];
  if (v4 < 0x128)
    goto LABEL_16;
  if (v4 > 0x528)
    goto LABEL_16;
  v5 = result[11];
  if (v5 > 0x400)
    goto LABEL_16;
  v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 296 < v5 || (_DWORD)v4 != v6 + 296)
    goto LABEL_16;
  v8 = 1072;
  if (result[1] < 0x430uLL)
    v8 = result[1];
  result = memchr(result + 12, 0, v8 - 48);
  if (result)
  {
    v9 = (_DWORD *)((char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL));
    if (!*v9 && v9[1] > 0x1Fu)
    {
      result = (_DWORD *)sub_10000661C(v3[3], *((_QWORD *)v3 + 4), (uint64_t)(v3 + 12), (_DWORD *)((char *)v3 + v6 + 48), (uint64_t)v3 + v6 + 112);
      *(_DWORD *)(a2 + 32) = (_DWORD)result;
      return result;
    }
    v10 = -309;
  }
  else
  {
LABEL_16:
    v10 = -304;
  }
  *(_DWORD *)(a2 + 32) = v10;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_1000350E0(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v8;
  _DWORD *v9;
  int v10;

  if ((*result & 0x80000000) != 0)
    goto LABEL_16;
  v3 = result;
  v4 = result[1];
  if (v4 < 0x16C)
    goto LABEL_16;
  if (v4 > 0x56C)
    goto LABEL_16;
  v5 = result[11];
  if (v5 > 0x400)
    goto LABEL_16;
  v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 364 < v5 || (_DWORD)v4 != v6 + 364)
    goto LABEL_16;
  v8 = 1072;
  if (result[1] < 0x430uLL)
    v8 = result[1];
  result = memchr(result + 12, 0, v8 - 48);
  if (result)
  {
    v9 = (_DWORD *)((char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL));
    if (!*v9 && v9[1] > 0x1Fu)
    {
      result = (_DWORD *)sub_100006BB4(v3[3], *((_QWORD *)v3 + 4), (uint64_t)(v3 + 12), (_DWORD *)((char *)v3 + v6 + 48), (_DWORD *)((char *)v3 + v6 + 112), *(unsigned int *)((char *)v3 + v6 + 176), (uint64_t)v3 + v6 + 180);
      *(_DWORD *)(a2 + 32) = (_DWORD)result;
      return result;
    }
    v10 = -309;
  }
  else
  {
LABEL_16:
    v10 = -304;
  }
  *(_DWORD *)(a2 + 32) = v10;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_100035200(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v8;
  _DWORD *v9;
  int v10;

  if ((*result & 0x80000000) != 0)
    goto LABEL_16;
  v3 = result;
  v4 = result[1];
  if (v4 < 0x128)
    goto LABEL_16;
  if (v4 > 0x528)
    goto LABEL_16;
  v5 = result[11];
  if (v5 > 0x400)
    goto LABEL_16;
  v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 296 < v5 || (_DWORD)v4 != v6 + 296)
    goto LABEL_16;
  v8 = 1072;
  if (result[1] < 0x430uLL)
    v8 = result[1];
  result = memchr(result + 12, 0, v8 - 48);
  if (result)
  {
    v9 = (_DWORD *)((char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL));
    if (!*v9 && v9[1] > 0x1Fu)
    {
      result = (_DWORD *)sub_10000605C(v3[3], *((_QWORD *)v3 + 4), (uint64_t)(v3 + 12), (_DWORD *)((char *)v3 + v6 + 48), (uint64_t)v3 + v6 + 112);
      *(_DWORD *)(a2 + 32) = (_DWORD)result;
      return result;
    }
    v10 = -309;
  }
  else
  {
LABEL_16:
    v10 = -304;
  }
  *(_DWORD *)(a2 + 32) = v10;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_100035318(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v8;
  _DWORD *v9;
  int v10;

  if ((*result & 0x80000000) != 0)
    goto LABEL_16;
  v3 = result;
  v4 = result[1];
  if (v4 < 0x74)
    goto LABEL_16;
  if (v4 > 0x474)
    goto LABEL_16;
  v5 = result[11];
  if (v5 > 0x400)
    goto LABEL_16;
  v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 116 < v5 || (_DWORD)v4 != v6 + 116)
    goto LABEL_16;
  v8 = 1072;
  if (result[1] < 0x430uLL)
    v8 = result[1];
  result = memchr(result + 12, 0, v8 - 48);
  if (result)
  {
    v9 = (_DWORD *)((char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL));
    if (!*v9 && v9[1] > 0x1Fu)
    {
      result = (_DWORD *)sub_1000071D0(v3[3], *((_QWORD *)v3 + 4), (uint64_t)(v3 + 12), (_DWORD *)((char *)v3 + v6 + 48), *(unsigned int *)((char *)v3 + v6 + 112));
      *(_DWORD *)(a2 + 32) = (_DWORD)result;
      return result;
    }
    v10 = -309;
  }
  else
  {
LABEL_16:
    v10 = -304;
  }
  *(_DWORD *)(a2 + 32) = v10;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_100035430(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  BOOL v7;
  _DWORD *v8;
  int v9;

  if ((*result & 0x80000000) == 0
    && (v3 = result, v4 = result[1], v4 >= 0x74)
    && v4 <= 0x98
    && (v5 = result[11], v5 <= 0x21)
    && ((v6 = (v5 + 3) & 0xFFFFFFFC, (int)v4 - 116 >= v5) ? (v7 = (_DWORD)v4 == v6 + 116) : (v7 = 0),
        v7 && (result = memchr(result + 12, 0, 0x21uLL)) != 0))
  {
    v8 = (_DWORD *)((char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL));
    if (!*v8 && v8[1] > 0x1Fu)
    {
      result = (_DWORD *)sub_1000071D0(v3[3], *((_QWORD *)v3 + 4), (uint64_t)(v3 + 12), (_DWORD *)((char *)v3 + v6 + 48), *(unsigned int *)((char *)v3 + v6 + 112));
      *(_DWORD *)(a2 + 32) = (_DWORD)result;
      return result;
    }
    v9 = -309;
  }
  else
  {
    v9 = -304;
  }
  *(_DWORD *)(a2 + 32) = v9;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_10003553C(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  BOOL v7;
  _DWORD *v8;
  int v9;

  if ((*result & 0x80000000) == 0
    && (v3 = result, v4 = result[1], v4 >= 0x74)
    && v4 <= 0xB8
    && (v5 = result[11], v5 <= 0x41)
    && ((v6 = (v5 + 3) & 0xFFFFFFFC, (int)v4 - 116 >= v5) ? (v7 = (_DWORD)v4 == v6 + 116) : (v7 = 0),
        v7 && (result = memchr(result + 12, 0, 0x41uLL)) != 0))
  {
    v8 = (_DWORD *)((char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL));
    if (!*v8 && v8[1] > 0x1Fu)
    {
      result = (_DWORD *)sub_1000071D0(v3[3], *((_QWORD *)v3 + 4), (uint64_t)(v3 + 12), (_DWORD *)((char *)v3 + v6 + 48), *(unsigned int *)((char *)v3 + v6 + 112));
      *(_DWORD *)(a2 + 32) = (_DWORD)result;
      return result;
    }
    v9 = -309;
  }
  else
  {
    v9 = -304;
  }
  *(_DWORD *)(a2 + 32) = v9;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100035648(uint64_t result, uint64_t a2)
{
  int v3;

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 108)
  {
    v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 108) && *(_DWORD *)(result + 112) > 0x1Fu)
    {
      result = sub_100007A04(*(unsigned int *)(result + 12), *(_QWORD *)(result + 32), (unsigned int *)(result + 40), *(unsigned int *)(result + 104));
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_1000356E8(uint64_t result, uint64_t a2)
{
  int v3;

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 108)
  {
    v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 108) && *(_DWORD *)(result + 112) > 0x1Fu)
    {
      result = sub_100007DE4(*(unsigned int *)(result + 12), *(_QWORD *)(result + 32), (unsigned int *)(result + 40), *(unsigned int *)(result + 104));
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_100035788(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  char *v8;
  unsigned int v9;
  unsigned int v10;
  int v11;
  uint64_t v13;
  char *v14;
  _BYTE *v15;
  size_t v16;
  _DWORD *v17;
  int v18;

  if ((*result & 0x80000000) != 0)
    goto LABEL_26;
  v3 = result;
  v4 = result[1];
  if (v4 < 0x13C)
    goto LABEL_26;
  if (v4 > 0x93C)
    goto LABEL_26;
  v5 = result[11];
  if (v5 > 0x400)
    goto LABEL_26;
  v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 316 < v5 || v4 < v6 + 316)
    goto LABEL_26;
  v8 = (char *)result + v6;
  v9 = *((_DWORD *)v8 + 45);
  if (v9 > 0x400)
    goto LABEL_26;
  v10 = (v9 + 3) & 0xFFFFFFFC;
  v11 = v4 - v6;
  if (v11 - 316 < v9 || v11 != v10 + 316)
    goto LABEL_26;
  v13 = 1072;
  if (result[1] < 0x430uLL)
    v13 = result[1];
  result = memchr(result + 12, 0, v13 - 48);
  if (result
    && ((v14 = v8 - 1024, v15 = v8 + 184, (char *)v3 + v4 - v15 >= 1024)
      ? (v16 = 1024)
      : (v16 = (char *)v3 + v4 - v15),
        (result = memchr(v15, 0, v16)) != 0))
  {
    v17 = (_DWORD *)((char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL));
    if (!*v17 && v17[1] > 0x1Fu)
    {
      result = (_DWORD *)sub_1000081C4(v3[3], *((_QWORD *)v3 + 4), (uint64_t)(v3 + 12), (unsigned int *)v14 + 268, (unsigned int *)v14 + 284, (uint64_t)v15, (unsigned int *)&v14[v10 + 1208], (unsigned int *)&v14[v10 + 1272], *(_DWORD *)&v14[v10 + 1336]);
      *(_DWORD *)(a2 + 32) = (_DWORD)result;
      return result;
    }
    v18 = -309;
  }
  else
  {
LABEL_26:
    v18 = -304;
  }
  *(_DWORD *)(a2 + 32) = v18;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_10003591C(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  uint64_t v4;
  unsigned int v5;
  BOOL v6;
  unsigned int v7;
  BOOL v8;
  int v9;
  _DWORD *v10;

  if ((*result & 0x80000000) == 0
    && (v3 = result, v4 = result[1], v4 >= 0xB0)
    && v4 <= 0x4B0
    && ((v5 = result[43], v5 <= 0x400) ? (v6 = (int)v4 - 176 >= v5) : (v6 = 0),
        (v7 = ((v5 + 3) & 0xFFFFFFFC) + 176, v6) ? (v8 = (_DWORD)v4 == v7) : (v8 = 0),
        v8 && (result = memchr(result + 44, 0, v4 - 176)) != 0))
  {
    v10 = (_DWORD *)((char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL));
    if (!*v10 && v10[1] > 0x1Fu)
    {
      result = (_DWORD *)sub_100008878(v3[3], *((_QWORD *)v3 + 4), v3 + 10, v3 + 26, (uint64_t)(v3 + 44));
      *(_DWORD *)(a2 + 32) = (_DWORD)result;
      return result;
    }
    v9 = -309;
  }
  else
  {
    v9 = -304;
  }
  *(_DWORD *)(a2 + 32) = v9;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100035A14(uint64_t result, uint64_t a2)
{
  int v3;

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 128)
  {
    v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 128) && *(_DWORD *)(result + 132) > 0x1Fu)
    {
      result = sub_100008EF8(*(unsigned int *)(result + 12), *(_QWORD *)(result + 32), *(_DWORD *)(result + 40), *(_QWORD *)(result + 44), (unsigned int *)(result + 52), *(_DWORD *)(result + 116), *(_QWORD *)(result + 120));
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_100035AC0(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  char *v8;
  unsigned int v9;
  unsigned int v10;
  int v11;
  uint64_t v13;
  char *v14;
  _BYTE *v15;
  size_t v16;
  _DWORD *v17;
  int v18;

  if ((*result & 0x80000000) != 0)
    goto LABEL_26;
  v3 = result;
  v4 = result[1];
  if (v4 < 0x130)
    goto LABEL_26;
  if (v4 > 0x930)
    goto LABEL_26;
  v5 = result[11];
  if (v5 > 0x400)
    goto LABEL_26;
  v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 304 < v5 || v4 < v6 + 304)
    goto LABEL_26;
  v8 = (char *)result + v6;
  v9 = *((_DWORD *)v8 + 13);
  if (v9 > 0x400)
    goto LABEL_26;
  v10 = (v9 + 3) & 0xFFFFFFFC;
  v11 = v4 - v6;
  if (v11 - 304 < v9 || v11 != v10 + 304)
    goto LABEL_26;
  v13 = 1072;
  if (result[1] < 0x430uLL)
    v13 = result[1];
  result = memchr(result + 12, 0, v13 - 48);
  if (result
    && ((v14 = v8 - 1024, v15 = v8 + 56, (char *)v3 + v4 - v15 >= 1024) ? (v16 = 1024) : (v16 = (char *)v3 + v4 - v15),
        (result = memchr(v15, 0, v16)) != 0))
  {
    v17 = (_DWORD *)((char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL));
    if (!*v17 && v17[1] > 0x1Fu)
    {
      result = (_DWORD *)sub_100009A2C(v3[3], *((_QWORD *)v3 + 4), (uint64_t)(v3 + 12), (uint64_t)v15, (unsigned int *)&v14[v10 + 1080], (uint64_t)&v14[v10 + 1144]);
      *(_DWORD *)(a2 + 32) = (_DWORD)result;
      return result;
    }
    v18 = -309;
  }
  else
  {
LABEL_26:
    v18 = -304;
  }
  *(_DWORD *)(a2 + 32) = v18;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_100035C40(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v8;
  _DWORD *v9;
  int v10;

  if ((*result & 0x80000000) != 0)
    goto LABEL_16;
  v3 = result;
  v4 = result[1];
  if (v4 < 0xB0)
    goto LABEL_16;
  if (v4 > 0x4B0)
    goto LABEL_16;
  v5 = result[27];
  if (v5 > 0x400)
    goto LABEL_16;
  v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 176 < v5 || (_DWORD)v4 != v6 + 176)
    goto LABEL_16;
  v8 = 1136;
  if (result[1] < 0x470uLL)
    v8 = result[1];
  result = memchr(result + 28, 0, v8 - 112);
  if (result)
  {
    v9 = (_DWORD *)((char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL));
    if (!*v9 && v9[1] > 0x1Fu)
    {
      result = (_DWORD *)sub_100009464(v3[3], *((_QWORD *)v3 + 4), v3 + 10, (uint64_t)(v3 + 28), (_DWORD *)((char *)v3 + v6 + 112));
      *(_DWORD *)(a2 + 32) = (_DWORD)result;
      return result;
    }
    v10 = -309;
  }
  else
  {
LABEL_16:
    v10 = -304;
  }
  *(_DWORD *)(a2 + 32) = v10;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100035D58(uint64_t result, uint64_t a2)
{
  int v3;

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 104)
  {
    v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 104) && *(_DWORD *)(result + 108) > 0x1Fu)
    {
      result = sub_10000A020(*(unsigned int *)(result + 12), *(_QWORD *)(result + 32), (unsigned int *)(result + 40));
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_100035DF4(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v8;
  _DWORD *v9;
  int v10;

  if ((*result & 0x80000000) != 0)
    goto LABEL_16;
  v3 = result;
  v4 = result[1];
  if (v4 < 0xB4)
    goto LABEL_16;
  if (v4 > 0x4B4)
    goto LABEL_16;
  v5 = result[43];
  if (v5 > 0x400)
    goto LABEL_16;
  v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 180 < v5 || (_DWORD)v4 != v6 + 180)
    goto LABEL_16;
  v8 = 1200;
  if (result[1] < 0x4B0uLL)
    v8 = result[1];
  result = memchr(result + 44, 0, v8 - 176);
  if (result)
  {
    v9 = (_DWORD *)((char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL));
    if (!*v9 && v9[1] > 0x1Fu)
    {
      result = (_DWORD *)sub_10000A4BC(v3[3], *((_QWORD *)v3 + 4), v3 + 10, v3 + 26, (uint64_t)(v3 + 44), *(unsigned int *)((char *)v3 + v6 + 176));
      *(_DWORD *)(a2 + 32) = (_DWORD)result;
      return result;
    }
    v10 = -309;
  }
  else
  {
LABEL_16:
    v10 = -304;
  }
  *(_DWORD *)(a2 + 32) = v10;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100035F10(uint64_t result, uint64_t a2)
{
  int v3;

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 288)
  {
    v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 288) && *(_DWORD *)(result + 292) > 0x1Fu)
    {
      result = sub_10000AB38(*(unsigned int *)(result + 12), *(_QWORD *)(result + 32), (unsigned int *)(result + 40), result + 104);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100035FB0(uint64_t result, uint64_t a2)
{
  int v3;

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 104)
  {
    v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 104) && *(_DWORD *)(result + 108) > 0x1Fu)
    {
      result = sub_10000B010(*(unsigned int *)(result + 12), *(_QWORD *)(result + 32), (unsigned int *)(result + 40));
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_10003604C(uint64_t result, uint64_t a2)
{
  int v3;

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 132)
  {
    v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 132) && *(_DWORD *)(result + 136) > 0x1Fu)
    {
      result = sub_10000B4E8(*(unsigned int *)(result + 12), *(_QWORD *)(result + 32), *(_QWORD *)(result + 40), (unsigned int *)(result + 48), *(_DWORD *)(result + 112), *(_QWORD *)(result + 116), *(_QWORD *)(result + 124));
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_1000360F4(uint64_t result, uint64_t a2)
{
  unsigned int v3;
  int v4;

  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 136)
  {
    if (*(_BYTE *)(result + 39) == 1 && (v3 = *(_DWORD *)(result + 40), v3 == *(_DWORD *)(result + 132)))
    {
      if (!*(_DWORD *)(result + 136) && *(_DWORD *)(result + 140) > 0x1Fu)
      {
        result = sub_10000BA20(*(unsigned int *)(result + 12), *(_QWORD *)(result + 52), (unsigned int *)(result + 60), *(_QWORD *)(result + 124), *(const void **)(result + 28), v3);
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
      v4 = -309;
    }
    else
    {
      v4 = -300;
    }
  }
  else
  {
    v4 = -304;
  }
  *(_DWORD *)(a2 + 32) = v4;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_1000361C8(uint64_t result, uint64_t a2)
{
  int v3;
  NDR_record_t v4;

  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 128)
  {
    v3 = -304;
    goto LABEL_9;
  }
  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112)
  {
    v3 = -300;
    goto LABEL_9;
  }
  if (*(_DWORD *)(result + 128) || *(_DWORD *)(result + 132) <= 0x1Fu)
  {
    v3 = -309;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v3;
    v4 = NDR_record;
    goto LABEL_10;
  }
  result = sub_10000BF3C(*(unsigned int *)(result + 12), (unsigned int *)(result + 48), *(_QWORD *)(result + 112), *(_QWORD *)(result + 120), *(unsigned int *)(result + 28), a2 + 36, (int *)(a2 + 40));
  *(_DWORD *)(a2 + 32) = result;
  v4 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 44;
    return result;
  }
LABEL_10:
  *(NDR_record_t *)(a2 + 24) = v4;
  return result;
}

uint64_t sub_1000362B0(uint64_t result, uint64_t a2)
{
  int v3;

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 116)
  {
    v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 116) && *(_DWORD *)(result + 120) > 0x1Fu)
    {
      result = sub_10000C130(*(unsigned int *)(result + 12), *(_QWORD *)(result + 32), (unsigned int *)(result + 40), *(_DWORD *)(result + 104), *(_QWORD *)(result + 108));
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100036354(uint64_t result, uint64_t a2)
{
  int v3;
  NDR_record_t v4;

  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 128)
  {
    v3 = -304;
    goto LABEL_9;
  }
  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112)
  {
    v3 = -300;
    goto LABEL_9;
  }
  if (*(_DWORD *)(result + 128) || *(_DWORD *)(result + 132) <= 0x1Fu)
  {
    v3 = -309;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v3;
    v4 = NDR_record;
    goto LABEL_10;
  }
  result = sub_10000C608(*(unsigned int *)(result + 12), (unsigned int *)(result + 48), *(_QWORD *)(result + 112), *(_QWORD *)(result + 120), *(unsigned int *)(result + 28), a2 + 36, (int *)(a2 + 40));
  *(_DWORD *)(a2 + 32) = result;
  v4 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 44;
    return result;
  }
LABEL_10:
  *(NDR_record_t *)(a2 + 24) = v4;
  return result;
}

uint64_t sub_10003643C(uint64_t result, uint64_t a2)
{
  int v3;

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 104)
  {
    v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 104) && *(_DWORD *)(result + 108) > 0x1Fu)
    {
      result = sub_10000C7FC(*(unsigned int *)(result + 12), *(_QWORD *)(result + 32), (unsigned int *)(result + 40));
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_1000364D8(uint64_t result, uint64_t a2)
{
  int v3;

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 104)
  {
    v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 104) && *(_DWORD *)(result + 108) > 0x1Fu)
    {
      result = sub_10000CC4C(*(unsigned int *)(result + 12), *(_QWORD *)(result + 32), (unsigned int *)(result + 40));
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100036574(uint64_t result, uint64_t a2)
{
  int v3;

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 108)
  {
    v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 108) && *(_DWORD *)(result + 112) > 0x1Fu)
    {
      result = sub_10000D038(*(unsigned int *)(result + 12), *(_QWORD *)(result + 32), (unsigned int *)(result + 40), *(unsigned int *)(result + 104));
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_100036614(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v8;
  _DWORD *v9;
  int v10;

  if ((*result & 0x80000000) != 0)
    goto LABEL_16;
  v3 = result;
  v4 = result[1];
  if (v4 < 0x7C)
    goto LABEL_16;
  if (v4 > 0xFC)
    goto LABEL_16;
  v5 = result[27];
  if (v5 > 0x80)
    goto LABEL_16;
  v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 124 < v5 || (_DWORD)v4 != v6 + 124)
    goto LABEL_16;
  v8 = 240;
  if (result[1] < 0xF0uLL)
    v8 = result[1];
  result = memchr(result + 28, 0, v8 - 112);
  if (result)
  {
    v9 = (_DWORD *)((char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL));
    if (!*v9 && v9[1] > 0x1Fu)
    {
      result = (_DWORD *)sub_10000D490(v3[3], *((_QWORD *)v3 + 4), v3 + 10, (uint64_t)(v3 + 28), *(_QWORD *)((char *)v3 + v6 + 112), *(_DWORD *)((char *)v3 + v6 + 120));
      *(_DWORD *)(a2 + 32) = (_DWORD)result;
      return result;
    }
    v10 = -309;
  }
  else
  {
LABEL_16:
    v10 = -304;
  }
  *(_DWORD *)(a2 + 32) = v10;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100036730(uint64_t result, uint64_t a2)
{
  int v3;

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 112)
  {
    v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 112) && *(_DWORD *)(result + 116) > 0x1Fu)
    {
      result = sub_10000DF00(*(unsigned int *)(result + 12), *(_QWORD *)(result + 32), (unsigned int *)(result + 40), *(_QWORD *)(result + 104));
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_1000367D0(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  uint64_t v4;
  unsigned int v5;
  BOOL v6;
  unsigned int v7;
  BOOL v8;
  int v9;
  _DWORD *v10;

  if ((*result & 0x80000000) == 0
    && (v3 = result, v4 = result[1], v4 >= 0x70)
    && v4 <= 0xF0
    && ((v5 = result[27], v5 <= 0x80) ? (v6 = (int)v4 - 112 >= v5) : (v6 = 0),
        (v7 = ((v5 + 3) & 0xFFFFFFFC) + 112, v6) ? (v8 = (_DWORD)v4 == v7) : (v8 = 0),
        v8 && (result = memchr(result + 28, 0, v4 - 112)) != 0))
  {
    v10 = (_DWORD *)((char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL));
    if (!*v10 && v10[1] > 0x1Fu)
    {
      result = (_DWORD *)sub_10000DECC(v3[3], *((_QWORD *)v3 + 4), v3 + 10, (uint64_t)(v3 + 28));
      *(_DWORD *)(a2 + 32) = (_DWORD)result;
      return result;
    }
    v9 = -309;
  }
  else
  {
    v9 = -304;
  }
  *(_DWORD *)(a2 + 32) = v9;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_1000368C4(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  BOOL v7;
  _DWORD *v8;
  int v9;

  if ((*result & 0x80000000) == 0
    && (v3 = result, v4 = result[1], v4 >= 0x480)
    && v4 <= 0x500
    && (v5 = result[27], v5 <= 0x80)
    && ((v6 = (v5 + 3) & 0xFFFFFFFC, (int)v4 - 1152 >= v5) ? (v7 = (_DWORD)v4 == v6 + 1152) : (v7 = 0),
        v7 && (result = memchr(result + 28, 0, 0x80uLL)) != 0))
  {
    v8 = (_DWORD *)((char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL));
    if (!*v8 && v8[1] > 0x1Fu)
    {
      result = (_DWORD *)sub_10000D990(v3[3], *((_QWORD *)v3 + 4), v3 + 10, (uint64_t)(v3 + 28), (uint64_t)v3 + v6 + 112, *(_QWORD *)((char *)v3 + v6 + 1136), *(_DWORD *)((char *)v3 + v6 + 1144), *(unsigned int *)((char *)v3 + v6 + 1148));
      *(_DWORD *)(a2 + 32) = (_DWORD)result;
      return result;
    }
    v9 = -309;
  }
  else
  {
    v9 = -304;
  }
  *(_DWORD *)(a2 + 32) = v9;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_1000369E0(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  _DWORD *v8;
  unsigned int v9;
  uint64_t v10;
  _DWORD *v11;

  if ((*(_DWORD *)result & 0x80000000) == 0)
    goto LABEL_2;
  v4 = result;
  v3 = -304;
  if (*(_DWORD *)(result + 24) != 1)
    goto LABEL_3;
  v5 = *(unsigned int *)(result + 4);
  if (v5 < 0x90 || v5 > 0x110)
    goto LABEL_3;
  if (*(_BYTE *)(result + 39) != 1)
    goto LABEL_19;
  v6 = *(_DWORD *)(result + 128);
  if (v6 > 0x80)
  {
LABEL_2:
    v3 = -304;
    goto LABEL_3;
  }
  v3 = -304;
  if ((int)v5 - 144 < v6)
    goto LABEL_3;
  v7 = (v6 + 3) & 0xFFFFFFFC;
  if ((_DWORD)v5 != v7 + 144)
    goto LABEL_3;
  v8 = (_DWORD *)(result + v7);
  v9 = *(_DWORD *)(result + 40);
  if (v9 != v8[33])
  {
LABEL_19:
    v3 = -300;
    goto LABEL_3;
  }
  v10 = 260;
  if (*(unsigned int *)(result + 4) < 0x104uLL)
    v10 = *(unsigned int *)(result + 4);
  result = (uint64_t)memchr((void *)(result + 132), 0, v10 - 132);
  if (!result)
    goto LABEL_2;
  v11 = (_DWORD *)(((v5 + 3) & 0x1FFFFFFFCLL) + v4);
  if (!*v11 && v11[1] > 0x1Fu)
  {
    result = sub_10000DDC8(*(unsigned int *)(v4 + 12), *(_QWORD *)(v4 + 52), (unsigned int *)(v4 + 60), v4 + 132, *(_QWORD *)(v4 + 28), v9, v8[34], v8[35]);
    *(_DWORD *)(a2 + 32) = result;
    return result;
  }
  v3 = -309;
LABEL_3:
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100036B44(uint64_t result, uint64_t a2)
{
  int v3;

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 104)
  {
    v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 104) && *(_DWORD *)(result + 108) > 0x1Fu)
    {
      result = sub_10000E4AC(*(unsigned int *)(result + 12), *(_QWORD *)(result + 32), (unsigned int *)(result + 40));
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100036BE0(uint64_t result, uint64_t a2)
{
  int v3;

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 132)
  {
    v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 132) && *(_DWORD *)(result + 136) > 0x1Fu)
    {
      result = sub_10000E8B0(*(unsigned int *)(result + 12), *(_QWORD *)(result + 32), (unsigned int *)(result + 40), *(_QWORD *)(result + 104), *(_DWORD *)(result + 112), *(unsigned int *)(result + 116), *(unsigned int *)(result + 120), *(_QWORD *)(result + 124));
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100036C90(uint64_t result, uint64_t a2)
{
  int v3;

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 136)
  {
    v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 136) && *(_DWORD *)(result + 140) > 0x1Fu)
    {
      result = sub_10000EDD4(*(unsigned int *)(result + 12), *(_QWORD *)(result + 32), (unsigned int *)(result + 40), *(_QWORD *)(result + 104), *(_QWORD *)(result + 112), *(unsigned int *)(result + 120), *(unsigned int *)(result + 124), *(_QWORD *)(result + 128));
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100036D3C(_DWORD *a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;
  void (*v5)(void);
  uint64_t result;

  v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  v4 = a1[5];
  if ((v4 - 706) >= 0xFFFFFFD8
    && (v5 = (void (*)(void))*(&off_100055F78 + 5 * (v4 - 666) + 5)) != 0)
  {
    v5();
    return 1;
  }
  else
  {
    result = 0;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

void sub_100036DC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000F4A0((void *)&_mh_execute_header, &_os_log_default, a3, "Could not get well-known root fh", a5, a6, a7, a8, 0);
  sub_10000F52C();
}

void sub_100036DF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000F45C((void *)&_mh_execute_header, &_os_log_default, a3, "Could not connect with status %@", a5, a6, a7, a8, 2u);
  sub_10000F434();
}

void sub_100036E64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000F4A0((void *)&_mh_execute_header, &_os_log_default, a3, "Unable to find mount entry", a5, a6, a7, a8, 0);
  sub_10000F52C();
}

void sub_100036E98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000F45C((void *)&_mh_execute_header, &_os_log_default, a3, "Got connect error %@", a5, a6, a7, a8, 2u);
  sub_10000F434();
}

void sub_100036F04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000F45C((void *)&_mh_execute_header, &_os_log_default, a3, "Got error %@ retrieving object", a5, a6, a7, a8, 2u);
  sub_10000F434();
}

void sub_100036F70(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000F4A0((void *)&_mh_execute_header, a1, a3, "Unable to find entry", a5, a6, a7, a8, 0);
  sub_10000F52C();
}

void sub_100036FA0()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_10000F514();
  sub_10000F4C4((void *)&_mh_execute_header, v0, (uint64_t)v0, "spontaneous unmount done with error %@ name %@", v1);
  sub_10000F434();
}

void sub_100037008(uint64_t a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  sub_10000F4C4((void *)&_mh_execute_header, a4, a3, "Error %@ forgetting volume %@", (uint8_t *)a3);

}

void sub_100037064()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_10000F514();
  sub_10000F4C4((void *)&_mh_execute_header, v0, (uint64_t)v0, "spontaneous unmount cleanup done with error %@ name %@", v1);
  sub_10000F434();
}

void sub_1000370CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F43C(__stack_chk_guard);
  sub_10000F40C();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_100037138()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F43C(__stack_chk_guard);
  sub_10000F40C();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_1000371A4()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  sub_10000F450(__stack_chk_guard);
  v2 = 136315650;
  sub_10000F3EC();
  sub_10000F420((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
  sub_10000F448();
}

void sub_100037210()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F43C(__stack_chk_guard);
  sub_10000F40C();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_10003727C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F43C(__stack_chk_guard);
  sub_10000F40C();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_1000372E8()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  sub_10000F450(__stack_chk_guard);
  v2 = 136315650;
  sub_10000F3EC();
  sub_10000F420((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
  sub_10000F448();
}

void sub_100037354()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F43C(__stack_chk_guard);
  sub_10000F40C();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_1000373C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F43C(__stack_chk_guard);
  sub_10000F40C();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_10003742C(os_log_t log)
{
  int v1;
  const char *v2;

  v1 = 136315138;
  v2 = "lifs_setfsattr_send";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s: sync is async", (uint8_t *)&v1, 0xCu);
  sub_10000F434();
}

void sub_1000374A8()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  sub_10000F450(__stack_chk_guard);
  v2 = 136315650;
  sub_10000F3EC();
  sub_10000F420((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
  sub_10000F448();
}

void sub_100037514()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F43C(__stack_chk_guard);
  sub_10000F40C();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_100037580()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F43C(__stack_chk_guard);
  sub_10000F40C();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_1000375EC()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  sub_10000F450(__stack_chk_guard);
  v2 = 136315650;
  sub_10000F3EC();
  sub_10000F420((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
  sub_10000F448();
}

void sub_100037658()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F43C(__stack_chk_guard);
  sub_10000F40C();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_1000376C4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F43C(__stack_chk_guard);
  sub_10000F40C();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_100037730()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  sub_10000F450(__stack_chk_guard);
  v2 = 136315650;
  sub_10000F3EC();
  sub_10000F420((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
  sub_10000F448();
}

void sub_10003779C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F43C(__stack_chk_guard);
  sub_10000F40C();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_100037808()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F43C(__stack_chk_guard);
  sub_10000F40C();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_100037874()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  sub_10000F450(__stack_chk_guard);
  v2 = 136315650;
  sub_10000F3EC();
  sub_10000F420((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
  sub_10000F448();
}

void sub_1000378E0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F4B0();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_10003794C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F4B0();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_1000379B8()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  sub_10000F450(__stack_chk_guard);
  v2 = 136315650;
  sub_10000F3EC();
  sub_10000F420((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
  sub_10000F448();
}

void sub_100037A24()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F43C(__stack_chk_guard);
  sub_10000F40C();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_100037A90()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F43C(__stack_chk_guard);
  sub_10000F40C();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_100037AFC()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  sub_10000F450(__stack_chk_guard);
  v2 = 136315650;
  sub_10000F3EC();
  sub_10000F420((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
  sub_10000F448();
}

void sub_100037B68()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F43C(__stack_chk_guard);
  sub_10000F40C();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_100037BD4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F43C(__stack_chk_guard);
  sub_10000F40C();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_100037C40()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  sub_10000F450(__stack_chk_guard);
  v2 = 136315650;
  sub_10000F3EC();
  sub_10000F420((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
  sub_10000F448();
}

void sub_100037CAC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F43C(__stack_chk_guard);
  sub_10000F40C();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_100037D18()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F43C(__stack_chk_guard);
  sub_10000F40C();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_100037D84()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  sub_10000F450(__stack_chk_guard);
  v2 = 136315650;
  sub_10000F3EC();
  sub_10000F420((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
  sub_10000F448();
}

void sub_100037DF0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F43C(__stack_chk_guard);
  sub_10000F40C();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_100037E5C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F43C(__stack_chk_guard);
  sub_10000F40C();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_100037EC8()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  int v3;
  int v4;

  LODWORD(v2) = 136315650;
  sub_10000F4F8();
  sub_10000F4E4((void *)&_mh_execute_header, v0, v1, "%s: rename across devices: %u and %u", v2, v3, v4);
  sub_10000F434();
}

void sub_100037F3C()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  sub_10000F450(__stack_chk_guard);
  v2 = 136315650;
  sub_10000F3EC();
  sub_10000F420((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
  sub_10000F448();
}

void sub_100037FA8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F43C(__stack_chk_guard);
  sub_10000F40C();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_100038014()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F43C(__stack_chk_guard);
  sub_10000F40C();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_100038080()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  sub_10000F450(__stack_chk_guard);
  v2 = 136315650;
  sub_10000F3EC();
  sub_10000F420((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
  sub_10000F448();
}

void sub_1000380EC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F43C(__stack_chk_guard);
  sub_10000F40C();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_100038158()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F43C(__stack_chk_guard);
  sub_10000F40C();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_1000381C4()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  sub_10000F450(__stack_chk_guard);
  v2 = 136315650;
  sub_10000F3EC();
  sub_10000F420((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
  sub_10000F448();
}

void sub_100038230()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F43C(__stack_chk_guard);
  sub_10000F40C();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_10003829C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F43C(__stack_chk_guard);
  sub_10000F40C();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_100038308()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  sub_10000F450(__stack_chk_guard);
  v2 = 136315650;
  sub_10000F3EC();
  sub_10000F420((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
  sub_10000F448();
}

void sub_100038374()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F43C(__stack_chk_guard);
  sub_10000F40C();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_1000383E0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F43C(__stack_chk_guard);
  sub_10000F40C();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_10003844C()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  sub_10000F450(__stack_chk_guard);
  v2 = 136315650;
  sub_10000F3EC();
  sub_10000F420((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
  sub_10000F448();
}

void sub_1000384B8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000F45C((void *)&_mh_execute_header, a1, a3, "%s: Got no error and no path.", a5, a6, a7, a8, 2u);
  sub_10000F434();
}

void sub_100038528()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F43C(__stack_chk_guard);
  sub_10000F40C();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_100038594()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F43C(__stack_chk_guard);
  sub_10000F40C();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_100038600()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  int v3;
  int v4;

  LODWORD(v2) = 136315650;
  sub_10000F4F8();
  sub_10000F4E4((void *)&_mh_execute_header, v0, v1, "%s: rename across devices: %u and %u", v2, v3, v4);
  sub_10000F434();
}

void sub_100038674()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  sub_10000F450(__stack_chk_guard);
  v2 = 136315650;
  sub_10000F3EC();
  sub_10000F420((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
  sub_10000F448();
}

void sub_1000386E0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F43C(__stack_chk_guard);
  sub_10000F40C();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_10003874C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F43C(__stack_chk_guard);
  sub_10000F40C();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_1000387B8()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  sub_10000F450(__stack_chk_guard);
  v2 = 136315650;
  sub_10000F3EC();
  sub_10000F420((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
  sub_10000F448();
}

void sub_100038824()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F43C(__stack_chk_guard);
  sub_10000F40C();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_100038890()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F43C(__stack_chk_guard);
  sub_10000F40C();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_1000388FC()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  sub_10000F450(__stack_chk_guard);
  v2 = 136315650;
  sub_10000F3EC();
  sub_10000F420((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
  sub_10000F448();
}

void sub_100038968()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F43C(__stack_chk_guard);
  sub_10000F40C();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_1000389D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F43C(__stack_chk_guard);
  sub_10000F40C();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_100038A40()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  sub_10000F450(__stack_chk_guard);
  v2 = 136315650;
  sub_10000F3EC();
  sub_10000F420((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
  sub_10000F448();
}

void sub_100038AAC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F43C(__stack_chk_guard);
  sub_10000F40C();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_100038B18()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F43C(__stack_chk_guard);
  sub_10000F40C();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_100038B84(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000F45C((void *)&_mh_execute_header, a1, a3, "%s: Unable to dispatch_data_create()", a5, a6, a7, a8, 2u);
  sub_10000F434();
}

void sub_100038BF4()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  sub_10000F450(__stack_chk_guard);
  v2 = 136315650;
  sub_10000F3EC();
  sub_10000F420((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
  sub_10000F448();
}

void sub_100038C60()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F43C(__stack_chk_guard);
  sub_10000F40C();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_100038CCC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F43C(__stack_chk_guard);
  sub_10000F40C();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_100038D38()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  sub_10000F450(__stack_chk_guard);
  v2 = 136315650;
  sub_10000F3EC();
  sub_10000F420((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
  sub_10000F448();
}

void sub_100038DA4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F43C(__stack_chk_guard);
  sub_10000F40C();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_100038E10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F43C(__stack_chk_guard);
  sub_10000F40C();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_100038E7C()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  sub_10000F450(__stack_chk_guard);
  v2 = 136315650;
  sub_10000F3EC();
  sub_10000F420((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
  sub_10000F448();
}

void sub_100038EE8()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  sub_10000F3EC();
  sub_10000F420((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
  sub_10000F448();
}

void sub_100038F58()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  sub_10000F450(__stack_chk_guard);
  v2 = 136315650;
  sub_10000F3EC();
  sub_10000F420((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
  sub_10000F448();
}

void sub_100038FC4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F43C(__stack_chk_guard);
  sub_10000F40C();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_100039030()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F43C(__stack_chk_guard);
  sub_10000F40C();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_10003909C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F4B0();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: requested position %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_100039108()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  sub_10000F450(__stack_chk_guard);
  v2 = 136315650;
  sub_10000F3EC();
  sub_10000F420((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
  sub_10000F448();
}

void sub_100039174()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F43C(__stack_chk_guard);
  sub_10000F40C();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_1000391E0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F43C(__stack_chk_guard);
  sub_10000F40C();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_10003924C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F4B0();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: requested position %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_1000392B8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F43C(__stack_chk_guard);
  sub_10000F40C();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_100039324()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F43C(__stack_chk_guard);
  sub_10000F40C();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_100039390()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  sub_10000F450(__stack_chk_guard);
  v2 = 136315650;
  sub_10000F3EC();
  sub_10000F420((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
  sub_10000F448();
}

void sub_1000393FC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F43C(__stack_chk_guard);
  sub_10000F40C();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_100039468()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F43C(__stack_chk_guard);
  sub_10000F40C();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_1000394D4()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  sub_10000F450(__stack_chk_guard);
  v2 = 136315650;
  sub_10000F3EC();
  sub_10000F420((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
  sub_10000F448();
}

void sub_100039540()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F43C(__stack_chk_guard);
  sub_10000F40C();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_1000395AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F43C(__stack_chk_guard);
  sub_10000F40C();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_100039618()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  sub_10000F450(__stack_chk_guard);
  v2 = 136315650;
  sub_10000F3EC();
  sub_10000F420((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
  sub_10000F448();
}

void sub_100039684()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  sub_10000F46C();
  sub_10000F4D0((void *)&_mh_execute_header, v0, v1, "%s: Got error %u (startIO %u flags 0x%x opeId %llu", v2, v3, v4, v5, v6);
  sub_10000F448();
}

void sub_1000396F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F43C(__stack_chk_guard);
  sub_10000F40C();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_100039760()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F43C(__stack_chk_guard);
  sub_10000F40C();
  sub_10000F3DC((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_1000397CC()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  sub_10000F450(__stack_chk_guard);
  v2 = 136315650;
  sub_10000F3EC();
  sub_10000F420((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
  sub_10000F448();
}

void sub_100039838()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  sub_10000F46C();
  sub_10000F4D0((void *)&_mh_execute_header, v0, v1, "%s: Got error %u (ioStatus %u flags 0x%x opeId %llu", v2, v3, v4, v5, v6);
  sub_10000F448();
}

void sub_1000398A8()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  sub_10000F450(__stack_chk_guard);
  v2 = 136315650;
  sub_10000F3EC();
  sub_10000F420((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
  sub_10000F448();
}

void sub_100039914()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100011B94();
  sub_10000F45C((void *)&_mh_execute_header, v0, v1, "unable to get domains: %{public}@", v2, v3, v4, v5, v6);
  sub_10000F434();
}

void sub_100039974(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint8_t v7[14];
  uint64_t v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "identifier"));
  sub_100011BA0();
  v8 = a2;
  sub_10000F4C4((void *)&_mh_execute_header, a3, v6, "unable to remove domain %@: %{public}@", v7);

}

void sub_100039A10(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100011B24((void *)&_mh_execute_header, a1, a3, "%s: accepting connection", a5, a6, a7, a8, 2u);
  sub_10000F434();
}

void sub_100039A80(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100011B24((void *)&_mh_execute_header, a1, a3, "%s: NOT accepting connection", a5, a6, a7, a8, 2u);
  sub_10000F434();
}

void sub_100039AF0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100011B24((void *)&_mh_execute_header, a1, a3, "%s: start", a5, a6, a7, a8, 2u);
  sub_10000F434();
}

void sub_100039B60(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000F45C((void *)&_mh_execute_header, a1, a3, "%s: ERROR: dispatch_source_create() failed", a5, a6, a7, a8, 2u);
  sub_10000F434();
}

void sub_100039BD0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100011B18();
  sub_10000F4A0((void *)&_mh_execute_header, v0, v1, "Unable to get own audit token. Exiting", v2, v3, v4, v5, v6);
  sub_10000F52C();
}

void sub_100039BFC()
{
  const char *v0;

  v0 = getprogname();
  errx(1, "Usage: %s [-L] [-p port] [-n no_outstanding_requests] [-t no_threads] [-v]", v0);
}

void sub_100039C20()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100011B18();
  sub_10000F4A0((void *)&_mh_execute_header, v0, v1, "Could not allocate mount table", v2, v3, v4, v5, v6);
  sub_10000F52C();
}

void sub_100039C4C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100011B18();
  sub_10000F4A0((void *)&_mh_execute_header, v0, v1, "Unexpected termination of liveFilesMountService", v2, v3, v4, v5, v6);
  sub_10000F52C();
}

void sub_100039C78()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100011B18();
  sub_100011B50((void *)&_mh_execute_header, v0, v1, "main:RunLoopRun", v2, v3, v4, v5, v6);
  sub_10000F52C();
}

void sub_100039CA4()
{
  err(1, "Invalid number of service request %s", optarg);
}

void sub_100039CD0()
{
  errx(1, "Invalid port or ticotsord address %s", optarg);
}

void sub_100039CFC()
{
  err(1, "Invalid maximum number of threads %s", optarg);
}

void sub_100039D28(unsigned __int16 a1, NSObject *a2)
{
  int v2;
  __CFString *v3;
  __int16 v4;
  int v5;

  v2 = 138412546;
  v3 = off_10005C388;
  v4 = 1024;
  v5 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "main:FPNfsPortStr:%@:FPNfsPort:%d", (uint8_t *)&v2, 0x12u);
  sub_10000F434();
}

void sub_100039DB0()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];

  v2[0] = 136315394;
  sub_10000F4B0();
  sub_100011B44((void *)&_mh_execute_header, v0, v1, "%s: ERROR: sending mach port to kernel: %d", (uint8_t *)v2);
  sub_10000F434();
}

void sub_100039E20()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];

  v2[0] = 136315394;
  sub_10000F4B0();
  sub_100011B44((void *)&_mh_execute_header, v0, v1, "%s: ERROR: mach_port_insert_right failed: %d", (uint8_t *)v2);
  sub_10000F434();
}

void sub_100039E90(_DWORD *a1, NSObject *a2, uint64_t a3)
{
  const char *v3;
  int v4;
  const char *v5;
  __int16 v6;
  const char *v7;

  v3 = "dead";
  if (!*a1)
    v3 = "null";
  v4 = 136315394;
  v5 = "main";
  v6 = 2080;
  v7 = v3;
  sub_10000F4C4((void *)&_mh_execute_header, a2, a3, "%s: invalid port - %s", (uint8_t *)&v4);
  sub_10000F434();
}

void sub_100039F28(kern_return_t a1, NSObject *a2)
{
  int v4;
  const char *v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  kern_return_t v9;

  v4 = 136315650;
  v5 = "main";
  v6 = 2080;
  v7 = bootstrap_strerror(a1);
  v8 = 1024;
  v9 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: ERROR: bootstrap_check_in() failed: %s - %d", (uint8_t *)&v4, 0x1Cu);
}

void sub_100039FD4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100011B18();
  sub_100011B50((void *)&_mh_execute_header, v0, v1, "main:start", v2, v3, v4, v5, v6);
  sub_10000F52C();
}

void sub_10003A000(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100011B34((void *)&_mh_execute_header, a2, a3, "ERROR: dispatch_mig_server => %08x", a5, a6, a7, a8, 0);
  sub_10000F52C();
}

void sub_10003A064(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100011B34((void *)&_mh_execute_header, a2, a3, "error: can not ignore signal %d\n", a5, a6, a7, a8, 0);
  sub_10000F52C();
}

void sub_10003A0C8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100011B34((void *)&_mh_execute_header, a2, a3, "Error: could not setup dispatch_source for signal %d", a5, a6, a7, a8, 0);
  sub_10000F52C();
}

void sub_10003A12C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100011B18();
  sub_10000F4A0((void *)&_mh_execute_header, v0, v1, "Could not allocate root filesystem", v2, v3, v4, v5, v6);
  sub_10000F52C();
}

void sub_10003A158()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100011B18();
  sub_10000F4A0((void *)&_mh_execute_header, v0, v1, "Could not alloc/init the root mount table entry", v2, v3, v4, v5, v6);
  sub_10000F52C();
}

void sub_10003A184()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100011B18();
  sub_10000F4A0((void *)&_mh_execute_header, v0, v1, "Could not alloc/init mountServiceDelegate", v2, v3, v4, v5, v6);
  sub_10000F52C();
}

void sub_10003A1B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100011B18();
  sub_10000F4A0((void *)&_mh_execute_header, v0, v1, "Could not obtain NSXPCListerner serviceListener", v2, v3, v4, v5, v6);
  sub_10000F52C();
}

void sub_10003A1DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100011B94();
  sub_10000F45C((void *)&_mh_execute_header, v0, v1, "Could not initialize the fskitd's root memory filesystem. error = %{public}@", v2, v3, v4, v5, v6);
  sub_10000F434();
}

void sub_10003A23C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100011B18();
  sub_10000F4A0((void *)&_mh_execute_header, v0, v1, "Could not build LiveFiles mount path", v2, v3, v4, v5, v6);
  sub_10000F52C();
}

void sub_10003A268()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100011B94();
  sub_10000F45C((void *)&_mh_execute_header, v0, v1, "%{public}@ exist but is not a directory", v2, v3, v4, v5, v6);
  sub_10000F434();
}

void sub_10003A2C8(uint64_t a1, NSObject *a2)
{
  uint8_t v3[24];

  __error();
  sub_100011B70();
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Error making file %{public}@ r/o: %{darwin.errno}d", v3, 0x12u);
  sub_100011B88();
}

void sub_10003A34C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100011B18();
  sub_100011B60((void *)&_mh_execute_header, v0, v1, "Cleanup incomplete after 5 loops. Bailing", v2, v3, v4, v5, v6);
  sub_10000F52C();
}

void sub_10003A378(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  __error();
  sub_100011B70();
  sub_100011B44((void *)&_mh_execute_header, a2, v3, "Error chmod'ing r/o file %{public}@: %{darwin.errno}d", v4);
  sub_100011B88();
}

void sub_10003A3F4()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  sub_100011B94();
  v3 = 2112;
  v4 = v0;
  sub_10000F4C4((void *)&_mh_execute_header, v1, (uint64_t)v1, "Problem enumerating %{public}@, error %@, aborting", v2);
  sub_10000F434();
}

void sub_10003A468()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;

  sub_100011BA0();
  v3 = v0;
  sub_10000F4C4((void *)&_mh_execute_header, v1, (uint64_t)v1, "Error creating %{public}@: %{public}@", v2);
  sub_10000F434();
}

void sub_10003A4D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100011B18();
  sub_100011B60((void *)&_mh_execute_header, v0, v1, "Error reconstituting mount point", v2, v3, v4, v5, v6);
  sub_10000F52C();
}

void sub_10003A500(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;

  v2 = *a1;
  v3 = 136315394;
  v4 = "-[fskitdAgentManager currentExtensionForShortName:auditToken:replyHandler:]_block_invoke_2";
  v5 = 2112;
  v6 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s: Found extension for fsShortName (%@)", (uint8_t *)&v3, 0x16u);
}

void sub_10003A58C(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "taskID(%@) not found in our tasks dictionary", buf, 0xCu);

}

void sub_10003A5E0(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "getResourceID"));
  sub_100018234();
  sub_100018248((void *)&_mh_execute_header, v2, v3, "%s:start:resource:%@", v4, v5, v6, v7, 2u);

  sub_100011B88();
}

void sub_10003A668(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "taskID"));
  sub_100018234();
  sub_10001825C((void *)&_mh_execute_header, v2, v3, "%s: Unknown task ID (%@) was given, can't find task", v4, v5, v6, v7, 2u);

  sub_100011B88();
}

void sub_10003A6F0(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "taskID"));
  sub_100018234();
  sub_100018248((void *)&_mh_execute_header, v2, v3, "%s: Killing the extension instance for task (%@)", v4, v5, v6, v7, 2u);

  sub_100011B88();
}

void sub_10003A778(void *a1, id *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "taskExtensionInstanceID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a2, "instanceID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fs_containerIdentifier"));
  v8 = 136315650;
  v9 = "-[fskitdExtensionClient taskStatusUpdate:]";
  v10 = 2112;
  v11 = v5;
  v12 = 2112;
  v13 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%s: Task extension instance ID (%@) isn't the same as this instance ID (%@)", (uint8_t *)&v8, 0x20u);

}

void sub_10003A85C(os_log_t log)
{
  int v1;
  const char *v2;

  v1 = 136315138;
  v2 = "-[fskitdExtensionClient wipeResource:includingRanges:excludingRanges:replyHandler:]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Given device is not a block device", (uint8_t *)&v1, 0xCu);
  sub_10000F434();
}

void sub_10003A8D8(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "getResourceID"));
  sub_100018234();
  sub_10001825C((void *)&_mh_execute_header, v2, v3, "%s: Given resource (%@) is not recognized by resource manager", v4, v5, v6, v7, 2u);

  sub_100011B88();
}

void sub_10003A960(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100011B24((void *)&_mh_execute_header, a1, a3, "%s:end", a5, a6, a7, a8, 2u);
  sub_10000F434();
}

void sub_10003A9D0(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "getResourceID"));
  sub_100018234();
  sub_10001825C((void *)&_mh_execute_header, v2, v3, "%s: Given resource (%@) isn't recognized", v4, v5, v6, v7, 2u);

  sub_100011B88();
}

void sub_10003AA58(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "getResourceID"));
  sub_100018234();
  sub_100018248((void *)&_mh_execute_header, v2, v3, "%s: Checking if given resource (%@) is recognized by our instance", v4, v5, v6, v7, 2u);

  sub_100011B88();
}

void sub_10003AAE0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100011B24((void *)&_mh_execute_header, a1, a3, "%s:start", a5, a6, a7, a8, 2u);
  sub_10000F434();
}

void sub_10003AB50(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100011B24((void *)&_mh_execute_header, a2, a3, "%@", a5, a6, a7, a8, 2u);
  sub_10000F434();
}

void sub_10003ABB4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100011B24((void *)&_mh_execute_header, a1, a3, "%s: wiped device sucessfully", a5, a6, a7, a8, 2u);
  sub_10000F434();
}

void sub_10003AC24()
{
  os_log_t v0;
  int v1[6];

  v1[0] = 136315394;
  sub_100018234();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: encountered error while wiping device %@", (uint8_t *)v1, 0x16u);
  sub_10000F434();
}

void sub_10003AC9C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100011B24((void *)&_mh_execute_header, a1, a3, "%s:end", a5, a6, a7, a8, 2u);
  sub_10000F434();
}

void sub_10003AD0C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100011B24((void *)&_mh_execute_header, a1, a3, "%s:start", a5, a6, a7, a8, 2u);
  sub_10000F434();
}

void sub_10003AD7C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100011B24((void *)&_mh_execute_header, a1, a3, "%s:end", a5, a6, a7, a8, 2u);
  sub_10000F434();
}

void sub_10003ADEC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100011B24((void *)&_mh_execute_header, a1, a3, "%s:start", a5, a6, a7, a8, 2u);
  sub_10000F434();
}

void sub_10003AE5C(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "getResourceID"));
  sub_100018234();
  sub_100018248((void *)&_mh_execute_header, v2, v3, "%s:end:resource(%@)", v4, v5, v6, v7, 2u);

  sub_100011B88();
}

void sub_10003AEE0(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "getResourceID"));
  sub_100018234();
  sub_100018248((void *)&_mh_execute_header, v2, v3, "%s:start:resource(%@)", v4, v5, v6, v7, 2u);

  sub_100011B88();
}

void sub_10003AF64(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "getResourceID"));
  sub_100018234();
  sub_100018248((void *)&_mh_execute_header, v2, v3, "%s:end:resource(%@)", v4, v5, v6, v7, 2u);

  sub_100011B88();
}

void sub_10003AFE8(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "getResourceID"));
  sub_100018234();
  sub_100018248((void *)&_mh_execute_header, v2, v3, "%s:start:resource(%@)", v4, v5, v6, v7, 2u);

  sub_100011B88();
}

void sub_10003B06C(void *a1, NSObject *a2)
{
  id v3;
  int v4;
  int v5;
  id v6;
  __int16 v7;
  int v8;

  v3 = objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation");
  v4 = *__error();
  v5 = 136315394;
  v6 = v3;
  v7 = 1024;
  v8 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "failed to cleanup parent %s - %{darwin.errno}d", (uint8_t *)&v5, 0x12u);
}

void sub_10003B110(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "mkMountPath:finish:%@", (uint8_t *)&v2, 0xCu);
  sub_10000F434();
}

void sub_10003B180(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;

  v3 = *a2;
  v4 = 138543618;
  v5 = a1;
  v6 = 2114;
  v7 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "mkMountPath: %{public}@ is not contain in fskitd's root %{public}@", (uint8_t *)&v4, 0x16u);
  sub_10000F434();
}

void sub_10003B204(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Oops!", v1, 2u);
}

void sub_10003B244(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Oops! ReadDirAndAttrs on %@", (uint8_t *)&v2, 0xCu);
  sub_10000F434();
}

void sub_10003B2B4(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "LiveMounterReallyMount: cleanup rm returned %d", (uint8_t *)v2, 8u);
  sub_10000F52C();
}

void sub_10003B324()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100011B18();
  sub_10000F4A0((void *)&_mh_execute_header, v0, v1, "Failed to create mount entry!", v2, v3, v4, v5, v6);
  sub_10000F52C();
}

void sub_10003B350()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100029BC0(__stack_chk_guard);
  sub_100029C14();
  sub_10000F45C((void *)&_mh_execute_header, v0, v1, "Failed to actually mount!: %@", v2, v3, v4, v5, v6);
  sub_10000F434();
}

void sub_10003B3B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100011B94();
  sub_10000F45C((void *)&_mh_execute_header, v0, v1, "Failed connection back to %@", v2, v3, v4, v5, v6);
  sub_10000F434();
}

void sub_10003B410()
{
  int v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;

  sub_100011B94();
  v3 = 1024;
  v4 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "ReallyMountVolume:connect mp for volume:%@ how: 0x%08x", v2, 0x12u);
  sub_10000F434();
}

void sub_10003B48C()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  sub_100011B94();
  v3 = 2112;
  v4 = v0;
  sub_100029B3C((void *)&_mh_execute_header, v1, (uint64_t)v1, "Created domain for volname %@, displayName %@", v2);
  sub_10000F434();
}

void sub_10003B500()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100011B18();
  sub_100011B50((void *)&_mh_execute_header, v0, v1, "ReallyMountVolume:adding:LIVEMOUNTER_MOUNT_DISCONNECTED:flags", v2, v3, v4, v5, v6);
  sub_10000F52C();
}

void sub_10003B52C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100029BC0(__stack_chk_guard);
  sub_100029C14();
  sub_10000F45C((void *)&_mh_execute_header, v0, v1, "Failed to store the mount point in settings file!: %@", v2, v3, v4, v5, v6);
  sub_10000F434();
}

void sub_10003B58C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100029BC0(__stack_chk_guard);
  sub_100029C14();
  sub_10000F45C((void *)&_mh_execute_header, v0, v1, "Failed to make mount path: %@", v2, v3, v4, v5, v6);
  sub_10000F434();
}

void sub_10003B5EC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100029BC0(__stack_chk_guard);
  sub_100029C14();
  sub_10000F45C((void *)&_mh_execute_header, v0, v1, "failed preflight: %@", v2, v3, v4, v5, v6);
  sub_10000F434();
}

void sub_10003B64C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100011B18();
  sub_100011B50((void *)&_mh_execute_header, v0, v1, "converting EAUTH to Fileprovider error", v2, v3, v4, v5, v6);
  sub_10000F52C();
}

void sub_10003B678()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100011B94();
  sub_10000F45C((void *)&_mh_execute_header, v0, v1, "addDomain: addDomain returned error: %@", v2, v3, v4, v5, v6);
  sub_10000F434();
}

void sub_10003B6D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100029C14();
  sub_100011B24((void *)&_mh_execute_header, v0, v1, "CoreSpotlight:registered:%@", v2, v3, v4, v5, v6);
  sub_10000F434();
}

void sub_10003B73C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100011B94();
  sub_100011B24((void *)&_mh_execute_header, v0, v1, "doKernelMount:fullPath:providerName:async:block:stat:%@", v2, v3, v4, v5, v6);
  sub_10000F434();
}

void sub_10003B79C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100011B18();
  sub_10000F4A0((void *)&_mh_execute_header, v0, v1, "mountVolume rejecting as client isn't entitled", v2, v3, v4, v5, v6);
  sub_10000F52C();
}

void sub_10003B7C8(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)a2 + 40);
  *(_DWORD *)a3 = 138543618;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = v5;
  sub_10000F4C4((void *)&_mh_execute_header, a4, a3, "Could not unmount %{public}@ error = %{public}@", (uint8_t *)a3);

  sub_100029B88();
}

void sub_10003B828(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  void *v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "bundleIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "attributes"));
  v6 = 136315650;
  v7 = "-[fskitdXPCServer getExtensionModuleFromID:forToken:]_block_invoke_2";
  v8 = 2112;
  v9 = v4;
  v10 = 2112;
  v11 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s: Found extension %@, attrs %@", (uint8_t *)&v6, 0x20u);

}

void sub_10003B8F8()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];

  v2[0] = 136315394;
  sub_100029BAC();
  sub_100029B3C((void *)&_mh_execute_header, v0, v1, "%s: No bundleID found for fsShortName (%@)", (uint8_t *)v2);
  sub_10000F434();
}

void sub_10003B96C()
{
  void *v0;
  _DWORD *v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  sub_100029BA0();
  *v1 = 136315394;
  sub_100029B74(v2, (uint64_t)v1, (uint64_t)"-[fskitdXPCServer getRealResource:auditToken:reply:]");
  sub_100029B3C((void *)&_mh_execute_header, v3, (uint64_t)v3, "%s: Updating resource in resource manager %@", v4);

  sub_100029B88();
}

void sub_10003B9B8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000F45C((void *)&_mh_execute_header, a1, a3, "%s: Unable to convert proxy FSBlockDeviceResource into open resource", a5, a6, a7, a8, 2u);
  sub_10000F434();
}

void sub_10003BA28()
{
  void *v0;
  _DWORD *v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  sub_100029BA0();
  *v1 = 136315394;
  sub_100029B74(v2, (uint64_t)v1, (uint64_t)"-[fskitdXPCServer getRealResource:auditToken:reply:]");
  sub_100029B3C((void *)&_mh_execute_header, v3, (uint64_t)v3, "%s: Recieved resource (%@) is a 'real' resource, returning it.", v4);

  sub_100029B88();
}

void sub_10003BA74()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_100018234();
  sub_100029B48((void *)&_mh_execute_header, v0, v1, "%s: Can't find the extension for %@", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_10003BAE0()
{
  void *v0;
  _DWORD *v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  sub_100029BA0();
  *v1 = 136315394;
  sub_100029B74(v2, (uint64_t)v1, (uint64_t)"-[fskitdXPCServer applyResource:targetBundle:instanceID:initiatorAuditToken:authorizingAuditToken:isProbe:usingBlock:]");
  sub_10000F4C4((void *)&_mh_execute_header, v3, (uint64_t)v3, "%s: Can't get the real resource of %@", v4);

  sub_100029B88();
}

void sub_10003BB2C(void *a1, uint64_t a2, _DWORD *a3)
{
  uint8_t *v4;
  NSObject *v5;

  *a3 = 136315650;
  sub_100029B58((uint64_t)a1, a2, (uint64_t)a3);
  sub_100029B90((void *)&_mh_execute_header, "%s: Resource %@ can't be used on extension %@", v4, v5);

  sub_100029B88();
}

void sub_10003BB7C(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a2 = 138412546;
  *(_QWORD *)(a2 + 4) = a1;
  *(_WORD *)(a2 + 12) = 2048;
  *(_QWORD *)(a2 + 14) = a3;
  sub_100029B3C((void *)&_mh_execute_header, a4, a3, "applyResource starting with resource %@ kind %ld", (uint8_t *)a2);
}

void sub_10003BBC8()
{
  void *v0;
  _DWORD *v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  sub_100029BA0();
  *v1 = 136315650;
  sub_100029BD0(v2, (uint64_t)v1, v3);
  sub_100029C04((void *)&_mh_execute_header, "%s:%@: Can't start probe task, resource state is %d", v4, v5);

  sub_100029B88();
}

void sub_10003BC14()
{
  void *v0;
  _DWORD *v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  sub_100029BA0();
  *v1 = 136315650;
  sub_100029BD0(v2, (uint64_t)v1, v3);
  sub_100029C04((void *)&_mh_execute_header, "%s:%@: Can't start new task, resource state is %d", v4, v5);

  sub_100029B88();
}

void sub_10003BC60()
{
  void *v0;
  void *v1;
  _DWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  sub_100029BF0();
  *v2 = 136315650;
  sub_100029B58(v3, v4, (uint64_t)v2);
  sub_100029B90((void *)&_mh_execute_header, "%s:%@: Resource isn't in loaded/active state, can't start unload task: %@", v5, v6);

  sub_100029B88();
}

void sub_10003BCAC()
{
  void *v0;
  _DWORD *v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  sub_100029BA0();
  *v1 = 136315394;
  sub_100029B74(v2, (uint64_t)v1, (uint64_t)"-[fskitdXPCServer canStartUnloadTask:resource:]");
  sub_100029B3C((void *)&_mh_execute_header, v3, (uint64_t)v3, "%s:%@: Found the resource to unload", v4);

  sub_100029B88();
}

void sub_10003BCF8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100011B24((void *)&_mh_execute_header, a1, a3, "%s:end:not:found", a5, a6, a7, a8, 2u);
  sub_10000F434();
}

void sub_10003BD68()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];

  v2[0] = 136315394;
  sub_100018234();
  sub_100029B3C((void *)&_mh_execute_header, v0, v1, "%s:return:%@", (uint8_t *)v2);
  sub_10000F434();
}

void sub_10003BDD8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100011B24((void *)&_mh_execute_header, a1, a3, "%s:end:not:found", a5, a6, a7, a8, 2u);
  sub_10000F434();
}

void sub_10003BE48(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;

  v3 = 136315394;
  v4 = "-[fskitdXPCServer getInitiatorSigningIDForToken:]";
  v5 = 2114;
  v6 = a1;
  sub_100029B3C((void *)&_mh_execute_header, a2, a3, "%s: SecTaskCopySigningIdentifier:%{public}@", (uint8_t *)&v3);
  sub_10000F434();
}

void sub_10003BEC4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000F45C((void *)&_mh_execute_header, a1, a3, "%s: SecTaskCopySigningIdentifier:failed", a5, a6, a7, a8, 2u);
  sub_10000F434();
}

void sub_10003BF34()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_100018234();
  sub_100029B48((void *)&_mh_execute_header, v0, v1, "%s: No task ID (%@) found", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_10003BFA0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000F45C((void *)&_mh_execute_header, a1, a3, "%s: No instance found", a5, a6, a7, a8, 2u);
  sub_10000F434();
}

void sub_10003C010()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_100018234();
  sub_100029B48((void *)&_mh_execute_header, v0, v1, "%s:end:reply:%@", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_10003C07C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_100018234();
  sub_100029B48((void *)&_mh_execute_header, v0, v1, "%s:start:taskID:%@", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_10003C0E8()
{
  void *v0;
  _DWORD *v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  sub_100029BA0();
  *v1 = 136315394;
  sub_100029B74(v2, (uint64_t)v1, (uint64_t)"-[fskitdXPCServer canStartActivateTask:resource:]");
  sub_100029B3C((void *)&_mh_execute_header, v3, (uint64_t)v3, "%s:%@: Found the resource to activate", v4);

  sub_100029B88();
}

void sub_10003C134()
{
  void *v0;
  void *v1;
  _DWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  sub_100029BF0();
  *v2 = 136315650;
  sub_100029B58(v3, v4, (uint64_t)v2);
  sub_100029B90((void *)&_mh_execute_header, "%s:%@: Resource isn't in loaded state, can't start activate task: %@", v5, v6);

  sub_100029B88();
}

void sub_10003C180()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_100018234();
  sub_100029B48((void *)&_mh_execute_header, v0, v1, "%s: No module found with short name ‘%@’", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_10003C1EC()
{
  void *v0;
  _DWORD *v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  sub_100029BA0();
  *v1 = 136315394;
  sub_100029B74(v2, (uint64_t)v1, (uint64_t)"-[fskitdXPCServer canStartDeactivateTask:resource:]");
  sub_100029B3C((void *)&_mh_execute_header, v3, (uint64_t)v3, "%s:%@: Found the resource to activate", v4);

  sub_100029B88();
}

void sub_10003C238()
{
  void *v0;
  void *v1;
  _DWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  sub_100029BF0();
  *v2 = 136315650;
  sub_100029B58(v3, v4, (uint64_t)v2);
  sub_100029B90((void *)&_mh_execute_header, "%s:%@: Resource isn't in active state, can't start deactivate task: %@", v5, v6);

  sub_100029B88();
}

void sub_10003C284()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_100018234();
  sub_100029B48((void *)&_mh_execute_header, v0, v1, "%s: No module found with short name ‘%@’", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_10003C2F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_100018234();
  sub_100029B48((void *)&_mh_execute_header, v0, v1, "%s: No module found with short name ‘%@’", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_10003C35C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_100018234();
  sub_100029B48((void *)&_mh_execute_header, v0, v1, "%s: No module found with short name ‘%@’", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_10003C3C8()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];

  v2[0] = 136315394;
  sub_100029BAC();
  sub_100029B3C((void *)&_mh_execute_header, v0, v1, "%s: Can't activate volume (%@), no resource associated with it found", (uint8_t *)v2);
  sub_10000F434();
}

void sub_10003C43C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100011B24((void *)&_mh_execute_header, a1, a3, "%s: Done loading the resource, call checkWithOptions", a5, a6, a7, a8, 2u);
  sub_10000F434();
}

void sub_10003C4AC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100011B24((void *)&_mh_execute_header, a1, a3, "%s: Load resource failed, call checkResource", a5, a6, a7, a8, 2u);
  sub_10000F434();
}

void sub_10003C51C(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[6];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "getResourceID"));
  v5[0] = 136315394;
  sub_100018234();
  sub_100029B3C((void *)&_mh_execute_header, a2, v4, "%s: load resource (%@) before doing checkWithOptions", (uint8_t *)v5);

  sub_100011B88();
}

void sub_10003C5AC()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];

  v2[0] = 136315394;
  sub_100029BAC();
  sub_100029B3C((void *)&_mh_execute_header, v0, v1, "%s: Can't deactivate volume (%@), no resource associated with it found", (uint8_t *)v2);
  sub_10000F434();
}

void sub_10003C620(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100011B24((void *)&_mh_execute_header, a1, a3, "%s: Done with force loading the resource, call formatWithOptions", a5, a6, a7, a8, 2u);
  sub_10000F434();
}

void sub_10003C690(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100011B24((void *)&_mh_execute_header, a1, a3, "%s: Load resource failed, call formatResource", a5, a6, a7, a8, 2u);
  sub_10000F434();
}

void sub_10003C700(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[6];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "getResourceID"));
  v5[0] = 136315394;
  sub_100018234();
  sub_100029B3C((void *)&_mh_execute_header, a2, v4, "%s: load resource (%@) before doing formatWithOptions", (uint8_t *)v5);

  sub_100011B88();
}

void sub_10003C790(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[6];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "volumeID"));
  v5[0] = 136315394;
  sub_100018234();
  sub_100029B3C((void *)&_mh_execute_header, a2, v4, "%s: Adding volumeID %@ to our instance", (uint8_t *)v5);

  sub_100011B88();
}

void sub_10003C81C(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[6];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "getResourceID"));
  v5[0] = 136315394;
  sub_100018234();
  sub_100029B3C((void *)&_mh_execute_header, a2, v4, "%s: Remove resourceID (%@) from the FSModuleHost.defaultInstanceUUID instance", (uint8_t *)v5);

  sub_100011B88();
}

void sub_10003C8AC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000F45C((void *)&_mh_execute_header, a2, a3, "addDomain: addDomain returned error: %@", a5, a6, a7, a8, 2u);
  sub_10000F434();
}

void sub_10003C910(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000F45C((void *)&_mh_execute_header, a2, a3, "setConnected:completionHandler: returned %@", a5, a6, a7, a8, 2u);
  sub_10000F434();
}

void sub_10003C974(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000F45C((void *)&_mh_execute_header, a2, a3, "RemoveDomain returned error: %@", a5, a6, a7, a8, 2u);
  sub_10000F434();
}

void sub_10003C9D8(os_log_t log)
{
  int v1;
  const char *v2;

  v1 = 136315138;
  v2 = "-[LivefsSettings setIdleTimerLocked:]";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s: Dispatched no-mounts timer", (uint8_t *)&v1, 0xCu);
}

void sub_10003CA58(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Starting cleanup", v1, 2u);
}

void sub_10003CA98(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Skipping boot check cleanup as we didn't get a boot UUID this launch", v1, 2u);
}

void sub_10003CAD8()
{
  os_log_t v0;
  uint8_t v1[24];

  sub_100011B94();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Didn't understand providername %@", v1, 0xCu);
  sub_10000F434();
}

void sub_10003CB44(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 136315650;
  *(_QWORD *)&v3[4] = "+[LIFSClientConnector getLiveFilesConnectionForProvider:volume:withHandler:]";
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a1;
  *(_WORD *)&v3[22] = 2112;
  sub_100031B7C((void *)&_mh_execute_header, a2, a3, "Got to end of %s, returning conn %@ error %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *(_QWORD *)(*(_QWORD *)a2 + 40));
  sub_10000F448();
}

void sub_10003CBCC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100029BC0(__stack_chk_guard);
  sub_100029C14();
  sub_10000F45C((void *)&_mh_execute_header, v0, v1, "No client, error %@", v2, v3, v4, v5, v6);
  sub_10000F434();
}

void sub_10003CC2C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100029BC0(__stack_chk_guard);
  sub_100029C14();
  sub_10000F45C((void *)&_mh_execute_header, v0, v1, "forgetVolume returned %@", v2, v3, v4, v5, v6);
  sub_10000F434();
}

void sub_10003CC8C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_100031B6C();
  sub_100031B90((void *)&_mh_execute_header, v0, v1, "%s:bridgeToVolumeConnector:%d", v2, v3, v4, v5, 2u);
  sub_10000F434();
}

void sub_10003CD00()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  sub_100029BC0(__stack_chk_guard);
  sub_100029C14();
  v3 = 2112;
  v4 = v0;
  sub_10000F4C4((void *)&_mh_execute_header, v1, (uint64_t)v1, "Error %@ in LIGetRootFileHandle for memoryfs mounting at %@", v2);
  sub_10000F434();
}

void sub_10003CD74()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100029C14();
  sub_100031B90((void *)&_mh_execute_header, v0, v1, "%s:%d: No bridge to FSVolumeConnector, do old flow", v2, v3, v4, v5, v6);
  sub_10000F434();
}

void sub_10003CDF0(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  uint64_t v8;

  v2 = *a1;
  v3 = 136315650;
  v4 = "-[mountEntry getLiveFilesConnectionForPath:withCompletionHandler:]";
  v5 = 1024;
  v6 = 652;
  v7 = 2112;
  v8 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s:%d: Getting FSVolumeConnector endpoint for volumeID (%@)", (uint8_t *)&v3, 0x1Cu);
  sub_10000F448();
}

void sub_10003CE88(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000F4A0((void *)&_mh_execute_header, a1, a3, "doConnect: Backend connection is gone.", a5, a6, a7, a8, 0);
  sub_10000F52C();
}

void sub_10003CEB8()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  _BYTE v3[24];

  sub_100029BC0(__stack_chk_guard);
  *(_DWORD *)v3 = 136315650;
  *(_QWORD *)&v3[4] = "-[mountEntry doConnect]";
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = v0;
  *(_WORD *)&v3[22] = 2112;
  sub_100031B7C((void *)&_mh_execute_header, v1, v2, "%s: creating mount FSTask to %@ with type %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *(_QWORD *)(*(_QWORD *)v1 + 40));
  sub_10000F448();
}

void sub_10003CF40()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100029BC0(__stack_chk_guard);
  sub_100029C14();
  sub_10000F45C((void *)&_mh_execute_header, v0, v1, "Unable to create mount FSTask, error %@", v2, v3, v4, v5, v6);
  sub_10000F434();
}

void sub_10003CFA0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100011B94();
  sub_10000F45C((void *)&_mh_execute_header, v0, v1, "Could not get file provider connection %{public}@", v2, v3, v4, v5, v6);
  sub_10000F434();
}

void sub_10003D000(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;

  v3 = 136315394;
  v4 = "-[mountEntry doConnect]_block_invoke_2";
  v5 = 2112;
  v6 = a1;
  sub_10000F4C4((void *)&_mh_execute_header, a2, a3, "%s: invalidation with strongSelf %@", (uint8_t *)&v3);
  sub_10000F434();
}

void sub_10003D07C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000F4A0((void *)&_mh_execute_header, a1, a3, "*** Unable to get LIGetRootFileHandle, server returned no error and no filehandle", a5, a6, a7, a8, 0);
  sub_10000F52C();
}

void sub_10003D0AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100011B94();
  sub_10000F45C((void *)&_mh_execute_header, v0, v1, "Unable to get LIGetRootFileHandle, server returned %@", v2, v3, v4, v5, v6);
  sub_10000F434();
}

void sub_10003D10C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100011B34((void *)&_mh_execute_header, a2, a3, "Error %d getting LI_FSATTR_FSLOCATION", a5, a6, a7, a8, 0);
  sub_10000F52C();
}

void sub_10003D170(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100011B34((void *)&_mh_execute_header, a2, a3, "Error %d getting LI_FSATTR_FSTYPENAME", a5, a6, a7, a8, 0);
  sub_10000F52C();
}

void sub_10003D1D4(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "mountEntry connect woke while we are still waiting for an answer", buf, 2u);
}

void sub_10003D210(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "connect called while still building domain", buf, 2u);
}

void sub_10003D24C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000F4A0((void *)&_mh_execute_header, a1, a3, "connect called on dead mount entry", a5, a6, a7, a8, 0);
  sub_10000F52C();
}

void sub_10003D27C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000F45C((void *)&_mh_execute_header, a1, a3, "%s: interrupted", a5, a6, a7, a8, 2u);
  sub_10000F434();
}

void sub_10003D2EC()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_100011B94();
  sub_100031B6C();
  sub_100011B44((void *)&_mh_execute_header, v0, (uint64_t)v0, "Auto-connect failed with error '%@', mount id %u", v1);
  sub_10000F434();
}

void sub_10003D35C(int a1, NSObject *a2)
{
  uint64_t v4;
  uint8_t v5[12];
  __int16 v6;
  int v7;

  strerror(a1);
  sub_100011B94();
  v6 = 1024;
  v7 = a1;
  sub_100011B44((void *)&_mh_execute_header, a2, v4, "mount launch failed with result \"%{public}s\"[%d]", v5);
  sub_10000F448();
}

void sub_10003D3E4(NSObject *a1)
{
  uint64_t v2;
  int v3;
  const char *v4;

  __error();
  v3 = 136315394;
  v4 = "mount_lifs";
  sub_100031B6C();
  sub_100011B44((void *)&_mh_execute_header, a1, v2, "spawner: waitpid %s: errno=%d\n", (uint8_t *)&v3);
  sub_10000F448();
}

void sub_10003D470(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;

  v3 = 136315394;
  v4 = "int get_volume_caps(const char *, uint32_t *, uint32_t *)";
  v5 = 2080;
  v6 = a1;
  sub_10000F4C4((void *)&_mh_execute_header, a2, a3, "%s: No ATTR_VOL_CAPABILITIES for '%s'", (uint8_t *)&v3);
  sub_10000F434();
}

void sub_10003D4EC(uint64_t a1, NSObject *a2)
{
  int v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  int v10;

  v4 = *__error();
  v5 = 136315650;
  v6 = "int get_volume_caps(const char *, uint32_t *, uint32_t *)";
  v7 = 2080;
  v8 = a1;
  v9 = 1024;
  v10 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: getattrlist('%s') -> %d", (uint8_t *)&v5, 0x1Cu);
}

void sub_10003D59C()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];

  v2[0] = 136315394;
  sub_10000F4B0();
  sub_100011B44((void *)&_mh_execute_header, v0, v1, "spawner: %s: exited with status %d\n", (uint8_t *)v2);
  sub_10000F434();
}

void sub_10003D60C()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  const char *v3;

  v2 = 136315394;
  v3 = "mount_lifs";
  sub_100031B6C();
  sub_100011B44((void *)&_mh_execute_header, v0, v1, "spawner: %s: terminated by signal %d\n", (uint8_t *)&v2);
  sub_10000F434();
}

void sub_10003D688()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];

  v2[0] = 136315394;
  sub_10000F4B0();
  sub_100011B44((void *)&_mh_execute_header, v0, v1, "spawner: posix_spawn %s: error=%d\n", (uint8_t *)v2);
  sub_10000F434();
}

void sub_10003D6F8()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  sub_100029C14();
  v3 = 2114;
  v4 = v0;
  sub_10000F4C4((void *)&_mh_execute_header, v1, (uint64_t)v1, "Could not make mount path for %{public}@ error = %{public}@", v2);
  sub_10000F434();
}

void sub_10003D770(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 136315394;
  *(_QWORD *)(a2 + 4) = "-[mountEntry removeMountTask]";
  *(_WORD *)(a2 + 12) = 2112;
  *(_QWORD *)(a2 + 14) = a1;
  sub_100029B3C((void *)&_mh_execute_header, a3, (uint64_t)a3, "%s: Removing resource (%@) from mount task", (uint8_t *)a2);

}

void sub_10003D7D0()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];

  v2[0] = 136315394;
  sub_100029BAC();
  sub_100029B3C((void *)&_mh_execute_header, v0, v1, "%s: Removing mount task with UUID (%@)", (uint8_t *)v2);
  sub_10000F434();
}

void sub_10003D844(void *a1, NSObject *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  id v6;

  v3 = objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation");
  __error();
  v5 = 136315394;
  v6 = v3;
  sub_100031B6C();
  sub_100011B44((void *)&_mh_execute_header, a2, v4, "failed to cleanup %s - %{darwin.errno}d", (uint8_t *)&v5);
  sub_10000F448();
}

void sub_10003D8D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100011B94();
  sub_10000F45C((void *)&_mh_execute_header, v0, v1, "isMountAtPath error %@", v2, v3, v4, v5, v6);
  sub_10000F434();
}

void sub_10003D934()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  sub_100011B94();
  v3 = 2112;
  v4 = v0;
  sub_10000F4C4((void *)&_mh_execute_header, v1, (uint64_t)v1, "Unable to disarm triggers on path %@, error %@", v2);
  sub_10000F434();
}

void sub_10003D9A8()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];

  v2[0] = 136315394;
  sub_100029BAC();
  sub_10000F4C4((void *)&_mh_execute_header, v0, v1, "%s: no extension instance found for this entry (%@)", (uint8_t *)v2);
  sub_10000F434();
}

void sub_10003DA1C()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];

  sub_100029BC0(__stack_chk_guard);
  v2[0] = 136315394;
  sub_100029BAC();
  sub_10000F4C4((void *)&_mh_execute_header, v0, v1, "%s: Connecting to extension instance reported error %@", (uint8_t *)v2);
  sub_10000F434();
}

void sub_10003DA8C()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];

  v2[0] = 136315394;
  sub_100029BAC();
  sub_10000F4C4((void *)&_mh_execute_header, v0, v1, "%s: mount entry (%@) isn't using fskit module", (uint8_t *)v2);
  sub_10000F434();
}

void sub_10003DB00()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  int v3[5];
  __int16 v4;
  uint64_t v5;

  v3[0] = 136315650;
  sub_100029BAC();
  v4 = v0;
  v5 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%s: Can't get proxy object, can't forget the module volume (%@) error (%@)", (uint8_t *)v3, 0x20u);
  sub_10000F448();
}

void sub_10003DB8C(uint64_t a1, NSObject *a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;

  __error();
  v5 = 138412546;
  v6 = a1;
  sub_100031B6C();
  sub_100011B44((void *)&_mh_execute_header, a2, v4, "Error unmounting %@: %{darwin.errno}d", (uint8_t *)&v5);
  sub_10000F448();
}

void sub_10003DC14(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100011B24((void *)&_mh_execute_header, a2, a3, "Killing %@", a5, a6, a7, a8, 2u);
  sub_10000F434();
}

void sub_10003DC78(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000F4A0((void *)&_mh_execute_header, a1, a3, "Failed to create resource assertion", a5, a6, a7, a8, 0);
}

void sub_10003DCAC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000F4A0((void *)&_mh_execute_header, a1, a3, "Failed to aquire resource assertion", a5, a6, a7, a8, 0);
}

void sub_10003DCE0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100011B24((void *)&_mh_execute_header, a1, a3, "%s:end", a5, a6, a7, a8, 2u);
  sub_10000F434();
}

void sub_10003DD50(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "description"));
  sub_100018234();
  sub_100018248((void *)&_mh_execute_header, v2, v3, "%s:terminate return error: %@", v4, v5, v6, v7, 2u);

  sub_100011B88();
}

void sub_10003DDD8(int a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;

  v2 = 136315394;
  v3 = "-[fskitdExtensionInstance terminate]";
  v4 = 1024;
  v5 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s:start:%d", (uint8_t *)&v2, 0x12u);
  sub_10000F434();
}

void sub_10003DE5C(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "getResourceID"));
  sub_100018234();
  sub_100018248((void *)&_mh_execute_header, v2, v3, "%s: revoking resource (%@) because extension is terminated", v4, v5, v6, v7, 2u);

  sub_100011B88();
}

void sub_10003DEE0(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error stopping extension instance: %@", (uint8_t *)&v2, 0xCu);
  sub_10000F434();
}

void sub_10003DF50(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "getInstancesInfo"));
  sub_100018234();
  sub_100018248((void *)&_mh_execute_header, v2, v3, "%s: Available instances are:\n%@", v4, v5, v6, v7, 2u);

  sub_100011B88();
}

void sub_10003DFD4()
{
  NSObject *v0;
  int v1[10];

  v1[0] = 136315650;
  sub_100034930();
  sub_10003494C((void *)&_mh_execute_header, v0, (uint64_t)v0, "%s: Can't find any instance using bundleID (%@) and volume ID (%@)", (uint8_t *)v1);
}

void sub_10003E04C(void *a1, uint64_t *a2, NSObject *a3)
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "third"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "first"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "second"));
  v9 = *a2;
  v11 = 136316162;
  v12 = "-[fskitdExtensionManager existingExtensionForBundle:user:volume:replyHandler:]_block_invoke";
  v13 = 2112;
  v14 = v6;
  v15 = 2112;
  v16 = v7;
  v17 = 2112;
  v18 = v8;
  v19 = 2112;
  v20 = v9;
  sub_100034958((void *)&_mh_execute_header, a3, v10, "%s: Found an instance (%@) with the right bundleID (%@), uid %@, and volumeID (%@)", (uint8_t *)&v11);

  sub_10003491C();
}

void sub_10003E138()
{
  NSObject *v0;
  int v1[10];

  v1[0] = 136315650;
  sub_100034930();
  sub_10003494C((void *)&_mh_execute_header, v0, (uint64_t)v0, "%s:volumeID(%@)bundleID(%@):start", (uint8_t *)v1);
}

void sub_10003E1B0(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "getInstancesInfo"));
  sub_100018234();
  sub_100018248((void *)&_mh_execute_header, v2, v3, "%s: Available instances are:\n%@", v4, v5, v6, v7, 2u);

  sub_100011B88();
}

void sub_10003E234(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "getResourceID"));
  v7 = 136315650;
  v8 = "-[fskitdExtensionManager existingExtensionForBundle:user:resource:replyHandler:]";
  v9 = 2112;
  v10 = a1;
  v11 = 2112;
  v12 = v5;
  sub_10003494C((void *)&_mh_execute_header, a3, v6, "%s: Can't find any instance using bundleID (%@) and resourceID (%@)", (uint8_t *)&v7);

}

void sub_10003E2EC(void *a1, id *a2, NSObject *a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "third"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "second"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "first"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a2, "getResourceID"));
  v11 = 136316162;
  v12 = "-[fskitdExtensionManager existingExtensionForBundle:user:resource:replyHandler:]_block_invoke";
  v13 = 2112;
  v14 = v6;
  v15 = 2112;
  v16 = v7;
  v17 = 2112;
  v18 = v8;
  v19 = 2112;
  v20 = v9;
  sub_100034958((void *)&_mh_execute_header, a3, v10, "%s: Found an instance (%@) with the right bundleID (%@),uid %@, and resourceID (%@)", (uint8_t *)&v11);

  sub_10003491C();
}

id objc_msgSend_BSDName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BSDName");
}

id objc_msgSend_FSAllClientXPCProtocols(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "FSAllClientXPCProtocols");
}

id objc_msgSend_FSClientHostXPCProtocol(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "FSClientHostXPCProtocol");
}

id objc_msgSend_FSClientXPCProtocol(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "FSClientXPCProtocol");
}

id objc_msgSend_FSKitHelperProtocol(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "FSKitHelperProtocol");
}

id objc_msgSend_FSModuleExtensionHostXPCProtocol(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "FSModuleExtensionHostXPCProtocol");
}

id objc_msgSend_FSModuleExtensionXPCProtocol(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "FSModuleExtensionXPCProtocol");
}

id objc_msgSend_FSVolumeXPCProtocol(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "FSVolumeXPCProtocol");
}

id objc_msgSend_LiveMounterDoUnmount_how_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "LiveMounterDoUnmount:how:reply:");
}

id objc_msgSend_LiveMounterDoUnmountCleanup_how_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "LiveMounterDoUnmountCleanup:how:reply:");
}

id objc_msgSend_LiveMounterDoUnmountPreflight_how_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "LiveMounterDoUnmountPreflight:how:reply:");
}

id objc_msgSend_LiveMounterReallyMountVolume_fileSystem_displayName_provider_domainError_on_how_options_auditToken_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "LiveMounterReallyMountVolume:fileSystem:displayName:provider:domainError:on:how:options:auditToken:reply:");
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend__activateVolume_usingBundle_options_auditToken_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_activateVolume:usingBundle:options:auditToken:replyHandler:");
}

id objc_msgSend__checkResource_usingBundle_options_auditToken_connection_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_checkResource:usingBundle:options:auditToken:connection:replyHandler:");
}

id objc_msgSend__currentContainersForAuditToken_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_currentContainersForAuditToken:replyHandler:");
}

id objc_msgSend__currentResourceIDsForAuditToken_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_currentResourceIDsForAuditToken:replyHandler:");
}

id objc_msgSend__currentTasksForAuditToken_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_currentTasksForAuditToken:replyHandler:");
}

id objc_msgSend__deactivateVolume_usingBundle_numericOptions_auditToken_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_deactivateVolume:usingBundle:numericOptions:auditToken:replyHandler:");
}

id objc_msgSend__formatResource_usingBundle_options_auditToken_connection_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_formatResource:usingBundle:options:auditToken:connection:replyHandler:");
}

id objc_msgSend__initWithProviderIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_initWithProviderIdentifier:");
}

id objc_msgSend__initWithProviderIdentifier_domain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_initWithProviderIdentifier:domain:");
}

id objc_msgSend__installedExtensionWithShortName_user_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_installedExtensionWithShortName:user:replyHandler:");
}

id objc_msgSend__installedExtensionsForAuditToken_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_installedExtensionsForAuditToken:replyHandler:");
}

id objc_msgSend__loadResource_usingBundle_options_auditToken_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_loadResource:usingBundle:options:auditToken:replyHandler:");
}

id objc_msgSend__probeResource_usingBundle_auditToken_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_probeResource:usingBundle:auditToken:replyHandler:");
}

id objc_msgSend__unloadResource_usingBundle_options_auditToken_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_unloadResource:usingBundle:options:auditToken:replyHandler:");
}

id objc_msgSend_abortSearch_requestID_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "abortSearch:requestID:replyHandler:");
}

id objc_msgSend_acquire(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "acquire");
}

id objc_msgSend_activateVolume_resource_options_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateVolume:resource:options:replyHandler:");
}

id objc_msgSend_activateVolume_usingBundle_options_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateVolume:usingBundle:options:replyHandler:");
}

id objc_msgSend_add_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "add:");
}

id objc_msgSend_addBundleToEnableModules_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addBundleToEnableModules:");
}

id objc_msgSend_addDomain_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addDomain:completionHandler:");
}

id objc_msgSend_addDomain_displayName_storage_provider_domainError_how_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addDomain:displayName:storage:provider:domainError:how:reply:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addMountNamed_displayName_mountID_mountedOn_provider_fpStorage_domainError_how_isReAdd_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addMountNamed:displayName:mountID:mountedOn:provider:fpStorage:domainError:how:isReAdd:");
}

id objc_msgSend_addNode_withLock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addNode:withLock:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addOption_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addOption:");
}

id objc_msgSend_addResource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addResource:");
}

id objc_msgSend_addResourceID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addResourceID:");
}

id objc_msgSend_addTaskID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addTaskID:");
}

id objc_msgSend_addTaskUUID_resource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addTaskUUID:resource:");
}

id objc_msgSend_addVolumeID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addVolumeID:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allValues");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendString:");
}

id objc_msgSend_applyResource_targetBundle_instanceID_initiatorAuditToken_authorizingAuditToken_isProbe_usingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applyResource:targetBundle:instanceID:initiatorAuditToken:authorizingAuditToken:isProbe:usingBlock:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_atime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "atime");
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributes");
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "auditToken");
}

id objc_msgSend_availableBytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "availableBytes");
}

id objc_msgSend_beginMonitoringProviderDomainChangesWithHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginMonitoringProviderDomainChangesWithHandler:");
}

id objc_msgSend_blockmapFile_range_startIO_flags_operationID_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blockmapFile:range:startIO:flags:operationID:reply:");
}

id objc_msgSend_blockmapFile_range_startIO_flags_operationID_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blockmapFile:range:startIO:flags:operationID:replyHandler:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleID");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_callStructMethod_inStruct_inSize_outStruct_outStructSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "callStructMethod:inStruct:inSize:outStruct:outStructSize:");
}

id objc_msgSend_canStartActivateTask_resource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canStartActivateTask:resource:");
}

id objc_msgSend_canStartDeactivateTask_resource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canStartDeactivateTask:resource:");
}

id objc_msgSend_canStartProbeTask_resource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canStartProbeTask:resource:");
}

id objc_msgSend_canStartTask_resource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canStartTask:resource:");
}

id objc_msgSend_canStartUnloadTask_resource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canStartUnloadTask:resource:");
}

id objc_msgSend_caseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "caseInsensitiveCompare:");
}

id objc_msgSend_checkAccessTo_requestedAccess_requestID_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkAccessTo:requestedAccess:requestID:reply:");
}

id objc_msgSend_checkAccessTo_requestedAccess_requestID_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkAccessTo:requestedAccess:requestID:replyHandler:");
}

id objc_msgSend_checkIn_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkIn:replyHandler:");
}

id objc_msgSend_checkResource_options_connection_taskID_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkResource:options:connection:taskID:replyHandler:");
}

id objc_msgSend_checkWithOptions_connection_taskID_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkWithOptions:connection:taskID:replyHandler:");
}

id objc_msgSend_cleanUpInstance_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cleanUpInstance:");
}

id objc_msgSend_cleanupConfigFromLastBoot(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cleanupConfigFromLastBoot");
}

id objc_msgSend_close_keepingMode_requestID_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "close:keepingMode:requestID:reply:");
}

id objc_msgSend_close_keepingMode_requestID_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "close:keepingMode:requestID:replyHandler:");
}

id objc_msgSend_closeResource_andRevoke_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "closeResource:andRevoke:");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_configurationForInstance_ofBundle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationForInstance:ofBundle:");
}

id objc_msgSend_configureUserClient_pid_pidversion_supportKOIO_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configureUserClient:pid:pidversion:supportKOIO:");
}

id objc_msgSend_connect(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connect");
}

id objc_msgSend_connectionWasInterupted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionWasInterupted");
}

id objc_msgSend_containerID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containerID");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsString:");
}

id objc_msgSend_contentsOfDirectoryAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentsOfDirectoryAtPath:error:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_copyDisconnectedRootAttrs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyDisconnectedRootAttrs:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createIn_named_attributes_requestID_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createIn:named:attributes:requestID:reply:");
}

id objc_msgSend_createIn_named_type_attributes_requestID_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createIn:named:type:attributes:requestID:replyHandler:");
}

id objc_msgSend_currentExtensionForShortName_auditToken_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentExtensionForShortName:auditToken:replyHandler:");
}

id objc_msgSend_currentExtensions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentExtensions");
}

id objc_msgSend_currentExtensionsForToken_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentExtensionsForToken:replyHandler:");
}

id objc_msgSend_currentState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentState");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "data");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytesNoCopy:length:freeWhenDone:");
}

id objc_msgSend_dataWithLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithLength:");
}

id objc_msgSend_deactivateVolume_numericOptions_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deactivateVolume:numericOptions:replyHandler:");
}

id objc_msgSend_deactivateVolume_usingBundle_numericOptions_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deactivateVolume:usingBundle:numericOptions:replyHandler:");
}

id objc_msgSend_defaultClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultClient");
}

id objc_msgSend_defaultInstanceUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultInstanceUUID");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_deserializedError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deserializedError:");
}

id objc_msgSend_detachBytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "detachBytes");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithContentsOfURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithContentsOfURL:error:");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayName");
}

id objc_msgSend_doConnect(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doConnect");
}

id objc_msgSend_doKernelMount_providerName_mountEntry_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doKernelMount:providerName:mountEntry:");
}

id objc_msgSend_doWait(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doWait");
}

id objc_msgSend_doWakeAndUnlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doWakeAndUnlock");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_domainError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domainError");
}

id objc_msgSend_dynamicCast_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dynamicCast:");
}

id objc_msgSend_endIO_range_status_flags_operationID_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endIO:range:status:flags:operationID:reply:");
}

id objc_msgSend_endIO_range_status_flags_operationID_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endIO:range:status:flags:operationID:replyHandler:");
}

id objc_msgSend_endMonitoringProviderDomainChanges_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endMonitoringProviderDomainChanges:");
}

id objc_msgSend_ensureConnected_status_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ensureConnected:status:");
}

id objc_msgSend_enumerateInstancesForBundle_uid_block_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateInstancesForBundle:uid:block:");
}

id objc_msgSend_enumerateInstancesForBundle_user_block_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateInstancesForBundle:user:block:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsWithOptions_usingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsWithOptions:usingBlock:");
}

id objc_msgSend_errorFromStartingProc(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorFromStartingProc");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_execute_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "execute:");
}

id objc_msgSend_existingExtensionForBundle_user_instance_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "existingExtensionForBundle:user:instance:replyHandler:");
}

id objc_msgSend_existingExtensionForBundle_user_resource_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "existingExtensionForBundle:user:resource:replyHandler:");
}

id objc_msgSend_existingExtensionForBundle_user_volume_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "existingExtensionForBundle:user:volume:replyHandler:");
}

id objc_msgSend_exportedClientInterface(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exportedClientInterface");
}

id objc_msgSend_exportedObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exportedObject");
}

id objc_msgSend_extensionForBundle_user_instance_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionForBundle:user:instance:replyHandler:");
}

id objc_msgSend_extensionIdentity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionIdentity");
}

id objc_msgSend_extensionProcessWithConfiguration_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionProcessWithConfiguration:error:");
}

id objc_msgSend_extensionSupportsResource_resource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionSupportsResource:resource:");
}

id objc_msgSend_fetchVolumeMachPortLabeled_requestID_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchVolumeMachPortLabeled:requestID:reply:");
}

id objc_msgSend_fetchVolumeMachPortLabeled_requestID_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchVolumeMachPortLabeled:requestID:replyHandler:");
}

id objc_msgSend_fh(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fh");
}

id objc_msgSend_fileAttributes_requestID_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileAttributes:requestID:reply:");
}

id objc_msgSend_fileAttributes_requestedAttributes_requestID_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileAttributes:requestedAttributes:requestID:replyHandler:");
}

id objc_msgSend_fileDescriptor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileDescriptor");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:isDirectory:");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSystemRepresentation");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_fileno(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileno");
}

id objc_msgSend_findNode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "findNode:");
}

id objc_msgSend_findNode_nascentOk_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "findNode:nascentOk:");
}

id objc_msgSend_first(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "first");
}

id objc_msgSend_forgetLiveFilesVolumeForProvider_volume_withFlags_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "forgetLiveFilesVolumeForProvider:volume:withFlags:handler:");
}

id objc_msgSend_forgetModuleVolumeWithFlags_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "forgetModuleVolumeWithFlags:reply:");
}

id objc_msgSend_forgetVolume_withFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "forgetVolume:withFlags:");
}

id objc_msgSend_formatResource_options_connection_taskID_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "formatResource:options:connection:taskID:replyHandler:");
}

id objc_msgSend_formatWithOptions_connection_taskID_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "formatWithOptions:connection:taskID:replyHandler:");
}

id objc_msgSend_freeBytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "freeBytes");
}

id objc_msgSend_freeFiles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "freeFiles");
}

id objc_msgSend_fs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fs");
}

id objc_msgSend_fsObjWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fsObjWithErrorHandler:");
}

id objc_msgSend_fsSynchObjWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fsSynchObjWithErrorHandler:");
}

id objc_msgSend_fs_containerIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fs_containerIdentifier");
}

id objc_msgSend_fs_filter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fs_filter:");
}

id objc_msgSend_fs_map_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fs_map:");
}

id objc_msgSend_fs_volumeIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fs_volumeIdentifier");
}

id objc_msgSend_fullPathForRelativePath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fullPathForRelativePath:");
}

id objc_msgSend_getBundleIDFromShortName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBundleIDFromShortName:");
}

id objc_msgSend_getCurrentAgentForUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCurrentAgentForUID:");
}

id objc_msgSend_getExtensionModuleFromID_forToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getExtensionModuleFromID:forToken:");
}

id objc_msgSend_getInitiatorBundleIDForToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getInitiatorBundleIDForToken:");
}

id objc_msgSend_getInitiatorSigningIDForToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getInitiatorSigningIDForToken:");
}

id objc_msgSend_getInstancesInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getInstancesInfo");
}

id objc_msgSend_getLiveFSClientForProvider_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getLiveFSClientForProvider:handler:");
}

id objc_msgSend_getLiveFilesConnectionForPath_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getLiveFilesConnectionForPath:withCompletionHandler:");
}

id objc_msgSend_getLiveFilesConnectionForProvider_volume_withHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getLiveFilesConnectionForProvider:volume:withHandler:");
}

id objc_msgSend_getMainDASession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getMainDASession");
}

id objc_msgSend_getNSXPCListenerEndpoint_instanceID_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getNSXPCListenerEndpoint:instanceID:replyHandler:");
}

id objc_msgSend_getNSXPCListenerEndpoint_instanceID_uid_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getNSXPCListenerEndpoint:instanceID:uid:replyHandler:");
}

id objc_msgSend_getProgressPortForTask_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getProgressPortForTask:replyHandler:");
}

id objc_msgSend_getRealResource_auditToken_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getRealResource:auditToken:reply:");
}

id objc_msgSend_getResource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getResource:");
}

id objc_msgSend_getResourceID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getResourceID");
}

id objc_msgSend_getResourceState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getResourceState:");
}

id objc_msgSend_getResources(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getResources");
}

id objc_msgSend_getRootFileHandle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getRootFileHandle:");
}

id objc_msgSend_getRootFileHandleWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getRootFileHandleWithError:");
}

id objc_msgSend_getTaskUUIDs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getTaskUUIDs:");
}

id objc_msgSend_getVolumeEndpoint_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getVolumeEndpoint:replyHandler:");
}

id objc_msgSend_getattr(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getattr");
}

id objc_msgSend_handleConnectionInterrupted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleConnectionInterrupted");
}

id objc_msgSend_handleConnectionInvalidated(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleConnectionInvalidated");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_indexOfObjectPassingTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexOfObjectPassingTest:");
}

id objc_msgSend_initForBundle_user_instance_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initForBundle:user:instance:");
}

id objc_msgSend_initForEntitledClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initForEntitledClient:");
}

id objc_msgSend_initFresh(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initFresh");
}

id objc_msgSend_initToUser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initToUser:");
}

id objc_msgSend_initWithBytes_length_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBytes:length:encoding:");
}

id objc_msgSend_initWithConnection_errorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithConnection:errorHandler:");
}

id objc_msgSend_initWithFS_name_parent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFS:name:parent:");
}

id objc_msgSend_initWithFS_name_parent_locked_mountID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFS:name:parent:locked:mountID:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIdentifier:");
}

id objc_msgSend_initWithIdentifier_displayName_pathRelativeToDocumentStorage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIdentifier:displayName:pathRelativeToDocumentStorage:");
}

id objc_msgSend_initWithIdentifier_displayName_pathRelativeToDocumentStorage_hidden_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIdentifier:displayName:pathRelativeToDocumentStorage:hidden:");
}

id objc_msgSend_initWithLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLength:");
}

id objc_msgSend_initWithListenerEndpoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithListenerEndpoint:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithMachServiceName_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:options:");
}

id objc_msgSend_initWithName_fileSystem_displayName_storageName_provider_path_mountID_auditToken_mntTable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:fileSystem:displayName:storageName:provider:path:mountID:auditToken:mntTable:");
}

id objc_msgSend_initWithObject_path_mntTable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithObject:path:mntTable:");
}

id objc_msgSend_initWithPID_flags_reason_name_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPID:flags:reason:name:");
}

id objc_msgSend_initWithProbeList_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithProbeList:");
}

id objc_msgSend_initWithProcessIdentifier_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithProcessIdentifier:context:");
}

id objc_msgSend_initWithProxy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithProxy:");
}

id objc_msgSend_initWithRootPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRootPath:");
}

id objc_msgSend_initWithSyncConnection_errorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSyncConnection:errorHandler:");
}

id objc_msgSend_initWithToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithToken:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_initiatorAuditToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initiatorAuditToken");
}

id objc_msgSend_installedExtensionWithShortName_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installedExtensionWithShortName:replyHandler:");
}

id objc_msgSend_instanceAuditToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "instanceAuditToken");
}

id objc_msgSend_instanceConfig(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "instanceConfig");
}

id objc_msgSend_instanceID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "instanceID");
}

id objc_msgSend_instanceKeyFor_bundleID_instanceID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "instanceKeyFor:bundleID:instanceID:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_interfaceForListeners(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceForListeners");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isAbsolutePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAbsolutePath");
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEnabled");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFSKitModule(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFSKitModule");
}

id objc_msgSend_isMountAtPath_err_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMountAtPath:err:");
}

id objc_msgSend_isOurUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isOurUID");
}

id objc_msgSend_isSystem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSystem");
}

id objc_msgSend_isVolumeIDUsed_bundle_user_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isVolumeIDUsed:bundle:user:replyHandler:");
}

id objc_msgSend_isWritable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isWritable");
}

id objc_msgSend_isWritableFileAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isWritableFileAtPath:");
}

id objc_msgSend_is_connected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "is_connected");
}

id objc_msgSend_is_in_unmount_method(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "is_in_unmount_method");
}

id objc_msgSend_is_in_unmount_syscall(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "is_in_unmount_syscall");
}

id objc_msgSend_is_inet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "is_inet");
}

id objc_msgSend_is_killing_io(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "is_killing_io");
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyEnumerator");
}

id objc_msgSend_kind(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "kind");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_lengthOfBytesUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lengthOfBytesUsingEncoding:");
}

id objc_msgSend_list_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "list:");
}

id objc_msgSend_listXattrsOf_requestID_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "listXattrsOf:requestID:reply:");
}

id objc_msgSend_listXattrsOf_requestID_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "listXattrsOf:requestID:replyHandler:");
}

id objc_msgSend_listenerForVolume_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "listenerForVolume:error:");
}

id objc_msgSend_load_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "load:");
}

id objc_msgSend_loadModulesAndMonitor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadModulesAndMonitor");
}

id objc_msgSend_loadResource_options_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadResource:options:replyHandler:");
}

id objc_msgSend_loadResource_usingBundle_options_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadResource:usingBundle:options:replyHandler:");
}

id objc_msgSend_localizedCaseInsensitiveContainsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedCaseInsensitiveContainsString:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_localizedStandardCompare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStandardCompare:");
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lock");
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longValue");
}

id objc_msgSend_lookup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lookup:");
}

id objc_msgSend_lookupByPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lookupByPath:");
}

id objc_msgSend_lookupIn_name_flags_requestID_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lookupIn:name:flags:requestID:replyHandler:");
}

id objc_msgSend_lookupIn_name_usingFlags_requestID_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lookupIn:name:usingFlags:requestID:reply:");
}

id objc_msgSend_lookupName_provider_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lookupName:provider:");
}

id objc_msgSend_lookupNode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lookupNode:");
}

id objc_msgSend_machPort(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "machPort");
}

id objc_msgSend_makeCloneOf_named_inDirectory_attributes_usingFlags_requestID_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeCloneOf:named:inDirectory:attributes:usingFlags:requestID:reply:");
}

id objc_msgSend_makeCloneOf_named_inDirectory_attributes_usingFlags_requestID_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeCloneOf:named:inDirectory:attributes:usingFlags:requestID:replyHandler:");
}

id objc_msgSend_makeDirectoryIn_named_attributes_requestID_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeDirectoryIn:named:attributes:requestID:reply:");
}

id objc_msgSend_makeLinkOf_named_inDirectory_requestID_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeLinkOf:named:inDirectory:requestID:reply:");
}

id objc_msgSend_makeLinkOf_named_inDirectory_requestID_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeLinkOf:named:inDirectory:requestID:replyHandler:");
}

id objc_msgSend_makeSymLinkIn_named_contents_attributes_requestID_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeSymLinkIn:named:contents:attributes:requestID:reply:");
}

id objc_msgSend_makeSymlinkIn_named_contents_attributes_requestID_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeSymlinkIn:named:contents:attributes:requestID:replyHandler:");
}

id objc_msgSend_midx(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "midx");
}

id objc_msgSend_mkDir_fhBuffer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mkDir:fhBuffer:");
}

id objc_msgSend_mkDirPlaceholder_fhBuffer_wellKnownMount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mkDirPlaceholder:fhBuffer:wellKnownMount:");
}

id objc_msgSend_mkMountPath_mountID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mkMountPath:mountID:");
}

id objc_msgSend_mntOn(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mntOn");
}

id objc_msgSend_mnt_flags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mnt_flags");
}

id objc_msgSend_moduleForBundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moduleForBundleID:");
}

id objc_msgSend_mount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mount:");
}

id objc_msgSend_mount_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mount:options:");
}

id objc_msgSend_mountVolume_displayName_provider_domainError_on_how_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mountVolume:displayName:provider:domainError:on:how:reply:");
}

id objc_msgSend_mountVolume_fileSystem_displayName_provider_domainError_on_how_options_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mountVolume:fileSystem:displayName:provider:domainError:on:how:options:reply:");
}

id objc_msgSend_mounts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mounts");
}

id objc_msgSend_mtime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mtime");
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableBytes");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_nameWithCString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nameWithCString:");
}

id objc_msgSend_nascent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nascent");
}

id objc_msgSend_newByCopyingPort_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newByCopyingPort:");
}

id objc_msgSend_newConnectionForService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newConnectionForService:");
}

id objc_msgSend_newContainerID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newContainerID");
}

id objc_msgSend_newForBundle_user_instance_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newForBundle:user:instance:");
}

id objc_msgSend_newForBundle_user_instanceUUID_instanceID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newForBundle:user:instanceUUID:instanceID:");
}

id objc_msgSend_newWithConnection_errorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newWithConnection:errorHandler:");
}

id objc_msgSend_newWithName_fileSystem_displayName_storageName_provider_path_mountID_auditToken_mntTable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newWithName:fileSystem:displayName:storageName:provider:path:mountID:auditToken:mntTable:");
}

id objc_msgSend_newWithObject_path_mntTable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newWithObject:path:mntTable:");
}

id objc_msgSend_newWithProxy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newWithProxy:");
}

id objc_msgSend_newWithSyncConnection_errorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newWithSyncConnection:errorHandler:");
}

id objc_msgSend_newXPCConnectionWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newXPCConnectionWithError:");
}

id objc_msgSend_nextFileHandle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextFileHandle");
}

id objc_msgSend_nextIndex(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextIndex");
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextObject");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithLong:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
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

id objc_msgSend_open_withMode_requestID_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "open:withMode:requestID:reply:");
}

id objc_msgSend_open_withMode_requestID_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "open:withMode:requestID:replyHandler:");
}

id objc_msgSend_openWithBSDName_writable_auditToken_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openWithBSDName:writable:auditToken:replyHandler:");
}

id objc_msgSend_optionWithoutValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "optionWithoutValue:");
}

id objc_msgSend_otherAttributeOf_named_requestID_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "otherAttributeOf:named:requestID:reply:");
}

id objc_msgSend_otherAttributeOf_named_requestID_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "otherAttributeOf:named:requestID:replyHandler:");
}

id objc_msgSend_ourConn(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ourConn");
}

id objc_msgSend_parent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parent");
}

id objc_msgSend_parentsAndAttributesForItemsByID_requestID_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parentsAndAttributesForItemsByID:requestID:replyHandler:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathComponents");
}

id objc_msgSend_pathConfiguration_requestID_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathConfiguration:requestID:reply:");
}

id objc_msgSend_pathConfigurationOf_propertyName_requestID_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathConfigurationOf:propertyName:requestID:replyHandler:");
}

id objc_msgSend_performExclusive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performExclusive:");
}

id objc_msgSend_performExclusiveMemFS_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performExclusiveMemFS:");
}

id objc_msgSend_performShared_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performShared:");
}

id objc_msgSend_performSharedMemFS_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performSharedMemFS:");
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pid");
}

id objc_msgSend_pidversion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pidversion");
}

id objc_msgSend_postTaskStatusUpdate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postTaskStatusUpdate:");
}

id objc_msgSend_preflightMountWithName_displayName_storageName_provider_path_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preflightMountWithName:displayName:storageName:provider:path:error:");
}

id objc_msgSend_probeResource_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "probeResource:replyHandler:");
}

id objc_msgSend_providerID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "providerID");
}

id objc_msgSend_providerName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "providerName");
}

id objc_msgSend_proxyResourceForBSDName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proxyResourceForBSDName:");
}

id objc_msgSend_rbs_pid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rbs_pid");
}

id objc_msgSend_readDirAtCookie_withVerifier_forBytes_andError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readDirAtCookie:withVerifier:forBytes:andError:");
}

id objc_msgSend_readDirAttrAtCookie_withVerifier_forBytes_andError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readDirAttrAtCookie:withVerifier:forBytes:andError:");
}

id objc_msgSend_readDirectory_intoBuffer_cookie_verifier_requestID_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readDirectory:intoBuffer:cookie:verifier:requestID:reply:");
}

id objc_msgSend_readDirectory_intoBuffer_cookie_verifier_requestID_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readDirectory:intoBuffer:cookie:verifier:requestID:replyHandler:");
}

id objc_msgSend_readDirectory_intoBuffer_requestedAttributes_cookie_verifier_requestID_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readDirectory:intoBuffer:requestedAttributes:cookie:verifier:requestID:reply:");
}

id objc_msgSend_readDirectory_requestedAttributes_intoBuffer_cookie_verifier_requestID_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readDirectory:requestedAttributes:intoBuffer:cookie:verifier:requestID:replyHandler:");
}

id objc_msgSend_readFrom_atOffset_intoBuffer_requestID_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readFrom:atOffset:intoBuffer:requestID:reply:");
}

id objc_msgSend_readFrom_atOffset_intoBuffer_requestID_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readFrom:atOffset:intoBuffer:requestID:replyHandler:");
}

id objc_msgSend_readLinkOf_requestID_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readLinkOf:requestID:reply:");
}

id objc_msgSend_readSymbolicLinkOf_requestID_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readSymbolicLinkOf:requestID:replyHandler:");
}

id objc_msgSend_reclaim_requestID_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reclaim:requestID:reply:");
}

id objc_msgSend_reclaim_requestID_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reclaim:requestID:replyHandler:");
}

id objc_msgSend_refreshPath_displayName_storageName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "refreshPath:displayName:storageName:");
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteObjectProxy");
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_remove_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remove:");
}

id objc_msgSend_removeBundleFromEnabledModules_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeBundleFromEnabledModules:");
}

id objc_msgSend_removeDirectory_from_named_usingFlags_requestID_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeDirectory:from:named:usingFlags:requestID:reply:");
}

id objc_msgSend_removeDirectory_from_named_usingFlags_requestID_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeDirectory:from:named:usingFlags:requestID:replyHandler:");
}

id objc_msgSend_removeDomain_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeDomain:completionHandler:");
}

id objc_msgSend_removeDomain_provider_how_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeDomain:provider:how:reply:");
}

id objc_msgSend_removeItem_from_named_usingFlags_requestID_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItem:from:named:usingFlags:requestID:reply:");
}

id objc_msgSend_removeItem_from_named_usingFlags_requestID_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItem:from:named:usingFlags:requestID:replyHandler:");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeMountNamed_provider_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeMountNamed:provider:");
}

id objc_msgSend_removeMountTask(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeMountTask");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectsInArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectsInArray:");
}

id objc_msgSend_removeReferencesToTask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeReferencesToTask:");
}

id objc_msgSend_removeResource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeResource:");
}

id objc_msgSend_removeResourceID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeResourceID:");
}

id objc_msgSend_removeTaskID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeTaskID:");
}

id objc_msgSend_removeTaskUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeTaskUUID:");
}

id objc_msgSend_renameFrom_toName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "renameFrom:toName:");
}

id objc_msgSend_renameItemIn_named_item_toDirectory_newName_toItem_usingFlags_requestID_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "renameItemIn:named:item:toDirectory:newName:toItem:usingFlags:requestID:reply:");
}

id objc_msgSend_renameItemIn_named_item_toDirectory_newName_toItem_usingFlags_requestID_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "renameItemIn:named:item:toDirectory:newName:toItem:usingFlags:requestID:replyHandler:");
}

id objc_msgSend_replaceObjectAtIndex_withObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replaceObjectAtIndex:withObject:");
}

id objc_msgSend_replenishSearchCreditsFor_credits_requestID_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replenishSearchCreditsFor:credits:requestID:replyHandler:");
}

id objc_msgSend_resetIndex(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetIndex");
}

id objc_msgSend_resourceIDs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resourceIDs");
}

id objc_msgSend_resourceManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resourceManager");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_revoke(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "revoke");
}

id objc_msgSend_rmDir_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rmDir:");
}

id objc_msgSend_rmNode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rmNode:");
}

id objc_msgSend_rootLIFileHandle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rootLIFileHandle");
}

id objc_msgSend_rootNode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rootNode");
}

id objc_msgSend_ruid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ruid");
}

id objc_msgSend_save_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "save:");
}

id objc_msgSend_search_token_criteria_resumeAt_maxData_maxDelay_initialCredits_requestID_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "search:token:criteria:resumeAt:maxData:maxDelay:initialCredits:requestID:replyHandler:");
}

id objc_msgSend_second(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "second");
}

id objc_msgSend_serializedError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serializedError:");
}

id objc_msgSend_setBundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBundleID:");
}

id objc_msgSend_setConnected_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnected:completionHandler:");
}

id objc_msgSend_setContainsPhotos_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContainsPhotos:");
}

id objc_msgSend_setCurrentState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentState:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDomainError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDomainError:");
}

id objc_msgSend_setEnabledStateForToken_identifier_newState_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnabledStateForToken:identifier:newState:replyHandler:");
}

id objc_msgSend_setErasable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setErasable:");
}

id objc_msgSend_setError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setError:");
}

id objc_msgSend_setExplanation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExplanation:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setFSKitAdditions_disk_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFSKitAdditions:disk:replyHandler:");
}

id objc_msgSend_setFileAttributesOf_to_requestID_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFileAttributesOf:to:requestID:reply:");
}

id objc_msgSend_setFileAttributesOf_to_requestID_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFileAttributesOf:to:requestID:replyHandler:");
}

id objc_msgSend_setFileno_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFileno:");
}

id objc_msgSend_setIdleTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdleTimer:");
}

id objc_msgSend_setIdleTimerLocked_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdleTimerLocked:");
}

id objc_msgSend_setInstanceConfig_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInstanceConfig:");
}

id objc_msgSend_setInstanceDeathHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInstanceDeathHandler:");
}

id objc_msgSend_setInstanceUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInstanceUUID:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setIs_in_unmount_syscall_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIs_in_unmount_syscall:");
}

id objc_msgSend_setIs_inet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIs_inet:");
}

id objc_msgSend_setIs_killing_io_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIs_killing_io:");
}

id objc_msgSend_setLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLength:");
}

id objc_msgSend_setMainMachPort_forDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMainMachPort:forDomain:");
}

id objc_msgSend_setModulesLoaded_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModulesLoaded:");
}

id objc_msgSend_setModulesUnloaded_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModulesUnloaded:");
}

id objc_msgSend_setNascent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNascent:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOtherAttributeOf_named_value_requestID_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOtherAttributeOf:named:value:requestID:reply:");
}

id objc_msgSend_setOtherAttributeOf_named_value_requestID_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOtherAttributeOf:named:value:requestID:replyHandler:");
}

id objc_msgSend_setOurConn_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOurConn:");
}

id objc_msgSend_setOurInstance_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOurInstance:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setState:");
}

id objc_msgSend_setTaskInitiatorID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTaskInitiatorID:");
}

id objc_msgSend_setTaskReferenceHolder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTaskReferenceHolder:");
}

id objc_msgSend_setTaskSigningID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTaskSigningID:");
}

id objc_msgSend_setTerminateExtensionWhenFinished_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTerminateExtensionWhenFinished:");
}

id objc_msgSend_setUpdateInterest_interest_requestID_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpdateInterest:interest:requestID:replyHandler:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setXattrOf_named_value_how_requestID_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setXattrOf:named:value:how:requestID:reply:");
}

id objc_msgSend_setXattrOf_named_value_how_requestID_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setXattrOf:named:value:how:requestID:replyHandler:");
}

id objc_msgSend_sleepForTimeInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sleepForTimeInterval:");
}

id objc_msgSend_startExtension_instanceID_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startExtension:instanceID:replyHandler:");
}

id objc_msgSend_startExtension_instanceID_uid_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startExtension:instanceID:uid:replyHandler:");
}

id objc_msgSend_startedWork(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startedWork");
}

id objc_msgSend_startedWorkLocked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startedWorkLocked");
}

id objc_msgSend_stateAsString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateAsString");
}

id objc_msgSend_stopExtension_instanceID_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopExtension:instanceID:replyHandler:");
}

id objc_msgSend_stopExtension_instanceID_uid_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopExtension:instanceID:uid:replyHandler:");
}

id objc_msgSend_storageName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storageName");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "string");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringByStandardizingPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByStandardizingPath");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_strongToWeakObjectsMapTable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "strongToWeakObjectsMapTable");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_supportDirURL_forURL_daemonPrefName_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportDirURL:forURL:daemonPrefName:error:");
}

id objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchronousRemoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_taskBundleID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taskBundleID");
}

id objc_msgSend_taskDescriptionWithID_state_purpose_error_bundleID_extensionID_resource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taskDescriptionWithID:state:purpose:error:bundleID:extensionID:resource:");
}

id objc_msgSend_taskErrorState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taskErrorState");
}

id objc_msgSend_taskExtensionInstanceID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taskExtensionInstanceID");
}

id objc_msgSend_taskID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taskID");
}

id objc_msgSend_taskInitiatorID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taskInitiatorID");
}

id objc_msgSend_taskPurpose(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taskPurpose");
}

id objc_msgSend_taskReferenceHolder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taskReferenceHolder");
}

id objc_msgSend_taskResource(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taskResource");
}

id objc_msgSend_taskSetChanged(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taskSetChanged");
}

id objc_msgSend_taskSigningID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taskSigningID");
}

id objc_msgSend_taskState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taskState");
}

id objc_msgSend_taskStatusUpdate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taskStatusUpdate:");
}

id objc_msgSend_taskUpdateClients(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taskUpdateClients");
}

id objc_msgSend_tasks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tasks");
}

id objc_msgSend_tearDownDaemon_withPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tearDownDaemon:withPath:");
}

id objc_msgSend_terminate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "terminate");
}

id objc_msgSend_terminateExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "terminateExtension");
}

id objc_msgSend_terminateExtensionWhenFinished(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "terminateExtensionWhenFinished");
}

id objc_msgSend_third(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "third");
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSince1970");
}

id objc_msgSend_token(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "token");
}

id objc_msgSend_tokenWithToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tokenWithToken:");
}

id objc_msgSend_totalBytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "totalBytes");
}

id objc_msgSend_totalFiles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "totalFiles");
}

id objc_msgSend_tripleWith_second_third_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tripleWith:second:third:");
}

id objc_msgSend_uid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uid");
}

id objc_msgSend_unloadResource_options_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unloadResource:options:replyHandler:");
}

id objc_msgSend_unloadResource_usingBundle_options_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unloadResource:usingBundle:options:replyHandler:");
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unlock");
}

id objc_msgSend_unmount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unmount:");
}

id objc_msgSend_unmountPostflight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unmountPostflight:");
}

id objc_msgSend_unmountPreflight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unmountPreflight:");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_updateDomain_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateDomain:reply:");
}

id objc_msgSend_updateErrorStateForVolume_provider_domainError_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateErrorStateForVolume:provider:domainError:reply:");
}

id objc_msgSend_updateMountEntry_provider_settingsDictionary_updateBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateMountEntry:provider:settingsDictionary:updateBlock:");
}

id objc_msgSend_updateResource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateResource:");
}

id objc_msgSend_updatedDescriptionInState_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updatedDescriptionInState:error:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uuid");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_verf(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "verf");
}

id objc_msgSend_volumeID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "volumeID");
}

id objc_msgSend_volumeIDs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "volumeIDs");
}

id objc_msgSend_volumeMountedAtURL_withOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "volumeMountedAtURL:withOptions:");
}

id objc_msgSend_volumeName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "volumeName");
}

id objc_msgSend_volumeStatistics_requestID_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "volumeStatistics:requestID:reply:");
}

id objc_msgSend_volumeStatistics_requestID_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "volumeStatistics:requestID:replyHandler:");
}

id objc_msgSend_weDied(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "weDied");
}

id objc_msgSend_wipeFS_includingRanges_excludingRanges_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wipeFS:includingRanges:excludingRanges:replyHandler:");
}

id objc_msgSend_writeTo_atOffset_fromBuffer_requestID_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeTo:atOffset:fromBuffer:requestID:reply:");
}

id objc_msgSend_writeTo_atOffset_fromBuffer_requestID_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeTo:atOffset:fromBuffer:requestID:replyHandler:");
}

id objc_msgSend_writeTo_atOffset_sharedBuffer_requestID_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeTo:atOffset:sharedBuffer:requestID:reply:");
}

id objc_msgSend_writeToURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:error:");
}

id objc_msgSend_xattrOf_named_requestID_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xattrOf:named:requestID:reply:");
}

id objc_msgSend_xattrOf_named_requestID_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xattrOf:named:requestID:replyHandler:");
}
