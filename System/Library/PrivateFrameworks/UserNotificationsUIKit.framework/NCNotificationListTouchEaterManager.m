@implementation NCNotificationListTouchEaterManager

- (id)initForView:(id)a3
{
  id v4;
  NCNotificationListTouchEaterManager *v5;
  uint64_t v6;
  void *v7;
  NCTouchEaterGestureRecognizer *touchEater;
  BOOL v9;
  NCTouchEaterGestureRecognizer *v10;
  NCTouchEaterGestureRecognizer *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NCNotificationListTouchEaterManager;
  v5 = -[NCNotificationListTouchEaterManager init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "window");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    touchEater = v5->_touchEater;
    if (touchEater)
      v9 = 1;
    else
      v9 = v6 == 0;
    if (!v9)
    {
      v10 = -[NCTouchEaterGestureRecognizer initWithTarget:action:]([NCTouchEaterGestureRecognizer alloc], "initWithTarget:action:", v5, sel__handleEatenTouch_);
      v11 = v5->_touchEater;
      v5->_touchEater = v10;

      -[NCTouchEaterGestureRecognizer setDelegate:](v5->_touchEater, "setDelegate:", v5);
      -[NCTouchEaterGestureRecognizer setEnabled:](v5->_touchEater, "setEnabled:", 0);
      touchEater = v5->_touchEater;
    }
    objc_msgSend(v7, "addGestureRecognizer:", touchEater);

  }
  return v5;
}

- (void)setHeaderViewInClearState:(id)a3
{
  id v4;
  id obj;

  obj = a3;
  -[NCNotificationListTouchEaterManager headerViewInClearState](self, "headerViewInClearState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != obj)
  {
    objc_msgSend(v4, "resetClearButtonStateAnimated:", 1);
    objc_storeWeak((id *)&self->_headerViewInClearState, obj);
  }
  -[NCNotificationListTouchEaterManager setTouchEaterEnabled:](self, "setTouchEaterEnabled:", obj != 0);

}

- (void)setCoalescingControlsHandlerInClearState:(id)a3
{
  id v4;
  id obj;

  obj = a3;
  -[NCNotificationListTouchEaterManager coalescingControlsHandlerInClearState](self, "coalescingControlsHandlerInClearState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != obj)
  {
    objc_msgSend(v4, "resetClearButtonStateAnimated:", 1);
    objc_storeWeak((id *)&self->_coalescingControlsHandlerInClearState, obj);
  }
  -[NCNotificationListTouchEaterManager setTouchEaterEnabled:](self, "setTouchEaterEnabled:", obj != 0);

}

- (void)setSwipeInteractionInRevealedState:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id obj;

  obj = a3;
  -[NCNotificationListTouchEaterManager swipeInteractionInRevealedState](self, "swipeInteractionInRevealedState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = obj;
  v6 = v4;
  if (v4 != obj)
  {
    if (obj)
      objc_msgSend(v4, "hideActionsAnimated:fastAnimation:completion:", 1, 0, 0);
    objc_storeWeak((id *)&self->_swipeInteractionInRevealedState, obj);
    v5 = obj;
  }
  -[NCNotificationListTouchEaterManager setTouchEaterEnabled:](self, "setTouchEaterEnabled:", v5 != 0);

}

- (void)setTouchEaterEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[NCNotificationListTouchEaterManager touchEater](self, "touchEater");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v3);

}

- (void)removeTouchGestureRecognizer
{
  id v3;

  -[NCTouchEaterGestureRecognizer view](self->_touchEater, "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeGestureRecognizer:", self->_touchEater);

}

- (void)setEnabled:(BOOL)a3
{
  void *v4;
  _BOOL8 v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  id v10;

  if (a3)
  {
    -[NCNotificationListTouchEaterManager swipeInteractionInRevealedState](self, "swipeInteractionInRevealedState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = 1;
    }
    else
    {
      -[NCNotificationListTouchEaterManager headerViewInClearState](self, "headerViewInClearState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v5 = 1;
      }
      else
      {
        -[NCNotificationListTouchEaterManager coalescingControlsHandlerInClearState](self, "coalescingControlsHandlerInClearState");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v9 != 0;

      }
    }

    -[NCNotificationListTouchEaterManager touchEater](self, "touchEater");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v6;
    v7 = v5;
  }
  else
  {
    -[NCNotificationListTouchEaterManager touchEater](self, "touchEater");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v6;
    v7 = 0;
  }
  objc_msgSend(v6, "setEnabled:", v7);

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  return self->_touchEater != a3
      || -[NCNotificationListTouchEaterManager _shouldReceiveTouch:forGestureRecognizer:](self, "_shouldReceiveTouch:forGestureRecognizer:", a4, a3);
}

