@implementation LSApplicationRecord

- (id)mb_applicationType
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord compatibilityObject](self, "compatibilityObject"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "applicationType"));

  return v3;
}

@end
