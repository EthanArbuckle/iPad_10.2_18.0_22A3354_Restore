@implementation TSDIOKServiceMatcher

- (TSDIOKServiceMatcher)init
{
  TSDIOKServiceMatcher *v2;
  uint64_t v3;
  NSMutableSet *matchedEntryIDs;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;

  v6.receiver = self;
  v6.super_class = (Class)TSDIOKServiceMatcher;
  v2 = -[TSDIOKServiceMatcher init](&v6, "init");
  if (v2)
  {
    if (qword_100047C30 != -1)
      dispatch_once(&qword_100047C30, &stru_10003C598);
    if (qword_100047C20)
    {
      if (qword_100047C28)
      {
        v3 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
        matchedEntryIDs = v2->_matchedEntryIDs;
        v2->_matchedEntryIDs = (NSMutableSet *)v3;

        if (v2->_matchedEntryIDs)
          return v2;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          v8 = "_matchedEntryIDs != nil";
          v9 = 2048;
          v10 = 0;
          v11 = 2048;
          v12 = 0;
          v13 = 2080;
          v14 = "";
          v15 = 2080;
          v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKextNotifier.m";
          v17 = 1024;
          v18 = 47;
          goto LABEL_14;
        }
LABEL_15:

        return 0;
      }
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
      *(_DWORD *)buf = 136316418;
      v8 = "_sharedTSDIOKServiceMatcherNotificationsPort != nil";
      v9 = 2048;
      v10 = 0;
      v11 = 2048;
      v12 = 0;
      v13 = 2080;
      v14 = "";
      v15 = 2080;
      v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKextNotifier.m";
      v17 = 1024;
      v18 = 44;
    }
    else
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
      *(_DWORD *)buf = 136316418;
      v8 = "_sharedTSDIOKServiceMatcherNotificationsQueue != nil";
      v9 = 2048;
      v10 = 0;
      v11 = 2048;
      v12 = 0;
      v13 = 2080;
      v14 = "";
      v15 = 2080;
      v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKextNotifier.m";
      v17 = 1024;
      v18 = 43;
    }
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    goto LABEL_15;
  }
  return v2;
}

- (BOOL)startNotificationsWithMatchingDictionary:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *identifier;
  uint64_t v8;
  IOKMatchingNotification *v9;
  IOKMatchingNotification *matchNotification;
  uint64_t v11;
  IOKMatchingNotification *v12;
  IOKMatchingNotification *terminateNotification;
  IOKMatchingNotification *v14;
  _BOOL4 v15;
  const char *v16;
  const char *v17;
  _QWORD v19[5];
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id location;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
LABEL_9:
    v15 = 0;
    goto LABEL_10;
  }
  v6 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IOProviderClass")));
  identifier = self->_identifier;
  self->_identifier = v6;

  objc_initWeak(&location, self);
  v8 = qword_100047C28;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10000C608;
  v22[3] = &unk_10003C5C0;
  objc_copyWeak(&v23, &location);
  v9 = (IOKMatchingNotification *)objc_claimAutoreleasedReturnValue(+[IOKService addNotificationOfType:forMatching:usingNotificationPort:error:withHandler:](IOKService, "addNotificationOfType:forMatching:usingNotificationPort:error:withHandler:", IOKFirstMatchNotification, v5, v8, 0, v22));
  matchNotification = self->_matchNotification;
  self->_matchNotification = v9;

  if (!self->_matchNotification)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v26 = "_matchNotification != nil";
      v27 = 2048;
      v28 = 0;
      v29 = 2048;
      v30 = 0;
      v31 = 2080;
      v32 = "";
      v33 = 2080;
      v34 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKextNotifier.m";
      v35 = 1024;
      v36 = 80;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
    goto LABEL_9;
  }
  v11 = qword_100047C28;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10000C6C4;
  v20[3] = &unk_10003C5C0;
  objc_copyWeak(&v21, &location);
  v12 = (IOKMatchingNotification *)objc_claimAutoreleasedReturnValue(+[IOKService addNotificationOfType:forMatching:usingNotificationPort:error:withHandler:](IOKService, "addNotificationOfType:forMatching:usingNotificationPort:error:withHandler:", IOKTerminatedNotification, v5, v11, 0, v20));
  terminateNotification = self->_terminateNotification;
  self->_terminateNotification = v12;

  v14 = self->_terminateNotification;
  v15 = v14 != 0;
  if (v14)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10000C780;
    v19[3] = &unk_10003C4B0;
    v19[4] = self;
    dispatch_async((dispatch_queue_t)qword_100047C20, v19);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v26 = "_terminateNotification != nil";
    v27 = 2048;
    v28 = 0;
    v29 = 2048;
    v30 = 0;
    v31 = 2080;
    v32 = "";
    v33 = 2080;
    v34 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKextNotifier.m";
    v35 = 1024;
    v36 = 99;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
LABEL_10:
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v16 = -[NSString UTF8String](self->_identifier, "UTF8String");
    v17 = "failed";
    if (v15)
      v17 = "success";
    *(_DWORD *)buf = 136315394;
    v26 = v16;
    v27 = 2080;
    v28 = v17;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "TSDIOKServiceMatcher startNotificationsWithMatchingDictionary %s %s", buf, 0x16u);
  }

  return v15;
}

- (void)dealloc
{
  NSMutableSet *matchedEntryIDs;
  IOKMatchingNotification *matchNotification;
  IOKMatchingNotification *terminateNotification;
  objc_super v6;

  matchedEntryIDs = self->_matchedEntryIDs;
  self->_matchedEntryIDs = 0;

  matchNotification = self->_matchNotification;
  self->_matchNotification = 0;

  terminateNotification = self->_terminateNotification;
  self->_terminateNotification = 0;

  v6.receiver = self;
  v6.super_class = (Class)TSDIOKServiceMatcher;
  -[TSDIOKServiceMatcher dealloc](&v6, "dealloc");
}

- (unint64_t)getMatchedCount
{
  return (unint64_t)-[NSMutableSet count](self->_matchedEntryIDs, "count");
}

- (void)handleServiceMatched:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v5, "entryID")));
  if ((-[NSMutableSet containsObject:](self->_matchedEntryIDs, "containsObject:", v4) & 1) == 0)
  {
    -[NSMutableSet addObject:](self->_matchedEntryIDs, "addObject:", v4);
    -[TSDIOKServiceMatcher serviceMatched:](self, "serviceMatched:", v5);
  }

}

- (void)handleServiceTerminated:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v5, "entryID")));
  if (-[NSMutableSet containsObject:](self->_matchedEntryIDs, "containsObject:", v4))
  {
    -[NSMutableSet removeObject:](self->_matchedEntryIDs, "removeObject:", v4);
    -[TSDIOKServiceMatcher serviceTerminated:](self, "serviceTerminated:", v5);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_matchedEntryIDs, 0);
  objc_storeStrong((id *)&self->_terminateNotification, 0);
  objc_storeStrong((id *)&self->_matchNotification, 0);
}

@end
