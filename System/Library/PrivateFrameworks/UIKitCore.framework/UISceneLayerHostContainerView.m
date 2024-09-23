@implementation UISceneLayerHostContainerView

void __90___UISceneLayerHostContainerView__rebuildLayersForNormalPresentationWithReason_withFence___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", v12);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 48), "_createHostViewForLayer:", v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
      goto LABEL_11;
    goto LABEL_7;
  }
  v7 = v5;
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), CFSTR("_UISceneLayerHostContainerView.m"), 757, CFSTR("no existing view for layer: %@"), v12);

  }
  objc_msgSend(*(id *)(a1 + 32), "removeObjectAtIndex:", v7);
  objc_msgSend(*(id *)(a1 + 40), "removeObjectAtIndex:", v7);
  if (v6)
  {
LABEL_7:
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 440), "addObject:", v12);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 432), "addObject:", v6);
    objc_msgSend(*(id *)(a1 + 48), "_presentationContextForLayer:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_msgSend(v8, "isClippingDisabled") & 1) == 0 && *(_BYTE *)(a1 + 64) == 0;
    objc_msgSend(v6, "setClipsToBounds:", v9);
    objc_msgSend(v8, "transformer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTransformer:", v10);

    objc_msgSend(v8, "alpha");
    objc_msgSend(v6, "setAlpha:");
    objc_msgSend(v6, "setInheritsSecurity:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 464), "inheritsSecurity"));
    objc_msgSend(v6, "setResizesHostedContext:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 464), "resizesHostedContext"));
    objc_msgSend(v6, "setStopsHitTestTransformAccumulation:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 464), "stopsHitTestTransformAccumulation"));
    objc_msgSend(v6, "setStopsSecureSuperlayersValidation:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 464), "stopsSecureSuperlayersValidation"));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 472), "insertSubview:atIndex:", v6, a3);
    objc_msgSend(*(id *)(a1 + 48), "_adjustHostViewFrameAlignment:", v6);

  }
LABEL_11:

}

void __77___UISceneLayerHostContainerView__invalidateAndRemoveAsyncViewsFromHierarchy__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

void __77___UISceneLayerHostContainerView__invalidateAndRemoveAsyncViewsFromHierarchy__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77___UISceneLayerHostContainerView__invalidateAndRemoveAsyncViewsFromHierarchy__block_invoke_2;
  block[3] = &unk_1E16B14C0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __72___UISceneLayerHostContainerView_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 440), "array");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "appendArraySection:withName:skipIfEmpty:", v2, CFSTR("hostedLayers"), 1);

}

uint64_t __58___UISceneLayerHostContainerView__filteredLayersToPresent__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(a2, "level");
  v6 = v5;
  objc_msgSend(v4, "level");
  v8 = v7;

  if (v6 < v8)
    return -1;
  else
    return v6 != v8;
}

void __58___UISceneLayerHostContainerView__filteredLayersToPresent__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (objc_msgSend(a3, "isHidden"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy", 0);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v5, "matchesLayer:", v11))
            objc_msgSend(*(id *)(a1 + 32), "removeObject:", v11);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
}

void __63___UISceneLayerHostContainerView__presentationContextForLayer___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;

  v8 = a3;
  if (objc_msgSend(a2, "matchesLayer:", *(_QWORD *)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }

}

@end
