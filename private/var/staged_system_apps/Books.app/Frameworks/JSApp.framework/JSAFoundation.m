@implementation JSAFoundation

- (JSAFoundation)init
{
  JSAFoundation *v2;
  uint64_t v3;
  NSMutableDictionary *jsTimers;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)JSAFoundation;
  v2 = -[JSAFoundation init](&v12, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    jsTimers = v2->_jsTimers;
    v2->_jsTimers = (NSMutableDictionary *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_USER_INITIATED, 0);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_create("com.apple.iBooks.JSAFoundation", v8);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v9;

  }
  return v2;
}

- (id)setInterval:(id)a3 timeInMS:(double)a4
{
  return sub_F66C((uint64_t)self, a3, 1, a4);
}

- (void)clearInterval:(id)a3
{
  sub_F98C((uint64_t)self, a3);
}

- (id)setTimeout:(id)a3 timeInMS:(double)a4
{
  return sub_F66C((uint64_t)self, a3, 0, a4);
}

- (void)clearTimeout:(id)a3
{
  sub_F98C((uint64_t)self, a3);
}

- (void)_jsTimerFired:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%p"), v4));
  v6 = self->_jsTimers;
  objc_sync_enter(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_jsTimers, "objectForKey:", v5));
  v8 = v7;
  if (v7 && (objc_msgSend(v7, "isRepeating") & 1) == 0)
    -[NSMutableDictionary removeObjectForKey:](self->_jsTimers, "removeObjectForKey:", v5);
  objc_sync_exit(v6);

  v9 = JSALog();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v15 = v5;
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Timer fired: %@: %@", buf, 0x16u);
  }

  if (v8)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_FE0C;
    v12[3] = &unk_9E3B8;
    v13 = v8;
    objc_msgSend(v11, "enqueueBlock:file:line:", v12, CFSTR("JSAFoundation.m"), 186);

  }
}

- (NSMutableDictionary)jsTimers
{
  return self->_jsTimers;
}

- (void)setJsTimers:(id)a3
{
  objc_storeStrong((id *)&self->_jsTimers, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_jsTimers, 0);
}

@end
