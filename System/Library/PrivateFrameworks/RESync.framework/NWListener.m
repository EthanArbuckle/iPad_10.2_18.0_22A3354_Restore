@implementation NWListener

- (NWListener)initWithLayer:(void *)a3
{
  NWListener *v4;
  dispatch_semaphore_t v5;
  OS_dispatch_semaphore *readySemaphore;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NWListener;
  v4 = -[NWListener init](&v8, sel_init);
  if (v4)
  {
    v5 = dispatch_semaphore_create(0);
    readySemaphore = v4->readySemaphore;
    v4->readySemaphore = (OS_dispatch_semaphore *)v5;

    v4->listenerState = 0;
    v4->layer = a3;
  }
  return v4;
}

- (void)stopListening
{
  NSObject *v3;
  OS_nw_listener *listener;
  uint8_t v5[16];

  if (self->listener)
  {
    v3 = *re::networkLogObjects((re *)self);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_21C69B000, v3, OS_LOG_TYPE_INFO, "NWListener.stopListening", v5, 2u);
    }
    nw_listener_cancel((nw_listener_t)self->listener);
    nw_listener_set_state_changed_handler((nw_listener_t)self->listener, 0);
    nw_listener_set_new_connection_handler((nw_listener_t)self->listener, 0);
    listener = self->listener;
    self->listener = 0;

  }
}

- (void)setListener:(id)a3
{
  id v5;
  NWListener *v6;
  NSObject *listener;
  uint64_t v8;
  NWListener *v9;
  NSObject *v10;
  NWListener *v11;
  _QWORD v12[4];
  NWListener *v13;
  _QWORD handler[4];
  NWListener *v15;

  objc_storeStrong((id *)&self->listener, a3);
  v5 = a3;
  v6 = self;
  nw_listener_set_queue((nw_listener_t)self->listener, (dispatch_queue_t)v6->listenerQueue);
  listener = self->listener;
  v8 = MEMORY[0x24BDAC760];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __26__NWListener_setListener___block_invoke;
  handler[3] = &unk_24E071790;
  v9 = v6;
  v15 = v9;
  nw_listener_set_state_changed_handler(listener, handler);
  v10 = self->listener;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __26__NWListener_setListener___block_invoke_2;
  v12[3] = &unk_24E0717E0;
  v13 = v9;
  v11 = v9;
  nw_listener_set_new_connection_handler(v10, v12);
  nw_listener_start((nw_listener_t)self->listener);

}

void __26__NWListener_setListener___block_invoke(uint64_t a1, unsigned int a2, void *a3)
{
  re *v5;
  NSObject *v6;
  _BOOL8 v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = *re::networkLogObjects(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v7)
  {
    v8 = v6;
    if (a2 > 4)
      v9 = "unknown";
    else
      v9 = off_24E0719F0[a2];
    v14 = 136315138;
    v15 = (uint64_t)v9;
    _os_log_impl(&dword_21C69B000, v8, OS_LOG_TYPE_INFO, "NWListener.stateChanged state=%s.", (uint8_t *)&v14, 0xCu);

  }
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 40) = a2;
  if (a2 == 2)
    goto LABEL_10;
  if (a2 == 3)
  {
    v10 = *re::networkLogObjects((re *)v7);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = v10;
      -[re description](v5, "description");
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v13 = objc_msgSend(v12, "UTF8String");
      v14 = 136315138;
      v15 = v13;
      _os_log_error_impl(&dword_21C69B000, v11, OS_LOG_TYPE_ERROR, "NWListener failed error=%s", (uint8_t *)&v14, 0xCu);

    }
LABEL_10:
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 24));
  }

}

void __26__NWListener_setListener___block_invoke_2(uint64_t a1, void *a2)
{
  re *v3;
  NSObject *v4;
  _QWORD *v5;
  NSObject *v6;
  re *v7;
  _QWORD v8[4];
  _QWORD *v9;
  re *v10;
  uint8_t buf[16];

  v3 = a2;
  v4 = *re::networkLogObjects(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C69B000, v4, OS_LOG_TYPE_INFO, "NWListener.newConnection", buf, 2u);
  }
  v5 = *(_QWORD **)(a1 + 32);
  v6 = v5[2];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __26__NWListener_setListener___block_invoke_3;
  v8[3] = &unk_24E0717B8;
  v9 = v5;
  v10 = v3;
  v7 = v3;
  dispatch_sync(v6, v8);

}

void __26__NWListener_setListener___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  NSObject *v3;
  const char *hostname;
  re::Address *v5;
  const char *port;
  unint64_t v7;
  const char *description;
  _anonymous_namespace_ *v9;
  _OWORD v10[2];
  unint64_t v11;
  uint64_t v12;
  char v13;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
  if (v1)
  {
    re::NWProtocolLayer::addConnection(&v11, v1, *(void **)(a1 + 40));
    v3 = nw_connection_copy_endpoint(*(nw_connection_t *)(a1 + 40));
    hostname = nw_endpoint_get_hostname(v3);
    if (hostname)
    {
      v5 = (re::Address *)hostname;
      port = (const char *)nw_endpoint_get_port(v3);

      re::Address::makeFromIPAndPort(v5, port, (re::DynamicString *)v10);
    }
    else
    {
      description = (const char *)nw_endpoint_get_description();

      re::DynamicString::DynamicString((re::DynamicString *)v10, (const re::DynamicString *)&v12);
      if (v12 && (v13 & 1) != 0)
        (*(void (**)(void))(*(_QWORD *)v12 + 40))();
    }
    v7 = v11;
    re::DynamicString::operator=((re::DynamicString *)(v11 + 1784), (re::DynamicString *)v10);
    if (*(_QWORD *)&v10[0])
    {
      if ((BYTE8(v10[0]) & 1) != 0)
        (*(void (**)(void))(**(_QWORD **)&v10[0] + 40))();
      memset(v10, 0, sizeof(v10));
    }

    if (v7)
  }
}

- (void)waitForReady
{
  dispatch_semaphore_wait((dispatch_semaphore_t)self->readySemaphore, 0xFFFFFFFFFFFFFFFFLL);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->listener, 0);
  objc_storeStrong((id *)&self->readySemaphore, 0);
  objc_storeStrong((id *)&self->transportQueue, 0);
  objc_storeStrong((id *)&self->listenerQueue, 0);
}

@end
