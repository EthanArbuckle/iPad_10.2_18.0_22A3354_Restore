@implementation PBFGenericPosterPreview

+ (id)posterPreviewWithUniqueIdentifier:(id)a3 displayNameLocalizationKey:(id)a4 galleryLocalizedTitle:(id)a5 galleryLocalizedDescription:(id)a6 posterDescriptorLookupInfo:(id)a7 titleStyleConfiguration:(id)a8 focusConfiguration:(id)a9 subtitleComplication:(id)a10 suggestedComplications:(id)a11 suggestedLandscapeComplications:(id)a12 complicationLayoutType:(id)a13 renderingConfiguration:(id)a14 homeScreenConfiguration:(id)a15 previewType:(id)a16 galleryOptions:(id)a17
{
  NSString *v22;
  PBFPosterDescriptorLookupInfo *v23;
  NSString *v24;
  PBFComplicationLookupInfo *v25;
  NSArray *v26;
  NSArray *v27;
  NSString *v28;
  PRPosterHomeScreenConfiguration *v29;
  PBFGenericPosterPreview *v30;
  NSString *previewUniqueIdentifier;
  uint64_t v32;
  NSString *displayNameLocalizationKey;
  uint64_t v34;
  NSString *galleryLocalizedTitle;
  uint64_t v36;
  NSString *galleryLocalizedDescription;
  PBFPosterDescriptorLookupInfo *posterDescriptorLookupInfo;
  uint64_t v39;
  PRPosterTitleStyleConfiguration *titleStyleConfiguration;
  uint64_t v41;
  PRPosterFocusConfiguration *focusConfiguration;
  PBFComplicationLookupInfo *subtitleComplication;
  NSArray *suggestedComplications;
  NSArray *v45;
  NSArray *suggestedLandscapeComplications;
  NSArray *v47;
  NSString *complicationLayoutType;
  NSString *v49;
  uint64_t v50;
  PRPosterRenderingConfiguration *renderingConfiguration;
  PRPosterHomeScreenConfiguration *homeScreenConfiguration;
  PRPosterHomeScreenConfiguration *v53;
  uint64_t v54;
  void *v55;
  __CFString *v56;
  PBFGalleryOptions *galleryOptions;
  void *v59;
  void *v60;
  PBFComplicationLookupInfo *v63;
  PBFPosterDescriptorLookupInfo *v64;
  NSString *v65;
  PBFGalleryOptions *v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;

  v22 = (NSString *)a3;
  v73 = a4;
  v72 = a5;
  v71 = a6;
  v23 = (PBFPosterDescriptorLookupInfo *)a7;
  v70 = a8;
  v69 = a9;
  v24 = v22;
  v25 = (PBFComplicationLookupInfo *)a10;
  v26 = (NSArray *)a11;
  v27 = (NSArray *)a12;
  v28 = (NSString *)a13;
  v68 = a14;
  v29 = (PRPosterHomeScreenConfiguration *)a15;
  v67 = a16;
  v66 = (PBFGalleryOptions *)a17;
  if (v22)
  {
    if (v23)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PBFPosterPreview.m"), 210, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("previewUniqueIdentifier"));

    if (v23)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PBFPosterPreview.m"), 211, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("posterLookupInfo"));

LABEL_3:
  v30 = objc_alloc_init(PBFGenericPosterPreview);
  previewUniqueIdentifier = v30->_previewUniqueIdentifier;
  v30->_previewUniqueIdentifier = v24;
  v65 = v24;

  v32 = objc_msgSend(v73, "copy");
  displayNameLocalizationKey = v30->_displayNameLocalizationKey;
  v30->_displayNameLocalizationKey = (NSString *)v32;

  v34 = objc_msgSend(v72, "copy");
  galleryLocalizedTitle = v30->_galleryLocalizedTitle;
  v30->_galleryLocalizedTitle = (NSString *)v34;

  v36 = objc_msgSend(v71, "copy");
  galleryLocalizedDescription = v30->_galleryLocalizedDescription;
  v30->_galleryLocalizedDescription = (NSString *)v36;

  posterDescriptorLookupInfo = v30->_posterDescriptorLookupInfo;
  v30->_posterDescriptorLookupInfo = v23;
  v64 = v23;

  v39 = objc_msgSend(v70, "copy");
  titleStyleConfiguration = v30->_titleStyleConfiguration;
  v30->_titleStyleConfiguration = (PRPosterTitleStyleConfiguration *)v39;

  v41 = objc_msgSend(v69, "copy");
  focusConfiguration = v30->_focusConfiguration;
  v30->_focusConfiguration = (PRPosterFocusConfiguration *)v41;

  subtitleComplication = v30->_subtitleComplication;
  v30->_subtitleComplication = v25;
  v63 = v25;

  suggestedComplications = v30->_suggestedComplications;
  v30->_suggestedComplications = v26;
  v45 = v26;

  suggestedLandscapeComplications = v30->_suggestedLandscapeComplications;
  v30->_suggestedLandscapeComplications = v27;
  v47 = v27;

  complicationLayoutType = v30->_complicationLayoutType;
  v30->_complicationLayoutType = v28;
  v49 = v28;

  v50 = objc_msgSend(v68, "copy");
  renderingConfiguration = v30->_renderingConfiguration;
  v30->_renderingConfiguration = (PRPosterRenderingConfiguration *)v50;

  homeScreenConfiguration = v30->_homeScreenConfiguration;
  v30->_homeScreenConfiguration = v29;
  v53 = v29;

  v54 = objc_msgSend(v67, "copy");
  v55 = (void *)v54;
  if (v54)
    v56 = (__CFString *)v54;
  else
    v56 = PBFPreviewTypeDefault;
  objc_storeStrong((id *)&v30->_type, v56);

  galleryOptions = v30->_galleryOptions;
  v30->_galleryOptions = v66;

  *(int64x2_t *)&v30->_cachedGalleryPresentationStyle = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  return v30;
}

+ (id)testPosterPreviewWithLocalizedTitle:(id)a3 description:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PBFGenericPosterDescriptorLookupInfo nullPosterDescriptorLookupInfo](PBFGenericPosterDescriptorLookupInfo, "nullPosterDescriptorLookupInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "posterPreviewWithUniqueIdentifier:displayNameLocalizationKey:galleryLocalizedTitle:galleryLocalizedDescription:posterDescriptorLookupInfo:titleStyleConfiguration:focusConfiguration:subtitleComplication:suggestedComplications:suggestedLandscapeComplications:complicationLayoutType:renderingConfiguration:homeScreenConfiguration:previewType:galleryOptions:", v9, 0, v6, v5, v10, 0, 0, 0, 0, 0, PBFComplicationLayoutTypeEmpty, 0, 0, PBFPreviewTypeDefault, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  objc_msgSend((id)objc_opt_class(), "posterPreviewWithUniqueIdentifier:displayNameLocalizationKey:galleryLocalizedTitle:galleryLocalizedDescription:posterDescriptorLookupInfo:titleStyleConfiguration:focusConfiguration:subtitleComplication:suggestedComplications:suggestedLandscapeComplications:complicationLayoutType:renderingConfiguration:homeScreenConfiguration:previewType:galleryOptions:", self->_previewUniqueIdentifier, self->_displayNameLocalizationKey, self->_galleryLocalizedTitle, self->_galleryLocalizedDescription, self->_posterDescriptorLookupInfo, self->_titleStyleConfiguration, self->_focusConfiguration, self->_subtitleComplication, self->_suggestedComplications, self->_suggestedLandscapeComplications, self->_complicationLayoutType, self->_renderingConfiguration, self->_homeScreenConfiguration, self->_type, self->_galleryOptions);
  result = (id)objc_claimAutoreleasedReturnValue();
  *((_QWORD *)result + 1) = self->_hash;
  return result;
}

