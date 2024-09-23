@implementation PBFGalleryConfiguration

- (PBFGalleryConfiguration)init
{
  PBFGalleryConfiguration *result;
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  PBFGalleryConfiguration *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;

  result = (PBFGalleryConfiguration *)os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if ((_DWORD)result)
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138413314;
    v9 = v5;
    v10 = 2112;
    v11 = v7;
    v12 = 2048;
    v13 = self;
    v14 = 2112;
    v15 = CFSTR("PBFGalleryConfiguration.m");
    v16 = 1024;
    v17 = 118;
    _os_log_error_impl(&dword_1CB9FA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %@ of <%@:%p> (%@:%i)", (uint8_t *)&v8, 0x30u);

  }
  __break(0);
  return result;
}

- (PBFGalleryConfiguration)initWithSuggestedLayout:(id)a3 dynamicDescriptorsByExtensionIdentifier:(id)a4 staticDescriptorsByExtensionIdentifier:(id)a5 extensionsByIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  PBFGalleryConfiguration *v18;
  uint64_t v19;
  PRSPosterGalleryLayout *suggestedLayout;
  uint64_t v21;
  NSDictionary *dynamicDescriptorsByExtensionIdentifier;
  uint64_t v23;
  NSDictionary *staticDescriptorsByExtensionIdentifier;
  uint64_t v25;
  NSDictionary *extensionsByIdentifier;
  uint64_t v27;
  NSMutableDictionary *posterDescriptorLookupInfoForItemIdentifier;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  objc_super v37;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v10;
  NSClassFromString(CFSTR("PRSPosterGalleryLayout"));
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFGalleryConfiguration initWithSuggestedLayout:dynamicDescriptorsByExtensionIdentifier:staticDescriptorsByExtensionIdentifier:extensionsByIdentifier:].cold.1();
LABEL_35:
    objc_msgSend(objc_retainAutorelease(v30), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA7E114);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRSPosterGalleryLayoutClass]"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFGalleryConfiguration initWithSuggestedLayout:dynamicDescriptorsByExtensionIdentifier:staticDescriptorsByExtensionIdentifier:extensionsByIdentifier:].cold.1();
    objc_msgSend(objc_retainAutorelease(v31), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA7E178);
  }

  v15 = v11;
  NSClassFromString(CFSTR("NSDictionary"));
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFGalleryConfiguration initWithSuggestedLayout:dynamicDescriptorsByExtensionIdentifier:staticDescriptorsByExtensionIdentifier:extensionsByIdentifier:].cold.2();
    objc_msgSend(objc_retainAutorelease(v32), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA7E1DCLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSDictionaryClass]"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFGalleryConfiguration initWithSuggestedLayout:dynamicDescriptorsByExtensionIdentifier:staticDescriptorsByExtensionIdentifier:extensionsByIdentifier:].cold.2();
    objc_msgSend(objc_retainAutorelease(v33), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA7E240);
  }

  v16 = v12;
  NSClassFromString(CFSTR("NSDictionary"));
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFGalleryConfiguration initWithSuggestedLayout:dynamicDescriptorsByExtensionIdentifier:staticDescriptorsByExtensionIdentifier:extensionsByIdentifier:].cold.3();
    objc_msgSend(objc_retainAutorelease(v34), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA7E2A4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSDictionaryClass]"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFGalleryConfiguration initWithSuggestedLayout:dynamicDescriptorsByExtensionIdentifier:staticDescriptorsByExtensionIdentifier:extensionsByIdentifier:].cold.3();
    objc_msgSend(objc_retainAutorelease(v35), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA7E308);
  }

  v17 = v13;
  NSClassFromString(CFSTR("NSDictionary"));
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFGalleryConfiguration initWithSuggestedLayout:dynamicDescriptorsByExtensionIdentifier:staticDescriptorsByExtensionIdentifier:extensionsByIdentifier:].cold.4();
    objc_msgSend(objc_retainAutorelease(v36), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA7E36CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSDictionaryClass]"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFGalleryConfiguration initWithSuggestedLayout:dynamicDescriptorsByExtensionIdentifier:staticDescriptorsByExtensionIdentifier:extensionsByIdentifier:].cold.4();
    goto LABEL_35;
  }

  v37.receiver = self;
  v37.super_class = (Class)PBFGalleryConfiguration;
  v18 = -[PBFGalleryConfiguration init](&v37, sel_init);
  if (v18)
  {
    v19 = objc_msgSend(v14, "copy");
    suggestedLayout = v18->_suggestedLayout;
    v18->_suggestedLayout = (PRSPosterGalleryLayout *)v19;

    v21 = objc_msgSend(v15, "copy");
    dynamicDescriptorsByExtensionIdentifier = v18->_dynamicDescriptorsByExtensionIdentifier;
    v18->_dynamicDescriptorsByExtensionIdentifier = (NSDictionary *)v21;

    v23 = objc_msgSend(v16, "copy");
    staticDescriptorsByExtensionIdentifier = v18->_staticDescriptorsByExtensionIdentifier;
    v18->_staticDescriptorsByExtensionIdentifier = (NSDictionary *)v23;

    v25 = objc_msgSend(v17, "copy");
    extensionsByIdentifier = v18->_extensionsByIdentifier;
    v18->_extensionsByIdentifier = (NSDictionary *)v25;

    v27 = objc_opt_new();
    posterDescriptorLookupInfoForItemIdentifier = v18->_posterDescriptorLookupInfoForItemIdentifier;
    v18->_posterDescriptorLookupInfoForItemIdentifier = (NSMutableDictionary *)v27;

  }
  return v18;
}

