@implementation UMDVolumeHelper

- (void)createVolumeMountsDir:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  NSObject *v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  unsigned __int8 v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  const char *v23;
  char *v24;
  uint64_t v25;
  int v26;
  id v27;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UMDVolumeHelper se](self, "se"));
  v6 = sub_100007EF0((uint64_t)v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v7, "fileExistsAtPath:isDirectory:", v4, 0);

  if (v8)
  {
    if (qword_1000E01D0 != -1)
      dispatch_once(&qword_1000E01D0, &stru_1000D1C70);
    v9 = (id)qword_1000E01C8;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v25 = 0;
      v10 = sub_100007750(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        v11 = v10;
      else
        v11 = v10 & 0xFFFFFFFE;
      if ((_DWORD)v11)
      {
LABEL_9:
        v26 = 138543362;
        v27 = v4;
        goto LABEL_36;
      }
LABEL_38:
      v24 = 0;
LABEL_39:
      free(v24);
      goto LABEL_40;
    }
    goto LABEL_40;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UMDVolumeHelper se](self, "se"));
  v13 = sub_100007EF0((uint64_t)v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = objc_msgSend(v14, "makePath:mode:error:", v4, 511, 0);

  if ((v15 & 1) == 0)
  {
    if (qword_1000E01D0 != -1)
      dispatch_once(&qword_1000E01D0, &stru_1000D1C70);
    v9 = (id)qword_1000E01C8;
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_40;
    v25 = 0;
    v21 = sub_100007750(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      v11 = v21;
    else
      v11 = v21 & 0xFFFFFFFE;
    if (!(_DWORD)v11)
      goto LABEL_38;
    v26 = 138543362;
    v27 = v4;
LABEL_36:
    v23 = (const char *)_os_log_send_and_compose_impl(v11, &v25, 0, 0);
    v24 = (char *)v23;
    if (v23)
      sub_100007780(v23);
    goto LABEL_39;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UMDVolumeHelper se](self, "se"));
  v17 = sub_100007EF0((uint64_t)v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = objc_msgSend(v18, "chmodPath:withMode:error:", v4, 511, 0);

  if ((v19 & 1) == 0)
  {
    if (qword_1000E01D0 != -1)
      dispatch_once(&qword_1000E01D0, &stru_1000D1C70);
    v9 = (id)qword_1000E01C8;
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_40;
    v25 = 0;
    v22 = sub_100007750(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      v11 = v22;
    else
      v11 = v22 & 0xFFFFFFFE;
    if (!(_DWORD)v11)
      goto LABEL_38;
    v26 = 138543362;
    v27 = v4;
    goto LABEL_36;
  }
  if (qword_1000E01D0 != -1)
    dispatch_once(&qword_1000E01D0, &stru_1000D1C70);
  v9 = (id)qword_1000E01C8;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v25 = 0;
    v20 = sub_100007750(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      v11 = v20;
    else
      v11 = v20 & 0xFFFFFFFE;
    if ((_DWORD)v11)
      goto LABEL_9;
    goto LABEL_38;
  }
LABEL_40:

}

- (BOOL)unmountVolumeWithSession:(id)a3 mountPath:(id)a4 error:(int *)a5
{
  id v8;
  id v9;
  id v10;
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
  NSObject *v23;
  unsigned int v24;
  uint64_t v25;
  const char *v26;
  char *v27;
  BOOL v28;
  uint64_t v30;
  int v31;
  int v32;
  void *v33;
  __int16 v34;
  int v35;

  v8 = a3;
  v9 = a4;
  v31 = 0;
  if (a5)
    *a5 = 0;
  v10 = v9;
  v11 = v10;
  if (!v10)
  {
    v12 = sub_1000074C8(v8, (uint64_t)CFSTR("MKBUserSessionHomeDir"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v12);
  }
  if (-[UMDVolumeHelper unmountVolumeWithSession:mountPath:error:force:](self, "unmountVolumeWithSession:mountPath:error:force:", v8, v10, &v31, 0))
  {
    goto LABEL_18;
  }
  if (qword_1000E01D0 != -1)
    dispatch_once(&qword_1000E01D0, &stru_1000D1C70);
  v13 = (id)qword_1000E01C8;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v30 = 0;
    v14 = sub_100007750(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      v15 = v14;
    else
      v15 = v14 & 0xFFFFFFFE;
    if ((_DWORD)v15)
    {
      v32 = 138412546;
      v33 = v11;
      v34 = 1024;
      v35 = v31;
      v16 = (const char *)_os_log_send_and_compose_impl(v15, &v30, 0, 0);
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

  if (-[UMDVolumeHelper unmountVolumeWithSession:mountPath:error:force:](self, "unmountVolumeWithSession:mountPath:error:force:", v8, v10, &v31, 1))
  {
LABEL_18:
    if (qword_1000E01D0 != -1)
      dispatch_once(&qword_1000E01D0, &stru_1000D1C70);
    v18 = (id)qword_1000E01C8;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v30 = 0;
      v19 = sub_100007750(0);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        v20 = v19;
      else
        v20 = v19 & 0xFFFFFFFE;
      if ((_DWORD)v20)
      {
        v32 = 138412290;
        v33 = v11;
        v21 = (const char *)_os_log_send_and_compose_impl(v20, &v30, 0, 0);
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

    v28 = 1;
  }
  else
  {
    if (qword_1000E01D0 != -1)
      dispatch_once(&qword_1000E01D0, &stru_1000D1C70);
    v23 = (id)qword_1000E01C8;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v30 = 0;
      v24 = sub_100007750(0);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        v25 = v24;
      else
        v25 = v24 & 0xFFFFFFFE;
      if ((_DWORD)v25)
      {
        v32 = 138412546;
        v33 = v11;
        v34 = 1024;
        v35 = v31;
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

    v28 = 0;
    if (a5)
      *a5 = v31;
  }

  return v28;
}

- (BOOL)createVolumeWithSession:(id)a3 size:(int64_t)a4 userName:(id)a5 error:(int *)a6 forPersona:(BOOL)a7 userDataVolume:(BOOL)a8
{
  id v9;
  id v10;
  BOOL result;

  v9 = a3;
  v10 = a5;
  result = _os_crash("This should never be called");
  __break(1u);
  return result;
}

- (BOOL)deleteVolumeWithSession:(id)a3 error:(int *)a4
{
  id v4;
  BOOL result;

  v4 = a3;
  result = _os_crash("This should never be called");
  __break(1u);
  return result;
}

- (BOOL)mountVolumeWithSession:(id)a3 mountPath:(id)a4 error:(int *)a5 forPersona:(BOOL)a6
{
  id v7;
  id v8;
  BOOL result;

  v7 = a3;
  v8 = a4;
  result = _os_crash("This should never be called");
  __break(1u);
  return result;
}

- (BOOL)unmountVolumeWithSession:(id)a3 mountPath:(id)a4 error:(int *)a5 force:(BOOL)a6
{
  id v7;
  id v8;
  BOOL result;

  v7 = a3;
  v8 = a4;
  result = _os_crash("This should never be called");
  __break(1u);
  return result;
}

- (BOOL)isVolumeMountedWithSession:(id)a3 fsid:(fsid *)a4
{
  id v4;
  BOOL result;

  v4 = a3;
  result = _os_crash("This should never be called");
  __break(1u);
  return result;
}

- (UMDSideEffects)se
{
  return self->_se;
}

- (BOOL)splitUserVolumeEnabled
{
  return self->_splitUserVolumeEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_se, 0);
}

@end
