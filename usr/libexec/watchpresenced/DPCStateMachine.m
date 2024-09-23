@implementation DPCStateMachine

- (DPCStateMachine)init
{
  DPCStateMachine *v2;
  DPCStateMachine *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DPCStateMachine;
  v2 = -[DPCStateMachine init](&v5, "init");
  v3 = v2;
  if (v2)
    -[DPCStateMachine reset](v2, "reset");
  return v3;
}

- (void)reset
{
  -[DPCStateMachine setIsRunning:](self, "setIsRunning:", 0);
  -[DPCStateMachine setIsMonitoringAbsence:](self, "setIsMonitoringAbsence:", 1);
  -[DPCStateMachine setIsSwitchingWatch:](self, "setIsSwitchingWatch:", 0);
  -[DPCStateMachine setIsInRSSIMode:](self, "setIsInRSSIMode:", 0);
  -[DPCStateMachine setIsInDiscoveryMode:](self, "setIsInDiscoveryMode:", 0);
  -[DPCStateMachine setIsInRSSIStreamingMode:](self, "setIsInRSSIStreamingMode:", 0);
  -[DPCStateMachine setIsRunningRSSIStatDetecion:](self, "setIsRunningRSSIStatDetecion:", 0);
  -[DPCStateMachine setIsWatchConnected:](self, "setIsWatchConnected:", 0);
  -[DPCStateMachine setIsBluetoothConnected:](self, "setIsBluetoothConnected:", 0);
  -[DPCStateMachine setCurrentWatchWristState:](self, "setCurrentWatchWristState:", 0);
  -[DPCStateMachine setLastAbsenceEventTimestamp:](self, "setLastAbsenceEventTimestamp:", 0.0);
  -[DPCStateMachine setLastPresenceEventTimestamp:](self, "setLastPresenceEventTimestamp:", 0.0);
  -[DPCStateMachine setD1ThresholdMargin:](self, "setD1ThresholdMargin:", 0);
  -[DPCStateMachine setD2ThresholdMargin:](self, "setD2ThresholdMargin:", 0);
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (BOOL)isMonitoringAbsence
{
  return self->_isMonitoringAbsence;
}

- (void)setIsMonitoringAbsence:(BOOL)a3
{
  self->_isMonitoringAbsence = a3;
}

- (BOOL)isSwitchingWatch
{
  return self->_isSwitchingWatch;
}

- (void)setIsSwitchingWatch:(BOOL)a3
{
  self->_isSwitchingWatch = a3;
}

- (BOOL)isInRSSIMode
{
  return self->_isInRSSIMode;
}

- (void)setIsInRSSIMode:(BOOL)a3
{
  self->_isInRSSIMode = a3;
}

- (BOOL)isInRSSIStreamingMode
{
  return self->_isInRSSIStreamingMode;
}

- (void)setIsInRSSIStreamingMode:(BOOL)a3
{
  self->_isInRSSIStreamingMode = a3;
}

- (BOOL)isRunningRSSIStatDetecion
{
  return self->_isRunningRSSIStatDetecion;
}

- (void)setIsRunningRSSIStatDetecion:(BOOL)a3
{
  self->_isRunningRSSIStatDetecion = a3;
}

- (BOOL)isWatchConnected
{
  return self->_isWatchConnected;
}

- (void)setIsWatchConnected:(BOOL)a3
{
  self->_isWatchConnected = a3;
}

- (BOOL)isBluetoothConnected
{
  return self->_isBluetoothConnected;
}

- (void)setIsBluetoothConnected:(BOOL)a3
{
  self->_isBluetoothConnected = a3;
}

- (BOOL)isInDiscoveryMode
{
  return self->_isInDiscoveryMode;
}

- (void)setIsInDiscoveryMode:(BOOL)a3
{
  self->_isInDiscoveryMode = a3;
}

- (int64_t)currentWatchWristState
{
  return self->_currentWatchWristState;
}

- (void)setCurrentWatchWristState:(int64_t)a3
{
  self->_currentWatchWristState = a3;
}

- (double)lastAbsenceEventTimestamp
{
  return self->_lastAbsenceEventTimestamp;
}

- (void)setLastAbsenceEventTimestamp:(double)a3
{
  self->_lastAbsenceEventTimestamp = a3;
}

- (double)lastPresenceEventTimestamp
{
  return self->_lastPresenceEventTimestamp;
}

- (void)setLastPresenceEventTimestamp:(double)a3
{
  self->_lastPresenceEventTimestamp = a3;
}

- (int)D2ThresholdMargin
{
  return self->_D2ThresholdMargin;
}

- (void)setD2ThresholdMargin:(int)a3
{
  self->_D2ThresholdMargin = a3;
}

- (int)D1ThresholdMargin
{
  return self->_D1ThresholdMargin;
}

- (void)setD1ThresholdMargin:(int)a3
{
  self->_D1ThresholdMargin = a3;
}

@end
