@implementation UIPointerContentEffect

void __48___UIPointerContentEffect_initWithStyle_region___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateFromState:toState:", objc_msgSend(WeakRetained, "state"), objc_msgSend(WeakRetained, "state"));

}

void __47___UIPointerContentEffect_setPressed_animated___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "platterView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPressed:", v1);

}

void __43___UIPointerContentEffect_setLiftProgress___block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  v1 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "liftProgressProperty");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:", v1);

}

void __52___UIPointerContentEffect__updateFromState_toState___block_invoke(uint64_t a1)
{
  __int128 v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  CGAffineTransform v45;
  CGAffineTransform v46;
  CGAffineTransform v47;
  CGAffineTransform v48;

  objc_msgSend(*(id *)(a1 + 32), "setAnimationCount:", objc_msgSend(*(id *)(a1 + 32), "animationCount") + 1);
  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v48.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v48.c = v2;
  *(_OWORD *)&v48.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(*(id *)(a1 + 40), "targetedPreview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 56) == 1)
  {
    if (*(_QWORD *)(a1 + 64) != 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "setSourceViewDidAllowEdgeAntialiasing:", objc_msgSend(v5, "allowsEdgeAntialiasing"));
      objc_msgSend(*(id *)(a1 + 40), "targetedPreview");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAllowsEdgeAntialiasing:", 1);

    }
    objc_msgSend(*(id *)(a1 + 40), "targetedPreview");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_willBeginBeingDisplayedInPointerContentEffect");

    objc_msgSend(*(id *)(a1 + 32), "liftProgressProperty");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "presentationValue");
    v13 = v12;
    objc_msgSend(*(id *)(a1 + 40), "contentScale");
    v15 = 1.0 - v13 + v13 * v14;

    if ((objc_msgSend(*(id *)(a1 + 40), "options") & 1) != 0)
    {
      CGAffineTransformMakeScale(&v48, v15, v15);
    }
    else
    {
      if ((objc_msgSend(*(id *)(a1 + 40), "pointerMergesWithContent") & 1) != 0)
      {
        v16 = *MEMORY[0x1E0C9D538];
        v17 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 40), "pointerShape");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "path");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          objc_msgSend(v25, "path");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "bounds");
          v30 = v29 + v28 * 0.5;
          v33 = v32 + v31 * 0.5;

        }
        else
        {
          objc_msgSend(v25, "rect");
          v30 = v35 + v34 * 0.5;
          v33 = v37 + v36 * 0.5;
        }

        objc_msgSend(*(id *)(a1 + 32), "initialEffectPlatterPosition");
        v16 = v30 - v38;
        v17 = v33 - v39;

      }
      CGAffineTransformMakeTranslation(&v48, v16, v17);
      v46 = v48;
      CGAffineTransformScale(&v47, &v46, v15, v15);
      v48 = v47;
      v46 = v47;
      CGAffineTransformTranslate(&v47, &v46, -v16, -v17);
      v48 = v47;
    }
    if ((objc_msgSend(*(id *)(a1 + 40), "options") & 0x2000) != 0)
      v24 = 1.0 / v15;
    else
      v24 = 1.0;
  }
  else
  {
    v18 = objc_msgSend(*(id *)(a1 + 32), "sourceViewDidAllowEdgeAntialiasing");
    objc_msgSend(*(id *)(a1 + 40), "targetedPreview");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setAllowsEdgeAntialiasing:", v18);

    objc_msgSend(*(id *)(a1 + 40), "targetedPreview");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_didStopBeingDisplayedInPointerContentEffect");

    v24 = 1.0;
  }
  v45 = v48;
  objc_msgSend(*(id *)(a1 + 48), "setTransform:", &v45);
  objc_msgSend(*(id *)(a1 + 48), "setTintViewScale:", v24);
  v40 = *(_QWORD *)(a1 + 56);
  if (*(_QWORD *)(a1 + 64) != v40)
  {
    v41 = *(void **)(a1 + 32);
    if (v40 == 1)
    {
      objc_msgSend(v41, "exitAnimator");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "performAllCompletions:", 0);

      objc_msgSend(*(id *)(a1 + 32), "entranceAnimator");
    }
    else
    {
      objc_msgSend(v41, "entranceAnimator");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "performAllCompletions:", 0);

      objc_msgSend(*(id *)(a1 + 32), "exitAnimator");
    }
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "performAllAnimations");

  }
}

