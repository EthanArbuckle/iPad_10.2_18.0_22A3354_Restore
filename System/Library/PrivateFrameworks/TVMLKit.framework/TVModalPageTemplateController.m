@implementation TVModalPageTemplateController

void __67___TVModalPageTemplateController__updateWithCollectionListElement___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "_viewControllerWithElement:existingController:", v7, v5);

}

@end
