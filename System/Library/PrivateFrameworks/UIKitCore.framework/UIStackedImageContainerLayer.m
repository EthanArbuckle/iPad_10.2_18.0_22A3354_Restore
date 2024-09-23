@implementation UIStackedImageContainerLayer

void __48___UIStackedImageContainerLayer_layoutSublayers__block_invoke(void *a1, void *a2, double a3, double a4, double a5, double a6)
{
  double v11;
  double v12;
  id v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a1;
  v12 = *MEMORY[0x1E0C9D538];
  v11 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v13 = a2;
  v14 = a3 + a5 * 0.5;
  v15 = a4 + a6 * 0.5;
  objc_msgSend(v18, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_preferredLayoutDelegateForLayer:", v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setDelegate:", v17);
  if (_IsKindOfUIView((uint64_t)v16))
  {
    objc_msgSend(v16, "setBounds:", v12, v11, a5, a6);
    objc_msgSend(v16, "setCenter:", v14, v15);
  }
  else
  {
    objc_msgSend(v18, "setBounds:", v12, v11, a5, a6);
    objc_msgSend(v18, "setPosition:", v14, v15);
  }
  objc_msgSend(v18, "setDelegate:", v16);

}

void __53___UIStackedImageContainerLayer__updateOverlayLayout__block_invoke(void *a1, void *a2, double a3, double a4, double a5, double a6)
{
  double *v11;
  id v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  id v34;

  v34 = a1;
  v11 = (double *)MEMORY[0x1E0C9D538];
  v12 = a2;
  v13 = a3 + a5 * 0.5;
  v14 = a4 + a6 * 0.5;
  objc_msgSend(v34, "superlayer");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    objc_msgSend(v34, "superlayer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "size");
    v19 = v18;
    v21 = v20;
    v22 = *MEMORY[0x1E0C9D820];
    v23 = *(double *)(MEMORY[0x1E0C9D820] + 8);

    if (v19 != v22 || v21 != v23)
    {
      objc_msgSend(v34, "superlayer");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "size");
      v27 = v26;
      v29 = v28;

      v13 = v27 * 0.5;
      v14 = v29 * 0.5;
    }
  }
  v31 = *v11;
  v30 = v11[1];
  objc_msgSend(v34, "delegate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_preferredLayoutDelegateForLayer:", v34);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v34, "setDelegate:", v33);
  if (_IsKindOfUIView((uint64_t)v32))
  {
    objc_msgSend(v32, "setBounds:", v31, v30, a5, a6);
    objc_msgSend(v32, "setCenter:", v13, v14);
  }
  else
  {
    objc_msgSend(v34, "setBounds:", v31, v30, a5, a6);
    objc_msgSend(v34, "setPosition:", v13, v14);
  }
  objc_msgSend(v34, "setDelegate:", v32);

}

void __57___UIStackedImageContainerLayer__layerStackObservingKeys__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECD7B7D8;
  qword_1ECD7B7D8 = (uint64_t)&unk_1E1A95450;

}

uint64_t __63___UIStackedImageContainerLayer__updateRadiosityFromLayerStack__block_invoke(uint64_t result, uint64_t a2, double a3, double a4)
{
  uint64_t v6;
  uint64_t v7;
  double *v8;

  v6 = *(_QWORD *)(result + 32);
  if (*(double *)(result + 40) == *(double *)(v6 + 112))
  {
    v7 = result;
    objc_msgSend(*(id *)(v6 + 232), "setContents:", a2);
    v8 = (double *)(*(_QWORD *)(v7 + 32) + 72);
    *v8 = a3;
    v8[1] = a4;
    *(_BYTE *)(*(_QWORD *)(v7 + 32) + 88) = 1;
    return objc_msgSend(*(id *)(v7 + 32), "setNeedsLayout");
  }
  return result;
}

uint64_t __96___UIStackedImageContainerLayer__setControlState_animated_focusAnimationCoordinator_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __96___UIStackedImageContainerLayer__setControlState_animated_focusAnimationCoordinator_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_resetAnimatingToNormalState");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 33) = 0;
  return result;
}

uint64_t __96___UIStackedImageContainerLayer__setControlState_animated_focusAnimationCoordinator_completion___block_invoke_3(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 33) = 0;
  return result;
}

uint64_t __96___UIStackedImageContainerLayer__setControlState_animated_focusAnimationCoordinator_completion___block_invoke_4(uint64_t a1)
{
  _BYTE *v2;
  id WeakRetained;
  double v4;
  BOOL v5;
  double v6;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[154])
  {
    objc_msgSend(*(id *)(a1 + 32), "_setLayerStackInflated:seed:", 1, *(_QWORD *)(a1 + 48));
    v2 = *(_BYTE **)(a1 + 32);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v2, "_updateLayerForSelectionWithAnimationCoordinator:", WeakRetained);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 408), "alpha");
  v5 = v4 == 0.0;
  v6 = 1.0;
  if (!v5)
    v6 = 0.0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 408), "setAlpha:", v6);
}

