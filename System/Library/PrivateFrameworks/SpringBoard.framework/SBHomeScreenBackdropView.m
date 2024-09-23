@implementation SBHomeScreenBackdropView

uint64_t __53__SBHomeScreenBackdropView_cancelInProcessAnimations__block_invoke(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 488);
  objc_msgSend(v1, "value");
  return objc_msgSend(v1, "setValue:");
}

void __64__SBHomeScreenBackdropView__configureBackdropAnimatableProperty__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[61];
    if (v4)
    {
      v5 = v3;
      objc_msgSend(v4, "value");
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      objc_msgSend(v5[56], "setAlpha:");
      v3 = v5;
    }
  }

}

void __64__SBHomeScreenBackdropView__configureBackdropAnimatableProperty__block_invoke_3(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)WeakRetained[61];
    if (v4)
    {
      v7 = v3;
      objc_msgSend(v4, "presentationValue");
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      v5 = (void *)v7[56];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_setPresentationValue:forKey:", v6, CFSTR("opacity"));

      v3 = v7;
    }
  }

}

double __64__SBHomeScreenBackdropView__configureBackdropAnimatableProperty__block_invoke(double a1)
{
  double result;

  result = 1.0;
  if (a1 < 0.05)
    return a1 / 0.05 + 0.0;
  return result;
}

