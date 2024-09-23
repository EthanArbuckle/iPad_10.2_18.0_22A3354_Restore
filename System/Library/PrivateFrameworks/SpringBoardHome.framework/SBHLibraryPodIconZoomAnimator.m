@implementation SBHLibraryPodIconZoomAnimator

- (SBHLibraryPodIconZoomAnimator)initWithAnimationContainer:(id)a3 innerFolderController:(id)a4 folderIcon:(id)a5 searchBar:(id)a6 libraryViewController:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  SBHLibraryPodIconZoomAnimator *v17;
  SBHLibraryPodIconZoomAnimator *v18;
  void *v19;
  objc_super v21;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)SBHLibraryPodIconZoomAnimator;
  v17 = -[SBIconZoomAnimator initWithAnimationContainer:](&v21, sel_initWithAnimationContainer_, a3);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_targetIcon, a5);
    objc_storeStrong((id *)&v18->_folderController, a4);
    objc_storeWeak((id *)&v18->_libraryViewController, v16);
    objc_storeStrong((id *)&v18->_searchBar, a6);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", v18, sel__handleIconViewClippedNotification_, CFSTR("SBHScrollableContainerDidScrollHiddenIconViewOutsideClippingBoundsNotification"), 0);
    objc_msgSend(v19, "addObserver:selector:name:object:", v18, sel__handleIconZoomNotification_, CFSTR("SBIconZoomExpansionAnimationWillBeginNotification"), 0);

  }
  return v18;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SBIconZoomExpansionAnimationWillBeginNotification"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SBHScrollableContainerDidScrollHiddenIconViewOutsideClippingBoundsNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)SBHLibraryPodIconZoomAnimator;
  -[SBIconZoomAnimator dealloc](&v4, sel_dealloc);
}

- (id)referenceIconView
{
  return -[SBIconZoomAnimator iconViewForIcon:](self, "iconViewForIcon:", self->_targetIcon);
}

- (void)cleanup
{
  objc_super v2;

  self->_animationComplete = 1;
  v2.receiver = self;
  v2.super_class = (Class)SBHLibraryPodIconZoomAnimator;
  -[SBIconAnimator cleanup](&v2, sel_cleanup);
}

- (void)_prepareAnimation
{
  id WeakRetained;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBHLibraryPodIconZoomAnimator;
  -[SBIconZoomAnimator _prepareAnimation](&v5, sel__prepareAnimation);
  WeakRetained = objc_loadWeakRetained((id *)&self->_libraryViewController);
  objc_msgSend(WeakRetained, "addObserver:", self);

  -[SBHLibraryPodIconZoomAnimator referenceIconView](self, "referenceIconView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIconGridImageAlpha:", 0.0);

  -[SBHLibraryPodIconZoomAnimator _setupFolderAndLibraryScalingViews](self, "_setupFolderAndLibraryScalingViews");
  -[SBHLibraryPodIconZoomAnimator _captureVisibleAndMiniPodIconViews](self, "_captureVisibleAndMiniPodIconViews");
  -[SBHLibraryPodIconZoomAnimator _prepareToCrossfadeMiniPodIconViews](self, "_prepareToCrossfadeMiniPodIconViews");
  -[SBHLibraryPodIconZoomAnimator _updateVisibleIconViewsPointerAllowed:](self, "_updateVisibleIconViewsPointerAllowed:", 0);
}

- (void)_setAnimationFraction:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBHLibraryPodIconZoomAnimator;
  -[SBIconZoomAnimator _setAnimationFraction:](&v5, sel__setAnimationFraction_);
  if (!self->_animationComplete)
  {
    -[SBHLibraryPodIconZoomAnimator _updateIconCrossfadeForZoomFraction:](self, "_updateIconCrossfadeForZoomFraction:", a3);
    -[SBHLibraryPodIconZoomAnimator _updateFolderNavigationBarAlphaForZoomFraction:](self, "_updateFolderNavigationBarAlphaForZoomFraction:", a3);
    -[SBHLibraryPodIconZoomAnimator _updateLibraryAlphaForZoomFraction:](self, "_updateLibraryAlphaForZoomFraction:", a3);
    -[SBHLibraryPodIconZoomAnimator _updateFolderViewFramesForZoomFraction:](self, "_updateFolderViewFramesForZoomFraction:", a3);
    -[SBHLibraryPodIconZoomAnimator _updateLibraryScaleForZoomFraction:](self, "_updateLibraryScaleForZoomFraction:", a3);
    -[SBHLibraryPodIconZoomAnimator _updateSearchBarForZoomFraction:](self, "_updateSearchBarForZoomFraction:", a3);
    -[SBHLibraryPodIconZoomAnimator _updateSearchBarAlphaForZoomFraction:](self, "_updateSearchBarAlphaForZoomFraction:", a3);
    -[SBHLibraryPodIconZoomAnimator _animateIconViewTransformsAndAlphaForZoomFraction:withAnimationSettings:delay:completion:](self, "_animateIconViewTransformsAndAlphaForZoomFraction:withAnimationSettings:delay:completion:", 0, 0, a3, 0.0);
  }
}

