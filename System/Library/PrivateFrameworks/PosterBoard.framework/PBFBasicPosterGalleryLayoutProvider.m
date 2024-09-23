@implementation PBFBasicPosterGalleryLayoutProvider

- (void)fetchGalleryLayoutWithCompletion:(id)a3
{
  PBFBasicPosterGalleryLayoutProvider *v4;
  void *v5;
  int v6;
  PRSPosterGalleryLayout *v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(id, id, _QWORD);
  _QWORD v12[5];

  v11 = (void (**)(id, id, _QWORD))a3;
  v4 = self;
  objc_sync_enter(v4);
  if (v4->_galleryLayout
    && (objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isEqual:", v4->_locale),
        v5,
        v6))
  {
    v7 = v4->_galleryLayout;
  }
  else
  {
    -[NSDictionary allKeys](v4->_posterDescriptorsByExtensionBundleIdentifier, "allKeys", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sortedArrayUsingSelector:", sel_localizedCompare_);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __72__PBFBasicPosterGalleryLayoutProvider_fetchGalleryLayoutWithCompletion___block_invoke;
    v12[3] = &unk_1E86F5900;
    v12[4] = v4;
    objc_msgSend(v9, "bs_mapNoNulls:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (PRSPosterGalleryLayout *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7F690]), "initWithSections:locale:", v10, v4->_locale);
    objc_storeStrong((id *)&v4->_galleryLayout, v7);

  }
  objc_sync_exit(v4);

  v11[2](v11, v7, 0);
}

id __72__PBFBasicPosterGalleryLayoutProvider_fetchGalleryLayoutWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _BOOL8 v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;

  v3 = (objc_class *)MEMORY[0x1E0CA5848];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithBundleIdentifier:error:", v4, 0);
  v6 = objc_alloc(MEMORY[0x1E0CB34D0]);
  objc_msgSend(v5, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "_initUniqueWithURL:", v7);

  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fontName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D01710], "blackColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __72__PBFBasicPosterGalleryLayoutProvider_fetchGalleryLayoutWithCompletion___block_invoke_2;
  v22[3] = &unk_1E86F58D8;
  v13 = v8;
  v23 = v13;
  v14 = v10;
  v24 = v14;
  v15 = v11;
  v25 = v15;
  objc_msgSend(v12, "bs_map:", v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "count"))
  {
    v17 = (unint64_t)objc_msgSend(v16, "count") > 2;
    v18 = objc_alloc(MEMORY[0x1E0D7F698]);
    objc_msgSend(v5, "localizedName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithType:localizedTitle:localizedSubtitle:localizedDescriptiveText:symbolImageName:symbolColorName:unityDescription:items:", v17, v19, 0, 0, 0, 0, 0, v16);

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

id __72__PBFBasicPosterGalleryLayoutProvider_fetchGalleryLayoutWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  uint64_t v15;

  v3 = a2;
  objc_msgSend(v3, "extensionBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("'%@'-'%@'"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "galleryOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "displayNameLocalizationKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "localizedStringForKey:value:table:", v8, 0, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = &stru_1E86FC5B8;
  if (v9)
    v11 = (__CFString *)v9;
  v12 = v11;

  LOWORD(v15) = 0;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7F680]), "initWithIdentifier:descriptorIdentifier:extensionBundleIdentifier:displayNameLocalizationKey:spokenNameLocalizationKey:descriptiveTextLocalizationKey:localizedDisplayName:localizedSubtitle:titleFontName:titleColor:subtitleComplication:layoutType:modeSemanticType:modeUUID:complications:landscapeComplications:blankTemplate:shouldShowAsShuffleStack:source:", v6, v5, v4, 0, 0, 0, v12, 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, 0, 0, 0,
                  0,
                  0,
                  v15,
                  0);

  return v13;
}

- (void)handlePosterDescriptorsDidChange:(id)a3 withCompletion:(id)a4
{
  id v6;
  PBFBasicPosterGalleryLayoutProvider *v7;
  uint64_t v8;
  NSDictionary *posterDescriptorsByExtensionBundleIdentifier;
  uint64_t v10;
  NSLocale *locale;
  PRSPosterGalleryLayout *galleryLayout;
  id v13;

  v13 = a3;
  v6 = a4;
  (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
  v7 = self;
  objc_sync_enter(v7);
  if ((objc_msgSend(v13, "isEqualToDictionary:", v7->_posterDescriptorsByExtensionBundleIdentifier) & 1) == 0)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:copyItems:", v13, 1);
    posterDescriptorsByExtensionBundleIdentifier = v7->_posterDescriptorsByExtensionBundleIdentifier;
    v7->_posterDescriptorsByExtensionBundleIdentifier = (NSDictionary *)v8;

    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v10 = objc_claimAutoreleasedReturnValue();
    locale = v7->_locale;
    v7->_locale = (NSLocale *)v10;

    galleryLayout = v7->_galleryLayout;
    v7->_galleryLayout = 0;

  }
  objc_sync_exit(v7);

  (*((void (**)(id, uint64_t, _QWORD))v6 + 2))(v6, 1, 0);
}

- (BOOL)wantsFetchGalleryLayoutAfterHandlePosterDescriptorsDidChange
{
  return 1;
}

- (NSDictionary)posterDescriptorsByExtensionBundleIdentifier
{
  return self->_posterDescriptorsByExtensionBundleIdentifier;
}

- (void)setPosterDescriptorsByExtensionBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (PRSPosterGalleryLayout)galleryLayout
{
  return self->_galleryLayout;
}

- (void)setGalleryLayout:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_galleryLayout, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_posterDescriptorsByExtensionBundleIdentifier, 0);
}

@end
