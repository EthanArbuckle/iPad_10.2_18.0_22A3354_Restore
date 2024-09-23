@implementation MBSQLiteFileHandle

+ (BOOL)isSQLiteFileAtPath:(id)a3 result:(BOOL *)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  BOOL v14;
  void *v15;
  uint8_t buf[4];
  id v18;

  v7 = a3;
  v8 = objc_msgSend(v7, "length");
  v9 = objc_msgSend(CFSTR("/private"), "length");
  v10 = objc_msgSend(CFSTR("-journal"), "length");
  if ((unint64_t)v8 > 1024 - ((unint64_t)v10 + (unint64_t)v9))
  {
    v12 = MBGetDefaultLog(v10, v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "File path too long to handle as a SQLite file: %@", buf, 0xCu);
      _MBLog(CFSTR("INFO"), "File path too long to handle as a SQLite file: %@", v7);
    }

    if (!a4)
      goto LABEL_6;
LABEL_5:
    *a4 = 0;
LABEL_6:
    v14 = 1;
    goto LABEL_14;
  }
  if (sub_10006BA40(v7))
  {
    if (!a4)
      goto LABEL_6;
    goto LABEL_5;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MBBasicFileHandle basicFileHandleWithPath:flags:mode:error:](MBBasicFileHandle, "basicFileHandleWithPath:flags:mode:error:", v7, 256, 0, a5));
  if (v15)
  {
    v14 = +[MBSQLiteFileHandle isSQLiteFileHandle:result:error:](MBSQLiteFileHandle, "isSQLiteFileHandle:result:error:", v15, a4, a5);
    objc_msgSend(v15, "closeWithError:", 0);
  }
  else
  {
    v14 = 0;
  }

LABEL_14:
  return v14;
}

+ (BOOL)isSQLiteFileHandle:(id)a3 result:(BOOL *)a4 error:(id *)a5
{
  id v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  BOOL v19;
  ssize_t v20;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  uint64_t __buf;
  uint64_t v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;

  v7 = a3;
  *a4 = 0;
  v37 = xmmword_10009D498;
  v38 = 0;
  v36 = 0;
  v8 = objc_msgSend(v7, "fd");
  v9 = fgetattrlist(v8, &v37, &v36, 8uLL, 0);
  if ((_DWORD)v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "path"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MBError posixErrorWithPath:format:](MBError, "posixErrorWithPath:format:", v11, CFSTR("fgetattrlist failed")));

    v15 = MBGetDefaultLog(v13, v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "path"));
      *(_DWORD *)buf = 138412546;
      v42 = v17;
      v43 = 2112;
      v44 = v12;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "fgetattrlist failed at %@: %@", buf, 0x16u);

      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "path"));
      _MBLog(CFSTR("ERROR"), "fgetattrlist failed at %@: %@", v18, v12);

    }
    if (a5)
      *a5 = objc_retainAutorelease(v12);

    v19 = 0;
  }
  else if (HIDWORD(v36) == 1)
  {
    __buf = 0;
    v40 = 0;
    v20 = pread(v8, &__buf, 0x10uLL, 0);
    v19 = v20 >= 0;
    if (v20 < 0)
    {
      v28 = *__error();
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "path"));
      v31 = MBGetDefaultLog(v29, v30);
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v42 = v29;
        v43 = 1024;
        LODWORD(v44) = v28;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "pread failed at %@: %{errno}d", buf, 0x12u);
        _MBLog(CFSTR("ERROR"), "pread failed at %@: %{errno}d", v29, v28);
      }

      v33 = (void *)objc_claimAutoreleasedReturnValue(+[MBError errorWithErrno:path:format:](MBError, "errorWithErrno:path:format:", v28, v29, CFSTR("pread error")));
      v34 = v33;
      if (a5)
        *a5 = objc_retainAutorelease(v33);
      if ((v28 - 34) <= 0x3A && ((1 << (v28 - 34)) & 0x400000000000801) != 0
        || (_DWORD)v28 == 22)
      {
        sub_10000F234(v29);
        sub_10000F1A4(v29);
      }

    }
    else if (v20 == 16 && __buf == 0x66206574694C5153 && v40 == 0x332074616D726FLL)
    {
      *a4 = 1;
    }
  }
  else
  {
    v22 = MBGetDefaultLog(v9, v10);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v24 = (void *)HIDWORD(v36);
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "path"));
      *(_DWORD *)buf = 134218242;
      v42 = v24;
      v43 = 2112;
      v44 = v25;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "Not a regular file (%ld) at %@", buf, 0x16u);

      v26 = HIDWORD(v36);
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "path"));
      _MBLog(CFSTR("DEBUG"), "Not a regular file (%ld) at %@", v26, v27);

    }
    v19 = 1;
  }

  return v19;
}

