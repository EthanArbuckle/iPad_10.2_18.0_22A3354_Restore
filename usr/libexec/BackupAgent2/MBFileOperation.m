@implementation MBFileOperation

+ (BOOL)openFD:(int *)a3 baseFD:(int)a4 rpath:(id)a5 flags:(int)a6 error:(id *)a7
{
  id v11;
  id v12;
  int v13;
  int v14;
  int *v15;

  v11 = a5;
  if (!a3)
    sub_100087950();
  if (a4 == -1)
    sub_100087978();
  if (!v11)
    sub_1000879A0();
  if (!a6)
    sub_1000879C8();
  v12 = objc_retainAutorelease(v11);
  v13 = openat(a4, (const char *)objc_msgSend(v12, "fileSystemRepresentation"), a6);
  v14 = v13;
  if (v13 < 0)
  {
    v15 = __error();
    if (a7)
      *a7 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithErrno:path:format:](MBError, "errorWithErrno:path:format:", *v15));
  }
  else
  {
    *a3 = v13;
  }

  return v14 >= 0;
}

+ (BOOL)openFD:(int *)a3 path:(id)a4 flags:(int)a5 error:(id *)a6
{
  id v9;
  id v10;
  int v11;
  int v12;
  int *v13;

  v9 = a4;
  if (!a3)
    sub_1000879F0();
  if (!v9)
    sub_100087A18();
  if (!a5)
    sub_100087A40();
  v10 = objc_retainAutorelease(v9);
  v11 = open((const char *)objc_msgSend(v10, "fileSystemRepresentation"), a5);
  v12 = v11;
  if (v11 < 0)
  {
    v13 = __error();
    if (a6)
      *a6 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithErrno:path:format:](MBError, "errorWithErrno:path:format:", *v13));
  }
  else
  {
    *a3 = v11;
  }

  return v12 >= 0;
}

+ (BOOL)closeFD:(int)a3 path:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  int v9;
  int *v10;

  v7 = a4;
  if (a3 == -1)
    sub_100087A68();
  v8 = v7;
  v9 = close(a3);
  if (v9)
  {
    v10 = __error();
    if (a5)
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithErrno:path:format:](MBError, "errorWithErrno:path:format:", *v10));
  }

  return v9 == 0;
}

+ (BOOL)exists:(BOOL *)a3 atBasePath:(id)a4 baseFD:(int)a5 rpath:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;

  v11 = a4;
  v12 = a6;
  if (!a3)
    sub_100087A90();
  if (!v11)
    sub_100087AB8();
  if (a5 == -1)
    sub_100087AE0();
  if (!v12)
    sub_100087B08();
  v13 = objc_retainAutorelease(v12);
  if (faccessat(a5, (const char *)objc_msgSend(v13, "fileSystemRepresentation"), 0, 32))
  {
    v14 = *__error();
    if ((_DWORD)v14 == 2)
    {
      *a3 = 0;
      LOBYTE(a7) = 1;
    }
    else if (a7)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingPathComponent:", v13));
      *a7 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithErrno:path:format:](MBError, "errorWithErrno:path:format:", v14, v15, CFSTR("faccessat() failure %d"), v14));

      LOBYTE(a7) = 0;
    }
  }
  else
  {
    LOBYTE(a7) = 1;
    *a3 = 1;
  }

  return (char)a7;
}

+ (BOOL)rename:(int)a3 sourceRpath:(id)a4 destinationBasePath:(id)a5 destinationBaseFD:(int)a6 destinationRpath:(id)a7 flags:(int)a8 error:(id *)a9
{
  uint64_t v9;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  const char *v19;
  id v20;
  int v21;
  int v22;
  uint64_t v23;
  void *v24;

  v9 = *(_QWORD *)&a8;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  if (a3 == -1)
    sub_100087B30();
  if (!v14)
    sub_100087B58();
  if (!v15)
    sub_100087B80();
  if (a6 == -1)
    sub_100087BA8();
  v17 = v16;
  if (!v16)
    sub_100087BD0();
  v18 = objc_retainAutorelease(v14);
  v19 = (const char *)objc_msgSend(v18, "fileSystemRepresentation");
  v20 = objc_retainAutorelease(v17);
  v21 = renameatx_np(a3, v19, a6, (const char *)objc_msgSend(v20, "fileSystemRepresentation"), v9);
  v22 = v21;
  if (a9 && v21)
  {
    v23 = *__error();
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByAppendingPathComponent:", v20));
    *a9 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithErrno:path:format:](MBError, "errorWithErrno:path:format:", v23, v24, CFSTR("renameatx_np() flags:0x%x failure %d"), v9, v23));

  }
  return v22 == 0;
}

