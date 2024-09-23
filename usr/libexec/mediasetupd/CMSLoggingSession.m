@implementation CMSLoggingSession

- (id)initForType:(id)a3 withMetadata:(id)a4
{
  id v6;
  id v7;
  CMSLoggingSession *v8;
  NSString *v9;
  NSString *sessionType;
  uint64_t v11;
  uint64_t v12;
  NSMutableArray *events;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CMSLoggingSession;
  v8 = -[CMSLoggingSession init](&v15, "init");
  if (v8)
  {
    v9 = (NSString *)objc_msgSend(v6, "copy");
    sessionType = v8->_sessionType;
    v8->_sessionType = v9;

    objc_storeStrong((id *)&v8->_metadata, a4);
    v12 = objc_opt_new(NSMutableArray, v11);
    events = v8->events;
    v8->events = (NSMutableArray *)v12;

  }
  return v8;
}

- (void)recordEvent:(id)a3 occuredAt:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (self->_sessionEnded)
  {
    NSLog(CFSTR("Error: CMSLoggerSession has ended already. %s"), "-[CMSLoggingSession recordEvent:occuredAt:]");
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(+[CMSLogger _LoggingQueue](CMSLogger, "_LoggingQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002F73C;
    block[3] = &unk_10004A128;
    block[4] = self;
    v9 = v6;
    v11 = v9;
    v12 = v7;
    dispatch_async(v8, block);

    if (objc_msgSend(v9, "isEqualToString:", CFSTR("End")))
      -[CMSLoggingSession _endSession](self, "_endSession");

  }
}

- (void)recordEvent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[CMSLoggingSession recordEvent:occuredAt:](self, "recordEvent:occuredAt:", v4, v5);

}

- (id)eventDurations
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = (void *)objc_opt_new(NSMutableDictionary, a2);
  if ((unint64_t)-[NSMutableArray count](self->events, "count") >= 2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->events, "firstObject"));
    if ((unint64_t)-[NSMutableArray count](self->events, "count") < 2)
    {
      v6 = v4;
    }
    else
    {
      v5 = 1;
      do
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->events, "objectAtIndexedSubscript:", v5));
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "eventType"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "eventType"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v7, v8));

        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "timestamp"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timestamp"));
        objc_msgSend(v10, "timeIntervalSinceDate:", v11);
        v13 = v12;

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v9));
        if (v14)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "eventType"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "eventType"));
          NSLog(CFSTR("Warning: CMSLogger currently only support every edge on the FSM only go though once. We have passed %@ -> %@ before. The newer measurement will be used right now %s"), v15, v16, "-[CMSLoggingSession eventDurations]");

        }
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v13));
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, v9);

        ++v5;
        v4 = v6;
      }
      while ((unint64_t)-[NSMutableArray count](self->events, "count") > v5);
    }

  }
  return v3;
}

- (id)eventOccurance
{
  void *v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  _UNKNOWN **v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = (void *)objc_opt_new(NSMutableDictionary, a2);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = self->events;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "eventType", (_QWORD)v15));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v10));

        if (v11)
        {
          v12 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)objc_msgSend(v11, "unsignedIntegerValue") + 1));

        }
        else
        {
          v12 = &off_10004B988;
        }
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "eventType"));
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, v13);

      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)_endSession
{
  NSObject *v3;
  _QWORD block[5];

  if (self->_sessionEnded)
  {
    NSLog(CFSTR("Error: CMSLoggerSession %@ has ended already. %s"), a2, self, "-[CMSLoggingSession _endSession]");
  }
  else
  {
    v3 = objc_claimAutoreleasedReturnValue(+[CMSLogger _LoggingQueue](CMSLogger, "_LoggingQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002FC88;
    block[3] = &unk_100048AC0;
    block[4] = self;
    dispatch_async(v3, block);

    self->_sessionEnded = 1;
  }
}

- (void)dealloc
{
  objc_super v3;

  if (!self->_sessionEnded)
    NSLog(CFSTR("Warning: CMSLoggerSession %@ has not been closed, so it wasn't added as part of the log. %s"), a2, self, "-[CMSLoggingSession dealloc]");
  v3.receiver = self;
  v3.super_class = (Class)CMSLoggingSession;
  -[CMSLoggingSession dealloc](&v3, "dealloc");
}

- (NSString)sessionType
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (BOOL)sessionEnded
{
  return self->_sessionEnded;
}

- (CMSLogger)belongedLogger
{
  return (CMSLogger *)objc_loadWeakRetained((id *)&self->_belongedLogger);
}

- (void)setBelongedLogger:(id)a3
{
  objc_storeWeak((id *)&self->_belongedLogger, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_belongedLogger);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_sessionType, 0);
  objc_storeStrong((id *)&self->events, 0);
}

@end
