@implementation NSObject

- (void)getNode:(id *)a3
{
  -[NSObject doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (BOOL)removeFailedAssetFromDestination:(id)a3 withError:(id *)a4
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  int *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  int *v18;
  int *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  unsigned __int8 v24;
  id v25;
  BOOL v26;
  void *v28;
  objc_class *v29;
  NSString *v30;
  void *v31;
  id v32;
  uint8_t v33[4];
  id v34;
  __int16 v35;
  int v36;
  stat buf;

  v7 = a3;
  if ((-[NSObject conformsToProtocol:](self, "conformsToProtocol:", &OBJC_PROTOCOL___MBRestorable) & 1) == 0)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v29 = (objc_class *)objc_opt_class(self);
    v30 = NSStringFromClass(v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBRestorable.m"), 101, CFSTR("%@ is not MBRestorable"), v31);

  }
  v8 = objc_retainAutorelease(v7);
  v9 = (const char *)objc_msgSend(v8, "fileSystemRepresentation");
  v11 = MBGetDefaultLog(v9, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    buf.st_dev = 138412290;
    *(_QWORD *)&buf.st_mode = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Removing staged item at %@", (uint8_t *)&buf, 0xCu);
    _MBLog(CFSTR("DEBUG"), "Removing staged item at %@", v8);
  }

  memset(&buf, 0, sizeof(buf));
  if (lstat(v9, &buf))
  {
    v13 = __error();
    if (*v13 != 2)
    {
      if (a4)
      {
        v13 = (int *)(id)objc_claimAutoreleasedReturnValue(+[MBError posixErrorWithCode:path:format:](MBError, "posixErrorWithCode:path:format:", 101, v8, CFSTR("lstat error")));
        *a4 = v13;
      }
      v15 = MBGetDefaultLog(v13, v14);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = *__error();
        *(_DWORD *)v33 = 138412546;
        v34 = v8;
        v35 = 1024;
        v36 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "lstat failed at %@: %{errno}d", v33, 0x12u);
        v18 = __error();
        _MBLog(CFSTR("ERROR"), "lstat failed at %@: %{errno}d", v8, *v18);
      }

LABEL_24:
      v26 = 0;
      goto LABEL_25;
    }
  }
  else if ((buf.st_mode & 0xF000) == 0x4000)
  {
    if (rmdir(v9))
    {
      v19 = __error();
      if (*v19 != 66)
      {
        if (a4)
        {
          v26 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue(+[MBError posixErrorWithCode:path:format:](MBError, "posixErrorWithCode:path:format:", 102, v8, CFSTR("rmdir error")));
          goto LABEL_25;
        }
        goto LABEL_24;
      }
      v21 = MBGetDefaultLog(v19, v20);
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v33 = 138412290;
        v34 = v8;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Leaving non-empty staged directory at %@", v33, 0xCu);
        _MBLog(CFSTR("INFO"), "Leaving non-empty staged directory at %@", v8);
      }

    }
  }
  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v32 = 0;
    v24 = objc_msgSend(v23, "removeItemAtPath:error:", v8, &v32);
    v25 = v32;

    if ((v24 & 1) == 0)
    {
      if (a4)
        *a4 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:error:path:format:](MBError, "errorWithCode:error:path:format:", 102, v25, v8, CFSTR("Error removing existing item at %@"), v8));

      goto LABEL_24;
    }

  }
  v26 = 1;
LABEL_25:

  return v26;
}

- (BOOL)restoreOwnershipToDestination:(id)a3 withUserID:(unsigned int)a4 withGroupID:(unsigned int)a5 withError:(id *)a6
{
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  int v17;
  int v18;
  void *v20;
  objc_class *v21;
  NSString *v22;
  void *v23;
  uint8_t buf[4];
  id v25;

  v11 = a3;
  v12 = -[NSObject conformsToProtocol:](self, "conformsToProtocol:", &OBJC_PROTOCOL___MBRestorable);
  if ((v12 & 1) == 0)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v21 = (objc_class *)objc_opt_class(self);
    v22 = NSStringFromClass(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBRestorable.m"), 135, CFSTR("%@ is not MBRestorable"), v23);

  }
  v14 = MBGetDefaultLog(v12, v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v11;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Restoring ownership at %@", buf, 0xCu);
    _MBLog(CFSTR("DEBUG"), "Restoring ownership at %@", v11);
  }

  v16 = objc_retainAutorelease(v11);
  v17 = lchown((const char *)objc_msgSend(v16, "fileSystemRepresentation"), a4, a5);
  v18 = v17;
  if (a6 && v17)
    *a6 = (id)objc_claimAutoreleasedReturnValue(+[MBError posixErrorWithCode:path:format:](MBError, "posixErrorWithCode:path:format:", 102, v16, CFSTR("lchown error")));

  return v18 == 0;
}

