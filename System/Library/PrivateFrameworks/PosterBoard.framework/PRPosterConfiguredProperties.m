@implementation PRPosterConfiguredProperties

id __81__PRPosterConfiguredProperties_PBFAdditions__pbf_configuredPropertiesForPreview___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  PRSWidgetIdentifierForPreviewAndComplicationLookupInfo(*(void **)(a1 + 32), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = *(void **)(a1 + 40);
    objc_msgSend(v3, "suggestedComplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "proactiveRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v7, v4);

  }
  objc_msgSend(MEMORY[0x1E0D7F738], "pbf_PRSWidgetFromComplicationLookupInfo:uniqueIdentifier:intent:", v3, v4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __81__PRPosterConfiguredProperties_PBFAdditions__pbf_configuredPropertiesForPreview___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  PRSWidgetIdentifierForPreviewAndComplicationLookupInfo(*(void **)(a1 + 32), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = *(void **)(a1 + 40);
    objc_msgSend(v3, "suggestedComplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "proactiveRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v7, v4);

  }
  objc_msgSend(MEMORY[0x1E0D7F738], "pbf_PRSWidgetFromComplicationLookupInfo:uniqueIdentifier:intent:", v3, v4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