+ (BOOL)compactSQLiteDatabaseAtPath:(id)a3 toPath:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  const char *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void **p_vtable;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  id v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  unsigned __int8 v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  unsigned __int8 v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  off_t st_size;
  uint64_t v44;
  NSObject *v45;
  void **v46;
  double v47;
  double v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  NSObject *v53;
  double v55;
  double v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void **v60;
  void **v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  NSObject *v65;
  id v66;
  uint64_t v67;
  double v68;
  uint64_t v69;
  NSObject *v70;
  uint64_t v71;
  NSObject *v72;
  const __CFString *v73;
  const __CFString *v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  unsigned __int8 v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  NSObject *v84;
  id v85;
  double v86;
  double v87;
  off_t v88;
  uint64_t v89;
  uint64_t v90;
  NSObject *v91;
  double v92;
  uint64_t v93;
  id *v94;
  id v95;
  id v96;
  id v97;
  id v98;
  stat v99;
  stat v100;
  sqlite3 *ppDb;
  uint8_t buf[4];
  _BYTE v103[28];

  v7 = a3;
  v8 = a4;
  if (!a5)
    sub_100088B70();
  v9 = v8;
  v10 = objc_retainAutorelease(v7);
  v11 = (const char *)objc_msgSend(v10, "fileSystemRepresentation");
  v12 = objc_retainAutorelease(v9);
  v13 = (const char *)objc_msgSend(v12, "fileSystemRepresentation");
  ppDb = 0;
  memset(&v100, 0, sizeof(v100));
  v14 = stat(v11, &v100);
  p_vtable = MBSQLiteDB.vtable;
  if ((_DWORD)v14)
  {
    v17 = *__error();
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[MBError posixErrorWithPath:format:](MBError, "posixErrorWithPath:format:", v10, CFSTR("stat error")));
    v20 = MBGetDefaultLog(v18, v19);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v103 = v10;
      *(_WORD *)&v103[8] = 1024;
      *(_DWORD *)&v103[10] = v17;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "stat failed at %@: %{errno}d", buf, 0x12u);
      _MBLog(CFSTR("ERROR"), "stat failed at %@: %{errno}d", v10, v17);
    }
    goto LABEL_5;
  }
  st_size = v100.st_size;
  v44 = MBGetDefaultLog(v14, v15);
  v45 = objc_claimAutoreleasedReturnValue(v44);
  if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)v103 = v10;
    *(_WORD *)&v103[8] = 2112;
    *(_QWORD *)&v103[10] = v12;
    *(_WORD *)&v103[18] = 2048;
    *(_QWORD *)&v103[20] = st_size;
    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "Compacting SQLite database at %@ to %@ (%lld bytes)", buf, 0x20u);
    _MBLog(CFSTR("INFO"), "Compacting SQLite database at %@ to %@ (%lld bytes)", v10, v12, st_size);
  }

  v46 = (void **)&AnalyticsSendEventLazy_ptr;
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v48 = v47;
  v49 = sqlite3_open_v2(v11, &ppDb, 1, 0);
  if ((_DWORD)v49)
  {
    v50 = v49;
    v51 = ppDb;
    if (ppDb)
      v51 = (void *)sqlite3_errmsg(ppDb);
    v22 = objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:path:format:](MBError, "errorWithCode:path:format:", 16, v10, CFSTR("Error opening SQLite file: %s (%d)"), v51, v50));
LABEL_27:
    v18 = (void *)v22;
    if (v22)
      goto LABEL_6;
    goto LABEL_28;
  }
  v94 = a5;
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v56 = v55;
  +[MBSQLiteFileHandle removeAllSQLiteFilesAtPath:](MBSQLiteFileHandle, "removeAllSQLiteFilesAtPath:", v12);
  v57 = _sqlite3_db_copy_compact(v13, ppDb, 0);
  if ((_DWORD)v57)
  {
    v59 = v57;
    while (1)
    {
      v60 = v46;
      v61 = p_vtable;
      v62 = sqlite3_extended_errcode(ppDb);
      v64 = MBGetDefaultLog(v62, v63);
      v65 = objc_claimAutoreleasedReturnValue(v64);
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)v103 = v10;
        *(_WORD *)&v103[8] = 1024;
        *(_DWORD *)&v103[10] = v59;
        *(_WORD *)&v103[14] = 1024;
        *(_DWORD *)&v103[16] = v62;
        _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "_sqlite3_db_copy_compact failed at %@: %d/0x%x", buf, 0x18u);
        _MBLog(CFSTR("ERROR"), "_sqlite3_db_copy_compact failed at %@: %d/0x%x", v10, v59, v62);
      }

      if ((_DWORD)v59 != 5)
        break;
      v46 = v60;
      v66 = objc_msgSend(v60[205], "timeIntervalSinceReferenceDate");
      if (v68 - v56 >= 1.0)
      {
        v22 = objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:path:format:](MBError, "errorWithCode:path:format:", 13, v10, CFSTR("SQLite file is locked")));
        v18 = (void *)v22;
        goto LABEL_57;
      }
      v69 = MBGetDefaultLog(v66, v67);
      v70 = objc_claimAutoreleasedReturnValue(v69);
      p_vtable = v61;
      if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v103 = v10;
        _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_INFO, "Waiting for busy SQLite database at %@", buf, 0xCu);
        _MBLog(CFSTR("INFO"), "Waiting for busy SQLite database at %@", v10);
      }

      +[NSThread sleepForTimeInterval:](NSThread, "sleepForTimeInterval:", 0.1);
      objc_msgSend(v61 + 457, "removeAllSQLiteFilesAtPath:", v12);
      v57 = _sqlite3_db_copy_compact(v13, ppDb, 0);
      v59 = v57;
      if (!(_DWORD)v57)
        goto LABEL_42;
    }
    if ((_DWORD)v59 == 14)
    {
      v74 = CFSTR("Can't open SQLite file");
      v75 = 100;
    }
    else
    {
      v93 = v59;
      v74 = CFSTR("Can't compact SQLite file (%d)");
      v75 = 16;
    }
    v22 = objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:path:format:](MBError, "errorWithCode:path:format:", v75, v10, v74, v93));
    v18 = (void *)v22;
LABEL_57:
    p_vtable = v61;
    a5 = v94;
    if (v18)
      goto LABEL_6;
    goto LABEL_28;
  }
