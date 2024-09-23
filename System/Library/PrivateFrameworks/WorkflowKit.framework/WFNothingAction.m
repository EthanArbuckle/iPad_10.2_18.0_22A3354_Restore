@implementation WFNothingAction

- (BOOL)shouldBeSuggestedAfterAction:(id)a3 inWorkflow:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "outputContentClasses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
      v7 = 1;
    else
      v7 = objc_msgSend(v5, "inputPassthrough");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
