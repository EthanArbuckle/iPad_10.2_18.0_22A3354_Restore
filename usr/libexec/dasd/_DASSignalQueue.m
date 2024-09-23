@implementation _DASSignalQueue

- (void)addObject:(id)a3
{
  os_unfair_lock_s *p_queueLock;
  id v5;
  void *v6;
  id v7;
  unint64_t limit;
  void *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *signalQueueDictionary;
  void *v13;

  p_queueLock = &self->_queueLock;
  v5 = a3;
  os_unfair_lock_lock(p_queueLock);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_signalQueueDictionary, "allValues"));
  v7 = objc_msgSend(v6, "count");
  limit = self->_limit;

  if ((unint64_t)v7 >= limit)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_signalQueueDictionary, "allKeys"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sortedArrayUsingSelector:", "compare:"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));

    -[NSMutableDictionary removeObjectForKey:](self->_signalQueueDictionary, "removeObjectForKey:", v11);
  }
  signalQueueDictionary = self->_signalQueueDictionary;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](signalQueueDictionary, "setObject:forKeyedSubscript:", v5, v13);

  os_unfair_lock_unlock(p_queueLock);
}

- (double)mean
{
  os_unfair_lock_s *p_queueLock;
  void *v4;
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  double v12;
  void *i;
  double v14;
  double v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  p_queueLock = &self->_queueLock;
  os_unfair_lock_lock(&self->_queueLock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_signalQueueDictionary, "allValues"));
  if (objc_msgSend(v4, "count")
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject")),
        v6 = objc_opt_class(NSNumber),
        isKindOfClass = objc_opt_isKindOfClass(v5, v6),
        v5,
        (isKindOfClass & 1) != 0))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      v12 = 0.0;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i), "doubleValue", (_QWORD)v17);
          v12 = v12 + v14;
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }
    else
    {
      v12 = 0.0;
    }

    v15 = v12 / (double)(unint64_t)objc_msgSend(v8, "count");
    os_unfair_lock_unlock(p_queueLock);
  }
  else
  {
    os_unfair_lock_unlock(p_queueLock);
    v15 = 0.0;
  }

  return v15;
}

- (double)rate
{
  os_unfair_lock_s *p_queueLock;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  NSObject *v16;
  uint64_t v17;
  double v18;
  double v19;
  int v21;
  double v22;
  __int16 v23;
  double v24;
  __int16 v25;
  uint64_t v26;

  p_queueLock = &self->_queueLock;
  os_unfair_lock_lock(&self->_queueLock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_signalQueueDictionary, "allKeys"));
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sortedArrayUsingSelector:", "compare:"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_signalQueueDictionary, "objectForKeyedSubscript:", v6));
    v8 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_signalQueueDictionary, "objectForKeyedSubscript:", v6));
      objc_msgSend(v9, "doubleValue");
      v11 = v10;

      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_signalQueueDictionary, "objectForKeyedSubscript:", v12));
      objc_msgSend(v13, "doubleValue");
      v15 = v14;

      os_unfair_lock_unlock(p_queueLock);
      v16 = os_log_create("com.apple.clas", "signals");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v12, "timeIntervalSinceDate:", v6);
        v21 = 134218496;
        v22 = v11;
        v23 = 2048;
        v24 = v15;
        v25 = 2048;
        v26 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "First %lf, Last %lf, timeInterval %lf", (uint8_t *)&v21, 0x20u);
      }

      objc_msgSend(v12, "timeIntervalSinceDate:", v6);
      v19 = (v15 - v11) / v18;

    }
    else
    {
      os_unfair_lock_unlock(p_queueLock);
      v19 = 0.0;
    }

  }
  else
  {
    os_unfair_lock_unlock(p_queueLock);
    v19 = 0.0;
    v5 = v4;
  }

  return v19;
}

- (_DASSignalQueue)initWithCount:(unint64_t)a3
{
  _DASSignalQueue *v4;
  uint64_t v5;
  NSMutableDictionary *signalQueueDictionary;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_DASSignalQueue;
  v4 = -[_DASSignalQueue init](&v8, "init");
  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", a3));
    signalQueueDictionary = v4->_signalQueueDictionary;
    v4->_signalQueueDictionary = (NSMutableDictionary *)v5;

    v4->_limit = a3;
    v4->_queueLock._os_unfair_lock_opaque = 0;
  }
  return v4;
}

- (id)allObjects
{
  os_unfair_lock_s *p_queueLock;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  p_queueLock = &self->_queueLock;
  os_unfair_lock_lock(&self->_queueLock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_signalQueueDictionary, "allKeys"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sortedArrayUsingSelector:", "compare:"));

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100033504;
  v10[3] = &unk_10015DA58;
  v10[4] = self;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v11 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);
  os_unfair_lock_unlock(p_queueLock);
  v7 = v11;
  v8 = v6;

  return v8;
}

- (id)top
{
  os_unfair_lock_s *p_queueLock;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  p_queueLock = &self->_queueLock;
  os_unfair_lock_lock(&self->_queueLock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_signalQueueDictionary, "allKeys"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sortedArrayUsingSelector:", "compare:"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));
  os_unfair_lock_unlock(p_queueLock);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_signalQueueDictionary, "objectForKeyedSubscript:", v6));

  return v7;
}

- (double)trend
{
  return 0.0;
}

- (double)dominant
{
  return 0.0;
}

- (double)percentile:(double)a3
{
  return 0.0;
}

- (unint64_t)count
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_signalQueueDictionary, "allValues"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

- (unint64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

- (NSMutableDictionary)signalQueueDictionary
{
  return self->_signalQueueDictionary;
}

- (void)setSignalQueueDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_signalQueueDictionary, a3);
}

- (OS_dispatch_queue)executionQueue
{
  return self->_executionQueue;
}

- (void)setExecutionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_executionQueue, a3);
}

- (os_unfair_lock_s)queueLock
{
  return self->_queueLock;
}

- (void)setQueueLock:(os_unfair_lock_s)a3
{
  self->_queueLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executionQueue, 0);
  objc_storeStrong((id *)&self->_signalQueueDictionary, 0);
}

@end
