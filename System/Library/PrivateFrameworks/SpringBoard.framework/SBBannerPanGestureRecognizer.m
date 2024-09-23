@implementation SBBannerPanGestureRecognizer

- (SBBannerPanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  SBBannerPanGestureRecognizer *v4;
  SBBannerPanGestureRecognizer *v5;
  uint64_t v6;
  NSMutableSet *identifiersForTouchesDisablingTouchCancellation;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBBannerPanGestureRecognizer;
  v4 = -[SBBannerPanGestureRecognizer initWithTarget:action:](&v9, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_clientWantsCancelsTouchesInView = -[SBBannerPanGestureRecognizer cancelsTouchesInView](v4, "cancelsTouchesInView");
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = objc_claimAutoreleasedReturnValue();
    identifiersForTouchesDisablingTouchCancellation = v5->_identifiersForTouchesDisablingTouchCancellation;
    v5->_identifiersForTouchesDisablingTouchCancellation = (NSMutableSet *)v6;

  }
  return v5;
}

- (void)setCancelsTouchesInView:(BOOL)a3
{
  self->_clientWantsCancelsTouchesInView = a3;
  -[SBBannerPanGestureRecognizer _updateCancelsTouchesInView](self, "_updateCancelsTouchesInView");
}

- (void)_actuallySetCancelsTouchesInView:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBBannerPanGestureRecognizer;
  -[SBBannerPanGestureRecognizer setCancelsTouchesInView:](&v3, sel_setCancelsTouchesInView_, a3);
}

- (void)_addTouchDisablingTouchCancellation:(id)a3
{
  NSMutableSet *identifiersForTouchesDisablingTouchCancellation;
  void *v5;

  identifiersForTouchesDisablingTouchCancellation = self->_identifiersForTouchesDisablingTouchCancellation;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "_touchIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](identifiersForTouchesDisablingTouchCancellation, "addObject:", v5);

  -[SBBannerPanGestureRecognizer _updateCancelsTouchesInView](self, "_updateCancelsTouchesInView");
}

- (void)_removeTouchDisablingTouchCancellation:(id)a3
{
  NSMutableSet *identifiersForTouchesDisablingTouchCancellation;
  void *v5;

  identifiersForTouchesDisablingTouchCancellation = self->_identifiersForTouchesDisablingTouchCancellation;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "_touchIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet removeObject:](identifiersForTouchesDisablingTouchCancellation, "removeObject:", v5);

  -[SBBannerPanGestureRecognizer _updateCancelsTouchesInView](self, "_updateCancelsTouchesInView");
}

- (void)_updateCancelsTouchesInView
{
  _BOOL8 v3;

  v3 = self->_clientWantsCancelsTouchesInView
    && -[NSMutableSet count](self->_identifiersForTouchesDisablingTouchCancellation, "count") == 0;
  -[SBBannerPanGestureRecognizer _actuallySetCancelsTouchesInView:](self, "_actuallySetCancelsTouchesInView:", v3);
}

- (void)_removeTouchesDisablingTouchCancellation:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[SBBannerPanGestureRecognizer _removeTouchDisablingTouchCancellation:](self, "_removeTouchDisablingTouchCancellation:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (BOOL)_shouldReceiveTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  void *v9;
  int v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBBannerPanGestureRecognizer;
  v8 = -[SBBannerPanGestureRecognizer _shouldReceiveTouch:withEvent:](&v12, sel__shouldReceiveTouch_withEvent_, v6, v7);
  if (v8
    && (-[SBBannerPanGestureRecognizer systemDragCancellingDelegate](self, "systemDragCancellingDelegate"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "bannerPanGestureRecognizer:shouldDisableTouchCancellationForTouch:event:", self, v6, v7),
        v9,
        v10))
  {
    -[SBBannerPanGestureRecognizer _addTouchDisablingTouchCancellation:](self, "_addTouchDisablingTouchCancellation:", v6);
  }
  else
  {
    -[SBBannerPanGestureRecognizer _removeTouchDisablingTouchCancellation:](self, "_removeTouchDisablingTouchCancellation:", v6);
  }

  return v8;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  -[SBBannerPanGestureRecognizer systemDragCancellingDelegate](self, "systemDragCancellingDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "bannerPanGestureRecognizer:shouldCancelSystemDragGestureWithTouches:event:", self, v6, v7);

  if (v9)
  {
    -[SBBannerPanGestureRecognizer setState:](self, "setState:", 5);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SBBannerPanGestureRecognizer;
    -[SBBannerPanGestureRecognizer touchesBegan:withEvent:](&v10, sel_touchesBegan_withEvent_, v6, v7);
  }

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBBannerPanGestureRecognizer;
  v6 = a3;
  -[SBBannerPanGestureRecognizer touchesEnded:withEvent:](&v7, sel_touchesEnded_withEvent_, v6, a4);
  -[SBBannerPanGestureRecognizer _removeTouchesDisablingTouchCancellation:](self, "_removeTouchesDisablingTouchCancellation:", v6, v7.receiver, v7.super_class);

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBBannerPanGestureRecognizer;
  v6 = a3;
  -[SBBannerPanGestureRecognizer touchesCancelled:withEvent:](&v7, sel_touchesCancelled_withEvent_, v6, a4);
  -[SBBannerPanGestureRecognizer _removeTouchesDisablingTouchCancellation:](self, "_removeTouchesDisablingTouchCancellation:", v6, v7.receiver, v7.super_class);

}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[SBBannerPanGestureRecognizer isEnabled](self, "isEnabled") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)SBBannerPanGestureRecognizer;
    -[SBBannerPanGestureRecognizer setEnabled:](&v5, sel_setEnabled_, v3);
    if (!v3)
      -[NSMutableSet removeAllObjects](self->_identifiersForTouchesDisablingTouchCancellation, "removeAllObjects");
  }
}

- (SBBannerPanGestureSystemDragCancellingDelegate)systemDragCancellingDelegate
{
  return (SBBannerPanGestureSystemDragCancellingDelegate *)objc_loadWeakRetained((id *)&self->_systemDragCancellingDelegate);
}

- (void)setSystemDragCancellingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_systemDragCancellingDelegate, a3);
}

- (SBWindowScene)windowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_windowScene);
}

- (void)setWindowScene:(id)a3
{
  objc_storeWeak((id *)&self->_windowScene, a3);
}

- (NSMutableSet)identifiersForTouchesDisablingTouchCancellation
{
  return self->_identifiersForTouchesDisablingTouchCancellation;
}

- (BOOL)clientWantsCancelsTouchesInView
{
  return self->_clientWantsCancelsTouchesInView;
}

- (void)setClientWantsCancelsTouchesInView:(BOOL)a3
{
  self->_clientWantsCancelsTouchesInView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiersForTouchesDisablingTouchCancellation, 0);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_destroyWeak((id *)&self->_systemDragCancellingDelegate);
}

@end
