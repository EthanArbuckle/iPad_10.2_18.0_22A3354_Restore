@implementation SBDeviceApplicationSceneView

- (void)_updateDragAndDropExclusionDebugViewsIfNecessary
{
  SBDeviceApplicationSceneView *v2;
  NSMutableArray *multitaskingExclusionRectDebugViews;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  __objc2_class **v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  __objc2_class *v28;
  void *v29;
  void *v30;
  void *v31;
  __objc2_class *v32;
  void *v33;
  void *v34;
  double x;
  double y;
  double width;
  double height;
  uint64_t v39;
  __objc2_class **v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  SBDeviceApplicationSceneView *v45;
  void *v46;
  NSMutableArray *v47;
  NSMutableArray *v48;
  NSMutableArray *v49;
  void *v50;
  uint64_t v51;
  id obj;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;
  CGRect v64;

  v2 = self;
  v63 = *MEMORY[0x1E0C80C00];
  multitaskingExclusionRectDebugViews = self->_multitaskingExclusionRectDebugViews;
  if (multitaskingExclusionRectDebugViews)
  {
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v4 = multitaskingExclusionRectDebugViews;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v58 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * i), "removeFromSuperview");
        }
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
      }
      while (v6);
    }

    -[NSMutableArray removeAllObjects](v2->_multitaskingExclusionRectDebugViews, "removeAllObjects");
  }
  +[SBMedusaDomain rootSettings](SBMedusaDomain, "rootSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "showContentDragExclusionRects");

  if (v10)
  {
    -[SBSceneView sceneHandle](v2, "sceneHandle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sceneIfExists");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v12, "clientSettings");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "isUISubclass"))
      {
        v50 = v13;
        objc_msgSend(v13, "multitaskingDragExclusionRects");
        v53 = 0u;
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        obj = (id)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
        if (v14)
        {
          v15 = v14;
          v16 = off_1E8E97000;
          v17 = *(_QWORD *)v54;
          v18 = 0x1E0CEA000uLL;
          do
          {
            v19 = 0;
            v51 = v15;
            do
            {
              if (*(_QWORD *)v54 != v17)
                objc_enumerationMutation(obj);
              objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * v19), "CGRectValue");
              v21 = v20;
              v23 = v22;
              v25 = v24;
              v27 = v26;
              v28 = v16[504];
              objc_msgSend(*(id *)(v18 + 2384), "mainScreen");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "fixedCoordinateSpace");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              -[__objc2_class coordinateSpaceForInterfaceOrientation:withReferenceCoordinateSpace:inOrientation:](v28, "coordinateSpaceForInterfaceOrientation:withReferenceCoordinateSpace:inOrientation:", 1, v30, 1);
              v31 = (void *)objc_claimAutoreleasedReturnValue();

              v32 = v16[504];
              objc_msgSend(v12, "settings");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "frame");
              -[__objc2_class coordinateSpaceForFrame:withinCoordinateSpace:](v32, "coordinateSpaceForFrame:withinCoordinateSpace:", v31);
              v34 = (void *)objc_claimAutoreleasedReturnValue();

              -[SBDeviceApplicationSceneView convertRect:fromCoordinateSpace:](v2, "convertRect:fromCoordinateSpace:", v34, v21, v23, v25, v27);
              x = v64.origin.x;
              y = v64.origin.y;
              width = v64.size.width;
              height = v64.size.height;
              if (!CGRectIsNull(v64))
              {
                v39 = v17;
                v40 = v16;
                v41 = v12;
                v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9F28]), "initWithFrame:", x, y, width, height);
                objc_msgSend(v42, "layer");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "setAllowsHitTesting:", 0);

                objc_msgSend(MEMORY[0x1E0CEA478], "redColor");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "colorWithAlphaComponent:", 0.5);
                v45 = v2;
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "setBackgroundColor:", v46);

                v2 = v45;
                v47 = v45->_multitaskingExclusionRectDebugViews;
                if (!v47)
                {
                  v48 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
                  v49 = v45->_multitaskingExclusionRectDebugViews;
                  v45->_multitaskingExclusionRectDebugViews = v48;

                  v47 = v45->_multitaskingExclusionRectDebugViews;
                }
                -[NSMutableArray addObject:](v47, "addObject:", v42);
                -[SBDeviceApplicationSceneView addSubview:](v45, "addSubview:", v42);

                v12 = v41;
                v16 = v40;
                v17 = v39;
                v18 = 0x1E0CEA000;
                v15 = v51;
              }

              ++v19;
            }
            while (v15 != v19);
            v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
          }
          while (v15);
        }

        v13 = v50;
      }

    }
  }
  else
  {
    v12 = v2->_multitaskingExclusionRectDebugViews;
    v2->_multitaskingExclusionRectDebugViews = 0;
  }

}

- (BOOL)_useClassicWrapperView
{
  void *v2;
  BOOL v3;

  -[SBSceneView sceneHandle](self, "sceneHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[SBDeviceApplicationSceneClassicWrapperView shouldUseWrapperViewForSceneHandle:](SBDeviceApplicationSceneClassicWrapperView, "shouldUseWrapperViewForSceneHandle:", v2);

  return v3;
}

- (void)setForcesStatusBarHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  if (-[SBDeviceApplicationSceneView forcesStatusBarHidden](self, "forcesStatusBarHidden") != a3)
  {
    -[SBDeviceApplicationSceneView statusBarDescriptor](self, "statusBarDescriptor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setForceHidden:", v3);

    if (-[SBSceneView effectiveDisplayMode](self, "effectiveDisplayMode") == 4)
      -[SBDeviceApplicationSceneView _updateStatusBarVisibilityForHostView](self, "_updateStatusBarVisibilityForHostView");
  }
}

- (BOOL)forcesStatusBarHidden
{
  void *v2;
  char v3;

  -[SBDeviceApplicationSceneView statusBarDescriptor](self, "statusBarDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isForcedHidden");

  return v3;
}

- (SBApplicationSceneViewStatusBarDescriptor)statusBarDescriptor
{
  return self->_statusBarDescriptor;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  objc_super v16;
  CGRect v17;
  CGRect v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SBDeviceApplicationSceneView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16.receiver = self;
  v16.super_class = (Class)SBDeviceApplicationSceneView;
  -[SBDeviceApplicationSceneView setBounds:](&v16, sel_setBounds_, x, y, width, height);
  if (self->_waitingForBoundsUpdateDuringRotation)
  {
    v17.origin.x = v9;
    v17.origin.y = v11;
    v17.size.width = v13;
    v17.size.height = v15;
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = height;
    if (!CGRectEqualToRect(v17, v18))
    {
      self->_waitingForBoundsUpdateDuringRotation = 0;
      self->_overlayOrientationAtStartOfRotation = 0;
      -[SBDeviceApplicationSceneView _setCounterRotationViewTransformUpdatesPaused:](self, "_setCounterRotationViewTransformUpdatesPaused:", 0);
    }
  }
  -[SBSceneView _updateBackgroundColor](self, "_updateBackgroundColor");
}

- (void)_updateEdgeProtectAndAutoHideOnHomeGrabberView
{
  void *v3;
  int v4;
  SBFHomeGrabberSettings *grabberSettings;
  void *v6;
  id v7;

  -[SBDeviceApplicationSceneView homeGrabberView](self, "homeGrabberView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SBSceneView sceneHandle](self, "sceneHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAutoHideEnabledForHomeAffordance");

  grabberSettings = self->_grabberSettings;
  if (v4)
  {
    -[SBFHomeGrabberSettings autoHideTimeOnAppRequest](grabberSettings, "autoHideTimeOnAppRequest");
    objc_msgSend(v7, "turnOnAutoHideWithInitialDelay:");
  }
  else
  {
    -[SBFHomeGrabberSettings delayForUnhideOnAppRequest](grabberSettings, "delayForUnhideOnAppRequest");
    objc_msgSend(v7, "turnOffAutoHideWithDelay:");
  }
  -[SBSceneView sceneHandle](self, "sceneHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEdgeProtectEnabled:", objc_msgSend(v6, "isEdgeProtectEnabledForHomeGesture"));

}

- (SBHomeGrabberView)homeGrabberView
{
  return -[SBHomeGrabberRotationView grabberView](self->_grabberRotationView, "grabberView");
}

- (BOOL)_contentPrefersToDisableClipping
{
  void *v2;
  char v3;

  -[SBSceneView sceneHandle](self, "sceneHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "contentPrefersToDisableClipping");

  return v3;
}

void __120__SBDeviceApplicationSceneView_initWithSceneHandle_referenceSize_contentOrientation_containerOrientation_hostRequester___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 32);
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_sceneHandleDidUpdateSettingsWithDiff:previousSettings:", v7, v6);

}

