@implementation _UITextEffectsRemoteView

+ (BOOL)_requiresWindowTouches
{
  return 0;
}

- (int)textEffectsVisibilityLevel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  double v10;
  double v11;
  double v12;
  int v13;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "responder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIRemoteView remoteViewController](self, "remoteViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (v9 || (objc_msgSend(v5, "level"), v11 = v10, objc_msgSend(v8, "level"), v11 <= v12))
    v13 = 500;
  else
    v13 = 9;

  return v13;
}

@end
