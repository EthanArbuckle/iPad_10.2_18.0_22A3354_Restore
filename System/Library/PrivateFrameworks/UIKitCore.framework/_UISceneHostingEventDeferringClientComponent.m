@implementation _UISceneHostingEventDeferringClientComponent

- (void)setScene:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UISceneHostingEventDeferringClientComponent;
  -[FBSSceneComponent setScene:](&v4, sel_setScene_, a3);
  -[_UISceneHostingEventDeferringClientComponent beginObservingNotifications](self, "beginObservingNotifications");
}

- (BOOL)maintainHostFirstResponderWhenClientWantsKeyboard
{
  void *v2;
  void *v3;
  char v4;

  -[FBSSceneComponent clientScene](self, "clientScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "maintainHostFirstResponderWhenClientWantsKeyboard");

  return v4;
}

- (void)requestKeyboardFocus
{
  void *v3;
  void *v4;
  _UISceneHostingEventDeferringFocusRequestActionToHost *v5;

  v5 = -[_UISceneHostingEventDeferringFocusRequestActionToHost initWithInfo:responder:]([_UISceneHostingEventDeferringFocusRequestActionToHost alloc], "initWithInfo:responder:", 0, 0);
  -[FBSSceneComponent scene](self, "scene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendPrivateActions:", v4);

}

- (void)beginObservingNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_wantsKeyboardEvents_, CFSTR("_UIRemoteKeyboardsServiceWantsKeyboardFocusWithoutFirstResponderNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_firstResponderDidChange_, CFSTR("UIWindowFirstResponderDidChangeNotification"), 0);

}

- (void)stopObservingNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("_UIRemoteKeyboardsServiceWantsKeyboardFocusWithoutFirstResponderNotification"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIWindowFirstResponderDidChangeNotification"), 0);

}

- (void)wantsKeyboardEvents:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_UIRemoteKeyboardsHostedWindowUserInfoKey"));
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "_windowHostingScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_FBSScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identityToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSSceneComponent clientScene](self, "clientScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identityToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  v11 = v13;
  if (v10)
  {
    objc_msgSend(v13, "firstResponder");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "_wantsTargetOfKeyboardEventDeferringEnvironment") & 1) != 0
      || objc_msgSend(v12, "_isHostingRemoteContent"))
    {
      -[_UISceneHostingEventDeferringClientComponent requestKeyboardFocus](self, "requestKeyboardFocus");
    }

    v11 = v13;
  }

}

- (void)firstResponderDidChange:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;

  objc_msgSend(a3, "object");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstResponder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_wantsTargetOfKeyboardEventDeferringEnvironment");

  if (v5)
  {
    objc_msgSend(v12, "_windowHostingScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_FBSScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identityToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBSSceneComponent clientScene](self, "clientScene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identityToken");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "isEqual:", v10);

    if (v11)
      -[_UISceneHostingEventDeferringClientComponent requestKeyboardFocus](self, "requestKeyboardFocus");
  }

}

- (void)invalidate
{
  objc_super v3;

  -[_UISceneHostingEventDeferringClientComponent stopObservingNotifications](self, "stopObservingNotifications");
  v3.receiver = self;
  v3.super_class = (Class)_UISceneHostingEventDeferringClientComponent;
  -[FBSSceneComponent invalidate](&v3, sel_invalidate);
}

@end
