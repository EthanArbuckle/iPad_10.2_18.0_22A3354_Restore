@implementation _NFXPCSession

- (_NFXPCSession)initWithRemoteObject:(id)a3 workQueue:(id)a4
{
  return -[_NFXPCSession initWithRemoteObject:workQueue:expressModeManager:allowsBackgroundMode:](self, "initWithRemoteObject:workQueue:expressModeManager:allowsBackgroundMode:", a3, a4, 0, 1);
}

- (_NFXPCSession)initWithRemoteObject:(id)a3 workQueue:(id)a4 allowsBackgroundMode:(BOOL)a5
{
  return -[_NFXPCSession initWithRemoteObject:workQueue:expressModeManager:allowsBackgroundMode:](self, "initWithRemoteObject:workQueue:expressModeManager:allowsBackgroundMode:", a3, a4, 0, a5);
}

- (_NFXPCSession)initWithRemoteObject:(id)a3 workQueue:(id)a4 expressModeManager:(id)a5
{
  return -[_NFXPCSession initWithRemoteObject:workQueue:expressModeManager:allowsBackgroundMode:](self, "initWithRemoteObject:workQueue:expressModeManager:allowsBackgroundMode:", a3, a4, a5, 1);
}

- (_NFXPCSession)initWithRemoteObject:(id)a3 workQueue:(id)a4 expressModeManager:(id)a5 allowsBackgroundMode:(BOOL)a6
{
  _BOOL8 v6;
  id v11;
  _NFXPCSession *v12;
  _NFXPCSession *v13;
  objc_super v15;

  v6 = a6;
  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_NFXPCSession;
  v12 = -[_NFSession initWithWorkQueue:expressModeManager:allowsBackgroundMode:](&v15, "initWithWorkQueue:expressModeManager:allowsBackgroundMode:", a4, a5, v6);
  v13 = v12;
  if (v12)
    objc_storeStrong(&v12->_remoteObject, a3);

  return v13;
}

- (void)releaseObjects
{
  id remoteObject;
  id WeakRetained;
  void *v5;
  void *v6;
  objc_super v7;

  remoteObject = self->_remoteObject;
  self->_remoteObject = 0;

  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "NF_userInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ProxyObjects")));
  objc_msgSend(v6, "removeObject:", self);

  v7.receiver = self;
  v7.super_class = (Class)_NFXPCSession;
  -[_NFSession releaseObjects](&v7, "releaseObjects");
}

- (BOOL)suspendWithInfo:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_NFXPCSession;
  v5 = -[_NFSession suspendWithInfo:](&v8, "suspendWithInfo:", v4);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
    objc_msgSend(v6, "handleSessionSuspended:", v4);

  }
  return v5;
}

- (void)resume
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_NFXPCSession;
  -[_NFSession resume](&v4, "resume");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
  objc_msgSend(v3, "handleSessionResumed");

}

- (id)powerAssertionIdentifier
{
  __CFString *v3;
  __CFString *v4;
  id v5;
  uint64_t v6;
  const char *ClassName;
  id v8;
  objc_super v10;

  v3 = (__CFString *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession clientName](self, "clientName"));
  v4 = v3;
  if (!v3 || !-[__CFString length](v3, "length"))
  {

    v4 = CFSTR("unavailable");
  }
  v5 = objc_alloc((Class)NSString);
  v6 = -[_NFXPCSession processIdentifier](self, "processIdentifier");
  ClassName = object_getClassName(self);
  v10.receiver = self;
  v10.super_class = (Class)_NFXPCSession;
  v8 = objc_msgSend(v5, "initWithFormat:", CFSTR("process:%@,pid:%d,%s,sessionID:%d"), v4, v6, ClassName, -[_NFSession sessionID](&v10, "sessionID"));

  return v8;
}

- (id)clientName
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession connection](self, "connection"));

  if (!v3
    || (v4 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession connection](self, "connection")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "NF_userInfo")),
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ClientName"))),
        v5,
        v4,
        !v6))
  {
    v6 = &stru_1002ED8A8;
  }
  return v6;
}

- (int)processIdentifier
{
  void *v2;
  int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession connection](self, "connection"));
  v3 = objc_msgSend(v2, "processIdentifier");

  return v3;
}

- (id)bundleIdentifier
{
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession connection](self, "connection"));

  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "NF_userInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BundleIdentifier")));

    if (v6)
      v7 = v6;
    else
      v7 = objc_opt_new(NSString);
    v8 = v7;

  }
  else
  {
    v8 = objc_opt_new(NSString);
  }
  return v8;
}

- (void)endSession:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_NFXPCSession;
  -[_NFSession endSession:](&v3, "endSession:", a3);
}

- (void)prioritizeSessionWithCompletion:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_NFXPCSession;
  -[_NFSession prioritizeSessionWithCompletion:](&v3, "prioritizeSessionWithCompletion:", a3);
}

- (void)activateWithToken:(id)a3 completion:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_NFXPCSession;
  -[_NFSession activateWithToken:completion:](&v4, "activateWithToken:completion:", a3, a4);
}

- (void)createHandoffTokenWithCompletion:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_NFXPCSession;
  -[_NFSession createHandoffTokenWithCompletion:](&v3, "createHandoffTokenWithCompletion:", a3);
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_connection);
}

- (void)setConnection:(id)a3
{
  objc_storeWeak((id *)&self->_connection, a3);
}

- (id)remoteObject
{
  return objc_getProperty(self, a2, 152, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_remoteObject, 0);
  objc_destroyWeak((id *)&self->_connection);
}

@end
