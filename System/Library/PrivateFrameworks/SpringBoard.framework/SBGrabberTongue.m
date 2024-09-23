@implementation SBGrabberTongue

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  UIPanGestureRecognizer *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  char v15;
  int v16;

  v6 = (UIPanGestureRecognizer *)a3;
  v7 = a4;
  -[UIPanGestureRecognizer view](v6, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "locationInView:", v8);
  v10 = v9;
  v12 = v11;

  -[UIView _sbWindowScene](self->_containingView, "_sbWindowScene");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pictureInPictureManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isPointWithinAnyPictureInPictureContent:", v10, v12);

  if ((v15 & 1) != 0
    || (UIPanGestureRecognizer *)self->_tapGestureRecognizer == v6
    && (self->_inPullGesture || self->_inShowTongueGesture || self->_inDismissTongueGesture)
    || !-[SBGrabberTongue _shouldReceiveTouch:](self, "_shouldReceiveTouch:", v7))
  {
    LOBYTE(v16) = 0;
  }
  else if (self->_edgePullGestureRecognizer == v6 || (UIPanGestureRecognizer *)self->_tapGestureRecognizer == v6)
  {
    v16 = objc_msgSend(v7, "_isPointerTouch") ^ 1;
  }
  else
  {
    LOBYTE(v16) = 1;
  }

  return v16;
}

- (BOOL)_shouldReceiveTouch:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    v6 = objc_msgSend(WeakRetained, "grabberTongue:shouldReceiveTouch:", self, v4);
  else
    v6 = 1;

  return v6;
}

- (BOOL)isVisible
{
  return self->_tongueVisible;
}

- (unint64_t)screenEdge
{
  return self->_screenEdge;
}

- (double)edgeLocationForTouch:(id)a3
{
  double v4;
  double v5;
  double v6;
  double result;

  _UISystemGestureLocationForTouchInView();
  v6 = v5;
  result = 0.0;
  switch(self->_screenEdge)
  {
    case 1uLL:
    case 4uLL:
      result = v6;
      break;
    case 2uLL:
    case 8uLL:
      result = v4;
      break;
    default:
      return result;
  }
  return result;
}

- (id)edgePullGestureRecognizer
{
  return self->_edgePullGestureRecognizer;
}

- (SBGrabberTongue)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBGrabberTongue.m"), 89, CFSTR("use initWithDelegate:..."));

  return 0;
}

- (SBGrabberTongue)initWithDelegate:(id)a3 edge:(unint64_t)a4 type:(unint64_t)a5 windowScene:(id)a6
{
  id v11;
  id v12;
  SBGrabberTongue *v13;
  SBGrabberTongue *v14;
  void *v16;
  objc_super v17;

  v11 = a3;
  v12 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBGrabberTongue.m"), 94, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

  }
  v17.receiver = self;
  v17.super_class = (Class)SBGrabberTongue;
  v13 = -[SBGrabberTongue init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_delegate, v11);
    v14->_screenEdge = a4;
    v14->_systemGestureType = a5;
    objc_storeWeak((id *)&v14->_windowScene, v12);
    v14->_gestureStartTime = -1.79769313e308;
  }

  return v14;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (!self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBGrabberTongue.m"), 106, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_invalidated"));

  }
  -[UIPanGestureRecognizer setDelegate:](self->_edgePullGestureRecognizer, "setDelegate:", 0);
  -[SBIndirectPanGestureRecognizer setDelegate:](self->_indirectEdgePullGestureRecognizer, "setDelegate:", 0);
  -[UITapGestureRecognizer setDelegate:](self->_tapGestureRecognizer, "setDelegate:", 0);
  v5.receiver = self;
  v5.super_class = (Class)SBGrabberTongue;
  -[SBGrabberTongue dealloc](&v5, sel_dealloc);
}

- (void)invalidate
{
  -[SBGrabberTongue uninstall](self, "uninstall");
  objc_storeWeak((id *)&self->_delegate, 0);
  self->_invalidated = 1;
}

- (void)installInView:(id)a3 withColorStyle:(int64_t)a4
{
  UIView *v7;
  UIView *containingView;
  void *v9;
  UIView *v10;

  v7 = (UIView *)a3;
  if (self->_containingView)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBGrabberTongue.m"), 120, CFSTR("Can't install more than once"));

  }
  containingView = self->_containingView;
  self->_containingView = v7;
  v10 = v7;

  -[SBGrabberTongue _createTongueAndGestureRecognizersIfNecessaryWithColorStyle:](self, "_createTongueAndGestureRecognizersIfNecessaryWithColorStyle:", a4);
  -[UIView setAccessibilityIdentifier:](self->_tongueContainer, "setAccessibilityIdentifier:", CFSTR("sb-grabber-tongue"));
  -[UIView addSubview:](self->_containingView, "addSubview:", self->_tongueContainer);

}

- (void)uninstall
{
  _UIBackdropView *tongueBackdropView;
  UIImageView *tongueChevron;
  UIView *tongueContainer;
  id WeakRetained;
  UIPanGestureRecognizer *edgePullGestureRecognizer;
  SBIndirectPanGestureRecognizer *indirectEdgePullGestureRecognizer;
  UITapGestureRecognizer *tapGestureRecognizer;
  UIView *containingView;
  id v11;

  if (self->_tongueContainer)
  {
    tongueBackdropView = self->_tongueBackdropView;
    self->_tongueBackdropView = 0;

    tongueChevron = self->_tongueChevron;
    self->_tongueChevron = 0;

    -[UIView removeFromSuperview](self->_tongueContainer, "removeFromSuperview");
    tongueContainer = self->_tongueContainer;
    self->_tongueContainer = 0;

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "systemGestureManager");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "removeGestureRecognizer:", self->_edgePullGestureRecognizer);
  -[UIPanGestureRecognizer setDelegate:](self->_edgePullGestureRecognizer, "setDelegate:", 0);
  edgePullGestureRecognizer = self->_edgePullGestureRecognizer;
  self->_edgePullGestureRecognizer = 0;

  objc_msgSend(v11, "removeGestureRecognizer:", self->_indirectEdgePullGestureRecognizer);
  -[SBIndirectPanGestureRecognizer setDelegate:](self->_indirectEdgePullGestureRecognizer, "setDelegate:", 0);
  indirectEdgePullGestureRecognizer = self->_indirectEdgePullGestureRecognizer;
  self->_indirectEdgePullGestureRecognizer = 0;

  objc_msgSend(v11, "removeGestureRecognizer:", self->_tapGestureRecognizer);
  -[UITapGestureRecognizer setDelegate:](self->_tapGestureRecognizer, "setDelegate:", 0);
  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = 0;

  containingView = self->_containingView;
  self->_containingView = 0;

}

