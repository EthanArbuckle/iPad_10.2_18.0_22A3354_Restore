@implementation UIImage

void __38__UIImage_MTAdditions__nowPlayingIcon__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:", CFSTR("Equalizer"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageFlippedForRightToLeftLayoutDirection");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageWithRenderingMode:", 2);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)nowPlayingIcon_templateNowPlayingIcon;
  nowPlayingIcon_templateNowPlayingIcon = v1;

}

void __44__UIImage_MTAdditions__nowPlayingIconPaused__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:", CFSTR("Equalizer_Paused"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageFlippedForRightToLeftLayoutDirection");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageWithRenderingMode:", 2);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)nowPlayingIconPaused_templateNowPlayingIcon;
  nowPlayingIconPaused_templateNowPlayingIcon = v1;

}

void __54__UIImage_MTAdditions__unplayedIconForDarkBackground___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:", CFSTR("Unread-Dot-Full-Stroke"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)unplayedIconForDarkBackground__strokedUnplayedIcon;
  unplayedIconForDarkBackground__strokedUnplayedIcon = v0;

}

void __56__UIImage_MTAdditions__halfPlayedIconForDarkBackground___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:", CFSTR("Unread-Dot-Half-Stroke"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)halfPlayedIconForDarkBackground__strokedHalfPlayedIcon;
  halfPlayedIconForDarkBackground__strokedHalfPlayedIcon = v0;

}

void __52__UIImage_MTAdditions__backCatalogIconForTintColor___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:", CFSTR("Unread-Dot-Full"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)backCatalogIconForTintColor__untintedIcon;
  backCatalogIconForTintColor__untintedIcon = v0;

  v2 = objc_opt_new();
  v3 = (void *)backCatalogIconForTintColor__tintedIcons;
  backCatalogIconForTintColor__tintedIcons = v2;

}

void __67__UIImage_MTAdditions__backCatalogPartiallyPlayedIconForTintColor___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:", CFSTR("Unread-Dot-Half"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)backCatalogPartiallyPlayedIconForTintColor__untintedIcon;
  backCatalogPartiallyPlayedIconForTintColor__untintedIcon = v0;

  v2 = objc_opt_new();
  v3 = (void *)backCatalogPartiallyPlayedIconForTintColor__tintedIcons;
  backCatalogPartiallyPlayedIconForTintColor__tintedIcons = v2;

}

void __38__UIImage_MTAdditions__multiCheckIcon__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:", CFSTR("SelectControlMultiCheckedImage"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithRenderingMode:", 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)multiCheckIcon_templateMultiCheckIcon;
  multiCheckIcon_templateMultiCheckIcon = v0;

}

void __40__UIImage_MTAdditions__multiUncheckIcon__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:", CFSTR("SelectControlMultiNotCheckedImage"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithRenderingMode:", 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)multiUncheckIcon_templateMultiUncheckIcon;
  multiUncheckIcon_templateMultiUncheckIcon = v0;

}

void __32__UIImage_MTAdditions__infoIcon__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:", CFSTR("UITableInfo"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithRenderingMode:", 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)infoIcon_templateInfoIcon;
  infoIcon_templateInfoIcon = v0;

}

@end
