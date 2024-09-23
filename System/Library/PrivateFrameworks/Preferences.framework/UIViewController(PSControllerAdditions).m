@implementation UIViewController(PSControllerAdditions)

- (void)popRecursivelyToRootController
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];

  objc_msgSend(a1, "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __73__UIViewController_PSControllerAdditions__popRecursivelyToRootController__block_invoke;
    v7[3] = &unk_1E4A654F0;
    v7[4] = a1;
    objc_msgSend(MEMORY[0x1E0CEABB8], "_performWithoutDeferringTransitions:", v7);
  }
  objc_msgSend(a1, "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(a1, "parentViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "presentingViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      return;
    objc_msgSend(a1, "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "popRecursivelyToRootController", v4);

}

@end