void __61___UIStackedImageContainerLayer__updateSpecularLayerContents__block_invoke()
{
  id v0;
  id v1;

  +[UITraitCollection traitCollectionWithTraits:](UITraitCollection, "traitCollectionWithTraits:", &__block_literal_global_204_2);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  +[UIImage _kitImageNamed:withTrait:](UIImage, "_kitImageNamed:withTrait:", CFSTR("UILayeredImageSpecularHighlight"), v1);
  v0 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  qword_1ECD7B7E0 = (uint64_t)CGImageRetain((CGImageRef)objc_msgSend(v0, "CGImage"));

}

void __61___UIStackedImageContainerLayer__updateSpecularLayerContents__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setUserInterfaceIdiom:", 2);
  objc_msgSend(v2, "setDisplayScale:", 1.0);
  objc_msgSend(v2, "setDisplayGamut:", 0);

}

void __61___UIStackedImageContainerLayer__updateSpecularLayerContents__block_invoke_3()
{
  id v0;
  id v1;

  +[UITraitCollection traitCollectionWithTraits:](UITraitCollection, "traitCollectionWithTraits:", &__block_literal_global_209_0);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  +[UIImage _kitImageNamed:withTrait:](UIImage, "_kitImageNamed:withTrait:", CFSTR("UILayeredImageSpecularHighlight"), v1);
  v0 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  qword_1ECD7B7F0 = (uint64_t)CGImageRetain((CGImageRef)objc_msgSend(v0, "CGImage"));

}

void __61___UIStackedImageContainerLayer__updateSpecularLayerContents__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setUserInterfaceIdiom:", 2);
  objc_msgSend(v2, "setDisplayScale:", 2.0);
  objc_msgSend(v2, "setDisplayGamut:", 1);

}

void __47___UIStackedImageContainerLayer__setFlatImage___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD *v16;
  void *v17;
  id v18;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "setContents:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 216);
  if (*(_QWORD *)(a1 + 40) == *(_QWORD *)(v2 + 176))
  {
    objc_msgSend((id)v2, "_imageStackContentsGravity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setContentsGravity:", v4);

  }
  else
  {
    objc_msgSend(*(id *)(v2 + 216), "setContentsGravity:", *MEMORY[0x1E0CD2F98]);
  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 216);
  if (*(_QWORD *)(v5 + 176))
  {
    objc_msgSend(*(id *)(v5 + 216), "setBackgroundColor:", 0);
  }
  else
  {
    objc_msgSend(*(id *)(v5 + 416), "placeholderImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = 0;
    }
    else
    {
      if (qword_1ECD7B818 != -1)
        dispatch_once(&qword_1ECD7B818, &__block_literal_global_464_0);
      v8 = qword_1ECD7B810;
    }
    objc_msgSend(v6, "setBackgroundColor:", v8);

  }
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 240);
  objc_msgSend(*(id *)(v9 + 416), "placeholderImage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = 0;
  }
  else
  {
    if (qword_1ECD7B818 != -1)
      dispatch_once(&qword_1ECD7B818, &__block_literal_global_464_0);
    v12 = qword_1ECD7B810;
  }
  objc_msgSend(v10, "setBackgroundColor:", v12);

  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(void **)(v13 + 240);
  objc_msgSend(*(id *)(v13 + 416), "placeholderImage");
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v14, "setContents:", objc_msgSend(v15, "CGImage"));

  v16 = *(_QWORD **)(a1 + 32);
  v17 = (void *)v16[30];
  objc_msgSend(v16, "_imageStackContentsGravity");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setContentsGravity:", v18);

}

void __45___UIStackedImageContainerLayer__randomImage__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)qword_1ECD7B800;
  qword_1ECD7B800 = (uint64_t)v0;

}

void __52___UIStackedImageContainerLayer__setParallaxImages___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "setDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v11, "setAnchorPoint:", 0.5, 0.5);
  objc_msgSend(*(id *)(a1 + 32), "_positionAndSizeForLayerImage:", *(_QWORD *)(a1 + 40));
  v6 = v5;
  v8 = v7;
  objc_msgSend(v11, "setBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  objc_msgSend(v11, "setPosition:", v6, v8);
  objc_msgSend(v11, "setAllowsGroupOpacity:", 0);
  objc_msgSend(v11, "setAllowsEdgeAntialiasing:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_imageStackContentsGravity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setContentsGravity:", v9);

  objc_msgSend(v11, "setZPosition:", (double)*(uint64_t *)(a1 + 48) * 0.001);
  objc_msgSend(*(id *)(a1 + 32), "contentsScale");
  objc_msgSend(v11, "setContentsScale:");
  objc_msgSend(*(id *)(a1 + 32), "rasterizationScale");
  objc_msgSend(v11, "setRasterizationScale:");
  if (a3 && objc_msgSend(*(id *)(a1 + 40), "blendMode") == 1)
  {
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E58]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCompositingFilter:", v10);

  }
}

@end