LABEL_42:
  v71 = MBGetDefaultLog(v57, v58);
  v72 = objc_claimAutoreleasedReturnValue(v71);
  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v103 = v10;
    *(_WORD *)&v103[8] = 2112;
    *(_QWORD *)&v103[10] = v12;
    _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEBUG, "Created compacted SQLite file from %@ to %@", buf, 0x16u);
    _MBLog(CFSTR("DEBUG"), "Created compacted SQLite file from %@ to %@", v10, v12);
  }

  memset(&v99, 0, sizeof(v99));
  a5 = v94;
  if (!lstat(v13, &v99) && ((v99.st_mode & 0xF000) != 0x8000 || v99.st_nlink >= 2u))
  {
    v22 = objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("not a regular file")));
    goto LABEL_27;
  }
  if (lchown(v13, v100.st_uid, v100.st_gid))
  {
    v73 = CFSTR("chown error");
LABEL_53:
    v22 = objc_claimAutoreleasedReturnValue(+[MBError posixErrorWithPath:format:](MBError, "posixErrorWithPath:format:", v12, v73));
    goto LABEL_27;
  }
  if (lchmod(v13, v100.st_mode))
  {
    v73 = CFSTR("chmod error");
    goto LABEL_53;
  }
  v98 = 0;
  v76 = +[MBProtectionClassUtils getWithPathFSR:error:](MBProtectionClassUtils, "getWithPathFSR:error:", v11, &v98);
  v77 = v98;
  v18 = v77;
  if ((v76 + 1) <= 1u)
  {
    v79 = MBGetDefaultLog(v77, v78);
    v21 = objc_claimAutoreleasedReturnValue(v79);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v103 = v10;
      *(_WORD *)&v103[8] = 2112;
      *(_QWORD *)&v103[10] = v18;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to fetch the protection class for %@: %@", buf, 0x16u);
      _MBLog(CFSTR("ERROR"), "Failed to fetch the protection class for %@: %@", v10, v18);
    }
LABEL_5:

    if (v18)
    {
LABEL_6:
      v24 = MBGetDefaultLog(v22, v23);
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v103 = v10;
        *(_WORD *)&v103[8] = 2112;
        *(_QWORD *)&v103[10] = v18;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Failed to compact SQLite database at %@: %@", buf, 0x16u);
        _MBLog(CFSTR("ERROR"), "Failed to compact SQLite database at %@: %@", v10, v18);
      }

      v26 = objc_retainAutorelease(v18);
      v27 = 0;
      *a5 = v26;
      goto LABEL_9;
    }
LABEL_28:
    sub_100088B98();
  }
  v97 = v77;
  v80 = +[MBProtectionClassUtils setWithPathFSR:value:error:](MBProtectionClassUtils, "setWithPathFSR:value:error:", v13, v76, &v97);
  v26 = v97;

  if ((v80 & 1) == 0)
  {
    v83 = MBGetDefaultLog(v81, v82);
    v84 = objc_claimAutoreleasedReturnValue(v83);
    if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v103 = v76;
      *(_WORD *)&v103[4] = 2112;
      *(_QWORD *)&v103[6] = v12;
      *(_WORD *)&v103[14] = 2112;
      *(_QWORD *)&v103[16] = v26;
      _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_ERROR, "Failed to set the protection class (%d) for %@: %@", buf, 0x1Cu);
      _MBLog(CFSTR("ERROR"), "Failed to set the protection class (%d) for %@: %@", v76, v12, v26);
    }

  }
  v85 = +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v87 = v86;
  v88 = v99.st_size;
  v90 = MBGetDefaultLog(v85, v89);
  v91 = objc_claimAutoreleasedReturnValue(v90);
  if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
  {
    v92 = v87 - v48;
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)v103 = v10;
    *(_WORD *)&v103[8] = 2048;
    *(double *)&v103[10] = v92;
    *(_WORD *)&v103[18] = 2048;
    *(_QWORD *)&v103[20] = v88;
    _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_INFO, "Finished compacting SQLite database at %@ in %0.3fs (%lld bytes)", buf, 0x20u);
    _MBLog(CFSTR("INFO"), "Finished compacting SQLite database at %@ in %0.3fs (%lld bytes)", v10, *(_QWORD *)&v92, v88);
  }

  v27 = 1;
LABEL_9:
  if (ppDb)
  {
    v28 = sqlite3_close(ppDb);
    if ((_DWORD)v28)
    {
      v30 = v28;
      v31 = MBGetDefaultLog(v28, v29);
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v103 = v10;
        *(_WORD *)&v103[8] = 1024;
        *(_DWORD *)&v103[10] = v30;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Failed to close SQLite database at %@: %d", buf, 0x12u);
        _MBLog(CFSTR("ERROR"), "Failed to close SQLite database at %@: %d", v10, v30);
      }

    }
  }
  v96 = v26;
  v33 = objc_msgSend(p_vtable + 457, "removeJournalsForSQLiteFileAtPath:error:", v12, &v96);
  v34 = v96;

  if ((v33 & 1) == 0)
  {
    v37 = MBGetDefaultLog(v35, v36);
    v38 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v103 = v12;
      *(_WORD *)&v103[8] = 2112;
      *(_QWORD *)&v103[10] = v34;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Failed to remove SQLite files for %@: %@", buf, 0x16u);
      _MBLog(CFSTR("ERROR"), "Failed to remove SQLite files for %@: %@", v12, v34);
    }

    v34 = 0;
  }
  if (!v27)
  {
    v95 = v34;
    v39 = objc_msgSend(p_vtable + 457, "removeSQLiteFileAtPath:error:", v12, &v95);
    v40 = v95;

    if ((v39 & 1) != 0)
    {
      v34 = v40;
    }
    else
    {
      v52 = MBGetDefaultLog(v41, v42);
      v53 = objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v103 = v12;
        *(_WORD *)&v103[8] = 2112;
        *(_QWORD *)&v103[10] = v40;
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "Failed to remove SQLite database at %@: %@", buf, 0x16u);
        _MBLog(CFSTR("ERROR"), "Failed to remove SQLite database at %@: %@", v12, v40);
      }

      v34 = 0;
    }
  }

  return v27;
}

+ (BOOL)copySQLiteFileAtPath:(id)a3 toPath:(id)a4 error:(id *)a5
{
  return objc_msgSend(a1, "copySQLiteFileAtPath:toPath:timeout:error:", a3, a4, a5, 1.0);
}