- (void)dealloc
{
  NSOrderedSet *sectionIdentifiers;
  NSDictionary *sectionIdentifierToSectionMap;
  NSDictionary *sectionIdentifierToItems;
  NSMutableDictionary *posterDescriptorLookupInfoForItemIdentifier;
  NSDictionary *previewIdentifierToPreview;
  NSOrderedSet *previews;
  PRSPosterGalleryLayout *suggestedLayout;
  NSDictionary *dynamicDescriptorsByExtensionIdentifier;
  NSDictionary *staticDescriptorsByExtensionIdentifier;
  NSDictionary *extensionsByIdentifier;
  objc_super v13;

  sectionIdentifiers = self->_sectionIdentifiers;
  self->_sectionIdentifiers = 0;

  sectionIdentifierToSectionMap = self->_sectionIdentifierToSectionMap;
  self->_sectionIdentifierToSectionMap = 0;

  sectionIdentifierToItems = self->_sectionIdentifierToItems;
  self->_sectionIdentifierToItems = 0;

  -[NSMutableDictionary removeAllObjects](self->_posterDescriptorLookupInfoForItemIdentifier, "removeAllObjects");
  posterDescriptorLookupInfoForItemIdentifier = self->_posterDescriptorLookupInfoForItemIdentifier;
  self->_posterDescriptorLookupInfoForItemIdentifier = 0;

  previewIdentifierToPreview = self->_previewIdentifierToPreview;
  self->_previewIdentifierToPreview = 0;

  previews = self->_previews;
  self->_previews = 0;

  suggestedLayout = self->_suggestedLayout;
  self->_suggestedLayout = 0;

  dynamicDescriptorsByExtensionIdentifier = self->_dynamicDescriptorsByExtensionIdentifier;
  self->_dynamicDescriptorsByExtensionIdentifier = 0;

  staticDescriptorsByExtensionIdentifier = self->_staticDescriptorsByExtensionIdentifier;
  self->_staticDescriptorsByExtensionIdentifier = 0;

  extensionsByIdentifier = self->_extensionsByIdentifier;
  self->_extensionsByIdentifier = 0;

  v13.receiver = self;
  v13.super_class = (Class)PBFGalleryConfiguration;
  -[PBFGalleryConfiguration dealloc](&v13, sel_dealloc);
}

- (NSSet)posterPreviews
{
  -[PBFGalleryConfiguration _hydrateSectionIdentifiersIfNeeded](self, "_hydrateSectionIdentifiersIfNeeded");
  return -[NSOrderedSet set](self->_previews, "set");
}

- (NSOrderedSet)sectionIdentifiers
{
  -[PBFGalleryConfiguration _hydrateSectionIdentifiersIfNeeded](self, "_hydrateSectionIdentifiersIfNeeded");
  return self->_sectionIdentifiers;
}