- (BOOL)restoreAttributesToDestination:(id)a3 error:(id *)a4
{
  id v7;
  NSObject *v8;
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
  NSObject *v21;
  id v22;
  int *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  unsigned __int8 v28;
  void *v29;
  void *v30;
  void *v32;
  objc_class *v33;
  NSString *v34;
  void *v35;
  void *v36;
  _OWORD v37[4];
  uint64_t v38;
  uint8_t buf[4];
  _BYTE v40[14];
  __int16 v41;
  int v42;

  v7 = a3;
  if ((-[NSObject conformsToProtocol:](self, "conformsToProtocol:", &OBJC_PROTOCOL___MBRestorable) & 1) == 0)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v33 = (objc_class *)objc_opt_class(self);
    v34 = NSStringFromClass(v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBRestorable.m"), 148, CFSTR("%@ is not MBRestorable"), v35);

  }
  v8 = self;
  v38 = 0;
  memset(v37, 0, sizeof(v37));
  -[NSObject getNode:](v8, "getNode:", v37);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject domain](v8, "domain"));
  if (!v9)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("MBRestorable.m"), 154, CFSTR("Null domain"));

  }
  v10 = objc_msgSend(v9, "adjustNodeOwnershipAndPermissionsForDataMigratorPlugIn:path:", v37, v7);
  if ((_DWORD)v10)
  {
    v12 = MBGetDefaultLog(v10, v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v40 = v7;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Fixing ownership at %@", buf, 0xCu);
      _MBLog(CFSTR("DEFAULT"), "Fixing ownership at %@", v7);
    }

  }
  v14 = DWORD1(v37[0]);
  v15 = DWORD2(v37[0]);
  v16 = sub_10007EF4C(v37);
  v17 = sub_10006CED4(v37);
  if (!(_DWORD)v17)
    goto LABEL_24;
  v19 = v17;
  v20 = MBGetDefaultLog(v17, v18);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v40 = v19;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Restoring BSD flags: 0x%x", buf, 8u);
    _MBLog(CFSTR("INFO"), "Restoring BSD flags: 0x%x", v19);
  }

  v22 = objc_retainAutorelease(v7);
  if (lchflags((const char *)objc_msgSend(v22, "fileSystemRepresentation"), v19))
  {
    v23 = __error();
    v24 = *v23;
    v26 = MBGetDefaultLog(v23, v25);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v40 = v19;
      *(_WORD *)&v40[4] = 2112;
      *(_QWORD *)&v40[6] = v22;
      v41 = 1024;
      v42 = v24;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Failed to restore BSD flags (0x%x) at %@: %{errno}d", buf, 0x18u);
      _MBLog(CFSTR("ERROR"), "Failed to restore BSD flags (0x%x) at %@: %{errno}d", v19, v22, v24);
    }

    v28 = 0;
    if (a4)
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[MBError posixErrorWithCode:path:format:](MBError, "posixErrorWithCode:path:format:", 102, v22, CFSTR("lchflags error")));
  }
  else
  {
LABEL_24:
    if (sub_10007EEC8((uint64_t)v37))
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject extendedAttributes](v8, "extendedAttributes"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("com.apple.decmpfs")));

      sub_10006CF3C(v7, v30, 0);
    }
    v28 = -[NSObject restoreAttributesToDestination:withUserID:groupID:permissions:error:](v8, "restoreAttributesToDestination:withUserID:groupID:permissions:error:", v7, v14, v15, v16, a4);
  }

  return v28;
}

- (BOOL)restoreAttributesToDestination:(id)a3 withUserID:(unsigned int)a4 groupID:(unsigned int)a5 permissions:(unsigned __int16)a6 error:(id *)a7
{
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  id v12;
  __int128 v13;
  uint64_t v14;
  time_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  int v20;
  int v21;
  void *v23;
  objc_class *v24;
  NSString *v25;
  void *v26;
  _QWORD v28[8];
  int v29;
  int v30;
  uint64_t v31;
  _QWORD v32[3];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  uint8_t buf[4];
  int v39;
  __int16 v40;
  int v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  time_t v49;
  __int16 v50;
  unsigned int v51;
  __int16 v52;
  id v53;

  v7 = a6;
  v8 = *(_QWORD *)&a5;
  v9 = *(_QWORD *)&a4;
  v12 = a3;
  if ((-[NSObject conformsToProtocol:](self, "conformsToProtocol:", &OBJC_PROTOCOL___MBRestorable) & 1) == 0)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v24 = (objc_class *)objc_opt_class(self);
    v25 = NSStringFromClass(v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBRestorable.m"), 196, CFSTR("%@ is not MBRestorable"), v26);

  }
  v37 = 0;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[NSObject getNode:](self, "getNode:", &v33);
  v32[1] = 0;
  v32[2] = 0;
  v32[0] = 0x39E0000000005;
  v13 = v34;
  v28[0] = v34;
  v28[1] = 0;
  v28[2] = *((_QWORD *)&v34 + 1);
  v28[3] = 0;
  v14 = v35;
  v28[4] = v35;
  v28[5] = 0;
  v15 = time(0);
  v28[6] = v15;
  v28[7] = 0;
  v29 = v9;
  v30 = v8;
  v31 = (unsigned __int16)v7;
  v17 = MBGetDefaultLog(v15, v16);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67110914;
    v39 = v9;
    v40 = 1024;
    v41 = v8;
    v42 = 2048;
    v43 = v13;
    v44 = 2048;
    v45 = *((_QWORD *)&v13 + 1);
    v46 = 2048;
    v47 = v14;
    v48 = 2048;
    v49 = v15;
    v50 = 1024;
    v51 = v7;
    v52 = 2112;
    v53 = v12;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Restoring attributes u/gid %d/%d, b/m/c/atime %ld/%ld/%ld/%ld, permissions 0%o to %@", buf, 0x46u);
    _MBLog(CFSTR("INFO"), "Restoring attributes u/gid %d/%d, b/m/c/atime %ld/%ld/%ld/%ld, permissions 0%o to %@", v9, v8, v13, v14, v15, v7, v12);
  }

  v19 = objc_retainAutorelease(v12);
  v20 = setattrlist((const char *)objc_msgSend(v19, "fileSystemRepresentation"), v32, v28, 0x50uLL, 3u);
  v21 = v20;
  if (a7 && v20 < 0)
    *a7 = (id)objc_claimAutoreleasedReturnValue(+[MBError posixErrorWithPath:format:](MBError, "posixErrorWithPath:format:", v19, CFSTR("setattrlist() failed")));

  return v21 >= 0;
}

