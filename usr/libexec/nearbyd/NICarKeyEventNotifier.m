@implementation NICarKeyEventNotifier

- (NICarKeyEventNotifier)initWithParentSession:(id)a3
{
  id v4;
  NICarKeyEventNotifier *v5;
  NICarKeyEventNotifier *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NICarKeyEventNotifier;
  v5 = -[NICarKeyEventNotifier init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->parentSession, v4);

  return v6;
}

- (void)notifyVehicleUnlockedWithReason:(int64_t)a3
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
    v15[0] = CFSTR("CarKeyEventType");
    v15[1] = CFSTR("CarKeyEventReason");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
    v16[1] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 2));

    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "getInternalConnectionQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002C1868;
    block[3] = &unk_1007FA518;
    v13 = WeakRetained;
    v14 = v8;
    v10 = v8;
    dispatch_sync(v9, block);

  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 2062, CFSTR("Parent session is nil"));

  }
}

- (void)notifyVehicleLockedWithReason:(int64_t)a3
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
    v16[0] = &off_10082C148;
    v15[0] = CFSTR("CarKeyEventType");
    v15[1] = CFSTR("CarKeyEventReason");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
    v16[1] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 2));

    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "getInternalConnectionQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002C1A98;
    block[3] = &unk_1007FA518;
    v13 = WeakRetained;
    v14 = v8;
    v10 = v8;
    dispatch_sync(v9, block);

  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 2076, CFSTR("Parent session is nil"));

  }
}

- (void)notifyVehicleReadyToDriveWithReason:(int64_t)a3
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
    v16[0] = &off_10082C160;
    v15[0] = CFSTR("CarKeyEventType");
    v15[1] = CFSTR("CarKeyEventReason");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
    v16[1] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 2));

    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "getInternalConnectionQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002C1CC8;
    block[3] = &unk_1007FA518;
    v13 = WeakRetained;
    v14 = v8;
    v10 = v8;
    dispatch_sync(v9, block);

  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 2090, CFSTR("Parent session is nil"));

  }
}

- (void)notifyRangingIntentSentToVehicleWithReason:(int64_t)a3
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
    v16[0] = &off_10082C178;
    v15[0] = CFSTR("CarKeyEventType");
    v15[1] = CFSTR("CarKeyEventReason");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
    v16[1] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 2));

    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "getInternalConnectionQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002C1EF8;
    block[3] = &unk_1007FA518;
    v13 = WeakRetained;
    v14 = v8;
    v10 = v8;
    dispatch_sync(v9, block);

  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 2104, CFSTR("Parent session is nil"));

  }
}

- (void)notifyVehicleTerminatedRangingSession
{
  id WeakRetained;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  _QWORD block[4];
  id v10;
  id v11;
  const __CFString *v12;
  _UNKNOWN **v13;

  WeakRetained = objc_loadWeakRetained((id *)&self->parentSession);
  if (WeakRetained)
  {
    v12 = CFSTR("CarKeyEventType");
    v13 = &off_10082C190;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "getInternalConnectionQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002C20F0;
    block[3] = &unk_1007FA518;
    v10 = WeakRetained;
    v11 = v5;
    v7 = v5;
    dispatch_sync(v6, block);

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 2118, CFSTR("Parent session is nil"));

  }
}

- (void)notifyVehicleSentRangingSuspendedSubEvent
{
  id WeakRetained;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  _QWORD block[4];
  id v10;
  id v11;
  const __CFString *v12;
  _UNKNOWN **v13;

  WeakRetained = objc_loadWeakRetained((id *)&self->parentSession);
  if (WeakRetained)
  {
    v12 = CFSTR("CarKeyEventType");
    v13 = &off_10082C1A8;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "getInternalConnectionQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002C22E8;
    block[3] = &unk_1007FA518;
    v10 = WeakRetained;
    v11 = v5;
    v7 = v5;
    dispatch_sync(v6, block);

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 2132, CFSTR("Parent session is nil"));

  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->parentSession);
}

@end
