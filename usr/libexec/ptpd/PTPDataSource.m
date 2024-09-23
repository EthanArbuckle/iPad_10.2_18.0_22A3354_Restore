@implementation PTPDataSource

- (PTPDataSource)initWithAssetHandle:(id)a3 assetSize:(unint64_t)a4 andQueueName:(id)a5
{
  id v8;
  id v9;
  PTPDataSource *v10;
  PTPDataSource *v11;
  dispatch_queue_global_t global_queue;
  void *v13;
  objc_super v15;

  v8 = a3;
  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PTPDataSource;
  v10 = -[PTPDataSource init](&v15, "init");
  v11 = v10;
  if (v10)
  {
    -[PTPDataSource setPlAssetHandle:](v10, "setPlAssetHandle:", v8);
    -[PTPDataSource setPlAssetSize:](v11, "setPlAssetSize:", a4);
    global_queue = dispatch_get_global_queue(33, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
    -[PTPDataSource setPlAssetQueue:](v11, "setPlAssetQueue:", v13);

    -[PTPDataSource setPlAssetReader:](v11, "setPlAssetReader:", 0);
    -[PTPDataSource setPlAssetTimer:](v11, "setPlAssetTimer:", 0);
    -[PTPDataSource setQueueName:](v11, "setQueueName:", v9);
    -[PTPDataSource setFd:](v11, "setFd:", 0xFFFFFFFFLL);
  }

  return v11;
}

- (void)dealloc
{
  OS_dispatch_queue **p_plAssetQueue;
  NSObject *WeakRetained;
  objc_super v5;
  _QWORD block[5];

  p_plAssetQueue = &self->_plAssetQueue;
  WeakRetained = objc_loadWeakRetained((id *)&self->_plAssetQueue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B664;
  block[3] = &unk_100048750;
  block[4] = self;
  dispatch_sync(WeakRetained, block);

  objc_storeWeak((id *)p_plAssetQueue, 0);
  -[PTPDataSource setPlAssetReader:](self, "setPlAssetReader:", 0);
  -[PTPDataSource setPlAssetHandle:](self, "setPlAssetHandle:", 0);
  -[PTPDataSource setQueueName:](self, "setQueueName:", 0);
  if (-[PTPDataSource fd](self, "fd") != -1)
  {
    close(-[PTPDataSource fd](self, "fd"));
    -[PTPDataSource setFd:](self, "setFd:", 0xFFFFFFFFLL);
  }
  -[PTPDataSource setDataSourcePath:](self, "setDataSourcePath:", 0);
  v5.receiver = self;
  v5.super_class = (Class)PTPDataSource;
  -[PTPDataSource dealloc](&v5, "dealloc");
}

- (id)dataSourcePathForDataRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD block[9];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  length = a3.length;
  location = a3.location;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_10002B7E8;
  v21 = sub_10002B7F8;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_10002B7E8;
  v15 = sub_10002B7F8;
  v16 = 0;
  v6 = objc_claimAutoreleasedReturnValue(-[PTPDataSource plAssetQueue](self, "plAssetQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B800;
  block[3] = &unk_100048D68;
  block[4] = self;
  block[5] = &v11;
  block[7] = location;
  block[8] = length;
  block[6] = &v17;
  dispatch_sync(v6, block);

  if (v18[5])
    v7 = 0;
  else
    v7 = (void *)v12[5];
  v8 = v7;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

- (int64_t)read:(void *)a3 length:(unint64_t)a4 offset:(int64_t)a5
{
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  __CFString *v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  NSObject *v23;
  id v24;
  void *v25;
  __CFString *v26;
  void *v27;
  NSObject *v28;
  id v29;
  void *v30;
  __CFString *v31;
  void *v32;
  NSObject *v33;
  id v34;
  uint64_t v35;
  void *v36;
  __CFString *v37;
  id v38;
  void *v39;
  NSObject *v40;
  id v41;
  int64_t v42;
  _QWORD block[11];
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint8_t buf[4];
  id v58;
  __int16 v59;
  void *v60;

  v53 = 0;
  v54 = &v53;
  v55 = 0x2020000000;
  v56 = 0;
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = dword_10005E438;
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PTPDataSource dataSourcePathForDataRange:](self, "dataSourcePathForDataRange:", a5));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PTPDataSource dataSourcePath](self, "dataSourcePath"));
  v11 = objc_msgSend(v10, "isEqualToString:", v9);

  if ((v11 & 1) == 0)
  {
    if (-[PTPDataSource fd](self, "fd") != -1)
    {
      close(-[PTPDataSource fd](self, "fd"));
      -[PTPDataSource setFd:](self, "setFd:", 0xFFFFFFFFLL);
    }
    -[PTPDataSource setDataSourcePath:](self, "setDataSourcePath:", v9);
    __ICOSLogCreate();
    if ((unint64_t)objc_msgSend(CFSTR("PTPDataSource"), "length") < 0x15)
    {
      v13 = CFSTR("PTPDataSource");
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("PTPDataSource"), "substringWithRange:", 0, 18));
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingString:", CFSTR("..")));

    }
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[PTPDataSource dataSourcePath](self, "dataSourcePath")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("  >>> Setting[%s]:[%10lu]"), objc_msgSend(v14, "UTF8String"), -[PTPDataSource plAssetSize](self, "plAssetSize")));

    v16 = (id)_gICOSLog;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = -[__CFString UTF8String](objc_retainAutorelease(v13), "UTF8String");
      *(_DWORD *)buf = 136446466;
      v58 = v17;
      v59 = 2114;
      v60 = v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PTPDataSource dataSourcePath](self, "dataSourcePath"));

  if (v18)
  {
    v19 = objc_claimAutoreleasedReturnValue(-[PTPDataSource plAssetQueue](self, "plAssetQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002C0B0;
    block[3] = &unk_100048DB8;
    block[4] = self;
    block[5] = &v53;
    block[8] = a3;
    block[9] = a4;
    block[10] = a5;
    block[6] = &v45;
    block[7] = &v49;
    dispatch_sync(v19, block);

  }
  __ICOSLogCreate();
  if ((unint64_t)objc_msgSend(&stru_100048E60, "length") < 0x15)
  {
    v21 = &stru_100048E60;
  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stringByAppendingString:", CFSTR("..")));

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("  *** Request:[%10lu] @ Offset:[%10llu] >> Read:[%10llu]"), a4, a5, v54[3]));
  v23 = (id)_gICOSLog;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = -[__CFString UTF8String](objc_retainAutorelease(v21), "UTF8String");
    *(_DWORD *)buf = 136446466;
    v58 = v24;
    v59 = 2114;
    v60 = v22;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }

  if (v50[3])
  {
    __ICOSLogCreate();
    if ((unint64_t)objc_msgSend(&stru_100048E60, "length") < 0x15)
    {
      v26 = &stru_100048E60;
    }
    else
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "stringByAppendingString:", CFSTR("..")));

    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("   ")));
    v28 = (id)_gICOSLog;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = -[__CFString UTF8String](objc_retainAutorelease(v26), "UTF8String");
      *(_DWORD *)buf = 136446466;
      v58 = v29;
      v59 = 2114;
      v60 = v27;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }

    __ICOSLogCreate();
    if ((unint64_t)objc_msgSend(&stru_100048E60, "length") < 0x15)
    {
      v31 = &stru_100048E60;
    }
    else
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
      v31 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "stringByAppendingString:", CFSTR("..")));

    }
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("  >>> Advised:[%10llu] @ Offset:[%10llu]"), v50[3], v46[3]));
    v33 = (id)_gICOSLog;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = -[__CFString UTF8String](objc_retainAutorelease(v31), "UTF8String");
      *(_DWORD *)buf = 136446466;
      v58 = v34;
      v59 = 2114;
      v60 = v32;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }

  }
  v35 = v54[3];
  if (v35 + a5 == -[PTPDataSource plAssetSize](self, "plAssetSize") && -[PTPDataSource fd](self, "fd") != -1)
  {
    __ICOSLogCreate();
    if ((unint64_t)objc_msgSend(&stru_100048E60, "length") < 0x15)
    {
      v37 = &stru_100048E60;
    }
    else
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
      v37 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "stringByAppendingString:", CFSTR("..")));

    }
    v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[PTPDataSource dataSourcePath](self, "dataSourcePath")));
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("  --- Closing[%s]:[%10lu]"), objc_msgSend(v38, "UTF8String"), -[PTPDataSource plAssetSize](self, "plAssetSize")));

    v40 = (id)_gICOSLog;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      v41 = -[__CFString UTF8String](objc_retainAutorelease(v37), "UTF8String");
      *(_DWORD *)buf = 136446466;
      v58 = v41;
      v59 = 2114;
      v60 = v39;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }

    close(-[PTPDataSource fd](self, "fd"));
    -[PTPDataSource setFd:](self, "setFd:", 0xFFFFFFFFLL);
  }
  v42 = v54[3];

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);
  return v42;
}

