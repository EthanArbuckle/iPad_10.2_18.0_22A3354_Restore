@implementation RPTDefaultPointerAndFingerInteroppingComposer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forwardingTarget, 0);
  objc_storeStrong((id *)&self->_interactionOptions, 0);
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_forwardingTarget;
}

+ (id)composerWrapping:(id)a3 withInteractionOptions:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initFromWrapping:interactionOptions:", v7, v6);

  return v8;
}

- (void)overrideInteractionOptions:(id)a3 withEventActionsBlock:(id)a4
{
  id v7;
  id v8;
  id v9;

  v7 = a4;
  v8 = a3;
  objc_msgSend((id)objc_opt_class(), "composerWrapping:withInteractionOptions:", self->_forwardingTarget, v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  (*((void (**)(id, id))a4 + 2))(v7, v9);
}

- (id)initFromWrapping:(id)a3 interactionOptions:(id)a4
{
  id v7;
  id v8;
  int v9;

  v7 = a3;
  v8 = a4;
  objc_storeStrong((id *)&self->_forwardingTarget, a3);
  objc_storeStrong((id *)&self->_interactionOptions, a4);
  v9 = objc_msgSend(v8, "prefersPointer");
  self->__usePointer = v9;
  self->__currentlySetAbsolutePosition.x = 0.0;
  self->__currentlySetAbsolutePosition.y = 0.0;
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:", 1.0);
    -[RCPEventStreamComposer pointerSetAbsolutePosition:](self->_forwardingTarget, "pointerSetAbsolutePosition:", self->__currentlySetAbsolutePosition.x, self->__currentlySetAbsolutePosition.y);
    objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:", 1.0);
  }

  return self;
}

- (void)pointerOrFingerScrollAt:(CGPoint)a3 byDelta:(CGVector)a4 duration:(double)a5
{
  -[RPTDefaultPointerAndFingerInteroppingComposer _pointerOrFingerScrollAt:byDelta:duration:touchDownAndLift:](self, "_pointerOrFingerScrollAt:byDelta:duration:touchDownAndLift:", 1, a3.x, a3.y, a4.dx, a4.dy, a5);
}

- (void)_pointerOrFingerScrollAt:(CGPoint)a3 byDelta:(CGVector)a4 duration:(double)a5 touchDownAndLift:(BOOL)a6
{
  double dy;
  double dx;
  double v10;
  double v11;
  RCPEventStreamComposer *forwardingTarget;

  dy = a4.dy;
  dx = a4.dx;
  if (self->__usePointer)
  {
    v10 = a3.x + a4.dx * 0.5;
    v11 = a3.y + a4.dy * 0.5;
    -[RPTDefaultPointerAndFingerInteroppingComposer pointerMoveToPoint:duration:](self, "pointerMoveToPoint:duration:", a6, v10, v11, 0.01);
    -[RCPEventStreamComposer pointerPhasedScroll:duration:frequency:](self->_forwardingTarget, "pointerPhasedScroll:duration:frequency:", -[RPTInteractionOptions pointerFrequency](self->_interactionOptions, "pointerFrequency"), -dx, -dy, a5);
  }
  else
  {
    v10 = a3.x + a4.dx;
    v11 = a3.y + a4.dy;
    forwardingTarget = self->_forwardingTarget;
    if (a6)
      -[RCPEventStreamComposer dragWithStartPoint:endPoint:duration:](forwardingTarget, "dragWithStartPoint:endPoint:duration:");
    else
      -[RCPEventStreamComposer moveToPoint:duration:](forwardingTarget, "moveToPoint:duration:", a3.x + a4.dx, a3.y + a4.dy, a5);
  }
  self->__currentlySetAbsolutePosition.x = v10;
  self->__currentlySetAbsolutePosition.y = v11;
}

