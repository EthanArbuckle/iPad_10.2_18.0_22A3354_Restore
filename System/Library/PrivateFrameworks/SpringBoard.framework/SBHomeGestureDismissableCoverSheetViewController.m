@implementation SBHomeGestureDismissableCoverSheetViewController

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBHomeGestureDismissableCoverSheetViewController;
  -[CSCoverSheetViewControllerBase viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[SBHomeGestureDismissableCoverSheetViewController _addOrRemoveGestureForCurrentSettings](self, "_addOrRemoveGestureForCurrentSettings");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBHomeGestureDismissableCoverSheetViewController;
  -[CSCoverSheetViewControllerBase viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[SBHomeGestureDismissableCoverSheetViewController _addOrRemoveGestureForCurrentSettings](self, "_addOrRemoveGestureForCurrentSettings");
}

- (BOOL)shouldDismissForHomeGestureRecognizer:(id)a3
{
  return 1;
}

- (int64_t)zStackParticipantIdentifier
{
  return 9;
}

- (void)zStackParticipantDidChange:(id)a3
{
  int v4;
  SBHomeGesturePanGestureRecognizer *bottomEdgeRecognizer;
  id v6;

  -[CSCoverSheetViewControllerBase updateAppearanceForController:](self, "updateAppearanceForController:", self);
  +[SBSystemGestureManager mainDisplayManager](SBSystemGestureManager, "mainDisplayManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[SBFZStackParticipant ownsHomeGesture](self->_zStackParticipant, "ownsHomeGesture");
  bottomEdgeRecognizer = self->_bottomEdgeRecognizer;
  if (v4)
    objc_msgSend(v6, "addGestureRecognizer:withType:", bottomEdgeRecognizer, 93);
  else
    objc_msgSend(v6, "removeGestureRecognizer:", bottomEdgeRecognizer);

}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  objc_msgSend(a4, "setActivationPolicyForParticipantsBelow:", 2);
}

- (void)setWantsHomeGestureOwnership:(BOOL)a3
{
  if (self->_wantsHomeGestureOwnership != a3)
  {
    self->_wantsHomeGestureOwnership = a3;
    if (a3)
      -[SBHomeGestureDismissableCoverSheetViewController _requestHomeGestureOwnership](self, "_requestHomeGestureOwnership");
    else
      -[SBHomeGestureDismissableCoverSheetViewController _relinquishHomeGestureOwnership](self, "_relinquishHomeGestureOwnership");
  }
}

- (void)_requestHomeGestureOwnership
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[SBHomeGestureDismissableCoverSheetViewController zStackParticipant](self, "zStackParticipant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (!-[SBHomeGestureDismissableCoverSheetViewController zStackParticipantIdentifier](self, "zStackParticipantIdentifier"))return;
    -[SBHomeGestureDismissableCoverSheetViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_sbWindowScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "zStackResolver");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "acquireParticipantWithIdentifier:delegate:", -[SBHomeGestureDismissableCoverSheetViewController zStackParticipantIdentifier](self, "zStackParticipantIdentifier"), self);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    -[SBHomeGestureDismissableCoverSheetViewController setZStackParticipant:](self, "setZStackParticipant:", v7);
    -[CSCoverSheetViewControllerBase updateAppearanceForController:](self, "updateAppearanceForController:", self);
    v3 = v7;
  }

}

- (void)_relinquishHomeGestureOwnership
{
  void *v3;
  void *v4;

  -[SBHomeGestureDismissableCoverSheetViewController zStackParticipant](self, "zStackParticipant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SBHomeGestureDismissableCoverSheetViewController zStackParticipant](self, "zStackParticipant");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    -[SBHomeGestureDismissableCoverSheetViewController setZStackParticipant:](self, "setZStackParticipant:", 0);
  }
}