- (void)presentAnimated:(BOOL)a3
{
  -[SBGrabberTongue _presentTongueAnimated:autoDismiss:](self, "_presentTongueAnimated:autoDismiss:", a3, 1);
}

- (BOOL)dismissWithStyle:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL4 tongueVisible;

  tongueVisible = self->_tongueVisible;
  if (self->_tongueVisible)
    -[SBGrabberTongue _dismissTongueWithStyle:animated:](self, "_dismissTongueWithStyle:animated:", a3, a4);
  return tongueVisible;
}

- (id)indirectEdgePullGestureRecognizer
{
  return self->_indirectEdgePullGestureRecognizer;
}

- (double)distanceFromEdge
{
  double result;

  -[SBGrabberTongue _distanceFromEdgeForRecognizer:](self, "_distanceFromEdgeForRecognizer:", self->_edgePullGestureRecognizer);
  return result;
}

- (double)edgeOrientedVelocity
{
  double result;

  -[SBGrabberTongue _edgeOrientedVelocityForRecognizer:](self, "_edgeOrientedVelocityForRecognizer:", self->_edgePullGestureRecognizer);
  return result;
}

- (BOOL)isEdgeLocationInGrabberRegion:(double)a3
{
  double v4;

  -[SBGrabberTongue _centerOnScreenEdge](self, "_centerOnScreenEdge");
  return v4 + 48.0 >= a3 && v4 + -48.0 <= a3;
}

- (BOOL)_tongueOrPullEnabledForGestureRecognizer:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  char v7;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = WeakRetained;
  if (WeakRetained)
    v7 = objc_msgSend(WeakRetained, "grabberTongueOrPullEnabled:forGestureRecognizer:", self, v4);
  else
    v7 = 0;

  return v7;
}

- (BOOL)_shouldShowTongueOnFirstSwipeWithRecognizer:(id)a3
{
  SBIndirectPanGestureRecognizer *v4;
  id WeakRetained;
  void *v6;
  char v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v4 = (SBIndirectPanGestureRecognizer *)a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = WeakRetained;
  if (self->_indirectEdgePullGestureRecognizer == v4 || WeakRetained == 0)
  {
    v8 = 0;
  }
  else
  {
    _UISystemGestureLocationInView();
    v11 = v10;
    v12 = 0.0;
    switch(self->_screenEdge)
    {
      case 1uLL:
      case 4uLL:
        v12 = v11;
        break;
      case 2uLL:
      case 8uLL:
        v12 = v9;
        break;
      default:
        break;
    }
    v8 = objc_msgSend(v6, "grabberTongue:shouldShowTongueOnFirstSwipeWithEdgeLocation:", self, v12);
  }

  return v8;
}

- (BOOL)_shouldAllowSecondSwipeWithRecognizer:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  double v7;
  double v8;
  double v9;
  double v10;
  char v11;
  BOOL v12;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
    v6 = objc_opt_respondsToSelector();
  else
    v6 = 0;
  _UISystemGestureLocationInView();
  v9 = v8;
  v10 = 0.0;
  switch(self->_screenEdge)
  {
    case 1uLL:
    case 4uLL:
      v10 = v9;
      goto LABEL_6;
    case 2uLL:
    case 8uLL:
      v10 = v7;
      if ((v6 & 1) == 0)
        goto LABEL_9;
      goto LABEL_7;
    default:
LABEL_6:
      if ((v6 & 1) != 0)
LABEL_7:
        v11 = objc_msgSend(WeakRetained, "grabberTongue:shouldAllowSecondSwipeWithEdgeLocation:", self, v10);
      else
LABEL_9:
        v11 = -[SBGrabberTongue isEdgeLocationInGrabberRegion:](self, "isEdgeLocationInGrabberRegion:", v10);
      v12 = v11;

      return v12;
  }
}

- (BOOL)_shouldSecondSwipeDismissTongueWithRecognizer:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  double v7;
  double v8;
  double v9;
  double v10;
  char v11;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
    v6 = objc_opt_respondsToSelector();
  else
    v6 = 0;
  _UISystemGestureLocationInView();
  v9 = v8;
  v10 = 0.0;
  switch(self->_screenEdge)
  {
    case 1uLL:
    case 4uLL:
      v10 = v9;
      goto LABEL_6;
    case 2uLL:
    case 8uLL:
      v10 = v7;
      if ((v6 & 1) == 0)
        goto LABEL_9;
      goto LABEL_7;
    default:
LABEL_6:
      if ((v6 & 1) != 0)
LABEL_7:
        v11 = objc_msgSend(WeakRetained, "grabberTongue:shouldDismissTongueOnSecondSwipeWithEdgeLocation:", self, v10);
      else
LABEL_9:
        v11 = 1;

      return v11;
  }
}

- (double)_ambiguousActivationMargin
{
  void *v2;
  void *v3;
  void *v4;
  double result;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!SBWorkspaceHasApplicationSceneInLockedOrUnlockedEnvironmentLayoutState())
    goto LABEL_6;
  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transientOverlayPresentationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hasActivePresentation") & 1) != 0)
    goto LABEL_5;
  +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isVisible"))
  {

LABEL_5:
LABEL_6:
    objc_msgSend((id)SBApp, "bottomEdgeAmbiguousActivationMargin");
    return result;
  }
  +[SBMainSwitcherControllerCoordinator sharedInstance](SBMainSwitcherControllerCoordinator, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isAnySwitcherVisible");

  if ((v7 & 1) != 0)
    goto LABEL_6;
  SBWorkspaceApplicationSceneHandlesInLockedOrUnlockedEnvironmentLayoutState();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    v12 = 0.0;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "sceneIfExists");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
        {
          objc_msgSend(v14, "uiClientSettings");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "controlCenterAmbiguousActivationMargin");
          v18 = v17;

          if (v18 >= v12)
            v12 = v18;
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }
  else
  {
    v12 = 0.0;
  }

  return v12;
}

