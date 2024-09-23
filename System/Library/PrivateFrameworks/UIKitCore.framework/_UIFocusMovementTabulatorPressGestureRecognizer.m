@implementation _UIFocusMovementTabulatorPressGestureRecognizer

- (void)configureDefaults
{
  -[UIGestureRecognizer setAllowedPressTypes:](self, "setAllowedPressTypes:", &unk_1E1A94058);
  -[_UIFocusMovementPressGestureRecognizer setShouldRepeat:](self, "setShouldRepeat:", 1);
}

- (unint64_t)focusHeadingForPresses:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v16;

  v5 = a3;
  if (objc_msgSend(v5, "count") != 1)
    goto LABEL_4;
  -[_UIFocusMovementTabulatorPressGestureRecognizer trackingPress](self, "trackingPress");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_4;
  v7 = (void *)v6;
  objc_msgSend(v5, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusMovementTabulatorPressGestureRecognizer trackingPress](self, "trackingPress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 != v9)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusMovementTabulatorPressGestureRecognizer.m"), 32, CFSTR("Press tracking violation. Received a request for a press not tracked by this gesture recognizer."));

  }
  objc_msgSend(v5, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "modifierFlags");
  v13 = v12 & 0xFFFFFFFFFFFBFFFFLL;
  v14 = 16;
  if ((v12 & 0xFFFFFFFFFFFBFFFFLL) == 0x20000)
    v14 = 32;
  if (v13 == 0x20000 || v12 < 0 || v13 == 0)
    v16 = v14;
  else
    v16 = 0;

  return v16;
}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIFocusMovementTabulatorPressGestureRecognizer;
  -[_UIFocusMovementPressGestureRecognizer reset](&v3, sel_reset);
  -[_UIFocusMovementTabulatorPressGestureRecognizer setTrackingPress:](self, "setTrackingPress:", 0);
}

- (BOOL)_shouldReceivePress:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIFocusMovementTabulatorPressGestureRecognizer;
  if (-[UIGestureRecognizer _shouldReceivePress:](&v8, sel__shouldReceivePress_, v4)
    && (-[_UIFocusMovementTabulatorPressGestureRecognizer trackingPress](self, "trackingPress"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    -[_UIFocusMovementTabulatorPressGestureRecognizer setTrackingPress:](self, "setTrackingPress:", v4);
    v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (UIPress)trackingPress
{
  return self->_trackingPress;
}

- (void)setTrackingPress:(id)a3
{
  objc_storeStrong((id *)&self->_trackingPress, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackingPress, 0);
}

@end
