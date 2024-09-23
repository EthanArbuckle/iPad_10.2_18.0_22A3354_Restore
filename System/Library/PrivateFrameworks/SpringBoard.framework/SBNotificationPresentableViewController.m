@implementation SBNotificationPresentableViewController

- (void)longLookWillPresentForNotificationViewController:(id)a3
{
  id WeakRetained;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBNotificationPresentableViewController;
  -[NCNotificationPresentableViewController longLookWillPresentForNotificationViewController:](&v5, sel_longLookWillPresentForNotificationViewController_, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_homeGestureContext);
  objc_msgSend(WeakRetained, "setWantsHomeGesture:", 1);

}

- (void)longLookDidPresentForNotificationViewController:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double MaxY;
  objc_super v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SBNotificationPresentableViewController;
  -[NCNotificationPresentableViewController longLookDidPresentForNotificationViewController:](&v21, sel_longLookDidPresentForNotificationViewController_, v4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_homeGestureContext);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "platterBarSwipeAffordanceViewForParticipant:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:", self);
    objc_msgSend(v4, "containerViewForExpandedContent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v6);
    objc_msgSend(v7, "bounds");
    x = v22.origin.x;
    y = v22.origin.y;
    width = v22.size.width;
    height = v22.size.height;
    CGRectGetWidth(v22);
    objc_msgSend(v6, "sizeThatFits:", width, height);
    BSRectWithSize();
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v23.origin.x = x;
    v23.origin.y = y;
    v23.size.width = width;
    v23.size.height = height;
    MaxY = CGRectGetMaxY(v23);
    v24.origin.x = v13;
    v24.origin.y = v15;
    v24.size.width = v17;
    v24.size.height = v19;
    objc_msgSend(v6, "setFrame:", v13, MaxY - CGRectGetHeight(v24), v17, v19);
    objc_msgSend(v6, "setAutoresizingMask:", 10);

  }
}

- (void)longLookWillDismissForNotificationViewController:(id)a3
{
  id WeakRetained;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBNotificationPresentableViewController;
  -[NCNotificationPresentableViewController longLookWillDismissForNotificationViewController:](&v5, sel_longLookWillDismissForNotificationViewController_, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_homeGestureContext);
  objc_msgSend(WeakRetained, "setWantsHomeGesture:", 0);

}

- (BOOL)handleHomeButtonPress
{
  void *v2;
  char v3;

  -[NCNotificationPresentableViewController delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "handleHomeButtonPress");
  else
    v3 = 0;

  return v3;
}

- (BOOL)handleHomeButtonDoublePress
{
  void *v2;
  char v3;

  -[NCNotificationPresentableViewController delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "handleHomeButtonDoublePress");
  else
    v3 = 0;

  return v3;
}

- (BOOL)handleHomeButtonLongPress
{
  void *v2;
  char v3;

  -[NCNotificationPresentableViewController delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "handleHomeButtonLongPress");
  else
    v3 = 0;

  return v3;
}

- (BOOL)handleLockButtonPress
{
  void *v2;
  char v3;

  -[NCNotificationPresentableViewController delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "handleLockButtonPress");
  else
    v3 = 0;

  return v3;
}

- (BOOL)handleVoiceCommandButtonPress
{
  void *v2;
  char v3;

  -[NCNotificationPresentableViewController delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "handleVoiceCommandButtonPress");
  else
    v3 = 0;

  return v3;
}

- (BOOL)handleVolumeUpButtonPress
{
  void *v2;
  char v3;

  -[NCNotificationPresentableViewController delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "handleVolumeUpButtonPress");
  else
    v3 = 0;

  return v3;
}

- (BOOL)handleVolumeDownButtonPress
{
  void *v2;
  char v3;

  -[NCNotificationPresentableViewController delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "handleVolumeDownButtonPress");
  else
    v3 = 0;

  return v3;
}

- (BOOL)handleHeadsetButtonPress:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  char v5;

  v3 = a3;
  -[NCNotificationPresentableViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(v4, "handleHeadsetButtonPress:", v3);
  else
    v5 = 0;

  return v5;
}

- (BOOL)shouldAcquireWindowLevelAssertion
{
  void *v2;
  char v3;

  -[NCNotificationPresentableViewController delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "shouldAcquireWindowLevelAssertion");
  else
    v3 = 0;

  return v3;
}

- (BOOL)shouldDismissForReason:(id)a3 outReason:(id *)a4
{
  id v6;
  void *v7;
  char v8;

  v6 = a3;
  -[NCNotificationPresentableViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = objc_msgSend(v7, "shouldDismissForReason:outReason:", v6, a4);
  else
    v8 = 1;

  return v8;
}

- (void)homeGesturePerformedForBarSwipeAffordanceView:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  -[NCNotificationPresentableViewController notificationViewController](self, "notificationViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentedExpandedPlatterViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = v6;
    objc_msgSend(v4, "dismisser");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "expandedPlatterPresentable:requestsDismissalWithTrigger:", v4, 2);

  }
}

- (SBUIPresentableHomeGestureContext)homeGestureContext
{
  return (SBUIPresentableHomeGestureContext *)objc_loadWeakRetained((id *)&self->_homeGestureContext);
}

- (void)setHomeGestureContext:(id)a3
{
  objc_storeWeak((id *)&self->_homeGestureContext, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_homeGestureContext);
}

@end
