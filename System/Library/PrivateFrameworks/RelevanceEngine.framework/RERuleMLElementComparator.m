@implementation RERuleMLElementComparator

uint64_t __72___RERuleMLElementComparator_initWithFilteringRules_rankingRules_model___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  double v10;
  void *v11;
  uint64_t v12;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a2;
  objc_msgSend(a3, "priority");
  objc_msgSend(v4, "numberWithFloat:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "priority");
  v9 = v8;

  LODWORD(v10) = v9;
  objc_msgSend(v7, "numberWithFloat:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v6, "compare:", v11);

  return v12;
}

uint64_t __72___RERuleMLElementComparator_initWithFilteringRules_rankingRules_model___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  double v10;
  void *v11;
  uint64_t v12;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a2;
  objc_msgSend(a3, "priority");
  objc_msgSend(v4, "numberWithFloat:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "priority");
  v9 = v8;

  LODWORD(v10) = v9;
  objc_msgSend(v7, "numberWithFloat:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v6, "compare:", v11);

  return v12;
}

@end
