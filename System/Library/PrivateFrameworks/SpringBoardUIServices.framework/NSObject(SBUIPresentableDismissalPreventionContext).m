@implementation NSObject(SBUIPresentableDismissalPreventionContext)

- (id)presentableDismissalPreventionContext
{
  void *v2;
  id v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "presentableContext");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = v2;
    else
      v3 = 0;

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

@end