- (void)_sceneHandleDidUpdateSettingsWithDiff:(id)a3 previousSettings:(id)a4
{
  id v6;
  id v7;
  UIApplicationSceneSettingsDiffInspector *sceneSettingsInspector;
  UIApplicationSceneSettingsDiffInspector *v9;
  UIApplicationSceneSettingsDiffInspector *v10;
  UIApplicationSceneSettingsDiffInspector *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBDeviceApplicationSceneView _sceneHandleDidUpdateSettingsWithDiff:previousSettings:]");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("SBDeviceApplicationSceneView.m"), 774, CFSTR("this call must be made on the main thread"));

  }
  sceneSettingsInspector = self->_sceneSettingsInspector;
  if (!sceneSettingsInspector)
  {
    v9 = (UIApplicationSceneSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E0CEA340]);
    v10 = self->_sceneSettingsInspector;
    self->_sceneSettingsInspector = v9;

    objc_initWeak(&location, self);
    v11 = self->_sceneSettingsInspector;
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __87__SBDeviceApplicationSceneView__sceneHandleDidUpdateSettingsWithDiff_previousSettings___block_invoke;
    v17 = &unk_1E8EA2658;
    objc_copyWeak(&v18, &location);
    -[UIApplicationSceneSettingsDiffInspector observeInterfaceOrientationWithBlock:](v11, "observeInterfaceOrientationWithBlock:", &v14);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
    sceneSettingsInspector = self->_sceneSettingsInspector;
  }
  -[UIApplicationSceneSettingsDiffInspector inspectDiff:withContext:](sceneSettingsInspector, "inspectDiff:withContext:", v6, 0, v14, v15, v16, v17);

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _UIDirectionalRotationView *hostCounterRotationView;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  _QWORD v28[9];
  _QWORD v29[16];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  _BYTE buf[32];
  __int128 v35;
  uint64_t v36;
  CGRect v37;
  CGRect v38;

  v36 = *MEMORY[0x1E0C80C00];
  if (-[SBDeviceApplicationSceneClassicWrapperView suppressLayoutUpdatesForStartOfClassicPhoneAppRotation](self->_classicWrapperView, "suppressLayoutUpdatesForStartOfClassicPhoneAppRotation"))
  {
    return;
  }
  v33.receiver = self;
  v33.super_class = (Class)SBDeviceApplicationSceneView;
  -[SBSceneView layoutSubviews](&v33, sel_layoutSubviews);
  -[SBDeviceApplicationSceneView bounds](self, "bounds");
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = v6;
  if (self->_hostCounterRotationView)
  {
    -[SBDeviceApplicationSceneView bringSubviewToFront:](self, "bringSubviewToFront:");
    v11 = -[SBSceneView orientation](self, "orientation");
    -[SBSceneView sceneHandle](self, "sceneHandle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "application");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "classicAppPhoneAppRunningOnPad");

    if (v14)
      v11 = objc_msgSend((id)SBApp, "interfaceOrientationForCurrentDeviceOrientation:", 0);
    v31 = 0u;
    v32 = 0u;
    v30 = 0u;
    SBFTransformFromOrientationToOrientation();
    -[SBDeviceApplicationSceneView center](self, "center");
    v17 = v15;
    v18 = v16;
    if (self->_waitingForBoundsUpdateDuringRotation)
    {
      v19 = v10;
      v20 = v9;
      if ((unint64_t)(self->_overlayOrientationAtStartOfRotation - 3) > 1)
      {
LABEL_8:
        -[_UIDirectionalRotationView setCenter:](self->_hostCounterRotationView, "setCenter:", v15, v16);
        -[_UIDirectionalRotationView setBounds:](self->_hostCounterRotationView, "setBounds:", v7, v8, v20, v19);
        if (!self->_counterRotationViewTransformUpdatesPaused)
        {
          hostCounterRotationView = self->_hostCounterRotationView;
          *(_OWORD *)buf = v30;
          *(_OWORD *)&buf[16] = v31;
          v35 = v32;
          -[_UIDirectionalRotationView setTransform:](hostCounterRotationView, "setTransform:", buf);
        }
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __46__SBDeviceApplicationSceneView_layoutSubviews__block_invoke;
        v29[3] = &unk_1E8EB34C0;
        v29[4] = self;
        v29[5] = v11;
        *(double *)&v29[6] = v17;
        *(double *)&v29[7] = v18;
        *(double *)&v29[8] = v7;
        *(double *)&v29[9] = v8;
        *(double *)&v29[10] = v20;
        *(double *)&v29[11] = v19;
        *(double *)&v29[12] = v7;
        *(double *)&v29[13] = v8;
        *(double *)&v29[14] = v9;
        *(double *)&v29[15] = v10;
        -[SBDeviceApplicationSceneView _enumerateOrderedOverlayViewPriorities:](self, "_enumerateOrderedOverlayViewPriorities:", v29);
        if (self->_grabberLivesInCounterRotationView)
        {
          -[SBHomeGrabberRotationView setFrame:](self->_grabberRotationView, "setFrame:", v7, v8, v20, v19);
          -[_UIDirectionalRotationView bringSubviewToFront:](self->_hostCounterRotationView, "bringSubviewToFront:", self->_grabberRotationView);
        }
        SBLogHomeAffordance();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);

        if (v23)
        {
          -[SBDeviceApplicationSceneView bounds](self, "bounds");
          NSStringFromCGRect(v37);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIDirectionalRotationView bounds](self->_hostCounterRotationView, "bounds");
          NSStringFromCGRect(v38);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBSceneView orientation](self, "orientation");
          BSInterfaceOrientationDescription();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          SBLogHomeAffordance();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134218754;
            *(_QWORD *)&buf[4] = self;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v24;
            *(_WORD *)&buf[22] = 2114;
            *(_QWORD *)&buf[24] = v25;
            LOWORD(v35) = 2114;
            *(_QWORD *)((char *)&v35 + 2) = v26;
            _os_log_debug_impl(&dword_1D0540000, v27, OS_LOG_TYPE_DEBUG, "%p laying out sceneView - scene=%{public}@ counter=%{public}@-%{public}@", buf, 0x2Au);
          }

        }
        goto LABEL_17;
      }
    }
    else
    {
      v19 = v10;
      v20 = v9;
      if ((unint64_t)(v11 - 3) >= 2)
        goto LABEL_8;
    }
    v19 = v9;
    v20 = v10;
    goto LABEL_8;
  }
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __46__SBDeviceApplicationSceneView_layoutSubviews__block_invoke_56;
  v28[3] = &unk_1E8EB34E8;
  v28[4] = self;
  *(double *)&v28[5] = v3;
  *(double *)&v28[6] = v4;
  *(double *)&v28[7] = v5;
  *(double *)&v28[8] = v6;
  -[SBDeviceApplicationSceneView _enumerateOrderedOverlayViewPriorities:](self, "_enumerateOrderedOverlayViewPriorities:", v28);
LABEL_17:
  if (self->_classicAccessoryView)
  {
    -[SBDeviceApplicationSceneView bringSubviewToFront:](self, "bringSubviewToFront:");
    -[SBDeviceApplicationSceneClassicAccessoryView setFrame:](self->_classicAccessoryView, "setFrame:", v7, v8, v9, v10);
  }
  if (self->_grabberRotationView)
  {
    if (!self->_grabberLivesInCounterRotationView)
    {
      -[SBDeviceApplicationSceneView bringSubviewToFront:](self, "bringSubviewToFront:");
      -[SBHomeGrabberRotationView setFrame:](self->_grabberRotationView, "setFrame:", v7, v8, v9, v10);
    }
  }
  -[SBDeviceApplicationSceneView _updateDragAndDropExclusionDebugViewsIfNecessary](self, "_updateDragAndDropExclusionDebugViewsIfNecessary");
}

- (void)_sceneHandleDidUpdateClientSettingsWithDiff:(id)a3 transitionContext:(id)a4
{
  id v6;
  id v7;
  UIApplicationSceneClientSettingsDiffInspector *v8;
  UIApplicationSceneClientSettingsDiffInspector *clientSettingsInspector;
  UIApplicationSceneClientSettingsDiffInspector *v10;
  uint64_t v11;
  UIApplicationSceneClientSettingsDiffInspector *v12;
  UIApplicationSceneClientSettingsDiffInspector *v13;
  UIApplicationSceneClientSettingsDiffInspector *v14;
  uint64_t v15;
  UIApplicationSceneClientSettingsDiffInspector *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  id location[2];

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBDeviceApplicationSceneView _sceneHandleDidUpdateClientSettingsWithDiff:transitionContext:]");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("SBDeviceApplicationSceneView.m"), 684, CFSTR("this call must be made on the main thread"));

  }
  if (!self->_clientSettingsInspector)
  {
    v8 = (UIApplicationSceneClientSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E0CEA328]);
    clientSettingsInspector = self->_clientSettingsInspector;
    self->_clientSettingsInspector = v8;

    objc_initWeak(location, self);
    v10 = self->_clientSettingsInspector;
    v11 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __94__SBDeviceApplicationSceneView__sceneHandleDidUpdateClientSettingsWithDiff_transitionContext___block_invoke;
    v27[3] = &unk_1E8EA2658;
    objc_copyWeak(&v28, location);
    -[UIApplicationSceneClientSettingsDiffInspector observeStatusBarContextIDWithBlock:](v10, "observeStatusBarContextIDWithBlock:", v27);
    v12 = self->_clientSettingsInspector;
    v25[0] = v11;
    v25[1] = 3221225472;
    v25[2] = __94__SBDeviceApplicationSceneView__sceneHandleDidUpdateClientSettingsWithDiff_transitionContext___block_invoke_2;
    v25[3] = &unk_1E8EA2658;
    objc_copyWeak(&v26, location);
    -[UIApplicationSceneClientSettingsDiffInspector observeBackgroundStyleWithBlock:](v12, "observeBackgroundStyleWithBlock:", v25);
    v13 = self->_clientSettingsInspector;
    v23[0] = v11;
    v23[1] = 3221225472;
    v23[2] = __94__SBDeviceApplicationSceneView__sceneHandleDidUpdateClientSettingsWithDiff_transitionContext___block_invoke_4;
    v23[3] = &unk_1E8EA2658;
    objc_copyWeak(&v24, location);
    -[UIApplicationSceneClientSettingsDiffInspector observeInterfaceOrientationWithBlock:](v13, "observeInterfaceOrientationWithBlock:", v23);
    v14 = self->_clientSettingsInspector;
    v15 = v11;
    v21[0] = v11;
    v21[1] = 3221225472;
    v21[2] = __94__SBDeviceApplicationSceneView__sceneHandleDidUpdateClientSettingsWithDiff_transitionContext___block_invoke_77;
    v21[3] = &unk_1E8EA2658;
    objc_copyWeak(&v22, location);
    -[UIApplicationSceneClientSettingsDiffInspector observeHomeIndicatorAutoHiddenWithBlock:](v14, "observeHomeIndicatorAutoHiddenWithBlock:", v21);
    v16 = self->_clientSettingsInspector;
    v19[0] = v15;
    v19[1] = 3221225472;
    v19[2] = __94__SBDeviceApplicationSceneView__sceneHandleDidUpdateClientSettingsWithDiff_transitionContext___block_invoke_2_78;
    v19[3] = &unk_1E8EA2658;
    objc_copyWeak(&v20, location);
    -[UIApplicationSceneClientSettingsDiffInspector observeScreenEdgesDeferringSystemGesturesWithBlock:](v16, "observeScreenEdgesDeferringSystemGesturesWithBlock:", v19);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);
    objc_destroyWeak(location);
  }
  -[SBDeviceApplicationSceneView _updateDragAndDropExclusionDebugViewsIfNecessary](self, "_updateDragAndDropExclusionDebugViewsIfNecessary");
  -[UIApplicationSceneClientSettingsDiffInspector inspectDiff:withContext:](self->_clientSettingsInspector, "inspectDiff:withContext:", v6, v7);

}

