@implementation UISystemInputActivityManager

void __65___UISystemInputActivityManager_beginTrackingSystemInputActivity__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateClientSettingsSystemInputActive:", 0);

}

uint64_t __72___UISystemInputActivityManager__updateClientSettingsSystemInputActive___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSystemInputActive:", *(unsigned __int8 *)(a1 + 32));
}

@end
