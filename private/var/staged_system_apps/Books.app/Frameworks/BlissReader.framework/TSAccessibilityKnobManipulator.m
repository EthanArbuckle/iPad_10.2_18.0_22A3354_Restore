@implementation TSAccessibilityKnobManipulator

- (void)dealloc
{
  objc_super v3;

  self->_tracker = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSAccessibilityKnobManipulator;
  -[TSAccessibilityKnobManipulator dealloc](&v3, "dealloc");
}

- (void)performMoveOfKnob:(id)a3 toUnscaledPosition:(CGPoint)a4 withTracker:(id)a5 rep:(id)a6 andICC:(id)a7
{
  double y;
  double x;
  id v13;
  id v14;

  y = a4.y;
  x = a4.x;
  self->_tracker = a5;
  v13 = objc_msgSend(a7, "tmCoordinator");
  objc_msgSend(v13, "registerTrackerManipulator:", self);
  objc_msgSend(v13, "takeControlWithTrackerManipulator:", self);
  objc_msgSend(a5, "setCurrentPosition:", x, y);
  v14 = objc_msgSend(a7, "dynamicOperationController");
  objc_msgSend(v14, "beginOperation");
  objc_msgSend(v14, "startTransformingReps:", +[NSSet setWithObject:](NSSet, "setWithObject:", a6));
  objc_msgSend(v14, "handleTrackerManipulator:", self);

  self->_tracker = 0;
}

- (BOOL)allowTrackerManipulatorToTakeControl:(id)a3
{
  return 1;
}

- (id)tracker
{
  return self->_tracker;
}

- (BOOL)readyToEndOperation
{
  return 1;
}

@end
