@implementation CreatePrivateQueueMOC

void __CreatePrivateQueueMOC_block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setTransactionAuthor:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "pathManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("com.apple.photos.PLModelMigratorPathManagerKey"));

}

@end