- (unint64_t)hash
{
  uint64_t hash;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  hash = self->_hash;
  if (!hash)
  {
    objc_msgSend(MEMORY[0x1E0D01788], "builder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "appendString:", self->_previewUniqueIdentifier);
    v6 = (id)objc_msgSend(v4, "appendString:", self->_displayNameLocalizationKey);
    v7 = (id)objc_msgSend(v4, "appendString:", self->_galleryLocalizedTitle);
    v8 = (id)objc_msgSend(v4, "appendString:", self->_galleryLocalizedDescription);
    v9 = (id)objc_msgSend(v4, "appendObject:", self->_posterDescriptorLookupInfo);
    v10 = (id)objc_msgSend(v4, "appendObject:", self->_titleStyleConfiguration);
    v11 = (id)objc_msgSend(v4, "appendObject:", self->_subtitleComplication);
    v12 = (id)objc_msgSend(v4, "appendObject:", self->_focusConfiguration);
    v13 = (id)objc_msgSend(v4, "appendObject:", self->_suggestedComplications);
    v14 = (id)objc_msgSend(v4, "appendObject:", self->_suggestedLandscapeComplications);
    v15 = (id)objc_msgSend(v4, "appendObject:", self->_complicationLayoutType);
    v16 = (id)objc_msgSend(v4, "appendObject:", self->_renderingConfiguration);
    v17 = (id)objc_msgSend(v4, "appendObject:", self->_homeScreenConfiguration);
    hash = objc_msgSend(v4, "hash");
    self->_hash = hash;

  }
  return hash;
}

- (BOOL)isEqual:(id)a3
{
  PBFGenericPosterPreview *v4;
  PBFGenericPosterPreview *v5;
  uint64_t v6;
  char v7;

  v4 = (PBFGenericPosterPreview *)a3;
  v5 = v4;
  if (v4 == self
    || (v6 = -[PBFGenericPosterPreview hash](v4, "hash"), v6 == -[PBFGenericPosterPreview hash](self, "hash")))
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && BSEqualObjects()
      && BSEqualObjects()
      && BSEqualObjects()
      && BSEqualObjects()
      && BSEqualObjects()
      && BSEqualObjects()
      && BSEqualObjects()
      && BSEqualObjects()
      && BSEqualObjects()
      && BSEqualObjects()
      && BSEqualObjects()
      && BSEqualObjects())
    {
      v7 = BSEqualObjects();
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFGenericPosterPreview posterDescriptorLookupInfo](self, "posterDescriptorLookupInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "posterDescriptorPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("posterDescriptorPath"));

  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (unint64_t)presentationStyle
{
  void *v3;
  char v4;
  unint64_t result;

  -[PBFGenericPosterPreview type](self, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", PBFPreviewTypeHero);

  if ((v4 & 1) != 0)
    return 1;
  result = self->_cachedGalleryPresentationStyle;
  if (result == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[PBFGenericPosterPreview _hydrateGalleryOptions](self, "_hydrateGalleryOptions");
    return self->_cachedGalleryPresentationStyle;
  }
  return result;
}

- (unint64_t)galleryDisplayStyle
{
  void *v3;
  char v4;

  -[PBFGenericPosterPreview type](self, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", PBFPreviewTypeHero);

  if ((v4 & 1) != 0)
    return 0;
  if (self->_cachedGalleryPresentationStyle == 0x7FFFFFFFFFFFFFFFLL)
    -[PBFGenericPosterPreview _hydrateGalleryOptions](self, "_hydrateGalleryOptions");
  return self->_cachedDisplayStyle;
}

- (void)_hydrateGalleryOptions
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  -[PBFGenericPosterPreview posterDescriptorLookupInfo](self, "posterDescriptorLookupInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "posterDescriptorPath");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D7FB48], "modelObjectCacheForPath:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "galleryOptions");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D7FB50], "loadPosterDescriptorGalleryOptionsForPath:error:", v7, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      self->_cachedGalleryPresentationStyle = 0;
      self->_cachedDisplayStyle = 0;
      goto LABEL_5;
    }
  }
  self->_cachedGalleryPresentationStyle = objc_msgSend(v6, "presentationStyle");
  self->_cachedDisplayStyle = objc_msgSend(v6, "displayStyle");

LABEL_5:
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

- (void).cxx_destruct
{
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

@end
