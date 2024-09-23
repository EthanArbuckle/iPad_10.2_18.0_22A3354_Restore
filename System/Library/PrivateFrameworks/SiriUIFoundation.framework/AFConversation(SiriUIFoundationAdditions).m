@implementation AFConversation(SiriUIFoundationAdditions)

- (id)sruif_itemsRelatedToIdentifier:()SiriUIFoundationAdditions
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v18;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x24BDD15D8]);
  v7 = objc_msgSend(a1, "numberOfChildrenForItemAtIndexPath:", v6);

  v18 = v4;
  objc_msgSend(a1, "itemWithIdentifier:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "aceObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "refId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    for (i = 0; i != v7; ++i)
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathWithIndex:", i);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "itemAtIndexPath:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "aceObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "refId");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", v10);

      if (v16)
        objc_msgSend(v5, "addObject:", v13);

    }
  }

  return v5;
}

@end
