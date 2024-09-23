@implementation _UIKeyboardBasedTextSelectionGestureController

- (Class)textInteractionClass
{
  return (Class)objc_opt_class();
}

+ (id)sharedInstance
{
  if (qword_1ECD7C648 != -1)
    dispatch_once(&qword_1ECD7C648, &__block_literal_global_453);
  return (id)qword_1ECD7C650;
}

- (void)_cleanupDeadGesturesIfNecessary
{
  objc_super v3;

  -[_UIKeyboardBasedTextSelectionGestureController setDelayForceMagnify:](self, "setDelayForceMagnify:", 0);
  v3.receiver = self;
  v3.super_class = (Class)_UIKeyboardBasedTextSelectionGestureController;
  -[_UIKeyboardTextSelectionGestureController _cleanupDeadGesturesIfNecessary](&v3, sel__cleanupDeadGesturesIfNecessary);
}

- (void)setDelayForceMagnify:(BOOL)a3
{
  self->_delayForceMagnify = a3;
}

- (double)oneFingerForcePressMinimumDuration
{
  return 0.5;
}

- (BOOL)oneFingerForcePressShouldFailWithoutForce
{
  return 0;
}

- (BOOL)oneFingerForcePressShouldCancelTouchesInView
{
  return 1;
}

- (BOOL)allowOneFingerDeepPress
{
  void *v2;
  void *v3;
  char v4;

  +[_UITextSelectionSettings sharedInstance](_UITextSelectionSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enableDeepPress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)delayForceMagnify
{
  return self->_delayForceMagnify;
}

- (BOOL)didLongForcePress
{
  return self->_didLongForcePress;
}

- (void)setDidLongForcePress:(BOOL)a3
{
  self->_didLongForcePress = a3;
}

@end