- (void)_handleEatenTouch:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "state") == 3)
    -[NCNotificationListTouchEaterManager _handleEatenTouchBeginStateForGestureRecognizer:](self, "_handleEatenTouchBeginStateForGestureRecognizer:", v4);
  -[NCNotificationListTouchEaterManager _handleEatenTouchEndStateForGestureRecognizer:](self, "_handleEatenTouchEndStateForGestureRecognizer:", v4);

}

- (BOOL)_isPointInWindowSpace:(CGPoint)a3 insideView:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGPoint v16;
  CGRect v17;

  y = a3.y;
  x = a3.x;
  v6 = a4;
  objc_msgSend(v6, "bounds");
  objc_msgSend(v6, "convertRect:toView:", 0);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v17.origin.x = v8;
  v17.origin.y = v10;
  v17.size.width = v12;
  v17.size.height = v14;
  v16.x = x;
  v16.y = y;
  return CGRectContainsPoint(v17, v16);
}

- (BOOL)_shouldReceiveTouch:(id)a3 forGestureRecognizer:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  BOOL v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id WeakRetained;
  void *v19;
  void *v20;

  v5 = a3;
  -[NCNotificationListTouchEaterManager swipeInteractionInRevealedState](self, "swipeInteractionInRevealedState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "locationInView:", 0);
    v8 = v7;
    v10 = v9;
    objc_msgSend(v6, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[NCNotificationListTouchEaterManager _isPointInWindowSpace:insideView:](self, "_isPointInWindowSpace:insideView:", v11, v8, v10);

    if (!v12)
      objc_msgSend(v6, "hideActionsAnimated:fastAnimation:completion:", 1, 0, 0);
  }
  -[NCNotificationListTouchEaterManager coalescingControlsHandlerInClearState](self, "coalescingControlsHandlerInClearState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", 0);
  v16 = v14;
  v17 = v15;
  if (v13 && (objc_msgSend(v13, "shouldReceiveTouchAtPointInWindowSpace:", v14, v15) & 1) == 0)
    objc_msgSend(v13, "resetClearButtonStateAnimated:", 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_headerViewInClearState);
  v19 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "clearButton");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "convertPoint:fromView:", 0, v16, v17);
    if ((objc_msgSend(v20, "pointInside:withEvent:", 0) & 1) == 0)
      objc_msgSend(v19, "resetClearButtonStateAnimated:", 1);

  }
  return 0;
}

- (void)_handleEatenTouchBeginStateForGestureRecognizer:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[NCNotificationListTouchEaterManager swipeInteractionInRevealedState](self, "swipeInteractionInRevealedState", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hideActionsAnimated:fastAnimation:completion:", 1, 0, 0);

  -[NCNotificationListTouchEaterManager headerViewInClearState](self, "headerViewInClearState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resetClearButtonStateAnimated:", 1);

  -[NCNotificationListTouchEaterManager coalescingControlsHandlerInClearState](self, "coalescingControlsHandlerInClearState");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resetClearButtonStateAnimated:", 1);

}

- (void)_handleEatenTouchEndStateForGestureRecognizer:(id)a3
{
  -[NCNotificationListTouchEaterManager setSwipeInteractionInRevealedState:](self, "setSwipeInteractionInRevealedState:", 0);
  -[NCNotificationListTouchEaterManager setHeaderViewInClearState:](self, "setHeaderViewInClearState:", 0);
  -[NCNotificationListTouchEaterManager setCoalescingControlsHandlerInClearState:](self, "setCoalescingControlsHandlerInClearState:", 0);
}

- (PLSwipeInteraction)swipeInteractionInRevealedState
{
  return (PLSwipeInteraction *)objc_loadWeakRetained((id *)&self->_swipeInteractionInRevealedState);
}

- (NCNotificationListSectionHeaderView)headerViewInClearState
{
  return (NCNotificationListSectionHeaderView *)objc_loadWeakRetained((id *)&self->_headerViewInClearState);
}

- (NCNotificationListCoalescingControlsHandler)coalescingControlsHandlerInClearState
{
  return (NCNotificationListCoalescingControlsHandler *)objc_loadWeakRetained((id *)&self->_coalescingControlsHandlerInClearState);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (NCTouchEaterGestureRecognizer)touchEater
{
  return self->_touchEater;
}

- (void)setTouchEater:(id)a3
{
  objc_storeStrong((id *)&self->_touchEater, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchEater, 0);
  objc_destroyWeak((id *)&self->_coalescingControlsHandlerInClearState);
  objc_destroyWeak((id *)&self->_headerViewInClearState);
  objc_destroyWeak((id *)&self->_swipeInteractionInRevealedState);
}

@end
