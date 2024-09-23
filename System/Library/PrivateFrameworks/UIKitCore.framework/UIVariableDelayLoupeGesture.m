@implementation UIVariableDelayLoupeGesture

- (void)setTextView:(id)a3
{
  objc_storeWeak((id *)&self->_textView, a3);
}

- (UIVariableDelayLoupeGesture)initWithTarget:(id)a3 action:(SEL)a4
{
  UIVariableDelayLoupeGesture *v4;
  UIVariableDelayLoupeGesture *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIVariableDelayLoupeGesture;
  v4 = -[UILongPressGestureRecognizer initWithTarget:action:](&v7, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[UILongPressGestureRecognizer set_prefersToBeExclusiveWithCompetingLongPressGestureRecognizers:](v4, "set_prefersToBeExclusiveWithCompetingLongPressGestureRecognizers:", 1);
    -[UILongPressGestureRecognizer set_prefersNotToBePreventedByCompetingLongPressGestureRecognizers:](v5, "set_prefersNotToBePreventedByCompetingLongPressGestureRecognizers:", 1);
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_textView);
}

- (BOOL)_allowsForShortDelay
{
  BOOL v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  char v9;

  v3 = -[UIVariableDelayLoupeGesture _tracksPointerTouch](self, "_tracksPointerTouch");
  -[UIVariableDelayLoupeGesture textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIGestureRecognizer view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = 0;
  if (v5 && v4)
  {
    if (v3
      || objc_msgSend(v4, "isEditing")
      && (!objc_msgSend(v4, "_usesAsynchronousProtocol") || objc_msgSend(v4, "isEditable")))
    {
      -[UIVariableDelayLoupeGesture textView](self, "textView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_selectionDisplayInteraction");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "_isCursorAccessoryViewVisible");

      v6 = v9 ^ 1;
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (BOOL)_tracksPointerTouch
{
  void *v2;
  void *v3;

  -[UILongPressGestureRecognizer touches](self, "touches");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "_isPointerTouch");
  return (char)v2;
}

- (BOOL)isCloseToCaret
{
  UIVariableDelayLoupeGesture *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  v2 = self;
  -[UIVariableDelayLoupeGesture textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_proxyTextInput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textInputView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIVariableDelayLoupeGesture textView](v2, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "interactionAssistant");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeSelectionController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "caretRect");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  -[UILongPressGestureRecognizer locationInView:](v2, "locationInView:", v5);
  LOBYTE(v2) = sqrt((v11 + v15 * 0.5 - v18) * (v11 + v15 * 0.5 - v18) + (v13 + v17 * 0.5 - v19)
                                                                      * (v13 + v17 * 0.5 - v19)) < 40.0;

  return (char)v2;
}

- (BOOL)isWithinRecentTap
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  -[UIVariableDelayLoupeGesture textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIGestureRecognizer view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = 0;
  if (v4 && v3)
  {
    objc_msgSend(v3, "__textInteractionFromAssistant");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "interactionWithClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "_isNowWithinRepeatedTapTime");

  }
  return v5;
}

- (BOOL)shouldUseLegacyBehavior
{
  int v3;
  int v5;
  void *v6;
  void *v7;
  void *v8;

  if (_UIInternalPreferencesRevisionOnce != -1)
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
  v3 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar < 1)
    return 0;
  v5 = _UIInternalPreference_AllowLegacyForWK;
  if (_UIInternalPreferencesRevisionVar == _UIInternalPreference_AllowLegacyForWK)
    return 0;
  while (v3 >= v5)
  {
    _UIInternalPreferenceSync(v3, &_UIInternalPreference_AllowLegacyForWK, (uint64_t)CFSTR("AllowLegacyForWK"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
    v5 = _UIInternalPreference_AllowLegacyForWK;
    if (v3 == _UIInternalPreference_AllowLegacyForWK)
      return 0;
  }
  if (!byte_1EDDA8354)
    return 0;
  -[UIVariableDelayLoupeGesture textView](self, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_proxyTextInput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textInputView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v8, "conformsToProtocol:", &unk_1EE0CE648);
  return (char)v6;
}

- (BOOL)isLongPress
{
  double v3;
  double v4;

  v3 = CACurrentMediaTime();
  -[UIGestureRecognizer lastTouchTimestamp](self, "lastTouchTimestamp");
  return v3 - v4 > 0.5;
}

- (void)_startEnoughTimeElapsedTimer
{
  BOOL v3;
  double v4;
  objc_super v5;

  v3 = -[UIVariableDelayLoupeGesture _tracksPointerTouch](self, "_tracksPointerTouch");
  if (!-[UIVariableDelayLoupeGesture _allowsForShortDelay](self, "_allowsForShortDelay") || (v4 = 0.0, !v3))
  {
    v4 = 0.5;
    if (-[UIVariableDelayLoupeGesture _allowsForShortDelay](self, "_allowsForShortDelay")
      && -[UIVariableDelayLoupeGesture isCloseToCaret](self, "isCloseToCaret")
      && !-[UIVariableDelayLoupeGesture isWithinRecentTap](self, "isWithinRecentTap"))
    {
      if (-[UIVariableDelayLoupeGesture shouldUseLegacyBehavior](self, "shouldUseLegacyBehavior"))
        v4 = 0.25;
      else
        v4 = 0.07;
    }
  }
  -[UILongPressGestureRecognizer setDelay:](self, "setDelay:", v4);
  v5.receiver = self;
  v5.super_class = (Class)UIVariableDelayLoupeGesture;
  -[UILongPressGestureRecognizer _startEnoughTimeElapsedTimer](&v5, sel__startEnoughTimeElapsedTimer);
}

- (BOOL)_isGestureType:(int64_t)a3
{
  return a3 == 6 || a3 == 1;
}

- (UITextInput)textView
{
  return (UITextInput *)objc_loadWeakRetained((id *)&self->_textView);
}

- (void)invalidate
{
  -[UIVariableDelayLoupeGesture setTextView:](self, "setTextView:", 0);
}

@end