- (id)moveFileFromSource:(id)a3 destination:(id)a4 destinationSize:(unint64_t)a5 conflictResolution:(int64_t)a6 error:(id *)a7
{
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  int v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  const char *v32;
  id v33;
  int *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  const __CFString *v40;
  unsigned __int8 v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  void *v45;
  id v46;
  id v47;
  const char *v48;
  id v49;
  int *v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  uint64_t v54;
  NSObject *v55;
  uint64_t v56;
  NSObject *v57;
  void *v59;
  objc_class *v60;
  NSString *v61;
  void *v62;
  id *v63;
  NSObject *v64;
  void *v65;
  id v66;
  _OWORD v67[2];
  __int128 v68;
  __int128 v69;
  uint64_t v70;
  uint8_t buf[4];
  id v72;
  __int16 v73;
  id v74;
  __int16 v75;
  int64_t v76;
  __int16 v77;
  void *v78;

  v13 = a3;
  v14 = a4;
  if ((-[NSObject conformsToProtocol:](self, "conformsToProtocol:", &OBJC_PROTOCOL___MBRestorable) & 1) == 0)
  {
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v60 = (objc_class *)objc_opt_class(self);
    v61 = NSStringFromClass(v60);
    v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
    objc_msgSend(v59, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBRestorable.m"), 233, CFSTR("%@ is not MBRestorable"), v62);

  }
  v15 = self;
  if (!_os_feature_enabled_impl("MobileBackup", "RestoreLocalFilesBackground"))
  {
    v24 = 0;
    goto LABEL_56;
  }
  if (!a6)
    sub_100088B20();
  v70 = 0;
  v68 = 0u;
  v69 = 0u;
  memset(v67, 0, sizeof(v67));
  -[NSObject getNode:](v15, "getNode:", v67);
  if (*((_QWORD *)&v68 + 1) == a5)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MBDigest sha256](MBDigest, "sha256"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "digestForFileAtPath:error:", v14, 0));

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[MBDigest sha256](MBDigest, "sha256"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "digestForFileAtPath:error:", v13, 0));

    if (v17)
    {
      if (v19)
      {
        v20 = objc_msgSend(v17, "isEqualToData:", v19);
        if ((_DWORD)v20)
        {
          v22 = MBGetDefaultLog(v20, v21);
          v23 = objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v72 = v14;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "The hashes of existing file and restoring file are the same. Skip re-restoring On My iPhone file at %@", buf, 0xCu);
            _MBLog(CFSTR("DEFAULT"), "The hashes of existing file and restoring file are the same. Skip re-restoring On My iPhone file at %@", v14);
          }

          v24 = v14;
          goto LABEL_55;
        }
      }
    }

  }
  v63 = a7;
  v64 = v15;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "pathExtension"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v25 = 0;
  v17 = 0;
  while (1)
  {
    if (objc_msgSend(v19, "length"))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByDeletingPathExtension"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %d"), v26, (v25 + 2)));
      v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "stringByAppendingPathExtension:", v19));

      v17 = (void *)v28;
    }
    else
    {
      v26 = v17;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %d"), v14, (v25 + 2)));
    }

    if (a6 == 3)
      break;
    if (a6 == 2)
    {
      v47 = objc_retainAutorelease(v13);
      v48 = (const char *)objc_msgSend(v47, "fileSystemRepresentation");
      v49 = objc_retainAutorelease(v17);
      v29 = link(v48, (const char *)objc_msgSend(v49, "fileSystemRepresentation"));
      if (!(_DWORD)v29)
        goto LABEL_45;
      v50 = __error();
      v35 = *v50;
      v52 = MBGetDefaultLog(v50, v51);
      v53 = objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v72 = v13;
        v73 = 2112;
        v74 = v49;
        v75 = 1024;
        LODWORD(v76) = v35;
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "Failed to hardlink from %@ to %@: %{errno}d", buf, 0x1Cu);
        _MBLog(CFSTR("ERROR"), "Failed to hardlink from %@ to %@: %{errno}d", v47, v49, v35);
      }

      v39 = v35;
      v40 = CFSTR("Failed to hardlink file");
    }
    else
    {
      if (a6 != 1)
        goto LABEL_45;
      v31 = objc_retainAutorelease(v13);
      v32 = (const char *)objc_msgSend(v31, "fileSystemRepresentation");
      v33 = objc_retainAutorelease(v17);
      v29 = clonefile(v32, (const char *)objc_msgSend(v33, "fileSystemRepresentation"), 0);
      if (!(_DWORD)v29)
        goto LABEL_45;
      v34 = __error();
      v35 = *v34;
      v37 = MBGetDefaultLog(v34, v36);
      v38 = objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v72 = v13;
        v73 = 2112;
        v74 = v33;
        v75 = 1024;
        LODWORD(v76) = v35;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Failed to clone from %@ to %@: %{errno}d", buf, 0x1Cu);
        _MBLog(CFSTR("ERROR"), "Failed to clone from %@ to %@: %{errno}d", v31, v33, v35);
      }

      v39 = v35;
      v40 = CFSTR("Failed to clone file");
    }
    v29 = objc_claimAutoreleasedReturnValue(+[MBError errorWithErrno:format:](MBError, "errorWithErrno:format:", v39, v40));
    v42 = (void *)v29;
    if (!v29)
      goto LABEL_45;
LABEL_42:
    if ((_DWORD)v35 != 17)
    {
      if (v63)
      {
        v29 = objc_retainAutorelease(v42);
        *v63 = (id)v29;
      }
      v56 = MBGetDefaultLog(v29, v30);
      v57 = objc_claimAutoreleasedReturnValue(v56);
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138413058;
        v72 = v13;
        v73 = 2112;
        v74 = v14;
        v75 = 2048;
        v76 = a6;
        v77 = 2112;
        v78 = v42;
        _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "Failed to resolve On My iPhone file conflict from %@ to %@(%ld): %@", buf, 0x2Au);
        _MBLog(CFSTR("ERROR"), "Failed to resolve On My iPhone file conflict from %@ to %@(%ld): %@", v13, v14, a6, v42);
      }

