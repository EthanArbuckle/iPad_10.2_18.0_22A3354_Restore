@implementation UIModernPopoverAnimationController

uint64_t __57___UIModernPopoverAnimationController_animateTransition___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setChromeHidden:", 1);
}

uint64_t __57___UIModernPopoverAnimationController_animateTransition___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", objc_msgSend(*(id *)(a1 + 32), "transitionWasCancelled") ^ 1);
}

uint64_t __57___UIModernPopoverAnimationController_animateTransition___block_invoke_3(uint64_t a1)
{
  __int128 v2;
  _OWORD v4[3];

  objc_msgSend(*(id *)(a1 + 32), "setBounds:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  v2 = *(_OWORD *)(a1 + 96);
  v4[0] = *(_OWORD *)(a1 + 80);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 112);
  objc_msgSend(*(id *)(a1 + 32), "setTransform:", v4);
  objc_msgSend(*(id *)(a1 + 32), "setChromeHidden:", objc_msgSend(*(id *)(a1 + 40), "isPresenting") ^ 1);
  objc_msgSend(*(id *)(a1 + 32), "setAnimationOvershootHeight:", 0.0);
  objc_msgSend(*(id *)(a1 + 32), "setContentSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __57___UIModernPopoverAnimationController_animateTransition___block_invoke_4(id *a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  objc_msgSend(a1[4], "_frameIgnoringLayerTransform");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(a1[4], "setAnchorPoint:", 0.5, 0.5);
  if (objc_msgSend(a1[5], "isPresenting"))
  {
    objc_msgSend(a1[4], "_setFrameIgnoringLayerTransform:", v3, v5, v7, v9);
    objc_msgSend(a1[4], "layoutIfNeeded");
  }
  return objc_msgSend(a1[6], "completeTransition:", objc_msgSend(a1[6], "transitionWasCancelled") ^ 1);
}

@end