- (void)_pointerOrFingerFlickAt:(CGPoint)a3 byDelta:(CGVector)a4 duration:(double)a5
{
  double dy;
  double dx;
  double y;
  double x;
  double v11;
  double v12;
  NSObject *v13;
  void *v14;
  void *v15;
  double v16;
  NSObject *v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  double v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;
  CGPoint v32;
  CGPoint v33;
  CGPoint v34;
  CGPoint v35;
  CGPoint v36;
  CGPoint v37;

  dy = a4.dy;
  dx = a4.dx;
  y = a3.y;
  x = a3.x;
  v31 = *MEMORY[0x1E0C80C00];
  if (self->__usePointer)
  {
    v11 = a3.x + a4.dx * 0.5;
    v12 = a3.y + a4.dy * 0.5;
    -[RPTDefaultPointerAndFingerInteroppingComposer pointerMoveToPoint:duration:](self, "pointerMoveToPoint:duration:", v11, v12, 0.01);
    RPTLogTestRunning();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v32.x = v11;
      v32.y = v12;
      _RPTStringFromCGPoint(v32);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v33.x = dx;
      v33.y = dy;
      _RPTStringFromCGPoint(v33);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543874;
      v24 = v14;
      v25 = 2114;
      v26 = v15;
      v27 = 2048;
      v28 = a5;
      _os_log_impl(&dword_1B1773000, v13, OS_LOG_TYPE_DEFAULT, "RPT: -[RPTDefaultPointerAndFingerInteroppingComposer pointerFlickAt: %{public}@ delta: %{public}@ duration: %f", (uint8_t *)&v23, 0x20u);

    }
    -[RCPEventStreamComposer pointerPhasedFlick:duration:frequency:](self->_forwardingTarget, "pointerPhasedFlick:duration:frequency:", -[RPTInteractionOptions pointerFrequency](self->_interactionOptions, "pointerFrequency"), -dx, -dy, a5);
  }
  else
  {
    v16 = 0.5 - a5;
    v11 = a3.x + a4.dx;
    v12 = a3.y + a4.dy;
    RPTLogTestRunning();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v16 >= 0.0)
    {
      if (v18)
      {
        v36.x = x;
        v36.y = y;
        _RPTStringFromCGPoint(v36);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v37.x = x + dx;
        v37.y = y + dy;
        _RPTStringFromCGPoint(v37);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138544130;
        v24 = v21;
        v25 = 2114;
        v26 = v22;
        v27 = 2048;
        v28 = a5;
        v29 = 2048;
        v30 = *(_QWORD *)&v16;
        _os_log_impl(&dword_1B1773000, v17, OS_LOG_TYPE_DEFAULT, "RPT: -[RPTDefaultPointerAndFingerInteroppingComposer touchFlickAt: %{public}@ to: %{public}@ duration: %f excessDuration: %f", (uint8_t *)&v23, 0x2Au);

      }
    }
    else
    {
      if (v18)
      {
        v34.x = x;
        v34.y = y;
        _RPTStringFromCGPoint(v34);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v35.x = x + dx;
        v35.y = y + dy;
        _RPTStringFromCGPoint(v35);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138544130;
        v24 = v19;
        v25 = 2114;
        v26 = v20;
        v27 = 2048;
        v28 = a5;
        v29 = 2048;
        v30 = 0x3FD3333333333333;
        _os_log_impl(&dword_1B1773000, v17, OS_LOG_TYPE_DEFAULT, "RPT: -[RPTDefaultPointerAndFingerInteroppingComposer touchFlickAt: %{public}@ to: %{public}@ duration: %f excessDuration: %f", (uint8_t *)&v23, 0x2Au);

      }
      v16 = 0.3;
    }

    -[RCPEventStreamComposer sendFlickWithStartPoint:endPoint:duration:](self->_forwardingTarget, "sendFlickWithStartPoint:endPoint:duration:", x, y, x + dx, y + dy, a5);
    -[RCPEventStreamComposer advanceTime:](self->_forwardingTarget, "advanceTime:", v16);
  }
  self->__currentlySetAbsolutePosition.x = v11;
  self->__currentlySetAbsolutePosition.y = v12;
}

