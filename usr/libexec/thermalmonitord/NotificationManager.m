@implementation NotificationManager

- (id)init:(int)a3 withSolarInfo:(BOOL)a4 withModeratePressureVersion:(int)a5
{
  _BOOL4 v6;
  NotificationManager *v8;
  NotificationManager *v9;
  int v10;
  int v11;
  uint64_t v12;
  int *v13;
  unint64_t v14;
  uint64_t v15;
  NSObject *v16;
  _OWORD v18[2];
  uint8_t buf;
  _BYTE v20[12];
  char v21[3];
  objc_super v22;
  char name[16];
  _BYTE v24[21];

  v6 = a4;
  v22.receiver = self;
  v22.super_class = (Class)NotificationManager;
  v8 = -[NotificationManager init](&v22, "init");
  v9 = v8;
  if (v8)
  {
    v8->pressureLevel_previous = 0;
    v8->totalSensors = a3 + 1;
    v10 = a3 + 4;
    if (a3 < -4)
      v10 = a3 + 7;
    v8->includeSolarInfo = v6;
    if (v6)
      v11 = 2;
    else
      v11 = 1;
    v12 = (v11 + (v10 >> 2));
    v13 = (int *)malloc_type_malloc(4 * (int)v12, 0x100004052888210uLL);
    v9->listThermalSensorToken = v13;
    if (notify_register_check("com.apple.system.maxthermalsensorvalue", v13)
      && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    {
      sub_10004F444();
    }
    if ((int)v12 >= 2)
    {
      v14 = 1;
      v15 = 1;
      qmemcpy(v18, ".thermalSensorVacom.apple.system", sizeof(v18));
      do
      {
        *(_OWORD *)name = v18[1];
        *(_OWORD *)v24 = v18[0];
        strcpy(&v24[13], "rValues");
        if (v14 != 1 && v14 <= 0x63)
        {
          __sprintf_chk(v21, 0, 3uLL, "%d", v14);
          __strcat_chk(name, v21, 40);
        }
        if (notify_register_check(name, &v9->listThermalSensorToken[v15]))
        {
          v16 = qword_1000A28A0;
          if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
            sub_10004F408(&buf, v20, v16);
        }
        ++v14;
        ++v15;
      }
      while (v12 != v14);
    }
    if (notify_register_check(kOSThermalNotificationName, &v9->thermalStatusToken)
      && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    {
      sub_10004F3DC();
    }
    if (notify_register_check(kOSThermalNotificationPressureLevelName, &v9->thermalPressureLevelToken)
      && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    {
      sub_10004F3B0();
    }
    if (notify_register_check("com.apple.thermal.timeToMitigate", &v9->timeToMitigateToken)
      && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    {
      sub_10004F384();
    }
    if (notify_register_check("com.apple.thermal.mitigationReasonCode", &v9->mitigationReasonCodeToken)
      && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    {
      sub_10004F358();
    }
    if (notify_register_check("com.apple.system.thermalmitigation", &v9->thermalMitigationToken)
      && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    {
      sub_10004F32C();
    }
    if (notify_register_check("com.apple.cltm.radioNotification", &v9->radioNotificationToken)
      && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    {
      sub_10004F300();
    }
    if (notify_set_state(v9->thermalPressureLevelToken, 0)
      && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    {
      sub_10004F2D4();
    }
    if (notify_post(kOSThermalNotificationPressureLevelName)
      && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    {
      sub_10004F2A8();
    }
    -[NotificationManager updateThermalNotification:](v9, "updateThermalNotification:", 0);
    -[NotificationManager updatetimeToMitigateNotification:AndReasonCode:](v9, "updatetimeToMitigateNotification:AndReasonCode:", 0, 0);
    v9->moderatePressureVersion = a5;
  }
  return v9;
}

- (void)dealloc
{
  int *listThermalSensorToken;
  objc_super v4;

  listThermalSensorToken = self->listThermalSensorToken;
  if (listThermalSensorToken)
    free(listThermalSensorToken);
  v4.receiver = self;
  v4.super_class = (Class)NotificationManager;
  -[NotificationManager dealloc](&v4, "dealloc");
}

- (void)updateMaxValueToken:(unint64_t)a3
{
  if (notify_set_state(*self->listThermalSensorToken, a3))
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_10004F470();
  }
}

- (void)updateNotifyTokens
{
  uint64_t v3;
  int v4;
  int totalSensors;
  uint64_t v6;
  int v7;
  __int128 v8;
  uint64_t v9;

  if (-[NotificationManager includeSolarInfo](self, "includeSolarInfo"))
  {
    v3 = (_QWORD)-[ContextAwareThermalManager getContextState:](+[ContextAwareThermalManager sharedInstance](ContextAwareThermalManager, "sharedInstance"), "getContextState:", 0) << 48;
    v4 = 1;
  }
  else
  {
    v4 = 0;
    v3 = 0;
  }
  totalSensors = self->totalSensors;
  if (totalSensors >= 1)
  {
    v6 = 0;
    v7 = 1;
    do
    {
      *((_QWORD *)&v8 + 1) = *((unsigned int *)&qword_1000A29AC + v6);
      *(_QWORD *)&v8 = v3;
      v3 = v8 >> 16;
      ++v4;
      v9 = (totalSensors - 1);
      if ((v4 & 3) == 0 || v6 == v9)
      {
        if ((v4 & 3) != 0 && v6 == v9)
        {
          do
          {
            v3 >>= 16;
            ++v4;
          }
          while ((v4 & 3) != 0);
        }
        if (notify_set_state(self->listThermalSensorToken[v7], v3))
        {
          if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
            sub_10004F49C();
          return;
        }
        v3 = 0;
        ++v7;
        totalSensors = self->totalSensors;
      }
      ++v6;
    }
    while (v6 < totalSensors);
  }
}

- (void)updateThermalNotification:(unint64_t)a3
{
  if (notify_set_state(self->thermalStatusToken, a3))
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_10004F4F4();
  }
  else if (notify_post(kOSThermalNotificationName) && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
  {
    sub_10004F4C8();
  }
}

- (void)sendRadioNotification:(unsigned __int8)a3
{
  if (notify_set_state(self->radioNotificationToken, a3)
    && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
  {
    sub_10004F54C();
  }
  if (notify_post("com.apple.cltm.radioNotification"))
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_10004F520();
  }
}

- (int64_t)updateThermalPressureLevelNotification:(unint64_t)a3 shouldForceThermalPressure:(BOOL)a4
{
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint32_t v11;
  NSObject *v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  unint64_t v17;

  v6 = 50;
  switch(a3)
  {
    case 1uLL:
      goto LABEL_9;
    case 2uLL:
    case 3uLL:
      goto LABEL_8;
    case 4uLL:
      if (self->moderatePressureVersion == 1)
        goto LABEL_10;
LABEL_8:
      if (self->moderatePressureVersion)
      {
LABEL_9:
        v7 = self->pressureLevel_previous > 0xA;
        v8 = 10;
        v9 = 20;
LABEL_15:
        if (v7)
          v6 = v9;
        else
          v6 = v8;
      }
      else
      {
LABEL_10:
        if (self->pressureLevel_previous)
          v6 = 20;
        else
          v6 = 10;
      }
LABEL_18:
      if (v6 == self->pressureLevel_previous || byte_10009A1F0 == 0)
        goto LABEL_23;
      if (notify_set_state(self->thermalPressureLevelToken, v6))
      {
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          sub_10004F2D4();
        return -1;
      }
      v11 = notify_post(kOSThermalNotificationPressureLevelName);
      v12 = qword_1000A28A0;
      if (v11)
      {
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          sub_10004F2A8();
        return -1;
      }
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 134218240;
        v15 = v6;
        v16 = 2048;
        v17 = a3;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "<Notice> Thermal pressure level %llu thermal level %llu", (uint8_t *)&v14, 0x16u);
      }
LABEL_23:
      kdebug_trace(728039436, self->pressureLevel_previous, v6, a3, 0);
      self->pressureLevel_previous = v6;
      return v6;
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
      v7 = self->pressureLevel_previous > 0x14;
      v8 = 20;
      v9 = 30;
      goto LABEL_15;
    case 0xAuLL:
      v6 = 30;
      goto LABEL_18;
    case 0xBuLL:
      v7 = self->pressureLevel_previous > 0x1E;
      v8 = 30;
      v9 = 40;
      goto LABEL_15;
    case 0xCuLL:
      v6 = 40;
      goto LABEL_18;
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
      v7 = self->pressureLevel_previous > 0x28;
      v8 = 40;
      v9 = 50;
      goto LABEL_15;
    case 0x10uLL:
      goto LABEL_18;
    default:
      if (a4 || self->lightPressureOverride)
      {
        v6 = 10;
      }
      else if (self->pressureLevel_previous <= 0xA)
      {
        v6 = 0;
      }
      else
      {
        v6 = 10;
      }
      goto LABEL_18;
  }
}

- (void)setThermalPressureLevelNotification:(unint64_t)a3
{
  unint64_t pressureLevel_previous;
  uint32_t v7;
  NSObject *v8;
  int v9;
  unint64_t v10;

  pressureLevel_previous = self->pressureLevel_previous;
  if (pressureLevel_previous == a3 || byte_10009A1F0 == 0)
  {
LABEL_6:
    kdebug_trace(728039436, pressureLevel_previous, a3, 0, 0);
    return;
  }
  if (notify_set_state(self->thermalPressureLevelToken, a3))
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_10004F2D4();
    return;
  }
  v7 = notify_post(kOSThermalNotificationPressureLevelName);
  v8 = qword_1000A28A0;
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 134217984;
      v10 = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<Notice> Thermal pressure level %llu", (uint8_t *)&v9, 0xCu);
    }
    self->pressureLevel_previous = a3;
    pressureLevel_previous = a3;
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    sub_10004F2A8();
}

- (void)setLightPressureOverride:(BOOL)a3
{
  self->lightPressureOverride = a3;
}

- (void)updatetimeToMitigateNotification:(unsigned __int8)a3 AndReasonCode:(unsigned __int8)a4
{
  unsigned int v4;

  v4 = a4;
  if (notify_set_state(self->timeToMitigateToken, a3)
    && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
  {
    sub_10004F5FC();
  }
  if (notify_post("com.apple.thermal.timeToMitigate")
    && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
  {
    sub_10004F5D0();
  }
  if (notify_set_state(self->mitigationReasonCodeToken, v4)
    && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
  {
    sub_10004F5A4();
  }
  if (notify_post("com.apple.thermal.mitigationReasonCode"))
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_10004F578();
  }
}

- (void)updateThermalMitigationNotification:(unsigned __int8)a3
{
  if (notify_set_state(self->thermalMitigationToken, a3)
    && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
  {
    sub_10004F654();
  }
  if (notify_post("com.apple.system.thermalmitigation"))
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_10004F628();
  }
}

- (BOOL)includeSolarInfo
{
  return self->includeSolarInfo;
}

- (void)setIncludeSolarInfo:(BOOL)a3
{
  self->includeSolarInfo = a3;
}

@end
