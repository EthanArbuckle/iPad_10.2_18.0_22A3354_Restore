@implementation RCPScrollEventStream

- (CAMediaTimingFunction)pointerCurveFunction
{
  double v2;
  double v3;
  double v4;
  double v5;
  CAMediaTimingFunction *pointerCurveFunction;
  CAMediaTimingFunction *v8;
  CAMediaTimingFunction *v9;

  pointerCurveFunction = self->_pointerCurveFunction;
  if (!pointerCurveFunction)
  {
    RCPMediaTimingFunctionForInputType(0, 1, v2, v3, v4, v5);
    v8 = (CAMediaTimingFunction *)objc_claimAutoreleasedReturnValue();
    v9 = self->_pointerCurveFunction;
    self->_pointerCurveFunction = v8;

    pointerCurveFunction = self->_pointerCurveFunction;
  }
  return pointerCurveFunction;
}

- (RCPScrollEventStream)init
{
  RCPScrollEventStream *v2;
  NSMutableArray *v3;
  NSMutableArray *events;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RCPScrollEventStream;
  v2 = -[RCPScrollEventStream init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    events = v2->_events;
    v2->_events = v3;

    v2->_currentTimeOffset = 0.0;
    *(_OWORD *)&v2->_frequency = xmmword_1A5EA8A40;
    v2->_scrollOptions = 69;
  }
  return v2;
}

- (id)finalizeEventStream
{
  void *v3;
  void *v4;

  -[RCPScrollEventStream _eventWithDelta:phase:](self, "_eventWithDelta:phase:", 4, 0.0, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray insertObject:atIndex:](self->_events, "insertObject:atIndex:", self->_cachedFirstEvent, 0);
  -[NSMutableArray addObject:](self->_events, "addObject:", v3);
  v4 = (void *)-[NSMutableArray copy](self->_events, "copy");
  -[NSMutableArray removeAllObjects](self->_events, "removeAllObjects");

  return v4;
}

- (void)advanceTime:(double)a3
{
  self->_currentTimeOffset = self->_currentTimeOffset + a3;
}

- (void)advanceByDelta:(CGVector)a3 duration:(double)a4
{
  double dy;
  double dx;
  double frequency;
  double v8;
  uint64_t v9;
  RCPEvent *v10;
  RCPEvent *cachedFirstEvent;
  void *v12;
  uint64_t v13;
  id v14;

  dy = a3.dy;
  dx = a3.dx;
  frequency = self->_frequency;
  v8 = 1.0 / frequency;
  v9 = vcvtpd_s64_f64(frequency * a4);
  -[RCPScrollEventStream _eventWithDelta:phase:](self, "_eventWithDelta:phase:", 1, 0.0, 0.0);
  v10 = (RCPEvent *)objc_claimAutoreleasedReturnValue();
  cachedFirstEvent = self->_cachedFirstEvent;
  self->_cachedFirstEvent = v10;

  -[RCPScrollEventStream advanceTime:](self, "advanceTime:", v8);
  -[RCPScrollEventStream pointerCurveFunction](self, "pointerCurveFunction");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 >= 1)
  {
    v13 = 0;
    v14 = v12;
    do
    {
      objc_msgSend(v14, "rcp_solveForDelta:withSteps:step:", v9, v13, dx, dy);
      -[RCPScrollEventStream _updateAmplitudeBy:](self, "_updateAmplitudeBy:");
      -[RCPScrollEventStream advanceTime:](self, "advanceTime:", v8);
      v12 = v14;
      ++v13;
    }
    while (v9 != v13);
  }

}

- (void)_updateAmplitudeBy:(CGVector)a3
{
  id v4;

  -[RCPScrollEventStream _eventWithDelta:phase:](self, "_eventWithDelta:phase:", 2, a3.dx, a3.dy);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](self->_events, "addObject:", v4);

}

- (id)_eventWithDelta:(CGVector)a3 phase:(unsigned __int16)a4
{
  unint64_t v5;
  const void *ScrollEvent;
  uint64_t RelativePointerEvent;

  v5 = -[RCPEventEnvironment machAbsoluteTimeForTimeInterval:](self->_environment, "machAbsoluteTimeForTimeInterval:", self->_currentTimeOffset);
  ScrollEvent = (const void *)IOHIDEventCreateScrollEvent();
  IOHIDEventSetPhase();
  RelativePointerEvent = IOHIDEventCreateRelativePointerEvent();
  IOHIDEventAppendEvent();
  CFRelease(ScrollEvent);
  return +[RCPEvent eventWithHIDEvent:deliveryTimeStamp:senderProperties:preActions:](RCPEvent, "eventWithHIDEvent:deliveryTimeStamp:senderProperties:preActions:", RelativePointerEvent, v5, self->_senderProperties, 0);
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

- (double)currentTimeOffset
{
  return self->_currentTimeOffset;
}

- (void)setCurrentTimeOffset:(double)a3
{
  self->_currentTimeOffset = a3;
}

- (void)setPointerCurveFunction:(id)a3
{
  objc_storeStrong((id *)&self->_pointerCurveFunction, a3);
}

- (double)frequency
{
  return self->_frequency;
}

- (void)setFrequency:(double)a3
{
  self->_frequency = a3;
}

- (double)deltaToPixelsScaleFactor
{
  return self->_deltaToPixelsScaleFactor;
}

- (void)setDeltaToPixelsScaleFactor:(double)a3
{
  self->_deltaToPixelsScaleFactor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerCurveFunction, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_senderProperties, 0);
  objc_storeStrong((id *)&self->_cachedFirstEvent, 0);
  objc_storeStrong((id *)&self->_events, 0);
}

@end