+ (BOOL)copySQLiteFileAtPath:(id)a3 toPath:(id)a4 timeout:(double)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  const char *v12;
  id v13;
  const char *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  int v19;
  int *v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  unsigned __int8 v32;
  id v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  BOOL v38;
  unsigned __int8 v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  off_t st_size;
  uint64_t v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  uint64_t v49;
  NSObject *v50;
  uint64_t v52;
  double v53;
  double v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const __CFString *v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  NSObject *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  uint64_t v70;
  NSObject *v71;
  const __CFString *v72;
  double v73;
  double v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  NSObject *v81;
  id v82;
  uint64_t v83;
  double v84;
  uint64_t v85;
  NSObject *v86;
  uint64_t v87;
  NSObject *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  NSObject *v95;
  uint64_t v96;
  NSObject *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  NSObject *v102;
  double v103;
  double v104;
  uint64_t v105;
  int v106;
  off_t v107;
  uint64_t v108;
  uint64_t v109;
  NSObject *v110;
  uint64_t v111;
  double v112;
  void *v113;
  uint64_t v114;
  id v115;
  id v116;
  stat v117;
  stat v118;
  sqlite3 *v119;
  sqlite3 *ppDb;
  uint8_t buf[4];
  id v122;
  __int16 v123;
  _BYTE v124[10];
  off_t v125;

  v9 = a3;
  v10 = a4;
  v11 = objc_retainAutorelease(v9);
  v12 = (const char *)objc_msgSend(v11, "fileSystemRepresentation");
  v13 = objc_retainAutorelease(v10);
  v14 = (const char *)objc_msgSend(v13, "fileSystemRepresentation");
  v119 = 0;
  ppDb = 0;
  memset(&v118, 0, sizeof(v118));
  v15 = (id)stat(v12, &v118);
  if ((_DWORD)v15)
  {
    if (a6)
    {
      v15 = (id)objc_claimAutoreleasedReturnValue(+[MBError posixErrorWithPath:format:](MBError, "posixErrorWithPath:format:", v11, CFSTR("stat error")));
      *a6 = v15;
    }
    v17 = MBGetDefaultLog(v15, v16);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = *__error();
      *(_DWORD *)buf = 138412546;
      v122 = v11;
      v123 = 1024;
      *(_DWORD *)v124 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "stat failed at %@: %{errno}d", buf, 0x12u);
      v20 = __error();
      _MBLog(CFSTR("ERROR"), "stat failed at %@: %{errno}d", v11, *v20);
    }

    goto LABEL_7;
  }
  st_size = v118.st_size;
  v44 = MBGetDefaultLog(v15, v16);
  v45 = objc_claimAutoreleasedReturnValue(v44);
  if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v122 = v11;
    v123 = 2112;
    *(_QWORD *)v124 = v13;
    *(_WORD *)&v124[8] = 2048;
    v125 = st_size;
    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "Copying SQLite database at %@ to %@ (%lld bytes)", buf, 0x20u);
    _MBLog(CFSTR("INFO"), "Copying SQLite database at %@ to %@ (%lld bytes)", v11, v13, st_size);
  }

  v46 = +[MBProtectionClassUtils getWithPath:error:](MBProtectionClassUtils, "getWithPath:error:", v11, a6);
  if ((v46 + 1) < 2u)
  {
    v35 = 0;
LABEL_36:
    v38 = 0;
    goto LABEL_37;
  }
  v52 = v46;
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v54 = v53;
  v55 = sqlite3_open_v2(v12, &ppDb, 1, 0);
  if ((_DWORD)v55)
  {
    if (a6)
    {
      v57 = v55;
      v58 = ppDb;
      if (ppDb)
        v58 = (void *)sqlite3_errmsg(ppDb);
      v113 = v58;
      v114 = v57;
      v59 = CFSTR("Error opening SQLite file: %s (%d)");
LABEL_43:
      v60 = 16;
LABEL_44:
      v61 = v11;
      goto LABEL_52;
    }
LABEL_7:
    v21 = 0;
    goto LABEL_8;
  }
  v62 = MBGetDefaultLog(v55, v56);
  v63 = objc_claimAutoreleasedReturnValue(v62);
  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v122 = v11;
    _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEBUG, "Opened SQLite database at %@", buf, 0xCu);
    _MBLog(CFSTR("DEBUG"), "Opened SQLite database at %@", v11);
  }

  v64 = +[MBProtectionClassUtils sqliteOpenFlagForProtectionClass:](MBProtectionClassUtils, "sqliteOpenFlagForProtectionClass:", v52) | 6;
  v65 = sqlite3_open_v2(v14, &v119, v64, 0);
  if ((_DWORD)v65)
  {
    if (a6)
    {
      v67 = v65;
      v68 = v119;
      if (v119)
        v68 = (void *)sqlite3_errmsg(v119);
      v113 = v68;
      v114 = v67;
      v59 = CFSTR("Error opening SQLite file: %s (%d)");
      v60 = 16;
      v61 = v13;
LABEL_52:
      v69 = (void *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:path:format:](MBError, "errorWithCode:path:format:", v60, v61, v59, v113, v114));
LABEL_53:
      v21 = 0;
      *a6 = v69;
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  v70 = MBGetDefaultLog(v65, v66);
  v71 = objc_claimAutoreleasedReturnValue(v70);
  if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v122 = v13;
    v123 = 1024;
    *(_DWORD *)v124 = v64;
    _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEBUG, "Opened SQLite file for copying at %@ with flags 0x%x", buf, 0x12u);
    _MBLog(CFSTR("DEBUG"), "Opened SQLite file for copying at %@ with flags 0x%x", v13, v64);
  }

  memset(&v117, 0, sizeof(v117));
  if (!lstat(v14, &v117) && ((v117.st_mode & 0xF000) != 0x8000 || v117.st_nlink >= 2u))
  {
    if (a6)
    {
      v69 = (void *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("not a regular file")));
      goto LABEL_53;
    }
    goto LABEL_7;
  }
  if (lchown(v14, v118.st_uid, v118.st_gid))
  {
    if (!a6)
      goto LABEL_7;
    v72 = CFSTR("chown error");
LABEL_65:
    v69 = (void *)objc_claimAutoreleasedReturnValue(+[MBError posixErrorWithPath:format:](MBError, "posixErrorWithPath:format:", v13, v72));
    goto LABEL_53;
  }
  if (lchmod(v14, v118.st_mode))
  {
    if (!a6)
      goto LABEL_7;
    v72 = CFSTR("chmod error");
    goto LABEL_65;
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v74 = v73;
  v75 = sqlite3_file_control(v119, 0, 102, ppDb);
  if ((_DWORD)v75)
  {
    v77 = v75;
    while (1)
    {
      v78 = sqlite3_extended_errcode(v119);
      v80 = MBGetDefaultLog(v78, v79);
      v81 = objc_claimAutoreleasedReturnValue(v80);
      if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v122 = v11;
        v123 = 1024;
        *(_DWORD *)v124 = v77;
        *(_WORD *)&v124[4] = 1024;
        *(_DWORD *)&v124[6] = v78;
        _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_ERROR, "sqlite3_file_control(SQLITE_REPLACE_DATABASE) failed at %@: %d/0x%x", buf, 0x18u);
        _MBLog(CFSTR("ERROR"), "sqlite3_file_control(SQLITE_REPLACE_DATABASE) failed at %@: %d/0x%x", v11, v77, v78);
      }

      if ((_DWORD)v77 != 5)
        break;
      v82 = +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
      if (v84 - v74 >= a5)
      {
        if (!a6)
          goto LABEL_7;
        v59 = CFSTR("SQLite file is locked");
        v60 = 13;
        goto LABEL_44;
      }
      v85 = MBGetDefaultLog(v82, v83);
      v86 = objc_claimAutoreleasedReturnValue(v85);
      if (os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v122 = v11;
        _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEBUG, "Waiting for busy SQLite database at %@", buf, 0xCu);
        _MBLog(CFSTR("DEBUG"), "Waiting for busy SQLite database at %@", v11);
      }

      +[NSThread sleepForTimeInterval:](NSThread, "sleepForTimeInterval:", 0.1);
      v75 = sqlite3_file_control(v119, 0, 102, ppDb);
      v77 = v75;
      if (!(_DWORD)v75)
        goto LABEL_77;
    }
    if ((_DWORD)v77 == 14)
    {
      if (!a6)
        goto LABEL_7;
      v59 = CFSTR("Can't open SQLite file");
      v60 = 100;
      goto LABEL_44;
    }
    if (!a6)
      goto LABEL_7;
    v59 = CFSTR("Can't copy SQLite file");
    goto LABEL_43;
  }