- (void)setBlurProgress:(double)a3 behaviorMode:(int64_t)a4 completion:(id)a5
{
  id v8;
  unint64_t materialViewAnimationCount;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[7];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v8 = a5;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  materialViewAnimationCount = self->_materialViewAnimationCount;
  v19 = 0;
  self->_materialViewAnimationCount = materialViewAnimationCount + 1;
  v10 = (void *)MEMORY[0x1E0CEABB0];
  -[SBHomeScreenBackdropViewBase backdropBlurSettings](self, "backdropBlurSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __68__SBHomeScreenBackdropView_setBlurProgress_behaviorMode_completion___block_invoke;
  v15[3] = &unk_1E8EB2EB8;
  *(double *)&v15[6] = a3;
  v15[4] = self;
  v15[5] = &v16;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__SBHomeScreenBackdropView_setBlurProgress_behaviorMode_completion___block_invoke_2;
  v13[3] = &unk_1E8EA4890;
  v13[4] = self;
  v12 = v8;
  v14 = v12;
  objc_msgSend(v10, "sb_animateWithSettings:mode:animations:completion:", v11, a4, v15, v13);

  if (*((_BYTE *)v17 + 24))
    -[SBHomeScreenBackdropView _updateBackdropViewIfNeededInvalidatingSnapshot:](self, "_updateBackdropViewIfNeededInvalidatingSnapshot:", 1);

  _Block_object_dispose(&v16, 8);
}

- (void)_updateBackdropViewIfNeededInvalidatingSnapshot:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  void *v8;
  void *materialView;
  uint64_t v10;
  _BOOL8 v11;
  _BOOL8 v12;
  void *v13;
  MTMaterialView *v14;
  UIImageView *v15;
  UIImageView *blurredContentSnapshotImageView;
  void *v17;
  void *v18;
  _QWORD v19[5];

  v3 = a3;
  v5 = -[SBHomeScreenBackdropViewBase requiresLiveBackdropView](self, "requiresLiveBackdropView");
  v6 = v5 || -[SBHomeScreenBackdropViewBase requiresBackdropView](self, "requiresBackdropView");
  v7 = -[SBHomeScreenBackdropView isOpaque](self, "isOpaque");
  if (v3)
    -[SBHomeScreenBackdropView _invalidateBackdropSnapshot](self, "_invalidateBackdropSnapshot");
  if (v5)
  {
    -[MTMaterialView setHidden:](self->_materialView, "setHidden:", 0);
    -[SBHomeScreenBackdropView _invalidateBackdropSnapshot](self, "_invalidateBackdropSnapshot");
    goto LABEL_19;
  }
  if (!v6)
  {
    -[SBHomeScreenBackdropView _invalidateBackdropSnapshot](self, "_invalidateBackdropSnapshot");
    materialView = self->_materialView;
    v10 = 1;
LABEL_18:
    objc_msgSend(materialView, "setHidden:", v10);
    goto LABEL_19;
  }
  if (!-[UIImageView isHidden](self->_blurredContentSnapshotImageView, "isHidden"))
    goto LABEL_19;
  if ((-[MTMaterialView isHidden](self->_materialView, "isHidden") & 1) == 0
    && !self->_materialViewAnimationCount
    && !self->_waitingForBackdropViewToRender)
  {
    blurredContentSnapshotImageView = self->_blurredContentSnapshotImageView;
    -[SBHomeScreenBackdropView homeScreenBlurredContentSnapshotImage](self, "homeScreenBlurredContentSnapshotImage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](blurredContentSnapshotImageView, "setImage:", v17);

    -[UIImageView layer](self->_blurredContentSnapshotImageView, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setContentsOpaque:", 1);

    -[MTMaterialView setHidden:](self->_materialView, "setHidden:", 1);
    materialView = self->_blurredContentSnapshotImageView;
    v10 = 0;
    goto LABEL_18;
  }
  if (-[MTMaterialView isHidden](self->_materialView, "isHidden"))
    self->_waitingForBackdropViewToRender = 1;
  -[MTMaterialView setHidden:](self->_materialView, "setHidden:", 0);
  -[UIImageView setHidden:](self->_blurredContentSnapshotImageView, "setHidden:", 1);
  if (self->_waitingForBackdropViewToRender)
  {
    v8 = (void *)*MEMORY[0x1E0CEB258];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __76__SBHomeScreenBackdropView__updateBackdropViewIfNeededInvalidatingSnapshot___block_invoke;
    v19[3] = &unk_1E8E9DED8;
    v19[4] = self;
    objc_msgSend(v8, "sb_performBlockAfterCATransactionSynchronizedCommit:", v19);
  }
LABEL_19:
  v11 = -[SBHomeScreenBackdropView isOpaque](self, "isOpaque");
  if (v7 != v11)
  {
    v12 = v11;
    -[SBHomeScreenBackdropViewBase delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "homeScreenBackdropView:opaquenessDidChange:", self, v12);

  }
  v14 = self->_materialView;
  -[SBHomeScreenBackdropView bounds](self, "bounds");
  -[MTMaterialView setFrame:](v14, "setFrame:");
  v15 = self->_blurredContentSnapshotImageView;
  -[SBHomeScreenBackdropView bounds](self, "bounds");
  -[UIImageView setFrame:](v15, "setFrame:");
}

- (BOOL)isOpaque
{
  return -[UIImageView isHidden](self->_blurredContentSnapshotImageView, "isHidden") ^ 1;
}

- (void)_invalidateBackdropSnapshot
{
  -[UIImageView setImage:](self->_blurredContentSnapshotImageView, "setImage:", 0);
  -[SBHomeScreenBackdropView _resetHomeScreenBlurredContentSnapshotImage](self, "_resetHomeScreenBlurredContentSnapshotImage");
  -[UIImageView setHidden:](self->_blurredContentSnapshotImageView, "setHidden:", 1);
}

- (void)_resetHomeScreenBlurredContentSnapshotImage
{
  UIImage *blurredContentSnapshotImage;

  blurredContentSnapshotImage = self->_blurredContentSnapshotImage;
  self->_blurredContentSnapshotImage = 0;

}

uint64_t __68__SBHomeScreenBackdropView_setBlurProgress_behaviorMode_completion___block_invoke(uint64_t a1)
{
  double v2;
  double v3;

  v2 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "weighting");
  if (v2 != v3)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setWeighting:", *(double *)(a1 + 48));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 488), "setValue:", *(double *)(a1 + 48));
}

- (void)setMaterialRecipeName:(id)a3
{
  NSString *v4;
  NSString *materialRecipeName;
  id v6;

  v6 = a3;
  if ((BSEqualStrings() & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    materialRecipeName = self->_materialRecipeName;
    self->_materialRecipeName = v4;

    -[MTMaterialView setRecipeName:](self->_materialView, "setRecipeName:", self->_materialRecipeName);
  }

}

double __73__SBHomeScreenBackdropView__setupBackdropViewWithRecipe_scaleAdjustment___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;
  double result;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "sbf_animatedBlurRadiusGraphicsQuality");

  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openedFolder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = v1 == 40;
  else
    v5 = 0;
  result = 0.3;
  if (!v5)
    return 0.5;
  return result;
}

uint64_t __76__SBHomeScreenBackdropView__updateBackdropViewIfNeededInvalidatingSnapshot___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 480) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_updateBackdropViewIfNeeded");
}

