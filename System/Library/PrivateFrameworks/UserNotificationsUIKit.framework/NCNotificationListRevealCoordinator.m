@implementation NCNotificationListRevealCoordinator

- (void)setSubLists:(id)a3
{
  objc_storeStrong((id *)&self->_subLists, a3);
}

- (unint64_t)indexForReveal
{
  return self->_indexForReveal;
}

- (void)notificationListWillBeginDragging:(id)a3
{
  int v4;
  void *v5;
  id v6;

  v6 = a3;
  -[NCNotificationListRevealCoordinator _refetchSubListViews](self, "_refetchSubListViews");
  objc_msgSend(v6, "setActiveRevealTransitioning:", 0);
  v4 = -[NCNotificationListRevealCoordinator revealState](self, "revealState");
  if (v4 == 2)
  {
    -[NCNotificationListRevealCoordinator setSectionRevealedStateLocked:](self, "setSectionRevealedStateLocked:", 1);
  }
  else
  {
    if (v4 == 1)
    {
      if (!-[NCNotificationListRevealCoordinator _isRevealSectionVisibleForListView:](self, "_isRevealSectionVisibleForListView:", v6)|| !-[NCNotificationListRevealCoordinator _shouldAllowNotificationListReveal](self, "_shouldAllowNotificationListReveal"))
      {
        -[NCNotificationListRevealCoordinator setRevealState:](self, "setRevealState:", 0);
        goto LABEL_12;
      }
      goto LABEL_10;
    }
    if (!v4
      && -[NCNotificationListRevealCoordinator _isRevealSectionVisibleForListView:](self, "_isRevealSectionVisibleForListView:", v6)&& -[NCNotificationListRevealCoordinator _shouldAllowNotificationListReveal](self, "_shouldAllowNotificationListReveal"))
    {
      -[NCNotificationListRevealCoordinator setRevealState:](self, "setRevealState:", 1);
LABEL_10:
      objc_msgSend(v6, "setActiveRevealTransitioning:", 1);
    }
  }
LABEL_12:
  -[NCNotificationListRevealCoordinator setShouldLimitTargetContentOffsetForNotificationListReveal:](self, "setShouldLimitTargetContentOffsetForNotificationListReveal:", 0);
  -[NCNotificationListRevealCoordinator _revealListView](self, "_revealListView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActiveRevealTransitioning:", 0);
  objc_msgSend(v5, "setRevealTransitionScrolling:", 0);
  objc_msgSend(v5, "setListRevealTargetContentOffsetClamped:", 0);
  objc_msgSend(v6, "setNeedsLayout");

}