+ (BOOL)hardlink:(int)a3 sourceRpath:(id)a4 destinationBasePath:(id)a5 destinationBaseFD:(int)a6 destinationRpath:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  const char *v18;
  id v19;
  int v20;
  int v21;
  uint64_t v22;
  void *v23;

  v13 = a4;
  v14 = a5;
  v15 = a7;
  if (a3 == -1)
    sub_100087BF8();
  if (!v13)
    sub_100087C20();
  if (!v14)
    sub_100087C48();
  if (a6 == -1)
    sub_100087C70();
  v16 = v15;
  if (!v15)
    sub_100087C98();
  v17 = objc_retainAutorelease(v13);
  v18 = (const char *)objc_msgSend(v17, "fileSystemRepresentation");
  v19 = objc_retainAutorelease(v16);
  v20 = linkat(a3, v18, a6, (const char *)objc_msgSend(v19, "fileSystemRepresentation"), 0);
  v21 = v20;
  if (a8 && v20)
  {
    v22 = *__error();
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByAppendingPathComponent:", v19));
    *a8 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithErrno:path:format:](MBError, "errorWithErrno:path:format:", v22, v23, CFSTR("linkat() failure %d"), v22));

  }
  return v21 == 0;
}

+ (BOOL)clone:(int)a3 sourceRpath:(id)a4 destinationBasePath:(id)a5 destinationBaseFD:(int)a6 destinationRpath:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  const char *v18;
  id v19;
  int v20;
  int v21;
  uint64_t v22;
  void *v23;

  v13 = a4;
  v14 = a5;
  v15 = a7;
  if (a3 == -1)
    sub_100087CC0();
  if (!v13)
    sub_100087CE8();
  if (!v14)
    sub_100087D10();
  if (a6 == -1)
    sub_100087D38();
  v16 = v15;
  if (!v15)
    sub_100087D60();
  v17 = objc_retainAutorelease(v13);
  v18 = (const char *)objc_msgSend(v17, "fileSystemRepresentation");
  v19 = objc_retainAutorelease(v16);
  v20 = clonefileat(a3, v18, a6, (const char *)objc_msgSend(v19, "fileSystemRepresentation"), 0);
  v21 = v20;
  if (a8 && v20)
  {
    v22 = *__error();
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByAppendingPathComponent:", v19));
    *a8 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithErrno:path:format:](MBError, "errorWithErrno:path:format:", v22, v23, CFSTR("clonefileat() failure %d"), v22));

  }
  return v21 == 0;
}

+ (BOOL)createDirectories:(int)a3 destinationBasePath:(id)a4 destinationRpath:(id)a5 permissions:(unsigned __int16)a6 error:(id *)a7
{
  int v8;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  BOOL v18;

  v8 = a6;
  v11 = a4;
  v12 = a5;
  if (a3 == 1)
    sub_100087D88();
  if (!v11)
    sub_100087DB0();
  if (!v12)
    sub_100087DD8();
  if (!v8)
    sub_100087E00();
  v13 = objc_retainAutorelease(v12);
  v14 = mkpathat_np(a3, (const char *)objc_msgSend(v13, "fileSystemRepresentation"), v8);
  v15 = v14;
  if ((_DWORD)v14 && (_DWORD)v14 != 17 && a7)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingPathComponent:", v13));
    *a7 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithErrno:path:format:](MBError, "errorWithErrno:path:format:", v15, v16, CFSTR("mkpathat_np() failure %d"), v15));

  }
  if ((_DWORD)v15)
    v17 = (_DWORD)v15 == 17;
  else
    v17 = 1;
  v18 = v17;

  return v18;
}