- (double)_ambiguousActivationMarginIfHonored
{
  id WeakRetained;
  double v4;
  double v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = 0.0;
  if (WeakRetained
    && (objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(WeakRetained, "grabberTongueHonorsAmbiguousActivationMargin:", self))
  {
    -[SBGrabberTongue _ambiguousActivationMargin](self, "_ambiguousActivationMargin");
    v4 = v5;
  }

  return v4;
}

- (double)_centerOnScreenEdge
{
  unint64_t v2;
  uint64_t v3;

  v2 = self->_screenEdge & 5;
  -[UIView bounds](self->_containingView, "bounds");
  if (v2)
    return CGRectGetMidX(*(CGRect *)&v3);
  else
    return CGRectGetMidY(*(CGRect *)&v3);
}

- (void)_pullGestureBegan:(id)a3
{
  id WeakRetained;
  double v5;
  double v6;
  double v7;
  id v8;

  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SBGrabberTongue _distanceFromEdgeForRecognizer:](self, "_distanceFromEdgeForRecognizer:", v8);
    v6 = v5;
    -[SBGrabberTongue _edgeOrientedVelocityForRecognizer:](self, "_edgeOrientedVelocityForRecognizer:", v8);
    objc_msgSend(WeakRetained, "grabberTongueBeganPulling:withDistance:andVelocity:andGesture:", self, v8, v6, v7);
  }

}

- (void)_pullGestureUpdated:(id)a3
{
  id WeakRetained;
  double v5;
  double v6;
  double v7;
  id v8;

  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SBGrabberTongue _distanceFromEdgeForRecognizer:](self, "_distanceFromEdgeForRecognizer:", v8);
    v6 = v5;
    -[SBGrabberTongue _edgeOrientedVelocityForRecognizer:](self, "_edgeOrientedVelocityForRecognizer:", v8);
    objc_msgSend(WeakRetained, "grabberTongueUpdatedPulling:withDistance:andVelocity:andGesture:", self, v8, v6, v7);
  }

}

- (void)_pullGestureEnded:(id)a3
{
  id WeakRetained;
  double v5;
  double v6;
  double v7;
  id v8;

  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SBGrabberTongue _distanceFromEdgeForRecognizer:](self, "_distanceFromEdgeForRecognizer:", v8);
    v6 = v5;
    -[SBGrabberTongue _edgeOrientedVelocityForRecognizer:](self, "_edgeOrientedVelocityForRecognizer:", v8);
    objc_msgSend(WeakRetained, "grabberTongueEndedPulling:withDistance:andVelocity:andGesture:", self, v8, v6, v7);
  }

}

- (void)_pullGestureCanceled:(id)a3
{
  id WeakRetained;
  double v5;
  double v6;
  double v7;
  id v8;

  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SBGrabberTongue _distanceFromEdgeForRecognizer:](self, "_distanceFromEdgeForRecognizer:", v8);
    v6 = v5;
    -[SBGrabberTongue _edgeOrientedVelocityForRecognizer:](self, "_edgeOrientedVelocityForRecognizer:", v8);
    objc_msgSend(WeakRetained, "grabberTongueCanceledPulling:withDistance:andVelocity:andGesture:", self, v8, v6, v7);
  }

}

- (void)_willPresent
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "grabberTongueWillPresent:", self);

}

- (void)_willDismiss
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "grabberTongueWillDismiss:", self);

}

- (void)_didDismiss
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "grabberTongueDidDismiss:", self);

}

- (void)_willPresentInteractively:(id)a3
{
  id WeakRetained;
  double v5;
  double v6;
  double v7;
  id v8;

  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SBGrabberTongue _distanceFromEdgeForRecognizer:](self, "_distanceFromEdgeForRecognizer:", v8);
    v6 = v5;
    -[SBGrabberTongue _edgeOrientedVelocityForRecognizer:](self, "_edgeOrientedVelocityForRecognizer:", v8);
    objc_msgSend(WeakRetained, "grabberTongueWillPresentInteractively:withDistance:andVelocity:", self, v6, v7);
  }

}

- (void)_didPresentInteractively:(id)a3
{
  id WeakRetained;
  double v5;
  double v6;
  double v7;
  id v8;

  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SBGrabberTongue _distanceFromEdgeForRecognizer:](self, "_distanceFromEdgeForRecognizer:", v8);
    v6 = v5;
    -[SBGrabberTongue _edgeOrientedVelocityForRecognizer:](self, "_edgeOrientedVelocityForRecognizer:", v8);
    objc_msgSend(WeakRetained, "grabberTongueDidPresentInteractively:withDistance:andVelocity:", self, v6, v7);
  }

}