- (void)notificationListDidScroll:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "contentOffset");
  v5 = v4;
  if (-[NCNotificationListRevealCoordinator shouldLimitTargetContentOffsetForNotificationListReveal](self, "shouldLimitTargetContentOffsetForNotificationListReveal"))
  {
    if ((objc_msgSend(v14, "isTracking") & 1) == 0)
    {
      -[NCNotificationListRevealCoordinator _settlingYPositionForReveal](self, "_settlingYPositionForReveal");
      if (v5 > v6)
        objc_msgSend(v14, "setContentOffset:", 0.0, v6);
    }
  }
  v7 = 0.0;
  if (-[NCNotificationListRevealCoordinator _shouldAllowNotificationListReveal](self, "_shouldAllowNotificationListReveal"))
  {
    if (-[NCNotificationListRevealCoordinator revealState](self, "revealState") != 2
      || !-[NCNotificationListRevealCoordinator isSectionRevealedStateLocked](self, "isSectionRevealedStateLocked"))
    {
      -[NCNotificationListRevealCoordinator _updateRevealPercentageForNotificationListView:](self, "_updateRevealPercentageForNotificationListView:", v14);
      v7 = v8;
      if (v8 <= 0.6)
        -[NCNotificationListRevealCoordinator _releaseHaptic](self, "_releaseHaptic");
      else
        -[NCNotificationListRevealCoordinator _prepareHaptic](self, "_prepareHaptic");
    }
    if (-[NCNotificationListRevealCoordinator revealState](self, "revealState") != 2)
      -[NCNotificationListRevealCoordinator _performRevealForSubviewsIfNecessary](self, "_performRevealForSubviewsIfNecessary");
  }
  v9 = -[NCNotificationListRevealCoordinator revealState](self, "revealState");
  if (v9 == 2)
  {
    if (-[NCNotificationListRevealCoordinator isSectionRevealed](self, "isSectionRevealed")
      && !-[NCNotificationListRevealCoordinator isSectionRevealedStateLocked](self, "isSectionRevealedStateLocked")
      && (v12 = objc_msgSend(v14, "isDragging"), v7 < 1.0)
      && v12)
    {
      -[NCNotificationListRevealCoordinator setSectionRevealed:](self, "setSectionRevealed:", 0);
      -[NCNotificationListRevealCoordinator setRevealState:](self, "setRevealState:", 1);
      -[NCNotificationListRevealCoordinator setShouldLimitTargetContentOffsetForNotificationListReveal:](self, "setShouldLimitTargetContentOffsetForNotificationListReveal:", 0);
      objc_msgSend(v14, "setActiveRevealTransitioning:", 1);
      -[NCNotificationListRevealCoordinator _performHaptic](self, "_performHaptic");
    }
    else if (-[NCNotificationListRevealCoordinator isSectionRevealedStateLocked](self, "isSectionRevealedStateLocked"))
    {
      -[NCNotificationListRevealCoordinator _releaseHaptic](self, "_releaseHaptic");
    }
  }
  else if (v9 == 1)
  {
    if (v7 >= 1.0
      && -[NCNotificationListRevealCoordinator _revealSectionHasContent](self, "_revealSectionHasContent")
      && -[NCNotificationListRevealCoordinator _shouldAllowNotificationListRevealTransition](self, "_shouldAllowNotificationListRevealTransition"))
    {
      -[NCNotificationListRevealCoordinator setSectionRevealed:](self, "setSectionRevealed:", 1);
      -[NCNotificationListRevealCoordinator setRevealState:](self, "setRevealState:", 2);
      -[NCNotificationListRevealCoordinator setShouldLimitTargetContentOffsetForNotificationListReveal:](self, "setShouldLimitTargetContentOffsetForNotificationListReveal:", 1);
      objc_msgSend(v14, "setActiveRevealTransitioning:", 1);
      -[NCNotificationListRevealCoordinator _revealListView](self, "_revealListView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setActiveRevealTransitioning:", 1);
      objc_msgSend(v10, "setRevealTransitionScrolling:", 1);
      -[NCNotificationListRevealCoordinator _performHaptic](self, "_performHaptic");
      -[NCNotificationListRevealCoordinator delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "revealCoordinatorDidScrollToReveal:", self);

    }
    objc_msgSend(v14, "setActiveRevealTransitioning:", 1);
  }
  if ((objc_msgSend(v14, "isTracking") & 1) == 0)
  {
    objc_msgSend(v14, "setActiveRevealTransitioning:", 0);
    -[NCNotificationListRevealCoordinator _revealListView](self, "_revealListView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setActiveRevealTransitioning:", 0);

  }
}

