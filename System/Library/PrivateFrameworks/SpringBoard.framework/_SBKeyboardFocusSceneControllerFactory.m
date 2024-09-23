@implementation _SBKeyboardFocusSceneControllerFactory

- (id)_dependenciesForKeyboardFocusScene:(id)a3 deliveryManager:(id)a4 sceneProvider:(id)a5
{
  id v7;
  id v8;
  id v9;
  __objc2_class **v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if ((objc_msgSend(v7, "isEmbeddedScene") & 1) != 0)
  {
LABEL_5:
    v10 = off_1E8E99E18;
    goto LABEL_6;
  }
  if ((objc_msgSend(v7, "isContinuityScene") & 1) == 0)
  {
    if (!objc_msgSend(v7, "isExternalDisplayScene"))
    {
      v11 = 0;
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  v10 = off_1E8E99E10;
LABEL_6:
  v11 = (void *)objc_msgSend(objc_alloc(*v10), "initWithScene:deliveryManager:sceneProvider:", v7, v8, v9);
LABEL_7:

  return v11;
}

- (id)newKeyboardFocusSceneControllerForScene:(id)a3 deliveryManager:(id)a4 sceneProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  SBKeyboardFocusSceneController *v11;
  void *v12;
  SBKeyboardFocusSceneController *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = [SBKeyboardFocusSceneController alloc];
  -[_SBKeyboardFocusSceneControllerFactory _dependenciesForKeyboardFocusScene:deliveryManager:sceneProvider:](self, "_dependenciesForKeyboardFocusScene:deliveryManager:sceneProvider:", v10, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[SBKeyboardFocusSceneController initWithWindowScene:dependencies:](v11, "initWithWindowScene:dependencies:", v10, v12);
  return v13;
}

@end
