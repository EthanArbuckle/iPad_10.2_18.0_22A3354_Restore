@implementation STUIStatusBarAnimationFactory

+ (id)noAnimation
{
  if (qword_1EDBEDFE8 != -1)
    dispatch_once(&qword_1EDBEDFE8, &__block_literal_global_16);
  return (id)_MergedGlobals_49;
}

uint64_t __44__STUIStatusBarAnimationFactory_noAnimation__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[STUIStatusBarAnimation animationWithBlock:](STUIStatusBarAnimation, "animationWithBlock:", &__block_literal_global_23_0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_49;
  _MergedGlobals_49 = v0;

  return objc_msgSend((id)_MergedGlobals_49, "setIdentifier:", CFSTR("noAnimation"));
}

uint64_t __44__STUIStatusBarAnimationFactory_noAnimation__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 16))(a4, 1);
}

+ (id)fadeAnimationWithDuration:(double)a3
{
  return (id)objc_msgSend(a1, "fadeAnimationWithDuration:scale:", a3, 1.0);
}

+ (id)fadeAnimationWithDuration:(double)a3 scale:(double)a4
{
  return (id)objc_msgSend(a1, "fadeAnimationWithDuration:scale:offset:", a3, a4, *MEMORY[0x1E0DC51A8], *(double *)(MEMORY[0x1E0DC51A8] + 8));
}

+ (id)fadeAnimationWithDuration:(double)a3 scale:(double)a4 offset:(UIOffset)a5
{
  double vertical;
  double horizontal;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v17[5];
  _QWORD v18[5];
  CGAffineTransform v19;
  double v20;
  CGAffineTransform v21;
  CGAffineTransform v22;
  CGAffineTransform v23;
  _QWORD v24[5];
  id v25;

  vertical = a5.vertical;
  horizontal = a5.horizontal;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__7;
  v24[4] = __Block_byref_object_dispose__7;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0C9BAA8];
  v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v23.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v23.c = v10;
  v11 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  *(_OWORD *)&v23.tx = v11;
  if (horizontal != *MEMORY[0x1E0DC51A8] || vertical != *(double *)(MEMORY[0x1E0DC51A8] + 8))
  {
    *(_OWORD *)&v22.a = v9;
    *(_OWORD *)&v22.c = v10;
    *(_OWORD *)&v22.tx = v11;
    CGAffineTransformTranslate(&v23, &v22, horizontal, vertical);
  }
  if (a4 != 1.0)
  {
    v21 = v23;
    CGAffineTransformScale(&v22, &v21, a4, a4);
    v23 = v22;
  }
  v13 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v19 = v23;
  v18[1] = 3221225472;
  v18[2] = __72__STUIStatusBarAnimationFactory_fadeAnimationWithDuration_scale_offset___block_invoke;
  v18[3] = &unk_1E8D649E0;
  v18[4] = v24;
  v20 = a3;
  +[STUIStatusBarAnimation animationWithBlock:](STUIStatusBarAnimation, "animationWithBlock:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __72__STUIStatusBarAnimationFactory_fadeAnimationWithDuration_scale_offset___block_invoke_3;
  v17[3] = &unk_1E8D631A8;
  v17[4] = v24;
  objc_msgSend(v14, "setPrepareBlock:", v17);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("fadeAnimation[%.2f]"), *(_QWORD *)&a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setIdentifier:", v15);

  _Block_object_dispose(v24, 8);
  return v14;
}

void __72__STUIStatusBarAnimationFactory_fadeAnimationWithDuration_scale_offset___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  __int128 v13;
  void *v14;
  double v15;
  uint64_t v16;
  __int128 v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _OWORD v26[3];

  v7 = a2;
  v8 = a3;
  v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v10 = a4;
  objc_msgSend(v8, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "type") == 2)
  {
    objc_msgSend(v12, "frame");
    objc_msgSend(v8, "setAbsoluteFrame:");
  }
  else if (objc_msgSend(v12, "itemAppearing"))
  {
    objc_msgSend(v8, "setAlpha:", 0.0);
    v13 = *(_OWORD *)(a1 + 56);
    v26[0] = *(_OWORD *)(a1 + 40);
    v26[1] = v13;
    v26[2] = *(_OWORD *)(a1 + 72);
    objc_msgSend(v8, "setTransform:", v26);
    objc_msgSend(v12, "setOptions:", 0);
  }
  v14 = (void *)MEMORY[0x1E0DC3F10];
  v15 = *(double *)(a1 + 88);
  v16 = objc_msgSend(v12, "options");
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __72__STUIStatusBarAnimationFactory_fadeAnimationWithDuration_scale_offset___block_invoke_2;
  v20[3] = &unk_1E8D649B8;
  v21 = v8;
  v22 = v7;
  v17 = *(_OWORD *)(a1 + 56);
  v23 = *(_OWORD *)(a1 + 40);
  v24 = v17;
  v25 = *(_OWORD *)(a1 + 72);
  v18 = v7;
  v19 = v8;
  objc_msgSend(v14, "animateWithDuration:delay:options:animations:completion:", v16, v20, v10, v15, 0.0);

}