- (void)_createTongueAndGestureRecognizersIfNecessaryWithColorStyle:(int64_t)a3
{
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  objc_class *v9;
  void *v10;
  UIPanGestureRecognizer *v11;
  UIPanGestureRecognizer *edgePullGestureRecognizer;
  UIPanGestureRecognizer *v13;
  void *v14;
  UITapGestureRecognizer *v15;
  UITapGestureRecognizer *tapGestureRecognizer;
  UITapGestureRecognizer *v17;
  void *v18;
  unint64_t systemGestureType;
  uint64_t v20;
  id v21;
  SBIndirectPanGestureRecognizer *v22;
  SBIndirectPanGestureRecognizer *indirectEdgePullGestureRecognizer;
  SBIndirectPanGestureRecognizer *v24;
  UIView *tongueContainer;
  UIView *v26;
  UIView *v27;
  void *v28;
  _UIBackdropView *v29;
  _UIBackdropView *tongueBackdropView;
  UIImageView *v31;
  UIImageView *tongueChevron;
  id v33;

  if (self->_tongueContainer)
    return;
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "systemGestureManager");
  v33 = (id)objc_claimAutoreleasedReturnValue();

  -[SBGrabberTongue name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v8;

  -[SBGrabberTongue _createEdgePullGestureRecognizerWithAction:](self, "_createEdgePullGestureRecognizerWithAction:", sel__handlePullGesture_);
  v11 = (UIPanGestureRecognizer *)objc_claimAutoreleasedReturnValue();
  edgePullGestureRecognizer = self->_edgePullGestureRecognizer;
  self->_edgePullGestureRecognizer = v11;

  v13 = self->_edgePullGestureRecognizer;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-edgePullGestureRecognizer-%X"), v10, self->_screenEdge);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPanGestureRecognizer setName:](v13, "setName:", v14);

  -[UIPanGestureRecognizer setDelegate:](self->_edgePullGestureRecognizer, "setDelegate:", self);
  -[UIPanGestureRecognizer setCancelsTouchesInView:](self->_edgePullGestureRecognizer, "setCancelsTouchesInView:", 0);
  -[UIPanGestureRecognizer setAllowedTouchTypes:](self->_edgePullGestureRecognizer, "setAllowedTouchTypes:", &unk_1E91CEE48);
  objc_msgSend(v33, "addGestureRecognizer:withType:", self->_edgePullGestureRecognizer, self->_systemGestureType);
  -[SBGrabberTongue _createTapGestureRecognizerWithAction:](self, "_createTapGestureRecognizerWithAction:", sel__handleTapped_);
  v15 = (UITapGestureRecognizer *)objc_claimAutoreleasedReturnValue();
  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = v15;

  v17 = self->_tapGestureRecognizer;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-tapGestureRecognizer-%X"), v10, self->_screenEdge);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITapGestureRecognizer setName:](v17, "setName:", v18);

  -[UITapGestureRecognizer setDelegate:](self->_tapGestureRecognizer, "setDelegate:", self);
  -[UITapGestureRecognizer setCancelsTouchesInView:](self->_tapGestureRecognizer, "setCancelsTouchesInView:", 0);
  -[UITapGestureRecognizer setAllowedTouchTypes:](self->_tapGestureRecognizer, "setAllowedTouchTypes:", &unk_1E91CEE60);
  systemGestureType = self->_systemGestureType;
  if (systemGestureType == 25)
  {
    v20 = 27;
    goto LABEL_9;
  }
  if (systemGestureType == 26)
  {
    v20 = 28;
LABEL_9:
    objc_msgSend(v33, "addGestureRecognizer:withType:", self->_tapGestureRecognizer, v20);
  }
  v21 = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v21, "indirectPanGestureRecognizerForGrabberTongue:", self);
    v22 = (SBIndirectPanGestureRecognizer *)objc_claimAutoreleasedReturnValue();
    indirectEdgePullGestureRecognizer = self->_indirectEdgePullGestureRecognizer;
    self->_indirectEdgePullGestureRecognizer = v22;

  }
  v24 = self->_indirectEdgePullGestureRecognizer;
  if (v24)
  {
    -[SBIndirectPanGestureRecognizer setDelegate:](v24, "setDelegate:", self);
    -[SBIndirectPanGestureRecognizer addTarget:action:](self->_indirectEdgePullGestureRecognizer, "addTarget:action:", self, sel__handlePullGesture_);
    objc_msgSend(v33, "addGestureRecognizer:withType:", self->_indirectEdgePullGestureRecognizer, objc_msgSend(v21, "indirectPanSystemGestureTypeForGrabberTongue:", self));
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v21, "shouldSuppressTongueViewForGrabberTongue:", self))
  {
    tongueContainer = self->_tongueContainer;
    self->_tongueContainer = 0;

  }
  else
  {
    v26 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", 0.0, 0.0, 96.0, 30.0);
    v27 = self->_tongueContainer;
    self->_tongueContainer = v26;

    -[UIView setClipsToBounds:](self->_tongueContainer, "setClipsToBounds:", 1);
    -[UIView setOpaque:](self->_tongueContainer, "setOpaque:", 0);
    -[UIView setUserInteractionEnabled:](self->_tongueContainer, "setUserInteractionEnabled:", 1);
    -[UIView _setContinuousCornerRadius:](self->_tongueContainer, "_setContinuousCornerRadius:", 13.0);
    -[UIView layer](self->_tongueContainer, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setMaskedCorners:", 12);

    v29 = -[SBGrabberTongue _newBackdropViewWithColorStyle:](self, "_newBackdropViewWithColorStyle:", a3);
    tongueBackdropView = self->_tongueBackdropView;
    self->_tongueBackdropView = v29;

    v31 = -[SBGrabberTongue _newChevronView](self, "_newChevronView");
    tongueChevron = self->_tongueChevron;
    self->_tongueChevron = v31;

    -[UIView addSubview:](self->_tongueContainer, "addSubview:", self->_tongueBackdropView);
    -[UIView addSubview:](self->_tongueContainer, "addSubview:", self->_tongueChevron);
    -[_UIBackdropView setComputesColorSettings:](self->_tongueBackdropView, "setComputesColorSettings:", 1);
    -[_UIBackdropView setAppliesOutputSettingsAutomatically:](self->_tongueBackdropView, "setAppliesOutputSettingsAutomatically:", 1);
    -[_UIBackdropView setAppliesOutputSettingsAnimationDuration:](self->_tongueBackdropView, "setAppliesOutputSettingsAnimationDuration:", 1.0);
  }
  -[UIView setAlpha:](self->_tongueContainer, "setAlpha:", 0.0);

}

- (id)_createEdgePullGestureRecognizerWithAction:(SEL)a3
{
  id WeakRetained;
  SBScreenEdgePanGestureRecognizer *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "customGestureRecognizerForGrabberTongue:", self);
    v6 = (SBScreenEdgePanGestureRecognizer *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = -[SBScreenEdgePanGestureRecognizer initWithTarget:action:]([SBScreenEdgePanGestureRecognizer alloc], "initWithTarget:action:", self, a3);
    -[UIScreenEdgePanGestureRecognizer setEdges:](v6, "setEdges:", self->_screenEdge);
  }
  -[SBScreenEdgePanGestureRecognizer addTarget:action:](v6, "addTarget:action:", self, a3);

  return v6;
}

- (id)_createTapGestureRecognizerWithAction:(SEL)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, a3);
}

