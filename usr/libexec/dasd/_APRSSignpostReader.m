@implementation _APRSSignpostReader

- (_APRSSignpostReader)init
{
  _APRSSignpostReader *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  os_log_t v7;
  OS_os_log *log;
  uint64_t v9;
  NSMutableDictionary *resumes;
  uint64_t v11;
  NSMutableDictionary *launches;
  DASDelegate *v13;
  DASDelegate *dasDelegate;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)_APRSSignpostReader;
  v2 = -[_APRSSignpostReader init](&v16, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("com.apple.appResume.signpostReader", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = os_log_create("com.apple.aprs", "appResume.signpostReader");
    log = v2->_log;
    v2->_log = (OS_os_log *)v7;

    v9 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    resumes = v2->_resumes;
    v2->_resumes = (NSMutableDictionary *)v9;

    v11 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    launches = v2->_launches;
    v2->_launches = (NSMutableDictionary *)v11;

    v13 = objc_opt_new(DASDelegate);
    dasDelegate = v2->_dasDelegate;
    v2->_dasDelegate = v13;

  }
  return v2;
}

- (void)begin
{
  -[DASDelegate connect](self->_dasDelegate, "connect");
}

- (void)end
{
  -[DASDelegate disconnect](self->_dasDelegate, "disconnect");
}

- (void)logAppResumeAndLaunchesFrom:(id)a3 endDate:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005289C;
  block[3] = &unk_10015D530;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (void)processSignpostInterval:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  NSObject *log;
  void *v15;
  unsigned int v16;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ProcessName")));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DurationSeconds")));
    if (v7)
    {
      v8 = (void *)v7;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BeginEvent")));

      if (v9)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ProcessName")));
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[_DASAppResumePLLogger applicationBundleIDForExecutableName:](_DASAppResumePLLogger, "applicationBundleIDForExecutableName:", v10));
        if (v11)
        {
          if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
            sub_1000E2098();
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BeginEvent")));
          v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("AppLaunch"));

          if (v13)
          {
            -[_APRSSignpostReader updateLaunchesForProcess:withInterval:](self, "updateLaunchesForProcess:withInterval:", v11, v4);
          }
          else
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BeginEvent")));
            v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("AppResume"));

            if (v16)
              -[_APRSSignpostReader updateResumesForProcess:withInterval:](self, "updateResumesForProcess:withInterval:", v11, v4);
          }
        }

        goto LABEL_15;
      }
    }
    else
    {

    }
  }
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    sub_1000E2058(log);
LABEL_15:

}

- (void)updateResumesForProcess:(id)a3 withInterval:(id)a4
{
  id v6;
  id v7;
  NSObject *log;
  void *v9;
  float v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
    sub_1000E2164(log, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("DurationSeconds")));
  objc_msgSend(v9, "floatValue");
  v11 = (unint64_t)(float)(v10 * 1000.0);

  if (v11 < 0x1389)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_resumes, "objectForKeyedSubscript:", v6));

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_resumes, "objectForKeyedSubscript:", v6));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v11));
      objc_msgSend(v13, "addObject:", v14);

    }
    else
    {
      v15 = objc_alloc_init((Class)NSMutableArray);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v11));
      objc_msgSend(v15, "addObject:", v16);

      -[NSMutableDictionary setObject:forKey:](self->_resumes, "setObject:forKey:", v15, v6);
    }
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
  {
    sub_1000E2104();
  }

}

- (void)updateLaunchesForProcess:(id)a3 withInterval:(id)a4
{
  id v6;
  id v7;
  NSObject *log;
  void *v9;
  float v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
    sub_1000E21F4(log, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("DurationSeconds")));
  objc_msgSend(v9, "floatValue");
  v11 = (unint64_t)(float)(v10 * 1000.0);

  if (v11 < 0x1389)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_launches, "objectForKeyedSubscript:", v6));

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_launches, "objectForKeyedSubscript:", v6));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v11));
      objc_msgSend(v13, "addObject:", v14);

    }
    else
    {
      v15 = objc_alloc_init((Class)NSMutableArray);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v11));
      objc_msgSend(v15, "addObject:", v16);

      -[NSMutableDictionary setObject:forKey:](self->_launches, "setObject:forKey:", v15, v6);
    }
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
  {
    sub_1000E2104();
  }

}

- (void)recordResumesAndLaunches
{
  void *v3;
  void *v4;
  NSMutableDictionary *resumes;
  id v6;
  NSMutableDictionary *launches;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  int v12;
  _QWORD v13[4];
  id v14;
  int v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = objc_autoreleasePoolPush();
  resumes = self->_resumes;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10005318C;
  v13[3] = &unk_10015E2A0;
  v15 = 1;
  v6 = v3;
  v14 = v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](resumes, "enumerateKeysAndObjectsUsingBlock:", v13);
  launches = self->_launches;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000532FC;
  v10[3] = &unk_10015E2A0;
  v12 = 0;
  v9 = v6;
  v11 = v9;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](launches, "enumerateKeysAndObjectsUsingBlock:", v10);

  objc_autoreleasePoolPop(v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_APRSMetricRecorder sharedInstance](_APRSMetricRecorder, "sharedInstance"));
  objc_msgSend(v8, "reportActivationTimes:", v9);

}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSMutableDictionary)resumes
{
  return self->_resumes;
}

- (void)setResumes:(id)a3
{
  objc_storeStrong((id *)&self->_resumes, a3);
}

- (NSMutableDictionary)launches
{
  return self->_launches;
}

- (void)setLaunches:(id)a3
{
  objc_storeStrong((id *)&self->_launches, a3);
}

- (DASDelegate)dasDelegate
{
  return self->_dasDelegate;
}

- (void)setDasDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_dasDelegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dasDelegate, 0);
  objc_storeStrong((id *)&self->_launches, 0);
  objc_storeStrong((id *)&self->_resumes, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end
