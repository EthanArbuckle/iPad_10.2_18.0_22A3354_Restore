@implementation UIViewController(NCAdditions)

- (uint64_t)ncTransitionAnimationState
{
  return 0;
}

- (id)nc_presentationControllerIfPresented
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

- (id)nc_presentationContextDefiningViewController
{
  id v1;
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3 = v1;
    if ((objc_msgSend(v1, "definesPresentationContext") & 1) == 0)
    {
      do
      {
        v4 = v2;
        v2 = v3;

        objc_msgSend(v2, "parentViewController");
        v3 = (void *)objc_claimAutoreleasedReturnValue();

      }
      while ((objc_msgSend(v2, "definesPresentationContext") & 1) == 0 && v3);
    }
  }
  else
  {
    v3 = 0;
  }
  if (objc_msgSend(v2, "definesPresentationContext"))
  {
    v5 = v2;
    if (v5)
    {
      v6 = v5;
      v7 = v5;
      do
      {
        v2 = v6;

        objc_msgSend(v2, "presentedViewController");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        v7 = v2;
      }
      while (v6);
    }
    else
    {
      v2 = 0;
    }
  }

  return v2;
}

@end
