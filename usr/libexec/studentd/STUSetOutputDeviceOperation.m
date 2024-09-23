@implementation STUSetOutputDeviceOperation

- (STUSetOutputDeviceOperation)initWithOutputDevice:(id)a3 airPlayPrimitives:(id)a4 password:(id)a5 suppressPrompt:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  STUSetOutputDeviceOperation *v14;
  STUSetOutputDeviceOperation *v15;
  NSString *v16;
  NSString *password;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)STUSetOutputDeviceOperation;
  v14 = -[STUSetOutputDeviceOperation init](&v19, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_outputDevice, a3);
    objc_storeStrong((id *)&v15->_airPlayPrimitives, a4);
    v16 = (NSString *)objc_msgSend(v13, "copy");
    password = v15->_password;
    v15->_password = v16;

    v15->_suppressPrompt = a6;
  }

  return v15;
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
  v4.super_class = (Class)STUSetOutputDeviceOperation;
  -[STUSetOutputDeviceOperation cancel](&v4, "cancel");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003A4A8;
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
  _BOOL8 v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    objc_initWeak(&location, self);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUSetOutputDeviceOperation airPlayPrimitives](self, "airPlayPrimitives"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10003A708;
    v11[3] = &unk_1000C9F38;
    objc_copyWeak(&v12, &location);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "observeCurrentOutputDeviceChangesWithHandler:", v11));
    -[STUSetOutputDeviceOperation setCurrentOutputDeviceObservation:](self, "setCurrentOutputDeviceObservation:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUSetOutputDeviceOperation outputDevice](self, "outputDevice"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUSetOutputDeviceOperation password](self, "password"));
    v8 = -[STUSetOutputDeviceOperation shouldSuppressPrompt](self, "shouldSuppressPrompt");
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10003A7AC;
    v9[3] = &unk_1000CAA38;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v6, "displayToDeviceWithPassword:suppressPrompt:completion:", v7, v8, v9);

    -[STUSetOutputDeviceOperation evaluateCurrentOutputDevice](self, "evaluateCurrentOutputDevice");
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    -[STUSetOutputDeviceOperation performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, 0, 0);
  }
}

- (void)displayToDeviceDidFinishWithError:(id)a3
{
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v9 = NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUSetOutputDeviceOperation.m"), 89, CFSTR("%@ must be called from the main thread"), v10);

  }
  v5 = -[STUSetOutputDeviceOperation isExecuting](self, "isExecuting");
  v6 = v11;
  if (v11 && v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUSetOutputDeviceOperation currentOutputDeviceObservation](self, "currentOutputDeviceObservation"));
    objc_msgSend(v7, "invalidate");

    -[STUSetOutputDeviceOperation endOperationWithError:](self, "endOperationWithError:", v11);
    v6 = v11;
  }

}

- (void)evaluateCurrentOutputDevice
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  NSString *v17;
  void *v18;
  void *v19;
  void *v20;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v17 = NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUSetOutputDeviceOperation.m"), 104, CFSTR("%@ must be called from the main thread"), v18);

  }
  if (-[STUSetOutputDeviceOperation isExecuting](self, "isExecuting"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUSetOutputDeviceOperation airPlayPrimitives](self, "airPlayPrimitives"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentOutputDevice"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
    if (!v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUSetOutputDeviceOperation outputDevice](self, "outputDevice"));
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
      if (!v8)
      {

        goto LABEL_13;
      }
      v19 = (void *)v8;
      v20 = v7;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUSetOutputDeviceOperation airPlayPrimitives](self, "airPlayPrimitives"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentOutputDevice"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[STUSetOutputDeviceOperation outputDevice](self, "outputDevice"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
    v14 = objc_msgSend(v11, "isEqual:", v13);

    if (v6)
    {

    }
    else
    {

    }
    if ((v14 & 1) == 0)
      return;
LABEL_13:
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[STUSetOutputDeviceOperation currentOutputDeviceObservation](self, "currentOutputDeviceObservation"));
    objc_msgSend(v15, "invalidate");

    -[STUSetOutputDeviceOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
  }
}

- (CRKOutputDevice)outputDevice
{
  return self->_outputDevice;
}

- (CRKAirPlayPrimitives)airPlayPrimitives
{
  return self->_airPlayPrimitives;
}

- (NSString)password
{
  return self->_password;
}

- (BOOL)shouldSuppressPrompt
{
  return self->_suppressPrompt;
}

- (CRKObservation)currentOutputDeviceObservation
{
  return self->_currentOutputDeviceObservation;
}

- (void)setCurrentOutputDeviceObservation:(id)a3
{
  objc_storeStrong((id *)&self->_currentOutputDeviceObservation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentOutputDeviceObservation, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_airPlayPrimitives, 0);
  objc_storeStrong((id *)&self->_outputDevice, 0);
}

@end