- (id)_newBackdropViewWithColorStyle:(int64_t)a3
{
  uint64_t v4;
  void *v5;

  if (a3)
    v4 = 11050;
  else
    v4 = 2020;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAC68]), "initWithPrivateStyle:", v4);
  objc_msgSend(v5, "setGroupName:", CFSTR("GrabberTongue"));
  -[UIView bounds](self->_tongueContainer, "bounds");
  objc_msgSend(v5, "setFrame:");
  return v5;
}

- (id)_newChevronView
{
  void *v2;
  void *v3;
  CGAffineTransform v5;

  objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:", CFSTR("grabber-chevron"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v2);
  CGAffineTransformMakeRotation(&v5, 3.14159265);
  objc_msgSend(v3, "setTransform:", &v5);

  return v3;
}

- (void)_dismissTongue:(id)a3
{
  -[SBGrabberTongue _dismissTongueWithStyle:animated:](self, "_dismissTongueWithStyle:animated:", 0, 1);
}

- (void)_cancelPendingTongueDismissRequests
{
  objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__dismissTongue_, 0);
}

- (void)_dismissTongueWithStyle:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;
  void (**v8)(_QWORD);
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  _QWORD v11[4];
  void (**v12)(_QWORD);
  _QWORD v13[6];
  _QWORD v14[6];

  v4 = a4;
  -[SBGrabberTongue _cancelPendingTongueDismissRequests](self, "_cancelPendingTongueDismissRequests");
  self->_tongueVisible = 0;
  -[SBGrabberTongue _willDismiss](self, "_willDismiss");
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __52__SBGrabberTongue__dismissTongueWithStyle_animated___block_invoke;
  v14[3] = &unk_1E8E9DE88;
  v14[4] = self;
  v14[5] = a3;
  v8 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v14);
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __52__SBGrabberTongue__dismissTongueWithStyle_animated___block_invoke_2;
  v13[3] = &unk_1E8EAAB58;
  v13[4] = self;
  v13[5] = a3;
  v9 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](v13);
  if (v4)
  {
    v10 = (void *)MEMORY[0x1E0CEABB0];
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __52__SBGrabberTongue__dismissTongueWithStyle_animated___block_invoke_3;
    v11[3] = &unk_1E8E9E8D0;
    v12 = v8;
    objc_msgSend(v10, "animateWithDuration:animations:completion:", v11, v9, 0.2);

  }
  else
  {
    v8[2](v8);
    v9[2](v9, 1);
  }

}

uint64_t __52__SBGrabberTongue__dismissTongueWithStyle_animated___block_invoke(uint64_t a1)
{
  id *v1;
  uint64_t v2;
  id v3;

  v2 = a1 + 32;
  v1 = *(id **)(a1 + 32);
  v3 = v1[5];
  if (*(_QWORD *)(v2 + 8))
    return objc_msgSend(v1[5], "setAlpha:", 0.0);
  objc_msgSend(v1, "_frameForTongueWhenVisible:", 0);
  return objc_msgSend(v3, "setFrame:");
}

uint64_t __52__SBGrabberTongue__dismissTongueWithStyle_animated___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 104);
  *(_QWORD *)(v2 + 104) = 0;

  if (!*(_QWORD *)(a1 + 40))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 32), "_didDismiss");
}

uint64_t __52__SBGrabberTongue__dismissTongueWithStyle_animated___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_presentTongueAnimated:(BOOL)a3 autoDismiss:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v6;
  BSInvalidatable *v7;
  BSInvalidatable *deferOrientationUpdatesAssertion;
  UIView *tongueContainer;
  __int128 v10;
  UIImageView *tongueChevron;
  UIView *v12;
  double v13;
  void *v14;
  _QWORD v15[5];
  _OWORD v16[3];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[2];

  v4 = a4;
  v20[1] = *MEMORY[0x1E0C80C00];
  if (!self->_tongueVisible)
  {
    v6 = a3;
    self->_tongueVisible = 1;
    -[SBGrabberTongue _willPresent](self, "_willPresent");
    if (!self->_deferOrientationUpdatesAssertion)
    {
      objc_msgSend((id)SBApp, "deviceOrientationUpdateDeferralAssertionWithReason:", CFSTR("SBOrientationLockForGrabber"));
      v7 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      deferOrientationUpdatesAssertion = self->_deferOrientationUpdatesAssertion;
      self->_deferOrientationUpdatesAssertion = v7;

    }
    -[UIView setAlpha:](self->_tongueContainer, "setAlpha:", 1.0);
    tongueContainer = self->_tongueContainer;
    v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v17 = *MEMORY[0x1E0C9BAA8];
    v18 = v10;
    v19 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    -[UIView setTransform:](tongueContainer, "setTransform:", &v17);
    -[SBGrabberTongue _frameForTongueWhenVisible:](self, "_frameForTongueWhenVisible:", 0);
    -[UIView setFrame:](self->_tongueContainer, "setFrame:");
    tongueChevron = self->_tongueChevron;
    SBRectWithSize();
    -[SBGrabberTongue _chevronFrameForTongueBounds:](self, "_chevronFrameForTongueBounds:");
    -[UIImageView setFrame:](tongueChevron, "setFrame:");
    v18 = 0u;
    v19 = 0u;
    v17 = 0u;
    -[SBGrabberTongue _transformForTongueContainer](self, "_transformForTongueContainer");
    v12 = self->_tongueContainer;
    v16[0] = v17;
    v16[1] = v18;
    v16[2] = v19;
    -[UIView setTransform:](v12, "setTransform:", v16);
    v13 = 0.2;
    if (!v6)
      v13 = 0.0;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __54__SBGrabberTongue__presentTongueAnimated_autoDismiss___block_invoke;
    v15[3] = &unk_1E8E9DED8;
    v15[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v15, v13);
  }
  -[SBGrabberTongue _cancelPendingTongueDismissRequests](self, "_cancelPendingTongueDismissRequests", a3);
  if (v4)
  {
    v20[0] = *MEMORY[0x1E0C99860];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBGrabberTongue performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", sel__dismissTongue_, 0, v14, 2.0);

  }
}

