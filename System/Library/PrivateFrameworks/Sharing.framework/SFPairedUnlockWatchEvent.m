@implementation SFPairedUnlockWatchEvent

+ (NSString)eventName
{
  return (NSString *)CFSTR("com.apple.Sharing.PairedUnlock.WatchAttempt");
}

- (NSDictionary)eventPayload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[6];

  v14[5] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("motionCheckDurationMs");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SFPairedUnlockWatchEvent motionCheckDurationMs](self, "motionCheckDurationMs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = CFSTR("onWristConfidence");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SFPairedUnlockWatchEvent onWristConfidence](self, "onWristConfidence"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v4;
  v13[2] = CFSTR("timeSinceLastWristRaiseSec");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[SFPairedUnlockWatchEvent timeSinceLastWristRaiseSec](self, "timeSinceLastWristRaiseSec");
  objc_msgSend(v5, "numberWithFloat:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v6;
  v13[3] = CFSTR("timeSinceLastOnWristSec");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[SFPairedUnlockWatchEvent timeSinceLastOnWristSec](self, "timeSinceLastOnWristSec");
  objc_msgSend(v7, "numberWithFloat:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v8;
  v13[4] = CFSTR("timeSinceBootMin");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[SFPairedUnlockWatchEvent timeSinceBootMin](self, "timeSinceBootMin");
  objc_msgSend(v9, "numberWithFloat:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v11;
}

- (void)submitEvent
{
  void *v3;
  id v4;

  +[SFPairedUnlockWatchEvent eventName](SFPairedUnlockWatchEvent, "eventName");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SFPairedUnlockWatchEvent eventPayload](self, "eventPayload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SFMetricsLog(v4, v3);

}

- (unsigned)motionCheckDurationMs
{
  return self->_motionCheckDurationMs;
}

- (void)setMotionCheckDurationMs:(unsigned int)a3
{
  self->_motionCheckDurationMs = a3;
}

- (int64_t)onWristConfidence
{
  return self->_onWristConfidence;
}

- (void)setOnWristConfidence:(int64_t)a3
{
  self->_onWristConfidence = a3;
}

- (float)timeSinceLastWristRaiseSec
{
  return self->_timeSinceLastWristRaiseSec;
}

- (void)setTimeSinceLastWristRaiseSec:(float)a3
{
  self->_timeSinceLastWristRaiseSec = a3;
}

- (float)timeSinceLastOnWristSec
{
  return self->_timeSinceLastOnWristSec;
}

- (void)setTimeSinceLastOnWristSec:(float)a3
{
  self->_timeSinceLastOnWristSec = a3;
}

- (float)timeSinceBootMin
{
  return self->_timeSinceBootMin;
}

- (void)setTimeSinceBootMin:(float)a3
{
  self->_timeSinceBootMin = a3;
}

@end