LABEL_77:
  v87 = MBGetDefaultLog(v75, v76);
  v88 = objc_claimAutoreleasedReturnValue(v87);
  if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v122 = v11;
    v123 = 2112;
    *(_QWORD *)v124 = v13;
    _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_DEBUG, "Copied SQLite file from %@ to %@", buf, 0x16u);
    _MBLog(CFSTR("DEBUG"), "Copied SQLite file from %@ to %@", v11, v13);
  }

  v89 = sqlite3_wal_checkpoint_v2(v119, 0, 2, 0, 0);
  if ((_DWORD)v89)
  {
    v91 = v89;
    v92 = sqlite3_extended_errcode(v119);
    v94 = MBGetDefaultLog(v92, v93);
    v95 = objc_claimAutoreleasedReturnValue(v94);
    if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v122 = v11;
      v123 = 1024;
      *(_DWORD *)v124 = v91;
      *(_WORD *)&v124[4] = 1024;
      *(_DWORD *)&v124[6] = v92;
      _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_ERROR, "Failed to checkpoint copied SQLite database at %@ (%d/0x%x)", buf, 0x18u);
      _MBLog(CFSTR("ERROR"), "Failed to checkpoint copied SQLite database at %@ (%d/0x%x)", v11, v91, v92);
    }

    if (!a6)
      goto LABEL_7;
    v59 = CFSTR("Can't checkpoint copied SQLite file");
    goto LABEL_43;
  }
  v96 = MBGetDefaultLog(v89, v90);
  v97 = objc_claimAutoreleasedReturnValue(v96);
  if (os_log_type_enabled(v97, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v122 = v11;
    v123 = 2112;
    *(_QWORD *)v124 = v13;
    _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_DEBUG, "Checkpointed copied SQLite file from %@ to %@", buf, 0x16u);
    _MBLog(CFSTR("DEBUG"), "Checkpointed copied SQLite file from %@ to %@", v11, v13);
  }

  v98 = sqlite3_close(v119);
  v119 = 0;
  if ((_DWORD)v98)
  {
    v100 = v98;
    v101 = MBGetDefaultLog(v98, v99);
    v102 = objc_claimAutoreleasedReturnValue(v101);
    if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v122 = v13;
      v123 = 1024;
      *(_DWORD *)v124 = v100;
      _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_ERROR, "Failed to close copied SQLite database at %@: %d", buf, 0x12u);
      _MBLog(CFSTR("ERROR"), "Failed to close copied SQLite database at %@: %d", v13, v100);
    }

    if (!a6)
      goto LABEL_7;
    v59 = CFSTR("Can't close copied SQLite file");
    goto LABEL_43;
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v104 = v103;
  v105 = lstat(v14, &v117);
  v106 = v105;
  v107 = v117.st_size;
  v109 = MBGetDefaultLog(v105, v108);
  v110 = objc_claimAutoreleasedReturnValue(v109);
  if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
  {
    if (v106)
      v111 = -1;
    else
      v111 = v107;
    *(_DWORD *)buf = 138412802;
    v112 = v104 - v54;
    v122 = v11;
    v123 = 2048;
    *(double *)v124 = v112;
    *(_WORD *)&v124[8] = 2048;
    v125 = v111;
    _os_log_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_INFO, "Finished copying SQLite database at %@ in %0.3fs (%lld bytes)", buf, 0x20u);
    _MBLog(CFSTR("INFO"), "Finished copying SQLite database at %@ in %0.3fs (%lld bytes)", v11, *(_QWORD *)&v112, v111);
  }

  v21 = 1;
