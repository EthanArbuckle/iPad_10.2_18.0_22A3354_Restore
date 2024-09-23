@implementation NSUserActivity(CSSearchableItemAttributeSet)

- (id)contentAttributeSet
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_internalUserActivity");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "contentAttributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)setContentAttributeSet:()CSSearchableItemAttributeSet
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(a1, "_internalUserActivity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentAttributeSet:", v5);

}

@end
