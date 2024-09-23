@implementation _UIProductivityGestureAction

- (int64_t)UIActionType
{
  return 46;
}

- (_UIProductivityGestureAction)initWithGestureDirection:(int64_t)a3 authenticationMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _UIProductivityGestureAction *v9;
  objc_super v11;

  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forSetting:", v8, 1);

  if (v6)
    objc_msgSend(v7, "setObject:forSetting:", v6, 2);
  v11.receiver = self;
  v11.super_class = (Class)_UIProductivityGestureAction;
  v9 = -[_UIProductivityGestureAction initWithInfo:responder:](&v11, sel_initWithInfo_responder_, v7, 0);

  return v9;
}

- (int64_t)gestureDirection
{
  void *v2;
  void *v3;
  int64_t v4;

  -[_UIProductivityGestureAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (BKSHIDEventAuthenticationMessage)authenticationMessage
{
  void *v2;
  void *v3;

  -[_UIProductivityGestureAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (BKSHIDEventAuthenticationMessage *)v3;
}

- (void)_handleActionForWindowScene:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  void *v12;
  id *v13;

  v13 = (id *)a3;
  -[UIWindowScene _keyWindow](v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstResponder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateIdleDetection:", 5);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = -[_UIProductivityGestureAction gestureDirection](self, "gestureDirection");
    -[_UIProductivityGestureAction authenticationMessage](self, "authenticationMessage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "__didReceiveGestureDirection:authenticationMessage:", v7, v8);
  }
  else
  {
    +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:](UITextEffectsWindow, "sharedTextEffectsWindowForWindowScene:", v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "editingOverlayViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "undoInteraction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[_UIProductivityGestureAction gestureDirection](self, "gestureDirection");
    -[_UIProductivityGestureAction authenticationMessage](self, "authenticationMessage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "performGestureWithDirection:authenticationMessage:", v11, v12);

  }
}

@end