LABEL_8:
  if (ppDb)
  {
    v22 = sqlite3_close(ppDb);
    if ((_DWORD)v22)
    {
      v24 = v22;
      v25 = MBGetDefaultLog(v22, v23);
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v122 = v11;
        v123 = 1024;
        *(_DWORD *)v124 = v24;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Failed to close the SQLite database at %@: %d", buf, 0x12u);
        _MBLog(CFSTR("ERROR"), "Failed to close the SQLite database at %@: %d", v11, v24);
      }

    }
  }
  if (v119)
  {
    v27 = sqlite3_close(v119);
    if ((_DWORD)v27)
    {
      v29 = v27;
      v30 = MBGetDefaultLog(v27, v28);
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v122 = v13;
        v123 = 1024;
        *(_DWORD *)v124 = v29;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Failed to close the SQLite database at %@: %d", buf, 0x12u);
        _MBLog(CFSTR("ERROR"), "Failed to close the SQLite database at %@: %d", v13, v29);
      }

    }
  }
  v116 = 0;
  v32 = +[MBSQLiteFileHandle removeJournalsForSQLiteFileAtPath:error:](MBSQLiteFileHandle, "removeJournalsForSQLiteFileAtPath:error:", v13, &v116);
  v33 = v116;
  v35 = v33;
  if ((v32 & 1) == 0)
  {
    v36 = MBGetDefaultLog(v33, v34);
    v37 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v122 = v13;
      v123 = 2112;
      *(_QWORD *)v124 = v35;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Failed to remove the journals for the database at %@: %@", buf, 0x16u);
      _MBLog(CFSTR("ERROR"), "Failed to remove the journals for the database at %@: %@", v13, v35);
    }

    v35 = 0;
  }
  if ((v21 & 1) == 0)
  {
    v115 = v35;
    v39 = +[MBSQLiteFileHandle removeSQLiteFileAtPath:error:](MBSQLiteFileHandle, "removeSQLiteFileAtPath:error:", v13, &v115);
    v40 = v115;

    if ((v39 & 1) != 0)
    {
      v35 = v40;
    }
    else
    {
      v47 = MBGetDefaultLog(v41, v42);
      v48 = objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v122 = v13;
        v123 = 2112;
        *(_QWORD *)v124 = v40;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "Failed to remove the SQLite database at %@: %@", buf, 0x16u);
        _MBLog(CFSTR("ERROR"), "Failed to remove the SQLite database at %@: %@", v13, v40);
      }

      v35 = 0;
    }
    v49 = MBGetDefaultLog(v41, v42);
    v50 = objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v122 = v11;
      v123 = 2112;
      *(_QWORD *)v124 = v35;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "Failed to copy SQLite database at %@: %@", buf, 0x16u);
      _MBLog(CFSTR("ERROR"), "Failed to copy SQLite database at %@: %@", v11, v35);
    }

    goto LABEL_36;
  }
  v38 = 1;
LABEL_37:

  return v38;
}

+ (BOOL)lastModifiedForSQLiteFileAtPath:(id)a3 time:(int64_t *)a4 error:(id *)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  size_t v12;
  int *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  __darwin_time_t tv_sec;
  uint64_t v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  BOOL v29;
  __darwin_time_t v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  stat v37;
  uint8_t buf[4];
  __darwin_time_t v39;
  __int16 v40;
  id v41;

  v7 = a3;
  memset(&v37, 0, sizeof(v37));
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingString:", CFSTR("-wal"))));
  v9 = stat((const char *)objc_msgSend(v8, "fileSystemRepresentation"), &v37);
  if (!(_DWORD)v9)
  {
    if ((v37.st_mode & 0xF000) == 0x8000)
    {
      tv_sec = v37.st_mtimespec.tv_sec;
      v18 = MBGetDefaultLog(v9, v10);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218242;
        v39 = tv_sec;
        v40 = 2112;
        v41 = v8;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Using last modified time (%lu) of WAL at %@", buf, 0x16u);
        _MBLog(CFSTR("INFO"), "Using last modified time (%lu) of WAL at %@", tv_sec, v8, *(_QWORD *)&v37.st_dev, v37.st_ino, *(_QWORD *)&v37.st_uid, *(_QWORD *)&v37.st_rdev, v37.st_atimespec.tv_sec, v37.st_atimespec.tv_nsec);
      }

      *a4 = tv_sec;
      goto LABEL_23;
    }
    goto LABEL_12;
  }
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent")));
  v12 = strlen((const char *)objc_msgSend(v11, "fileSystemRepresentation"));

  v13 = __error();
  if (*v13 == 63 && v12 >= 0x100)
  {
    v15 = MBGetDefaultLog(v13, v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v39 = (__darwin_time_t)v8;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "WAL file name too long: %@", buf, 0xCu);
      _MBLog(CFSTR("ERROR"), "WAL file name too long: %@", v8);
    }

    goto LABEL_12;
  }
  if (*__error() == 2)
  {
LABEL_12:
    v20 = objc_retainAutorelease(v7);
    v21 = stat((const char *)objc_msgSend(v20, "fileSystemRepresentation"), &v37);
    if ((_DWORD)v21)
    {
      v23 = *__error();
      v24 = objc_claimAutoreleasedReturnValue(+[MBError posixErrorWithPath:format:](MBError, "posixErrorWithPath:format:", v20, CFSTR("stat failed")));
      v26 = (void *)v24;
      if (v23 != 2)
      {
        v27 = MBGetDefaultLog(v24, v25);
        v28 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v39 = (__darwin_time_t)v20;
          v40 = 2112;
          v41 = v26;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "stat failed at %@: %@", buf, 0x16u);
          _MBLog(CFSTR("ERROR"), "stat failed at %@: %@", v20, v26, *(_QWORD *)&v37.st_dev, v37.st_ino, *(_QWORD *)&v37.st_uid, *(_QWORD *)&v37.st_rdev, v37.st_atimespec.tv_sec, v37.st_atimespec.tv_nsec);
        }

      }
      if (!a5)
        goto LABEL_19;
      goto LABEL_18;
    }
    v30 = v37.st_mtimespec.tv_sec;
    v31 = MBGetDefaultLog(v21, v22);
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      v39 = v30;
      v40 = 2112;
      v41 = v20;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Using last modified time (%lu) of db at %@", buf, 0x16u);
      _MBLog(CFSTR("INFO"), "Using last modified time (%lu) of db at %@", v30, v20, *(_QWORD *)&v37.st_dev, v37.st_ino, *(_QWORD *)&v37.st_uid, *(_QWORD *)&v37.st_rdev, v37.st_atimespec.tv_sec, v37.st_atimespec.tv_nsec);
    }

    *a4 = v30;
