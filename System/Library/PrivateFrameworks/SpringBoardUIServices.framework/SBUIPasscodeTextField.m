@implementation SBUIPasscodeTextField

- (void)_enableAutomaticAppearance
{
  void *v3;
  void *v4;
  id v5;

  +[SBUIKeyboardEnablementManager sharedInstance](SBUIKeyboardEnablementManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enableAutomaticAppearanceForContext:", self);

  if (self->_previousResponderRequiresKeyboard)
  {
    objc_msgSend(MEMORY[0x1E0CEA828], "sharedInstance");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_restoreInputViewsWithId:animated:", v4, 1);

  }
}

- (void)_disableAutomaticAppearance
{
  void *v3;
  void *v4;
  id v5;

  if (self->_previousResponderRequiresKeyboard)
  {
    objc_msgSend(MEMORY[0x1E0CEA828], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_preserveInputViewsWithId:animated:", v4, 1);

  }
  +[SBUIKeyboardEnablementManager sharedInstance](SBUIKeyboardEnablementManager, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "disableAutomaticAppearanceForContext:", self);

}

- (void)dealloc
{
  objc_super v3;

  -[SBUIPasscodeTextField _enableAutomaticAppearance](self, "_enableAutomaticAppearance");
  v3.receiver = self;
  v3.super_class = (Class)SBUIPasscodeTextField;
  -[SBUIPasscodeTextField dealloc](&v3, sel_dealloc);
}

- (BOOL)becomeFirstResponder
{
  void *v3;
  void *v4;
  BOOL v5;
  objc_super v7;

  if (!self->_showsSystemKeyboard)
  {
    objc_msgSend(MEMORY[0x1E0CEAC18], "keyWindow");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstResponder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    self->_previousResponderRequiresKeyboard = objc_msgSend(v4, "_requiresKeyboardWhenFirstResponder");

    -[SBUIPasscodeTextField _disableAutomaticAppearance](self, "_disableAutomaticAppearance");
  }
  v7.receiver = self;
  v7.super_class = (Class)SBUIPasscodeTextField;
  v5 = -[SBUIPasscodeTextField becomeFirstResponder](&v7, sel_becomeFirstResponder);
  if (!v5 && !self->_showsSystemKeyboard)
    -[SBUIPasscodeTextField _enableAutomaticAppearance](self, "_enableAutomaticAppearance");
  return v5;
}

- (BOOL)resignFirstResponder
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBUIPasscodeTextField;
  v3 = -[SBUIPasscodeTextField resignFirstResponder](&v5, sel_resignFirstResponder);
  if (v3 && !self->_showsSystemKeyboard)
    -[SBUIPasscodeTextField _enableAutomaticAppearance](self, "_enableAutomaticAppearance");
  return v3;
}

- (void)_handleKeyUIEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_9;
  if (!objc_msgSend(v4, "_hidEvent"))
  {
    objc_msgSend(v5, "_isKeyDown");
LABEL_9:
    v10.receiver = self;
    v10.super_class = (Class)SBUIPasscodeTextField;
    -[SBUIPasscodeTextField _handleKeyUIEvent:](&v10, sel__handleKeyUIEvent_, v5);
    goto LABEL_10;
  }
  BKSHIDEventGetBaseAttributes();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "source");

  if (!objc_msgSend(v5, "_isKeyDown") || (v7 & 0xFFFFFFFD) != 1)
    goto LABEL_9;
  objc_msgSend(v5, "_modifiedInput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("\r")) & 1) == 0
    && !objc_msgSend(v8, "isEqualToString:", CFSTR("\n")))
  {

    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:", CFSTR("SBUIHardwareKeyboardReturnKeyPressedNotification"), self);

LABEL_10:
}

- (BOOL)showsSystemKeyboard
{
  return self->_showsSystemKeyboard;
}

- (void)setShowsSystemKeyboard:(BOOL)a3
{
  self->_showsSystemKeyboard = a3;
}

@end
