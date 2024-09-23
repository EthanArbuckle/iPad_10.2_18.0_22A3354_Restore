@implementation _UIFocusActiveSceneObserver_KeyboardEventDeferring

- (id)_initWithScene:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIFocusActiveSceneObserver_KeyboardEventDeferring;
  v5 = -[_UIFocusActiveSceneObserver _initWithScene:](&v9, sel__initWithScene_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v5, sel__activeStateChanged_, CFSTR("_UISceneDidBecomeTargetOfKeyboardEventDeferringEnvironmentNotification"), v4);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v5, sel__activeStateChanged_, CFSTR("_UISceneDidResignTargetOfKeyboardEventDeferringEnvironmentNotification"), v4);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = CFSTR("_UISceneDidBecomeTargetOfKeyboardEventDeferringEnvironmentNotification");
  v6[1] = CFSTR("_UISceneDidResignTargetOfKeyboardEventDeferringEnvironmentNotification");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  v5.receiver = self;
  v5.super_class = (Class)_UIFocusActiveSceneObserver_KeyboardEventDeferring;
  -[_UIFocusActiveSceneObserver_KeyboardEventDeferring dealloc](&v5, sel_dealloc);
}

- (BOOL)isActive
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->super._scene);
  v3 = objc_msgSend(WeakRetained, "_isTargetOfKeyboardEventDeferringEnvironment");

  return v3;
}

@end
