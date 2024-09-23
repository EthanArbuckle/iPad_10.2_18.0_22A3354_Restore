@implementation UIPointerArbiterCore

void __81___UIPointerArbiterCore_iOS_applyStyle_forRegion_effectSourceHandler_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16[2];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __81___UIPointerArbiterCore_iOS_applyStyle_forRegion_effectSourceHandler_completion___block_invoke_2;
  v8[3] = &unk_1E16C7E40;
  v9 = *(id *)(a1 + 32);
  v10 = WeakRetained;
  v11 = *(id *)(a1 + 40);
  v13 = *(id *)(a1 + 56);
  objc_copyWeak(v16, (id *)(a1 + 72));
  v5 = *(id *)(a1 + 48);
  v6 = *(void **)(a1 + 80);
  v12 = v5;
  v16[1] = v6;
  v14 = *(id *)(a1 + 64);
  v7 = v3;
  v15 = v7;
  objc_msgSend(WeakRetained, "_preparePointerPortalSourceCollectionWithCompletion:", v8);

  objc_destroyWeak(v16);
}

void __81___UIPointerArbiterCore_iOS_applyStyle_forRegion_effectSourceHandler_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28[2];

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "setPointerPortalSourceCollection:", v9);
    v14 = *(void **)(a1 + 40);
    v13 = *(_QWORD *)(a1 + 48);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __81___UIPointerArbiterCore_iOS_applyStyle_forRegion_effectSourceHandler_completion___block_invoke_3;
    v18[3] = &unk_1E16C7E18;
    v19 = *(id *)(a1 + 32);
    v25 = *(id *)(a1 + 64);
    v20 = v10;
    v21 = v11;
    v22 = v12;
    objc_copyWeak(v28, (id *)(a1 + 88));
    v23 = *(id *)(a1 + 56);
    v15 = *(id *)(a1 + 48);
    v16 = *(void **)(a1 + 96);
    v24 = v15;
    v28[1] = v16;
    v26 = *(id *)(a1 + 72);
    v27 = *(id *)(a1 + 80);
    objc_msgSend(v14, "_prepareContentMatchMoveSourceForPointerRegion:completion:", v13, v18);

    objc_destroyWeak(v28);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
    v17 = *(_QWORD *)(a1 + 72);
    if (v17)
      (*(void (**)(void))(v17 + 16))();
  }

}

void __81___UIPointerArbiterCore_iOS_applyStyle_forRegion_effectSourceHandler_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17[2];

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setContentMatchMoveSource:", v5);
  v7 = *(_QWORD *)(a1 + 80);
  if (v7)
    (*(void (**)(uint64_t, _QWORD, _QWORD, id, _QWORD))(v7 + 16))(v7, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v6, *(_QWORD *)(a1 + 56));
  v8 = (void *)UIApp;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __81___UIPointerArbiterCore_iOS_applyStyle_forRegion_effectSourceHandler_completion___block_invoke_4;
  v11[3] = &unk_1E16C7DF0;
  objc_copyWeak(v17, (id *)(a1 + 104));
  v12 = *(id *)(a1 + 32);
  v13 = *(id *)(a1 + 64);
  v9 = *(id *)(a1 + 72);
  v10 = *(void **)(a1 + 112);
  v14 = v9;
  v17[1] = v10;
  v15 = *(id *)(a1 + 88);
  v16 = *(id *)(a1 + 96);
  objc_msgSend(v8, "_performBlockAfterCATransactionCommits:", v11);

  objc_destroyWeak(v17);
}

void __81___UIPointerArbiterCore_iOS_applyStyle_forRegion_effectSourceHandler_completion___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(WeakRetained, "_setActiveHoverRegion:style:forPointerRegion:transactionID:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 56));
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

void __63___UIPointerArbiterCore_iOS_exitRegion_removeStyle_completion___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void (**v8)(void);

  v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (*(_BYTE *)(a1 + 64)
    && (objc_msgSend(WeakRetained, "activePointerRegion"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32)),
        v5,
        v6))
  {
    objc_msgSend(v4, "_setActiveHoverRegion:style:forPointerRegion:transactionID:completion:", 0, 0, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v4, "_clearMatchMoveSourceForRegion:immediately:", *(_QWORD *)(a1 + 32), 0);
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
      (*(void (**)(void))(v7 + 16))();
  }
  v8[2]();

}

