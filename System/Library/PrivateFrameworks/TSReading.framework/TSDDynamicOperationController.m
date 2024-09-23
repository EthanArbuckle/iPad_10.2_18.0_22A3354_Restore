@implementation TSDDynamicOperationController

- (TSDDynamicOperationController)initWithInteractiveCanvasController:(id)a3
{
  TSDDynamicOperationController *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSDDynamicOperationController;
  result = -[TSDDynamicOperationController init](&v5, sel_init);
  if (result)
  {
    result->mICC = (TSDInteractiveCanvasController *)a3;
    result->mResetGuides = 1;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDDynamicOperationController;
  -[TSDDynamicOperationController dealloc](&v3, sel_dealloc);
}

- (void)beginPossibleDynamicOperation
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  if (-[TSDInteractiveCanvasController isInDynamicOperation](self->mICC, "isInDynamicOperation"))
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDDynamicOperationController beginPossibleDynamicOperation]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDynamicOperationController.m"), 75, CFSTR("begin possible op with ICC in dynamic operation"));
  }
  if (self->mPossibleDynamicOperation || self->mReps || self->mAllTransformedReps)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDDynamicOperationController beginPossibleDynamicOperation]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDynamicOperationController.m"), 76, CFSTR("beginning possible operation without ending previous operation"));
  }
  self->mReps = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
  self->mPossibleDynamicOperation = 1;
  *(_WORD *)&self->mResetGuides = 257;
}

- (void)beginOperation
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  if (-[TSDInteractiveCanvasController isInDynamicOperation](self->mICC, "isInDynamicOperation"))
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDDynamicOperationController beginOperation]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDynamicOperationController.m"), 93, CFSTR("begin op with ICC in dynamic operation"));
  }
  if (!self->mPossibleDynamicOperation && (self->mReps || self->mAllTransformedReps))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDDynamicOperationController beginOperation]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDynamicOperationController.m"), 94, CFSTR("beginning operation without ending previous operation"));
  }
  if (!-[TSDTrackerManipulatorCoordinator controllingTM](-[TSDInteractiveCanvasController tmCoordinator](self->mICC, "tmCoordinator"), "controllingTM"))
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDDynamicOperationController beginOperation]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDynamicOperationController.m"), 95, CFSTR("No controlling TM when beginning operation"));
  }
  v9 = (void *)-[TSDTrackerManipulator tracker](-[TSDTrackerManipulatorCoordinator controllingTM](-[TSDInteractiveCanvasController tmCoordinator](self->mICC, "tmCoordinator"), "controllingTM"), "tracker");
  self->mSupportsAlignmentGuides = objc_msgSend(v9, "supportsAlignmentGuides");
  self->mOperationIsDynamic = objc_msgSend(v9, "operationShouldBeDynamic");
  if (self->mPossibleDynamicOperation)
  {
    self->mPossibleDynamicOperation = 0;
    self->mAllTransformedReps = (NSMutableSet *)(id)objc_msgSend(MEMORY[0x24BDBCEF0], "setWithSet:", self->mReps);
    if (!self->mOperationIsDynamic)
      goto LABEL_15;
    -[TSDDynamicOperationController p_beginDynamicOperationForReps:](self, "p_beginDynamicOperationForReps:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", self->mReps));
  }
  else
  {
    self->mReps = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    self->mAllTransformedReps = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    self->mResetGuides = 1;
  }
  if (self->mOperationIsDynamic)
    -[TSDInteractiveCanvasController beginDynamicOperation](self->mICC, "beginDynamicOperation");
LABEL_15:
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "addObserver:selector:name:object:", self, sel_p_controllingTMDidResetInOperation_, CFSTR("TSDControllingGRDidResetNotification"), 0);
}

- (void)p_beginDynamicOperationForReps:(id)a3
{
  void *v4;

  v4 = (void *)-[TSDTrackerManipulator tracker](-[TSDTrackerManipulatorCoordinator controllingTM](-[TSDInteractiveCanvasController tmCoordinator](self->mICC, "tmCoordinator"), "controllingTM"), "tracker");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "willBeginDynamicOperationForReps:", a3);
}

