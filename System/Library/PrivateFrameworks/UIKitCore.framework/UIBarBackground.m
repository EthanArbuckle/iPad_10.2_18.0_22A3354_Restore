@implementation UIBarBackground

uint64_t __54___UIBarBackground_transitionBackgroundViewsAnimated___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "prepareBackgroundViews");
  objc_msgSend(*(id *)(a1 + 32), "updateBackground");
  return objc_msgSend(*(id *)(a1 + 32), "cleanupBackgroundViews");
}

uint64_t __40___UIBarBackground_transition_toLayout___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2;

  v2 = 48;
  if (a2)
    v2 = 40;
  return objc_msgSend(*(id *)(a1 + 32), "setLayout:", *(_QWORD *)(a1 + v2));
}

uint64_t __54___UIBarBackground_transitionBackgroundViewsAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cleanupBackgroundViews");
}

uint64_t __54___UIBarBackground_transitionBackgroundViewsAnimated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "prepareBackgroundViews");
}

@end
