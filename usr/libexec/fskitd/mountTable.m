@implementation mountTable

- (mountTable)init
{
  mountTable *v2;
  mountTable *v3;
  int v4;
  mountTable *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *mntTable;
  uint64_t v8;
  OS_os_transaction *our_transaction;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)mountTable;
  v2 = -[mountTable init](&v11, "init");
  v3 = v2;
  if (!v2)
  {
LABEL_6:
    v5 = v3;
    goto LABEL_8;
  }
  v4 = pthread_rwlock_init(&v2->opLock, 0);
  v5 = 0;
  *__error() = v4;
  if (!v4)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    mntTable = v3->mntTable;
    v3->mntTable = v6;

    v8 = os_transaction_create("fskitd has the base mountpoint");
    our_transaction = v3->_our_transaction;
    v3->_our_transaction = (OS_os_transaction *)v8;

    if (!v3->mntTable || !v3->_our_transaction)
    {
      v5 = 0;
      goto LABEL_8;
    }
    atomic_store(0, &v3->mountSelector);
    goto LABEL_6;
  }
LABEL_8:

  return v5;
}

- (void)tearDownDaemon:(BOOL)a3 withPath:(id)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  OS_os_transaction *our_transaction;

  v4 = a3;
  v6 = objc_retainAutorelease(a4);
  v7 = unmount((const char *)objc_msgSend(v6, "fileSystemRepresentation"), 0x80000);
  if ((_DWORD)v7)
  {
    v8 = livefs_std_log(v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10003DB8C((uint64_t)v6, v9);

  }
  else if (v4)
  {
    our_transaction = self->_our_transaction;
    self->_our_transaction = 0;

  }
}

- (void)performExclusive:(id)a3
{
  _opaque_pthread_rwlock_t *p_opLock;
  void (**v4)(_QWORD);

  p_opLock = &self->opLock;
  v4 = (void (**)(_QWORD))a3;
  pthread_rwlock_wrlock(p_opLock);
  v4[2](v4);

  pthread_rwlock_unlock(p_opLock);
}

- (void)performShared:(id)a3
{
  _opaque_pthread_rwlock_t *p_opLock;
  void (**v4)(_QWORD);

  p_opLock = &self->opLock;
  v4 = (void (**)(_QWORD))a3;
  pthread_rwlock_rdlock(p_opLock);
  v4[2](v4);

  pthread_rwlock_unlock(p_opLock);
}

- (id)lookup:(unsigned int)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint8_t v13[8];
  _QWORD v14[4];
  mountTable *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_10002C0D0;
  v22 = sub_10002C0E0;
  v23 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000309DC;
  v14[3] = &unk_100055540;
  v17 = &v18;
  v15 = self;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(_QWORD *)&a3));
  v16 = v4;
  v5 = -[mountTable performShared:](v15, "performShared:", v14);
  v6 = (void *)v19[5];
  if (!v6)
  {
    v7 = livefs_std_log(v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "retrying lookup", v13, 2u);
    }

    v9 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->mntTable, "objectForKey:", v4));
    v10 = (void *)v19[5];
    v19[5] = v9;

    v6 = (void *)v19[5];
  }
  v11 = v6;

  _Block_object_dispose(&v18, 8);
  return v11;
}

- (id)lookupByPath:(id)a3
{
  id v3;
  id v4;
  _QWORD v6[4];
  mountTable *v7;
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_10002C0D0;
  v14 = sub_10002C0E0;
  v15 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100030B04;
  v6[3] = &unk_100055D70;
  v7 = self;
  v9 = &v10;
  v3 = a3;
  v8 = v3;
  -[mountTable performShared:](v7, "performShared:", v6);
  v4 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v4;
}

- (id)lookupName:(id)a3 provider:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_10002C0D0;
  v20 = sub_10002C0E0;
  v21 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100030CB8;
  v12[3] = &unk_100055D98;
  v12[4] = self;
  v15 = &v16;
  v8 = v6;
  v13 = v8;
  v9 = v7;
  v14 = v9;
  -[mountTable performShared:](self, "performShared:", v12);
  v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

- (id)preflightMountWithName:(id)a3 displayName:(id)a4 storageName:(id)a5 provider:(id)a6 path:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  id v27;
  uint64_t v29;
  id v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  id v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  id v53;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = sub_10002C0D0;
  v46 = sub_10002C0E0;
  v47 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100031050;
  v31[3] = &unk_100055E10;
  v31[4] = self;
  v19 = v17;
  v32 = v19;
  v20 = v14;
  v33 = v20;
  v36 = &v42;
  v21 = v16;
  v34 = v21;
  v22 = v18;
  v35 = v22;
  v37 = &v38;
  v23 = -[mountTable performShared:](self, "performShared:", v31);
  if (*((_BYTE *)v39 + 24))
  {
    if (a8)
      *a8 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 516, 0));
    v24 = (void *)v43[5];
    v43[5] = 0;

  }
  v25 = livefs_std_log(v23);
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    v29 = v43[5];
    if (a8)
      v30 = *a8;
    else
      v30 = 0;
    *(_DWORD *)buf = 138412802;
    v49 = v20;
    v50 = 2112;
    v51 = v29;
    v52 = 2112;
    v53 = v30;
    _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "preflightMountWithName:volume:%@:rv:%@:error:%@", buf, 0x20u);
  }

  v27 = (id)v43[5];
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);

  return v27;
}

- (void)add:(id)a3
{
  id v3;
  id v4;
  _QWORD v5[4];
  mountTable *v6;
  id v7;
  id v8;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000313F0;
  v5[3] = &unk_100055590;
  v6 = self;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v7, "midx")));
  v3 = v8;
  v4 = v7;
  -[mountTable performExclusive:](v6, "performExclusive:", v5);

}

- (void)remove:(id)a3
{
  id v3;
  _QWORD v4[4];
  mountTable *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100031498;
  v4[3] = &unk_100055518;
  v5 = self;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "midx")));
  v3 = v6;
  -[mountTable performExclusive:](v5, "performExclusive:", v4);

}

- (id)list:(BOOL)a3
{
  id v3;
  _QWORD v5[6];
  BOOL v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_10002C0D0;
  v11 = sub_10002C0E0;
  v12 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003156C;
  v5[3] = &unk_100055E38;
  v6 = a3;
  v5[4] = self;
  v5[5] = &v7;
  -[mountTable performShared:](self, "performShared:", v5);
  v3 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v3;
}

- (unsigned)nextIndex
{
  unsigned int *p_mountSelector;
  unsigned int result;

  p_mountSelector = &self->mountSelector;
  do
    result = __ldaxr(p_mountSelector);
  while (__stlxr(result + 1, p_mountSelector));
  return result;
}

- (void)resetIndex
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10003199C;
  v2[3] = &unk_100054D88;
  v2[4] = self;
  -[mountTable performExclusive:](self, "performExclusive:", v2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_our_transaction, 0);
  objc_storeStrong((id *)&self->mntTable, 0);
}

@end
