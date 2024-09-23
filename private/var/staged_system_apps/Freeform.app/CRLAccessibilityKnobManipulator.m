@implementation CRLAccessibilityKnobManipulator

- (void)performMoveOfKnob:(id)a3 toUnscaledPosition:(CGPoint)a4 withTracker:(id)a5 rep:(id)a6 andICC:(id)a7
{
  double y;
  double x;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  objc_class *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  char v37;

  y = a4.y;
  x = a4.x;
  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_storeStrong(&self->_tracker, a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "crlaxTarget"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "tmCoordinator"));

  objc_msgSend(v18, "registerTrackerManipulator:", self);
  objc_msgSend(v18, "takeControlWithTrackerManipulator:", self);
  objc_opt_class(CRLCanvasKnobTracker, v19);
  v21 = sub_100221D0C(v20, v14);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  objc_msgSend(v22, "setCurrentPosition:", x, y);

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "crlaxTarget"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "dynamicOperationController"));

  objc_msgSend(v24, "beginOperation");
  v25 = objc_alloc((Class)NSMutableSet);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v15));
  v27 = objc_msgSend(v25, "initWithSet:", v26);

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "crlaxTarget"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "additionalRepsToResize"));
  objc_msgSend(v27, "unionSet:", v29);

  objc_msgSend(v24, "startTransformingReps:", v27);
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "crlaxTarget"));
  objc_msgSend(v30, "beginMovingKnob");

  v37 = 0;
  v31 = v14;
  objc_opt_class(CRLConnectionLineKnobTracker, v32);
  v34 = __CRLAccessibilityCastAsClass(v33, (uint64_t)v31, 1, &v37);
  v35 = objc_claimAutoreleasedReturnValue(v34);
  if (v37)
    abort();
  v36 = (void *)v35;

  objc_msgSend(v13, "crlaxPosition");
  objc_msgSend(v36, "moveKnobToCanvasPosition:");

  objc_msgSend(v24, "handleTrackerManipulator:", self);
}

- (BOOL)allowTrackerManipulatorToTakeControl:(id)a3
{
  return 1;
}

- (CRLCanvasLayoutManipulatingTracker)tracker
{
  return (CRLCanvasLayoutManipulatingTracker *)self->_tracker;
}

- (BOOL)readyToEndOperation
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_tracker, 0);
}

@end
