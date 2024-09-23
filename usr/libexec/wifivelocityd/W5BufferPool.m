@implementation W5BufferPool

+ (id)sharedW5BufferPool
{
  if (qword_1000FB6B0 != -1)
    dispatch_once(&qword_1000FB6B0, &stru_1000D5D20);
  return (id)qword_1000FB6A8;
}

- (id)initBuffersWithSize:(unint64_t)a3 bufferCount:(unint64_t)a4
{
  W5BufferPool *v6;
  W5BufferPool *v7;
  uint64_t v8;
  NSMutableArray *bufferPool;
  dispatch_semaphore_t v10;
  OS_dispatch_semaphore *semaphore;
  NSObject *v12;
  NSObject *lockBufferPool;
  uint64_t v14;
  NSDate *dateOfInvalidPoolBuffer;
  dispatch_queue_attr_t v16;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *queue;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  objc_super v28;
  int v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;

  v28.receiver = self;
  v28.super_class = (Class)W5BufferPool;
  v6 = -[W5BufferPool init](&v28, "init");
  v7 = v6;
  if (v6)
  {
    v6->_bufferSize = a3;
    v8 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    bufferPool = v7->_bufferPool;
    v7->_bufferPool = (NSMutableArray *)v8;

    v10 = dispatch_semaphore_create(a4);
    semaphore = v7->_semaphore;
    v7->_semaphore = (OS_dispatch_semaphore *)v10;

    v12 = objc_alloc_init((Class)NSObject);
    lockBufferPool = v7->_lockBufferPool;
    v7->_lockBufferPool = v12;

    v14 = objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
    dateOfInvalidPoolBuffer = v7->_dateOfInvalidPoolBuffer;
    v7->_dateOfInvalidPoolBuffer = (NSDate *)v14;

    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    v18 = dispatch_queue_create("BufferPool", v17);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v18;

    for (; a4; --a4)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v7->_dateOfInvalidPoolBuffer, CFSTR("allocDate"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, CFSTR("allocdBuffer"));

      objc_msgSend(v20, "setObject:forKeyedSubscript:", v7->_dateOfInvalidPoolBuffer, CFSTR("lastDateBorrowed"));
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v7->_dateOfInvalidPoolBuffer, CFSTR("lastDateReturned"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, CFSTR("inUse"));

      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v23, CFSTR("timer"));

      -[NSMutableArray addObject:](v7->_bufferPool, "addObject:", v20);
    }
  }
  else
  {
    v25 = sub_10008F56C();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v29 = 136315650;
      v30 = "-[W5BufferPool initBuffersWithSize:bufferCount:]";
      v31 = 2080;
      v32 = "W5BufferPool.m";
      v33 = 1024;
      v34 = 76;
      LODWORD(v27) = 28;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v26, 0, "[wifivelocity] %s (%s:%u) init error!", (const char *)&v29, v27, LODWORD(v28.receiver));
    }

  }
  return v7;
}

