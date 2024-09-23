@implementation MesaCoreAnalyticsUnlockEvent

- (MesaCoreAnalyticsUnlockEvent)initWithName:(id)a3
{
  MesaCoreAnalyticsUnlockEvent *v3;
  MesaCoreAnalyticsUnlockEvent *v4;
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
  v10.super_class = (Class)MesaCoreAnalyticsUnlockEvent;
  v3 = -[MesaCoreAnalyticsEvent initWithName:](&v10, sel_initWithName_, a3);
  v4 = v3;
  if (v3)
  {
    v5 = (int)*MEMORY[0x24BE0CF50];
    objc_msgSend(*(id *)((char *)&v3->super.super.super.isa + v5), "arrayByAddingObjectsFromArray:", &unk_251CB3BF8);
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
      v20 = 1732;
      _os_log_impl(&dword_24B74E000, v9, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  return v4;
}

- (MesaCoreAnalyticsUnlockEvent)init
{
  return -[MesaCoreAnalyticsUnlockEvent initWithName:](self, "initWithName:", CFSTR("com.apple.biometrickit.mesa.unlockAttempt"));
}

- (void)reset
{
  NSNumber *lastMatchResult;
  NSNumber *v4;
  NSNumber *canceledByNewCommand;
  NSNumber *unlocked;
  NSMutableSet *v7;
  NSMutableSet *usedDevices;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MesaCoreAnalyticsUnlockEvent;
  -[MesaCoreAnalyticsEvent reset](&v9, sel_reset);
  lastMatchResult = self->_lastMatchResult;
  v4 = (NSNumber *)MEMORY[0x24BDBD1C0];
  self->_lastMatchResult = (NSNumber *)MEMORY[0x24BDBD1C0];

  canceledByNewCommand = self->_canceledByNewCommand;
  self->_canceledByNewCommand = v4;

  unlocked = self->_unlocked;
  self->_unlocked = v4;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v7 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  usedDevices = self->_usedDevices;
  self->_usedDevices = v7;

  self->_matchResultValid = 0;
}

- (BOOL)postEvent
{
  NSNumber *unlockResult;
  NSNumber *v4;
  NSNumber *touchesToUnlock;
  NSNumber *eventFinished;
  _BOOL4 v7;
  objc_super v9;

  if (-[NSNumber BOOLValue](self->_canceledByNewCommand, "BOOLValue")
    && -[NSNumber BOOLValue](self->_lastMatchResult, "BOOLValue"))
  {
    unlockResult = self->_unlockResult;
    self->_unlockResult = (NSNumber *)&unk_251CB3410;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NSNumber unsignedIntValue](self->_touchesToUnlock, "unsignedIntValue") + 1);
    v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    touchesToUnlock = self->_touchesToUnlock;
    self->_touchesToUnlock = v4;

  }
  eventFinished = self->_eventFinished;
  self->_eventFinished = (NSNumber *)&unk_251CB34B8;

  if (-[NSNumber unsignedIntValue](self->_unlockResult, "unsignedIntValue"))
  {
LABEL_7:
    if (self->_unlockResult && self->_quickTapsCount && self->_touchesToUnlock && self->_failedUnlockAttempts)
    {
      if (!-[NSNumber BOOLValue](self->_canceledByNewCommand, "BOOLValue")
        || -[NSNumber unsignedIntValue](self->_touchesToUnlock, "unsignedIntValue"))
      {
        v9.receiver = self;
        v9.super_class = (Class)MesaCoreAnalyticsUnlockEvent;
        -[MesaCoreAnalyticsEvent postEvent](&v9, sel_postEvent);
        LOBYTE(v7) = 1;
        return v7;
      }
      -[MesaCoreAnalyticsUnlockEvent reset](self, "reset");
    }
    goto LABEL_16;
  }
  if (self->_matchResultValid)
  {
    v7 = -[NSNumber BOOLValue](self->_lastMatchResult, "BOOLValue");
    if (!v7)
      return v7;
    goto LABEL_7;
  }
LABEL_16:
  LOBYTE(v7) = 0;
  return v7;
}

- (void)setMatchResult:(id)a3 withDetails:(id)a4
{
  NSNumber *lastMatchResult;

  self->_matchResultValid = 1;
  if (a3)
  {
    lastMatchResult = self->_lastMatchResult;
    self->_lastMatchResult = (NSNumber *)MEMORY[0x24BDBD1C8];

  }
}

- (void)handleStatusMessage:(unsigned int)a3 withData:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MesaCoreAnalyticsUnlockEvent;
  -[MesaCoreAnalyticsEvent handleStatusMessage:withData:](&v4, sel_handleStatusMessage_withData_, *(_QWORD *)&a3, a4);
}

- (NSNumber)unlockResult
{
  return (NSNumber *)objc_getProperty(self, a2, 408, 1);
}

- (void)setUnlockResult:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 408);
}

- (NSNumber)quickTapsCount
{
  return (NSNumber *)objc_getProperty(self, a2, 416, 1);
}

- (void)setQuickTapsCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 416);
}

- (NSNumber)touchesToUnlock
{
  return (NSNumber *)objc_getProperty(self, a2, 424, 1);
}

- (void)setTouchesToUnlock:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 424);
}

- (NSNumber)failedUnlockAttempts
{
  return (NSNumber *)objc_getProperty(self, a2, 432, 1);
}

- (void)setFailedUnlockAttempts:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 432);
}

- (NSNumber)unlocked
{
  return (NSNumber *)objc_getProperty(self, a2, 440, 1);
}

- (void)setUnlocked:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 440);
}

- (NSNumber)lastMatchResult
{
  return (NSNumber *)objc_getProperty(self, a2, 448, 1);
}

- (void)setLastMatchResult:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 448);
}

- (NSNumber)canceledByNewCommand
{
  return (NSNumber *)objc_getProperty(self, a2, 456, 1);
}

- (void)setCanceledByNewCommand:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 456);
}

- (NSNumber)eventFinished
{
  return (NSNumber *)objc_getProperty(self, a2, 464, 1);
}

- (void)setEventFinished:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 464);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventFinished, 0);
  objc_storeStrong((id *)&self->_canceledByNewCommand, 0);
  objc_storeStrong((id *)&self->_lastMatchResult, 0);
  objc_storeStrong((id *)&self->_unlocked, 0);
  objc_storeStrong((id *)&self->_failedUnlockAttempts, 0);
  objc_storeStrong((id *)&self->_touchesToUnlock, 0);
  objc_storeStrong((id *)&self->_quickTapsCount, 0);
  objc_storeStrong((id *)&self->_unlockResult, 0);
  objc_storeStrong((id *)&self->_usedDevices, 0);
}

@end
