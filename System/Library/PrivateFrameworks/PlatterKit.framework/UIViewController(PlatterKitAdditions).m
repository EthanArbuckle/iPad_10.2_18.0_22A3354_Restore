@implementation UIViewController(PlatterKitAdditions)

- (id)pl_presentationControllerIfPresented
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "parentViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = 0;
    }
    else
    {
      objc_msgSend(a1, "presentationController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)pl_presentingPresentationController
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  do
  {
    v2 = v1;
    objc_msgSend(v1, "pl_presentationControllerIfPresented");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "parentViewController");
    v1 = (id)objc_claimAutoreleasedReturnValue();

  }
  while (!v3 && v1);

  return v3;
}

@end