- (void)_cleanupAnimation
{
  void *v3;
  id WeakRetained;
  objc_super v5;

  -[SBHLibraryPodIconZoomAnimator referenceIconView](self, "referenceIconView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowsProgressState:", 1);
  objc_msgSend(v3, "setIconGridImageAlpha:", 1.0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_libraryViewController);
  objc_msgSend(WeakRetained, "removeObserver:", self);

  -[SBHLibraryPodIconZoomAnimator _updateSearchBarForZoomFraction:](self, "_updateSearchBarForZoomFraction:", 0.0);
  -[SBHLibraryPodIconZoomAnimator _returnFolderAndLibraryScalingViews](self, "_returnFolderAndLibraryScalingViews");
  -[SBHLibraryPodIconZoomAnimator _cleanupMiniPodIconViewsAfterCrossfade](self, "_cleanupMiniPodIconViewsAfterCrossfade");
  -[SBHLibraryPodIconZoomAnimator _updateVisibleIconViewsPointerAllowed:](self, "_updateVisibleIconViewsPointerAllowed:", 1);
  v5.receiver = self;
  v5.super_class = (Class)SBHLibraryPodIconZoomAnimator;
  -[SBIconZoomAnimator _cleanupAnimation](&v5, sel__cleanupAnimation);

}

- (unint64_t)_numberOfSignificantAnimations
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHLibraryPodIconZoomAnimator;
  return -[SBIconZoomAnimator _numberOfSignificantAnimations](&v3, sel__numberOfSignificantAnimations) + 5;
}

- (void)_animateToFraction:(double)a3 afterDelay:(double)a4 withSharedCompletion:(id)a5
{
  id v8;
  void *v9;
  id WeakRetained;
  objc_super v11;

  v8 = a5;
  if (BSFloatIsZero() && !-[SBIconAnimator invalidated](self, "invalidated"))
  {
    -[SBHLibraryPodIconZoomAnimator referenceIconView](self, "referenceIconView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_libraryViewController);
      objc_msgSend(WeakRetained, "noteIconViewWillZoomDown:", v9);

    }
  }
  v11.receiver = self;
  v11.super_class = (Class)SBHLibraryPodIconZoomAnimator;
  -[SBIconZoomAnimator _animateToFraction:afterDelay:withSharedCompletion:](&v11, sel__animateToFraction_afterDelay_withSharedCompletion_, v8, a3, a4);

}

- (void)_performAnimationToFraction:(double)a3 withCentralAnimationSettings:(id)a4 delay:(double)a5 alreadyAnimating:(BOOL)a6 sharedCompletion:(id)a7
{
  _BOOL8 v7;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  _QWORD v33[6];
  _QWORD v34[6];
  _QWORD v35[6];
  _QWORD v36[6];
  objc_super v37;

  v7 = a6;
  v37.receiver = self;
  v37.super_class = (Class)SBHLibraryPodIconZoomAnimator;
  v12 = a7;
  -[SBIconZoomAnimator _performAnimationToFraction:withCentralAnimationSettings:delay:alreadyAnimating:sharedCompletion:](&v37, sel__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion_, a4, v7, v12, a3, a5);
  if (BSFloatIsZero())
    -[SBHLibraryPodIconZoomAnimator _setupMatchMoveAnimation](self, "_setupMatchMoveAnimation");
  else
    -[SBHLibraryPodIconZoomAnimator _removeMatchMoveAnimation](self, "_removeMatchMoveAnimation");
  -[SBHLibraryPodIconZoomAnimator referenceIconView](self, "referenceIconView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (BSFloatIsZero())
    objc_msgSend(v13, "setAllowsProgressState:", 0);
  if ((BSFloatIsOne() & 1) != 0 || BSFloatIsZero())
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "postNotificationName:object:", CFSTR("SBIconZoomExpansionAnimationWillBeginNotification"), self);

  }
  objc_msgSend(v13, "setIconGridImageAlpha:", 0.0);
  -[UIView setHidden:](self->_folderScalingView, "setHidden:", 0);
  -[SBHLibraryPodFolderView podScrollView](self->_folderView, "podScrollView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "contentOffset");
  objc_msgSend(v32, "_setContentOffsetPinned:animated:", 0);
  -[SBIconAnimator settings](self, "settings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v7)
  {
    a5 = 0.0;
    v17 = 6;
  }
  else
  {
    v17 = 2;
  }
  v18 = (void *)MEMORY[0x1E0D01908];
  objc_msgSend(v15, "crossfadeSettings", v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "BSAnimationSettings");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __130__SBHLibraryPodIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke;
  v36[3] = &unk_1E8D84C78;
  v36[4] = self;
  *(double *)&v36[5] = a3;
  objc_msgSend(v18, "animateWithSettings:options:actions:completion:", v20, v17, v36, v12);

  v22 = (void *)MEMORY[0x1E0D01908];
  objc_msgSend(v16, "innerFolderFadeSettings");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "BSAnimationSettings");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v21;
  v35[1] = 3221225472;
  v35[2] = __130__SBHLibraryPodIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_2;
  v35[3] = &unk_1E8D84C78;
  v35[4] = self;
  *(double *)&v35[5] = a3;
  objc_msgSend(v22, "animateWithSettings:options:actions:completion:", v24, v17, v35, v12);

  v25 = (void *)MEMORY[0x1E0D01908];
  objc_msgSend(v16, "outerFolderFadeSettings");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "BSAnimationSettings");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v21;
  v34[1] = 3221225472;
  v34[2] = __130__SBHLibraryPodIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_3;
  v34[3] = &unk_1E8D84C78;
  v34[4] = self;
  *(double *)&v34[5] = a3;
  objc_msgSend(v25, "animateWithSettings:options:actions:completion:", v27, v17, v34, v12);

  v28 = (void *)MEMORY[0x1E0D01908];
  objc_msgSend(v16, "centralAnimationSettings");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "BSAnimationSettings");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v21;
  v33[1] = 3221225472;
  v33[2] = __130__SBHLibraryPodIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_4;
  v33[3] = &unk_1E8D84C78;
  v33[4] = self;
  *(double *)&v33[5] = a3;
  objc_msgSend(v28, "animateWithSettings:options:actions:completion:", v30, v17, v33, v12);

  -[SBHLibraryPodIconZoomAnimator _animateIconViewTransformsAndAlphaForZoomFraction:withAnimationSettings:delay:completion:](self, "_animateIconViewTransformsAndAlphaForZoomFraction:withAnimationSettings:delay:completion:", v16, v12, a3, a5);
  -[UIView setUserInteractionEnabled:](self->_folderScalingView, "setUserInteractionEnabled:", BSFloatIsZero() ^ 1);

}