uint64_t __72__STUIStatusBarAnimationFactory_fadeAnimationWithDuration_scale_offset___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  double v3;
  uint64_t v4;
  _OWORD *v5;
  __int128 v6;
  _OWORD v8[3];

  v2 = objc_msgSend(*(id *)(a1 + 40), "type");
  v3 = 0.0;
  if (v2 == 1)
    v3 = 1.0;
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", v3);
  v4 = objc_msgSend(*(id *)(a1 + 40), "type");
  v5 = (_OWORD *)(a1 + 48);
  if (v4 == 1)
    v5 = (_OWORD *)MEMORY[0x1E0C9BAA8];
  v6 = v5[1];
  v8[0] = *v5;
  v8[1] = v6;
  v8[2] = v5[2];
  return objc_msgSend(*(id *)(a1 + 32), "setTransform:", v8);
}

BOOL __72__STUIStatusBarAnimationFactory_fadeAnimationWithDuration_scale_offset___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  STUIStatusBarFadeAnimationParameters *v7;
  uint64_t v8;
  double v9;
  void *v10;
  void *v11;

  v5 = a2;
  v6 = a3;
  v7 = objc_alloc_init(STUIStatusBarFadeAnimationParameters);
  objc_msgSend(v6, "absoluteFrame");
  -[STUIStatusBarFadeAnimationParameters setFrame:](v7, "setFrame:");
  v8 = objc_msgSend(v5, "type");
  if (v8 != 3)
  {
    if (objc_msgSend(v5, "type") == 2)
    {
      objc_msgSend(v6, "setFloating:", 1);
    }
    else
    {
      objc_msgSend(v6, "alpha");
      if (v9 == 1.0)
      {
        -[STUIStatusBarFadeAnimationParameters setItemAppearing:](v7, "setItemAppearing:", 1);
LABEL_7:
        v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
        objc_msgSend(v6, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, v11);

        goto LABEL_8;
      }
    }
    -[STUIStatusBarFadeAnimationParameters setOptions:](v7, "setOptions:", 4);
    goto LABEL_7;
  }
LABEL_8:

  return v8 != 3;
}

+ (id)pulseAnimationWithDuration:(double)a3 scale:(double)a4
{
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__STUIStatusBarAnimationFactory_pulseAnimationWithDuration_scale___block_invoke;
  v5[3] = &__block_descriptor_48_e71_v32__0__STUIStatusBarAnimation_8__STUIStatusBarDisplayItem_16___v__B_24l;
  *(double *)&v5[4] = a3;
  *(double *)&v5[5] = a4;
  +[STUIStatusBarAnimation animationWithBlock:](STUIStatusBarAnimation, "animationWithBlock:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __66__STUIStatusBarAnimationFactory_pulseAnimationWithDuration_scale___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6;
  void *v7;
  double v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v6 = a3;
  v7 = (void *)MEMORY[0x1E0DC3F10];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__STUIStatusBarAnimationFactory_pulseAnimationWithDuration_scale___block_invoke_2;
  v10[3] = &unk_1E8D63248;
  v11 = v6;
  v8 = *(double *)(a1 + 32);
  v12 = *(_QWORD *)(a1 + 40);
  v9 = v6;
  objc_msgSend(v7, "animateKeyframesWithDuration:delay:options:animations:completion:", 3072, v10, a4, v8, 0.0);

}

void __66__STUIStatusBarAnimationFactory_pulseAnimationWithDuration_scale___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v2 = MEMORY[0x1E0C809B0];
  v3 = (void *)MEMORY[0x1E0DC3F10];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__STUIStatusBarAnimationFactory_pulseAnimationWithDuration_scale___block_invoke_3;
  v7[3] = &unk_1E8D63248;
  v8 = *(id *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v7, 0.0, 0.333);
  v4 = (void *)MEMORY[0x1E0DC3F10];
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __66__STUIStatusBarAnimationFactory_pulseAnimationWithDuration_scale___block_invoke_4;
  v5[3] = &unk_1E8D62A38;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v4, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v5, 0.333, 0.664);

}

uint64_t __66__STUIStatusBarAnimationFactory_pulseAnimationWithDuration_scale___block_invoke_3(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;
  CGAffineTransform v5;

  CGAffineTransformMakeScale(&v5, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  v4 = v5;
  return objc_msgSend(v2, "setTransform:", &v4);
}

uint64_t __66__STUIStatusBarAnimationFactory_pulseAnimationWithDuration_scale___block_invoke_4(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v4[0] = *MEMORY[0x1E0C9BAA8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return objc_msgSend(v1, "setTransform:", v4);
}

@end
