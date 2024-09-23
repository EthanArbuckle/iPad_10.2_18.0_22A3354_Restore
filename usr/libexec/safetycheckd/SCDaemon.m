@implementation SCDaemon

+ (id)sharedDaemon
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100001AF4;
  block[3] = &unk_1000041D8;
  block[4] = a1;
  if (qword_100008980 != -1)
    dispatch_once(&qword_100008980, block);
  return (id)qword_100008978;
}

- (SCDaemon)init
{
  SCDaemon *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *workQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCDaemon;
  v2 = -[SCDaemon init](&v6, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.safetycheckd.queue", 0);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)start
{
  -[SCDaemon wakeXPCListeners](self, "wakeXPCListeners");
  -[SCDaemon registerXPCEventHandlers](self, "registerXPCEventHandlers");
  -[SCDaemon registerBackgroundSystemTasks](self, "registerBackgroundSystemTasks");
}

- (void)wakeXPCListeners
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCDaemon XPCListenerPairs](self, "XPCListenerPairs"));
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v7), "first"));
        objc_msgSend(v8, "resume");

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
  -[SCDaemon setActiveXPCListenerPairs:](self, "setActiveXPCListenerPairs:", v3);

}

- (void)registerXPCEventHandlers
{
  void *v3;
  NSObject *workQueue;
  id v5;
  _QWORD handler[4];
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCDaemon _listenersByEventName](self, "_listenersByEventName"));
  workQueue = self->_workQueue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100001D40;
  handler[3] = &unk_100004200;
  v7 = v3;
  v5 = v3;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", workQueue, handler);

}

- (void)registerBackgroundSystemTasks
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCDaemon backgroundSystemTasks](self, "backgroundSystemTasks"));
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCDaemon workQueue](self, "workQueue"));
        objc_msgSend(v8, "registerForTaskUsingQueue:", v9);

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (id)_listenersByEventName
{
  void *v3;
  void *i;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *j;
  uint64_t v11;
  void *v12;
  id obj;
  uint64_t v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[SCDaemon notifyDListeners](self, "notifyDListeners"));
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v16)
  {
    v15 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "interestedEvents"));
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v18;
          do
          {
            for (j = 0; j != v8; j = (char *)j + 1)
            {
              if (*(_QWORD *)v18 != v9)
                objc_enumerationMutation(v6);
              v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)j);
              v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", v11));
              if (!v12)
              {
                v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
                objc_msgSend(v3, "setObject:forKey:", v12, v11);
              }
              objc_msgSend(v12, "addObject:", v5);

            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          }
          while (v8);
        }

      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v16);
  }

  return v3;
}

- (NSArray)XPCListenerPairs
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;
  id v21;

  v20 = kSharingRemindersMachServiceName;
  v2 = objc_alloc_init((Class)SCSharingReminderDelegate);
  v21 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForKey:", v9));
        v11 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", v9);
        objc_msgSend(v11, "setDelegate:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[SCPair pairWithFirst:second:](SCPair, "pairWithFirst:second:", v11, v10));
        objc_msgSend(v4, "addObject:", v12);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  return (NSArray *)v4;
}

- (NSArray)notifyDListeners
{
  id v2;
  void *v3;
  id v5;

  v2 = objc_alloc_init((Class)SCSharingReminderXPCService);
  v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));

  return (NSArray *)v3;
}

- (NSArray)backgroundSystemTasks
{
  void *v2;
  void *v3;

  v2 = (void *)objc_opt_new(NSMutableArray, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SCSharingReminderXPCService tasks](SCSharingReminderXPCService, "tasks"));
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  return (NSArray *)v2;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (NSArray)activeXPCListenerPairs
{
  return self->_activeXPCListenerPairs;
}

- (void)setActiveXPCListenerPairs:(id)a3
{
  objc_storeStrong((id *)&self->_activeXPCListenerPairs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeXPCListenerPairs, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
