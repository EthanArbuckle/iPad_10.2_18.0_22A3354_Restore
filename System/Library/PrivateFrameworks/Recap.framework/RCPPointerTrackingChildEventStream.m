@implementation RCPPointerTrackingChildEventStream

- (void)setFrequency:(double)a3
{
  self->_frequency = a3;
}

- (RCPPointerTrackingChildEventStream)initWithCurrentPointerLocation:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  RCPPointerTrackingChildEventStream *v5;
  uint64_t v6;
  NSMutableArray *processingEventBuffer;
  objc_super v9;

  y = a3.y;
  x = a3.x;
  v9.receiver = self;
  v9.super_class = (Class)RCPPointerTrackingChildEventStream;
  v5 = -[RCPPointerTrackingChildEventStream init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    processingEventBuffer = v5->_processingEventBuffer;
    v5->_processingEventBuffer = (NSMutableArray *)v6;

    v5->_currentTimeOffset = 0.0;
    v5->_frequency = 60.0;
    v5->_currentPointerLocation.x = x;
    v5->_currentPointerLocation.y = y;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerCurveFunction, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_senderProperties, 0);
  objc_storeStrong((id *)&self->_processingEventBuffer, 0);
}

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

- (id)finalizeEventStream
{
  void *v3;

  v3 = (void *)-[NSMutableArray copy](self->_processingEventBuffer, "copy");
  -[NSMutableArray removeAllObjects](self->_processingEventBuffer, "removeAllObjects");
  return v3;
}

- (void)advanceTime:(double)a3
{
  self->_currentTimeOffset = self->_currentTimeOffset + a3;
}

- (void)moveToPoint:(CGPoint)a3 duration:(double)a4
{
  -[RCPPointerTrackingChildEventStream _deltaToPoint:](self, "_deltaToPoint:", a3.x, a3.y);
  -[RCPPointerTrackingChildEventStream moveByDelta:duration:](self, "moveByDelta:duration:");
}

- (void)moveByDelta:(CGVector)a3 duration:(double)a4
{
  double dy;
  double dx;
  double frequency;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  double v11;
  id v12;

  dy = a3.dy;
  dx = a3.dx;
  frequency = self->_frequency;
  v8 = vcvtpd_s64_f64(frequency * a4);
  -[RCPPointerTrackingChildEventStream pointerCurveFunction](self, "pointerCurveFunction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 >= 1)
  {
    v10 = 0;
    v11 = 1.0 / frequency;
    v12 = v9;
    do
    {
      objc_msgSend(v12, "rcp_solveForDelta:withSteps:step:", v8, v10, dx, dy);
      -[RCPPointerTrackingChildEventStream movePointerByDelta:](self, "movePointerByDelta:");
      -[RCPPointerTrackingChildEventStream advanceTime:](self, "advanceTime:", v11);
      v9 = v12;
      ++v10;
    }
    while (v8 != v10);
  }

}

- (void)movePointerByDelta:(CGVector)a3
{
  double dy;
  double dx;
  const void *RelativePointerEvent;

  dy = a3.dy;
  dx = a3.dx;
  -[RCPPointerTrackingChildEventStream _currentMachTime](self, "_currentMachTime");
  RelativePointerEvent = (const void *)IOHIDEventCreateRelativePointerEvent();
  -[RCPPointerTrackingChildEventStream _addIOHIDEventToProcessingBuffer:](self, "_addIOHIDEventToProcessingBuffer:", RelativePointerEvent);
  CFRelease(RelativePointerEvent);
  -[RCPPointerTrackingChildEventStream setCurrentPointerLocation:](self, "setCurrentPointerLocation:", dx + self->_currentPointerLocation.x, dy + self->_currentPointerLocation.y);
}

- (CGVector)_deltaToPoint:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGVector result;

  y = a3.y;
  x = a3.x;
  -[RCPPointerTrackingChildEventStream currentPointerLocation](self, "currentPointerLocation");
  v7 = x - v6;
  -[RCPPointerTrackingChildEventStream currentPointerLocation](self, "currentPointerLocation");
  -[RCPPointerTrackingChildEventStream orientedDestinationPoint:](self, "orientedDestinationPoint:", v7, y - v8);
  result.dy = v10;
  result.dx = v9;
  return result;
}

