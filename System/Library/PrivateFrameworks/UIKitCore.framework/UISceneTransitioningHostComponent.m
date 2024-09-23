@implementation UISceneTransitioningHostComponent

void __47___UISceneTransitioningHostComponent_setScene___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EE0CE0A8))
  {
    v2 = v3;
    objc_msgSend(v2, "setAllowedAsMorphTransitionSource:", _UIApplicationProcessIsSpringBoard());

  }
}

@end
