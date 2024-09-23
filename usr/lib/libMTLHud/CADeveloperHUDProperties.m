@implementation CADeveloperHUDProperties

void __37___CADeveloperHUDProperties_instance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)+[_CADeveloperHUDProperties instance]::sharedInstance;
  +[_CADeveloperHUDProperties instance]::sharedInstance = (uint64_t)v1;

}

void __37___CADeveloperHUDProperties_elements__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "name");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:");

}

@end