- (void)cancelInProcessAnimations
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __53__SBHomeScreenBackdropView_cancelInProcessAnimations__block_invoke;
  v2[3] = &unk_1E8E9DED8;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "_performWithoutRetargetingAnimations:", v2);
}

- (void)beginRequiringBackdropViewForReason:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBHomeScreenBackdropView;
  -[SBHomeScreenBackdropViewBase beginRequiringBackdropViewForReason:](&v4, sel_beginRequiringBackdropViewForReason_, a3);
  -[SBHomeScreenBackdropView _updateBackdropViewIfNeeded](self, "_updateBackdropViewIfNeeded");
}

- (void)beginRequiringLiveBackdropViewForReason:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBHomeScreenBackdropView;
  -[SBHomeScreenBackdropViewBase beginRequiringLiveBackdropViewForReason:](&v4, sel_beginRequiringLiveBackdropViewForReason_, a3);
  -[SBHomeScreenBackdropView _updateBackdropViewIfNeeded](self, "_updateBackdropViewIfNeeded");
}

uint64_t __68__SBHomeScreenBackdropView_setBlurProgress_behaviorMode_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 472);
  objc_msgSend(*(id *)(a1 + 32), "_updateBackdropViewIfNeeded");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3);
  return result;
}

- (void)_updateBackdropViewIfNeeded
{
  -[SBHomeScreenBackdropView _updateBackdropViewIfNeededInvalidatingSnapshot:](self, "_updateBackdropViewIfNeededInvalidatingSnapshot:", 0);
}

- (void)endRequiringLiveBackdropViewForReason:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBHomeScreenBackdropView;
  -[SBHomeScreenBackdropViewBase endRequiringLiveBackdropViewForReason:](&v4, sel_endRequiringLiveBackdropViewForReason_, a3);
  -[SBHomeScreenBackdropView _updateBackdropViewIfNeeded](self, "_updateBackdropViewIfNeeded");
}

- (void)endRequiringBackdropViewForReason:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBHomeScreenBackdropView;
  -[SBHomeScreenBackdropViewBase endRequiringBackdropViewForReason:](&v4, sel_endRequiringBackdropViewForReason_, a3);
  -[SBHomeScreenBackdropView _updateBackdropViewIfNeeded](self, "_updateBackdropViewIfNeeded");
}

- (SBHomeScreenBackdropView)initWithFrame:(CGRect)a3 materialRecipe:(int64_t)a4 scaleAdjustment:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  SBHomeScreenBackdropView *v12;
  SBHomeScreenBackdropView *v13;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SBHomeScreenBackdropView;
  v12 = -[SBHomeScreenBackdropViewBase initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  v13 = v12;
  if (v12)
    -[SBHomeScreenBackdropView _setupBackdropViewWithRecipe:scaleAdjustment:](v12, "_setupBackdropViewWithRecipe:scaleAdjustment:", a4, v11);

  return v13;
}

- (SBHomeScreenBackdropView)initWithFrame:(CGRect)a3
{
  return -[SBHomeScreenBackdropView initWithFrame:materialRecipe:scaleAdjustment:](self, "initWithFrame:materialRecipe:scaleAdjustment:", 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_setupBackdropViewWithRecipe:(int64_t)a3 scaleAdjustment:(id)a4
{
  id v6;
  NSString *materialRecipeName;
  MTMaterialView *v8;
  void *materialView;
  NSString *v10;
  NSString *v11;
  void *v12;
  NSString *v13;
  MTMaterialView *v14;
  MTMaterialView *v15;
  MTMaterialView *v16;
  id v17;
  UIImageView *v18;
  UIImageView *blurredContentSnapshotImageView;
  id v20;

  v6 = a4;
  if (!v6)
    v6 = &__block_literal_global_217;
  v20 = v6;
  materialRecipeName = self->_materialRecipeName;
  self->_materialRecipeName = 0;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:options:initialWeighting:scaleAdjustment:", a3, 2, v20, 0.0);
    v8 = (MTMaterialView *)objc_claimAutoreleasedReturnValue();
    materialView = self->_materialView;
    self->_materialView = v8;
  }
  else
  {
    SBHomeScreenBackdropMaterialRecipeName();
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    v11 = self->_materialRecipeName;
    self->_materialRecipeName = v10;

    v12 = (void *)MEMORY[0x1E0D47498];
    v13 = self->_materialRecipeName;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    materialView = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "materialViewWithRecipeNamed:inBundle:options:initialWeighting:scaleAdjustment:", v13, materialView, 2, v20, 0.0);
    v14 = (MTMaterialView *)objc_claimAutoreleasedReturnValue();
    v15 = self->_materialView;
    self->_materialView = v14;

  }
  -[MTMaterialView setShouldCrossfade:](self->_materialView, "setShouldCrossfade:", 0);
  v16 = self->_materialView;
  -[SBHomeScreenBackdropView bounds](self, "bounds");
  -[MTMaterialView setFrame:](v16, "setFrame:");
  -[MTMaterialView setAutoresizingMask:](self->_materialView, "setAutoresizingMask:", 18);
  -[MTMaterialView setHidden:](self->_materialView, "setHidden:", 1);
  -[SBHomeScreenBackdropView addSubview:](self, "addSubview:", self->_materialView);
  -[SBHomeScreenBackdropView _configureBackdropAnimatableProperty](self, "_configureBackdropAnimatableProperty");
  v17 = objc_alloc(MEMORY[0x1E0CEA658]);
  -[SBHomeScreenBackdropView bounds](self, "bounds");
  v18 = (UIImageView *)objc_msgSend(v17, "initWithFrame:");
  blurredContentSnapshotImageView = self->_blurredContentSnapshotImageView;
  self->_blurredContentSnapshotImageView = v18;

  -[UIImageView setHidden:](self->_blurredContentSnapshotImageView, "setHidden:", 1);
  -[SBHomeScreenBackdropView addSubview:](self, "addSubview:", self->_blurredContentSnapshotImageView);

}

