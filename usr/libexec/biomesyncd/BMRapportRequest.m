@implementation BMRapportRequest

- (BMRapportRequest)initWithUUID:(id)a3 activity:(id)a4 requestBlock:(id)a5 queue:(id)a6 completionHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  BMRapportRequest *v18;
  BMRapportRequest *v19;
  id v20;
  id requestBlock;
  id v22;
  id completionHandler;
  NSMutableSet *v24;
  NSMutableSet *deliveredToDevices;
  NSMutableSet *v26;
  NSMutableSet *inFlightToDevices;
  NSMutableDictionary *v28;
  NSMutableDictionary *errorFromDevice;
  uint64_t v30;
  OS_os_transaction *transaction;
  objc_super v33;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v33.receiver = self;
  v33.super_class = (Class)BMRapportRequest;
  v18 = -[BMRapportRequest init](&v33, "init");
  v19 = v18;
  if (v18)
  {
    v18->_state = 0;
    objc_storeStrong((id *)&v18->_uuid, a3);
    objc_storeStrong((id *)&v19->_activity, a4);
    v20 = objc_msgSend(v15, "copy");
    requestBlock = v19->_requestBlock;
    v19->_requestBlock = v20;

    v22 = objc_msgSend(v17, "copy");
    completionHandler = v19->_completionHandler;
    v19->_completionHandler = v22;

    v24 = objc_opt_new(NSMutableSet);
    deliveredToDevices = v19->_deliveredToDevices;
    v19->_deliveredToDevices = v24;

    v26 = objc_opt_new(NSMutableSet);
    inFlightToDevices = v19->_inFlightToDevices;
    v19->_inFlightToDevices = v26;

    v28 = objc_opt_new(NSMutableDictionary);
    errorFromDevice = v19->_errorFromDevice;
    v19->_errorFromDevice = v28;

    objc_storeStrong((id *)&v19->_queue, a6);
    v30 = os_transaction_create("BMRapportRequest");
    transaction = v19->_transaction;
    v19->_transaction = (OS_os_transaction *)v30;

    -[BMRapportRequest startRequestTimeout](v19, "startRequestTimeout");
  }

  return v19;
}

- (void)runRequestOnDevice:(id)a3
{
  id v4;
  void (**v5)(id, id);

  v4 = a3;
  -[BMRapportRequest stopRequestTimeout](self, "stopRequestTimeout");
  self->_state = 1;
  v5 = (void (**)(id, id))objc_claimAutoreleasedReturnValue(-[BMRapportRequest requestBlock](self, "requestBlock"));
  v5[2](v5, v4);

}

- (void)markAsInFlightToDevice:(id)a3
{
  -[NSMutableSet addObject:](self->_inFlightToDevices, "addObject:", a3);
}

- (void)markAsDeliveredToDevice:(id)a3 withError:(id)a4
{
  id v6;
  NSMutableDictionary *errorFromDevice;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[NSMutableSet removeObject:](self->_inFlightToDevices, "removeObject:", v9);
  -[NSMutableSet addObject:](self->_deliveredToDevices, "addObject:", v9);
  if (v6)
  {
    errorFromDevice = self->_errorFromDevice;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "rapportIdentifier"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](errorFromDevice, "setObject:forKeyedSubscript:", v6, v8);

  }
}

- (void)startRequestTimeout
{
  NSObject *requestTimeout;
  dispatch_time_t v3;
  OS_dispatch_source *v5;
  OS_dispatch_source *v6;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id location;

  requestTimeout = self->_requestTimeout;
  if (requestTimeout)
  {
    v3 = dispatch_time(0, 30000000000);
    dispatch_source_set_timer(requestTimeout, v3, 0xFFFFFFFFFFFFFFFFLL, 0x6FC23AC00uLL);
  }
  else
  {
    v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
    v6 = self->_requestTimeout;
    self->_requestTimeout = v5;

    v7 = self->_requestTimeout;
    v8 = dispatch_time(0, 30000000000);
    dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x6FC23AC00uLL);
    objc_initWeak(&location, self);
    v9 = self->_requestTimeout;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000AFA0;
    v10[3] = &unk_100068A28;
    objc_copyWeak(&v11, &location);
    dispatch_source_set_event_handler(v9, v10);
    dispatch_resume((dispatch_object_t)self->_requestTimeout);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (void)stopRequestTimeout
{
  NSObject *requestTimeout;
  OS_dispatch_source *v4;

  requestTimeout = self->_requestTimeout;
  if (requestTimeout)
  {
    dispatch_source_cancel(requestTimeout);
    v4 = self->_requestTimeout;
    self->_requestTimeout = 0;

  }
}

- (void)requestTimeoutDidFire
{
  void *v3;
  void (**v4)(void);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportRequest requestTimeoutHandler](self, "requestTimeoutHandler"));

  if (v3)
  {
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[BMRapportRequest requestTimeoutHandler](self, "requestTimeoutHandler"));
    v4[2]();

  }
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (OS_xpc_object)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
  objc_storeStrong((id *)&self->_activity, a3);
}

- (id)requestBlock
{
  return self->_requestBlock;
}

- (void)setRequestBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSSet)deliveredToDevices
{
  return &self->_deliveredToDevices->super;
}

- (void)setDeliveredToDevices:(id)a3
{
  objc_storeStrong((id *)&self->_deliveredToDevices, a3);
}

- (NSSet)inFlightToDevices
{
  return &self->_inFlightToDevices->super;
}

- (void)setInFlightToDevices:(id)a3
{
  objc_storeStrong((id *)&self->_inFlightToDevices, a3);
}

- (NSDictionary)errorFromDevice
{
  return &self->_errorFromDevice->super;
}

- (void)setErrorFromDevice:(id)a3
{
  objc_storeStrong((id *)&self->_errorFromDevice, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_dispatch_source)requestTimeout
{
  return self->_requestTimeout;
}

- (void)setRequestTimeout:(id)a3
{
  objc_storeStrong((id *)&self->_requestTimeout, a3);
}

- (id)requestTimeoutHandler
{
  return self->_requestTimeoutHandler;
}

- (void)setRequestTimeoutHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BMSyncSessionContext)sessionContext
{
  return self->_sessionContext;
}

- (void)setSessionContext:(id)a3
{
  objc_storeStrong((id *)&self->_sessionContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionContext, 0);
  objc_storeStrong(&self->_requestTimeoutHandler, 0);
  objc_storeStrong((id *)&self->_requestTimeout, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_requestBlock, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_errorFromDevice, 0);
  objc_storeStrong((id *)&self->_inFlightToDevices, 0);
  objc_storeStrong((id *)&self->_deliveredToDevices, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end
