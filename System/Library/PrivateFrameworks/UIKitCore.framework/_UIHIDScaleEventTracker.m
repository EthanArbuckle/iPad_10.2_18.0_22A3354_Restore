@implementation _UIHIDScaleEventTracker

- (void)updateWithHIDEvent:(__IOHIDEvent *)a3
{
  uint64_t v5;
  double v6;
  unint64_t Phase;
  unint64_t v8;
  unint64_t v9;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIHIDTransformer.m"), 168, CFSTR("Attempting to update a scale tracker with no hidEvent"));

  }
  v13 = 0;
  v14 = 0;
  v12 = 0;
  _UIEventHIDGetTransformEventComponents((uint64_t)a3, &v14, &v13, &v12);
  if (v14 && (IOHIDEventGetDoubleValue(), v5 = v14, self->_scaleZ = v6, v5))
    Phase = IOHIDEventGetPhase();
  else
    Phase = 0;
  if (v13)
    v8 = IOHIDEventGetPhase();
  else
    v8 = 0;
  if (v12)
    v9 = IOHIDEventGetPhase();
  else
    v9 = 0;
  -[_UIHIDScaleEventTracker _setCompositePhase:withEvent:](self, "_setCompositePhase:withEvent:", _UIEventHIDTransformPhaseForComponentPhases(Phase, v8, v9), a3);
}

- (void)reset
{
  self->_scaleZ = 0.0;
  self->_compositePhase = 0;
}

- (void)_setCompositePhase:(unint64_t)a3 withEvent:(__IOHIDEvent *)a4
{
  unint64_t compositePhase;
  void *v9;
  BOOL v10;

  compositePhase = self->_compositePhase;
  if (compositePhase != a3)
  {
    switch(a3)
    {
      case 0uLL:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIHIDTransformer.m"), 197, CFSTR("Received event resulting in UITransformPhaseNone %@"), a4);

        goto LABEL_7;
      case 1uLL:
        if (!compositePhase)
          goto LABEL_7;
        return;
      case 2uLL:
      case 3uLL:
        if (compositePhase - 1 >= 2)
          return;
        goto LABEL_7;
      case 4uLL:
        if (compositePhase)
          v10 = compositePhase == 3;
        else
          v10 = 1;
        if (!v10)
          goto LABEL_7;
        return;
      default:
LABEL_7:
        self->_compositePhase = a3;
        break;
    }
  }
}

- (double)scaleZ
{
  return self->_scaleZ;
}

- (unint64_t)compositePhase
{
  return self->_compositePhase;
}

@end