uint64_t __130__SBHLibraryPodIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateIconCrossfadeForZoomFraction:", *(double *)(a1 + 40));
}

uint64_t __130__SBHLibraryPodIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateFolderNavigationBarAlphaForZoomFraction:", *(double *)(a1 + 40));
}

uint64_t __130__SBHLibraryPodIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateLibraryAlphaForZoomFraction:", *(double *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_updateSearchBarAlphaForZoomFraction:", *(double *)(a1 + 40));
}

uint64_t __130__SBHLibraryPodIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateFolderViewFramesForZoomFraction:", *(double *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_updateLibraryScaleForZoomFraction:", *(double *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_updateSearchBarForZoomFraction:", *(double *)(a1 + 40));
}

- (CGPoint)_centerOfMiniPodIconViews
{
  NSArray *v2;
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;
  CGPoint result;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = self->_miniPodIconViews;
  if (-[NSArray count](v2, "count"))
  {
    x = *MEMORY[0x1E0C9D628];
    y = *(double *)(MEMORY[0x1E0C9D628] + 8);
    width = *(double *)(MEMORY[0x1E0C9D628] + 16);
    height = *(double *)(MEMORY[0x1E0C9D628] + 24);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v7 = v2;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v23;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v11), "frame", (_QWORD)v22);
          v31.origin.x = v12;
          v31.origin.y = v13;
          v31.size.width = v14;
          v31.size.height = v15;
          v29.origin.x = x;
          v29.origin.y = y;
          v29.size.width = width;
          v29.size.height = height;
          v30 = CGRectUnion(v29, v31);
          x = v30.origin.x;
          y = v30.origin.y;
          width = v30.size.width;
          height = v30.size.height;
          ++v11;
        }
        while (v9 != v11);
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v9);
    }

    UIRectGetCenter();
    v17 = v16;
    v19 = v18;
  }
  else
  {
    v17 = *MEMORY[0x1E0C9D538];
    v19 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }

  v20 = v17;
  v21 = v19;
  result.y = v21;
  result.x = v20;
  return result;
}

- (double)_scaleForZoomFraction:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[SBHLibraryPodIconZoomAnimator referenceIconView](self, "referenceIconView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray firstObject](self->_miniPodIconViews, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "frameForMiniIconAtIndex:", 0);
    v8 = v7;
    objc_msgSend(v6, "iconImageSize");
    v10 = a3 + (1.0 - a3) * (v8 / v9);
  }
  else
  {
    v10 = 0.4;
  }

  return v10;
}

- (void)_updateIconCrossfadeForZoomFraction:(double)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_miniPodIconViews;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    v8 = 1.0 - a3;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setCrossfadeFraction:", v8, (_QWORD)v10);
      }
      while (v6 != v9);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)_updateFolderNavigationBarAlphaForZoomFraction:(double)a3
{
  id v4;

  -[SBHLibraryPodFolderView navigationBar](self->_folderView, "navigationBar");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", a3);

}

