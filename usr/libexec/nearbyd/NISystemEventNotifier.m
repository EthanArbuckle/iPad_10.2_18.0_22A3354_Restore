@implementation NISystemEventNotifier

- (NISystemEventNotifier)initWithParentSession:(id)a3
{
  id v4;
  NISystemEventNotifier *v5;
  NISystemEventNotifier *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NISystemEventNotifier;
  v5 = -[NISystemEventNotifier init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->parentSession, v4);

  return v6;
}

- (void)notifyPassiveAccessIntent:(unint64_t)a3
{
  id WeakRetained;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD block[4];
  id v13;
  id v14;
  _QWORD v15[2];
  _QWORD v16[2];

  WeakRetained = objc_loadWeakRetained((id *)&self->parentSession);
  if (WeakRetained)
  {
    v16[0] = &off_10082C130;
    v15[0] = CFSTR("SystemEventDictKey_EventType");
    v15[1] = CFSTR("SystemEventDictKey_PassiveAccessIntentOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    v16[1] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 2));

    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "getInternalConnectionQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002C4FD0;
    block[3] = &unk_1007FA518;
    v13 = WeakRetained;
    v14 = v8;
    v10 = v8;
    dispatch_sync(v9, block);

  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 2683, CFSTR("Parent session is nil"));

  }
}

- (void)_notifyResourceUsageLimitExceeded:(BOOL)a3 forSessionConfigurationType:(Class)a4
{
  _BOOL8 v5;
  id WeakRetained;
  void *v9;
  NSString *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  _QWORD block[4];
  id v17;
  id v18;
  _QWORD v19[3];
  _QWORD v20[3];

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->parentSession);
  if (WeakRetained)
  {
    v20[0] = &off_10082C148;
    v19[0] = CFSTR("SystemEventDictKey_EventType");
    v19[1] = CFSTR("SystemEventDictKey_ResourceUsageLimitExceededValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v5));
    v20[1] = v9;
    v19[2] = CFSTR("SystemEventDictKey_ConfigurationType");
    v10 = NSStringFromClass(a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v20[2] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 3));

    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "getInternalConnectionQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002C5240;
    block[3] = &unk_1007FA518;
    v17 = WeakRetained;
    v18 = v12;
    v14 = v12;
    dispatch_sync(v13, block);

  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 2699, CFSTR("Parent session is nil"));

  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->parentSession);
}

@end
