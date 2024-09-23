@implementation PXStoryViewDismissalController

- (PXStoryViewDismissalController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryViewDismissalController.m"), 59, CFSTR("%s is not available as initializer"), "-[PXStoryViewDismissalController init]");

  abort();
}

- (PXStoryViewDismissalController)initWithViewModel:(id)a3
{
  id v5;
  PXStoryViewDismissalController *v6;
  PXStoryViewDismissalController *v7;
  uint64_t v8;
  PXUpdater *updater;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXStoryViewDismissalController;
  v6 = -[PXStoryViewDismissalController init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_viewModel, a3);
    v7->_currentGestureLocation = *(CGPoint *)off_1E50B8580;
    v8 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:needsUpdateSelector:", v7, sel__setNeedsUpdate);
    updater = v7->_updater;
    v7->_updater = (PXUpdater *)v8;

    -[PXUpdater addUpdateSelector:](v7->_updater, "addUpdateSelector:", sel__updateInitialItemPlacement);
    -[PXUpdater addUpdateSelector:](v7->_updater, "addUpdateSelector:", sel__updateSwipeDownTracker);
    -[PXUpdater addUpdateSelector:](v7->_updater, "addUpdateSelector:", sel__updateCurrentPlacement);
  }

  return v7;
}

- (void)handlePanDownGestureRecognizer:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t v14[8];
  _QWORD v15[4];
  id v16;
  _QWORD aBlock[5];
  id v18;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__PXStoryViewDismissalController_handlePanDownGestureRecognizer___block_invoke;
  aBlock[3] = &unk_1E5148D08;
  aBlock[4] = self;
  v6 = v4;
  v18 = v6;
  v7 = (void (**)(_QWORD))_Block_copy(aBlock);
  switch(objc_msgSend(v6, "state"))
  {
    case 0:
    case 3:
    case 4:
    case 5:
      if (-[PXStoryViewDismissalController state](self, "state") == 1)
        -[PXStoryViewDismissalController setCurrentGestureLocation:](self, "setCurrentGestureLocation:", *(double *)off_1E50B8580, *((double *)off_1E50B8580 + 1));
      break;
    case 1:
      if (-[PXStoryViewDismissalController state](self, "state")
        || (-[PXStoryViewDismissalController viewControllerTransition](self, "viewControllerTransition"),
            v8 = (void *)objc_claimAutoreleasedReturnValue(),
            v8,
            v8))
      {
        PLStoryGetLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v14 = 0;
          _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "Pan down began before previous dismissal completed, ignoring.", v14, 2u);
        }

      }
      else
      {
        -[PXStoryViewDismissalController viewModel](self, "viewModel");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "actionPerformer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "dismissStoryViewControllerInteractively");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          -[PXStoryViewDismissalController setViewControllerTransition:](self, "setViewControllerTransition:", v12);
          v7[2](v7);
          -[PXStoryViewDismissalController currentGestureLocation](self, "currentGestureLocation");
          -[PXStoryViewDismissalController setInitialGestureLocation:](self, "setInitialGestureLocation:");
          -[PXStoryViewDismissalController setState:](self, "setState:", 1);
          -[PXStoryViewDismissalController viewModel](self, "viewModel");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v15[0] = v5;
          v15[1] = 3221225472;
          v15[2] = __65__PXStoryViewDismissalController_handlePanDownGestureRecognizer___block_invoke_2;
          v15[3] = &unk_1E5146E78;
          v16 = v11;
          objc_msgSend(v13, "performChanges:", v15);

        }
        else
        {
          objc_msgSend(v11, "dismissStoryViewController");
          objc_msgSend(v6, "px_cancel");
        }

      }
      break;
    case 2:
      if (-[PXStoryViewDismissalController state](self, "state") == 1)
        v7[2](v7);
      break;
    default:
      break;
  }

}

