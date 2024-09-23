@implementation _TSF_TSDKextNotifier

- (_TSF_TSDKextNotifier)init
{
  _TSF_TSDKextNotifier *v2;
  NSMutableArray *v3;
  NSMutableArray *matchNotificationsArray;
  NSMutableArray *v5;
  NSMutableArray *terminateNotificationsArray;
  NSObject *v8;
  objc_super v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)_TSF_TSDKextNotifier;
  v2 = -[_TSF_TSDIOKServiceMatcher init](&v9, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    matchNotificationsArray = v2->_matchNotificationsArray;
    v2->_matchNotificationsArray = v3;

    if (v2->_matchNotificationsArray)
    {
      v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      terminateNotificationsArray = v2->_terminateNotificationsArray;
      v2->_terminateNotificationsArray = v5;

      if (v2->_terminateNotificationsArray)
        return v2;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v11 = "_terminateNotificationsArray";
        v12 = 2048;
        v13 = 0;
        v14 = 2048;
        v15 = 0;
        v16 = 2080;
        v17 = "";
        v18 = 2080;
        v19 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDKextNotifier.m";
        v20 = 1024;
        v21 = 179;
        v8 = MEMORY[0x1E0C81028];
        goto LABEL_9;
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v11 = "_matchNotificationsArray != nil";
      v12 = 2048;
      v13 = 0;
      v14 = 2048;
      v15 = 0;
      v16 = 2080;
      v17 = "";
      v18 = 2080;
      v19 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDKextNotifier.m";
      v20 = 1024;
      v21 = 177;
      v8 = MEMORY[0x1E0C81028];
LABEL_9:
      _os_log_impl(&dword_1B56CB000, v8, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
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
  int v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1B5E4E6F0]();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v6 = -[NSString UTF8String](self->super._identifier, "UTF8String");
    v7 = -[NSMutableArray count](self->_matchNotificationsArray, "count");
    *(_DWORD *)buf = 136315394;
    v19 = v6;
    v20 = 1024;
    v21 = v7;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TSDKextNotifier serviceMatched %s matchedCount dispatching notifications to %d registered", buf, 0x12u);
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
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12) + 16))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12));
        ++v12;
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
  int v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((int)-[_TSF_TSDIOKServiceMatcher getMatchedCount](self, "getMatchedCount") <= 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v5 = -[NSString UTF8String](self->super._identifier, "UTF8String");
      v6 = -[NSMutableArray count](self->_terminateNotificationsArray, "count");
      *(_DWORD *)buf = 136315394;
      v19 = v5;
      v20 = 1024;
      v21 = v6;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TSDKextNotifier serviceTerminated %s, dispatching notifications to %d registered", buf, 0x12u);
    }
    v7 = (void *)MEMORY[0x1B5E4E6F0]();
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
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12) + 16))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12));
          ++v12;
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
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  v6 = _sharedTSDIOKServiceMatcherNotificationsQueue;
  if (_sharedTSDIOKServiceMatcherNotificationsQueue)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __53___TSF_TSDKextNotifier_notifyWhenServiceIsAvailable___block_invoke;
    v7[3] = &unk_1E694B338;
    v7[4] = self;
    v8 = v4;
    dispatch_async(v6, v7);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
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
    v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDKextNotifier.m";
    v19 = 1024;
    v20 = 223;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
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
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  v6 = _sharedTSDIOKServiceMatcherNotificationsQueue;
  if (_sharedTSDIOKServiceMatcherNotificationsQueue)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __55___TSF_TSDKextNotifier_notifyWhenServiceIsUnavailable___block_invoke;
    v7[3] = &unk_1E694B338;
    v7[4] = self;
    v8 = v4;
    dispatch_async(v6, v7);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
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
    v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDKextNotifier.m";
    v19 = 1024;
    v20 = 250;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }

}

- (void)dealloc
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  objc_super v8;
  _QWORD block[4];
  id v10;
  id v11;

  v3 = (void *)-[NSMutableArray copy](self->_matchNotificationsArray, "copy");
  v4 = (void *)-[NSMutableArray copy](self->_terminateNotificationsArray, "copy");
  v5 = _sharedTSDIOKServiceMatcherNotificationsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31___TSF_TSDKextNotifier_dealloc__block_invoke;
  block[3] = &unk_1E694B118;
  v10 = v3;
  v11 = v4;
  v6 = v4;
  v7 = v3;
  dispatch_async(v5, block);

  v8.receiver = self;
  v8.super_class = (Class)_TSF_TSDKextNotifier;
  -[_TSF_TSDIOKServiceMatcher dealloc](&v8, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_terminateNotificationsArray, 0);
  objc_storeStrong((id *)&self->_matchNotificationsArray, 0);
}

@end
