@implementation SBHUDModel

void __34___SBHUDModel__setupDropletLayout__block_invoke(uint64_t a1, double a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleDropletLayoutCallback:", a2);

}

@end