- (void)_configureBackdropAnimatableProperty
{
  UIViewFloatAnimatableProperty *v3;
  UIViewFloatAnimatableProperty *backdropFloatAnimatableProperty;
  UIViewFloatAnimatableProperty *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if (!SBReduceMotion())
  {
    v3 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E0CEABC0]);
    backdropFloatAnimatableProperty = self->_backdropFloatAnimatableProperty;
    self->_backdropFloatAnimatableProperty = v3;

    v5 = self->_backdropFloatAnimatableProperty;
    -[MTMaterialView weighting](self->_materialView, "weighting");
    -[UIViewFloatAnimatableProperty setValue:](v5, "setValue:");
    objc_initWeak(&location, self);
    v6 = (void *)MEMORY[0x1E0CEABB0];
    v16[0] = self->_backdropFloatAnimatableProperty;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __64__SBHomeScreenBackdropView__configureBackdropAnimatableProperty__block_invoke_2;
    v12[3] = &unk_1E8EA1EE0;
    objc_copyWeak(&v14, &location);
    v13 = &__block_literal_global_13_0;
    v9[0] = v8;
    v9[1] = 3221225472;
    v9[2] = __64__SBHomeScreenBackdropView__configureBackdropAnimatableProperty__block_invoke_3;
    v9[3] = &unk_1E8EA1EE0;
    objc_copyWeak(&v11, &location);
    v10 = &__block_literal_global_13_0;
    objc_msgSend(v6, "_createTransformerWithInputAnimatableProperties:modelValueSetter:presentationValueSetter:", v7, v12, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

- (id)homeScreenBlurredContentSnapshotImage
{
  UIImage *blurredContentSnapshotImage;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  UIImage *v8;
  UIImage *v9;

  blurredContentSnapshotImage = self->_blurredContentSnapshotImage;
  if (!blurredContentSnapshotImage)
  {
    -[SBHomeScreenBackdropView window](self, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "interfaceOrientation");

    if ((unint64_t)(v5 - 2) >= 3)
      v6 = 0;
    else
      v6 = v5 - 1;
    -[SBHomeScreenBackdropView window](self, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    SBCreateSnapshotBelowWindowWithOptions(v7, 1, v6, 0, 1u, 0.25);
    v8 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v9 = self->_blurredContentSnapshotImage;
    self->_blurredContentSnapshotImage = v8;

    blurredContentSnapshotImage = self->_blurredContentSnapshotImage;
  }
  return blurredContentSnapshotImage;
}

- (NSString)materialRecipeName
{
  return self->_materialRecipeName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_materialRecipeName, 0);
  objc_storeStrong((id *)&self->_backdropFloatAnimatableProperty, 0);
  objc_storeStrong((id *)&self->_blurredContentSnapshotImageView, 0);
  objc_storeStrong((id *)&self->_blurredContentSnapshotImage, 0);
  objc_storeStrong((id *)&self->_materialView, 0);
}

@end