- (void)setViewControllerTransition:(id)a3
{
  PXGViewControllerTransition *v5;
  PXGViewControllerTransition *viewControllerTransition;
  void *v7;
  void *v8;
  PXGViewControllerTransition *v9;

  v5 = (PXGViewControllerTransition *)a3;
  viewControllerTransition = self->_viewControllerTransition;
  v9 = v5;
  if (viewControllerTransition != v5)
  {
    -[PXGViewControllerTransition unregisterChangeObserver:context:](viewControllerTransition, "unregisterChangeObserver:context:", self, ViewControllerTransitionObservationContext);
    objc_storeStrong((id *)&self->_viewControllerTransition, a3);
    -[PXGViewControllerTransition registerChangeObserver:context:](self->_viewControllerTransition, "registerChangeObserver:context:", self, ViewControllerTransitionObservationContext);
    -[PXStoryViewDismissalController _invalidateInitialItemPlacement](self, "_invalidateInitialItemPlacement");
    -[PXGViewControllerTransition detailViewController](v9, "detailViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryViewDismissalController setReferenceView:](self, "setReferenceView:", v8);

  }
}

- (void)setCurrentGestureLocation:(CGPoint)a3
{
  if (a3.x != self->_currentGestureLocation.x || a3.y != self->_currentGestureLocation.y)
  {
    self->_currentGestureLocation = a3;
    -[PXStoryViewDismissalController _invalidateSwipeDownTracker](self, "_invalidateSwipeDownTracker");
  }
}

- (void)setCurrentGestureVelocity:(CGPoint)a3
{
  if (a3.x != self->_currentGestureVelocity.x || a3.y != self->_currentGestureVelocity.y)
  {
    self->_currentGestureVelocity = a3;
    -[PXStoryViewDismissalController _invalidateSwipeDownTracker](self, "_invalidateSwipeDownTracker");
  }
}

- (void)setInitialItemPlacement:(id)a3
{
  PXGItemPlacement *v5;
  char v6;
  PXGItemPlacement *v7;

  v7 = (PXGItemPlacement *)a3;
  v5 = self->_initialItemPlacement;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXGItemPlacement isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_initialItemPlacement, a3);
      -[PXStoryViewDismissalController _invalidateSwipeDownTracker](self, "_invalidateSwipeDownTracker");
    }
  }

}

- (void)setCenterOffsetAnimator:(id)a3
{
  PXPointAnimator *v5;
  PXPointAnimator *centerOffsetAnimator;
  PXPointAnimator *v7;

  v5 = (PXPointAnimator *)a3;
  centerOffsetAnimator = self->_centerOffsetAnimator;
  if (centerOffsetAnimator != v5)
  {
    v7 = v5;
    -[PXPointAnimator unregisterChangeObserver:context:](centerOffsetAnimator, "unregisterChangeObserver:context:", self, FinalAnimatorObservationContext);
    objc_storeStrong((id *)&self->_centerOffsetAnimator, a3);
    -[PXPointAnimator registerChangeObserver:context:](self->_centerOffsetAnimator, "registerChangeObserver:context:", self, FinalAnimatorObservationContext);
    -[PXStoryViewDismissalController _invalidateCurrentPlacement](self, "_invalidateCurrentPlacement");
    v5 = v7;
  }

}

- (void)_setNeedsUpdate
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __49__PXStoryViewDismissalController__setNeedsUpdate__block_invoke;
  v2[3] = &unk_1E5148D30;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)_invalidateInitialItemPlacement
{
  id v2;

  -[PXStoryViewDismissalController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateInitialItemPlacement);

}

- (void)_updateInitialItemPlacement
{
  void *v3;
  id v4;

  -[PXStoryViewDismissalController viewControllerTransition](self, "viewControllerTransition");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "detailItemOriginalPlacement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryViewDismissalController setInitialItemPlacement:](self, "setInitialItemPlacement:", v3);

}

- (void)_invalidateSwipeDownTracker
{
  id v2;

  -[PXStoryViewDismissalController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateSwipeDownTracker);

}

