@implementation PUPhotoEditTopToolbarButtonConfig

+ (id)imageConfigurationForSelectedState:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void **v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  _QWORD v18[2];

  v3 = a3;
  v18[1] = *MEMORY[0x1E0C80C00];
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(v4, "topToolbarToolButtonGlyphSize");
  objc_msgSend(v5, "configurationWithPointSize:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v7 = 5;
  else
    v7 = 4;
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithWeight:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0DC3888];
  if (v3)
  {
    objc_msgSend(v4, "photoEditingToolbarButtonSelectedColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v10;
    v11 = (void **)v18;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v10;
    v11 = &v17;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configurationWithPaletteColors:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "configurationByApplyingConfiguration:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "configurationByApplyingConfiguration:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)unselectedConfiguration
{
  return (id)objc_msgSend(a1, "imageConfigurationForSelectedState:", 0);
}

+ (id)selectedConfiguration
{
  return (id)objc_msgSend(a1, "imageConfigurationForSelectedState:", 1);
}

@end