- (void)_animateIconViewTransformsAndAlphaForZoomFraction:(double)a3 withAnimationSettings:(id)a4 delay:(double)a5 completion:(id)a6
{
  NSArray *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  NSArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  uint64_t i;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  long double v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  _QWORD *v59;
  uint64_t v60;
  double v61;
  double v62;
  void *v63;
  void *v64;
  id v65;
  id v66;
  double v67;
  double v68;
  double v69;
  SBHLibraryPodIconZoomAnimator *v70;
  void *v71;
  NSArray *obj;
  NSObject *group;
  double v74;
  double v75;
  double v76;
  NSArray *v77;
  id v78;
  _QWORD block[4];
  id v80;
  _QWORD v81[4];
  NSObject *v82;
  _QWORD aBlock[10];
  _QWORD v84[8];
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _BYTE v93[128];
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v78 = a4;
  v66 = a6;
  group = dispatch_group_create();
  v10 = self->_visibleIconViews;
  v77 = self->_miniPodIconViews;
  -[SBHLibraryPodIconZoomAnimator referenceIconView](self, "referenceIconView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = a3;
  -[SBHLibraryPodIconZoomAnimator _scaleForZoomFraction:](self, "_scaleForZoomFraction:", a3);
  v69 = v12;
  v70 = self;
  -[SBHLibraryPodIconZoomAnimator _centerOfMiniPodIconViews](self, "_centerOfMiniPodIconViews");
  v14 = v13;
  v16 = v15;
  v71 = v11;
  objc_msgSend(v11, "iconImageSize");
  BSRectWithSize();
  UIRectGetCenter();
  v67 = v18;
  v68 = v17;
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v19 = v10;
  v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v89, v94, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v90;
    v23 = 1.79769313e308;
    v24 = 2.22507386e-308;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v90 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v89 + 1) + 8 * i), "center");
        v28 = hypot(v14 - v26, v16 - v27);
        if (v28 > v24)
          v24 = v28;
        if (v28 < v23)
          v23 = v28;
      }
      v21 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v89, v94, 16);
    }
    while (v21);
  }
  else
  {
    v23 = 1.79769313e308;
    v24 = 2.22507386e-308;
  }

  objc_msgSend(v78, "innerFolderEdgeZoomSettings");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "innerFolderCenterZoomSettings");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  obj = v19;
  v31 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v85, v93, 16);
  v32 = MEMORY[0x1E0C809B0];
  if (v31)
  {
    v33 = v31;
    v34 = *(_QWORD *)v86;
    v75 = 1.0 - v76;
    v74 = v14;
    do
    {
      for (j = 0; j != v33; ++j)
      {
        if (*(_QWORD *)v86 != v34)
          objc_enumerationMutation(obj);
        v36 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * j);
        objc_msgSend(v36, "center");
        v39 = v14 - v37;
        v40 = v16 - v38;
        if (v78)
        {
          v41 = (hypot(v14 - v37, v16 - v38) - v23) / (v24 - v23);
          v42 = (void *)objc_msgSend(v29, "copy");
          objc_msgSend(v30, "mass");
          v44 = v43;
          objc_msgSend(v29, "mass");
          objc_msgSend(v42, "setMass:", (double)(v41 * v45 + (1.0 - v41) * v44));
          objc_msgSend(v30, "stiffness");
          v47 = v46;
          objc_msgSend(v29, "stiffness");
          objc_msgSend(v42, "setStiffness:", (double)(v41 * v48 + (1.0 - v41) * v47));
          objc_msgSend(v30, "damping");
          v50 = v49;
          objc_msgSend(v29, "damping");
          objc_msgSend(v42, "setDamping:", (double)(v41 * v51 + (1.0 - v41) * v50));
          objc_msgSend(v30, "delay");
          v53 = v52;
          objc_msgSend(v29, "delay");
          objc_msgSend(v42, "setDelay:", (double)(v41 * v54 + (1.0 - v41) * v53));
          v55 = (void *)MEMORY[0x1E0D01908];
          objc_msgSend(v42, "BSAnimationSettings");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "factoryWithSettings:", v56);
          v57 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v57 = 0;
        }
        v58 = -[NSArray indexOfObject:](v77, "indexOfObject:", v36);
        if (v58 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v84[0] = v32;
          v84[1] = 3221225472;
          v84[2] = __122__SBHLibraryPodIconZoomAnimator__animateIconViewTransformsAndAlphaForZoomFraction_withAnimationSettings_delay_completion___block_invoke;
          v84[3] = &unk_1E8D8BEB0;
          *(double *)&v84[5] = v76;
          *(double *)&v84[6] = v75 * v39;
          *(double *)&v84[7] = v75 * v40;
          v84[4] = v36;
          v59 = v84;
        }
        else
        {
          v60 = v58;
          objc_msgSend(v71, "frameForMiniIconAtIndex:", v58);
          UIRectGetCenter();
          aBlock[0] = v32;
          aBlock[1] = 3221225472;
          aBlock[2] = __122__SBHLibraryPodIconZoomAnimator__animateIconViewTransformsAndAlphaForZoomFraction_withAnimationSettings_delay_completion___block_invoke_2;
          aBlock[3] = &unk_1E8D87660;
          *(double *)&aBlock[6] = v75 * (v39 - (v68 - v61) / v69);
          *(double *)&aBlock[7] = v75 * (v40 - (v67 - v62) / v69);
          *(double *)&aBlock[8] = v76;
          aBlock[9] = v60;
          aBlock[4] = v36;
          aBlock[5] = v70;
          v59 = aBlock;
        }
        v63 = _Block_copy(v59);
        v14 = v74;
        if (v63)
        {
          dispatch_group_enter(group);
          v64 = (void *)MEMORY[0x1E0D01908];
          v81[0] = v32;
          v81[1] = 3221225472;
          v81[2] = __122__SBHLibraryPodIconZoomAnimator__animateIconViewTransformsAndAlphaForZoomFraction_withAnimationSettings_delay_completion___block_invoke_3;
          v81[3] = &unk_1E8D84F68;
          v82 = group;
          objc_msgSend(v64, "animateWithFactory:additionalDelay:options:actions:completion:", v57, 6, v63, v81, a5 + 0.0);

        }
      }
      v33 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v85, v93, 16);
    }
    while (v33);
  }

  block[0] = v32;
  block[1] = 3221225472;
  block[2] = __122__SBHLibraryPodIconZoomAnimator__animateIconViewTransformsAndAlphaForZoomFraction_withAnimationSettings_delay_completion___block_invoke_4;
  block[3] = &unk_1E8D859C0;
  v80 = v66;
  v65 = v66;
  dispatch_group_notify(group, MEMORY[0x1E0C80D38], block);

}