- (void)_updateSwipeDownTracker
{
  void *v4;
  uint64_t v5;
  void *v6;
  __int128 *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  PXSwipeDownTracker *v16;
  _BOOL4 v17;
  void *v18;
  unsigned int v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  double v35;
  __int128 v36;
  void (**v37)(void *, void *);
  void *v38;
  _BOOL4 v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  double v56;
  CGFloat v57;
  CGFloat *v58;
  double MaxY;
  double v60;
  NSObject *v61;
  _QWORD *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  double v67;
  double v68;
  double v69;
  double v70;
  id v71;
  void *v72;
  void *v73;
  double v74;
  double v75;
  id v76;
  id v77;
  void *v78;
  _BOOL8 v79;
  void *v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  _QWORD v86[4];
  BOOL v87;
  _QWORD aBlock[5];
  id v89;
  __int128 *v90;
  SEL v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  uint8_t buf[4];
  PXStoryViewDismissalController *v97;
  uint64_t v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;

  v98 = *MEMORY[0x1E0C80C00];
  -[PXStoryViewDismissalController initialItemPlacement](self, "initialItemPlacement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryViewDismissalController referenceView](self, "referenceView");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = (__int128 *)MEMORY[0x1E0C9D628];
  v8 = *MEMORY[0x1E0C9D628];
  v9 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v10 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v11 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  if (v4 && v5)
  {
    objc_msgSend(v4, "rectInCoordinateSpace:velocity:", v5, 0);
    v8 = v12;
    v9 = v13;
    v10 = v14;
    v11 = v15;
  }
  -[PXStoryViewDismissalController currentGestureLocation](self, "currentGestureLocation");
  -[PXStoryViewDismissalController swipeDownTracker](self, "swipeDownTracker");
  v16 = (PXSwipeDownTracker *)objc_claimAutoreleasedReturnValue();
  if (-[PXStoryViewDismissalController state](self, "state") == 1)
  {
    v99.origin.x = v8;
    v99.origin.y = v9;
    v99.size.width = v10;
    v99.size.height = v11;
    v17 = !CGRectIsNull(v99);
  }
  else
  {
    v17 = 0;
  }
  -[PXStoryViewDismissalController viewControllerTransition](self, "viewControllerTransition");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isVerticalOnly");

  if (v17)
  {
    if (!v16)
    {
      v16 = -[PXSwipeDownTracker initWithOptions:]([PXSwipeDownTracker alloc], "initWithOptions:", v19);
      -[PXStoryViewDismissalController initialGestureLocation](self, "initialGestureLocation");
      v21 = v20;
      v23 = v22;
      if (PXPointIsNull())
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryViewDismissalController.m"), 217, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!PXPointIsNull(initialGestureLocation)"));

      }
      PXRectGetCenter();
      v82 = v25;
      v84 = v24;
      -[PXStoryViewDismissalController currentGestureVelocity](self, "currentGestureVelocity");
      v26 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v92 = *MEMORY[0x1E0C9BAA8];
      v93 = v26;
      v94 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      -[PXSwipeDownTracker startTrackingCenter:bounds:transform:withInitialGestureLocation:velocity:](v16, "startTrackingCenter:bounds:transform:withInitialGestureLocation:velocity:", &v92, v84, v82, v8, v9, v10, v11, v21, v23, v27, v28);
    }
    if ((PXPointIsNull() & 1) != 0)
    {
      -[PXSwipeDownTracker trackedCenter](v16, "trackedCenter");
      -[PXSwipeDownTracker trackedBounds](v16, "trackedBounds");
      PXRectWithCenterAndSize();
      v85 = v29;
      v31 = v30;
      v33 = v32;
      v35 = v34;
      PXRectGetCenter();
      *(_QWORD *)&v92 = 0;
      *((_QWORD *)&v92 + 1) = &v92;
      *(_QWORD *)&v93 = 0x4010000000;
      *((_QWORD *)&v93 + 1) = &unk_1A7E74EE7;
      v36 = v7[1];
      v94 = *v7;
      v95 = v36;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __57__PXStoryViewDismissalController__updateSwipeDownTracker__block_invoke;
      aBlock[3] = &unk_1E5121200;
      v90 = &v92;
      v91 = a2;
      aBlock[4] = self;
      v89 = v6;
      v37 = (void (**)(void *, void *))_Block_copy(aBlock);
      -[PXStoryViewDismissalController viewControllerTransition](self, "viewControllerTransition");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = -[PXSwipeDownTracker shouldFinishDismissal](v16, "shouldFinishDismissal");
      if (v39)
        objc_msgSend(v38, "summaryItemOriginalPlacement");
      else
        objc_msgSend(v38, "detailItemOriginalPlacement");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v37[2](v37, v40);

      -[PXSwipeDownTracker trackedVelocity](v16, "trackedVelocity");
      v81 = v47;
      v83 = v48;
      -[PXStoryViewDismissalController referenceView](self, "referenceView");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "bounds");
      v51 = v50;
      v53 = v52;
      v55 = v54;
      v57 = v56;

      v58 = (CGFloat *)*((_QWORD *)&v92 + 1);
      if (v19)
      {
        if (v39)
        {
          *(CGFloat *)(*((_QWORD *)&v92 + 1) + 32) = v31;
          v58[5] = v33;
          v58[6] = v85;
          v58[7] = v35;
          v100.origin.x = v51;
          v100.origin.y = v53;
          v100.size.width = v55;
          v100.size.height = v57;
          MaxY = CGRectGetMaxY(v100);
          v101.origin.x = v31;
          v101.origin.y = v33;
          v101.size.width = v85;
          v101.size.height = v35;
          v60 = CGRectGetMinY(v101) + v83 * 0.3;
          if (MaxY + 50.0 >= v60)
            v60 = MaxY + 50.0;
          if (v60 < *(double *)(*((_QWORD *)&v92 + 1) + 40))
            v60 = *(double *)(*((_QWORD *)&v92 + 1) + 40);
          *(double *)(*((_QWORD *)&v92 + 1) + 40) = v60;
        }
      }
      else if (CGRectIsEmpty(*(CGRect *)(*((_QWORD *)&v92 + 1) + 32)))
      {
        PLStoryGetLog();
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v97 = self;
          _os_log_impl(&dword_1A6789000, v61, OS_LOG_TYPE_DEFAULT, "%@ missing target rect, falling back to center of screen", buf, 0xCu);
        }

        PXRectGetCenter();
        PXRectWithCenterAndSize();
        v62 = (_QWORD *)*((_QWORD *)&v92 + 1);
        *(_QWORD *)(*((_QWORD *)&v92 + 1) + 32) = v63;
        v62[5] = v64;
        v62[6] = v65;
        v62[7] = v66;
      }
      PXRectGetCenter();
      v68 = v67;
      v70 = v69;
      v71 = objc_alloc((Class)off_1E50B4580);
      PXPointSubtract();
      v72 = (void *)objc_msgSend(v71, "initWithValue:");
      +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "viewModeTransitionSpringStiffness");
      v75 = v74;

      objc_msgSend(v72, "performChangesUsingSpringAnimationWithStiffness:dampingRatio:initialVelocity:changes:", &__block_literal_global_72110, v75, 1.0, v81, v83);
      v76 = objc_alloc_init((Class)off_1E50B3760);
      objc_msgSend(v76, "performChangesUsingSpringAnimationWithStiffness:dampingRatio:initialVelocity:changes:", &__block_literal_global_28, v75, 1.0, 0.0);
      v77 = objc_alloc((Class)off_1E50B3760);
      -[PXSwipeDownTracker dismissalProgress](v16, "dismissalProgress");
      v78 = (void *)objc_msgSend(v77, "initWithValue:");
      v79 = !v39;
      v86[0] = MEMORY[0x1E0C809B0];
      v86[1] = 3221225472;
      v86[2] = __57__PXStoryViewDismissalController__updateSwipeDownTracker__block_invoke_3;
      v86[3] = &__block_descriptor_33_e35_v16__0___PXMutableNumberAnimator__8l;
      v87 = v79;
      objc_msgSend(v78, "performChangesUsingSpringAnimationWithStiffness:dampingRatio:initialVelocity:changes:", v86, v75, 1.0, 0.0);
      -[PXStoryViewDismissalController setState:](self, "setState:", 2);
      -[PXStoryViewDismissalController setReleaseAnimationDismissalProgressAnimator:](self, "setReleaseAnimationDismissalProgressAnimator:", v78);
      -[PXStoryViewDismissalController setReleaseAnimationProgressAnimator:](self, "setReleaseAnimationProgressAnimator:", v76);
      -[PXStoryViewDismissalController setCenterOffsetAnimator:](self, "setCenterOffsetAnimator:", v72);
      -[PXStoryViewDismissalController setTargetCenter:](self, "setTargetCenter:", v68, v70);
      -[PXStoryViewDismissalController setSourceSize:](self, "setSourceSize:", v85, v35);
      -[PXStoryViewDismissalController setTargetSize:](self, "setTargetSize:", *(double *)(*((_QWORD *)&v92 + 1) + 48), *(double *)(*((_QWORD *)&v92 + 1) + 56));
      -[PXStoryViewDismissalController setTargetCancelled:](self, "setTargetCancelled:", v79);

      _Block_object_dispose(&v92, 8);
    }
    else
    {
      -[PXStoryViewDismissalController initialGestureLocation](self, "initialGestureLocation");
      PXPointSubtract();
      v42 = v41;
      v44 = v43;
      -[PXStoryViewDismissalController currentGestureVelocity](self, "currentGestureVelocity");
      -[PXSwipeDownTracker trackGestureTranslation:velocity:](v16, "trackGestureTranslation:velocity:", v42, v44, v45, v46);
    }
    -[PXStoryViewDismissalController _invalidateCurrentPlacement](self, "_invalidateCurrentPlacement");
  }
  else
  {

    if (-[PXStoryViewDismissalController state](self, "state") == 1 && PXPointIsNull())
    {
      -[PXStoryViewDismissalController setState:](self, "setState:", 2);
      -[PXStoryViewDismissalController _invalidateCurrentPlacement](self, "_invalidateCurrentPlacement");
    }
    v16 = 0;
  }
  -[PXStoryViewDismissalController setSwipeDownTracker:](self, "setSwipeDownTracker:", v16);

}

