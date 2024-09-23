@implementation PLUserControlledCategories

void __PLUserControlledCategories_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addIndex:", 1400);
  objc_msgSend(v2, "addIndex:", 1401);
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)PLUserControlledCategories_userControlledCategories;
  PLUserControlledCategories_userControlledCategories = v0;

}

@end