+ (BOOL)unlink:(int)a3 targetBasePath:(id)a4 targetRpath:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  int v12;
  int v13;
  uint64_t v14;
  void *v15;

  v9 = a4;
  v10 = a5;
  if (a3 == 1)
    sub_100087E28();
  if (!v10)
    sub_100087E50();
  v11 = objc_retainAutorelease(v10);
  v12 = unlinkat(a3, (const char *)objc_msgSend(v11, "fileSystemRepresentation"), 0);
  v13 = v12;
  if (a6 && v12)
  {
    v14 = *__error();
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingPathComponent:", v11));
    *a6 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithErrno:path:format:](MBError, "errorWithErrno:path:format:", v14, v15, CFSTR("unlinkat() failure %d"), v14));

  }
  return v13 == 0;
}

+ (id)createPathInDirectory:(id)a3 fileName:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v16;
  void *v17;
  _QWORD block[4];
  id v19;
  id v20;
  uint64_t *v21;
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v5 = a3;
  v6 = a4;
  if (!v5)
    sub_100087E78();
  v7 = v6;
  if (qword_1000F9E00 != -1)
    dispatch_once(&qword_1000F9E00, &stru_1000D96B0);
  v8 = objc_retainAutorelease(v5);
  v9 = objc_msgSend(v8, "fileSystemRepresentation");
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_10003033C;
  v27 = sub_10003034C;
  v28 = 0;
  v10 = qword_1000F9DF8;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100030354;
  block[3] = &unk_1000D96D8;
  v22 = v9;
  v11 = v8;
  v19 = v11;
  v12 = v7;
  v20 = v12;
  v21 = &v23;
  dispatch_sync(v10, block);
  v13 = (void *)v24[5];
  if (!v13)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[MBFileOperation createPathInDirectory:fileName:]"));
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("MBFileOperation.m"), 219, CFSTR("Unable to create temporary path in: %@"), v11);

    v13 = (void *)v24[5];
  }
  v14 = v13;

  _Block_object_dispose(&v23, 8);
  return v14;
}

+ (BOOL)crossVolumeCopyFromSource:(id)a3 toDestination:(id)a4 shouldDeleteSource:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  unsigned __int8 v16;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  if (!v10)
    sub_100087EA0();
  v12 = v11;
  if (!v11)
    sub_100087EC8();
  if (!a6)
    sub_100087EF0();
  v13 = objc_retainAutorelease(v10);
  v14 = objc_msgSend(v13, "fileSystemRepresentation");
  v15 = objc_retainAutorelease(v12);
  v16 = objc_msgSend(a1, "crossVolumeCopyFrom:toDestination:shouldDeleteSource:error:", v14, objc_msgSend(v15, "fileSystemRepresentation"), v7, a6);

  return v16;
}

+ (BOOL)crossVolumeCopyFrom:(const char *)a3 toDestination:(const char *)a4 shouldDeleteSource:(BOOL)a5 error:(id *)a6
{
  copyfile_flags_t v9;
  _copyfile_state *v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  BOOL v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;

  if (!a3)
    sub_100087F18();
  if (!a4)
    sub_100087F40();
  if (!a6)
    sub_100087F68();
  if (a5)
    v9 = 1179662;
  else
    v9 = 131086;
  v10 = copyfile_state_alloc();
  v11 = copyfile(a3, a4, v10, v9);
  v12 = *__error();
  copyfile_state_free(v10);
  if ((_DWORD)v11)
    v13 = (_DWORD)v12 == 17;
  else
    v13 = 1;
  v14 = v13;
  if (!v13)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString mb_stringWithFileSystemRepresentation:](NSString, "mb_stringWithFileSystemRepresentation:", a3));
    *a6 = (id)objc_claimAutoreleasedReturnValue(+[MBError posixErrorWithPath:format:](MBError, "posixErrorWithPath:format:", v15, CFSTR("copyfile failed")));

    v18 = MBGetDefaultLog(v16, v17);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v22 = a3;
      v23 = 2080;
      v24 = a4;
      v25 = 1024;
      v26 = v11;
      v27 = 1024;
      v28 = v12;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "copyfile(%s, %s) failed (%d): %{errno}d", buf, 0x22u);
      _MBLog(CFSTR("ERROR"), "copyfile(%s, %s) failed (%d): %{errno}d", a3, a4, v11, v12);
    }

  }
  return v14;
}

