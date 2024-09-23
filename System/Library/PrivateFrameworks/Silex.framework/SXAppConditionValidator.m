@implementation SXAppConditionValidator

- (BOOL)validateCondition:(id)a3 context:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "app");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5
    && (objc_msgSend(v4, "app"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("any")),
        v6,
        (v7 & 1) == 0))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "app");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v11, "isEqualToString:", v10);

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

@end
