@implementation UIORequestEditMenuPresentationAction

void __69___UIORequestEditMenuPresentationAction_performActionFromConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  +[_UIEditMenuPresentationServer sharedPresentationServer](_UIEditMenuPresentationServer, "sharedPresentationServer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "originContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentEditMenuWithConfiguration:originContext:inDisplayDelegate:forConnection:", v4, v5, v3, *(_QWORD *)(a1 + 40));

}

@end
