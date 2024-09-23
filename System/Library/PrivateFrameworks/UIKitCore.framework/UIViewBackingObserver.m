@implementation UIViewBackingObserver

void __40___UIViewBackingObserver_sharedObserver__block_invoke()
{
  _UIViewBackingObserver *v0;
  void *v1;

  v0 = objc_alloc_init(_UIViewBackingObserver);
  v1 = (void *)_MergedGlobals_1060;
  _MergedGlobals_1060 = (uint64_t)v0;

}

uint64_t __50___UIViewBackingObserver_observe_forKeyPath_once___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "additionalObservers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

@end
