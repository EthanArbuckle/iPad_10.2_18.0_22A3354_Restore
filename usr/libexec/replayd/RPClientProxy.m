@implementation RPClientProxy

- (RPClientProxy)initWithConnection:(id)a3
{
  id v4;
  RPClientProxy *v5;
  RPClientProxy *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RPClientProxy;
  v5 = -[RPClientProxy init](&v8, "init");
  v6 = v5;
  if (v5)
    -[RPClientProxy setConnection:](v5, "setConnection:", v4);

  return v6;
}

- (void)dealloc
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  objc_super v5;

  connection = self->_connection;
  if (connection)
  {
    -[NSXPCConnection setInvalidationHandler:](connection, "setInvalidationHandler:", 0);
    -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", 0);
    -[NSXPCConnection invalidate](self->_connection, "invalidate");
    v4 = self->_connection;
    self->_connection = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)RPClientProxy;
  -[RPClientProxy dealloc](&v5, "dealloc");
}

- (void)updateScreenRecordingStateWithCurrentState:(id)a3
{
  id v4;
  void *v5;
  uint8_t v6[16];

  v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPClientProxy:updateScreenRecordingStateWithCurrentState:", v6, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &stru_100081700));
  objc_msgSend(v5, "updateScreenRecordingStateWithCurrentState:", v4);

}

- (void)recordingDidStopWithError:(id)a3 movieURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint8_t v9[16];

  v6 = a3;
  v7 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPClientProxy:recordingDidStopWithError:movieURL:", v9, 2u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &stru_100081720));
  objc_msgSend(v8, "recordingDidStopWithError:movieURL:", v6, v7);

}

- (void)updateBroadcastServiceInfo:(id)a3
{
  id v4;
  void *v5;
  uint8_t v6[16];

  v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPClientProxy:updateBroadcastServiceInfo:", v6, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &stru_100081740));
  objc_msgSend(v5, "updateBroadcastServiceInfo:", v4);

}

- (void)updateBroadcastURL:(id)a3
{
  id v4;
  void *v5;
  uint8_t v6[16];

  v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPClientProxy:updateBroadcastURL:", v6, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &stru_100081760));
  objc_msgSend(v5, "updateBroadcastURL:", v4);

}

- (void)captureHandlerWithSample:(id)a3 timingData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;

  v6 = a3;
  v7 = a4;
  if (!dword_100095B40 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136446722;
    v10 = "-[RPClientProxy captureHandlerWithSample:timingData:]";
    v11 = 1024;
    v12 = 71;
    v13 = 2080;
    v14 = "-[RPClientProxy captureHandlerWithSample:timingData:]";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d %s Sending client video", (uint8_t *)&v9, 0x1Cu);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &stru_100081780));
  objc_msgSend(v8, "captureHandlerWithSample:timingData:", v6, v7);

}

- (void)captureHandlerWithAudioSample:(id)a3 bufferType:(int64_t)a4
{
  id v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int64_t v15;

  v6 = a3;
  if (!dword_100095B40 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136446978;
    v9 = "-[RPClientProxy captureHandlerWithAudioSample:bufferType:]";
    v10 = 1024;
    v11 = 79;
    v12 = 2080;
    v13 = "-[RPClientProxy captureHandlerWithAudioSample:bufferType:]";
    v14 = 2048;
    v15 = a4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d %s Sending client audio with type %ld", (uint8_t *)&v8, 0x26u);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &stru_1000817A0));
  objc_msgSend(v7, "captureHandlerWithAudioSample:bufferType:", v6, a4);

}

- (void)recordingLockInterrupted:(id)a3
{
  id v4;
  void *v5;
  uint8_t v6[16];

  v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPClientProxy:recordingLockInterrupted:", v6, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &stru_1000817C0));
  objc_msgSend(v5, "recordingLockInterrupted:", v4);

}

- (void)shouldResumeSessionType:(id)a3
{
  id v4;
  void *v5;
  uint8_t v6[16];

  v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPClientProxy:shouldResumeSessionType:", v6, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &stru_1000817E0));
  objc_msgSend(v5, "shouldResumeSessionType:", v4);

}

- (void)recordingDidPause
{
  void *v3;
  uint8_t v4[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPClientProxy:recordingDidPause:", v4, 2u);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &stru_100081800));
  objc_msgSend(v3, "recordingDidPause");

}

- (void)recordingTimerDidUpdate:(id)a3
{
  id v4;
  void *v5;
  uint8_t v6[16];

  v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPClientProxy:recordingTimerDidUpdate:", v6, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &stru_100081820));
  objc_msgSend(v5, "recordingTimerDidUpdate:", v4);

}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
