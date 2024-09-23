@implementation SBHomeAffordanceInteraction

- (SBHomeAffordanceInteraction)initWithHomeAffordanceInteractionManager:(id)a3
{
  id v4;
  SBHomeAffordanceInteraction *v5;
  SBHomeAffordanceInteraction *v6;
  uint64_t v7;
  SBFHomeGrabberSettings *homeGrabberSettings;
  uint64_t v9;
  MTLumaDodgePillSettings *lumaDodgePillSettings;
  CGSize v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBHomeAffordanceInteraction;
  v5 = -[SBHomeAffordanceInteraction init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_homeAffordanceInteractionManager, v4);
    objc_msgSend(MEMORY[0x1E0DA9E28], "rootSettings");
    v7 = objc_claimAutoreleasedReturnValue();
    homeGrabberSettings = v6->_homeGrabberSettings;
    v6->_homeGrabberSettings = (SBFHomeGrabberSettings *)v7;

    -[SBFHomeGrabberSettings addKeyObserver:](v6->_homeGrabberSettings, "addKeyObserver:", v6);
    objc_msgSend(MEMORY[0x1E0D47488], "sharedInstance");
    v9 = objc_claimAutoreleasedReturnValue();
    lumaDodgePillSettings = v6->_lumaDodgePillSettings;
    v6->_lumaDodgePillSettings = (MTLumaDodgePillSettings *)v9;

    -[MTLumaDodgePillSettings addKeyObserver:](v6->_lumaDodgePillSettings, "addKeyObserver:", v6);
    v11 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v6->_homeAffordanceHitTestRect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v6->_homeAffordanceHitTestRect.size = v11;
  }

  return v6;
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_homeAffordanceInteractionManager);
  objc_msgSend(WeakRetained, "unregisterHomeAffordanceInteraction:", self);

  v4.receiver = self;
  v4.super_class = (Class)SBHomeAffordanceInteraction;
  -[SBHomeAffordanceInteraction dealloc](&v4, sel_dealloc);
}

- (CGRect)homeAffordanceFrame
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id WeakRetained;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  -[SBHomeAffordanceInteraction view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if ((*(_BYTE *)&self->_delegateRespondsTo & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "homeAffordanceFrameForHomeAffordanceInteraction:", self);
    v6 = v14;
    v8 = v15;
    v10 = v16;
    v12 = v17;

  }
  else if (v3)
  {
    objc_msgSend(v3, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
  }
  else
  {
    v6 = *MEMORY[0x1E0C9D628];
    v8 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v12 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  v18 = v6;
  v19 = v8;
  v20 = v10;
  v21 = v12;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (UIEdgeInsets)standardHomeAffordanceHitTestRectOutsets
{
  void *WeakRetained;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  void *v18;
  int v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGRect v37;
  CGRect v38;
  UIEdgeInsets result;

  if ((*(_BYTE *)&self->_delegateRespondsTo & 2) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "standardHomeAffordanceHitTestRectOutsetsForHomeAffordanceInteraction:", self);
    v24 = v29;
    v25 = v30;
    v27 = v31;
    v28 = v32;
  }
  else
  {
    -[SBHomeAffordanceInteraction view](self, "view");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHomeAffordanceInteraction homeAffordanceFrame](self, "homeAffordanceFrame");
    objc_msgSend(WeakRetained, "convertRect:toView:", v4);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    objc_msgSend(v4, "safeAreaInsets");
    v14 = v13;
    objc_msgSend(v4, "bounds");
    v15 = CGRectGetMaxY(v37) - v14;
    v38.origin.x = v6;
    v38.origin.y = v8;
    v38.size.width = v10;
    v38.size.height = v12;
    v16 = 0.0;
    v17 = fmax(CGRectGetMaxY(v38) - v15, 0.0);
    -[SBHomeAffordanceInteraction _assistantController](self, "_assistantController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled");

    if (v19)
      v16 = v17;
    -[SBFHomeGrabberSettings hitTestOutsetTop](self->_homeGrabberSettings, "hitTestOutsetTop");
    v21 = v16 + v20;
    if ((-[SBFHomeGrabberSettings constrainHitTestRectToSafeAreaInset](self->_homeGrabberSettings, "constrainHitTestRectToSafeAreaInset") & (v21 > v17)) != 0)v21 = v17;
    -[SBFHomeGrabberSettings hitTestOutsetSides](self->_homeGrabberSettings, "hitTestOutsetSides");
    v23 = v22;
    -[MTLumaDodgePillSettings edgeSpacing](self->_lumaDodgePillSettings, "edgeSpacing");
    v24 = -v21;
    v25 = -v23;
    v27 = -v26;

    v28 = v25;
  }

  v33 = v24;
  v34 = v25;
  v35 = v27;
  v36 = v28;
  result.right = v36;
  result.bottom = v35;
  result.left = v34;
  result.top = v33;
  return result;
}

- (UIEdgeInsets)expandedHomeAffordanceHitTestRectOutsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  id WeakRetained;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UIEdgeInsets result;

  if ((*(_BYTE *)&self->_delegateRespondsTo & 4) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "expandedHomeAffordanceHitTestRectOutsetsForHomeAffordanceInteraction:", self);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

    v3 = v9;
    v4 = v11;
    v5 = v13;
    v6 = v15;
  }
  else
  {
    -[SBFHomeGrabberSettings hitTestOutsetDoubleTap](self->_homeGrabberSettings, "hitTestOutsetDoubleTap");
    -[SBHomeAffordanceInteraction standardHomeAffordanceHitTestRectOutsets](self, "standardHomeAffordanceHitTestRectOutsets");
    UIEdgeInsetsAdd();
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)setHomeAffordanceHitTestRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id WeakRetained;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectEqualToRect(a3, self->_homeAffordanceHitTestRect))
  {
    self->_homeAffordanceHitTestRect.origin.x = x;
    self->_homeAffordanceHitTestRect.origin.y = y;
    self->_homeAffordanceHitTestRect.size.width = width;
    self->_homeAffordanceHitTestRect.size.height = height;
    if ((*(_BYTE *)&self->_delegateRespondsTo & 8) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "homeAffordanceInteractionHomeAffordanceHitTestRectDidChange:", self);

    }
  }
}

