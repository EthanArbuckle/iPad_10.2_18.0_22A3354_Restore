@implementation SBPIPMorphAnimatorDataSource

- (SBPIPMorphAnimatorDataSource)initWithMorphAnimatorController:(id)a3 pipController:(id)a4 pegasusController:(id)a5 contentViewLayoutSettings:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SBPIPMorphAnimatorDataSource *v14;
  SBPIPMorphAnimatorDataSource *v15;
  uint64_t v16;
  NSMutableDictionary *morphAnimatorToPegasusInitialFrame;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)SBPIPMorphAnimatorDataSource;
  v14 = -[SBPIPMorphAnimatorDataSource init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_pipController, a4);
    objc_storeStrong((id *)&v15->_pegasusController, a5);
    objc_storeWeak((id *)&v15->_morphAnimatorController, v10);
    objc_storeStrong((id *)&v15->_contentViewLayoutSettings, a6);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = objc_claimAutoreleasedReturnValue();
    morphAnimatorToPegasusInitialFrame = v15->_morphAnimatorToPegasusInitialFrame;
    v15->_morphAnimatorToPegasusInitialFrame = (NSMutableDictionary *)v16;

  }
  return v15;
}

- (BOOL)_isChamoisWindowingUIEnabledForAnimator:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "switcherController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isChamoisWindowingUIEnabled");

  return v5;
}

- (CGRect)_appLayoutBoundingBoxForAnimator:(id)a3
{
  id WeakRetained;
  double v5;
  double v6;
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
  CGRect result;

  if (-[SBPIPMorphAnimatorDataSource _isChamoisWindowingUIEnabledForAnimator:](self, "_isChamoisWindowingUIEnabledForAnimator:", a3))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_morphAnimatorController);
    objc_msgSend(WeakRetained, "appLayoutBoundingBox");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

  }
  else
  {
    v6 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (BOOL)shouldProvideSourceClippingFrameInFixedCoordinateSpace:(id)a3
{
  return !-[SBPIPMorphAnimatorDataSource _isChamoisWindowingUIEnabledForAnimator:](self, "_isChamoisWindowingUIEnabledForAnimator:", a3);
}

- (CGRect)sourceContentFrameForAnimator:(id)a3
{
  id v4;
  id WeakRetained;
  int v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  uint64_t v12;
  PGPictureInPictureController *pegasusController;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  NSObject *v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  NSMutableDictionary *morphAnimatorToPegasusInitialFrame;
  void *v41;
  uint64_t v42;
  NSMutableDictionary *v43;
  void *v44;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  NSObject *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  NSMutableDictionary *v56;
  void *v57;
  void *v58;
  void *v59;
  CGFloat v60;
  CGFloat v61;
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  void *v67;
  uint64_t v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect result;

  v68 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_morphAnimatorController);
  v6 = objc_msgSend(WeakRetained, "targetProcessIdentifier");
  objc_msgSend(WeakRetained, "scenePersistenceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBPIPMorphAnimatorDataSource sourceContentContainerFrameForAnimator:](self, "sourceContentContainerFrameForAnimator:", v4);
  v9 = v8;
  v11 = v10;
  v12 = objc_msgSend(v4, "direction");
  pegasusController = self->_pegasusController;
  SBPIPApplicationForProcessIdentifier(pegasusController, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[PGPictureInPictureController preferredContentSizeForActivePictureInPictureWithApplication:sceneSessionPersistentIdentifier:](pegasusController, "preferredContentSizeForActivePictureInPictureWithApplication:sceneSessionPersistentIdentifier:", v14, v7);
    v16 = v15;
    v18 = v17;

    if (v16 == 0.0 || v18 == 0.0)
    {
      objc_msgSend(v4, "windowScene");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBPIPController anyContentViewPresentedOnWindowScene:](self->_pipController, "anyContentViewPresentedOnWindowScene:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "frame");

      SBLogPIP();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[SBPIPMorphAnimatorDataSource sourceContentFrameForAnimator:].cold.1((uint64_t)v7, v6, v21);

    }
    UIRectGetCenter();
    UIRectCenteredAboutPoint();
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;
  }
  else
  {
    -[PGPictureInPictureController initialFrameForInteractivePictureInPictureAnimationEnteringBackgroundForApplication:sceneSessionPersistentIdentifier:](pegasusController, "initialFrameForInteractivePictureInPictureAnimationEnteringBackgroundForApplication:sceneSessionPersistentIdentifier:", v14, v7);
    v31 = v30;
    v33 = v32;
    v35 = v34;
    v37 = v36;

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", v31, v33, v35, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuid");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v39)
    {
      morphAnimatorToPegasusInitialFrame = self->_morphAnimatorToPegasusInitialFrame;
      objc_msgSend(v4, "uuid");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](morphAnimatorToPegasusInitialFrame, "objectForKey:", v41);
      v42 = objc_claimAutoreleasedReturnValue();

      v38 = (void *)v42;
      if (!v42)
      {
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", v31, v33, v35, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = self->_morphAnimatorToPegasusInitialFrame;
        objc_msgSend(v4, "uuid");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](v43, "setObject:forKey:", v38, v44);

      }
    }
    objc_msgSend(v38, "rectValue", *(_QWORD *)&v33, *(_QWORD *)&v31);
    x = v69.origin.x;
    y = v69.origin.y;
    width = v69.size.width;
    height = v69.size.height;
    if (CGRectIsEmpty(v69))
    {
      v23 = *MEMORY[0x1E0C9D628];
      v25 = *(double *)(MEMORY[0x1E0C9D628] + 8);
      v27 = *(double *)(MEMORY[0x1E0C9D628] + 16);
      v29 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    }
    else
    {
      v70.origin.x = x;
      v70.origin.y = y;
      v70.size.width = width;
      v70.size.height = height;
      v71 = CGRectOffset(v70, v9, v11);
      v23 = v71.origin.x;
      v25 = v71.origin.y;
      v27 = v71.size.width;
      v29 = v71.size.height;
    }
    SBLogPIP();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "uuid");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v72.origin.y = v60;
      v72.origin.x = v61;
      v72.size.width = v35;
      v72.size.height = v37;
      NSStringFromCGRect(v72);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = self->_morphAnimatorToPegasusInitialFrame;
      objc_msgSend(v4, "uuid");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](v56, "objectForKey:", v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "rectValue");
      NSStringFromCGRect(v73);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v63 = v54;
      v64 = 2114;
      v65 = v55;
      v66 = 2114;
      v67 = v59;
      _os_log_debug_impl(&dword_1D0540000, v49, OS_LOG_TYPE_DEBUG, "-sourceContentFrameForAnimator animatorUUID[%{public}@] pegasusInitialFrame[%{public}@] cachedInitialFrame[%{public}@]", buf, 0x20u);

    }
  }

  v50 = v23;
  v51 = v25;
  v52 = v27;
  v53 = v29;
  result.size.height = v53;
  result.size.width = v52;
  result.origin.y = v51;
  result.origin.x = v50;
  return result;
}