- (void)pointerMoveToPoint:(CGPoint)a3 duration:(double)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint *p_currentlySetAbsolutePosition;
  double v7;
  double v8;

  y = a3.y;
  x = a3.x;
  p_currentlySetAbsolutePosition = &self->__currentlySetAbsolutePosition;
  v7 = a3.x - self->__currentlySetAbsolutePosition.x;
  v8 = a3.y - self->__currentlySetAbsolutePosition.y;
  if (v7 != *MEMORY[0x1E0C9D538] || v8 != *(double *)(MEMORY[0x1E0C9D538] + 8))
  {
    -[RCPEventStreamComposer pointerMoveDelta:duration:frequency:](self->_forwardingTarget, "pointerMoveDelta:duration:frequency:", -[RPTInteractionOptions pointerFrequency](self->_interactionOptions, "pointerFrequency"), v7, v8, a4);
    p_currentlySetAbsolutePosition->x = x;
    p_currentlySetAbsolutePosition->y = y;
  }
}

- (void)pointerMoveDelta:(CGPoint)a3 duration:(double)a4 frequency:(int64_t)a5
{
  uint64_t v6;

  v6 = *(_QWORD *)&a3.x;
  -[RCPEventStreamComposer pointerMoveDelta:duration:frequency:](self->_forwardingTarget, "pointerMoveDelta:duration:frequency:", a5, a3.x, a3.y, a4);
  self->__currentlySetAbsolutePosition = (CGPoint)vaddq_f64((float64x2_t)vdupq_lane_s64(v6, 0), (float64x2_t)self->__currentlySetAbsolutePosition);
}

- (void)pointerMoveToPointIfApplicable:(CGPoint)a3
{
  if (self->__usePointer)
    -[RPTDefaultPointerAndFingerInteroppingComposer pointerMoveToPoint:duration:](self, "pointerMoveToPoint:duration:", a3.x, a3.y, 2.0);
}

- (void)pointerOrFingerTapDown:(CGPoint)a3
{
  if (self->__usePointer)
  {
    -[RPTDefaultPointerAndFingerInteroppingComposer pointerMoveToPoint:duration:](self, "pointerMoveToPoint:duration:", a3.x, a3.y, 0.8);
    -[RCPEventStreamComposer pointerBeginPressingButton:](self->_forwardingTarget, "pointerBeginPressingButton:", 1);
  }
  else
  {
    -[RCPEventStreamComposer touchDown:](self->_forwardingTarget, "touchDown:", a3.x, a3.y);
  }
}

- (void)pointerOrFingerMoveToPoint:(CGPoint)a3 duration:(double)a4
{
  if (self->__usePointer)
    -[RPTDefaultPointerAndFingerInteroppingComposer pointerMoveToPoint:duration:](self, "pointerMoveToPoint:duration:", a3.x, a3.y, a4);
  else
    -[RPTDefaultPointerAndFingerInteroppingComposer moveToPoint:duration:](self, "moveToPoint:duration:", a3.x, a3.y, a4);
}

- (void)pointerOrFingerTapUp:(CGPoint)a3
{
  if (self->__usePointer)
  {
    -[RPTDefaultPointerAndFingerInteroppingComposer pointerMoveToPoint:duration:](self, "pointerMoveToPoint:duration:", a3.x, a3.y, 1.0);
    -[RCPEventStreamComposer pointerEndPressingButton:](self->_forwardingTarget, "pointerEndPressingButton:", 1);
  }
  else
  {
    -[RCPEventStreamComposer liftUp:](self->_forwardingTarget, "liftUp:", a3.x, a3.y);
  }
}

