@implementation CHPKAnalyticsServer

- (void)dealloc
{
  objc_super v3;

  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", 0);
  -[NSXPCListener invalidate](self->_listener, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CHPKAnalyticsServer;
  -[CHPKAnalyticsServer dealloc](&v3, "dealloc");
}

+ (id)sharedAnalyticsServer
{
  if (qword_10002AE10 != -1)
    dispatch_once(&qword_10002AE10, &stru_100024AC0);
  return (id)qword_10002AE08;
}

- (CHPKAnalyticsServer)init
{
  CHPKAnalyticsServer *v2;
  NSXPCListener *v3;
  NSXPCListener *listener;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CHPKAnalyticsServer;
  v2 = -[CHPKAnalyticsServer init](&v6, "init");
  if (v2)
  {
    v3 = (NSXPCListener *)objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.handwritingd.pkanalytics"));
    listener = v2->_listener;
    v2->_listener = v3;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    v2->_isListening = 0;
  }
  return v2;
}

- (void)resumeConnectionIfIdle
{
  void *v3;

  if (!-[CHPKAnalyticsServer isListening](self, "isListening"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHPKAnalyticsServer listener](self, "listener"));
    objc_msgSend(v3, "resume");

    -[CHPKAnalyticsServer setIsListening:](self, "setIsListening:", 1);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  NSXPCListener *listener;
  void *v8;
  void *v9;

  v6 = a4;
  listener = self->_listener;
  if (listener == a3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___CHPKRemoteAnalyticsProtocol));
    objc_msgSend(v6, "setExportedInterface:", v8);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CHPKPersistentAnalyticsController sharedInstance](CHPKPersistentAnalyticsController, "sharedInstance"));
  objc_msgSend(v6, "setExportedObject:", v9);

  objc_msgSend(v6, "resume");
  return listener == a3;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (BOOL)isListening
{
  return self->_isListening;
}

- (void)setIsListening:(BOOL)a3
{
  self->_isListening = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
}

@end