LABEL_53:
      v24 = 0;
      goto LABEL_54;
    }

    if (++v25 == 2147483645)
      goto LABEL_53;
  }
  v66 = 0;
  v41 = objc_msgSend(v65, "moveItemAtPath:toPath:error:", v13, v17, &v66);
  v29 = (uint64_t)v66;
  v42 = (void *)v29;
  if ((v41 & 1) != 0)
  {
LABEL_41:
    LODWORD(v35) = 0;
    if (!v42)
      goto LABEL_45;
    goto LABEL_42;
  }
  v43 = MBGetDefaultLog(v29, v30);
  v44 = objc_claimAutoreleasedReturnValue(v43);
  if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    v72 = v13;
    v73 = 2112;
    v74 = v17;
    v75 = 2112;
    v76 = (int64_t)v42;
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "Failed to move from %@ to %@: %@", buf, 0x20u);
    _MBLog(CFSTR("ERROR"), "Failed to move from %@ to %@: %@", v13, v17, v42);
  }

  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "domain"));
  if (!objc_msgSend(v45, "isEqualToString:", NSCocoaErrorDomain))
  {

    goto LABEL_41;
  }
  v46 = objc_msgSend(v42, "code");

  if (v46 == (id)516)
    LODWORD(v35) = 17;
  else
    LODWORD(v35) = 0;
  if (v42)
    goto LABEL_42;
LABEL_45:
  v54 = MBGetDefaultLog(v29, v30);
  v55 = objc_claimAutoreleasedReturnValue(v54);
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v72 = v13;
    v73 = 2112;
    v74 = v17;
    v75 = 2048;
    v76 = a6;
    _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Successfully resolved On My iPhone file conflict from %@ to %@(%ld)", buf, 0x20u);
    _MBLog(CFSTR("DEFAULT"), "Successfully resolved On My iPhone file conflict from %@ to %@(%ld)", v13, v17, a6);
  }

  v24 = v17;
LABEL_54:
  v15 = v64;

LABEL_55:
LABEL_56:

  return v24;
}

- (BOOL)restoreProtectionClassToDestination:(id)a3 unspecifiedDirectoryProtectionClass:(unsigned __int8)a4 logger:(id)a5 error:(id *)a6
{
  unsigned int v8;
  id v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  _BOOL8 v15;
  uint64_t v16;
  _BOOL4 v17;
  unsigned int v18;
  uint64_t v19;
  NSObject *v20;
  char v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  unsigned int v25;
  uint64_t v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  BOOL v35;
  uint64_t v37;
  id v38;
  void *v39;
  _BOOL8 v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  unsigned __int8 v44;
  id v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  uint64_t v52;
  NSObject *v53;
  void *v54;
  objc_class *v55;
  NSString *v56;
  void *v57;
  id v58;
  id v59;
  id v60;
  _OWORD v61[4];
  uint64_t v62;
  uint8_t buf[4];
  _BYTE v64[30];

  v8 = a4;
  v11 = a3;
  v12 = a5;
  if ((-[NSObject conformsToProtocol:](self, "conformsToProtocol:", &OBJC_PROTOCOL___MBRestorable) & 1) == 0)
  {
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v55 = (objc_class *)objc_opt_class(self);
    v56 = NSStringFromClass(v55);
    v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
    objc_msgSend(v54, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBRestorable.m"), 307, CFSTR("%@ is not MBRestorable"), v57);

  }
  v13 = self;
  v62 = 0;
  memset(v61, 0, sizeof(v61));
  -[NSObject getNode:](v13, "getNode:", v61);
  v14 = sub_10007EF10(v61);
  v15 = sub_10007EF24(v61);
  v17 = v15;
  v18 = BYTE4(v62);
  if (v14 && BYTE4(v62) == 255)
  {
    v19 = MBGetDefaultLog(v15, v16);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v64 = v13;
      *(_WORD *)&v64[8] = 1024;
      *(_DWORD *)&v64[10] = v8;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Unspecified data class for %@ -> defaulting to %d", buf, 0x12u);
      _MBLog(CFSTR("INFO"), "Unspecified data class for %@ -> defaulting to %d", v13, v8);
    }

    BYTE4(v62) = v8;
    v18 = v8;
  }
  v21 = v18 != 255 || v14;
  if ((v21 & 1) == 0)
  {
    v18 = 4;
    BYTE4(v62) = 4;
  }
  v22 = MBGetDefaultLog(v15, v16);
  v23 = objc_claimAutoreleasedReturnValue(v22);
  v24 = v23;
  if (!v17 && !v14)
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v64 = v11;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Not restoring protection class for symlink at %@", buf, 0xCu);
      _MBLog(CFSTR("DEBUG"), "Not restoring protection class for symlink at %@", v11);
    }
    goto LABEL_35;
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v64 = v18;
    *(_WORD *)&v64[4] = 2112;
    *(_QWORD *)&v64[6] = v11;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Restoring protection class %d at %@", buf, 0x12u);
    _MBLog(CFSTR("INFO"), "Restoring protection class %d at %@", v18, v11);
  }

  if (v17)
    v25 = 4;
  else
    v25 = 0;
  if (v18)
    v26 = v18;
  else
    v26 = v25;
  v60 = 0;
  v27 = +[MBProtectionClassUtils setWithPath:value:error:](MBProtectionClassUtils, "setWithPath:value:error:", v11, v26, &v60);
  v24 = v60;
  if (!v27)
  {
    if ((+[MBError isError:withCode:](MBError, "isError:withCode:", v24, 208) & 1) == 0)
    {
      v32 = sub_100081D30();
      if (!(_DWORD)v32)
        goto LABEL_35;
      v34 = MBGetDefaultLog(v32, v33);
      v31 = objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v64 = v26;
        *(_WORD *)&v64[4] = 2112;
        *(_QWORD *)&v64[6] = v11;
        *(_WORD *)&v64[14] = 2112;
        *(_QWORD *)&v64[16] = v24;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_FAULT, "Failed to set protection class %d at %@: %@", buf, 0x1Cu);
        _MBLog(CFSTR("FAULT"), "Failed to set protection class %d at %@: %@", v26, v11, v24);
      }
      goto LABEL_34;
    }
    if (+[MBProtectionClassUtils canOpenWhenLocked:](MBProtectionClassUtils, "canOpenWhenLocked:", v26))
    {
      v28 = sub_100081D30();
      if (!(_DWORD)v28)
        goto LABEL_35;
      v30 = MBGetDefaultLog(v28, v29);
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v64 = v26;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_FAULT, "Unexpected device lock error for pc:%d", buf, 8u);
        _MBLog(CFSTR("FAULT"), "Unexpected device lock error for pc:%d");
      }
