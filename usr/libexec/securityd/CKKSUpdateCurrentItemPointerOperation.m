@implementation CKKSUpdateCurrentItemPointerOperation

- (CKKSUpdateCurrentItemPointerOperation)initWithCKKSOperationDependencies:(id)a3 viewState:(id)a4 newItem:(id)a5 hash:(id)a6 accessGroup:(id)a7 identifier:(id)a8 replacing:(id)a9 hash:(id)a10 ckoperationGroup:(id)a11
{
  id v18;
  id v19;
  id v20;
  CKKSUpdateCurrentItemPointerOperation *v21;
  CKKSUpdateCurrentItemPointerOperation *v22;
  uint64_t v23;
  NSString *currentPointerIdentifier;
  id obj;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  objc_super v33;

  v32 = a3;
  v31 = a4;
  v30 = a5;
  v29 = a6;
  obj = a7;
  v18 = a7;
  v19 = a8;
  v28 = a9;
  v27 = a10;
  v20 = a11;
  v33.receiver = self;
  v33.super_class = (Class)CKKSUpdateCurrentItemPointerOperation;
  v21 = -[CKKSGroupOperation init](&v33, "init");
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_deps, a3);
    objc_storeStrong((id *)&v22->_viewState, a4);
    objc_storeStrong((id *)&v22->_newerItemPersistentRef, a5);
    objc_storeStrong((id *)&v22->_newerItemSHA1, a6);
    objc_storeStrong((id *)&v22->_oldItemPersistentRef, a9);
    objc_storeStrong((id *)&v22->_oldItemSHA1, a10);
    objc_storeStrong((id *)&v22->_accessGroup, obj);
    v23 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v18, v19));
    currentPointerIdentifier = v22->_currentPointerIdentifier;
    v22->_currentPointerIdentifier = (NSString *)v23;

    objc_storeStrong((id *)&v22->_ckoperationGroup, a11);
    -[CKKSUpdateCurrentItemPointerOperation setQualityOfService:](v22, "setQualityOfService:", 25);
  }

  return v22;
}

- (void)dealloc
{
  SecDbItem *newItem;
  SecDbItem *oldItem;
  objc_super v5;

  if (self)
  {
    newItem = self->_newItem;
    if (newItem)
    {
      self->_newItem = 0;
      CFRelease(newItem);
    }
    oldItem = self->_oldItem;
    if (oldItem)
    {
      self->_oldItem = 0;
      CFRelease(oldItem);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)CKKSUpdateCurrentItemPointerOperation;
  -[CKKSGroupOperation dealloc](&v5, "dealloc");
}

- (void)groupStart
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSUpdateCurrentItemPointerOperation deps](self, "deps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "databaseProvider"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100158F18;
  v5[3] = &unk_1002E91A0;
  v5[4] = self;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "dispatchSyncWithSQLTransaction:", v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_fetchAndUpdateMirrorEntry:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  id location;
  void *v31;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = objc_alloc_init((Class)NSBlockOperation);
  objc_msgSend(v5, "setName:", CFSTR("updateCurrentItemPointer-fetchRecordsComplete"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSUpdateCurrentItemPointerOperation deps](self, "deps"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cloudKitClassDependencies"));
  v8 = objc_msgSend(objc_msgSend(v7, "fetchRecordsOperationClass"), "alloc");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "item"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "storedCKRecord"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recordID"));
  v31 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v31, 1));
  v13 = objc_msgSend(v8, "initWithRecordIDs:", v12);
  -[CKKSUpdateCurrentItemPointerOperation setFetchRecordsOperation:](self, "setFetchRecordsOperation:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSUpdateCurrentItemPointerOperation fetchRecordsOperation](self, "fetchRecordsOperation"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "configuration"));
  objc_msgSend(v15, "setIsCloudKitSupportOperation:", 1);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSUpdateCurrentItemPointerOperation fetchRecordsOperation](self, "fetchRecordsOperation"));
  objc_msgSend(v16, "setQualityOfService:", 25);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSUpdateCurrentItemPointerOperation ckoperationGroup](self, "ckoperationGroup"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSUpdateCurrentItemPointerOperation fetchRecordsOperation](self, "fetchRecordsOperation"));
  objc_msgSend(v18, "setGroup:", v17);

  objc_copyWeak(&v29, &location);
  v19 = v5;
  v27 = v19;
  v20 = v4;
  v28 = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSUpdateCurrentItemPointerOperation fetchRecordsOperation](self, "fetchRecordsOperation", _NSConcreteStackBlock, 3221225472, sub_100158A28, &unk_1002E91C8));
  objc_msgSend(v21, "setFetchRecordsCompletionBlock:", &v26);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSUpdateCurrentItemPointerOperation fetchRecordsOperation](self, "fetchRecordsOperation"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSUpdateCurrentItemPointerOperation deps](self, "deps"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "ckdatabase"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSUpdateCurrentItemPointerOperation fetchRecordsOperation](self, "fetchRecordsOperation"));
  objc_msgSend(v24, "addOperation:", v25);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

}