- (void)_addOrRemoveGestureForCurrentSettings
{
  int v3;
  SBHomeGesturePanGestureRecognizer *v4;
  SBHomeGesturePanGestureRecognizer *bottomEdgeRecognizer;
  SBHomeGesturePanGestureRecognizer *v6;
  id v7;

  +[SBSystemGestureManager mainDisplayManager](SBSystemGestureManager, "mainDisplayManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[SBHomeGestureDismissableCoverSheetViewController _appearState](self, "_appearState");
  if (v3 && v3 != 3 && SBHomeGestureEnabled())
  {
    if (!self->_bottomEdgeRecognizer)
    {
      +[SBHomeGesturePanGestureRecognizer homeGesturePanGestureRecognizerWithTarget:action:](SBHomeGesturePanGestureRecognizer, "homeGesturePanGestureRecognizerWithTarget:action:", self, sel__handleBottomEdgeGesture_);
      v4 = (SBHomeGesturePanGestureRecognizer *)objc_claimAutoreleasedReturnValue();
      bottomEdgeRecognizer = self->_bottomEdgeRecognizer;
      self->_bottomEdgeRecognizer = v4;

      -[UIScreenEdgePanGestureRecognizer setEdges:](self->_bottomEdgeRecognizer, "setEdges:", 4);
      -[SBHomeGesturePanGestureRecognizer setDelegate:](self->_bottomEdgeRecognizer, "setDelegate:", self);
      -[SBHomeGesturePanGestureRecognizer setAllowedTouchTypes:](self->_bottomEdgeRecognizer, "setAllowedTouchTypes:", &unk_1E91CE2C0);
      -[SBHomeGestureDismissableCoverSheetViewController setWantsHomeGestureOwnership:](self, "setWantsHomeGestureOwnership:", 1);
      if (-[SBFZStackParticipant ownsHomeGesture](self->_zStackParticipant, "ownsHomeGesture"))
        objc_msgSend(v7, "addGestureRecognizer:withType:", self->_bottomEdgeRecognizer, 93);
    }
  }
  else if (self->_bottomEdgeRecognizer)
  {
    objc_msgSend(v7, "removeGestureRecognizer:");
    v6 = self->_bottomEdgeRecognizer;
    self->_bottomEdgeRecognizer = 0;

    -[SBHomeGestureDismissableCoverSheetViewController setWantsHomeGestureOwnership:](self, "setWantsHomeGestureOwnership:", 0);
  }

}

- (void)_handleBottomEdgeGesture:(id)a3
{
  uint64_t v4;
  BOOL v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = objc_msgSend(v7, "state");
  if ((unint64_t)(v4 - 3) >= 3)
  {
    if (v4 == 2)
    {
      -[SBHomeGestureDismissableCoverSheetViewController _handleBottomEdgeGestureChanged:](self, "_handleBottomEdgeGestureChanged:", v7);
    }
    else
    {
      v5 = v4 == 1;
      v6 = v7;
      if (!v5)
        goto LABEL_9;
      -[SBHomeGestureDismissableCoverSheetViewController _handleBottomEdgeGestureBegan:](self, "_handleBottomEdgeGestureBegan:", v7);
    }
  }
  else
  {
    -[SBHomeGestureDismissableCoverSheetViewController _handleBottomEdgeGestureEnded:](self, "_handleBottomEdgeGestureEnded:", v7);
  }
  v6 = v7;
LABEL_9:

}

- (void)_handleBottomEdgeGestureEnded:(id)a3
{
  if (self->_bottomEdgeRecognizer == a3)
  {
    if (-[SBHomeGestureDismissableCoverSheetViewController shouldDismissForHomeGestureRecognizer:](self, "shouldDismissForHomeGestureRecognizer:"))
    {
      -[CSCoverSheetViewControllerBase dismiss](self, "dismiss");
    }
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  -[SBHomeGestureDismissableCoverSheetViewController view](self, "view", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_sbWindowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "zStackResolver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeGestureDismissableCoverSheetViewController zStackParticipant](self, "zStackParticipant");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "ownsHomeGesture");

  if (v6)
    return v8;
  else
    return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  return self->_bottomEdgeRecognizer == a3
      && -[CSCoverSheetViewControllerBase participantState](self, "participantState") == 2;
}

- (SBHomeGesturePanGestureRecognizer)bottomEdgeRecognizer
{
  return self->_bottomEdgeRecognizer;
}

- (void)setBottomEdgeRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_bottomEdgeRecognizer, a3);
}

- (BOOL)wantsHomeGestureOwnership
{
  return self->_wantsHomeGestureOwnership;
}

- (SBFZStackParticipant)zStackParticipant
{
  return self->_zStackParticipant;
}

- (void)setZStackParticipant:(id)a3
{
  objc_storeStrong((id *)&self->_zStackParticipant, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zStackParticipant, 0);
  objc_storeStrong((id *)&self->_bottomEdgeRecognizer, 0);
}

@end
