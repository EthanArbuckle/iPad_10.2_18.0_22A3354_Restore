@implementation REMLMultipleWeightedModel

uint64_t __46___REMLMultipleWeightedModel_enumerateModels___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __51___REMLMultipleWeightedModel_saveModelToURL_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  id v14;
  id obj;

  v5 = a2;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "URLByAppendingPathComponent:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    obj = *(id *)(v9 + 40);
    v10 = objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, 0, &obj);
    objc_storeStrong((id *)(v9 + 40), obj);

    if ((v10 & 1) != 0)
    {
      objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("model"));
      v11 = objc_claimAutoreleasedReturnValue();

      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v14 = *(id *)(v12 + 40);
      v13 = objc_msgSend(v5, "saveModelToURL:error:", v11, &v14);
      objc_storeStrong((id *)(v12 + 40), v14);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v13;
      v6 = (void *)v11;
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    }

  }
}

@end
