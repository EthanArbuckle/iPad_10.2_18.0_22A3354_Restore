@implementation UMKPersonaProvider

- (id)infoForProcessWithPID:(int)a3 error:(id *)a4
{
  int v6;
  NSObject *v7;
  unsigned int v8;
  uint64_t v9;
  const char *v10;
  char *v11;
  id v12;
  void *v13;
  NSObject *v14;
  unsigned int v15;
  uint64_t v16;
  NSObject *v17;
  int v18;
  int v19;
  const char *v20;
  id v21;
  void *v22;
  int v23;
  char *v24;
  NSObject *v25;
  unsigned int v26;
  uint64_t v27;
  const char *v28;
  char *v29;
  id v31;
  _QWORD __dst[44];
  uint64_t v33;
  _DWORD __src[87];

  if (a4)
    *a4 = 0;
  memset(&__src[1], 0, 344);
  __src[0] = 2;
  if (kpersona_pidinfo(*(_QWORD *)&a3, __src))
  {
    v6 = *__error();
    if (qword_1000E01C0 != -1)
      dispatch_once(&qword_1000E01C0, &stru_1000D1C50);
    v7 = (id)qword_1000E01B8;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v33 = 0;
      v8 = sub_100007750(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        v9 = v8;
      else
        v9 = v8 & 0xFFFFFFFE;
      if ((_DWORD)v9)
      {
        LODWORD(__dst[0]) = 67109376;
        HIDWORD(__dst[0]) = a3;
        LOWORD(__dst[1]) = 1024;
        *(_DWORD *)((char *)&__dst[1] + 2) = v6;
        v10 = (const char *)_os_log_send_and_compose_impl(v9, &v33, 0, 0);
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

    if (a4)
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v6, 0));
    return 0;
  }
  else
  {
    memcpy(__dst, __src, 0x15CuLL);
    v12 = sub_100006150((uint64_t)UMKPersonaInfo, (int *)__dst);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if (v13)
    {
      if (qword_1000E01C0 != -1)
        dispatch_once(&qword_1000E01C0, &stru_1000D1C50);
      v14 = (id)qword_1000E01B8;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v33 = 0;
        v15 = sub_100007750(0);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          v16 = v15;
        else
          v16 = v15 & 0xFFFFFFFE;
        if ((_DWORD)v16)
        {
          v17 = v14;
          v18 = sub_100007ECC((uint64_t)v13);
          v19 = sub_1000063CC((uint64_t)v13);
          v21 = sub_100076DC0(v13, v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
          v23 = sub_1000055AC((uint64_t)v13);
          LODWORD(__dst[0]) = 67110146;
          HIDWORD(__dst[0]) = a3;
          LOWORD(__dst[1]) = 1024;
          *(_DWORD *)((char *)&__dst[1] + 2) = v18;
          HIWORD(__dst[1]) = 1024;
          LODWORD(__dst[2]) = v19;
          WORD2(__dst[2]) = 2114;
          *(_QWORD *)((char *)&__dst[2] + 6) = v22;
          HIWORD(__dst[3]) = 1024;
          LODWORD(__dst[4]) = v23;
          v24 = (char *)_os_log_send_and_compose_impl(v16, &v33, 0, 0);

          if (v24)
            sub_100007780(v24);
        }
        else
        {
          v24 = 0;
        }
        free(v24);
      }

      v31 = v13;
    }
    else
    {
      if (qword_1000E01C0 != -1)
        dispatch_once(&qword_1000E01C0, &stru_1000D1C50);
      v25 = (id)qword_1000E01B8;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        __dst[0] = 0;
        v26 = sub_100007750(0);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          v27 = v26;
        else
          v27 = v26 & 0xFFFFFFFE;
        if ((_DWORD)v27)
        {
          LODWORD(v33) = 67109120;
          HIDWORD(v33) = a3;
          v28 = (const char *)_os_log_send_and_compose_impl(v27, __dst, 0, 0);
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

      if (a4)
        *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 34, 0));
    }

    return v13;
  }
}

