@implementation SBDashBoardHomeAffordanceController

- (SBDashBoardHomeAffordanceController)init
{
  SBDashBoardHomeAffordanceController *v2;
  uint64_t v3;
  SBNotificationHomeAffordanceController *notificationHomeAffordanceController;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBDashBoardHomeAffordanceController;
  v2 = -[SBDashBoardHomeAffordanceController init](&v6, sel_init);
  if (v2)
  {
    +[SBNotificationHomeAffordanceController sharedInstance](SBNotificationHomeAffordanceController, "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    notificationHomeAffordanceController = v2->_notificationHomeAffordanceController;
    v2->_notificationHomeAffordanceController = (SBNotificationHomeAffordanceController *)v3;

  }
  return v2;
}

- (UIPanGestureRecognizer)screenEdgePanGesture
{
  return (UIPanGestureRecognizer *)-[SBNotificationHomeAffordanceController screenEdgePanGesture](self->_notificationHomeAffordanceController, "screenEdgePanGesture");
}

- (BSAnimationSettings)hideHomeAffordanceAnimationSettings
{
  return -[SBNotificationHomeAffordanceController hideHomeAffordanceAnimationSettings](self->_notificationHomeAffordanceController, "hideHomeAffordanceAnimationSettings");
}

- (BSAnimationSettings)unhideHomeAffordanceAnimationSettings
{
  return -[SBNotificationHomeAffordanceController unhideHomeAffordanceAnimationSettings](self->_notificationHomeAffordanceController, "unhideHomeAffordanceAnimationSettings");
}

- (UIViewSpringAnimationBehaviorDescribing)settleHomeAffordanceAnimationBehaviorDescription
{
  return -[SBNotificationHomeAffordanceController settleHomeAffordanceAnimationBehaviorDescription](self->_notificationHomeAffordanceController, "settleHomeAffordanceAnimationBehaviorDescription");
}

- (void)registerHomeGestureParticipant:(id)a3 withIdentifier:(int64_t)a4
{
  SBDashBoardHomeAffordanceControllerClientBridge *v5;
  id object;

  object = a3;
  objc_getAssociatedObject(object, "SBDashBoardHomeAffordanceControllerParticipantKey");
  v5 = (SBDashBoardHomeAffordanceControllerClientBridge *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = -[SBDashBoardHomeAffordanceControllerClientBridge initWithCoverSheetHomeGestureParticipant:]([SBDashBoardHomeAffordanceControllerClientBridge alloc], "initWithCoverSheetHomeGestureParticipant:", object);
    objc_setAssociatedObject(object, "SBDashBoardHomeAffordanceControllerParticipantKey", v5, (void *)1);
  }
  -[SBNotificationHomeAffordanceController registerClient:withZStackIdentifier:](self->_notificationHomeAffordanceController, "registerClient:withZStackIdentifier:", v5, 14);

}

- (void)unregisterHomeGestureParticipant:(id)a3 withIdentifier:(int64_t)a4
{
  id v5;
  id v6;

  v5 = a3;
  objc_getAssociatedObject(v5, "SBDashBoardHomeAffordanceControllerParticipantKey");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SBNotificationHomeAffordanceController unregisterClient:withZStackIdentifier:](self->_notificationHomeAffordanceController, "unregisterClient:withZStackIdentifier:", v6, 14);
  objc_setAssociatedObject(v5, "SBDashBoardHomeAffordanceControllerParticipantKey", 0, (void *)1);

}

- (id)keyboardAssertionForGestureWindow:(id)a3
{
  return +[SBKeyboardHomeAffordanceAssertion assertionForGestureWindow:](SBNotificationKeyboardHomeAffordanceAssertion, "assertionForGestureWindow:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationHomeAffordanceController, 0);
}

@end
