@implementation PBUIWallpaperStaticBackgroundView

- (PBUIWallpaperStaticBackgroundView)initWithWallpaperPresenter:(id)a3
{
  id v5;
  PBUIWallpaperStaticBackgroundView *v6;
  PBUIWallpaperStaticBackgroundView *v7;
  uint64_t v8;
  PBUIWallpaperEffectViewBase *homescreenWallpaperEffectView;
  uint64_t v10;
  PBUIWallpaperEffectViewBase *lockscreenWallpaperEffectView;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PBUIWallpaperStaticBackgroundView;
  v6 = -[PBUIWallpaperStaticBackgroundView init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_wallpaperPresenter, a3);
    v7->_variant = -1;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v8 = -[PBUIWallpaperStaticBackgroundView _newEffectViewForVariant:transitionState:](v7, "_newEffectViewForVariant:transitionState:", 1, &v13);
    homescreenWallpaperEffectView = v7->_homescreenWallpaperEffectView;
    v7->_homescreenWallpaperEffectView = (PBUIWallpaperEffectViewBase *)v8;

    v13 = 0;
    v14 = 0;
    v15 = 0;
    v10 = -[PBUIWallpaperStaticBackgroundView _newEffectViewForVariant:transitionState:](v7, "_newEffectViewForVariant:transitionState:", 0, &v13);
    lockscreenWallpaperEffectView = v7->_lockscreenWallpaperEffectView;
    v7->_lockscreenWallpaperEffectView = (PBUIWallpaperEffectViewBase *)v10;

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[BSInvalidatable invalidate](self->_wallpaperStyleAnimationAssertion, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PBUIWallpaperStaticBackgroundView;
  -[PBUIWallpaperStaticBackgroundView dealloc](&v3, sel_dealloc);
}

- (void)setVariant:(int64_t)a3
{
  -[PBUIWallpaperStaticBackgroundView setVariant:withOutAnimationFactory:inAnimationFactory:completion:](self, "setVariant:withOutAnimationFactory:inAnimationFactory:completion:", a3, 0, 0, 0);
}

- (void)setVariant:(int64_t)a3 withOutAnimationFactory:(id)a4 inAnimationFactory:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(_QWORD);
  void *v13;
  int64_t variant;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  void (**v36)(_QWORD);
  _QWORD *v37;
  _QWORD *v38;
  _QWORD *v39;
  _QWORD v40[3];
  char v41;
  _QWORD v42[3];
  char v43;
  _QWORD v44[3];
  char v45;

  v10 = a4;
  v11 = a5;
  v12 = (void (**)(_QWORD))a6;
  v13 = v12;
  variant = self->_variant;
  if (variant == a3)
  {
    if (v12)
      v12[2](v12);
  }
  else
  {
    self->_variant = a3;
    v44[0] = 0;
    v44[1] = v44;
    v44[2] = 0x2020000000;
    v45 = 0;
    v42[0] = 0;
    v42[1] = v42;
    v42[2] = 0x2020000000;
    v43 = 0;
    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x2020000000;
    v41 = 0;
    v15 = MEMORY[0x1E0C809B0];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __102__PBUIWallpaperStaticBackgroundView_setVariant_withOutAnimationFactory_inAnimationFactory_completion___block_invoke;
    v35[3] = &unk_1E6B970B0;
    v37 = v42;
    v38 = v44;
    v39 = v40;
    v36 = v12;
    v16 = (void *)MEMORY[0x1BCCA5978](v35);
    -[PBUIWallpaperStaticBackgroundView _effectViewForVariant:](self, "_effectViewForVariant:", variant);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBUIWallpaperStaticBackgroundView _effectViewForVariant:](self, "_effectViewForVariant:", a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v10;
    v20 = (void *)MEMORY[0x1E0D01908];
    v33[0] = v15;
    v33[1] = 3221225472;
    v33[2] = __102__PBUIWallpaperStaticBackgroundView_setVariant_withOutAnimationFactory_inAnimationFactory_completion___block_invoke_2;
    v33[3] = &unk_1E6B94728;
    v21 = v17;
    v34 = v21;
    v31[0] = v15;
    v31[1] = 3221225472;
    v31[2] = __102__PBUIWallpaperStaticBackgroundView_setVariant_withOutAnimationFactory_inAnimationFactory_completion___block_invoke_3;
    v31[3] = &unk_1E6B970D8;
    v22 = v16;
    v32 = v22;
    v23 = v20;
    v10 = v19;
    objc_msgSend(v23, "animateWithFactory:actions:completion:", v19, v33, v31);
    objc_msgSend(v18, "setAlpha:", 0.0);
    v24 = (void *)MEMORY[0x1E0D01908];
    v29[0] = v15;
    v29[1] = 3221225472;
    v29[2] = __102__PBUIWallpaperStaticBackgroundView_setVariant_withOutAnimationFactory_inAnimationFactory_completion___block_invoke_4;
    v29[3] = &unk_1E6B94728;
    v25 = v18;
    v30 = v25;
    v27[0] = v15;
    v27[1] = 3221225472;
    v27[2] = __102__PBUIWallpaperStaticBackgroundView_setVariant_withOutAnimationFactory_inAnimationFactory_completion___block_invoke_5;
    v27[3] = &unk_1E6B970D8;
    v26 = v22;
    v28 = v26;
    objc_msgSend(v24, "animateWithFactory:actions:completion:", v11, v29, v27);

    _Block_object_dispose(v40, 8);
    _Block_object_dispose(v42, 8);
    _Block_object_dispose(v44, 8);
  }

}

