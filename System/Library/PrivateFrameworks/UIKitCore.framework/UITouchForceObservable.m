@implementation UITouchForceObservable

void __40___UITouchForceObservable_initWithView___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "receiveObservedValue:", v3);

}

void __56___UITouchForceObservable__touchForceMessageForTouches___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v3, "_unclampedTouchForceForTouches:", v4);
  objc_msgSend(v5, "setUnclampedTouchForce:");
  objc_msgSend(*(id *)(a1 + 32), "_maximumPossibleForceForTouches:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v5, "setMaximumPossibleForce:");
  objc_msgSend(v5, "setTimestamp:", CACurrentMediaTime());
  objc_msgSend(v5, "setShouldFilterDueToSystemGestures:", objc_msgSend(*(id *)(a1 + 32), "_shouldFilterDueToSystemGesturesForTouches:", *(_QWORD *)(a1 + 40)));
  objc_msgSend(v5, "setCentroid:", _CentroidOfTouches(*(void **)(a1 + 40), 0));

}

@end