uint64_t __54__SBGrabberTongue__presentTongueAnimated_autoDismiss___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  void *v2;

  v1 = *(_QWORD **)(a1 + 32);
  v2 = (void *)v1[5];
  objc_msgSend(v1, "_frameForTongueWhenVisible:", 1);
  return objc_msgSend(v2, "setFrame:");
}

- (CGRect)_frameForTongueWhenVisible:(BOOL)a3
{
  _BOOL4 v3;
  double v6;
  double MinX;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  unint64_t screenEdge;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  double MinY;
  double v25;
  double MaxY;
  double v27;
  void *v28;
  double MaxX;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGRect v35;
  CGRect v36;
  CGRect result;

  v3 = a3;
  -[UIView frame](self->_tongueContainer, "frame");
  MinX = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  screenEdge = self->_screenEdge;
  -[UIView bounds](self->_containingView, "bounds");
  -[SBGrabberTongue _grabberTongueScreenInsets](self, "_grabberTongueScreenInsets");
  UIRectInset();
  v19 = v15;
  v20 = v16;
  v21 = v17;
  v22 = v18;
  switch(screenEdge)
  {
    case 1uLL:
      -[SBGrabberTongue _centerOnScreenEdge](self, "_centerOnScreenEdge");
      SBScreenScale();
      SBFloatFloorForScale();
      MinX = v23;
      if (v3)
      {
        v35.origin.x = v19;
        v35.origin.y = v20;
        v35.size.width = v21;
        v35.size.height = v22;
        MinY = CGRectGetMinY(v35);
        goto LABEL_16;
      }
      v9 = -v13;
      break;
    case 2uLL:
      if (v3)
        MinX = CGRectGetMinX(*(CGRect *)&v15);
      else
        MinX = -v11;
      goto LABEL_15;
    case 4uLL:
      -[SBGrabberTongue _centerOnScreenEdge](self, "_centerOnScreenEdge");
      SBScreenScale();
      SBFloatFloorForScale();
      MinX = v25;
      v36.origin.x = v19;
      v36.origin.y = v20;
      v36.size.width = v21;
      v36.size.height = v22;
      MaxY = CGRectGetMaxY(v36);
      v27 = -0.0;
      if (v3)
        v27 = v13;
      v9 = MaxY - v27;
      break;
    case 8uLL:
      MaxX = CGRectGetMaxX(*(CGRect *)&v15);
      v30 = -0.0;
      if (v3)
        v30 = v11;
      MinX = MaxX - v30;
LABEL_15:
      -[SBGrabberTongue _centerOnScreenEdge](self, "_centerOnScreenEdge");
      SBScreenScale();
      SBFloatFloorForScale();
LABEL_16:
      v9 = MinY;
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBGrabberTongue.m"), 543, CFSTR("Grabbers can only be installed on one edge"));

      break;
  }
  v31 = MinX;
  v32 = v9;
  v33 = v11;
  v34 = v13;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (UIEdgeInsets)_grabberTongueScreenInsets
{
  void *v3;
  void *v4;
  double MaxY;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect v19;
  CGRect v20;
  UIEdgeInsets result;

  objc_msgSend(MEMORY[0x1E0DC5BB8], "sb_thisDeviceDisplayShape");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "rect");
    MaxY = CGRectGetMaxY(v19);
  }
  else
  {
    MaxY = 0.0;
  }
  v6 = SBFEffectiveArtworkSubtype();
  if (v6 > 2795)
  {
    if (v6 != 2868 && v6 != 2796)
      goto LABEL_13;
  }
  else if (v6 != 2556 && v6 != 2622)
  {
    goto LABEL_13;
  }
  objc_msgSend((id)SBApp, "systemApertureControllerForMainDisplay");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "defaultIslandFrameInCoordinateSpace:", self->_containingView);
    MaxY = CGRectGetMaxY(v20);
  }

LABEL_13:
  v10 = *MEMORY[0x1E0CEB4B0];
  v9 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v12 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v11 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  if (MaxY > 0.0)
  {
    v13 = objc_opt_class();
    SBSafeCast(v13, self->_containingView);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      -[UIView window](self->_containingView, "window");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    switch(objc_msgSend(v14, "interfaceOrientation"))
    {
      case 1:
        goto LABEL_21;
      case 2:
        v12 = MaxY;
        goto LABEL_20;
      case 3:
        v9 = MaxY;
        goto LABEL_20;
      case 4:
        v11 = MaxY;
        goto LABEL_20;
      default:
LABEL_20:
        MaxY = v10;
LABEL_21:

        v10 = MaxY;
        break;
    }
  }

  v15 = v10;
  v16 = v9;
  v17 = v12;
  v18 = v11;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (CGRect)_chevronFrameForTongueBounds:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  SBRectWithSize();
  UIRectCenteredIntegralRectScale();
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGAffineTransform)_transformForTongueContainer
{
  unint64_t screenEdge;
  double v5;
  CGAffineTransform v7;

  screenEdge = self->_screenEdge;
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  switch(screenEdge)
  {
    case 1uLL:
      v5 = 0.0;
      break;
    case 2uLL:
      v5 = -1.57079633;
      break;
    case 8uLL:
      v5 = 1.57079633;
      break;
    default:
      v5 = 3.14159265;
      if (screenEdge != 4)
        v5 = 0.0;
      break;
  }
  CGAffineTransformMakeRotation(&v7, v5);
  return (CGAffineTransform *)UIIntegralTransform();
}

- (double)_distanceFromEdgeForRecognizer:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v11;
  uint64_t v12;
  double result;
  uint64_t v14;
  uint64_t v15;

  objc_msgSend(a3, "locationInView:", self->_containingView);
  v5 = v4;
  v7 = v6;
  -[UIView bounds](self->_containingView, "bounds");
  v12 = v11;
  result = 0.0;
  switch(self->_screenEdge)
  {
    case 1uLL:
      result = v7;
      break;
    case 2uLL:
      result = v5;
      break;
    case 4uLL:
      v14 = v12;
      result = CGRectGetMaxY(*(CGRect *)(&v8 - 1)) - v7;
      break;
    case 8uLL:
      v15 = v12;
      result = CGRectGetMaxX(*(CGRect *)(&v8 - 1)) - v5;
      break;
    default:
      return result;
  }
  return result;
}

