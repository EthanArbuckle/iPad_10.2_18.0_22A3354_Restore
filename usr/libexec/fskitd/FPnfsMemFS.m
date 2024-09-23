@implementation FPnfsMemFS

- (FPnfsMemFS)initWithRootPath:(id)a3
{
  id v5;
  FPnfsMemFS *v6;
  FPnfsMemFS *v7;
  FPnfsMemFS *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *fhMap;
  FPnfsMemNode *v11;
  FPnfsMemNode *rootNode;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FPnfsMemFS;
  v6 = -[FPnfsMemFS init](&v14, "init");
  v7 = v6;
  if (!v6)
  {
LABEL_5:
    v8 = v7;
    goto LABEL_7;
  }
  v8 = 0;
  if (!pthread_rwlock_init(&v6->opLock, 0))
  {
    objc_storeStrong((id *)&v7->rootPath, a3);
    v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    fhMap = v7->fhMap;
    v7->fhMap = v9;

    if (!v7->fhMap
      || (atomic_store(1uLL, &v7->filehandle),
          v11 = -[FPnfsMemNode initWithFS:name:parent:]([FPnfsMemNode alloc], "initWithFS:name:parent:", v7, &stru_100056698, 0), rootNode = v7->_rootNode, v7->_rootNode = v11, rootNode, !v7->_rootNode))
    {
      v8 = 0;
      goto LABEL_7;
    }
    goto LABEL_5;
  }
LABEL_7:

  return v8;
}

- (void)performExclusiveMemFS:(id)a3
{
  _opaque_pthread_rwlock_t *p_opLock;
  void (**v4)(_QWORD);

  p_opLock = &self->opLock;
  v4 = (void (**)(_QWORD))a3;
  pthread_rwlock_wrlock(p_opLock);
  v4[2](v4);

  pthread_rwlock_unlock(p_opLock);
}

- (void)performSharedMemFS:(id)a3
{
  _opaque_pthread_rwlock_t *p_opLock;
  void (**v4)(_QWORD);

  p_opLock = &self->opLock;
  v4 = (void (**)(_QWORD))a3;
  pthread_rwlock_rdlock(p_opLock);
  v4[2](v4);

  pthread_rwlock_unlock(p_opLock);
}

- (id)fullPathForRelativePath:(id)a3
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@"), self->rootPath, a3);
}

- (unint64_t)nextFileHandle
{
  unint64_t *p_filehandle;
  unint64_t v3;
  unint64_t result;

  p_filehandle = &self->filehandle;
  do
  {
    v3 = __ldaxr(p_filehandle);
    result = v3 + 1;
  }
  while (__stlxr(v3 + 1, p_filehandle));
  return result;
}

- (void)addNode:(id)a3 withLock:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  NSMutableDictionary *fhMap;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  unsigned int v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  unsigned int v22;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v4)
  {
    fhMap = self->fhMap;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fh"));
    -[NSMutableDictionary setObject:forKey:](fhMap, "setObject:forKey:", v7, v9);

  }
  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100019948;
    v15[3] = &unk_100055518;
    v15[4] = self;
    v16 = v6;
    -[FPnfsMemFS performExclusiveMemFS:](self, "performExclusiveMemFS:", v15);

  }
  if (dword_10005C708)
  {
    v11 = livefs_std_log(v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fh"));
      v14 = objc_msgSend(v7, "nascent");
      *(_DWORD *)buf = 138412802;
      v18 = v7;
      v19 = 2112;
      v20 = v13;
      v21 = 1024;
      v22 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Adding node %@ with filehandle %@ nascent %d", buf, 0x1Cu);

    }
  }

}

- (id)findNode:(id)a3 nascentOk:(BOOL)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  _QWORD v14[4];
  FPnfsMemFS *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t buf[4];
  id v25;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_100019BB0;
  v22 = sub_100019BC0;
  v23 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100019BC8;
  v14[3] = &unk_100055540;
  v17 = &v18;
  v15 = self;
  v5 = a3;
  v16 = v5;
  -[FPnfsMemFS performSharedMemFS:](v15, "performSharedMemFS:", v14);
  v6 = (void *)v19[5];
  if (v6)
  {
    v7 = objc_msgSend(v6, "nascent");
    if ((_DWORD)v7 && !a4)
    {
      if (dword_10005C708)
      {
        v8 = livefs_std_log(v7);
        v9 = objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v25 = v5;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Found nascent node for fh %@", buf, 0xCu);
        }

      }
      v10 = v19[5];
      v19[5] = 0;
LABEL_12:

    }
  }
  else if (dword_10005C708)
  {
    v11 = livefs_std_log(0);
    v10 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Could not find node for fh %@", buf, 0xCu);
    }
    goto LABEL_12;
  }
  v12 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v12;
}

