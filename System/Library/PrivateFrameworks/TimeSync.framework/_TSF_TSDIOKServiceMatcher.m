@implementation _TSF_TSDIOKServiceMatcher

- (_TSF_TSDIOKServiceMatcher)init
{
  _TSF_TSDIOKServiceMatcher *v2;
  uint64_t v3;
  NSMutableSet *matchedEntryIDs;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)_TSF_TSDIOKServiceMatcher;
  v2 = -[_TSF_TSDIOKServiceMatcher init](&v7, sel_init);
  if (v2)
  {
    if (init_onceToken != -1)
      dispatch_once(&init_onceToken, &__block_literal_global_3);
    if (_sharedTSDIOKServiceMatcherNotificationsQueue)
    {
      if (_sharedTSDIOKServiceMatcherNotificationsPort)
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v3 = objc_claimAutoreleasedReturnValue();
        matchedEntryIDs = v2->_matchedEntryIDs;
        v2->_matchedEntryIDs = (NSMutableSet *)v3;

        if (v2->_matchedEntryIDs)
          return v2;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          v9 = "_matchedEntryIDs != nil";
          v10 = 2048;
          v11 = 0;
          v12 = 2048;
          v13 = 0;
          v14 = 2080;
          v15 = "";
          v16 = 2080;
          v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDKextNotifier.m";
          v18 = 1024;
          v19 = 47;
          v6 = MEMORY[0x1E0C81028];
          goto LABEL_14;
        }
LABEL_15:

        return 0;
      }
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
      *(_DWORD *)buf = 136316418;
      v9 = "_sharedTSDIOKServiceMatcherNotificationsPort != nil";
      v10 = 2048;
      v11 = 0;
      v12 = 2048;
      v13 = 0;
      v14 = 2080;
      v15 = "";
      v16 = 2080;
      v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDKextNotifier.m";
      v18 = 1024;
      v19 = 44;
      v6 = MEMORY[0x1E0C81028];
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
      *(_DWORD *)buf = 136316418;
      v9 = "_sharedTSDIOKServiceMatcherNotificationsQueue != nil";
      v10 = 2048;
      v11 = 0;
      v12 = 2048;
      v13 = 0;
      v14 = 2080;
      v15 = "";
      v16 = 2080;
      v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDKextNotifier.m";
      v18 = 1024;
      v19 = 43;
      v6 = MEMORY[0x1E0C81028];
    }
LABEL_14:
    _os_log_impl(&dword_1B56CB000, v6, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
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
  void *v8;
  uint64_t v9;
  uint64_t v10;
  IOKMatchingNotification *v11;
  IOKMatchingNotification *matchNotification;
  void *v13;
  uint64_t v14;
  IOKMatchingNotification *v15;
  IOKMatchingNotification *terminateNotification;
  IOKMatchingNotification *v17;
  _BOOL4 v18;
  const char *v19;
  const char *v20;
  _QWORD v22[5];
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id location;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
LABEL_9:
    v18 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IOProviderClass"));
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  self->_identifier = v6;

  objc_initWeak(&location, self);
  v8 = (void *)MEMORY[0x1E0D39F08];
  v9 = _sharedTSDIOKServiceMatcherNotificationsPort;
  v10 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __70___TSF_TSDIOKServiceMatcher_startNotificationsWithMatchingDictionary___block_invoke;
  v25[3] = &unk_1E694B310;
  objc_copyWeak(&v26, &location);
  objc_msgSend(v8, "addNotificationOfType:forMatching:usingNotificationPort:error:withHandler:", *MEMORY[0x1E0D39EE8], v5, v9, 0, v25);
  v11 = (IOKMatchingNotification *)objc_claimAutoreleasedReturnValue();
  matchNotification = self->_matchNotification;
  self->_matchNotification = v11;

  if (!self->_matchNotification)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v29 = "_matchNotification != nil";
      v30 = 2048;
      v31 = 0;
      v32 = 2048;
      v33 = 0;
      v34 = 2080;
      v35 = "";
      v36 = 2080;
      v37 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDKextNotifier.m";
      v38 = 1024;
      v39 = 80;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
    goto LABEL_9;
  }
  v13 = (void *)MEMORY[0x1E0D39F08];
  v14 = _sharedTSDIOKServiceMatcherNotificationsPort;
  v23[0] = v10;
  v23[1] = 3221225472;
  v23[2] = __70___TSF_TSDIOKServiceMatcher_startNotificationsWithMatchingDictionary___block_invoke_12;
  v23[3] = &unk_1E694B310;
  objc_copyWeak(&v24, &location);
  objc_msgSend(v13, "addNotificationOfType:forMatching:usingNotificationPort:error:withHandler:", *MEMORY[0x1E0D39EF8], v5, v14, 0, v23);
  v15 = (IOKMatchingNotification *)objc_claimAutoreleasedReturnValue();
  terminateNotification = self->_terminateNotification;
  self->_terminateNotification = v15;

  v17 = self->_terminateNotification;
  v18 = v17 != 0;
  if (v17)
  {
    v22[0] = v10;
    v22[1] = 3221225472;
    v22[2] = __70___TSF_TSDIOKServiceMatcher_startNotificationsWithMatchingDictionary___block_invoke_14;
    v22[3] = &unk_1E694AF60;
    v22[4] = self;
    dispatch_async((dispatch_queue_t)_sharedTSDIOKServiceMatcherNotificationsQueue, v22);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v29 = "_terminateNotification != nil";
    v30 = 2048;
    v31 = 0;
    v32 = 2048;
    v33 = 0;
    v34 = 2080;
    v35 = "";
    v36 = 2080;
    v37 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDKextNotifier.m";
    v38 = 1024;
    v39 = 99;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
LABEL_10:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v19 = -[NSString UTF8String](self->_identifier, "UTF8String");
    v20 = "failed";
    if (v18)
      v20 = "success";
    *(_DWORD *)buf = 136315394;
    v29 = v19;
    v30 = 2080;
    v31 = v20;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TSDIOKServiceMatcher startNotificationsWithMatchingDictionary %s %s", buf, 0x16u);
  }

  return v18;
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
  v6.super_class = (Class)_TSF_TSDIOKServiceMatcher;
  -[_TSF_TSDIOKServiceMatcher dealloc](&v6, sel_dealloc);
}

- (unint64_t)getMatchedCount
{
  return -[NSMutableSet count](self->_matchedEntryIDs, "count");
}

- (void)handleServiceMatched:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v5, "entryID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[NSMutableSet containsObject:](self->_matchedEntryIDs, "containsObject:", v4) & 1) == 0)
  {
    -[NSMutableSet addObject:](self->_matchedEntryIDs, "addObject:", v4);
    -[_TSF_TSDIOKServiceMatcher serviceMatched:](self, "serviceMatched:", v5);
  }

}

- (void)handleServiceTerminated:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v5, "entryID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableSet containsObject:](self->_matchedEntryIDs, "containsObject:", v4))
  {
    -[NSMutableSet removeObject:](self->_matchedEntryIDs, "removeObject:", v4);
    -[_TSF_TSDIOKServiceMatcher serviceTerminated:](self, "serviceTerminated:", v5);
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
