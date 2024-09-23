@implementation ISTransitionApplier

- (void)setValue:(id)a3 forKeyPath:(id)a4 ofLayer:(id)a5 withTransitionOptions:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  double v15;
  double v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  objc_msgSend(a6, "transitionDuration");
  v16 = v15;
  objc_msgSend(v13, "presentationLayer");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
    v19 = (void *)v17;
  else
    v19 = v13;
  v20 = v19;

  if (v16 <= 0.0)
  {
    objc_msgSend(v13, "removeAnimationForKey:", v12);
    objc_msgSend(v13, "setValue:forKeyPath:", v24, v12);
  }
  else
  {
    objc_msgSend(v20, "valueForKeyPath:", v12);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v21, "isEqual:", v24) & 1) != 0)
    {
      v22 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", v12);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setToValue:", v24);
      objc_msgSend(v22, "setDuration:", v16);
      objc_msgSend(v22, "setFromValue:", v21);
      if (v14)
      {
        v23 = (void *)objc_msgSend(v14, "copy");
        objc_msgSend(v22, "setValue:forKey:", v23, CFSTR("ISTransitionApplierAnimationCompletionHandlerKey"));

      }
    }

    objc_msgSend(v13, "setValue:forKeyPath:", v24, v12);
    if (v22)
    {
      objc_msgSend(v22, "setDelegate:", self);
      objc_msgSend(v13, "addAnimation:forKey:", v22, v12);

      goto LABEL_14;
    }
  }
  if (v14)
    (*((void (**)(id, uint64_t))v14 + 2))(v14, 1);
LABEL_14:

}

uint64_t __87__ISTransitionApplier__applyAlpha_blurRadius_toLayer_withTransitionOptions_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

void __96__ISTransitionApplier_applyOutputInfo_withTransitionOptions_toPhotoLayer_videoLayer_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v2;
  char v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v2 + 24))
    v3 = a2;
  else
    v3 = 0;
  *(_BYTE *)(v2 + 24) = v3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

+ (ISTransitionApplier)defaultApplier
{
  if (defaultApplier_onceToken != -1)
    dispatch_once(&defaultApplier_onceToken, &__block_literal_global_2879);
  return (ISTransitionApplier *)(id)defaultApplier_applier;
}

- (void)applyOutputInfo:(id)a3 withTransitionOptions:(id)a4 toPhotoLayer:(id)a5 videoLayer:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  _QWORD block[4];
  id v27;
  _QWORD *v28;
  _QWORD v29[4];
  NSObject *v30;
  _QWORD *v31;
  _QWORD v32[4];
  NSObject *v33;
  _QWORD *v34;
  _QWORD v35[3];
  char v36;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = dispatch_group_create();
  v18 = v17;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  v36 = 1;
  v19 = MEMORY[0x1E0C809B0];
  if (v14)
  {
    dispatch_group_enter(v17);
    objc_msgSend(v12, "photoBlurRadius");
    v21 = v20;
    v32[0] = v19;
    v32[1] = 3221225472;
    v32[2] = __96__ISTransitionApplier_applyOutputInfo_withTransitionOptions_toPhotoLayer_videoLayer_completion___block_invoke;
    v32[3] = &unk_1E9453DA8;
    v34 = v35;
    v33 = v18;
    -[ISTransitionApplier _applyAlpha:blurRadius:toLayer:withTransitionOptions:completion:](self, "_applyAlpha:blurRadius:toLayer:withTransitionOptions:completion:", v14, v13, v32, 1.0, v21);

  }
  if (v15)
  {
    dispatch_group_enter(v18);
    objc_msgSend(v12, "videoAlpha");
    v23 = v22;
    objc_msgSend(v12, "videoBlurRadius");
    v25 = v24;
    v29[0] = v19;
    v29[1] = 3221225472;
    v29[2] = __96__ISTransitionApplier_applyOutputInfo_withTransitionOptions_toPhotoLayer_videoLayer_completion___block_invoke_2;
    v29[3] = &unk_1E9453DA8;
    v31 = v35;
    v30 = v18;
    -[ISTransitionApplier _applyAlpha:blurRadius:toLayer:withTransitionOptions:completion:](self, "_applyAlpha:blurRadius:toLayer:withTransitionOptions:completion:", v15, v13, v29, v23, v25);

  }
  if (v16)
  {
    block[0] = v19;
    block[1] = 3221225472;
    block[2] = __96__ISTransitionApplier_applyOutputInfo_withTransitionOptions_toPhotoLayer_videoLayer_completion___block_invoke_3;
    block[3] = &unk_1E9453DD0;
    v27 = v16;
    v28 = v35;
    dispatch_group_notify(v18, MEMORY[0x1E0C80D38], block);

  }
  _Block_object_dispose(v35, 8);

}

