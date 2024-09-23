@implementation UISceneRelationshipManagementHostComponent

void __79___UISceneRelationshipManagementHostComponent__scenePresenterIsMovingToWindow___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v2)
    objc_msgSend(WeakRetained, "notifyObserversOfParentChange:", v2);

}

@end
