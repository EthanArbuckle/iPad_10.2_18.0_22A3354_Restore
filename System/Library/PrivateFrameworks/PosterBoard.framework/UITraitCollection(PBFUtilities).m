@implementation UITraitCollection(PBFUtilities)

+ (id)pbf_traitCollectionForDisplayContext:()PBFUtilities
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
  {
    +[PBFGenericDisplayContext mainScreen](PBFGenericDisplayContext, "mainScreen");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v3, "pbf_accessibilityContrast") == -1)
    v4 = 0;
  else
    v4 = UIAccessibilityContrastFromPBFAccessibilityContrast(objc_msgSend(v3, "pbf_accessibilityContrast"));
  if (objc_msgSend(v3, "pbf_userInterfaceStyle"))
    v5 = UIUserInterfaceStyleFromPBFUserInterfaceStyle(objc_msgSend(v3, "pbf_userInterfaceStyle"));
  else
    v5 = 1;
  objc_msgSend(v3, "pbf_interfaceOrientation");
  v6 = 1;
  if (BSInterfaceOrientationIsLandscape())
    v7 = 2;
  else
    v7 = 1;
  objc_msgSend(v3, "pbf_interfaceOrientation");
  if (!BSInterfaceOrientationIsLandscape())
    v6 = 2;
  v8 = (void *)MEMORY[0x1E0DC3E88];
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithAccessibilityContrast:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v10;
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithHorizontalSizeClass:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v11;
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithVerticalSizeClass:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "traitCollectionWithTraitsFromCollections:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