- (id)itemsForSectionWithIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[PBFGalleryConfiguration _hydrateSectionIdentifiersIfNeeded](self, "_hydrateSectionIdentifiersIfNeeded");
  -[NSDictionary objectForKey:](self->_sectionIdentifierToItems, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)posterPreviewForUniqueIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[PBFGalleryConfiguration _hydrateSectionIdentifiersIfNeeded](self, "_hydrateSectionIdentifiersIfNeeded");
  -[NSDictionary objectForKey:](self->_previewIdentifierToPreview, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)sectionForSectionIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[PBFGalleryConfiguration _hydrateSectionIdentifiersIfNeeded](self, "_hydrateSectionIdentifiersIfNeeded");
  -[NSDictionary objectForKeyedSubscript:](self->_sectionIdentifierToSectionMap, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)posterSnapshotRequestsForPreview:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[PBFPosterSnapshotDefinition defaultPreviewDefinitionForPreview:](PBFPosterSnapshotDefinition, "defaultPreviewDefinitionForPreview:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PBFPosterSnapshotRequest snapshotRequestForPreview:context:definition:](PBFPosterSnapshotRequest, "snapshotRequestForPreview:context:definition:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "galleryDisplayStyle") == 1)
  {
    +[PBFPosterSnapshotDefinition gallerySnapshotKeyFrameDefinition](PBFPosterSnapshotDefinition, "gallerySnapshotKeyFrameDefinition");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PBFPosterSnapshotRequest snapshotRequestForPreview:context:definition:](PBFPosterSnapshotRequest, "snapshotRequestForPreview:context:definition:", v5, v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = v8;
    v13[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)posterSnapshotRequestsForContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void *v13;
  PBFGalleryConfiguration *v14;
  id v15;

  v4 = a3;
  -[PBFGalleryConfiguration _hydrateSectionIdentifiersIfNeeded](self, "_hydrateSectionIdentifiersIfNeeded");
  -[NSOrderedSet array](self->_previews, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __60__PBFGalleryConfiguration_posterSnapshotRequestsForContext___block_invoke;
  v13 = &unk_1E86F5628;
  v14 = self;
  v15 = v4;
  v6 = v4;
  objc_msgSend(v5, "bs_map:", &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_flatten", v10, v11, v12, v13, v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __60__PBFGalleryConfiguration_posterSnapshotRequestsForContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "posterSnapshotRequestsForPreview:context:", a2, *(_QWORD *)(a1 + 40));
}

- (id)complicationSnapshotRequests
{
  void *v3;
  void *v4;
  void *v5;

  -[PBFGalleryConfiguration _hydrateSectionIdentifiersIfNeeded](self, "_hydrateSectionIdentifiersIfNeeded");
  -[NSOrderedSet array](self->_previews, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_compactMap:", &__block_literal_global_17);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "bs_flatten");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __55__PBFGalleryConfiguration_complicationSnapshotRequests__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[PBFComplicationSnapshotRequest requestsForPreview:](PBFComplicationSnapshotRequest, "requestsForPreview:", a2);
}

- (id)snapshotURLsForPathIdentityForContext:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v4 = (void *)MEMORY[0x1E0CB3748];
  v5 = a3;
  objc_msgSend(v4, "strongToStrongObjectsMapTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFGalleryConfiguration posterSnapshotRequestsForContext:](self, "posterSnapshotRequestsForContext:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__PBFGalleryConfiguration_snapshotURLsForPathIdentityForContext___block_invoke;
  v10[3] = &unk_1E86F5670;
  v8 = v6;
  v11 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);

  return v8;
}

void __65__PBFGalleryConfiguration_snapshotURLsForPathIdentityForContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v3, "definitions", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "snapshotURLForDefinition:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(void **)(a1 + 32);
        objc_msgSend(v3, "path");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "serverIdentity");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKey:", v9, v12);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (id)snapshotURLsForContext:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C99E60];
  -[PBFGalleryConfiguration snapshotURLsForPathIdentityForContext:](self, "snapshotURLsForPathIdentityForContext:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)posterSnapshotRequestsForExtensionBundleIdentifier:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PBFGalleryConfiguration posterPreviews](self, "posterPreviews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __86__PBFGalleryConfiguration_posterSnapshotRequestsForExtensionBundleIdentifier_context___block_invoke;
  v23[3] = &unk_1E86F5698;
  v9 = v6;
  v24 = v9;
  objc_msgSend(v8, "bs_filter:", v23);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_opt_new();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        -[PBFGalleryConfiguration posterSnapshotRequestsForPreview:context:](self, "posterSnapshotRequestsForPreview:context:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v16), v7, (_QWORD)v19);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObjectsFromArray:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v14);
  }

  return v11;
}

uint64_t __86__PBFGalleryConfiguration_posterSnapshotRequestsForExtensionBundleIdentifier_context___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "posterDescriptorLookupInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "posterDescriptorExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "posterExtensionBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32));

  return v6;
}

- (id)gallerySnapshotRequestsForDisplayContexts:(id)a3
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__PBFGalleryConfiguration_gallerySnapshotRequestsForDisplayContexts___block_invoke;
  v6[3] = &unk_1E86F56C0;
  v6[4] = self;
  objc_msgSend(a3, "bs_compactMap:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_flatten");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __69__PBFGalleryConfiguration_gallerySnapshotRequestsForDisplayContexts___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "posterSnapshotRequestsForContext:", a2);
}

- (id)prewarmGallerySnapshotRequestsForDisplayContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v22;
  id obj;
  uint64_t v24;
  PBFGalleryConfiguration *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PBFGalleryConfiguration _hydrateSectionIdentifiersIfNeeded](self, "_hydrateSectionIdentifiersIfNeeded");
  -[PBFGalleryConfiguration sectionIdentifiers](self, "sectionIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v22 = v5;
    -[PBFGalleryConfiguration sectionIdentifiers](self, "sectionIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(v7, "removeObjectAtIndex:", 0);
    v8 = PFCurrentDeviceClass();
    if (v8 == 1)
      v9 = 4;
    else
      v9 = 3;
    v10 = 6;
    if (v8 == 1)
      v10 = 16;
    v27 = v10;
    v28 = v9;
    v11 = (void *)objc_opt_new();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    obj = v7;
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v26)
    {
      v24 = *(_QWORD *)v31;
      v25 = self;
LABEL_9:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v31 != v24)
          objc_enumerationMutation(obj);
        v29 = v12;
        -[PBFGalleryConfiguration itemsForSectionWithIdentifier:](self, "itemsForSectionWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v12));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "count");
        v15 = v28 >= v14 ? v14 : v28;
        if (v15)
        {
          for (i = 0; i != v15; ++i)
          {
            objc_msgSend(v13, "objectAtIndexedSubscript:", i);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            +[PBFPosterSnapshotDefinition defaultPreviewDefinitionForPreview:](PBFPosterSnapshotDefinition, "defaultPreviewDefinitionForPreview:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            +[PBFPosterSnapshotRequest snapshotRequestForPreview:context:definition:](PBFPosterSnapshotRequest, "snapshotRequestForPreview:context:definition:", v17, v4, v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v11, "bs_safeAddObject:", v19);
          }
        }
        v20 = objc_msgSend(v11, "count");

        self = v25;
        if (v20 >= v27)
          break;
        v12 = v29 + 1;
        if (v29 + 1 == v26)
        {
          v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
          if (v26)
            goto LABEL_9;
          break;
        }
      }
    }

    v5 = v22;
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v11;
}

