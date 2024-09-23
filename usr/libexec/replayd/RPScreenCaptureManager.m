@implementation RPScreenCaptureManager

+ (id)newInstance
{
  return objc_alloc_init(RPScreenCaptureManagerIOS);
}

- (RPScreenCaptureManager)initWithDelegate:(id)a3
{
  id v5;
  RPScreenCaptureManager *v6;
  id screenCaptureOutputHandler;
  id didStartScreenCaptureHandler;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  RPScreenCaptureManager *v15;

  v5 = a3;
  v6 = +[RPScreenCaptureManager newInstance](RPScreenCaptureManager, "newInstance");

  if (v6)
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136446722;
      v11 = "-[RPScreenCaptureManager initWithDelegate:]";
      v12 = 1024;
      v13 = 29;
      v14 = 2048;
      v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", (uint8_t *)&v10, 0x1Cu);
    }
    screenCaptureOutputHandler = v6->_screenCaptureOutputHandler;
    v6->_screenCaptureOutputHandler = 0;

    didStartScreenCaptureHandler = v6->_didStartScreenCaptureHandler;
    v6->_didStartScreenCaptureHandler = 0;

    objc_storeStrong((id *)&v6->_delegate, a3);
    v6->_screenCaptureDidStart = 0;
  }

  return v6;
}

- (void)startSessionWithPID:(int)a3 windowSize:(CGSize)a4 systemRecording:(BOOL)a5 contextIDs:(id)a6 mixedRealityCamera:(BOOL)a7 outputHandler:(id)a8 didStartHandler:(id)a9
{
  id v12;
  id v13;
  id v14;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  RPScreenCaptureManager *v20;

  v12 = a6;
  v13 = a8;
  v14 = a9;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136446722;
    v16 = "-[RPScreenCaptureManager startSessionWithPID:windowSize:systemRecording:contextIDs:mixedRealityCamera:outputHa"
          "ndler:didStartHandler:]";
    v17 = 1024;
    v18 = 39;
    v19 = 2048;
    v20 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", (uint8_t *)&v15, 0x1Cu);
  }

}

- (void)stop
{
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  RPScreenCaptureManager *v8;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136446722;
    v4 = "-[RPScreenCaptureManager stop]";
    v5 = 1024;
    v6 = 43;
    v7 = 2048;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", (uint8_t *)&v3, 0x1Cu);
  }
}

- (NSString)systemBroadcastHostBundleId
{
  return self->_systemBroadcastHostBundleId;
}

- (void)setSystemBroadcastHostBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_systemBroadcastHostBundleId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemBroadcastHostBundleId, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong(&self->_didStartScreenCaptureHandler, 0);
  objc_storeStrong(&self->_screenCaptureOutputHandler, 0);
}

@end
