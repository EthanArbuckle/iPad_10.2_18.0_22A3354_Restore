@implementation _UIApplicationSceneKeyboardClientComponent

- (UIEdgeInsets)minimumKeyboardPadding
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UIEdgeInsets result;

  -[FBSSceneComponent clientScene](self, "clientScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "minimumKeyboardPadding");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (BOOL)isKeyboardDockDisabled
{
  void *v2;
  void *v3;
  char v4;

  -[FBSSceneComponent clientScene](self, "clientScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "keyboardDockDisabled");

  return v4;
}

- (BOOL)suppressKeyboardFocusRequests
{
  void *v2;
  void *v3;
  char v4;

  -[FBSSceneComponent clientScene](self, "clientScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "suppressKeyboardFocusRequests");

  return v4;
}

- (void)scene:(id)a3 didUpdateSettings:(id)a4
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  objc_msgSend(v12, "settingsDiff");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsProperty:", sel_hardwareKeyboardExclusivityIdentifier);

  if (v6)
  {
    objc_msgSend(v12, "settings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hardwareKeyboardExclusivityIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[FBSSceneComponent clientScene](self, "clientScene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIScene _sceneForFBSScene:](UIWindowScene, "_sceneForFBSScene:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "keyboardSceneDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHardwareKeyboardExclusivityIdentifier:", v8);

  }
}

@end