LABEL_23:
    v29 = 1;
    goto LABEL_24;
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[MBError posixErrorWithPath:format:](MBError, "posixErrorWithPath:format:", v8, CFSTR("stat failed")));
  v35 = MBGetDefaultLog(v26, v34);
  v36 = objc_claimAutoreleasedReturnValue(v35);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v39 = (__darwin_time_t)v8;
    v40 = 2112;
    v41 = v26;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "stat failed at %@: %@", buf, 0x16u);
    _MBLog(CFSTR("ERROR"), "stat failed at %@: %@", v8, v26, *(_QWORD *)&v37.st_dev, v37.st_ino, *(_QWORD *)&v37.st_uid, *(_QWORD *)&v37.st_rdev, v37.st_atimespec.tv_sec, v37.st_atimespec.tv_nsec);
  }

  if (!a5)
    goto LABEL_19;
LABEL_18:
  *a5 = objc_retainAutorelease(v26);
LABEL_19:

  v29 = 0;
LABEL_24:

  return v29;
}

+ (id)executePragma:(id)a3 withDatabase:(sqlite3 *)a4
{
  id v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  NSString *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  int v18;

  ppStmt = 0;
  do
  {
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PRAGMA %@"), a3)));
    v7 = sqlite3_prepare(a4, (const char *)objc_msgSend(v6, "UTF8String"), -1, &ppStmt, 0);

  }
  while (v7 == 5);
  if (v7)
  {
    v13 = MBGetDefaultLog(v8, v9);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "sqlite3_prepare returned %d!", buf, 8u);
      _MBLog(CFSTR("ERROR"), "sqlite3_prepare returned %d!", v7);
    }

    return 0;
  }
  else
  {
    do
      v10 = sqlite3_step(ppStmt);
    while (v10 == 5);
    if (v10 == 100)
    {
      v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), sqlite3_column_text(ppStmt, 0));
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      while (sqlite3_step(ppStmt) == 5)
        ;
    }
    else
    {
      v12 = 0;
    }
    sqlite3_finalize(ppStmt);
    ppStmt = 0;
    return v12;
  }
}

+ (BOOL)setAttributes:(id)a3 ofSQLiteFileAtPath:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  __darwin_ino64_t v11;
  id v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  id v18;
  id v19;
  MBError *v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  MBError *v30;
  uint64_t v32;
  id v33;
  void *v34;
  id obj;
  void *v36;
  void *v37;
  stat v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  stat buf;

  v7 = a3;
  v8 = a4;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v9 = objc_msgSend(v7, "mutableCopy");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", NSFileOwnerAccountID));
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", NSFileGroupOwnerAccountID));
  objc_msgSend(v9, "removeObjectForKey:", NSFileOwnerAccountID);
  v12 = objc_msgSend(v9, "removeObjectForKey:", NSFileGroupOwnerAccountID);
  v36 = (void *)v11;
  v37 = v10;
  if (v10)
    v14 = v11 == 0;
  else
    v14 = 1;
  if (v14)
  {
    v15 = MBGetDefaultLog(v12, v13);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      buf.st_dev = 138412546;
      *(_QWORD *)&buf.st_mode = v10;
      WORD2(buf.st_ino) = 2112;
      *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = v11;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "No uid or gid: %@, %@", (uint8_t *)&buf, 0x16u);
      _MBLog(CFSTR("ERROR"), "No uid or gid: %@, %@", v10, v11);
    }

    goto LABEL_9;
  }
  memset(&buf, 0, sizeof(buf));
  v18 = objc_retainAutorelease(v8);
  if (lstat((const char *)objc_msgSend(v18, "fileSystemRepresentation"), &buf)
    || (buf.st_mode & 0xF000) == 0x8000 && buf.st_nlink < 2u)
  {
    v19 = objc_retainAutorelease(v18);
    if (lchown((const char *)objc_msgSend(v19, "fileSystemRepresentation"), (uid_t)objc_msgSend(v10, "integerValue"), (gid_t)objc_msgSend(v36, "integerValue")))
    {
      if (a5)
      {
        v20 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("chown error on %@"), v19);
LABEL_38:
        LOBYTE(v17) = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue(v20);
        goto LABEL_41;
      }
      goto LABEL_9;
    }
    v21 = objc_msgSend(v34, "setAttributes:ofItemAtPath:error:", v9, v19, a5);
    if ((v21 & 1) == 0)
      goto LABEL_9;
    v33 = v7;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v22 = MBSQLiteJournalSuffixes(v21);
    obj = (id)objc_claimAutoreleasedReturnValue(v22);
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (!v23)
    {
      LOBYTE(v17) = 1;
      goto LABEL_40;
    }
    v24 = v23;
    v25 = *(_QWORD *)v40;
    v17 = 1;