- (CGRect)sourceContentContainerFrameForAnimator:(id)a3
{
  SBPIPMorphAnimatorController **p_morphAnimatorController;
  id v5;
  id WeakRetained;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v28;
  double v29;
  double v30;
  double v31;
  CGRect v32;
  CGRect v33;
  CGRect result;

  p_morphAnimatorController = &self->_morphAnimatorController;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_morphAnimatorController);
  -[SBPIPMorphAnimatorDataSource _appLayoutBoundingBoxForAnimator:](self, "_appLayoutBoundingBoxForAnimator:", v5);
  v8 = v7;
  v10 = v9;
  objc_msgSend(v5, "windowScene");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "switcherController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(WeakRetained, "layoutRole");
  objc_msgSend(WeakRetained, "appLayout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v5, "toOrientation");

  objc_msgSend(v12, "frameForItemWithRole:inMainAppLayout:interfaceOrientation:", v13, v14, v15);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v32.origin.x = v17;
  v32.origin.y = v19;
  v32.size.width = v21;
  v32.size.height = v23;
  v33 = CGRectOffset(v32, -v8, -v10);
  x = v33.origin.x;
  y = v33.origin.y;
  width = v33.size.width;
  height = v33.size.height;

  v28 = x;
  v29 = y;
  v30 = width;
  v31 = height;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (CGRect)sourceSubviewFrame:(CGRect)a3 inScreenSpaceForAnimator:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGRect v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SBPIPMorphAnimatorDataSource _appLayoutBoundingBoxForAnimator:](self, "_appLayoutBoundingBoxForAnimator:", a4);
  v9 = v8;
  v11 = v10;
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  return CGRectOffset(v12, v9, v11);
}

