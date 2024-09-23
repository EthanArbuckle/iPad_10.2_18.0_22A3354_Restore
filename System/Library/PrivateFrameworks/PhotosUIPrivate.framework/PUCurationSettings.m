@implementation PUCurationSettings

- (void)setDefaultValues
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PUCurationSettings;
  -[PTSettings setDefaultValues](&v2, sel_setDefaultValues);
}

+ (id)settingsControllerModule
{
  void *v2;
  void *v3;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[7];
  void *v38;
  void *v39;
  _QWORD v40[4];
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[3];

  v44[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83010], "pu_rowWithTitle:action:", CFSTR("isUtility Comparison"), &__block_literal_global_9104);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0D83078];
  v44[0] = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:", v3);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83010], "pu_rowWithTitle:action:", CFSTR("Tragic Failures in Highlights"), &__block_literal_global_147);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D83078];
  v43 = v35;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionWithRows:", v5);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83010], "pu_rowWithTitle:action:", CFSTR("Asset Score Check"), &__block_literal_global_153);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D83078];
  v42 = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionWithRows:", v7);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83010], "pu_rowWithTitle:action:", CFSTR("Behavioral Curation 🏅 and 💎 assets"), &__block_literal_global_161);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0D83078];
  v41 = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sectionWithRows:", v9);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83010], "pu_rowWithTitle:action:", CFSTR("Action Signals"), &__block_literal_global_167);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83010], "pu_rowWithTitle:action:", CFSTR("Asset Score Signals"), &__block_literal_global_171);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83010], "pu_rowWithTitle:action:", CFSTR("Classification Signals"), &__block_literal_global_175);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83010], "pu_rowWithTitle:action:", CFSTR("Import Source Check"), &__block_literal_global_179);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0D83078];
  v40[0] = v29;
  v40[1] = v28;
  v40[2] = v27;
  v40[3] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sectionWithRows:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83010], "pu_rowWithTitle:action:", CFSTR("Trip Key Asset"), &__block_literal_global_185);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0D83078];
  v39 = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sectionWithRows:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83010], "pu_rowWithTitle:action:", CFSTR("Collection Relevancy"), &__block_literal_global_189);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0D83078];
  v38 = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sectionWithRows:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0D83078];
  v37[0] = v33;
  v37[1] = v31;
  v37[2] = v30;
  v37[3] = v12;
  v37[4] = v26;
  v37[5] = v15;
  v37[6] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "moduleWithTitle:contents:", CFSTR("Curation Settings"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

void __50__PUCurationSettings_UI__settingsControllerModule__block_invoke_10(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = a2;
  +[PUCollectionRelevancyDebugViewControllerFactory viewController](PUCollectionRelevancyDebugViewControllerFactory, "viewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", CFSTR("Collection Relevancy"));

  objc_msgSend(v2, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "pushViewController:animated:", v5, 1);
}

void __50__PUCurationSettings_UI__settingsControllerModule__block_invoke_9(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  PUCurationTripKeyAssetDebugViewController *v5;

  v2 = a2;
  v5 = objc_alloc_init(PUCurationTripKeyAssetDebugViewController);
  -[PUCurationTripKeyAssetDebugViewController navigationItem](v5, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", CFSTR("Trip Key Asset"));

  objc_msgSend(v2, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "pushViewController:animated:", v5, 1);
}

void __50__PUCurationSettings_UI__settingsControllerModule__block_invoke_8(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  PUCurationImportSourceBrowserDebugViewController *v5;

  v2 = a2;
  v5 = -[PUCurationImportSourceBrowserDebugViewController initWithStyle:]([PUCurationImportSourceBrowserDebugViewController alloc], "initWithStyle:", 0);
  -[PUCurationImportSourceBrowserDebugViewController navigationItem](v5, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", CFSTR("Import Source Browser"));

  objc_msgSend(v2, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "pushViewController:animated:", v5, 1);
}

void __50__PUCurationSettings_UI__settingsControllerModule__block_invoke_7(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  PUCurationClassificationSignalBrowserDebugViewController *v5;

  v2 = a2;
  v5 = -[PUCurationClassificationSignalBrowserDebugViewController initWithStyle:]([PUCurationClassificationSignalBrowserDebugViewController alloc], "initWithStyle:", 0);
  -[PUCurationClassificationSignalBrowserDebugViewController navigationItem](v5, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", CFSTR("Classification Signals"));

  objc_msgSend(v2, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "pushViewController:animated:", v5, 1);
}

void __50__PUCurationSettings_UI__settingsControllerModule__block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  PUCurationSignalBrowserViewController *v5;

  v2 = a2;
  v5 = -[PUCurationSignalBrowserViewController initWithStyle:]([PUCurationSignalBrowserViewController alloc], "initWithStyle:", 0);
  -[PUCurationSignalBrowserViewController navigationItem](v5, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", CFSTR("Asset Score Signals"));

  objc_msgSend(v2, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "pushViewController:animated:", v5, 1);
}

void __50__PUCurationSettings_UI__settingsControllerModule__block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  PUCurationActionSignalBrowserViewController *v5;

  v2 = a2;
  v5 = -[PUCurationActionSignalBrowserViewController initWithStyle:]([PUCurationActionSignalBrowserViewController alloc], "initWithStyle:", 0);
  -[PUCurationActionSignalBrowserViewController navigationItem](v5, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", CFSTR("Action Signals"));

  objc_msgSend(v2, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "pushViewController:animated:", v5, 1);
}

void __50__PUCurationSettings_UI__settingsControllerModule__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  PUBehavioralCurationCheckAssetBrowserDebugViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PUBehavioralCurationCheckAssetBrowserDebugViewController *v10;

  v2 = a2;
  objc_msgSend(v2, "px_extendedTraitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInterfaceIdiom");
  objc_opt_class();

  v4 = [PUBehavioralCurationCheckAssetBrowserDebugViewController alloc];
  v5 = (void *)objc_opt_new();
  v10 = -[PUPhotosAlbumViewController initWithSpec:](v4, "initWithSpec:", v5);

  -[PUBehavioralCurationCheckAssetBrowserDebugViewController navigationItem](v10, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", CFSTR("Behavioral Curation Score Check"));

  -[PUBehavioralCurationCheckAssetBrowserDebugViewController navigationItem](v10, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "searchController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActive:", 0);

  objc_msgSend(v2, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "pushViewController:animated:", v10, 1);
}

void __50__PUCurationSettings_UI__settingsControllerModule__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  PUCurationScoreCheckAssetBrowserDebugViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PUCurationScoreCheckAssetBrowserDebugViewController *v10;

  v2 = a2;
  objc_msgSend(v2, "px_extendedTraitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInterfaceIdiom");
  objc_opt_class();

  v4 = [PUCurationScoreCheckAssetBrowserDebugViewController alloc];
  v5 = (void *)objc_opt_new();
  v10 = -[PUPhotosAlbumViewController initWithSpec:](v4, "initWithSpec:", v5);

  -[PUCurationScoreCheckAssetBrowserDebugViewController navigationItem](v10, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", CFSTR("Asset Score"));

  -[PUCurationScoreCheckAssetBrowserDebugViewController navigationItem](v10, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "searchController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActive:", 0);

  objc_msgSend(v2, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "pushViewController:animated:", v10, 1);
}

void __50__PUCurationSettings_UI__settingsControllerModule__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PUCurationTragicFailureInHighlightsDebugViewController *v7;

  v2 = a2;
  v7 = -[PUCurationTragicFailureInHighlightsDebugViewController initWithStyle:]([PUCurationTragicFailureInHighlightsDebugViewController alloc], "initWithStyle:", 0);
  -[PUCurationTragicFailureInHighlightsDebugViewController navigationItem](v7, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", CFSTR("Tragic Failure in Highlights"));

  -[PUCurationTragicFailureInHighlightsDebugViewController navigationItem](v7, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActive:", 0);

  objc_msgSend(v2, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "pushViewController:animated:", v7, 1);
}

void __50__PUCurationSettings_UI__settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PUCurationUtilityComparisonBrowserDebugViewController *v7;

  v2 = a2;
  v7 = -[PUCurationUtilityComparisonBrowserDebugViewController initWithStyle:]([PUCurationUtilityComparisonBrowserDebugViewController alloc], "initWithStyle:", 0);
  -[PUCurationUtilityComparisonBrowserDebugViewController navigationItem](v7, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", CFSTR("isUtility Comparison"));

  -[PUCurationUtilityComparisonBrowserDebugViewController navigationItem](v7, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActive:", 0);

  objc_msgSend(v2, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "pushViewController:animated:", v7, 1);
}

- (id)parentSettings
{
  return +[PURootSettings sharedInstance](PURootSettings, "sharedInstance");
}

+ (PUCurationSettings)sharedInstance
{
  if (sharedInstance_onceToken_93529 != -1)
    dispatch_once(&sharedInstance_onceToken_93529, &__block_literal_global_93530);
  return (PUCurationSettings *)(id)sharedInstance_sharedInstance_93531;
}

void __36__PUCurationSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PURootSettings sharedInstance](PURootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "curation");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_93531;
  sharedInstance_sharedInstance_93531 = v0;

}

@end
