@implementation PBFPosterConfigurationGalleryPreview

- (PBFPosterConfigurationGalleryPreview)initWithConfiguration:(id)a3 extension:(id)a4
{
  id v8;
  id v9;
  id v10;
  PBFPosterConfigurationGalleryPreview *v11;
  PBFPosterConfigurationGalleryPreview *v12;
  void *v13;
  uint64_t v14;
  NSString *previewUniqueIdentifier;
  uint64_t v16;
  PRPosterTitleStyleConfiguration *titleStyleConfiguration;
  void *v18;
  uint64_t v19;
  NSString *displayNameLocalizationKey;
  void *v21;
  uint64_t v22;
  PBFPosterDescriptorLookupInfo *posterDescriptorLookupInfo;
  void *v24;
  uint64_t v25;
  NSString *galleryLocalizedTitle;
  NSString *galleryLocalizedDescription;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  PBFComplicationLookupInfo *subtitleComplication;
  void *v33;
  uint64_t v34;
  NSArray *suggestedComplications;
  void *v36;
  uint64_t v37;
  NSArray *suggestedLandscapeComplications;
  void *v40;
  void *v41;
  objc_super v42;

  v8 = a3;
  v9 = a4;
  v10 = v8;
  NSClassFromString(CFSTR("PRPosterConfiguration"));
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterConfigurationGalleryPreview initWithConfiguration:extension:].cold.1(a2);
LABEL_17:
    objc_msgSend(objc_retainAutorelease(v40), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA84D90);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRPosterConfigurationClass]"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterConfigurationGalleryPreview initWithConfiguration:extension:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v41), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA84DF4);
  }

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("extension"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterConfigurationGalleryPreview initWithConfiguration:extension:].cold.2(a2);
    goto LABEL_17;
  }
  v42.receiver = self;
  v42.super_class = (Class)PBFPosterConfigurationGalleryPreview;
  v11 = -[PBFPosterConfigurationGalleryPreview init](&v42, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_configuration, a3);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = objc_claimAutoreleasedReturnValue();
    previewUniqueIdentifier = v12->_previewUniqueIdentifier;
    v12->_previewUniqueIdentifier = (NSString *)v14;

    objc_storeStrong((id *)&v12->_type, PBFPreviewTypeDefault);
    objc_msgSend(v10, "loadTitleStyleConfigurationWithError:", 0);
    v16 = objc_claimAutoreleasedReturnValue();
    titleStyleConfiguration = v12->_titleStyleConfiguration;
    v12->_titleStyleConfiguration = (PRPosterTitleStyleConfiguration *)v16;

    objc_msgSend(v10, "loadOtherMetadataWithError:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "displayNameLocalizationKey");
    v19 = objc_claimAutoreleasedReturnValue();
    displayNameLocalizationKey = v12->_displayNameLocalizationKey;
    v12->_displayNameLocalizationKey = (NSString *)v19;

    objc_msgSend(v10, "_path");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[PBFGenericPosterDescriptorLookupInfo posterDescriptorLookupInfoForPath:extension:](PBFGenericPosterDescriptorLookupInfo, "posterDescriptorLookupInfoForPath:extension:", v21, v9);
    v22 = objc_claimAutoreleasedReturnValue();
    posterDescriptorLookupInfo = v12->_posterDescriptorLookupInfo;
    v12->_posterDescriptorLookupInfo = (PBFPosterDescriptorLookupInfo *)v22;

    objc_msgSend(v9, "localizedName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "copy");
    galleryLocalizedTitle = v12->_galleryLocalizedTitle;
    v12->_galleryLocalizedTitle = (NSString *)v25;

    galleryLocalizedDescription = v12->_galleryLocalizedDescription;
    v12->_galleryLocalizedDescription = 0;

    v12->_galleryDisplayStyle = 0;
    objc_msgSend(v10, "loadComplicationLayoutWithError:", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "inlineComplication");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend(v28, "inlineComplication");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "pbf_complicationLookupInfo");
      v31 = objc_claimAutoreleasedReturnValue();
      subtitleComplication = v12->_subtitleComplication;
      v12->_subtitleComplication = (PBFComplicationLookupInfo *)v31;

    }
    objc_msgSend(v28, "complications");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "bs_map:", &__block_literal_global_18);
    v34 = objc_claimAutoreleasedReturnValue();
    suggestedComplications = v12->_suggestedComplications;
    v12->_suggestedComplications = (NSArray *)v34;

    objc_msgSend(v28, "sidebarComplications");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "bs_map:", &__block_literal_global_14);
    v37 = objc_claimAutoreleasedReturnValue();
    suggestedLandscapeComplications = v12->_suggestedLandscapeComplications;
    v12->_suggestedLandscapeComplications = (NSArray *)v37;

  }
  return v12;
}