- (void)endOperation
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[TSDTrackerManipulatorCoordinator operationWillEnd](-[TSDInteractiveCanvasController tmCoordinator](self->mICC, "tmCoordinator"), "operationWillEnd");
  if (-[TSDDynamicOperationController isInOperation](self, "isInOperation"))
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("TSDControllingGRDidResetNotification"), 0);
    v3 = (void *)-[TSDTrackerManipulator tracker](-[TSDTrackerManipulatorCoordinator controllingTM](-[TSDInteractiveCanvasController tmCoordinator](self->mICC, "tmCoordinator"), "controllingTM"), "tracker");
    if (v3)
      objc_msgSend(v3, "commitChangesForReps:", self->mAllTransformedReps);
  }
  -[TSDDynamicOperationController p_cleanupOperation](self, "p_cleanupOperation");
  if (-[TSDInteractiveCanvasController isInDynamicOperation](self->mICC, "isInDynamicOperation"))
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDDynamicOperationController endOperation]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDynamicOperationController.m"), 210, CFSTR("ending op with ICC still in dynamic operation"));
  }
}

- (BOOL)isInOperation
{
  return self->mReps && self->mAllTransformedReps && !self->mPossibleDynamicOperation;
}

- (BOOL)isInPossibleDynamicOperation
{
  return self->mPossibleDynamicOperation;
}

- (BOOL)isOperationDynamic
{
  return self->mOperationIsDynamic;
}

- (void)cancelOperation
{
  void *v3;
  uint64_t v4;

  if (!-[TSDDynamicOperationController isInOperation](self, "isInOperation"))
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDDynamicOperationController cancelOperation]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDynamicOperationController.m"), 235, CFSTR("cancelling when not in operation"));
  }
  -[TSDDynamicOperationController p_cleanupOperation](self, "p_cleanupOperation");
}

- (void)p_cleanupOperation
{
  if (self->mOperationIsDynamic)
    -[TSDInteractiveCanvasController endDynamicOperation](self->mICC, "endDynamicOperation");
  -[TSDDynamicOperationController p_resetGuidesForCleanup:](self, "p_resetGuidesForCleanup:", 1);
  -[TSDTrackerManipulatorCoordinator operationDidEnd](-[TSDInteractiveCanvasController tmCoordinator](self->mICC, "tmCoordinator"), "operationDidEnd");
  self->mPossibleDynamicOperation = 0;

  self->mReps = 0;
  self->mAllTransformedReps = 0;
  self->mOperationIsDynamic = 0;
}

- (void)startTransformingReps:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (!-[TSDDynamicOperationController isInOperation](self, "isInOperation") && !self->mPossibleDynamicOperation)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDDynamicOperationController startTransformingReps:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDynamicOperationController.m"), 270, CFSTR("cannot begin transforming reps until we are in a transform"));
  }
  v7 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(a3);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((-[NSMutableSet containsObject:](self->mReps, "containsObject:", v12) & 1) == 0)
          -[NSMutableSet addObject:](self->mReps, "addObject:", v12);
        if (!self->mPossibleDynamicOperation
          && (-[NSMutableSet containsObject:](self->mAllTransformedReps, "containsObject:", v12) & 1) == 0)
        {
          if (self->mOperationIsDynamic)
            objc_msgSend(v7, "addObject:", v12);
          -[NSMutableSet addObject:](self->mAllTransformedReps, "addObject:", v12);
        }
      }
      v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }
  if (objc_msgSend(v7, "count"))
    -[TSDDynamicOperationController p_beginDynamicOperationForReps:](self, "p_beginDynamicOperationForReps:", v7);
  -[TSDDynamicOperationController p_resetGuidesForCleanup:](self, "p_resetGuidesForCleanup:", 0);
  v13 = (void *)-[TSDTrackerManipulator tracker](-[TSDTrackerManipulatorCoordinator controllingTM](-[TSDInteractiveCanvasController tmCoordinator](self->mICC, "tmCoordinator"), "controllingTM"), "tracker");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v13, "didChangeCurrentlyTransformingReps");
}

- (void)stopTransformingReps:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a3, "count"))
  {
    -[NSMutableSet minusSet:](self->mReps, "minusSet:", a3);
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(a3);
          objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "layout"), "pauseDynamicTransformation");
        }
        while (v6 != v8);
        v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }
    -[TSDDynamicOperationController p_resetGuidesForCleanup:](self, "p_resetGuidesForCleanup:", 0);
    v9 = (void *)-[TSDTrackerManipulator tracker](-[TSDTrackerManipulatorCoordinator controllingTM](-[TSDInteractiveCanvasController tmCoordinator](self->mICC, "tmCoordinator"), "controllingTM"), "tracker");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v9, "didChangeCurrentlyTransformingReps");
  }
}

