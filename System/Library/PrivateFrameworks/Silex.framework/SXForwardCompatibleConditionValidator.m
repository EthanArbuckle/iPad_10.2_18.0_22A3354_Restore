@implementation SXForwardCompatibleConditionValidator

- (BOOL)validateCondition:(id)a3 context:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(a3, "JSONRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  SXConditionTypes();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minusSet:", v8);

  LOBYTE(v8) = objc_msgSend(v7, "count") == 0;
  return (char)v8;
}

@end
