@implementation NCNotificationListInteractiveTransitionCoordinator

- (NCNotificationListInteractiveTransitionCoordinator)initWithParentListView:(id)a3 interactiveListView:(id)a4 revealListView:(id)a5
{
  id v8;
  id v9;
  id v10;
  NCNotificationListInteractiveTransitionCoordinator *v11;
  NCNotificationListInteractiveTransitionCoordinator *v12;
  uint64_t v13;
  UIPinchGestureRecognizer *interactiveTransitionPinchGestureRecognizer;
  uint64_t v15;
  UIPanGestureRecognizer *interactiveTransitionPanGestureRecognizer;
  void *v17;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)NCNotificationListInteractiveTransitionCoordinator;
  v11 = -[NCNotificationListInteractiveTransitionCoordinator init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_parentListView, v8);
    objc_storeWeak((id *)&v12->_interactiveListView, v9);
    objc_storeWeak((id *)&v12->_revealListView, v10);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AE8]), "initWithTarget:action:", v12, sel__gestureRecognizerDidRecognize_);
    interactiveTransitionPinchGestureRecognizer = v12->_interactiveTransitionPinchGestureRecognizer;
    v12->_interactiveTransitionPinchGestureRecognizer = (UIPinchGestureRecognizer *)v13;

    objc_msgSend(v8, "addGestureRecognizer:", v12->_interactiveTransitionPinchGestureRecognizer);
    -[UIPinchGestureRecognizer setEnabled:](v12->_interactiveTransitionPinchGestureRecognizer, "setEnabled:", 0);
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", v12, sel__gestureRecognizerDidRecognize_);
    interactiveTransitionPanGestureRecognizer = v12->_interactiveTransitionPanGestureRecognizer;
    v12->_interactiveTransitionPanGestureRecognizer = (UIPanGestureRecognizer *)v15;

    -[UIPanGestureRecognizer setDelegate:](v12->_interactiveTransitionPanGestureRecognizer, "setDelegate:", v12);
    objc_msgSend(v8, "addGestureRecognizer:", v12->_interactiveTransitionPanGestureRecognizer);
    objc_msgSend(v8, "panGestureRecognizer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "requireGestureRecognizerToFail:", v12->_interactiveTransitionPanGestureRecognizer);

  }
  return v12;
}

- (BOOL)isPerformingExclusiveScrollInteractiveTranslation
{
  unint64_t v3;

  v3 = -[NCNotificationListInteractiveTransitionCoordinator _countForInteractiveListView](self, "_countForInteractiveListView");
  if (-[NCNotificationListInteractiveTransitionCoordinator currentListDisplayStyleSetting](self, "currentListDisplayStyleSetting") == 1&& v3 > 1)
  {
    return 1;
  }
  if (-[NCNotificationListInteractiveTransitionCoordinator currentListDisplayStyleSetting](self, "currentListDisplayStyleSetting") != 2)return 0;
  if (v3)
    return 1;
  return -[NCNotificationListInteractiveTransitionCoordinator _isCurrentDigestVisible](self, "_isCurrentDigestVisible");
}

- (void)updateScrollInteractiveTranslation
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  id v12;

  -[NCNotificationListInteractiveTransitionCoordinator parentListView](self, "parentListView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contentOffset");
  v4 = v3;
  objc_msgSend(v12, "contentInset");
  v6 = (v4 + v5) / 100.0;
  if (v6 > 1.0)
    v6 = 1.0;
  v7 = fmax(v6, -1.0);
  objc_msgSend(v12, "panGestureRecognizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "velocityInView:", v12);
  v10 = v9;

  self->_shouldPerformInteractiveExpandTransition = -[NCNotificationListInteractiveTransitionCoordinator _shouldAllowExpandInteractiveTranslation](self, "_shouldAllowExpandInteractiveTranslation");
  -[NCNotificationListInteractiveTransitionCoordinator _bottomPositionForInteractiveListView](self, "_bottomPositionForInteractiveListView");
  -[NCNotificationListInteractiveTransitionCoordinator _updateNotificationListForInteractionTranslationPercentage:interactionTranslationVelocity:interactionTranslationFocalPointY:isPersistentSetting:isIntentionalInteraction:forReason:](self, "_updateNotificationListForInteractionTranslationPercentage:interactionTranslationVelocity:interactionTranslationFocalPointY:isPersistentSetting:isIntentionalInteraction:forReason:", 0, -[NCNotificationListInteractiveTransitionCoordinator _isScrollingListContent](self, "_isScrollingListContent"), 0, v7, v10, v11);

}