LABEL_34:

      goto LABEL_35;
    }
    v59 = 0;
    v37 = +[MBProtectionClassUtils getWithPath:error:](MBProtectionClassUtils, "getWithPath:error:", v11, &v59);
    v38 = v59;
    v39 = v38;
    if ((_DWORD)v37 == 255)
    {
      if (a6)
        *a6 = objc_retainAutorelease(v38);
      v48 = sub_100081D30();
      if ((_DWORD)v48)
      {
        v50 = MBGetDefaultLog(v48, v49);
        v51 = objc_claimAutoreleasedReturnValue(v50);
        if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v64 = v11;
          *(_WORD *)&v64[8] = 2112;
          *(_QWORD *)&v64[10] = v39;
          _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_FAULT, "Failed to fetch the protection class for %@: %@", buf, 0x16u);
          _MBLog(CFSTR("FAULT"), "Failed to fetch the protection class for %@: %@", v11, v39);
        }

      }
    }
    else
    {
      v40 = +[MBProtectionClassUtils canOpenWhenLocked:](MBProtectionClassUtils, "canOpenWhenLocked:", v37);
      if (v40)
      {
        v42 = MBGetDefaultLog(v40, v41);
        v43 = objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v64 = 2;
          *(_WORD *)&v64[4] = 1024;
          *(_DWORD *)&v64[6] = v26;
          *(_WORD *)&v64[10] = 2112;
          *(_QWORD *)&v64[12] = v11;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "Restoring protection class %d instead of %d for: %@", buf, 0x18u);
          _MBLog(CFSTR("INFO"), "Restoring protection class %d instead of %d for: %@", 2, v26, v11);
        }

        v58 = v39;
        v44 = +[MBProtectionClassUtils setWithPath:value:error:](MBProtectionClassUtils, "setWithPath:value:error:", v11, 2, &v58);
        v45 = v58;

        if ((v44 & 1) != 0)
        {
          objc_msgSend(v12, "logSetClassForRestorable:state:absolutePath:value:", v13, 5, v11, 2);
          v35 = 1;
        }
        else
        {
          if (a6)
          {
            v46 = objc_retainAutorelease(v45);
            *a6 = v46;
          }
          v52 = MBGetDefaultLog(v46, v47);
          v53 = objc_claimAutoreleasedReturnValue(v52);
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109890;
            *(_DWORD *)v64 = 2;
            *(_WORD *)&v64[4] = 1024;
            *(_DWORD *)&v64[6] = v26;
            *(_WORD *)&v64[10] = 2112;
            *(_QWORD *)&v64[12] = v11;
            *(_WORD *)&v64[20] = 2112;
            *(_QWORD *)&v64[22] = v45;
            _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "Failed to restore protection class %d instead of %d at %@: %@", buf, 0x22u);
            _MBLog(CFSTR("ERROR"), "Failed to restore protection class %d instead of %d at %@: %@", 2, v26, v11, v45);
          }

          v35 = 0;
        }
        v39 = v45;
        goto LABEL_56;
      }
    }
    v35 = 1;
LABEL_56:

    goto LABEL_36;
  }
  objc_msgSend(v12, "logSetClassForRestorable:state:absolutePath:value:", v13, 5, v11, v26);
LABEL_35:
  v35 = 1;
LABEL_36:

  return v35;
}

- (id)restoreLastModifiedWithFD:(int)a3
{
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  objc_class *v17;
  NSString *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  _BYTE buf[12];
  __int16 v26;
  _BYTE v27[10];
  int v28;

  if ((-[NSObject conformsToProtocol:](self, "conformsToProtocol:", &OBJC_PROTOCOL___MBRestorable) & 1) == 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v17 = (objc_class *)objc_opt_class(self);
    v18 = NSStringFromClass(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBRestorable.m"), 376, CFSTR("%@ is not MBRestorable"), v19);

  }
  v6 = self;
  v24 = 0;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = -[NSObject getNode:](v6, "getNode:", &v20);
  v9 = MBGetDefaultLog(v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)*((uint64_t *)&v21 + 1)));
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v11;
    v26 = 2112;
    *(_QWORD *)v27 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Restoring last modified time (%@) for %@", buf, 0x16u);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)*((uint64_t *)&v21 + 1)));
    _MBLog(CFSTR("INFO"), "Restoring last modified time (%@) for %@", v12, v6);

  }
  *(_QWORD *)buf = time(0);
  *(_DWORD *)&buf[8] = 0;
  *(_QWORD *)&v27[2] = *((_QWORD *)&v21 + 1);
  v28 = 0;
  if (futimes(a3, (const timeval *)buf))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject description](v6, "description"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MBError posixErrorWithCode:path:format:](MBError, "posixErrorWithCode:path:format:", 102, v13, CFSTR("futimes error")));

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_setProtectionClassWithPathFSR:(const char *)a3
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  unsigned __int8 v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v16;
  objc_class *v17;
  NSString *v18;
  void *v19;
  id v20;
  _OWORD v21[4];
  uint64_t v22;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const char *v26;

  if ((-[NSObject conformsToProtocol:](self, "conformsToProtocol:", &OBJC_PROTOCOL___MBRestorable) & 1) == 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v17 = (objc_class *)objc_opt_class(self);
    v18 = NSStringFromClass(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBRestorable.m"), 393, CFSTR("%@ is not MBRestorable"), v19);

  }
  v22 = 0;
  memset(v21, 0, sizeof(v21));
  v6 = -[NSObject getNode:](self, "getNode:", v21);
  if (!BYTE4(v22))
  {
    v12 = 0;
LABEL_10:
    v13 = v12;
    v12 = v13;
    goto LABEL_11;
  }
  v8 = MBGetDefaultLog(v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v24 = BYTE4(v22);
    v25 = 2080;
    v26 = a3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Restoring protection class: %d for path: %s", buf, 0x12u);
    _MBLog(CFSTR("INFO"), "Restoring protection class: %d for path: %s", BYTE4(v22), a3);
  }

  v20 = 0;
  v10 = +[MBProtectionClassUtils setWithPathFSR:value:error:](MBProtectionClassUtils, "setWithPathFSR:value:error:", a3, BYTE4(v22), &v20);
  v11 = v20;
  v12 = v11;
  if ((v10 & 1) != 0 || objc_msgSend(v11, "code") == (id)208)
    goto LABEL_10;
  v13 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:error:format:](MBError, "errorWithCode:error:format:", 102, v12, CFSTR("fcntl error")));
