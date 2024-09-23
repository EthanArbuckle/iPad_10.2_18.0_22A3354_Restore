@implementation UIView

uint64_t __88__UIView_PKUIAnimationUtilities__pkui_setFrame_withAdditiveAnimationFactory_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __89__UIView_PKUIAnimationUtilities__pkui_setBounds_withAdditiveAnimationFactory_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __91__UIView_PKUIAnimationUtilities__pkui_setPosition_withAdditiveAnimationFactory_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __92__UIView_PKUIAnimationUtilities__pkui_setTransform_withAdditiveAnimationFactory_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __80__UIView_PKUIAnimationUtilities__pkui_setAlpha_withAnimationFactory_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __90__UIView_PKUIAnimationUtilities__pkui_setBackgroundColor_withAnimationFactory_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __95__UIView_PKUIAnimationUtilities__pkui_setCornerRadius_withAdditiveAnimationFactory_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __88__UIView_PKUIAnimationUtilities__pkui_setShadowOpacity_withAnimationFactory_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __95__UIView_PKUIAnimationUtilities__pkui_setShadowOffset_withAdditiveAnimationFactory_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __95__UIView_PKUIAnimationUtilities__pkui_setShadowRadius_withAdditiveAnimationFactory_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __90__UIView_PKUIAnimationUtilities__pkui_setBounds_withAdditiveAnimationFactory_accumulator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBounds:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __90__UIView_PKUIAnimationUtilities__pkui_setPosition_withAdditiveAnimationFactory_animation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __91__UIView_PKUIAnimationUtilities__pkui_setTransform_withAdditiveAnimationFactory_animation___block_invoke(uint64_t a1)
{
  void *v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  _OWORD v7[8];

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(a1 + 120);
  v7[4] = *(_OWORD *)(a1 + 104);
  v7[5] = v2;
  v3 = *(_OWORD *)(a1 + 152);
  v7[6] = *(_OWORD *)(a1 + 136);
  v7[7] = v3;
  v4 = *(_OWORD *)(a1 + 56);
  v7[0] = *(_OWORD *)(a1 + 40);
  v7[1] = v4;
  v5 = *(_OWORD *)(a1 + 88);
  v7[2] = *(_OWORD *)(a1 + 72);
  v7[3] = v5;
  return objc_msgSend(v1, "setTransform3D:", v7);
}

uint64_t __79__UIView_PKUIAnimationUtilities__pkui_setAlpha_withAnimationFactory_animation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
}

uint64_t __89__UIView_PKUIAnimationUtilities__pkui_setBackgroundColor_withAnimationFactory_animation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", *(_QWORD *)(a1 + 40));
}

void __89__UIView_PKUIAnimationUtilities__pkui_setBackgroundColor_withAnimationFactory_animation___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)a1[4];
  v2 = (void *)a1[5];
  if (v2)
  {
    objc_msgSend(v3, "setFromValue:", objc_msgSend(v2, "backgroundColor"));
  }
  else
  {
    v4 = (void *)a1[6];
    v5 = v4;
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setFromValue:", objc_msgSend(objc_retainAutorelease(v5), "CGColor"));
    if (!v4)

  }
  v6 = (void *)a1[4];
  v7 = (void *)a1[7];
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  objc_msgSend(v6, "setToValue:", objc_msgSend(objc_retainAutorelease(v8), "CGColor"));
  if (!v7)

}

@end
