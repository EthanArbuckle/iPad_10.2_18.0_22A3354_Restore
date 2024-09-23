@implementation UISceneHostingGraph

uint64_t __76___UISceneHostingGraph_observeLocalWindowGraphHostingContextID_withHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
}

void __76___UISceneHostingGraph_observeLocalWindowGraphHostingContextID_withHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  id v7;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v7 = v3;
    BSDispatchMain();

  }
}

void __38___UISceneHostingGraph_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[_UISceneHostingGraph _init]([_UISceneHostingGraph alloc], "_init");
  v1 = (void *)_MergedGlobals_1_11;
  _MergedGlobals_1_11 = (uint64_t)v0;

}

@end