- (void)notificationListViewWillEndDragging:(id)a3 withTargetContentOffset:(CGPoint *)a4
{
  double v6;
  double y;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  if (-[NCNotificationListRevealCoordinator shouldLimitTargetContentOffsetForNotificationListReveal](self, "shouldLimitTargetContentOffsetForNotificationListReveal"))
  {
    -[NCNotificationListRevealCoordinator _settlingYPositionForReveal](self, "_settlingYPositionForReveal");
    y = a4->y;
    if (y > v6)
    {
      a4->x = 0.0;
      a4->y = v6;
      -[NCNotificationListRevealCoordinator _revealListView](self, "_revealListView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = 0;
LABEL_6:
      objc_msgSend(v8, "setListRevealTargetContentOffsetClamped:", v10);

      goto LABEL_7;
    }
    objc_msgSend(v14, "contentInset");
    if (y == -v11)
    {
      -[NCNotificationListRevealCoordinator _revealListView](self, "_revealListView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = 1;
      goto LABEL_6;
    }
  }
LABEL_7:
  if (!-[NCNotificationListRevealCoordinator isSectionRevealedStateLocked](self, "isSectionRevealedStateLocked")
    && -[NCNotificationListRevealCoordinator revealState](self, "revealState") == 2)
  {
    +[NCNotificationEventTracker sharedInstance](NCNotificationEventTracker, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "notificationCenterAppeared");

    -[NCNotificationListRevealCoordinator setSectionRevealedStateLocked:](self, "setSectionRevealedStateLocked:", 1);
  }
  if (-[NCNotificationListRevealCoordinator revealState](self, "revealState") != 2)
  {
    -[NCNotificationListRevealCoordinator setRevealPercentage:](self, "setRevealPercentage:", 0.0);
    -[NCNotificationListRevealCoordinator _performRevealForSubviewsIfNecessary](self, "_performRevealForSubviewsIfNecessary");
  }
  objc_msgSend(v14, "setActiveRevealTransitioning:", 0);
  -[NCNotificationListRevealCoordinator _revealListView](self, "_revealListView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setActiveRevealTransitioning:", 0);

  objc_msgSend(v14, "setNeedsLayout");
}

- (void)notificationListViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  void *v6;
  int v7;
  id v8;

  if (-[NCNotificationListRevealCoordinator revealState](self, "revealState", a3) != 2)
  {
    -[NCNotificationListRevealCoordinator setRevealState:](self, "setRevealState:", 0);
    -[NCNotificationListRevealCoordinator setRevealPercentage:](self, "setRevealPercentage:", 0.0);
    -[NCNotificationListRevealCoordinator _performRevealForSubviewsIfNecessary](self, "_performRevealForSubviewsIfNecessary");
  }
  if (!a4)
  {
    -[NCNotificationListRevealCoordinator _revealListView](self, "_revealListView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isRevealTransitionScrolling");

    if (v7)
    {
      -[NCNotificationListRevealCoordinator _revealListView](self, "_revealListView");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setRevealTransitionScrolling:", 0);

    }
  }
}

- (void)notificationListViewDidEndDecelerating:(id)a3
{
  id v4;

  if (-[NCNotificationListRevealCoordinator revealState](self, "revealState", a3) != 2)
  {
    -[NCNotificationListRevealCoordinator setRevealState:](self, "setRevealState:", 0);
    -[NCNotificationListRevealCoordinator setRevealPercentage:](self, "setRevealPercentage:", 0.0);
    -[NCNotificationListRevealCoordinator _performRevealForSubviewsIfNecessary](self, "_performRevealForSubviewsIfNecessary");
  }
  -[NCNotificationListRevealCoordinator _revealListView](self, "_revealListView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRevealTransitionScrolling:", 0);

}

- (void)setRevealState:(int)a3
{
  uint64_t v3;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->_revealState != a3)
  {
    v3 = *(_QWORD *)&a3;
    v5 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationListRevealCoordinator _stringForRevealState:](self, "_stringForRevealState:", self->_revealState);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationListRevealCoordinator _stringForRevealState:](self, "_stringForRevealState:", v3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543874;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      v16 = 2112;
      v17 = v10;
      _os_log_impl(&dword_1CFC3D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ setting notification list history reveal state from %@ to %@", (uint8_t *)&v12, 0x20u);

    }
    self->_revealState = v3;
    -[NCNotificationListRevealCoordinator delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "notificationListRevealCoordinator:updatedRevealState:", self, (_DWORD)v3 == 2);

  }
}

- (void)setForceRevealed:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;

  v3 = a3;
  +[NCNotificationEventTracker sharedInstance](NCNotificationEventTracker, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    objc_msgSend(v5, "notificationCenterAppeared");
    v7 = 2;
    v8 = 1.0;
  }
  else
  {
    objc_msgSend(v5, "notificationCenterDisappeared");
    v7 = 0;
    v8 = 0.0;
  }

  -[NCNotificationListRevealCoordinator _refetchSubListViews](self, "_refetchSubListViews");
  -[NCNotificationListRevealCoordinator setRevealState:](self, "setRevealState:", v7);
  -[NCNotificationListRevealCoordinator setRevealPercentage:](self, "setRevealPercentage:", v8);
  -[NCNotificationListRevealCoordinator setSectionRevealedStateLocked:](self, "setSectionRevealedStateLocked:", v3);
  -[NCNotificationListRevealCoordinator _releaseHaptic](self, "_releaseHaptic");
  -[NCNotificationListRevealCoordinator _performRevealForSubviewsIfNecessary](self, "_performRevealForSubviewsIfNecessary");
}

- (void)setSectionRevealedStateLocked:(BOOL)a3
{
  self->_sectionRevealedStateLocked = a3;
}

