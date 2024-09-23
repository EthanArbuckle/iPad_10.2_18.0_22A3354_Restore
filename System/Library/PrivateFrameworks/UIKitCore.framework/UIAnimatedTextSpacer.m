@implementation UIAnimatedTextSpacer

void __63___UIAnimatedTextSpacer_initWithSpringBehavior_delay_duration___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateAnimation");

}

uint64_t __40___UIAnimatedTextSpacer__startAnimation__block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setValue:", *(double *)(*(_QWORD *)(a1 + 32) + 32));
  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __40___UIAnimatedTextSpacer__startAnimation__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  objc_msgSend(WeakRetained, "_clearAnimationState");

}

uint64_t __40___UIAnimatedTextSpacer__startAnimation__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