- (CGRect)targetFinalFrameForAnimator:(id)a3
{
  id v4;
  id WeakRetained;
  int v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  PGPictureInPictureController *pegasusController;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  SBPIPController *pipController;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  unint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  int v45;
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;
  CGSize v52;
  NSRect v53;
  CGRect result;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_morphAnimatorController);
  v6 = objc_msgSend(WeakRetained, "targetProcessIdentifier");
  objc_msgSend(WeakRetained, "scenePersistenceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(WeakRetained, "isGestureInitiated");
  if (objc_msgSend(v4, "direction"))
  {
    objc_msgSend(v4, "targetView");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject frame](v9, "frame");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
  }
  else
  {
    v11 = *MEMORY[0x1E0C9D628];
    v13 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v15 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v17 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    pegasusController = self->_pegasusController;
    SBPIPApplicationForProcessIdentifier(pegasusController, v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGPictureInPictureController preferredContentSizeForInteractivelyEnteringBackgroundForApplication:sceneSessionPersistentIdentifier:](pegasusController, "preferredContentSizeForInteractivelyEnteringBackgroundForApplication:sceneSessionPersistentIdentifier:", v19, v7);
    v21 = v20;
    v23 = v22;

    if (v21 > 0.0 && v23 > 0.0)
    {
      pipController = self->_pipController;
      objc_msgSend(v4, "windowScene");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBPIPContentViewLayoutSettings defaultContentViewSizeForAspectRatio:](self->_contentViewLayoutSettings, "defaultContentViewSizeForAspectRatio:", v21, v23);
      v27 = v26;
      v29 = v28;
      v30 = -[SBPIPContentViewLayoutSettings currentContentViewPosition](self->_contentViewLayoutSettings, "currentContentViewPosition");
      -[SBPIPContentViewLayoutSettings contentViewPadding](self->_contentViewLayoutSettings, "contentViewPadding");
      -[SBPIPController homeScreenInitialPIPFrameForWindowScene:withContentViewSize:position:padding:fromOrientation:toOrientation:shouldUpdate:gestureInitiated:](pipController, "homeScreenInitialPIPFrameForWindowScene:withContentViewSize:position:padding:fromOrientation:toOrientation:shouldUpdate:gestureInitiated:", v25, v30, objc_msgSend(v4, "fromOrientation"), objc_msgSend(v4, "toOrientation"), 1, v8, v27, v29, v31);
      v11 = v32;
      v13 = v33;
      v15 = v34;
      v17 = v35;

    }
    SBLogPIP();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v52.width = v21;
      v52.height = v23;
      NSStringFromCGSize(v52);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "fromOrientation");
      SBFStringForBSInterfaceOrientation();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "toOrientation");
      SBFStringForBSInterfaceOrientation();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 138543874;
      v46 = v36;
      v47 = 2114;
      v48 = v37;
      v49 = 2114;
      v50 = v38;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "-targetFinalFrameForAnimator: preferredContentSize[%{public}@] fromOrientation[%{public}@] toOrientation[%{public}@]", (uint8_t *)&v45, 0x20u);

    }
  }

  SBLogPIP();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    v53.origin.x = v11;
    v53.origin.y = v13;
    v53.size.width = v15;
    v53.size.height = v17;
    NSStringFromRect(v53);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 138543362;
    v46 = v40;
    _os_log_impl(&dword_1D0540000, v39, OS_LOG_TYPE_DEFAULT, "-targetFinalFrameForAnimator: %{public}@", (uint8_t *)&v45, 0xCu);

  }
  v41 = v11;
  v42 = v13;
  v43 = v15;
  v44 = v17;
  result.size.height = v44;
  result.size.width = v43;
  result.origin.y = v42;
  result.origin.x = v41;
  return result;
}

- (double)targetFinalCornerRadiusForAnimator:(id)a3
{
  double result;

  objc_msgSend(MEMORY[0x1E0D6C9C8], "defaultContentCornerRadius", a3);
  return result;
}

- (double)sourceCornerRadiusForAnimator:(id)a3
{
  double result;

  SBScreenDisplayCornerRadius();
  SBRectCornerRadiiForRadius();
  return result;
}

- (double)sourceBlackCurtainCornerRadiusForAnimator:(id)a3
{
  id v3;
  double v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  double v10;
  double v11;

  v3 = a3;
  SBScreenDisplayCornerRadius();
  v4 = 0.0;
  if ((BSFloatIsZero() & 1) == 0)
  {
    objc_msgSend(v3, "windowScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "switcherController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isChamoisWindowingUIEnabled");

    if (v7)
    {
      objc_msgSend(v5, "screen");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "traitCollection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "displayCornerRadius");
      v4 = v10;

    }
    else
    {
      +[SBMedusaDomain rootSettings](SBMedusaDomain, "rootSettings");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "cornerRadiusForInnerCorners");
      v4 = v11;
    }

  }
  return v4;
}

- (SBPIPController)pipController
{
  return self->_pipController;
}

- (void)setPipController:(id)a3
{
  objc_storeStrong((id *)&self->_pipController, a3);
}

- (PGPictureInPictureController)pegasusController
{
  return self->_pegasusController;
}

- (void)setPegasusController:(id)a3
{
  objc_storeStrong((id *)&self->_pegasusController, a3);
}

- (SBPIPMorphAnimatorController)morphAnimatorController
{
  return (SBPIPMorphAnimatorController *)objc_loadWeakRetained((id *)&self->_morphAnimatorController);
}

- (void)setMorphAnimatorController:(id)a3
{
  objc_storeWeak((id *)&self->_morphAnimatorController, a3);
}

- (SBPIPContentViewLayoutSettings)contentViewLayoutSettings
{
  return self->_contentViewLayoutSettings;
}

- (void)setContentViewLayoutSettings:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewLayoutSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewLayoutSettings, 0);
  objc_destroyWeak((id *)&self->_morphAnimatorController);
  objc_storeStrong((id *)&self->_pegasusController, 0);
  objc_storeStrong((id *)&self->_pipController, 0);
  objc_storeStrong((id *)&self->_morphAnimatorToPegasusInitialFrame, 0);
}

- (void)sourceContentFrameForAnimator:(os_log_t)log .cold.1(uint64_t a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109378;
  v3[1] = a2;
  v4 = 2114;
  v5 = a1;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "Unexpectedly found size zero for preferredContentSizeForActivePictureInPictureWithApplication %d sceneId: %{public}@", (uint8_t *)v3, 0x12u);
}

@end
