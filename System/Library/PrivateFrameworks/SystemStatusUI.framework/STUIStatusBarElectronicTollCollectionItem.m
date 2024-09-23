@implementation STUIStatusBarElectronicTollCollectionItem

- (id)indicatorEntryKey
{
  return (id)*MEMORY[0x1E0DB0CD8];
}

- (id)imageForUpdate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v3 = a3;
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "electronicTollCollectionEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0DC3870];
  DashBoardFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "styleAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("Black_JapanETC"), v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "imageWithRenderingMode:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "styleAttributes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "imageTintColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "BOOLValue") & 1) == 0)
  {
    objc_msgSend(v13, "colorWithAlphaComponent:", 0.4);
    v14 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v14;
  }
  objc_msgSend(v11, "_flatImageWithColor:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

@end