- (void)freeIdleBufferOfTimer:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  id v9;
  _BOOL4 v10;
  void *v11;
  unsigned int v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  id obj;
  NSMutableArray *v30;
  W5BufferPool *v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  _BYTE v38[14];
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  _BYTE v45[128];

  v4 = a3;
  v31 = self;
  obj = (id)objc_claimAutoreleasedReturnValue(-[W5BufferPool lockBufferPool](self, "lockBufferPool"));
  objc_sync_enter(obj);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v30 = self->_bufferPool;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
  if (v5)
  {
    v32 = *(_QWORD *)v34;
    v6 = 0x7FFFFFFFLL;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v32)
          objc_enumerationMutation(v30);
        v8 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
        v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("timer")));
        v10 = v9 == v4;

        if (v10)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("inUse")));
          v12 = objc_msgSend(v11, "BOOLValue");

          v6 = (uint64_t)-[NSMutableArray indexOfObject:](v31->_bufferPool, "indexOfObject:", v8);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("lastDateReturned")));
          objc_msgSend(v13, "timeIntervalSinceNow");
          v15 = v14;

          v16 = sub_10008F56C();
          v17 = objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("allocDate")));
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("lastDateBorrowed")));
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("lastDateReturned")));
            *(_DWORD *)buf = 67110146;
            *(_DWORD *)v38 = v12;
            *(_WORD *)&v38[4] = 2048;
            *(_QWORD *)&v38[6] = v6;
            v39 = 2112;
            v40 = v18;
            v41 = 2112;
            v42 = v19;
            v43 = 2112;
            v44 = v20;
            LODWORD(v28) = 48;
            _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v17, 0, "[wifivelocity] W5BufferPool Idle Timer: inUse %d index %lu allocDate %@ lastDateBorrowed %@ lastDateReturned %@", buf, v28);

          }
          if (v15 >= -10.0)
            v21 = 1;
          else
            v21 = v12;
          if ((v21 & 1) == 0)
          {
            v22 = sub_10008F56C();
            v23 = objc_claimAutoreleasedReturnValue(v22);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134217984;
              *(_QWORD *)v38 = v6;
              _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v23, 0, "[wifivelocity] W5BufferPool Idle Timer: Freeing index %lu", buf);
            }

            objc_msgSend(v8, "setObject:forKeyedSubscript:", v31->_dateOfInvalidPoolBuffer, CFSTR("allocDate"));
            v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
            objc_msgSend(v8, "setObject:forKeyedSubscript:", v24, CFSTR("allocdBuffer"));

            objc_msgSend(v8, "setObject:forKeyedSubscript:", v31->_dateOfInvalidPoolBuffer, CFSTR("lastDateBorrowed"));
            objc_msgSend(v8, "setObject:forKeyedSubscript:", v31->_dateOfInvalidPoolBuffer, CFSTR("lastDateReturned"));
            v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
            objc_msgSend(v8, "setObject:forKeyedSubscript:", v25, CFSTR("inUse"));

          }
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0x7FFFFFFFLL;
  }

  v26 = sub_100091474();
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_signpost_enabled(v27))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v38 = v6;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v27, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "W5BufferPool Buffer", "Allocated idx %lu", buf, 0xCu);
  }

  objc_sync_exit(obj);
}

