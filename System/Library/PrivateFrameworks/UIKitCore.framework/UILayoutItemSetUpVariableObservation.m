@implementation UILayoutItemSetUpVariableObservation

void ___UILayoutItemSetUpVariableObservation_block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "nsis_valueOfVariable:didChangeInEngine:", v2, v3);

}

@end
