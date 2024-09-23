@implementation WFLocallyFilterActions

uint64_t __WFLocallyFilterActions_block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "filteringBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "matchingTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "matchingTypes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = WFMatchActionTypesWithFileTypes(v5, *(void **)(a1 + 32));

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

uint64_t __WFLocallyFilterActions_block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "filteringBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inClientPredicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "allowEvaluation");
    objc_msgSend(*(id *)(a1 + 32), "files");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "evaluateWithObject:", v5);

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

id __WFLocallyFilterActions_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v2 = a2;
  objc_msgSend(v2, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(v2, "fileURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pathExtension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7
      || (objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:", v7),
          (v5 = (id)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v5 = (id)*MEMORY[0x1E0CEC528];
    }

  }
  return v5;
}

@end
