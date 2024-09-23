@implementation UIBannerContainerView

void __52___UIBannerContainerView__presentBanner_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  uint64_t v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    v6 = WeakRetained;
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);
    WeakRetained = v6;
  }

}

void __72___UIBannerContainerView__dismissBanner_alongsideAnimations_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id *WeakRetained;
  id *v5;
  void *v6;
  uint64_t v7;
  id *v8;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  v8 = WeakRetained;
  if ((_DWORD)a2)
  {
    if (WeakRetained)
      objc_msgSend(WeakRetained[52], "removeObject:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    v5 = v8;
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
  {
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, a2);
    v5 = v8;
  }

}

void __76___UIBannerContainerView__setBanner_visible_alongsideAnimations_completion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CGAffineTransform v13;
  CGAffineTransform v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v6++) + 16))();
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }

  if (*(_BYTE *)(a1 + 56))
  {
    v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v14.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v14.c = v7;
    *(_OWORD *)&v14.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  }
  else
  {
    CGAffineTransformMakeScale(&v14, 0.8, 0.8);
  }
  v8 = *(void **)(a1 + 40);
  v13 = v14;
  objc_msgSend(v8, "setTransform:", &v13);
  objc_msgSend(*(id *)(a1 + 48), "_bannerAnimationToVisible:hiddenValue:visibleValue:withKeyPath:", *(unsigned __int8 *)(a1 + 56), &unk_1E1A95DA0, &unk_1E1A95DB0, CFSTR("opacity"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAnimation:forKey:", v9, CFSTR("alpha"));

  objc_msgSend(*(id *)(a1 + 48), "_bannerAnimationToVisible:hiddenValue:visibleValue:withKeyPath:", *(unsigned __int8 *)(a1 + 56), &unk_1E1A95DC0, &unk_1E1A95DA0, CFSTR("filters.gaussianBlur.inputRadius"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAnimation:forKey:", v11, CFSTR("blur"));

  objc_msgSend(*(id *)(a1 + 48), "layoutIfNeeded");
}

uint64_t __76___UIBannerContainerView__setBanner_visible_alongsideAnimations_completion___block_invoke_140(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __76___UIBannerContainerView__setBanner_visible_alongsideAnimations_completion___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6) + 16))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded", (_QWORD)v8);
}

@end
