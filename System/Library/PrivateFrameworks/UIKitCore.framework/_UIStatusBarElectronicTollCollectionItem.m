@implementation _UIStatusBarElectronicTollCollectionItem

- (id)indicatorEntryKey
{
  return CFSTR("electronicTollCollectionEntry");
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
  void *v14;
  uint64_t v15;
  void *v16;

  v3 = a3;
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "electronicTollCollectionEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB34D0];
  _UIKitResourceBundlePath(CFSTR("CarPlayArtwork.bundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleWithPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "styleAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImage imageNamed:inBundle:compatibleWithTraitCollection:](UIImage, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("Black_JapanETC"), v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "imageWithRenderingMode:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "styleAttributes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "imageTintColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "BOOLValue") & 1) == 0)
  {
    objc_msgSend(v14, "colorWithAlphaComponent:", 0.4);
    v15 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v15;
  }
  objc_msgSend(v12, "_flatImageWithColor:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

@end