uint64_t __122__SBHLibraryPodIconZoomAnimator__animateIconViewTransformsAndAlphaForZoomFraction_withAnimationSettings_delay_completion___block_invoke(uint64_t a1)
{
  CGFloat v2;
  CGFloat v3;
  CGAffineTransform v5;
  CGAffineTransform v6;
  CGAffineTransform v7;

  v2 = *(double *)(a1 + 48);
  v3 = *(double *)(a1 + 40) + (1.0 - *(double *)(a1 + 40)) * 0.1;
  memset(&v7, 0, sizeof(v7));
  CGAffineTransformMakeTranslation(&v7, v2, *(CGFloat *)(a1 + 56));
  v5 = v7;
  CGAffineTransformScale(&v6, &v5, v3, v3);
  v7 = v6;
  objc_msgSend(*(id *)(a1 + 32), "setTransform:", &v6);
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setIconLabelAlpha:", *(double *)(a1 + 40));
}

void __122__SBHLibraryPodIconZoomAnimator__animateIconViewTransformsAndAlphaForZoomFraction_withAnimationSettings_delay_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  CGAffineTransform v4;
  CGAffineTransform v5;

  memset(&v5, 0, sizeof(v5));
  CGAffineTransformMakeTranslation(&v5, *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56));
  v2 = *(void **)(a1 + 32);
  v4 = v5;
  objc_msgSend(v2, "setTransform:", &v4);
  objc_msgSend(*(id *)(a1 + 32), "setIconLabelAlpha:", *(double *)(a1 + 64));
  if (!*(_QWORD *)(a1 + 72))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 168), "navigationBar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5;
    objc_msgSend(v3, "setTransform:", &v4);

  }
}

