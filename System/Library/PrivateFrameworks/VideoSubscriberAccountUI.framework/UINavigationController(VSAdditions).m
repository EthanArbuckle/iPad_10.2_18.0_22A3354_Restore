@implementation UINavigationController(VSAdditions)

- (void)vs_popToViewController:()VSAdditions animated:completion:
{
  id v8;
  void (**v9)(_QWORD);
  id v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a5;
  v10 = v8;
  v18 = v10;
  if (!v10)
  {
    v11 = 0;
    goto LABEL_11;
  }
  v11 = v10;
  while (1)
  {
    objc_msgSend(a1, "viewControllers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "containsObject:", v11);

    if ((v13 & 1) != 0)
      break;
    objc_msgSend(v11, "parentViewController");
    v14 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v14;
    if (!v14)
      goto LABEL_11;
  }
  objc_msgSend(a1, "viewControllers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "count"))
  {

    goto LABEL_11;
  }
  objc_msgSend(a1, "topViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16 == v11)
  {
LABEL_11:
    v9[2](v9);
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setCompletionBlock:", v9);
  v17 = (id)objc_msgSend(a1, "popToViewController:animated:", v11, a4);
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
LABEL_12:

}

@end