uint64_t __102__PBUIWallpaperStaticBackgroundView_setVariant_withOutAnimationFactory_inAnimationFactory_completion___block_invoke(uint64_t result, int a2)
{
  uint64_t v2;
  uint64_t v3;

  if (a2)
    v2 = *(_QWORD *)(result + 40);
  else
    v2 = *(_QWORD *)(result + 48);
  *(_BYTE *)(*(_QWORD *)(v2 + 8) + 24) = 1;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24))
    {
      v3 = *(_QWORD *)(*(_QWORD *)(result + 56) + 8);
      if (!*(_BYTE *)(v3 + 24))
      {
        *(_BYTE *)(v3 + 24) = 1;
        result = *(_QWORD *)(result + 32);
        if (result)
          return (*(uint64_t (**)(void))(result + 16))();
      }
    }
  }
  return result;
}

uint64_t __102__PBUIWallpaperStaticBackgroundView_setVariant_withOutAnimationFactory_inAnimationFactory_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __102__PBUIWallpaperStaticBackgroundView_setVariant_withOutAnimationFactory_inAnimationFactory_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __102__PBUIWallpaperStaticBackgroundView_setVariant_withOutAnimationFactory_inAnimationFactory_completion___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __102__PBUIWallpaperStaticBackgroundView_setVariant_withOutAnimationFactory_inAnimationFactory_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)setWallpaperStyleTransitionState:(id *)a3 forVariant:(int64_t)a4 withAnimationFactory:(id)a5
{
  id v8;
  BOOL v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  PBUIWallpaperStaticBackgroundView *v19;
  uint64_t *v20;
  _QWORD *v21;
  BOOL v22;
  _QWORD v23[5];
  id v24;
  _QWORD *v25;
  uint64_t *v26;
  int64_t v27;
  BOOL v28;
  _QWORD v29[4];
  id v30;
  PBUIWallpaperStaticBackgroundView *v31;
  _QWORD *v32;
  uint64_t *v33;
  int64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  _QWORD v41[4];
  $1D129F7B4C980C50E70029647222EF17 v42;

  v8 = a5;
  v9 = self->_variant == a4;
  -[PBUIWallpaperStaticBackgroundView _effectViewForVariant:](self, "_effectViewForVariant:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3810000000;
  v41[3] = &unk_1B724EB99;
  v42 = *a3;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__7;
  v39 = __Block_byref_object_dispose__7;
  v40 = 0;
  v11 = (void *)MEMORY[0x1E0D01908];
  v12 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __102__PBUIWallpaperStaticBackgroundView_setWallpaperStyleTransitionState_forVariant_withAnimationFactory___block_invoke;
  v29[3] = &unk_1E6B97100;
  v13 = v10;
  v32 = v41;
  v33 = &v35;
  v30 = v13;
  v31 = self;
  v34 = a4;
  objc_msgSend(v11, "animateWithFactory:actions:", 0, v29);
  -[PBUIWallpaperStaticBackgroundView _setEffectView:forVariant:](self, "_setEffectView:forVariant:", v36[5], a4);
  v14 = (void *)MEMORY[0x1E0D01908];
  v23[0] = v12;
  v23[1] = 3221225472;
  v23[2] = __102__PBUIWallpaperStaticBackgroundView_setWallpaperStyleTransitionState_forVariant_withAnimationFactory___block_invoke_2;
  v23[3] = &unk_1E6B97128;
  v23[4] = self;
  v28 = v9;
  v27 = a4;
  v25 = v41;
  v26 = &v35;
  v24 = v13;
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __102__PBUIWallpaperStaticBackgroundView_setWallpaperStyleTransitionState_forVariant_withAnimationFactory___block_invoke_3;
  v17[3] = &unk_1E6B97150;
  v15 = v24;
  v22 = v9;
  v18 = v15;
  v19 = self;
  v20 = &v35;
  v21 = v41;
  objc_msgSend(v14, "animateWithFactory:actions:completion:", v8, v23, v17);

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(v41, 8);

  return 1;
}

void __102__PBUIWallpaperStaticBackgroundView_setWallpaperStyleTransitionState_forVariant_withAnimationFactory___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  uint64_t v9;

  if (objc_msgSend(*(id *)(a1 + 32), "prepareToAnimateToTransitionState:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));
  }
  else
  {
    v2 = *(_QWORD *)(a1 + 64);
    v3 = *(void **)(a1 + 40);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(_OWORD *)(v4 + 32);
    v9 = *(_QWORD *)(v4 + 48);
    v5 = objc_msgSend(v3, "_newEffectViewForVariant:transitionState:", v2, &v8);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

uint64_t __102__PBUIWallpaperStaticBackgroundView_setWallpaperStyleTransitionState_forVariant_withAnimationFactory___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t result;
  __int128 v9;
  uint64_t v10;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(_OWORD *)(v3 + 32);
  v10 = *(_QWORD *)(v3 + 48);
  if ((objc_msgSend(v2, "_shouldSuspendMotionEffectsForState:", &v9) & 1) == 0 && *(_BYTE *)(a1 + 72))
    objc_msgSend(*(id *)(a1 + 32), "_endSuspendingMotionEffectsForStyleIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "_effectViewForVariant:", *(_QWORD *)(a1 + 64));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(_OWORD *)(v5 + 32);
  v10 = *(_QWORD *)(v5 + 48);
  objc_msgSend(v4, "setTransitionState:", &v9);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setAlpha:", 1.0);
  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(_OWORD *)(v7 + 32);
  v10 = *(_QWORD *)(v7 + 48);
  objc_msgSend(v6, "setTransitionState:", &v9);
  result = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (!result)
    return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
  if (result != *(_QWORD *)(a1 + 40))
  {
    result = objc_msgSend((id)result, "currentTransitionStateIsOpaque");
    if ((result & 1) == 0)
      return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
  }
  return result;
}

void *__102__PBUIWallpaperStaticBackgroundView_setWallpaperStyleTransitionState_forVariant_withAnimationFactory___block_invoke_3(uint64_t a1)
{
  void *result;
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;

  result = *(void **)(a1 + 32);
  if (result != *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    result = (void *)objc_msgSend(result, "removeFromSuperview");
  if (*(_BYTE *)(a1 + 64))
  {
    v3 = *(void **)(a1 + 40);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v5 = *(_OWORD *)(v4 + 32);
    v6 = *(_QWORD *)(v4 + 48);
    return (void *)objc_msgSend(v3, "_updateMotionEffectsForState:", &v5);
  }
  return result;
}

- (void)_beginSuspendingMotionEffectsForStyleIfNeeded
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  -[PBUIWallpaperStaticBackgroundView wallpaperStyleAnimationAssertion](self, "wallpaperStyleAnimationAssertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    PBUILogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1B71C0000, v4, OS_LOG_TYPE_INFO, "Disabling parallax because of requested wallpaper style", v6, 2u);
    }

    -[PBUIWallpaperPresenting suspendWallpaperAnimationForReason:](self->_wallpaperPresenter, "suspendWallpaperAnimationForReason:", CFSTR("PBUIWallpaperEffectViewIsDarkOrHiddenReason"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBUIWallpaperStaticBackgroundView setWallpaperStyleAnimationAssertion:](self, "setWallpaperStyleAnimationAssertion:", v5);

  }
}

- (void)_endSuspendingMotionEffectsForStyleIfNeeded
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  -[PBUIWallpaperStaticBackgroundView wallpaperStyleAnimationAssertion](self, "wallpaperStyleAnimationAssertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    PBUILogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1B71C0000, v4, OS_LOG_TYPE_INFO, "Enabling parallax because of requested wallpaper style", v6, 2u);
    }

    -[PBUIWallpaperStaticBackgroundView wallpaperStyleAnimationAssertion](self, "wallpaperStyleAnimationAssertion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidate");

    -[PBUIWallpaperStaticBackgroundView setWallpaperStyleAnimationAssertion:](self, "setWallpaperStyleAnimationAssertion:", 0);
  }
}

- (void)_updateMotionEffectsForState:(id *)a3
{
  $1D129F7B4C980C50E70029647222EF17 v4;

  v4 = *a3;
  if (-[PBUIWallpaperStaticBackgroundView _shouldSuspendMotionEffectsForState:](self, "_shouldSuspendMotionEffectsForState:", &v4))
  {
    -[PBUIWallpaperStaticBackgroundView _beginSuspendingMotionEffectsForStyleIfNeeded](self, "_beginSuspendingMotionEffectsForStyleIfNeeded");
  }
  else
  {
    -[PBUIWallpaperStaticBackgroundView _endSuspendingMotionEffectsForStyleIfNeeded](self, "_endSuspendingMotionEffectsForStyleIfNeeded");
  }
}

- (id)_effectViewForVariant:(int64_t)a3
{
  int *v3;

  if (a3 == 1)
  {
    v3 = &OBJC_IVAR___PBUIWallpaperStaticBackgroundView__homescreenWallpaperEffectView;
  }
  else
  {
    if (a3)
      return 0;
    v3 = &OBJC_IVAR___PBUIWallpaperStaticBackgroundView__lockscreenWallpaperEffectView;
  }
  return *(id *)((char *)&self->super.super.super.isa + *v3);
}

- (void)_setEffectView:(id)a3 forVariant:(int64_t)a4
{
  id v7;
  int *v8;
  id v9;

  v7 = a3;
  if (a4 == 1)
  {
    v9 = v7;
    v8 = &OBJC_IVAR___PBUIWallpaperStaticBackgroundView__homescreenWallpaperEffectView;
    goto LABEL_5;
  }
  if (!a4)
  {
    v9 = v7;
    v8 = &OBJC_IVAR___PBUIWallpaperStaticBackgroundView__lockscreenWallpaperEffectView;
LABEL_5:
    objc_storeStrong((id *)((char *)&self->super.super.super.isa + *v8), a3);
    v7 = v9;
  }

}

- (id)_newEffectViewForVariant:(int64_t)a3 transitionState:(id *)a4
{
  PBUIWallpaperEffectViewBase *v6;
  $1D129F7B4C980C50E70029647222EF17 v8;

  v6 = -[PBUIWallpaperEffectViewBase initWithWallpaperPresenter:variant:transformOptions:]([PBUIWallpaperEffectViewBase alloc], "initWithWallpaperPresenter:variant:transformOptions:", self->_wallpaperPresenter, a3, 0);
  -[PBUIWallpaperEffectViewBase setForcesOpaque:](v6, "setForcesOpaque:", 1);
  v8 = *a4;
  -[PBUIWallpaperEffectViewBase setTransitionState:](v6, "setTransitionState:", &v8);
  -[PBUIWallpaperStaticBackgroundView bounds](self, "bounds");
  -[PBUIWallpaperEffectViewBase setFrame:](v6, "setFrame:");
  -[PBUIWallpaperEffectViewBase setAutoresizingMask:](v6, "setAutoresizingMask:", 18);
  -[PBUIWallpaperEffectViewBase setAlpha:](v6, "setAlpha:", 0.0);
  -[PBUIWallpaperStaticBackgroundView addSubview:](self, "addSubview:", v6);
  return v6;
}

- (BOOL)_shouldSuspendMotionEffectsForStyle:(int64_t)a3
{
  BOOL result;

  result = _WallpaperStyleHasDarkBlur(a3);
  if ((unint64_t)(a3 - 1) < 2)
    return 1;
  return result;
}

- (BOOL)_shouldSuspendMotionEffectsForState:(id *)a3
{
  BOOL v5;
  BOOL v6;
  double var2;
  char v9;

  v5 = -[PBUIWallpaperStaticBackgroundView _shouldSuspendMotionEffectsForStyle:](self, "_shouldSuspendMotionEffectsForStyle:", a3->var0);
  v6 = -[PBUIWallpaperStaticBackgroundView _shouldSuspendMotionEffectsForStyle:](self, "_shouldSuspendMotionEffectsForStyle:", a3->var1);
  var2 = a3->var2;
  if (fabs(var2 + -1.0) < 2.22044605e-16 && v6)
    return 1;
  v9 = fabs(var2) < 2.22044605e-16 || v6;
  return v5 & v9;
}

- (int64_t)variant
{
  return self->_variant;
}

- (BSInvalidatable)wallpaperStyleAnimationAssertion
{
  return self->_wallpaperStyleAnimationAssertion;
}

- (void)setWallpaperStyleAnimationAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaperStyleAnimationAssertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperStyleAnimationAssertion, 0);
  objc_storeStrong((id *)&self->_homescreenWallpaperEffectView, 0);
  objc_storeStrong((id *)&self->_lockscreenWallpaperEffectView, 0);
  objc_storeStrong((id *)&self->_wallpaperPresenter, 0);
}

@end
