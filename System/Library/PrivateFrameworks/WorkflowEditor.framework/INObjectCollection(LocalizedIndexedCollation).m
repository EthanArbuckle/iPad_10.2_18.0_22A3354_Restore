@implementation INObjectCollection(LocalizedIndexedCollation)

- (id)wf_localizedIndexedCollationCollectionWithCollation:()LocalizedIndexedCollation collationStringSelector:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  id (*v29)(uint64_t, void *, uint64_t);
  void *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  uint64_t v35;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(v6, "sectionTitles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sectionTitles");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    v12 = 0;
    do
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v13);

      ++v12;
      objc_msgSend(v6, "sectionTitles");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

    }
    while (v12 < v15);
  }
  objc_msgSend(a1, "allItems");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayFromArray:collationStringSelector:", v16, a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = MEMORY[0x24BDAC760];
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __125__INObjectCollection_LocalizedIndexedCollation__wf_localizedIndexedCollationCollectionWithCollation_collationStringSelector___block_invoke;
  v32[3] = &unk_24EE249B8;
  v33 = v6;
  v35 = a4;
  v19 = v9;
  v34 = v19;
  v20 = v6;
  objc_msgSend(v17, "enumerateObjectsUsingBlock:", v32);
  objc_msgSend(v20, "sectionTitles");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v18;
  v28 = 3221225472;
  v29 = __125__INObjectCollection_LocalizedIndexedCollation__wf_localizedIndexedCollationCollectionWithCollation_collationStringSelector___block_invoke_2;
  v30 = &unk_24EE24D90;
  v31 = v19;
  v22 = v19;
  objc_msgSend(v21, "if_map:", &v27);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = objc_alloc(MEMORY[0x24BDD9ED0]);
  v25 = (void *)objc_msgSend(v24, "initWithSections:", v23, v27, v28, v29, v30);
  objc_msgSend(v25, "setUsesIndexedCollation:", objc_msgSend(a1, "usesIndexedCollation"));

  return v25;
}

- (id)wf_mapItems:()LocalizedIndexedCollation
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  objc_msgSend(a1, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __61__INObjectCollection_LocalizedIndexedCollation__wf_mapItems___block_invoke;
  v10[3] = &unk_24EE24F38;
  v11 = v4;
  v6 = v4;
  objc_msgSend(v5, "if_map:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9ED0]), "initWithSections:", v7);
  objc_msgSend(v8, "setUsesIndexedCollation:", objc_msgSend(a1, "usesIndexedCollation"));

  return v8;
}

- (BOOL)wf_contentIsEqualToCollection:()LocalizedIndexedCollation
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  _BOOL8 v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v4 = a3;
  if (a1 == v4)
  {
    v11 = 1;
    goto LABEL_8;
  }
  objc_msgSend(a1, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  objc_msgSend(v4, "sections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 != objc_msgSend(v7, "count"))
  {

    goto LABEL_7;
  }
  v8 = objc_msgSend(a1, "usesIndexedCollation");
  v9 = objc_msgSend(v4, "usesIndexedCollation");

  if (v8 != v9)
  {
LABEL_7:
    v11 = 0;
    goto LABEL_8;
  }
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 1;
  objc_msgSend(a1, "sections");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __79__INObjectCollection_LocalizedIndexedCollation__wf_contentIsEqualToCollection___block_invoke;
  v13[3] = &unk_24EE24A08;
  v14 = v4;
  v15 = &v16;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v13);

  v11 = *((_BYTE *)v17 + 24) != 0;
  _Block_object_dispose(&v16, 8);
LABEL_8:

  return v11;
}

@end
