@implementation RPThermalPressure

- (void)dealloc
{
  objc_super v3;

  -[RPThermalPressure stopMonitoring](self, "stopMonitoring");
  objc_storeWeak((id *)&self->_delegate, 0);
  v3.receiver = self;
  v3.super_class = (Class)RPThermalPressure;
  -[RPThermalPressure dealloc](&v3, "dealloc");
}

- (void)startMonitoring
{
  int *p_thermalNotificationToken;
  int v4;
  _QWORD handler[5];

  p_thermalNotificationToken = &self->_thermalNotificationToken;
  notify_register_check(kOSThermalNotificationPressureLevelName, &self->_thermalNotificationToken);
  v4 = -[RPThermalPressure getStateWithToken:](self, "getStateWithToken:", self->_thermalNotificationToken);
  self->_thermalLevel = v4;
  self->_newThermalLevel = v4;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100004278;
  handler[3] = &unk_100080D38;
  handler[4] = self;
  notify_register_dispatch(kOSThermalNotificationPressureLevelName, p_thermalNotificationToken, (dispatch_queue_t)&_dispatch_main_q, handler);
}

- (void)stopMonitoring
{
  notify_cancel(self->_thermalNotificationToken);
}

- (int64_t)getCurrentPressureLevel
{
  return -[RPThermalPressure convertThermalPressureLevel:](self, "convertThermalPressureLevel:", self->_newThermalLevel);
}

- (void)thermalPressureDidChangeWithThermalLevel:(int)a3
{
  int newThermalLevel;
  id WeakRetained;

  newThermalLevel = self->_newThermalLevel;
  if (newThermalLevel != a3)
  {
    self->_thermalLevel = newThermalLevel;
    self->_newThermalLevel = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "thermalPressureDidChangeWithLevel:", -[RPThermalPressure convertThermalPressureLevel:](self, "convertThermalPressureLevel:", self->_thermalLevel));

  }
}

- (int64_t)convertThermalPressureLevel:(int)a3
{
  int64_t v3;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;

  v3 = a3;
  if (a3 > 29)
  {
    switch(a3)
    {
      case 30:
        return 30;
      case 40:
        return 40;
      case 50:
        return 50;
    }
  }
  else
  {
    switch(a3)
    {
      case 0:
        return v3;
      case 10:
        return 10;
      case 20:
        return 20;
    }
  }
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136446466;
    v6 = "-[RPThermalPressure convertThermalPressureLevel:]";
    v7 = 1024;
    v8 = 70;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d unknown pressure level", (uint8_t *)&v5, 0x12u);
  }
  return v3;
}

- (int)getStateWithToken:(int)a3
{
  uint64_t state64;

  state64 = 0;
  notify_get_state(a3, &state64);
  return state64;
}

- (RPThermalPressureDelegate)delegate
{
  return (RPThermalPressureDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
