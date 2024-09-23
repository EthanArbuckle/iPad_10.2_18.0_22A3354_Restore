@implementation RCPSyntheticFluidSwipeEventStream

- (RCPSyntheticFluidSwipeEventStream)initWithEventType:(unsigned int)a3 flavor:(unsigned __int16)a4 motion:(unsigned __int16)a5
{
  RCPSyntheticFluidSwipeEventStream *v8;
  uint64_t v9;
  NSMutableArray *processingEventBuffer;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)RCPSyntheticFluidSwipeEventStream;
  v8 = -[RCPSyntheticFluidSwipeEventStream init](&v12, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    processingEventBuffer = v8->_processingEventBuffer;
    v8->_processingEventBuffer = (NSMutableArray *)v9;

    v8->_currentTimeOffset = 0.0;
    v8->_eventType = a3;
    v8->_flavor = a4;
    v8->_motion = a5;
    v8->_frequency = 60.0;
    v8->_hasCreatedFirstEvent = 0;
  }
  return v8;
}

- (id)finalizeEventStream
{
  void *v3;
  void *v4;
  void *v5;

  -[NSMutableArray lastObject](self->_processingEventBuffer, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "hidEvent");
    IOHIDEventSetPhase();
  }
  v5 = (void *)-[NSMutableArray copy](self->_processingEventBuffer, "copy");
  -[NSMutableArray removeAllObjects](self->_processingEventBuffer, "removeAllObjects");

  return v5;
}

- (void)advanceTime:(double)a3
{
  self->_currentTimeOffset = self->_currentTimeOffset + a3;
}

- (void)advanceProgressByDelta:(double)a3 duration:(double)a4
{
  double frequency;
  double v5;
  uint64_t v6;
  double v8;
  double v9;

  frequency = self->_frequency;
  v5 = frequency * a4;
  v6 = vcvtpd_s64_f64(v5);
  if (v6 >= 1)
  {
    v8 = 1.0 / frequency;
    v9 = a3 / (double)(uint64_t)ceil(v5);
    do
    {
      -[RCPSyntheticFluidSwipeEventStream updateProgressTo:](self, "updateProgressTo:", v9 + self->_progress);
      -[RCPSyntheticFluidSwipeEventStream advanceTime:](self, "advanceTime:", v8);
      --v6;
    }
    while (v6);
  }
}

- (void)updateProgressTo:(double)a3 duration:(double)a4
{
  -[RCPSyntheticFluidSwipeEventStream advanceProgressByDelta:duration:](self, "advanceProgressByDelta:duration:", a3 - self->_progress, a4);
}

- (void)updateProgressTo:(double)a3
{
  unsigned int eventType;
  const void *v5;

  -[RCPSyntheticFluidSwipeEventStream setProgress:](self, "setProgress:", a3);
  -[RCPSyntheticFluidSwipeEventStream _currentMachTime](self, "_currentMachTime");
  eventType = self->_eventType;
  -[RCPSyntheticFluidSwipeEventStream progress](self, "progress");
  v5 = (const void *)IOHIDEventCreate();
  if (v5 && (eventType == 27 || eventType == 23 || eventType == 16))
  {
    IOHIDEventSetIntegerValue();
    IOHIDEventSetIntegerValue();
    IOHIDEventSetIntegerValue();
    IOHIDEventSetDoubleValue();
    IOHIDEventSetDoubleValue();
    IOHIDEventSetDoubleValue();
  }
  -[RCPSyntheticFluidSwipeEventStream addToBuffer:](self, "addToBuffer:", v5);
  CFRelease(v5);
}

- (void)addToBuffer:(__IOHIDEvent *)a3
{
  unint64_t v5;
  void *v6;
  id v7;

  if (!self->_hasCreatedFirstEvent)
    self->_hasCreatedFirstEvent = 1;
  IOHIDEventSetPhase();
  v5 = -[RCPSyntheticFluidSwipeEventStream _currentMachTime](self, "_currentMachTime");
  -[RCPSyntheticFluidSwipeEventStream senderProperties](self, "senderProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[RCPEvent eventWithHIDEvent:deliveryTimeStamp:senderProperties:preActions:](RCPEvent, "eventWithHIDEvent:deliveryTimeStamp:senderProperties:preActions:", a3, v5, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray addObject:](self->_processingEventBuffer, "addObject:", v7);
}

- (unint64_t)_currentMachTime
{
  void *v3;
  unint64_t v4;

  -[RCPSyntheticFluidSwipeEventStream environment](self, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "machAbsoluteTimeForTimeInterval:", self->_currentTimeOffset);

  return v4;
}

- (RCPEventSenderProperties)senderProperties
{
  return self->_senderProperties;
}

- (void)setSenderProperties:(id)a3
{
  objc_storeStrong((id *)&self->_senderProperties, a3);
}

- (RCPEventEnvironment)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_environment, a3);
}

- (double)frequency
{
  return self->_frequency;
}

- (void)setFrequency:(double)a3
{
  self->_frequency = a3;
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (double)currentTimeOffset
{
  return self->_currentTimeOffset;
}

- (void)setCurrentTimeOffset:(double)a3
{
  self->_currentTimeOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_senderProperties, 0);
  objc_storeStrong((id *)&self->_processingEventBuffer, 0);
}

@end