- (void)_refetchSubListViews
{
  NSArray *v3;
  NSArray *subLists;
  id v5;

  -[NCNotificationListRevealCoordinator delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subListsForNotificationListRevealCoordinator:", self);
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  subLists = self->_subLists;
  self->_subLists = v3;

}

- (BOOL)_shouldAllowNotificationListReveal
{
  NCNotificationListRevealCoordinator *v2;
  void *v3;

  v2 = self;
  -[NCNotificationListRevealCoordinator delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "notificationListRevealCoordinatorShouldAllowReveal:", v2);

  return (char)v2;
}

- (BOOL)_shouldAllowNotificationListRevealTransition
{
  NCNotificationListRevealCoordinator *v2;
  void *v3;

  v2 = self;
  -[NCNotificationListRevealCoordinator delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "notificationListRevealCoordinatorShouldAllowRevealTransition:", v2);

  return (char)v2;
}

- (BOOL)_revealSectionHasContent
{
  NCNotificationListRevealCoordinator *v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = self;
  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[NCNotificationListRevealCoordinator subLists](self, "subLists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__NCNotificationListRevealCoordinator__revealSectionHasContent__block_invoke;
  v5[3] = &unk_1E8D1DC80;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v5);

  LOBYTE(v2) = v7[3] > 0.0;
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __63__NCNotificationListRevealCoordinator__revealSectionHasContent__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  CGRect v6;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "indexForReveal") <= a3)
  {
    objc_msgSend(v5, "frame");
    *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CGRectGetHeight(v6)
                                                                 + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                             + 24);
  }

}

