@implementation TVProductTemplateZoomAnimator

void __52___TVProductTemplateZoomAnimator_animateTransition___block_invoke(id *a1)
{
  void *v2;
  id v3;
  __int128 v4;
  void *v5;
  id v6;
  _OWORD v7[3];

  objc_msgSend(a1[4], "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShouldRasterize:", 0);

  v3 = a1[5];
  v4 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v7[0] = *MEMORY[0x24BDBD8B8];
  v7[1] = v4;
  v7[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v3, "setTransform:", v7);
  objc_msgSend(a1[5], "setAlpha:", 1.0);
  objc_msgSend(a1[5], "removeFromSuperview");
  objc_msgSend(a1[5], "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShouldRasterize:", 0);

  v6 = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(v6, "completeTransition:", objc_msgSend(v6, "transitionWasCancelled") ^ 1);

}

uint64_t __52___TVProductTemplateZoomAnimator_animateTransition___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 1.0);
}

void __52___TVProductTemplateZoomAnimator_animateTransition___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  __int128 v10;
  void *v11;
  CGAffineTransform v12;
  _OWORD v13[3];

  objc_msgSend(MEMORY[0x24BDE57D8], "animationTimingFunction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDE57D8];
  LODWORD(v4) = 1051260355;
  LODWORD(v5) = 1040522936;
  LODWORD(v6) = 1041865114;
  LODWORD(v7) = 1.0;
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAnimationTimingFunction:", v8);

  v9 = *(void **)(a1 + 32);
  v10 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v13[0] = *MEMORY[0x24BDBD8B8];
  v13[1] = v10;
  v13[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v9, "setTransform:", v13);
  v11 = *(void **)(a1 + 40);
  CGAffineTransformMakeScale(&v12, 0.8, 0.8);
  objc_msgSend(v11, "setTransform:", &v12);
  objc_msgSend(MEMORY[0x24BDE57D8], "setAnimationTimingFunction:", v2);

}

uint64_t __52___TVProductTemplateZoomAnimator_animateTransition___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