LABEL_19:
    v26 = 0;
    while (1)
    {
      if (*(_QWORD *)v40 != v25)
        objc_enumerationMutation(obj);
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stringByAppendingString:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v26)));
      memset(&v38, 0, sizeof(v38));
      v28 = objc_retainAutorelease(v27);
      if (!lstat((const char *)objc_msgSend(v28, "fileSystemRepresentation"), &v38)
        && ((v38.st_mode & 0xF000) != 0x8000 || v38.st_nlink >= 2u))
      {
        break;
      }
      v29 = objc_retainAutorelease(v28);
      if (lchown((const char *)objc_msgSend(v29, "fileSystemRepresentation"), (uid_t)objc_msgSend(v37, "integerValue"), (gid_t)objc_msgSend(v36, "integerValue")))
      {
        if (!a5)
          goto LABEL_32;
        v30 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("chown error: %@"), v29);
LABEL_31:
        v17 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue(v30);
        goto LABEL_33;
      }
      v17 &= objc_msgSend(v34, "setAttributes:ofItemAtPath:error:", v9, v29, a5);
LABEL_33:

      if (v24 == (id)++v26)
      {
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
        if (!v24)
        {
LABEL_40:

          v7 = v33;
          goto LABEL_41;
        }
        goto LABEL_19;
      }
    }
    if (!a5)
    {
LABEL_32:
      v17 = 0;
      goto LABEL_33;
    }
    v30 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("not a regular file"), v32);
    goto LABEL_31;
  }
  if (a5)
  {
    v20 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("not a regular file"), v32);
    goto LABEL_38;
  }
LABEL_9:
  LOBYTE(v17) = 0;
LABEL_41:

  return v17;
}

+ (BOOL)removeSQLiteFileAtPath:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v10 = 0;
  v7 = objc_msgSend(v6, "removeItemAtPath:error:", v5, &v10);
  v8 = v10;

  if (a4 && (v7 & 1) == 0)
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorForNSError:path:format:](MBError, "errorForNSError:path:format:", v8, v5, CFSTR("Error removing copied SQLite file")));

  return v7;
}

+ (BOOL)removeJournalsForSQLiteFileAtPath:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *i;
  void *v14;
  unsigned int v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  BOOL v21;
  id *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  _BYTE v31[128];

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v7 = MBSQLiteJournalSuffixes(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v9)
  {
    v10 = v9;
    v23 = a4;
    v11 = 0;
    v12 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingString:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i)));
        if (objc_msgSend(v6, "fileExistsAtPath:", v14))
        {
          v24 = v11;
          v15 = objc_msgSend(v6, "removeItemAtPath:error:", v14, &v24);
          v16 = v24;

          if (!v15)
          {
            if (v23)
              *v23 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorForNSError:path:format:](MBError, "errorForNSError:path:format:", v16, v14, CFSTR("Error removing copied SQLite file journal")));

            v21 = 0;
            goto LABEL_18;
          }
          v19 = MBGetDefaultLog(v17, v18);
          v20 = objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v30 = v14;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Removed copied SQLite file journal at %@", buf, 0xCu);
            _MBLog(CFSTR("DEBUG"), "Removed copied SQLite file journal at %@", v14);
          }

          v11 = v16;
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      if (v10)
        continue;
      break;
    }
    v21 = 1;
    v16 = v11;
  }
  else
  {
    v16 = 0;
    v21 = 1;
  }
LABEL_18:

  return v21;
}

+ (void)removeAllSQLiteFilesAtPath:(id)a3
{
  id v3;

  v3 = a3;
  +[MBSQLiteFileHandle removeJournalsForSQLiteFileAtPath:error:](MBSQLiteFileHandle, "removeJournalsForSQLiteFileAtPath:error:", v3, 0);
  +[MBSQLiteFileHandle removeSQLiteFileAtPath:error:](MBSQLiteFileHandle, "removeSQLiteFileAtPath:error:", v3, 0);

}

+ (id)SQLiteFileHandleWithOriginalFileHandle:(id)a3 copiedFileHandle:(id)a4
{
  id v5;
  id v6;
  MBSQLiteFileHandle *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[MBSQLiteFileHandle initWithOriginalFileHandle:copiedFileHandle:]([MBSQLiteFileHandle alloc], "initWithOriginalFileHandle:copiedFileHandle:", v6, v5);

  return v7;
}

- (MBSQLiteFileHandle)initWithOriginalFileHandle:(id)a3 copiedFileHandle:(id)a4
{
  id v7;
  MBSQLiteFileHandle *v8;
  MBSQLiteFileHandle *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MBSQLiteFileHandle;
  v8 = -[MBFileHandleProxy initWithFileHandle:](&v11, "initWithFileHandle:", a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_originalFileHandle, a3);

  return v9;
}

- (BOOL)isSQLiteFile
{
  return 1;
}

- (BOOL)statWithBuffer:(stat *)a3 error:(id *)a4
{
  void *v7;
  _BOOL4 v8;
  __darwin_time_t v10;

  if (-[MBFileHandle statWithBuffer:error:](self->_originalFileHandle, "statWithBuffer:error:"))
  {
    v10 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileHandle path](self->_originalFileHandle, "path"));
    v8 = +[MBSQLiteFileHandle lastModifiedForSQLiteFileAtPath:time:error:](MBSQLiteFileHandle, "lastModifiedForSQLiteFileAtPath:time:error:", v7, &v10, a4);

    if (v8)
    {
      a3->st_mtimespec.tv_sec = v10;
      a3->st_mtimespec.tv_nsec = 0;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (BOOL)closeWithError:(id *)a3
{
  unsigned int v5;
  unsigned int v6;
  void *v7;
  void *v8;
  objc_super v10;

  v5 = -[MBFileHandle closeWithError:](self->_originalFileHandle, "closeWithError:");
  v10.receiver = self;
  v10.super_class = (Class)MBSQLiteFileHandle;
  v6 = -[MBFileHandleProxy closeWithError:](&v10, "closeWithError:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileHandleProxy fileHandle](self, "fileHandle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "path"));
  LODWORD(a3) = +[MBSQLiteFileHandle removeSQLiteFileAtPath:error:](MBSQLiteFileHandle, "removeSQLiteFileAtPath:error:", v8, a3) & v6 & v5;

  return (char)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalFileHandle, 0);
}

@end