- (SBDeviceApplicationSceneView)initWithSceneHandle:(id)a3 referenceSize:(CGSize)a4 contentOrientation:(int64_t)a5 containerOrientation:(int64_t)a6 hostRequester:(id)a7
{
  double height;
  double width;
  id v14;
  id v15;
  SBDeviceApplicationSceneView *v16;
  SBApplicationSceneViewStatusBarDescriptor *v17;
  SBApplicationSceneViewStatusBarDescriptor *statusBarDescriptor;
  void *v19;
  void *v20;
  SBDeviceApplicationSceneViewPlaceholderContentViewProvider *v21;
  void *v22;
  SBDeviceApplicationSceneViewPlaceholderContentViewProvider *v23;
  SBApplicationSceneBackgroundView *v24;
  SBApplicationSceneBackgroundView *v25;
  uint64_t v26;
  SBFHomeGrabberSettings *grabberSettings;
  uint64_t v28;
  SBMedusaSettings *medusaSettings;
  SBSceneHandleBlockObserver *v30;
  SBSceneHandleBlockObserver *sceneHandleObserver;
  SBSceneHandleBlockObserver *v32;
  uint64_t v33;
  id v34;
  SBSceneHandleBlockObserver *v35;
  id v36;
  SBSceneHandleBlockObserver *v37;
  id v38;
  void *v39;
  void *v40;
  void *v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  id v48;
  id location;
  objc_super v50;

  height = a4.height;
  width = a4.width;
  v14 = a3;
  v15 = a7;
  if ((objc_msgSend(v14, "isDeviceApplicationSceneHandle") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDeviceApplicationSceneView.m"), 101, CFSTR("This class requires a SBDeviceApplicationSceneHandle."));

  }
  v50.receiver = self;
  v50.super_class = (Class)SBDeviceApplicationSceneView;
  v16 = -[SBApplicationSceneView initWithSceneHandle:referenceSize:contentOrientation:containerOrientation:hostRequester:](&v50, sel_initWithSceneHandle_referenceSize_contentOrientation_containerOrientation_hostRequester_, v14, a5, a6, v15, width, height);
  if (v16)
  {
    v17 = -[SBApplicationSceneViewStatusBarDescriptor initWithForceHidden:]([SBApplicationSceneViewStatusBarDescriptor alloc], "initWithForceHidden:", 0);
    statusBarDescriptor = v16->_statusBarDescriptor;
    v16->_statusBarDescriptor = v17;

    v16->_statusBarAlpha = 1.0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v14, "placeholderContentProvider");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBSceneView setPlaceholderContentProvider:](v16, "setPlaceholderContentProvider:", v19);

    }
    -[SBSceneView placeholderContentProvider](v16, "placeholderContentProvider");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      v21 = [SBDeviceApplicationSceneViewPlaceholderContentViewProvider alloc];
      objc_msgSend(v14, "application");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[SBDeviceApplicationSceneViewPlaceholderContentViewProvider initWithApplication:](v21, "initWithApplication:", v22);
      -[SBSceneView setPlaceholderContentProvider:](v16, "setPlaceholderContentProvider:", v23);

    }
    v24 = [SBApplicationSceneBackgroundView alloc];
    -[SBDeviceApplicationSceneView bounds](v16, "bounds");
    v25 = -[SBApplicationSceneBackgroundView initWithFrame:](v24, "initWithFrame:");
    -[SBApplicationSceneBackgroundView setWallpaperStyle:](v25, "setWallpaperStyle:", -[SBDeviceApplicationSceneView _wallpaperStyle](v16, "_wallpaperStyle"));
    -[SBDeviceApplicationSceneView setBackgroundView:](v16, "setBackgroundView:", v25);
    objc_msgSend(MEMORY[0x1E0DA9E28], "rootSettings");
    v26 = objc_claimAutoreleasedReturnValue();
    grabberSettings = v16->_grabberSettings;
    v16->_grabberSettings = (SBFHomeGrabberSettings *)v26;

    +[SBMedusaDomain rootSettings](SBMedusaDomain, "rootSettings");
    v28 = objc_claimAutoreleasedReturnValue();
    medusaSettings = v16->_medusaSettings;
    v16->_medusaSettings = (SBMedusaSettings *)v28;

    objc_initWeak(&location, v16);
    v30 = (SBSceneHandleBlockObserver *)objc_alloc_init(MEMORY[0x1E0DAC250]);
    sceneHandleObserver = v16->_sceneHandleObserver;
    v16->_sceneHandleObserver = v30;

    objc_msgSend(v14, "addObserver:", v16->_sceneHandleObserver);
    v32 = v16->_sceneHandleObserver;
    v33 = MEMORY[0x1E0C809B0];
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __120__SBDeviceApplicationSceneView_initWithSceneHandle_referenceSize_contentOrientation_containerOrientation_hostRequester___block_invoke;
    v47[3] = &unk_1E8EAAAC0;
    objc_copyWeak(&v48, &location);
    v34 = (id)-[SBSceneHandleBlockObserver observeCreate:](v32, "observeCreate:", v47);
    v35 = v16->_sceneHandleObserver;
    v45[0] = v33;
    v45[1] = 3221225472;
    v45[2] = __120__SBDeviceApplicationSceneView_initWithSceneHandle_referenceSize_contentOrientation_containerOrientation_hostRequester___block_invoke_11;
    v45[3] = &unk_1E8EAAAE8;
    objc_copyWeak(&v46, &location);
    v36 = (id)-[SBSceneHandleBlockObserver observeDidUpdateClientSettings:](v35, "observeDidUpdateClientSettings:", v45);
    v37 = v16->_sceneHandleObserver;
    v43[0] = v33;
    v43[1] = 3221225472;
    v43[2] = __120__SBDeviceApplicationSceneView_initWithSceneHandle_referenceSize_contentOrientation_containerOrientation_hostRequester___block_invoke_2;
    v43[3] = &unk_1E8EAAB10;
    objc_copyWeak(&v44, &location);
    v38 = (id)-[SBSceneHandleBlockObserver observeDidUpdateSettings:](v37, "observeDidUpdateSettings:", v43);
    +[SBMedusaDomain rootSettings](SBMedusaDomain, "rootSettings");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addKeyObserver:", v16);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addObserver:selector:name:object:", v16, sel__windowManagementStyleDidChange_, CFSTR("SBSwitcherControllerWindowManagementStyleDidChangeNotification"), 0);

    objc_destroyWeak(&v44);
    objc_destroyWeak(&v46);
    objc_destroyWeak(&v48);
    objc_destroyWeak(&location);

  }
  return v16;
}

- (void)setBackgroundView:(id)a3
{
  SBApplicationSceneBackgroundView *v4;
  SBApplicationSceneBackgroundView *v5;
  SBApplicationSceneBackgroundView *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = (SBApplicationSceneBackgroundView *)a3;
  v5 = v4;
  if (!v4)
  {
    v6 = [SBApplicationSceneBackgroundView alloc];
    -[SBDeviceApplicationSceneView bounds](self, "bounds");
    v5 = -[SBApplicationSceneBackgroundView initWithFrame:](v6, "initWithFrame:");
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SBApplicationSceneBackgroundView setWallpaperStyle:](v4, "setWallpaperStyle:", -[SBDeviceApplicationSceneView _wallpaperStyle](self, "_wallpaperStyle"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SBSceneView sceneHandle](self, "sceneHandle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "application");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBApplicationSceneBackgroundView setNeedsClassicModeBackground:](v4, "setNeedsClassicModeBackground:", objc_msgSend(v8, "isClassic"));

  }
  v9.receiver = self;
  v9.super_class = (Class)SBDeviceApplicationSceneView;
  -[SBSceneView setBackgroundView:](&v9, sel_setBackgroundView_, v5);

}

- (int64_t)_wallpaperStyle
{
  void *v2;
  int64_t v3;

  -[SBSceneView sceneHandle](self, "sceneHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "wallpaperStyle");

  return v3;
}

- (id)_transitionViewForHostView
{
  SBDeviceApplicationSceneClassicWrapperView *classicWrapperView;
  objc_super v4;

  classicWrapperView = self->_classicWrapperView;
  if (classicWrapperView)
    return classicWrapperView;
  v4.receiver = self;
  v4.super_class = (Class)SBDeviceApplicationSceneView;
  -[SBSceneView _transitionViewForHostView](&v4, sel__transitionViewForHostView);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __120__SBDeviceApplicationSceneView_initWithSceneHandle_referenceSize_contentOrientation_containerOrientation_hostRequester___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id *WeakRetained;
  id *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_updateStatusBarVisibilityForHostView");
    if (objc_msgSend(v6, "_sceneDrivesOwnRotation"))
    {
      objc_msgSend(v4, "uiClientSettings");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "sb_effectiveInterfaceOrientation");

      objc_msgSend(v6[82], "setOrientation:", v8);
      SBLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "homeGrabberView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        BSInterfaceOrientationDescription();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 134218242;
        v13 = v10;
        v14 = 2114;
        v15 = v11;
        _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_INFO, "%p setting affordance orientation to %{public}@ for scene creation", (uint8_t *)&v12, 0x16u);

      }
    }
  }

}