LABEL_11:
  v14 = v13;

  return v14;
}

- (id)_setProtectionClassWithFD:(int)a3
{
  uint64_t v3;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  unsigned __int8 v10;
  id v11;
  id v12;
  void *v13;
  void *v15;
  objc_class *v16;
  NSString *v17;
  void *v18;
  id v19;
  _OWORD v20[4];
  uint64_t v21;
  uint8_t buf[4];
  int v23;

  v3 = *(_QWORD *)&a3;
  if ((-[NSObject conformsToProtocol:](self, "conformsToProtocol:", &OBJC_PROTOCOL___MBRestorable) & 1) == 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v16 = (objc_class *)objc_opt_class(self);
    v17 = NSStringFromClass(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBRestorable.m"), 415, CFSTR("%@ is not MBRestorable"), v18);

  }
  v21 = 0;
  memset(v20, 0, sizeof(v20));
  v6 = -[NSObject getNode:](self, "getNode:", v20);
  if (!BYTE4(v21))
  {
    v11 = 0;
LABEL_10:
    v12 = v11;
    v11 = v12;
    goto LABEL_11;
  }
  v8 = MBGetDefaultLog(v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v23 = BYTE4(v21);
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Restoring protection class: %d", buf, 8u);
    _MBLog(CFSTR("INFO"), "Restoring protection class: %d", BYTE4(v21));
  }

  v19 = 0;
  v10 = +[MBProtectionClassUtils setWithFD:value:error:](MBProtectionClassUtils, "setWithFD:value:error:", v3, BYTE4(v21), &v19);
  v11 = v19;
  if ((v10 & 1) != 0
    || +[MBError isError:withCode:](MBError, "isError:withCode:", v11, 208))
  {
    goto LABEL_10;
  }
  v12 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:error:format:](MBError, "errorWithCode:error:format:", 102, v11, CFSTR("fcntl error")));
LABEL_11:
  v13 = v12;

  return v13;
}

- (id)restoreSymbolicLinkAtPath:(id)a3 withTarget:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  id v16;
  NSObject *v17;
  unsigned __int8 v18;
  id v19;
  void *v20;
  id v21;
  void *v23;
  objc_class *v24;
  NSString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  NSObject *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  uint8_t buf[4];
  id v50;

  v7 = a3;
  v8 = a4;
  if ((-[NSObject conformsToProtocol:](self, "conformsToProtocol:", &OBJC_PROTOCOL___MBRestorable) & 1) == 0)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v24 = (objc_class *)objc_opt_class(self);
    v25 = NSStringFromClass(v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBRestorable.m"), 437, CFSTR("%@ is not MBRestorable"), v26);

  }
  v9 = self;
  v48 = 0;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  -[NSObject getNode:](v9, "getNode:", &v44);
  if (!v7)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("MBRestorable.m"), 442, CFSTR("Null path"));

  }
  if (sub_10007EF38(&v44))
  {
    if (v8)
      goto LABEL_7;
  }
  else
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("MBRestorable.m"), 443, CFSTR("Not a symbolic link"));

    if (v8)
      goto LABEL_7;
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("MBRestorable.m"), 444, CFSTR("Target not set for symbolic link"));

LABEL_7:
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject domain](v9, "domain"));
  if (!v10)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("MBRestorable.m"), 447, CFSTR("Null domain"));

  }
  v11 = objc_msgSend(v10, "adjustNodeOwnershipAndPermissionsForDataMigratorPlugIn:path:", &v44, v7);
  if ((_DWORD)v11)
  {
    v13 = MBGetDefaultLog(v11, v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v50 = v7;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Fixing ownership at %@", buf, 0xCu);
      _MBLog(CFSTR("DEFAULT"), "Fixing ownership at %@", v7);
    }

  }
  v43 = 0;
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_10006EBE0;
  v40[3] = &unk_1000D9FF0;
  v41 = v7;
  v15 = v8;
  v31[1] = 3221225472;
  v36 = v45;
  v37 = v46;
  v38 = v47;
  v31[0] = _NSConcreteStackBlock;
  v42 = v15;
  v31[2] = sub_10006EEEC;
  v31[3] = &unk_1000DA018;
  v39 = v48;
  v35 = v44;
  v16 = v41;
  v32 = v16;
  v17 = v9;
  v33 = v17;
  v34 = 0;
  v18 = objc_msgSend(v16, "mb_openatWithFlags:error:setupDir:itemAccessor:", 0x200000, &v43, v40, v31);
  v19 = v43;
  v20 = v19;
  v21 = 0;
  if ((v18 & 1) == 0)
    v21 = v19;

  return v21;
}

