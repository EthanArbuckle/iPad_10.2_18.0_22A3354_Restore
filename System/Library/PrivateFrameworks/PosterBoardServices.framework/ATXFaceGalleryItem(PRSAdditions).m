@implementation ATXFaceGalleryItem(PRSAdditions)

- (id)initWithPosterBoardRepresentation:()PRSAdditions
{
  id v4;
  id v5;
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
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  objc_super v29;

  v4 = a3;
  v29.receiver = a1;
  v29.super_class = (Class)&off_1EE78AD48;
  v5 = objc_msgSendSuper2(&v29, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIdentifier:", v6);

    objc_msgSend(v4, "descriptorIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDescriptorIdentifier:", v7);

    objc_msgSend(v4, "extensionBundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setExtensionBundleIdentifier:", v8);

    objc_msgSend(v4, "displayNameLocalizationKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDisplayNameLocalizationKey:", v9);

    objc_msgSend(v4, "spokenNameLocalizationKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSpokenNameLocalizationKey:", v10);

    objc_msgSend(v4, "descriptiveTextLocalizationKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDescriptiveTextLocalizationKey:", v11);

    objc_msgSend(v4, "localizedDisplayName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLocalizedDisplayName:", v12);

    objc_msgSend(v4, "localizedSubtitle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLocalizedSubtitle:", v13);

    objc_msgSend(v4, "titleFontName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitleFontName:", v14);

    objc_msgSend(v4, "titleColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitleColor:", v15);

    objc_msgSend(v4, "subtitleComplication");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "proactiveRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSubtitleComplication:", v17);

    v18 = objc_msgSend(v4, "layoutType");
    if ((unint64_t)(v18 - 1) >= 4)
      v19 = 0;
    else
      v19 = v18;
    objc_msgSend(v5, "setLayoutType:", v19);
    objc_msgSend(v4, "modeSemanticType");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setModeSemanticType:", v20);

    objc_msgSend(v4, "modeUUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setModeUUID:", v21);

    objc_msgSend(v4, "complications");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bs_map:", &__block_literal_global_5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setComplications:", v23);

    objc_msgSend(v4, "landscapeComplications");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bs_map:", &__block_literal_global_4_0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLandscapeComplications:", v25);

    objc_msgSend(v5, "setBlankTemplate:", objc_msgSend(v4, "isBlankTemplate"));
    objc_msgSend(v5, "setShouldShowAsShuffleStack:", objc_msgSend(v4, "shouldShowAsShuffleStack"));
    v26 = objc_msgSend(v4, "source");
    if ((unint64_t)(v26 - 1) >= 6)
      v27 = 0;
    else
      v27 = v26;
    objc_msgSend(v5, "setSource:", v27);
  }

  return v5;
}

- (PRSPosterGalleryItem)posterBoardRepresentation
{
  return -[PRSPosterGalleryItem initWithProactiveRepresentation:]([PRSPosterGalleryItem alloc], "initWithProactiveRepresentation:", a1);
}

@end