- (id)getBufferFromPool
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  NSObject *queue;
  void *v14;
  id v15;
  uint64_t v16;
  void *j;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  unint64_t bufferSize;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v38;
  id obj;
  NSMutableArray *v40;
  _QWORD v42[5];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD block[5];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  unint64_t v53;
  __int16 v54;
  uint64_t v55;
  _BYTE v56[128];
  _BYTE v57[128];

  obj = (id)objc_claimAutoreleasedReturnValue(-[W5BufferPool lockBufferPool](self, "lockBufferPool"));
  objc_sync_enter(obj);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v40 = self->_bufferPool;
  v2 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v49;
    v4 = 0x7FFFFFFFLL;
    do
    {
      for (i = 0; i != v2; i = (char *)i + 1)
      {
        if (*(_QWORD *)v49 != v3)
          objc_enumerationMutation(v40);
        v6 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i);
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("inUse")));
        if (objc_msgSend(v7, "BOOLValue"))
        {

        }
        else
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("allocdBuffer")));
          v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
          v10 = objc_msgSend(v8, "isEqual:", v9);

          if ((v10 & 1) == 0)
          {
            v4 = (uint64_t)-[NSMutableArray indexOfObject:](self->_bufferPool, "indexOfObject:", v6);
            v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("inUse"));

            v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("lastDateBorrowed"));

            queue = self->_queue;
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_100026100;
            block[3] = &unk_1000D5268;
            block[4] = v6;
            dispatch_sync(queue, block);
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("allocdBuffer")));
            if (v14)
              goto LABEL_30;
          }
        }
      }
      v2 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
    }
    while (v2);
  }
  else
  {
    v4 = 0x7FFFFFFFLL;
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v40 = self->_bufferPool;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v44;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(_QWORD *)v44 != v16)
          objc_enumerationMutation(v40);
        v18 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)j);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("inUse")));
        if (objc_msgSend(v19, "BOOLValue"))
        {

        }
        else
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("allocdBuffer")));
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
          v22 = objc_msgSend(v20, "isEqual:", v21);

          if (v22)
          {
            v4 = (uint64_t)-[NSMutableArray indexOfObject:](self->_bufferPool, "indexOfObject:", v18);
            v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", self->_bufferSize));
            v24 = sub_100091474();
            v25 = objc_claimAutoreleasedReturnValue(v24);
            if (os_signpost_enabled(v25))
            {
              *(_DWORD *)buf = 134217984;
              v53 = v4;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "W5BufferPool Buffer", "Allocated idx %lu", buf, 0xCu);
            }

            v26 = sub_10008F56C();
            v27 = objc_claimAutoreleasedReturnValue(v26);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              bufferSize = self->_bufferSize;
              *(_DWORD *)buf = 134218240;
              v53 = bufferSize;
              v54 = 2048;
              v55 = v4;
              LODWORD(v38) = 22;
              _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v27, 0, "[wifivelocity] W5BufferPool Alloc: Allocating a NSMutableData of size %lu bytes in index %lu", buf, v38);
            }

            v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
            objc_msgSend(v18, "setObject:forKeyedSubscript:", v29, CFSTR("allocDate"));

            objc_msgSend(v18, "setObject:forKeyedSubscript:", v23, CFSTR("allocdBuffer"));
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("allocDate")));
            objc_msgSend(v18, "setObject:forKeyedSubscript:", v30, CFSTR("lastDateBorrowed"));

            v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
            objc_msgSend(v18, "setObject:forKeyedSubscript:", v31, CFSTR("inUse"));

            v32 = self->_queue;
            v42[0] = _NSConcreteStackBlock;
            v42[1] = 3221225472;
            v42[2] = sub_1000261F0;
            v42[3] = &unk_1000D5268;
            v42[4] = v18;
            dispatch_sync(v32, v42);
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("allocdBuffer")));

            if (v14)
              goto LABEL_30;
          }
        }
      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
    }
    while (v15);
  }
  v14 = 0;
LABEL_30:

  v33 = sub_100091474();
  v34 = objc_claimAutoreleasedReturnValue(v33);
  if (os_signpost_enabled(v34))
  {
    *(_DWORD *)buf = 134217984;
    v53 = v4;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v34, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "W5BufferPool Buffer", "Borrowed idx %lu", buf, 0xCu);
  }

  v35 = sub_10008F56C();
  v36 = objc_claimAutoreleasedReturnValue(v35);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v53 = v4;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v36, 0, "[wifivelocity] W5BufferPool Borrowed index %lu", buf);
  }

  objc_sync_exit(obj);
  return v14;
}

- (id)getPairOfBuffersFromPool
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v3 = objc_claimAutoreleasedReturnValue(-[W5BufferPool semaphore](self, "semaphore"));
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[W5BufferPool getBufferFromPool](self, "getBufferFromPool"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5BufferPool getBufferFromPool](self, "getBufferFromPool"));
  v8[0] = v4;
  v8[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 2));

  return v6;
}