void __99___UIPointerArbiterCore_iOS__setActiveHoverRegion_style_forPointerRegion_transactionID_completion___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  if (!*(_QWORD *)(a1 + 32))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if (objc_msgSend(WeakRetained, "transactionRevisionID") == *(_QWORD *)(a1 + 64))
    {
      objc_msgSend(WeakRetained, "pointerPortalView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeFromSuperview");

      objc_msgSend(WeakRetained, "overlayEffectPortalView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeFromSuperview");

      objc_msgSend(WeakRetained, "samplingBackdropView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setPaused:", 1);

      objc_msgSend(WeakRetained, "samplingBackdropView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeFromSuperview");

    }
    objc_msgSend(WeakRetained, "_clearMatchMoveSourceForRegion:immediately:", *(_QWORD *)(a1 + 40), 1);

  }
  v8 = *(_QWORD *)(a1 + 48);
  if (v8)
    (*(void (**)(void))(v8 + 16))();

}

void __72___UIPointerArbiterCore_iOS__clearMatchMoveSourceForRegion_immediately___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "activePointerRegion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", *(_QWORD *)(a1 + 40));

  if ((v3 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "pointerRegionToMatchMoveSourceMap");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "pointerRegionToMatchMoveSourceMap");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

      objc_msgSend(*(id *)(a1 + 32), "pointerClientController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "invalidateContentMatchMoveSources:completion:", v8, 0);

    }
  }
}

uint64_t __52___UIPointerArbiterCore_iOS_endScrollingWithRegion___block_invoke(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = _UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_5;
  if (!_UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_5)
  {
    v2 = __UILogCategoryGetNode("UIPointerArbiter", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&_UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_5);
  }
  v3 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_DEFAULT, "endScrollingWithRegion: %@ resetting style for that region, after delay", (uint8_t *)&v6, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 40), "exitRegion:removeStyle:completion:", *(_QWORD *)(a1 + 32), 1, 0);
}

void __52___UIPointerArbiterCore_iOS__performNextTransaction__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "setHasRunningTransaction:", 0);
    objc_msgSend(v2, "_performNextTransaction");
    WeakRetained = v2;
  }

}

id __87___UIPointerArbiterCore_iOS__prepareContentMatchMoveSourceForPointerRegion_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0CD27C8];
  v3 = a2;
  objc_msgSend(v2, "animation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSourceContextId:", objc_msgSend(v3, "sourceContextID"));
  v5 = objc_msgSend(v3, "sourceLayerRenderID");

  objc_msgSend(v4, "setSourceLayerRenderId:", v5);
  objc_msgSend(v4, "setKeyPath:", CFSTR("transform"));
  objc_msgSend(v4, "setAdditive:", 1);
  objc_msgSend(v4, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(v4, "setRemovedOnCompletion:", 0);
  objc_msgSend(v4, "setDuration:", INFINITY);
  return v4;
}

