@implementation UILabelMarqueeAnimationDelegate

void __62___UILabelMarqueeAnimationDelegate_animationDidStop_finished___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id WeakRetained;
  id v5;

  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 9))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = _UILabelMarqueeEndedNotification;
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
    objc_msgSend(v2, "postNotificationName:object:userInfo:", v3, WeakRetained, 0);

    v5 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
    objc_setAssociatedObject(v5, &__marqueeAnimationDelegateKey, 0, (void *)1);

  }
}

void __62___UILabelMarqueeAnimationDelegate_animationDidStop_finished___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "setMarqueeRunning:", 0);

}

@end
