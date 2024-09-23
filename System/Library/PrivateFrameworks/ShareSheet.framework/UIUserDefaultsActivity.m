@implementation UIUserDefaultsActivity

void __41___UIUserDefaultsActivity__activityImage__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0DC3E88];
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v3 = (void *)MEMORY[0x1E0DC3E88];
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollectionWithUserInterfaceIdiom:", objc_msgSend(v4, "userInterfaceIdiom"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "traitCollectionWithTraitsFromCollections:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0DC3870];
  _ShareSheetBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("UIActivityUserDefaults"), v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIActivity _activityImageForActionRepresentationImage:](UIActivity, "_activityImageForActionRepresentationImage:", v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)_activityImage___image;
  _activityImage___image = v11;

}

@end