- (id)infoForPersonaWithID:(unsigned int)a3 error:(id *)a4
{
  int v6;
  NSObject *v7;
  unsigned int v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  unsigned int v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  int v17;
  const char *v18;
  id v19;
  void *v20;
  int v21;
  char *v22;
  unsigned int v23;
  const char *v24;
  char *v25;
  NSObject *v26;
  unsigned int v27;
  uint64_t v28;
  const char *v29;
  char *v30;
  id v32;
  _QWORD __dst[44];
  uint64_t v34;
  _DWORD __src[87];

  if (a4)
    *a4 = 0;
  memset(&__src[1], 0, 344);
  __src[0] = 2;
  if (kpersona_info(*(_QWORD *)&a3, __src))
  {
    v6 = *__error();
    if (v6 == 3)
    {
      if (qword_1000E01C0 != -1)
        dispatch_once(&qword_1000E01C0, &stru_1000D1C50);
      v7 = (id)qword_1000E01B8;
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        goto LABEL_44;
      v34 = 0;
      v8 = sub_100007750(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        v9 = v8;
      else
        v9 = v8 & 0xFFFFFFFE;
      if ((_DWORD)v9)
      {
        LODWORD(__dst[0]) = 67109632;
        HIDWORD(__dst[0]) = a3;
        LOWORD(__dst[1]) = 1024;
        *(_DWORD *)((char *)&__dst[1] + 2) = a3;
        HIWORD(__dst[1]) = 1024;
        LODWORD(__dst[2]) = 3;
        goto LABEL_31;
      }
    }
    else
    {
      if (qword_1000E01C0 != -1)
        dispatch_once(&qword_1000E01C0, &stru_1000D1C50);
      v7 = (id)qword_1000E01B8;
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        goto LABEL_44;
      v34 = 0;
      v23 = sub_100007750(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        v9 = v23;
      else
        v9 = v23 & 0xFFFFFFFE;
      if ((_DWORD)v9)
      {
        LODWORD(__dst[0]) = 67109632;
        HIDWORD(__dst[0]) = a3;
        LOWORD(__dst[1]) = 1024;
        *(_DWORD *)((char *)&__dst[1] + 2) = a3;
        HIWORD(__dst[1]) = 1024;
        LODWORD(__dst[2]) = v6;
LABEL_31:
        v24 = (const char *)_os_log_send_and_compose_impl(v9, &v34, 0, 0);
        v25 = (char *)v24;
        if (v24)
          sub_100007780(v24);
        goto LABEL_43;
      }
    }
    v25 = 0;
LABEL_43:
    free(v25);
LABEL_44:

    if (a4)
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v6, 0));
    return 0;
  }
  memcpy(__dst, __src, 0x15CuLL);
  v10 = sub_100006150((uint64_t)UMKPersonaInfo, (int *)__dst);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if (v11)
  {
    if (qword_1000E01C0 != -1)
      dispatch_once(&qword_1000E01C0, &stru_1000D1C50);
    v12 = (id)qword_1000E01B8;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v34 = 0;
      v13 = sub_100007750(0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        v14 = v13;
      else
        v14 = v13 & 0xFFFFFFFE;
      if ((_DWORD)v14)
      {
        v15 = v12;
        v16 = sub_100007ECC((uint64_t)v11);
        v17 = sub_1000063CC((uint64_t)v11);
        v19 = sub_100076DC0(v11, v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
        v21 = sub_1000055AC((uint64_t)v11);
        LODWORD(__dst[0]) = 67109890;
        HIDWORD(__dst[0]) = v16;
        LOWORD(__dst[1]) = 1024;
        *(_DWORD *)((char *)&__dst[1] + 2) = v17;
        HIWORD(__dst[1]) = 2114;
        __dst[2] = v20;
        LOWORD(__dst[3]) = 1024;
        *(_DWORD *)((char *)&__dst[3] + 2) = v21;
        v22 = (char *)_os_log_send_and_compose_impl(v14, &v34, 0, 0);

        if (v22)
          sub_100007780(v22);
      }
      else
      {
        v22 = 0;
      }
      free(v22);
    }

    v32 = v11;
  }
  else
  {
    if (qword_1000E01C0 != -1)
      dispatch_once(&qword_1000E01C0, &stru_1000D1C50);
    v26 = (id)qword_1000E01B8;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      __dst[0] = 0;
      v27 = sub_100007750(0);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        v28 = v27;
      else
        v28 = v27 & 0xFFFFFFFE;
      if ((_DWORD)v28)
      {
        LODWORD(v34) = 67109120;
        HIDWORD(v34) = a3;
        v29 = (const char *)_os_log_send_and_compose_impl(v28, __dst, 0, 0);
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

    if (a4)
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 34, 0));
  }

  return v11;
}