- (id)findNode:(id)a3
{
  return -[FPnfsMemFS findNode:nascentOk:](self, "findNode:nascentOk:", a3, 0);
}

- (void)rmNode:(id)a3
{
  id v3;
  _QWORD v4[4];
  FPnfsMemFS *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100019C84;
  v4[3] = &unk_100055518;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[FPnfsMemFS performExclusiveMemFS:](v5, "performExclusiveMemFS:", v4);

}

- (id)mkMountPath:(id)a3 mountID:(unsigned int)a4
{
  NSString *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t *p_rootPath;
  _BOOL8 v8;
  NSString *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  id v13;
  id v14;
  int v15;
  id v16;
  uint64_t v17;
  unsigned int v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  NSString *v23;
  int v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  NSString *v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  NSObject *v47;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  NSString *rootPath;
  unsigned int v53;
  NSString *v54;
  int v55;
  id obj;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint8_t v68[128];
  uint8_t buf[4];
  NSString *v70;
  __int16 v71;
  unsigned int v72;
  __int16 v73;
  _BYTE v74[10];
  _BYTE v75[128];

  v4 = (NSString *)a3;
  v5 = livefs_std_log(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    rootPath = self->rootPath;
    *(_DWORD *)buf = 138412802;
    v70 = v4;
    v71 = 1024;
    v72 = a4;
    v73 = 2112;
    *(_QWORD *)v74 = rootPath;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "mkMountPath: path = %@ id %u rootPath = %@", buf, 0x1Cu);
  }

  if (-[NSString isAbsolutePath](v4, "isAbsolutePath"))
  {
    p_rootPath = (uint64_t *)&self->rootPath;
    v8 = -[NSString hasPrefix:](v4, "hasPrefix:", self->rootPath);
    if (!v8)
    {
      v32 = livefs_std_log(v8);
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        sub_10003B180((uint64_t)v4, p_rootPath, v33);

      v9 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 2, 0));
      goto LABEL_55;
    }
    if (-[NSString isEqualToString:](v4, "isEqualToString:", *p_rootPath))
    {
      v9 = 0;
      goto LABEL_55;
    }
    v9 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSString substringFromIndex:](v4, "substringFromIndex:", (char *)objc_msgSend((id)*p_rootPath, "length") + 1));

    if (!v9)
    {
      v4 = 0;
      goto LABEL_55;
    }
    v50 = livefs_std_log(v49);
    v51 = objc_claimAutoreleasedReturnValue(v50);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v70 = v9;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "mkMountPath: Relative mount path is %@", buf, 0xCu);
    }

  }
  else
  {
    v9 = v4;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSString pathComponents](v9, "pathComponents"));
  v11 = objc_msgSend(v10, "count");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FPnfsMemFS rootNode](self, "rootNode"));
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  obj = v10;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v75, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = 0;
    v17 = *(_QWORD *)v65;
    v18 = 1 - v11;
    v54 = v9;
    v53 = 1 - v11;
    while (2)
    {
      v19 = 0;
      v55 = v15;
      v20 = v18 + v15;
      v21 = v12;
      v22 = v16;
      do
      {
        if (*(_QWORD *)v65 != v17)
          objc_enumerationMutation(obj);
        v23 = *(NSString **)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)v19);
        v24 = v20 + (_DWORD)v19;
        v63 = v22;
        if (v20 + (_DWORD)v19)
          v25 = 0;
        else
          v25 = a4;
        v26 = objc_msgSend(v21, "mkDirPlaceholder:fhBuffer:wellKnownMount:", v23, &v63, v25);
        v16 = v63;

        v28 = livefs_std_log(v27);
        v29 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138413058;
          v70 = v23;
          v71 = 1024;
          v72 = v26;
          v73 = 1024;
          *(_DWORD *)v74 = v55 + (_DWORD)v19 + 1;
          *(_WORD *)&v74[4] = 1024;
          *(_DWORD *)&v74[6] = v24 == 0;
          _os_log_debug_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "mkMountPath: Making placeholder %@ returned %d i %d isLast %d", buf, 0x1Eu);
        }

        if (v26 != 17 && v26 != 0)
          goto LABEL_33;
        v31 = objc_claimAutoreleasedReturnValue(-[FPnfsMemFS findNode:nascentOk:](self, "findNode:nascentOk:", v16, 1));
        if (!v31)
        {
          v26 = 5;
LABEL_33:

          v4 = v54;
          v12 = v21;
          goto LABEL_50;
        }
        v12 = (void *)v31;
        if (!v24)
        {
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C760, "lookup:", a4));
          if (v34)
            objc_msgSend(v34, "setFileno:", objc_msgSend(v12, "fileno"));

          v16 = 0;
          v12 = 0;
          v9 = v54;
          goto LABEL_37;
        }

        v19 = (char *)v19 + 1;
        v21 = v12;
        v22 = v16;
      }
      while (v14 != v19);
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v75, 16);
      v9 = v54;
      v15 = v55 + (_DWORD)v19;
      v18 = v53;
      if (v14)
        continue;
      break;
    }
  }
  else
  {
    v16 = 0;
  }