- (void)prewarmGallerySnapshotsWithCompletion:(id)a3
{
  id v4;
  dispatch_group_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD aBlock[4];
  id v24;
  NSObject *v25;

  v4 = a3;
  v5 = dispatch_group_create();
  v6 = (void *)objc_opt_new();
  -[PBFGalleryConfiguration complicationSnapshotProvider](self, "complicationSnapshotProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1D17A3580]();
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__PBFGalleryConfiguration_prewarmGallerySnapshotsWithCompletion___block_invoke;
  aBlock[3] = &unk_1E86F3AE8;
  v10 = v6;
  v24 = v10;
  v11 = v5;
  v25 = v11;
  v12 = _Block_copy(aBlock);
  if (v7)
  {
    v13 = (void *)MEMORY[0x1E0C99E40];
    -[PBFGalleryConfiguration complicationSnapshotRequests](self, "complicationSnapshotRequests");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "orderedSetWithArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v16, "count"))
    {
      dispatch_group_enter(v11);
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "trimCachedSnapshotsToRequests:", v17);

      objc_msgSend(v7, "fetchComplicationSnapshotsForRequests:complicationSnapshotReceivedHandler:errorHandler:completionHandler:", v16, 0, 0, v12);
    }

  }
  objc_autoreleasePoolPop(v8);
  v20[0] = v9;
  v20[1] = 3221225472;
  v20[2] = __65__PBFGalleryConfiguration_prewarmGallerySnapshotsWithCompletion___block_invoke_2;
  v20[3] = &unk_1E86F4458;
  v21 = v10;
  v22 = v4;
  v18 = v4;
  v19 = v10;
  dispatch_group_notify(v11, MEMORY[0x1E0C80D38], v20);

}

void __65__PBFGalleryConfiguration_prewarmGallerySnapshotsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = *(id *)(a1 + 32);
    objc_sync_enter(v3);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
    objc_sync_exit(v3);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __65__PBFGalleryConfiguration_prewarmGallerySnapshotsWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v2 = (void *)MEMORY[0x1E0CB35C8];
    v3 = *(_QWORD *)(a1 + 32);
    v7 = *MEMORY[0x1E0CB2F70];
    v8[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterBoard.galleryConfiguration.snapshotPrewarm"), -1, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v5);

}

- (void)enumeratePreviews:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  _QWORD *v8;
  _QWORD v9[3];
  char v10;

  v4 = a3;
  if (v4)
  {
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x2020000000;
    v10 = 0;
    -[PBFGalleryConfiguration sectionIdentifiers](self, "sectionIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __45__PBFGalleryConfiguration_enumeratePreviews___block_invoke;
    v6[3] = &unk_1E86F5710;
    v6[4] = self;
    v7 = v4;
    v8 = v9;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);

    _Block_object_dispose(v9, 8);
  }

}

void __45__PBFGalleryConfiguration_enumeratePreviews___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint64_t v13;

  objc_msgSend(*(id *)(a1 + 32), "itemsForSectionWithIdentifier:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45__PBFGalleryConfiguration_enumeratePreviews___block_invoke_2;
  v10[3] = &unk_1E86F56E8;
  v13 = a3;
  v8 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  v11 = v8;
  v12 = v9;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);

  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
}

void __45__PBFGalleryConfiguration_enumeratePreviews___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  uint64_t v8;
  id v9;
  id v10;

  v7 = (void *)MEMORY[0x1E0CB36B0];
  v8 = a1[6];
  v9 = a2;
  objc_msgSend(v7, "indexPathForItem:inSection:", a3, v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(a1[4] + 16))();

  *a4 = *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24);
}

- (void)fetchComplicationsForPreview:(id)a3 completion:(id)a4
{
  (*((void (**)(id, _QWORD, _QWORD))a4 + 2))(a4, 0, 0);
}

