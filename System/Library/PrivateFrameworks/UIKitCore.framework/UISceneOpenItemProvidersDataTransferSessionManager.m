@implementation UISceneOpenItemProvidersDataTransferSessionManager

void __69___UISceneOpenItemProvidersDataTransferSessionManager_sharedInstance__block_invoke()
{
  _UISceneOpenItemProvidersDataTransferSessionManager *v0;
  void *v1;

  v0 = objc_alloc_init(_UISceneOpenItemProvidersDataTransferSessionManager);
  v1 = (void *)qword_1ECD7F140;
  qword_1ECD7F140 = (uint64_t)v0;

}

void __66___UISceneOpenItemProvidersDataTransferSessionManager_addSession___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setDelegate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "sessions");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 32));

}

void __92___UISceneOpenItemProvidersDataTransferSessionManager_dataTransferSessionFinishedTransfers___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "sessions");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

@end