LABEL_37:

  v4 = self->rootPath;
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v35 = obj;
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v60;
LABEL_39:
    v39 = 0;
    while (1)
    {
      if (*(_QWORD *)v60 != v38)
        objc_enumerationMutation(v35);
      v40 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingPathComponent:](v4, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * v39)));

      v42 = livefs_std_log(v41);
      v43 = objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v70 = v40;
        _os_log_debug_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEBUG, "mkMountPath: About to mkdir(%@, 0755)", buf, 0xCu);
      }

      v4 = objc_retainAutorelease(v40);
      if (mkdir(-[NSString UTF8String](v4, "UTF8String"), 0x1EDu))
      {
        if (*__error() != 17)
          break;
      }
      if (v37 == (id)++v39)
      {
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
        if (v37)
          goto LABEL_39;
        goto LABEL_48;
      }
    }
    v26 = *__error();

    if (!v26)
      goto LABEL_51;
LABEL_50:
    v44 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v26, 0));
    v45 = (void *)v44;
  }
  else
  {
LABEL_48:

LABEL_51:
    v45 = 0;
  }
  v46 = livefs_std_log(v44);
  v47 = objc_claimAutoreleasedReturnValue(v46);
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
    sub_10003B110((uint64_t)v45, v47);

  v9 = v45;
LABEL_55:

  return v9;
}

- (void)rmMountPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  void *v13;

  v4 = a3;
  v5 = v4;
  if (dword_10005C708)
  {
    v6 = livefs_std_log(v4);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "rmMountPath: %@", buf, 0xCu);
    }

  }
  if (!objc_msgSend(v5, "isAbsolutePath"))
    goto LABEL_9;
  if (objc_msgSend(v5, "hasPrefix:", self->rootPath)
    && (objc_msgSend(v5, "isEqualToString:", self->rootPath) & 1) == 0)
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "substringFromIndex:", (char *)-[NSString length](self->rootPath, "length") + 1));

    v5 = (void *)v8;
LABEL_9:
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10001A47C;
    v10[3] = &unk_100055518;
    v10[4] = self;
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pathComponents"));
    v9 = v11;
    -[FPnfsMemFS performExclusiveMemFS:](self, "performExclusiveMemFS:", v10);

  }
}

- (void)close:(id)a3 keepingMode:(int)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  id v7;
  void (**v8)(id, _QWORD);
  uint64_t v9;
  NSObject *v10;
  int v11;
  id v12;

  v7 = a3;
  v8 = (void (**)(id, _QWORD))a6;
  if (dword_10005C708)
  {
    v9 = livefs_std_log();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Close %@", (uint8_t *)&v11, 0xCu);
    }

  }
  v8[2](v8, 0);

}

- (void)createIn:(id)a3 named:(id)a4 attributes:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;

  v9 = a3;
  v10 = a4;
  v11 = a7;
  if (dword_10005C708)
  {
    v12 = livefs_std_log();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412546;
      v15 = v9;
      v16 = 2112;
      v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Create called dir: %@ name:%@", (uint8_t *)&v14, 0x16u);
    }

  }
  (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))v11 + 2))(v11, 30, 0, 0, 0, 0);

}

- (void)fileAttributes:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  id v17;

  v7 = a3;
  v8 = a5;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))v8;
  if (dword_10005C708)
  {
    v10 = livefs_std_log(v8);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Getattr called for %@", (uint8_t *)&v16, 0xCu);
    }

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FPnfsMemFS findNode:](self, "findNode:", v7));
  v13 = v12;
  if (v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "getattr"));
    if (v14)
      v15 = 0;
    else
      v15 = 28;
    ((void (**)(_QWORD, uint64_t, void *))v9)[2](v9, v15, v14);

  }
  else
  {
    v9[2](v9, 70, 0);
  }

}