- (unint64_t)_currentMachTime
{
  void *v3;
  unint64_t v4;

  -[RCPPointerTrackingChildEventStream environment](self, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "machAbsoluteTimeForTimeInterval:", self->_currentTimeOffset);

  return v4;
}

- (void)_addIOHIDEventToProcessingBuffer:(__IOHIDEvent *)a3
{
  id v4;

  +[RCPEvent eventWithHIDEvent:deliveryTimeStamp:senderProperties:preActions:](RCPEvent, "eventWithHIDEvent:deliveryTimeStamp:senderProperties:preActions:", a3, -[RCPPointerTrackingChildEventStream _currentMachTime](self, "_currentMachTime"), self->_senderProperties, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](self->_processingEventBuffer, "addObject:", v4);

}

- (int64_t)currentInterfaceOrientation
{
  void *v2;
  objc_class *v3;
  id v4;
  int64_t v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v2 = (void *)getFBSOrientationObserverClass_softClass;
  v11 = getFBSOrientationObserverClass_softClass;
  if (!getFBSOrientationObserverClass_softClass)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __getFBSOrientationObserverClass_block_invoke;
    v7[3] = &unk_1E4FC2000;
    v7[4] = &v8;
    __getFBSOrientationObserverClass_block_invoke((uint64_t)v7);
    v2 = (void *)v9[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v8, 8);
  v4 = objc_alloc_init(v3);
  v5 = objc_msgSend(v4, "activeInterfaceOrientation");
  objc_msgSend(v4, "invalidate");

  return v5;
}

- (CGPoint)orientedDestinationPoint:(CGPoint)a3
{
  double y;
  double x;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  RCPLogPlayback();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[RCPPointerTrackingChildEventStream orientedDestinationPoint:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

  v14 = -[RCPPointerTrackingChildEventStream currentInterfaceOrientation](self, "currentInterfaceOrientation");
  v15 = -y;
  v16 = -x;
  if (v14 == 2)
    v17 = -x;
  else
    v17 = x;
  if (v14 == 2)
    v18 = -y;
  else
    v18 = y;
  if (v14 == 3)
    v17 = y;
  else
    v16 = v18;
  if (v14 == 4)
    v16 = x;
  else
    v15 = v17;
  result.y = v16;
  result.x = v15;
  return result;
}

- (CGPoint)orientedNormalPoint:(CGPoint)a3
{
  double y;
  double x;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  RCPLogPlayback();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[RCPPointerTrackingChildEventStream orientedNormalPoint:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

  v14 = -[RCPPointerTrackingChildEventStream currentInterfaceOrientation](self, "currentInterfaceOrientation");
  if (v14 == 2)
    v15 = 1.0 - x;
  else
    v15 = x;
  if (v14 == 2)
    v16 = 1.0 - y;
  else
    v16 = y;
  if (v14 == 3)
  {
    v15 = y;
    v16 = 1.0 - x;
  }
  if (v14 == 4)
    v17 = 1.0 - y;
  else
    v17 = v15;
  if (v14 == 4)
    v18 = x;
  else
    v18 = v16;
  result.y = v18;
  result.x = v17;
  return result;
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

- (void)setPointerCurveFunction:(id)a3
{
  objc_storeStrong((id *)&self->_pointerCurveFunction, a3);
}

- (double)currentTimeOffset
{
  return self->_currentTimeOffset;
}

- (void)setCurrentTimeOffset:(double)a3
{
  self->_currentTimeOffset = a3;
}

- (CGPoint)currentPointerLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_currentPointerLocation.x;
  y = self->_currentPointerLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCurrentPointerLocation:(CGPoint)a3
{
  self->_currentPointerLocation = a3;
}

- (void)orientedDestinationPoint:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A5E84000, a1, a3, "Converting destination point for supplied orientation.", a5, a6, a7, a8, 0);
}

- (void)orientedNormalPoint:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A5E84000, a1, a3, "Converting normal point for supplied orientation.", a5, a6, a7, a8, 0);
}

@end
