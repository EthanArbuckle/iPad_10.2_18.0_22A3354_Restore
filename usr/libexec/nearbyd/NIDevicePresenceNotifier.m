@implementation NIDevicePresenceNotifier

- (NIDevicePresenceNotifier)initWithParentSession:(id)a3
{
  id v4;
  NIDevicePresenceNotifier *v5;
  NIDevicePresenceNotifier *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NIDevicePresenceNotifier;
  v5 = -[NIDevicePresenceNotifier init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->parentSession, v4);

  return v6;
}

- (void)notifyBluetoothSample:(id)a3
{
  id WeakRetained;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;

  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->parentSession);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "getInternalConnectionQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002C37C8;
    block[3] = &unk_1007FA518;
    v11 = v6;
    v12 = v9;
    dispatch_sync(v7, block);

    v8 = v11;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 2404, CFSTR("Parent session is nil"));
  }

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->parentSession);
}

@end
