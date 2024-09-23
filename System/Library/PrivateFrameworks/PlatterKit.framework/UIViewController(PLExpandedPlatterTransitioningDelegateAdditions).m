@implementation UIViewController(PLExpandedPlatterTransitioningDelegateAdditions)

- (id)pl_containingClickPresentationInteractionPresentingViewController
{
  id v1;
  void *v2;

  v1 = a1;
  if (v1)
  {
    while (!objc_msgSend(v1, "conformsToProtocol:", &unk_1EFC7CCE8))
    {
      objc_msgSend(v1, "parentViewController");
      v2 = (void *)objc_claimAutoreleasedReturnValue();

      v1 = v2;
      if (!v2)
        goto LABEL_7;
    }
    v1 = v1;
    v2 = v1;
  }
  else
  {
    v2 = 0;
  }
LABEL_7:

  return v1;
}

@end