- (void)interactiveTranslationWillBegin
{
  id WeakRetained;

  self->_shouldPerformInteractiveCollapseTransition = 1;
  self->_shouldPerformInteractiveExpandTransition = -[NCNotificationListInteractiveTransitionCoordinator _shouldAllowExpandInteractiveTranslation](self, "_shouldAllowExpandInteractiveTranslation");
  WeakRetained = objc_loadWeakRetained((id *)&self->_revealListView);
  objc_msgSend(WeakRetained, "setListRevealTargetContentOffsetClamped:", 0);

}

- (void)interactiveTranslationDidEnd
{
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveListView);
  objc_msgSend(WeakRetained, "setInteractionTranslationPercentage:", 0.0);

  v4 = objc_loadWeakRetained((id *)&self->_parentListView);
  objc_msgSend(v4, "setInteractionTranslation:", 0.0);

}

- (BOOL)isPanGestureRecognizerActive
{
  uint64_t v2;

  v2 = -[UIPanGestureRecognizer state](self->_interactiveTransitionPanGestureRecognizer, "state");
  return v2 == 2 || (v2 & 0xFFFFFFFFFFFFFFFDLL) == 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  UIPanGestureRecognizer *v4;
  char v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  char v10;
  int v11;
  void *v12;
  double v13;
  double v14;
  int v15;
  int v16;
  _BOOL4 v17;
  _BOOL4 v18;
  NSObject *v19;
  _DWORD v21[2];
  __int16 v22;
  int v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = (UIPanGestureRecognizer *)a3;
  if (self->_interactiveTransitionPanGestureRecognizer == v4)
  {
    -[NCNotificationListInteractiveTransitionCoordinator parentListView](self, "parentListView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPanGestureRecognizer velocityInView:](v4, "velocityInView:", v6);
    v8 = v7;
    -[UIPanGestureRecognizer velocityInView:](v4, "velocityInView:", v6);
    if (fabs(v8) <= fabs(v9))
    {
      v5 = 0;
    }
    else
    {
      objc_msgSend(v6, "contentOffset");
      objc_msgSend(v6, "contentInset");
      if ((BSFloatApproximatelyEqualToFloat() & 1) != 0)
        v10 = 1;
      else
        v10 = BSFloatLessThanFloat();
      if (-[NCNotificationListInteractiveTransitionCoordinator _countForInteractiveListView](self, "_countForInteractiveListView")|| -[NCNotificationListInteractiveTransitionCoordinator _isCurrentDigestVisible](self, "_isCurrentDigestVisible"))
      {
        LOBYTE(v11) = 0;
      }
      else
      {
        v11 = !-[NCNotificationListInteractiveTransitionCoordinator _isHiddenListRevealed](self, "_isHiddenListRevealed");
      }
      -[NCNotificationListInteractiveTransitionCoordinator interactiveListView](self, "interactiveListView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPanGestureRecognizer locationInView:](v4, "locationInView:", v12);
      v14 = v13;

      v15 = (-[NCNotificationListInteractiveTransitionCoordinator currentListDisplayStyleSetting](self, "currentListDisplayStyleSetting") != 2) & ~(_BYTE)v11 & v10;
      if (v8 <= 0.0)
        v15 = 0;
      if (v14 >= 0.0)
        v16 = v15;
      else
        v16 = 0;
      if (-[NCNotificationListInteractiveTransitionCoordinator isPerformingExclusiveScrollInteractiveTranslation](self, "isPerformingExclusiveScrollInteractiveTranslation"))
      {
        v17 = -[NCNotificationListInteractiveTransitionCoordinator _shouldAllowExpandInteractiveTranslation](self, "_shouldAllowExpandInteractiveTranslation");
        v18 = v8 < 0.0 && v17;
      }
      else
      {
        v18 = 0;
      }
      v5 = v16 | v18;
      v19 = *MEMORY[0x1E0DC5F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
      {
        v21[0] = 67109632;
        v21[1] = v16 | v18;
        v22 = 1024;
        v23 = v16;
        v24 = 1024;
        v25 = v18;
        _os_log_impl(&dword_1CFC3D000, v19, OS_LOG_TYPE_DEFAULT, "Interactive transition coordinator should begin pan gesture = %{BOOL}d [ shouldCollapse:%{BOOL}d ; shouldExpand:%{BOOL}d ]",
          (uint8_t *)v21,
          0x14u);
      }
    }

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (void)_gestureRecognizerDidRecognize:(id)a3
{
  _BOOL8 v4;
  uint64_t v5;
  double v6;
  double v7;
  int64_t v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v12 = a3;
  v4 = -[NCNotificationListInteractiveTransitionCoordinator _isPersistentSettingTransitionForGestureRecognizer:](self, "_isPersistentSettingTransitionForGestureRecognizer:", v12);
  v5 = objc_msgSend(v12, "state");
  if ((unint64_t)(v5 - 3) < 2)
  {
    -[NCNotificationListInteractiveTransitionCoordinator interactiveTranslationDidEnd](self, "interactiveTranslationDidEnd");
    if (v4)
      -[NCNotificationListInteractiveTransitionCoordinator _releaseHapticForListDisplayStyleTransition](self, "_releaseHapticForListDisplayStyleTransition");
  }
  else if (v5 == 2)
  {
    -[NCNotificationListInteractiveTransitionCoordinator _interactionTranslationPercentageForGestureRecognizer:](self, "_interactionTranslationPercentageForGestureRecognizer:", v12);
    v7 = v6;
    v8 = -[NCNotificationListInteractiveTransitionCoordinator _interactionTranslationReasonForGestureRecognizer:](self, "_interactionTranslationReasonForGestureRecognizer:", v12);
    -[NCNotificationListInteractiveTransitionCoordinator _interactionTranslationVelocityForGestureRecognizer:](self, "_interactionTranslationVelocityForGestureRecognizer:", v12);
    v10 = v9;
    -[NCNotificationListInteractiveTransitionCoordinator _interactionTranslationFocalPointYForGestureRecognizer:](self, "_interactionTranslationFocalPointYForGestureRecognizer:", v12);
    -[NCNotificationListInteractiveTransitionCoordinator _updateNotificationListForInteractionTranslationPercentage:interactionTranslationVelocity:interactionTranslationFocalPointY:isPersistentSetting:isIntentionalInteraction:forReason:](self, "_updateNotificationListForInteractionTranslationPercentage:interactionTranslationVelocity:interactionTranslationFocalPointY:isPersistentSetting:isIntentionalInteraction:forReason:", v4, 1, v8, v7, v10, v11);
  }
  else if (v5 == 1)
  {
    if (v4)
      -[NCNotificationListInteractiveTransitionCoordinator _prepareHapticForListDisplayStyleTransition](self, "_prepareHapticForListDisplayStyleTransition");
    -[NCNotificationListInteractiveTransitionCoordinator interactiveTranslationWillBegin](self, "interactiveTranslationWillBegin");
  }

}

- (BOOL)_isPersistentSettingTransitionForGestureRecognizer:(id)a3
{
  return self->_interactiveTransitionPinchGestureRecognizer == a3;
}

- (double)_interactionTranslationPercentageForGestureRecognizer:(id)a3
{
  UIPanGestureRecognizer *v4;
  UIPanGestureRecognizer *v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;

  v4 = (UIPanGestureRecognizer *)a3;
  v5 = v4;
  if ((UIPanGestureRecognizer *)self->_interactiveTransitionPinchGestureRecognizer == v4)
  {
    -[UIPanGestureRecognizer scale](v4, "scale");
    v10 = v9 + -1.0;
    if (v10 > 1.0)
      v10 = 1.0;
    v6 = fmax(v10, -1.0);
  }
  else
  {
    v6 = 0.0;
    if (self->_interactiveTransitionPanGestureRecognizer == v4)
    {
      -[NCNotificationListInteractiveTransitionCoordinator parentListView](self, "parentListView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPanGestureRecognizer translationInView:](v5, "translationInView:", v7);
      v6 = v8 / -100.0;

    }
  }

  return v6;
}

- (int64_t)_interactionTranslationReasonForGestureRecognizer:(id)a3
{
  if (self->_interactiveTransitionPinchGestureRecognizer == a3)
    return 2;
  if (self->_interactiveTransitionPanGestureRecognizer == a3)
    return 1;
  return -1;
}

- (double)_interactionTranslationVelocityForGestureRecognizer:(id)a3
{
  UIPinchGestureRecognizer *v4;
  UIPinchGestureRecognizer *v5;
  double v6;
  double v7;
  void *v8;
  double v9;

  v4 = (UIPinchGestureRecognizer *)a3;
  v5 = v4;
  if ((UIPinchGestureRecognizer *)self->_interactiveTransitionPanGestureRecognizer == v4)
  {
    -[NCNotificationListInteractiveTransitionCoordinator parentListView](self, "parentListView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPinchGestureRecognizer velocityInView:](v5, "velocityInView:", v8);
    v6 = fabs(v9);

  }
  else
  {
    v6 = 0.0;
    if (self->_interactiveTransitionPinchGestureRecognizer == v4)
    {
      -[UIPinchGestureRecognizer velocity](v4, "velocity");
      v6 = v7;
    }
  }

  return v6;
}

- (double)_bottomPositionForInteractiveListView
{
  void *v2;
  double MaxY;
  CGRect v5;

  -[NCNotificationListInteractiveTransitionCoordinator interactiveListView](self, "interactiveListView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visibleRect");
  MaxY = CGRectGetMaxY(v5);

  return MaxY;
}

- (double)_interactionTranslationFocalPointYForGestureRecognizer:(id)a3
{
  UIPinchGestureRecognizer *v4;
  void *v5;
  double v6;
  double v7;
  double v8;

  v4 = (UIPinchGestureRecognizer *)a3;
  -[NCNotificationListInteractiveTransitionCoordinator interactiveListView](self, "interactiveListView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationListInteractiveTransitionCoordinator _bottomPositionForInteractiveListView](self, "_bottomPositionForInteractiveListView");
  if (self->_interactiveTransitionPinchGestureRecognizer == v4)
  {
    -[UIPinchGestureRecognizer locationInView:](v4, "locationInView:", v5);
    v7 = v8;
  }
  else
  {
    v7 = v6;
  }

  return v7;
}

- (void)_updateNotificationListForInteractionTranslationPercentage:(double)a3 interactionTranslationVelocity:(double)a4 interactionTranslationFocalPointY:(double)a5 isPersistentSetting:(BOOL)a6 isIntentionalInteraction:(BOOL)a7 forReason:(int64_t)a8
{
  _BOOL4 v9;
  _BOOL8 v10;
  int64_t v15;
  unint64_t v16;
  uint64_t v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  int64_t v21;
  int v22;
  int v23;
  BOOL v24;
  _BOOL4 v25;
  int v26;
  double v27;
  double v28;
  double v29;
  double v30;
  int v32;
  int v33;
  int64_t v34;
  void *v35;
  _BOOL8 v36;
  void *v37;
  NSObject *v38;
  void *v39;
  int64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  _BOOL4 v52;
  __int16 v53;
  int v54;
  uint64_t v55;

  v9 = a7;
  v10 = a6;
  v55 = *MEMORY[0x1E0C80C00];
  v15 = -[NCNotificationListInteractiveTransitionCoordinator currentListDisplayStyleSetting](self, "currentListDisplayStyleSetting");
  v16 = -[NCNotificationListInteractiveTransitionCoordinator _countForInteractiveListView](self, "_countForInteractiveListView");
  v17 = -[NCNotificationListInteractiveTransitionCoordinator _isHiddenListRevealed](self, "_isHiddenListRevealed");
  v18 = -[NCNotificationListInteractiveTransitionCoordinator _isCurrentDigestVisible](self, "_isCurrentDigestVisible");
  -[NCNotificationListInteractiveTransitionCoordinator interactiveListView](self, "interactiveListView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationListInteractiveTransitionCoordinator parentListView](self, "parentListView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[NCNotificationListInteractiveTransitionCoordinator currentListDisplayStyleSetting](self, "currentListDisplayStyleSetting");
  if (v21 == 2)
  {
    if (v16)
      v23 = 1;
    else
      v23 = v18;
    v24 = a3 <= 0.4 || v23 == 0;
    if (!v24
      && -[NCNotificationListInteractiveTransitionCoordinator shouldPerformInteractiveExpandTransition](self, "shouldPerformInteractiveExpandTransition"))
    {
      objc_msgSend(v19, "setInteractionVelocity:", a4);
      v17 = 0;
      *(_WORD *)&self->_shouldPerformInteractiveExpandTransition = 256;
      v15 = 1;
      goto LABEL_67;
    }
    if (a3 < -0.4 && v9)
    {
      -[NCNotificationListInteractiveTransitionCoordinator _migrateProminentNotificationsForHiddenSetting](self, "_migrateProminentNotificationsForHiddenSetting");
      goto LABEL_67;
    }
    goto LABEL_66;
  }
  if (v21 != 1)
  {
    if (!v21)
    {
      if (a3 < 0.0 && v9)
      {
        objc_msgSend(v19, "setInteractionTranslationFocalPointY:", a5);
        objc_msgSend(v19, "setInteractionTranslationPercentage:", a3);
        if (a8 == 1)
          objc_msgSend(v20, "setInteractionTranslation:", a3 * -100.0);
      }
      if (a3 < -0.4
        && -[NCNotificationListInteractiveTransitionCoordinator shouldPerformInteractiveCollapseTransition](self, "shouldPerformInteractiveCollapseTransition")&& v9)
      {
        if (v16)
          v22 = 1;
        else
          v22 = v18;
        if (v22 == 1)
        {
          if (v16 == 1 || !v16 && v18)
          {
            if ((_DWORD)v17)
              v15 = 1;
            else
              v15 = 2;
          }
          else
          {
            v15 = 1;
          }
          *(_WORD *)&self->_shouldPerformInteractiveExpandTransition = 1;
          objc_msgSend(v19, "setInteractionVelocity:", a4);
        }
        objc_msgSend(v19, "setInteractionTranslationPercentage:", 0.0);
        objc_msgSend(v20, "setInteractionTranslation:", 0.0);
        goto LABEL_67;
      }
    }
LABEL_66:
    v17 = 0;
    goto LABEL_67;
  }
  if (v9)
  {
    v25 = -[NCNotificationListInteractiveTransitionCoordinator shouldPerformInteractiveExpandTransition](self, "shouldPerformInteractiveExpandTransition");
    v26 = a3 < 0.0 || v25;
    v27 = 0.0;
    v28 = a3 >= 0.0 ? a3 : 0.0;
    v29 = v26 ? a3 : 0.0;
    v30 = -[NCNotificationListInteractiveTransitionCoordinator shouldPerformInteractiveCollapseTransition](self, "shouldPerformInteractiveCollapseTransition")? v29: v28;
    objc_msgSend(v19, "setInteractionTranslationPercentage:", v30);
    if (a8 == 1)
    {
      if (a3 < 0.0)
      {
        if (-[NCNotificationListInteractiveTransitionCoordinator shouldPerformInteractiveCollapseTransition](self, "shouldPerformInteractiveCollapseTransition"))
        {
          v27 = a3 * -100.0;
        }
        else
        {
          v27 = 0.0;
        }
      }
      objc_msgSend(v20, "setInteractionTranslation:", v27);
    }
  }
  if (a3 > 0.4
    && -[NCNotificationListInteractiveTransitionCoordinator shouldPerformInteractiveExpandTransition](self, "shouldPerformInteractiveExpandTransition"))
  {
    objc_msgSend(v19, "setInteractionTranslationPercentage:", 0.0);
    if (a8 == 1)
      objc_msgSend(v19, "setInteractionVelocity:", a4);
    v17 = 0;
    v15 = 0;
    *(_WORD *)&self->_shouldPerformInteractiveExpandTransition = 256;
  }
  else
  {
    if (a3 >= -0.4
      || !-[NCNotificationListInteractiveTransitionCoordinator shouldPerformInteractiveCollapseTransition](self, "shouldPerformInteractiveCollapseTransition"))
    {
      goto LABEL_66;
    }
    if (v16)
      v32 = 1;
    else
      v32 = v18;
    v33 = v32 & v9;
    if (((v33 ^ 1 | v17) & 1) != 0)
    {
      v17 = v33 & v17;
    }
    else
    {
      objc_msgSend(v19, "setInteractionTranslationPercentage:", 0.0);
      objc_msgSend(v20, "setInteractionTranslation:", 0.0);
      if (a8 == 1)
        objc_msgSend(v19, "setInteractionVelocity:", a4);
      v17 = 0;
      *(_WORD *)&self->_shouldPerformInteractiveExpandTransition = 1;
      v15 = 2;
    }
  }
LABEL_67:
  v34 = -[NCNotificationListInteractiveTransitionCoordinator currentListDisplayStyleSetting](self, "currentListDisplayStyleSetting");
  if (v15 != v34 || (_DWORD)v17)
  {
    v35 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v43 = v20;
      v44 = v19;
      v36 = v10;
      v37 = (void *)MEMORY[0x1E0DC6020];
      v38 = v35;
      objc_msgSend(v37, "stringForNotificationListDisplayStyleSetting:", v15);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = a8;
      objc_msgSend(MEMORY[0x1E0DC6020], "stringForNotificationListDisplayStyleSetting:", -[NCNotificationListInteractiveTransitionCoordinator currentListDisplayStyleSetting](self, "currentListDisplayStyleSetting"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationListInteractiveTransitionCoordinator _stringForReason:](self, "_stringForReason:", v40);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v46 = v39;
      v47 = 2114;
      v48 = v41;
      v49 = 2114;
      v50 = v42;
      v51 = 1024;
      v52 = v36;
      v53 = 1024;
      v54 = v17;
      _os_log_impl(&dword_1CFC3D000, v38, OS_LOG_TYPE_DEFAULT, "Interactive transition coordinator changing list display state to %{public}@ from %{public}@ for %{public}@ [ persistentSetting=%{BOOL}d; hideRevealedList=%{BOOL}d ]",
        buf,
        0x2Cu);

      v10 = v36;
      v20 = v43;
      v19 = v44;

    }
    -[NCNotificationListInteractiveTransitionCoordinator _updateListDisplayStyleSetting:isPersistentSetting:hideRevealedList:](self, "_updateListDisplayStyleSetting:isPersistentSetting:hideRevealedList:", v15, v10, v17, v43, v44);
    if (v15 != v34 && v10)
      -[NCNotificationListInteractiveTransitionCoordinator _performHapticForListDisplayStyleTransition](self, "_performHapticForListDisplayStyleTransition");
  }

}

- (id)_stringForReason:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 3)
    return &stru_1E8D21F60;
  else
    return off_1E8D1E828[a3 + 1];
}

- (void)_prepareHapticForListDisplayStyleTransition
{
  UIImpactFeedbackGenerator *feedbackGenerator;
  UIImpactFeedbackGenerator *v4;
  UIImpactFeedbackGenerator *v5;

  if (!-[NCNotificationListInteractiveTransitionCoordinator isHapticPrepared](self, "isHapticPrepared"))
  {
    feedbackGenerator = self->_feedbackGenerator;
    if (!feedbackGenerator)
    {
      v4 = (UIImpactFeedbackGenerator *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3898]), "initWithStyle:", 1);
      v5 = self->_feedbackGenerator;
      self->_feedbackGenerator = v4;

      feedbackGenerator = self->_feedbackGenerator;
    }
    -[UIImpactFeedbackGenerator prepare](feedbackGenerator, "prepare");
    -[NCNotificationListInteractiveTransitionCoordinator setHapticPrepared:](self, "setHapticPrepared:", 1);
  }
}

- (void)_releaseHapticForListDisplayStyleTransition
{
  UIImpactFeedbackGenerator *feedbackGenerator;

  feedbackGenerator = self->_feedbackGenerator;
  self->_feedbackGenerator = 0;

  -[NCNotificationListInteractiveTransitionCoordinator setHapticPrepared:](self, "setHapticPrepared:", 0);
}

- (void)_performHapticForListDisplayStyleTransition
{
  -[UIImpactFeedbackGenerator impactOccurred](self->_feedbackGenerator, "impactOccurred");
}

- (BOOL)_shouldAllowExpandInteractiveTranslation
{
  void *v3;
  void *v4;
  unint64_t v5;
  int v6;

  if (-[NCNotificationListInteractiveTransitionCoordinator currentListDisplayStyleSetting](self, "currentListDisplayStyleSetting") == 1)
  {
    -[NCNotificationListInteractiveTransitionCoordinator interactiveListView](self, "interactiveListView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationListInteractiveTransitionCoordinator parentListView](self, "parentListView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[NCNotificationListInteractiveTransitionCoordinator _indexForInteractiveListView](self, "_indexForInteractiveListView");
    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
      LOBYTE(v6) = 0;
    else
      v6 = objc_msgSend(v4, "isRolledUnderView:atIndex:", v3, v5) ^ 1;

  }
  else
  {
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (void)_updateListDisplayStyleSetting:(int64_t)a3 isPersistentSetting:(BOOL)a4 hideRevealedList:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v9;

  v5 = a5;
  v6 = a4;
  -[NCNotificationListInteractiveTransitionCoordinator delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "notificationListInteractiveTransitionCoordinator:didUpdateListDisplaySetting:isPersistentSetting:hideRevealedList:", self, a3, v6, v5);

}

- (unint64_t)_countForInteractiveListView
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[NCNotificationListInteractiveTransitionCoordinator delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationListInteractiveTransitionCoordinator interactiveListView](self, "interactiveListView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "notificationListInteractiveTransitionCoordinator:requestsCountForInteractiveListView:", self, v4);

  return v5;
}

- (BOOL)_isHiddenListRevealed
{
  NCNotificationListInteractiveTransitionCoordinator *v2;
  void *v3;

  v2 = self;
  -[NCNotificationListInteractiveTransitionCoordinator delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "notificationListInteractiveTransitionCoordinatorRequestsIsHiddenListRevealed:", v2);

  return (char)v2;
}

- (BOOL)_isScrollingListContent
{
  NCNotificationListInteractiveTransitionCoordinator *v2;
  void *v3;

  v2 = self;
  -[NCNotificationListInteractiveTransitionCoordinator delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "notificationListInteractiveTransitionCoordinatorRequestsIsScrollingListContent:", v2);

  return (char)v2;
}

- (void)_migrateProminentNotificationsForHiddenSetting
{
  id v3;

  -[NCNotificationListInteractiveTransitionCoordinator delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notificationListInteractiveTransitionCoordinatorRequestsMigratingProminentNotificationsForHiddenSetting:", self);

}

- (BOOL)_isCurrentDigestVisible
{
  NCNotificationListInteractiveTransitionCoordinator *v2;
  void *v3;

  v2 = self;
  -[NCNotificationListInteractiveTransitionCoordinator delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "notificationListInteractiveTransitionCoordinatorRequestsIsCurrentDigestVisible:", v2);

  return (char)v2;
}

- (unint64_t)_indexForInteractiveListView
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[NCNotificationListInteractiveTransitionCoordinator delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationListInteractiveTransitionCoordinator interactiveListView](self, "interactiveListView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "notificationListInteractiveTransitionCoordinator:requestsIndexForInteractiveListView:", self, v4);

  return v5;
}

- (NCNotificationListInteractiveTransitionCoordinatorDelegate)delegate
{
  return (NCNotificationListInteractiveTransitionCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)currentListDisplayStyleSetting
{
  return self->_currentListDisplayStyleSetting;
}

- (void)setCurrentListDisplayStyleSetting:(int64_t)a3
{
  self->_currentListDisplayStyleSetting = a3;
}

- (NCNotificationListView)parentListView
{
  return (NCNotificationListView *)objc_loadWeakRetained((id *)&self->_parentListView);
}

- (void)setParentListView:(id)a3
{
  objc_storeWeak((id *)&self->_parentListView, a3);
}

- (NCNotificationListView)interactiveListView
{
  return (NCNotificationListView *)objc_loadWeakRetained((id *)&self->_interactiveListView);
}

- (void)setInteractiveListView:(id)a3
{
  objc_storeWeak((id *)&self->_interactiveListView, a3);
}

- (NCNotificationListView)revealListView
{
  return (NCNotificationListView *)objc_loadWeakRetained((id *)&self->_revealListView);
}

- (void)setRevealListView:(id)a3
{
  objc_storeWeak((id *)&self->_revealListView, a3);
}

- (UIPinchGestureRecognizer)interactiveTransitionPinchGestureRecognizer
{
  return self->_interactiveTransitionPinchGestureRecognizer;
}

- (void)setInteractiveTransitionPinchGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_interactiveTransitionPinchGestureRecognizer, a3);
}

- (UIPanGestureRecognizer)interactiveTransitionPanGestureRecognizer
{
  return self->_interactiveTransitionPanGestureRecognizer;
}

- (void)setInteractiveTransitionPanGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_interactiveTransitionPanGestureRecognizer, a3);
}

- (UIImpactFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackGenerator, a3);
}

- (BOOL)isHapticPrepared
{
  return self->_hapticPrepared;
}

- (void)setHapticPrepared:(BOOL)a3
{
  self->_hapticPrepared = a3;
}

- (BOOL)shouldPerformInteractiveExpandTransition
{
  return self->_shouldPerformInteractiveExpandTransition;
}

- (void)setShouldPerformInteractiveExpandTransition:(BOOL)a3
{
  self->_shouldPerformInteractiveExpandTransition = a3;
}

- (BOOL)shouldPerformInteractiveCollapseTransition
{
  return self->_shouldPerformInteractiveCollapseTransition;
}

- (void)setShouldPerformInteractiveCollapseTransition:(BOOL)a3
{
  self->_shouldPerformInteractiveCollapseTransition = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_interactiveTransitionPanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_interactiveTransitionPinchGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_revealListView);
  objc_destroyWeak((id *)&self->_interactiveListView);
  objc_destroyWeak((id *)&self->_parentListView);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
