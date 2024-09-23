@implementation UIViewController(RemoteUI)

- (BOOL)containsDescendant:()RemoteUI
{
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (a1 == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(a1, "childViewControllers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __49__UIViewController_RemoteUI__containsDescendant___block_invoke;
    v9[3] = &unk_24C2977E8;
    v10 = v4;
    objc_msgSend(v5, "aaf_firstObjectPassingTest:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 != 0;

  }
  return v7;
}

- (BOOL)containsDescendantFromArray:()RemoteUI
{
  void *v3;
  _BOOL8 v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __58__UIViewController_RemoteUI__containsDescendantFromArray___block_invoke;
  v6[3] = &unk_24C2977E8;
  v6[4] = a1;
  objc_msgSend(a3, "aaf_firstObjectPassingTest:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

@end
