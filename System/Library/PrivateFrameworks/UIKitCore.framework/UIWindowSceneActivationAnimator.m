@implementation UIWindowSceneActivationAnimator

void __58___UIWindowSceneActivationAnimator_prewarmWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58___UIWindowSceneActivationAnimator_prewarmWithCompletion___block_invoke_2;
  block[3] = &unk_1E16D7338;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
}

void __58___UIWindowSceneActivationAnimator_prewarmWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  uint64_t v52;
  _BOOL8 v53;
  void *v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD v59[2];
  _QWORD v60[6];

  v60[4] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = objc_msgSend(WeakRetained, "state");
  objc_msgSend(*(id *)(a1 + 32), "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v3 = 2;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = *(id *)(a1 + 32);
      v6 = objc_msgSend(v5, "sceneContainerContextId");
      objc_msgSend(WeakRetained, "incomingScenePortalView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "portalLayer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setSourceContextId:", v6);

      v9 = objc_msgSend(v5, "sceneContainerRenderId");
      objc_msgSend(WeakRetained, "incomingScenePortalView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "portalLayer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setSourceLayerRenderId:", v9);

      objc_msgSend(WeakRetained, "morphContainerView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "window");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sceneFrame");
      objc_msgSend(v13, "_convertRectFromSceneReferenceSpace:");
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v21 = v20;

      objc_msgSend(v12, "superview");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v12;
      objc_msgSend(v12, "window");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "convertRect:fromView:", v23, v15, v17, v19, v21);
      v25 = v24;
      v27 = v26;
      v29 = v28;
      v31 = v30;

      objc_msgSend(v12, "setFrame:", v25, v27, v29, v31);
      v32 = (void *)objc_opt_new();
      objc_msgSend(v32, "setSourceContextId:", objc_msgSend(v5, "sceneContainerContextId"));
      objc_msgSend(v32, "setSourceLayerRenderId:", objc_msgSend(v5, "sceneContainerRenderId"));
      objc_msgSend(v32, "setDuration:", INFINITY);
      v3 = 1;
      objc_msgSend(v32, "setUsesNormalizedCoordinates:", 1);
      v59[0] = 0;
      v59[1] = 0;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v59, "{CGPoint=dd}");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v60[0] = v33;
      v58 = xmmword_1866721B0;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v58, "{CGPoint=dd}");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v60[1] = v34;
      __asm { FMOV            V0.2D, #1.0 }
      v57 = _Q0;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v57, "{CGPoint=dd}");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v60[2] = v40;
      v56 = xmmword_18666F250;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v56, "{CGPoint=dd}");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v60[3] = v41;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 4);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setSourcePoints:", v42);

      objc_msgSend(WeakRetained, "setIncomingSceneAnchorAnimation:", v32);
      objc_msgSend(v5, "sceneFrame");
      objc_msgSend(WeakRetained, "setExpectedFrame:");
      objc_msgSend(v5, "sceneCornerRadii");
      v44 = v43;
      v46 = v45;
      v48 = v47;
      v50 = v49;

      objc_msgSend(WeakRetained, "setExpectedCornerRadii:", v44, v46, v48, v50);
      objc_msgSend(WeakRetained, "incomingScenePortalView");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "setFrame:", 0.0, 0.0, v29, v31);

    }
  }
  objc_msgSend(WeakRetained, "setState:", v3);
  v52 = *(_QWORD *)(a1 + 40);
  if (v52)
  {
    v53 = objc_msgSend(WeakRetained, "state") == 1;
    objc_msgSend(WeakRetained, "morphContainerView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _BOOL8, void *))(v52 + 16))(v52, v53, v54);

  }
}

uint64_t __70___UIWindowSceneActivationAnimator_animateWithSourcePreview_velocity___block_invoke(uint64_t a1)
{
  __int128 v2;
  _OWORD v4[3];

  objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "setBounds:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  v2 = *(_OWORD *)(a1 + 112);
  v4[0] = *(_OWORD *)(a1 + 96);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 128);
  objc_msgSend(*(id *)(a1 + 32), "setTransform:", v4);
  objc_msgSend(*(id *)(a1 + 32), "setExpanded:", 1);
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  return objc_msgSend(*(id *)(a1 + 40), "_performAllAlongsideAnimations:", *(_QWORD *)(a1 + 32));
}

uint64_t __70___UIWindowSceneActivationAnimator_animateWithSourcePreview_velocity___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendCompletionActionCallingAlongsideCompletions:", 1);
}

void __50___UIWindowSceneActivationAnimator_setDeparented___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  double v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[8])
    v3 = 1.0;
  else
    v3 = 0.0;
  objc_msgSend(v2, "deparentingPortalAlphaSourceView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", v3);

  objc_msgSend(*(id *)(a1 + 32), "deparentingWrapper");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKeyPath:", v6, CFSTR("filters.opacityPair.inputAmount"));

}

void __85___UIWindowSceneActivationAnimator__sendCompletionActionCallingAlongsideCompletions___block_invoke_2(uint64_t a1)
{
  _QWORD v1[5];
  char v2;

  v1[0] = MEMORY[0x1E0C809B0];
  v1[1] = 3221225472;
  v1[2] = __85___UIWindowSceneActivationAnimator__sendCompletionActionCallingAlongsideCompletions___block_invoke_3;
  v1[3] = &unk_1E16B1B78;
  v1[4] = *(_QWORD *)(a1 + 32);
  v2 = *(_BYTE *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], v1);
}

uint64_t __85___UIWindowSceneActivationAnimator__sendCompletionActionCallingAlongsideCompletions___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_cleanUp");
  if (*(_BYTE *)(a1 + 40))
    return objc_msgSend(*(id *)(a1 + 32), "_performAllAlongsideCompletions");
  return result;
}

@end
