@implementation UIViewController(PLExpandedPlatterPresentationControllerAdditions)

- (id)expandedPlatterPresentationController
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "pl_presentingPresentationController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

@end
