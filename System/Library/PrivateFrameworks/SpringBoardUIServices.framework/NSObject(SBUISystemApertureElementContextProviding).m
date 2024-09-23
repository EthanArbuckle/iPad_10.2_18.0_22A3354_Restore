@implementation NSObject(SBUISystemApertureElementContextProviding)

- (id)systemApertureElementContext
{
  void *v2;
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_6;
  objc_msgSend(a1, "presentableContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

LABEL_6:
    +[SBUISystemApertureElementSource unassociatedContext](SBUISystemApertureElementSource, "unassociatedContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  objc_msgSend(v2, "systemApertureElementContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_6;
  return v3;
}

@end
