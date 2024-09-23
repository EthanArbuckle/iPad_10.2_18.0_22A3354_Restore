@implementation UIStatusBarAnimationFactory

uint64_t __43___UIStatusBarAnimationFactory_noAnimation__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_UIStatusBarAnimation animationWithBlock:](_UIStatusBarAnimation, "animationWithBlock:", &__block_literal_global_23_9);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_1218;
  _MergedGlobals_1218 = v0;

  return objc_msgSend((id)_MergedGlobals_1218, "setIdentifier:", CFSTR("noAnimation"));
}

uint64_t __43___UIStatusBarAnimationFactory_noAnimation__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 16))(a4, 1);
}

void __71___UIStatusBarAnimationFactory_fadeAnimationWithDuration_scale_offset___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  __int128 v13;
  double v14;
  uint64_t v15;
  __int128 v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _OWORD v25[3];

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
    v25[0] = *(_OWORD *)(a1 + 40);
    v25[1] = v13;
    v25[2] = *(_OWORD *)(a1 + 72);
    objc_msgSend(v8, "setTransform:", v25);
    objc_msgSend(v12, "setOptions:", 0);
  }
  v14 = *(double *)(a1 + 88);
  v15 = objc_msgSend(v12, "options");
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __71___UIStatusBarAnimationFactory_fadeAnimationWithDuration_scale_offset___block_invoke_2;
  v19[3] = &unk_1E16E2510;
  v20 = v8;
  v21 = v7;
  v16 = *(_OWORD *)(a1 + 56);
  v22 = *(_OWORD *)(a1 + 40);
  v23 = v16;
  v24 = *(_OWORD *)(a1 + 72);
  v17 = v7;
  v18 = v8;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", v15, v19, v10, v14, 0.0);

}

uint64_t __71___UIStatusBarAnimationFactory_fadeAnimationWithDuration_scale_offset___block_invoke_2(uint64_t a1)
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

BOOL __71___UIStatusBarAnimationFactory_fadeAnimationWithDuration_scale_offset___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _UIStatusBarFadeAnimationParameters *v7;
  uint64_t v8;
  double v9;
  void *v10;
  void *v11;

  v5 = a2;
  v6 = a3;
  v7 = objc_alloc_init(_UIStatusBarFadeAnimationParameters);
  objc_msgSend(v6, "absoluteFrame");
  -[_UIStatusBarFadeAnimationParameters setFrame:](v7, "setFrame:");
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
        -[_UIStatusBarFadeAnimationParameters setItemAppearing:](v7, "setItemAppearing:", 1);
LABEL_7:
        v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
        objc_msgSend(v6, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, v11);

        goto LABEL_8;
      }
    }
    -[_UIStatusBarFadeAnimationParameters setOptions:](v7, "setOptions:", 4);
    goto LABEL_7;
  }
LABEL_8:

  return v8 != 3;
}

void __65___UIStatusBarAnimationFactory_pulseAnimationWithDuration_scale___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6;
  double v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65___UIStatusBarAnimationFactory_pulseAnimationWithDuration_scale___block_invoke_2;
  v9[3] = &unk_1E16B1888;
  v10 = v6;
  v7 = *(double *)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  v8 = v6;
  +[UIView animateKeyframesWithDuration:delay:options:animations:completion:](UIView, "animateKeyframesWithDuration:delay:options:animations:completion:", 3072, v9, a4, v7, 0.0);

}

void __65___UIStatusBarAnimationFactory_pulseAnimationWithDuration_scale___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  _QWORD v3[4];
  id v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v2 = MEMORY[0x1E0C809B0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65___UIStatusBarAnimationFactory_pulseAnimationWithDuration_scale___block_invoke_3;
  v5[3] = &unk_1E16B1888;
  v6 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v5, 0.0, 0.333);
  v3[0] = v2;
  v3[1] = 3221225472;
  v3[2] = __65___UIStatusBarAnimationFactory_pulseAnimationWithDuration_scale___block_invoke_4;
  v3[3] = &unk_1E16B1B28;
  v4 = *(id *)(a1 + 32);
  +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v3, 0.333, 0.664);

}

uint64_t __65___UIStatusBarAnimationFactory_pulseAnimationWithDuration_scale___block_invoke_3(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;
  CGAffineTransform v5;

  CGAffineTransformMakeScale(&v5, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  v4 = v5;
  return objc_msgSend(v2, "setTransform:", &v4);
}

uint64_t __65___UIStatusBarAnimationFactory_pulseAnimationWithDuration_scale___block_invoke_4(uint64_t a1)
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