- (void)_configureSceneLiveHostView:(id)a3
{
  id v4;
  void *v5;
  BSInvalidatable *v6;
  BSInvalidatable *snapshottingInfoAssertion;
  objc_super v8;

  v4 = a3;
  objc_storeWeak((id *)&self->_currentHostView, v4);
  -[SBDeviceApplicationSceneView _updateStatusBarVisibilityForHostView](self, "_updateStatusBarVisibilityForHostView");
  -[SBDeviceApplicationSceneView createClassicAccessoryViewIfNecessary](self, "createClassicAccessoryViewIfNecessary");
  -[SBDeviceApplicationSceneView _createClassicWrapperViewIfNecessaryForHostView:](self, "_createClassicWrapperViewIfNecessaryForHostView:", v4);
  if (!-[SBDeviceApplicationSceneView _useClassicWrapperView](self, "_useClassicWrapperView"))
  {
    v8.receiver = self;
    v8.super_class = (Class)SBDeviceApplicationSceneView;
    -[SBSceneView _configureSceneLiveHostView:](&v8, sel__configureSceneLiveHostView_, v4);
  }
  -[BSInvalidatable invalidate](self->_snapshottingInfoAssertion, "invalidate");
  -[SBSceneView sceneHandle](self, "sceneHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_sceneHostingInfoForSnapshottingAssertionWithView:", v4);
  v6 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  snapshottingInfoAssertion = self->_snapshottingInfoAssertion;
  self->_snapshottingInfoAssertion = v6;

}

