@implementation TVSwipeUpMessageView

uint64_t __36___TVSwipeUpMessageView_setMessage___block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v0 = objc_alloc_init(MEMORY[0x24BDF6758]);
  v1 = (void *)setMessage__textShadow;
  setMessage__textShadow = (uint64_t)v0;

  v2 = (void *)setMessage__textShadow;
  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorWithAlphaComponent:", 0.4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShadowColor:", v4);

  objc_msgSend((id)setMessage__textShadow, "setShadowOffset:", 0.0, 0.0);
  return objc_msgSend((id)setMessage__textShadow, "setShadowBlurRadius:", 2.0);
}

uint64_t __53___TVSwipeUpMessageView__processSwipeUpMessageEvent___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "chevronView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __53___TVSwipeUpMessageView__processSwipeUpMessageEvent___block_invoke_2;
  v4[3] = &unk_24EB85440;
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 0, v4, 0, 0.75, 0.75);
}

void __53___TVSwipeUpMessageView__processSwipeUpMessageEvent___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  __int128 v4;
  _OWORD v5[3];

  objc_msgSend(*(id *)(a1 + 32), "messageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "messageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v5[0] = *MEMORY[0x24BDBD8B8];
  v5[1] = v4;
  v5[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v3, "setTransform:", v5);

}

uint64_t __53___TVSwipeUpMessageView__processSwipeUpMessageEvent___block_invoke_3(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_processSwipeUpMessageEvent:", 2);
  return result;
}

void __53___TVSwipeUpMessageView__processSwipeUpMessageEvent___block_invoke_4(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "chevronView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "messageView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

}

uint64_t __53___TVSwipeUpMessageView__processSwipeUpMessageEvent___block_invoke_5(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_processSwipeUpMessageEvent:", 2);
  return result;
}

@end