- (id)restoreDirectoryAtPath:(id)a3 settingDataProtection:(BOOL)a4
{
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  id v15;
  NSObject *v16;
  unsigned __int8 v17;
  id v18;
  void *v19;
  id v20;
  void *v22;
  objc_class *v23;
  NSString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  NSObject *v31;
  NSObject *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  BOOL v38;
  _QWORD v39[4];
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  uint8_t buf[4];
  id v53;

  v7 = a3;
  if ((-[NSObject conformsToProtocol:](self, "conformsToProtocol:", &OBJC_PROTOCOL___MBRestorable) & 1) == 0)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v23 = (objc_class *)objc_opt_class(self);
    v24 = NSStringFromClass(v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBRestorable.m"), 521, CFSTR("%@ is not MBRestorable"), v25);

  }
  v8 = self;
  if (!v7)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("MBRestorable.m"), 522, CFSTR("Null path"));

  }
  v51 = 0;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  -[NSObject getNode:](v8, "getNode:", &v47);
  if (!sub_10007EF10(&v47))
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("MBRestorable.m"), 526, CFSTR("Not a directory"));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject domain](v8, "domain"));
  if (!v9)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("MBRestorable.m"), 529, CFSTR("Null domain"));

  }
  v10 = objc_msgSend(v9, "adjustNodeOwnershipAndPermissionsForDataMigratorPlugIn:path:", &v47, v7);
  if ((_DWORD)v10)
  {
    v12 = MBGetDefaultLog(v10, v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v53 = v7;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Fixing ownership at %@", buf, 0xCu);
      _MBLog(CFSTR("DEFAULT"), "Fixing ownership at %@", v7);
    }

  }
  v42 = v48;
  v43 = v49;
  v46 = 0;
  v39[0] = _NSConcreteStackBlock;
  v44 = v50;
  v39[1] = 3221225472;
  v39[2] = sub_10006F65C;
  v39[3] = &unk_1000DA040;
  v45 = v51;
  v41 = v47;
  v14 = v7;
  v29[1] = 3221225472;
  v34 = v48;
  v35 = v49;
  v36 = v50;
  v29[0] = _NSConcreteStackBlock;
  v40 = v14;
  v29[2] = sub_10006FAB8;
  v29[3] = &unk_1000DA068;
  v37 = v51;
  v33 = v47;
  v15 = v14;
  v30 = v15;
  v16 = v8;
  v38 = a4;
  v31 = v16;
  v32 = v16;
  v17 = objc_msgSend(v15, "mb_openatWithFlags:error:setupDir:itemAccessor:", 256, &v46, v39, v29);
  v18 = v46;
  v19 = v18;
  v20 = 0;
  if ((v17 & 1) == 0)
    v20 = v18;

  return v20;
}

- (id)restoreEmptyRegularFileAtPath:(id)a3
{
  id v5;
  NSObject *v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  int v12;
  uint64_t v13;
  MBError *v14;
  void *v15;
  void *v17;
  objc_class *v18;
  NSString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _OWORD v24[2];
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint8_t buf[4];
  id v29;

  v5 = a3;
  if ((-[NSObject conformsToProtocol:](self, "conformsToProtocol:", &OBJC_PROTOCOL___MBRestorable) & 1) == 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v18 = (objc_class *)objc_opt_class(self);
    v19 = NSStringFromClass(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBRestorable.m"), 637, CFSTR("%@ is not MBRestorable"), v20);

  }
  v6 = self;
  if (!v5)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("MBRestorable.m"), 638, CFSTR("Null path"));

  }
  v27 = 0;
  v25 = 0u;
  v26 = 0u;
  memset(v24, 0, sizeof(v24));
  -[NSObject getNode:](v6, "getNode:", v24);
  v7 = sub_10007EF24(v24);
  if (!v7)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("MBRestorable.m"), 642, CFSTR("Not a regular file"));

  }
  if (*((_QWORD *)&v25 + 1))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("MBRestorable.m"), 643, CFSTR("Not empty"));

  }
  v9 = MBGetDefaultLog(v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Creating empty file at %@", buf, 0xCu);
    _MBLog(CFSTR("INFO"), "Creating empty file at %@", v5);
  }

  v11 = objc_retainAutorelease(v5);
  v12 = open_dprotected_np((const char *)objc_msgSend(v11, "fileSystemRepresentation"), 1793, 4, 0);
  if (v12 < 0)
  {
    v14 = +[MBError errorWithErrno:path:format:](MBError, "errorWithErrno:path:format:", *__error(), v11, CFSTR("open_dprotected_np error"));
    v13 = objc_claimAutoreleasedReturnValue(v14);
  }
  else
  {
    close(v12);
    v13 = objc_claimAutoreleasedReturnValue(-[NSObject restoreRegularFileAtPath:](v6, "restoreRegularFileAtPath:", v11));
  }
  v15 = (void *)v13;

  return v15;
}