- (void)_updateStatusBarVisibilityForHostView
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  UISceneLayerTarget *v8;
  UISceneLayerTarget *statusBarLayerTarget;
  void *v10;
  id v11;
  _QWORD v12[5];
  _QWORD v13[5];

  -[SBSceneView sceneHandle](self, "sceneHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sceneIfExists");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v4 = MEMORY[0x1E0C809B0];
  if (self->_statusBarLayerTarget)
  {
    -[SBSceneView presenter](self, "presenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v4;
    v13[1] = 3221225472;
    v13[2] = __69__SBDeviceApplicationSceneView__updateStatusBarVisibilityForHostView__block_invoke;
    v13[3] = &unk_1E8E9E758;
    v13[4] = self;
    objc_msgSend(v5, "modifyPresentationContext:", v13);

  }
  objc_msgSend(v11, "clientSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "statusBarContextID");

  if ((_DWORD)v7)
  {
    objc_msgSend(MEMORY[0x1E0CEA930], "targetForContextID:", v7);
    v8 = (UISceneLayerTarget *)objc_claimAutoreleasedReturnValue();
    statusBarLayerTarget = self->_statusBarLayerTarget;
    self->_statusBarLayerTarget = v8;

    -[SBSceneView presenter](self, "presenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v4;
    v12[1] = 3221225472;
    v12[2] = __69__SBDeviceApplicationSceneView__updateStatusBarVisibilityForHostView__block_invoke_2;
    v12[3] = &unk_1E8E9E758;
    v12[4] = self;
    objc_msgSend(v10, "modifyPresentationContext:", v12);

  }
}

- (void)createClassicAccessoryViewIfNecessary
{
  void *v3;
  void *v4;
  int v5;
  SBDeviceApplicationSceneClassicAccessoryView *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  SBDeviceApplicationSceneClassicAccessoryView *v16;
  SBDeviceApplicationSceneClassicAccessoryView *classicAccessoryView;

  if (!self->_classicAccessoryView)
  {
    -[SBSceneView sceneHandle](self, "sceneHandle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "application");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "classicAppPhoneAppRunningOnPad");

    if (v5)
    {
      v6 = [SBDeviceApplicationSceneClassicAccessoryView alloc];
      -[SBDeviceApplicationSceneView bounds](self, "bounds");
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;
      -[SBSceneView sceneHandle](self, "sceneHandle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[SBDeviceApplicationSceneClassicAccessoryView initWithFrame:sceneHandle:](v6, "initWithFrame:sceneHandle:", v15, v8, v10, v12, v14);
      classicAccessoryView = self->_classicAccessoryView;
      self->_classicAccessoryView = v16;

      -[SBDeviceApplicationSceneView addSubview:](self, "addSubview:", self->_classicAccessoryView);
      -[SBDeviceApplicationSceneClassicAccessoryView setDelegate:](self->_classicAccessoryView, "setDelegate:", self);
    }
  }
}

- (void)_createClassicWrapperViewIfNecessaryForHostView:(id)a3
{
  _BOOL4 v4;
  SBDeviceApplicationSceneClassicWrapperView *classicWrapperView;
  SBDeviceApplicationSceneClassicWrapperView *v6;
  void *v7;
  SBDeviceApplicationSceneClassicWrapperView *v8;
  SBDeviceApplicationSceneClassicWrapperView *v9;
  SBDeviceApplicationSceneClassicWrapperView *v10;
  id v11;

  v11 = a3;
  v4 = -[SBDeviceApplicationSceneView _useClassicWrapperView](self, "_useClassicWrapperView");
  classicWrapperView = self->_classicWrapperView;
  if (v4)
  {
    if (!classicWrapperView)
    {
      v6 = [SBDeviceApplicationSceneClassicWrapperView alloc];
      -[SBSceneView sceneHandle](self, "sceneHandle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[SBDeviceApplicationSceneClassicWrapperView initWithSceneHandle:](v6, "initWithSceneHandle:", v7);
      v9 = self->_classicWrapperView;
      self->_classicWrapperView = v8;

      -[SBDeviceApplicationSceneClassicWrapperView setOrientation:](self->_classicWrapperView, "setOrientation:", -[SBSceneView orientation](self, "orientation"));
      -[SBDeviceApplicationSceneView addSubview:](self, "addSubview:", self->_classicWrapperView);
    }
    -[SBDeviceApplicationSceneView _layoutLiveHostView:](self, "_layoutLiveHostView:", v11);
    -[SBDeviceApplicationSceneClassicWrapperView addContentView:](self->_classicWrapperView, "addContentView:", v11);
  }
  else
  {
    -[SBDeviceApplicationSceneClassicWrapperView removeFromSuperview](classicWrapperView, "removeFromSuperview");
    v10 = self->_classicWrapperView;
    self->_classicWrapperView = 0;

  }
}

- (void)_layoutLiveHostView:(id)a3
{
  UIScenePresentation **p_currentHostView;
  id v6;
  id WeakRetained;
  SBDeviceApplicationSceneClassicWrapperView *v8;
  SBDeviceApplicationSceneClassicWrapperView *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  p_currentHostView = &self->_currentHostView;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_currentHostView);
  v8 = self->_classicWrapperView;
  v9 = v8;
  if (!v6 || (WeakRetained ? (v10 = v8 == 0) : (v10 = 1), v10))
  {
    v14.receiver = self;
    v14.super_class = (Class)SBDeviceApplicationSceneView;
    -[SBSceneView _layoutLiveHostView:](&v14, sel__layoutLiveHostView_, v6);

  }
  else
  {

    if (WeakRetained != v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDeviceApplicationSceneView.m"), 1038, CFSTR("unexpected host view!"));

    }
    -[SBDeviceApplicationSceneView bounds](self, "bounds");
    -[SBDeviceApplicationSceneClassicWrapperView setFrame:](v9, "setFrame:");
    -[SBDeviceApplicationSceneClassicWrapperView layoutIfNeeded](v9, "layoutIfNeeded");
    -[SBSceneView backgroundView](self, "backgroundView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "backgroundView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12 == v11)
    {
      objc_msgSend(WeakRetained, "bounds");
      objc_msgSend(v11, "setFrame:");
    }

  }
}

- (BOOL)_sceneDrivesOwnRotation
{
  void *v2;
  BOOL v3;

  -[SBSceneView sceneHandle](self, "sceneHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_interfaceOrientationMode") == 100;

  return v3;
}

- (void)_layoutLiveSnapshotView:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (-[SBDeviceApplicationSceneView _useClassicWrapperView](self, "_useClassicWrapperView"))
  {
    -[SBDeviceApplicationSceneClassicWrapperView addContentView:](self->_classicWrapperView, "addContentView:", v4);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SBDeviceApplicationSceneView;
    -[SBSceneView _layoutLiveSnapshotView:](&v5, sel__layoutLiveSnapshotView_, v4);
  }

}

- (UIEdgeInsets)_contentContainerEdgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *MEMORY[0x1E0CEB4B0];
  v3 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v4 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v5 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)_contentContainerCornerRadius
{
  return 0.0;
}

- (BOOL)_wantsBlackBackground
{
  _BOOL4 v3;

  v3 = -[SBDeviceApplicationSceneView _useClassicWrapperView](self, "_useClassicWrapperView");
  if (v3)
    LOBYTE(v3) = -[SBDeviceApplicationSceneClassicWrapperView wantsBlackBackground](self->_classicWrapperView, "wantsBlackBackground");
  return v3;
}

- (void)willRotateFromInterfaceOrientation:(int64_t)a3 toInterfaceOrientation:(int64_t)a4 alongsideContainerView:(id)a5 animated:(BOOL)a6
{
  if (!self->_waitingForBoundsUpdateDuringRotation)
    -[SBDeviceApplicationSceneView _setCounterRotationViewTransformUpdatesPaused:](self, "_setCounterRotationViewTransformUpdatesPaused:", 0, a4, a5, a6);
}

- (void)_setCounterRotationViewTransformUpdatesPaused:(BOOL)a3
{
  if (self->_counterRotationViewTransformUpdatesPaused != a3)
  {
    self->_counterRotationViewTransformUpdatesPaused = a3;
    -[SBDeviceApplicationSceneView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)didMoveToWindow
{
  id WeakRetained;
  BSInvalidatable *v4;
  void *v5;
  BSInvalidatable *v6;
  BSInvalidatable *snapshottingInfoAssertion;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBDeviceApplicationSceneView;
  -[SBDeviceApplicationSceneView didMoveToWindow](&v8, sel_didMoveToWindow);
  WeakRetained = objc_loadWeakRetained((id *)&self->_currentHostView);
  if (WeakRetained)
  {
    v4 = self->_snapshottingInfoAssertion;
    -[SBSceneView sceneHandle](self, "sceneHandle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_sceneHostingInfoForSnapshottingAssertionWithView:", WeakRetained);
    v6 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    snapshottingInfoAssertion = self->_snapshottingInfoAssertion;
    self->_snapshottingInfoAssertion = v6;

    -[BSInvalidatable invalidate](v4, "invalidate");
  }

}

void __120__SBDeviceApplicationSceneView_initWithSceneHandle_referenceSize_contentOrientation_containerOrientation_hostRequester___block_invoke_11(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 32);
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_sceneHandleDidUpdateClientSettingsWithDiff:transitionContext:", v7, v6);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[SBSceneHandleBlockObserver invalidate](self->_sceneHandleObserver, "invalidate");
  -[BSInvalidatable invalidate](self->_snapshottingInfoAssertion, "invalidate");
  +[SBMedusaDomain rootSettings](SBMedusaDomain, "rootSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeKeyObserver:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)SBDeviceApplicationSceneView;
  -[SBSceneView dealloc](&v5, sel_dealloc);
}

- (void)addOverlayView:(id)a3 withPriority:(int64_t)a4
{
  id v6;
  NSMutableDictionary *overlayViewsByPriority;
  void *v8;
  void *v9;
  char v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  void *v14;
  void *v15;
  id v16;
  NSMutableDictionary *v17;
  void *v18;
  NSMutableDictionary *v19;
  void *v20;
  void *v21;
  int64_t v22;
  void *v23;
  void *hostCounterRotationView;
  id v25;

  v6 = a3;
  if (v6)
  {
    overlayViewsByPriority = self->_overlayViewsByPriority;
    v25 = v6;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](overlayViewsByPriority, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsObject:", v25);

    v6 = v25;
    if ((v10 & 1) == 0)
    {
      v11 = self->_overlayViewsByPriority;
      if (!v11)
      {
        v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v13 = self->_overlayViewsByPriority;
        self->_overlayViewsByPriority = v12;

        v11 = self->_overlayViewsByPriority;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v17 = self->_overlayViewsByPriority;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v16, v18);

      }
      v19 = self->_overlayViewsByPriority;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](v19, "objectForKeyedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObject:", v25);

      -[SBDeviceApplicationSceneView window](self, "window");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = (void *)v22;
      if (v22)
        v22 = -[SBSceneView orientation](self, "orientation");
      self->_lastStableOverlayOrientation = v22;

      if (objc_msgSend(v25, "needsCounterRotation"))
      {
        -[SBDeviceApplicationSceneView _createHostCounterRotationViewIfNecessary](self, "_createHostCounterRotationViewIfNecessary");
        hostCounterRotationView = self->_hostCounterRotationView;
      }
      else
      {
        hostCounterRotationView = self;
      }
      objc_msgSend(hostCounterRotationView, "addSubview:", v25);
      if (-[SBDeviceApplicationSceneView _sceneDrivesOwnRotation](self, "_sceneDrivesOwnRotation"))
        objc_msgSend(v25, "setShouldLayoutOverlayImmediatelyForContainerGeometryChange:", 0);
      objc_msgSend(v25, "addObserver:", self);
      -[SBDeviceApplicationSceneView setNeedsLayout](self, "setNeedsLayout");
      -[SBDeviceApplicationSceneView layoutIfNeeded](self, "layoutIfNeeded");
      v6 = v25;
    }
  }

}

- (void)removeOverlayView:(id)a3 withPriority:(int64_t)a4
{
  id v6;
  NSMutableDictionary *overlayViewsByPriority;
  void *v8;
  void *v9;
  int v10;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSMutableDictionary *v18;
  void *v19;
  NSMutableDictionary *v20;
  id v21;

  v6 = a3;
  if (v6)
  {
    overlayViewsByPriority = self->_overlayViewsByPriority;
    v21 = v6;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](overlayViewsByPriority, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsObject:", v21);

    v6 = v21;
    if (v10)
    {
      objc_msgSend(v21, "removeObserver:", self);
      objc_msgSend(v21, "removeFromSuperview");
      v11 = self->_overlayViewsByPriority;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removeObject:", v21);

      v14 = self->_overlayViewsByPriority;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

      if (!v17)
      {
        v18 = self->_overlayViewsByPriority;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary removeObjectForKey:](v18, "removeObjectForKey:", v19);

      }
      if (!-[NSMutableDictionary count](self->_overlayViewsByPriority, "count"))
      {
        v20 = self->_overlayViewsByPriority;
        self->_overlayViewsByPriority = 0;

        self->_lastStableOverlayOrientation = 0;
      }
      -[SBDeviceApplicationSceneView _tearDownHostCounterRotationViewIfNecessary](self, "_tearDownHostCounterRotationViewIfNecessary");
      v6 = v21;
    }
  }

}

- (CGRect)adjustedBoundsForContentBounds:(CGRect)a3 inOverlayView:(id)a4
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  id v9;
  int64_t v10;
  uint64_t v11;
  char v12;
  double v13;
  void *v14;
  void *v15;
  int v16;
  BOOL v17;
  BOOL v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v10 = -[SBSceneView orientation](self, "orientation");
  v11 = objc_msgSend((id)SBApp, "interfaceOrientationForCurrentDeviceOrientation:", 0);
  v12 = objc_msgSend(v9, "needsCounterRotation");

  if ((v12 & 1) != 0)
    goto LABEL_2;
  -[SBSceneView sceneHandle](self, "sceneHandle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "application");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "classicAppPhoneAppRunningOnPad");

  if (!v16 || v10 == v11)
    goto LABEL_2;
  v17 = (unint64_t)(v11 - 1) > 1 || width <= height;
  if (v17
    && ((unint64_t)(v11 - 3) <= 1 ? (v18 = width < height) : (v18 = 0),
        !v18
     && ((unint64_t)(v10 - 1) > 1 || width <= height)
     && ((unint64_t)(v10 - 3) > 1 || width >= height)))
  {
LABEL_2:
    v13 = height;
    height = width;
  }
  else
  {
    v13 = width;
  }
  v19 = x;
  v20 = y;
  v21 = height;
  result.size.height = v13;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (void)enableTransitionOverlay:(BOOL)a3
{
  _UITransitionOverlayView *transitionOverlayView;
  void *v5;
  void *v6;
  _UITransitionOverlayView *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  id location;

  transitionOverlayView = self->_transitionOverlayView;
  if (a3)
  {
    if (!transitionOverlayView)
    {
      -[SBDeviceApplicationSceneView snapshotViewAfterScreenUpdates:](self, "snapshotViewAfterScreenUpdates:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAF40]), "initWithSnapshot:", v5);
      -[SBDeviceApplicationSceneView bounds](self, "bounds");
      objc_msgSend(v6, "setFrame:");
      objc_msgSend(v6, "setAutoresizingMask:", 18);
      -[SBDeviceApplicationSceneView addSubview:](self, "addSubview:", v6);
      objc_initWeak(&location, self);
      v8 = MEMORY[0x1E0C809B0];
      v9 = 3221225472;
      v10 = __56__SBDeviceApplicationSceneView_enableTransitionOverlay___block_invoke;
      v11 = &unk_1E8EB3498;
      objc_copyWeak(&v12, &location);
      objc_msgSend(v6, "setTransitionCompletionBlock:", &v8);
      objc_msgSend(v6, "startTransition", v8, v9, v10, v11);
      v7 = self->_transitionOverlayView;
      self->_transitionOverlayView = (_UITransitionOverlayView *)v6;

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);

    }
  }
  else if (transitionOverlayView)
  {
    -[_UITransitionOverlayView finishTransitionImmediately](transitionOverlayView, "finishTransitionImmediately");
  }
}

void __56__SBDeviceApplicationSceneView_enableTransitionOverlay___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_cleanUpTransitionOverlayView:", v3);

}

- (void)_cleanUpTransitionOverlayView:(id)a3
{
  _UITransitionOverlayView *transitionOverlayView;

  if (self->_transitionOverlayView == a3)
  {
    objc_msgSend(a3, "removeFromSuperview");
    transitionOverlayView = self->_transitionOverlayView;
    self->_transitionOverlayView = 0;

  }
}

- (void)setStatusBarDescriptor:(id)a3
{
  SBApplicationSceneViewStatusBarDescriptor *v5;
  int64_t v6;
  SBApplicationSceneViewStatusBarDescriptor *v7;

  v5 = (SBApplicationSceneViewStatusBarDescriptor *)a3;
  if (self->_statusBarDescriptor != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_statusBarDescriptor, a3);
    v6 = -[SBSceneView effectiveDisplayMode](self, "effectiveDisplayMode");
    v5 = v7;
    if (v6 == 4)
    {
      -[SBDeviceApplicationSceneView _updateStatusBarVisibilityForHostView](self, "_updateStatusBarVisibilityForHostView");
      v5 = v7;
    }
  }

}

