@implementation TVRUIAnimationState

void __85___TVRUIAnimationState_viewControllersNoLongerAnimatingForDestinationAnimationState___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isParticpantViewController:") & 1) == 0)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v3);

}

@end
