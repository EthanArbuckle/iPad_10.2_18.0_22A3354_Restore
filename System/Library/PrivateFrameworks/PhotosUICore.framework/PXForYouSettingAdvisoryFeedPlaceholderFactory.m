@implementation PXForYouSettingAdvisoryFeedPlaceholderFactory

- (id)createPlaceholderViewForFeedWithViewModel:(id)a3
{
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

  objc_msgSend(MEMORY[0x1E0DC3698], "px_containerized_defaultConfiguration", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("eye.slash"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v4);

  PXLocalizedStringFromTable(CFSTR("SHOW_FEATURED_CONTENT_SETTING_ADVISORY_TITLE"), CFSTR("PhotosUICore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v5);

  PXLocalizedStringFromTable(CFSTR("SHOW_FEATURED_CONTENT_SETTING_ADVISORY_SUBTITLE"), CFSTR("PhotosUICore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSecondaryText:", v6);

  PXLocalizedStringFromTable(CFSTR("SHOW_FEATURED_CONTENT_SETTING_ADVISORY_ACTION"), CFSTR("PhotosUICore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "buttonProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitle:", v7);

  objc_msgSend(MEMORY[0x1E0DC3428], "actionWithHandler:", &__block_literal_global_30765);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "buttonProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPrimaryAction:", v10);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC36B0]), "initWithConfiguration:", v3);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBackgroundColor:", v13);

  objc_msgSend(v12, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCornerRadius:", 10.0);

  return v12;
}

- (BOOL)supportsDynamicPlaceholderContentSize
{
  return 1;
}

uint64_t __91__PXForYouSettingAdvisoryFeedPlaceholderFactory_createPlaceholderViewForFeedWithViewModel___block_invoke()
{
  return +[PXSystemNavigation navigateToDestination:completion:](PXSystemNavigation, "navigateToDestination:completion:", 7, 0);
}

@end
