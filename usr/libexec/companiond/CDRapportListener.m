@implementation CDRapportListener

- (CDRapportListener)init
{
  CDRapportListener *v2;
  CDRapportListener *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CDRapportListener;
  v2 = -[CDRapportListener init](&v5, "init");
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
  block[2] = sub_100012EA8;
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
  block[2] = sub_100012F14;
  block[3] = &unk_1000307A0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_activated
{
  OS_dispatch_queue *dispatchQueue;
  _QWORD v4[4];
  id v5;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  objc_initWeak(&location, self);
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100012FD8;
  v4[3] = &unk_100030EC0;
  objc_copyWeak(&v5, &location);
  xpc_set_event_stream_handler("com.apple.rapport.matching", (dispatch_queue_t)dispatchQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_invalidated
{
  id deviceFoundHandler;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone)
  {
    deviceFoundHandler = self->_deviceFoundHandler;
    self->_deviceFoundHandler = 0;

    self->_invalidateDone = 1;
  }
}

- (void)_handleEvent:(id)a3
{
  const char *string;
  const char *v5;
  BOOL v6;
  void (**deviceFoundHandler)(id, void *, uint64_t);
  const char *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  xpc_object_t reply;
  void *v13;
  xpc_object_t xdict;

  xdict = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  string = xpc_dictionary_get_string(xdict, _xpc_event_key_name);
  v5 = xpc_dictionary_get_string(xdict, "deviceID");
  if (string)
    v6 = v5 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    deviceFoundHandler = (void (**)(id, void *, uint64_t))self->_deviceFoundHandler;
    if (deviceFoundHandler)
    {
      v8 = v5;
      if (!strcmp(string, "CompanionAuthenticationDiscovery"))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v8));
        deviceFoundHandler[2](deviceFoundHandler, v9, 1);
      }
      else
      {
        if (strcmp(string, "LegacyAppSignInDiscovery"))
          goto LABEL_11;
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v8));
        deviceFoundHandler[2](deviceFoundHandler, v9, 2);
      }

    }
  }
LABEL_11:
  v10 = xpc_dictionary_get_BOOL(xdict, "replyRequired");
  v11 = xdict;
  if (v10)
  {
    reply = xpc_dictionary_create_reply(xdict);
    v13 = reply;
    if (reply)
      xpc_dictionary_send_reply(reply);

    v11 = xdict;
  }

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (id)deviceFoundHandler
{
  return self->_deviceFoundHandler;
}

- (void)setDeviceFoundHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deviceFoundHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