- (void)getRootFileHandleWithError:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;

  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))v4;
  if (dword_10005C708)
  {
    v6 = livefs_std_log(v4);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[FPnfsMemFS rootNode](self, "rootNode"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fh"));
      v12 = 138412290;
      v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "GetRootFileHandle %@", (uint8_t *)&v12, 0xCu);

    }
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FPnfsMemFS rootNode](self, "rootNode"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fh"));
  ((void (**)(_QWORD, void *, _QWORD))v5)[2](v5, v11, 0);

}

- (void)lookupIn:(id)a3 name:(id)a4 usingFlags:(unsigned int)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a7;
  v13 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v12;
  if (dword_10005C708)
  {
    v14 = livefs_std_log(v12);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v22 = v10;
      v23 = 2112;
      v24 = v11;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Lookup called dir: %@ name: %@", buf, 0x16u);
    }

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[FPnfsMemFS findNode:](self, "findNode:", v10));
  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "string"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "lookupNode:", v17));

    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "getattr"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "fh"));
      ((void (**)(_QWORD, _QWORD, uint64_t, void *, void *, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v13)[2](v13, 0, 0xFFFFFFFFLL, v20, v19, 0, 0, 0, 0, 0);

    }
    else
    {
      v13[2](v13, 2, 0xFFFFFFFFLL, 0, 0, 0, 0, 0, 0, 0);
    }

  }
  else
  {
    v13[2](v13, 70, 0xFFFFFFFFLL, 0, 0, 0, 0, 0, 0, 0);
  }

}

- (void)makeDirectoryIn:(id)a3 named:(id)a4 attributes:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void (**v15)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  v15 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v14;
  if (dword_10005C708)
  {
    v16 = livefs_std_log(v14);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v28 = v11;
      v29 = 2112;
      v30 = v12;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Mkdir called dir: %@ name: %@", buf, 0x16u);
    }

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[FPnfsMemFS findNode:](self, "findNode:", v11));
  if (v18)
  {
    v25 = v13;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "string"));
    v26 = 0;
    v20 = objc_msgSend(v18, "mkDir:fhBuffer:", v19, &v26);
    v21 = v26;

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "getattr"));
    v23 = 0;
    v24 = 0;
    if (!(_DWORD)v20)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[FPnfsMemFS findNode:](self, "findNode:", v21));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "getattr"));
    }
    ((void (**)(_QWORD, id, void *, id, void *, _QWORD, _QWORD))v15)[2](v15, v20, v22, v21, v24, 0, 0);

    v13 = v25;
  }
  else
  {
    v15[2](v15, 70, 0, 0, 0, 0, 0);
  }

}

- (void)makeSymLinkIn:(id)a3 named:(id)a4 contents:(id)a5 attributes:(id)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;

  v10 = a3;
  v11 = a4;
  v12 = a8;
  if (dword_10005C708 >= 2)
  {
    v13 = livefs_std_log();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412546;
      v16 = v10;
      v17 = 2112;
      v18 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "MakeSymLink called dir: %@ name: %@", (uint8_t *)&v15, 0x16u);
    }

  }
  (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))v12 + 2))(v12, 30, 0, 0, 0, 0);

}

- (void)makeLinkOf:(id)a3 named:(id)a4 inDirectory:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;

  v9 = a4;
  v10 = a5;
  v11 = a7;
  if (dword_10005C708 >= 2)
  {
    v12 = livefs_std_log();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412546;
      v15 = v10;
      v16 = 2112;
      v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "MakeLink called dir: %@ name: %@", (uint8_t *)&v14, 0x16u);
    }

  }
  (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD))v11 + 2))(v11, 30, 0, 0, 0);

}

- (void)makeCloneOf:(id)a3 named:(id)a4 inDirectory:(id)a5 attributes:(id)a6 usingFlags:(unsigned int)a7 requestID:(unint64_t)a8 reply:(id)a9
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;

  v10 = a4;
  v11 = a5;
  v12 = a9;
  if (dword_10005C708 >= 2)
  {
    v13 = livefs_std_log();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412546;
      v16 = v11;
      v17 = 2112;
      v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "MakeClone called dir: %@ name: %@", (uint8_t *)&v15, 0x16u);
    }

  }
  (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))v12 + 2))(v12, 30, 0, 0, 0, 0);

}

- (void)open:(id)a3 withMode:(int)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  id v7;
  void (**v8)(id, _QWORD);
  uint64_t v9;
  NSObject *v10;
  int v11;
  id v12;

  v7 = a3;
  v8 = (void (**)(id, _QWORD))a6;
  if (dword_10005C708 >= 2)
  {
    v9 = livefs_std_log();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Open %@", (uint8_t *)&v11, 0xCu);
    }

  }
  v8[2](v8, 0);

}

