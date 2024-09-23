@implementation SensorDispatcherHelper

+ (id)sharedInstance
{
  if (qword_1000A2440 != -1)
    dispatch_once(&qword_1000A2440, &stru_10007E348);
  return (id)qword_1000A2448;
}

- (int)getValueFromSMCForKey:(__CFString *)a3
{
  NSObject *v5;
  uint64_t v6;
  int result;
  int v8;
  uint8_t buf[4];
  const char *CStringPtr;

  v8 = 0;
  if (byte_1000A2480)
  {
    v5 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      CStringPtr = CFStringGetCStringPtr(a3, 0x8000100u);
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<Notice> Looking for SMC Key %s", buf, 0xCu);
    }
  }
  if (!sub_1000048B0(self->_smcSensorDict, a3, kCFNumberSInt32Type, &v8))
    return -1;
  v6 = 0;
  result = -1;
  do
  {
    if (v8 == self->_sensor4CC.sensor4CC[v6])
      result = self->_sensorData.sensorTemperature[v6];
    ++v6;
  }
  while (v6 != 15);
  return result;
}

- (int)getTemperatureFromSMCForKey:(__CFString *)a3
{
  int result;

  result = -[SensorDispatcherHelper getValueFromSMCForKey:](self, "getValueFromSMCForKey:", a3);
  if (result != -1)
  {
    if (result == -12700)
      return -12800;
    else
      return (int)((double)result / 65535.0 * 100.0);
  }
  return result;
}

- (void)readKeysFromSensorDispatcher
{
  mach_port_t connect;
  size_t outputStructCnt;

  outputStructCnt = 60;
  connect = self->connect;
  if (connect
    && IOConnectCallStructMethod(connect, 2u, 0, 0, &self->_sensorData, &outputStructCnt)
    && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
  {
    sub_100055D14();
  }
}

- (SensorDispatcherHelper)init
{
  SensorDispatcherHelper *v2;
  const __CFDictionary *v3;
  io_service_t MatchingService;
  NSObject *v5;
  sensorTemperature4CC *p_sensor4CC;
  unint64_t v7;
  int *v8;
  int v9;
  CFStringRef v10;
  uint8_t v12[16];
  size_t outputStructCnt;
  uint32_t outputCnt;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SensorDispatcherHelper;
  v2 = -[SensorDispatcherHelper init](&v15, "init");
  if (v2)
  {
    v3 = IOServiceMatching("AppleSMCSensorDispatcher");
    MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v3);
    outputCnt = 1;
    outputStructCnt = 60;
    if (MatchingService)
    {
      if (IOServiceOpen(MatchingService, mach_task_self_, 0, &v2->connect))
      {
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          sub_100055CE8();
      }
      else
      {
        if (IOConnectCallScalarMethod(v2->connect, 0, 0, 0, &v2->sensorCount, &outputCnt)
          && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        {
          sub_100055CBC();
        }
        p_sensor4CC = &v2->_sensor4CC;
        if (IOConnectCallStructMethod(v2->connect, 1u, 0, 0, &v2->_sensor4CC, &outputStructCnt)
          && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        {
          sub_100055C90();
        }
        v2->_smcSensorDict = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        if (v2->sensorCount)
        {
          v7 = 0;
          v8 = (int *)&v2->_sensor4CC;
          do
          {
            v9 = *v8++;
            v10 = sub_10003432C(v9);
            sub_10000536C(v2->_smcSensorDict, v10, kCFNumberSInt32Type, p_sensor4CC);
            ++v7;
            p_sensor4CC = (sensorTemperature4CC *)v8;
          }
          while (v7 < v2->sensorCount);
        }
      }
    }
    else
    {
      v5 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<Notice> AppleSMCSensorDispatcher not enabled on this device", v12, 2u);
      }
    }
  }
  return v2;
}

- (int)writeKeysToSensorDispatcher:(smcKeyWrites *)a3
{
  mach_port_t connect;
  kern_return_t v4;
  NSObject *v5;

  connect = self->connect;
  if (!connect)
    return -536870212;
  v4 = IOConnectCallStructMethod(connect, 3u, a3, 0x58uLL, 0, 0);
  if (v4)
  {
    v5 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100055D40(v4, v5);
  }
  return v4;
}

- (float)getFloatValueFromSMCForKey:(__CFString *)a3
{
  int v4;
  float result;
  uint64_t i;
  int v7;

  v7 = 0;
  v4 = sub_1000048B0(self->_smcSensorDict, a3, kCFNumberSInt32Type, &v7);
  result = -1.0;
  if (v4)
  {
    for (i = 0; i != 15; ++i)
    {
      if (v7 == self->_sensor4CC.sensor4CC[i])
        result = *(float *)&self->_sensorData.sensorTemperature[i];
    }
  }
  return result;
}

@end