- (void)boostAssetReaderLifespan
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  __CFString *v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_time_t v13;
  __CFString *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  __CFString *v19;
  NSObject *v20;
  NSObject *v21;
  OS_dispatch_source *v22;
  OS_dispatch_source *plAssetTimer;
  NSObject *v24;
  dispatch_time_t v25;
  NSObject *v26;
  NSObject *v27;
  _QWORD handler[5];
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PTPDataSource plAssetTimer](self, "plAssetTimer"));

  __ICOSLogCreate();
  v4 = __ICLogTypeEnabled(4);
  if (v3)
  {
    if (v4)
    {
      v5 = CFSTR("PTPDataSource");
      if ((unint64_t)objc_msgSend(CFSTR("PTPDataSource"), "length") >= 0x15)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("PTPDataSource"), "substringWithRange:", 0, 18));
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingString:", CFSTR("..")));

      }
      v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[PTPDataSource queueName](self, "queueName")));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Boosted [%s]"), objc_msgSend(v7, "UTF8String")));

      v9 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v10 = objc_retainAutorelease(v5);
        v11 = v9;
        *(_DWORD *)buf = 136446466;
        v31 = -[__CFString UTF8String](v10, "UTF8String");
        v32 = 2114;
        v33 = v8;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

      }
    }
    v12 = objc_claimAutoreleasedReturnValue(-[PTPDataSource plAssetTimer](self, "plAssetTimer"));
    v13 = dispatch_time(0, 10000000000);
    dispatch_source_set_timer(v12, v13, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);

  }
  else
  {
    if (v4)
    {
      v14 = CFSTR("PTPDataSource");
      if ((unint64_t)objc_msgSend(CFSTR("PTPDataSource"), "length") >= 0x15)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("PTPDataSource"), "substringWithRange:", 0, 18));
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByAppendingString:", CFSTR("..")));

      }
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[PTPDataSource queueName](self, "queueName")));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Created [%s]"), objc_msgSend(v16, "UTF8String")));

      v18 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v19 = objc_retainAutorelease(v14);
        v20 = v18;
        *(_DWORD *)buf = 136446466;
        v31 = -[__CFString UTF8String](v19, "UTF8String");
        v32 = 2114;
        v33 = v17;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

      }
    }
    v21 = objc_claimAutoreleasedReturnValue(-[PTPDataSource plAssetQueue](self, "plAssetQueue"));
    v22 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v21);
    plAssetTimer = self->_plAssetTimer;
    self->_plAssetTimer = v22;

    v24 = objc_claimAutoreleasedReturnValue(-[PTPDataSource plAssetTimer](self, "plAssetTimer"));
    v25 = dispatch_time(0, 10000000000);
    dispatch_source_set_timer(v24, v25, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);

    objc_initWeak((id *)buf, self);
    v26 = objc_claimAutoreleasedReturnValue(-[PTPDataSource plAssetTimer](self, "plAssetTimer"));
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10002CAA8;
    handler[3] = &unk_100048DE0;
    objc_copyWeak(&v29, (id *)buf);
    handler[4] = self;
    dispatch_source_set_event_handler(v26, handler);

    v27 = objc_claimAutoreleasedReturnValue(-[PTPDataSource plAssetTimer](self, "plAssetTimer"));
    dispatch_resume(v27);

    objc_destroyWeak(&v29);
    objc_destroyWeak((id *)buf);
  }
}