- (void)_invalidateCurrentPlacement
{
  id v2;

  -[PXStoryViewDismissalController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateCurrentPlacement);

}

- (void)_updateCurrentPlacement
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  NSObject *v28;
  id v29;
  _QWORD v30[5];
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint8_t buf[16];

  -[PXStoryViewDismissalController viewControllerTransition](self, "viewControllerTransition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0C9D628];
  v5 = *(_QWORD *)(MEMORY[0x1E0C9D628] + 8);
  v6 = *(_QWORD *)(MEMORY[0x1E0C9D628] + 16);
  v7 = *(_QWORD *)(MEMORY[0x1E0C9D628] + 24);
  v8 = -[PXStoryViewDismissalController state](self, "state");
  if (v8 == 2)
  {
    -[PXStoryViewDismissalController releaseAnimationProgressAnimator](self, "releaseAnimationProgressAnimator");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "presentationValue");
    v19 = v18;
    -[PXStoryViewDismissalController centerOffsetAnimator](self, "centerOffsetAnimator");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryViewDismissalController releaseAnimationDismissalProgressAnimator](self, "releaseAnimationDismissalProgressAnimator");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "presentationValue");
    v16 = v22;
    if ((objc_msgSend(v17, "isAnimating") & 1) != 0
      || (objc_msgSend(v20, "isAnimating") & 1) != 0
      || objc_msgSend(v21, "isAnimating"))
    {
      -[PXStoryViewDismissalController targetCenter](self, "targetCenter");
      objc_msgSend(v20, "presentationValue");
      PXPointAdd();
      -[PXStoryViewDismissalController sourceSize](self, "sourceSize");
      -[PXStoryViewDismissalController targetSize](self, "targetSize");
      PXSizeByLinearlyInterpolatingSize();
      PXRectWithCenterAndSize();
      v4 = v23;
      v5 = v24;
      v6 = v25;
      v7 = v26;
      v27 = 0;
    }
    else
    {
      -[PXStoryViewDismissalController setState:](self, "setState:", 0);
      v27 = 1;
    }

  }
  else
  {
    if (v8 == 1)
    {
      -[PXStoryViewDismissalController swipeDownTracker](self, "swipeDownTracker");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        objc_msgSend(v9, "trackedCenter");
        objc_msgSend(v10, "trackedBounds");
        PXRectWithCenterAndSize();
        v4 = v11;
        v5 = v12;
        v6 = v13;
        v7 = v14;
        objc_msgSend(v10, "dismissalProgress");
        v16 = v15;
      }
      else
      {
        PXAssertGetLog();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1A6789000, v28, OS_LOG_TYPE_ERROR, "missing swipeDownTracker", buf, 2u);
        }

        v16 = 0;
      }

      v27 = 0;
    }
    else
    {
      v27 = 0;
      v16 = 0;
    }
    v19 = 0x7FF8000000000000;
  }
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __57__PXStoryViewDismissalController__updateCurrentPlacement__block_invoke;
  v30[3] = &unk_1E51212D8;
  v32 = v4;
  v33 = v5;
  v34 = v6;
  v35 = v7;
  v30[4] = self;
  v31 = v3;
  v36 = v16;
  v37 = v19;
  v38 = v27;
  v29 = v3;
  objc_msgSend(v29, "performChanges:", v30);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  v9 = a3;
  if ((void *)ViewControllerTransitionObservationContext == a5)
  {
    if ((v6 & 2) != 0)
    {
      v11 = v9;
      -[PXStoryViewDismissalController _invalidateInitialItemPlacement](self, "_invalidateInitialItemPlacement");
      goto LABEL_7;
    }
  }
  else
  {
    if ((void *)FinalAnimatorObservationContext != a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryViewDismissalController.m"), 392, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    if ((v6 & 6) != 0)
    {
      v11 = v9;
      -[PXStoryViewDismissalController _invalidateCurrentPlacement](self, "_invalidateCurrentPlacement");
LABEL_7:
      v9 = v11;
    }
  }

}

