@implementation RPNIProximityEstimator

- (RPNIProximityEstimator)init
{
  RPNIProximityEstimator *v2;
  RPNIProximityEstimator *v3;
  RPNIProximityEstimator *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RPNIProximityEstimator;
  v2 = -[RPNIProximityEstimator init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v4 = v3;
  }

  return v3;
}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000753FC;
  v7[3] = &unk_1001138B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000755C8;
  block[3] = &unk_1001110F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)sendSampleForDevice:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  RPNIProximityEstimator *v9;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000756BC;
  v7[3] = &unk_100111928;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (id)_createAndRunSession
{
  unint64_t innerPresencePreset;
  int64_t outerPresencePreset;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  NISession *session;
  NISession *v16;
  NISession *v17;
  NISession *v18;
  id v19;
  uint64_t v21;
  id v22;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  innerPresencePreset = self->_innerPresencePreset;
  if (innerPresencePreset <= 1)
    innerPresencePreset = 1;
  self->_innerPresencePreset = innerPresencePreset;
  outerPresencePreset = self->_outerPresencePreset;
  if (!outerPresencePreset)
    outerPresencePreset = 5;
  self->_outerPresencePreset = outerPresencePreset;
  v5 = objc_msgSend(objc_alloc(off_100131478()), "initWithName:devicePresencePreset:", self->_innerRegionName, self->_innerPresencePreset);
  v6 = objc_msgSend(objc_alloc(off_100131478()), "initWithName:devicePresencePreset:", self->_outerRegionName, self->_outerPresencePreset);
  v22 = 0;
  v7 = objc_msgSend(objc_alloc(off_100131480()), "initWithInnerBoundary:outerBoundary:error:", v5, v6, &v22);
  v14 = v22;
  if (!v14)
  {
    if (v7)
    {
      objc_msgSend(v7, "setAllowedDevices:", 0);
      session = self->_session;
      self->_session = 0;
      v16 = session;

      -[NISession invalidate](v16, "invalidate");
      v17 = (NISession *)objc_alloc_init(off_100131488());
      v18 = self->_session;
      self->_session = v17;

      -[NISession setDelegate:](self->_session, "setDelegate:", self);
      -[NISession setDelegateQueue:](self->_session, "setDelegateQueue:", self->_dispatchQueue);
      -[NISession runWithConfiguration:](self->_session, "runWithConfiguration:", v7);

      v14 = 0;
    }
    else
    {
      v19 = RPErrorF(4294960534, (uint64_t)"Failed to create device presence configuration", v8, v9, v10, v11, v12, v13, v21);
      v14 = (id)objc_claimAutoreleasedReturnValue(v19);
    }
  }

  return v14;
}

- (void)sessionDidStartRunning:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (dword_100131400 <= 30
    && ((v6 = v3, dword_100131400 != -1) || (v5 = _LogCategory_Initialize(&dword_100131400, 30), v4 = v6, v5)))
  {
    LogPrintF(&dword_100131400, "-[RPNIProximityEstimator sessionDidStartRunning:]", 30, "Session did start running: %@\n", v4);

  }
  else
  {

  }
}