- (BOOL)allocatePersonaWithInfo:(id)a3 andPath:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  double v9;
  int v10;
  NSObject *v11;
  unsigned int v12;
  uint64_t v13;
  NSObject *v14;
  unsigned int v15;
  uint64_t v16;
  const char *v17;
  char *v18;
  unsigned int v19;
  const char *v20;
  char *v21;
  NSObject *v22;
  unsigned int v23;
  uint64_t v24;
  const char *v25;
  char *v26;
  int v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  int v31;
  char *v32;
  NSErrorDomain v33;
  uint64_t v34;
  BOOL v35;
  NSObject *v36;
  unsigned int v37;
  uint64_t v38;
  NSObject *v39;
  int v40;
  int v41;
  const char *v42;
  id v43;
  char *v44;
  int v45;
  char *v46;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  _BYTE v52[12];
  uint64_t v53;
  __int16 v54;
  int v55;
  __int16 v56;
  char *v57;
  __int16 v58;
  int v59;
  __int16 v60;
  id v61;
  __int16 v62;
  int v63;
  _OWORD v64[22];

  v7 = a3;
  v8 = a4;
  if (a5)
    *a5 = 0;
  v51 = 0;
  memset(v64, 0, 348);
  v9 = sub_100083DAC(v7, (uint64_t)v64);
  if (!LODWORD(v64[0]))
  {
    if (qword_1000E01C0 != -1)
      dispatch_once(&qword_1000E01C0, &stru_1000D1C50);
    v14 = (id)qword_1000E01B8;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v53 = 0;
      v15 = sub_100007750(0);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        v16 = v15;
      else
        v16 = v15 & 0xFFFFFFFE;
      if ((_DWORD)v16)
      {
        *(_WORD *)v52 = 0;
        LODWORD(v49) = 2;
        v48 = (uint64_t *)v52;
        v17 = (const char *)_os_log_send_and_compose_impl(v16, &v53, 0, 0);
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

    if (a5)
    {
      v33 = NSPOSIXErrorDomain;
      v34 = 22;
LABEL_62:
      v35 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v33, v34, 0, v48, v49));
      goto LABEL_83;
    }
LABEL_67:
    v35 = 0;
    goto LABEL_83;
  }
  if (v8)
  {
    if ((objc_msgSend(v8, "getCString:maxLength:encoding:", &v53, 1024, 4, v9) & 1) == 0)
    {
      if (qword_1000E01C0 != -1)
        dispatch_once(&qword_1000E01C0, &stru_1000D1C50);
      v22 = (id)qword_1000E01B8;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v50 = 0;
        v23 = sub_100007750(0);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          v24 = v23;
        else
          v24 = v23 & 0xFFFFFFFE;
        if ((_DWORD)v24)
        {
          *(_DWORD *)v52 = 138543362;
          *(_QWORD *)&v52[4] = v8;
          v25 = (const char *)_os_log_send_and_compose_impl(v24, &v50, 0, 0);
          v26 = (char *)v25;
          if (v25)
            sub_100007780(v25);
        }
        else
        {
          v26 = 0;
        }
        free(v26);
      }

      if (a5)
        *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0));
      goto LABEL_67;
    }
    if (kpersona_palloc(v64, &v51, &v53))
    {
      v10 = *__error();
      if (qword_1000E01C0 != -1)
        dispatch_once(&qword_1000E01C0, &stru_1000D1C50);
      v11 = (id)qword_1000E01B8;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_QWORD *)v52 = 0;
        v12 = sub_100007750(0);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          v13 = v12;
        else
          v13 = v12 & 0xFFFFFFFE;
        if ((_DWORD)v13)
        {
          LODWORD(v53) = 67110402;
          HIDWORD(v53) = DWORD1(v64[0]);
          v54 = 1024;
          v55 = DWORD2(v64[0]);
          v56 = 2082;
          v57 = (char *)&v64[5] + 8;
          v58 = 1024;
          v59 = DWORD2(v64[21]);
          v60 = 2114;
          v61 = v8;
          v62 = 1024;
          v63 = v10;
          LODWORD(v49) = 46;
          v48 = &v53;
          goto LABEL_33;
        }
        goto LABEL_58;
      }
      goto LABEL_60;
    }
  }
  else if (kpersona_alloc(v64, &v51, v9))
  {
    v10 = *__error();
    if (qword_1000E01C0 != -1)
      dispatch_once(&qword_1000E01C0, &stru_1000D1C50);
    v11 = (id)qword_1000E01B8;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_QWORD *)v52 = 0;
      v19 = sub_100007750(0);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        v13 = v19;
      else
        v13 = v19 & 0xFFFFFFFE;
      if ((_DWORD)v13)
      {
        LODWORD(v53) = 67110146;
        HIDWORD(v53) = DWORD1(v64[0]);
        v54 = 1024;
        v55 = DWORD2(v64[0]);
        v56 = 2082;
        v57 = (char *)&v64[5] + 8;
        v58 = 1024;
        v59 = DWORD2(v64[21]);
        v60 = 1024;
        LODWORD(v61) = v10;
        LODWORD(v49) = 36;
        v48 = &v53;
LABEL_33:
        v20 = (const char *)_os_log_send_and_compose_impl(v13, v52, 0, 0);
        v21 = (char *)v20;
        if (v20)
          sub_100007780(v20);
        goto LABEL_59;
      }
