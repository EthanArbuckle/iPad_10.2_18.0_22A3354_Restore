@implementation TransparencyTranscript

- (TransparencyTranscript)initWithContext:(id)a3 settings:(id)a4
{
  id v6;
  id v7;
  TransparencyTranscript *v8;
  id v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TransparencyTranscript;
  v8 = -[TransparencyTranscript init](&v11, "init");
  if (v8)
  {
    v9 = objc_alloc_init((Class)NSMutableArray);
    -[TransparencyTranscript set_events:](v8, "set_events:", v9);

    -[TransparencyTranscript setContext:](v8, "setContext:", v6);
    -[TransparencyTranscript setSettings:](v8, "setSettings:", v7);
  }

  return v8;
}

- (void)addEvent:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  TransparencyTranscriptEvent *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyTranscript settings](self, "settings"));
  if (!objc_msgSend(v4, "allowsInternalSecurityPolicies"))
  {
LABEL_6:

    goto LABEL_7;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyTranscript settings](self, "settings"));
  v6 = objc_msgSend(v5, "getBool:", kTransparencyFlagEnableTranscript);

  if (v6)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyTranscript _events](self, "_events"));
    objc_sync_enter(v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyTranscript _events](self, "_events"));
    v8 = -[TransparencyTranscriptEvent initWithName:]([TransparencyTranscriptEvent alloc], "initWithName:", v12);
    objc_msgSend(v7, "insertObject:atIndex:", v8, 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyTranscript _events](self, "_events"));
    v10 = objc_msgSend(v9, "count");

    if ((unint64_t)v10 >= 0x101)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyTranscript _events](self, "_events"));
      objc_msgSend(v11, "removeLastObject");

    }
    objc_sync_exit(v4);
    goto LABEL_6;
  }
LABEL_7:

}

- (void)startEvent:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  id v8;

  v4 = a3;
  if (qword_1002A7C48 != -1)
    dispatch_once(&qword_1002A7C48, &stru_10024D0A0);
  v5 = qword_1002A7C50;
  if (os_log_type_enabled((os_log_t)qword_1002A7C50, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Event start: %@", buf, 0xCu);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-Start"), v4));
  -[TransparencyTranscript addEvent:](self, "addEvent:", v6);

}

- (void)stopEventWithSuccess:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  id v8;

  v4 = a3;
  if (qword_1002A7C48 != -1)
    dispatch_once(&qword_1002A7C48, &stru_10024D0C0);
  v5 = qword_1002A7C50;
  if (os_log_type_enabled((os_log_t)qword_1002A7C50, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Event success: %@", buf, 0xCu);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-Stop-Success"), v4));
  -[TransparencyTranscript addEvent:](self, "addEvent:", v6);

}

- (void)stopEventWithFailure:(id)a3 error:(id)a4
{
  id v6;
  __CFString *v7;
  NSObject *v8;
  const __CFString *v9;
  void *v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  const __CFString *v14;

  v6 = a3;
  v7 = (__CFString *)a4;
  if (qword_1002A7C48 != -1)
    dispatch_once(&qword_1002A7C48, &stru_10024D0E0);
  v8 = qword_1002A7C50;
  if (os_log_type_enabled((os_log_t)qword_1002A7C50, OS_LOG_TYPE_ERROR))
  {
    v9 = &stru_1002508B8;
    if (v7)
      v9 = v7;
    *(_DWORD *)buf = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Event failure: %@ %@", buf, 0x16u);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-Stop-Failure"), v6));
  -[TransparencyTranscript addEvent:](self, "addEvent:", v10);

}

- (id)serialize
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  void *v15;
  id v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyTranscript _events](self, "_events"));
  objc_sync_enter(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyTranscript _events](self, "_events"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v4));

  objc_sync_exit(v3);
  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_1001AB39C;
  v13 = &unk_10024D108;
  v14 = objc_alloc_init((Class)NSMutableArray);
  v6 = v14;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyTranscript context](self, "context", v10, v11, v12, v13));
  v15 = v7;
  v16 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));

  return v8;
}

- (NSString)context
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableArray)_events
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)set_events:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (TransparencySettingsProtocol)settings
{
  return (TransparencySettingsProtocol *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->__events, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
