@implementation HangDataStreamStatus

- (HangDataStreamStatus)init
{
  HangDataStreamStatus *v2;
  HangDataStreamStatus *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HangDataStreamStatus;
  v2 = -[HangDataStreamStatus init](&v5, "init");
  v3 = v2;
  if (v2)
    -[HangDataStreamStatus initStatus](v2, "initStatus");
  return v3;
}

- (void)initStatus
{
  self->_countsOfMeetingEndingConditions = 0;
  self->_previousDurationSinceLastUpdateMs = 0.0;
}

- (int)countsOfMeetingEndingConditions
{
  return self->_countsOfMeetingEndingConditions;
}

- (void)setCountsOfMeetingEndingConditions:(int)a3
{
  self->_countsOfMeetingEndingConditions = a3;
}

- (double)previousDurationSinceLastUpdateMs
{
  return self->_previousDurationSinceLastUpdateMs;
}

- (void)setPreviousDurationSinceLastUpdateMs:(double)a3
{
  self->_previousDurationSinceLastUpdateMs = a3;
}

@end