- (void)pathConfiguration:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  uint8_t buf[4];
  id v17;

  v6 = a3;
  v7 = a5;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  v15 = 0;
  if (dword_10005C708)
  {
    v9 = livefs_std_log(v7);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Pathconf called on %@", buf, 0xCu);
    }

  }
  v13 = 0x40000002710;
  LOBYTE(v15) = 11;
  v14 = 64;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v13, 16));
  if (v11)
    v12 = 0;
  else
    v12 = 28;
  ((void (**)(_QWORD, uint64_t, void *))v8)[2](v8, v12, v11);

}

- (void)readFrom:(id)a3 atOffset:(unint64_t)a4 intoBuffer:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  id v8;
  void (**v9)(id, uint64_t, _QWORD);
  uint64_t v10;
  NSObject *v11;
  int v12;
  id v13;

  v8 = a3;
  v9 = (void (**)(id, uint64_t, _QWORD))a7;
  if (dword_10005C708 >= 2)
  {
    v10 = livefs_std_log();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Read %@", (uint8_t *)&v12, 0xCu);
    }

  }
  v9[2](v9, 45, 0);

}

- (void)readFrom:(id)a3 length:(unint64_t)a4 atOffset:(unint64_t)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  id v8;
  void (**v9)(id, uint64_t, _QWORD);
  uint64_t v10;
  NSObject *v11;
  int v12;
  id v13;

  v8 = a3;
  v9 = (void (**)(id, uint64_t, _QWORD))a7;
  if (dword_10005C708 >= 2)
  {
    v10 = livefs_std_log();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Read %@", (uint8_t *)&v12, 0xCu);
    }

  }
  v9[2](v9, 45, 0);

}

- (void)readDirectory:(id)a3 amount:(unint64_t)a4 cookie:(unint64_t)a5 verifier:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  id v13;
  id v14;
  void (**v15)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  id v21;

  v13 = a3;
  v14 = a8;
  v15 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v14;
  if (dword_10005C708)
  {
    v16 = livefs_std_log(v14);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138412290;
      v21 = v13;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Readdir called on %@", (uint8_t *)&v20, 0xCu);
    }

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[FPnfsMemFS findNode:](self, "findNode:", v13));
  if (!v18)
    v15[2](v15, 70, 0, 0, 0);
  v20 = 0;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "readDirAtCookie:withVerifier:forBytes:andError:", a5, a6, a4, &v20));
  ((void (**)(_QWORD, _QWORD, id, id, void *))v15)[2](v15, v20, objc_msgSend(v19, "length"), objc_msgSend(v18, "verf"), v19);

}

- (void)readDirectory:(id)a3 intoBuffer:(id)a4 cookie:(unint64_t)a5 verifier:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  unsigned int v22;

  v13 = a4;
  v14 = a8;
  v15 = a3;
  v16 = livefs_std_log(v15);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    sub_10003B204(v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[FPnfsMemFS findNode:](self, "findNode:", v15));
  if (!v18)
    (*((void (**)(id, uint64_t, _QWORD, _QWORD))v14 + 2))(v14, 70, 0, 0);
  v22 = 0;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "readDirAtCookie:withVerifier:forBytes:andError:", a5, a6, objc_msgSend(v13, "length"), &v22));
  if (v19)
  {
    v20 = objc_msgSend(v13, "mutableBytes");
    v21 = objc_retainAutorelease(v19);
    memmove(v20, objc_msgSend(v21, "bytes"), (size_t)objc_msgSend(v21, "length"));
    objc_msgSend(v13, "setLength:", objc_msgSend(v21, "length"));
  }
  (*((void (**)(id, _QWORD, id, id))v14 + 2))(v14, v22, objc_msgSend(v19, "length"), objc_msgSend(v18, "verf"));

}

- (void)readDirectory:(id)a3 amount:(unint64_t)a4 requestedAttributes:(unint64_t)a5 cookie:(unint64_t)a6 verifier:(unint64_t)a7 requestID:(unint64_t)a8 reply:(id)a9
{
  id v13;
  id v14;
  void (**v15)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  id v21;

  v13 = a3;
  v14 = a9;
  v15 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v14;
  if (dword_10005C708 >= 2)
  {
    v16 = livefs_std_log(v14);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138412290;
      v21 = v13;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "ReadDirAndAttrs on %@", (uint8_t *)&v20, 0xCu);
    }

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[FPnfsMemFS findNode:](self, "findNode:", v13));
  if (!v18)
    v15[2](v15, 70, 0, 0, 0);
  v20 = 0;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "readDirAttrAtCookie:withVerifier:forBytes:andError:", a6, a7, a4, &v20));
  ((void (**)(_QWORD, _QWORD, id, id, void *))v15)[2](v15, v20, objc_msgSend(v19, "length"), objc_msgSend(v18, "verf"), v19);

}

