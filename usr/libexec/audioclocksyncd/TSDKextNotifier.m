@implementation TSDKextNotifier

- (TSDKextNotifier)init
{
  TSDKextNotifier *v2;
  NSMutableArray *v3;
  NSMutableArray *matchNotificationsArray;
  NSMutableArray *v5;
  NSMutableArray *terminateNotificationsArray;
  objc_super v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;

  v8.receiver = self;
  v8.super_class = (Class)TSDKextNotifier;
  v2 = -[TSDIOKServiceMatcher init](&v8, "init");
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    matchNotificationsArray = v2->_matchNotificationsArray;
    v2->_matchNotificationsArray = v3;

    if (v2->_matchNotificationsArray)
    {
      v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      terminateNotificationsArray = v2->_terminateNotificationsArray;
      v2->_terminateNotificationsArray = v5;

      if (v2->_terminateNotificationsArray)
        return v2;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v10 = "_terminateNotificationsArray";
        v11 = 2048;
        v12 = 0;
        v13 = 2048;
        v14 = 0;
        v15 = 2080;
        v16 = "";
        v17 = 2080;
        v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKextNotifier.m";
        v19 = 1024;
        v20 = 179;
        goto LABEL_9;
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v10 = "_matchNotificationsArray != nil";
      v11 = 2048;
      v12 = 0;
      v13 = 2048;
      v14 = 0;
      v15 = 2080;
      v16 = "";
      v17 = 2080;
      v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKextNotifier.m";
      v19 = 1024;
      v20 = 177;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }

    return 0;
  }
  return v2;
}

- (void)serviceMatched:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  unsigned int v7;
  NSMutableArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  unsigned int v21;

  v4 = a3;
  v5 = objc_autoreleasePoolPush();
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v6 = -[NSString UTF8String](self->super._identifier, "UTF8String");
    v7 = -[NSMutableArray count](self->_matchNotificationsArray, "count");
    *(_DWORD *)buf = 136315394;
    v19 = v6;
    v20 = 1024;
    v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "TSDKextNotifier serviceMatched %s matchedCount dispatching notifications to %d registered", buf, 0x12u);
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = self->_matchNotificationsArray;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v12) + 16))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v12));
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

  -[NSMutableArray removeAllObjects](self->_matchNotificationsArray, "removeAllObjects", (_QWORD)v13);
  objc_autoreleasePoolPop(v5);

}

- (void)serviceTerminated:(id)a3
{
  id v4;
  const char *v5;
  unsigned int v6;
  void *v7;
  NSMutableArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  unsigned int v21;

  v4 = a3;
  if ((int)-[TSDIOKServiceMatcher getMatchedCount](self, "getMatchedCount") <= 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v5 = -[NSString UTF8String](self->super._identifier, "UTF8String");
      v6 = -[NSMutableArray count](self->_terminateNotificationsArray, "count");
      *(_DWORD *)buf = 136315394;
      v19 = v5;
      v20 = 1024;
      v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "TSDKextNotifier serviceTerminated %s, dispatching notifications to %d registered", buf, 0x12u);
    }
    v7 = objc_autoreleasePoolPush();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = self->_terminateNotificationsArray;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v12) + 16))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v12));
          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

    -[NSMutableArray removeAllObjects](self->_terminateNotificationsArray, "removeAllObjects", (_QWORD)v13);
    objc_autoreleasePoolPop(v7);
  }

}

- (void)notifyWhenServiceIsAvailable:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;

  v4 = a3;
  v5 = v4;
  v6 = qword_100047C20;
  if (qword_100047C20)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000D028;
    v7[3] = &unk_10003C5E8;
    v7[4] = self;
    v8 = v4;
    dispatch_async(v6, v7);

  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v10 = "_sharedTSDIOKServiceMatcherNotificationsQueue != nil";
    v11 = 2048;
    v12 = 0;
    v13 = 2048;
    v14 = 0;
    v15 = 2080;
    v16 = "";
    v17 = 2080;
    v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKextNotifier.m";
    v19 = 1024;
    v20 = 223;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }

}

- (void)notifyWhenServiceIsUnavailable:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;

  v4 = a3;
  v5 = v4;
  v6 = qword_100047C20;
  if (qword_100047C20)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000D300;
    v7[3] = &unk_10003C5E8;
    v7[4] = self;
    v8 = v4;
    dispatch_async(v6, v7);

  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v10 = "_sharedTSDIOKServiceMatcherNotificationsQueue != nil";
    v11 = 2048;
    v12 = 0;
    v13 = 2048;
    v14 = 0;
    v15 = 2080;
    v16 = "";
    v17 = 2080;
    v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKextNotifier.m";
    v19 = 1024;
    v20 = 250;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }

}

- (void)dealloc
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  objc_super v8;
  _QWORD block[4];
  id v10;
  id v11;

  v3 = -[NSMutableArray copy](self->_matchNotificationsArray, "copy");
  v4 = -[NSMutableArray copy](self->_terminateNotificationsArray, "copy");
  v5 = qword_100047C20;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D550;
  block[3] = &unk_10003C610;
  v10 = v3;
  v11 = v4;
  v6 = v4;
  v7 = v3;
  dispatch_async(v5, block);

  v8.receiver = self;
  v8.super_class = (Class)TSDKextNotifier;
  -[TSDIOKServiceMatcher dealloc](&v8, "dealloc");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_terminateNotificationsArray, 0);
  objc_storeStrong((id *)&self->_matchNotificationsArray, 0);
}

@end
