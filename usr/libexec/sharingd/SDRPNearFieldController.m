@implementation SDRPNearFieldController

+ (BOOL)isAvailable
{
  return NSClassFromString(CFSTR("RPNearFieldController")) != 0;
}

+ (id)supportedApplicationLabels
{
  if (qword_1007C6798 != -1)
    dispatch_once(&qword_1007C6798, &stru_100716A98);
  return (id)qword_1007C6790;
}

- (BOOL)supportsApplicationLabel:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  unsigned __int8 v8;

  v4 = a3;
  v6 = objc_msgSend((id)objc_opt_class(self, v5), "supportedApplicationLabels");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v7, "containsObject:", v4);

  return v8;
}

- (SDRPNearFieldController)initWithDispatchQueue:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  SDRPNearFieldController *v9;
  SDRPNearFieldController *v10;
  uint64_t v11;
  NSObject *v12;
  RPNearFieldController *v13;
  RPNearFieldController *nearFieldController;
  uint8_t v16[16];
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SDRPNearFieldController;
  v9 = -[SDRPNearFieldController init](&v17, "init");
  v10 = v9;
  if (v9)
  {
    v11 = airdrop_log(v9);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "SDRPNearFieldController init", v16, 2u);
    }

    objc_storeStrong((id *)&v10->_dispatchQueue, a3);
    v13 = (RPNearFieldController *)objc_msgSend(objc_alloc((Class)RPNearFieldController), "initWithDispatchQueue:delegate:", v7, v8);
    nearFieldController = v10->_nearFieldController;
    v10->_nearFieldController = v13;

  }
  return v10;
}

- (SDRPNearFieldControllerDelegate)delegate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDRPNearFieldController nearFieldController](self, "nearFieldController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "delegate"));

  return (SDRPNearFieldControllerDelegate *)v3;
}

- (int64_t)currentPreferredPollingType
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDRPNearFieldController nearFieldController](self, "nearFieldController"));
  v3 = objc_msgSend(v2, "currentPreferredPollingType");

  return (int64_t)v3;
}

- (NSString)currentApplicationLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDRPNearFieldController nearFieldController](self, "nearFieldController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentApplicationLabel"));

  return (NSString *)v3;
}

- (SDRPNearFieldTransaction)currentTransaction
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDRPNearFieldController nearFieldController](self, "nearFieldController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentTransaction"));

  return (SDRPNearFieldTransaction *)v3;
}

- (void)startPolling:(int64_t)a3 applicationLabel:(id)a4 pkData:(id)a5 bonjourListenerUUID:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  uint8_t v19[16];

  v10 = a5;
  v11 = a6;
  v12 = a4;
  v13 = airdrop_log(v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "SDRPNearFieldController start", v19, 2u);
  }

  v15 = objc_alloc((Class)RPNearFieldContext);
  if ((objc_opt_respondsToSelector(v15, "initWithApplicationLabel:supportedApplicationLabels:pkData:bonjourListenerUUID:") & 1) != 0)
  {
    v16 = v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[SDRPNearFieldController supportedApplicationLabels](SDRPNearFieldController, "supportedApplicationLabels"));
    v18 = objc_msgSend(v16, "initWithApplicationLabel:supportedApplicationLabels:pkData:bonjourListenerUUID:", v12, v17, v10, v11);

  }
  else
  {
    v18 = objc_msgSend(v15, "initWithApplicationLabel:pkData:bonjourListenerUUID:", v12, v10, v11);
  }
  -[SDRPNearFieldController setCurrentApplicationLabel:](self, "setCurrentApplicationLabel:", v12);

  -[RPNearFieldController startPolling:context:](self->_nearFieldController, "startPolling:context:", a3, v18);
}

- (void)stop
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v4 = airdrop_log(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "SDRPNearFieldController stop", v6, 2u);
  }

  -[RPNearFieldController stop](self->_nearFieldController, "stop");
  -[SDRPNearFieldController setCurrentApplicationLabel:](self, "setCurrentApplicationLabel:", 0);
}

- (void)invalidate
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v4 = airdrop_log(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "SDRPNearFieldController invalidate", v6, 2u);
  }

  -[RPNearFieldController invalidate](self->_nearFieldController, "invalidate");
  -[SDRPNearFieldController setCurrentApplicationLabel:](self, "setCurrentApplicationLabel:", 0);
}

- (void)invalidateTransaction:(id)a3 updatedPkData:(id)a4 bonjourListenerUUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  RPNearFieldController *nearFieldController;
  id v17;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc((Class)RPNearFieldContext);
  if ((objc_opt_respondsToSelector(v11, "initWithApplicationLabel:supportedApplicationLabels:pkData:bonjourListenerUUID:") & 1) != 0)
  {
    v12 = v11;
    v13 = objc_claimAutoreleasedReturnValue(-[SDRPNearFieldController currentApplicationLabel](self, "currentApplicationLabel"));
    v14 = objc_claimAutoreleasedReturnValue(+[SDRPNearFieldController supportedApplicationLabels](SDRPNearFieldController, "supportedApplicationLabels"));
    v17 = objc_msgSend(v12, "initWithApplicationLabel:supportedApplicationLabels:pkData:bonjourListenerUUID:", v13, v14, v9, v8);

    v15 = v9;
    v8 = (id)v14;
    v9 = (id)v13;
  }
  else
  {
    nearFieldController = self->_nearFieldController;
    v15 = v11;
    v12 = (id)objc_claimAutoreleasedReturnValue(-[RPNearFieldController currentApplicationLabel](nearFieldController, "currentApplicationLabel"));
    v17 = objc_msgSend(v15, "initWithApplicationLabel:pkData:bonjourListenerUUID:", v12, v9, v8);
  }

  -[RPNearFieldController invalidateTransaction:context:](self->_nearFieldController, "invalidateTransaction:context:", v10, v17);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setCurrentApplicationLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (RPNearFieldController)nearFieldController
{
  return self->_nearFieldController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nearFieldController, 0);
  objc_storeStrong((id *)&self->_currentApplicationLabel, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