- (void)pointerOrFingerDragWithStartPoint:(CGPoint)a3 mask:(unint64_t)a4 endPoint:(CGPoint)a5 mask:(unint64_t)a6 duration:(double)a7
{
  double y;
  double x;
  double v10;
  double v11;

  y = a5.y;
  x = a5.x;
  v10 = a3.y;
  v11 = a3.x;
  if (self->__usePointer)
  {
    -[RPTDefaultPointerAndFingerInteroppingComposer pointerOrFingerTapDown:](self, "pointerOrFingerTapDown:", a4, a6, a3.x, a3.y);
    -[RPTDefaultPointerAndFingerInteroppingComposer pointerMoveToPoint:duration:](self, "pointerMoveToPoint:duration:", x, y, a7);
    -[RPTDefaultPointerAndFingerInteroppingComposer pointerOrFingerTapDown:](self, "pointerOrFingerTapDown:", v11, v10);
  }
  else
  {
    -[RCPEventStreamComposer dragWithStartPoint:mask:endPoint:mask:duration:](self->_forwardingTarget, "dragWithStartPoint:mask:endPoint:mask:duration:", a4, a6, a3.x, a3.y, a5.x, a5.y, a7);
  }
}

- (void)pointerOrFingerTap:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  if (self->__usePointer)
  {
    -[RPTDefaultPointerAndFingerInteroppingComposer pointerOrFingerTapDown:](self, "pointerOrFingerTapDown:", a3.x, a3.y);
    -[RCPEventStreamComposer advanceTime:](self->_forwardingTarget, "advanceTime:", 0.5);
    -[RPTDefaultPointerAndFingerInteroppingComposer pointerOrFingerTapUp:](self, "pointerOrFingerTapUp:", x, y);
  }
  else
  {
    -[RCPEventStreamComposer tap:](self->_forwardingTarget, "tap:", a3.x, a3.y);
  }
}

- (void)pointerOrFingerDoubleTap:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  if (self->__usePointer)
  {
    -[RPTDefaultPointerAndFingerInteroppingComposer pointerOrFingerTapUp:](self, "pointerOrFingerTapUp:", a3.x, a3.y);
    -[RCPEventStreamComposer advanceTime:](self->_forwardingTarget, "advanceTime:", 0.5);
    -[RPTDefaultPointerAndFingerInteroppingComposer pointerOrFingerTapUp:](self, "pointerOrFingerTapUp:", x, y);
  }
  else
  {
    -[RCPEventStreamComposer doubleTap:](self->_forwardingTarget, "doubleTap:", a3.x, a3.y);
  }
}

- (BOOL)conformsToProtocol:(id)a3
{
  return -[RCPEventStreamComposer conformsToProtocol:](self->_forwardingTarget, "conformsToProtocol:", a3);
}

- (BOOL)respondsToSelector:(SEL)a3
{
  return objc_opt_respondsToSelector() & 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)-[RCPEventStreamComposer methodSignatureForSelector:](self->_forwardingTarget, "methodSignatureForSelector:", a3);
}

- (void)forwardInvocation:(id)a3
{
  objc_msgSend(a3, "invokeWithTarget:", self->_forwardingTarget);
}

- (RPTInteractionOptions)interactionOptions
{
  return self->_interactionOptions;
}

- (CGPoint)_currentlySetAbsolutePosition
{
  double x;
  double y;
  CGPoint result;

  x = self->__currentlySetAbsolutePosition.x;
  y = self->__currentlySetAbsolutePosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)set_currentlySetAbsolutePosition:(CGPoint)a3
{
  self->__currentlySetAbsolutePosition = a3;
}

- (RCPEventStreamComposer)forwardingTarget
{
  return self->_forwardingTarget;
}

- (void)setForwardingTarget:(id)a3
{
  objc_storeStrong((id *)&self->_forwardingTarget, a3);
}

- (BOOL)_usePointer
{
  return self->__usePointer;
}

@end