- (void)_hydrateSectionIdentifiersIfNeeded
{
  PBFGalleryConfiguration *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t i;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  uint64_t v20;
  NSOrderedSet *previews;
  uint64_t v22;
  NSOrderedSet *sectionIdentifiers;
  uint64_t v24;
  NSDictionary *sectionIdentifierToSectionMap;
  uint64_t v26;
  NSDictionary *sectionIdentifierToItems;
  uint64_t v28;
  NSDictionary *previewIdentifierToPreview;
  void *v30;
  void *v31;
  void *v32;
  PBFGalleryConfiguration *v33;
  id obj;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[6];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_sectionIdentifiers)
  {
    v33 = v2;
    v37 = (void *)objc_opt_new();
    v30 = (void *)objc_opt_new();
    v31 = (void *)objc_opt_new();
    v3 = (void *)objc_opt_new();
    v32 = (void *)objc_opt_new();
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    -[PBFGalleryConfiguration suggestedLayout](v2, "suggestedLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sections");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v36)
    {
      v35 = *(_QWORD *)v45;
      obj = v5;
      do
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v45 != v35)
            objc_enumerationMutation(obj);
          v7 = (void *)MEMORY[0x1E0CB3940];
          v8 = *(id *)(*((_QWORD *)&v44 + 1) + 8 * i);
          objc_msgSend(v8, "localizedTitle");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v8, "type");
          objc_msgSend(v8, "unityDescription");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v7, "stringWithFormat:", CFSTR("'%@'-%lu-'%@'"), v9, v10, v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v37, "containsObject:", v12) & 1) == 0)
          {
            objc_msgSend(v8, "items");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v43[0] = MEMORY[0x1E0C809B0];
            v43[1] = 3221225472;
            v43[2] = __61__PBFGalleryConfiguration__hydrateSectionIdentifiersIfNeeded__block_invoke;
            v43[3] = &unk_1E86F5738;
            v43[4] = v33;
            v43[5] = v8;
            objc_msgSend(v13, "bs_mapNoNulls:", v43);
            v38 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v38, "count"))
            {
              v41 = 0u;
              v42 = 0u;
              v39 = 0u;
              v40 = 0u;
              v14 = v38;
              v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
              if (v15)
              {
                v16 = *(_QWORD *)v40;
                do
                {
                  for (j = 0; j != v15; ++j)
                  {
                    if (*(_QWORD *)v40 != v16)
                      objc_enumerationMutation(v14);
                    v18 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
                    objc_msgSend(v18, "previewUniqueIdentifier");
                    v19 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v3, "setObject:forKey:", v18, v19);

                  }
                  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
                }
                while (v15);
              }

              objc_msgSend(v32, "addObjectsFromArray:", v14);
              objc_msgSend(v37, "addObject:", v12);
              objc_msgSend(v31, "setObject:forKeyedSubscript:", v8, v12);
              objc_msgSend(v30, "setObject:forKeyedSubscript:", v14, v12);
            }

          }
        }
        v5 = obj;
        v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      }
      while (v36);
    }

    v20 = objc_msgSend(v32, "copy");
    previews = v33->_previews;
    v33->_previews = (NSOrderedSet *)v20;

    v22 = objc_msgSend(v37, "copy");
    sectionIdentifiers = v33->_sectionIdentifiers;
    v33->_sectionIdentifiers = (NSOrderedSet *)v22;

    v24 = objc_msgSend(v31, "copy");
    sectionIdentifierToSectionMap = v33->_sectionIdentifierToSectionMap;
    v33->_sectionIdentifierToSectionMap = (NSDictionary *)v24;

    v26 = objc_msgSend(v30, "copy");
    sectionIdentifierToItems = v33->_sectionIdentifierToItems;
    v33->_sectionIdentifierToItems = (NSDictionary *)v26;

    v28 = objc_msgSend(v3, "copy");
    previewIdentifierToPreview = v33->_previewIdentifierToPreview;
    v33->_previewIdentifierToPreview = (NSDictionary *)v28;

    v2 = v33;
  }
  objc_sync_exit(v2);

}

uint64_t __61__PBFGalleryConfiguration__hydrateSectionIdentifiersIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "previewForItem:section:", a2, *(_QWORD *)(a1 + 40));
}

- (id)_posterDescriptorLookupInfoForItem:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *posterDescriptorLookupInfoForItemIdentifier;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  uint64_t v19;
  void *j;
  void *v21;
  NSMutableDictionary *v22;
  void *v23;
  NSMutableDictionary *v24;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_posterDescriptorLookupInfoForItemIdentifier;
  objc_sync_enter(v5);
  posterDescriptorLookupInfoForItemIdentifier = self->_posterDescriptorLookupInfoForItemIdentifier;
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](posterDescriptorLookupInfoForItemIdentifier, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = v8;
  }
  else
  {
    objc_msgSend(v4, "extensionBundleIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](self->_extensionsByIdentifier, "objectForKey:");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      objc_msgSend(v4, "descriptorIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringByDeletingPathExtension");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        objc_msgSend(v26, "pathExtension");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", CFSTR("STATIC"));

        if (v12)
        {
          v35 = 0uLL;
          v36 = 0uLL;
          v33 = 0uLL;
          v34 = 0uLL;
          -[NSDictionary objectForKey:](self->_staticDescriptorsByExtensionIdentifier, "objectForKey:", v28);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
          if (v14)
          {
            v15 = *(_QWORD *)v34;
            while (2)
            {
              for (i = 0; i != v14; i = (char *)i + 1)
              {
                if (*(_QWORD *)v34 != v15)
                  objc_enumerationMutation(v13);
                v17 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
                objc_msgSend(v17, "descriptorIdentifier");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                if (v18 && objc_msgSend(v10, "isEqualToString:", v18))
                {
                  +[PBFGenericPosterDescriptorLookupInfo posterDescriptorLookupInfoForPath:extension:](PBFGenericPosterDescriptorLookupInfo, "posterDescriptorLookupInfoForPath:extension:", v17, v27);
                  v14 = (void *)objc_claimAutoreleasedReturnValue();
                  v22 = self->_posterDescriptorLookupInfoForItemIdentifier;
                  objc_msgSend(v4, "identifier");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSMutableDictionary setObject:forKey:](v22, "setObject:forKey:", v14, v23);
                  goto LABEL_30;
                }

              }
              v14 = (void *)objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
              if (v14)
                continue;
              break;
            }
          }
        }
        else
        {
          v31 = 0uLL;
          v32 = 0uLL;
          v29 = 0uLL;
          v30 = 0uLL;
          -[NSDictionary objectForKey:](self->_dynamicDescriptorsByExtensionIdentifier, "objectForKey:", v28);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          if (v14)
          {
            v19 = *(_QWORD *)v30;
            while (2)
            {
              for (j = 0; j != v14; j = (char *)j + 1)
              {
                if (*(_QWORD *)v30 != v19)
                  objc_enumerationMutation(v13);
                v21 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)j);
                objc_msgSend(v21, "descriptorIdentifier");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                if (v18 && objc_msgSend(v10, "isEqualToString:", v18))
                {
                  +[PBFGenericPosterDescriptorLookupInfo posterDescriptorLookupInfoForPath:extension:](PBFGenericPosterDescriptorLookupInfo, "posterDescriptorLookupInfoForPath:extension:", v21, v27);
                  v14 = (void *)objc_claimAutoreleasedReturnValue();
                  v24 = self->_posterDescriptorLookupInfoForItemIdentifier;
                  objc_msgSend(v4, "identifier");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSMutableDictionary setObject:forKey:](v24, "setObject:forKey:", v14, v23);
LABEL_30:

                  goto LABEL_31;
                }

              }
              v14 = (void *)objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
              if (v14)
                continue;
              break;
            }
          }
        }