- (void)handleGestureRecognizer:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  if (-[TSDTrackerManipulatorCoordinator controllingTM](-[TSDInteractiveCanvasController tmCoordinator](self->mICC, "tmCoordinator"), "controllingTM") == a3)
  {
    if (!-[TSDDynamicOperationController isInOperation](self, "isInOperation"))
    {
      v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDDynamicOperationController handleGestureRecognizer:]");
      v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDynamicOperationController.m");
      v8 = (objc_class *)objc_opt_class();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, v7, 332, CFSTR("tracker is handling GR %@ when not in a transform"), NSStringFromClass(v8));
    }
    if (self->mOperationIsDynamic != objc_msgSend((id)objc_msgSend(a3, "tracker"), "operationShouldBeDynamic"))
    {
      v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDDynamicOperationController handleGestureRecognizer:]");
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDynamicOperationController.m"), 338, CFSTR("Controlling TM has different dynamic operation expectations than current operation (%@)"), objc_msgSend(a3, "tracker"));
    }
    if (self->mResetGuides)
      -[TSDDynamicOperationController p_resetGuidesForCleanup:](self, "p_resetGuidesForCleanup:", 0);
    v11 = objc_msgSend(a3, "state");
    if ((unint64_t)(v11 - 1) >= 2)
    {
      if (v11 == 3)
      {
        objc_msgSend((id)objc_msgSend(a3, "tracker"), "changeDynamicLayoutsForReps:", self->mReps);
        -[TSDDynamicOperationController endOperation](self, "endOperation");
      }
    }
    else
    {
      objc_msgSend((id)objc_msgSend(a3, "tracker"), "changeDynamicLayoutsForReps:", self->mReps);
    }
  }
}

- (void)p_controllingTMDidResetInOperation:(id)a3
{
  TSDTrackerManipulator *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v4 = (TSDTrackerManipulator *)objc_msgSend(a3, "object");
  if (!-[TSDDynamicOperationController isInOperation](self, "isInOperation"))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDDynamicOperationController p_controllingTMDidResetInOperation:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDynamicOperationController.m"), 372, CFSTR("controlling GR reset in an operation, but we aren't in an operation! %@"), v4);
  }
  if (v4 != -[TSDTrackerManipulatorCoordinator controllingTM](-[TSDInteractiveCanvasController tmCoordinator](self->mICC, "tmCoordinator"), "controllingTM"))
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDDynamicOperationController p_controllingTMDidResetInOperation:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDynamicOperationController.m"), 373, CFSTR("non-controlling GR is being reset with a notification %@ (%@ in control)"), v4, -[TSDTrackerManipulatorCoordinator controllingTM](-[TSDInteractiveCanvasController tmCoordinator](self->mICC, "tmCoordinator"), "controllingTM"));
  }
  if (v4 == -[TSDTrackerManipulatorCoordinator controllingTM](-[TSDInteractiveCanvasController tmCoordinator](self->mICC, "tmCoordinator"), "controllingTM"))-[TSDDynamicOperationController endOperation](self, "endOperation");
}

- (void)handleTrackerManipulator:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  objc_class *v12;

  if (-[TSDTrackerManipulatorCoordinator controllingTM](-[TSDInteractiveCanvasController tmCoordinator](self->mICC, "tmCoordinator"), "controllingTM") == a3)
  {
    if (!-[TSDDynamicOperationController isInOperation](self, "isInOperation"))
    {
      v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDDynamicOperationController handleTrackerManipulator:]");
      v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDynamicOperationController.m");
      v8 = (objc_class *)objc_opt_class();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, v7, 383, CFSTR("tracker is handling TM %@ when not in a transform"), NSStringFromClass(v8));
    }
    if (self->mOperationIsDynamic != objc_msgSend((id)objc_msgSend(a3, "tracker"), "operationShouldBeDynamic"))
    {
      v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDDynamicOperationController handleTrackerManipulator:]");
      v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDynamicOperationController.m");
      v12 = (objc_class *)objc_opt_class();
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, v11, 389, CFSTR("Controlling TM %@ has different dynamic operation expectations than current operation"), NSStringFromClass(v12));
    }
    if (self->mResetGuides)
      -[TSDDynamicOperationController p_resetGuidesForCleanup:](self, "p_resetGuidesForCleanup:", 0);
    objc_msgSend((id)objc_msgSend(a3, "tracker"), "changeDynamicLayoutsForReps:", self->mReps);
    if (objc_msgSend(a3, "readyToEndOperation"))
      -[TSDDynamicOperationController endOperation](self, "endOperation");
  }
}

- (void)invalidateGuides
{
  self->mResetGuides = 1;
}

- (NSSet)currentlyTransformingReps
{
  return &self->mReps->super;
}

- (NSSet)allTransformedReps
{
  return &self->mAllTransformedReps->super;
}

@end
