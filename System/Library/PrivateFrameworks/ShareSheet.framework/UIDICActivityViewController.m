@implementation UIDICActivityViewController

void __71___UIDICActivityViewController_setDocumentInteractionActivityDelegate___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id *v8;
  id v9;
  id v10;
  id v11;
  id WeakRetained;

  v8 = (id *)(a1 + 32);
  v9 = a5;
  v10 = a4;
  v11 = a2;
  WeakRetained = objc_loadWeakRetained(v8);
  objc_msgSend(WeakRetained, "_handleDidFinishPerformingActivityType:completed:resultItems:activityError:", v11, a3, v10, v9);

}

@end