- (id)restoreRegularFileAtPath:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  id v31;
  id v32;
  unsigned __int8 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  int *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  const __CFString *v44;
  BOOL v45;
  id v46;
  uint64_t v47;
  unsigned int v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v60;
  objc_class *v61;
  NSString *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint64_t v73;
  _BYTE buf[24];
  int v75;

  v5 = a3;
  if ((-[NSObject conformsToProtocol:](self, "conformsToProtocol:", &OBJC_PROTOCOL___MBRestorable) & 1) == 0)
  {
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v61 = (objc_class *)objc_opt_class(self);
    v62 = NSStringFromClass(v61);
    v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
    objc_msgSend(v60, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBRestorable.m"), 664, CFSTR("%@ is not MBRestorable"), v63);

  }
  v6 = self;
  if (!v5)
  {
    v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v64, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("MBRestorable.m"), 665, CFSTR("Null path"));

  }
  v73 = 0;
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  -[NSObject getNode:](v6, "getNode:", &v69);
  if (!sub_10007EF24(&v69))
  {
    v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v65, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("MBRestorable.m"), 669, CFSTR("Not a regular file"));

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject domain](v6, "domain"));
  if (!v7)
  {
    v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v66, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("MBRestorable.m"), 672, CFSTR("Null domain"));

  }
  v8 = objc_msgSend(v7, "adjustNodeOwnershipAndPermissionsForDataMigratorPlugIn:path:", &v69, v5);
  if ((_DWORD)v8)
  {
    v10 = MBGetDefaultLog(v8, v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Fixing ownership at %@", buf, 0xCu);
      _MBLog(CFSTR("DEFAULT"), "Fixing ownership at %@", v5);
    }

  }
  v12 = objc_retainAutorelease(v5);
  v13 = (const char *)objc_msgSend(v12, "fileSystemRepresentation");
  v14 = DWORD1(v69);
  v15 = DWORD2(v69);
  v17 = MBGetDefaultLog(v13, v16);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)&buf[4] = v14;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v15;
    *(_WORD *)&buf[14] = 2112;
    *(_QWORD *)&buf[16] = v12;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Restoring regular file ownership: %d:%d at %@", buf, 0x18u);
    _MBLog(CFSTR("INFO"), "Restoring regular file ownership: %d:%d at %@", v14, v15, v12);
  }

  if (!lchown(v13, v14, v15))
  {
    v20 = objc_claimAutoreleasedReturnValue(-[NSObject extendedAttributes](v6, "extendedAttributes"));
    v22 = (void *)v20;
    if (v20)
    {
      v23 = MBGetDefaultLog(v20, v21);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v25 = objc_msgSend(v22, "count");
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)&buf[4] = v25;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v12;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Restoring regular file extended attributes (%ld) at %@", buf, 0x16u);
        _MBLog(CFSTR("INFO"), "Restoring regular file extended attributes (%ld) at %@", objc_msgSend(v22, "count"), v12);
      }

      if (sub_10007EEC8((uint64_t)&v69))
      {
        v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("com.apple.decmpfs")));
        v28 = (void *)v26;
        if (v26)
        {
          v29 = MBGetDefaultLog(v26, v27);
          v30 = objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Not re-applying the com.apple.decmpfs xattr yet.", buf, 2u);
            _MBLog(CFSTR("INFO"), "Not re-applying the com.apple.decmpfs xattr yet.");
          }

          v31 = objc_msgSend(v22, "mutableCopy");
          objc_msgSend(v31, "removeObjectForKey:", CFSTR("com.apple.decmpfs"));

          v22 = v31;
        }
      }
      else
      {
        v28 = 0;
      }
      v68 = 0;
      v33 = +[MBExtendedAttributes setAttributes:forPathFSR:error:](MBExtendedAttributes, "setAttributes:forPathFSR:error:", v22, v13, &v68);
      v32 = v68;
      if ((v33 & 1) == 0)
      {
        v54 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:error:format:](MBError, "errorWithCode:error:format:", 102, v32, CFSTR("setxattr error")));
LABEL_48:
        v19 = v54;
LABEL_49:

        goto LABEL_50;
      }
    }
    else
    {
      v28 = 0;
      v32 = 0;
    }
    v34 = sub_10006CED4(&v69);
    if ((_DWORD)v34)
    {
      v36 = v34;
      v37 = MBGetDefaultLog(v34, v35);
      v38 = objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = v36;
        *(_WORD *)&buf[8] = 2112;
        *(_QWORD *)&buf[10] = v12;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "Restoring regular file BSD flags: 0x%x at %@", buf, 0x12u);
        _MBLog(CFSTR("INFO"), "Restoring regular file BSD flags: 0x%x at %@", v36, v12);
      }

      if (lchflags(v13, v36))
      {
        v39 = __error();
        v40 = *v39;
        v42 = MBGetDefaultLog(v39, v41);
        v43 = objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)&buf[4] = v36;
          *(_WORD *)&buf[8] = 2112;
          *(_QWORD *)&buf[10] = v12;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v40;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "Failed to restore regular file BSD flags (0x%x) at %@: %{errno}d", buf, 0x18u);
          _MBLog(CFSTR("ERROR"), "Failed to restore regular file BSD flags (0x%x) at %@: %{errno}d", v36, v12, v40);
        }

        v44 = CFSTR("lchflags error");
        goto LABEL_47;
      }
    }
    if (sub_10007EEC8((uint64_t)&v69))
    {
      v67 = v32;
      v45 = sub_10006CF3C(v12, v28, &v67);
      v46 = v67;

      if (!v45)
      {
        v54 = v46;
        goto LABEL_54;
      }
      v32 = v46;
    }
    v47 = sub_10007EF4C(&v69);
    v48 = v47;
    v50 = MBGetDefaultLog(v47, v49);
    v51 = objc_claimAutoreleasedReturnValue(v50);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = v48;
      *(_WORD *)&buf[8] = 2112;
      *(_QWORD *)&buf[10] = v12;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_INFO, "Restoring regular file permissions: 0%3o at %@", buf, 0x12u);
      _MBLog(CFSTR("INFO"), "Restoring regular file permissions: 0%3o at %@", v48, v12);
    }

    v52 = lchmod(v13, v48);
    if ((_DWORD)v52)
    {
      v44 = CFSTR("lchmod error");
LABEL_47:
      v54 = (id)objc_claimAutoreleasedReturnValue(+[MBError posixErrorWithCode:path:format:](MBError, "posixErrorWithCode:path:format:", 102, v12, v44));
      goto LABEL_48;
    }
    v55 = MBGetDefaultLog(v52, v53);
    v56 = objc_claimAutoreleasedReturnValue(v55);
    if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
    {
      v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)*((uint64_t *)&v70 + 1)));
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v57;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v12;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "Restoring last modified time (%@) at %@", buf, 0x16u);

      v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)*((uint64_t *)&v70 + 1)));
      _MBLog(CFSTR("INFO"), "Restoring last modified time (%@) at %@", v58, v12);

    }
    *(_QWORD *)buf = time(0);
    *(_DWORD *)&buf[8] = 0;
    *(_QWORD *)&buf[16] = *((_QWORD *)&v70 + 1);
    v75 = 0;
    if (lutimes(v13, (const timeval *)buf))
    {
      v44 = CFSTR("lutimes error");
      goto LABEL_47;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject _setProtectionClassWithPathFSR:](v6, "_setProtectionClassWithPathFSR:", v13));

    if (!v19)
    {
      v32 = 0;
      goto LABEL_49;
    }
    v54 = v19;
LABEL_54:
    v32 = v54;
    goto LABEL_48;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[MBError posixErrorWithCode:path:format:](MBError, "posixErrorWithCode:path:format:", 102, v12, CFSTR("lchown error")));
LABEL_50:

  return v19;
}

@end
