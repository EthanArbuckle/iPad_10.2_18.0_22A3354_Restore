@implementation MobileGestaltHelperProxy

+ (id)proxy
{
  return objc_alloc_init((Class)a1);
}

- (MobileGestaltHelperProxy)init
{
  MobileGestaltHelperProxy *v2;
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSXPCConnection *connection;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  MobileGestaltHelper *v25;
  MobileGestaltHelper *v26;
  _QWORD v28[5];
  int v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)MobileGestaltHelperProxy;
  v2 = -[MobileGestaltHelperProxy init](&v30, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3B38]);
    v2->_connection = (NSXPCConnection *)objc_msgSend_initWithMachServiceName_options_(v3, v4, (uint64_t)CFSTR("com.apple.mobilegestalt.xpc"), 0, v5);
    v9 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E0CB3B50], v6, (uint64_t)&unk_1EE7043A0, v7, v8);
    objc_msgSend_setRemoteObjectInterface_(v2->_connection, v10, v9, v11, v12);
    if (xpc_user_sessions_enabled())
    {
      v29 = 0;
      xpc_user_sessions_get_foreground_uid();
      objc_msgSend__xpcConnection(v2->_connection, v17, v18, v19, v20);
      xpc_connection_set_target_user_session_uid();
    }
    objc_msgSend_resume(v2->_connection, v13, v14, v15, v16);
    connection = v2->_connection;
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = sub_1A40C1A60;
    v28[3] = &unk_1E4BA0FF8;
    v28[4] = v2;
    v25 = (MobileGestaltHelper *)objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(connection, v22, (uint64_t)v28, v23, v24);
    v2->_helper = v25;
    v26 = v25;
  }
  return v2;
}

- (void)invalidate
{

  self->_helper = 0;
}

- (MobileGestaltHelper)helper
{
  return self->_helper;
}

- (int)error
{
  return self->_error;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  objc_msgSend_invalidate(self->_connection, a2, v2, v3, v4);

  v6.receiver = self;
  v6.super_class = (Class)MobileGestaltHelperProxy;
  -[MobileGestaltHelperProxy dealloc](&v6, sel_dealloc);
}

- (BOOL)proxyRebuildCache
{
  uint64_t v2;
  uint64_t v3;
  MobileGestaltHelper *helper;
  BOOL v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  helper = self->_helper;
  if (helper)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = sub_1A40C1C00;
    v7[3] = &unk_1E4BA1020;
    v7[4] = &v8;
    objc_msgSend_rebuildCache_(helper, a2, (uint64_t)v7, v2, v3);
    v5 = *((_BYTE *)v9 + 24) != 0;
  }
  else
  {
    v5 = 0;
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (BOOL)proxySetCacheSentinel
{
  uint64_t v2;
  uint64_t v3;
  MobileGestaltHelper *helper;
  BOOL v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  helper = self->_helper;
  if (helper)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = sub_1A40C1CC8;
    v7[3] = &unk_1E4BA1020;
    v7[4] = &v8;
    objc_msgSend_setCacheSentinel_(helper, a2, (uint64_t)v7, v2, v3);
    v5 = *((_BYTE *)v9 + 24) != 0;
  }
  else
  {
    v5 = 0;
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setError:(int)a3
{
  self->_error = a3;
}

@end
