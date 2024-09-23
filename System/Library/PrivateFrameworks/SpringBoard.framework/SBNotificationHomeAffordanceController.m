@implementation SBNotificationHomeAffordanceController

+ (SBNotificationHomeAffordanceController)sharedInstance
{
  if (sharedInstance_onceToken_56 != -1)
    dispatch_once(&sharedInstance_onceToken_56, &__block_literal_global_390);
  return (SBNotificationHomeAffordanceController *)(id)sharedInstance___sharedInstance_27;
}

void __56__SBNotificationHomeAffordanceController_sharedInstance__block_invoke()
{
  SBNotificationHomeAffordanceController *v0;
  void *v1;

  if (SBHomeGestureEnabled())
    v0 = objc_alloc_init(SBNotificationHomeAffordanceController);
  else
    v0 = 0;
  v1 = (void *)sharedInstance___sharedInstance_27;
  sharedInstance___sharedInstance_27 = (uint64_t)v0;

}

- (SBScreenEdgePanGestureRecognizer)screenEdgePanGesture
{
  SBHomeGesturePanGestureRecognizer *screenEdgePanGesture;
  SBHomeGesturePanGestureRecognizer *v4;
  SBHomeGesturePanGestureRecognizer *v5;
  void *v6;

  screenEdgePanGesture = self->_screenEdgePanGesture;
  if (!screenEdgePanGesture)
  {
    +[SBHomeGesturePanGestureRecognizer homeGesturePanGestureRecognizerWithTarget:action:](SBHomeGesturePanGestureRecognizer, "homeGesturePanGestureRecognizerWithTarget:action:", 0, 0);
    v4 = (SBHomeGesturePanGestureRecognizer *)objc_claimAutoreleasedReturnValue();
    v5 = self->_screenEdgePanGesture;
    self->_screenEdgePanGesture = v4;

    +[SBSystemGestureManager mainDisplayManager](SBSystemGestureManager, "mainDisplayManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addGestureRecognizer:withType:", self->_screenEdgePanGesture, 5);
    -[UIScreenEdgePanGestureRecognizer setEdges:](self->_screenEdgePanGesture, "setEdges:", 4);
    -[SBHomeGesturePanGestureRecognizer setAllowedTouchTypes:](self->_screenEdgePanGesture, "setAllowedTouchTypes:", &unk_1E91CF520);
    -[SBHomeGesturePanGestureRecognizer setEnabled:](self->_screenEdgePanGesture, "setEnabled:", 0);

    screenEdgePanGesture = self->_screenEdgePanGesture;
  }
  return (SBScreenEdgePanGestureRecognizer *)screenEdgePanGesture;
}

- (BSAnimationSettings)hideHomeAffordanceAnimationSettings
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DA9E28], "rootSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hideForHomeGestureOwnershipAnimationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "BSAnimationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (BSAnimationSettings *)v4;
}

- (BSAnimationSettings)unhideHomeAffordanceAnimationSettings
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DA9E28], "rootSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unhideForHomeGestureOwnershipAnimationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "BSAnimationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (BSAnimationSettings *)v4;
}

- (UIViewSpringAnimationBehaviorDescribing)settleHomeAffordanceAnimationBehaviorDescription
{
  void *v2;
  void *v3;
  void *v4;

  +[SBAppSwitcherDomain rootSettings](SBAppSwitcherDomain, "rootSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "animationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertBarSwipeDismissalSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIViewSpringAnimationBehaviorDescribing *)v4;
}

- (void)registerClient:(id)a3 withZStackIdentifier:(int64_t)a4
{
  NSMapTable *clientsToZStackParticipants;
  NSMapTable *v8;
  NSMapTable *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBNotificationHomeAffordanceController.m"), 65, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("client"));

  }
  if (a4 != 14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBNotificationHomeAffordanceController.m"), 66, CFSTR("identifier out of range: %lu"), a4);

  }
  clientsToZStackParticipants = self->_clientsToZStackParticipants;
  if (!clientsToZStackParticipants)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v8 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v9 = self->_clientsToZStackParticipants;
    self->_clientsToZStackParticipants = v8;

    clientsToZStackParticipants = self->_clientsToZStackParticipants;
  }
  -[NSMapTable keyEnumerator](clientsToZStackParticipants, "keyEnumerator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = 0;
  while (1)
  {
    v13 = v12;
    objc_msgSend(v10, "nextObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      break;
    -[NSMapTable objectForKey:](self->_clientsToZStackParticipants, "objectForKey:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v14;
    if (objc_msgSend(v14, "identifier") == a4)
    {
      -[NSMapTable setObject:forKey:](self->_clientsToZStackParticipants, "setObject:forKey:", v14, v21);
      if (v14)
        goto LABEL_16;
      goto LABEL_13;
    }
  }
  v14 = v11;
  if (v11)
    goto LABEL_16;
LABEL_13:
  objc_msgSend((id)SBApp, "windowSceneManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "embeddedDisplayWindowScene");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "zStackResolver");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "acquireParticipantWithIdentifier:delegate:", a4, self);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[NSMapTable setObject:forKey:](self->_clientsToZStackParticipants, "setObject:forKey:", v14, v21);
    if (objc_msgSend(v14, "ownsHomeGesture"))
      -[SBNotificationHomeAffordanceController zStackParticipantDidChange:](self, "zStackParticipantDidChange:", v14);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBNotificationHomeAffordanceController.m"), 87, CFSTR("Failed to receive a participant from the resolver"));

  }
LABEL_16:

}

- (void)unregisterClient:(id)a3 withZStackIdentifier:(int64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v7 = a3;
  v11 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBNotificationHomeAffordanceController.m"), 98, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("client"));

    v7 = 0;
  }
  if (a4 != 14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBNotificationHomeAffordanceController.m"), 99, CFSTR("identifier out of range: %lu"), a4);

    v7 = v11;
  }
  -[NSMapTable objectForKey:](self->_clientsToZStackParticipants, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "invalidate");
  -[NSMapTable removeObjectForKey:](self->_clientsToZStackParticipants, "removeObjectForKey:", v11);
  if (!-[NSMapTable count](self->_clientsToZStackParticipants, "count"))
    -[SBHomeGesturePanGestureRecognizer setEnabled:](self->_screenEdgePanGesture, "setEnabled:", 0);

}

- (void)zStackParticipantDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  -[NSMapTable keyEnumerator](self->_clientsToZStackParticipants, "keyEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nextObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    LOBYTE(v7) = 0;
    do
    {
      -[NSMapTable objectForKey:](self->_clientsToZStackParticipants, "objectForKey:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if ((v7 & 1) != 0)
        v7 = 1;
      else
        v7 = objc_msgSend(v8, "ownsHomeGesture");
      if (v9 == v12)
        objc_msgSend(v6, "zStackParticipantDidChange:", v12);

      objc_msgSend(v4, "nextObject");
      v10 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v10;
    }
    while (v10);
  }
  else
  {
    v7 = 0;
  }
  -[SBNotificationHomeAffordanceController screenEdgePanGesture](self, "screenEdgePanGesture");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEnabled:", v7);

}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  objc_msgSend(a4, "setActivationPolicyForParticipantsBelow:", 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenEdgePanGesture, 0);
  objc_storeStrong((id *)&self->_clientsToZStackParticipants, 0);
}

@end
