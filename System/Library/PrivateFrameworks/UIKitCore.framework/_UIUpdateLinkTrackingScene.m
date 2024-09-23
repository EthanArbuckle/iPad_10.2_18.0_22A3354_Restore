@implementation _UIUpdateLinkTrackingScene

- (id)_initWithScene:(void *)a1
{
  id v3;
  id v4;

  if (!a1)
    return 0;
  v3 = -[UIUpdateLink _init](a1);
  v4 = v3;
  if (v3)
    -[_UIUpdateLinkTrackingScene _switchSceneFrom:to:]((uint64_t)v3, 0, a2);
  return v4;
}

- (void)_switchSceneFrom:(void *)a3 to:
{
  void *v6;
  BOOL v7;
  id v8;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
    if (a2)
    {
      objc_msgSend(v6, "removeObserver:name:object:", a1, CFSTR("UISceneWillEnterForegroundNotification"), a2);
      objc_msgSend(v8, "removeObserver:name:object:", a1, CFSTR("UISceneDidEnterBackgroundNotification"), a2);
      objc_msgSend(v8, "removeObserver:name:object:", a1, CFSTR("UISceneDidDisconnectNotification"), a2);
      v6 = v8;
    }
    if (a3)
    {
      objc_msgSend(v6, "addObserver:selector:name:object:", a1, sel__sceneEnterForeground, CFSTR("UISceneWillEnterForegroundNotification"), a3);
      objc_msgSend(v8, "addObserver:selector:name:object:", a1, sel__sceneExitForeground, CFSTR("UISceneDidEnterBackgroundNotification"), a3);
      objc_msgSend(v8, "addObserver:selector:name:object:", a1, sel__sceneExitForeground, CFSTR("UISceneDidDisconnectNotification"), a3);
      if (objc_msgSend(a3, "activationState"))
        v7 = objc_msgSend(a3, "activationState") == 1;
      else
        v7 = 1;
      v6 = v8;
    }
    else
    {
      v7 = 0;
    }
    *(_BYTE *)(a1 + 51) = v7;

  }
}

- (BOOL)_canEngage
{
  return *(&self->super.super._enabled + 1);
}

- (void)_sceneEnterForeground
{
  _BOOL4 v3;
  int v4;

  *(&self->super.super._enabled + 1) = 1;
  v3 = -[_UIUpdateLinkTrackingScene _canEngage](self, "_canEngage");
  if (self->super.super._engaged != v3)
  {
    self->super.super._engaged = v3;
    v4 = self->super.super._enabled && v3;
    -[UIUpdateLink _setActive:]((uint64_t)self, v4);
  }
}

- (void)_sceneExitForeground
{
  _BOOL4 v3;
  int v4;

  *(&self->super.super._enabled + 1) = 0;
  v3 = -[_UIUpdateLinkTrackingScene _canEngage](self, "_canEngage");
  if (self->super.super._engaged != v3)
  {
    self->super.super._engaged = v3;
    v4 = self->super.super._enabled && v3;
    -[UIUpdateLink _setActive:]((uint64_t)self, v4);
  }
}

@end