- (void)readDirectory:(id)a3 intoBuffer:(id)a4 requestedAttributes:(unint64_t)a5 cookie:(unint64_t)a6 verifier:(unint64_t)a7 requestID:(unint64_t)a8 reply:(id)a9
{
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  unsigned int v22;

  v13 = a3;
  v14 = a4;
  v15 = a9;
  v16 = livefs_std_log(v15);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    sub_10003B244((uint64_t)v13, v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[FPnfsMemFS findNode:](self, "findNode:", v13));
  if (!v18)
    (*((void (**)(id, uint64_t, _QWORD, _QWORD))v15 + 2))(v15, 70, 0, 0);
  v22 = 0;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "readDirAttrAtCookie:withVerifier:forBytes:andError:", a6, a7, objc_msgSend(v14, "length"), &v22));
  if (v19)
  {
    v20 = objc_msgSend(v14, "mutableBytes");
    v21 = objc_retainAutorelease(v19);
    memmove(v20, objc_msgSend(v21, "bytes"), (size_t)objc_msgSend(v21, "length"));
    objc_msgSend(v14, "setLength:", objc_msgSend(v21, "length"));
  }
  (*((void (**)(id, _QWORD, id, id))v15 + 2))(v15, v22, objc_msgSend(v19, "length"), objc_msgSend(v18, "verf"));

}

- (void)readLinkOf:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  id v11;

  v6 = a3;
  v7 = a5;
  if (dword_10005C708 >= 2)
  {
    v8 = livefs_std_log();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "ReadLink %@", (uint8_t *)&v10, 0xCu);
    }

  }
  (*((void (**)(id, uint64_t, _QWORD, _QWORD))v7 + 2))(v7, 45, 0, 0);

}

- (void)reclaim:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  id v11;

  v6 = a3;
  v7 = a5;
  if (dword_10005C708)
  {
    v8 = livefs_std_log();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Reclaim %@", (uint8_t *)&v10, 0xCu);
    }

  }
  (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);

}

- (void)removeItem:(id)a3 from:(id)a4 named:(id)a5 usingFlags:(int)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;

  v10 = a4;
  v11 = a5;
  v12 = a8;
  if (dword_10005C708 >= 2)
  {
    v13 = livefs_std_log();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412546;
      v16 = v10;
      v17 = 2112;
      v18 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Remove dir: %@ name:%@", (uint8_t *)&v15, 0x16u);
    }

  }
  (*((void (**)(id, uint64_t, _QWORD, _QWORD))v12 + 2))(v12, 30, 0, 0);

}

- (void)removeDirectory:(id)a3 from:(id)a4 named:(id)a5 usingFlags:(int)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  int v23;
  id v24;
  __int16 v25;
  id v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a8;
  v16 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v15;
  if (dword_10005C708)
  {
    v17 = livefs_std_log(v15);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 138412546;
      v24 = v13;
      v25 = 2112;
      v26 = v14;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Rmdir dir: %@ name:%@", (uint8_t *)&v23, 0x16u);
    }

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[FPnfsMemFS findNode:](self, "findNode:", v13));
  if (!v19)
    v16[2](v16, 70, 0, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "string"));
  v21 = objc_msgSend(v19, "rmDir:", v20);

  if ((_DWORD)v21)
  {
    ((void (**)(_QWORD, id, _QWORD, _QWORD))v16)[2](v16, v21, 0, 0);
  }
  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "getattr"));
    ((void (**)(_QWORD, _QWORD, void *, _QWORD))v16)[2](v16, 0, v22, 0);

  }
}

