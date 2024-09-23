@implementation WFMigrateDropboxAction

void __WFMigrateDropboxAction_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "wf_popObjectForKey:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v6, v5);

}

@end