- (void)setStatusBarAlpha:(double)a3
{
  if (self->_statusBarAlpha != a3)
  {
    self->_statusBarAlpha = a3;
    if (-[SBSceneView effectiveDisplayMode](self, "effectiveDisplayMode") == 4)
      -[SBDeviceApplicationSceneView _updateStatusBarVisibilityForHostView](self, "_updateStatusBarVisibilityForHostView");
  }
}

- (void)createHomeGrabberViewIfNecessaryWithSettings:(id)a3
{
  id v4;
  SBHomeGrabberRotationView *v5;
  SBHomeGrabberRotationView *v6;
  SBHomeGrabberRotationView *grabberRotationView;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!self->_grabberRotationView)
  {
    v4 = a3;
    v5 = [SBHomeGrabberRotationView alloc];
    -[SBDeviceApplicationSceneView bounds](self, "bounds");
    v6 = -[SBHomeGrabberRotationView initWithFrame:settings:](v5, "initWithFrame:settings:", v4);

    grabberRotationView = self->_grabberRotationView;
    self->_grabberRotationView = v6;

    -[SBHomeGrabberRotationView setUserInteractionEnabled:](self->_grabberRotationView, "setUserInteractionEnabled:", 0);
    -[SBDeviceApplicationSceneView _createHostCounterRotationViewIfNecessary](self, "_createHostCounterRotationViewIfNecessary");
    if (self->_hostCounterRotationView
      && -[SBDeviceApplicationSceneView _sceneDrivesOwnRotation](self, "_sceneDrivesOwnRotation"))
    {
      self->_grabberLivesInCounterRotationView = 1;
      -[_UIDirectionalRotationView addSubview:](self->_hostCounterRotationView, "addSubview:", self->_grabberRotationView);
      -[SBSceneView sceneHandle](self, "sceneHandle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "sceneIfExists");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "uiClientSettings");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        -[SBHomeGrabberRotationView setOrientation:](self->_grabberRotationView, "setOrientation:", objc_msgSend(v10, "interfaceOrientation"));
        SBLogHomeAffordance();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          -[SBDeviceApplicationSceneView homeGrabberView](self, "homeGrabberView");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBHomeGrabberRotationView orientation](self->_grabberRotationView, "orientation");
          BSInterfaceOrientationDescription();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v20 = v12;
          v21 = 2114;
          v22 = v13;
          _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_INFO, "grabber=%p initializing affordance orientation to %{public}@", buf, 0x16u);

        }
      }

    }
    else
    {
      self->_grabberLivesInCounterRotationView = 0;
      -[SBDeviceApplicationSceneView addSubview:](self, "addSubview:", self->_grabberRotationView);
    }
    -[SBSceneView sceneHandle](self, "sceneHandle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0CEABB0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __77__SBDeviceApplicationSceneView_createHomeGrabberViewIfNecessaryWithSettings___block_invoke;
    v17[3] = &unk_1E8E9E820;
    v17[4] = self;
    v18 = v14;
    v16 = v14;
    objc_msgSend(v15, "performWithoutAnimation:", v17);

  }
}

void __77__SBDeviceApplicationSceneView_createHomeGrabberViewIfNecessaryWithSettings___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "homeGrabberView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAutoHides:", objc_msgSend(*(id *)(a1 + 40), "isAutoHideEnabledForHomeAffordance"));

  objc_msgSend(*(id *)(a1 + 32), "homeGrabberView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEdgeProtectEnabled:", objc_msgSend(*(id *)(a1 + 40), "isEdgeProtectEnabledForHomeGesture"));

}

- (void)tearDownHomeGrabberView
{
  SBHomeGrabberRotationView *grabberRotationView;

  -[SBHomeGrabberRotationView removeFromSuperview](self->_grabberRotationView, "removeFromSuperview");
  grabberRotationView = self->_grabberRotationView;
  self->_grabberRotationView = 0;

  -[SBDeviceApplicationSceneView _tearDownHostCounterRotationViewIfNecessary](self, "_tearDownHostCounterRotationViewIfNecessary");
}

- (void)_createHostCounterRotationViewIfNecessary
{
  _UIDirectionalRotationView *v3;
  _UIDirectionalRotationView *hostCounterRotationView;

  if (!self->_hostCounterRotationView
    && (-[SBDeviceApplicationSceneView _sceneDrivesOwnRotation](self, "_sceneDrivesOwnRotation")
     || -[SBDeviceApplicationSceneView _anyOverlayViewNeedsCounterRotation](self, "_anyOverlayViewNeedsCounterRotation")))
  {
    v3 = (_UIDirectionalRotationView *)objc_alloc_init(MEMORY[0x1E0CEACF8]);
    hostCounterRotationView = self->_hostCounterRotationView;
    self->_hostCounterRotationView = v3;

    -[_UIDirectionalRotationView setCounterTransformView:](self->_hostCounterRotationView, "setCounterTransformView:", 1);
    -[SBDeviceApplicationSceneView addSubview:](self, "addSubview:", self->_hostCounterRotationView);
  }
}

- (void)_tearDownHostCounterRotationViewIfNecessary
{
  _UIDirectionalRotationView *hostCounterRotationView;

  if (self->_hostCounterRotationView
    && !-[SBDeviceApplicationSceneView _sceneDrivesOwnRotation](self, "_sceneDrivesOwnRotation")
    && !-[SBDeviceApplicationSceneView _anyOverlayViewNeedsCounterRotation](self, "_anyOverlayViewNeedsCounterRotation"))
  {
    -[_UIDirectionalRotationView removeFromSuperview](self->_hostCounterRotationView, "removeFromSuperview");
    hostCounterRotationView = self->_hostCounterRotationView;
    self->_hostCounterRotationView = 0;

  }
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBApplicationSceneView application](self, "application");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, 0);

  -[SBSceneView displayMode](self, "displayMode");
  NSStringFromSBSceneViewDisplayMode();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendObject:withName:", v7, CFSTR("displayMode"));

  v9 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[SBDeviceApplicationSceneView forcesStatusBarHidden](self, "forcesStatusBarHidden"), CFSTR("forceStatusBarHidden"), 1);
  -[SBDeviceApplicationSceneView statusBarAlpha](self, "statusBarAlpha");
  v10 = (id)objc_msgSend(v3, "appendFloat:withName:", CFSTR("statusBarAlpha"));
  objc_msgSend(v3, "build");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (void)invalidate
{
  SBSceneHandleBlockObserver *sceneHandleObserver;
  UIApplicationSceneClientSettingsDiffInspector *clientSettingsInspector;
  UIApplicationSceneSettingsDiffInspector *sceneSettingsInspector;
  objc_super v6;

  -[SBSceneHandleBlockObserver invalidate](self->_sceneHandleObserver, "invalidate");
  sceneHandleObserver = self->_sceneHandleObserver;
  self->_sceneHandleObserver = 0;

  -[UIApplicationSceneClientSettingsDiffInspector removeAllObservers](self->_clientSettingsInspector, "removeAllObservers");
  clientSettingsInspector = self->_clientSettingsInspector;
  self->_clientSettingsInspector = 0;

  -[UIApplicationSceneSettingsDiffInspector removeAllObservers](self->_sceneSettingsInspector, "removeAllObservers");
  sceneSettingsInspector = self->_sceneSettingsInspector;
  self->_sceneSettingsInspector = 0;

  -[SBDeviceApplicationSceneClassicAccessoryView invalidate](self->_classicAccessoryView, "invalidate");
  v6.receiver = self;
  v6.super_class = (Class)SBDeviceApplicationSceneView;
  -[SBSceneView invalidate](&v6, sel_invalidate);
}

- (id)_adjustedOverlayViewPriorities
{
  void *v2;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_overlayViewsByPriority, "objectForKeyedSubscript:", &unk_1E91D1310);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    return &unk_1E91CEB60;
  else
    return &unk_1E91CEB78;
}

- (void)_enumerateOrderedOverlayViewPriorities:(id)a3
{
  void (**v4)(id, uint64_t);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t))a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[SBDeviceApplicationSceneView _adjustedOverlayViewPriorities](self, "_adjustedOverlayViewPriorities", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        v4[2](v4, objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "integerValue"));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

void __46__SBDeviceApplicationSceneView_layoutSubviews__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  _BOOL8 v14;
  _QWORD *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 680);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v9);
        if (objc_msgSend(v10, "needsCounterRotation"))
        {
          v11 = *(_QWORD *)(a1 + 32);
          if (*(_BYTE *)(v11 + 696) || (v12 = (_QWORD *)(a1 + 40), *(_BYTE *)(v11 + 697)))
            v12 = (_QWORD *)(v11 + 704);
          objc_msgSend(v10, "setHostOrientation:", *v12);
          v14 = (objc_msgSend(*(id *)(a1 + 32), "_sceneDrivesOwnRotation") & 1) == 0
             && (v13 = *(_QWORD *)(a1 + 32), !*(_BYTE *)(v13 + 696))
             && *(unsigned __int8 *)(v13 + 697) == 0;
          objc_msgSend(v10, "setShouldLayoutOverlayImmediatelyForContainerGeometryChange:", v14);
          objc_msgSend(*(id *)(a1 + 32), "convertPoint:toView:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 648), *(double *)(a1 + 48), *(double *)(a1 + 56));
          objc_msgSend(v10, "setCenter:");
          objc_msgSend(v10, "setBounds:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 648), "bringSubviewToFront:", v10);
          v15 = *(_QWORD **)(a1 + 32);
          v10 = (void *)v15[81];
        }
        else
        {
          objc_msgSend(v10, "setFrame:", *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120));
          v15 = *(_QWORD **)(a1 + 32);
        }
        objc_msgSend(v15, "bringSubviewToFront:", v10);
        ++v9;
      }
      while (v7 != v9);
      v16 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v7 = v16;
    }
    while (v16);
  }

}