- (void)renameItemIn:(id)a3 named:(id)a4 item:(id)a5 toDirectory:(id)a6 newName:(id)a7 toItem:(id)a8 usingFlags:(unsigned int)a9 requestID:(unint64_t)a10 reply:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void (**v24)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  uint8_t buf[4];
  id v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  __int16 v48;
  id v49;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a11;
  v24 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v23;
  if (dword_10005C708 >= 2)
  {
    v25 = livefs_std_log(v23);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v43 = v17;
      v44 = 2112;
      v45 = v18;
      v46 = 2112;
      v47 = v20;
      v48 = 2112;
      v49 = v21;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Rename from dir: %@ from name: %@ to dir: %@ to name: %@", buf, 0x2Au);
    }

  }
  if ((objc_msgSend(v17, "isEqualToString:", v20) & 1) != 0)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[FPnfsMemFS findNode:](self, "findNode:", v17));
    if (v27)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "string"));
      v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "lookupNode:", v28));

      if (v29)
      {
        v41 = (void *)v29;
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "string"));
        v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "lookupNode:", v30));

        v40 = (void *)v31;
        if (v31
          && (v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "string")),
              v33 = objc_msgSend(v27, "rmDir:", v32),
              v32,
              (_DWORD)v33))
        {
          ((void (**)(_QWORD, id, _QWORD, _QWORD, _QWORD))v24)[2](v24, v33, 0, 0, 0);

        }
        else
        {
          v39 = v19;
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "string"));
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "string"));
          v36 = objc_msgSend(v41, "renameFrom:toName:", v34, v35);

          if ((_DWORD)v36)
          {
            ((void (**)(_QWORD, id, _QWORD, _QWORD, _QWORD))v24)[2](v24, v36, 0, 0, 0);
          }
          else
          {
            v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "getattr"));
            v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "getattr"));
            ((void (**)(_QWORD, _QWORD, void *, void *, _QWORD))v24)[2](v24, 0, v37, v38, 0);

          }
          v19 = v39;
        }
      }
      else
      {
        v24[2](v24, 2, 0, 0, 0);
      }
    }
    else
    {
      v24[2](v24, 70, 0, 0, 0);
    }

  }
  else
  {
    v24[2](v24, 18, 0, 0, 0);
  }

}

- (void)setFileAttributesOf:(id)a3 to:(id)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  id v12;

  v7 = a3;
  v8 = a6;
  if (dword_10005C708 >= 2)
  {
    v9 = livefs_std_log();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "SetAttr %@", (uint8_t *)&v11, 0xCu);
    }

  }
  (*((void (**)(id, uint64_t, _QWORD, _QWORD))v8 + 2))(v8, 30, 0, 0);

}

- (void)volumeStatistics:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  _OWORD v13[2];
  uint64_t v14;

  v6 = a3;
  v7 = a5;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  if (dword_10005C708)
  {
    v9 = livefs_std_log(v7);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v13[0]) = 138412290;
      *(_QWORD *)((char *)v13 + 4) = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Statfs called on %@", (uint8_t *)v13, 0xCu);
    }

  }
  v13[0] = vdupq_n_s64(0xF4240uLL);
  v13[1] = xmmword_100044820;
  v14 = 10000;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v13, 40));
  if (v11)
    v12 = 0;
  else
    v12 = 28;
  ((void (**)(_QWORD, uint64_t, void *))v8)[2](v8, v12, v11);

}

- (void)writeTo:(id)a3 atOffset:(unint64_t)a4 fromBuffer:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  id v13;

  v8 = a3;
  v9 = a7;
  if (dword_10005C708 >= 2)
  {
    v10 = livefs_std_log();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Write %@", (uint8_t *)&v12, 0xCu);
    }

  }
  (*((void (**)(id, uint64_t, _QWORD, _QWORD))v9 + 2))(v9, 30, 0, 0);

}

- (void)writeTo:(id)a3 atOffset:(unint64_t)a4 sharedBuffer:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  id v13;

  v8 = a3;
  v9 = a7;
  if (dword_10005C708 >= 2)
  {
    v10 = livefs_std_log();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Write %@", (uint8_t *)&v12, 0xCu);
    }

  }
  (*((void (**)(id, uint64_t, _QWORD, _QWORD))v9 + 2))(v9, 30, 0, 0);

}

- (void)LIWrite:(id)a3 atOffset:(unint64_t)a4 withBuffer:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  id v8;
  void (**v9)(id, uint64_t, _QWORD);
  uint64_t v10;
  NSObject *v11;
  int v12;
  id v13;

  v8 = a3;
  v9 = (void (**)(id, uint64_t, _QWORD))a7;
  if (dword_10005C708 >= 2)
  {
    v10 = livefs_std_log();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Write %@", (uint8_t *)&v12, 0xCu);
    }

  }
  v9[2](v9, 30, 0);

}