LABEL_31:

        v9 = v14;
      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }

  }
  objc_sync_exit(v5);

  return v9;
}

- (id)_posterDescriptorLookupInfoForPreviewItem:(id)a3
{
  NSMutableDictionary *posterDescriptorLookupInfoForItemIdentifier;
  void *v4;
  void *v5;

  posterDescriptorLookupInfoForItemIdentifier = self->_posterDescriptorLookupInfoForItemIdentifier;
  objc_msgSend(a3, "previewUniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](posterDescriptorLookupInfoForItemIdentifier, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)previewForItem:(id)a3 section:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  __CFString **v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  char v49;
  void *v50;
  __CFString *v51;
  __CFString **v52;
  __CFString *v53;
  PBFGalleryOptions *v54;
  void *v55;
  void *v56;
  BOOL v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void (*v61)(uint64_t);
  void *v62;
  void *v63;
  uint64_t v65;
  id v66;
  char v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  __CFString *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  void *v88;
  _QWORD v89[4];
  id v90;
  _QWORD v91[5];
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  void *v95;
  _QWORD v96[3];

  v96[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v87 = a4;
  -[PBFGalleryConfiguration _posterDescriptorLookupInfoForItem:](self, "_posterDescriptorLookupInfoForItem:", v6);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  if (v88)
  {
    if (v87 && objc_msgSend(v87, "type") == 2)
    {
      objc_msgSend(v87, "unityDescription");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v82 = 0;
    }
    objc_msgSend(v6, "modeUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7
      && (v8 = objc_alloc(MEMORY[0x1E0CB3A28]),
          objc_msgSend(v6, "modeUUID"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = (void *)objc_msgSend(v8, "initWithUUIDString:", v9),
          v9,
          v7,
          v10))
    {
      objc_msgSend(MEMORY[0x1E0D22368], "sharedActivityManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "availableActivities");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v89[0] = MEMORY[0x1E0C809B0];
      v89[1] = 3221225472;
      v89[2] = __50__PBFGalleryConfiguration_previewForItem_section___block_invoke;
      v89[3] = &unk_1E86F2420;
      v76 = v10;
      v90 = v76;
      objc_msgSend(v12, "bs_firstObjectPassingTest:", v89);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "activityIdentifier");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "activitySymbolImageName");
      v83 = (void *)objc_claimAutoreleasedReturnValue();

      v67 = 1;
    }
    else
    {
      v67 = 0;
      v76 = 0;
      v83 = 0;
      v85 = 0;
    }
    objc_msgSend(v6, "subtitleComplication");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    complicationLookupInfoForPBFComplication(v14);
    v81 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "complications");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bs_mapNoNulls:", &__block_literal_global_47);
    v80 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "landscapeComplications");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bs_mapNoNulls:", &__block_literal_global_48);
    v79 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_msgSend(v6, "layoutType");
    if ((unint64_t)(v17 - 1) > 2)
      v18 = &PBFComplicationLayoutTypeEmpty;
    else
      v18 = off_1E86F57D0[v17 - 1];
    v78 = *v18;
    objc_msgSend(v6, "extensionBundleIdentifier");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5848]), "initWithBundleIdentifier:error:", v84, 0);
    objc_msgSend(v74, "URL");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v86)
    {
      v19 = 0;
LABEL_56:

      goto LABEL_57;
    }
    objc_msgSend(v6, "displayNameLocalizationKey");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    if (v75)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "pf_uniqueBundleWithURL:", v86);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", v75, 0, 0);
      v69 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v6, "localizedDisplayName");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v21 = objc_alloc(MEMORY[0x1E0D7FAF0]);
    objc_msgSend(v88, "posterDescriptorPath");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v21, "_initWithPath:", v22);

    objc_msgSend(v23, "displayNameLocalizationKey");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "preferredTitleColors");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
    {
      v72 = v24;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D7FB88], "defaultTitleColor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v96[0] = v26;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v96, 1);
      v72 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v6, "titleFontName");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    if (v77
      && (PRTimeFontIdentifiers(),
          v27 = (void *)objc_claimAutoreleasedReturnValue(),
          v28 = objc_msgSend(v27, "containsObject:", v77),
          v27,
          v28)
      && (v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FBB0]), "initWithTimeFontIdentifier:", v77)) != 0)
    {
      v66 = v29;
      v73 = v66;
      objc_msgSend(MEMORY[0x1E0D7FB80], "configurationWithTimeFontConfiguration:extensionBundleURL:systemItem:", v66, v86, 1);
    }
    else
    {
      objc_msgSend(v23, "preferredTimeFontConfigurationsWithExtensionBundleURL:", v86);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "firstObject");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31;
      if (v31)
        v73 = v31;
      else
        v73 = objc_alloc_init(MEMORY[0x1E0D7FBB0]);

      v66 = 0;
      objc_msgSend(MEMORY[0x1E0D7FB80], "configurationWithTimeFontConfiguration:extensionBundleURL:systemItem:", v73, v86, 1);
    }
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D7FB98], "sharedPreferences");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "isAlternateCalendarEnabled");

    v35 = objc_alloc(MEMORY[0x1E0D7FB88]);
    objc_msgSend(v72, "firstObject");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "luminance");
    LOBYTE(v65) = v34;
    v68 = (void *)objc_msgSend(v35, "initWithTimeFontConfiguration:preferredTitleAlignment:preferredTitleLayout:titleColor:timeNumberingSystem:userConfigured:contentsLuminance:alternateDateEnabled:groupName:", v71, 0, 0, v36, 0, 0, v65, 0);

    objc_msgSend(v23, "preferredHomeScreenConfiguration");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v37;
    if (v37)
    {
      v39 = objc_msgSend(v37, "allowsModifyingLegibilityBlur");
      v40 = objc_msgSend(v38, "preferredStyle");
      if (v40 == 2)
        v41 = 1;
      else
        v41 = 2 * (v40 == 3);
      v42 = objc_alloc(MEMORY[0x1E0D7FB20]);
      v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FB30]), "initWithLegibilityBlurEnabled:allowsModifyingLegibilityBlur:", v40 == 1, v39);
      v44 = objc_alloc_init(MEMORY[0x1E0D7FB70]);
      v45 = objc_alloc_init(MEMORY[0x1E0D7FB10]);
      v46 = objc_alloc_init(MEMORY[0x1E0D7FB18]);
      v47 = objc_alloc_init(MEMORY[0x1E0D7FB28]);
      v48 = (void *)objc_msgSend(v42, "initWithSelectedAppearanceType:lockPosterAppearance:solidColorAppearance:gradientAppearance:homePosterAppearance:customizationConfiguration:", v41, v43, v44, v45, v46, v47);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D7FB20], "defaultHomeScreenConfigurationForProvider:role:", v84, *MEMORY[0x1E0D7FC58]);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v49 = v67 ^ 1;
    if (!v85)
      v49 = 1;
    if ((v49 & 1) != 0)
      v50 = 0;
    else
      v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FB08]), "initWithActivityIdentifier:activityUUID:", v85, v76);
    v51 = PBFPreviewTypeDefault;
    if (v87 && objc_msgSend(v87, "type") == 3)
    {
      v52 = &PBFPreviewTypeHero;
    }
    else
    {
      if (!objc_msgSend(v6, "shouldShowAsShuffleStack"))
        goto LABEL_47;
      v52 = &PBFPreviewTypeSmartAlbum;
    }
    v53 = *v52;

    v51 = v53;
