@implementation CRLCanvasRepAccessibilityRotationTrackerManipulator

- (BOOL)allowTrackerManipulatorToTakeControl:(id)a3
{
  return a3 == 0;
}

- (CRLCanvasLayoutManipulatingTracker)tracker
{
  return -[CRLCanvasRepAccessibilityRotationTrackerManipulator rotationTracker](self, "rotationTracker");
}

- (BOOL)readyToEndOperation
{
  return -[CRLCanvasRepAccessibilityRotationTrackerManipulator doneWithDynamicOperation](self, "doneWithDynamicOperation");
}

- (CRLCanvasLayoutManipulatingTracker)rotationTracker
{
  return self->_rotationTracker;
}

- (void)setRotationTracker:(id)a3
{
  objc_storeStrong((id *)&self->_rotationTracker, a3);
}

- (BOOL)doneWithDynamicOperation
{
  return self->_doneWithDynamicOperation;
}

- (void)setDoneWithDynamicOperation:(BOOL)a3
{
  self->_doneWithDynamicOperation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rotationTracker, 0);
}

@end
