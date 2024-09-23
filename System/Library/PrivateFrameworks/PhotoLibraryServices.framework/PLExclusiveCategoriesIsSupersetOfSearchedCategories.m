@implementation PLExclusiveCategoriesIsSupersetOfSearchedCategories

void __PLExclusiveCategoriesIsSupersetOfSearchedCategories_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  PLSearchedCategoriesSpecificToUserCategory(1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addIndexes:", v0);

  PLSearchedCategoriesSpecificToUserCategory(2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addIndexes:", v1);

  PLSearchedCategoriesSpecificToUserCategory(5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addIndexes:", v2);

  PLSearchedCategoriesSpecificToUserCategory(6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addIndexes:", v3);

  PLSearchedCategoriesSpecificToUserCategory(7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addIndexes:", v4);

  PLSearchedCategoriesSpecificToUserCategory(12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addIndexes:", v5);

  PLSearchedCategoriesSpecificToUserCategory(19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addIndexes:", v6);

  PLSearchedCategoriesSpecificToUserCategory(23);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addIndexes:", v7);

  PLSearchedCategoriesSpecificToUserCategory(24);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addIndexes:", v8);

  PLSearchedCategoriesSpecificToUserCategory(25);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addIndexes:", v9);

  PLSearchedCategoriesSpecificToUserCategory(26);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addIndexes:", v10);

  PLSearchedCategoriesSpecificToUserCategory(27);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addIndexes:", v11);

  PLSearchedCategoriesSpecificToUserCategory(28);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addIndexes:", v12);

  PLSearchedCategoriesSpecificToUserCategory(29);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addIndexes:", v13);

  PLSearchedCategoriesSpecificToUserCategory(30);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addIndexes:", v14);

  PLSearchedCategoriesSpecificToUserCategory(31);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addIndexes:", v15);

  PLSearchedCategoriesSpecificToUserCategory(32);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addIndexes:", v16);

  PLSearchedCategoriesSpecificToUserCategory(33);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addIndexes:", v17);

  PLSearchedCategoriesSpecificToUserCategory(20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addIndexes:", v18);

  PLSearchedCategoriesSpecificToUserCategory(21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addIndexes:", v19);

  PLSearchedCategoriesSpecificToUserCategory(22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addIndexes:", v20);

  PLSearchedCategoriesSpecificToUserCategory(34);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addIndexes:", v21);

  PLSearchedCategoriesSpecificToUserCategory(35);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addIndexes:", v22);

  v23 = objc_msgSend(v25, "copy");
  v24 = (void *)PLExclusiveCategoriesIsSupersetOfSearchedCategories_exclusiveCategories;
  PLExclusiveCategoriesIsSupersetOfSearchedCategories_exclusiveCategories = v23;

}

@end
