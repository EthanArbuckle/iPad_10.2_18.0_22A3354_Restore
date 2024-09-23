@implementation UIWindowSceneActivationEffect

void __49___UIWindowSceneActivationEffect_advanceToScale___block_invoke(uint64_t a1)
{
  void *v2;
  CGAffineTransform v3;
  CGAffineTransform v4;

  CGAffineTransformMakeScale(&v4, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "platterView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4;
  objc_msgSend(v2, "setTransform:", &v3);

}

void __49___UIWindowSceneActivationEffect_advanceToScale___block_invoke_2(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  id v6;

  +[_UIWindowSceneActivationSettingsDomain rootSettings](_UIWindowSceneActivationSettingsDomain, "rootSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pinchPlatterMaxShadowIntensity");
  v4 = v3;
  objc_msgSend(*(id *)(a1 + 32), "platterView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShadowAlpha:", v4);

  objc_msgSend(*(id *)(a1 + 32), "platterView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundAlpha:", 1.0);

}

uint64_t __59___UIWindowSceneActivationEffect_endExpanded_withVelocity___block_invoke(uint64_t result)
{
  uint64_t v1;
  void *v2;

  if (!--*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    v1 = result;
    result = objc_msgSend(*(id *)(result + 32), "state");
    if (!result)
    {
      objc_msgSend(*(id *)(v1 + 32), "platterContainer");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "removeFromSuperview");

      return objc_msgSend(*(id *)(v1 + 32), "_performAllCompletionBlocks");
    }
  }
  return result;
}

uint64_t __59___UIWindowSceneActivationEffect_endExpanded_withVelocity___block_invoke_2(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setTransform:", v5);
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 48), *(double *)(a1 + 56));
}

uint64_t __59___UIWindowSceneActivationEffect_endExpanded_withVelocity___block_invoke_3(uint64_t a1)
{
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return objc_msgSend(*(id *)(a1 + 32), "setShadowAlpha:", 0.0);
}

@end