uint64_t __72__PBFPosterConfigurationGalleryPreview_initWithConfiguration_extension___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pbf_complicationLookupInfo");
}

uint64_t __72__PBFPosterConfigurationGalleryPreview_initWithConfiguration_extension___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pbf_complicationLookupInfo");
}

- (NSString)previewUniqueIdentifier
{
  return self->_previewUniqueIdentifier;
}

- (NSString)displayNameLocalizationKey
{
  return self->_displayNameLocalizationKey;
}

- (NSString)galleryLocalizedTitle
{
  return self->_galleryLocalizedTitle;
}

- (NSString)galleryLocalizedDescription
{
  return self->_galleryLocalizedDescription;
}

- (PBFPosterDescriptorLookupInfo)posterDescriptorLookupInfo
{
  return self->_posterDescriptorLookupInfo;
}

- (PRPosterTitleStyleConfiguration)titleStyleConfiguration
{
  return self->_titleStyleConfiguration;
}

- (PBFComplicationLookupInfo)subtitleComplication
{
  return self->_subtitleComplication;
}

- (NSArray)suggestedComplications
{
  return self->_suggestedComplications;
}

- (NSArray)suggestedLandscapeComplications
{
  return self->_suggestedLandscapeComplications;
}

- (NSString)complicationLayoutType
{
  return self->_complicationLayoutType;
}

- (PRPosterHomeScreenConfiguration)homeScreenConfiguration
{
  return self->_homeScreenConfiguration;
}

- (PRPosterFocusConfiguration)focusConfiguration
{
  return self->_focusConfiguration;
}

- (PRPosterRenderingConfiguration)renderingConfiguration
{
  return self->_renderingConfiguration;
}

- (NSString)type
{
  return self->_type;
}

- (PBFGalleryOptions)galleryOptions
{
  return self->_galleryOptions;
}

- (unint64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (unint64_t)galleryDisplayStyle
{
  return self->_galleryDisplayStyle;
}

- (PRPosterConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_galleryOptions, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_renderingConfiguration, 0);
  objc_storeStrong((id *)&self->_focusConfiguration, 0);
  objc_storeStrong((id *)&self->_homeScreenConfiguration, 0);
  objc_storeStrong((id *)&self->_complicationLayoutType, 0);
  objc_storeStrong((id *)&self->_suggestedLandscapeComplications, 0);
  objc_storeStrong((id *)&self->_suggestedComplications, 0);
  objc_storeStrong((id *)&self->_subtitleComplication, 0);
  objc_storeStrong((id *)&self->_titleStyleConfiguration, 0);
  objc_storeStrong((id *)&self->_posterDescriptorLookupInfo, 0);
  objc_storeStrong((id *)&self->_galleryLocalizedDescription, 0);
  objc_storeStrong((id *)&self->_galleryLocalizedTitle, 0);
  objc_storeStrong((id *)&self->_displayNameLocalizationKey, 0);
  objc_storeStrong((id *)&self->_previewUniqueIdentifier, 0);
}

- (void)initWithConfiguration:(const char *)a1 extension:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithConfiguration:(const char *)a1 extension:.cold.2(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
