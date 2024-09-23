@implementation INObjectCollection

void __72__INObjectCollection_WFMapping__wf_mapAsynchronously_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a2;
  v7 = a4;
  objc_msgSend(v6, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __72__INObjectCollection_WFMapping__wf_mapAsynchronously_completionHandler___block_invoke_2;
  v15[3] = &unk_1E7AF8768;
  v16 = *(id *)(a1 + 32);
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __72__INObjectCollection_WFMapping__wf_mapAsynchronously_completionHandler___block_invoke_3;
  v12[3] = &unk_1E7AF8790;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v8, "if_mapAsynchronously:completionHandler:", v15, v12);

}

void __72__INObjectCollection_WFMapping__wf_mapAsynchronously_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;

  v5 = (objc_class *)MEMORY[0x1E0CBDA10];
  v6 = a3;
  v7 = a2;
  v8 = (id)objc_msgSend([v5 alloc], "initWithSections:", v7);

  objc_msgSend(v8, "setUsesIndexedCollation:", objc_msgSend(*(id *)(a1 + 32), "usesIndexedCollation"));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __72__INObjectCollection_WFMapping__wf_mapAsynchronously_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __72__INObjectCollection_WFMapping__wf_mapAsynchronously_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v5 = (objc_class *)MEMORY[0x1E0CBDA20];
  v6 = a3;
  v7 = a2;
  v8 = [v5 alloc];
  objc_msgSend(*(id *)(a1 + 32), "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v8, "initWithTitle:items:", v9, v7);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

id __57__INObjectCollection_WFMapping__wf_mapObjectsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  objc_msgSend(v3, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__INObjectCollection_WFMapping__wf_mapObjectsUsingBlock___block_invoke_2;
  v10[3] = &unk_1E7AF8718;
  v11 = *(id *)(a1 + 32);
  objc_msgSend(v4, "if_map:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x1E0CBDA20]);
  objc_msgSend(v3, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v6, "initWithTitle:items:", v7, v5);
  return v8;
}

uint64_t __57__INObjectCollection_WFMapping__wf_mapObjectsUsingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
