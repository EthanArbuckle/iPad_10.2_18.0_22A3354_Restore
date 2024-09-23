@implementation UISizeTrackingView

void __70___UISizeTrackingView__updateTextEffectsGeometries_textEffectsWindow___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "convertRect:fromView:", 0, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 56));
  v2 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v2[4] = v3;
  v2[5] = v4;
  v2[6] = v5;
  v2[7] = v6;

}

void __52___UISizeTrackingView__geometryChanged_forAncestor___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  id WeakRetained;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t RenderId;
  void *v13;
  id v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;

  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "_window");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "windowScene");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "_enhancedWindowingEnabled");

    if (v4)
    {
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 416));
      objc_msgSend(WeakRetained, "_existingPresentationControllerImmediate:effective:", 0, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "_viewForRemoteTextEffectsWindowMatchAnimation");
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }
    v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 504));

    if (v7 != v8)
    {
      objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 504), v7);
      if (v7)
      {
        objc_msgSend(v7, "layer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "context");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "contextId");

        RenderId = CALayerGetRenderId();
      }
      else
      {
        RenderId = 0;
        v11 = 0;
      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "__setRemoteTextEffectsWindowMatchesLayerWithContextId:renderId:", v11, RenderId);
    }
    if (*(_BYTE *)(a1 + 49))
    {
      objc_msgSend(*(id *)(a1 + 32), "remoteViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_updateUnderflowProperties");

    }
    if (*(_BYTE *)(a1 + 50))
    {
      v14 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 416));
      objc_msgSend(v14, "_fenceForSynchronizedDrawing");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = *(_QWORD **)(a1 + 32);
      v17 = (void *)v16[53];
      objc_msgSend(v16, "_sizeForRemoteViewService");
      v19 = v18;
      v21 = v20;
      objc_msgSend(*(id *)(a1 + 32), "_boundingPathForRemoteViewService");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "__setContentSize:boundingPath:withFence:", v22, v15, v19, v21);

      objc_msgSend(v15, "invalidate");
      objc_msgSend(*(id *)(a1 + 32), "_clearNeedsRemoteViewServiceBoundingPathUpdate");

    }
    if (*(_BYTE *)(a1 + 51))
    {
      v23 = *(void **)(a1 + 32);
      objc_msgSend(v23, "frame");
      objc_msgSend(v23, "_updateTextEffectsGeometries:");
    }

  }
  if (*(_BYTE *)(a1 + 52))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v25 = *(void **)(v24 + 40);
      *(_QWORD *)(v24 + 40) = 0;

    }
    objc_msgSend(*(id *)(a1 + 32), "_updateSceneGeometries:forOrientation:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 0);
  }
}

uint64_t __67___UISizeTrackingView__setNeedsRemoteViewServiceBoundingPathUpdate__block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  void *v4;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 512) &= ~8u;
  result = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(result + 512) & 4) != 0)
  {
    v3 = *(void **)(result + 424);
    objc_msgSend((id)result, "_boundingPathForRemoteViewService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "__setBoundingPath:", v4);

    return objc_msgSend(*(id *)(a1 + 32), "_clearNeedsRemoteViewServiceBoundingPathUpdate");
  }
  return result;
}

@end
