@implementation INObjectCollection

void __79__INObjectCollection_LocalizedIndexedCollation__wf_contentIsEqualToCollection___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  id v17;

  v17 = a2;
  objc_msgSend(*(id *)(a1 + 32), "sections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 != v17)
  {
    objc_msgSend(v17, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqualToString:", v10))
    {
      v12 = *(_QWORD *)(a1 + 40);
      v11 = a1 + 40;
      *(_BYTE *)(*(_QWORD *)(v12 + 8) + 24) = 0;
    }
    else
    {
      objc_msgSend(v17, "items");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "items");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqualToArray:", v14);
      v16 = *(_QWORD *)(a1 + 40);
      v11 = a1 + 40;
      *(_BYTE *)(*(_QWORD *)(v16 + 8) + 24) = v15;

    }
    *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)v11 + 8) + 24) ^ 1;
  }

}

id __61__INObjectCollection_LocalizedIndexedCollation__wf_mapItems___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v3 = (objc_class *)MEMORY[0x24BDD9ED8];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __61__INObjectCollection_LocalizedIndexedCollation__wf_mapItems___block_invoke_2;
  v11[3] = &unk_24EE249E0;
  v12 = *(id *)(a1 + 32);
  objc_msgSend(v7, "if_map:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithTitle:items:", v6, v8);

  return v9;
}

uint64_t __61__INObjectCollection_LocalizedIndexedCollation__wf_mapItems___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __125__INObjectCollection_LocalizedIndexedCollation__wf_localizedIndexedCollationCollectionWithCollation_collationStringSelector___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", objc_msgSend(v3, "sectionForObject:collationStringSelector:", v5, v4));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v5);

}

id __125__INObjectCollection_LocalizedIndexedCollation__wf_localizedIndexedCollationCollectionWithCollation_collationStringSelector___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = (objc_class *)MEMORY[0x24BDD9ED8];
  v6 = a2;
  v7 = [v5 alloc];
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithTitle:items:", v6, v8);

  return v9;
}

id __70__INObjectCollection_WorkflowEditor__wf_filteredCollectionUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v3 = a2;
  objc_msgSend(v3, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_objectsPassingTest:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    v6 = objc_alloc(MEMORY[0x24BDD9ED8]);
    objc_msgSend(v3, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithTitle:items:", v7, v5);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __52__INObjectCollection_WorkflowEditor__wf_objectCount__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "items");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += objc_msgSend(v3, "count");

}

@end