void __122__SBHLibraryPodIconZoomAnimator__animateIconViewTransformsAndAlphaForZoomFraction_withAnimationSettings_delay_completion___block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __122__SBHLibraryPodIconZoomAnimator__animateIconViewTransformsAndAlphaForZoomFraction_withAnimationSettings_delay_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)_updateFolderViewFramesForZoomFraction:(double)a3
{
  NSArray *v5;
  void *v6;
  UIView *matchMoveWrapperView;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  UIView *folderClippingView;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  UIView *folderScalingView;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGAffineTransform v35;

  v5 = self->_miniPodIconViews;
  -[SBHLibraryPodIconZoomAnimator referenceIconView](self, "referenceIconView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  matchMoveWrapperView = self->_matchMoveWrapperView;
  -[SBIconAnimator animationContainer](self, "animationContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "containerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  -[UIView setBounds:](matchMoveWrapperView, "setBounds:");

  -[UIView bounds](self->_folderScalingView, "bounds");
  UIRectGetCenter();
  v11 = v10;
  v13 = v12;
  objc_msgSend(v6, "superview");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "center");
  objc_msgSend(v14, "convertPoint:toView:", self->_libraryScalingView);

  v15 = 1.0 - a3;
  objc_msgSend(v6, "iconImageSize");
  -[UIView bounds](self->_folderScalingView, "bounds");
  folderClippingView = self->_folderClippingView;
  BSRectWithSize();
  BSRectCenteredAboutPoint();
  -[UIView setFrame:](folderClippingView, "setFrame:");
  objc_msgSend(v6, "iconImageInfo");
  -[UIView _setContinuousCornerRadius:](self->_folderClippingView, "_setContinuousCornerRadius:", a3 * 0.0 + (1.0 - a3) * v17);
  -[NSArray firstObject](v5, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHLibraryPodIconZoomAnimator _centerOfMiniPodIconViews](self, "_centerOfMiniPodIconViews");
  v20 = v19;
  v22 = v21;
  -[SBHLibraryPodIconZoomAnimator _scaleForZoomFraction:](self, "_scaleForZoomFraction:", a3);
  v24 = v23;
  folderScalingView = self->_folderScalingView;
  CGAffineTransformMakeScale(&v35, v23, v23);
  -[UIView setTransform:](folderScalingView, "setTransform:", &v35);
  -[UIView bounds](self->_folderClippingView, "bounds");
  UIRectGetCenter();
  v27 = v26;
  v29 = v28;
  if (v18)
  {
    objc_msgSend(v18, "superview");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "convertPoint:toView:", self->_folderScalingView, v20, v22);
    v32 = v31;
    v34 = v33;

  }
  else
  {
    v32 = *MEMORY[0x1E0C9D538];
    v34 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  -[UIView setCenter:](self->_folderScalingView, "setCenter:", v27 + v24 * (v11 - v32) * v15, v29 + v24 * (v13 - v34) * v15);

}

- (void)_updateLibraryScaleForZoomFraction:(double)a3
{
  UIView *libraryScalingView;
  CGAffineTransform v4;

  libraryScalingView = self->_libraryScalingView;
  CGAffineTransformMakeScale(&v4, 1.0 - a3 + a3 * 0.8, 1.0 - a3 + a3 * 0.8);
  -[UIView setTransform:](libraryScalingView, "setTransform:", &v4);
}

- (void)_updateSearchBarForZoomFraction:(double)a3
{
  CGFloat v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UIView *searchBar;
  CGAffineTransform v13;
  CGAffineTransform v14;
  CGAffineTransform v15;

  v4 = 1.0 - a3 + a3 * 0.8;
  -[UIView superview](self->_searchBar, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v15, 0, sizeof(v15));
  CGAffineTransformMakeScale(&v15, v4, v4);
  -[UIView center](self->_searchBar, "center");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v5, "center");
  v13 = v15;
  memset(&v14, 0, sizeof(v14));
  CGAffineTransformTranslate(&v14, &v13, (1.0 - v4) * (v10 - v7), (1.0 - v4) * (v11 - v9));
  searchBar = self->_searchBar;
  v13 = v14;
  -[UIView setTransform:](searchBar, "setTransform:", &v13);

}

- (void)_updateSearchBarAlphaForZoomFraction:(double)a3
{
  -[UIView setAlpha:](self->_searchBar, "setAlpha:", 1.0 - a3);
}

- (void)_updateLibraryAlphaForZoomFraction:(double)a3
{
  id v4;

  -[SBIconAnimator animationContainer](self, "animationContainer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentAlpha:", 1.0 - a3);

}

- (void)_setupFolderAndLibraryScalingViews
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("SBHLibraryPodIconZoomAnimator.m");
  v16 = 1024;
  v17 = 449;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1CFEF3000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

