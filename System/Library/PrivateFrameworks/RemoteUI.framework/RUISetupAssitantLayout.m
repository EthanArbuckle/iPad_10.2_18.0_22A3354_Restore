@implementation RUISetupAssitantLayout

- (NSDirectionalEdgeInsets)_insetsForViewController:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  NSDirectionalEdgeInsets result;

  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "directionalLayoutMargins");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "userInterfaceIdiom"))
  {

  }
  else
  {
    objc_msgSend(v4, "traitCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "horizontalSizeClass");

    if (v16 == 2)
    {
      v11 = 5.0;
      goto LABEL_7;
    }
  }
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "userInterfaceIdiom");

  if (v18 == 1)
  {
    v11 = 5.0;
    if (!-[RUISetupAssitantLayout _isViewControllerInFormSheet:](self, "_isViewControllerInFormSheet:", v4))
    {
      objc_msgSend(v4, "view");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "bounds");
      v13 = (v20 + -624.0) * 0.5;

      *(double *)&v7 = 0.0;
      goto LABEL_9;
    }
LABEL_7:
    *(double *)&v7 = 56.0;
    v13 = 88.0;
LABEL_9:
    v9 = v13;
  }

  v21 = *(double *)&v7;
  v22 = v9;
  v23 = v11;
  v24 = v13;
  result.trailing = v24;
  result.bottom = v23;
  result.leading = v22;
  result.top = v21;
  return result;
}

- (BOOL)_isViewControllerInFormSheet:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a3;
  objc_msgSend(v3, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "navigationController");
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v5;
  }
  v6 = objc_msgSend(v3, "modalPresentationStyle");

  return v6 == 2;
}

- (BOOL)_isViewControllerInBuddyiPad:(id)a3
{
  void *v3;
  BOOL v4;

  if (!objc_msgSend(a3, "conformsToProtocol:", &unk_2545FEE20))
    return 0;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom") == 1;

  return v4;
}

+ (CGSize)_preferredContentSizeInBuddy
{
  void *v2;
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 == 1)
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5;

    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v9 = v8;

    if (v6 >= v9)
      v10 = v9;
    else
      v10 = v6;
    v11 = fmin(v10 + -88.0, 820.0);
    v12 = 624.0;
  }
  else
  {
    v12 = *MEMORY[0x24BDBF148];
    v11 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }
  result.height = v11;
  result.width = v12;
  return result;
}

- (CGSize)preferredContentSizeForViewController:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  CGSize result;
  CGRect v14;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_preferredContentSizeInBuddy");
  v5 = v4;
  v7 = v6;
  objc_msgSend(v3, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v3, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "navigationBar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");
    v7 = v7 - CGRectGetHeight(v14);

  }
  v11 = v5;
  v12 = v7;
  result.height = v12;
  result.width = v11;
  return result;
}

@end