void __46__SBDeviceApplicationSceneView_layoutSubviews__block_invoke_56(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 680);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v10, "needsCounterRotation") & 1) == 0)
        {
          objc_msgSend(v10, "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
          objc_msgSend(*(id *)(a1 + 32), "bringSubviewToFront:", v10);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_refresh
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBDeviceApplicationSceneView;
  -[SBSceneView _refresh](&v3, sel__refresh);
  if (-[SBSceneView effectiveDisplayMode](self, "effectiveDisplayMode") == 4)
    -[SBDeviceApplicationSceneView _updateStatusBarVisibilityForHostView](self, "_updateStatusBarVisibilityForHostView");
}

- (void)_configureSceneSnapshotContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  int v20;
  BOOL v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBSceneView sceneHandle](self, "sceneHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sceneIfExists");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBDeviceApplicationSceneView forcesStatusBarHidden](self, "forcesStatusBarHidden")
    || (-[SBDeviceApplicationSceneView statusBarAlpha](self, "statusBarAlpha"), v7 < 1.0))
  {
    v8 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend(v4, "layersToExclude");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithSet:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "clientSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "statusBarContextID");

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v6, "layerManager", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v23 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          v20 = objc_msgSend(v19, "contextID");
          if (v20)
            v21 = v20 == v12;
          else
            v21 = 0;
          if (v21)
          {
            objc_msgSend(v10, "addObject:", v19);
            goto LABEL_16;
          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v16)
          continue;
        break;
      }
    }
LABEL_16:

    objc_msgSend(v4, "setLayersToExclude:", v10);
  }

}

- (BOOL)_representsTranslucentContent
{
  void *v2;
  char v3;

  -[SBSceneView sceneHandle](self, "sceneHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isTranslucent");

  return v3;
}

- (void)setCornerRadius:(double)a3
{
  id v4;

  -[SBDeviceApplicationSceneView layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", a3);

}

- (double)cornerRadius
{
  void *v2;
  double v3;
  double v4;

  -[SBDeviceApplicationSceneView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cornerRadius");
  v4 = v3;

  return v4;
}

- (void)overlayViewDidRotate:(id)a3 toInterfaceOrientation:(int64_t)a4
{
  -[SBDeviceApplicationSceneView _maybeStartTrackingRotationForOverlayFromOrientation:toOrientation:](self, "_maybeStartTrackingRotationForOverlayFromOrientation:toOrientation:", self->_lastStableOverlayOrientation);
  self->_lastStableOverlayOrientation = a4;
}

- (void)overlayViewDidChangeCounterRotationRequirement:(id)a3
{
  void *hostCounterRotationView;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "removeFromSuperview");
  if (objc_msgSend(v5, "needsCounterRotation"))
  {
    -[SBDeviceApplicationSceneView _createHostCounterRotationViewIfNecessary](self, "_createHostCounterRotationViewIfNecessary");
    hostCounterRotationView = self->_hostCounterRotationView;
  }
  else
  {
    -[SBDeviceApplicationSceneView _tearDownHostCounterRotationViewIfNecessary](self, "_tearDownHostCounterRotationViewIfNecessary");
    hostCounterRotationView = self;
  }
  objc_msgSend(hostCounterRotationView, "addSubview:", v5);
  -[SBDeviceApplicationSceneView setNeedsLayout](self, "setNeedsLayout");

}

uint64_t __69__SBDeviceApplicationSceneView__updateStatusBarVisibilityForHostView__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeLayerPresentationOverrideForLayerTarget:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 608));
}

uint64_t __69__SBDeviceApplicationSceneView__updateStatusBarVisibilityForHostView__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[5];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 608);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__SBDeviceApplicationSceneView__updateStatusBarVisibilityForHostView__block_invoke_3;
  v5[3] = &unk_1E8EB3510;
  v5[4] = v2;
  return objc_msgSend(a2, "modifyLayerPresentationOverrideContextForLayerTarget:block:", v3, v5);
}

void __69__SBDeviceApplicationSceneView__updateStatusBarVisibilityForHostView__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "statusBarAlpha");
  objc_msgSend(v4, "setAlpha:");
  objc_msgSend(v4, "setHidden:", objc_msgSend(*(id *)(a1 + 32), "forcesStatusBarHidden"));

}

void __94__SBDeviceApplicationSceneView__sceneHandleDidUpdateClientSettingsWithDiff_transitionContext___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateStatusBarVisibilityForHostView");

}

void __94__SBDeviceApplicationSceneView__sceneHandleDidUpdateClientSettingsWithDiff_transitionContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id WeakRetained;
  _QWORD v15[4];
  id v16;
  uint64_t v17;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = a2;
  objc_msgSend(WeakRetained, "backgroundView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = objc_msgSend(WeakRetained, "_wallpaperStyle");
    if (objc_msgSend(v4, "wallpaperStyle") != v5)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v3, "animationSettings");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setWallpaperStyle:withAnimationSettings:", v5, v6);

        v7 = (void *)MEMORY[0x1E0CEA918];
        objc_msgSend(v3, "animationFence");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "_synchronizeDrawingWithFence:", v8);
LABEL_7:

        goto LABEL_8;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v9 = (void *)MEMORY[0x1E0D01908];
        objc_msgSend(v3, "animationSettings");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "factoryWithSettings:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __94__SBDeviceApplicationSceneView__sceneHandleDidUpdateClientSettingsWithDiff_transitionContext___block_invoke_3;
        v15[3] = &unk_1E8E9DE88;
        v16 = v4;
        v17 = v5;
        objc_msgSend(v9, "animateWithFactory:actions:", v11, v15);

        v12 = (void *)MEMORY[0x1E0CEA918];
        objc_msgSend(v3, "animationFence");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "_synchronizeDrawingWithFence:", v13);

        v8 = v16;
        goto LABEL_7;
      }
    }
  }
LABEL_8:

}

uint64_t __94__SBDeviceApplicationSceneView__sceneHandleDidUpdateClientSettingsWithDiff_transitionContext___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setWallpaperStyle:", *(_QWORD *)(a1 + 40));
}

void __94__SBDeviceApplicationSceneView__sceneHandleDidUpdateClientSettingsWithDiff_transitionContext___block_invoke_4(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "sceneHandle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sceneIfExists");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "uiClientSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      v9 = objc_msgSend(v7, "interfaceOrientation");
    else
      v9 = objc_msgSend(v4[82], "orientation");
    v10 = v9;
    if (objc_msgSend(v4, "_sceneDrivesOwnRotation"))
    {
      objc_msgSend(v4, "setNeedsLayout");
      v11 = a2;
      objc_msgSend(v11, "animationSettings");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4[82], "setOrientation:animated:rotationSettings:", v10, 1, v12);
      SBLogHomeAffordance();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4[82], "grabberView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        BSInterfaceOrientationDescription();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 134218242;
        v21 = v14;
        v22 = 2114;
        v23 = v15;
        _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_INFO, "grabber=%p rotating affordance to %{public}@", (uint8_t *)&v20, 0x16u);

      }
      v16 = (void *)MEMORY[0x1E0CEA918];
      objc_msgSend(v11, "animationFence");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "_synchronizeDrawingWithFence:", v17);
    }
    objc_msgSend(v4, "homeGrabberView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sceneHandle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setEdgeProtectEnabled:", objc_msgSend(v19, "isEdgeProtectEnabledForHomeGesture"));

  }
}

void __94__SBDeviceApplicationSceneView__sceneHandleDidUpdateClientSettingsWithDiff_transitionContext___block_invoke_77(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateEdgeProtectAndAutoHideOnHomeGrabberView");
    WeakRetained = v2;
  }

}

void __94__SBDeviceApplicationSceneView__sceneHandleDidUpdateClientSettingsWithDiff_transitionContext___block_invoke_2_78(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateEdgeProtectAndAutoHideOnHomeGrabberView");
    WeakRetained = v2;
  }

}

void __87__SBDeviceApplicationSceneView__sceneHandleDidUpdateSettingsWithDiff_previousSettings___block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v1 = WeakRetained[90];
  v2 = v1;
  if (v1 && objc_msgSend(v1, "suppressLayoutUpdatesForStartOfClassicPhoneAppRotation"))
  {
    objc_msgSend(v2, "setSuppressLayoutUpdatesForStartOfClassicPhoneAppRotation:", 0);
    objc_msgSend(WeakRetained, "setNeedsLayout");
  }

}

- (BOOL)_anyOverlayViewNeedsCounterRotation
{
  void *v2;
  char v3;

  -[NSMutableDictionary allValues](self->_overlayViewsByPriority, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "bs_containsObjectPassingTest:", &__block_literal_global_222);

  return v3;
}

uint64_t __67__SBDeviceApplicationSceneView__anyOverlayViewNeedsCounterRotation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bs_containsObjectPassingTest:", &__block_literal_global_82_0);
}

uint64_t __67__SBDeviceApplicationSceneView__anyOverlayViewNeedsCounterRotation__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "needsCounterRotation");
}

