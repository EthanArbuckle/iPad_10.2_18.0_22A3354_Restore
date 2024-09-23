@implementation SBFMouseButtonDownGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBFMouseButtonDownGestureRecognizer;
  v6 = a4;
  -[SBFMouseButtonDownGestureRecognizer touchesBegan:withEvent:](&v8, sel_touchesBegan_withEvent_, a3, v6);
  v7 = objc_msgSend(v6, "_hidEvent", v8.receiver, v8.super_class);

  if (-[SBFMouseButtonDownGestureRecognizer _isMouseButtonClickEvent:](self, "_isMouseButtonClickEvent:", v7))
    -[SBFMouseButtonDownGestureRecognizer _succesfullyRecognizeFromEvent:](self, "_succesfullyRecognizeFromEvent:", v7);
  else
    -[SBFMouseButtonDownGestureRecognizer setState:](self, "setState:", 5);
}

- (void)_succesfullyRecognizeFromEvent:(__IOHIDEvent *)a3
{
  void *v4;

  +[SBWakeLogger sharedInstance](SBWakeLogger, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wakeMayBegin:withTimestamp:", 6, IOHIDEventGetTimeStamp());

  if (!-[SBFMouseButtonDownGestureRecognizer state](self, "state"))
    -[SBFMouseButtonDownGestureRecognizer setState:](self, "setState:", 3);
}

- (BOOL)_isMouseButtonClickEvent:(__IOHIDEvent *)a3
{
  return BKSHIDEventMatchingPredicate() != 0;
}

BOOL __64__SBFMouseButtonDownGestureRecognizer__isMouseButtonClickEvent___block_invoke()
{
  return IOHIDEventGetType() == 2;
}

@end
