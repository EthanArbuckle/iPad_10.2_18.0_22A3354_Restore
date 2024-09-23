@implementation WCM_R1Controller

- (WCM_R1Controller)init
{
  WCM_R1Controller *v2;
  WCM_R1Controller *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WCM_R1Controller;
  v2 = -[WCM_Controller init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    *((_BYTE *)&v2->super.mProcessId + 4) = 0;
    *((_BYTE *)&v2->super.mProcessId + 5) = 0;
    *(_DWORD *)&v2->_powerState = -1;
    v2->_mRCU1ChannelNum = 0;
    v2->_mRCU1OnDuration = 0;
    v2->_mRCU1CycleLength = 0;
    v2->_mRCU1NumberOfCycles = 0;
    v2->_mRCU1FrameFormat = 0;
    *((_BYTE *)&v2->super.mProcessId + 6) = 0;
    v2->_mRCU1UseCaseNum = 0;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("RCU1Controller Init"));
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("RCU1Controller Dealloc"));
  v3.receiver = self;
  v3.super_class = (Class)WCM_R1Controller;
  -[WCM_Controller dealloc](&v3, "dealloc");
}

- (void)handlePowerState:(BOOL)a3
{
  *((_BYTE *)&self->super.mProcessId + 4) = a3;
}

- (BOOL)powerState
{
  return *((_BYTE *)&self->super.mProcessId + 4);
}

- (BOOL)mRCU1PowerOn
{
  return *((_BYTE *)&self->super.mProcessId + 5);
}

- (void)setMRCU1PowerOn:(BOOL)a3
{
  *((_BYTE *)&self->super.mProcessId + 5) = a3;
}

- (int)mRCU1ChannelNum
{
  return *(_DWORD *)&self->_powerState;
}

- (void)setMRCU1ChannelNum:(int)a3
{
  *(_DWORD *)&self->_powerState = a3;
}

- (unsigned)mRCU1OnDuration
{
  return self->_mRCU1ChannelNum;
}

- (void)setMRCU1OnDuration:(unsigned int)a3
{
  self->_mRCU1ChannelNum = a3;
}

- (unsigned)mRCU1CycleLength
{
  return self->_mRCU1OnDuration;
}

- (void)setMRCU1CycleLength:(unsigned int)a3
{
  self->_mRCU1OnDuration = a3;
}

- (unsigned)mRCU1NumberOfCycles
{
  return self->_mRCU1CycleLength;
}

- (void)setMRCU1NumberOfCycles:(unsigned int)a3
{
  self->_mRCU1CycleLength = a3;
}

- (unsigned)mRCU1FrameFormat
{
  return self->_mRCU1NumberOfCycles;
}

- (void)setMRCU1FrameFormat:(unsigned int)a3
{
  self->_mRCU1NumberOfCycles = a3;
}

- (unsigned)mRCU1UseCaseNum
{
  return self->_mRCU1FrameFormat;
}

- (void)setMRCU1UseCaseNum:(unsigned int)a3
{
  self->_mRCU1FrameFormat = a3;
}

- (unsigned)mRCU1CurrentMode
{
  return self->_mRCU1UseCaseNum;
}

- (void)setMRCU1CurrentMode:(unsigned int)a3
{
  self->_mRCU1UseCaseNum = a3;
}

- (unsigned)mRCU1NbBandMask
{
  return self->_mRCU1CurrentMode;
}

- (void)setMRCU1NbBandMask:(unsigned int)a3
{
  self->_mRCU1CurrentMode = a3;
}

- (BOOL)mRCU15GHzInUse
{
  return *((_BYTE *)&self->super.mProcessId + 6);
}

- (void)setMRCU15GHzInUse:(BOOL)a3
{
  *((_BYTE *)&self->super.mProcessId + 6) = a3;
}

@end
