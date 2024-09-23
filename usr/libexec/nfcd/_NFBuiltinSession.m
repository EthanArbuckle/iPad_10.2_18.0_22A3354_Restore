@implementation _NFBuiltinSession

- (_NFBuiltinSession)initWithWorkQueue:(id)a3 routing:(id)a4 sessionQueuer:(id)a5 didStartWork:(id)a6
{
  id v11;
  id v12;
  id v13;
  _NFBuiltinSession *v14;
  _NFBuiltinSession *v15;
  id v16;
  id workBlock;
  objc_super v19;
  objc_super v20;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)_NFBuiltinSession;
  v14 = -[_NFSession initWithWorkQueue:expressModeManager:allowsBackgroundMode:](&v20, "initWithWorkQueue:expressModeManager:allowsBackgroundMode:", a3, 0, 1);
  v15 = v14;
  if (v14)
  {
    v19.receiver = v14;
    v19.super_class = (Class)_NFBuiltinSession;
    -[_NFSession setQueue:](&v19, "setQueue:", v12);
    objc_storeStrong((id *)&v15->_initialRoute, a4);
    v16 = objc_retainBlock(v13);
    workBlock = v15->_workBlock;
    v15->_workBlock = v16;

  }
  return v15;
}

+ (id)createSessionWithWorkQueue:(id)a3 routing:(id)a4 sessionQueuer:(id)a5 didStartWork:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _NFBuiltinSession *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  _QWORD v23[4];
  _QWORD v24[4];

  v10 = a5;
  v11 = a6;
  v12 = a4;
  v13 = a3;
  v14 = -[_NFBuiltinSession initWithWorkQueue:routing:sessionQueuer:didStartWork:]([_NFBuiltinSession alloc], "initWithWorkQueue:routing:sessionQueuer:didStartWork:", v13, v12, v10, v11);

  if (v14)
  {
    objc_msgSend(v10, "queueSession:", v14);
    v15 = 0;
  }
  else
  {
    v16 = objc_alloc((Class)NSError);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v23[0] = NSLocalizedDescriptionKey;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unknown Error"));
    v24[0] = v18;
    v24[1] = &off_1002FE7D8;
    v23[1] = CFSTR("Line");
    v23[2] = CFSTR("Method");
    v19 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v24[2] = v19;
    v23[3] = NSDebugDescriptionErrorKey;
    v20 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 51);
    v24[3] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v23, 4));
    v15 = objc_msgSend(v16, "initWithDomain:code:userInfo:", v17, 6, v21);

  }
  return v15;
}

- (void)didStartSession:(id)a3
{
  id v4;
  OS_dispatch_queue *v5;
  NSObject *v6;
  _QWORD block[5];
  objc_super v8;
  objc_super v9;
  objc_super v10;
  uint8_t buf[4];
  id v12;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_NFBuiltinSession;
  if (-[_NFSession didStart](&v10, "didStart") && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Session already started with error %@ ??", buf, 0xCu);
  }
  v9.receiver = self;
  v9.super_class = (Class)_NFBuiltinSession;
  -[_NFSession didStartSession:](&v9, "didStartSession:", v4);
  if (!v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)_NFBuiltinSession;
    v5 = -[_NFSession workQueue](&v8, "workQueue");
    v6 = objc_claimAutoreleasedReturnValue(v5);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000A8D50;
    block[3] = &unk_1002E5C58;
    block[4] = self;
    dispatch_async(v6, block);

  }
}

- (id)initialRoutingConfig
{
  return self->_initialRoute;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialRoute, 0);
  objc_storeStrong(&self->_workBlock, 0);
}

@end
