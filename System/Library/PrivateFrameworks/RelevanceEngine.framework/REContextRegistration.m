@implementation REContextRegistration

void __45___REContextRegistration_registerWithContext__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_evaluateQueryWithRegistration:", 1);

}

@end