void __87___UIPointerArbiterCore_iOS__prepareContentMatchMoveSourceForPointerRegion_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _UIPointerContentEffectAnimationBuilder *v11;
  id v12;
  _UIPointerContentEffectAnimationBuilder *v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v3 = (id *)(a1 + 56);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(v4, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && WeakRetained)
  {
    objc_msgSend(WeakRetained, "pointerRegionToMatchMoveSourceMap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "setPointerRegionToMatchMoveSourceMap:", v8);

    }
    objc_msgSend(WeakRetained, "pointerRegionToMatchMoveSourceMap");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v6, *(_QWORD *)(a1 + 32));

    v10 = *(_QWORD *)(a1 + 40);
    v11 = [_UIPointerContentEffectAnimationBuilder alloc];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __87___UIPointerArbiterCore_iOS__prepareContentMatchMoveSourceForPointerRegion_completion___block_invoke_3;
    v14[3] = &unk_1E16C7F00;
    v16 = *(id *)(a1 + 48);
    v12 = v6;
    v15 = v12;
    v13 = -[_UIPointerContentEffectAnimationBuilder initWithCreationHandler:](v11, "initWithCreationHandler:", v14);
    (*(void (**)(uint64_t, id, _UIPointerContentEffectAnimationBuilder *))(v10 + 16))(v10, v12, v13);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __87___UIPointerArbiterCore_iOS__prepareContentMatchMoveSourceForPointerRegion_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __87___UIPointerArbiterCore_iOS__prepareContentMatchMoveSourceForPointerRegion_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __81___UIPointerArbiterCore_iOS__preparePointerPortalSourceCollectionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _UILumaTrackingBackdropView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "pointerPortalSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _UIFrozenPortalWithSource(v5, CFSTR("_UIPointerArbiter.pointer"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setPointerPortalView:", v6);

    objc_msgSend(v4, "overlayEffectPortalSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _UIFrozenPortalWithSource(v7, CFSTR("_UIPointerArbiter.specularOverlay"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setOverlayEffectPortalView:", v8);

    v9 = -[_UILumaTrackingBackdropView initWithTransitionBoundaries:delegate:frame:]([_UILumaTrackingBackdropView alloc], "initWithTransitionBoundaries:delegate:frame:", *(_QWORD *)(a1 + 32), 0.45, 0.55, 0.0, 0.0, 1.0, 1.0);
    -[_UILumaTrackingBackdropView setPaused:](v9, "setPaused:", 0);
    objc_msgSend(v4, "samplingMatchMoveSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD27C0], "animation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSourceContextId:", objc_msgSend(v10, "sourceContextID"));
    objc_msgSend(v11, "setSourceLayerRenderId:", objc_msgSend(v10, "sourceLayerRenderID"));
    objc_msgSend(v11, "setFillMode:", *MEMORY[0x1E0CD2B58]);
    objc_msgSend(v11, "setRemovedOnCompletion:", 0);
    objc_msgSend(v11, "setDuration:", INFINITY);
    objc_msgSend(v11, "setUsesNormalizedCoordinates:", 1);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", -0.5, -0.5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v12;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", 0.5, -0.5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v13;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", 0.5, 0.5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23[2] = v14;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", -0.5, 0.5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23[3] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSourcePoints:", v16);

    -[UIView layer](v9, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addAnimation:forKey:", v11, CFSTR("samplingBackdropMatchMove"));

    objc_msgSend(*(id *)(a1 + 32), "setSamplingBackdropView:", v9);
    objc_msgSend(*(id *)(a1 + 32), "setPointerPortalSourceCollection:", v4);
    v18 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "pointerPortalSourceCollection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "pointerPortalView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "overlayEffectPortalView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "samplingBackdropView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *, void *, void *))(v18 + 16))(v18, v19, v20, v21, v22);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __76___UIPointerArbiterCore_iOS__getPointerRegion_andStyle_atLocation_inWindow___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "convertPoint:fromWindow:", 0, *(double *)(a1 + 32), *(double *)(a1 + 40));
}

void __69___UIPointerArbiterCore_iOS_backgroundLumaView_didTransitionToLevel___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  void (**v3)(_QWORD);
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "lastSentHoverRegion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(WeakRetained, "activePointerStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_pointerIntensityForMaterialLuminance:", objc_msgSend(WeakRetained, "lastMaterialLuminance"));
  objc_msgSend(v5, "setPointerVisualIntensity:");

  objc_msgSend(v5, "setPreferredPointerMaterialLuminance:", objc_msgSend(WeakRetained, "lastMaterialLuminance"));
  objc_msgSend(WeakRetained, "setLastSentHoverRegion:", v5);
  objc_msgSend(WeakRetained, "pointerClientController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActiveHoverRegion:transitionCompletion:", v5, 0);

  v3[2](v3);
}

@end
