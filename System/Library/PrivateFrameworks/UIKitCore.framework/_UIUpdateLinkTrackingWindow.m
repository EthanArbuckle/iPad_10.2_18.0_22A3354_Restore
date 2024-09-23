@implementation _UIUpdateLinkTrackingWindow

- (void)_switchWindowFrom:(void *)a3 to:
{
  id v6;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (a2)
    {
      objc_msgSend(v6, "removeObserver:name:object:", a1, CFSTR("UIWindowDidBecomeVisibleNotification"), a2);
      objc_msgSend(v6, "removeObserver:name:object:", a1, CFSTR("UIWindowDidBecomeHiddenNotification"), a2);
      objc_msgSend(v6, "removeObserver:name:object:", a1, CFSTR("_UIWindowWillMoveToNilSceneNotification"), a2);
      objc_msgSend(v6, "removeObserver:name:object:", a1, 0x1E1764CA0, a2);
      objc_msgSend(v6, "removeObserver:name:object:", a1, 0x1E1764CC0, a2);
    }
    if (a3)
    {
      objc_msgSend(v6, "addObserver:selector:name:object:", a1, sel__windowVisibilityChanged_, CFSTR("UIWindowDidBecomeVisibleNotification"), a3);
      objc_msgSend(v6, "addObserver:selector:name:object:", a1, sel__windowVisibilityChanged_, CFSTR("UIWindowDidBecomeHiddenNotification"), a3);
      objc_msgSend(v6, "addObserver:selector:name:object:", a1, sel__windowSceneWillChange_, CFSTR("_UIWindowWillMoveToNilSceneNotification"), a3);
      objc_msgSend(v6, "addObserver:selector:name:object:", a1, sel__windowSceneWillChange_, 0x1E1764CA0, a3);
      objc_msgSend(v6, "addObserver:selector:name:object:", a1, sel__windowSceneDidChange_, 0x1E1764CC0, a3);
    }
    *(_BYTE *)(a1 + 52) = objc_msgSend(a3, "_isVisible");

  }
}

- (BOOL)_canEngage
{
  return *(&self->super.super.super._enabled + 1) && *(&self->super.super.super._enabled + 2);
}

- (void)_windowVisibilityChanged:(id)a3
{
  _BOOL4 v4;
  int v5;
  id v6;

  objc_msgSend(a3, "object");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  *(&self->super.super.super._enabled + 2) = objc_msgSend(v6, "_isVisible");
  v4 = -[_UIUpdateLinkTrackingWindow _canEngage](self, "_canEngage");
  if (self->super.super.super._engaged != v4)
  {
    self->super.super.super._engaged = v4;
    v5 = self->super.super.super._enabled && v4;
    -[UIUpdateLink _setActive:]((uint64_t)self, v5);
  }

}

- (void)_windowSceneWillChange:(id)a3
{
  void *v4;
  _BOOL4 v5;
  int v6;
  id v7;

  objc_msgSend(a3, "object");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_windowHostingScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIUpdateLinkTrackingScene _switchSceneFrom:to:]((uint64_t)self, (uint64_t)v4, 0);
  if (self)
  {
    v5 = -[_UIUpdateLinkTrackingWindow _canEngage](self, "_canEngage");
    if (self->super.super.super._engaged != v5)
    {
      self->super.super.super._engaged = v5;
      v6 = self->super.super.super._enabled && v5;
      -[UIUpdateLink _setActive:]((uint64_t)self, v6);
    }
  }

}

- (void)_windowSceneDidChange:(id)a3
{
  void *v4;
  _BOOL4 v5;
  int v6;
  id v7;

  objc_msgSend(a3, "object");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_windowHostingScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIUpdateLinkTrackingScene _switchSceneFrom:to:]((uint64_t)self, 0, v4);
  if (self)
  {
    v5 = -[_UIUpdateLinkTrackingWindow _canEngage](self, "_canEngage");
    if (self->super.super.super._engaged != v5)
    {
      self->super.super.super._engaged = v5;
      v6 = self->super.super.super._enabled && v5;
      -[UIUpdateLink _setActive:]((uint64_t)self, v6);
    }
  }

}

@end