- (void)session:(id)a3 object:(id)a4 didUpdateRegion:(id)a5 previousRegion:(id)a6
{
  id v9;
  id v10;
  id deviceRegionChangedHandler;
  void (**v12)(id, void *, BOOL);
  id v13;
  int64_t innerPresencePreset;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a4;
  v9 = a5;
  v10 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  deviceRegionChangedHandler = self->_deviceRegionChangedHandler;
  if (deviceRegionChangedHandler)
  {
    v12 = (void (**)(id, void *, BOOL))objc_retainBlock(deviceRegionChangedHandler);
    v13 = objc_msgSend(v9, "devicePresencePreset");
    innerPresencePreset = self->_innerPresencePreset;
    if (dword_100131400 <= 30
      && (dword_100131400 != -1 || _LogCategory_Initialize(&dword_100131400, 30)))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
      LogPrintF(&dword_100131400, "-[RPNIProximityEstimator session:object:didUpdateRegion:previousRegion:]", 30, "Device moved '%@' -> '%@': %@\n", v15, v16, v18);

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "deviceIdentifer"));
    v12[2](v12, v17, v13 == (id)innerPresencePreset);

    goto LABEL_10;
  }
  if (dword_100131400 <= 30 && (dword_100131400 != -1 || _LogCategory_Initialize(&dword_100131400, 30)))
  {
    v12 = (void (**)(id, void *, BOOL))objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "deviceIdentifer"));
    LogPrintF(&dword_100131400, "-[RPNIProximityEstimator session:object:didUpdateRegion:previousRegion:]", 30, "Ignoring region updates for device %@, update handler is not specified\n", v12);
LABEL_10:

  }
}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v5;
  id v6;

  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100131400 <= 30 && (dword_100131400 != -1 || _LogCategory_Initialize(&dword_100131400, 30)))
    LogPrintF(&dword_100131400, "-[RPNIProximityEstimator session:didFailWithError:]", 30, "didFailWithError error: %@\n", v6);
  v5 = -[RPNIProximityEstimator _createAndRunSession](self, "_createAndRunSession");

}

- (void)session:(id)a3 didInvalidateWithError:(id)a4
{
  id v6;
  NISession *session;
  id v8;
  id v9;

  v9 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100131400 <= 30 && (dword_100131400 != -1 || _LogCategory_Initialize(&dword_100131400, 30)))
    LogPrintF(&dword_100131400, "-[RPNIProximityEstimator session:didInvalidateWithError:]", 30, "didInvalidateWithError error: %@\n", v6);
  if (-[NISession isEqual:](self->_session, "isEqual:", v9))
  {
    session = self->_session;
    self->_session = 0;

    v8 = -[RPNIProximityEstimator _createAndRunSession](self, "_createAndRunSession");
  }

}

- (void)sessionWasSuspended:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100131400 <= 30 && (dword_100131400 != -1 || _LogCategory_Initialize(&dword_100131400, 30)))
    LogPrintF(&dword_100131400, "-[RPNIProximityEstimator sessionWasSuspended:]", 30, "sessionWasSuspended waiting for ended suspension to resume. This should happen when bt is toggled back on\n");
}

- (void)sessionSuspensionEnded:(id)a3
{
  id v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100131400 <= 30 && (dword_100131400 != -1 || _LogCategory_Initialize(&dword_100131400, 30)))
    LogPrintF(&dword_100131400, "-[RPNIProximityEstimator sessionSuspensionEnded:]", 30, "sessionSuspensionEnded attempting to resume\n");
  v4 = -[RPNIProximityEstimator _createAndRunSession](self, "_createAndRunSession");
}

- (int64_t)innerPresencePreset
{
  return self->_innerPresencePreset;
}

- (void)setInnerPresencePreset:(int64_t)a3
{
  self->_innerPresencePreset = a3;
}

- (NSString)innerRegionName
{
  return self->_innerRegionName;
}

- (void)setInnerRegionName:(id)a3
{
  objc_storeStrong((id *)&self->_innerRegionName, a3);
}

- (int64_t)outerPresencePreset
{
  return self->_outerPresencePreset;
}

- (void)setOuterPresencePreset:(int64_t)a3
{
  self->_outerPresencePreset = a3;
}

- (NSString)outerRegionName
{
  return self->_outerRegionName;
}

- (void)setOuterRegionName:(id)a3
{
  objc_storeStrong((id *)&self->_outerRegionName, a3);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)deviceRegionChangedHandler
{
  return self->_deviceRegionChangedHandler;
}

- (void)setDeviceRegionChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NISession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong(&self->_deviceRegionChangedHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_outerRegionName, 0);
  objc_storeStrong((id *)&self->_innerRegionName, 0);
}

@end
