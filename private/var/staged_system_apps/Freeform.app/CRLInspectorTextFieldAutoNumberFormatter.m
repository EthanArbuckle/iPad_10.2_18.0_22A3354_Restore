@implementation CRLInspectorTextFieldAutoNumberFormatter

- (id)zeroSymbol
{
  return &stru_1012A72B0;
}

- (id)textAttributesForZero
{
  void *v2;
  void *v3;
  NSAttributedStringKey v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor grayColor](UIColor, "grayColor"));
  v5 = NSForegroundColorAttributeName;
  v6 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));

  return v3;
}

@end
