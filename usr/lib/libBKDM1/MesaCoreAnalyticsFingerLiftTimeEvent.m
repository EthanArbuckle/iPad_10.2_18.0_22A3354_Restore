@implementation MesaCoreAnalyticsFingerLiftTimeEvent

- (MesaCoreAnalyticsFingerLiftTimeEvent)initWithName:(id)a3
{
  MesaCoreAnalyticsFingerLiftTimeEvent *v3;
  MesaCoreAnalyticsFingerLiftTimeEvent *v4;
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
  v10.super_class = (Class)MesaCoreAnalyticsFingerLiftTimeEvent;
  v3 = -[MesaCoreAnalyticsEvent initWithName:](&v10, sel_initWithName_, a3);
  v4 = v3;
  if (v3)
  {
    v5 = (int)*MEMORY[0x24BE0CF50];
    objc_msgSend(*(id *)((char *)&v3->super.super.super.isa + v5), "arrayByAddingObjectsFromArray:", &unk_251CB3BC8);
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
      v20 = 498;
      _os_log_impl(&dword_24B74E000, v9, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  return v4;
}

- (MesaCoreAnalyticsFingerLiftTimeEvent)init
{
  return -[MesaCoreAnalyticsFingerLiftTimeEvent initWithName:](self, "initWithName:", CFSTR("com.apple.biometrickit.mesa.fingerLiftTime"));
}

- (BOOL)postEvent
{
  NSObject *v3;
  NSDate *fingerOffDate;
  NSDate *fingerOnDate;
  NSDate *v6;
  void *v7;
  int v8;
  void *v9;
  double v10;
  NSNumber *v11;
  NSNumber *fingerLiftTime;
  objc_super v14;
  uint8_t buf[4];
  NSDate *v16;
  __int16 v17;
  NSDate *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (__osLog)
    v3 = __osLog;
  else
    v3 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    fingerOffDate = self->_fingerOffDate;
    fingerOnDate = self->_fingerOnDate;
    *(_DWORD *)buf = 138412546;
    v16 = fingerOffDate;
    v17 = 2112;
    v18 = fingerOnDate;
    _os_log_impl(&dword_24B74E000, v3, OS_LOG_TYPE_DEBUG, "MesaCoreAnalyticsFingerLiftTimeEvent postEvent _fingerOffDate: %@ _fingerOnDate: %@ \n", buf, 0x16u);
  }
  v6 = self->_fingerOnDate;
  if (v6
    && self->_fingerOffDate
    && (-[NSDate laterDate:](v6, "laterDate:"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isEqualToDate:", self->_fingerOnDate),
        v7,
        v8))
  {
    v9 = (void *)MEMORY[0x24BDD16E0];
    -[NSDate timeIntervalSinceDate:](self->_fingerOnDate, "timeIntervalSinceDate:", self->_fingerOffDate);
    objc_msgSend(v9, "numberWithDouble:", v10 * 1000.0);
    v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    fingerLiftTime = self->_fingerLiftTime;
    self->_fingerLiftTime = v11;

    v14.receiver = self;
    v14.super_class = (Class)MesaCoreAnalyticsFingerLiftTimeEvent;
    -[MesaCoreAnalyticsEvent postEvent](&v14, sel_postEvent);
    return 1;
  }
  else
  {
    -[MesaCoreAnalyticsFingerLiftTimeEvent reset](self, "reset");
    return 0;
  }
}

- (void)reset
{
  NSDate *fingerOnDate;
  NSDate *fingerOffDate;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MesaCoreAnalyticsFingerLiftTimeEvent;
  -[MesaCoreAnalyticsEvent reset](&v5, sel_reset);
  fingerOnDate = self->_fingerOnDate;
  self->_fingerOnDate = 0;

  fingerOffDate = self->_fingerOffDate;
  self->_fingerOffDate = 0;

}

- (void)handleStatusMessage:(unsigned int)a3 forOperation:(unsigned __int8)a4
{
  NSDate *v5;
  NSDate *fingerOnDate;
  NSDate *v7;
  NSDate *fingerOffDate;

  if (a3 == 64)
  {
    if (a4 == 2)
    {
      -[MesaCoreAnalyticsFingerLiftTimeEvent reset](self, "reset");
      objc_msgSend(MEMORY[0x24BDBCE60], "now");
      v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
      fingerOffDate = self->_fingerOffDate;
      self->_fingerOffDate = v7;

    }
  }
  else if (a3 == 63)
  {
    if (a4 == 2)
    {
      if (self->_fingerOffDate)
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "now");
        v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
        fingerOnDate = self->_fingerOnDate;
        self->_fingerOnDate = v5;

        -[MesaCoreAnalyticsFingerLiftTimeEvent postEvent](self, "postEvent");
      }
    }
  }
  else if (a4 != 2)
  {
    -[MesaCoreAnalyticsFingerLiftTimeEvent reset](self, "reset");
  }
}

- (NSNumber)fingerLiftTime
{
  return (NSNumber *)objc_getProperty(self, a2, 408, 1);
}

- (void)setFingerLiftTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 408);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fingerLiftTime, 0);
  objc_storeStrong((id *)&self->_fingerOffDate, 0);
  objc_storeStrong((id *)&self->_fingerOnDate, 0);
}

@end
