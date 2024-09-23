@implementation PLSearchIndexGraphOnlyCategoriesContainsCategory

void __PLSearchIndexGraphOnlyCategoriesContainsCategory_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addIndex:", 1000);
  objc_msgSend(v2, "addIndex:", 1001);
  objc_msgSend(v2, "addIndex:", 1310);
  objc_msgSend(v2, "addIndex:", 1600);
  objc_msgSend(v2, "addIndex:", 1601);
  objc_msgSend(v2, "addIndex:", 1003);
  objc_msgSend(v2, "addIndex:", 1004);
  objc_msgSend(v2, "addIndex:", 1005);
  objc_msgSend(v2, "addIndex:", 1006);
  objc_msgSend(v2, "addIndex:", 1700);
  objc_msgSend(v2, "addIndex:", 1701);
  objc_msgSend(v2, "addIndex:", 1800);
  objc_msgSend(v2, "addIndex:", 1802);
  objc_msgSend(v2, "addIndex:", 1801);
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)PLSearchIndexGraphOnlyCategoriesContainsCategory_graphOnlyCategories;
  PLSearchIndexGraphOnlyCategoriesContainsCategory_graphOnlyCategories = v0;

}

@end