LABEL_47:
    v54 = objc_alloc_init(PBFGalleryOptions);
    objc_msgSend(v6, "proactiveRepresentation");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFGalleryOptions setSuggestedGalleryItem:](v54, "setSuggestedGalleryItem:", v55);

    if (v85
      || (objc_msgSend(v6, "modeSemanticType"),
          v56 = (void *)objc_claimAutoreleasedReturnValue(),
          v57 = v56 == 0,
          v56,
          v57))
    {
      if (v83)
        -[PBFGalleryOptions setModeSymbolImageName:](v54, "setModeSymbolImageName:", v83);
    }
    else
    {
      objc_msgSend(v6, "modeSemanticType");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBFGalleryOptions setModeSemanticTypeToCreate:](v54, "setModeSemanticTypeToCreate:", v58);

      objc_msgSend(v6, "modeSemanticType");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v59, "integerValue");
      v92 = 0;
      v93 = &v92;
      v94 = 0x2020000000;
      v61 = (void (*)(uint64_t))getDNDSystemImageNameForModeSemanticTypeSymbolLoc_ptr;
      v95 = getDNDSystemImageNameForModeSemanticTypeSymbolLoc_ptr;
      if (!getDNDSystemImageNameForModeSemanticTypeSymbolLoc_ptr)
      {
        v91[0] = MEMORY[0x1E0C809B0];
        v91[1] = 3221225472;
        v91[2] = __getDNDSystemImageNameForModeSemanticTypeSymbolLoc_block_invoke;
        v91[3] = &unk_1E86F2990;
        v91[4] = &v92;
        __getDNDSystemImageNameForModeSemanticTypeSymbolLoc_block_invoke((uint64_t)v91);
        v61 = (void (*)(uint64_t))v93[3];
      }
      _Block_object_dispose(&v92, 8);
      if (!v61)
        -[PBFGalleryConfiguration previewForItem:section:].cold.1();
      v61(v60);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBFGalleryOptions setModeSymbolImageName:](v54, "setModeSymbolImageName:", v62);

    }
    objc_msgSend(v6, "identifier");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    +[PBFGenericPosterPreview posterPreviewWithUniqueIdentifier:displayNameLocalizationKey:galleryLocalizedTitle:galleryLocalizedDescription:posterDescriptorLookupInfo:titleStyleConfiguration:focusConfiguration:subtitleComplication:suggestedComplications:suggestedLandscapeComplications:complicationLayoutType:renderingConfiguration:homeScreenConfiguration:previewType:galleryOptions:](PBFGenericPosterPreview, "posterPreviewWithUniqueIdentifier:displayNameLocalizationKey:galleryLocalizedTitle:galleryLocalizedDescription:posterDescriptorLookupInfo:titleStyleConfiguration:focusConfiguration:subtitleComplication:suggestedComplications:suggestedLandscapeComplications:complicationLayoutType:renderingConfiguration:homeScreenConfiguration:previewType:galleryOptions:", v63, v70, v69, v82, v88, v68, v50, v81, v80, v79, v78, 0, v48, v51, v54);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_56;
  }
  v19 = 0;
