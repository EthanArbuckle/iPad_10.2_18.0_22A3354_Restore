@implementation MesaCoreAnalyticsFingerTouchTimeEvent

- (MesaCoreAnalyticsFingerTouchTimeEvent)initWithName:(id)a3
{
  MesaCoreAnalyticsFingerTouchTimeEvent *v3;
  MesaCoreAnalyticsFingerTouchTimeEvent *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v9;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v10.receiver = self;
  v10.super_class = (Class)MesaCoreAnalyticsFingerTouchTimeEvent;
  v3 = -[MesaCoreAnalyticsEvent initWithName:](&v10, sel_initWithName_, a3);
  v4 = v3;
  if (v3)
  {
    v5 = (int)*MEMORY[0x24BE0CF50];
    objc_msgSend(*(id *)((char *)&v3->super.super.super.isa + v5), "arrayByAddingObjectsFromArray:", &unk_251CB3BB0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(Class *)((char *)&v4->super.super.super.isa + v5);
    *(Class *)((char *)&v4->super.super.super.isa + v5) = (Class)v6;

  }
  else
  {
    if (__osLog)
      v9 = __osLog;
    else
      v9 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v12 = "self = [super initWithName:eventName]";
      v13 = 2048;
      v14 = 0;
      v15 = 2080;
      v16 = "";
      v17 = 2080;
      v18 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/MesaCoreAnalytics/MesaCoreAnalyticsEvent.m";
      v19 = 1024;
      v20 = 371;
      _os_log_impl(&dword_24B74E000, v9, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  return v4;
}

- (MesaCoreAnalyticsFingerTouchTimeEvent)init
{
  return -[MesaCoreAnalyticsFingerTouchTimeEvent initWithName:](self, "initWithName:", CFSTR("com.apple.biometrickit.mesa.fingerTouchTime"));
}

- (BOOL)postEvent
{
  NSObject *v3;
  NSDate *fingerOnDate;
  NSDate *fingerOffDate;
  NSDate *sensorPauseDate;
  NSDate *v7;
  void *v8;
  int v9;
  void *v10;
  double v11;
  NSNumber *v12;
  NSNumber *fingerOffTime;
  NSDate *v14;
  void *v15;
  double v16;
  NSNumber *v17;
  NSNumber *sensorPauseTime;
  objc_super v20;
  uint8_t buf[4];
  NSDate *v22;
  __int16 v23;
  NSDate *v24;
  __int16 v25;
  NSDate *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (__osLog)
    v3 = __osLog;
  else
    v3 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    fingerOnDate = self->_fingerOnDate;
    fingerOffDate = self->_fingerOffDate;
    sensorPauseDate = self->_sensorPauseDate;
    *(_DWORD *)buf = 138412802;
    v22 = fingerOnDate;
    v23 = 2112;
    v24 = fingerOffDate;
    v25 = 2112;
    v26 = sensorPauseDate;
    _os_log_impl(&dword_24B74E000, v3, OS_LOG_TYPE_DEBUG, "MesaCoreAnalyticsFingerTouchTimeEvent postEvent _fingerOnDate: %@ _fingerOffDate: %@ _sensorPauseDate: %@\n", buf, 0x20u);
  }
  if (self->_fingerOnDate
    && (v7 = self->_fingerOffDate) != 0
    && (-[NSDate laterDate:](v7, "laterDate:"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isEqualToDate:", self->_fingerOffDate),
        v8,
        v9))
  {
    v10 = (void *)MEMORY[0x24BDD16E0];
    -[NSDate timeIntervalSinceDate:](self->_fingerOffDate, "timeIntervalSinceDate:", self->_fingerOnDate);
    objc_msgSend(v10, "numberWithDouble:", v11 * 1000.0);
    v12 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    fingerOffTime = self->_fingerOffTime;
    self->_fingerOffTime = v12;

    v14 = self->_sensorPauseDate;
    if (v14)
    {
      v15 = (void *)MEMORY[0x24BDD16E0];
      -[NSDate timeIntervalSinceDate:](v14, "timeIntervalSinceDate:", self->_fingerOnDate);
      objc_msgSend(v15, "numberWithDouble:", v16 * 1000.0);
      v17 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      sensorPauseTime = self->_sensorPauseTime;
      self->_sensorPauseTime = v17;

    }
    v20.receiver = self;
    v20.super_class = (Class)MesaCoreAnalyticsFingerTouchTimeEvent;
    -[MesaCoreAnalyticsEvent postEvent](&v20, sel_postEvent);
    return 1;
  }
  else
  {
    -[MesaCoreAnalyticsFingerTouchTimeEvent reset](self, "reset");
    return 0;
  }
}

- (void)reset
{
  NSDate *fingerOnDate;
  NSDate *fingerOffDate;
  NSDate *sensorPauseDate;
  NSNumber *sensorPaused;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MesaCoreAnalyticsFingerTouchTimeEvent;
  -[MesaCoreAnalyticsEvent reset](&v7, sel_reset);
  fingerOnDate = self->_fingerOnDate;
  self->_fingerOnDate = 0;

  fingerOffDate = self->_fingerOffDate;
  self->_fingerOffDate = 0;

  sensorPauseDate = self->_sensorPauseDate;
  self->_sensorPauseDate = 0;

  sensorPaused = self->_sensorPaused;
  self->_sensorPaused = (NSNumber *)MEMORY[0x24BDBD1C0];

  self->_requestFingerOff = 0;
}

- (void)handleStatusMessage:(unsigned int)a3 forOperation:(unsigned __int8)a4 displayOn:(BOOL)a5
{
  NSDate *v6;
  NSDate *sensorPauseDate;
  NSNumber *sensorPaused;
  NSDate *v9;
  NSDate *v10;
  void *v11;
  uint64_t v12;
  NSDate *v13;
  NSDate *fingerOffDate;
  NSNumber *v15;
  NSNumber *eventEndType;
  _BOOL8 v17;
  uint64_t v18;
  NSDate *v19;
  NSDate *fingerOnDate;
  NSNumber *v21;
  NSNumber *bioOperationType;
  NSNumber *v23;

  if ((int)a3 > 73)
  {
    if (a3 == 74)
    {
      self->_requestFingerOff = 1;
      return;
    }
    if (a3 != 89)
    {
      if (a3 == 91)
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "now", *(_QWORD *)&a3, a4, a5);
        v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
        sensorPauseDate = self->_sensorPauseDate;
        self->_sensorPauseDate = v6;

        sensorPaused = self->_sensorPaused;
        self->_sensorPaused = (NSNumber *)MEMORY[0x24BDBD1C8];
LABEL_15:

        return;
      }
      return;
    }
    objc_msgSend(MEMORY[0x24BDBCE60], "now", *(_QWORD *)&a3, a4, a5);
    v13 = (NSDate *)objc_claimAutoreleasedReturnValue();
    fingerOffDate = self->_fingerOffDate;
    self->_fingerOffDate = v13;

    v11 = (void *)MEMORY[0x24BDD16E0];
    v12 = 1;
LABEL_11:
    objc_msgSend(v11, "numberWithUnsignedInteger:", v12);
    v15 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    eventEndType = self->_eventEndType;
    self->_eventEndType = v15;

    -[MesaCoreAnalyticsFingerTouchTimeEvent postEvent](self, "postEvent");
    return;
  }
  if (a3 != 63)
  {
    if (a3 != 64)
      return;
    objc_msgSend(MEMORY[0x24BDBCE60], "now", *(_QWORD *)&a3, a4, a5);
    v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v10 = self->_fingerOffDate;
    self->_fingerOffDate = v9;

    v11 = (void *)MEMORY[0x24BDD16E0];
    v12 = 0;
    goto LABEL_11;
  }
  if (!self->_requestFingerOff)
  {
    v17 = a5;
    v18 = a4;
    -[MesaCoreAnalyticsFingerTouchTimeEvent reset](self, "reset");
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v19 = (NSDate *)objc_claimAutoreleasedReturnValue();
    fingerOnDate = self->_fingerOnDate;
    self->_fingerOnDate = v19;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v18);
    v21 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    bioOperationType = self->_bioOperationType;
    self->_bioOperationType = v21;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v17);
    v23 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    -[BiometricKitCoreAnalyticsEvent setDisplayOn:](self, "setDisplayOn:", v23);
    sensorPaused = v23;
    goto LABEL_15;
  }
}

