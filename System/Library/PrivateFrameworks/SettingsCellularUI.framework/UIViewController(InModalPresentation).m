@implementation UIViewController(InModalPresentation)

- (uint64_t)isInModalPresentation
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "navigationController");
  v2 = objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = a1;
    objc_msgSend(v3, "parentViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      do
      {
        objc_msgSend(v3, "parentViewController");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "parentViewController");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        v3 = v5;
      }
      while (v6);
    }
    else
    {
      v5 = v3;
    }
    objc_msgSend(v5, "presentingViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v7 != 0;

  }
  return v2;
}

@end
