@implementation STUSearchForOutputDeviceOperation

- (STUSearchForOutputDeviceOperation)initWithDeviceID:(id)a3 airPlayPlayPrimitives:(id)a4
{
  id v6;
  id v7;
  STUSearchForOutputDeviceOperation *v8;
  NSString *v9;
  NSString *deviceID;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)STUSearchForOutputDeviceOperation;
  v8 = -[STUSearchForOutputDeviceOperation init](&v12, "init");
  if (v8)
  {
    v9 = (NSString *)objc_msgSend(v6, "copy");
    deviceID = v8->_deviceID;
    v8->_deviceID = v9;

    objc_storeStrong((id *)&v8->_airPlayPrimitives, a4);
  }

  return v8;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)cancel
{
  _QWORD block[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STUSearchForOutputDeviceOperation;
  -[STUSearchForOutputDeviceOperation cancel](&v4, "cancel");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100038900;
  block[3] = &unk_1000C97E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)main
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    objc_initWeak(&location, self);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUSearchForOutputDeviceOperation airPlayPrimitives](self, "airPlayPrimitives"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "beginOutputDeviceBrowsingSession"));
    -[STUSearchForOutputDeviceOperation setBrowsingSession:](self, "setBrowsingSession:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUSearchForOutputDeviceOperation browsingSession](self, "browsingSession"));
    v8 = _NSConcreteStackBlock;
    v9 = 3221225472;
    v10 = sub_100038AF0;
    v11 = &unk_1000C9F38;
    objc_copyWeak(&v12, &location);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "observeBrowsedOutputDeviceChangesWithHandler:", &v8));
    -[STUSearchForOutputDeviceOperation setOutputDeviceChangeObservation:](self, "setOutputDeviceChangeObservation:", v7, v8, v9, v10, v11);

    -[STUSearchForOutputDeviceOperation evalutateOutputDevices](self, "evalutateOutputDevices");
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    -[STUSearchForOutputDeviceOperation performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, 0, 0);
  }
}

- (void)evalutateOutputDevices
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  void *v11;
  _QWORD v12[5];

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v10 = NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUSearchForOutputDeviceOperation.m"), 78, CFSTR("%@ must be called from the main thread"), v11);

  }
  if (-[STUSearchForOutputDeviceOperation isExecuting](self, "isExecuting"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUSearchForOutputDeviceOperation browsingSession](self, "browsingSession"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "outputDevices"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100038CE0;
    v12[3] = &unk_1000CA980;
    v12[4] = self;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "crk_firstMatching:", v12));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUSearchForOutputDeviceOperation outputDeviceChangeObservation](self, "outputDeviceChangeObservation"));
      objc_msgSend(v7, "invalidate");

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUSearchForOutputDeviceOperation browsingSession](self, "browsingSession"));
      objc_msgSend(v8, "invalidate");

      -[STUSearchForOutputDeviceOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v6);
    }

  }
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (CRKAirPlayPrimitives)airPlayPrimitives
{
  return self->_airPlayPrimitives;
}

- (CRKOutputDeviceBrowsingSession)browsingSession
{
  return self->_browsingSession;
}

- (void)setBrowsingSession:(id)a3
{
  objc_storeStrong((id *)&self->_browsingSession, a3);
}

- (CRKObservation)outputDeviceChangeObservation
{
  return self->_outputDeviceChangeObservation;
}

- (void)setOutputDeviceChangeObservation:(id)a3
{
  objc_storeStrong((id *)&self->_outputDeviceChangeObservation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDeviceChangeObservation, 0);
  objc_storeStrong((id *)&self->_browsingSession, 0);
  objc_storeStrong((id *)&self->_airPlayPrimitives, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
}

@end
