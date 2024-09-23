@implementation REParameterComplexitiyComparator

id __REParameterComplexitiyComparator_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a2;
  v6 = a3;
  v7 = v5;
  v8 = v6;
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 32);
  if (v10 == 1)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x24BDD16E0];
    v13 = v7;
    goto LABEL_5;
  }
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x24BDD16E0];
    v13 = v9;
LABEL_5:
    objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v11, "compare:", v14);

  }
  return v6;
}

@end
