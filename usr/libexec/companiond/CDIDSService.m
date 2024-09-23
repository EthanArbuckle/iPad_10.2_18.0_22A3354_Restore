@implementation CDIDSService

- (CDIDSService)init
{
  CDIDSService *v2;
  CDIDSService *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CDIDSService;
  v2 = -[CDIDSService init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v3->_activateCalledAtomic = 0;
  }
  return v3;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (void)activate
{
  OS_dispatch_queue *dispatchQueue;
  _QWORD block[5];

  atomic_store(1u, (unsigned __int8 *)&self->_activateCalledAtomic);
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018A14;
  block[3] = &unk_1000307A0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)invalidate
{
  OS_dispatch_queue *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018A80;
  block[3] = &unk_1000307A0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_activated
{
  IDSService *v3;
  IDSService *idsService;
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v3 = (IDSService *)objc_msgSend(objc_alloc((Class)IDSService), "initWithService:", CFSTR("com.apple.private.alloy.companion.auth"));
  idsService = self->_idsService;
  self->_idsService = v3;

  -[IDSService addDelegate:queue:](self->_idsService, "addDelegate:queue:", self, self->_dispatchQueue);
  v5 = sub_100018B28();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "IDS service activated.", v7, 2u);
  }

}

- (void)_invalidated
{
  IDSService *idsService;
  id messageReceivedHandler;
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone)
  {
    idsService = self->_idsService;
    self->_idsService = 0;

    messageReceivedHandler = self->_messageReceivedHandler;
    self->_messageReceivedHandler = 0;

    self->_invalidateDone = 1;
    v5 = sub_100018B28();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "IDS service invalidated.", v7, 2u);
    }

  }
}

- (void)sendMessage:(int64_t)a3 toUsernames:(id)a4
{
  id v6;
  OS_dispatch_queue *dispatchQueue;
  id v8;
  _QWORD block[4];
  id v10;
  CDIDSService *v11;
  int64_t v12;

  v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018C8C;
  block[3] = &unk_100031108;
  v11 = self;
  v12 = a3;
  v10 = v6;
  v8 = v6;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);

}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t NSNumber;
  void *v16;
  id v17;
  id v18;
  void (**messageReceivedHandler)(id, id);
  int v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = sub_100018B28();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138412802;
    v21 = v10;
    v22 = 2112;
    v23 = v11;
    v24 = 2112;
    v25 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "IDS incomingMessage: account=%@, incomingMessage=%@, fromID=%@", (uint8_t *)&v20, 0x20u);
  }

  NSNumber = NSDictionaryGetNSNumber(v11, CFSTR("type"), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
  v17 = objc_msgSend(v16, "copy");
  v18 = objc_msgSend(v17, "integerValue");

  messageReceivedHandler = (void (**)(id, id))self->_messageReceivedHandler;
  if (messageReceivedHandler)
    messageReceivedHandler[2](messageReceivedHandler, v18);

}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  _BOOL4 v9;
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  int v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  int v22;
  __int16 v23;
  id v24;

  v9 = a6;
  v11 = a4;
  v12 = a5;
  v13 = a7;
  v14 = sub_100018B28();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = v15;
  if (v9)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138413058;
      v18 = v11;
      v19 = 2112;
      v20 = v12;
      v21 = 1024;
      v22 = 1;
      v23 = 2112;
      v24 = v13;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "IDS didSendWithSuccess: account=%@, identifier=%@, success=%d, error=%@", (uint8_t *)&v17, 0x26u);
    }
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v17 = 138413058;
    v18 = v11;
    v19 = 2112;
    v20 = v12;
    v21 = 1024;
    v22 = 0;
    v23 = 2112;
    v24 = v13;
    _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "IDS failed to send: account=%@, identifier=%@, success=%d, error=%@", (uint8_t *)&v17, 0x26u);
  }

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (id)messageReceivedHandler
{
  return self->_messageReceivedHandler;
}

- (void)setMessageReceivedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_messageReceivedHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
}

@end
