@implementation RESignificantTimeChangeNotifier

void __50___RESignificantTimeChangeNotifier_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_Notifier;
  sharedInstance_Notifier = v0;

}

void __40___RESignificantTimeChangeNotifier_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_notify");

}

@end
