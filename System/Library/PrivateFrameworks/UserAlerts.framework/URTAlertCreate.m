@implementation URTAlertCreate

void __URTAlertCreate_block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invokeCallbackForResponseFlags:", 0);

}

void __URTAlertCreate_block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invokeCallbackForResponseFlags:", 1);

}

@end
