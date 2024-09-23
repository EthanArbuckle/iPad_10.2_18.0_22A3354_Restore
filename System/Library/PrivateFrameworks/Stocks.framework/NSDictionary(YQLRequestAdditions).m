@implementation NSDictionary(YQLRequestAdditions)

- (id)yql_objectForKey:()YQLRequestAdditions ofClass:
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v1 = v2;
    else
      v1 = 0;
  }
  v3 = v1;

  return v3;
}

@end