- (SecDbItem)_onqueueFindSecDbItem:(id)a3 accessGroup:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  SecDbItem *v11;
  _QWORD v13[2];
  _QWORD v14[2];

  v13[0] = kSecValuePersistentRef;
  v13[1] = kSecAttrAccessGroup;
  v14[0] = a3;
  v14[1] = a4;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 2));

  v11 = -[CKKSUpdateCurrentItemPointerOperation _onqueueFindSecDbItemWithQuery:error:](self, "_onqueueFindSecDbItemWithQuery:error:", v10, a5);
  return v11;
}

- (SecDbItem)_onqueueFindSecDbItemWithUUID:(id)a3 accessGroup:(id)a4 error:(id *)a5
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  __CFString **v9;
  __CFString ***v10;
  void *v11;
  SecDbItem *v12;
  __CFString **v13;
  id v17;
  _QWORD v18[5];
  _QWORD v19[5];

  v17 = a3;
  v6 = a4;
  v7 = kSecAttrTombstone;
  v8 = kSecAttrUUID;
  v9 = &off_1002E2190;
  v10 = off_1002E4320;
  while (1)
  {
    if (*((_BYTE *)v9 + 8))
    {
      v18[0] = kSecClass;
      v19[0] = *v9;
      v19[1] = kSecAttrSynchronizableAny;
      v18[1] = kSecAttrSynchronizable;
      v18[2] = v7;
      v19[2] = &__kCFBooleanFalse;
      v19[3] = v17;
      v18[3] = v8;
      v18[4] = kSecAttrAccessGroup;
      v19[4] = v6;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 5));
      v12 = -[CKKSUpdateCurrentItemPointerOperation _onqueueFindSecDbItemWithQuery:error:](self, "_onqueueFindSecDbItemWithQuery:error:", v11, a5);

      if (v12)
        break;
    }
    v13 = *v10++;
    v9 = v13;
    if (!v13)
    {
      v12 = 0;
      break;
    }
  }

  return v12;
}

- (SecDbItem)_onqueueFindSecDbItemWithQuery:(id)a3 error:(id *)a4
{
  id v6;
  int v7;
  uint64_t v8;
  SecDbItem *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  const void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  CKKSUpdateCurrentItemPointerOperation *v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  CFTypeRef cf;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint8_t buf[4];
  CFTypeRef v42;

  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v35 = 0;
  cf = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = sub_100158684;
  v34 = sub_100158694;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10015869C;
  v25[3] = &unk_1002E9218;
  v6 = a3;
  v26 = v6;
  v27 = self;
  v28 = &v30;
  v29 = &v37;
  v7 = sub_100011A30(1, 1, 0, (uint64_t)&cf, (uint64_t)v25);
  v8 = v31[5];
  if (!v7)
  {
    if (!v8)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSUpdateCurrentItemPointerOperation viewState](self, "viewState"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "zoneID"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "zoneName"));
      v19 = sub_10000BDF4(CFSTR("ckkscurrent"), v18);
      v20 = objc_claimAutoreleasedReturnValue(v19);

      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v42 = cf;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Query failed, cferror is %@", buf, 0xCu);
      }

      v21 = (void *)cf;
      v22 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:underlying:](NSError, "errorWithDomain:code:description:underlying:", CFSTR("CKKSErrorDomain"), -50, CFSTR("couldn't run query"), cf));
      v23 = (void *)v31[5];
      v31[5] = v22;

      cf = 0;
      if (!*a4)
        goto LABEL_17;