- (void)applyScale:(double)a3 withTransitionOptions:(id)a4 toPhotoLayer:(id)a5 videoLayer:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  _QWORD block[4];
  id v21;
  _QWORD *v22;
  _QWORD v23[4];
  NSObject *v24;
  _QWORD *v25;
  _QWORD v26[4];
  NSObject *v27;
  _QWORD *v28;
  _QWORD v29[3];
  char v30;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  v16 = dispatch_group_create();
  dispatch_group_enter(v16);
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v17 = MEMORY[0x1E0C809B0];
  v30 = 1;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __91__ISTransitionApplier_applyScale_withTransitionOptions_toPhotoLayer_videoLayer_completion___block_invoke;
  v26[3] = &unk_1E9453DA8;
  v28 = v29;
  v18 = v16;
  v27 = v18;
  -[ISTransitionApplier _applyScale:toLayer:withTransitionOptions:completion:](self, "_applyScale:toLayer:withTransitionOptions:completion:", v13, v12, v26, a3);
  dispatch_group_enter(v18);
  v23[0] = v17;
  v23[1] = 3221225472;
  v23[2] = __91__ISTransitionApplier_applyScale_withTransitionOptions_toPhotoLayer_videoLayer_completion___block_invoke_2;
  v23[3] = &unk_1E9453DA8;
  v25 = v29;
  v19 = v18;
  v24 = v19;
  -[ISTransitionApplier _applyScale:toLayer:withTransitionOptions:completion:](self, "_applyScale:toLayer:withTransitionOptions:completion:", v14, v12, v23, a3);
  if (v15)
  {
    block[0] = v17;
    block[1] = 3221225472;
    block[2] = __91__ISTransitionApplier_applyScale_withTransitionOptions_toPhotoLayer_videoLayer_completion___block_invoke_3;
    block[3] = &unk_1E9453DD0;
    v21 = v15;
    v22 = v29;
    dispatch_group_notify(v19, MEMORY[0x1E0C80D38], block);

  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

  _Block_object_dispose(v29, 8);
}

- (void)_applyAlpha:(double)a3 blurRadius:(double)a4 toLayer:(id)a5 withTransitionOptions:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  _QWORD block[4];
  id v22;
  _QWORD *v23;
  _QWORD v24[4];
  NSObject *v25;
  _QWORD *v26;
  _QWORD v27[4];
  NSObject *v28;
  _QWORD *v29;
  _QWORD v30[3];
  char v31;

  v12 = a5;
  v13 = a6;
  v14 = a7;
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    v15 = dispatch_group_create();
    dispatch_group_enter(v15);
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x2020000000;
    v31 = 1;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __87__ISTransitionApplier__applyAlpha_blurRadius_toLayer_withTransitionOptions_completion___block_invoke;
    v27[3] = &unk_1E9453DA8;
    v29 = v30;
    v18 = v15;
    v28 = v18;
    -[ISTransitionApplier setValue:forKeyPath:ofLayer:withTransitionOptions:completion:](self, "setValue:forKeyPath:ofLayer:withTransitionOptions:completion:", v16, CFSTR("opacity"), v12, v13, v27);

    objc_msgSend(v12, "is_addBlurFilterIfNeeded");
    dispatch_group_enter(v18);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v17;
    v24[1] = 3221225472;
    v24[2] = __87__ISTransitionApplier__applyAlpha_blurRadius_toLayer_withTransitionOptions_completion___block_invoke_2;
    v24[3] = &unk_1E9453DA8;
    v26 = v30;
    v20 = v18;
    v25 = v20;
    -[ISTransitionApplier setValue:forKeyPath:ofLayer:withTransitionOptions:completion:](self, "setValue:forKeyPath:ofLayer:withTransitionOptions:completion:", v19, CFSTR("filters.LivePhotoBlur.inputRadius"), v12, v13, v24);

    if (v14)
    {
      block[0] = v17;
      block[1] = 3221225472;
      block[2] = __87__ISTransitionApplier__applyAlpha_blurRadius_toLayer_withTransitionOptions_completion___block_invoke_3;
      block[3] = &unk_1E9453DD0;
      v22 = v14;
      v23 = v30;
      dispatch_group_notify(v20, MEMORY[0x1E0C80D38], block);

    }
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

    _Block_object_dispose(v30, 8);
  }

}

