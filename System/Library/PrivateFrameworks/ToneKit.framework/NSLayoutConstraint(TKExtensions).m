@implementation NSLayoutConstraint(TKExtensions)

- (void)tk_removeFromContainer
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  id v15;

  objc_msgSend(a1, "firstItem");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "secondItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v15;
  else
    v3 = 0;
  v4 = v3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v2;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  if (v4)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
  {
    if (v4)
      v9 = v4;
    else
      v9 = v6;
    v10 = v9;
  }
  else
  {
    objc_msgSend(v4, "tk_firstCommonAncestorWithView:", v6);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
  if (v10)
  {
    while (1)
    {
      objc_msgSend(v11, "constraints");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "containsObject:", a1);

      if (v13)
        break;
      objc_msgSend(v11, "superview");
      v14 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v14;
      if (!v14)
        goto LABEL_21;
    }
    objc_msgSend(v11, "removeConstraint:", a1);

  }
LABEL_21:

}

@end