LABEL_14:
      *a4 = objc_retainAutorelease((id)v31[5]);
LABEL_15:
      if (cf)
        CFRelease(cf);
LABEL_17:
      v9 = 0;
      goto LABEL_18;
    }
LABEL_7:
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSUpdateCurrentItemPointerOperation viewState](self, "viewState"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "zoneID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "zoneName"));
    v13 = sub_10000BDF4(CFSTR("ckkscurrent"), v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = (const void *)v31[5];
      *(_DWORD *)buf = 138412290;
      v42 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Query failed: %@", buf, 0xCu);
    }

    if (!a4)
      goto LABEL_15;
    goto LABEL_14;
  }
  if (v8)
    goto LABEL_7;
  if (cf)
    CFRelease(cf);
  v9 = (SecDbItem *)v38[3];
LABEL_18:

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v37, 8);

  return v9;
}

- (NSString)currentPointerIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setCurrentPointerIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (CKKSKeychainViewState)viewState
{
  return (CKKSKeychainViewState *)objc_getProperty(self, a2, 136, 1);
}

- (CKModifyRecordsOperation)modifyRecordsOperation
{
  return (CKModifyRecordsOperation *)objc_getProperty(self, a2, 144, 1);
}

- (void)setModifyRecordsOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (CKFetchRecordsOperation)fetchRecordsOperation
{
  return (CKFetchRecordsOperation *)objc_getProperty(self, a2, 152, 1);
}

- (void)setFetchRecordsOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (CKOperationGroup)ckoperationGroup
{
  return (CKOperationGroup *)objc_getProperty(self, a2, 160, 1);
}

- (void)setCkoperationGroup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (CKKSOperationDependencies)deps
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 168, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (NSString)accessGroup
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (void)setAccessGroup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (NSData)newerItemPersistentRef
{
  return (NSData *)objc_getProperty(self, a2, 184, 1);
}

- (void)setNewerItemPersistentRef:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (NSData)newerItemSHA1
{
  return (NSData *)objc_getProperty(self, a2, 192, 1);
}

- (void)setNewerItemSHA1:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (NSData)oldItemPersistentRef
{
  return (NSData *)objc_getProperty(self, a2, 200, 1);
}

- (void)setOldItemPersistentRef:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (NSData)oldItemSHA1
{
  return (NSData *)objc_getProperty(self, a2, 208, 1);
}

- (void)setOldItemSHA1:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (SecDbItem)newItem
{
  return self->_newItem;
}

- (void)setNewItem:(SecDbItem *)a3
{
  self->_newItem = a3;
}

- (SecDbItem)oldItem
{
  return self->_oldItem;
}

- (void)setOldItem:(SecDbItem *)a3
{
  self->_oldItem = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oldItemSHA1, 0);
  objc_storeStrong((id *)&self->_oldItemPersistentRef, 0);
  objc_storeStrong((id *)&self->_newerItemSHA1, 0);
  objc_storeStrong((id *)&self->_newerItemPersistentRef, 0);
  objc_storeStrong((id *)&self->_accessGroup, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_ckoperationGroup, 0);
  objc_storeStrong((id *)&self->_fetchRecordsOperation, 0);
  objc_storeStrong((id *)&self->_modifyRecordsOperation, 0);
  objc_storeStrong((id *)&self->_viewState, 0);
  objc_storeStrong((id *)&self->_currentPointerIdentifier, 0);
}

@end