void __52___UIPointerContentEffect__updateFromState_toState___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[5];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setAnimationCount:", objc_msgSend(*(id *)(a1 + 32), "animationCount") - 1);
  objc_msgSend(*(id *)(a1 + 32), "animationCount");
  if (!objc_msgSend(*(id *)(a1 + 32), "animationCount"))
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "state");
    v3 = *(void **)(a1 + 32);
    if (v2 == 1)
    {
      objc_msgSend(v3, "entranceAnimator");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "performAllCompletions:", 1);

    }
    else
    {
      objc_msgSend(v3, "exitAnimator");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "performAllCompletions:", 1);

      v5 = *(void **)(a1 + 32);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __52___UIPointerContentEffect__updateFromState_toState___block_invoke_3;
      v16[3] = &unk_1E16B1B28;
      v16[4] = v5;
      objc_msgSend(v5, "_modifyEffectContainerViewHierarchy:waitForCACommit:", v16, 0);
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      objc_msgSend(*(id *)(a1 + 32), "completions");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v13;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v13 != v9)
              objc_enumerationMutation(v6);
            (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++) + 16))();
          }
          while (v8 != v10);
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
        }
        while (v8);
      }

    }
  }
}

uint64_t __52___UIPointerContentEffect__updateFromState_toState___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_tearDownPlatterView");
}

uint64_t __52___UIPointerContentEffect__updateFromState_toState___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  double v3;
  double v4;

  objc_msgSend(*(id *)(a1 + 32), "setAnimationCount:", objc_msgSend(*(id *)(a1 + 32), "animationCount") + 1);
  v2 = *(_QWORD *)(a1 + 56);
  v3 = 0.0;
  if (v2 == 1 && (objc_msgSend(*(id *)(a1 + 40), "options") & 0x10) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "liftProgress");
    v3 = v4 + (1.0 - v4) * 0.0;
  }
  objc_msgSend(*(id *)(a1 + 48), "setShadowAlpha:", v3);
  return objc_msgSend(*(id *)(a1 + 48), "setTintDisabled:", v2 != 1);
}

uint64_t __52___UIPointerContentEffect__updateFromState_toState___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __70___UIPointerContentEffect__commitPointerStyleToArbiterWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id to;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_copyWeak(&to, (id *)(a1 + 40));
  v13 = objc_loadWeakRetained(&to);
  objc_msgSend(v13, "platterView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_loadWeakRetained(&to);
  objc_msgSend(v15, "setPointerPortal:", v9);

  v16 = objc_loadWeakRetained(&to);
  objc_msgSend(v16, "setLumaSamplingBackdrop:", v12);

  objc_msgSend(*(id *)(a1 + 32), "targetedPreview");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "target");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "container");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_loadWeakRetained(&to);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __70___UIPointerContentEffect__commitPointerStyleToArbiterWithCompletion___block_invoke_2;
  v26[3] = &unk_1E16DABF0;
  v21 = v19;
  v27 = v21;
  v22 = v12;
  v28 = v22;
  v23 = v9;
  v29 = v23;
  objc_copyWeak(&v30, &to);
  objc_msgSend(v20, "_modifyEffectContainerViewHierarchy:waitForCACommit:", v26, 0);

  if (v10)
  {
    objc_msgSend(v14, "setSpecularOptions:", ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "options") >> 10) & 4 | ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "options") >> 1) & 1);
    objc_msgSend(v14, "setSpecularHighlight:", v10);
  }
  if (v11)
  {
    objc_msgSend(v14, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "createAnimation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addAnimation:forKey:", v25, CFSTR("_UIPointerContentEffect.pointerMatchMove"));

  }
  objc_destroyWeak(&v30);

  objc_destroyWeak(&to);
}

void __70___UIPointerContentEffect__commitPointerStyleToArbiterWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(a1 + 48));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_ensureRelativeEffectViewOrderInContainer");

}

uint64_t __55___UIPointerContentEffect__createAndInstallPlatterView__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "insertSubview:aboveSubview:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __55___UIPointerContentEffect__createAndInstallPlatterView__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(a1 + 40));
}

void __55___UIPointerContentEffect__createAndInstallPlatterView__block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "target");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "container");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addSubview:", *(_QWORD *)(a1 + 40));

}

uint64_t __74___UIPointerContentEffect_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_ensureRelativeEffectViewOrderInContainer");
}

void __74___UIPointerContentEffect_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "platterView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_anchorPlatterView:toPreview:updateBounds:", v3, *(_QWORD *)(a1 + 40), 1);

}

uint64_t __79___UIPointerContentEffect__modifyEffectContainerViewHierarchy_waitForCACommit___block_invoke(uint64_t a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  return result;
}

uint64_t __76___UIPointerContentEffect__monitoredView_willMoveFromSuperview_toSuperview___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "end:", 0);
}

@end