- (void)notifyDidRecognizeSingleTap
{
  id WeakRetained;

  if ((*(_BYTE *)&self->_delegateRespondsTo & 0x10) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "homeAffordanceInteractionDidRecognizeSingleTap:", self);

  }
}

- (void)notifyDidRecognizeDoubleTap
{
  id WeakRetained;

  if ((*(_BYTE *)&self->_delegateRespondsTo & 0x20) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "homeAffordanceInteractionDidRecognizeDoubleTap:", self);

  }
}

- (void)notifyDidFailToRecognizeDoubleTap
{
  id WeakRetained;

  if ((*(_BYTE *)&self->_delegateRespondsTo & 0x40) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "homeAffordanceInteractionDidFailToRecognizeDoubleTap:", self);

  }
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  char v5;
  char v6;
  char v7;
  char v8;
  char v9;
  char v10;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    *(_BYTE *)&self->_delegateRespondsTo = *(_BYTE *)&self->_delegateRespondsTo & 0xFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = 2;
    else
      v5 = 0;
    *(_BYTE *)&self->_delegateRespondsTo = *(_BYTE *)&self->_delegateRespondsTo & 0xFD | v5;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 4;
    else
      v6 = 0;
    *(_BYTE *)&self->_delegateRespondsTo = *(_BYTE *)&self->_delegateRespondsTo & 0xFB | v6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 8;
    else
      v7 = 0;
    *(_BYTE *)&self->_delegateRespondsTo = *(_BYTE *)&self->_delegateRespondsTo & 0xF7 | v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = 16;
    else
      v8 = 0;
    *(_BYTE *)&self->_delegateRespondsTo = *(_BYTE *)&self->_delegateRespondsTo & 0xEF | v8;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = 32;
    else
      v9 = 0;
    *(_BYTE *)&self->_delegateRespondsTo = *(_BYTE *)&self->_delegateRespondsTo & 0xDF | v9;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = 64;
    else
      v10 = 0;
    *(_BYTE *)&self->_delegateRespondsTo = *(_BYTE *)&self->_delegateRespondsTo & 0xBF | v10;
  }

}

- (void)setEnabled:(BOOL)a3
{
  _BOOL4 v3;
  id WeakRetained;
  id v6;

  if (self->_enabled != a3)
  {
    v3 = a3;
    self->_enabled = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_homeAffordanceInteractionManager);
    v6 = WeakRetained;
    if (v3)
      objc_msgSend(WeakRetained, "registerHomeAffordanceInteraction:", self);
    else
      objc_msgSend(WeakRetained, "unregisterHomeAffordanceInteraction:", self);

  }
}

- (void)setNeedsUpdate
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_homeAffordanceInteractionManager);
  objc_msgSend(WeakRetained, "updateHomeAffordanceHitTestRectForHomeAffordanceInteraction:", self);

}

- (void)willMoveToView:(id)a3
{
  objc_storeWeak((id *)&self->_view, 0);
}

- (void)didMoveToView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if (self->_homeGrabberSettings == a3 || self->_lumaDodgePillSettings == a3)
    -[SBHomeAffordanceInteraction setNeedsUpdate](self, "setNeedsUpdate");
}

- (id)_assistantController
{
  void *v2;
  void *v3;
  void *v4;

  -[SBHomeAffordanceInteraction view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_sbWindowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assistantController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CGRect)homeAffordanceHitTestRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_homeAffordanceHitTestRect.origin.x;
  y = self->_homeAffordanceHitTestRect.origin.y;
  width = self->_homeAffordanceHitTestRect.size.width;
  height = self->_homeAffordanceHitTestRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (SBFHomeAffordanceInteractionDelegate)delegate
{
  return (SBFHomeAffordanceInteractionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (SBHomeAffordanceInteractionManager)homeAffordanceInteractionManager
{
  return (SBHomeAffordanceInteractionManager *)objc_loadWeakRetained((id *)&self->_homeAffordanceInteractionManager);
}

- (SBFHomeGrabberSettings)homeGrabberSettings
{
  return self->_homeGrabberSettings;
}

- (MTLumaDodgePillSettings)lumaDodgePillSettings
{
  return self->_lumaDodgePillSettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lumaDodgePillSettings, 0);
  objc_storeStrong((id *)&self->_homeGrabberSettings, 0);
  objc_destroyWeak((id *)&self->_homeAffordanceInteractionManager);
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
