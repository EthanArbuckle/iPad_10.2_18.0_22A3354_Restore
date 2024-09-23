@implementation UIHomeAffordanceRegistrationTokenForNotifierAndRecord

void ___UIHomeAffordanceRegistrationTokenForNotifierAndRecord_block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_unregisterHomeAffordanceObserverForRecord:", *(_QWORD *)(a1 + 32));

}

@end