LABEL_58:
      v21 = 0;
LABEL_59:
      free(v21);
    }
LABEL_60:

    if (a5)
    {
      v33 = NSPOSIXErrorDomain;
      v34 = v10;
      goto LABEL_62;
    }
    goto LABEL_67;
  }
  v27 = v51;
  if (v27 != sub_100007ECC((uint64_t)v7))
  {
    if (qword_1000E01C0 != -1)
      dispatch_once(&qword_1000E01C0, &stru_1000D1C50);
    v28 = (id)qword_1000E01B8;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_QWORD *)v52 = 0;
      LODWORD(v29) = sub_100007750(0);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        v29 = v29;
      else
        v29 = v29 & 0xFFFFFFFE;
      if ((_DWORD)v29)
      {
        v30 = v28;
        v31 = sub_100007ECC((uint64_t)v7);
        LODWORD(v53) = 67109376;
        HIDWORD(v53) = v31;
        v54 = 1024;
        v55 = v51;
        v32 = (char *)_os_log_send_and_compose_impl(v29, v52, 0, 0);

        if (v32)
          sub_100007780(v32);
      }
      else
      {
        v32 = 0;
      }
      free(v32);
    }

    sub_100006404((uint64_t)v7, v51);
  }
  if (qword_1000E01C0 != -1)
    dispatch_once(&qword_1000E01C0, &stru_1000D1C50);
  v36 = (id)qword_1000E01B8;
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_QWORD *)v52 = 0;
    v37 = sub_100007750(0);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      v38 = v37;
    else
      v38 = v37 & 0xFFFFFFFE;
    if ((_DWORD)v38)
    {
      v39 = v36;
      v40 = sub_100007ECC((uint64_t)v7);
      v41 = sub_1000063CC((uint64_t)v7);
      v43 = sub_100076DC0(v7, v42);
      v44 = (char *)objc_claimAutoreleasedReturnValue(v43);
      v45 = sub_1000055AC((uint64_t)v7);
      LODWORD(v53) = 67109890;
      HIDWORD(v53) = v40;
      v54 = 1024;
      v55 = v41;
      v56 = 2114;
      v57 = v44;
      v58 = 1024;
      v59 = v45;
      v46 = (char *)_os_log_send_and_compose_impl(v38, v52, 0, 0);

      if (v46)
        sub_100007780(v46);
    }
    else
    {
      v46 = 0;
    }
    free(v46);
  }

  v35 = 1;
LABEL_83:

  return v35;
}

- (BOOL)deallocatePersonaWithID:(unsigned int)a3 error:(id *)a4
{
  int v6;
  int v7;
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
  uint64_t v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  if (a4)
    *a4 = 0;
  v6 = kpersona_dealloc(*(_QWORD *)&a3, a2);
  if (v6)
  {
    v7 = *__error();
    if (qword_1000E01C0 != -1)
      dispatch_once(&qword_1000E01C0, &stru_1000D1C50);
    v8 = (id)qword_1000E01B8;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v24 = 0;
      v9 = sub_100007750(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        v10 = v9;
      else
        v10 = v9 & 0xFFFFFFFE;
      if ((_DWORD)v10)
      {
        LODWORD(v19) = 67109632;
        HIDWORD(v19) = a3;
        v20 = 1024;
        v21 = a3;
        v22 = 1024;
        v23 = v7;
        v11 = (const char *)_os_log_send_and_compose_impl(v10, &v24, 0, 0);
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

    if (a4)
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v7, 0));
  }
  else
  {
    if (qword_1000E01C0 != -1)
      dispatch_once(&qword_1000E01C0, &stru_1000D1C50);
    v13 = (id)qword_1000E01B8;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 0;
      v14 = sub_100007750(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        v15 = v14;
      else
        v15 = v14 & 0xFFFFFFFE;
      if ((_DWORD)v15)
      {
        LODWORD(v24) = 67109120;
        HIDWORD(v24) = a3;
        v16 = (const char *)_os_log_send_and_compose_impl(v15, &v19, 0, 0);
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
  return v6 == 0;
}

@end