- (void)_applyScale:(double)a3 toLayer:(id)a4 withTransitionOptions:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  id v21;
  _QWORD *v22;
  _QWORD v23[4];
  NSObject *v24;
  _QWORD *v25;
  _QWORD v26[3];
  char v27;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x2020000000;
    v27 = 1;
    v13 = dispatch_group_create();
    dispatch_group_enter(v13);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __76__ISTransitionApplier__applyScale_toLayer_withTransitionOptions_completion___block_invoke;
    v23[3] = &unk_1E9453DA8;
    v25 = v26;
    v16 = v13;
    v24 = v16;
    -[ISTransitionApplier setValue:forKeyPath:ofLayer:withTransitionOptions:completion:](self, "setValue:forKeyPath:ofLayer:withTransitionOptions:completion:", v14, CFSTR("transform.scale"), v10, v11, v23);

    if (v12)
    {
      v17 = v15;
      v18 = 3221225472;
      v19 = __76__ISTransitionApplier__applyScale_toLayer_withTransitionOptions_completion___block_invoke_2;
      v20 = &unk_1E9453DD0;
      v21 = v12;
      v22 = v26;
      dispatch_group_notify(v16, MEMORY[0x1E0C80D38], &v17);

    }
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit", v17, v18, v19, v20);

    _Block_object_dispose(v26, 8);
  }

}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  _BOOL8 v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v4 = a4;
  objc_msgSend(a3, "valueForKey:", CFSTR("ISTransitionApplierAnimationCompletionHandlerKey"));
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    v5[2](v5, v4);
    v5 = (void (**)(_QWORD, _QWORD))v6;
  }

}

void __76__ISTransitionApplier__applyScale_toLayer_withTransitionOptions_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v2;
  char v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v2 + 24))
    v3 = a2;
  else
    v3 = 0;
  *(_BYTE *)(v2 + 24) = v3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __76__ISTransitionApplier__applyScale_toLayer_withTransitionOptions_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

void __87__ISTransitionApplier__applyAlpha_blurRadius_toLayer_withTransitionOptions_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v2;
  char v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v2 + 24))
    v3 = a2;
  else
    v3 = 0;
  *(_BYTE *)(v2 + 24) = v3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __87__ISTransitionApplier__applyAlpha_blurRadius_toLayer_withTransitionOptions_completion___block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v2;
  char v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v2 + 24))
    v3 = a2;
  else
    v3 = 0;
  *(_BYTE *)(v2 + 24) = v3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __91__ISTransitionApplier_applyScale_withTransitionOptions_toPhotoLayer_videoLayer_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v2;
  char v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v2 + 24))
    v3 = a2;
  else
    v3 = 0;
  *(_BYTE *)(v2 + 24) = v3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __91__ISTransitionApplier_applyScale_withTransitionOptions_toPhotoLayer_videoLayer_completion___block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v2;
  char v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v2 + 24))
    v3 = a2;
  else
    v3 = 0;
  *(_BYTE *)(v2 + 24) = v3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __91__ISTransitionApplier_applyScale_withTransitionOptions_toPhotoLayer_videoLayer_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

void __96__ISTransitionApplier_applyOutputInfo_withTransitionOptions_toPhotoLayer_videoLayer_completion___block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v2;
  char v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v2 + 24))
    v3 = a2;
  else
    v3 = 0;
  *(_BYTE *)(v2 + 24) = v3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __96__ISTransitionApplier_applyOutputInfo_withTransitionOptions_toPhotoLayer_videoLayer_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

void __37__ISTransitionApplier_defaultApplier__block_invoke()
{
  ISTransitionApplier *v0;
  void *v1;

  v0 = objc_alloc_init(ISTransitionApplier);
  v1 = (void *)defaultApplier_applier;
  defaultApplier_applier = (uint64_t)v0;

}

@end