LABEL_57:

  return v19;
}

uint64_t __50__PBFGalleryConfiguration_previewForItem_section___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "activityUniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

id __50__PBFGalleryConfiguration_previewForItem_section___block_invoke_2(uint64_t a1, void *a2)
{
  return complicationLookupInfoForPBFComplication(a2);
}

id __50__PBFGalleryConfiguration_previewForItem_section___block_invoke_3(uint64_t a1, void *a2)
{
  return complicationLookupInfoForPBFComplication(a2);
}

- (PBFPosterSnapshotProviding)snapshotProvider
{
  return self->_snapshotProvider;
}

- (void)setSnapshotProvider:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotProvider, a3);
}

- (PRSPosterGalleryLayout)suggestedLayout
{
  return self->_suggestedLayout;
}

- (NSDictionary)dynamicDescriptorsByExtensionIdentifier
{
  return self->_dynamicDescriptorsByExtensionIdentifier;
}

- (NSDictionary)staticDescriptorsByExtensionIdentifier
{
  return self->_staticDescriptorsByExtensionIdentifier;
}

- (NSDictionary)extensionsByIdentifier
{
  return self->_extensionsByIdentifier;
}

- (PBFComplicationSnapshotProviding)complicationSnapshotProvider
{
  return self->_complicationSnapshotProvider;
}

- (void)setComplicationSnapshotProvider:(id)a3
{
  objc_storeStrong((id *)&self->_complicationSnapshotProvider, a3);
}

- (PFPosterExtensionProvider)extensionProvider
{
  return (PFPosterExtensionProvider *)objc_loadWeakRetained((id *)&self->_extensionProvider);
}

- (void)setExtensionProvider:(id)a3
{
  objc_storeWeak((id *)&self->_extensionProvider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_extensionProvider);
  objc_storeStrong((id *)&self->_complicationSnapshotProvider, 0);
  objc_storeStrong((id *)&self->_extensionsByIdentifier, 0);
  objc_storeStrong((id *)&self->_staticDescriptorsByExtensionIdentifier, 0);
  objc_storeStrong((id *)&self->_dynamicDescriptorsByExtensionIdentifier, 0);
  objc_storeStrong((id *)&self->_suggestedLayout, 0);
  objc_storeStrong((id *)&self->_snapshotProvider, 0);
  objc_storeStrong((id *)&self->_previews, 0);
  objc_storeStrong((id *)&self->_previewIdentifierToPreview, 0);
  objc_storeStrong((id *)&self->_posterDescriptorLookupInfoForItemIdentifier, 0);
  objc_storeStrong((id *)&self->_sectionIdentifierToItems, 0);
  objc_storeStrong((id *)&self->_sectionIdentifierToSectionMap, 0);
  objc_storeStrong((id *)&self->_sectionIdentifiers, 0);
}

- (void)initWithSuggestedLayout:dynamicDescriptorsByExtensionIdentifier:staticDescriptorsByExtensionIdentifier:extensionsByIdentifier:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithSuggestedLayout:dynamicDescriptorsByExtensionIdentifier:staticDescriptorsByExtensionIdentifier:extensionsByIdentifier:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithSuggestedLayout:dynamicDescriptorsByExtensionIdentifier:staticDescriptorsByExtensionIdentifier:extensionsByIdentifier:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithSuggestedLayout:dynamicDescriptorsByExtensionIdentifier:staticDescriptorsByExtensionIdentifier:extensionsByIdentifier:.cold.4()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)previewForItem:section:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *soft_DNDSystemImageNameForModeSemanticType(DNDModeSemanticType)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("PBFGalleryConfiguration.m"), 50, CFSTR("%s"), dlerror());

  __break(1u);
}

@end