- (void)returnBufferToPool:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  _BOOL4 v12;
  NSObject *queue;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  id obj;
  NSMutableArray *v25;
  _QWORD block[6];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  _BYTE v35[128];

  v4 = a3;
  obj = (id)objc_claimAutoreleasedReturnValue(-[W5BufferPool lockBufferPool](self, "lockBufferPool"));
  objc_sync_enter(obj);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v25 = self->_bufferPool;
  v5 = 0;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v28;
    v8 = 0x7FFFFFFFLL;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(v25);
        v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("allocdBuffer")));
        v12 = v11 == v4;

        if (v12)
        {
          v8 = (uint64_t)-[NSMutableArray indexOfObject:](self->_bufferPool, "indexOfObject:", v10);
          queue = self->_queue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10002672C;
          block[3] = &unk_1000D5098;
          block[4] = v10;
          block[5] = self;
          dispatch_sync(queue, block);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("inUse")));
          objc_msgSend(v14, "BOOLValue");

          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, CFSTR("inUse"));

          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, CFSTR("lastDateReturned"));

          objc_msgSend(v4, "setLength:", self->_bufferSize);
        }
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("inUse")));
        v18 = objc_msgSend(v17, "BOOLValue");

        v5 += v18 ^ 1;
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v6);
  }
  else
  {
    v8 = 0x7FFFFFFFLL;
  }

  v19 = sub_100091474();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_signpost_enabled(v20))
  {
    *(_DWORD *)buf = 134217984;
    v32 = v8;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "W5BufferPool Buffer", "Borrowed idx %lu", buf, 0xCu);
  }

  v21 = sub_10008F56C();
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v32 = v8;
    v33 = 2048;
    v34 = v5;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v22, 0, "[wifivelocity] W5BufferPool Returned index %lu, totalAvail %lu ", buf, 22);
  }

  if (v5 == 2)
  {
    v23 = objc_claimAutoreleasedReturnValue(-[W5BufferPool semaphore](self, "semaphore"));
    dispatch_semaphore_signal(v23);

  }
  objc_sync_exit(obj);

}

- (unint64_t)getCountOfAllocatedBuffers
{
  unint64_t v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  id obj;
  NSMutableArray *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  obj = (id)objc_claimAutoreleasedReturnValue(-[W5BufferPool lockBufferPool](self, "lockBufferPool"));
  objc_sync_enter(obj);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v14 = self->_bufferPool;
  v3 = 0;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v14);
        v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("allocdBuffer"), obj));

        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("allocdBuffer")));
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
        v11 = objc_msgSend(v9, "isEqual:", v10);

        v3 += (v8 != 0) & ~v11;
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }

  objc_sync_exit(obj);
  return v3;
}

- (unint64_t)getCountOfInUseBuffers
{
  void *v3;
  NSMutableArray *v4;
  unint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned int v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[W5BufferPool lockBufferPool](self, "lockBufferPool"));
  objc_sync_enter(v3);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_bufferPool;
  v5 = 0;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8), "objectForKeyedSubscript:", CFSTR("inUse"), (_QWORD)v12));
        v10 = objc_msgSend(v9, "BOOLValue");

        v5 += v10;
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_sync_exit(v3);
  return v5;
}

- (NSMutableArray)bufferPool
{
  return self->_bufferPool;
}

- (void)setBufferPool:(id)a3
{
  objc_storeStrong((id *)&self->_bufferPool, a3);
}

- (NSObject)lockBufferPool
{
  return self->_lockBufferPool;
}

- (void)setLockBufferPool:(id)a3
{
  objc_storeStrong((id *)&self->_lockBufferPool, a3);
}

- (unint64_t)bufferSize
{
  return self->_bufferSize;
}

- (void)setBufferSize:(unint64_t)a3
{
  self->_bufferSize = a3;
}

- (OS_dispatch_semaphore)semaphore
{
  return self->_semaphore;
}

- (void)setSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_semaphore, a3);
}

- (NSDate)dateOfInvalidPoolBuffer
{
  return self->_dateOfInvalidPoolBuffer;
}

- (void)setDateOfInvalidPoolBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_dateOfInvalidPoolBuffer, a3);
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
  objc_storeStrong((id *)&self->_dateOfInvalidPoolBuffer, 0);
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_lockBufferPool, 0);
  objc_storeStrong((id *)&self->_bufferPool, 0);
}

@end