- (void)_returnFolderAndLibraryScalingViews
{
  void *v3;
  UIView *libraryScalingView;
  __int128 v5;
  UIView *v6;
  UIView *folderScalingView;
  _OWORD v8[3];

  -[UIView _setSafeAreaInsetsFrozen:](self->_libraryScalingView, "_setSafeAreaInsetsFrozen:", 0);
  -[UIView _setSafeAreaInsetsFrozen:](self->_folderScalingView, "_setSafeAreaInsetsFrozen:", 0);
  -[SBIconAnimator animationContainer](self, "animationContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "returnScalingView");

  libraryScalingView = self->_libraryScalingView;
  v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v8[0] = *MEMORY[0x1E0C9BAA8];
  v8[1] = v5;
  v8[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[UIView setTransform:](libraryScalingView, "setTransform:", v8);
  v6 = self->_libraryScalingView;
  self->_libraryScalingView = 0;

  -[UIView setUserInteractionEnabled:](self->_folderScalingView, "setUserInteractionEnabled:", 1);
  -[UIView setHidden:](self->_folderScalingView, "setHidden:", 0);
  -[SBFolderView returnScalingView](self->_folderView, "returnScalingView");
  folderScalingView = self->_folderScalingView;
  self->_folderScalingView = 0;

  -[SBHLibraryPodIconZoomAnimator _removeMatchMoveAnimation](self, "_removeMatchMoveAnimation");
  -[UIView removeFromSuperview](self->_matchMoveWrapperView, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_folderClippingView, "removeFromSuperview");
}

- (void)_captureVisibleAndMiniPodIconViews
{
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  int v7;
  void *v8;
  unsigned __int16 v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  NSArray *v28;
  unint64_t v29;
  uint64_t v30;
  void *v31;
  unint64_t v32;
  uint64_t v33;
  void *v34;
  unint64_t v35;
  uint64_t v36;
  void *v37;
  unint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  NSArray *v42;
  NSArray *visibleIconViews;
  NSArray *v44;
  NSArray *miniPodIconViews;
  NSArray *v46;
  unint64_t v47;
  void *v48;
  SBHLibraryPodIconZoomAnimator *v49;
  void *v50;
  id v51;
  _QWORD v52[4];
  NSArray *v53;

  -[SBIconAnimator animationContainer](self, "animationContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerView");
  v51 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v51, "layoutIfNeeded");
  -[SBFolderController currentIconListView](self->_folderController, "currentIconListView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "bounds");
  objc_msgSend(v4, "convertRect:fromView:", v51);
  v5 = objc_msgSend(v4, "gridRangeForRect:");
  v7 = v6;
  objc_msgSend(v4, "gridCellInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "gridSize");
  v49 = self;
  -[SBHLibraryPodIconZoomAnimator referenceIconView](self, "referenceIconView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "visibleMiniIconCount");
  v48 = v10;
  objc_msgSend(v10, "icon");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "folder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "icons");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v11 >= v15)
    v16 = v15;
  else
    v16 = v11;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array", v16);
  v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v18 = v5 + (unsigned __int16)v7 - 1;
  v19 = SBHIconGridRangeCellIndexForCorner(v5, v7, 1, v9);
  v20 = SBHIconGridRangeCellIndexForCorner(v5, v7, 2, v9);
  v21 = objc_msgSend(v8, "indexOfLastUsedGridCellInGridRange:", v5, v7 & 0xFFFF0000 | 1);
  v50 = v8;
  v22 = v8;
  v23 = v4;
  v24 = objc_msgSend(v22, "indexOfLastUsedGridCellInGridRange:", v18, v7 & 0xFFFF0000 | 1);
  if (v21 == v19)
    v25 = v19 + 1;
  else
    v25 = v21;
  if (v24 == v20)
    v26 = v20 - 1;
  else
    v26 = v24;
  v27 = v19;
  v28 = v17;
  v29 = SBIconCoordinateMakeWithGridCellIndex(v27, v9);
  objc_msgSend(v4, "iconViewForCoordinate:", v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
    -[NSArray addObject:](v17, "addObject:", v31);
  if (v47 >= 2)
  {
    v32 = SBIconCoordinateMakeWithGridCellIndex(v20, v9);
    objc_msgSend(v4, "iconViewForCoordinate:", v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
      -[NSArray addObject:](v17, "addObject:", v34);

    if (v47 >= 3)
    {
      v35 = SBIconCoordinateMakeWithGridCellIndex(v25, v9);
      objc_msgSend(v4, "iconViewForCoordinate:", v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (v37)
        -[NSArray addObject:](v17, "addObject:", v37);

      v28 = v17;
      if (v47 >= 4)
      {
        v38 = SBIconCoordinateMakeWithGridCellIndex(v26, v9);
        objc_msgSend(v4, "iconViewForCoordinate:", v38, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (v40)
          -[NSArray addObject:](v17, "addObject:", v40);

      }
    }
  }
  v41 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __67__SBHLibraryPodIconZoomAnimator__captureVisibleAndMiniPodIconViews__block_invoke;
  v52[3] = &unk_1E8D85CC0;
  v42 = (NSArray *)v41;
  v53 = v42;
  objc_msgSend(v4, "enumerateDisplayedIconViewsUsingBlock:", v52);
  visibleIconViews = v49->_visibleIconViews;
  v49->_visibleIconViews = v42;
  v44 = v42;

  miniPodIconViews = v49->_miniPodIconViews;
  v49->_miniPodIconViews = v28;
  v46 = v28;

}

uint64_t __67__SBHLibraryPodIconZoomAnimator__captureVisibleAndMiniPodIconViews__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (void)_prepareToCrossfadeMiniPodIconViews
{
  NSArray *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  NSArray *v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v3 = self->_miniPodIconViews;
  -[SBHLibraryPodIconZoomAnimator referenceIconView](self, "referenceIconView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "traitCollection");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "listLayoutProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutForIconLocation:", CFSTR("SBIconLocationFolder"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "folderIconImageCache");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = SBHIconListLayoutFolderIconGridCellSize(v6);
  v9 = v8;
  v33 = v6;
  objc_msgSend(v6, "iconImageInfo");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v34 = v4;
  objc_msgSend(v4, "icon");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "folder");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "icons");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_msgSend(v20, "count");
  v39 = v3;
  v22 = -[NSArray count](v3, "count");
  if (v22 >= v21)
    v23 = v21;
  else
    v23 = v22;
  if (v23)
  {
    v24 = 0;
    v35 = *MEMORY[0x1E0CD2D00];
    v36 = *MEMORY[0x1E0CD2E60];
    do
    {
      -[NSArray objectAtIndex:](v39, "objectAtIndex:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectAtIndex:", v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "gridCellImageOfSize:forIcon:iconImageInfo:compatibleWithTraitCollection:", v26, v38, v7, v9, v11, v13, v15, v17);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v27);
      if ((objc_msgSend(v26, "isTimedOut") & 1) != 0 || objc_msgSend(v26, "progressState"))
      {
        objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", v36);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.5, 1.0);
        v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v29, "setValue:forKey:", objc_msgSend(v30, "CGColor"), v35);

        objc_msgSend(v28, "layer");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v40[0] = v29;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setFilters:", v32);

      }
      objc_msgSend(v25, "prepareToCrossfadeImageWithView:options:", v28, 2);

      ++v24;
    }
    while (v23 != v24);
  }

}

- (void)_cleanupMiniPodIconViewsAfterCrossfade
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_miniPodIconViews;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "cleanupAfterCrossfade", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_updateVisibleIconViewsPointerAllowed:(BOOL)a3
{
  _BOOL4 v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL8 v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_visibleIconViews;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    v8 = !v3;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setDisallowCursorInteraction:", v8, (_QWORD)v10);
      }
      while (v6 != v9);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)_setupMatchMoveAnimation
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  CAFrameRateRange v13;

  v12[1] = *MEMORY[0x1E0C80C00];
  -[SBHLibraryPodIconZoomAnimator referenceIconView](self, "referenceIconView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CD27C0]);
    objc_msgSend(v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSourceLayer:", v5);

    objc_msgSend(v3, "bounds");
    objc_msgSend(v3, "convertRect:toView:", self->_libraryScalingView);
    v7 = v6;
    -[UIView bounds](self->_matchMoveWrapperView, "bounds");
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", 0.0, v8 * 0.5 - v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSourcePoints:", v10);

    objc_msgSend(v4, "setAppliesX:", 0);
    objc_msgSend(v4, "setAppliesY:", 1);
    objc_msgSend(v4, "setAppliesScale:", 0);
    objc_msgSend(v4, "setAppliesRotation:", 0);
    objc_msgSend(v4, "setDuration:", INFINITY);
    objc_msgSend(v4, "setFillMode:", *MEMORY[0x1E0CD2B58]);
    objc_msgSend(v4, "setRemovedOnCompletion:", 0);
    v13 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    objc_msgSend(v4, "setPreferredFrameRateRange:", *(double *)&v13.minimum, *(double *)&v13.maximum, *(double *)&v13.preferred);
    objc_msgSend(v4, "setHighFrameRateReason:", 1114123);
    -[UIView layer](self->_matchMoveWrapperView, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAnimation:forKey:", v4, CFSTR("SBHLibraryPodIconZoomMatchMoveAnimation"));

  }
}

- (void)_removeMatchMoveAnimation
{
  id v2;

  -[UIView layer](self->_matchMoveWrapperView, "layer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAnimationForKey:", CFSTR("SBHLibraryPodIconZoomMatchMoveAnimation"));

}

- (void)_handleIconViewClippedNotification:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  id v7;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("SBHHiddenIconViewUserInfoKey"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[SBHLibraryPodIconZoomAnimator referenceIconView](self, "referenceIconView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v7, "isEqual:", v5);

  if (v6)
    -[SBHLibraryPodIconZoomAnimator _cancelAnimationForIconViewClippedOrObscured](self, "_cancelAnimationForIconViewClippedOrObscured");

}

- (void)_handleIconZoomNotification:(id)a3
{
  void *v4;
  char isKindOfClass;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    -[SBHLibraryPodIconZoomAnimator _cancelAnimationForIconViewClippedOrObscured](self, "_cancelAnimationForIconViewClippedOrObscured");
}

- (void)_cancelAnimationForIconViewClippedOrObscured
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  SBLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1CFEF3000, v3, OS_LOG_TYPE_INFO, "Hiding the folder scaling view for the library pod zoom animation due to icon being scrolled outside clipping bounds", v5, 2u);
  }

  -[UIView setHidden:](self->_folderScalingView, "setHidden:", 1);
  -[SBHLibraryPodIconZoomAnimator referenceIconView](self, "referenceIconView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIconGridImageAlpha:", 1.0);

}

- (SBFolderIcon)targetIcon
{
  return self->_targetIcon;
}

- (SBIconView)targetIconView
{
  return self->_targetIconView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetIconView, 0);
  objc_storeStrong((id *)&self->_targetIcon, 0);
  objc_storeStrong((id *)&self->_miniPodIconViews, 0);
  objc_storeStrong((id *)&self->_visibleIconViews, 0);
  objc_storeStrong((id *)&self->_libraryScalingView, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_matchMoveWrapperView, 0);
  objc_storeStrong((id *)&self->_folderClippingView, 0);
  objc_storeStrong((id *)&self->_folderScalingView, 0);
  objc_storeStrong((id *)&self->_folderView, 0);
  objc_storeStrong((id *)&self->_folderController, 0);
  objc_destroyWeak((id *)&self->_libraryViewController);
}

@end