- (PXStoryViewModel)viewModel
{
  return self->_viewModel;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (PXGViewControllerTransition)viewControllerTransition
{
  return self->_viewControllerTransition;
}

- (UIView)referenceView
{
  return self->_referenceView;
}

- (void)setReferenceView:(id)a3
{
  objc_storeStrong((id *)&self->_referenceView, a3);
}

- (CGPoint)initialGestureLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_initialGestureLocation.x;
  y = self->_initialGestureLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setInitialGestureLocation:(CGPoint)a3
{
  self->_initialGestureLocation = a3;
}

- (CGPoint)currentGestureLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_currentGestureLocation.x;
  y = self->_currentGestureLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)currentGestureVelocity
{
  double x;
  double y;
  CGPoint result;

  x = self->_currentGestureVelocity.x;
  y = self->_currentGestureVelocity.y;
  result.y = y;
  result.x = x;
  return result;
}

- (PXGItemPlacement)initialItemPlacement
{
  return self->_initialItemPlacement;
}

- (PXSwipeDownTracker)swipeDownTracker
{
  return self->_swipeDownTracker;
}

- (void)setSwipeDownTracker:(id)a3
{
  objc_storeStrong((id *)&self->_swipeDownTracker, a3);
}

- (PXNumberAnimator)releaseAnimationProgressAnimator
{
  return self->_releaseAnimationProgressAnimator;
}

- (void)setReleaseAnimationProgressAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_releaseAnimationProgressAnimator, a3);
}

- (PXNumberAnimator)releaseAnimationDismissalProgressAnimator
{
  return self->_releaseAnimationDismissalProgressAnimator;
}

- (void)setReleaseAnimationDismissalProgressAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_releaseAnimationDismissalProgressAnimator, a3);
}

- (PXPointAnimator)centerOffsetAnimator
{
  return self->_centerOffsetAnimator;
}

- (CGPoint)targetCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_targetCenter.x;
  y = self->_targetCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTargetCenter:(CGPoint)a3
{
  self->_targetCenter = a3;
}

- (CGSize)sourceSize
{
  double width;
  double height;
  CGSize result;

  width = self->_sourceSize.width;
  height = self->_sourceSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSourceSize:(CGSize)a3
{
  self->_sourceSize = a3;
}

- (CGSize)targetSize
{
  double width;
  double height;
  CGSize result;

  width = self->_targetSize.width;
  height = self->_targetSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setTargetSize:(CGSize)a3
{
  self->_targetSize = a3;
}

- (BOOL)targetCancelled
{
  return self->_targetCancelled;
}

- (void)setTargetCancelled:(BOOL)a3
{
  self->_targetCancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centerOffsetAnimator, 0);
  objc_storeStrong((id *)&self->_releaseAnimationDismissalProgressAnimator, 0);
  objc_storeStrong((id *)&self->_releaseAnimationProgressAnimator, 0);
  objc_storeStrong((id *)&self->_swipeDownTracker, 0);
  objc_storeStrong((id *)&self->_initialItemPlacement, 0);
  objc_storeStrong((id *)&self->_referenceView, 0);
  objc_storeStrong((id *)&self->_viewControllerTransition, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

void __57__PXStoryViewDismissalController__updateCurrentPlacement__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  BOOL IsNull;
  uint64_t v7;
  double v8;
  void *v9;
  void *v10;
  __int128 v11;
  id v12;
  id v13;
  void (**v14)(void *, id, double, double);
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  _QWORD aBlock[4];
  id v22;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  double v27;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "referenceView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(*(id *)(a1 + 32), "targetCancelled");
  IsNull = CGRectIsNull(*(CGRect *)(a1 + 48));
  v7 = MEMORY[0x1E0C809B0];
  if (!IsNull && v4)
  {
    v8 = 1.0 - *(double *)(a1 + 80);
    objc_msgSend(*(id *)(a1 + 40), "summaryItemOriginalPlacement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "detailItemOriginalPlacement");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = v7;
    aBlock[1] = 3221225472;
    aBlock[2] = __57__PXStoryViewDismissalController__updateCurrentPlacement__block_invoke_2;
    aBlock[3] = &unk_1E51212B0;
    v11 = *(_OWORD *)(a1 + 64);
    v25 = *(_OWORD *)(a1 + 48);
    v26 = v11;
    v22 = v4;
    v12 = v9;
    v23 = v12;
    v13 = v10;
    v24 = v13;
    v27 = v8;
    v14 = (void (**)(void *, id, double, double))_Block_copy(aBlock);
    v15 = *(double *)(a1 + 88);
    if (v5)
      v15 = 1.0 - v15;
    objc_msgSend(v3, "setFractionCompleted:", v15);
    if ((v5 & 1) == 0)
      objc_msgSend(*(id *)(a1 + 40), "isVerticalOnly");
    PXFloatByLinearlyInterpolatingFloats();
    v17 = v16;
    v14[2](v14, v12, 1.0, 1.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSummaryItemPlacementOverride:", v18);

    v14[2](v14, v13, v17, v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDetailItemPlacementOverride:", v19);

  }
  if (*(_BYTE *)(a1 + 96))
  {
    if (v5)
      objc_msgSend(v3, "cancel");
    else
      objc_msgSend(v3, "finish");
    v20[0] = v7;
    v20[1] = 3221225472;
    v20[2] = __57__PXStoryViewDismissalController__updateCurrentPlacement__block_invoke_4;
    v20[3] = &unk_1E5149198;
    v20[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], v20);
  }

}

id __57__PXStoryViewDismissalController__updateCurrentPlacement__block_invoke_2(uint64_t a1, void *a2, double a3, double a4)
{
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  __int128 v14;
  __int128 v15;
  double v16;
  double v17;
  uint64_t v18;

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__PXStoryViewDismissalController__updateCurrentPlacement__block_invoke_3;
  v10[3] = &unk_1E5121288;
  v14 = *(_OWORD *)(a1 + 56);
  v15 = *(_OWORD *)(a1 + 72);
  v11 = *(id *)(a1 + 32);
  v16 = a3;
  v17 = a4;
  v12 = *(id *)(a1 + 40);
  v13 = *(id *)(a1 + 48);
  v18 = *(_QWORD *)(a1 + 88);
  v8 = (void *)objc_msgSend(a2, "copyWithConfiguration:", v10);

  return v8;
}

uint64_t __57__PXStoryViewDismissalController__updateCurrentPlacement__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setViewControllerTransition:", 0);
}

void __57__PXStoryViewDismissalController__updateCurrentPlacement__block_invoke_3(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  float v7;
  double v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  PXGAssertErrValidRect();
  objc_msgSend(v10, "setRect:velocity:inCoordinateSpace:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)off_1E50B8610, *((double *)off_1E50B8610 + 1), *((double *)off_1E50B8610 + 2), *((double *)off_1E50B8610 + 3));
  objc_msgSend(v10, "alpha");
  objc_msgSend(v10, "setAlpha:", v3 * *(double *)(a1 + 88));
  objc_msgSend(v10, "chromeAlpha");
  objc_msgSend(v10, "setChromeAlpha:", v4 * *(double *)(a1 + 96));
  objc_msgSend(v10, "scrubberAlpha");
  objc_msgSend(v10, "setScrubberAlpha:", v5 * *(double *)(a1 + 96));
  objc_msgSend(v10, "legibilityOverlayAlpha");
  objc_msgSend(v10, "setLegibilityOverlayAlpha:", v6 * *(double *)(a1 + 96));
  objc_msgSend(*(id *)(a1 + 40), "cornerRadius");
  objc_msgSend(*(id *)(a1 + 48), "cornerRadius");
  v9 = *(_QWORD *)(a1 + 104);
  PXGCornerRadiusByLinearlyInterpolatingCornerRadii();
  objc_msgSend(v10, "setCornerRadius:", v9);
  objc_msgSend(v10, "soundVolume");
  v8 = *(double *)(a1 + 96) * v7;
  *(float *)&v8 = v8;
  objc_msgSend(v10, "setSoundVolume:", v8);

}

void __57__PXStoryViewDismissalController__updateSwipeDownTracker__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "referenceView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rectInCoordinateSpace:velocity:", v4, 0);
  v5 = *(_QWORD **)(*(_QWORD *)(a1 + 48) + 8);
  v5[4] = v6;
  v5[5] = v7;
  v5[6] = v8;
  v5[7] = v9;

  if ((PXRectIsValid() & 1) == 0)
  {
    PXAssertGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      v13 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v3, "diagnosticDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(a1 + 40);
      v16 = 138412802;
      v17 = v13;
      v18 = 2112;
      v19 = v14;
      v20 = 2112;
      v21 = v15;
      _os_log_fault_impl(&dword_1A6789000, v10, OS_LOG_TYPE_FAULT, "%@ failed to determine target rect, itemPlacement=%@, referenceView=%@", (uint8_t *)&v16, 0x20u);

    }
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    *(_OWORD *)(v11 + 32) = *MEMORY[0x1E0C9D628];
    *(_OWORD *)(v11 + 48) = v12;
  }

}

uint64_t __57__PXStoryViewDismissalController__updateSwipeDownTracker__block_invoke_3(uint64_t a1, void *a2)
{
  double v2;

  v2 = 0.0;
  if (!*(_BYTE *)(a1 + 32))
    v2 = 1.0;
  return objc_msgSend(a2, "setValue:", v2);
}

uint64_t __57__PXStoryViewDismissalController__updateSwipeDownTracker__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:", 1.0);
}

uint64_t __57__PXStoryViewDismissalController__updateSwipeDownTracker__block_invoke_24(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

void __49__PXStoryViewDismissalController__setNeedsUpdate__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updater");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateIfNeeded");

}

void __65__PXStoryViewDismissalController_handlePanDownGestureRecognizer___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "referenceView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "locationInView:", v2);
  objc_msgSend(*(id *)(a1 + 32), "setCurrentGestureLocation:");
  objc_msgSend(*(id *)(a1 + 40), "velocityInView:", v2);
  objc_msgSend(*(id *)(a1 + 32), "setCurrentGestureVelocity:");

}

void __65__PXStoryViewDismissalController_handlePanDownGestureRecognizer___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setWantsRelatedOverlayVisible:", 0);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(*(id *)(a1 + 32), "needs79067616Workaround"))
  {
    objc_msgSend(v3, "setNeedsStatusBarVisible:", 1);
  }

}

@end