- (void)otherAttributeOf:(id)a3 named:(id)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  const char *p_s;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  pid_t v13;
  NSData *v14;
  uint64_t v15;
  char *__s;

  v7 = (void (**)(id, uint64_t, _QWORD))a6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "string"));
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("_B_has_perm_enforcement")) & 1) != 0
    || objc_msgSend(v8, "isEqualToString:", CFSTR("_B_has_access_check")))
  {
    __s = 0;
  }
  else
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("_S_f_type")))
    {
      p_s = "lifs";
      v10 = 5;
      goto LABEL_5;
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("_S_f_location")))
    {
      __s = 0;
      v13 = getpid();
      asprintf(&__s, "fskitd@%d", v13);
      v14 = +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", __s, strlen(__s) + 1, 1);
      v11 = objc_claimAutoreleasedReturnValue(v14);
      goto LABEL_6;
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("_S_f_vol_name")))
    {
      p_s = "LiveFiles";
      v10 = 10;
      goto LABEL_5;
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("_N_caps_format")))
    {
      v15 = 4195072;
    }
    else
    {
      if (!objc_msgSend(v8, "isEqualToString:", CFSTR("_N_caps_interfaces")))
      {
        v7[2](v7, 45, 0);
        goto LABEL_7;
      }
      v15 = 8;
    }
    __s = (char *)v15;
  }
  p_s = (const char *)&__s;
  v10 = 8;
LABEL_5:
  v11 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", p_s, v10));
LABEL_6:
  v12 = (void *)v11;
  v7[2](v7, 0, v11);

LABEL_7:
}

- (void)setOtherAttributeOf:(id)a3 named:(id)a4 value:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  (*((void (**)(id, uint64_t, _QWORD, _QWORD))a7 + 2))(a7, 45, 0, 0);
}

- (void)xattrOf:(id)a3 named:(id)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  (*((void (**)(id, uint64_t, _QWORD))a6 + 2))(a6, 45, 0);
}

- (void)setXattrOf:(id)a3 named:(id)a4 value:(id)a5 how:(int)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  (*((void (**)(id, uint64_t))a8 + 2))(a8, 45);
}

- (void)listXattrsOf:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  (*((void (**)(id, uint64_t, _QWORD))a5 + 2))(a5, 45, 0);
}

- (void)search:(id)a3 token:(id)a4 criteria:(id)a5 resumeAt:(id)a6 maxData:(unsigned int)a7 maxDelay:(double)a8 initialCredits:(unsigned int)a9 requestID:(unint64_t)a10 reply:(id)a11
{
  (*((void (**)(id, uint64_t, double))a11 + 2))(a11, 45, a8);
}

- (void)replenishSearchCreditsFor:(id)a3 credits:(unsigned int)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  (*((void (**)(id, uint64_t))a6 + 2))(a6, 45);
}

- (void)abortSearch:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  (*((void (**)(id, uint64_t))a5 + 2))(a5, 45);
}

- (void)checkAccessTo:(id)a3 requestedAccess:(unsigned int)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  (*((void (**)(id, _QWORD))a6 + 2))(a6, 0);
}

- (void)setUpdateInterest:(id)a3 interest:(BOOL)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  id v7;
  id v8;

  v7 = a6;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 45, 0));
  (*((void (**)(id, id))a6 + 2))(v7, v8);

}

- (void)parentsAndAttributesForItemsByID:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  (*((void (**)(id, uint64_t, _QWORD))a5 + 2))(a5, 45, 0);
}

- (void)pathsAndAttributesForItemsByIDs:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  (*((void (**)(id, uint64_t, _QWORD))a5 + 2))(a5, 45, 0);
}

- (void)verifyItemExistenceByIDs:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  (*((void (**)(id, uint64_t, _QWORD))a5 + 2))(a5, 45, 0);
}

- (void)blockmapFile:(id)a3 range:(_NSRange)a4 startIO:(int)a5 flags:(unsigned int)a6 operationID:(unint64_t)a7 reply:(id)a8
{
  (*((void (**)(id, uint64_t, _QWORD, _QWORD))a8 + 2))(a8, 45, 0, 0);
}

- (void)endIO:(id)a3 range:(_NSRange)a4 status:(int)a5 flags:(unsigned int)a6 operationID:(unint64_t)a7 reply:(id)a8
{
  (*((void (**)(id, uint64_t))a8 + 2))(a8, 45);
}

- (void)fetchVolumeMachPortLabeled:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  (*((void (**)(id, uint64_t, _QWORD))a5 + 2))(a5, 45, 0);
}

- (FPnfsMemNode)rootNode
{
  return (FPnfsMemNode *)objc_getProperty(self, a2, 232, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootNode, 0);
  objc_storeStrong((id *)&self->fhMap, 0);
  objc_storeStrong((id *)&self->rootPath, 0);
}

@end
