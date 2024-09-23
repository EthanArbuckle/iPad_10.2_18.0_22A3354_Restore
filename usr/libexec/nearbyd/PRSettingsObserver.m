@implementation PRSettingsObserver

- (PRSettingsObserver)initWithSettings:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  PRSettingsObserver *v9;
  PRSettingsObserver *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *settingsSubscriptions;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PRSettingsObserver;
  v9 = -[PRSettingsObserver init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a4);
    objc_storeStrong((id *)&v10->_settings, a3);
    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    settingsSubscriptions = v10->_settingsSubscriptions;
    v10->_settingsSubscriptions = v11;

  }
  return v10;
}

- (void)startObserving:(id)a3 observeImmediately:(BOOL)a4 callback:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void (**v10)(_QWORD, _QWORD);
  PRSettingsObserver *v11;
  NSMutableDictionary *settingsSubscriptions;
  id v13;
  NSObject *queue;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  void (**v18)(_QWORD, _QWORD);

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = (void (**)(_QWORD, _QWORD))v9;
  if (v8 && v9)
  {
    v11 = self;
    objc_sync_enter(v11);
    settingsSubscriptions = v11->_settingsSubscriptions;
    v13 = objc_retainBlock(v10);
    -[NSMutableDictionary setObject:forKey:](settingsSubscriptions, "setObject:forKey:", v13, v8);

    -[NSObject addObserver:forKeyPath:options:context:](v11->_settings, "addObserver:forKeyPath:options:context:", v11, v8, 0, 0);
    objc_sync_exit(v11);

    if (v6)
    {
      queue = v11->_queue;
      if (queue)
      {
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_1002F6ED8;
        v16[3] = &unk_100815160;
        v18 = v10;
        v17 = v8;
        dispatch_async(queue, v16);

      }
      else
      {
        ((void (**)(_QWORD, id))v10)[2](v10, v8);
      }
    }
  }
  else
  {
    v15 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003E9ED0(v15);
  }

}

- (void)stopObserving:(id)a3
{
  PRSettingsObserver *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSObject removeObserver:forKeyPath:](v4->_settings, "removeObserver:forKeyPath:", v4, v5);
  -[NSMutableDictionary removeObjectForKey:](v4->_settingsSubscriptions, "removeObjectForKey:", v5);
  objc_sync_exit(v4);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  id v10;
  id v11;
  PRSettingsObserver *v12;
  void (**v13)(_QWORD, _QWORD);
  void *v14;
  NSObject *queue;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  void (**v19)(_QWORD, _QWORD);

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = self;
  objc_sync_enter(v12);
  v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v12->_settingsSubscriptions, "objectForKey:", v9));
  v14 = v13;
  if (v13)
  {
    queue = v12->_queue;
    if (queue)
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1002F70BC;
      v17[3] = &unk_100815160;
      v19 = v13;
      v18 = v9;
      dispatch_sync(queue, v17);

    }
    else
    {
      ((void (**)(_QWORD, id))v13)[2](v13, v9);
    }
  }
  else
  {
    v16 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003E9F10((uint64_t)v9, v16);
    -[NSObject removeObserver:forKeyPath:](v12->_settings, "removeObserver:forKeyPath:", v12, v9);
  }

  objc_sync_exit(v12);
}

- (NSObject)settings
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_settingsSubscriptions, 0);
}

@end
