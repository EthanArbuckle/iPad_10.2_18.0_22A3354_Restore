@implementation UIView(PosterUIFoundation)

- (id)pui_constraintsPinningSubview:()PosterUIFoundation toEdges:
{
  id v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v6 = a3;
  v7 = objc_msgSend(v6, "isDescendantOfView:", a1);
  v8 = (void *)MEMORY[0x24BDBD1A8];
  if (a4 && v7)
  {
    v9 = (void *)objc_opt_new();
    if ((a4 & 1) != 0)
    {
      objc_msgSend(v6, "topAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "topAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "constraintEqualToAnchor:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v16);

      if ((a4 & 4) == 0)
      {
LABEL_5:
        if ((a4 & 2) == 0)
          goto LABEL_6;
        goto LABEL_12;
      }
    }
    else if ((a4 & 4) == 0)
    {
      goto LABEL_5;
    }
    objc_msgSend(v6, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v19);

    if ((a4 & 2) == 0)
    {
LABEL_6:
      if ((a4 & 8) == 0)
      {
LABEL_8:
        v8 = (void *)objc_msgSend(v9, "copy");

        goto LABEL_9;
      }
LABEL_7:
      objc_msgSend(v6, "trailingAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "trailingAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "constraintEqualToAnchor:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v12);

      goto LABEL_8;
    }
LABEL_12:
    objc_msgSend(v6, "leadingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "leadingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v22);

    if ((a4 & 8) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_9:

  return v8;
}

@end
