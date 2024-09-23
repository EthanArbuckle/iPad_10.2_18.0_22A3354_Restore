@implementation SXConfiguredConditionValidator

- (BOOL)validateCondition:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "configurationKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "conditionKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v6, "conditionKeys");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

      if (v10)
      {
        objc_msgSend(v6, "conditionKeys");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "configurationKey");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v8) = objc_msgSend(v11, "containsObject:", v12);

      }
      else
      {
        LOBYTE(v8) = 0;
      }
    }
  }
  else
  {
    LOBYTE(v8) = 1;
  }

  return (char)v8;
}

@end
