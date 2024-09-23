@implementation TSAccessibilityKeyboardResizingManipulator

- (void)dealloc
{
  objc_super v3;

  -[TSAccessibilityKeyboardResizingManipulator _setTracker:](self, "_setTracker:", 0);
  v3.receiver = self;
  v3.super_class = (Class)TSAccessibilityKeyboardResizingManipulator;
  -[TSAccessibilityKeyboardResizingManipulator dealloc](&v3, "dealloc");
}

- (void)resizeRep:(id)a3 byMovingResizingKnob:(id)a4 toUnscaledPosition:(CGPoint)a5 usingResizeKnobTracker:(id)a6 interactiveCanvasController:(id)a7
{
  double y;
  double x;
  id v13;
  id v14;

  y = a5.y;
  x = a5.x;
  -[TSAccessibilityKeyboardResizingManipulator _setTracker:](self, "_setTracker:", a6, a4);
  v13 = objc_msgSend(a7, "tmCoordinator");
  objc_msgSend(v13, "registerTrackerManipulator:", self);
  objc_msgSend(v13, "takeControlWithTrackerManipulator:", self);
  objc_msgSend(a6, "setCurrentPosition:", x, y);
  v14 = objc_msgSend(a7, "dynamicOperationController");
  objc_msgSend(v14, "beginOperation");
  objc_msgSend(v14, "startTransformingReps:", +[NSSet setWithObject:](NSSet, "setWithObject:", a3));
  objc_msgSend(v14, "handleTrackerManipulator:", self);
  -[TSAccessibilityKeyboardResizingManipulator _setTracker:](self, "_setTracker:", 0);
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

- (TSDResizeKnobTracker)_tracker
{
  return self->_tracker;
}

- (void)_setTracker:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