- (BOOL)_isRevealSectionVisibleForListView:(id)a3
{
  id v4;
  void *v5;
  id v6;
  BOOL v7;
  double MinY;
  double v9;
  double v10;
  CGRect v12;
  CGRect v13;

  v4 = a3;
  -[NCNotificationListRevealCoordinator _revealListView](self, "_revealListView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "superview");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v4)
  {
    objc_msgSend(v5, "frame");
    MinY = CGRectGetMinY(v12);
    objc_msgSend(v4, "contentOffset");
    v10 = v9;
    objc_msgSend(v4, "frame");
    v7 = MinY < v10 + CGRectGetHeight(v13);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (double)_settlingYPositionForReveal
{
  void *v2;
  double v3;
  CGRect v5;

  -[NCNotificationListRevealCoordinator _revealListView](self, "_revealListView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v3 = CGRectGetMinY(v5) + -40.0;

  return v3;
}

- (double)_updateRevealPercentageForNotificationListView:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double MaxY;
  double Height;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  v4 = a3;
  v5 = -[NCNotificationListRevealCoordinator indexForReveal](self, "indexForReveal") - 1;
  if (v5 < 0
    || (-[NCNotificationListRevealCoordinator subLists](self, "subLists"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "count"),
        v6,
        v5 >= v7))
  {
    v28 = (void *)*MEMORY[0x1E0DC5F90];
    v29 = 1.0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_ERROR))
      -[NCNotificationListRevealCoordinator _updateRevealPercentageForNotificationListView:].cold.1(v28, self, v5);
  }
  else
  {
    -[NCNotificationListRevealCoordinator subLists](self, "subLists");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[NCNotificationListRevealCoordinator _revealListView](self, "_revealListView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    objc_msgSend(v4, "contentInset");
    v20 = v19;
    v37.origin.x = v12;
    v37.origin.y = v14;
    v37.size.width = v16;
    v37.size.height = v18;
    MaxY = CGRectGetMaxY(v37);
    objc_msgSend(v4, "frame");
    Height = CGRectGetHeight(v38);
    objc_msgSend(v4, "contentOffset");
    v24 = v23;
    objc_msgSend(v4, "contentOffset");
    if (MaxY >= Height - v20)
    {
      v30 = Height + v25;
      objc_msgSend(v10, "frame");
      v26 = v30 - CGRectGetMinY(v39);
      v27 = 200.0;
    }
    else
    {
      v26 = v20 + v24;
      v27 = 75.0;
    }
    v31 = v26 / v27;
    -[NCNotificationListRevealCoordinator interactionTranslation](self, "interactionTranslation");
    if (v32 > 0.0)
    {
      -[NCNotificationListRevealCoordinator interactionTranslation](self, "interactionTranslation");
      v34 = v33 / 75.0;
      if (v34 >= v31)
        v31 = v34;
    }
    v35 = 1.0;
    if (v31 <= 1.0)
      v35 = v31;
    if (v35 >= 0.0)
      v29 = v35;
    else
      v29 = 0.0;
    if (self->_revealPercentage != v29)
      self->_revealPercentage = v29;

  }
  return v29;
}

- (id)_revealListView
{
  void *v3;
  unint64_t v4;
  void *v5;

  -[NCNotificationListRevealCoordinator subLists](self, "subLists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  if (v4 >= -[NCNotificationListRevealCoordinator indexForReveal](self, "indexForReveal") + 1)
  {
    objc_msgSend(v3, "objectAtIndex:", -[NCNotificationListRevealCoordinator indexForReveal](self, "indexForReveal"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_performRevealForSubviewsIfNecessary
{
  void *v3;
  unint64_t v4;
  double v5;
  double v6;
  _BOOL8 v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  -[NCNotificationListRevealCoordinator subLists](self, "subLists");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v15, "count");
  -[NCNotificationListRevealCoordinator revealPercentage](self, "revealPercentage");
  v6 = v5;
  v7 = v5 >= 1.0 && -[NCNotificationListRevealCoordinator revealState](self, "revealState") != 0;
  v8 = -[NCNotificationListRevealCoordinator indexForReveal](self, "indexForReveal");
  if (v8 < v4)
  {
    v9 = v8;
    v10 = 0;
    do
    {
      objc_msgSend(v15, "objectAtIndex:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v3 && v11)
      {
        objc_msgSend(v11, "setRevealPercentage:", v6 / (double)(unint64_t)(v10 + 1));
        objc_msgSend(v12, "setRevealed:", v7);
        objc_msgSend(v12, "setLeadingRevealView:", v10 == 0);
        objc_msgSend(v12, "setRevealIndexOffset:", v10);
        objc_msgSend(v12, "setNeedsLayout");
        if ((objc_msgSend(v12, "isGrouped") & 1) != 0)
        {
          v13 = 2;
        }
        else
        {
          v14 = objc_msgSend(v12, "count");
          if (v14)
            v13 = v14 + 1;
          else
            v13 = 0;
        }
        v10 += v13;
      }

      ++v9;
    }
    while (v4 != v9);
  }

}

- (id)_stringForRevealState:(int)a3
{
  const __CFString *v3;

  v3 = CFSTR("DEACTIVATED");
  if (a3 == 1)
    v3 = CFSTR("ACTIVATED");
  if (a3 == 2)
    return CFSTR("TRIGGERED");
  else
    return (id)v3;
}

- (void)_prepareHaptic
{
  UIImpactFeedbackGenerator *feedbackGenerator;
  UIImpactFeedbackGenerator *v4;
  UIImpactFeedbackGenerator *v5;

  if (!-[NCNotificationListRevealCoordinator isHapticPrepared](self, "isHapticPrepared"))
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
    -[NCNotificationListRevealCoordinator setHapticPrepared:](self, "setHapticPrepared:", 1);
  }
}

- (void)_releaseHaptic
{
  UIImpactFeedbackGenerator *feedbackGenerator;

  feedbackGenerator = self->_feedbackGenerator;
  self->_feedbackGenerator = 0;

  -[NCNotificationListRevealCoordinator setHapticPrepared:](self, "setHapticPrepared:", 0);
}

- (void)_performHaptic
{
  -[UIImpactFeedbackGenerator impactOccurred](self->_feedbackGenerator, "impactOccurred");
}

- (NCNotificationListRevealCoordinatorDelegate)delegate
{
  return (NCNotificationListRevealCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isForceRevealed
{
  return self->_forceRevealed;
}

- (void)setIndexForReveal:(unint64_t)a3
{
  self->_indexForReveal = a3;
}

- (NSArray)subLists
{
  return self->_subLists;
}

- (double)interactionTranslation
{
  return self->_interactionTranslation;
}

- (void)setInteractionTranslation:(double)a3
{
  self->_interactionTranslation = a3;
}

- (int)revealState
{
  return self->_revealState;
}

- (double)revealPercentage
{
  return self->_revealPercentage;
}

- (void)setRevealPercentage:(double)a3
{
  self->_revealPercentage = a3;
}

- (BOOL)isSectionRevealed
{
  return self->_sectionRevealed;
}

- (void)setSectionRevealed:(BOOL)a3
{
  self->_sectionRevealed = a3;
}

- (BOOL)isSectionRevealedStateLocked
{
  return self->_sectionRevealedStateLocked;
}

- (BOOL)shouldLimitTargetContentOffsetForNotificationListReveal
{
  return self->_shouldLimitTargetContentOffsetForNotificationListReveal;
}

- (void)setShouldLimitTargetContentOffsetForNotificationListReveal:(BOOL)a3
{
  self->_shouldLimitTargetContentOffsetForNotificationListReveal = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_subLists, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_updateRevealPercentageForNotificationListView:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "subLists");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138543874;
  v10 = v7;
  v11 = 2050;
  v12 = a3;
  v13 = 2050;
  v14 = objc_msgSend(v8, "count");
  _os_log_error_impl(&dword_1CFC3D000, v5, OS_LOG_TYPE_ERROR, "%{public}@ The top view index, '%{public}lu,' is out of bounds. Sublists size: %{public}lu", (uint8_t *)&v9, 0x20u);

}

@end
