@implementation WAMessageAWDStore

- (WAMessageAWDStore)init
{
  WAMessageAWDStore *v2;
  uint64_t v3;
  NSMutableDictionary *uuidToMessageMap;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *storeQueue;
  uint64_t v9;
  NSObject *p_super;
  id v12;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;

  v13.receiver = self;
  v13.super_class = (Class)WAMessageAWDStore;
  v2 = -[WAMessageAWDStore init](&v13, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    uuidToMessageMap = v2->_uuidToMessageMap;
    v2->_uuidToMessageMap = (NSMutableDictionary *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_create("com.apple.wifi.analytic.messagestoreQ", v6);
    storeQueue = v2->_storeQueue;
    v2->_storeQueue = (OS_dispatch_queue *)v7;

    v9 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    p_super = &v2->_sortedByLastAccess->super.super;
    v2->_sortedByLastAccess = (NSMutableArray *)v9;
  }
  else
  {
    v12 = WALogCategoryDefaultHandle();
    p_super = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v15 = "-[WAMessageAWDStore init]";
      v16 = 1024;
      v17 = 49;
      _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_ERROR, "%{public}s::%d:FAILED to initialize!", buf, 0x12u);
    }
  }

  return v2;
}

- (void)updateMessage:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_claimAutoreleasedReturnValue(-[WAMessageAWDStore storeQueue](self, "storeQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004274;
  block[3] = &unk_1000CCC08;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)messageForUUID:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  dispatch_time_t v9;
  id v10;
  NSObject *v11;
  id v12;
  _QWORD block[4];
  id v15;
  NSObject *v16;
  uint64_t *v17;
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  id location;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;

  v4 = a3;
  objc_initWeak(&location, self);
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_100004880;
  v23 = sub_100004890;
  v24 = 0;
  v5 = dispatch_semaphore_create(0);
  v6 = objc_claimAutoreleasedReturnValue(-[WAMessageAWDStore storeQueue](self, "storeQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004898;
  block[3] = &unk_1000CCC30;
  objc_copyWeak(&v18, &location);
  v7 = v4;
  v15 = v7;
  v17 = &v19;
  v8 = v5;
  v16 = v8;
  dispatch_async(v6, block);

  objc_destroyWeak(&v18);
  v9 = dispatch_time(0, 15000000000);
  if (dispatch_semaphore_wait(v8, v9))
  {
    v10 = WALogCategoryDefaultHandle();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v27 = "-[WAMessageAWDStore messageForUUID:]";
      v28 = 1024;
      v29 = 91;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}s::%d:PARSER: gave up waiting to retrieve message. Bailing to avoid a hang", buf, 0x12u);
    }

  }
  v12 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  objc_destroyWeak(&location);

  return v12;
}

- (void)_insertInOrder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[WAMessageAWDStore sortedByLastAccess](self, "sortedByLastAccess"));
  objc_msgSend(v5, "removeObject:", v4);
  objc_msgSend(v5, "insertObject:atIndex:", v4, objc_msgSend(v5, "indexOfObject:inSortedRange:options:usingComparator:", v4, 0, objc_msgSend(v5, "count"), 1024, &stru_1000CCC70));

}

- (void)_purgeIfNecessary
{
  __int128 v3;
  void *v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  unsigned int v19;
  id v20;
  __int128 v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  unint64_t v35;

  if (-[WAMessageAWDStore storeSize](self, "storeSize") < 0x7A121)
  {
    v20 = WALogCategoryDefaultHandle();
    v5 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446978;
      v23 = "-[WAMessageAWDStore _purgeIfNecessary]";
      v24 = 1024;
      v25 = 117;
      v26 = 2048;
      v27 = -[WAMessageAWDStore storeSize](self, "storeSize");
      v28 = 1024;
      LODWORD(v29) = 500000;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Won't purge message store, store total size (%lu) <= limit: %d", buf, 0x22u);
    }
LABEL_13:

    return;
  }
  if (-[WAMessageAWDStore storeSize](self, "storeSize") > 0x7A120)
  {
    *(_QWORD *)&v3 = 136447746;
    v21 = v3;
    while (1)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[WAMessageAWDStore sortedByLastAccess](self, "sortedByLastAccess", v21));
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastObject"));

      v6 = WALogCategoryDefaultHandle();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      v8 = v7;
      if (!v5)
        break;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject message](v5, "message"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uuid"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject message](v5, "message"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "key"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject message](v5, "message"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "originalClassName"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)((unint64_t)-[NSObject lastModifiedTimeInMillisecondEpoch](v5, "lastModifiedTimeInMillisecondEpoch")/ 0x3E8)));
        v16 = -[WAMessageAWDStore storeSize](self, "storeSize");
        *(_DWORD *)buf = v21;
        v23 = "-[WAMessageAWDStore _purgeIfNecessary]";
        v24 = 1024;
        v25 = 122;
        v26 = 2112;
        v27 = (unint64_t)v10;
        v28 = 2112;
        v29 = v12;
        v30 = 2112;
        v31 = v14;
        v32 = 2112;
        v33 = v15;
        v34 = 2048;
        v35 = v16;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Removing message with UUID:%@ key: %@ and original class name: %@ (that was last modified at %@) as the message store is too big (%lu). If this message was intended for submission, data loss has occurred.", buf, 0x44u);

      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject message](v5, "message"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "uuid"));
      v19 = -[WAMessageAWDStore _removeMessageWithUUID:](self, "_removeMessageWithUUID:", v18);

      if (!v19)
        goto LABEL_13;

      if (-[WAMessageAWDStore storeSize](self, "storeSize") <= 0x7A120)
        return;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v23 = "-[WAMessageAWDStore _purgeIfNecessary]";
      v24 = 1024;
      v25 = 121;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:Trying to purge with an empty store! This is a serious issue.", buf, 0x12u);
    }

    v5 = 0;
    goto LABEL_13;
  }
}

