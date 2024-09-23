@implementation UICommand(CalculateGraphingControllerInsertionDecision)

- (id)calculateGraphingControllerInsertionDecision
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  objc_msgSend(a1, "propertyList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[ICCalculateGraphingControllerInsertionDecision cache](ICCalculateGraphingControllerInsertionDecision, "cache");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