- (double)_edgeOrientedVelocityForRecognizer:(id)a3
{
  double v4;
  double v5;
  double v6;
  double result;

  objc_msgSend(a3, "velocityInView:", self->_containingView);
  v6 = v5;
  result = 0.0;
  switch(self->_screenEdge)
  {
    case 1uLL:
      result = v4;
      break;
    case 2uLL:
      result = v6;
      break;
    case 4uLL:
      result = -v4;
      break;
    case 8uLL:
      result = -v6;
      break;
    default:
      return result;
  }
  return result;
}

- (void)_updateCancelsTouchesWithRecognizerIfNeeded:(id)a3
{
  UITapGestureRecognizer *v4;
  UITapGestureRecognizer *v5;
  int v6;
  uint64_t v7;
  UITapGestureRecognizer *v8;

  v4 = (UITapGestureRecognizer *)a3;
  v5 = v4;
  if (self->_tapGestureRecognizer != v4)
  {
    v8 = v4;
    if (self->_tongueVisible)
      v6 = 1;
    else
      v6 = !-[SBGrabberTongue _shouldShowTongueOnFirstSwipeWithRecognizer:](self, "_shouldShowTongueOnFirstSwipeWithRecognizer:", v4);
    -[SBGrabberTongue _ambiguousActivationMarginIfHonored](self, "_ambiguousActivationMarginIfHonored");
    v7 = v6 & BSFloatIsZero();
    -[UIPanGestureRecognizer setCancelsTouchesInView:](self->_edgePullGestureRecognizer, "setCancelsTouchesInView:", v7);
    -[SBIndirectPanGestureRecognizer setCancelsTouchesInView:](self->_indirectEdgePullGestureRecognizer, "setCancelsTouchesInView:", v7);
    v5 = v8;
  }

}

- (id)viewForSystemGestureRecognizer:(id)a3
{
  return self->_containingView;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  SBIndirectPanGestureRecognizer *v5;
  SBIndirectPanGestureRecognizer *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  BOOL inDismissTongueGesture;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  SBIndirectPanGestureRecognizer *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = (SBIndirectPanGestureRecognizer *)a3;
  v6 = v5;
  if (*(_WORD *)&self->_inPullGesture)
    inDismissTongueGesture = 1;
  else
    inDismissTongueGesture = self->_inDismissTongueGesture;
  if ((SBIndirectPanGestureRecognizer *)self->_tapGestureRecognizer != v5
    && (SBIndirectPanGestureRecognizer *)self->_edgePullGestureRecognizer != v5)
  {
    if (self->_indirectEdgePullGestureRecognizer != v5)
      inDismissTongueGesture = 0;
    if (!inDismissTongueGesture)
      goto LABEL_9;
LABEL_16:
    v14 = 0;
    goto LABEL_17;
  }
  if (inDismissTongueGesture)
    goto LABEL_16;
LABEL_9:
  SBLogSystemGestureAppSwitcher();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIndirectPanGestureRecognizer name](v6, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v22 = v9;
    v23 = 2050;
    v24 = v6;
    v25 = 2114;
    v26 = v10;
    v27 = 2112;
    v28 = v11;
    v29 = 2112;
    v30 = v12;
    v31 = 2112;
    v32 = v13;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "-[SBGrabberTongue gestureRecognizerShouldBegin:] gesture <%{public}@:%{public}p> (%{public}@) with State _inPullGesture:%@ _inShowTongueGesture:%@ _inDismissTongueGesture:%@", buf, 0x3Eu);

  }
  if (self->_inPullGesture || self->_inShowTongueGesture || self->_inDismissTongueGesture)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBGrabberTongue.m"), 733, CFSTR("Unexpected State Transition for Gesture:%@ with State _inPullGesture:%@ _inShowTongueGesture:%@ _inDismissTongueGesture:%@"), v6, v18, v19, v20);

  }
  v14 = -[SBGrabberTongue _tongueOrPullEnabledForGestureRecognizer:](self, "_tongueOrPullEnabledForGestureRecognizer:", v6);
  -[SBGrabberTongue _updateCancelsTouchesWithRecognizerIfNeeded:](self, "_updateCancelsTouchesWithRecognizerIfNeeded:", v6);
LABEL_17:

  return v14;
}

