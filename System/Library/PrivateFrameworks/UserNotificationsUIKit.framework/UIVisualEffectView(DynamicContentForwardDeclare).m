@implementation UIVisualEffectView(DynamicContentForwardDeclare)

- (id)_obtainDynamicContentAssertionForReasonIfPossible:()DynamicContentForwardDeclare
{
  id v4;
  void *v5;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "_obtainDynamicContentAssertionForReason:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