- (PHPTPAssetHandle)plAssetHandle
{
  return self->_plAssetHandle;
}

- (void)setPlAssetHandle:(id)a3
{
  objc_storeStrong((id *)&self->_plAssetHandle, a3);
}

- (PHPTPAssetReader)plAssetReader
{
  return self->_plAssetReader;
}

- (void)setPlAssetReader:(id)a3
{
  objc_storeStrong((id *)&self->_plAssetReader, a3);
}

- (OS_dispatch_source)plAssetTimer
{
  return self->_plAssetTimer;
}

- (void)setPlAssetTimer:(id)a3
{
  objc_storeStrong((id *)&self->_plAssetTimer, a3);
}

- (OS_dispatch_queue)plAssetQueue
{
  return (OS_dispatch_queue *)objc_loadWeakRetained((id *)&self->_plAssetQueue);
}

- (void)setPlAssetQueue:(id)a3
{
  objc_storeWeak((id *)&self->_plAssetQueue, a3);
}

- (unint64_t)plAssetSize
{
  return self->_plAssetSize;
}

- (void)setPlAssetSize:(unint64_t)a3
{
  self->_plAssetSize = a3;
}

- (NSString)queueName
{
  return self->_queueName;
}

- (void)setQueueName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int)fd
{
  return self->_fd;
}

- (void)setFd:(int)a3
{
  self->_fd = a3;
}

- (NSString)dataSourcePath
{
  return self->_dataSourcePath;
}

- (void)setDataSourcePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)toggleHeaderOffset
{
  return self->_toggleHeaderOffset;
}

- (void)setToggleHeaderOffset:(BOOL)a3
{
  self->_toggleHeaderOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSourcePath, 0);
  objc_storeStrong((id *)&self->_queueName, 0);
  objc_destroyWeak((id *)&self->_plAssetQueue);
  objc_storeStrong((id *)&self->_plAssetTimer, 0);
  objc_storeStrong((id *)&self->_plAssetReader, 0);
  objc_storeStrong((id *)&self->_plAssetHandle, 0);
}

@end