- (void)_handlePullGesture:(id)a3
{
  id v4;
  char IsZero;
  double v6;
  char v7;
  _BOOL4 tongueVisible;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  int v12;
  double v13;
  double gestureStartTime;
  double v15;
  double v16;
  double v17;
  double v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  _BOOL4 inAmbiguousGesture;
  BOOL v28;
  BOOL v29;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBGrabberTongue _ambiguousActivationMarginIfHonored](self, "_ambiguousActivationMarginIfHonored");
  IsZero = BSFloatIsZero();
  if (objc_msgSend(v4, "state") == 1)
  {
    BSContinuousMachTimeNow();
    self->_gestureStartTime = v6;
  }
  if (!self->_inAmbiguousGesture
    && (self->_inPullGesture
     || self->_inDismissTongueGesture
     || (self->_inShowTongueGesture ? (v7 = 1) : (v7 = IsZero), (v7 & 1) != 0)))
  {
    tongueVisible = self->_tongueVisible;
    v9 = -[SBGrabberTongue _shouldShowTongueOnFirstSwipeWithRecognizer:](self, "_shouldShowTongueOnFirstSwipeWithRecognizer:", v4);
    v10 = -[SBGrabberTongue _shouldAllowSecondSwipeWithRecognizer:](self, "_shouldAllowSecondSwipeWithRecognizer:", v4);
    v11 = -[SBGrabberTongue _shouldSecondSwipeDismissTongueWithRecognizer:](self, "_shouldSecondSwipeDismissTongueWithRecognizer:", v4);
    v12 = !v9;
    if (tongueVisible)
      v12 = v10;
    if (self->_inShowTongueGesture)
      goto LABEL_15;
    if (self->_inPullGesture)
    {
      if (!self->_inDismissTongueGesture)
      {
LABEL_19:
        switch(objc_msgSend(v4, "state"))
        {
          case 1:
            self->_inPullGesture = 1;
            -[SBGrabberTongue _pullGestureBegan:](self, "_pullGestureBegan:", v4);
            goto LABEL_37;
          case 2:
            goto LABEL_26;
          case 3:
            -[SBGrabberTongue _pullGestureEnded:](self, "_pullGestureEnded:", v4);
            goto LABEL_67;
          case 4:
            -[SBGrabberTongue _pullGestureCanceled:](self, "_pullGestureCanceled:", v4);
LABEL_67:
            self->_inPullGesture = 0;
            break;
          default:
            goto LABEL_37;
        }
        goto LABEL_37;
      }
      goto LABEL_44;
    }
    if (self->_inDismissTongueGesture)
      goto LABEL_44;
    inAmbiguousGesture = self->_inAmbiguousGesture;
    if (!inAmbiguousGesture && !tongueVisible && v9)
    {
LABEL_15:
      if (objc_msgSend(v4, "state") == 1)
      {
        -[SBGrabberTongue _presentTongueAnimated:autoDismiss:](self, "_presentTongueAnimated:autoDismiss:", 1, 1);
        -[SBGrabberTongue _willPresentInteractively:](self, "_willPresentInteractively:", v4);
        self->_inShowTongueGesture = 1;
      }
      else if (objc_msgSend(v4, "state") == 2)
      {
        -[SBGrabberTongue _willPresentInteractively:](self, "_willPresentInteractively:", v4);
      }
      else if (objc_msgSend(v4, "state") == 3 || objc_msgSend(v4, "state") == 4)
      {
        self->_inShowTongueGesture = 0;
        -[SBGrabberTongue _didPresentInteractively:](self, "_didPresentInteractively:", v4);
      }
      goto LABEL_37;
    }
    v28 = tongueVisible && !inAmbiguousGesture;
    v29 = !v28 || v10;
    if (!v29 && v11)
    {
LABEL_44:
      if (objc_msgSend(v4, "state") == 1)
      {
        -[SBGrabberTongue _dismissTongue:](self, "_dismissTongue:", 0);
        self->_inDismissTongueGesture = 1;
      }
      else if (objc_msgSend(v4, "state") == 3 || objc_msgSend(v4, "state") == 4)
      {
        self->_inDismissTongueGesture = 0;
      }
      goto LABEL_37;
    }
    if (self->_inAmbiguousGesture)
      v12 = 0;
    if (v12 == 1)
      goto LABEL_19;
  }
  else
  {
    switch(objc_msgSend(v4, "state"))
    {
      case 1:
        *(_WORD *)&self->_inAmbiguousGesture = 1;
        break;
      case 2:
        BSContinuousMachTimeNow();
        gestureStartTime = self->_gestureStartTime;
        if (v13 - gestureStartTime > 0.2
          || (v15 = vabdd_f64(v13, gestureStartTime), v15 >= INFINITY) && v15 <= INFINITY)
        {
          if (!self->_beganAmbiguousPullGesture)
          {
            -[SBGrabberTongue _pullGestureBegan:](self, "_pullGestureBegan:", v4);
            self->_beganAmbiguousPullGesture = 1;
          }
LABEL_26:
          -[SBGrabberTongue _pullGestureUpdated:](self, "_pullGestureUpdated:", v4);
        }
        break;
      case 3:
        -[SBGrabberTongue _ambiguousActivationMarginIfHonored](self, "_ambiguousActivationMarginIfHonored");
        v17 = fmax(v16, 64.0);
        -[SBGrabberTongue _distanceFromEdgeForRecognizer:](self, "_distanceFromEdgeForRecognizer:", v4);
        if (v18 >= v17)
        {
          if (!self->_beganAmbiguousPullGesture)
          {
            -[SBGrabberTongue _pullGestureBegan:](self, "_pullGestureBegan:", v4);
            self->_beganAmbiguousPullGesture = 1;
          }
        }
        else if (!self->_beganAmbiguousPullGesture)
        {
          goto LABEL_36;
        }
        -[SBGrabberTongue _pullGestureEnded:](self, "_pullGestureEnded:", v4);
        goto LABEL_36;
      case 4:
        -[SBGrabberTongue _pullGestureCanceled:](self, "_pullGestureCanceled:", v4);
LABEL_36:
        *(_WORD *)&self->_inAmbiguousGesture = 0;
        break;
      default:
        break;
    }
  }
LABEL_37:
  SBLogSystemGestureAppSwitcher();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromBOOL();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 138413570;
    v31 = v20;
    v32 = 2112;
    v33 = v21;
    v34 = 2112;
    v35 = v22;
    v36 = 2114;
    v37 = v24;
    v38 = 2050;
    v39 = v4;
    v40 = 2114;
    v41 = v25;
    _os_log_impl(&dword_1D0540000, v19, OS_LOG_TYPE_DEFAULT, "-[SBGrabberTongue _handlePullGesture:] with state: _inPullGesture:%@ _inShowTongueGesture:%@ _inDismissTongueGesture:%@ from gesture <%{public}@:%{public}p> (%{public}@)", (uint8_t *)&v30, 0x3Eu);

  }
}

- (void)_handleTapped:(id)a3
{
  SBGrabberTongueDelegate **p_delegate;
  id v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  id WeakRetained;
  CGPoint v11;
  CGRect v12;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(v5, "locationInView:", self->_tongueBackdropView);
  v7 = v6;
  v9 = v8;

  -[_UIBackdropView bounds](self->_tongueBackdropView, "bounds");
  v11.x = v7;
  v11.y = v9;
  if (CGRectContainsPoint(v12, v11) && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "grabberTongueTapped:", self);

}

- (SBGrabberTongueDelegate)delegate
{
  return (SBGrabberTongueDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_deferOrientationUpdatesAssertion, 0);
  objc_storeStrong((id *)&self->_containingView, 0);
  objc_storeStrong((id *)&self->_tongueChevron, 0);
  objc_storeStrong((id *)&self->_tongueBackdropView, 0);
  objc_storeStrong((id *)&self->_tongueContainer, 0);
  objc_storeStrong((id *)&self->_indirectEdgePullGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_edgePullGestureRecognizer, 0);
}

@end