- (NSNumber)sensorPauseTime
{
  return (NSNumber *)objc_getProperty(self, a2, 424, 1);
}

- (void)setSensorPauseTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 424);
}

- (NSNumber)fingerOffTime
{
  return (NSNumber *)objc_getProperty(self, a2, 432, 1);
}

- (void)setFingerOffTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 432);
}

- (NSNumber)eventEndType
{
  return (NSNumber *)objc_getProperty(self, a2, 440, 1);
}

- (void)setEventEndType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 440);
}

- (NSNumber)sensorPaused
{
  return (NSNumber *)objc_getProperty(self, a2, 448, 1);
}

- (void)setSensorPaused:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 448);
}

- (NSNumber)bioOperationType
{
  return (NSNumber *)objc_getProperty(self, a2, 456, 1);
}

- (void)setBioOperationType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 456);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bioOperationType, 0);
  objc_storeStrong((id *)&self->_sensorPaused, 0);
  objc_storeStrong((id *)&self->_eventEndType, 0);
  objc_storeStrong((id *)&self->_fingerOffTime, 0);
  objc_storeStrong((id *)&self->_sensorPauseTime, 0);
  objc_storeStrong((id *)&self->_sensorPauseDate, 0);
  objc_storeStrong((id *)&self->_fingerOffDate, 0);
  objc_storeStrong((id *)&self->_fingerOnDate, 0);
}

@end