+ (BOOL)crossVolumeMoveFrom:(id)a3 intoDir:(id)a4 toFileNamed:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  const char *v19;
  id v20;
  uint64_t v21;
  id v22;
  const char *v23;
  int v24;
  BOOL v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  id v29;
  unsigned int v31;
  void *v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  id v38;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v10)
    sub_100087F90();
  if (!v11)
    sub_100087FB8();
  v13 = v12;
  if (!v12)
    sub_100087FE0();
  if (!a6)
    sub_100088008();
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingPathComponent:", CFSTR("cross_volume_copy")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "createPathInDirectory:fileName:", v14, 0));

  v16 = objc_retainAutorelease(v10);
  v17 = objc_msgSend(v16, "fileSystemRepresentation");
  v18 = objc_retainAutorelease(v15);
  v19 = (const char *)objc_msgSend(v18, "fileSystemRepresentation");
  v20 = objc_msgSend(a1, "crossVolumeCopyFrom:toDestination:shouldDeleteSource:error:", v17, v19, 1, a6);
  if ((v20 & 1) != 0)
  {
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "createPathInDirectory:fileName:", v11, v13)));
    v23 = (const char *)objc_msgSend(v22, "fileSystemRepresentation");
    v24 = renamex_np(v19, v23, 4u);
    v25 = v24 == 0;
    if (v24)
    {
      v31 = *__error();
      v32 = v13;
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v17));
      *a6 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithErrno:path:format:](MBError, "errorWithErrno:path:format:", v31, v26, CFSTR("renamex_np() from %s to %s failed"), v17, v23));

      v13 = v32;
    }

  }
  else
  {
    v27 = MBGetDefaultLog(v20, v21);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = *a6;
      *(_DWORD *)buf = 136315650;
      v34 = v17;
      v35 = 2080;
      v36 = v19;
      v37 = 2112;
      v38 = v29;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "could not copy across volumes from %s to %s: %@", buf, 0x20u);
      _MBLog(CFSTR("ERROR"), "could not copy across volumes from %s to %s: %@", v17, v19, *a6);
    }

    v25 = 0;
  }

  return v25;
}

+ (id)symbolicLinkTargetWithPath:(id)a3 error:(id *)a4
{
  return objc_msgSend(a1, "symbolicLinkTargetWithPathFSR:error:", objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation"), a4);
}

+ (id)symbolicLinkTargetWithPathFSR:(const char *)a3 error:(id *)a4
{
  ssize_t v7;
  ssize_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint8_t buf[4];
  const char *v19;
  char v20[1024];

  v7 = readlink(a3, v20, 0x400uLL);
  if (v7 < 0)
  {
    if (*__error() == 2 || *__error() == 22)
    {
      if (a4)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "description"));
        v16 = 4;
LABEL_13:
        *a4 = (id)objc_claimAutoreleasedReturnValue(+[MBError posixErrorWithCode:path:format:](MBError, "posixErrorWithCode:path:format:", v16, v15, CFSTR("readlink error")));

      }
    }
    else if (a4)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "description"));
      v16 = 101;
      goto LABEL_13;
    }
    v10 = 0;
    return v10;
  }
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringWithFileSystemRepresentation:length:", v20, v8));

  if (!v10)
  {
    v13 = MBGetDefaultLog(v11, v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v19 = a3;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to convert filesystem representation %s", buf, 0xCu);
      _MBLog(CFSTR("ERROR"), "Failed to convert filesystem representation %s", a3);
    }

    if (a4)
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 7, CFSTR("Failed to convert filesystem representation")));
  }
  return v10;
}

@end
