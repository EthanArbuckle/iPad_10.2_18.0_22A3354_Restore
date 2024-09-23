@implementation UIVisualEffectView(Bridge)

- (void)ts_setGroupName:()Bridge
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(a1, "_groupName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && !v4)
    goto LABEL_6;
  objc_msgSend(a1, "_groupName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9 || !v5)
  {

    goto LABEL_8;
  }
  objc_msgSend(a1, "_groupName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", v9);

  v8 = v9;
  if ((v7 & 1) == 0)
  {
LABEL_6:
    objc_msgSend(a1, "_setGroupName:", v9);
LABEL_8:
    v8 = v9;
  }

}

@end
