@implementation SPWebSearchURLFromQuery

void __SPWebSearchURLFromQuery_block_invoke()
{
  SPSafariObserver *v0;
  void *v1;
  id v2;

  v0 = objc_alloc_init(SPSafariObserver);
  v1 = (void *)SPWebSearchURLFromQuery_safariObserver;
  SPWebSearchURLFromQuery_safariObserver = (uint64_t)v0;

  objc_msgSend(MEMORY[0x24BDBCF50], "_sf_safariSharedDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:forKeyPath:options:context:", SPWebSearchURLFromQuery_safariObserver, *MEMORY[0x24BDE81F8], 3, 0);

}

@end
