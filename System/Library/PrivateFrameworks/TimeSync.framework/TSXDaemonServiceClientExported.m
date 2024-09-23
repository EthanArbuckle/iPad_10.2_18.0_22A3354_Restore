@implementation TSXDaemonServiceClientExported

- (void)daemonClientRefresh
{
  +[_TSF_IODConnection daemonClientRefresh](_TSF_IODConnection, "daemonClientRefresh");
}

- (void)daemonClientNotification:(unsigned int)a3 ioResult:(unsigned int)a4 arguments:(ScalarArgsArray *)a5
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _DWORD v9[2];
  __int16 v10;
  int v11;
  uint64_t v12;

  v6 = *(_QWORD *)&a4;
  v7 = *(_QWORD *)&a3;
  v12 = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1B5E4E6F0](self, a2);
  if (a5 && a5->var1)
  {
    +[_TSF_IODConnection dispatchNotificationForClientID:ioResult:args:numArgs:](_TSF_IODConnection, "dispatchNotificationForClientID:ioResult:args:numArgs:", v7, v6, a5);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109376;
    v9[1] = v7;
    v10 = 1024;
    v11 = v6;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TSXDaemonServiceClientExported:daemonClientNotification called with no arguments, client ID %u, result %08x result\n", (uint8_t *)v9, 0xEu);
  }
  objc_autoreleasePoolPop(v8);
}

- (TSXDaemonServiceClient)object
{
  return (TSXDaemonServiceClient *)objc_loadWeakRetained((id *)&self->_object);
}

- (void)setObject:(id)a3
{
  objc_storeWeak((id *)&self->_object, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_object);
}

@end
