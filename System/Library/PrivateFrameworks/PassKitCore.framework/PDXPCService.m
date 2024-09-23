@implementation PDXPCService

- (PDXPCService)initWithConnection:(id)a3
{
  id v5;
  PDXPCService *v6;
  PDXPCService *v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  NSString *className;
  int v12;
  void *v13;
  uint64_t v14;
  NSString *remoteProcessApplicationIdentifier;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PDXPCService;
  v6 = -[PDXPCService init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_connection, a3);
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    className = v7->_className;
    v7->_className = (NSString *)v10;

    if (v5)
      v12 = objc_msgSend(v5, "processIdentifier");
    else
      v12 = -1;
    v7->_remoteProcessIdentifier = v12;
    objc_msgSend(v5, "valueForEntitlement:", CFSTR("application-identifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    remoteProcessApplicationIdentifier = v7->_remoteProcessApplicationIdentifier;
    v7->_remoteProcessApplicationIdentifier = (NSString *)v14;

  }
  return v7;
}

- (void)clearConnectionReference
{
  os_unfair_lock_s *p_lock;
  NSXPCConnection *connection;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  connection = self->_connection;
  self->_connection = 0;

  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteProcessApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_className, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)serviceResumed
{
  NSObject *v3;
  NSString *className;
  NSXPCConnection *connection;
  int remoteProcessIdentifier;
  int v7;
  NSString *v8;
  __int16 v9;
  NSXPCConnection *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(4uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    connection = self->_connection;
    className = self->_className;
    remoteProcessIdentifier = self->_remoteProcessIdentifier;
    v7 = 138543874;
    v8 = className;
    v9 = 2048;
    v10 = connection;
    v11 = 1024;
    v12 = remoteProcessIdentifier;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_INFO, "%{public}@ (%p:%d): connection resumed", (uint8_t *)&v7, 0x1Cu);
  }

  os_unfair_lock_lock(&self->_lock);
  self->_callbacksSuspended = 0;
  os_unfair_lock_unlock(&self->_lock);
}

- (id)remoteObjectProxy
{
  return -[PDXPCService remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", 0);
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  os_unfair_lock_s *p_lock;
  void *v6;

  v4 = (void (**)(id, _QWORD))a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_callbacksSuspended)
  {
    v6 = 0;
  }
  else
  {
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  os_unfair_lock_unlock(p_lock);
  if (v4 && !v6)
    v4[2](v4, 0);

  return v6;
}

- (PDXPCService)init
{

  return 0;
}

- (id)connection
{
  os_unfair_lock_s *p_lock;
  NSXPCConnection *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_connection;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (PDXPCApplicationInfo)remoteProcessApplicationInfo
{
  uint64_t v2;
  PDXPCApplicationInfo *v3;

  v2 = -[PDXPCService remoteProcessIdentifier](self, "remoteProcessIdentifier");
  if ((_DWORD)v2)
    v3 = -[PDXPCApplicationInfo initWithPID:]([PDXPCApplicationInfo alloc], "initWithPID:", v2);
  else
    v3 = 0;
  return v3;
}

- (NSString)remoteProcessBundleIdentifier
{
  void *v2;
  void *v3;

  -[PDXPCService remoteProcessApplicationInfo](self, "remoteProcessApplicationInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)serviceSuspended
{
  NSObject *v3;
  NSString *className;
  NSXPCConnection *connection;
  int remoteProcessIdentifier;
  int v7;
  NSString *v8;
  __int16 v9;
  NSXPCConnection *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(4uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    connection = self->_connection;
    className = self->_className;
    remoteProcessIdentifier = self->_remoteProcessIdentifier;
    v7 = 138543874;
    v8 = className;
    v9 = 2048;
    v10 = connection;
    v11 = 1024;
    v12 = remoteProcessIdentifier;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_INFO, "%{public}@ (%p:%d): connection suspended", (uint8_t *)&v7, 0x1Cu);
  }

  os_unfair_lock_lock(&self->_lock);
  self->_callbacksSuspended = 1;
  os_unfair_lock_unlock(&self->_lock);
}

- (int)remoteProcessIdentifier
{
  return self->_remoteProcessIdentifier;
}

- (NSString)remoteProcessApplicationIdentifier
{
  return self->_remoteProcessApplicationIdentifier;
}

@end