- (void)clearMessageStore
{
  dispatch_semaphore_t v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_time_t v6;
  id v7;
  NSObject *v8;
  _QWORD block[4];
  NSObject *v10;
  id v11;
  id location;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;

  objc_initWeak(&location, self);
  v3 = dispatch_semaphore_create(0);
  v4 = objc_claimAutoreleasedReturnValue(-[WAMessageAWDStore storeQueue](self, "storeQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004F48;
  block[3] = &unk_1000CCC08;
  objc_copyWeak(&v11, &location);
  v5 = v3;
  v10 = v5;
  dispatch_async(v4, block);

  objc_destroyWeak(&v11);
  v6 = dispatch_time(0, 15000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    v7 = WALogCategoryDefaultHandle();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v14 = "-[WAMessageAWDStore clearMessageStore]";
      v15 = 1024;
      v16 = 146;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:PARSER: gave up waiting to clear message store. Bailing to avoid a hang", buf, 0x12u);
    }

  }
  objc_destroyWeak(&location);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableDictionary *uuidToMessageMap;
  id v5;

  uuidToMessageMap = self->_uuidToMessageMap;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", uuidToMessageMap, CFSTR("_uuidToMessageMap"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_storeSize, CFSTR("_storeSize"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sortedByLastAccess, CFSTR("_sortedByLastAccess"));

}

- (WAMessageAWDStore)initWithCoder:(id)a3
{
  id v4;
  WAMessageAWDStore *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSSet *v9;
  void *v10;
  uint64_t v11;
  NSMutableDictionary *uuidToMessageMap;
  dispatch_queue_attr_t v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *storeQueue;
  uint64_t v17;
  NSMutableArray *sortedByLastAccess;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)WAMessageAWDStore;
  v5 = -[WAMessageAWDStore init](&v20, "init");
  if (v5)
  {
    v6 = objc_opt_class(WAMessageAWDStoreEntry);
    v7 = objc_opt_class(NSNumber);
    v8 = objc_opt_class(NSString);
    v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, v7, v8, objc_opt_class(NSMutableDictionary), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("_uuidToMessageMap")));
    uuidToMessageMap = v5->_uuidToMessageMap;
    v5->_uuidToMessageMap = (NSMutableDictionary *)v11;

    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = dispatch_queue_create("com.apple.wifi.analytic.messagestoreQ", v14);
    storeQueue = v5->_storeQueue;
    v5->_storeQueue = (OS_dispatch_queue *)v15;

    v5->_storeSize = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_storeSize"));
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectForKey:", CFSTR("_sortedByLastAccess")));
    sortedByLastAccess = v5->_sortedByLastAccess;
    v5->_sortedByLastAccess = (NSMutableArray *)v17;

  }
  return v5;
}

- (BOOL)_removeMessageWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WAMessageAWDStore uuidToMessageMap](self, "uuidToMessageMap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WAMessageAWDStore uuidToMessageMap](self, "uuidToMessageMap"));
    objc_msgSend(v7, "removeObjectForKey:", v4);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[WAMessageAWDStore sortedByLastAccess](self, "sortedByLastAccess"));
    objc_msgSend(v8, "removeObject:", v6);

    -[WAMessageAWDStore setStoreSize:](self, "setStoreSize:", (_BYTE *)-[WAMessageAWDStore storeSize](self, "storeSize") - (_BYTE *)objc_msgSend(v6, "size"));
  }

  return v6 != 0;
}

- (void)messsageWasSubmittedWithUUID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_claimAutoreleasedReturnValue(-[WAMessageAWDStore storeQueue](self, "storeQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005330;
  block[3] = &unk_1000CCC08;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (NSMutableDictionary)uuidToMessageMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUuidToMessageMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableArray)sortedByLastAccess
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSortedByLastAccess:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (OS_dispatch_queue)storeQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setStoreQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (unint64_t)storeSize
{
  return self->_storeSize;
}

- (void)setStoreSize:(unint64_t)a3
{
  self->_storeSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeQueue, 0);
  objc_storeStrong((id *)&self->_sortedByLastAccess, 0);
  objc_storeStrong((id *)&self->_uuidToMessageMap, 0);
}

@end