- (void)_updateReferenceSize:(CGSize)a3 andOrientation:(int64_t)a4
{
  double height;
  double width;
  int64_t v8;
  void *v9;
  objc_super v10;

  height = a3.height;
  width = a3.width;
  v8 = -[SBSceneView orientation](self, "orientation");
  v10.receiver = self;
  v10.super_class = (Class)SBDeviceApplicationSceneView;
  -[SBSceneView _updateReferenceSize:andOrientation:](&v10, sel__updateReferenceSize_andOrientation_, a4, width, height);
  -[SBDeviceApplicationSceneView _maybeStartTrackingRotationForOverlayFromOrientation:toOrientation:](self, "_maybeStartTrackingRotationForOverlayFromOrientation:toOrientation:", v8, a4);
  if (v8 != a4)
  {
    -[SBDeviceApplicationSceneView window](self, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      self->_lastStableOverlayOrientation = a4;
  }
}

- (void)_maybeStartTrackingRotationForOverlayFromOrientation:(int64_t)a3 toOrientation:(int64_t)a4
{
  int64_t lastStableOverlayOrientation;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (!self->_counterRotationViewTransformUpdatesPaused
    && -[SBDeviceApplicationSceneView _anyOverlayViewNeedsCounterRotation](self, "_anyOverlayViewNeedsCounterRotation", a3)&& self->_hostCounterRotationView&& !-[SBDeviceApplicationSceneView _sceneDrivesOwnRotation](self, "_sceneDrivesOwnRotation"))
  {
    lastStableOverlayOrientation = self->_lastStableOverlayOrientation;
    if (lastStableOverlayOrientation && lastStableOverlayOrientation != a4)
    {
      self->_counterRotationViewTransformUpdatesPaused = 1;
      SBFAngleForRotationFromInterfaceOrientationToInterfaceOrientation();
      if (BSFloatEqualToFloat())
      {
        self->_waitingForBoundsUpdateDuringRotation = 0;
      }
      else
      {
        -[SBSceneView sceneHandle](self, "sceneHandle");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "application");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "classicAppPhoneAppRunningOnPad"))
        {
          -[UIView _sbWindowScene](self, "_sbWindowScene");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "switcherController");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          self->_waitingForBoundsUpdateDuringRotation = objc_msgSend(v11, "windowManagementStyle") != 2;

        }
        else
        {
          self->_waitingForBoundsUpdateDuringRotation = 1;
        }

      }
      self->_overlayOrientationAtStartOfRotation = self->_lastStableOverlayOrientation;
    }
  }
}

- (id)prepareForContentRotation
{
  void *v3;
  void *v4;
  int v5;
  SBUIBlockAnimationController *v6;
  _QWORD v8[5];

  -[SBSceneView sceneHandle](self, "sceneHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "application");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "classicAppPhoneAppRunningOnPad");

  if (!v5)
    return 0;
  -[SBDeviceApplicationSceneClassicWrapperView setStartingOrientationForClassicPhoneAppRotation:](self->_classicWrapperView, "setStartingOrientationForClassicPhoneAppRotation:", -[SBSceneView orientation](self, "orientation"));
  if (!-[SBDeviceApplicationSceneClassicWrapperView suppressLayoutUpdatesForStartOfClassicPhoneAppRotation](self->_classicWrapperView, "suppressLayoutUpdatesForStartOfClassicPhoneAppRotation"))return 0;
  v6 = [SBUIBlockAnimationController alloc];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__SBDeviceApplicationSceneView_prepareForContentRotation__block_invoke;
  v8[3] = &unk_1E8EB35B8;
  v8[4] = self;
  return -[SBUIBlockAnimationController initWithWorkspaceTransitionRequest:animationSettings:animationBlock:](v6, "initWithWorkspaceTransitionRequest:animationSettings:animationBlock:", 0, 0, v8);
}

void __57__SBDeviceApplicationSceneView_prepareForContentRotation__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];

  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 720);
  v7 = a5;
  objc_msgSend(v6, "setPreparingForUserDrivenClassicRotation:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 720), "setNeedsLayout");
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 720), "setPreparingForUserDrivenClassicRotation:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 720), "setStartingOrientationForClassicPhoneAppRotation:", 0);
  objc_msgSend(*(id *)(a1 + 32), "sceneHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_windowScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "switcherController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "traitsParticipantForSceneHandle:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBAnimationUtilities animationSettingsForRotationFromInterfaceOrientation:toInterfaceOrientation:](SBAnimationUtilities, "animationSettingsForRotationFromInterfaceOrientation:toInterfaceOrientation:", objc_msgSend(v11, "sbf_previousOrientation"), objc_msgSend(v11, "sbf_currentOrientation"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CEABB0];
  objc_msgSend(v12, "duration");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57__SBDeviceApplicationSceneView_prepareForContentRotation__block_invoke_2;
  v14[3] = &unk_1E8E9DED8;
  v14[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v13, "animateWithDuration:animations:completion:", v14, v7);

}

uint64_t __57__SBDeviceApplicationSceneView_prepareForContentRotation__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 720), "setNeedsLayout");
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)containerViewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  if (!self->_waitingForBoundsUpdateDuringRotation)
    -[SBDeviceApplicationSceneView _setCounterRotationViewTransformUpdatesPaused:](self, "_setCounterRotationViewTransformUpdatesPaused:", 0, a3.width, a3.height);
}

- (double)statusBarAlpha
{
  return self->_statusBarAlpha;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (unint64_t)maskedCorners
{
  return self->maskedCorners;
}

- (void)setMaskedCorners:(unint64_t)a3
{
  self->maskedCorners = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionOverlayView, 0);
  objc_storeStrong((id *)&self->_medusaSettings, 0);
  objc_storeStrong((id *)&self->_multitaskingExclusionRectDebugViews, 0);
  objc_destroyWeak((id *)&self->_currentHostView);
  objc_storeStrong((id *)&self->_snapshottingInfoAssertion, 0);
  objc_storeStrong((id *)&self->_classicWrapperView, 0);
  objc_storeStrong((id *)&self->_classicAccessoryView, 0);
  objc_storeStrong((id *)&self->_overlayViewsByPriority, 0);
  objc_storeStrong((id *)&self->_grabberSettings, 0);
  objc_storeStrong((id *)&self->_grabberRotationView, 0);
  objc_storeStrong((id *)&self->_hostCounterRotationView, 0);
  objc_storeStrong((id *)&self->_statusBarDescriptor, 0);
  objc_storeStrong((id *)&self->_sceneSettingsInspector, 0);
  objc_storeStrong((id *)&self->_clientSettingsInspector, 0);
  objc_storeStrong((id *)&self->_sceneHandleObserver, 0);
  objc_storeStrong((id *)&self->_statusBarLayerTarget, 0);
}

- (void)teardownClassicAccessoryViewIfNecessary
{
  SBDeviceApplicationSceneClassicAccessoryView *classicAccessoryView;
  SBDeviceApplicationSceneClassicAccessoryView *v4;

  classicAccessoryView = self->_classicAccessoryView;
  if (classicAccessoryView)
  {
    -[SBDeviceApplicationSceneClassicAccessoryView invalidate](classicAccessoryView, "invalidate");
    -[SBDeviceApplicationSceneClassicAccessoryView removeFromSuperview](self->_classicAccessoryView, "removeFromSuperview");
    v4 = self->_classicAccessoryView;
    self->_classicAccessoryView = 0;

  }
}

- (void)applicationSceneCompatibilityModeAnimatingChangeTo:(int64_t)a3
{
  -[SBDeviceApplicationSceneClassicWrapperView setNeedsLayout](self->_classicWrapperView, "setNeedsLayout", a3);
  -[SBDeviceApplicationSceneView setNeedsLayout](self, "setNeedsLayout");
  -[SBDeviceApplicationSceneView layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)noteApplicationClassicPhoneSceneOrientationPreferenceChangingForUserAction:(BOOL)a3
{
  id v3;

  if (a3)
    -[SBDeviceApplicationSceneClassicWrapperView setSuppressLayoutUpdatesForStartOfClassicPhoneAppRotation:](self->_classicWrapperView, "setSuppressLayoutUpdatesForStartOfClassicPhoneAppRotation:", 1);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("SBClassicPhoneSceneOrientationPreferenceChanged"), 0);

}

- (void)_windowManagementStyleDidChange:(id)a3
{
  -[SBSceneView _updateLiveViewContainment](self, "_updateLiveViewContainment", a3);
  -[SBDeviceApplicationSceneView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_configureSceneLiveSnapshotView:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (-[SBDeviceApplicationSceneView _useClassicWrapperView](self, "_useClassicWrapperView"))
  {
    -[SBDeviceApplicationSceneClassicWrapperView addContentView:](self->_classicWrapperView, "addContentView:", v4);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SBDeviceApplicationSceneView;
    -[SBSceneView _configureSceneLiveSnapshotView:](&v5, sel__configureSceneLiveSnapshotView_, v4);
  }

}

- (void)_invalidateSceneLiveHostView:(id)a3
{
  BSInvalidatable *snapshottingInfoAssertion;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBDeviceApplicationSceneView;
  -[SBSceneView _invalidateSceneLiveHostView:](&v5, sel__invalidateSceneLiveHostView_, a3);
  objc_storeWeak((id *)&self->_currentHostView, 0);
  -[BSInvalidatable invalidate](self->_snapshottingInfoAssertion, "invalidate");
  snapshottingInfoAssertion = self->_snapshottingInfoAssertion;
  self->_snapshottingInfoAssertion = 0;

}

- (void)_setOrientation:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBDeviceApplicationSceneView;
  -[SBSceneView _setOrientation:](&v5, sel__setOrientation_);
  -[SBDeviceApplicationSceneClassicWrapperView setOrientation:](self->_classicWrapperView, "setOrientation:", a3);
}

@end
