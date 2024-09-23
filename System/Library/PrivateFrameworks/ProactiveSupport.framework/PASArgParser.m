@implementation PASArgParser

uint64_t __63___PASArgParser_simpleParserWithHelpGenerator_version_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;

  v3 = a2;
  objc_msgSend(v3, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("help"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
    {
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v3, "parser");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "naiveUsageHelpWithPositionalArgString:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v14 = objc_retainAutorelease(v7);
    printf("%s", (const char *)objc_msgSend(v14, "UTF8String"));

    goto LABEL_9;
  }
  objc_msgSend(v3, "options");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("version"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {

    goto LABEL_11;
  }
  v10 = *(_QWORD *)(a1 + 32);

  if (!v10)
  {
LABEL_11:
    v15 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "processName");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  printf("%s %s\n", (const char *)objc_msgSend(v12, "UTF8String"), (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"));

LABEL_9:
  v15 = 0;
LABEL_12:

  return v15;
}

@end
