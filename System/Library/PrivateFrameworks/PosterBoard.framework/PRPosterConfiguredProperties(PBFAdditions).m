@implementation PRPosterConfiguredProperties(PBFAdditions)

+ (id)pbf_configuredPropertiesForPreview:()PBFAdditions
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;

  v3 = a3;
  objc_msgSend(v3, "titleStyleConfiguration");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "suggestedComplications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __81__PRPosterConfiguredProperties_PBFAdditions__pbf_configuredPropertiesForPreview___block_invoke;
  v44[3] = &unk_1E86F4CF8;
  v7 = v3;
  v45 = v7;
  v8 = v4;
  v46 = v8;
  objc_msgSend(v5, "bs_mapNoNulls:", v44);
  v9 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "suggestedLandscapeComplications");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v6;
  v41[1] = 3221225472;
  v41[2] = __81__PRPosterConfiguredProperties_PBFAdditions__pbf_configuredPropertiesForPreview___block_invoke_2;
  v41[3] = &unk_1E86F4CF8;
  v11 = v7;
  v42 = v11;
  v12 = v8;
  v43 = v12;
  objc_msgSend(v10, "bs_mapNoNulls:", v41);
  v13 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "subtitleComplication");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  PRSWidgetIdentifierForPreviewAndComplicationLookupInfo(v11, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v11, "subtitleComplication");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "suggestedComplication");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "proactiveRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v18, v15);

  }
  v19 = (void *)MEMORY[0x1E0D7F738];
  objc_msgSend(v11, "subtitleComplication");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "pbf_PRSWidgetFromComplicationLookupInfo:uniqueIdentifier:intent:", v20, v15, 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FAC8]), "initWithInlineComplication:sidebarComplications:complications:", v39, v13, v9);
  objc_msgSend(v11, "homeScreenConfiguration");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "focusConfiguration");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "renderingConfiguration");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_alloc(MEMORY[0x1E0D7FB78]);
  objc_msgSend(v11, "galleryOptions");
  v38 = (void *)v9;
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "suggestedGalleryItem");
  v26 = v12;
  v37 = v12;
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v35 = (void *)v13;
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v24, "initWithSuggestedGalleryItem:suggestedComplicationsByIdentifier:lastModifiedDate:", v27, v26, v28);

  v30 = objc_alloc(MEMORY[0x1E0D7FB38]);
  objc_msgSend(v11, "displayNameLocalizationKey");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v30, "initWithDisplayNameLocalizationKey:", v31);

  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FAE0]), "initWithTitleStyleConfiguration:focusConfiguration:complicationLayout:renderingConfiguration:homeScreenConfiguration:colorVariationsConfiguration:quickActionsConfiguration:suggestionMetadata:otherMetadata:", v40, v22, v36, v23, v21, 0, 0, v29, v32);
  return v33;
}

@end
