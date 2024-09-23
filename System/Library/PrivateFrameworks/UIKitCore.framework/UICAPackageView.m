@implementation UICAPackageView

void __50___UICAPackageView__shouldCatchDecodingExceptions__block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  _UIKitUserDefaults();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("UICatchCAPackageDecodingExceptions"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
    _shouldCatchDecodingExceptions___shouldCatchDecodingExceptions = objc_msgSend(v0, "BOOLValue");

}

void __85___UICAPackageView_loadPackageViewWithObject_publishedObjectViewClassMap_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void (**v3)(void *, _QWORD *);
  id *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD aBlock[4];
  id v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  _QWORD v31[4];

  v2 = MEMORY[0x1E0C809B0];
  v31[3] = *MEMORY[0x1E0C80C00];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __85___UICAPackageView_loadPackageViewWithObject_publishedObjectViewClassMap_completion___block_invoke_2;
  aBlock[3] = &unk_1E16EC428;
  v27 = *(id *)(a1 + 32);
  v3 = (void (**)(void *, _QWORD *))_Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend(MEMORY[0x1E0CD28B0], "activateBackground:", 1);
  if (*(_BYTE *)(a1 + 64))
  {
    v25 = 0;
    v4 = (id *)&v25;
    v3[2](v3, &v25);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = 0;
    v3[2](v3, &v24);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id *)&v24;
  }
  v6 = *v4;
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  if (v5)
  {
    block[0] = v2;
    block[1] = 3221225472;
    block[2] = __85___UICAPackageView_loadPackageViewWithObject_publishedObjectViewClassMap_completion___block_invoke_3;
    block[3] = &unk_1E16D85F8;
    v23 = *(_QWORD *)(a1 + 56);
    v7 = v5;
    v20 = v7;
    v21 = *(id *)(a1 + 40);
    v22 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E0C80D38], block);

    v8 = v20;
  }
  else
  {
    objc_msgSend(v6, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqual:", CFSTR("CAARFileLoadingDomain"));

    if (v10)
    {
      v11 = v6;
    }
    else
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      if (v6)
      {
        v30 = *MEMORY[0x1E0CB3388];
        v31[0] = v6;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("CAARFileLoadingDomain"), 950000, v13);
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v28 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("'NSData' and 'NSURL' are the only valid input types (the argument was '%@')"), objc_opt_class());
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("CAARFileLoadingDomain"), 950002, v14);
        v11 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    v16[0] = v2;
    v16[1] = 3221225472;
    v16[2] = __85___UICAPackageView_loadPackageViewWithObject_publishedObjectViewClassMap_completion___block_invoke_4;
    v16[3] = &unk_1E16B2F48;
    v15 = *(id *)(a1 + 48);
    v17 = v11;
    v18 = v15;
    v8 = v11;
    dispatch_async(MEMORY[0x1E0C80D38], v16);

    v7 = 0;
  }

}

id __85___UICAPackageView_loadPackageViewWithObject_publishedObjectViewClassMap_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CD27F8], "packageWithData:type:options:error:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0CD3070], 0, a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "path");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
      {
        objc_msgSend(v5, "pathExtension");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (id)*MEMORY[0x1E0CD3070];
        if (v7 && objc_msgSend(v7, "isEqualToString:", CFSTR("ca")))
        {
          v9 = (id)*MEMORY[0x1E0CD3078];

          v8 = v9;
        }
      }
      else
      {
        v8 = (id)*MEMORY[0x1E0CD3070];
        v7 = 0;
      }
      objc_msgSend(MEMORY[0x1E0CD27F8], "packageWithContentsOfURL:type:options:error:", *(_QWORD *)(a1 + 32), v8, 0, a2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }
  return v4;
}

void __85___UICAPackageView_loadPackageViewWithObject_publishedObjectViewClassMap_completion___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id v4;
  id *v5;

  v2 = objc_alloc(*(Class *)(a1 + 56));
  v5 = (id *)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_storeStrong(v5 + 52, *(id *)(a1 + 32));
  v3 = objc_msgSend(*(id *)(a1 + 56), "_newViewHierarchyFrom:publishedObjectViewClassMap:into:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v5);
  v4 = v5[53];
  v5[53] = (id)v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __85___UICAPackageView_loadPackageViewWithObject_publishedObjectViewClassMap_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __85___UICAPackageView_loadPackageViewWithObject_publishedObjectViewClassMap_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __75___UICAPackageView__newViewHierarchyFrom_publishedObjectViewClassMap_into___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  CALayerGetSuperlayer();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    CALayerGetDelegate();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      goto LABEL_4;
    _CreateViewForLayer(v5, *(void **)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  }

LABEL_4:
}

@end
