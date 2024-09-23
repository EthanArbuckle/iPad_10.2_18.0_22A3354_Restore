@implementation LanguageAssetLoaderDaemon

+ (id)sharedInstance
{
  if (qword_10000C5B0 != -1)
    dispatch_once(&qword_10000C5B0, &stru_100008320);
  return (id)qword_10000C5A8;
}

- (LanguageAssetLoaderDaemon)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LanguageAssetLoaderDaemon;
  return -[LanguageAssetLoaderDaemon init](&v3, "init");
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)LanguageAssetLoaderDaemon;
  -[LanguageAssetLoaderDaemon dealloc](&v2, "dealloc");
}

- (void)run
{
  -[LanguageAssetLoaderDaemon _daemonDidLaunch](self, "_daemonDidLaunch");
  -[NSRunLoop run](+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"), "run");
}

- (void)_daemonDidLaunch
{
  -[LanguageAssetLoader reset](+[LanguageAssetLoader sharedInstance](LanguageAssetLoader, "sharedInstance"), "reset");
  -[LanguageAssetLoaderDaemon _setupXPCEventHandler](self, "_setupXPCEventHandler");
}

- (void)_setupXPCEventHandler
{
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_100008360);
}

- (void)_setupXPCListener
{
  _xpc_connection_s *mach_service;

  mach_service = xpc_connection_create_mach_service("com.apple.languageassetd", 0, 1uLL);
  xpc_connection_set_event_handler(mach_service, &stru_1000083A8);
  xpc_connection_resume(mach_service);
}

@end
